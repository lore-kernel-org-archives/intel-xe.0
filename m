Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72048C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Apr 2024 19:49:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06010F7A3;
	Mon, 22 Apr 2024 19:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIUqde2N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069A610F7A3
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Apr 2024 19:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713815344; x=1745351344;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LRHEIB1J7Kb7l5hZyn4ltQYxP/0YZuToAS3+yQtjwlw=;
 b=RIUqde2Na5VQqCzxDCA3ALvkOFdTkaqdNLMAAA5PXUaasQ461bRSl4QD
 UqfR2HX+lT9uVxT30ldpRR3ThGbQXWyYYzU5wq7LePjMqADyGkRPUTQrx
 c+CugfVGnDx6UMXGgNLh8TCLRzZMepRWbeVObofJBnMFaMtP1e3fnfjnq
 PGIn0Y1+THcWwTggz2DkQrKK5/N1WRPP4onGNC1AJvKXueFSSosCT+VTF
 o0LWlSIQX0O/Y1+NcVaL+49UK5ZpXPu9U5v7PfW0u0fTHDHS1qIUDoIj1
 HOKK9zoHk8YkGjNQAZJUOVtcz52qwl+sfw55L3mjm4BKi+bgNMJ+Fjobc g==;
X-CSE-ConnectionGUID: 7ThWovqcSvOBYzffKkFD5Q==
X-CSE-MsgGUID: Ld3kBV2bTsCEcJjwghebpw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9540323"
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; 
   d="scan'208";a="9540323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 12:49:03 -0700
X-CSE-ConnectionGUID: ihQJemf8RFmhfZ76e7cKtQ==
X-CSE-MsgGUID: uq/2dGsVQLWakELeIKm8tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,221,1708416000"; d="scan'208";a="24151845"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 12:49:03 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 12:49:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 12:49:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 12:49:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3TO0Va+VUiBlH7vXcdg3ozeOV6Kqy0XSBG1opky3Lf6+XgFn2YyWop3CzsIZm+F84wnNlN+Sh5kYdMqkMUmgZktnlUzCIKkmcrFo1RQvXmiPLTVhxipbNYjnCuK6hnB9ELJo6zfYg3dPvzsmM/mDlJJz9VxWChMzFluuBRFRGptf+VIp1cwUFxqGOmoqm79KnGOWKmPqsqPx2uIb9XVIqxb7pqpUYjTcHwKeljjWEq+X5nQpYezjcoZsGHAGbrlOJmFVGHtPh6YDvlcBqM18jeM0rLmyYzMUMycy5s8IkKv326ptYowTDF4Gr13DKKIW8w2txsEcrP9iq4JZuze6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AcY1hNaVf1c5qJLrRzWxChTlu6unYMXARJslge8+HKQ=;
 b=GpdH8KpPZMsURgklI64bhJsX4SxhA+0GmL7m8HJnAWnIXEMowX49L55WBxLtnNmoRO1CQ/7a/exEuhceU5Uv767EOJ5ki1ddHfSBHfJ8Tl7I+fp9xprj5rtNPJAg94T2izjC0mYQXkiJZMrjA0Ct+PkyuewvYsYJ+J8FpztlHxEtiwRK/i71dXKsY5dq/t3dy77OAYacD7tUx+Jj5SNpbkdqoTYb0kFQalWoa4U0neHwonsfhjZ2MRiqU8Z8u1jJ1erESQwwy1M+Q0XvAaEXaL394uDxTGxAzU5mvdr7vIBkSBDyEcbeFg+epPHH5WHZSaCoB7bDgxw2SRkxlC9OKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Mon, 22 Apr
 2024 19:49:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7519.018; Mon, 22 Apr 2024
 19:48:59 +0000
