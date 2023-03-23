Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B852AC74A5B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 16:39:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EB410E473;
	Thu, 23 Mar 2023 16:39:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831CC10E473
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 16:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679589575; x=1711125575;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lU4akALZ9VkxYc7y1HAapemqQsHgRA9kGGluZOzDRcc=;
 b=iG+6GTLEHVWAJvFNJrXGhFv2e7b4Fb0+/4mmJ70QnR0c/MwCBsTf1TCk
 uQvovxitpYSXJnE9fe1QtCmiMDcV8Vni2X8xoiagdACgyLCyyeDDd0N4B
 /M8WcSB3alo1uJFRv+jZFWEsS3YYUmcXmsu6LvDJJvzYLn+CEp2j3S6XM
 dZPZ5v3aC3OnwVN+oHYp3oCGof8Fv8zsuwa70b7nUxcGgbW1YVY4G9p83
 GZWavwDq0PpVE6TCpe15gu2DUdUxNnfmEeKwhopZWd8pi89TVJMaBUVUL
 ky5vhsRTuA0+Cq3HFG2YeLhbiax/4fp3Hcq7AY8UkoR9ISH7XI+NOU3mf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="337056418"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="337056418"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 09:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806326972"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; d="scan'208";a="806326972"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 09:39:33 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 09:39:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 09:39:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 09:39:32 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 09:39:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGBWopdt2MFtNas2/gbilmkBiXp4WOsdCO819Y9B5CXhHxM/sMKTTImFvNYFML+emCpYdkL6UA1S5aN9tEUYhDyP7Yk3GictXp1J9MZzqlgpb303FCrudmMGa5N05aQb5ipGUZhWT9JrJidvHEFwBnpwoNZ8i4cILlLTItvjIkq08dtK0Fp/mNoOhM8A14OPa+OEDoIsDtzPT+nkGj+9fN2bNBpM86yYzLL3sLARh34Eay9cP6S+K6JAFjKzBv84x8CP3Um5e7VIqox+kQJG8xDcOtg45VIB6c/NtipMHd6O+H/f2RINQReQeXcZZ3mKbz15kamnELpbHvKIs0WZ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5LAM4/mp4k0kE2SSqq8rgTKHb9eWcXUZ/2KEW5NPUo=;
 b=KuOBDgvM7neo0hBSxfxz+h2ZsM4CwkNTNP2ShtfeXE0ZhqwcoCBbr6zeqSc79J6warNl6gVo5FLzu8tV6rSTx6ZpLmUORK+5n4GbCtNvnI8zXE8B+8Ca8mGFqXsnzkcLm/gZ3785fnJdBcwlG75fX4a5nAsrdVKJQo7KF4tfuK76j83C8vChd9fZaMjCh0vMymiwURMTwh7A6w3Pv6Gc7Xne/k+MuVlZBASwLme8Y5lvod3llsOTAs0zIIxup38pKln2mTt0uuILZijZ8SGa4qrkzDZ+ZhAP3VNsTEwjOtZg6StK4li6EUraAN+jeUAmZZ8jefij9QBZR33bykpqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS7PR11MB6295.namprd11.prod.outlook.com (2603:10b6:8:95::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 16:39:30 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::fc88:c65f:4ef5:c3da%5]) with mapi id 15.20.6178.037; Thu, 23 Mar 2023
 16:39:30 +0000
