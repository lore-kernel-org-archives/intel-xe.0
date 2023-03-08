Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CB2C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 01:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BE110E14C;
	Wed,  8 Mar 2023 01:11:47 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDF510E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 01:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678237904; x=1709773904;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v4U5J7qIJv+FcpA/njYADsoF8Kvg4nZ4FCXF6tNPkWw=;
 b=EFrRpUX2obJ27N27B07eQO/CgIEr/5LCudfgKx8YxGWxwqwObMlM9t3S
 TKsfieGFqUbZFEiq+EE95LF68BdTQcvgvgn/j+DReSnt8fqZVcGZuZ5gQ
 CprM/uFRHPThDF6QPd5POnCwMnwp7xdKZyYpBtZzkRpGQeEkOlgiTEel8
 nRysLoZ1ShziP5dxY1ClYkxS1bHwL8V8FHptUAQwUeHEPDOJPLFT5DM1Y
 3Ux7+fRT8xIvvkX3c01aeyrkEMVoO9nGwAdajyzYNo9j4zzPKjcL4ei8X
 IggYRDa/uSaUFB5CZo/pukxQu5L6KRaEFplvHCeYiM6z0xT7YZrVT8t04 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="315677084"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="315677084"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676782545"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="676782545"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 17:11:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 17:11:43 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 17:11:43 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 17:11:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azDA3BDylAm0UVi4M0yn+S6nBoqyP4HeXCdqNT1dXuspRjeHWXGFvFjBCCMxrONPGBworYkr95wQyKPtyzoV2iXss3eTNlr+SPoqF/OyYw7IfTqUd8pC6Im8qF7+tNDkfM3nxPaeWGy0da8ftqMWbMOmeKqJO6egWWHmwOFM6wlUYugCJqz/eGwGGRnmgP7w528NJgDdVHaivZhG7srQyiRL0wpwUpWuVx5gjsnDwx3N2y98SZlkhhIMzs6rFRwczC0QRfALmGCtEytSysvU+UpJ3SjveDg5vqwyTYkr67A9UiCT6FZ8hY/dWhQvfzTZK4soNuGgC/5nUgk+5exqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v/xBn7Vg98armWVY42bBVr84yebmV2CtDwQwwxwVhcU=;
 b=QXejg77qhimrZkmStzT4kC7znlpjwwmmU4Ti7rPetK4PwnId6fBdGQv1LU/CrlsVFYgqIC2OPlbr9dL5WhOuoFuUSTjZpfuNSd8DeNJaAhuiFDLBRO8n9AA/8YiZ+NFDnZV+Y6a9H1smdjmcAa234Tjm0MBp2stqJcZCk+alYty9dYp+zfVmLo7/fq0AI6RRtcFB2SoR+bae6QLayi3aXlR71qWIMwgLiCwlhJGr6xEn9ZOuiRWlEmWbnEQCv7ixqLM6GlzMARlpCSpbKbbh3uGH8NkBWsVIjSxKqwJ8M1GB3q6Dq6QvB7J1go65TDcM569TvexrF+Xj5lHhXq4ipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB8021.namprd11.prod.outlook.com (2603:10b6:806:2fd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Wed, 8 Mar
 2023 01:11:41 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 01:11:41 +0000
Date: Tue, 7 Mar 2023 17:11:38 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308011138.6uuj6yucscki7gsg@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230308005509.2975663-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230308005509.2975663-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR02CA0055.namprd02.prod.outlook.com
 (2603:10b6:a03:54::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB8021:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c03f26f-391e-4e53-2eb0-08db1f72130e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IJtddxxuJHT8axGLEk8Hc7bdy5gaode+DqHOT4q/4w/j+yhKSewtdDUNQwzHON/GOGAevbcGh8jqJIpeVPQhc88qIVNZK6HDMWprCns30USmDJ0N3q8HUi8V1k+u9Hey76FWTrFc7tz7pXk5wqRIcKKGxgC3EoJr72266RZUxAyyU4qhXBxPOJnlrNvpB6LWHrNZOvDl/PQWLuyrlFEKQ1lzt1nfRcFl5zmPFXfV0IUYDtVJNfueVdt4/iSUXZ0bkcKSqNDcoi2fq61TVsY/T6R5LQbaqYAdnAOK50g5jqeQ6IvyyAJy06tPJpy5sCcdl/V51iJOjFXj16so0gTJQWd+1J5e4rr2lYSTMbnI0pCLNBfaLJazi1UWDrpfPz31hNuBfsbksVG8CClFSPF11XIdH5FlHcHbzDC0Gj1unP0JQqqJ+EJvkQjne5dwotGIck1wRTLjSc/zwgO/EsZApvyX2tgP2KsBJvpkux6Z/KNTMjhFAWEdWuEcklQ1Iyk62XXmOofkq9/zUdo1fmZDH+t2Z+HSCIACaKxbXROoNgiM//sjo+NMFPXoguJXbI6KAZPhQGSeJ09yKEJQcqLv2TB89gZVl6Ym5wJzkzlNBcdHFUvV6MseVaV9JZ3pQdK12I/+wV4nXR086ytqcfvTyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(366004)(39860400002)(136003)(396003)(451199018)(5660300002)(36756003)(83380400001)(6862004)(66946007)(478600001)(26005)(41300700001)(9686003)(6666004)(6486002)(6512007)(6506007)(66556008)(4326008)(8676002)(66476007)(6636002)(1076003)(186003)(86362001)(38100700002)(8936002)(316002)(2906002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B1SQijUbzUdaEW+KcJdPPRrxydtsbECWex2q4FZSa+AJ/QpdlFT4zdzYR5fR?=
 =?us-ascii?Q?BRbgLmP6zU6ffTKHedlmnuGwuOrk66hzs3uXfardZGeP4tdeyS3A3egVrjCl?=
 =?us-ascii?Q?0KGIG6mC6keCI5X53pHSigkEd437Fa8up4RpN1OUa71/iysZDw602f3ghhaG?=
 =?us-ascii?Q?pQz8QSjOrlu5g2PGYJ1AwOplZn2b8q7XpAltwJoycHLypHpiP1WlC+27uR7d?=
 =?us-ascii?Q?3AJWf7IzaHxmHT25KxNbI/z/AUtwHypnSGdAB/Qub+NWKhKWm2/O38Kp6CJ+?=
 =?us-ascii?Q?5YOElUttVH79TBQgc3BYcFsQrRtfv3njuE30NBmv80q9NER3LUvT4egQJkIA?=
 =?us-ascii?Q?pVElgKQjj8gYTGgjmDVy80EwtouiGd7/6WEGg7EtX0UGwdbdaVKVTk84l8TJ?=
 =?us-ascii?Q?sTjo3JFnFMxJjdI29KQ1MgR0+z7Z23ScfvmBKuKhJDgGRTq67Tl5EQx7I0Mt?=
 =?us-ascii?Q?GkXAD9ABDI632L72vGM3G8Si3FdQmqzyoBEk7LpxBucy4a2rYw88HQNcWUK5?=
 =?us-ascii?Q?9xpztKRYwNBZohi/vpfB1rTueJtBhTthZ8RkS2uGsvm1gZ9/PTKZqQDQ6091?=
 =?us-ascii?Q?felRjp+KpJd3D3Ufv2+bNCCRi/pCtPhAc6/ODA6hCy0bFRV4Wba7JAoFzB0Y?=
 =?us-ascii?Q?HPFO2i0k0HmnB6Xqya7MPCRLrGZ3dTYkp/WQBJMCnJkhaTBvrLJdjyoQHrop?=
 =?us-ascii?Q?BNg2GS1jOM0ZowUwAZtXn7fqfH6pAfY2fB1a24CwfRT4JBH3fWfmIWh2DBSS?=
 =?us-ascii?Q?AXZdthy554VSNYXxDsAqy6jHaUNTUlD1sWEs61yKmk5uJX3bcPdELclzsu/H?=
 =?us-ascii?Q?tQx+TYY24OCOQ5427XuYUCKKSruElU3BQ7+rsBWju/ERS6kvsw54cD+kLgMx?=
 =?us-ascii?Q?OLX+akU3okixpp+E5P7g4yxAK2MhhnE+AnNgk+hX1It+BozixErL9lj/d0Cq?=
 =?us-ascii?Q?s48+vR9S38t7HCs67urIE9o84qfMeyZI+lKWns7NlRVtl2zBIadeEHeIb+4o?=
 =?us-ascii?Q?G7vye9EvBjLYJlfxnwdWFMH8As6s58gxwf6faBIpi3Id6JC1Fv6gfjZCXZaU?=
 =?us-ascii?Q?Qu/4SBLYk30voFwqDTIdaNUl6dF8IWuofIEXqf+45abYB2EzByZkLq+Eqy9F?=
 =?us-ascii?Q?aJjNE24kjWzGDvPzqBLUSffj4e9xRmJ6qm6WDgUbjd8P1gZ96j6yL/sEcuBu?=
 =?us-ascii?Q?emDrDLRs9cWlvBt1jhZEj4uD8/P9CbUVSuQW6IZQ+GPA/Djp8k0VKRcZlwnp?=
 =?us-ascii?Q?TUxmeFlAZlredge0rHIVppSNcOPZnwmz/A6R4+fdsgfLblLY0TYHodRgMMiq?=
 =?us-ascii?Q?BhQbbvp9CkUYyWpf+qrm4K6CbR1AUTGsfN+5/5R+f7snR+GJmjxswCSmfywt?=
 =?us-ascii?Q?A9rM1Bz5/lRPTkNlA7SdfM2wNCw3DwPyb56ao1cOCwFlBcBKry0mMbZ/08e9?=
 =?us-ascii?Q?vZVZyJh1J03oPRcGqnWpthmJSUbdUTp3jvah3BsJBjfdcV+bx0/RJGLGpG7T?=
 =?us-ascii?Q?LF5T8MwnZ5YDLsiuU2AVFM8y8CJY7xDmPUrWNKNfFUzTiIJXuj/smvxP7roK?=
 =?us-ascii?Q?9y8gay4JGw8kBWWkLYEh2FkrIuIUDEdy3EF0/7a/BSqDwAWsS02NNHVh67Ic?=
 =?us-ascii?Q?Sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03f26f-391e-4e53-2eb0-08db1f72130e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 01:11:41.1986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCG1s77mV8r/k74FC1UiX2eOOHWEIKeO9OgP5Mr2sBQmtQI3vCJnW8EFa0bOA2j4H7XMnsp9lKMxSeJF80cLQoh5SofIfpdoZXZRYDaSzts=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8021
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe/guc: Handle regset overflow check
 for entire GT
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

On Tue, Mar 07, 2023 at 04:55:08PM -0800, Matt Roper wrote:
>Checking whether a single engine's register save/restore entries
>overflow the expected/pre-allocated GuC ADS regset area isn't terribly
>useful; we actually want to check whether the combined entries from all
>engines on the GT overflow the regset space.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>


Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc_ads.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index 7a892ff7aba3..fd9911ffeae4 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -482,8 +482,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
> 		}
> 	}
>
>-	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
>-
> 	return count;
> }
>
>@@ -496,6 +494,7 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
> 	u32 addr = xe_bo_ggtt_addr(ads->bo) + regset_offset;
> 	struct iosys_map regset_map = IOSYS_MAP_INIT_OFFSET(ads_to_map(ads),
> 							    regset_offset);
>+	unsigned int regset_used = 0;
>
> 	for_each_hw_engine(hwe, gt, id) {
> 		unsigned int count;
>@@ -521,7 +520,11 @@ static void guc_mmio_reg_state_init(struct xe_guc_ads *ads)
>
> 		addr += count * sizeof(struct guc_mmio_reg);
> 		iosys_map_incr(&regset_map, count * sizeof(struct guc_mmio_reg));
>+
>+		regset_used += count * sizeof(struct guc_mmio_reg);
> 	}
>+
>+	XE_BUG_ON(regset_used > ads->regset_size);
> }
>
> static void guc_um_init_params(struct xe_guc_ads *ads)
>-- 
>2.39.2
>
