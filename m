Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA1EC27C53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Aug 2023 23:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD65D10E03C;
	Wed, 16 Aug 2023 23:10:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CFA10E03C
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Aug 2023 23:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692227404; x=1723763404;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=s3Z3WwvOCn6muR5MLNtbrnX+SdpjHnYuRhxLm0QzKvc=;
 b=XH7pVw24+328EVtx9jmVhahEIr1I+37HcKcFddalul/is3l5CZk7nEnv
 sxZBBAMs6JcWDElGNBFkJILR6PGzyk5aibeygPXcmTcUExRZmoeAYXPxu
 d7B7XfsHcusr4mXeuA3L+DRxXjetQkGGkdWKOfJCZhZpJsjfIgJRPxvpL
 KRigom7QlB2Mm89rGt3rzVv9WUPaouYM2kRgxPguSs6ZYanKn0CXIgvhd
 dOs27Y8cfHYoCd6FSW5rCrtr5t4BwaSxG6SxBdFslJBnqqaf+RMjBFJTV
 WnNi1E1z9Rvq+ZgsXjN2fCKn3P+bbVvSnDfCqujEdV8FTJuX8bZpZ8/TE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="362813453"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="362813453"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 16:10:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="908169986"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; d="scan'208";a="908169986"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 16 Aug 2023 16:10:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 16:10:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 16:10:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 16 Aug 2023 16:10:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJE5fvMnDhDta44/QDAcE1utSqpYcqvaiM2Wd/a/gJcSUa5/uD2c5isGp3h/5N2dPEOwdNKZJnGxQFhkNkxAwwi4Z9xMdF4HzvYqgT0FfAGrFVgu0WNIZKkT+L32ExA4bPObtI/B1OH0KBoRZNjDC4xhlDTrjRlqyyLijiQQcKwaZCdEcB8GDF2nqmH6M2VrPMMesBHaz0gfo3CVnXBNhsliyOwN2kIwyLz1CDDClheF4a1vn9Kyoe3SMhDFKg6ygta5yDbS/Zrnl0X59kUxrIUMzkGTpO0NShgKwyuhm0dCXRNuxDYyHXSXbcr7IemsY2NQIiPBSmCy7qYaLhFD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YK2jkZkYeNEYmv9pZu30ZiIFDi1cjPUzP+TMGUFXBQ4=;
 b=Qyd9NvI8ix+zbfYPvNgdmBCgzTQRlsk6mcPxoGk4k1jtGzzh2DI74/quWrAD8y2KAppMqK6WcYWQKDBqaX2DV9vV7TbM3gQjHgqL3lQsIgBFnDvvX6juVHaEB5RL3I4eqlsduTksGaZcq6WkACiGCWQJRAMs0BjC8yiCKvW72nDbvZVoljHe5pEQQyd5De96H3eJrwkt2fr0N9SFSDqWRQ9HiF+Onvgibznmv450VxfU4/Q6/pdBpyZae3rlkvwkOrFpUqw65Uj9cjXYatdtpPETYrZCrMIePcM7/FjeKJVpyP6Rw+cFdvHIqIpJRU4abu1A91M7rqW9B30Ax6cX3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SA3PR11MB7609.namprd11.prod.outlook.com (2603:10b6:806:319::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 23:10:01 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6678.025; Wed, 16 Aug 2023
 23:10:01 +0000
Date: Wed, 16 Aug 2023 16:09:58 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <20230816230958.GZ3375865@mdroper-desk1.amr.corp.intel.com>
References: <20230816180425.1481448-1-daniele.ceraolospurio@intel.com>
 <20230816180425.1481448-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230816180425.1481448-6-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SA3PR11MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 35512697-b16d-43ed-7a64-08db9eadeb03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HYsEHS0sCLf+eTyuTbY+Rzj8HoW6A+rLLMDcavKmguvnFgn4hnRsTAlr7SQ+fi3GII9HnqHcVoZpZXm1hX7yo5A5F1mp4LGlpkSR/cEOQ8LpiqEtjM/g18jvY5iE9JA8qis7ShH+r+3Y+dw4EtsUerpclp5v7Yp/kh1PC5Q/UHbRvnzjwrKQyyaLDq2b5qcAzpQ345q5iJ+FUJ4673LuTMW4qWRU3/GPUwmFAcvKI38mVlAIKs1JjDweFJDeB2+ic3b/7Ow2hkG+Z/b3/Wmgjw7o9eKCtnc1Atk1VeUebulPpsuAbCQOxkbMRRg8u1tGqAL+af4Vxd8Uv4Dnmu0Gzz1c8VLs6stx/CfMwT2WTfxVgKni0WVsipGYpCxgpm/KruXYB05v5LHxg8aEv+opSO5Yt7qM/RxWyyLSk0Uf9O4wzf4jLFaBdXftrz4/2Xb93d1jOxBzcDz9TlwpIwDbZ1YyV4j0dMEfcj3tNgv73LL4hDDeYfDPfU/xGcBRwcdWDp8v1KviebvDXz37oWwyzYllyLvJmO44B9/rnSOobI7H1YXNDY6p7mo31LM6nJ9+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(6636002)(66556008)(66946007)(66476007)(5660300002)(41300700001)(38100700002)(8676002)(6862004)(4326008)(8936002)(82960400001)(2906002)(26005)(478600001)(86362001)(6512007)(33656002)(6506007)(6666004)(1076003)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l0eaCkU+4IUG4TSi+YPZ0pOMBihOsJzB4zXNunNTZ1dyCsdQtG+ZAmuBmhOL?=
 =?us-ascii?Q?aLg+4H71LOFvx+hTSnT+cP+VhJ7DAZIoUViWch+M2C9pwhzSST3DHRPEBjea?=
 =?us-ascii?Q?EAAHRpH0yECk8S9gBY1cepJkWVEC2B+HtmXqI+7Wv6NMjXPjVlA1wj0TaK2/?=
 =?us-ascii?Q?acqOzGeT0EDNC5ZxvxphZfIRLFYVmHcBG0pCqjTYrZOg2C8y9IQrI/ym5S6D?=
 =?us-ascii?Q?hFP0cg8rmN2QTdH9pwQR2kLNWVmudn+mqSoPmm9wBmwniQrvhBqXOiLhv+9+?=
 =?us-ascii?Q?QHi4a9keCl4Eok7NczCyeTf7+BByfGgYe8Gv3sgpUK48ebG4yCVeT3e/cfxS?=
 =?us-ascii?Q?eAonyAVJddpdFoTbjwXT+REZJRUZceT+GEGvJNEQ5jdt5DFBfIgodJxpMv5f?=
 =?us-ascii?Q?q3QLtkRkOft1L5Z80yQ/BUebFL7/0EAVVLAomaTXaRCCXVl/kzbtjpmA0neh?=
 =?us-ascii?Q?nNjEGYdubtd2OkioAJ+1bDB1Advwqq58irS+k8mY7VvPVUSTQ32pttR2cPlG?=
 =?us-ascii?Q?9ufMpyoGCTDDswTJ6MA3OtMP53cDdzhW7mEfJCc/1KBtL6qAHCGE5pT7Ax1t?=
 =?us-ascii?Q?edl3I4dfiAZxubvP3CN4JV20xTPWbTECANpQROcH9csYdgjltRqcR57qLIIg?=
 =?us-ascii?Q?OBg0vu/H6EWSo10Jprm8O2/c6Hwb79MimQJxfAT7akwmPvKv96XorNUxQE2U?=
 =?us-ascii?Q?CgpHN5Vx9oyWWLp2tA5vcXOdgPrHRgD5uU39VKIaUmEG6lsp0niALMF/a494?=
 =?us-ascii?Q?eSCfWdGpl7e76Lt/0nE4rX91Bj9yd1FBD70jBzmb65rjbaGPMumtNBzuhs5W?=
 =?us-ascii?Q?Sx7qkA4ApjwD7oCWMQMXWN2M/HAbJYenXY3BAy3EGW5XEF6YFrZH2xXJNLIO?=
 =?us-ascii?Q?DppbdW87yBeJVzc7eiEEClD0MnX9kI/2mSofe5657S0/U9rwxp74SkbAWaZn?=
 =?us-ascii?Q?x7rNmg3FvkMHHIopRwt+dfF7g7Kk1c4T+eYISLLPlL6mMTgqv2nJh+TUeD5U?=
 =?us-ascii?Q?TtNowBwjCFwFEC9GkYPU0xyeWaK1bhfqCxGga024eWIX/Wcu3vv4MqkJO1Xu?=
 =?us-ascii?Q?E3XIekzjECMDipQ7Rs138paOVkDk5IuplUmtOwP9iplyWEXP/VzeWSt0kkGw?=
 =?us-ascii?Q?XgHZ8hcw1B71zXbdIoTQssClOFd8feNkJ6VKXVcqCxtP7tEG54hznK+Kdi4G?=
 =?us-ascii?Q?bjYiUbzGuBCNI+qkPBIpL3MmzYaABT/b64ckLF3wx+y71P+YPV9GengCllhj?=
 =?us-ascii?Q?HpD7B16/FYSiqFQM+EL/8AKwOTecj41q5dLzmnAxye7eDc5AZQ9+UyXCUo0j?=
 =?us-ascii?Q?bFpmvpK2RPJ84o2Mq5LNY5Yukqc4Z77Cn+E7y75K8ElEzsD77kFU6sT+VltA?=
 =?us-ascii?Q?t/ArgyHJbRStzpa3Ym9t953JM3Rxp+Xws7bnczTLnsd3ODDjQ/SkzE2z+/RK?=
 =?us-ascii?Q?7KN+PmjuE03LbWvpl4RlLD2MJoo4ponwBk4zXPCCum3DZMKqjOVEgXzXNFz+?=
 =?us-ascii?Q?KYkLTQIpd9J8Ztw9h1cVIp+DxSZUwBsyS+yGV8T27mVckUlK9Ws1mdsWb3dY?=
 =?us-ascii?Q?0+cSjyOwvn9ItIZsyZZAwlr3+qBe3mnUtVyb06syXII88hhuQnx68Y4t80JC?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35512697-b16d-43ed-7a64-08db9eadeb03
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:10:01.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlPFHg6/fyb2SjHHD7w4C16MWyp3v4ych4u2wh1ZfcYt1GOSpu0gxmB5UgNsOtO7/KoiRe+eaBTXylFJOGsFUu8SuhM5e3/we9cJ/laObs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7609
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: GSC forcewake support
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

On Wed, Aug 16, 2023 at 11:04:24AM -0700, Daniele Ceraolo Spurio wrote:
> The ID for the GSC forcewake domain already exists, but we're missing
> the register definitions and the domain intialization, so add that in.
> 
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 ++
>  drivers/gpu/drm/xe/xe_force_wake.c   | 7 +++++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e3d1cec7ba8d..d8f00e84b41a 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -33,6 +33,7 @@
>  #define FORCEWAKE_ACK_MEDIA_VDBOX(n)		XE_REG(0xd50 + (n) * 4)
>  #define FORCEWAKE_ACK_MEDIA_VEBOX(n)		XE_REG(0xd70 + (n) * 4)
>  #define FORCEWAKE_ACK_RENDER			XE_REG(0xd84)
> +#define FORCEWAKE_ACK_GSC			XE_REG(0xdf8)

Even though it's logically similar to the other registers here, I think
we should still keep the register definitions sorted by offset (i.e.,
this register shouldn't be before GMD_ID's 0xd8c below).  If we try to
bend the sorting rules to keep similar registers together, then people
keep bending them more and more over time and eventually it turns into
chaos.

Aside from the placement of the definition, the other changes here look
good, so

        Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

with that change.


Matt

>  
>  #define GMD_ID					XE_REG(0xd8c)
>  #define   GMD_ID_ARCH_MASK			REG_GENMASK(31, 22)
> @@ -259,6 +260,7 @@
>  #define FORCEWAKE_RENDER			XE_REG(0xa278)
>  #define FORCEWAKE_MEDIA_VDBOX(n)		XE_REG(0xa540 + (n) * 4)
>  #define FORCEWAKE_MEDIA_VEBOX(n)		XE_REG(0xa560 + (n) * 4)
> +#define FORCEWAKE_GSC				XE_REG(0xa618)
>  
>  #define XEHPC_LNCFMISCCFGREG0			XE_REG_MCR(0xb01c, XE_REG_OPTION_MASKED)
>  #define   XEHPC_OVRLSCCC			REG_BIT(0)
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index e563de862581..ef7279e0b006 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -97,6 +97,13 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
>  			    BIT(0), BIT(16));
>  	}
> +
> +	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
> +		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GSC],
> +			    XE_FW_DOMAIN_ID_GSC,
> +			    FORCEWAKE_GSC,
> +			    FORCEWAKE_ACK_GSC,
> +			    BIT(0), BIT(16));
>  }
>  
>  static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
> -- 
> 2.41.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
