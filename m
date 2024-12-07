Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7813AE7716E
	for <intel-xe@archiver.kernel.org>; Sat,  7 Dec 2024 07:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1121B10E1B0;
	Sat,  7 Dec 2024 07:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I7kYdspi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CC810E1B0
 for <intel-xe@lists.freedesktop.org>; Sat,  7 Dec 2024 07:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733556481; x=1765092481;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to;
 bh=0pR0jBC5lQqEZK35Q4KAwjuDDW3yc+m89yKI6/snIwY=;
 b=I7kYdspi2qHrhLQT2LmKJHes7Nfxsc198mCh/1Yld8Rvsudlxw5xcjgv
 9a0pNO0ARu5YIyxgQVmNyPlgDwWP8u5NeOy3wbXZ7B+s7RezWZAWOuTMv
 xrfXbt6DZyDufNNR3swhfvVVDd3ASSPYr51kbVj+dX3gM52AEeddX5xbx
 /HIrqGbTAfd5Djkcl5TuMS+i+giF/eqDJNCcAqQAuWj2ZEPoOywoJXGqP
 22eExM4YjuJooyg5sTBWfG4ukYy72U7qMOK1E16Vdy2Zqbuo3EgPD+jyX
 v1odepEjRE/76+wwfPDh7RUgUzhnH0bwMe2uLpxZg/3AbSh9ntQQKVoMz Q==;
X-CSE-ConnectionGUID: XRoaq0kOSDW1pSrj5nxc8A==
X-CSE-MsgGUID: /2qPxteHQ3+Z3TiZShbo/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45293543"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208,217";a="45293543"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 23:28:00 -0800
X-CSE-ConnectionGUID: DnS1i1dFTEm9VcPt4QFvOw==
X-CSE-MsgGUID: jKIiNoqERxORv27+2xQ9gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,215,1728975600"; d="scan'208,217";a="94412971"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.144.53])
 ([10.245.144.53])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 23:27:58 -0800
Content-Type: multipart/alternative;
 boundary="------------PZb1GRz0GOsz8GM90tkIiJB2"
Message-ID: <103d96a4-753b-4dd1-9e43-e75b12ef10bf@linux.intel.com>
Date: Sat, 7 Dec 2024 08:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_sync: Add debug printing to check_ufence
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, rodrigo.vivi@intel.com
References: <20241206181155.87070-1-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241206181155.87070-1-jonathan.cavitt@intel.com>
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
--------------PZb1GRz0GOsz8GM90tkIiJB2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/6/2024 7:11 PM, Jonathan Cavitt wrote:
> The xe_sync helper function check_ufence can occasionally report EBUSY
> if the ufence has not been signalled yet.  EBUSY is a non-fatal error
> value for the function, so it is not desireable to warn in cases where
> EBUSY is reported because it is up to the user to decide if EBUSY is a
> fatal error in their use cases.  However, we can and should report EBUSY
> to the debug logs for diagnostic purposes.
>
> v2: Use vm_dbg instead of XE_IOCTL_DBG (Rodrigo)
>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 74d684708b00..8c770d1b916c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -2402,8 +2402,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_REMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.remap.unmap->va));
> -		if (err)
> +		if (err) {
> +			vm_dbg(&vm->xe->drm,
> +			       "REMAP: vma check ufence status = %i\n", err);

Move that to check_ufence() instead so there there is only one copy of logging ?

Regards,

Nirmoy


>  			break;
> +		}
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.remap.unmap->va),
> @@ -2415,8 +2418,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  		break;
>  	case DRM_GPUVA_OP_UNMAP:
>  		err = check_ufence(gpuva_to_vma(op->base.unmap.va));
> -		if (err)
> +		if (err) {
> +			vm_dbg(&vm->xe->drm,
> +			       "UNMAP: vma check ufence status = %i\n", err);
>  			break;
> +		}
>  
>  		err = vma_lock_and_validate(exec,
>  					    gpuva_to_vma(op->base.unmap.va),
--------------PZb1GRz0GOsz8GM90tkIiJB2
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
    <div class="moz-cite-prefix">On 12/6/2024 7:11 PM, Jonathan Cavitt
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20241206181155.87070-1-jonathan.cavitt@intel.com">
      <pre wrap="" class="moz-quote-pre">The xe_sync helper function check_ufence can occasionally report EBUSY
if the ufence has not been signalled yet.  EBUSY is a non-fatal error
value for the function, so it is not desireable to warn in cases where
EBUSY is reported because it is up to the user to decide if EBUSY is a
fatal error in their use cases.  However, we can and should report EBUSY
to the debug logs for diagnostic purposes.

v2: Use vm_dbg instead of XE_IOCTL_DBG (Rodrigo)

Signed-off-by: Jonathan Cavitt <a class="moz-txt-link-rfc2396E" href="mailto:jonathan.cavitt@intel.com">&lt;jonathan.cavitt@intel.com&gt;</a>
CC: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_vm.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 74d684708b00..8c770d1b916c 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2402,8 +2402,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_REMAP:
 		err = check_ufence(gpuva_to_vma(op-&gt;base.remap.unmap-&gt;va));
-		if (err)
+		if (err) {
+			vm_dbg(&amp;vm-&gt;xe-&gt;drm,
+			       "REMAP: vma check ufence status = %i\n", err);</pre>
    </blockquote>
    <p>Move that to <span
      style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
      class="hljs diff colorediffs language-diff">check_ufence() instead so there there is only one copy of logging ?
</span></p>
    <p><span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
      class="hljs diff colorediffs language-diff">Regards,</span></p>
    <p><span style="padding: 0px; tab-size: 8; white-space: pre-wrap;"
      class="hljs diff colorediffs language-diff">Nirmoy
</span></p>
    <br>
    <blockquote type="cite"
      cite="mid:20241206181155.87070-1-jonathan.cavitt@intel.com">
      <pre wrap="" class="moz-quote-pre">
 			break;
+		}
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op-&gt;base.remap.unmap-&gt;va),
@@ -2415,8 +2418,11 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
 		break;
 	case DRM_GPUVA_OP_UNMAP:
 		err = check_ufence(gpuva_to_vma(op-&gt;base.unmap.va));
-		if (err)
+		if (err) {
+			vm_dbg(&amp;vm-&gt;xe-&gt;drm,
+			       "UNMAP: vma check ufence status = %i\n", err);
 			break;
+		}
 
 		err = vma_lock_and_validate(exec,
 					    gpuva_to_vma(op-&gt;base.unmap.va),
</pre>
    </blockquote>
  </body>
</html>

--------------PZb1GRz0GOsz8GM90tkIiJB2--
