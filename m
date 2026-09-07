Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0554CC79F9E
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E0D410E79B;
	Mon,  7 Sep 2026 11:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jv92QUYm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8B2110E4AB
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788780510; x=1820316510;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aJheVqJwlZxhCqD2oyrClow3I3ilOoAlq7HflCMMx0o=;
 b=Jv92QUYm9+K7qfMFsaD+zxTcxab4/yuB+9ckJoTMFpbfqgUzq4LFc4Ow
 SWtAbNW+vWuXO37QmhCyvbVrlwfq3kxgaTirtraenjfcP1cAMR1EOCUb1
 +nU65UdI9oc4rH0yFZ+GGQernhEvdzRpvIfKN9ib/CmkKtcSXBFcOdO4k
 xLQVxnWRBozb8YDHXlue7ISTgvq4QUpa3964sKisvEY8TVzmNewK0V1Gr
 2P2XOeHRZkGT3eY/JFd3QHyQq4eM/F/P1N6ib6zVvy5/+yBxpHhbQBop9
 kNDPTnMI2v2LgLELXxIvsnqzgCInOvMk7mDbD6yJRN9B6A3S5zJtCOKeK Q==;
X-CSE-ConnectionGUID: Da9evyOLTmmPfy0VgowdNw==
X-CSE-MsgGUID: xe7AH+TFQWOXurs6dRsPrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="114724894"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="114724894"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:28:29 -0700
X-CSE-ConnectionGUID: Bg8LT6rpTE6K3WYhNJrdVA==
X-CSE-MsgGUID: 3wAunSJ/TImR8AMKXqjMyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274488557"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.245.247])
 ([10.245.245.247])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:28:28 -0700
Message-ID: <5862851e-1648-4c02-8fdb-9703433ceb09@intel.com>
Date: Mon, 7 Sep 2026 12:28:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe: Flush LSC untyped L1 dataport cache after
 rcs/ccs batches
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 stable@vger.kernel.org
References: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20260903114552.48634-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 03/09/2026 12:45, Thomas Hellström wrote:
> emit_render_cache_flush() sets PIPE_CONTROL0_HDC_PIPELINE_FLUSH to
> flush the L2/HDC data cache before fence signalling, but it never
> requests a flush of the LSC untyped L1 data cache via the 'Untyped
> Data-Port Cache Flush Enable' bit in PIPE_CONTROL DWord0[11].
> 
> Per the Bspec, in 3D pipeline mode HDC Pipeline Flush is documented to
> also flush/invalidate the untyped L1 cache, but only depending on how
> HDC_CHICKEN0[13:11] is programmed. Starting with MTL, this coupling
> between HDC Pipeline Flush and the untyped L1 cache flush no longer
> holds in practice, regardless of how HDC_CHICKEN0 is programmed, so
> relying on it is not safe on newer platforms such as BMG. Mesa's Vulkan
> driver (anv) has been assuming the kernel flushes both caches between
> submissions, and hit user-visible corruption in apps such as Llama.cpp
> because of this gap; it now works around it by flushing both caches
> again from userspace at the end of every command buffer.
> 
> Correctness between submissions on the same queue is userspace's
> responsibility and belongs in Mesa, not the kernel. However, for
> security we must ensure stale data can't leak through the untyped L1
> dataport cache once memory is reclaimed or evicted, which requires the
> KMD to flush it before releasing memory for reuse.
> 
> Prior to MTL, HDC_CHICKEN0 could be programmed (as already done for
> DG2 via Wa_22010960976/Wa_14013347512) to reliably keep HDC Pipeline
> Flush coupled to the untyped L1 cache flush, so those platforms are
> unaffected. Mesa's own anv driver found that on MTL the HW
> disconnected the two independently of how HDC_CHICKEN0 is programmed,
> and could not bring the old behavior back even by writing the register
> by hand; see Mesa commit 7c2ff46a4fc3 ("anv: don't prevent L1 untyped
> cache flush in 3D mode"). The kernel can't reliably request the flush
> from the CS on MTL either, so restrict the new PIPE_CONTROL bit to
> GRAPHICS_VERx100 >= 2000 (Xe2 and later), where it can be relied on.
> 
> Explicitly set PIPE_CONTROL0_UNTYPED_DATAPORT_CACHE_FLUSH together
> with PIPE_CONTROL0_HDC_PIPELINE_FLUSH in emit_render_cache_flush() on
> Xe2 and later, so the L1 data cache is known clean before memory is
> released for reuse, without depending on undocumented
> platform-specific HDC_CHICKEN0 behavior.
> 
> Bspec: 56551
> Link: https://gitlab.freedesktop.org/mesa/mesa/-/commit/7c2ff46a4fc3e537573ac9503057e0cd29b6fff3
> Fixes: 9f8f93bee3ef ("drm/xe: Emit a render cache flush after each rcs/ccs batch")
> Reported-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/8909
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.8+
> Assisted-by: GitHub_Copilot:claude-sonnet-5
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com> #v1

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
