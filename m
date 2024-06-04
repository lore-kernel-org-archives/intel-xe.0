Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C2EEC25B78
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jun 2024 12:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9776E10E47D;
	Tue,  4 Jun 2024 12:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MSB/9QXG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1229210E47D
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jun 2024 12:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717505650; x=1749041650;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=35R15U2jXNgJXepN6VZhUWNQkYKdGDKbD8+lcJpkPtU=;
 b=MSB/9QXGSYf2ISsSYprwB4nYKEkzfSAl6kxHJJfkaxlAXVza9VxekI7v
 fbzFBVFlvw4HDHCe3a3J8oXw6ZAiL8d9d1NjKXGnfqtEsViuN/dbEtMVV
 l960z9a6uaNwAHinZy7vj8OzmRBTqGJ3GVmeSVOvtUdyaqiN+Dg2f+92v
 Vnf3Tl6glqEPsDlkfK6DXIHUKR+zUA4AKlwqi0XdSk/8LgKUgtjKh68gZ
 o4FgEsaFObHW4bKJ0Hip9mP3UkJ0stp/pLI7FsHZMryihJKBGGfDAh2Dd
 dpdhNxA1vSRYpIYHjmsZnRlRw7lVB/mMnbquU4zN2gOhRgx5ohBad9R55 w==;
X-CSE-ConnectionGUID: 839GPL8DS/eshPmeAG0xWw==
X-CSE-MsgGUID: TTb8PKguRi+o9eiyU0ydLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="31583299"
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="31583299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 05:54:09 -0700
X-CSE-ConnectionGUID: yjveUm35Qkmc+30E0wUOOA==
X-CSE-MsgGUID: 4WEkXt10TxWLGlUlFkRGrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,213,1712646000"; d="scan'208";a="68387844"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa001.fm.intel.com with ESMTP; 04 Jun 2024 05:54:07 -0700
Received: from [10.94.248.185] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.185])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id CD5FE125AF;
 Tue,  4 Jun 2024 13:54:06 +0100 (IST)
Message-ID: <ab9b7cd1-852a-4144-80bb-e41ef23c9d09@intel.com>
Date: Tue, 4 Jun 2024 14:54:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] drm/xe/pat: Always call xe_force_wake_put/get in pairs
To: Nirmoy Das <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org
References: <20240604110225.29495-1-nirmoy.das@intel.com>
 <20240604110225.29495-3-nirmoy.das@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240604110225.29495-3-nirmoy.das@intel.com>
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
>  drivers/gpu/drm/xe/xe_pat.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 4ee32ee1cc88..a5bdf4de845c 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -190,9 +190,9 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err_fw:
>  	xe_assert(xe, !err);
> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));

this is wrong as xe_assert() will be compiled out on the production
builds, see [1]

[1]
https://www.kernel.org/doc/html/latest/gpu/xe/xe_debugging.html?highlight=xe_assert#debugging

>  }
>  
>  static const struct xe_pat_ops xelp_pat_ops = {
> @@ -221,9 +221,9 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   XELP_MEM_TYPE_STR_MAP[mem_type], pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err_fw:
>  	xe_assert(xe, !err);
> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
>  static const struct xe_pat_ops xehp_pat_ops = {
> @@ -250,9 +250,9 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   REG_FIELD_GET(XEHPC_CLOS_LEVEL_MASK, pat), pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err_fw:
>  	xe_assert(xe, !err);
> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
>  static const struct xe_pat_ops xehpc_pat_ops = {
> @@ -284,9 +284,9 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
>  			   REG_FIELD_GET(XELPG_INDEX_COH_MODE_MASK, pat), pat);
>  	}
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err_fw:
>  	xe_assert(xe, !err);
> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
>  /*
> @@ -366,9 +366,9 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
>  		   REG_FIELD_GET(XE2_COH_MODE, pat),
>  		   pat);
>  
> -	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>  err_fw:
>  	xe_assert(xe, !err);
> +	xe_assert(xe, !xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>  }
>  
>  static const struct xe_pat_ops xe2_pat_ops = {
