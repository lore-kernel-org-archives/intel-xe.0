Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773C1C3DA4B
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jul 2024 12:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF4610ECB6;
	Fri, 12 Jul 2024 12:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PmPByUqr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFBF10ECB6
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Jul 2024 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720788913; x=1752324913;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=twQ2loxXTacEtS0DHU8QFJl3pwXQlTgxYnZpFbjLQng=;
 b=PmPByUqrErQyHb4dOT5Bo3/p/HOdIa1lPzpkIJfVMN+OU4OS8hFAk4Sw
 7E8TD/RshtL458w+9qTga0q5HhjYa4ZzAVvSBADdisg28XFFSIhytLDAa
 ZwcENn+iNDcWqJUfTorhFwzWCsQSndqaqSuRr3K7pxOV441B81hdSJGpw
 1zSR1fWxtZEIO9WgflvmI/GvBK9WcG4sQsGDK44ucjDR7VcxpqJOfbmSh
 7kTwAPjL2Xa35InNYrhpmRQSHzTjvddwUEsBL7MixSfHF+TO5w5STDR30
 8ZhBahC0dNhBM8eCa1SnSNrCI8/7IJHPVsfioWXjnFqe4OkxmNQqvzsJS g==;
X-CSE-ConnectionGUID: x2nl2T/KTUmsLgnBR7QxSg==
X-CSE-MsgGUID: zCpaYdFRRkShKmDT9TG/6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="17935986"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208,217";a="17935986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 05:55:13 -0700
X-CSE-ConnectionGUID: L2bhGjYTRZOROg7DSCao2g==
X-CSE-MsgGUID: yHK98s/tSd6pCJ7vwQ5KPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208,217";a="53204012"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.38.191])
 ([10.246.38.191])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 05:55:11 -0700
Content-Type: multipart/alternative;
 boundary="------------F5SHZYTAuIOOkbM00mWruicP"
Message-ID: <29306f83-6597-4627-a296-88e9f47edaeb@linux.intel.com>
Date: Fri, 12 Jul 2024 14:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] drm/xe/xe_migrate: Handle migration logic for xe2+
 dgfx
To: Akshata Jahagirdar <akshata.jahagirdar@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: akshatajahagirdar6@gmail.com, Matthew Auld <matthew.auld@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
References: <cover.1720766122.git.akshata.jahagirdar@intel.com>
 <c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com>
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
--------------F5SHZYTAuIOOkbM00mWruicP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Akshata,

