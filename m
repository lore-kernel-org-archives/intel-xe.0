Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED3FC4706F
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 05:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9298B10E385;
	Thu,  4 Jan 2024 05:01:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ABF10E381
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jan 2024 05:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704344476; x=1735880476;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=QVLWMcOe0uAVoj1KYRjOXtNulAkp0kmcG+IBey+QdLc=;
 b=CmC5x0eOKlTaiIWbpHvJUH22Z4P7gh7eorO64/hMY7Upjqsy6vEiw5CS
 0HoUGg7xe3ClBo9H4QdmAsE3zN+amw6VOHEALTtwlaBkP0ikm0tWQjlai
 V09CUZoMouo17o4g4E2fLTB8Ol+yJkdUzYe/trr6Y7JXbMMl7WuMWif0q
 7zhVbe9fyUADpm4wp8s+cEBK1x2ldEyVEq+uT+IWIIfh+V8PWG0LMwINR
 UpIXDwjkGE7X9mBpQebPcQsrI7DJdz1NZmTXkILvjHCjvm5COvw7mbEhz
 pOETDAqrwdhAtNyFmgLYa0Op8DI+m7V4JnSpB2JJuYI+SssiG71Hm4pAq Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="10517846"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; d="scan'208,217";a="10517846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 21:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="809080093"
X-IronPort-AV: E=Sophos;i="6.04,329,1695711600"; 
 d="scan'208,217";a="809080093"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 21:01:13 -0800
Content-Type: multipart/alternative;
 boundary="------------YHcizfBk08wbfTBk2mzlMVUK"
Message-ID: <1edf70ed-4efe-4a0b-a7f9-63fce7969150@linux.intel.com>
Date: Thu, 4 Jan 2024 10:34:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] drm/xe: Move user engine class mappings to
 functions
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-2-riana.tauro@intel.com>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231222074602.817518-2-riana.tauro@intel.com>
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
--------------YHcizfBk08wbfTBk2mzlMVUK
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/22/23 13:15, Riana Tauro wrote:
> Move user engine class <-> hw engine class to function
> calls so that it can be used in different files.
>
> No functional changes.
>
> v2: change array to function
> v3: rebase
>     add header xe_drm
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 19 ++---------
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 51 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.h  |  3 ++
>  drivers/gpu/drm/xe/xe_query.c      | 23 ++------------
>  4 files changed, 58 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 44fe8097b7cd..366f5714c6f7 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -482,31 +482,16 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
>  	return 0;
>  }
>  
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
>  static struct xe_hw_engine *
>  find_hw_engine(struct xe_device *xe,
>  	       struct drm_xe_engine_class_instance eci)
>  {
> -	u32 idx;
> -
> -	if (eci.engine_class > ARRAY_SIZE(user_to_xe_engine_class))
> -		return NULL;
>  
>  	if (eci.gt_id >= xe->info.gt_count)
>  		return NULL;
>  
> -	idx = array_index_nospec(eci.engine_class,
> -				 ARRAY_SIZE(user_to_xe_engine_class));
> -
>  	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
> -			       user_to_xe_engine_class[idx],
> +			       xe_hw_engine_from_user_class(eci.engine_class),
>  			       eci.engine_instance, true);

