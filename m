Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D0EC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 13:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDE210E453;
	Tue,  4 Jun 2024 13:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bLRDT5DS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E3910E453
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 13:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717506729; x=1749042729;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=u7ZmhYmt1b5GVVG9HvBYWGLSHcs0RHTXcOWE6pubeFE=;
 b=bLRDT5DSaNVYvBd+D/XPszNxMWFp/5DmSh3kQD0rT3KW/Ea/rWS6vTwg
 Ai3MLczHi1Rec4TmKj8o0S3iaXmugLiSrxgxtnUfhUorUaVNBLdNMu3cC
 6BX1iTBvX7ZATVD2XyDMpB1bdWZepXjmVRWYeKUxvl41KLWkspjmKc6BW
 nJBjX+9q0Cs8+2gFwMw0xV7W1GOajaONIWJE1TmTtQN8Fiuht24xbEjNS
 OePXQUj7NadtbrwTNMrduOawIMKGE32vJ6rT5S5ZPzFWFsKYbF4iiTZkH
 NeuDmC5Eg5fUndCvwQ8G8KVhtBYbN+G5X0TN/Zkb+pd1k5dvdU5eqNtqd A==;
X-CSE-ConnectionGUID: 377zfiYeTTm09fb0/KBIPQ==
X-CSE-MsgGUID: /DPJAHqyQAqiYxPtBDSuPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="13931104"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="13931104"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 06:12:08 -0700
X-CSE-ConnectionGUID: mHuEgRwvSaKGbFeAE6yWEA==
X-CSE-MsgGUID: 7TFCH9HQRsatJjFi9FvYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="42174707"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa005.jf.intel.com with ESMTP; 04 Jun 2024 06:12:06 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 0CC29125AF;
 Tue,  4 Jun 2024 14:12:04 +0100 (IST)
Message-ID: <e4a9c72c-ea14-4aad-9020-d7e503baa59e@intel.com>
Date: Tue, 4 Jun 2024 15:12:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/xe/xe_reg_sr: Always call xe_force_wake_put/get
 in pairs
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-4-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240604110225.29495-4-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8
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



On 04.06.2024 13:02, Nirmoy Das wrote:
> xe_force_wake_get() increments the domain ref regardless of success
> or failure so call xe_force_wake_put() even on failure to keep ref
> count accurate.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_reg_sr.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 440ac572f6e5..8fcc08658d89 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -201,13 +201,11 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	xa_for_each(&sr->xa, reg, entry)
>  		apply_one_mmio(gt, entry);
>  
> -	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> -
> -	return;
> -
>  err_force_wake:
> -	xe_gt_err(gt, "Failed to apply, err=%d\n", err);
> +	if (err)
> +		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
> +			  sr->name, err);
> +	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));

what's the rule whether to WARN about the failed xe_force_wake_put() or
not ? should we also WARN when xe_force_wake_get() failed ? does it make
sense to WARN about put() if get() already failed ?

maybe simpler solution would be make function xe_force_wake_put() void
as it almost nothing that caller can do and move WARN there if needed ?

what about making the flow more intuitive like this:

bool xe_force_wake_get(fw, d);
void xe_force_wake_put(fw, d);

	if (xe_force_wake_get(fw, d)) {
		...
		xe_force_wake_put(fw, d);
	}

>  }
>  
>  void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> @@ -253,13 +251,11 @@ void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
>  		xe_mmio_write32(gt, RING_FORCE_TO_NONPRIV(mmio_base, slot), addr);
>  	}
>  
> -	err = xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL);
> -	XE_WARN_ON(err);
> -
> -	return;
> -
>  err_force_wake:
> -	drm_err(&xe->drm, "Failed to apply, err=%d\n", err);
> +	if (err)
> +		xe_gt_err(gt, "Failed to whitelist %s registers, err=%d\n",
> +			  sr->name, err);
> +	XE_WARN_ON(xe_force_wake_put(&gt->mmio.fw, XE_FORCEWAKE_ALL));
>  }
>  
>  /**
