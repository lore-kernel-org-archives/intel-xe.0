Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9349C369C9
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 20:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8999E10E3B3;
	Thu, 17 Apr 2025 20:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqoG3SOa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A39B10E3B3
 for <intel-xe@lists.freedesktop.org>; Thu, 17 Apr 2025 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744921054; x=1776457054;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=jUIl5Iqv/rmN/d3Qh3eGD2zFatKaVHWQRi+SxsXYlyI=;
 b=dqoG3SOaQweEJTxzuIP+mX5uFhzrztl+J/TrV+cxTlI4qkxC4i8Il+zn
 XNxx7HPsgHBJo+CWOIolzTu2SNUeL/1Wl7y62cavo2A5T2vPV3iO065Mz
 XOTcVIOV7v1N20m4dBOiizF8JYrYmMfIvRjtvP7f8miHe/KVIFExxPij5
 7JwiuuF1CQ39KWEvxZ+5jiG+e147ErASaLnmnlcg2H63VH97vdOJGAUk0
 SMyo6sntHi84qH/tX7kkhqNxLtqGM5g3Tk3RAeRYJC5ak5aKv9Lim5Z3D
 oDJHsOsyryF3cvWqkfEyA/Tbp8Xyz+1SLTHlTg6Yo562+EW7CH269KeQ/ g==;
X-CSE-ConnectionGUID: iOxHQBtSTQuaBm8jQuybOw==
X-CSE-MsgGUID: wHBfMUShQ42pCG6hZ3OeiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57201782"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="57201782"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 13:17:33 -0700
X-CSE-ConnectionGUID: dbKv8AzOQOG02qnN1ZzNIw==
X-CSE-MsgGUID: XQ0iX0D+QYaKmZpnyl+DkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; d="scan'208";a="135755339"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa005.fm.intel.com with ESMTP; 17 Apr 2025 13:17:32 -0700
Received: from [10.245.81.148] (nowickik-mobl5.ger.corp.intel.com
 [10.245.81.148])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C4F3B34EEE;
 Thu, 17 Apr 2025 21:17:30 +0100 (IST)
Message-ID: <9f86b012-7596-4d92-b65b-bef8bca76ecb@intel.com>
Date: Thu, 17 Apr 2025 22:17:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce fault injection for guc CTB & mmio
 send/recv.
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 intel-xe@lists.freedesktop.org
References: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
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



On 03.04.2025 14:06, Satyanarayana K V P wrote:
> Introduce fault injection for guc CTB & mmio send/recv
> 
> Enable below Kconfig options.
> CONFIG_KUNIT=m
> CONFIG_KUNIT_DEBUGFS=y
> CONFIG_FAIL_FUNCTION=y
> CONFIG_FAULT_INJECTION=y
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> CONFIG_FUNCTION_ERROR_INJECTION=y
> 
> Fault can be injected with below steps.
> FAILTYPE=fail_function
> FAILFUNC=xe_guc_ct_send_recv
> 
> echo > /sys/kernel/debug/$FAILTYPE/inject
> echo $FAILFUNC > /sys/kernel/debug/$FAILTYPE/inject
> printf %#x -19 > /sys/kernel/debug/$FAILTYPE/$FAILFUNC/retval
> 
> echo N > /sys/kernel/debug/$FAILTYPE/task-filter
> echo 10 > /sys/kernel/debug/$FAILTYPE/probability
> echo 0 > /sys/kernel/debug/$FAILTYPE/interval
> echo -1 > /sys/kernel/debug/$FAILTYPE/times
> echo 0 > /sys/kernel/debug/$FAILTYPE/space
> echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> 
> 
> ALso, can be tested using IGT with 
> igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv
> igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv
> 
> Test-with: 20250328111532.16620-2-satyanarayana.k.v.p@intel.com
> Test-with: 20250328111532.16620-3-satyanarayana.k.v.p@intel.com
> Test-with: 20250328111532.16620-4-satyanarayana.k.v.p@intel.com

pushed to drm-xe-next as related IGT series [1] is also ready

[1] https://patchwork.freedesktop.org/series/144466/


> 
> Satyanarayana K V P (2):
>   drm/xe: Introduce fault injection for guc mmio send/recv.
>   drm/xe: Introduce fault injection for guc CTB send/recv
> 
>  drivers/gpu/drm/xe/xe_guc.c    | 1 +
>  drivers/gpu/drm/xe/xe_guc_ct.c | 1 +
>  2 files changed, 2 insertions(+)
> 

