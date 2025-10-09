Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F62CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 13:42:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F84710EA55;
	Thu,  9 Oct 2025 13:42:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OQWmBMgf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FA110EA55
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 13:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760017370; x=1791553370;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=y8FECpSOOzPsCN1bMRE7broI30tu6wvNKj5htsUbToc=;
 b=OQWmBMgfuwp2yuT/9sMSuBBVFDj9IB+Vc18A415wL+eXhRJf7/6n12Ih
 qlB/k/kHzMZi2F/8DRa8f0isJyw0axBSKwynhnJX+pWGNmlT+PjpfISME
 vzHoZQviwNiT84QFRGVsyNkmV7JbTQ2xIeH4IDQeId8ehnVLkgyb/wG8E
 UvWuiclhtkReNVlY02TFtDrnc/W+7FLyFnTauxrDxgcnK9enB9yyaSoNY
 ZShyTw5aE6Vi6N3W0MgRJV4EE5KagVPKVe9ShIIbSnQhhGIu0DPuca5CK
 Nlnvi2K1ZvkaTFjhvPxjhs84XYP2s8wAgb572S/0uFMLAhVrYB5BW2XZ9 w==;
X-CSE-ConnectionGUID: xvSyELySTe6Z4DuYM0HW4w==
X-CSE-MsgGUID: p2ZeVtmyR1awpmPUcnNjFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62110302"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62110302"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:42:49 -0700
X-CSE-ConnectionGUID: vZtOqoIKSh++ORA2Wmwb6Q==
X-CSE-MsgGUID: 2LUEc0OPRSq0FBWt8fYUZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181121157"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 06:42:47 -0700
Date: Thu, 9 Oct 2025 15:42:45 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: lucas.demarchi@intel.com, rodrigo.vivi@intel.com
Cc: intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com
Subject: Re: [PATCH v2 0/2] Wire up reset/postinstall for I2C IRQ
Message-ID: <aOe71Yj-o6QFFXaU@black.igk.intel.com>
References: <20251009070304.3210101-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009070304.3210101-1-raag.jadav@intel.com>
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

On Thu, Oct 09, 2025 at 12:33:02PM +0530, Raag Jadav wrote:
> This series wires up reset/postinstall handles for I2C IRQ so that it
> can be routed to SGunit or PUnit when needed.

Please hold on to this series while I resolve a few queries with the
architecture.

Raag

> v2: Integrate DISABLE_MSI_CAP changes (Heikki)
> 
> Raag Jadav (2):
>   drm/xe/i2c: Introduce xe_i2c_irq_present()
>   drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
> 
>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  4 ++++
>  drivers/gpu/drm/xe/xe_i2c.c           | 28 ++++++++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
>  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>  4 files changed, 37 insertions(+), 1 deletion(-)
> 
> -- 
> 2.34.1
> 
