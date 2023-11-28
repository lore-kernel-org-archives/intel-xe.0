Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46913C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 21:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D5910E06E;
	Tue, 28 Nov 2023 21:33:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1B510E06E
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 21:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701207204; x=1732743204;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=qzd+YDpUnl1uphRyms4ZIRsAyeeaZacDWz+MzzSZWCk=;
 b=QHWApTPrL4F9p/tQR4tTec28EgN79jyccOD3TQ538eqw/mqub8VKcoMY
 upw1bOAEyaj5Cvxzws/ML3XRClg41kfOXY1f0sFrxBoZsdNg7ofGIgG6o
 aRCRZK2o1qWMNqICzR7wgjgqQ7aXeKE7tzoLfXDCvyOapic8QcotnVSUu
 VNYZI+NaaCqFpiKRuOuut5ggcN7XLyXQjOc9u/bAuXyqC5Wip97EjRvxh
 wIkgzbR9SLupLQDBlJYgzIEZgURw/Qkj076cxayUMOZKDq08IJi+jKcuA
 WwY9LApy9Q95jUvs+WwoZtKdTxiuLDmLUC91cL1I4EtW8fWEXB918s60s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372402766"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="372402766"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 13:33:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768669099"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="768669099"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Nov 2023 13:33:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:33:22 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 28 Nov 2023 13:33:21 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 28 Nov 2023 13:33:21 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 28 Nov 2023 13:33:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HU6FBl29klC9aOzwu6/42j5WdGhvaDSS3GRhuYE1OGQjieTkmhqj2Xo204R59+LnGI15DfMpjlUvH4Vjuo3MXeStPr+F8Ht/k5MCtJTy/LvNmjhfTjWECVwipW1lhD36IdIamEf3AiHmqZN1W2wpw2lx3di3dZXSvPdFXfjO1c8EuJ5jwY14n8tCU41LCWWZtUzQeWUj3V4ImgOJLa0uuJKzznRcKZG+Bu3nCd5rRAGBXmIrAq/k50qKQ886xmz7hFGUWHjsaFcOUbAuCUSeqBAkai8shHCPh0hkhLJzl9KIb3SpaGBBe0+1tfzfl4kSaAXblRx+SbnUHhv9kwqcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTp/XPu2m7kPeqLUf6ITRmrAp5vbgTlI9JtpbSLZrnA=;
 b=QokIw6hVh3nP2tMFzr4E7pOtWd4cuHW85ehGscydDUHU9I+eMY121/OgeDb0+6CtSv5MQAy3DMVXqd6yqyp9I83r3C4DD/RzOZOL9kyzjRASro2IwiX3idGlyzyxPjdB/sdy1psgIgxh/VTDvqdjLIW4PmN2eYk3yFqsuTRwNuDxlTbmaD8iStW2k4cXTCjuHtij7eI4I7OsVH7ijZUR5LtudSm/VhYHfPqBLTVjiol4RpjowPDb6heL7rRdeKbSlkJfVYGk0kQlDLe7UB0SQTzXFfwEspJ1NnQma7AfApm3Yvv8YZ5g4EHE9jSP3nho4YJBqvx5IQutoRKp6sZ5Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5789.namprd11.prod.outlook.com (2603:10b6:a03:424::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Tue, 28 Nov
 2023 21:33:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 21:33:19 +0000
Date: Tue, 28 Nov 2023 16:33:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Message-ID: <ZWZcnBCW3hRUdQKW@intel.com>
References: <20231127222236.68999-1-vinay.belgaumkar@intel.com>
 <20231127222236.68999-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231127222236.68999-4-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: BY5PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5789:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eebd2ba-5cfd-458a-7528-08dbf059a397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5zNUrNVGQ+WeonJMVDuI0PzAlDKsEHFj0dL1Y5EfzRin+Cx5QTqgfxSiZI9eoxm9c3LI5CEagT4kc1cMpcz/RaCCmEO0U5baz7AP7ZxRzvGzHY8YKxtgnlflpmX+27mvKfqbbAUJAH6cSariPKRsLYEaZ9uJIvlRcD8a/MR1VMwqfteodoDnU4Mk1q5SMGxsVtuCiRE2w9VDAJnpWbFjxjFVS4D7x8Lf127XIbmeJZtEv0Ey324AC+jYgweLr9ZGeyIuEaTMqx++L9JCWbgRV9VzpTYzvnweTSNdsrixfNLJUCes0ZjMZv8T9eHYp+3cahhaxF4pSjVpalZvYJhlW2NE7WaK2MiOIX38ewHzRa6JrCqCvLJw3sWDxzDShY4PnYk1BmdBFoHQ2SM3X/92tTzpFM2KDL5NqcQwiJSgDH5QUXbGyJKi69RaHWvIWa0vFHYQzNFxSPDeFe4gxM1aVra9AssJpv+as7NkwN3alVFmwBCEWXN0J7Bo+5EwKyzPZVGHQBoO7m94MN2oyc03eywyKZMptwTo9HnmJjwb3Xwr0c+Fa8cq96Y8aWs7v1rIqhISuBsds5RhIClf67lTLgehGCBCKXcRfYpRNKD5uLbVC+pkkqPSd0aUsgqR4ZS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(230173577357003)(230273577357003)(451199024)(64100799003)(186009)(1800799012)(6666004)(8936002)(6862004)(4326008)(8676002)(6512007)(6506007)(66556008)(66476007)(37006003)(316002)(6636002)(478600001)(6486002)(66946007)(38100700002)(41300700001)(36756003)(86362001)(44832011)(26005)(2616005)(2906002)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ee6uV4v/FdJ+3ngeaqvQtTSh6uS3Cc94OCzmLtnD3oYjsRAlc/HSDwZrtKBH?=
 =?us-ascii?Q?5fPtGRjwtQLlrh44miIwgve3Tu7W62DtG3yltQ6HU6ejxy1GaKlQ8NQm43Br?=
 =?us-ascii?Q?guhivexeVRUTIHl4DZAnfVVrnR3Wf/ePE9+ob0fnN+KMEgjpaDe47kvjrZg+?=
 =?us-ascii?Q?ZF0J3tWTPTVVztFLt/4UQOxn8obHnvcN1qPQkv73D6bAsyaMjYJ0gYeeVu3E?=
 =?us-ascii?Q?hB8NFQo8jxVf+z+bzXyYZ/aSjZU43ZoSNdEAYjy+ILIgg5NmCo/VdP3D+mGC?=
 =?us-ascii?Q?vA7Ib0bKKEcVu6dzikBN5b2Sa+P4m4/XP51ww7R1UYal70VMrF4C1/sAEkdd?=
 =?us-ascii?Q?/hyVTkFic1IzFe4XpgkjMtdX1T4ttFAm2037kHMHtaM2QztEex7GMQk24WJ/?=
 =?us-ascii?Q?yUtOBMALmYGR0NN1VWdOVd23LZj3jReHSZM2UkEGyuU72oAIkqWcja2l7N7p?=
 =?us-ascii?Q?UmR8pieZ8mJnGKgMAnTRQhOQwvMaZ/bEndQX5gmCGugnaErNQrx2Jd7WBBXf?=
 =?us-ascii?Q?NRVc+x2qxAj1FTiWPBl9iJQ7z0KSHHMonasBNw9X/DrFAioWlGXQ6O20dEG6?=
 =?us-ascii?Q?VYULpFB0TejNIykauXkDg5eReGM7vr0R+ZcY1Ulh4P/t3of2Ij7AVE4nhJlb?=
 =?us-ascii?Q?pnG5e2RpJjoLFqli0ZAdxY1k+SseIqkgL8YCfN7UURq3s0phGsfOqPTMTYkD?=
 =?us-ascii?Q?KVGyBNKvaHIHm0roNVLHPcYpygABUSk5y7q3vySyI7R8NiU1JQZeYv1YX1re?=
 =?us-ascii?Q?V8cjAHmd3tw6WONl2g5iDgqaPHVUBfpS9wTgwr0hRu/SSf0R0i2ecbQiCa1O?=
 =?us-ascii?Q?ATaO2DWuL3Wq7JoNBmldzWT/TfKxps+pN0sDrn3ZUJ1y/XTKWXE8cCxAuSfS?=
 =?us-ascii?Q?3gWDUBHOAkhoIPoKb4UdmsqJJI5BrZ+iSryu9+sDhDCjqAamHlhJZq/GXGvK?=
 =?us-ascii?Q?YDBE8sHqVvfYkncuGyRJTVGd9NYIbaQieBF3VB8gQcAYWjlnNa3zMjJ7WqXK?=
 =?us-ascii?Q?8nSp9lnqPUQqMJXOAXwUVEwZqCHQyowt4IkK97rsk6+0OOOWmovVeqUNnjxp?=
 =?us-ascii?Q?mVfx0XjEhBnZBiEUNuyfPMW6Dd3PipmyC0vO428ZmG5CHAZwjTNE9x4VHZel?=
 =?us-ascii?Q?hLFKhBPgEvN6KFLgx2I61lAtxSjJsBjWnTAEc6Qzke58HdLPpGO82fCUpRSI?=
 =?us-ascii?Q?Tk1KodMMEUulPXpDm5HsvgQoznm5GOYNvhIMiNRPf6qndqOFB8Z2sExEsvkQ?=
 =?us-ascii?Q?hKkGwNQs0NXG8oGBwtAGZJ6yG7Ynt3c/sD0ay5I5V27T744gmvu7OHQCBfGg?=
 =?us-ascii?Q?PxtdaeFJ1O4msNOyUnAb6MyN5nepOmcYUhxAJAwO2C1me6F5LHOPCg+BnNMj?=
 =?us-ascii?Q?T3arEpRhTEcPGDyfm+wK3lSJ31qUvTjkBYAAJzZJWUQDiKRBnoLHCzyYWGiC?=
 =?us-ascii?Q?bF17zpZtznNfP+giM6bgehUnUP6k6oo22zj2Mp4U8eXA+vcf8WJ8INy9912o?=
 =?us-ascii?Q?QzWOpaMwMc+H3f0UjMkH91nL7dTZUnjA2TTxVVYDd0EmoU92HW+ZFTR9T9ul?=
 =?us-ascii?Q?nIUeOqBMZKdCAQCmCtK15f+sQg/ypAUPCi++CtStbncDOoYCROGJWb321N6/?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eebd2ba-5cfd-458a-7528-08dbf059a397
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 21:33:19.3179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFn2pZtsWqq85xezbYuYWRyqpcjCB+zT/nspVllUj098gQNW5TxI4Ger/cB0lrmRbnWRG+2MSQmTXbfN11lWrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5789
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Manually setup C6 when
 skip_guc_pc is set
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

On Mon, Nov 27, 2023 at 02:22:36PM -0800, Vinay Belgaumkar wrote:
> Skip the init/start/stop GuC PC functions and toggle C6 using
> register writes instead. Also request max possible frequency
> as dynamic freq management is disabled.
> 
> v2: Fix compile warning
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_gt_idle.c      | 24 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++++
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 35 +++++++++++++++++++++++++---
>  4 files changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index cc27fe8fc363..71eb6b8c8e15 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -269,7 +269,11 @@
>  #define   RPSWCTL_ENABLE			REG_FIELD_PREP(RPSWCTL_MASK, 2)
>  #define   RPSWCTL_DISABLE			REG_FIELD_PREP(RPSWCTL_MASK, 0)
>  #define RC_CONTROL				XE_REG(0xa090)
> +#define   RC_CTL_HW_ENABLE			REG_BIT(31)
> +#define   RC_CTL_TO_MODE			REG_BIT(28)
> +#define   RC_CTL_RC6_ENABLE			REG_BIT(18)
>  #define RC_STATE				XE_REG(0xa094)
> +#define RC_IDLE_HYSTERSIS			XE_REG(0xa0ac)
>  
>  #define PMINTRMSK				XE_REG(0xa168)
>  #define   PMINTR_DISABLE_REDIRECT_TO_GUC	REG_BIT(31)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index e5b7e5d38e76..9358f7336889 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -10,6 +10,8 @@
>  #include "xe_gt_idle.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_guc_pc.h"
> +#include "regs/xe_gt_regs.h"
> +#include "xe_mmio.h"
>  
>  /**
>   * DOC: Xe GT Idle
> @@ -166,3 +168,25 @@ void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
>  			 __func__, err);
>  }
> +
> +void xe_gt_idle_enable_c6(struct xe_gt *gt)
> +{
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
> +
> +	/* Units of 1280 ns for a total of 5s */
> +	xe_mmio_write32(gt, RC_IDLE_HYSTERSIS, 0x3B9ACA);
> +	/* Enable RC6 */
> +	xe_mmio_write32(gt, RC_CONTROL,
> +			RC_CTL_HW_ENABLE | RC_CTL_TO_MODE | RC_CTL_RC6_ENABLE);
> +}
> +
> +void xe_gt_idle_disable_c6(struct xe_gt *gt)
> +{
> +	xe_device_assert_mem_access(gt_to_xe(gt));
> +	xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +
> +	xe_mmio_write32(gt, PG_ENABLE, 0);
> +	xe_mmio_write32(gt, RC_CONTROL, 0);
> +	xe_mmio_write32(gt, RC_STATE, 0);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
> index 9b36bf7db3a7..69280fd16b03 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
> @@ -8,6 +8,10 @@
>  
>  #include "xe_gt_idle_types.h"
>  
> +struct xe_gt;
> +
>  void xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
> +void xe_gt_idle_enable_c6(struct xe_gt *gt);
> +void xe_gt_idle_disable_c6(struct xe_gt *gt);
>  
>  #endif /* _XE_GT_IDLE_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index e9dd6c3d750b..8fb4cda7b54b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -14,6 +14,7 @@
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_idle.h"
>  #include "xe_gt_sysfs.h"
>  #include "xe_gt_types.h"
>  #include "xe_guc_ct.h"
> @@ -867,13 +868,24 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> -	memset(pc->bo->vmap.vaddr, 0, size);
> -	slpc_shared_data_write(pc, header.size, size);
> -
>  	ret = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>  	if (ret)
>  		goto out_fail_force_wake;
>  
> +	if (xe->info.skip_guc_pc) {
> +		if (xe->info.platform != XE_PVC)
> +			xe_gt_idle_enable_c6(gt);
> +
> +		/* Request max possible since dynamic freq mgmt is not enabled */
> +		pc_set_cur_freq(pc, UINT_MAX);
> +
> +		ret = 0;
> +		goto out;
> +	}
> +
> +	memset(pc->bo->vmap.vaddr, 0, size);
> +	slpc_shared_data_write(pc, header.size, size);
> +
>  	ret = pc_action_reset(pc);
>  	if (ret)
>  		goto out;
> @@ -909,10 +921,17 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   */
>  int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  {
> +	struct xe_device *xe = pc_to_xe(pc);
>  	int ret;
>  
>  	xe_device_mem_access_get(pc_to_xe(pc));
>  
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +		ret = 0;
> +		goto out;
> +	}
> +
>  	mutex_lock(&pc->freq_lock);
>  	pc->freq_ready = false;
>  	mutex_unlock(&pc->freq_lock);
> @@ -933,6 +952,13 @@ int xe_guc_pc_stop(struct xe_guc_pc *pc)
>  
>  void xe_guc_pc_fini(struct xe_guc_pc *pc)
>  {
> +	struct xe_device *xe = pc_to_xe(pc);
> +
> +	if (xe->info.skip_guc_pc) {
> +		xe_gt_idle_disable_c6(pc_to_gt(pc));
> +		return;
> +	}
> +
>  	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  	sysfs_remove_files(pc_to_gt(pc)->sysfs, pc_attrs);
> @@ -953,6 +979,9 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>  	u32 size = PAGE_ALIGN(sizeof(struct slpc_shared_data));
>  	int err;
>  
> +	if (xe->info.skip_guc_pc)
> +		return 0;
> +
>  	mutex_init(&pc->freq_lock);
>  
>  	bo = xe_bo_create_pin_map(xe, tile, NULL, size,
> -- 
> 2.38.1
> 
