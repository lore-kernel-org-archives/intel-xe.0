Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6002AC5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 12:23:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D84910E71A;
	Wed,  4 Jun 2025 12:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RFBXVAEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102E310E71A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749039816; x=1780575816;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DKewIAyRk9evuwPg8hCCnd+0gvoXkRL5KJp5MvgLayE=;
 b=RFBXVAEdev7faFE4wYgmBpqe9FHMSqXzByNmYcWPxJg3lX4YhQfYXpKN
 uAIkWQlLTHwuXVXFrHrsIcYWhPEXXilTP5jRWMsUyHBD0Fugr0pRNHDzu
 jho08lNP+rNGQ8mqDfYMFlDhXBJYdpI2lNYagLAH5gOu+cJxvh6CRC/IK
 2D8Xgun8IQ1Gq/9euB+r1Ctv15SXHfhD90w/FLtYZ3g+SSasJRfbIlZzh
 ZjGsdS23NADrDC6jjxvVElACSP0w6tZZK3DZB1+QizDZqMxiMdqFLBOsz
 JZpkDQuFoPoE5bZjOxKgLXsuqoVxhXolpoAdpTMbcBGQrbJ47jcbiVckK A==;
X-CSE-ConnectionGUID: 9u8XOnjHRSCxAVZmzVvXrg==
X-CSE-MsgGUID: 0aeUtyr4R9G7IiAbeRSADQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50812103"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50812103"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:23:36 -0700
X-CSE-ConnectionGUID: Cec+rtnsTUGryFVDiE6P3A==
X-CSE-MsgGUID: eFRozNtHSUu46O598uC1NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="168341094"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 05:23:34 -0700
Date: Wed, 4 Jun 2025 15:23:30 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, heikki.krogerus@linux.intel.com
Subject: Re: [PATCH] drm/xe/xe_i2c: Add support for i2c in survivability mode
Message-ID: <aEA6wkRqni3r8JlV@black.fi.intel.com>
References: <20250603170958.1580894-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603170958.1580894-1-riana.tauro@intel.com>
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

On Tue, Jun 03, 2025 at 10:39:58PM +0530, Riana Tauro wrote:
> Initialize i2c in survivability mode to allow firmware
> update of Add-In Management Controller (AMC) in survivability mode

Nit: Missing fullstop ;)

> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
