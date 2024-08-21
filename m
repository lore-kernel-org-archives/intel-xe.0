Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C633C52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 18:15:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A1C10E137;
	Wed, 21 Aug 2024 18:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdKZc0s/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B19B10E137
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724264144; x=1755800144;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=ljlHig5YcCy38zVkR9nWGw6utvxHczpr0QLEobOR1qU=;
 b=TdKZc0s/etAfEqjYlz7jjIB/tI3+QCrndopU0ncw/cfKsJZxLRs5jRs/
 OBlf14cIO86cOAFvda8rBXelTbmI7RdUGPRJ8pcJfXMWRfq3qCQtFNKPR
 /VSIg37MouAOYLMKVaI7ZFPvMjuZh3ljyh3fLjPnGx+NxlyPAisXlWs0w
 68mk6dtrAUe8u3d24qt6QZvOWbhHUIb7/pPx6P9CCFOK/51izRkn5CTcW
 G/mzijVFZ08oNm2krr0yHziTopPa8C4hHvjI2kCSERQ6rF4KhCR8PcmV1
 BVE+5F/oNYEgUu68/bY4LuZ+clBXvZiIbnmi4c3etNO7DUNdtiEpCbtBN A==;
X-CSE-ConnectionGUID: 3Up8rThcSE6ZkxfhThBiqQ==
X-CSE-MsgGUID: 0/AutBTRTbC65dZ7wMFcAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22812218"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208,217";a="22812218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 11:15:15 -0700
X-CSE-ConnectionGUID: rdGxINfCR9+8p7PfG9YqdA==
X-CSE-MsgGUID: Zee1p4ewRT62oSpLkta8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208,217";a="65862125"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.246.49.79])
 ([10.246.49.79])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 11:15:14 -0700
Content-Type: multipart/alternative;
 boundary="------------w8G5szoZghUWYgs80g6v0p5y"
Message-ID: <5054f198-9819-45af-ad17-0bf22b12e3ad@linux.intel.com>
Date: Wed, 21 Aug 2024 20:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: fixup xe_alloc_pf_queue
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240821171917.417386-2-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240821171917.417386-2-matthew.auld@intel.com>
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
--------------w8G5szoZghUWYgs80g6v0p5y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/21/2024 7:19 PM, Matthew Auld wrote:
> kzalloc expects number of bytes, therefore we should convert the number
> of dw into bytes, otherwise we are likely just accessing beyond the
> array causing all kinds of carnage. Also fixup the error handling while
> we are here.
>
> Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
> Cc: Stuart Summers<stuart.summers@intel.com>
> Cc: Matthew Brost<matthew.brost@intel.com>

Nice catch, I was staring at 3338e4f90c14 for a while. We should get 
this merged soon.

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>


> ---
>   drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> index 401c0527d914..e4510e56e4a2 100644
> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> @@ -417,7 +417,10 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
>   		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
>   
>   	pf_queue->gt = gt;
> -	pf_queue->data = kzalloc(pf_queue->num_dw, GFP_KERNEL);
> +	pf_queue->data = kzalloc(pf_queue->num_dw * sizeof(u32), GFP_KERNEL);
> +	if (!pf_queue->data)
> +		return -ENOMEM;
> +
>   	spin_lock_init(&pf_queue->lock);
>   	INIT_WORK(&pf_queue->worker, pf_queue_work_func);
>   
--------------w8G5szoZghUWYgs80g6v0p5y
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
    <div class="moz-cite-prefix">On 8/21/2024 7:19 PM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240821171917.417386-2-matthew.auld@intel.com">
      <pre wrap="" class="moz-quote-pre">kzalloc expects number of bytes, therefore we should convert the number
of dw into bytes, otherwise we are likely just accessing beyond the
array causing all kinds of carnage. Also fixup the error handling while
we are here.

Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault queue size")
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Stuart Summers <a class="moz-txt-link-rfc2396E" href="mailto:stuart.summers@intel.com">&lt;stuart.summers@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a></pre>
    </blockquote>
    <p>Nice catch, I was staring at <span style="white-space: pre-wrap">3338e4f90c14 for a while. We should get this merged soon.</span></p>
    <p>Reviewed-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a></p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20240821171917.417386-2-matthew.auld@intel.com">
      <pre wrap="" class="moz-quote-pre">
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 401c0527d914..e4510e56e4a2 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -417,7 +417,10 @@ static int xe_alloc_pf_queue(struct xe_gt *gt, struct pf_queue *pf_queue)
 		(num_eus + XE_NUM_HW_ENGINES) * PF_MSG_LEN_DW;
 
 	pf_queue-&gt;gt = gt;
-	pf_queue-&gt;data = kzalloc(pf_queue-&gt;num_dw, GFP_KERNEL);
+	pf_queue-&gt;data = kzalloc(pf_queue-&gt;num_dw * sizeof(u32), GFP_KERNEL);
+	if (!pf_queue-&gt;data)
+		return -ENOMEM;
+
 	spin_lock_init(&amp;pf_queue-&gt;lock);
 	INIT_WORK(&amp;pf_queue-&gt;worker, pf_queue_work_func);
 
</pre>
    </blockquote>
  </body>
</html>

--------------w8G5szoZghUWYgs80g6v0p5y--
