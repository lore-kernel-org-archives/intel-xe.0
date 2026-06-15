Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FFACD98C5
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 12:25:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7D910E3D3;
	Mon, 15 Jun 2026 12:25:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haexrk8S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4D910E3D3
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jun 2026 12:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781526325; x=1813062325;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/GRLQ6HE8xfqV8wrllE43GCbStJaAOzSH1Sy53MIrHI=;
 b=haexrk8SGoGyprlZupYU69xmP+VHD4o318fkmelAJUseTDLr7Hmkl1XR
 dgErLSPpAM2A9/Z4D9YhYiRpGwnM7XKCnNLbIdonHIrkmbRl/5fP4UV/f
 ya6SvYDVKeww6Xy4v9fLYbf725YPkcm/L8wfChF+B2bv0NIcA4DSPhuJY
 Di+nWDqEVtawfEFXsqJdu6J1ASwCISnT/UQu3CXykROHFhzUPUjEjawhD
 RAIJ9am9tPBbMKibzh9LO3EE73umj9x+M9xgPoI08j4RepBV9OPUS/e1V
 i8UEvonUNGALZFpcwJ9w82wng+UzJC3WTPwYpD8NYOZMlxyHaKhNNURBP A==;
X-CSE-ConnectionGUID: INtUfbyeQvmUgD/ruP3ozA==
X-CSE-MsgGUID: ZRfV7Yx+RHyoUesB6KwgBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="86110437"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="86110437"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:25:25 -0700
X-CSE-ConnectionGUID: 0q7c1t4LSMeGFTEBoeytgw==
X-CSE-MsgGUID: a64lan+QRjWyRcUYU6sKsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="247329466"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.60])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 05:25:21 -0700
Date: Mon, 15 Jun 2026 14:25:18 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Soham Purkait <soham.purkait@intel.com>
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v4 1/1] drm/xe/xe_ras: Add RAS GPU health indicator
Message-ID: <ai_vLrC1oEdBVuqB@ashyti-mobl2.lan>
References: <20260610093353.2538576-3-soham.purkait@intel.com>
 <20260610093353.2538576-4-soham.purkait@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610093353.2538576-4-soham.purkait@intel.com>
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

Hi Soham,

On Wed, Jun 10, 2026 at 03:03:55PM +0530, Soham Purkait wrote:
> Add a sysfs interface that reports the current GPU health state and
> lets admin users and management tools update it but is readable by all
> users. Requests are routed through the sysctrl mailbox. The interface
> is present only on platforms that support the GPU health indicator.
> 
> The interface is a single read/write file at the device level:
> 
>   $ cat /sys/.../device/gpu_health
>   ok
> 
>   $ echo critical > /sys/.../device/gpu_health
> 
>   $ cat /sys/.../device/gpu_health
>   critical
> 
> v1:
>  - Add enum for health status. (Andi, Rodrigo)
>  - Return error number instead of error message in _show/_store. (Andi)
>  - Move GPU health sysfs init error logging to xe_ras_init. (Andi)
>  - Return only the current health state for sysfs read. (Andi, Rodrigo)
>  - Add documentation for sysfs interface. (Andi, Rodrigo)
> 
> v2:
>  - Make logs and structures consistent with their counterparts. (Riana)
>  - Drop unnecessary variables. (Andi, Riana)
>  - Add correct KernelVersion. (Raag)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
