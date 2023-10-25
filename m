Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AB6C0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 21:02:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C522B10E723;
	Wed, 25 Oct 2023 21:02:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6903710E723
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 21:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698267747; x=1729803747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6/yg0Ic3GCgDxLlBZxGqXrATspeNjg5yxtbz3AxKTII=;
 b=msu4dpt1XeI02GCtDOqBfBGxgbWHr4MWac+F8U0OfuTTK1QqwZIEUJeV
 rQ0VKDvn+HngE/OVOFmFD95Yhys3n/S0oclnh0PhGjqZ48pNP/ijVda29
 jTujhOpDrd1aYGl5cFUfJoFIbNKSDslTcnwZxCqyHxYVH2bIe1GYc2q9X
 2rharJroFiF5nkMypvSiekid/lqRJKhwXAFJUUfCq/GQ5QqYLKCIhbiAh
 bF80UXTGiINalAXr4CY5Azh06GQxSZ5y4To8N9qI8GXcwfN4QF56gBTlT
 cc/oOgde/XG/d54687SCDQ531EV6bsjzFHRr0jwH2zVvDHtIhd6Rtv7Gl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="384609988"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="384609988"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 14:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="762582832"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="762582832"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2023 14:02:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 25 Oct 2023 14:02:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 25 Oct 2023 14:02:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 25 Oct 2023 14:02:25 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 25 Oct 2023 14:02:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n92M3zvsnvYeA2NxuO9Y5wAOa/8eabhJIdJTKt087S55iVQTCo5aDdE9etWRo534LnJFIxcm63pucPtGOXtctPB2EW78hgmcfkEnF1pyCodIg70fbjgW0rhmLbYp25wxYFoqpR8oYIWkea8W2kVi6m4xRdu+vx/SL5U0aPW37rKaDOUZrQDznkdp3NtqWOztWqQIUVW9B6PesQSYPPFO0eD4kQBTZUVdQ+v4uJpasbdCOcUwhd72lgyT7QpOzVITbQ+J6aZam3eo4SFus/MFdTROF9mF2iWVaQEBbdQUgafCZgWDfOR3gQP5/rZ2c5VQBYTzJeUI7+axIYhdurusCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znHdpGkv2B6lkfaDZC4rk0PTg/OgGnEzZlk47U8RrC4=;
 b=cZ6jgF2Y/ey/cF/XAqdp5o1Mqd9TDWfCzKOMVK48zOGKsz5XyCFF407dbzG8bnsqO9Uwcq+0AF7pR9Nu1j/PeIlBpPVZYofyoXND3AVFpGxQWmEkd2wd0ysCS9PjtcsFNkLBKVP1XyzfR6ofk2TlIFXZV+ZtEU2hJM/R0ZhkiNWpSMKG8OR/NTnqOHK2vWB0oNlUj/ioAyMnjmSQpjoio0t+nRB+6ZkXeFdc7qbKMxnEDs3yy8+5jy1d1RgKKAC7Tan/gW+WewXduq57HelWEaSH8SzoHl1fvNuYO8qbWQAynwEiDnHyjN58p3zdWCaImLmg4n9qHmCMiKfVbake0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 21:02:11 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::3f66:aa7d:51d5:777%6]) with mapi id 15.20.6907.025; Wed, 25 Oct 2023
 21:02:11 +0000
Date: Wed, 25 Oct 2023 21:00:52 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZTmCBBn11tCzpT6Z@DUT025-TGLU.fm.intel.com>
References: <20231025173937.197744-5-matthew.auld@intel.com>
 <20231025173937.197744-8-matthew.auld@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231025173937.197744-8-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6689:EE_
