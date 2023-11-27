Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE9CC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 14:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DC6F10E2A1;
	Mon, 27 Nov 2023 14:12:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CE510E2A1
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 14:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701094350; x=1732630350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jBOIU7HfUK8W4OqF/et5lhJWGMinV9YFKBKT/82TyPM=;
 b=H4PcKZaRrEwRzvx/FKOzFzTmIHXOWmAa2YO9xc8P77dF61XAEKHVXj22
 sDpq5j6HrjO+RewNczfG40RDy2FnAXgMrOuL+vyT6SmNjQNjMv59E9Fzv
 pihzhLFKpRWp8VNJUCKDujhBMT8puaRn2rhQaeTcfwxjP47X198DPATpp
 RaiygPcV6I5MnpeNnW9wi2ZF0DWGsB5BWln7xrpGcBfgTTdb3mcDFl7CH
 XIss2JWIFWeYF2/r8vex+cJdlGCwhgpTttyPs6CsAE0EfbmvJOCLnFd9V
 6sraCvIVrS5BLKnfyfzkib3WlVX1JILOsEV1MbkHcniEXOuLoVKw5NX7V w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="396613691"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="396613691"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 06:08:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="859070432"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="859070432"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 06:08:21 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 06:08:21 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 06:08:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 06:08:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PBmxPNMr+Ak0pM6reVxTH27rl0APPIhNe8DQZELiA4Vky8EOeIAnJntRBwlX7vC1zz/YjPR15rJCMtWmzs+uNxQhFmxjomQ/dfRn4DJ1jbLrozpHMKtk8pVbMe6KvBT18qdALO2UzndZ49xtLUB5fpQIN4THuUNlz1aPQ2iUGwKUC57Z4DMe9FqQvPFgNRiSYnkwf+hp2446YHOkr/PeQ+HEL6TbNys/fEWaNifGCxh1vUMKp9w7W0XoSVJ4yxD/zRkyfHB74uq/OelICOgjTExwxCLMvd7tUBYZlwGdO5NnUxSr0Bt6id8U9v0nyVxGgbwt8Ky2gpPVi2NL4ZjFjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/t3uHTIUVHBpwOHEoquJa1vUYxCuU91L/STu4pRYaHw=;
 b=WQkboKuyKnKEAyjUXJn1IzJeuQbYDk8ANOMcbWQliwx+g6Mk1jyhRZxtnhXjl2fyPojD2hynNjs+Th20ArraoQo28V1ygi7qvAV0kszi1b3vsyws2lDy+D28qNsFCd2OBzNZrMfuzxzNQFY5Q0LnV59UI7H8/EaCzWH6NUw81SzgSphGlr//gzbR2H21KswIyDWL6Xc8EqG26pgeSL/ue0a4g8wdMsRQCmz2Ldfz0ic6m6VTZ9kD1JieJ7okzyh/Xa0p8qwVc3FIxP6weTYCmEUtGG7X2xTeHYS61uFPXW2lxDkprX1Up2Zsrup3zS7izwVmT4urA3ATedRtuWKX/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SA1PR11MB7697.namprd11.prod.outlook.com (2603:10b6:806:33a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.25; Mon, 27 Nov
 2023 14:08:18 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::3514:49a8:468c:a3d4%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 14:08:18 +0000
