Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACCC606A31C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eikRVG4S
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3FAB10E56C;
	Thu, 12 Nov 2026 11:13:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD0610E56C
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794482016; x=1826018016;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=4qB9VYCuk43ABE+huKuYS4XoQIxnuDBNK50bc3crPzM=;
 b=eikRVG4Se3SyMr7vbNLIP6QP11P4hS3sECmk5caZdJLwKqJIGg1pgZfB
 lPTNyk7+J6Fx+Jn0cHTUfxQluX4GTg3f8n4VHZc73LBKwXMfTNqQdnWiM
 yCDEzMNx/q+pYt3fTz10S+zvRaR/gvxCLkY66KxinPet5IxcjwW0MidqM
 QayZnAztx/s3Q0topgCGIrkUkAQQ7MAxqQlBAHdr5pefT+3PF46GoEufZ
 crudMHLcZayclDkI2igOEMRW/0luTZE9fBZ9y19PymXCazaeyqZo7pms0
 ge6fFYFu3pR7BiNZb6cZsZqw2tohsWcq1vvhp5b2MrfNlYDgVCMVWVERl w==;
X-CSE-ConnectionGUID: ZoEwcniMScicOYhGC9ou/g==
X-CSE-MsgGUID: v7a72T3yQqaVWnIitP6ONA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3347925"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3347925"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:13:36 -0800
X-CSE-ConnectionGUID: Ix7tKVtcTRutUYHmbkGzog==
X-CSE-MsgGUID: ikxrhbYjSD+AVWXfpN+BvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8724296"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:13:34 -0800
Date: Thu, 12 Nov 2026 12:13:30 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 aravind.iddamsetty@linux.intel.com, badal.nilawar@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com
Subject: Re: [PATCH v4] drm/xe/xe_ras: Add support for PCIe error component
 handling
Message-ID: <avWfWmN__-8vzzKT@black.igk.intel.com>
References: <20261112095744.3520095-2-riana.tauro@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112095744.3520095-2-riana.tauro@intel.com>
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 03:27:45PM +0530, Riana Tauro wrote:
> Add support for handling PCIe subsystem errors. PCIe subsystem power
> management errors require a Seconday bus reset(SBR) for recovery. Treat all
> others as recovered and take no further action.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