X-MS-Office365-Filtering-Correlation-Id: 5264845c-e634-451a-96b5-08dbd59da842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wQmu6JzDPw9a2CEeOwKv99GRsQvwtSC8gsoMAxrdAdEFGVNVKv2SjsEQxEPhxRs8s6mM3x9/gbJSEKMsSFmfh+6Rg7JmSe0P2t1SylF9xswKnWyjcOccWoZRlWEUYYCvxAn5unPudi1Cl8V5MHIZQ/iJ4W3CuNuaZVu/GyNhIzaXnjQfDJyc+vDwWEleBFss3Tc+F2qmNzZdVZkexv3VL11S8yaKBbgenfFQuecLFbocfEoMHKkfapOfBnAlKYx9fFa/dboY2EmPHgPPMT9A0ax9USjiLpQoS/id+JPx9MN63sU6X1qbqVfDWVhj9H5KgqrV/cv3+//yCeJWERtfZ0FqzujehpRX4fOeyRcy72zb8vcp2/ZFEXQzoFe6YXurUL75OjJfRk8Wl1bZdMTNnM6ZcQmAmzgULw6SXhRT83i8PrNLBiOmiuXnI1w0RUzmc3edc85er7AX2IcY9gaxNvrT+tv4BPBbQgTKiUNTcRk0RJtj6H2WPN/l1o0W9+GPKjS0r1tnTsLi4uHmemShDHKDSzgnap+N8PyR24ngKZlxaaw1adHOdLHHYyIl5j6z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(366004)(376002)(136003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(26005)(83380400001)(66574015)(6666004)(6512007)(86362001)(82960400001)(38100700002)(6506007)(6486002)(6862004)(41300700001)(8936002)(8676002)(4326008)(5660300002)(478600001)(2906002)(44832011)(66476007)(316002)(66556008)(66946007)(6636002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?57gWshne80EdVsCixKHYJ9os4plWgG3vNPbHzGy7x/yG4CpEKVUswidpyT?=
 =?iso-8859-1?Q?OWmT3ASgEmTAPF6z+k4PwDOYHUhCjK1LGKmu0WPf31VhNH4l1xWGCR2qYC?=
 =?iso-8859-1?Q?IzV8g9uXlKpW7Tgk+CrjAOg5zmghcDR2du5ciX+/pThp6UhoPEcQB/bJs0?=
 =?iso-8859-1?Q?1BoDi4SvTUJjC0jUvVsj4f0exZCXXqiOV1rabbVJofWf9U1caPCynuUahP?=
 =?iso-8859-1?Q?Dg39AQuH36VHR/av6X2EOcvy/dJ06r45RNxBZz2LkkuySSQg6CPjK+KZ12?=
 =?iso-8859-1?Q?y4AFVAlXsphsCnbIaEdfqUSLMrY5tTwnd7egKp+t5V5/9osGzfq43BEsbb?=
 =?iso-8859-1?Q?Dcr4fjra2kKG4eqmSqs8ifsVPRbSeubyWWrxmXQTbXHnWoG2AkZ032ctHz?=
 =?iso-8859-1?Q?7M0sj3uMXv8afpAGQYw1v8dzAsX8yFHITHPiyzkj+Y5bPjgLUKByqcCFgB?=
 =?iso-8859-1?Q?uUsUVnZjeqJSbjm7qWGcfFXAPvB8x8TBno0uQBlqhcEQOTKNaeGvTDuI39?=
 =?iso-8859-1?Q?SKYPQYnLaVgI3EEPWO7JtcpifMovhH1T3xhMCJGZUgn9N8tLloPuWvqDNt?=
 =?iso-8859-1?Q?ihgL4KP6bu+I0cVHXUiu+nQsCp+fRXuilCEwVInDim3PejDZ4kO31d/oLk?=
 =?iso-8859-1?Q?GkJyrySUGOo9YV499uPql7m/xBAKjZxoJ0PtTRpHST7o4fmRpzAiL72Dn0?=
 =?iso-8859-1?Q?BQz4SET2s0gByyPu5LWqVXMNpdPyjaVPW/uAcex2uJuCkYiParhNLv71iH?=
 =?iso-8859-1?Q?po8jxu4rONoZFG8PyUl3mJmF0EvMpjMny2O1cbeOqA0/DKfeD6uRp40pal?=
 =?iso-8859-1?Q?Dy1kqKi4zdmk2/ZI3uzxRCoImFn5L4tIoCdGPxbBO5wX2WSVXsFDLTQTzK?=
 =?iso-8859-1?Q?0vu64JNv/Yptf+Q5lFKkDGK86wrohwG6bymIDmeCSMxteHma4hkW96Nv8F?=
 =?iso-8859-1?Q?btnZnbfSBye/jdpsXCDY9C9cKBuMAMrn1lvAnCX0ELa7GoBSoyTRpmjmva?=
 =?iso-8859-1?Q?wNO5npwaZ/39xmZ1i3ZmtLZQo5kmpGucBKaEl6Fb764p1AN4bRn3cTs+ko?=
 =?iso-8859-1?Q?+ye4nxFvlgx0nt2s8ZbxARzeNT0Glg585KhUiqWvnZGYdfZwiWPmL1IVTI?=
 =?iso-8859-1?Q?MVidWVHNhwcaZtiHXwMdGWK2HdtVdNDFe1Kz2hZ94XOo3vqktfKUR7D5pA?=
 =?iso-8859-1?Q?e28HrJzHAD1SLONvH4F6zGIMWFZWTtsC7FyIfZ2EC3yB9WMf/P8rPJasU+?=
 =?iso-8859-1?Q?FJ7OcZfCBP7Aqse1QnIU+Aw/yOI2SDs6a9HlRIjXPaMEQMIZk/1ksssfxN?=
 =?iso-8859-1?Q?HmY9C02r9M+Tz0zarP8ZCrfpUZ6+9c/Fj2mQ0NszFoFeQ9q5mmJhUSy91s?=
 =?iso-8859-1?Q?miAGnMxWZVW7vhoH17r3TXaeG+/+qFN3KOPkYsuPHM+9XgL7/1FDTccGyu?=
 =?iso-8859-1?Q?6nvvAXYd9dpcr+vN3cPaBT7K2fjlAbujv8VXcUv18+ZkX8KR9DFx3NFTZj?=
 =?iso-8859-1?Q?rgEKUd5hbDp4nDPXqWTMJZyEtR6fjaWO6QMKYwgf8EK4U/irgoxMEm2BPX?=
 =?iso-8859-1?Q?+wSvDuLQN8MSMnGg/YD/HiDMbh3ginaSStb5jIvNhhA4Sn6miDDIoQcElC?=
 =?iso-8859-1?Q?zOr5JzHGixryxmGLa+yBM6qwlBH9x2PHTaTW9nnknk0JlOM+Wi/REZ2w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5264845c-e634-451a-96b5-08dbd59da842
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 21:02:11.4605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TTz9/vJHQ18cG482afFkqWzpo9nUm7RZgnsrYcIK49OQLqFUcpmhayu5nt/f3pP4xIgaA8F843MMVR12cGsEJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe/bo: sync kernel fences for KMD
 buffers
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