Date: Mon, 27 Nov 2023 15:08:11 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Message-ID: <ZWSiy_XVQ1HNywv-@fdugast-desk.home>
References: <20231122143833.7-1-francois.dugast@intel.com>
 <20231122143833.7-13-francois.dugast@intel.com>
 <09a13c69df528c028abaf2c32c8285a65d22c5fb.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <09a13c69df528c028abaf2c32c8285a65d22c5fb.camel@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB7PR02CA0026.eurprd02.prod.outlook.com
 (2603:10a6:10:52::39) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SA1PR11MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b5ab1c-71f4-4650-beb2-08dbef524df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 09HhG4vljhTZZ7/oDlvb3KAXnClikG7GA0bqkde7YqNYMtI2JqFw+SLfxq0BfokOqmf4Xi/KWEMUVQ6qEoEnAlJiRWlgHaeREpyjHk9+S41O+OVkD7gOdgwSPB92Tz274LM6Uue+3X139DTSXUWCqUhZNbgkypNH0y29CJ8lcwWa6QCCfXpFgMvo+KAoZ4dPpImA4DiYGdYEzbIaAZQIq2o7ag5mEMSGkVO+O/qdw3VHHkuQ1rxDVYE/zLtG1TkbGLYLzLUzCnTbGF8QGpzNJbk9UutKJRPZmwRYrCz3Q1jcKSx2COGLE+kGYDgR+GRGXnBTAVcLcNETrF5TRyEIg1wfKgo72vuGMzUnlMXWpNpgV0PZr9bhYqBsEz6Z9gC+4cbloJIgfo/isP3nRKAVBiMHiUH0XFuj84i3LrdxDFhQnOGcsASueKGVJBjqtgW6l4vsK3EUjLmPCvS3JRh/JFEz240/8uQ4Y7hXU+I/0lQHVsJgBxmLfLasNdeRGYD9ZTi/+IIIA7jShvrwU8yB1QNC5aQS+tHQCbIAs9peaIzE3/Zr1z8fDHocqDbYZRU4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(346002)(136003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(316002)(54906003)(6636002)(66556008)(66476007)(66946007)(8676002)(6862004)(4326008)(8936002)(478600001)(6486002)(36756003)(86362001)(44832011)(2906002)(41300700001)(4001150100001)(5660300002)(38100700002)(6666004)(107886003)(6506007)(36916002)(6512007)(83380400001)(9686003)(26005)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DZ0dDwx0uIVjhoY6nGa/uqfFvUKJgzZpZMdC9Qu84MSD5hh1k+cjoJD5UP/1?=
 =?us-ascii?Q?5HzbiF+aN86xKFy4RXNquUvu9Hl9TQzkW68+jFtyE0HRhyQLjRf9KcUIdtRj?=
 =?us-ascii?Q?fkQB6WSwIPEJCAvf+okmL1YqqkLjGyzC8qXR/aFtFEe8DCvnkpcRx3zVx9oD?=
 =?us-ascii?Q?1LnptiWxoTNn+4KTpzllFX2F7ebgwVPwjKaSKlWU3bWUyrTWtubiOBLdWeZq?=
 =?us-ascii?Q?/+Pxu2goLBIHHJFLU23cDP3bXr01Py9O4jP5vtVOQXGUA+lEa3gp3xca3OnW?=
 =?us-ascii?Q?/ik0b7cybtKVFRFzLigxXVC3PsBgW3C3JJVCIv3abCIUz5/ZWha6QJxsSlyU?=
 =?us-ascii?Q?Ovq2fMLSan70+O+g/jYO2kf5H8L9uPODBq8E8DHW96Qew+dePUA+1AYgQUck?=
 =?us-ascii?Q?hNRk6yPaDaQgaag1Q4GM/+kWaUlBMoBOQ//gdH9qispz94D++7zzuwpTJFEL?=
 =?us-ascii?Q?SMQEV8nnu8Qdm7fO2pNRFqq6S5rHg52gLhlheOYw7R/AnpX5yt4feXSnrX3F?=
 =?us-ascii?Q?29HWXdnhbB4GiqKuwAfTSPchtzZPJQJu4LEyfvVpV+TgOZHZL+I8n09jBLqd?=
 =?us-ascii?Q?HtPxDFZfu+g3e7l3Lrw6pe/VryP8+ZnD/N2ZCvR03GLlxWrM30MOSgB+xn3+?=
 =?us-ascii?Q?eqwFNqDXtyYtm+g0nGKCO2xN87gqm+i+0IqxwcXtNFDxLTqWW9vtvs/XWBFT?=
 =?us-ascii?Q?P25ACF2v+FNObx/OzXwjftaOCjy1p42k+b+HN76MYolo0vjSjKTKPB1YxeAp?=
 =?us-ascii?Q?APoTczWlhdOMBgbkkogeFl5XUjqELbsyWr2EPDM4bkLgevbF+x/n+WZut5sN?=
 =?us-ascii?Q?dC++jBZPMYCwc3vjuvVucDU5M7vCOlScCC+ruUeLBPdCOzw62W2xBeS5LMj8?=
 =?us-ascii?Q?5boZWEwXvYxzJDZvpZKW5LeFKr6MpNcc23HAeXPgJVjA5yOhviNDpDAF4x5O?=
 =?us-ascii?Q?8NfRAIgHGJ4qw1mr3yduRtDvkgG4zFBtXZd6AfddmRgIrRNasf+D8ds5mlbo?=
 =?us-ascii?Q?vAhvefYpfGyyA4zsmE93Z/fWWFq/4Ux1j724YpwwYM0isF44fJ2ez0fX5vWA?=
 =?us-ascii?Q?M04W1v6v1IaIJfH+3Dw4XRhrXdhzL1CWn85p5D/GA6BK28uRnHic/ES2TJDB?=
 =?us-ascii?Q?OPz1mI9Qub0iTzsaDF6imiLGkIdy+eSimv9VBWMWi4mVL3h0TJXYxh3dl57U?=
 =?us-ascii?Q?gjHG3LXwKJMKbDdOEyh6p/nuFveb5Z2fhh8g7Y5rl8RnZCjIvgNipgd0Uv9+?=
 =?us-ascii?Q?l9Q3NV+OnC3nJ+kJXrfiVGeGhDXf9h1jD2aEK4JE3jCCeEr3l1WfpxOs2wAR?=
 =?us-ascii?Q?adlVz0qEJdxugWQ4MksT9rNfGwSLt5pGYR6irAROSitbPklhqN+PNwcgTHcn?=
 =?us-ascii?Q?rk3+YJqEdoEkDofo9Mh5OYKg9p/npGfCKfG5XIRNX9+EVOVhZmaZrsx9Mg0k?=
 =?us-ascii?Q?CfcSsSRTsxfO0Y2F42AzywyVSqm4dl2X4e0uHqTQXcqlX62z/7iCF1CekHen?=
 =?us-ascii?Q?NEtb0AS+aquG7Ge6cyUpprdCADpmCRS9G9HdGP0hUmE1LklF4GR9hY8gFNdi?=
 =?us-ascii?Q?5E2eQ6UvmgCTh+Xqt5kgmNUHzmki/IKY8AB31Kerg1nzZmmQA1lFe1SF05N3?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b5ab1c-71f4-4650-beb2-08dbef524df6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 14:08:17.9748 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jf3WZEpzEFrjhGbyrsqAeNsxlFHY7RWWPkm1s10NMQIjAiQMyOcE8ZGZBnoAJTpT/hT0HdPkBPp83joy3CNd2y+YSndRS0ODz8xNoB9XCfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7697
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 12/14] drm/xe/uapi: Add Tile ID
 information to the GT info query
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Nov 24, 2023 at 07:45:04PM +0100, Souza, Jose wrote:
> On Wed, 2023-11-22 at 14:38 +0000, Francois Dugast wrote:
> > From: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > As an information only. So Userspace can use this information
> > and be able to correlate different GTs.
> > 
> > Make API symmetric between Engine and GT info.
> > 
> > There's no need right now to include a tile_query entry
> > since there's no other information that we need from tile
> > that is not already exposed through different queries.
> > 
> > However, this could be added later if we have different Tile
> > information that could matter to userspace. But let's keep
> > the API ready for a direct reference to Tile ID based on
> > the GT entry.
> > 
> > Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_query.c | 1 +
> >  include/uapi/drm/xe_drm.h     | 2 ++
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> > index 77cab66d337f..095f1b8c2290 100644
> > --- a/drivers/gpu/drm/xe/xe_query.c
> > +++ b/drivers/gpu/drm/xe/xe_query.c
> > @@ -376,6 +376,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
> >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MEDIA;
> >  		else
> >  			gt_list->gt_list[id].type = DRM_XE_QUERY_GT_TYPE_MAIN;
> > +		gt_list->gt_list[id].tile_id = gt_to_tile(gt)->id;
> >  		gt_list->gt_list[id].gt_id = gt->info.id;
> >  		gt_list->gt_list[id].reference_clock = gt->info.reference_clock;
> >  		if (!IS_DGFX(xe))
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 4bad84e7793f..b0ef1f62fd99 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -377,6 +377,8 @@ struct drm_xe_gt {
> >  #define DRM_XE_QUERY_GT_TYPE_MEDIA		1
> >  	/** @type: GT type: Main or Media */
> >  	__u16 type;
> > +	/** @tile_id: Tile ID where this GT lives (Information only) */
> > +	__u16 tile_id;
> >  	/** @gt_id: Unique ID of this GT within the PCI Device */
> >  	__u16 gt_id;
> >  	/** @reference_clock: A clock frequency for timestamp */
> 
> change is good but it broke the alignment of a struct that was aligned 

True but this and other misalignments are fix in the next patch of this
series "drm/xe/uapi: Fix various struct padding for 64b alignment".
