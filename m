Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A1FC678D5
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 11:20:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BB210E677;
	Wed,  8 Mar 2023 11:20:50 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A29C10E686
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678274449; x=1709810449;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=JeX33njKmaxkdB/9QiccD+nyYDvA075D18aOBcK941Y=;
 b=kjXeIrJEV9F4XSpgK7brebtQ2P3Ags5uF4X+3j1vLg+WE0JR+JqmRSKB
 Raye2vrStdSQg3AbqjL5Mq4/inB2c8X4TAsV7nazIANQBGDRW4BtMWU/3
 29zQs0Bo+yEp8i0C+kQILm+4nnRVk7UJmAWXaUD2nzCxbgdyriQO1iGAz
 MNHBTN/B+yhqJh3XWaSr9jfPrnjGIt0oIG1kzvLUCxuP88UNZa2dfBFop
 2DhTfNAHGyNDF9UySGjqW/i5jMuD7GbLIQuj0VFW/9VjY9xXCboT8GfcB
 3Myw1WsUE0ONvurTuAbpwIwKCFUfKLh9/psk1FE0kfMZUuwuRXX+5y3dA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="400954667"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
 d="scan'208,217";a="400954667"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="820175542"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
 d="scan'208,217";a="820175542"
Received: from lcojocar-mobl.ger.corp.intel.com (HELO [10.251.219.243])
 ([10.251.219.243])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 03:20:47 -0800
Content-Type: multipart/alternative;
 boundary="------------arq653OSabhheeR0sf4PS20d"
Message-ID: <888539c5-da48-2be2-ea8e-26a093208233@linux.intel.com>
Date: Wed, 8 Mar 2023 12:20:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230308101745.217120-1-matthew.auld@intel.com>
 <20230308101745.217120-2-matthew.auld@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20230308101745.217120-2-matthew.auld@intel.com>
Subject: Re: [Intel-xe] [PATCH v2 1/6] drm/xe: add
 xe_ttm_stolen_cpu_access_needs_ggtt()
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

This is a multi-part message in MIME format.
--------------arq653OSabhheeR0sf4PS20d
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2023-03-08 11:17, Matthew Auld wrote:
> xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
> case where stolen is not directly CPU accessible on some older
> integrated platforms, and as such a GGTT mapping was also required for
> CPU access (as per the check in xe_bo_create_pin_map_at()).
>
> However with small-bar systems on dgfx we have one more case where
> stolen is also inaccessible, however here we don't have any fallback
> GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
> make this distinction clear. In such a case the later vmap() will fail
> anyway.
>
> v2: fix kernel-doc warning
>
> Suggested-by: Maarten Lankhorst<maarten.lankhorst@linux.intel.com>
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Reviewed-by: Gwan-gyeong Mun<gwan-gyeong.mun@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c             |  2 +-
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 14 ++++++++++++++
>   drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  1 +
>   3 files changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 2bfd3f6f2e9a..876f77669104 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
>   	u64 end = offset == ~0ull ? offset : start + size;
>   
>   	if (flags & XE_BO_CREATE_STOLEN_BIT &&
> -	    xe_ttm_stolen_cpu_inaccessible(xe))
> +	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
>   		flags |= XE_BO_CREATE_GGTT_BIT;
>   
>   	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> index 2e8d07ad42ae..e608b49072ba 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
> @@ -66,6 +66,20 @@ bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
>   	return !mgr->io_base || GRAPHICS_VERx100(xe) < 1270;
>   }
>   
> +/**
> + * xe_ttm_stolen_cpu_access_needs_ggtt - If we can't directly CPU access stolen,
> + * can we then fallback to mapping through the GGTT.
> + * @xe: xe device
> + *
> + * Some older integrated platforms don't support reliable CPU access for stolen,
> + * however on such hardware we can always use the mappable part of the GGTT for
> + * CPU access. Check if that's the case for this device.
> + */
> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
> +{
> +	return xe_ttm_stolen_cpu_inaccessible(xe) && !IS_DGFX(xe);
> +}
> +
>   static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
>   {
>   	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);

I think it's more the other way around by the way, if you make 
cpu_inaccessible use

xe_ttm_stolen_cpu_access_needs_ggtt, it can be used insidexe_ttm_stolen_mgr_init too.

> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> index 2fda97b97a05..e210dada636e 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
> @@ -15,6 +15,7 @@ struct xe_device;
>   void xe_ttm_stolen_mgr_init(struct xe_device *xe);
>   int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
>   bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
> +bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
>   u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
>   u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
>   
--------------arq653OSabhheeR0sf4PS20d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2023-03-08 11:17, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230308101745.217120-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">xe_ttm_stolen_cpu_inaccessible() was originally meant to just cover the
case where stolen is not directly CPU accessible on some older
integrated platforms, and as such a GGTT mapping was also required for
CPU access (as per the check in xe_bo_create_pin_map_at()).

However with small-bar systems on dgfx we have one more case where
stolen is also inaccessible, however here we don't have any fallback
GGTT mode for CPU access. Fix the check in xe_bo_create_pin_map_at() to
make this distinction clear. In such a case the later vmap() will fail
anyway.

v2: fix kernel-doc warning

Suggested-by: Maarten Lankhorst <a class="moz-txt-link-rfc2396E" href="mailto:maarten.lankhorst@linux.intel.com">&lt;maarten.lankhorst@linux.intel.com&gt;</a>
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Reviewed-by: Gwan-gyeong Mun <a class="moz-txt-link-rfc2396E" href="mailto:gwan-gyeong.mun@intel.com">&lt;gwan-gyeong.mun@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_bo.c             |  2 +-
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 14 ++++++++++++++
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 2bfd3f6f2e9a..876f77669104 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1151,7 +1151,7 @@ struct xe_bo *xe_bo_create_pin_map_at(struct xe_device *xe, struct xe_gt *gt,
 	u64 end = offset == ~0ull ? offset : start + size;
 
 	if (flags &amp; XE_BO_CREATE_STOLEN_BIT &amp;&amp;
-	    xe_ttm_stolen_cpu_inaccessible(xe))
+	    xe_ttm_stolen_cpu_access_needs_ggtt(xe))
 		flags |= XE_BO_CREATE_GGTT_BIT;
 
 	bo = xe_bo_create_locked_range(xe, gt, vm, size, start, end, type, flags);
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index 2e8d07ad42ae..e608b49072ba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -66,6 +66,20 @@ bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe)
 	return !mgr-&gt;io_base || GRAPHICS_VERx100(xe) &lt; 1270;
 }
 
+/**
+ * xe_ttm_stolen_cpu_access_needs_ggtt - If we can't directly CPU access stolen,
+ * can we then fallback to mapping through the GGTT.
+ * @xe: xe device
+ *
+ * Some older integrated platforms don't support reliable CPU access for stolen,
+ * however on such hardware we can always use the mappable part of the GGTT for
+ * CPU access. Check if that's the case for this device.
+ */
+bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe)
+{
+	return xe_ttm_stolen_cpu_inaccessible(xe) &amp;&amp; !IS_DGFX(xe);
+}
+
 static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 {
 	struct pci_dev *pdev = to_pci_dev(xe-&gt;drm.dev);</pre>
    </blockquote>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;">I think it's
          more the other way around by the way, if you make
          cpu_inaccessible use </span></span><br>
    </p>
    <pre class="moz-quote-pre" wrap="">xe_ttm_stolen_cpu_access_needs_ggtt, it can be used inside <span style="font-family:monospace"><span style="color:#000000;background-color:#ffffff;">xe_ttm_stolen_mgr_init too.</span></span></pre>
    <p><span style="font-family:monospace"><span
          style="color:#000000;background-color:#ffffff;"></span></span></p>
    <p><span style="font-family:monospace"></span></p>
    <blockquote type="cite"
      cite="mid:20230308101745.217120-2-matthew.auld@intel.com">
      <pre class="moz-quote-pre" wrap="">
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
index 2fda97b97a05..e210dada636e 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.h
@@ -15,6 +15,7 @@ struct xe_device;
 void xe_ttm_stolen_mgr_init(struct xe_device *xe);
 int xe_ttm_stolen_io_mem_reserve(struct xe_device *xe, struct ttm_resource *mem);
 bool xe_ttm_stolen_cpu_inaccessible(struct xe_device *xe);
+bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_device *xe);
 u64 xe_ttm_stolen_io_offset(struct xe_bo *bo, u32 offset);
 u64 xe_ttm_stolen_gpu_offset(struct xe_device *xe);
 
</pre>
    </blockquote>
  </body>
</html>

--------------arq653OSabhheeR0sf4PS20d--
