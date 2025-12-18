Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25783D6E2DC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 18:46:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1B010E9F4;
	Thu, 18 Dec 2025 18:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nrx7saoJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB45E10E9F4
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 18:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766083581; x=1797619581;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EUp7V84VxuTm+/WgrMfPKMtPDDBFMnMjiu3BQ6X5bqA=;
 b=Nrx7saoJra+dxE/7sLbeo7WC8IJGLtwrucb4JSeru12CMlN3KjpRSi1N
 ekfuvDWxzzFKnEdiLAzuB+0l7OAqxFdt1swPozOqyJxVaIyfyGfSvWc/v
 4rVF9wMUQch8MUj25ls1wAAMHHGmSQfTARUKuIIpm9SrzAh1Qoi1RWseF
 T6LJSEJdZJVdIeaiiOc+PcHkB1mqBjH2jR5dEyC7ENeZMeqpQvLIUk8ek
 638A5b4YH5z2fgZW7rJsKD4wrFqs4x6zZ0VYBT82AS26mcsoTrprVl9E6
 B4/mA0vEWsqp0H73pHIBD87BzCuMSX8HooMcCW7unKk/XMcFkTe8tTCq+ g==;
X-CSE-ConnectionGUID: KLSt2VoXQS2kRlAwS1X2Xg==
X-CSE-MsgGUID: e6pqcRjlSHiJYSimBbpJ5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78761091"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="78761091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:46:21 -0800
X-CSE-ConnectionGUID: d5WdpTlrSUSCVesq8vKA+g==
X-CSE-MsgGUID: z9UGh8KzShmmZ/9ybzL0xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="198921404"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 10:46:20 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:46:20 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 10:46:20 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 10:46:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxIDAxyiTHaTyAg4P+qKYHvNEgwGOacCbYKpwMDTGYJhOduKw8LBprBfwE3WjjYfQw4C9wWqmO0UwYPcjkYrTgJK6GuxWuZ0oPui06AZDQ1YeUT4QFRid0qPEcLdFqMwAyENXIU2thKPWod7OgJjPcQL4h49RNX8OPKqdQBI/0ZERkM1qfiGgNDqHGJZ6ubH8FHzLCagcYCfmsMnCKeWp0GRp82gvjjfQB4zUl89rO9eW4IKBIgcXCPcymp+SmfncdW6KYOKZG6r/oh8r+GTOHktuSV/JAzqJwvqNQNgQJ74GDH9d+uISTcPmMIhEBxT4PliwmZdfmNufTZV6HEOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9eMTz/FbekyJvKxOtJvE2SMYIrVJ2bWiN6BiwdPkII=;
 b=vDOSCtHbLohazbQDDUUoaFpd5OZRJ9p5aDYRvTApalG0hALTGVoMl2xci8937ma4U54JjMF5SFlyFpdk/621kyf76HnJRZOM3g9J7fBy0uaS2oMpLKBW/+lrcsQu14MRni5u9+WykJKOajRMUvK5rtsJ+MWpQSFrh3O/LfgQxFXm9LFEiDTN1gjASBwj844iR9LOiUDnXN63OD/BSOdx+TpMDN1wAmpESDbwW8e88ym0uushdqEsbY3po7mmqcn40RDRAeMjzlb5uTGTCfu8hBb8bklYob55ceIqgFZG4kh36T4YMcx2pU1ClDtM21Ox1jB7EfZsn8QwkagR5YrSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ5PPF12B0A4A9B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::811) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:46:13 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 18:46:12 +0000