Date: Thu, 23 Mar 2023 16:38:45 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZByAlark5E03P3re@DUT025-TGLU.fm.intel.com>
References: <20230323162725.1100545-1-matthew.brost@intel.com>
 <4bb3ddc7-74c8-cf41-1197-653f13902d01@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4bb3ddc7-74c8-cf41-1197-653f13902d01@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS7PR11MB6295:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b46477a-a6ed-4092-a67d-08db2bbd2c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7lExph3J26Oa1Ht8cNnCvcORWbAmHfBhqdfZz4tYirYa0Zohh1aQyBZHBLW/1URrZaG7M0a0TeHJNEwE/lBVTOF5f3HSHafmCGvCDZiwZMW5fe2mvq8pDkjWJzvYXliFSjpTDtJ9zi0hktuJAd6ESuuD1CvGHO2hYEs3zlqYcU2SXQV8FpA4zqdFWxOBdME8M6n0v0C1ZTYXzgXajQBAKCEyKkEm4Yik/oonBNXseGqo8GKmQj6pr6qOWPsH0+89ofOMuap0VsWnJJgK6haQ8kvqDXo1F54H6/1BRhr6mOodOE5+xRmxMszSCRpLx04HM11fl3xGh/AheKE0hHNZ6uuCEh/M3Dlxk2IOXwCL23QVOKV+vSUDHic8wIhR9VexluoabIGHSMA44wWRrZABUfiRiquPW9U4CrN0laKyrsFLPEEq2uAzbgvUvBFOKtuzmsH/IXESFyqFCGCSHcSYKcZbYnDmBgJSFgaJyPvSRDJ32Pkt2U5Z8xfVLUlmnXNO8CB0++VwW2fpRXHpOFobeYKdMme3TmH0CdXUnUoLrKOsMYdzAGiz3AtN/BIrq6SHmzEhjP/2hOkftsJCE4+SKqOSMlDIeUY+Sr1Vb4zn+qG5eK+PE4vLI+yyXvCNC7RkXvPOW0qZ+8uvQpO22jmoJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(39860400002)(366004)(396003)(376002)(451199018)(44832011)(41300700001)(8676002)(5660300002)(66556008)(4326008)(66946007)(66476007)(8936002)(6916009)(6486002)(316002)(478600001)(2906002)(6666004)(53546011)(186003)(6506007)(6512007)(26005)(82960400001)(66574015)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?TORMVQTEv4TQPnPkLwSUsd3OQMGQLl4qIXaJzTgut/CiA6TLi0B4KRyMA8?=
 =?iso-8859-1?Q?dtqTRsVgSyS03M9kkH2r6yRWZ1ZuPXQ21d9iocCBlU31N+KbbTr2SxK8zU?=
 =?iso-8859-1?Q?i4nHNCVWFXcCh+Zw5rwGCoY+0HrjRV6THOWeglwtgprRDxqW2FWsOYB5Yw?=
 =?iso-8859-1?Q?hOlU0qKPLfTNhaNGV7ynduXr59X+s4WQbn5yP59iHhuWuE+HYDUmAcs8Vk?=
 =?iso-8859-1?Q?FyDE2aiIq3rtFiyuY43Oxew4O844E96+VUYKR/AuNK6WgSjFV2I+kSdlBU?=
 =?iso-8859-1?Q?EeodmAO/jJeeoC9l2LeRHjdzfhsY5H7ye4hsZ53xlvLWMXte9ihA0f7lf0?=
 =?iso-8859-1?Q?sUSNE1rooXdsp/AjiT8dFw7kKTctBfRRXxndMTHGBfD6+vhWrhn/729GYA?=
 =?iso-8859-1?Q?+2HK7GTvmDoXC2jthkyxWqBxs+o2WaCuA1Gjz8ZU7VWyi0JD3KTLwktNLn?=
 =?iso-8859-1?Q?CufCggtuLMO5yQS3V4dHkL1LAg3JFVT8Bu17vjY1QP9+8nEs35XHPBkmmJ?=
 =?iso-8859-1?Q?xhjCQ6jOV73co9e9VyG4ybWJAtAnpy4C+QLir4aYDQxI5GxlDwcRq67ohH?=
 =?iso-8859-1?Q?MP0LEynLoT2/3HP7FHWpLGuziFdAMGpkHK8Jz2V5mQYdN4poUOerJHmBiF?=
 =?iso-8859-1?Q?cLB4fkSfm4xKJ123jVYRPpjaEIm6EArN6L3PKJ8/qv1JcjJHTBmj1klkfR?=
 =?iso-8859-1?Q?TzWTDgIGxo/vb8xoLqdoc/3rHUJQX4ye5IEDN7/avR0FxR+r9Y4l0BQhSo?=
 =?iso-8859-1?Q?JJCbY0xmdQUotjZIJW784ElkU7Ud4CZZolQcTXDPpdWUG6B2ag+NfG2sjl?=
 =?iso-8859-1?Q?xK2zqeykLAf3Zvm4GMdS7LrttTlds5kyRKuXAjsXJoNMPy+PQAIP88/VII?=
 =?iso-8859-1?Q?glkYUMf05vXUjCaSzuSdeKiY49CYKJmHwLtjAGga2RtVaspyvWbHBcoGgd?=
 =?iso-8859-1?Q?QuET2nuZNwXkfMwz5Czwg6ppZZtAnQ3jeVXGwetgaGYTockeFz3w2FJZd3?=
 =?iso-8859-1?Q?wKZ85dns5MXTZsVqsMCI6YkBHxa4BJ3/fUpFoN+NOYwsjkqfYG1nZmSoeK?=
 =?iso-8859-1?Q?6/I8EJ5Ap9SR4pC+F98hUmYG0sEzcsaKvJNvjCLL8imU5H1GXlLeo6AUrQ?=
 =?iso-8859-1?Q?VotJZqCgbxUY1uc3D7SwMg/Gn9e/anw89umHRCKwyLFo7yJDdpzFX1/S8N?=
 =?iso-8859-1?Q?TgrlgR1SXxB7Z3opZAoxaVkFdG0Mxzh9EWuANwIOmRcZXel6wjfFFgoOQL?=
 =?iso-8859-1?Q?GNcyTuUL/AQs9NVekwQnM2gqNymB9x2/jjOhZv71/JBd39qYoD2IVmJ5ES?=
 =?iso-8859-1?Q?aG5FXKE/Hlu+dGW0B0m3emxyeN7Qorv6bm46Ag0cGk0tEngk7kURrVrZ4a?=
 =?iso-8859-1?Q?jf6e5tyzi27UYEiDgE3AUzOQ7R8zJu7iQVefJq3/BClipEPqZo33vzt8L0?=
 =?iso-8859-1?Q?98JHH5kQcv+tEuSyrKyaFwlDMbIyGowrYEbfpp5z78NyFEIZr8cFXuZNhh?=
 =?iso-8859-1?Q?WbLuuS/ihlwRFZKu+9W6s45g+Vdzn+qwCZaINQNWqzS9liQ1LtEnjVGacG?=
 =?iso-8859-1?Q?X3DUV7BZDf59oSgEdnRAs29a2SB2Qls6AbU5WonO5E2oTxUg1s7C1ofsAD?=
 =?iso-8859-1?Q?fh7E9/sVxgHYVm4SvtNNIPfj/cycW/AmxNR4mqHp1L3WMiW0/TeyaBmg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b46477a-a6ed-4092-a67d-08db2bbd2c73
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 16:39:29.9053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKE0PV/gD/KXuipNIYTi4cydVlHQt44EW4M7ntr/0T8jq17eenzXVfkS/nkL4yzykZnbIxpcGzowtVsGMeilsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6295
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Use BO's GT to determine
 dma_offset when programming PTEs
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 05:35:45PM +0100, Thomas Hellström wrote:
> 
> On 3/23/23 17:27, Matthew Brost wrote:
> > Rather than using the passed in GT, use the BO's GT determine dma_offset
> > when programming PTEs as these two GT's could differ (i.e. mapping a BO
> > from a remote GT). The BO's GT is correct GT to use as this where BO
> > resides, while the passed in GT is where the mapping is created.
> > 
> > v2:
> >    (Thomas)      - Kernel doc, extra new line
> >    (CI)          - Rebase to tip
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 13 +++++++++++++
> >   drivers/gpu/drm/xe/xe_bo.h |  2 ++
> >   drivers/gpu/drm/xe/xe_pt.c |  4 +++-
> >   3 files changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index ab9cd9286f77..3ccc59a372aa 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -79,6 +79,19 @@ mem_type_to_gt(struct xe_device *xe, u32 mem_type)
> >   	return xe_device_get_gt(xe, mem_type == XE_PL_STOLEN ? 0 : (mem_type - XE_PL_VRAM0));
> >   }
> > +/**
> > + * xe_bo_to_gt - Get a GT from a BO's memory location
> 
> Nit: Should have brackets: xe_bo_to_gt()
> 

Yea, will fix before pushing.

> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>

Thanks for the review, will push once CI comes back.

Matt

> 
> > + * @bo: The buffer object
> > + *
> > + * Get a GT from a BO's memory location, should be called on BOs in VRAM only.
> > + *
> > + * Return: xe_gt object which is closest to the BO
> > + */
> > +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo)
> > +{
> > +	return mem_type_to_gt(xe_bo_device(bo), bo->ttm.resource->mem_type);
> > +}
> > +
> >   static void try_add_system(struct xe_bo *bo, struct ttm_place *places,
> >   			   u32 bo_flags, u32 *c)
> >   {
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index f841e74cd417..486703815949 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -105,6 +105,8 @@ struct xe_bo *xe_bo_create_from_data(struct xe_device *xe, struct xe_gt *gt,
> >   int xe_bo_placement_for_flags(struct xe_device *xe, struct xe_bo *bo,
> >   			      u32 bo_flags);
> > +struct xe_gt *xe_bo_to_gt(struct xe_bo *bo);
> > +
> >   static inline struct xe_bo *ttm_to_xe_bo(const struct ttm_buffer_object *bo)
> >   {
> >   	return container_of(bo, struct xe_bo, ttm);
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index dfd97b0ec42a..6b2943efcdbc 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -759,10 +759,12 @@ xe_pt_stage_bind(struct xe_gt *gt, struct xe_vma *vma,
> >   	int ret;
> >   	if (is_vram) {
> > +		struct xe_gt *bo_gt = xe_bo_to_gt(bo);
> > +
> >   		xe_walk.default_pte = GEN12_PPGTT_PTE_LM;
> >   		if (vma && vma->use_atomic_access_pte_bit)
> >   			xe_walk.default_pte |= GEN12_USM_PPGTT_PTE_AE;
> > -		xe_walk.dma_offset = gt->mem.vram.io_start -
> > +		xe_walk.dma_offset = bo_gt->mem.vram.io_start -
> >   			gt_to_xe(gt)->mem.vram.io_start;
> >   		xe_walk.cache = XE_CACHE_WB;
> >   	} else {
