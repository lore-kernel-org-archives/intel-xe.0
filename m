Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF1C369B5
	for <intel-xe@archiver.kernel.org>; Wed, 25 Sep 2024 09:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5124810E2E3;
	Wed, 25 Sep 2024 09:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LOFobdMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239D10E2E3
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Sep 2024 09:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727256799; x=1758792799;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=wMRbpP5wTNldCmehbFsAGUDuGhYIlxtaTMst/yNgong=;
 b=LOFobdMFXkuEOUiZDXPQcAD01PF0KYIR9tYyobiFo9dHBlkRAZvM6Y/7
 OZBJKZVTCkH5bIbwGNyIPcXMESHxYzBpGjtmKYr8gWcTo8PLUMagPZWj3
 Wu3aTTWL1O9ZGlwfFpYN8IA3ZPJ4ag3cBrR9FzZoa0HmNP3fa4Q9+1p9j
 1GWXEQUZ3rJU92dbF/OvwgSqbJusNkCfSxlueZol0zW/P7Tlv/UM+ll2s
 i6xYb0H/dUu4k/OwyyEwwTRdlpnsKa3I+GY7mefQVv9FTgyPy1bWw0xc1
 KWH9ydS/AFXBmedZjXnw3lg5OfZru0VRW54m+FcDao/VbWOqRXe5MVVTG Q==;
X-CSE-ConnectionGUID: Q3fNWyrSRmei2D/B2rM6dg==
X-CSE-MsgGUID: fSPpMwGeR6KPdln4Q10mFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="26474230"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208,217";a="26474230"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:33:17 -0700
X-CSE-ConnectionGUID: s6ViecnNS7eTgjNkbPgMoA==
X-CSE-MsgGUID: 0TRwz89pTbKOWYW6SWg0LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; d="scan'208,217";a="95043027"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.178.53])
 ([10.245.178.53])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 02:33:16 -0700
Content-Type: multipart/alternative;
 boundary="------------00Q50X0NRl4K8JmuVcXoP1Kn"
Message-ID: <598b2e8c-a50f-42ec-a6c0-749b0ae507b6@linux.intel.com>
Date: Wed, 25 Sep 2024 11:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/queue: move xa_alloc to prevent UAF
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20240925071426.144015-3-matthew.auld@intel.com>
 <20240925071426.144015-4-matthew.auld@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20240925071426.144015-4-matthew.auld@intel.com>
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
--------------00Q50X0NRl4K8JmuVcXoP1Kn
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 9/25/2024 9:14 AM, Matthew Auld wrote:
> Evil user can guess the next id of the queue before the ioctl completes
> and then call queue destroy ioctl to trigger UAF since create ioctl is
> still referencing the same queue. Move the xa_alloc all the way to the end
> to prevent this.

The commit message doesn't match the diff, xa_alloc already happening at the end here.

>
> v2:
>  - Rebase
>
> Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 7743ebdcbf4b..d098d2dd1b2d 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  		}
>  	}
>  
> +	q->xef = xe_file_get(xef);
> +
> +	/* user id alloc must always be last in ioctl to prevent UAF */
>  	err = xa_alloc(&xef->exec_queue.xa, &id, q, xa_limit_32b, GFP_KERNEL);
>  	if (err)
>  		goto kill_exec_queue;
>  
>  	args->exec_queue_id = id;
> -	q->xef = xe_file_get(xef);
>  
>  	return 0;
>  
--------------00Q50X0NRl4K8JmuVcXoP1Kn
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
    <div class="moz-cite-prefix">On 9/25/2024 9:14 AM, Matthew Auld
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240925071426.144015-4-matthew.auld@intel.com">
      <pre wrap="" class="moz-quote-pre">Evil user can guess the next id of the queue before the ioctl completes
and then call queue destroy ioctl to trigger UAF since create ioctl is
still referencing the same queue. Move the xa_alloc all the way to the end
to prevent this.</pre>
    </blockquote>
    <p>The commit message doesn't match the diff, <span
      style="white-space: pre-wrap">xa_alloc already happening at the end here</span>.</p>
    <blockquote type="cite"
      cite="mid:20240925071426.144015-4-matthew.auld@intel.com">
      <pre wrap="" class="moz-quote-pre">

v2:
 - Rebase

Fixes: 2149ded63079 ("drm/xe: Fix use after free when client stats are captured")
Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_exec_queue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
index 7743ebdcbf4b..d098d2dd1b2d 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.c
+++ b/drivers/gpu/drm/xe/xe_exec_queue.c
@@ -635,12 +635,14 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
+	q-&gt;xef = xe_file_get(xef);
+
+	/* user id alloc must always be last in ioctl to prevent UAF */
 	err = xa_alloc(&amp;xef-&gt;exec_queue.xa, &amp;id, q, xa_limit_32b, GFP_KERNEL);
 	if (err)
 		goto kill_exec_queue;
 
 	args-&gt;exec_queue_id = id;
-	q-&gt;xef = xe_file_get(xef);
 
 	return 0;
 
</pre>
    </blockquote>
  </body>
</html>

--------------00Q50X0NRl4K8JmuVcXoP1Kn--