Date: Mon, 22 Apr 2024 15:48:56 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/lnl: Apply Wa_22019338487
Message-ID: <Zia_KMGV8RSqUL_Y@intel.com>
References: <20240419201344.2467569-1-vinay.belgaumkar@intel.com>
 <20240419201344.2467569-2-vinay.belgaumkar@intel.com>
 <k3jikyitmhmgwboorl4f76iio744risyg2qradk4p44lhsaqdt@whn77wuihwtt>
 <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e6b3fb73-db62-49d7-8e91-cfb5fe094587@intel.com>
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: e42d4995-443d-48d4-e7b6-08dc630540f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?B9k4orqhQfFEeFq6l3y7Nt8uGw21jwI0PzLvwxHLo/W/7oJhE5KM8H25kr?=
 =?iso-8859-1?Q?dSPvoahgN+CMv9DYgfNtTeYJfrPtf3bxYaNl3S+AdIElRfFC2tlFCjzBoj?=
 =?iso-8859-1?Q?LQ3HsX8o/r/YBfUGvytTAY7TAoZO7XQgqgmPBiPlk06V/s6DrlUbs/x2gX?=
 =?iso-8859-1?Q?aq95Qfo1MXB81AxQMyCMzKdnDln5/4UjlsoeIgoShcJj0FqPHzbApLBzWb?=
 =?iso-8859-1?Q?s6QIIqtOp6uwNpFh05WnpJMellTvaeWKMs6U/KxVtn4xHB/xu2riLvberX?=
 =?iso-8859-1?Q?VdIxZO2I2X2zr86N2hqoBj5MRsmHX0JCORIgXRVbwcwrn2JqlVHIh4NXOS?=
 =?iso-8859-1?Q?3gDe3ugX7RUL+y+LtcUaM6an3BNkuO93uMb5/GSZuTPY6RWOGySF+BNNmI?=
 =?iso-8859-1?Q?6wj+pODJTWi4nWgQX/JkLvMVCKDNbeFNyb+7qz0K6KFV9tzMXdNDUpOlsO?=
 =?iso-8859-1?Q?s3gRMdJMXJVvhnv5XkghkcrALkaYti8WhtCjnM+FNY6YHmXwtHYLy6tBTU?=
 =?iso-8859-1?Q?5zec7jZScBgCBcg2RZfWZeBtDMSeCcewvMRMr7qq6R2rG+r+LgTTuyO+qU?=
 =?iso-8859-1?Q?QHopGK589U3BJEDwcBTguDQFsf2awLrWk8Hrt2WUa2LhOdDkGJT3/JxmCi?=
 =?iso-8859-1?Q?Wr8v/+KH1I5r/NF7oViPOVNItSQjrtBfpQy34R/4OmS5FP2E5l3T+GpQxC?=
 =?iso-8859-1?Q?aGxwlmkr0aAjy2agcmep8cSwe3FESSxHGypDnZVEAK0K3VzrKpqAHwZm6e?=
 =?iso-8859-1?Q?oiayM+2WrX8F2Fy9u8JyRZq3K8VuvhvNfzrk26Yiu2025kTv1tL3SLm1x/?=
 =?iso-8859-1?Q?sPDPqgL4HTEd01z8wcEbd/2on95vD2DHXBGpTwfQhheFSUnHfA2lncenlm?=
 =?iso-8859-1?Q?UlciJWKDr+61pjVvRcVSOvfAuPyGrG8QKES4L307ji6wz7gj9ZiuX5Rq7h?=
 =?iso-8859-1?Q?gwd6btGZv/sSWOSpN7ZGIq0yYZ3Ql8NOFSBCzrEaX8ByRrtAv/pr97LDr0?=
 =?iso-8859-1?Q?jlVQU7N0Cm/S8N8KU2Prj42phQCfZQ4xBHcmwbhPYn7s9tvndtiUtsUeLi?=
 =?iso-8859-1?Q?EBbdAB/7SKZp1yRcXWHsI9tm5o/mKx4FzSyKolNZTEPJJfXnFSi6uuBvI8?=
 =?iso-8859-1?Q?OH426ReTo7Miq2H+DlWxvsHfkrPdY6PMMjEH1IKHrXMKF0xJkwK0aUJgqn?=
 =?iso-8859-1?Q?xiSJMb0KmrlEoRh1BB2geSfhUjBHFh6eL0mNKm6dYD0RX6pvLw5LSGprzy?=
 =?iso-8859-1?Q?SH1k6La43phWYwDzH/OEq5n8HqmYGdv1oDCqZN70+iAsDTSiOW7M14kMhF?=
 =?iso-8859-1?Q?Rp4UIv3Ufyz8fdP8fDErIt776Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ieJWLhRhVT7WjBm4qsz2JZPgy2P2FCCtu1npXr//uB014LOz0GmCvxU+uV?=
 =?iso-8859-1?Q?dYv5VgOf6FKE93EcQyqBdUowJCxrMoc9rJ0ZZA55+MBpX/YBYWFCzwhRmO?=
 =?iso-8859-1?Q?DooDF/q6OICBrvcpUMhe9nKRSSgEU+Eg9xKN1CK8a77ZwHhGIEFIJeIzpE?=
 =?iso-8859-1?Q?qVR3EtkgJwhtYB2xa2kWTp8I5CUhF1W+BebkpO/gb5pn7KSLtyRZOGF+M2?=
 =?iso-8859-1?Q?2i0PqVBpLSPb0cYKplppoWmRlKj1nrFmJc6ApQjgE+SwAK1ALWr+Ci2Y5h?=
 =?iso-8859-1?Q?qxiy/Z4kuxBe4U8673zdLMErEhWNydKh7LN6XpgVbNuoqkzrGRgnKSwHI9?=
 =?iso-8859-1?Q?MJCS5DfroCgfwPfG7ac7TMbjzYuWYBGqniYtc/4KRZ9fLgjxRHhG3tuMGe?=
 =?iso-8859-1?Q?sVSt/GqD0qXe8DPeXQpfuLnSOpJaYkSVfhSgXQvav4F/bbPuLBtl+JKfSk?=
 =?iso-8859-1?Q?EAReMcTy0a3ITv33U4tbhQrMyeHfmWQMr7fxVXZQlp80onKbJWPSfIdwOO?=
 =?iso-8859-1?Q?CEFVpnsW7wLI2BLtt2WoAcPMlJF8fF9MRp5JXoM4mzFz25tiQS36iiGQJa?=
 =?iso-8859-1?Q?p1u5XgkCIjkZjvMbjvXzOlcwphyfJccNN8S+x9bbAIgR3U/8ahcTytsdBx?=
 =?iso-8859-1?Q?4BAEJFeJTctUyzlaXIzGEKoyOjZCFbHeGBbcT4HibvhGKEfQ3OFQPF11Xx?=
 =?iso-8859-1?Q?y8DG0h67wG+0sxFXiwxsZV8Ri+ZUa3dhUKC/xG8BUpkUEGgTlEi7/O1qa+?=
 =?iso-8859-1?Q?ZnbXsq96kNS3780hhcZzr9v6UFLm0K96dP5rF2n28K4aP/3EPpoctoOuKy?=
 =?iso-8859-1?Q?bdzAoXsp4uuSdTooUOZfiUKfO36EU8mEng6n5sjKsV6V+Uc9tHa090Z7nB?=
 =?iso-8859-1?Q?RR40dGU7x2b2ZU1c97lTHIF0X4lBtkhpIHzqouWrK3ClnBxULUXrgqzA2X?=
 =?iso-8859-1?Q?EwZrM9blhK9GPAYUFienZ1Z2f5Rj1SXOEO7tR0FpIFISUXkI4OiXUopypH?=
 =?iso-8859-1?Q?nUkDmEo89bQZA8nFgLMz38QvwKI1M4JP0WosMxbX6dVMv1rnlTvqlDzHln?=
 =?iso-8859-1?Q?Xvfm3fMYQ7yEdy9tDzB0XLx6d3fad1gZb2nJuYB8t418tw1KuS6unioiyO?=
 =?iso-8859-1?Q?zrDIfQxn6Y2Q9Xui/ZieBJbhL6P8yYTqitxI7Rok41viXEuf6AV84ZpO0E?=
 =?iso-8859-1?Q?q2474MSkQ9BZ9V+cVwweca/Ny6GCNJ5qUsI3Q3CLxlHQrG+FAPitS6UEi6?=
 =?iso-8859-1?Q?p6tkErR+nWWbz6Rt94h7keXdMr+0OtViISer1QUtbff3m6dfEtbK6Qxlvt?=
 =?iso-8859-1?Q?6hzLnXFzdGmly0HfnvnHXIXL8+M0gWFJ54rvmz3DxO7lPzTUZvlmnJToGv?=
 =?iso-8859-1?Q?Hfd+hvN+xtTzWgKhRAOwX5yCS5jDJ9mWzxwPu1pQeHkx5+bd0muNjCo9uJ?=
 =?iso-8859-1?Q?EP22halYjqY65gvr2jIc0s9W7jTyLgLvR2iWQz5JZv53vzZg66Lhp2ArOL?=
 =?iso-8859-1?Q?mZXLPKcaNLh7C/2iHs2P1yX/KkZ5KXOZhsPYGuiTIckZbG4+O8WA8wOd+r?=
 =?iso-8859-1?Q?NolYxw5x7aHf86kPiIx+usAtjybyOx4qoFOnDnLveeSlgPMiGIMcCX1IyB?=
 =?iso-8859-1?Q?tP/fwcka1+uc35MpwTENwq7qNGnvd9g2U2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e42d4995-443d-48d4-e7b6-08dc630540f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2024 19:48:59.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VpyQb5QnTL3htFUgefifozfqgIJFJSsS/6P9Mf5Sln03p+/adxWIPK5mqTuq3Wg/WW27XUgIBYwJOm/nO43mfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 22, 2024 at 11:10:43AM -0700, Belgaumkar, Vinay wrote:
