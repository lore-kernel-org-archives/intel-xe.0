Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B56C3ABC0
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 19:49:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF27910E889;
	Wed,  7 May 2025 19:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXs+9BnJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD73610E889
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 19:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746647384; x=1778183384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=oYFbajpsm720C7fq43Xym9ecjiy1XHKRsEj7iAwZTyc=;
 b=bXs+9BnJ9P5XdQS+4JMlcQRZACNspkTuZ66aVo3kRgkKiYvBjqlZaNq1
 x8OLD7IKk1gWcVd7627J0CYxPVsLqijNcK8KAR4aUh5ZeOm0A3sNNWmOv
 HgEtqRQO0EH5OE75wzDApezNTH9FWY3GGlI9Ma/qtZr8qDZIkJrqdiJrn
 dLVpoPf5amBomyLLnxq3XQuWswpgex6sgJy4sqbBrmRyPnQpVz9YcNIZQ
 o9r0lkf4/J2GJc3IY7J5w2pLpAfYQ/Cys66Zu2jJyGhrVpfDlYONeLEQ9
 KBreplsdG2vUl1UDmG5th+SVuzHE3NlKQP20e4MSng+XStdBrJMRHgOwi A==;
X-CSE-ConnectionGUID: KwHqNbzsTdCKEj0TKnle/w==
X-CSE-MsgGUID: vt0dVcbnQ5+lixN2o/XZ0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48109453"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48109453"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:49:44 -0700
X-CSE-ConnectionGUID: A1KypnWeS9G6PdPymydmeg==
X-CSE-MsgGUID: v1UQXDdITUyO0deoxODvVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="140931023"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 12:49:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 12:49:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 12:49:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 12:49:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=heVkvuHslAZ/TvDbafcxFxUjr5zqN16uWu8oNKBLOMu+w1KpbNLuqVLeTaO3j6KaIBCSyFm0HrAfB9E2HR62YNeaqmgAVIvQt1AUwyXCcUb7O45R7dUUqZLojGaGidbyE90Xd9YHJQql3A/yerbAkjwxpW89j2eF9ayTK6bERWfpkBXu2ixX8cSVeHWwhC4y8TdrHgNJpyfLhUhwL1S9STphirq/gHKAkoP10fe9JLVOV+a6vjkNEtHF7kLTKGlvzlsJhn7ZsB732oGWSdMHrOJuzBdlf9JAPaZghayD/RCg9dmKlZWdujLfaC4FV3w6S1bm8AXn1k7oy0BZOMTFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qob1Lh8ncG9SYjNIP40jKxEwYyUDk409JgE6GF6BNFU=;
 b=oFIGQnNni83+kVjajk8DAxtI5DG5ZNk4HDOgYC6TdbZfsOtSrDiLZji4h/T7zwT3BBa+TwBmCn0KOZwAfbPkjeiKYQOfqFrBKZncWHx4gVL+00sM4O0xq01nGCK4yoI7LM6zvhDnXR8pFjCgH2pdjBbcPY67wNd3rYs1iaSBTO8RsOipBhc9jdYKoDSr7kXTjNtSrCsoZJmuA6al4FXEm5qlFZqNQFd2fEuc0osuXcJWtJ+LvdPWbpJruM3MFE9HA0cKs9OflHKadXt4d7QWrhszrpCTfYEhvSCno7fBTXx3xhmdhG2CLSwo79exzZHyQfzQ4rB5wEVsceFBUXJFYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB7070.namprd11.prod.outlook.com (2603:10b6:510:216::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Wed, 7 May
 2025 19:49:08 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 19:49:08 +0000
Date: Wed, 7 May 2025 12:49:06 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Nitin Gote <nitin.r.gote@intel.com>, <intel-xe@lists.freedesktop.org>,
 <joonas.lahtinen@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <tejas.upadhyay@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Disable null query for anyhit shader
Message-ID: <20250507194906.GH5080@mdroper-desk1.amr.corp.intel.com>
References: <20250507124437.2651331-1-nitin.r.gote@intel.com>
 <174662582054.2473.12369854211740990391@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <174662582054.2473.12369854211740990391@intel.com>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: ab698430-35cb-44ff-4555-08dd8da03b02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?neMVymnWp19txEQA7fsvexBpfvPLefV+JGiUM/X73DBCbvbUOQQE7HK9yEvg?=
 =?us-ascii?Q?cZ7eFAa9sfPMMgPXna6I5WRBBvylf2tnyyghiNbzPi3bXD6c1NoHQoKH7iJ4?=
 =?us-ascii?Q?NY1GwacPwhGbjWwX0Ta2WlwKfyKK+gpnDw4/GZ0dWiX53pxseBSA4QnPfXp/?=
 =?us-ascii?Q?ns8wB+ExxBH87M8HXux6MhNJC0gW+6yP8jIrTquwxrL2wGAoubTVcKA5INf7?=
 =?us-ascii?Q?0jBSDg9CTgk+H5NtpVKURKUkgOm8VNyog/Z6XhuQqI8/uS389qDUxpSmkBro?=
 =?us-ascii?Q?Fin+V/vx+AcdfwWrPKqmtMDFRTPV5ks9FEVC0LmnoG9jpoSpDu5OZir/HTU0?=
 =?us-ascii?Q?J/AQ9d5mlfVBRi0xEkCN8UpKuTe5cfchHXodrjH1s16Nt2fctqHFoDMCqIw/?=
 =?us-ascii?Q?kQtF+4Jd2Q0Rf36RqcHsqyXv2qzuXDpZNv0wgpvTE9wu4+h1GNC4L17b7lYN?=
 =?us-ascii?Q?ahClc6kQIIggazOWBEoYll1wAnWBIFg2aaI+T0iyZ6ZTpAyg9MP3Kf73jqA0?=
 =?us-ascii?Q?ZCd8Iw3dzyFvMBPq3N7PqDP6+buFJpfLYQbhy8SAIh2mFlGVgABR3w++QHpu?=
 =?us-ascii?Q?vP1jzeECjqeXye8XhNniP/b5qBhI0d46fI8l5gM12ho1WpoHrd6l8WPXLhKX?=
 =?us-ascii?Q?iNFdGnOJxkXt4/9Uysc3i5jOkT1/t0SKkmSR+FNmJYuhX6BDWnF+viwaiXoE?=
 =?us-ascii?Q?kUes/siUg9czcx1S+XWaAQ/Cjkc77yqagwocr4tR4Q1X0JgikLifpYHh9QCl?=
 =?us-ascii?Q?XYsWnlt2rmhjGT7EqXa0TjmMgatAAr4R1DK96sjMENwwLlAplgne2xWJp+Rr?=
 =?us-ascii?Q?OI7LSBDfwCLjVAmoLiSrbtCGPScMpmMMr87poCaBkY1dblvckEHGVWvUO7eG?=
 =?us-ascii?Q?5wODVht3mZVpayYcdmzUQuTFzK6PJzTAfEL47a2r1xDeE2rkHSIb3Y8/pnz1?=
 =?us-ascii?Q?ku90cJejW8RJxMpPXquGg4vJK6BQVKlg6v184hWEqLLlhVT8LtMScPXb++5i?=
 =?us-ascii?Q?N3P8ONS+P8qFptnynWAVSmnEWC0lTr6rnJcfD32tLdN4G9xZCxeQRqJ7ydEl?=
 =?us-ascii?Q?sg7atDyBpColLk5fL5cb1ty2CG56czefujaHEY6274r/KeEkRcW7dwzGHhVF?=
 =?us-ascii?Q?7Gs604ePH/7MAC08XCNRXAZm+MgetzCYoMqLwy8HHmX9AmepV0e9JcM3/c0R?=
 =?us-ascii?Q?lg3tkBrX7n2CFday7xX235p6VZTSeiawMJCciMjNPrF9FlMtzFbGu1qBRwk2?=
 =?us-ascii?Q?3RiE7ieJP2b4mxOWqnc+YtjfUwlN5fo+XIwkXlnfxC7vsTKHVN2WUmFZMrQ8?=
 =?us-ascii?Q?bM3YYhHuwp3NHr/32CiQMTyyCox8kspoNY8o5hgcV1c4SewSfDwZxYtFHlxQ?=
 =?us-ascii?Q?YJLFbXddh42+zXtoS1wuYh5N0TYE1/Hgou3OkVXU2sBDW0N3dfDfAyR9hIsf?=
 =?us-ascii?Q?kgNO0kWNt8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bBWn/t6vVQkkTcoSasVpFou/xFSsKwQz1D8WZcRXA2eYXOaqyMZVe1nI6BGk?=
 =?us-ascii?Q?htcrZmSLnDFxVYD7OtB2ctwwf6XcAoj0GTj/XcqZSEorHdhJ0fWfE2pbTV/t?=
 =?us-ascii?Q?OV+zJBkuS1KyQO8PBGhsvyPR6m3R6zaNHPqHOxCNOZU3WfAAvKs9GBGHnEF8?=
 =?us-ascii?Q?XeeNTFR7IAIaLJUeRtjtIE+U73BfisTlEEPK8k2Dqv097/By2zTWIrE1aXHj?=
 =?us-ascii?Q?H0AiET6P7DCioFlU3ndel9Gql/Dx/uBeq9hb4dAwhKoqJAPFr0CBqx47jych?=
 =?us-ascii?Q?PsNRCP4adtLbGG97pTlYU5pvBBzoT+NSif2G7FKEujfiSLaXCePaP6ECEKWj?=
 =?us-ascii?Q?Kz969oUrXM2WAB3wsOZcdrPSeItYVogV9uHnc75xMYVvZCXnGenXofrl/yeF?=
 =?us-ascii?Q?VVbpEzgq/h8KbGQ+rB3YkgZeqO2Bova4/1ubxZLq1+Ng6qZxAP53pgkwvlQY?=
 =?us-ascii?Q?+6s8/rTzOU9iIXhT5i8lNi9JN58bjzAO0120ZRWCnZ+VhR3U2MrJCZHlp+XG?=
 =?us-ascii?Q?QRU2buX1SDchsGD1ei3MfvryiGpvgQ37G289qQn1tydbaZ1TuQk6t78IgC+f?=
 =?us-ascii?Q?klh1aUyg6XrEUVMyU0CaFGdb/vKUyDmIMhRaFBOhEAMujz8XNdLsMQg8no4J?=
 =?us-ascii?Q?mK4jz2RfGVUsIECGjyivTZKF7zOgQOK/sOw0zAZ4KeHgPhMDBXV6GLAIos5W?=
 =?us-ascii?Q?6htVFCeaRDBsAJnOQdZvwx3tW85d97AP3a3NE6qmgVSZJ2QiB1zKuqiATql3?=
 =?us-ascii?Q?0kH2KhwYU3Ua6qePjKCSs/3AMHFzRIQerZ6LkU1EcE5XSro99HbNGGJ0NQI4?=
 =?us-ascii?Q?Jd5ELRqRpA7mN9wMsJBKy0L/cusbFoVH+Z7RbMmtcVQy/9WQwWF5seubN0sO?=
 =?us-ascii?Q?aeFHoAiWL0pXq4ad4J8Fo4HcQgtdwEBnooK16MLaE065T9+N60k8/lMW2FCT?=
 =?us-ascii?Q?jYCEndy8naUmlfGTvCBuU0pWH5TtP1nm0i4f8Vt2Pn05Wh6AApPnlnwUh31W?=
 =?us-ascii?Q?2j2hShQJGa7ouJ98sQI+fLeQO20TFeYWJSHyizo8kUfTo4kUFRHNazxK+WG0?=
 =?us-ascii?Q?QLENMXzP0NK4EzBJfbrSu++BSeLvMjyAnllmj7RYgFgVgNCW8e/y43FZA8X3?=
 =?us-ascii?Q?1YLU/gKiE49BTAtm9yZodUUdUjd+6wSytl2Pm0vNSVoppmMF5GU0hzAPpfIc?=
 =?us-ascii?Q?Nxr7X4ZT1hxNPva0alWYZZXVhggwzNmN4MbiXKT1FHDen3jjhQvVAf/iPIzo?=
 =?us-ascii?Q?9bb/8CXhDbfYrVfh6KdZUP0659e2Mvcho8VZx6XtEtySHg7Re6nmvhy+KZ/X?=
 =?us-ascii?Q?HsXzCwAq2BShoShhlyXsRy/NTH3DnjdSGSgL/ULYWyyaWXERZLoWG12ITZKw?=
 =?us-ascii?Q?CYKRHasowTTrLPgRwClqBL5SW5hcBFgumLWaDgBrWvYP2b0OhoXlS6B8GjJ7?=
 =?us-ascii?Q?KlcZHy67oNy75zC2m7kjdI4X9sttcGTEXFjsSJfj/tGUJAy2GIozh1fnTTje?=
 =?us-ascii?Q?EJ8YwtHvS0d1h5kX6pASFk/hNdLs8W2J2cGGJhUsXWpoAe4xjK9ddJyfL4l8?=
 =?us-ascii?Q?71WWdzDlXNiC5vxNUIeZjFu2W6olTbXejeNes2O8VdOxVxIlXu+qEW2l2Qec?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab698430-35cb-44ff-4555-08dd8da03b02
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 19:49:08.2468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHacAcWnco7JGyE3kRh8XTsHWedW0UNqBkZcEzO4gdlGsWQbC4xwwjnOendvooBYxl8vDwnrLwckHoD0o94tmlWWdfu4o7yM5NujIHb8ihY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7070
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

On Wed, May 07, 2025 at 10:50:20AM -0300, Gustavo Sousa wrote:
> Quoting Nitin Gote (2025-05-07 09:44:37-03:00)
> >For PTL, disable null query for anyhit shader as it
> >currently does not bring any performance benefits.
> >Quite the contrary, disabling the mechanism brings a
> >small but consistent perf uplift.
> >
> >Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> 
> This seems to match the requirements for Xe3 according to the
> description of RT_CTL. So

Doesn't the description (on bspec 57496) indicate that it applies to
everything Xe2 and beyond?  I don't see anything there about Xe3
specifically.  In that case something like GRAPHICS_VERSION_RANGE(2000,
XE_RTP_END_VERSION_UNDEFINED) would be more accurate reflection of that
note.

But that bspec page also indicates that '1' is already the hardware
default value on all such platforms, so this patch doesn't seem
necessary if the spec is correct.


Matt

> 
> Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> However, we usually have entries in Bspec 72161 for this kind of stuff.
> Could we get that page updated with a proper entry for this tuning,
> please?
> 
> Also, I would use "drm/xe/xe3:" in the commit subject, since this is
> applicable to the Xe3 IP and not necessarily specific to the platform.
> 
> --
> Gustavo Sousa
> 
> >---
> > drivers/gpu/drm/xe/xe_tuning.c | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> >diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> >index 49ddbda7cdef..6f2f3428b12e 100644
> >--- a/drivers/gpu/drm/xe/xe_tuning.c
> >+++ b/drivers/gpu/drm/xe/xe_tuning.c
> >@@ -98,6 +98,11 @@ static const struct xe_rtp_entry_sr engine_tunings[] = {
> >                        ENGINE_CLASS(RENDER)),
> >           XE_RTP_ACTIONS(SET(SAMPLER_MODE, INDIRECT_STATE_BASE_ADDR_OVERRIDE))
> >         },
> >+        { XE_RTP_NAME("Tuning: Disable NULL query for Anyhit Shader"),
> >+          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
> >+                       FUNC(xe_rtp_match_first_render_or_compute)),
> >+          XE_RTP_ACTIONS(SET(RT_CTRL, DIS_NULL_QUERY))
> >+        },
> > };
> > 
> > static const struct xe_rtp_entry_sr lrc_tunings[] = {
> >-- 
> >2.25.1
> >

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
