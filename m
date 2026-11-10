Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82809606A335
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LRCC85cP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451F810F661;
	Tue, 10 Nov 2026 12:51:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F215310F645
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794315093; x=1825851093;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Gfdx8qqflewqOy6J5NcS4/oBB7bGhzPmzs/rFZIlu24=;
 b=LRCC85cPLEi7T8qHeciQ38OP+R1Lg9ZtVu8h6CNeOwLYN8IePa/deqKz
 nrhqRtHwvGRfCBYkQFwkxzklScGrCgLaN2aRvmms1voTVgulZoENMGpXx
 3RYLwWsfZhU0e18N9j4uGeZHHIYdxdvFpM1nar1tJsARjpN5QEzc8Rx6c
 rSiCjXYYxZb6/6OdUp/hahPqeP4luBLVRepn+2CWCIhu24HJE3kRkMr00
 /SlR3ZolA/4w3JZadKgFgu4yxKOr5khy0yZ7/OzSUsbDmYrDLC0v20Gua
 /utwtFypcilDa1C+OE75IfP+qqi1mZw9TgADyTMZ+klzPl5nWCkkrkHfd w==;
X-CSE-ConnectionGUID: 6SkwV4TaTrS2eQb5BDxrMg==
X-CSE-MsgGUID: XycSpsd7TvyQumXMU20CpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2958290"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2958290"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:51:33 -0800
X-CSE-ConnectionGUID: yvdt1XwETp2SBClwXVll9A==
X-CSE-MsgGUID: IXSGvNo9S4iLhMfyC3JnbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8590931"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 04:51:31 -0800
Date: Tue, 10 Nov 2026 13:51:27 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 mallesh.koujalagi@intel.com, badal.nilawar@intel.com
Subject: Re: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
Message-ID: <avMTTzrY0kPJRChS@black.igk.intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-13-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106071944.2693854-13-riana.tauro@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 12:49:48PM +0530, Riana Tauro wrote:
> Runtime surivability mode creates sysfs and declares the device as
> wedged in a worker thread. This can race with unbind.
> 
> During unbind, devres actions such as disabling the worker run as part of
> teardown. A runtime survivability enable that is still in flight or gets
> scheduled in that window can create the survivability sysfs entries while
> the device is being removed. This is incorrect, as runtime survivability mode 
> must not be entered once during devres teardown.
> 
> Use the DRM device enter/exit protection so that the enable path
> synchronizes with device unplug and returns early if the device is
> already being unbound.

I'm a bit lost here. Doesn't disable_work_sync() already guarantee this?

Raag