Date: Thu, 18 Dec 2025 10:46:10 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <matthew.brost@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>, <karthik.poosa@intel.com>, <dev@lankhorst.se>
Subject: Re: [PATCH v1] drm/xe/pm: Handle GT resume failure
Message-ID: <20251218184610.GD1180203@mdroper-desk1.amr.corp.intel.com>
References: <20251217131909.1226331-1-raag.jadav@intel.com>
 <aULnjAabXkM9jVfX@intel.com>
 <20251217173834.GK4164497@mdroper-desk1.amr.corp.intel.com>
 <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aUPhu0QGLd-hIQcQ@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ5PPF12B0A4A9B:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ac679d-df59-4a9f-ed00-08de3e65b7ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qq7APcbW/IcfARnvoTUocR7vXYY/YTCTpglOrWx3xcXZMzhDcabYVptSo3x1?=
 =?us-ascii?Q?0pnz9uQIOAwVIZTx9Ehmbl687Mn2jNaLfrXaoC6q4cywX6KsFIsFcZSKI+K+?=
 =?us-ascii?Q?Ufm0CCOqR5UCX51BPK1wvFKeHw6m+Q8Ep7lsjjW8ns+ZETSfjddn+zmnYxx4?=
 =?us-ascii?Q?e/08kJT1QADNxlt8p4ba1+wzl2LgKWpv/5yi69nWaO2o8hovaKO+CmfoIi2I?=
 =?us-ascii?Q?iN5DOKWm60AVEReaEfdOB/wZMqO0BOUwWhWqPfGAYOBqhXElO8uvY1x0MHq5?=
 =?us-ascii?Q?1xGqePEZ6n9n0kZRSlk435ffPZEyvw89GHhAgXSy9KytfQwRYFerhLv/Jg7A?=
 =?us-ascii?Q?hrB3od9cPMiuJg2NQFyULj2YT7AA4Qt3S560O1W1sCWhfJ7VmxFC1QFqWbjs?=
 =?us-ascii?Q?6UV0DjhDQ1MmA0S0UEdqgCE5YNd5qex1Ozy/6lor+GdeXgYHEOLQY+v5XeW9?=
 =?us-ascii?Q?ib4P1mUp8o9Uk2Z2ydHAmYfjjHoALg8RjRqQrK6YH4rmK9M+F+6upIo+I7uY?=
 =?us-ascii?Q?LHHiXVVvbiwPM1sNBUH11Dij7sisFKE57j061lh5oEGyE+IwjYPYzbh2Nfcz?=
 =?us-ascii?Q?WxZKMyVjHA5lBkIa0SAGzQwyCEjqMq7AiB4yllZLhQDrCOUKRy0UyxWq7KHS?=
 =?us-ascii?Q?tdC+JFmKRV2WXkDaUwKu2wQdXS6tjbyWUqsbZS0b9CQyEDIOktxezPJ5BYEI?=
 =?us-ascii?Q?AP/aIB3Fw0rjFCWz+Glbqi85e3l5FQPG7XZqs2T3ZUshrxR/94AsQQH0ECuL?=
 =?us-ascii?Q?i4/yzvU9KuG6C/uYtH6sFfAFBLtgk2nmseEsSPC+LA/FNWriu+mwLFiVsxQB?=
 =?us-ascii?Q?cWuTnq+k52ug29mi6qxpIyjSwi0FsfDI+h9JqHJ0Ocj9a4IAhCG3MprFtyab?=
 =?us-ascii?Q?0wSrZ0utA87xB3JBSnvHkDDfDIuEhKsWCvBSjpl+UJkq/KRem1gbs68sqkGg?=
 =?us-ascii?Q?OLdEdjyoFHJitEiYj9/HAbWqYsNRpPybhsqSknLRGdDMr5GBqqCMQVJstfjF?=
 =?us-ascii?Q?c8vjntY7t4CKtc37F2+J0oz070oHx+qiP40pmU+GtWkST5Cz/K64G7chp7Ny?=
 =?us-ascii?Q?N86Y5GNH8UM8Nz0Lg4v15jGsH1VnkgSuj1aZbTEMEhVR+5Efhdm5l9RyN/Ph?=
 =?us-ascii?Q?x997da03HOeyUACz+qd4VEBF/u/k57huXueKJCka1TUGNKKLaWhXC/SqfprA?=
 =?us-ascii?Q?DaMlay/S2d/jfzg8aYawc4G8GZOBX40NXMNKRoROwQ2dVT/WhRRCcqwnlagE?=
 =?us-ascii?Q?oSjiDWRlkxU5hn2OSm6f9U3wxyEKs7rvaN0grPxAQrXwyX9n+tYlMl16ubR+?=
 =?us-ascii?Q?6scBGoFtZLP2V0GcYcUasA/gIWQrfimmDPw2eReKW/6gKcV+5ZFoFnOFPWvk?=
 =?us-ascii?Q?GDpzO9/5NJRDO1Ka1GnZdp7u0sPbZRGBrWfZa6i/ABjk0vR3IqZG4nQBY/iK?=
 =?us-ascii?Q?twH91urs8TAv02nv1RgahgYEg+gxJFPV06xIN38FOKiyCCS3KVTjaw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?odNsAGk4OvW8j5kLuQnu0BmynLuSzwpQSjjy/86952llD24XdlbhM1Zs/+Zd?=
 =?us-ascii?Q?25L1kSQFzS3CqABe4OY0I4ssZ0UM+oYOcbXSmdaantTN33bl8dcLpyVww46f?=
 =?us-ascii?Q?5xNDbkkuQH3i1lsF1byntTeBNoJLqvY6azyO+DdXQ5+Th2zlyUzrH6jRietX?=
 =?us-ascii?Q?Q5uEb4NEMzzhMxOOShKohECUiBDiJhr2UQKGX42TUJRPYjwYeikOiMiLUxMY?=
 =?us-ascii?Q?4X10BZTMRWKIllBmxaHjQyKrBwEGyvT72giiJ4OKGp2BeUq0f6QI5tKG2ohw?=
 =?us-ascii?Q?6E1OLybKlBRoO4/eHxjw0/grocmSrIa6Rj5Nuyy2UktCDNWIyvY98N/qZJ1U?=
 =?us-ascii?Q?qzvVfFh4ScW21FF1UbOiQXwCoi5vraP5nppegrPc7pQOzxOYGYegMkumsRgF?=
 =?us-ascii?Q?3g50CKqwtlg9OhIUNoglw7RAOPkUNbOlP9kEcvI45wwfc33zfUkdWBJs0U/r?=
 =?us-ascii?Q?1i9cxjdI0H8d9zEopUPrhtnnSlaZcdonTAnvRvM3v+3eIEVzyTgd6mIk9Y7H?=
 =?us-ascii?Q?UqBDSnEbKHbxNv1q3LP7GeATpA6NWz7WhY+8pVsxWI8uBEaBlB8/uGIROKmD?=
 =?us-ascii?Q?3376e4nIIvVfmh9cvF4OEkjVr9win3ab6rrDqc2sYDMt9rIbBF5PEBMVUjio?=
 =?us-ascii?Q?tK6u9gGusUSAEto8sXWUIQT2Srf5cbZFabtykFBJsmXSosHomvCoAIOjO5O0?=
 =?us-ascii?Q?hUTopcqQjeVUQ2nr4eE+TaNF6Zb4AQeh5qNzyUuQpjd8ZjQDklRcn/kNqKzS?=
 =?us-ascii?Q?o+IR7PsvTOYQddveOealR/YiS2yIZzAYEsTsE6FvbH1y+n/vtEQvnso01EvZ?=
 =?us-ascii?Q?yyFHoXyPnvNKVXmWoYIP/ziik97LUg9IEd9lx7YrFN5lcNruqix5tCndUmsc?=
 =?us-ascii?Q?542yqXWlBYj4tl202gMqNxeUZVEBxVCAhraHaVVIw7dOukZ+EdnuaFfRjtos?=
 =?us-ascii?Q?BPxUxqUplAU4910AyyP2aE5yOB/LL/bhfDf/4IeSNU1nD7JgbxZuyx4UrwXB?=
 =?us-ascii?Q?gzS4mW42Pxj9Z4Q6dwTSbjp481wlc802PeTEI17Kmp3P5UW6O+Z8s0XunUdL?=
 =?us-ascii?Q?zaYYVFisuD+2DuGCpWfmtfh8yarPk7vHWkzkCo03Y5wn87J8fTC/fwqxLHAB?=
 =?us-ascii?Q?SYHkkgK0L6B7k0UHCPAbX9r6C/GRNDozqr4ABYXo8F6MnSVOaWAweE1i8VGN?=
 =?us-ascii?Q?jugpJt81xZStBg/CKq0VWVHilrC7hthoe1XeMvs/jWwNjid5Vxk2fvsjWore?=
 =?us-ascii?Q?nVWypWNnWRLTuv82/LFl9cQF77Umtw04NsocscUDK7rG8uW4PUGN9fghtthb?=
 =?us-ascii?Q?QyttxdCWl9s15DXZb9UxOVkHiBnDaQ1zqmMnPEgUedLenUujy/cwwNBfu8Ru?=
 =?us-ascii?Q?CZ/giDk3DOLVQGzETn7fmI8RmowzvEWCEkQw90JJds0t7WM5u4hcyRMjN5+n?=
 =?us-ascii?Q?CMlbK2uLRjUgf7+DV88D+RCEvsm1nIPLzMO3dCjkNZ6kXUEBanHALjxPgfI/?=
 =?us-ascii?Q?RdwZ/7aczIVESmXXKjt2HKD4sa+V4u8pR1KO+t1grx/CntiNn3sk1WD64EYX?=
 =?us-ascii?Q?ZTNKNg+tsEc0ERHU3eiv2AL+J8f204A1EyopWcCj52Qs7fGhRiJzCuZ1zZpR?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ac679d-df59-4a9f-ed00-08de3e65b7ae
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:46:12.8940 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vQehBMNFdUyugcrJg+pmkqoGMcxnJXQV8uzfbxJVJEav9ADY83ivx1+Werv2YcJcQ9Xo7Rn5JvtCaRzBXRu2EKJxK3TiRWV+dRgGJzFvlI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF12B0A4A9B
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

