Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13C8E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 11:34:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E16F10E116;
	Wed, 11 Dec 2024 11:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CrRAda8H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D09C10E116
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 11:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733916840; x=1765452840;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ArSyeo50tYPbdhStYEDw6g/D9tWImGYKcyJctTXl17w=;
 b=CrRAda8H7xX7abcCUc35gNy2wUZg5Hz6h8kpIVlkc4zUfNNoWZSYeD6R
 ytREnTzgKjxzhV2eT0698VBigOAGFCD4fzTvT3MsDoymYVdtvrW+g4xgJ
 pWNVu2GcZFQBn6vYPXr4uLDDkMrHb4l8/285FDnIrZhjOMIbwnYT3OeK/
 nw9n6h0NEt27+CawPenS2DZHMYbf8miXLUJWzleX9Ry9gEDoDo7QaBklc
 caF85V9XX4rYu5Wy0kA//W7FtRDXX6/YpvrqhxUDboHa7Qmn/G32AqRZF
 oCPnlO3a+3W3vXC+TFThpUF6RbRnh0SBrzJN0xAtR99UMUZkYt1ePvaad w==;
X-CSE-ConnectionGUID: MkF5kflrTzSoDi+G5AKhvg==
X-CSE-MsgGUID: BMxT/IntREesgjT0+tbArw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45699947"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="45699947"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:33:59 -0800
X-CSE-ConnectionGUID: n9S5Tw/iTIiO++RSYLb+zA==
X-CSE-MsgGUID: zbHhES1fRMyUaz1NsJsZ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; d="scan'208";a="95600654"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.149.72])
 ([10.245.149.72])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 03:33:57 -0800
Message-ID: <030a8301-9a8e-49b8-bd8d-d50350b57c9e@linux.intel.com>
Date: Wed, 11 Dec 2024 12:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: make change ccs_mode a synchronous action
To: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 intel-xe@lists.freedesktop.org
Cc: lucas.demarchi@intel.com, raag.jadav@intel.com
References: <20241211111727.1481476-1-maciej.patelczyk@intel.com>
 <20241211111727.1481476-3-maciej.patelczyk@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241211111727.1481476-3-maciej.patelczyk@intel.com>
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


On 12/11/2024 12:17 PM, Maciej Patelczyk wrote:
> If ccs_mode is being modified via
>    /sys/class/drm/cardX/device/tileY/gtY/ccs_mode
> the asynchronous reset is triggered and the write returns immediately.
>
> With that some test receive false information about number of CCS engines
> or even fail if they proceed without delay after changing the ccs_mode.
>
> Changing the ccs_mode change from async to sync to prevent failures in
> tests.

This sounds like a bug so I think this should have Fixes

Fixes: f3bc5bb4d53d ("drm/xe: Allow userspace to configure CCS mode")
Cc: <stable@vger.kernel.org> # v6.8+

> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_ccs_mode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index b6adfb9f2030..50fffc9ebf62 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -150,7 +150,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
>  		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
>  		gt->ccs_mode = num_engines;
>  		xe_gt_record_user_engines(gt);
> -		xe_gt_reset_async(gt);
> +		xe_gt_reset(gt);
>  	}
>  
>  	mutex_unlock(&xe->drm.filelist_mutex);