On 7/12/2024 8:39 AM, Akshata Jahagirdar wrote:
> From: "Jahagirdar, Akshata"<akshata.jahagirdar@intel.com>
>
> During eviction (vram->sysmem), we use the mapping from compressed -> uncompressed.
> During restore (sysmem->vram), we need the mapping from uncompressed -> uncompressed.
> Handle logic for selecting the compressed identity map for eviction,
> and selecting uncompressed map for restore operations.
>
> Signed-off-by: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
> Reviewed-by: Matthew Auld<matthew.auld@intel.com>
> Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3b8a334fe08f..1eee6be24423 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -715,7 +715,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
>   	struct xe_gt *gt = m->tile->primary_gt;
>   	u32 flush_flags = 0;
>   
> -	if (xe_device_has_flat_ccs(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {
> +	if (xe_device_needs_ccs_emit(gt_to_xe(gt)) && !copy_ccs && dst_is_indirect) {


Do we need to call xe_migrate_ccs_copy() when xe_device_needs_ccs_emit() 
is true ? If not then move the check for xe_device_needs_ccs_emit() to 
xe_migrate_copy()

to ensure that xe_migrate_ccs_copy() is not even called on such platforms.

Regards,
Nirmoy

>   		/*
>   		 * If the src is already in vram, then it should already
>   		 * have been cleared by us, or has been populated by the
> @@ -791,6 +791,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   	bool copy_ccs = xe_device_has_flat_ccs(xe) &&
>   		xe_bo_needs_ccs_pages(src_bo) && xe_bo_needs_ccs_pages(dst_bo);
>   	bool copy_system_ccs = copy_ccs && (!src_is_vram || !dst_is_vram);
> +	bool use_comp_pat = GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe) && src_is_vram && !dst_is_vram;
>   
>   	/* Copying CCS between two different BOs is not supported yet. */
>   	if (XE_WARN_ON(copy_ccs && src_bo != dst_bo))
> @@ -833,7 +834,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   
>   		src_L0 = min(src_L0, dst_L0);
>   
> -		batch_size += pte_update_size(m, src_is_vram, false, src, &src_it, &src_L0,
> +		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &src_it, &src_L0,
>   					      &src_L0_ofs, &src_L0_pt, 0, 0,
>   					      avail_pts);
>   
> @@ -852,7 +853,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>   
>   		/* Add copy commands size here */
>   		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
> -			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
> +			((xe_device_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
>   
>   		bb = xe_bb_new(gt, batch_size, usm);
>   		if (IS_ERR(bb)) {
--------------F5SHZYTAuIOOkbM00mWruicP
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Akshata,<br>
    </p>
    <div class="moz-cite-prefix">On 7/12/2024 8:39 AM, Akshata
      Jahagirdar wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com">
      <pre class="moz-quote-pre" wrap="">From: "Jahagirdar, Akshata" <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>

During eviction (vram-&gt;sysmem), we use the mapping from compressed -&gt; uncompressed.
During restore (sysmem-&gt;vram), we need the mapping from uncompressed -&gt; uncompressed.
Handle logic for selecting the compressed identity map for eviction,
and selecting uncompressed map for restore operations.

Signed-off-by: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>
Reviewed-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Reviewed-by: Himal Prasad Ghimiray <a class="moz-txt-link-rfc2396E" href="mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_migrate.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 3b8a334fe08f..1eee6be24423 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -715,7 +715,7 @@ static u32 xe_migrate_ccs_copy(struct xe_migrate *m,
 	struct xe_gt *gt = m-&gt;tile-&gt;primary_gt;
 	u32 flush_flags = 0;
 
-	if (xe_device_has_flat_ccs(gt_to_xe(gt)) &amp;&amp; !copy_ccs &amp;&amp; dst_is_indirect) {
+	if (xe_device_needs_ccs_emit(gt_to_xe(gt)) &amp;&amp; !copy_ccs &amp;&amp; dst_is_indirect) {</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Do we need to call xe_migrate_ccs_copy() when
      xe_device_needs_ccs_emit() is true ? If not then move the check
      for xe_device_needs_ccs_emit() to xe_migrate_copy()</p>
    <p>to ensure that xe_migrate_ccs_copy() is not even called on such
      platforms.</p>
    <span style="white-space: pre-wrap">
</span>
    <pre class="moz-quote-pre" wrap="">
Regards,
Nirmoy
</pre>
    <blockquote type="cite"
cite="mid:c852a9895c203552169a86bc2cdca909340961e0.1720766122.git.akshata.jahagirdar@intel.com">
      <pre class="moz-quote-pre" wrap="">
 		/*
 		 * If the src is already in vram, then it should already
 		 * have been cleared by us, or has been populated by the
@@ -791,6 +791,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 	bool copy_ccs = xe_device_has_flat_ccs(xe) &amp;&amp;
 		xe_bo_needs_ccs_pages(src_bo) &amp;&amp; xe_bo_needs_ccs_pages(dst_bo);
 	bool copy_system_ccs = copy_ccs &amp;&amp; (!src_is_vram || !dst_is_vram);
+	bool use_comp_pat = GRAPHICS_VER(xe) &gt;= 20 &amp;&amp; IS_DGFX(xe) &amp;&amp; src_is_vram &amp;&amp; !dst_is_vram;
 
 	/* Copying CCS between two different BOs is not supported yet. */
 	if (XE_WARN_ON(copy_ccs &amp;&amp; src_bo != dst_bo))
@@ -833,7 +834,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		src_L0 = min(src_L0, dst_L0);
 
-		batch_size += pte_update_size(m, src_is_vram, false, src, &amp;src_it, &amp;src_L0,
+		batch_size += pte_update_size(m, src_is_vram, use_comp_pat, src, &amp;src_it, &amp;src_L0,
 					      &amp;src_L0_ofs, &amp;src_L0_pt, 0, 0,
 					      avail_pts);
 
@@ -852,7 +853,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
 
 		/* Add copy commands size here */
 		batch_size += ((copy_only_ccs) ? 0 : EMIT_COPY_DW) +
-			((xe_device_has_flat_ccs(xe) ? EMIT_COPY_CCS_DW : 0));
+			((xe_device_needs_ccs_emit(xe) ? EMIT_COPY_CCS_DW : 0));
 
 		bb = xe_bb_new(gt, batch_size, usm);
 		if (IS_ERR(bb)) {
</pre>
    </blockquote>
  </body>
</html>

--------------F5SHZYTAuIOOkbM00mWruicP--
