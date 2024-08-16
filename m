Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BF7C3DA4A
	for <intel-xe@archiver.kernel.org>; Fri, 16 Aug 2024 08:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232110E5DC;
	Fri, 16 Aug 2024 08:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqLiAW91";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C237A10E5DC
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Aug 2024 08:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723797147; x=1755333147;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to; bh=Eh+ux1sS/e2dcfctL0CdaulmJBp7LSo62xOzfDhJIzI=;
 b=jqLiAW91yOCX0dJwVWok2yacWUcoe+4cdtefIDphAWN3kQykl3oBFs84
 X23gh4eZCQ/xG6dPHC6CXHfXreSb+cp2Mq/qs872zMblN4WGAgmG/2W5b
 CEr4gfy2EleoJ0vA+LzI0d7IB1HSx75qu+FS73WMa2BWJjcgvn1lDiR4I
 TIStqHiJy7mrF3JrfgwiOzD0FpJu6QOmVORVNNPp4AR1BQDxJHMHoiLvu
 UGxsOfpS1oxJhWe1JuWUDv+xH/yommInrQ1b++Qcaa5A6Q++hhKH/tDJ4
 tC2F6ApUFudD1eT67b8FmLsnx2L1p5YnVulH7KIfhgopmc/oq6j5PicKN g==;
X-CSE-ConnectionGUID: 6lg0+vetSF+tafBpN/dtSw==
X-CSE-MsgGUID: ylcuVEIPRk+x4kxkOUHiOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="33237775"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208,217";a="33237775"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:32:27 -0700
X-CSE-ConnectionGUID: +xT9vVP7Ro2HbLz30N7zUQ==
X-CSE-MsgGUID: uTbsfFFUTx+t0r5vO5d08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208,217";a="60397396"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.146.109])
 ([10.245.146.109])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 01:32:25 -0700
Content-Type: multipart/alternative;
 boundary="------------GtI9Vv0tUmhE0eJ76gNR1Ne8"
Message-ID: <9385ef7d-e2dc-4319-af5b-ca7d66aa9ee8@linux.intel.com>
Date: Fri, 16 Aug 2024 10:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Remove NULL check of lrc->bo in
 xe_lrc_snapshot_capture()
To: apoorva.singh@intel.com, intel-xe@lists.freedesktop.org
References: <20240816080355.897256-1-apoorva.singh@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240816080355.897256-1-apoorva.singh@intel.com>
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
--------------GtI9Vv0tUmhE0eJ76gNR1Ne8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/16/2024 10:03 AM, apoorva.singh@intel.com wrote:
> From: Apoorva Singh<apoorva.singh@intel.com>
>
> - lrc->bo NULL check is not needed in xe_lrc_snapshot_capture() as
>    its already been taken care of in xe_lrc_init().

It should be rather "it is always initialized in xe_lrc_init() ". With that

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


>
> Signed-off-by: Apoorva Singh<apoorva.singh@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 974a9cd8c379..aec7db39c061 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
>   	if (!snapshot)
>   		return NULL;
>   
> -	if (lrc->bo && lrc->bo->vm)
> +	if (lrc->bo->vm)
>   		xe_vm_get(lrc->bo->vm);
>   
>   	snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
--------------GtI9Vv0tUmhE0eJ76gNR1Ne8
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
    <div class="moz-cite-prefix">On 8/16/2024 10:03 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:apoorva.singh@intel.com">apoorva.singh@intel.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240816080355.897256-1-apoorva.singh@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Apoorva Singh <a class="moz-txt-link-rfc2396E" href="mailto:apoorva.singh@intel.com">&lt;apoorva.singh@intel.com&gt;</a>

- lrc-&gt;bo NULL check is not needed in xe_lrc_snapshot_capture() as
  its already been taken care of in xe_lrc_init().</pre>
    </blockquote>
    <p>It should be rather "it is always initialized in <span
      style="white-space: pre-wrap">xe_lrc_init</span>()
      ". With that <br>
    </p>
    <p>Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a><br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240816080355.897256-1-apoorva.singh@intel.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Apoorva Singh <a class="moz-txt-link-rfc2396E" href="mailto:apoorva.singh@intel.com">&lt;apoorva.singh@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_lrc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
index 974a9cd8c379..aec7db39c061 100644
--- a/drivers/gpu/drm/xe/xe_lrc.c
+++ b/drivers/gpu/drm/xe/xe_lrc.c
@@ -1649,7 +1649,7 @@ struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
 	if (!snapshot)
 		return NULL;
 
-	if (lrc-&gt;bo &amp;&amp; lrc-&gt;bo-&gt;vm)
+	if (lrc-&gt;bo-&gt;vm)
 		xe_vm_get(lrc-&gt;bo-&gt;vm);
 
 	snapshot-&gt;context_desc = xe_lrc_ggtt_addr(lrc);
</pre>
    </blockquote>
  </body>
</html>

--------------GtI9Vv0tUmhE0eJ76gNR1Ne8--