On Wed, Oct 25, 2023 at 06:39:41PM +0100, Matthew Auld wrote:
> With things like pipelined evictions, VRAM pages can be marked as free
> and yet still have some active kernel fences, with the idea that the
> next caller to allocate the memory will respect them. However it looks
> like we are missing synchronisation for KMD internal buffers, like
> page-tables, lrc etc. For userspace objects we should already have the
> required serialisation for CPU access via the fault handler, and
> likewise for GPU access when vm_binding them.
> 
> To fix this serialise against any kernel fences for all KMD objects at
> creation. This seems to resolve some severe corruption seen during
> evictions.
> 
> Closes: ?
> Testcase: igt@xe-evict-ccs
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_bo.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61789c0e88fb..26a103aa5d48 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1272,6 +1272,16 @@ struct xe_bo *__xe_bo_create_locked(struct xe_device *xe, struct xe_bo *bo,
>  	else
>  		ttm_bo_move_to_lru_tail_unlocked(&bo->ttm);
>  
> +	/*
> +	 * TTM can give us VRAM that still has active fences i.e GPU might still
> +	 * be accessing it. To keep things simple just sync any kernel fences
> +	 * here, if the buffer is KMD internal. For normal userspace objects we
> +	 * should already have the required pipelining or sync waiting.
> +	 */
> +	if (type == ttm_bo_type_kernel)
> +		dma_resv_wait_timeout(bo->ttm.base.resv, DMA_RESV_USAGE_KERNEL,
> +				      false, MAX_SCHEDULE_TIMEOUT);
> +

So this is the case where we create a kernel BO within a VM (e.g. memory
for page tables) and the memory we received is also within the same VM
(bo->ttm.base.resv == VM resv object)? The memory we received could
still be being used thus we need to wait for the memory to be idle? Is
that right? Also how did you arrive at the DMA_RESV_USAGE_KERNEL slot to
determine idle?

Matt 

>  	return bo;
>  }
>  
> -- 
> 2.41.0
> 
