Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88087CED624
	for <intel-xe@archiver.kernel.org>; Tue, 18 Nov 2025 11:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4065210E48E;
	Tue, 18 Nov 2025 11:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e2p8Wt0r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA60B10E48E
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Nov 2025 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763467084; x=1795003084;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UR5CO5nbfFCdyoz9Fpmx8J4Izzr2vVogahrJJYc4ywU=;
 b=e2p8Wt0rKipB8pOs3pIP13NbDvTLllcR7CU0YihZhPl0cTWI8wrFIfJW
 XmQbfnc+3qmudbz2y7ggi3CW7BgUZZlHCFbUvs55JC80GmLIsUgczkHes
 KF7YifBvL2hMPLpQy1KXewlMUIPfhA4Gx4XczEEYFYRYqPBGu7hnW7GjJ
 bodvQQ/y4+yHeL77pKyajc8salJnaiVZSAbivVaZ8haAwIc2WRiXSQcyf
 ztcMXWop6n6QxW9IrLw9rGZf7RlnTLH0qJMPPpr2TxG0VLAdyim9C+WAA
 HZsrfyAN52mNeXrT5yBr1cn/WsPMjSLTpAGElbFfNglLstzN5QxdSNv3u A==;
X-CSE-ConnectionGUID: +fkLSmTaSCikf7uDYObRrw==
X-CSE-MsgGUID: HcBWXlsjR6uChI/0ikThdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="82876154"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="82876154"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:58:03 -0800
X-CSE-ConnectionGUID: Va9w912XTYuaOYuo8xDsSA==
X-CSE-MsgGUID: FmwtGgsEQRe0mZhvmQawqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190766149"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.245.117])
 ([10.245.245.117])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 03:58:03 -0800
Message-ID: <cfd3a3de-068a-49eb-873f-f08b9aab30c7@intel.com>
Date: Tue, 18 Nov 2025 11:57:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/oa: Fix potential UAF in
 xe_oa_add_config_ioctl()
To: Sanjay Yadav <sanjay.kumar.yadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
References: <20251118114859.3379952-2-sanjay.kumar.yadav@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20251118114859.3379952-2-sanjay.kumar.yadav@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 18/11/2025 11:49, Sanjay Yadav wrote:
> In xe_oa_add_config_ioctl(), we accessed oa_config->id after dropping
> metrics_lock. Since this lock protects the lifetime of oa_config, an
> attacker could guess the id and call xe_oa_remove_config_ioctl() with
> perfect timing, freeing oa_config before we dereference it, leading to
> a potential use-after-free.
> 
> Fix this by caching the id in a local variable while holding the lock.
> 
> v2: (Matt A)
> - Dropped mutex_unlock(&oa->metrics_lock) ordering change from
>    xe_oa_remove_config_ioctl()
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6614
> Fixes: cdf02fe1a94a7 ("drm/xe/oa/uapi: Add/remove OA config perf ops")
> Cc: <stable@vger.kernel.org> # v6.11+
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index 87a2bf53d661..890c363282ae 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -2403,11 +2403,13 @@ int xe_oa_add_config_ioctl(struct drm_device *dev, u64 data, struct drm_file *fi
>   		goto sysfs_err;
>   	}
>   
> -	mutex_unlock(&oa->metrics_lock);
> +	id = oa_config->id;
> +
> +	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, id);
>   
> -	drm_dbg(&oa->xe->drm, "Added config %s id=%i\n", oa_config->uuid, oa_config->id);
> +	mutex_unlock(&oa->metrics_lock);
>   
> -	return oa_config->id;
> +	return id;
>   
>   sysfs_err:
>   	mutex_unlock(&oa->metrics_lock);

