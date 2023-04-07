Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CFBC6FD1D
	for <intel-xe@archiver.kernel.org>; Fri,  7 Apr 2023 11:27:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE5D10E090;
	Fri,  7 Apr 2023 11:27:03 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5190510E090
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Apr 2023 11:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680866822; x=1712402822;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2TZtnnpgFruSul2ElI+YuUVdOY3XxSDlVejM5tFXzNU=;
 b=JCnPVZpnuDRsrp+/1SKscDHx/Xeq/dRXbb9IBvZ6eNQCZ57CPF2GINZw
 fL3yGLbVWX7cfvj7EX6g/CSzIb7wxMRhZIUBwgJXWZMwmT8/AMZHGge3c
 1RLlAbGw1oRSnw34dxiYkwjTfJbcrnCe6bZQXYRbui4ViKphBCuDydwsP
 OG760e6KauKL4CF1AA06fi4rvaBaxPwbk9Gu19CJE2jM2Uo22GXcwHp9A
 T2YFJIVRJvpzat4KmJZ9FmyttAab/qpp/GUtaQqddPjxLoqc7BojKr0Yu
 7BjIjGgzwGPCl/aF4Jy/G1C6nngyFRIONycrsbf/JYCi3X1syMQeFZGwS A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="323341573"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="323341573"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2023 04:27:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="720041187"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; d="scan'208";a="720041187"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 07 Apr 2023 04:27:01 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 04:27:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 7 Apr 2023 04:27:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 7 Apr 2023 04:27:00 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 7 Apr 2023 04:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZAVviUMIdP10has2WZpIspSQq6Z1Amc4vBFyOk1r4OtEtzsDTnCdvyRU+NTnb7ziabP9/8xjZR6VbQE/nGYIWxJVpxEdzKrlRcfF7UinbRbkxgl65XbO+6ELDvZfEQr/ofODDPMDta8m+k+kZkv2wkaIYmGq/VzBOdV/HBMbQf7MiVC/QamM91Wbd//exokSsGCvcWug9sHgbxjrjvhO3fVrIYZW0UliMH0D6s2BV3u6x6sMWhQpYMy8lsFff/jIY3gch/ieMDO6OT8exTu+llBcLnj2QOHT9PMEeylo4T5Enl7+bYZPJdIerJb6a9zsSpysxiBZ6vx7oVJy7NGHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DU8CloUi7HURL/VolXqCv8nMGtC5StxZUC6K0OgMNQA=;
 b=QOH8aewsHbOGGgDE0cTSRDhcd812DISwANG9SYs8REzW2CTvUIGoeJTNZ/LLCD8QEg8p2iFotv6jPBh+nxvNTRzAE5hLk1gVLnwbZBZv+z6ZpQwAdnVHTJpL8MWUaWU6CgMZagCyHTl+7WAgI6RnLRpL4Fwqf5RTdv1WfqRb40Z8VeE+e4mB/ZAsmH9kvKFs90cKP/ZCydIRt976mBYsl8JdN+entivbaVv1T/t+TjHMEDcfABNgN05RXYVqQTl0Q68fhJ3KV6nxaVLUExjMXSapEc+HKOU97dk80+px2KomxtahscqeNv0fo/xV7uaVC0Q0RWUx/REukvwsDWTAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Fri, 7 Apr
 2023 11:26:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::2b57:646c:1b01:cd18%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 11:26:56 +0000
