Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50179CAC59A
	for <intel-xe@archiver.kernel.org>; Thu, 18 Sep 2025 09:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B3D10E6C2;
	Thu, 18 Sep 2025 09:52:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cIwT95vX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A984210E6C2
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Sep 2025 09:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758189171; x=1789725171;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=dzd8y+C62z3wtYyXLRjRDhHc7bpi6cBPuAaibKHdcZU=;
 b=cIwT95vX8OBnzpA8D3TmyIDAtu7DIMauadi34IffdBb/NfkeKDX4VXBb
 9+sC69tlyFMd2ouabNz+r4iWcMMHR1YmpaCitpcgMXjyFi6XjUOE46TS0
 c4ATlfsOF2Sc+QEZhC3hq5e49iDG+DlO6XyCGeLlPGS25P6mtw0ma6Xew
 +OMsp4Ukc1kB9vxl/+Ri0Emyk1aVdqost8YjMnT8i8mfsxLy3sHgRhoNT
 iL39kZ3R36Q53WW7w4reht+bI2kald4PNrePSO5PCnKHmNzqT6YMM7HRV
 4L5rNZRVTi00iFn/c0EmSHGl2YjkSifc5TldcjtSn2ZPd3TJcR8ZMgZEu A==;
X-CSE-ConnectionGUID: m/wRQzmuQtaZGelhs5wiKw==
X-CSE-MsgGUID: Lr+ig+WiTH6QV7JExs2rhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71882207"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="71882207"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:52:50 -0700
X-CSE-ConnectionGUID: PIE3yrSPQRWy0x4QLqhMUw==
X-CSE-MsgGUID: ZylD5K3MTCimTu5KqDUVnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; d="scan'208";a="180611837"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.244.228])
 ([10.245.244.228])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 02:52:49 -0700
Message-ID: <5ff89dc5-d1e8-44ab-88ea-67fb7254ee21@intel.com>
Date: Thu, 18 Sep 2025 10:52:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe: Pre-allocate system memory for pinned
 external bos in the pm notfier
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250918092207.54472-1-thomas.hellstrom@linux.intel.com>
 <20250918092207.54472-3-thomas.hellstrom@linux.intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250918092207.54472-3-thomas.hellstrom@linux.intel.com>
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

On 18/09/2025 10:22, Thomas Hellström wrote:
> Similarly to what we do for other pinned bos, pre-allocate
> system memory for pinned external bos in the pm notifier,
> where swapping is still possible.
> 
> This hasn't been needed until now when we're about to allow
> pinning of exernal VRAM bos.
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_bo_evict.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c b/drivers/gpu/drm/xe/xe_bo_evict.c
> index d5dbc51e8612..1a12675b2ea9 100644
> --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> @@ -73,6 +73,11 @@ int xe_bo_notifier_prepare_all_pinned(struct xe_device *xe)
>   					    &xe->pinned.late.kernel_bo_present,
>   					    xe_bo_notifier_prepare_pinned);
>   
> +	if (!ret)
> +		ret = xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
> +					    &xe->pinned.late.external,
> +					    xe_bo_notifier_prepare_pinned);
> +
>   	return ret;
>   }
>   
> @@ -93,6 +98,10 @@ void xe_bo_notifier_unprepare_all_pinned(struct xe_device *xe)
>   	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.kernel_bo_present,
>   				    &xe->pinned.late.kernel_bo_present,
>   				    xe_bo_notifier_unprepare_pinned);
> +
> +	(void)xe_bo_apply_to_pinned(xe, &xe->pinned.late.external,
> +				    &xe->pinned.late.external,
> +				    xe_bo_notifier_unprepare_pinned);
>   }
>   
>   /**

