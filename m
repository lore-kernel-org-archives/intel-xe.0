Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E13C83F1A
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 17:15:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2757910E0CE;
	Wed, 23 Jul 2025 17:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5sbLKiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681C410E0CE
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Jul 2025 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753290916; x=1784826916;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cpDZOQB1xRPKGNlMlVMBzaVYupeAp+P0PBG5r01MdHU=;
 b=k5sbLKiyaie5W1HmvfVfu8s7FCQExRmkScHXQLnt7syAehLpBR/YmWCP
 G04YFgcFvmARzNoCR8qC295XyEbGIULb45cnmygGmR29peO5XIdI2zDW9
 XQ3cpfK60XEcZxcTl2wWIY3xOUBWoo/g9QzpBt0HQWfL59yTIoy4hi3im
 HZnsGBbsj/D4qa3vxf4PrdBjT89s4UHKEsJ64SXzDlKlOirIi/MpgU6NO
 tPSkKESHzwCkDRDdDLYzYIp16NpqglfFEZfGTMzhRRvJxH+vDGDC1F5o4
 E90FxUwBmWO4wXnWnojKhSKiXtS977Wj+8FrHT+qQ7WbBdDHiO+ZPtxtb w==;
X-CSE-ConnectionGUID: fVFGy3PkTcalLQLacSFvVA==
X-CSE-MsgGUID: AkWLP6JpQkKs4zRKutZC6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55736689"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="55736689"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:15:15 -0700
X-CSE-ConnectionGUID: hXX0gRHARz2vt9wcFBLGhg==
X-CSE-MsgGUID: xlHN2JkCTKm8Qn/o0JgY0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="196741090"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 10:15:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 10:15:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 10:15:14 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.85)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 10:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CM4ILuxMr2UhFZpom7Y1x0EABRzO+Vvy6AVGgFN0baV235hfHrldDv7y2INOjsjWdXjjsjkiF7zQs4iyaifp5KHNVmQToIGXT1PiYABgvKqsfTbgtBvvkxUERjDk841d5eLbR+KnYq34/5apwouGAZsP3FJS4SlbDDFANpudqFcKo1HtglPCKtydvQXrkzmMfesu5ABhuZQTT1p+PTcJxwCPHOxoBiJcoofA/ZV81Hm0bXzq84P6DJjbHEd9yXgmDMbrBUEOuKb5S2LM9/VBmlMLTjg7r2Q2RUksHucUijH4zA1+9kOlH/WbmXh569VuUMMLc4j44O1Eb7A3zfhgkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weABIR25LsmuNkgKTdOymWLs2OVX/Btf1bDLW39NgEs=;
 b=Yn71htZmxlNuo0QGg401dE+U6ays2fHNxRb7IVzwaprA8G5CMyeETkh/1YYIVUMNqmu45eKfYcY6zkmAV0kGJqaLZ8e7kOYevAXzL0ydrVKKRtvazhbOJ+dG+cGwbU+6eN7tvBlRS3w9HptK971qTPyCdy4+ZnVc50gSMixum4/VwbbRENRwV3HR0rjcr46AwkY/JT2dfWOAflqtO5nNUhDFfh4ksPF4E260L9W9yP1/2rlJX1l7IzcEYHXmQOf8L3mBWFhKJDTSF/YlL30n/cQWStxvFGzXIeXbm3GPvcvdxI6xTmrx1NY4P1D+XmF0cI3pT52qfaB3VwUVBK1Xiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ2PR11MB7503.namprd11.prod.outlook.com (2603:10b6:a03:4cb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Wed, 23 Jul
 2025 17:14:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 17:14:57 +0000
Date: Wed, 23 Jul 2025 10:16:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Explicitly initialize g2h_fence.cancel
Message-ID: <aIEY/GM6PzejW9dE@lstrano-desk.jf.intel.com>
References: <20250723165717.206730-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250723165717.206730-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:303:b8::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ2PR11MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e4a6dbe-358a-4b15-9038-08ddca0c72a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wrUAkYTpY8yRnfQ/5samF2Z8Kg4THzGBXTRne2mE7QUmNny2PyLHuW3t6CJJ?=
 =?us-ascii?Q?KXtgeO5L3DttnIwOd0k21XEcTWBmBPaZR2v2xi1UPEp86a4HEcaLYm0xW+d3?=
 =?us-ascii?Q?emUXyox5ZWL8GGmSNiZga0+C8Sj39g5w2pnAJFd83Ffoc9n2jUyKAN2ApC/S?=
 =?us-ascii?Q?PG5SpWkZjdTX2/v/t5/v4GUhOsaadasj3R/0qyfm0Uyip5W8zXgh6kOLlMgP?=
 =?us-ascii?Q?mXSsU0KRMwkctdwYR/a4F6Bhy2+rkJ4uXSyNNXE7iD2sHbw5+svO9i3GG4p9?=
 =?us-ascii?Q?DkeuzaYXiAdiq+rw1rK0prUBjbpbLLHURVNi6npwR/D3VxYnduLzuCLtpBbT?=
 =?us-ascii?Q?xifkZLawE1jEMI77Ia7Jewq589FEZsH0XvDwE4w7H4ZQz/Z+TvM7jTwvSzwL?=
 =?us-ascii?Q?QeieBe0ql0sBrq9G4Sg/bnT/xv42QdH+WVwJKUJPCIh98tb1u5cx1BUlwSKi?=
 =?us-ascii?Q?AqlW+zleNGOkJy3WvlJnURbrQwlmdkh5YzRWohvsjaZ+MCjXg8/tqtHxSHMe?=
 =?us-ascii?Q?13QwjnvvekxH0Ypcbdn1IafqPuvMb//2+W9/y3mMFymp/CCF8RUcRZ60HdYp?=
 =?us-ascii?Q?fECliRJ10O+s2ohyKvn6R8ASVBNMDS5UTqHKCgmXeXdy8j1FW0Wy3nlvgdyp?=
 =?us-ascii?Q?QUTNH1X7Kicn+qbrtUKnQFaqwcwDFFi6GecmfGcO4YyCWD/h1GUfoXaounGL?=
 =?us-ascii?Q?qZXf3h5w8W2vxyIDU8llmd7PBhwKHj1BtUneP+d5BkxLo61Sy95M8cc+DzCM?=
 =?us-ascii?Q?NkHKK9Bh28ymFKxuFBr1GnxdR1mmXn6b17UN6T3pryNOIV6CK1UTBpbB3w+6?=
 =?us-ascii?Q?NYOaAlKKqOexqoGTla4//uiNcI38U++MixR/oQhKa0TDCA/zx77cW/YYEKNm?=
 =?us-ascii?Q?6YrZqkcVzIVikNlDxtGZIKO1BwnYaqDyIaG7dRu69SOaZGs3Qw5BqjXXk85s?=
 =?us-ascii?Q?WepNumS/9QHc0NZR/wge4WDNiPc5NaUR3CbTrahyKFYx+nEPHhWFFeHqJKlv?=
 =?us-ascii?Q?WSfAkKaqNU8zziNged6IL4TnqPn208AvsOLTR+kSmpW4etCfzf4MYG8KjG75?=
 =?us-ascii?Q?5hZs4rNhkMLASaUhv9Kvfh9b7eKCUGPl/a0LD9v229oCpd+MJ59zIeSEOo2Q?=
 =?us-ascii?Q?UY0ydDcn0/9GADveO84laN2kAQ9+dofUDDZDt0vjXARbKL3uVDP1sIuY8jCq?=
 =?us-ascii?Q?nue30JnCiRuvhL8yDVnF1OAqX+4bmdjY/BViIC2frgxrtXOyn68t02NwTr5d?=
 =?us-ascii?Q?SuvIS/VA+T/ONEiqP8wBrmsuKEtLS9nCfdlyVESdhKQ53CrgbF8YPScEMq1f?=
 =?us-ascii?Q?1bg0b329ihx/jJ8+yuGP91YAXs3vxci+CL87uVExsjdFgm9ZlMj8H/IT2Tfk?=
 =?us-ascii?Q?Dqd8nmbQYUipSP+NDCda8flWuwiaWeYR7VUpqhlT8oqT9sXPxt6MFl3oYxTF?=
 =?us-ascii?Q?AXu+XU0wGYY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6LOkSUJoRgU/L38cIZPvYm6UpQZ/5Amx2utjURLyr+dI50+1HZpemn4Vj015?=
 =?us-ascii?Q?mwiI36kNWYGZCl+vdj26tBjgEOe1aiuILnUC2J/8q5Rkpgn2IrlBk/7CDZXJ?=
 =?us-ascii?Q?dnzO+OBti9R8ONhLuCPc8KkYF5cw6+EA12CeKpN3mmSrheXvs5X76jfUPjfD?=
 =?us-ascii?Q?BljeN1f6qXd91MmENhbgxRPVXRN+2i/ZtWFuKAtWPSVtHdkVKwFpNNx12w5D?=
 =?us-ascii?Q?3/ES4O/pQbR45UxhvY4V5NfGCGnTCVsroMHHbExM1MyPbHs7GExlm7BFPRJn?=
 =?us-ascii?Q?bprLwaQmOpYdBTLqLzbjkOIQK1LCOhh94YyNXYQwZvHt+/efytlMFG2TGVkc?=
 =?us-ascii?Q?ofJRllqTnJssCfyOjWqLxneIc/iY4HCelb1CTIMYK9pV2JKD6lRSDa55P4za?=
 =?us-ascii?Q?KLtXuMcjNrnOOOm2tQFy4D2on/uox5DX/chbhKcgeUEkXUwQ3OkbARIupmCG?=
 =?us-ascii?Q?5SQBNuOonGK6eeRjwBpun0MfKZJvgbjPbceiNQkV4qcPV4nnRLX4m0kBhpoq?=
 =?us-ascii?Q?6jHYHngDh/L5vCak7znyIT0jvm73jJRmzY3u3/KwDUybk1cqh+hmCcBrdCyj?=
 =?us-ascii?Q?LB/5V8WQhadsir1e+efZmpBNft0TNyM1hjmbIQ3p0tf6ghmJ0EB3iFd9PGIF?=
 =?us-ascii?Q?MgtujAxs/sztIskhceeI9KdBA24wk3zsLOmyGUF+SEI54+MnIGGKCsnJjAcR?=
 =?us-ascii?Q?zJJg7ZkgiUUqH08l24o+ARM1OEHXmMei2195y8oBYcGgr0SG3Iz4C70iEW6n?=
 =?us-ascii?Q?umDGXCnvQ+aAfDzohlnuypRjOb2GJnyEI/rKHahgOP7SX24X630XU3OJ6OMN?=
 =?us-ascii?Q?FujriarHbZphHErVIz+19luzkFSTqowlyfsP5QWA+rETGpU9N5lQJsZR0s/D?=
 =?us-ascii?Q?oXXVATsx8tTP8gyZnJlch0sSEx1Ds7m3zqs4BrIDGBPN5RGgyhp+PAvUqy/c?=
 =?us-ascii?Q?0dm9V3TGaljqzBFFf1uN3n2DScpKtQSA/xHbD1fYXIxReM+XxVDF630JPPVP?=
 =?us-ascii?Q?31wO6ZOwMH4GTMAZ5lXibFufvRAXeU+xI4T1awMleJUzdUxYDSzsE3bFpueA?=
 =?us-ascii?Q?ExRuAwkrWvuhDBAUE1zkB2Jo8r/PSamtF1a5/Jq1LqsPGJkm0TBW2/Tm+QBi?=
 =?us-ascii?Q?YOQz0BbDIhJJwRB/TJU/7UKsrTbCollRgqTNX5yTQwYAfGKNRN5wtB5HOwNZ?=
 =?us-ascii?Q?nSHLngxHjHD9lcjmPYuNAEGxqKvWE5uO/dVb51vgoYdQ75ORUo0/CW6rT6pA?=
 =?us-ascii?Q?ZHLf5zsDz/7fRDVrP3XmBtnfxql1AnOt8hfeLl+X61qPGuxRwcrJLPIrgHCv?=
 =?us-ascii?Q?UvyTC56ibU2b2uK4TEBFixd9OqKmA9IwMAOCIz3VX1man1UNxwti3Tz+ZaTL?=
 =?us-ascii?Q?citXW0wmOICODjoW29qHXiACX3u7O4eXHAd7maIF5FSTZl5Gq+gSMjvoByaj?=
 =?us-ascii?Q?LE/2L5LH0ZJtb/dQsUgCeey6mlPM70TyjPBd4nLPKKjcAagj6LwapPMnYb1k?=
 =?us-ascii?Q?AyUVOL9YdplO6EhNgsLDi/lGlH7kLeqKMRYgvQjk9Mrmiu6PZjzsiBQHDCEm?=
 =?us-ascii?Q?75/FeivWaq0UnCIOCfhW08IGWdzg091awPYWdvPRZV0wMUdotaJlChfJx6Mi?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e4a6dbe-358a-4b15-9038-08ddca0c72a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 17:14:56.9705 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E1BE4pWlIOGf1t9byoH762CpgSd8Ki63LJ7+b4Pk9hYa+XHKKqMQSwx2h9LC2rDQIKcVwh4JD59GP00nj678mA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7503
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

On Wed, Jul 23, 2025 at 06:57:17PM +0200, Michal Wajdeczko wrote:
> The struct g2h_fence must be explicitly initializated using the
> g2h_fence_init() function to avoid trash values in its members,
> but we missed to update this helper function with the new member.
> 
> Fixes: 94de94d24ea8 ("drm/xe/guc: Cancel ongoing H2G requests when stopping CT")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index b6acccfcd351..ebe74a6b27ee 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -98,6 +98,7 @@ static void g2h_fence_init(struct g2h_fence *g2h_fence, u32 *response_buffer)
>  	g2h_fence->response_buffer = response_buffer;
>  	g2h_fence->response_data = 0;
>  	g2h_fence->response_len = 0;
> +	g2h_fence->cancel = false;

Should we just memset the g2h fence to zero, then set non-zero fields?
Seems safer and I don't think this is critical path so can take a slight
perf hit.

Matt

>  	g2h_fence->fail = false;
>  	g2h_fence->retry = false;
>  	g2h_fence->done = false;
> -- 
> 2.47.1
> 