On Thu, Dec 18, 2025 at 12:12:59PM +0100, Raag Jadav wrote:
> On Wed, Dec 17, 2025 at 09:38:34AM -0800, Matt Roper wrote:
> > On Wed, Dec 17, 2025 at 12:25:32PM -0500, Rodrigo Vivi wrote:
> > > On Wed, Dec 17, 2025 at 06:49:09PM +0530, Raag Jadav wrote:
> > > > We've been historically ignoring GT resume failure. Since the function
> > > > can return error, handle it properly.
> > > 
> > > I probably had a reason for it, but since I didn't document and
> > > cannot remember it, let's go forward and make the clean flow.
> > > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > 
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++----
> > > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > index 4390ba69610d..a8b50091d62e 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > @@ -260,8 +260,11 @@ int xe_pm_resume(struct xe_device *xe)
> > > >  
> > > >  	xe_irq_resume(xe);
> > > >  
> > > > -	for_each_gt(gt, xe, id)
> > > > -		xe_gt_resume(gt);
> > > > +	for_each_gt(gt, xe, id) {
> > > > +		err = xe_gt_resume(gt);
> > > > +		if (err)
> > > > +			goto err;
> > 
> > When we propagate these errors upward, what's the end result / where
> > does it eventually get handled?  If the device is still [partially]
> > usable after an error, wouldn't it be better to not bail out of the loop
> > immediately, but rather at least try to resume the other GTs, the
> > display, etc. before returning the error at the end to indicate
> > something failed?  Then you might still have a partially functioning
> > device and have a better chance of at least having your screen turn back
> > on to show the relevant error messages?
> 
> I had a similar question when I came across xe_device_probe(), but as
> Lucas mentioned[1] that the expectation here is pretty much "all or
> nothing". Again, not my call but I think we should be consistent.

I think device probe is a bit different --- if you can't bring up the
hardware successfully at the very beginning then something is pretty
wrong and it's best to just not enable and start using the device at
all.  But the resume paths are different --- the device is already bound
and in use, and was working properly previously.  If we intentionally
don't even try to power up other parts of the device that might still
work (display, other GTs, etc.), then we're making the situation worse
and that could be the difference between the user having a functional UI
that gives them a chance to save their work and shutdown/recover
gracefully vs having to just power off the machine because their monitor
is black and they don't have any idea what's going on.  Powering up
other units like display also makes it more likely that we can get
useful debugging information out of the machine to figure out what
actually went wrong.


Matt

> 
> [1] https://lore.kernel.org/intel-xe/lliho4ci6gi5spxxelttgqntbh7rxr4utg4dgfevlrdy54phrh@2k4mjuofaqye/
> 
> Raag
> 
> > > > +	}
> > > >  
> > > >  	xe_display_pm_resume(xe);
> > > >  
> > > > @@ -656,8 +659,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> > > >  
> > > >  	xe_irq_resume(xe);
> > > >  
> > > > -	for_each_gt(gt, xe, id)
> > > > -		xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > +	for_each_gt(gt, xe, id) {
> > > > +		err = xe->d3cold.allowed ? xe_gt_resume(gt) : xe_gt_runtime_resume(gt);
> > > > +		if (err)
> > > > +			goto out;
> > > > +	}
> > > >  
> > > >  	xe_display_pm_runtime_resume(xe);
> > > >  
> > > > -- 
> > > > 2.43.0
> > > > 
> > 
> > -- 
> > Matt Roper
> > Graphics Software Engineer
> > Linux GPU Platform Enablement
> > Intel Corporation

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
