Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E407AC7EE23
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 09:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB76610E4A9;
	Wed,  7 Jun 2023 09:55:14 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AF310E4A9;
 Wed,  7 Jun 2023 09:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686131712; x=1717667712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k/2uFoHqG15onfQUybOE0o/2WY4OssoH86EiGUBff+w=;
 b=XaAdEcpVjtMLTKqjxIi6yv03YVx+odKYYQrcFRDEAVmYKfhmiCeF6Bhx
 wMOBRJ7DNbRIINk+lD/f2DyQqOe4ag6KcASnl+bRP4ZhLQ/HtMGNvKLW7
 eXHqfLum2UCTRGriNyHk0jQ/CV0IWnH/qvK9iNugpGVwE4ZaxvCfIlfGW
 p7kv0iv8JCM/AnnSKtG2QVTRuofOvdu6UImAEThS0/oN5jPFSVIhAQ+Zc
 fM2+GQoTHD6Qyrb/TRWHsAHEvZV2a5vvcrC3gNDkdVAM00jAAd9Ylyqdq
 2Q2svnxLBVA1sd/NMt94xrMZrd581AthtnEypCOmeRRqZp4CQ0LGiLwQ1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336566910"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="336566910"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="709422411"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="709422411"
Received: from wkalisz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.213.20.202])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 02:55:10 -0700
Date: Wed, 7 Jun 2023 11:55:08 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <20230607095508.xhpireixyx5jxzpj@zkempczy-mobl2>
References: <20230602114817.849486-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230602114817.849486-1-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH i-g-t] tests/xe/xe_intel_bb: ensure valid
 next page
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Jun 02, 2023 at 12:48:17PM +0100, Matthew Auld wrote:
> Due to over-fetch, recommendation is to ensure we have a single valid
> extra page beyond the batch. We currently lack this which seems to
> explain why xe_intel_bb@full-batch generates CAT errors.
> 
> Currently we allow using the last GTT page, but this looks to be no-go,
> since the next page will be beyond the actual GTT, in the case of
> full-batch. The i915 path looks to already account for this. However
> even with that fixed, Xe doesn't use scratch pages by default so the
> next page will still not be valid.
> 
> With Xe rather expect that callers know about HW over-fetch, ensuring
> that the batch has an extra page, if needed. Alternatively we could
> apply the DRM_XE_VM_CREATE_SCRATCH_PAGE when creating the vm, but really
> we want to get away from such things.
> 
> Bspec: 60223
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/262
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

I observe this not only on the last page. I've introduced

index 3cd680072e..ef3f782df7 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -947,7 +947,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
                /* Limit to 48-bit due to MI_* address limitation */
                ibb->gtt_size = 1ull << min_t(uint32_t, xe_va_bits(fd), 48);
-               end = ibb->gtt_size;
+               end = ibb->gtt_size - xe_get_default_alignment(fd)*2;

or even:

+               end = ibb->gtt_size/2;

Having:

ADLP:~/igt-upstream/build/tests# ./xe_intel_bb --run full-batch --debug
IGT-Version: 1.27.1-NO-GIT (x86_64) (Linux: 6.3.0-xe+ x86_64)
Opened device: /dev/dri/card0
(xe_intel_bb:11420) drmtest-DEBUG: Test requirement passed: !(fd<0)
(xe_intel_bb:11420) intel_bufops-DEBUG: generation: 12, supported tiles: 0x3f, driver: xe
Starting subtest: full-batch
(xe_intel_bb:11420) intel_allocator_simple-DEBUG: Using simple allocator
(xe_intel_bb:11420) intel_batchbuffer-DEBUG: Run on DRM_XE_ENGINE_CLASS_COPY
(xe_intel_bb:11420) intel_batchbuffer-DEBUG: bind: MAP
(xe_intel_bb:11420) intel_batchbuffer-DEBUG:   handle: 1, offset: ffffffffd000, size: 1000
(xe_intel_bb:11420) intel_batchbuffer-DEBUG: bind: UNMAP
(xe_intel_bb:11420) intel_batchbuffer-DEBUG:   offset: ffffffffd000, size: 1000

And I still observe failure, what means problem is with prefetching from
next page, regardless location.

That means imo umd and any consumer have to overallocate to avoid
hitting:

[ 1406.062731] xe 0000:00:02.0: [drm] Engine memory cat error: guc_id=2
[ 1406.070519] xe 0000:00:02.0: [drm] Timedout job: seqno=4294967169, guc_id=2, flags=0x4
[ 1406.070535] xe 0000:00:02.0: [drm:xe_devcoredump [xe]] Multiple hangs are occurring, but only the first snapshot was taken
[ 1406.071182] xe 0000:00:02.0: [drm] Engine reset: guc_id=2

So from my perspective you've avoided failure but that wasn't my intention
when I've written this test. Do you maybe know does umd has mitigation
code which prevents of entering area which starts prefetching from next
page?

--
Zbigniew


> ---
>  lib/intel_batchbuffer.c | 6 ++++++
>  tests/xe/xe_intel_bb.c  | 8 +++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 3cd680072..035facfc4 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -881,6 +881,12 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
>   * passed in. If this is the case, it copies the information over to the
>   * newly created batch buffer.
>   *
> + * NOTE: On Xe scratch pages are not used by default. Due to over-fetch (~512
> + * bytes) there might need to be a valid next page to avoid hangs or CAT errors
> + * if the batch is quite large and approaches the end boundary of the batch
> + * itself.  Inflate the @size to ensure there is a valid next page in such
> + * cases.
> + *
>   * Returns:
>   *
>   * Pointer the intel_bb, asserts on failure.
> diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c
> index 755cc530e..af8462af5 100644
> --- a/tests/xe/xe_intel_bb.c
> +++ b/tests/xe/xe_intel_bb.c
> @@ -952,7 +952,13 @@ static void full_batch(struct buf_ops *bops)
>  	struct intel_bb *ibb;
>  	int i;
>  
> -	ibb = intel_bb_create(xe, PAGE_SIZE);
> +	/*
> +	 * Add an extra page to ensure over-fetch always sees a valid next page,
> +	 * which includes not going beyond the actual GTT, and ensuring we have
> +	 * a valid GTT entry, given that on xe we don't use scratch pages by
> +	 * default.
> +	 */
> +	ibb = intel_bb_create(xe, 2 * PAGE_SIZE);
>  	if (debug_bb)
>  		intel_bb_set_debug(ibb, true);
>  
> -- 
> 2.40.1
> 
