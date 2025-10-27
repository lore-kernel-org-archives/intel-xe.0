Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49067CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:52:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3D089CC4;
	Mon, 27 Oct 2025 16:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K0Z4UFun";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C5C510E160
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761583929; x=1793119929;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q7QVeoFCHYLzewhWzE9U9pkIU25Vf5UNGpYWeAKCJfE=;
 b=K0Z4UFuntr8WVf4HnESyujs29hoUgcJgnB/hSfgEAM/cU3z6qNnr7RrN
 yO6zzUJ4WHhHZXWoSDpIFxWStRbX9guUOiZjn6FikCqug3d0egQyAvAiD
 EboNnnyyyvjdXccSl3MTCHbmAQND4BcUWEqjhS7v3xiEsD8RweTXiYmuF
 5ZFb2ZUrCBm2+TCZp9xy9nKqhnRYTjO6FRKNxcTrmZJmhgE1LgEvcmgPG
 ueJC8Gm/8kqHH82nVqo9EDFFrMYSOqvzt5d5/Gn+xpM+AjlSOSj4XCVIV
 ZWXGa9dN17a5xZ+16JrKQnAcmltjzdRCvbGG081bKXdk1e0lXrDYPpStj w==;
X-CSE-ConnectionGUID: m/pMJoOCS6S2FuUylVbf0w==
X-CSE-MsgGUID: XeKwShepQ/C5+cijnMD4rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86300105"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="86300105"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:52:09 -0700
X-CSE-ConnectionGUID: QM800sa5QtSIuj6LcG4Q7g==
X-CSE-MsgGUID: zoH6zx8cRZSRnxgre2fphQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="222302687"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.79])
 ([10.245.244.79])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:52:08 -0700
Message-ID: <a10df375-a490-4a8f-b583-89fff73d5402@intel.com>
Date: Mon, 27 Oct 2025 17:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix uninitialized return value from
 xe_validation_guard()
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
References: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@intel.com>
In-Reply-To: <20251027131228.12098-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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

Glad to see it fixed!

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Den 2025-10-27 kl. 14:12, skrev Thomas Hellström:
> The parameter _ret is assigned in xe_validation_guard() not
> realizing we're assigning a parameter in a function rather than
> in a macro. That means it's value is not propagated to the caller.
>
> Fix this by making the _ret parameter a pointer.
>
> Fixes: c460bc2311df ("drm/xe: Introduce an xe_validation wrapper around drm_exec")
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6220
> Cc: Maarten Lankhorst <maarten.lankhorst@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_validation.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
> index fec331d791e7..b2d09c596714 100644
> --- a/drivers/gpu/drm/xe/xe_validation.h
> +++ b/drivers/gpu/drm/xe/xe_validation.h
> @@ -166,10 +166,10 @@ xe_validation_device_init(struct xe_validation_device *val)
>   */
>  DEFINE_CLASS(xe_validation, struct xe_validation_ctx *,
>  	     if (_T) xe_validation_ctx_fini(_T);,
> -	     ({_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
> -	       _ret ? NULL : _ctx; }),
> +	     ({*_ret = xe_validation_ctx_init(_ctx, _val, _exec, _flags);
> +	       *_ret ? NULL : _ctx; }),
>  	     struct xe_validation_ctx *_ctx, struct xe_validation_device *_val,
> -	     struct drm_exec *_exec, const struct xe_val_flags _flags, int _ret);
> +	     struct drm_exec *_exec, const struct xe_val_flags _flags, int *_ret);
>  static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>  {return *_T; }
>  #define class_xe_validation_is_conditional true
> @@ -186,7 +186,7 @@ static inline void *class_xe_validation_lock_ptr(class_xe_validation_t *_T)
>   * exhaustive eviction.
>   */
>  #define xe_validation_guard(_ctx, _val, _exec, _flags, _ret)		\
> -	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
> +	scoped_guard(xe_validation, _ctx, _val, _exec, _flags, &_ret) \
>  	drm_exec_until_all_locked(_exec)
>  
>  #endif

