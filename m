Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BE2C5B549
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 08:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E823910E813;
	Fri, 30 May 2025 08:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CwPeLGYq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7975410E7EA
 for <intel-xe@lists.freedesktop.org>; Fri, 30 May 2025 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748594986; x=1780130986;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=yvCRDNsbgLfhSW8riaiY/1q9r41aasZpPilVWPcym8E=;
 b=CwPeLGYqGIZaN4duYZ3lN06m58Sqp8Ixs8ajWY1D8E/TQ7xRu5RIqMHN
 VgbHivqNWBHlLdUNjFhBiC5T+YzJKY1JJOX3PDYt+NSOwqPbCSrdw0aBv
 /9GvCi/8WEftZdMqF/NgVmyqSILHUX21OsYMSJBfEOMzw6zQEekPVoD7V
 UJJmiiLjxhWCqTkLL95P5uqa38Bh4lL4Bc6hlB79wUGbh5w3MareaaRZZ
 +AXJvJYnMfJjMzShVr/I2q68OZWNsYARdwqqVB+il8mIH5rNi5F2g1yFJ
 x/ZEKYD1oSafj9N7F23jbSzx5R9irmbC/nTDm4M/gL4KkQmWvq2fGPRXb w==;
X-CSE-ConnectionGUID: yVfl4HdmTzmnvVBYWbGzVg==
X-CSE-MsgGUID: oXwCT47PRE++KGHijLxpwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="62027287"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="62027287"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:49:45 -0700
X-CSE-ConnectionGUID: UiTlsUNPQHSk0Qp0kq17Dw==
X-CSE-MsgGUID: /YwA1lXxScCvAXu9n4EXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="181036177"
Received: from ettammin-desk.ger.corp.intel.com (HELO [10.245.244.247])
 ([10.245.244.247])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2025 01:49:44 -0700
Message-ID: <6f7313df-fcae-410f-951f-58a9171e168a@intel.com>
Date: Fri, 30 May 2025 09:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/bmg: Update Wa_16023588340
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250530082047.742183-1-vinay.belgaumkar@intel.com>
 <20250530082047.742183-4-vinay.belgaumkar@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20250530082047.742183-4-vinay.belgaumkar@intel.com>
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

On 30/05/2025 09:20, Vinay Belgaumkar wrote:
> This allows for additional L2 caching modes.
> 
> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
> 
> Cc: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_gt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 0e5d243c9451..6c4cb9576fb6 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -118,7 +118,7 @@ static void xe_gt_enable_host_l2_vram(struct xe_gt *gt)
>   		xe_gt_mcr_multicast_write(gt, XE2_GAMREQSTRM_CTRL, reg);
>   	}
>   
> -	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0x3);
> +	xe_gt_mcr_multicast_write(gt, XEHPC_L3CLOS_MASK(3), 0xF);
>   	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   

