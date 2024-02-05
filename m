Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9109C48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 09:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA7A10F392;
	Mon,  5 Feb 2024 09:57:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHb4x0Cy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82BF810F392
 for <intel-xe@lists.freedesktop.org>; Mon,  5 Feb 2024 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707127067; x=1738663067;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=H65yGqGVHwJhO5EWQgYfaFkHYae9zPR2Yiu7iRW5KbA=;
 b=SHb4x0Cyd4tTsfQBerwmXZ4WMi0iRGI2mA2eKctcjWipiH1axfAisLRn
 IrxcL2Oh2K6QQa1oVzsEbErk5+LlNPu9AxOo0wUBxUIt+wcP1GOZw6DQv
 T2cyELzqgsvb0+gaGPwx6NLZwlimOlRA1Blvz1mQTx5x5gbg9bACkyyrG
 Hl6mroeSdDG77qugefx+OkXP6DeGXzZSu5QM7A9X3MfJpkSPFyfe9LzfE
 W78DN2W5nPbZoZofe8T20NgWe2ARnX5i2zyUihP54VY2wzkphfmNuXxcm
 CaA/UdKwesy69pCwHlsH40/2a8VPR9fTTJlcEP1cAA3hdR16X2gXq7zXD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="651326"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="651326"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:57:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="823822367"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="823822367"
Received: from vgolodni-mobl.ger.corp.intel.com (HELO [10.252.0.151])
 ([10.252.0.151])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2024 01:57:42 -0800
Message-ID: <91a43d7e-7c26-4be8-a78b-56dab67b50f0@intel.com>
Date: Mon, 5 Feb 2024 09:57:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 09/34] drm/xe: Convert kunit tests from mem_access to
 xe_pm_runtime
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
 <20240126203044.1104705-10-rodrigo.vivi@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240126203044.1104705-10-rodrigo.vivi@intel.com>
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
> Let's convert the kunit tests that are currently relying on
> xe_device_mem_access_{get,put} towards the direct xe_pm_runtime_{get,put}.
> While doing this we need to move the get/put calls towards the outer
> bounds of the tests to ensure consistency with the other usages of
> pm_runtime on the regular paths.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
