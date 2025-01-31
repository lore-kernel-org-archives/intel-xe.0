Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76F7C02192
	for <intel-xe@archiver.kernel.org>; Fri, 31 Jan 2025 13:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3EE10EAB3;
	Fri, 31 Jan 2025 13:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjnqqw3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9344F10EAB3
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Jan 2025 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738330535; x=1769866535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=P9q7U8EY7TE9ogRk0eiUoKwTQ+jt+arrFvKbhD2U5Yc=;
 b=bjnqqw3whHevO0B1VZhCC162ravFxqFo5OfCDWGFGjGjKWG0joDpt8Op
 W4bDFbUyocKU3HN8swMjYHvC/99dqzZ7KpWQXgFzed7WPLwnnyJbIwSIM
 1qcsFsuTv4yRvIJe8cG/eqJn5vCuIQvpxaYQvzlJCKcAOK/c6eoFtxDmB
 2p1HdsidY6yy1cUO8m446g1QgoZD2ZHGKJooKeTmkpotmuzUjYI6F6Q8I
 8dTKKStoeTQ4Has63Bi3Fz0Gt3/aBeQo+0pOXihMQyhUTlhmBe1/swgWr
 xNspfuVlhCvsyzsUvixi6297z3IEMP4rrWsyMXQJFGyC27/Om3bw2rRpv A==;
X-CSE-ConnectionGUID: MOPGjHKVRPSCsY1BiurLFg==
X-CSE-MsgGUID: aTpiDm52Q5CBfanfxNU+RQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38102750"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="38102750"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:35:35 -0800
X-CSE-ConnectionGUID: wgqrwzp+T1WsYSLCbPh+IA==
X-CSE-MsgGUID: l0dpoCXEQReXxpBISPJlmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="114636460"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.175])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 05:35:31 -0800
Date: Fri, 31 Jan 2025 14:35:27 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com, andi.shyti@linux.intel.com,
 intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 riana.tauro@intel.com, badal.nilawar@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose package and vram temperature
Message-ID: <Z5zRn9tijHkPxrhy@ashyti-mobl2.lan>
References: <20250131054502.1528555-1-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131054502.1528555-1-raag.jadav@intel.com>
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

Hi Raag,

...

> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> index 519dd1067a19..f5e5234857c1 100644
> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -34,6 +34,9 @@
>  
>  #define PCU_CR_PACKAGE_ENERGY_STATUS		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x593c)
>  
> +#define PCU_CR_PACKAGE_TEMPERATURE		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5978)
> +#define   TEMP_MASK				REG_GENMASK(7, 0)

is it called TEMP also in the docs? It can somehow be confused
with "temporary".

In any case:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
