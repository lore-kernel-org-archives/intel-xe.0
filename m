Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BEBE77180
	for <intel-xe@archiver.kernel.org>; Thu, 12 Dec 2024 22:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E4910E306;
	Thu, 12 Dec 2024 22:02:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eMpINLYS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B11610E2E9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Dec 2024 22:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734040947; x=1765576947;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UUikHFov74houd1I0uhNNXXMLEC1iTzQM2curPCn3B4=;
 b=eMpINLYSgyf2yapr1hpMN/yBVGTIxjcRQ2NHyWAJOd9LYwwkbZd6qNlY
 yX30iHfLgvVlsuhtD419Hk5vfGMO2Mohl8OXwa+SGtZbsBmQWaRZIwqjP
 YWDKIP1WXYs/oEX0FFxsIILOqo84uGf0uRMjFgH9PtWt78MUSnMn8Bdsr
 Hpp7HyXlOjRsG/d0nwHuikIIOdiUYwlx6a+7JpE9JFPatbabrL8BCqtwo
 Yj2CxEUFeubyybvoTSzB30kUi55K0b9ULQlWdJHNT+V5IVnoNS50D8Kip
 gqL5cHQPKv6n1afXwjpv5/FVJNytUOGIR8ph52S63/0LyVTT8sXYEiQ9j Q==;
X-CSE-ConnectionGUID: 2527TtviQIWOz7F7r6vQuA==
X-CSE-MsgGUID: vzboPGPrQ/GJSPGApeaqZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="59878434"
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="59878434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 14:02:26 -0800
X-CSE-ConnectionGUID: 7yrCtlV+R5yqgMHxgesGiQ==
X-CSE-MsgGUID: 9u9UJq9bTje3y2zvpp3ASw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="96099490"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2024 14:02:24 -0800
Received: from [10.246.21.182] (mwajdecz-MOBL.ger.corp.intel.com
 [10.246.21.182])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 669B328778;
 Thu, 12 Dec 2024 22:02:23 +0000 (GMT)
Message-ID: <c0334820-0d7c-44ea-8192-4362c5916b77@intel.com>
Date: Thu, 12 Dec 2024 23:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] drm/xe/pf: Use GuC Buffer Cache during VFs
 provisioning
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-12-michal.wajdeczko@intel.com>
 <Z1pZvUzL08Z8zzNH@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <Z1pZvUzL08Z8zzNH@lstrano-desk.jf.intel.com>
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



On 12.12.2024 04:34, Matthew Brost wrote:
> On Thu, Dec 12, 2024 at 02:01:39AM +0100, Michal Wajdeczko wrote:

...

>>  		num_dwords += encode_config_ggtt(cfg + num_dwords, other, true);
>>  	}
>>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>> +	xe_guc_buf_flush(buf);
> 
> Nit: It doesn't look like the return of xe_guc_buf_flush is ever used, maybe drop it.

actually it supposed to be called from within pf_send_vf_buf_klvs()
instead of xe_guc_buf_gpu_addr() - fixed in v3