Date: Fri, 7 Apr 2023 07:26:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZC/9/I3ZHsC0YGXQ@intel.com>
References: <20230406151845.304035-1-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230406151845.304035-1-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a1f56a-0612-4bd6-63b5-08db375afe64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Yup7CIUNFariNvkqEqdTTDmdiBjqj/X1IF/JZAuWbrw8nnhU5kCImNG07+Zmmkm8haHS7UBGyJUdAQ27knMaoo43Xf9wc8vqRuHqGGl1CIia1Wn/5PXwGxgRl01O3WC08Et0Q6kLeFIyqVbkl6SR+p5ox7p3ijZMQjuvUSCeBt1AoIoV3rXqELj3C0R2UAQo+6P7kDqvGcmPmA4QK1rsRbvNW/HR1pRlJh5BCW9QAThu1U2oO+cmGT6SZvIcrCWVE6EOKXc8JxuVdUxmBZhTCnxk+kfJOfzZBgcGJUX9DYeda1I0wU+KTlQNxEAIiiZDMDMd6LRyAc70+gBsqR6UvvU61IUGy1CIQNAVZ8tzbma8urU1hnTgo1Gb71TcA6JGPdO6o/VbmyRkdtoKMLhP2sEsTch1gL2owg5u6H1r30pRXOMeOoX6utG6hDdCrTk/PX/bv5fkjtLaj4G/3on3PdbGmEkxeaaMH2SYawojSC9OEUEe6Kbcwa0fVnZIH8OmLtLurhwX5y/h+qDKqM9tw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(38100700002)(15650500001)(8936002)(6862004)(41300700001)(44832011)(5660300002)(26005)(2616005)(478600001)(37006003)(6636002)(6512007)(6486002)(966005)(36756003)(2906002)(6506007)(316002)(8676002)(66476007)(86362001)(4326008)(83380400001)(66556008)(6666004)(186003)(82960400001)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x1/BTalsSWEiS6p++EmtA+MP23hhjVq/s7yjl9Hmd6rO2ADyFSUBsAtOJa8u?=
 =?us-ascii?Q?dDlW3K4uXcnLgZauz4we6EicYkQUj9Z7ulPJzoduy2+VTFaKTfKwa+5uFL9P?=
 =?us-ascii?Q?UseimlRgTi2ENR8LB4t8MXJKgxlrAiqSFkpTqIO2w4V94VjfdF9skaLzqf2j?=
 =?us-ascii?Q?xG+G9eBhVuI4p2W1E4rJTsrPmAO+siNoDAOtOi0UwFJpySSkXT9z91e1ecPI?=
 =?us-ascii?Q?HjxybL5CrdV3Ch/XnbXHHXeXT0P6nNjAbtSy5ipHLP52H9gF0nWFVxinECEN?=
 =?us-ascii?Q?nEncqdQ/IQIj0cYzmg1UJCs3TLViv3OgctgrmeP51nAbjJQA83F2Dk8SoV16?=
 =?us-ascii?Q?ERWy8b8THMP+TK8YVYERMC7YEOrLs7qL/S1aN/PQ09Aglu3Spk7VOT1/Oguj?=
 =?us-ascii?Q?Q0ltGHqiGcEoIFWT9h0jfKfIZK83mMcPNrI3146KBO54rNxEToEfiHiC7Sit?=
 =?us-ascii?Q?gTfwH2TetpjNIfouk9DYBG53L3sKFOaEoNHDV1phWh1nXvatsrWMTm0ofDKI?=
 =?us-ascii?Q?/NR2MLzQSRgU5VTeXdMtPY+o8bkhSjpuZlMZI8unK2i7NCeCgXmF3J+XQ/WA?=
 =?us-ascii?Q?ysKcaANl83wboHxMHLXUCa62VMntUVhUn2xzrPqpgk1ESEH63jF3LsEv1/yt?=
 =?us-ascii?Q?yAB1pXw3aly1YXPycQbzdfW+LljlnybMf0ur8gHJya8hX3DJWLSmGQ5bhFk4?=
 =?us-ascii?Q?TJ8Q6xFrtlQhnD3CG42I8Q4O7HWsarFzJUgeXk42+8YFS8EDmrInajLMrBSZ?=
 =?us-ascii?Q?RdoF6hVYPg50UR8uC3yDOyimWDLHEVf+Tx1N+qIlbLaRQJqC5hlFQrwU6uxY?=
 =?us-ascii?Q?Dedi9potX1nFjztA8WEHpQSl3qx3/W87alkAU6jUMctTFiHsA96PtktXSIMF?=
 =?us-ascii?Q?MXgyc2gPlgHS31IwZrQbwhK5mwHgjq9TDdTHDO8WAgnmQBOBEUkm51SikUDb?=
 =?us-ascii?Q?MEIZJKPTZEU2wuB0xIyngrxCsJeX1egwB41cMqVCsOPZBk0xs6eXTcCC10WS?=
 =?us-ascii?Q?rBO+Nfn18kRYp1ccaGGoYof1qZVMUNtJx5hxJj1F08bZ2E1gpC9vVa09F6YO?=
 =?us-ascii?Q?7mjSG4krESB7MLOyUfeq4PBEDLaQYI8sKUkkLDO4Sw2bQHVKKqA1cO3S271B?=
 =?us-ascii?Q?+WEONrRVfyJUSw/9FrQKQdE/nZsXbjNNxp5GG7PDftP/xuKwMYOTUfJ4ByHW?=
 =?us-ascii?Q?Bmtpq3PVrEzjKpGhSVCOoexOLhKCF+z+DEGOAKIGDyyaw7c97yHTsBPzRl07?=
 =?us-ascii?Q?brDj/HE2YkwZagDAHFaAfRaE/1pQIaDTTU1co8Et51tEi2qaajzjlBwr9WpH?=
 =?us-ascii?Q?mYlKqjBeVWOiY5VaRGN6rISMOH9mucnEo5d3KAW8z8aFgWvwcJRM65JgLPWn?=
 =?us-ascii?Q?0w9GSAgwCrNJwwsjwI3+k6ch4eau3J1/R/RCeWWhUdji9M8x9zbN+VF4a0Jh?=
 =?us-ascii?Q?eLOuaTFhoVhuLnmSco3P4oUwZ6s8AcZnMFKnTgqvuy0J5AcCdkeEu5iDnP5l?=
 =?us-ascii?Q?PUXGMkL5XVGgtHch22ptGr0nLb01cnt7jtglA6kB744scl4SdqlUUYLQt21j?=
 =?us-ascii?Q?GwfBhFIhixt2wjryWG4kJPh+i0N7XDYP5gWjbkRo/Y547eMQ5IztnylMwjG6?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a1f56a-0612-4bd6-63b5-08db375afe64
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 11:26:56.1359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/IFVI9rsOeowf9CQjhX4pTE/YzQDTveyObON2fQC1AZ5fZNWBSVjhNEf1xxKcirOWshdMYrcXvGhhv/PwCtEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: fix suspend-resume for dgfx
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