> 
> On 4/22/2024 11:09 AM, Lucas De Marchi wrote:
> > On Fri, Apr 19, 2024 at 01:13:43PM GMT, Vinay Belgaumkar wrote:
> > > This WA requires us to limit media GT frequency requests to a certain
> > > cap value during driver load as well as after driver unload. Freq limits
> > > are restored after driver load completes, so perf will not be
> > > affected during normal operations.
> > > 
> > > Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > ---
> > > drivers/gpu/drm/xe/xe_device.c |  6 +++++
> > > drivers/gpu/drm/xe/xe_gsc.c    |  8 +++++++
> > > drivers/gpu/drm/xe/xe_guc_pc.c | 40 ++++++++++++++++++++++++++++++++--
> > > drivers/gpu/drm/xe/xe_guc_pc.h |  3 +++
> > > 4 files changed, 55 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > b/drivers/gpu/drm/xe/xe_device.c
> > > index d85a2ba0a057..e29c152a6c4e 100644
> > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > @@ -30,6 +30,7 @@
> > > #include "xe_gsc_proxy.h"
> > > #include "xe_gt.h"
> > > #include "xe_gt_mcr.h"
> > > +#include "xe_guc_pc.h"
> > > #include "xe_hwmon.h"
> > > #include "xe_irq.h"
> > > #include "xe_memirq.h"
> > > @@ -336,6 +337,7 @@ static void xe_driver_flr(struct xe_device *xe)
> > > {
> > >     const unsigned int flr_timeout = 3 * MICRO; /* specs recommend a
> > > 3s wait */
> > >     struct xe_gt *gt = xe_root_mmio_gt(xe);
> > > +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
> > >     int ret;
> > > 
> > >     if (xe_mmio_read32(gt, GU_CNTL_PROTECTED) & DRIVERINT_FLR_DIS) {
> > > @@ -343,6 +345,10 @@ static void xe_driver_flr(struct xe_device *xe)
> > >         return;
> > >     }
> > > 
> > > +    /* Set requested freq to mert_freq_cap before FLR */
> > > +    if (xe_guc_pc_needs_wa_22019338487(pc))
> > > +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
> > > pc->rpe_freq));
> > > +
> > >     drm_dbg(&xe->drm, "Triggering Driver-FLR\n");
> > > 
> > >     /*
> > > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
> > > index 60202b903687..556e73fca813 100644
> > > --- a/drivers/gpu/drm/xe/xe_gsc.c
> > > +++ b/drivers/gpu/drm/xe/xe_gsc.c
> > > @@ -19,6 +19,7 @@
> > > #include "xe_gt.h"
> > > #include "xe_gt_mcr.h"
> > > #include "xe_gt_printk.h"
> > > +#include "xe_guc_pc.h"
> > > #include "xe_huc.h"
> > > #include "xe_map.h"
> > > #include "xe_mmio.h"
> > > @@ -339,6 +340,7 @@ static void gsc_work(struct work_struct *work)
> > >     struct xe_gsc *gsc = container_of(work, typeof(*gsc), work);
> > >     struct xe_gt *gt = gsc_to_gt(gsc);
> > >     struct xe_device *xe = gt_to_xe(gt);
> > > +    struct xe_guc_pc *pc = &gt->uc.guc.pc;
> > >     u32 actions;
> > >     int ret;
> > > 
> > > @@ -367,6 +369,12 @@ static void gsc_work(struct work_struct *work)
> > >     if (actions & GSC_ACTION_SW_PROXY)
> > >         xe_gsc_proxy_request_handler(gsc);
> > > 
> > > +    /* Revert the min/max freq limits as we're done with GSC/driver
> > > load */
> > > +    if (xe_guc_pc_needs_wa_22019338487(pc)) {
> > > +        xe_guc_pc_set_max_freq(pc, pc->rp0_freq);
> > > +        xe_guc_pc_set_min_freq(pc, pc->rpe_freq);
> > > +    }
> > > +
> > > out:
> > >     xe_force_wake_put(gt_to_fw(gt), XE_FW_GSC);
> > >     xe_pm_runtime_put(xe);
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > index 521ae24f2314..7f82b6c2ad3c 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > > @@ -40,6 +40,8 @@
> > > #define GT_FREQUENCY_MULTIPLIER    50
> > > #define GT_FREQUENCY_SCALER    3
> > > 
> > > +#define LNL_MERT_FREQ_CAP    800
> > > +
> > > /**
> > >  * DOC: GuC Power Conservation (PC)
> > >  *
> > > @@ -237,7 +239,7 @@ static void pc_set_manual_rp_ctrl(struct
> > > xe_guc_pc *pc, bool enable)
> > >     xe_mmio_write32(gt, RP_CONTROL, state);
> > > }
> > > 
> > > -static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> > > +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
> > > {
> > >     struct xe_gt *gt = pc_to_gt(pc);
> > >     u32 rpnswreq;
> > > @@ -673,6 +675,25 @@ static void pc_init_fused_rp_values(struct
> > > xe_guc_pc *pc)
> > >         tgl_init_fused_rp_values(pc);
> > > }
> > > 
> > > +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc)
> > > +{
> > > +    struct xe_gt *gt = pc_to_gt(pc);
> > > +    struct xe_device *xe = gt_to_xe(gt);
> > > +
> > > +    if (MEDIA_VERx100(xe) == 2000 && xe_gt_is_media_type(gt))
> > 
> > that's what xe_wa_oob.rules is for. Why are you adding it as a separate
> > function that won't allow debugfs/.../workarounds to match reality?
> 
> The workarounds are not initialized at this point, this is early in the
> driver load process.

So we likely need to change that. or we will start to create a mess in terms
of handling the w/as.

But another comment on this w/a is that it is incomplete. It is just part
of the w/a here. We need to count the GGTT page table updates and with
a threshold update another mmio reg, or something like that.
also drop the freq at module unload, and other stuff, no?!

> 
> Vinay.
> 
> > 
> > Lucas De Marchi
> > 
> > > +        return true;
> > > +
> > > +    return false;
> > > +}
> > > +
> > > +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc)
> > > +{
> > > +    if (MEDIA_VERx100(pc_to_xe(pc)) == 2000)
> > > +        return LNL_MERT_FREQ_CAP;
> > > +    else
> > > +        return 0;
> > > +}
> > > +
> > > /**
> > >  * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
> > >  * frequency to allow faster GuC load times
> > > @@ -684,7 +705,11 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
> > > 
> > >     xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> > >     pc_init_fused_rp_values(pc);
> > > -    pc_set_cur_freq(pc, pc->rp0_freq);
> > > +
> > > +    if (xe_guc_pc_needs_wa_22019338487(pc))
> > > +        pc_set_cur_freq(pc, min(xe_guc_pc_mert_freq_cap(pc),
> > > pc->rp0_freq));
> > > +    else
> > > +        pc_set_cur_freq(pc, pc->rp0_freq);
> > > }
> > > 
> > > static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
> > > @@ -715,6 +740,17 @@ static int pc_adjust_freq_bounds(struct
> > > xe_guc_pc *pc)
> > >     if (pc_get_min_freq(pc) > pc->rp0_freq)
> > >         ret = pc_set_min_freq(pc, pc->rp0_freq);
> > > 
> > > +    if ((!ret) && xe_guc_pc_needs_wa_22019338487(pc)) {
> > > +        /*
> > > +         * Setting min to RPn disables use of efficient freq
> > > +         * which could otherwise interfere with this WA for media GT.
> > > +         * We will also bind max to MERT_FREQ_CAP until driver loads.
> > > +         */
> > > +        ret = pc_set_min_freq(pc, pc->rpn_freq);
> > > +        if (!ret)
> > > +            ret = pc_set_max_freq(pc, min(pc->rp0_freq,
> > > xe_guc_pc_mert_freq_cap(pc)));
> > > +    }
> > > +
> > > out:
> > >     return ret;
> > > }
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h
> > > b/drivers/gpu/drm/xe/xe_guc_pc.h
> > > index d3680d89490e..25fe693c7ee3 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> > > +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> > > @@ -27,4 +27,7 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct
> > > xe_guc_pc *pc);
> > > u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> > > u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
> > > void xe_guc_pc_init_early(struct xe_guc_pc *pc);
> > > +void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq);
> > > +bool xe_guc_pc_needs_wa_22019338487(struct xe_guc_pc *pc);
> > > +u32 xe_guc_pc_mert_freq_cap(struct xe_guc_pc *pc);
> > > #endif /* _XE_GUC_PC_H_ */
> > > -- 
> > > 2.38.1
> > > 
