Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99D44E6895E
	for <intel-xe@archiver.kernel.org>; Thu, 31 Oct 2024 08:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0710E0A1;
	Thu, 31 Oct 2024 08:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ir9/3hkd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC8810E0A1
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Oct 2024 08:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730364285; x=1761900285;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XzrYqiF35zXj4rwwqMHRXOBQeMH+PdaMaCghAM4Wdko=;
 b=ir9/3hkdRf/Bgjd9L4Szoz7imGFJsn/vOjcRsgIluyzlRsqTZaWq4YfQ
 CVnI9YExNc1rJdVisC803UC9VsB1XyMxgMBvdnCDFrHOVEOFqMx98086h
 L4SbukOQQNl37mWajREMIy1zhILJcsIXY05+2HDpygMAa8fwD7ySP6TS/
 myU7HBvgmQQLkf5M9GZwgdQvAoX8h7h3DUF7y4CMHtcjMqBV0uyFn5FLZ
 bvWwJm3tDmkrw1DXu7KiWVztv2IHqG9ahQ6gubLFrvNnIgnVJXz3Hkl5a
 96W4dElfEbcJH/V6hErZujMhh62HF0D3dj/zHPSjZ559B3fUy/PwgBkLx A==;
X-CSE-ConnectionGUID: TcGrs98KQpyVN4sbFoGBfw==
X-CSE-MsgGUID: NboTWLlLQ8m3RssbToHkeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30045049"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30045049"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 01:44:44 -0700
X-CSE-ConnectionGUID: yHZLoFtNRSKXWCPD6JPUGA==
X-CSE-MsgGUID: NnNy/3dqRL2k+rovsPELDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; d="scan'208";a="82664960"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.151])
 ([10.245.245.151])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2024 01:44:43 -0700
Message-ID: <a3bc2848-e498-45e3-9c43-78a6a9a9c4bd@intel.com>
Date: Thu, 31 Oct 2024 08:44:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/xe: Restore system memory GGTT mappings
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, umesh.nerlige.ramappa@intel.com,
 riana.tauro@intel.com
References: <20241029003224.2257439-1-matthew.brost@intel.com>
 <20241029003224.2257439-3-matthew.brost@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20241029003224.2257439-3-matthew.brost@intel.com>
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

On 29/10/2024 00:32, Matthew Brost wrote:
> GGTT mappings reside on the device and this state is lost during suspend
> / d3cold thus this state must be restored resume regardless if the BO is
> in system memory or VRAM.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