On Thu, Apr 06, 2023 at 04:18:45PM +0100, Matthew Auld wrote:
> This stopped working now that TTM treats moving a pinned object through
> ttm_bo_validate() as an error, for the general case. Add some new
> routines to handle the new special casing needed for suspend-resume.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/244
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Neat!

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Tested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

rdvivi@DG2 igt-gpu-tools$ sudo ./build/tests/xe_pm --r s2idle-exec-after
IGT-Version: 1.27.1-g41be8b4ab (x86_64) (Linux: 6.3.0-rc4+ x86_64)
Starting subtest: s2idle-exec-after
[cmd] rtcwake: wakeup from "freeze" using /dev/rtc0 at Fri Apr  7 07:22:10 2023
Subtest s2idle-exec-after: SUCCESS (3.327s)

rdvivi@DG2 igt-gpu-tools$ sudo ./build/tests/xe_pm --r s3-exec-after
IGT-Version: 1.27.1-g41be8b4ab (x86_64) (Linux: 6.3.0-rc4+ x86_64)
Starting subtest: s3-exec-after
[cmd] rtcwake: wakeup from "mem" using /dev/rtc0 at Fri Apr  7 07:22:45 2023
Subtest s3-exec-after: SUCCESS (2.417s)

> ---
>  drivers/gpu/drm/xe/xe_bo.c       | 129 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |   3 +
>  drivers/gpu/drm/xe/xe_bo_evict.c |   8 +-
>  3 files changed, 136 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 5460e6fe3c1f..002250209116 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -696,6 +696,135 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  
>  }
>  
> +/**
> + * xe_bo_evict_pinned() - Evict a pinned VRAM object to system memory
> + * @bo: The buffer object to move.
> + *
> + * On successful completion, the object memory will be moved to sytem memory.
> + * This function blocks until the object has been fully moved.
> + *
> + * This is needed to for special handling of pinned VRAM object during
> + * suspend-resume.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_bo_evict_pinned(struct xe_bo *bo)
> +{
> +	struct ttm_place place = {
> +		.mem_type = XE_PL_TT,
> +	};
> +	struct ttm_placement placement = {
> +		.placement = &place,
> +		.num_placement = 1,
> +	};
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +	};
> +	struct ttm_resource *new_mem;
> +	int ret;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (WARN_ON(!bo->ttm.resource))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!xe_bo_is_pinned(bo)))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!xe_bo_is_vram(bo)))
> +		return -EINVAL;
> +
> +	ret = ttm_bo_mem_space(&bo->ttm, &placement, &new_mem, &ctx);
> +	if (ret)
> +		return ret;
> +
> +	if (!bo->ttm.ttm) {
> +		bo->ttm.ttm = xe_ttm_tt_create(&bo->ttm, 0);
> +		if (!bo->ttm.ttm) {
> +			ret = -ENOMEM;
> +			goto err_res_free;
> +		}
> +	}
> +
> +	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> +	if (ret)
> +		goto err_res_free;
> +
> +	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +	if (ret)
> +		goto err_res_free;
> +
> +	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
> +	if (ret)
> +		goto err_res_free;
> +
> +	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +			      false, MAX_SCHEDULE_TIMEOUT);
> +
> +	return 0;
> +
> +err_res_free:
> +	ttm_resource_free(&bo->ttm, &new_mem);
> +	return ret;
> +}
> +
> +/**
> + * xe_bo_restore_pinned() - Restore a pinned VRAM object
> + * @bo: The buffer object to move.
> + *
> + * On successful completion, the object memory will be moved back to VRAM.
> + * This function blocks until the object has been fully moved.
> + *
> + * This is needed to for special handling of pinned VRAM object during
> + * suspend-resume.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_bo_restore_pinned(struct xe_bo *bo)
> +{
> +	struct ttm_operation_ctx ctx = {
> +		.interruptible = false,
> +	};
> +	struct ttm_resource *new_mem;
> +	int ret;
> +
> +	xe_bo_assert_held(bo);
> +
> +	if (WARN_ON(!bo->ttm.resource))
> +		return -EINVAL;
> +
> +	if (WARN_ON(!xe_bo_is_pinned(bo)))
> +		return -EINVAL;
> +
> +	if (WARN_ON(xe_bo_is_vram(bo) || !bo->ttm.ttm))
> +		return -EINVAL;
> +
> +	ret = ttm_bo_mem_space(&bo->ttm, &bo->placement, &new_mem, &ctx);
> +	if (ret)
> +		return ret;
> +
> +	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
> +	if (ret)
> +		goto err_res_free;
> +
> +	ret = dma_resv_reserve_fences(bo->ttm.base.resv, 1);
> +	if (ret)
> +		goto err_res_free;
> +
> +	ret = xe_bo_move(&bo->ttm, false, &ctx, new_mem, NULL);
> +	if (ret)
> +		goto err_res_free;
> +
> +	dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +			      false, MAX_SCHEDULE_TIMEOUT);
> +
> +	return 0;
> +
> +err_res_free:
> +	ttm_resource_free(&bo->ttm, &new_mem);
> +	return ret;
> +}
> +
>  static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
>  				       unsigned long page_offset)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> index 8f5a7ad10d09..3a6c6852be86 100644
> --- a/drivers/gpu/drm/xe/xe_bo.h
> +++ b/drivers/gpu/drm/xe/xe_bo.h
> @@ -230,6 +230,9 @@ bool xe_bo_can_migrate(struct xe_bo *bo, u32 mem_type);
>  int xe_bo_migrate(struct xe_bo *bo, u32 mem_type);
>  int xe_bo_evict(struct xe_bo *bo, bool force_alloc);
>  
> +int xe_bo_evict_pinned(struct xe_bo *bo);
> +int xe_bo_restore_pinned(struct xe_bo *bo);
> +
>  extern struct ttm_device_funcs xe_ttm_funcs;
>  
>  int xe_gem_create_ioctl(struct drm_device *dev, void *data,
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index bbf89a58cdf5..6642c5f52009 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -63,7 +63,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		spin_unlock(&xe->pinned.lock);
>  
>  		xe_bo_lock(bo, &ww, 0, false);
> -		ret = xe_bo_evict(bo, true);
> +		ret = xe_bo_evict_pinned(bo);
>  		xe_bo_unlock(bo, &ww);
>  		xe_bo_put(bo);
>  		if (ret) {
> @@ -97,7 +97,7 @@ int xe_bo_evict_all(struct xe_device *xe)
>  		spin_unlock(&xe->pinned.lock);
>  
>  		xe_bo_lock(bo, &ww, 0, false);
> -		ret = xe_bo_evict(bo, true);
> +		ret = xe_bo_evict_pinned(bo);
>  		xe_bo_unlock(bo, &ww);
>  		xe_bo_put(bo);
>  		if (ret)
> @@ -141,7 +141,7 @@ int xe_bo_restore_kernel(struct xe_device *xe)
>  		spin_unlock(&xe->pinned.lock);
>  
>  		xe_bo_lock(bo, &ww, 0, false);
> -		ret = xe_bo_validate(bo, NULL, false);
> +		ret = xe_bo_restore_pinned(bo);
>  		xe_bo_unlock(bo, &ww);
>  		if (ret) {
>  			xe_bo_put(bo);
> @@ -205,7 +205,7 @@ int xe_bo_restore_user(struct xe_device *xe)
>  		spin_unlock(&xe->pinned.lock);
>  
>  		xe_bo_lock(bo, &ww, 0, false);
> -		ret = xe_bo_validate(bo, NULL, false);
> +		ret = xe_bo_restore_pinned(bo);
>  		xe_bo_unlock(bo, &ww);
>  		xe_bo_put(bo);
>  		if (ret) {
> -- 
> 2.39.2
> 
