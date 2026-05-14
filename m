Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7174CD4F39
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 17:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6011210E3F7;
	Thu, 14 May 2026 17:25:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9Mh2IAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F40E810E3F7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778779557; x=1810315557;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WrqMisIHkqFu6OPkNi9kR//gQMpSpyRozPLcYFT4yyQ=;
 b=H9Mh2IApZd5Fi2A29wBRdLNLDg74tcZuvZfmOkzNZHow4KVhrG2t0qPa
 zL4ngKXoZUa0wp2Y1cWDXQccnI8QkpbveKAek7KztrVCafKnq7ngo8FNa
 18sL+tKZ1mOkJkL1z8G4qAU6okwBIqJymp0+ZzfnLEVBV7/ZwjdSiDZO4
 pSz+T62c6NIgrlQj6smqt3jEbidspNkb69otuH417v4he5pTHT4OiAxQx
 vNd06J8NMj5pN8q0Ha3Acx3RQbOAnosv2aNsYig3QiADk2eM1pKrix5GM
 TKj6t1n+TaFwTemyVYLMwkJropG/oIahpE28+P34UPwMeB7yKaX6/yYM8 Q==;
X-CSE-ConnectionGUID: NcfOWhp8T0SvZ7+AGSJYYA==
X-CSE-MsgGUID: jknMBwyxSAKFddP6yO3K5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83342677"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="83342677"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 10:25:56 -0700
X-CSE-ConnectionGUID: jg3bfxc/Rziu6vwnRNkSCg==
X-CSE-MsgGUID: Jt/qy13yRXO5FB7ZMuPJWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238708625"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 10:25:53 -0700
Date: Thu, 14 May 2026 19:25:51 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Anoop Vijay <anoop.c.vijay@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH v6 5/6] drm/xe: Move xe drm_ras initialization
Message-ID: <agYFn5uI84i2yZqK@black.igk.intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-13-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514052205.1340143-13-riana.tauro@intel.com>
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

On Thu, May 14, 2026 at 10:52:11AM +0530, Riana Tauro wrote:
> Move xe drm_ras registration to RAS initialization flow and keep
> hardware error initialization for processing errors reported
> via irq.
> 
> Move soc remapper and system controller initialization
> up in xe_device_probe as RAS initialization depends on both.

Which means their flags should also be somewhere in vf_update_device_info()
but that can be done later.

> Cc: Anoop Vijay <anoop.c.vijay@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
