Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7949FC4828D
	for <intel-xe@archiver.kernel.org>; Wed,  7 Feb 2024 03:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24895113094;
	Wed,  7 Feb 2024 03:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZYBGhHB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366D7113094
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Feb 2024 03:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707276678; x=1738812678;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MX39wZ5kNnaTSZUxcn+Dls63QSm2JLGE0L+rOF0nsgs=;
 b=ZYBGhHB1QwvptIWg/UCu6nj2mFiup4/ZeZfDv/EiBNlLOq9xYr7HJ3p6
 +JQNqlxirbzd+ZoCMVNgHehSqB25kxcYm++o45NyYDqoXRsMXrh5bc8XY
 ZcjsTV5O4puDZyZ4bGSf2Pzk1+3CxMPnhqHSETtjuIHGQQUeFgHN4n43B
 5/kRrQJft7ybjxb8vpct4xXTSFIiZaUh/PYy827q/lfN8xhC1vxRAOqr9
 MV6qMrGVWNbyPNxK0ycbt+2a7iFvZUCV478B3Ii8z6QVDtSvwDQaXMJ7I
 mG4Hynm0ZNg6UVeQ7QX5howl4frx+XIEYbFBJWJ2nKKqozFfPnxOD7zu4 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="18320034"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; d="scan'208";a="18320034"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 19:31:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="5826767"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 19:31:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 19:31:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 19:31:16 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 19:31:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPQ3xdgdh5Ilf+cwlajCbB/+xCSuDmU8dPBym9qCJPOv5c3ML2SBFxyYl+GFAcMJQrxp370V97Xk0eG8O7CyHIxAU2652SP/Xgbgq5VbfEn306Wrk9JQjR3gwHg8qcWhcWe789azKwQ8ba++NOEgvB5esiJA9KxStwiw4wq2VI+ZQGfsRk/nahmbNoFfy8pkYT0+pXjtm1eXQ8TUu72o50s1Bllf1uwzSS4Vehmc1iiE+WXTs0vVsu90C+Lyd+MaJpcTeDELOXbqH5ZHI3JTnFiFFxAdHbSmF5jmYrvG9cVwJWXHULBDtneADs0QLF7m7jbw4KMvDeuV1/c5vkqEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMlGvdHVKS1OdkwYAtKjsoyXsZF5wSfjabapKp17nus=;
 b=JNszKXH5fOLBLeJtiZug340Nd4MCeY4KFa93K4h+HuACTvg20XLG+KETLX+3PmD0+S4DndRUFkM3ALG5OvCNqoudvCDR149lmlsrkmw3yNj2AGpoxwNX806b01ze3PGIAP4m4UZdJbRctKMLAgmFssDOHD54XlCqHUYIW4vXgz8ClLZSYvc4fWcmQyntvG+SccpvJla7i2DR/SAkrLNQM5KR66yQ3pLynwXAosPwfAacAKbpe5WlVLC3IaIas2BSaUteP9a6ppKsVzQ4i/5jNxKwfhcxmLwEtRpxj43oU7E37+4RgCrPHmxAnPx2XEbeMRATKbycDHsSnHv1gJwueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB8255.namprd11.prod.outlook.com (2603:10b6:806:252::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 03:31:14 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::5e59:3f96:d8fd:f144%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 03:31:14 +0000
Date: Wed, 7 Feb 2024 03:30:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [RFC] drm/xe/guc: Don't support GuC older GuC 70.x releases
Message-ID: <ZcL5c1TTfCxUckCi@DUT025-TGLU.fm.intel.com>
References: <20240206234103.373364-1-daniele.ceraolospurio@intel.com>
 <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bbb3bc27-73cd-47e4-bdb2-8a12e8aaf2ca@intel.com>
X-ClientProxiedBy: SJ0PR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:334::12) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 882ff5ad-03b8-4457-4040-08dc278d3cce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yd71oIngL0TcwWm5KiK+EODH+JZZ7VUtlWdgsXDGb2Odop+d8+VhcF6rSHFXmZgwMttvqwo164d900BnnKIul02JAzbbyNB3uQp1U8ZC3U4gEQ7DJdKCVA4T6c0t4nT6UCOi0RdaS8MUrljWqucFbxMSx/3WGRwV2sieIAlH1fphfcWnk6tLypkil6vNS/A3Jopxl3MTLxAw70jFi2aXYecSjigaoCI/LkBzQVO4fFJo8ai4ZQyqxf0nbKNxm6V/up1Pbq+WKwwbsW1UqseLYUF70NZwghPAJvuL2Ju1gtVLaGaujxc0xNT76bRPAY63ckK+wkvitic/bqTA9oRYVE9mxStUvrYvpeIPPlLC6SNOBMNvEX2SEmITVWPt177y01x4muANayUCKrqUOKsDPrFSpMqGRyxHwF+mbz0q6aO2le6AB6syh9qc3tfMFpbBIE7IzT2aOPtvVn7j8dHnQaXM6ikUmmyyAQSaBlBSqfN8xC4A5DPey02V82mWs0apiPIuWnxEFbA/SNY4EMIrOFA4/PR3tyYKELXqiPWT2myDTuvI6HZIYDoZGt+TUexF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(6636002)(41300700001)(66899024)(86362001)(4326008)(6862004)(8936002)(8676002)(44832011)(478600001)(107886003)(6486002)(6506007)(6512007)(6666004)(53546011)(5660300002)(26005)(66556008)(66946007)(66476007)(54906003)(316002)(2906002)(83380400001)(82960400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FWiIhrF/LlWzsZGcbJmJ8ITc7+DqAqajBiNBQGWAU7GjLJb3PVZ9KpfyABx0?=
 =?us-ascii?Q?+42nQ98QoVe15qIu6Ib7t0LYjtQ4VIfWGQkCVEWjQsz54KouVakYa9qeMXrx?=
 =?us-ascii?Q?u2DrFcWxRXrAFHCUBj4N5X3ZMl95FOw4fl1ZDaztRi0Q3O0M4Tvcear1vB7F?=
 =?us-ascii?Q?v2Uh4KZSxuN2rvIIXSRc47dDYM8UDW0Dg/f/3/j7erlahH4A929Ee0DXVSNq?=
 =?us-ascii?Q?UGSPT4vUHTaQ6VDzWtbXO+TsxzjTyK/PQJkBhztGQSyUsrZjDvunR60Wa2bQ?=
 =?us-ascii?Q?1zL4M1z9eR68W9Oa+HpZQa6oSf6pD6JNxldA0vC0kERIYm7vUpzKtDgnxsOc?=
 =?us-ascii?Q?GgBUgyHidlBxqOoN+5E3+kfAX8qlKfGaQJ4VMkYrpCpJTSjDG+WyP8V4G0qy?=
 =?us-ascii?Q?fuiZmNZLggp5CiRmeXVoxKdgNl7/bPxoeMnfYfAPgSu3IQBP5deHFz7Ql+BC?=
 =?us-ascii?Q?puAlejbPN7mej8kmPzIzohs8lXy3T3RtVzKEawpqhup9aaPjjKbFjoeduA5x?=
 =?us-ascii?Q?Wi9JwqO6yQnfjxk6ZugIFSN0v01ORXWd2ly1NxhEO/Mn+CxcYSaEnGN+IUaH?=
 =?us-ascii?Q?+wipZ+DeuXZXo/mEZ2qkECWDNXqwDbNtPKYVnm9Wc8Kvh2mubxav3ZJTHbCu?=
 =?us-ascii?Q?lSoJ/SiTjtDTiVV0ClxyFa880AkmE2ce+FJqzUQi5TGvOyIhd12w91bdGeX0?=
 =?us-ascii?Q?K957IgROBB18B+Pb4iCHiaQJMPR/eXNhmceT7+gRNEfRO5MESRWnncIddzMS?=
 =?us-ascii?Q?1kwe6X5nefTD6gHzgEadXzqSqXkMDhAhhggHKuMT63qAbEXlYp7n6aTWA2ds?=
 =?us-ascii?Q?tlrURoqiQ4lLA4Itw0V+lwFEEw2edfOp9AG47wtFEkTbGp1zjscdy/zfzl7F?=
 =?us-ascii?Q?/m/weJmVp9cuBnmb+HveWS82JLnWZsyokN+02tEdMYWrGqdCNVN6n/EiNgCx?=
 =?us-ascii?Q?K9KvGKgEV5DMTmGrccQYRiv6y6NCH+3/MZKwVDSOXlOIM5Cidy1u4hG3SgJ5?=
 =?us-ascii?Q?v7NLs3a1kHfmd/RKjlz9nnKKJ6d93z121uRffyNaKjrcXvC2bwL6+SryKft5?=
 =?us-ascii?Q?ZG5e1GudS9hQUeYN4Zj47oqk5JIBefzPwkKjrYf7/o1rXSG5fSZFqhl0Oe/m?=
 =?us-ascii?Q?evbPagmYRKpCgqN2ERDthD84hhnshwV3OSYKfMa4A0CksLivzd0EYpCMMqFO?=
 =?us-ascii?Q?wBObbcApcvF1WiXkRf7hTdHSBfgXH6xEyJ25HBJnipAKzpfI5D1BUPwgEgA6?=
 =?us-ascii?Q?sTfu7Va0k3qqLRkhCtys0xDWXtDyv5edB1zzZ2WAMGnPy0QQ+zQ3TGrjsCcY?=
 =?us-ascii?Q?vS1EjD7G8aVjLd7yHIdu0cXURyv2hcBBxz4JbLwSH/OppdAO6cV6GlEx2be0?=
 =?us-ascii?Q?k+aIHcoIiwdLtBJFhgSZrM8Lwbwm3Cqiegc0q+rWDOstkFgtlZ8kqMx26T05?=
 =?us-ascii?Q?bWzvEPIvH/Un1wW/WREe5/HEP7+qgrAVE8vjhzqVzeaeZAOOsyNAXEaS7ViB?=
 =?us-ascii?Q?LQoXs88fT8iiHhXyZ72xsIycu4BOguAr1zO4fzykDZj9eyyNT5Ex9B7gKzYc?=
 =?us-ascii?Q?OUm2VTgoOJvwnKws5NUilRaSNngnMRVnEL4yfsxP8g9cb4jmEWnd7ERCe/6G?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 882ff5ad-03b8-4457-4040-08dc278d3cce
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 03:31:14.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCl0qxjG8YRtVOl68scVKlR2Y0EPuojyrpKQ4Vqi41jUJON0KQFP1cG/yoHo9Ji+adpjRNAb/lmGCj0efXUQEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8255
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

On Tue, Feb 06, 2024 at 05:18:50PM -0800, John Harrison wrote:
> On 2/6/2024 15:41, Daniele Ceraolo Spurio wrote:
> > Supporting older GuC versions comes with baggage, both on the coding
> > side (due to interfaces only being available from a certain version
> > onwards) and on the testing side (due to having to make sure the driver
> > works as expected with older GuCs).
> > Since all of our Xe platform are still under force probe, we haven't
> > committed to support any specific GuC version and we therefore don't
> > need to support the older once, which means that we can force a bottom
> > limit to what GuC we accept. This allows us to remove any conditional
> > statements based on older GuC versions and also to approach newer
> > additions knowing that we'll never attempt to load something older
> > than our minimum requirement.
> > 
> > RFC: this patch sets the minimum to the current GuC version (70.19),
> > but that can be moved one way or the other. The main aim here is
> Ideally, this would be bumped every time we update Xe to a newer firmware
> version right up to the point when force probe is lifted. At that point it
> becomes fixed and we have to add the version check support back in for
> future w/a's and features.
> 
> Get's my vote :).
> 

Mine too.

With that:
Acked-by: Matthew Brost <matthew.brost@intel.com>

> John.
> 
> > agreeing to stop supporting very old GuC releases on the newer driver.
> > 
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
> >   drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
> >   2 files changed, 16 insertions(+), 34 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 868208a39829..5e6b27aac495 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -132,15 +132,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
> >   	return flags;
> >   }
> > -#define GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
> > -
> >   static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> >   {
> >   	struct xe_device *xe = guc_to_xe(guc);
> >   	struct xe_gt *gt = guc_to_gt(guc);
> > -	struct xe_uc_fw *uc_fw = &guc->fw;
> > -	struct xe_uc_fw_version *version = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> > -
> >   	u32 flags = 0;
> >   	if (XE_WA(gt, 22012773006))
> > @@ -170,13 +165,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
> >   	if (XE_WA(gt, 1509372804))
> >   		flags |= GUC_WA_RENDER_RST_RC6_EXIT;
> > -	if (XE_WA(gt, 14018913170)) {
> > -		if (GUC_VER(version->major, version->minor, version->patch) >= GUC_VER(70, 7, 0))
> > -			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> > -		else
> > -			drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version expected >= 70.7.0, found %u.%u.%u\n",
> > -				version->major, version->minor, version->patch);
> > -	}
> > +	if (XE_WA(gt, 14018913170))
> > +		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> >   	return flags;
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> > index 4714f2c8d2ba..e5bf59616f3d 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -296,36 +296,28 @@ static void uc_fw_fini(struct drm_device *drm, void *arg)
> >   	xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
> >   }
> > -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
> > +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct uc_css_header *css)
> >   {
> >   	struct xe_gt *gt = uc_fw_to_gt(uc_fw);
> >   	struct xe_uc_fw_version *release = &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
> >   	struct xe_uc_fw_version *compatibility = &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
> >   	xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
> > -	xe_gt_assert(gt, release->major >= 70);
> > -
> > -	if (release->major > 70 || release->minor >= 6) {
> > -		/* v70.6.0 adds CSS header support */
> > -		compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
> > -						 css->submission_version);
> > -		compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
> > -						 css->submission_version);
> > -		compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
> > -						 css->submission_version);
> > -	} else if (release->minor >= 3) {
> > -		/* v70.3.0 introduced v1.1.0 */
> > -		compatibility->major = 1;
> > -		compatibility->minor = 1;
> > -		compatibility->patch = 0;
> > -	} else {
> > -		/* v70.0.0 introduced v1.0.0 */
> > -		compatibility->major = 1;
> > -		compatibility->minor = 0;
> > -		compatibility->patch = 0;
> > +
> > +	/* We don't support GuC releases older than 70.19 */
> > +	if (release->major < 70 || (release->major == 70 && release->minor < 19)) {
> > +		xe_gt_err(gt, "Unsupported GuC v%u.%u! v70.19 or newer is required\n",
> > +			  release->major, release->minor);
> > +		return -EINVAL;
> >   	}
> > +	compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR, css->submission_version);
> > +	compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR, css->submission_version);
> > +	compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->submission_version);
> > +
> >   	uc_fw->private_data_size = css->private_data_size;
> > +
> > +	return 0;
> >   }
> >   int xe_uc_fw_check_version_requirements(struct xe_uc_fw *uc_fw)
> > @@ -424,7 +416,7 @@ static int parse_css_header(struct xe_uc_fw *uc_fw, const void *fw_data, size_t
> >   	release->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH, css->sw_version);
> >   	if (uc_fw->type == XE_UC_FW_TYPE_GUC)
> > -		guc_read_css_info(uc_fw, css);
> > +		return guc_read_css_info(uc_fw, css);
> >   	return 0;
> >   }
> 