in xe_gt_hw_engine introduce a check at the beginning for hw_engine_class and return NULL if it
is XE_ENGINE_CLASS_MAX, so that we can skip for_each_hw_engine.
>  }
>  
> @@ -532,7 +517,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
>  			continue;
>  
>  		if (hwe->class ==
> -		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
> +		    xe_hw_engine_from_user_class(DRM_XE_ENGINE_CLASS_COPY))
>  			logical_mask |= BIT(hwe->logical_instance);
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 832989c83a25..ab78019b44ff 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -6,6 +6,7 @@
>  #include "xe_hw_engine.h"
>  
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
>  
>  #include "regs/xe_engine_regs.h"
>  #include "regs/xe_gt_regs.h"
> @@ -290,6 +291,56 @@ static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
>  	return xe_mmio_read32(hwe->gt, reg);
>  }
>  
> +/**
> + * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
> + * @engine_class: hw engine class
> + *
> + * Returns: user engine class on success, -1 on error
> + */
> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
> +{
> +	switch (engine_class) {
> +	case XE_ENGINE_CLASS_RENDER:
> +		return DRM_XE_ENGINE_CLASS_RENDER;
> +	case XE_ENGINE_CLASS_COPY:
> +		return DRM_XE_ENGINE_CLASS_COPY;
> +	case XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	case XE_ENGINE_CLASS_COMPUTE:
> +		return DRM_XE_ENGINE_CLASS_COMPUTE;
> +	default:
> +		XE_WARN_ON(engine_class);
> +		return -1;
> +	}
> +}
> +
> +/**
> + * xe_hw_engine_from_user_class - converts xe user engine class to hw engine class
> + * @engine_class: user engine class
> + *
> + * Returns: hw engine class on success
> + */
> +enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class)
> +{
> +	switch (engine_class) {
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return XE_ENGINE_CLASS_RENDER;
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +		return XE_ENGINE_CLASS_COPY;
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +		return XE_ENGINE_CLASS_VIDEO_DECODE;
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return XE_ENGINE_CLASS_COMPUTE;
> +	default:
> +		XE_WARN_ON(engine_class);
> +		return XE_ENGINE_CLASS_MAX;
> +	}
> +}
> +
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
>  {
>  	u32 ccs_mask =
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index 71968ee2f600..89ca96063644 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -62,6 +62,9 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
>  void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
>  
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
> +enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class);
> +u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
> +
>  static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  {
>  	return hwe->name;
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 9b35673b286c..d4793e79e283 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -22,22 +22,6 @@
>  #include "xe_mmio.h"
>  #include "xe_ttm_vram_mgr.h"
>  
> -static const u16 xe_to_user_engine_class[] = {
> -	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
> -	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
> -	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
> -};
> -
> -static const enum xe_engine_class user_to_xe_engine_class[] = {
> -	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
> -	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
> -	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
> -	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
> -};
> -
>  static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  {
>  	struct xe_hw_engine *hwe;
> @@ -139,10 +123,7 @@ query_engine_cycles(struct xe_device *xe,
>  	if (!gt)
>  		return -EINVAL;
>  
> -	if (eci->engine_class >= ARRAY_SIZE(user_to_xe_engine_class))
> -		return -EINVAL;
> -
> -	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci->engine_class],
> +	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(eci->engine_class),
>  			      eci->engine_instance, true);

looks like this changed, may be rebase on latest.
>  	if (!hwe)
>  		return -EINVAL;
> @@ -208,7 +189,7 @@ static int query_engines(struct xe_device *xe,
>  				continue;
>  
>  			engines->engines[i].instance.engine_class =
> -				xe_to_user_engine_class[hwe->class];
> +				xe_hw_engine_to_user_class(hwe->class);
>  			engines->engines[i].instance.engine_instance =
>  				hwe->logical_instance;
>  			engines->engines[i].instance.gt_id = gt->info.id;

with that addressed Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Regards,
Aravind.
--------------YHcizfBk08wbfTBk2mzlMVUK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 12/22/23
        13:15, Riana Tauro wrote:</font><br>
    </div>
    <blockquote type="cite"
      cite="mid:20231222074602.817518-2-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">Move user engine class &lt;-&gt; hw engine class to function
calls so that it can be used in different files.

No functional changes.

v2: change array to function
v3: rebase
    add header xe_drm

Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 19 ++---------
 drivers/gpu/drm/xe/xe_hw_engine.c  | 51 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.h  |  3 ++
 drivers/gpu/drm/xe/xe_query.c      | 23 ++------------
 4 files changed, 58 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 44fe8097b7cd..366f5714c6f7 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -482,31 +482,16 @@ static int exec_queue_user_extensions(struct xe_device *xe, struct xe_exec_queue
 	return 0;
 }
 
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
 static struct xe_hw_engine *
 find_hw_engine(struct xe_device *xe,
 	       struct drm_xe_engine_class_instance eci)
 {
-	u32 idx;
-
-	if (eci.engine_class &gt; ARRAY_SIZE(user_to_xe_engine_class))
-		return NULL;
 
 	if (eci.gt_id &gt;= xe-&gt;info.gt_count)
 		return NULL;
 
-	idx = array_index_nospec(eci.engine_class,
-				 ARRAY_SIZE(user_to_xe_engine_class));
-
 	return xe_gt_hw_engine(xe_device_get_gt(xe, eci.gt_id),
-			       user_to_xe_engine_class[idx],
+			       xe_hw_engine_from_user_class(eci.engine_class),
 			       eci.engine_instance, true);</pre>
    </blockquote>
    <br>
    <font face="monospace">in xe_gt_hw_engine introduce a check at the
      beginning for hw_engine_class and return NULL if it<br>
      is <span style="white-space: pre-wrap">XE_ENGINE_CLASS_MAX, so that we can skip for_each_hw_engine.</span></font><br>
    <blockquote type="cite"
      cite="mid:20231222074602.817518-2-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">
 }
 
@@ -532,7 +517,7 @@ static u32 bind_exec_queue_logical_mask(struct xe_device *xe, struct xe_gt *gt,
 			continue;
 
 		if (hwe-&gt;class ==
-		    user_to_xe_engine_class[DRM_XE_ENGINE_CLASS_COPY])
+		    xe_hw_engine_from_user_class(DRM_XE_ENGINE_CLASS_COPY))
 			logical_mask |= BIT(hwe-&gt;logical_instance);
 	}
 
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 832989c83a25..ab78019b44ff 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -6,6 +6,7 @@
 #include "xe_hw_engine.h"
 
 #include &lt;drm/drm_managed.h&gt;
+#include &lt;drm/xe_drm.h&gt;
 
 #include "regs/xe_engine_regs.h"
 #include "regs/xe_gt_regs.h"
@@ -290,6 +291,56 @@ static u32 hw_engine_mmio_read32(struct xe_hw_engine *hwe, struct xe_reg reg)
 	return xe_mmio_read32(hwe-&gt;gt, reg);
 }
 
