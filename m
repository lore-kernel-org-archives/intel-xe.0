Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FB6C77B73
	for <intel-xe@archiver.kernel.org>; Mon,  5 Jun 2023 08:33:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E4910E1A3;
	Mon,  5 Jun 2023 08:33:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF3910E1A7
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Jun 2023 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685954014; x=1717490014;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=L4JTlUYef7Y+E6Ep2GQBo/nc1aSBZAMejShCM0gv0xU=;
 b=PhwG9WyxhAwmtw41r0P273kU4B5W/jFL7268l4UoQH6AkNOAjWaibRTs
 AlUsLq6OTSjbGpN71V/el4mw/oz8ZJQDR+6/8hxP0spV3f/9w1eftKUaN
 7qadZYSZshKx51qSDj8rJrNIw7U82ZVv92ofxWpziMTerBwHl1bvP4FuZ
 OEW21SBe27CG+/YGF2yZ2WmpeUjB159Hm/BfDTUmZBuUJuz8HjwlBqKbs
 jTKESSdfaPdknLDC5HLSDy3SJ0nD/V44h+UC/+TzdcqPxGqEz/rwnEy3x
 kE71wBvWt0yYfQ3hMFFQ4csHmmgHNjSj3LLDyowCKmT+mzDBkhNxaBYgb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="355169903"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="355169903"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 01:33:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="738296799"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="738296799"
Received: from imurugax-mobl2.gar.corp.intel.com (HELO [10.249.254.120])
 ([10.249.254.120])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 01:33:31 -0700
Message-ID: <0541475d-1f16-3d17-8e2b-24885c5f4035@linux.intel.com>
Date: Mon, 5 Jun 2023 10:33:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230602180702.17380-1-niranjana.vishwanathapura@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH] drm/xe: Use large rings for compute contexts
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
Cc: thomas.hellstrom@intel.com, chris.p.wilson@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi, Niranjana,

On 6/2/23 20:07, Niranjana Vishwanathapura wrote:
> Allow compute contexts to submit the maximal amount of work without
> blocking userspace.
>
> The original size for user LRC ring's (SZ_16K) was chosen to minimise
> memory consumption, without being so small as to frequently stall in the
> middle of workloads. With the main consumers being GL / media pipelines
> of 2 or 3 batches per frame, we want to support ~10 requests in flight
> to allow for the application to control throttling without stalling
> within a frame.
>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

With the DRM scheduler, jobs are written to the ring from a drm 
scheduler notifier when all dependencies are satisfied and there is ring 
space available, and I believe that's the case even after Matthew 
Brost's changes to xe / drm-scheduler on how compute jobs are handled.

So this patch shouldn't be needed for xe.

/Thomas

> ---
>   drivers/gpu/drm/xe/xe_engine.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_engine.c b/drivers/gpu/drm/xe/xe_engine.c
> index b3036c4a8ec3..47c9f119fb29 100644
> --- a/drivers/gpu/drm/xe/xe_engine.c
> +++ b/drivers/gpu/drm/xe/xe_engine.c
> @@ -29,6 +29,7 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>   {
>   	struct xe_engine *e;
>   	struct xe_gt *gt = hwe->gt;
> +	u32 ring_size;
>   	int err;
>   	int i;
>   
> @@ -65,8 +66,9 @@ static struct xe_engine *__xe_engine_create(struct xe_device *xe,
>   		e->bind.fence_seqno = XE_FENCE_INITIAL_SEQNO;
>   	}
>   
> +	ring_size = (e->class == XE_ENGINE_CLASS_COMPUTE) ? SZ_512K : SZ_16K;
>   	for (i = 0; i < width; ++i) {
> -		err = xe_lrc_init(e->lrc + i, hwe, e, vm, SZ_16K);
> +		err = xe_lrc_init(e->lrc + i, hwe, e, vm, ring_size);
>   		if (err)
>   			goto err_lrc;
>   	}
