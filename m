Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FE5C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 05:39:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC54D10E9AB;
	Fri, 11 Jul 2025 05:39:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/6Ncsgs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6406A10E9AB
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 05:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752212348; x=1783748348;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=35qGNnwc27FhZNeYAsR1kwMZC7sLM1CZweRWfbXXKV8=;
 b=U/6NcsgslXRpAm0QU26d3byEHvRx15ZFcUGwRVab+lzHzWSgc1xMs5hN
 oJQ4iFFiNb/Px3GAa+MllMf2cwh8/zUiQ0oV1dfanwXSgzfRwXiWPMTEZ
 Y5gS/5goZLPR8DU8cMAkaqXbwTPNqeWglZcHJn449g6uZv5W4QVNJeti5
 aNwlWM7MP/RIiFgrymYbvs02c8sH02VmTOSYLPNLSk1NUlJ/7v1THZnMd
 LAzemLvYLMkhQ9HHPRqOLpufppuykKfw8v0eR1sPfgF1Myy/ldq3yqFdR
 ZMQ7J8yEnd+8qyBP6lf6F4WmALctYirURqf311jAmtGHT6Le+Imf/QZwH Q==;
X-CSE-ConnectionGUID: ZxQFS1g4SDiolpt+K92pIQ==
X-CSE-MsgGUID: 4/RWNk/8Se2B2cdE8WKJEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54221459"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="54221459"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:39:08 -0700
X-CSE-ConnectionGUID: Y3ke6V1BSxCgI/Sqn8SPEg==
X-CSE-MsgGUID: BYOhYdxBTdufKMMOm2p+1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; d="scan'208";a="193490049"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 22:39:04 -0700
Date: Fri, 11 Jul 2025 08:39:01 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 aravind.iddamsetty@linux.intel.com, umesh.nerlige.ramappa@intel.com,
 frank.scarbrough@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v4 6/9] drm/xe/doc: Document device wedged and runtime
 survivability
Message-ID: <aHCjdQ_jcC8MvhvM@black.fi.intel.com>
References: <20250709112024.1053710-1-riana.tauro@intel.com>
 <20250709112024.1053710-7-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709112024.1053710-7-riana.tauro@intel.com>
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

On Wed, Jul 09, 2025 at 04:50:18PM +0530, Riana Tauro wrote:
> Add documentation for vendor specific device wedged recovery method
> and runtime survivability.

...

> + * Runtime Survivability
> + * =====================
> + *
> + * Certain runtime firmware errors can cause the device to enter a wedged state
> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
> + * is indicated by the presence of survivability mode sysfs::
> + *
> + *	/sys/bus/pci/devices/<device>/survivability_mode
> + *
> + * Survivability mode sysfs provides information about the type of survivability mode.
> + *
> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
> + * survivability mode. User can then initiate a firmware flash to restore device to normal
> + * operation.

Do we have definition on actual procedure? Can we add a reference to it?
Otherwise it's telling me to do something I have no idea about.

Raag