+/**
+ * xe_hw_engine_to_user_class - converts xe hw engine to user engine class
+ * @engine_class: hw engine class
+ *
+ * Returns: user engine class on success, -1 on error
+ */
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class)
+{
+	switch (engine_class) {
+	case XE_ENGINE_CLASS_RENDER:
+		return DRM_XE_ENGINE_CLASS_RENDER;
+	case XE_ENGINE_CLASS_COPY:
+		return DRM_XE_ENGINE_CLASS_COPY;
+	case XE_ENGINE_CLASS_VIDEO_DECODE:
+		return DRM_XE_ENGINE_CLASS_VIDEO_DECODE;
+	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case XE_ENGINE_CLASS_COMPUTE:
+		return DRM_XE_ENGINE_CLASS_COMPUTE;
+	default:
+		XE_WARN_ON(engine_class);
+		return -1;
+	}
+}
+
+/**
+ * xe_hw_engine_from_user_class - converts xe user engine class to hw engine class
+ * @engine_class: user engine class
+ *
+ * Returns: hw engine class on success
+ */
+enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class)
+{
+	switch (engine_class) {
+	case DRM_XE_ENGINE_CLASS_RENDER:
+		return XE_ENGINE_CLASS_RENDER;
+	case DRM_XE_ENGINE_CLASS_COPY:
+		return XE_ENGINE_CLASS_COPY;
+	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
+		return XE_ENGINE_CLASS_VIDEO_DECODE;
+	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
+		return XE_ENGINE_CLASS_VIDEO_ENHANCE;
+	case DRM_XE_ENGINE_CLASS_COMPUTE:
+		return XE_ENGINE_CLASS_COMPUTE;
+	default:
+		XE_WARN_ON(engine_class);
+		return XE_ENGINE_CLASS_MAX;
+	}
+}
+
 void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe)
 {
 	u32 ccs_mask =
diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
index 71968ee2f600..89ca96063644 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.h
+++ b/drivers/gpu/drm/xe/xe_hw_engine.h
@@ -62,6 +62,9 @@ void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
 void xe_hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe);
 
 bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
+enum xe_engine_class xe_hw_engine_from_user_class(u16 engine_class);
+u16 xe_hw_engine_to_user_class(enum xe_engine_class engine_class);
+
 static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
 {
 	return hwe-&gt;name;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index 9b35673b286c..d4793e79e283 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -22,22 +22,6 @@
 #include "xe_mmio.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const u16 xe_to_user_engine_class[] = {
-	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
-	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
-	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-	[XE_ENGINE_CLASS_VIDEO_ENHANCE] = DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[XE_ENGINE_CLASS_COMPUTE] = DRM_XE_ENGINE_CLASS_COMPUTE,
-};
-
-static const enum xe_engine_class user_to_xe_engine_class[] = {
-	[DRM_XE_ENGINE_CLASS_RENDER] = XE_ENGINE_CLASS_RENDER,
-	[DRM_XE_ENGINE_CLASS_COPY] = XE_ENGINE_CLASS_COPY,
-	[DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = XE_ENGINE_CLASS_VIDEO_DECODE,
-	[DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = XE_ENGINE_CLASS_VIDEO_ENHANCE,
-	[DRM_XE_ENGINE_CLASS_COMPUTE] = XE_ENGINE_CLASS_COMPUTE,
-};
-
 static size_t calc_hw_engine_info_size(struct xe_device *xe)
 {
 	struct xe_hw_engine *hwe;
@@ -139,10 +123,7 @@ query_engine_cycles(struct xe_device *xe,
 	if (!gt)
 		return -EINVAL;
 
-	if (eci-&gt;engine_class &gt;= ARRAY_SIZE(user_to_xe_engine_class))
-		return -EINVAL;
-
-	hwe = xe_gt_hw_engine(gt, user_to_xe_engine_class[eci-&gt;engine_class],
+	hwe = xe_gt_hw_engine(gt, xe_hw_engine_from_user_class(eci-&gt;engine_class),
 			      eci-&gt;engine_instance, true);</pre>
    </blockquote>
    <br>
    <font face="monospace">looks like this changed, may be rebase on
      latest.</font><br>
    <blockquote type="cite"
      cite="mid:20231222074602.817518-2-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	if (!hwe)
 		return -EINVAL;
@@ -208,7 +189,7 @@ static int query_engines(struct xe_device *xe,
 				continue;
 
 			engines-&gt;engines[i].instance.engine_class =
-				xe_to_user_engine_class[hwe-&gt;class];
+				xe_hw_engine_to_user_class(hwe-&gt;class);
 			engines-&gt;engines[i].instance.engine_instance =
 				hwe-&gt;logical_instance;
 			engines-&gt;engines[i].instance.gt_id = gt-&gt;info.id;</pre>
    </blockquote>
    <br>
    <p><font face="monospace">with that addressed Reviewed-by: Aravind
        Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@linux.intel.com">&lt;aravind.iddamsetty@linux.intel.com&gt;</a></font></p>
    <font face="monospace">Regards,<br>
      Aravind.</font><br>
    <blockquote type="cite"
      cite="mid:20231222074602.817518-2-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------YHcizfBk08wbfTBk2mzlMVUK--
