Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDDEC47DA9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jan 2024 12:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567D610F6C3;
	Mon, 29 Jan 2024 12:12:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDFE10F6C3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jan 2024 12:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706530329; x=1738066329;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J/N9zmh4glwzZHaLN5t4QqgoohCI2oacQK1EmqjFEOQ=;
 b=VKp00P0dIMMwehxeFayTNEUrBTWU/GNgOwko5Tb0qSyaQb45MqZCw+wH
 m7FsBXHg39fO7Z2QtEsuJoD8IVuS0f6cn49mexJmKYp6r/5y2U1PdznYu
 +jo2GqjtdQdgC8X620zFbm4MUO66lN5pBzoeFExZnOw8fWrFqu5tZ2OHR
 gNJ9aTRkqtSJ7ktgB5ijFFi4qoLPPHIw/LZBXopTvx6iAA4o/r6sX7pzx
 9lM4BnOnt2PybCtfVPXmNkYGn70sgi5CMw5czQ4UbLZQVsE3cl2yfXBWM
 /xIydahr+LyYNvRj34Ln/vHR+kkGQtN4zxxurQUsd/Oo2ffU4qG2F899Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="10045504"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="10045504"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 04:12:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="821831649"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="821831649"
Received: from cbowler-mobl.ger.corp.intel.com (HELO [10.252.19.51])
 ([10.252.19.51])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 04:12:07 -0800
Message-ID: <edf5e029-a310-4bd5-ac06-8d42dd389c9a@intel.com>
Date: Mon, 29 Jan 2024 12:12:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 34/34] drm/xe: Enable D3Cold on 'low' VRAM utilization
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-35-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-35-rodrigo.vivi@intel.com>
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

On 26/01/2024 20:30, Rodrigo Vivi wrote:
> Now that we eliminated all the mem_access get/put with its
> locking issues from the inner calls of migration, we can
> allow D3Cold.
> 
> Enable it when VRAM utilization is lower then 300Mb. On
> higher utilization we only allow D3hot so we don't increase
> so much the latency on runtime resume due to the memory
> restoration.

Note that nothing in CI is d3cold capable it seems, so they will never 
trigger this path AFAIK. All platforms return:

[drm:xe_pci_probe [xe]] d3cold: capable=no

Is that a bug, or perhaps there is something else needed? Main question 
is how to get CI test coverage for this here.

> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.h | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index 0ae4f6a60c6d..bc6bd2a01189 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -8,12 +8,7 @@
>   
>   #include <linux/pm_runtime.h>
>   
> -/*
> - * TODO: Threshold = 0 will block D3Cold.
> - *       Before we can move this to a higher value (like 300), we need to:
> - *           1. rewrite the VRAM save / restore to avoid buffer object locks
> - */
> -#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
> +#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
>   
>   struct xe_device;
>   
