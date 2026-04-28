Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD60FF8868
	for <intel-xe@archiver.kernel.org>; Tue, 28 Apr 2026 11:39:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F2A10E313;
	Tue, 28 Apr 2026 11:39:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BLSSaOpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C0910E313
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Apr 2026 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777376393; x=1808912393;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=telOxXRVxosiym1xvf9lJTmF2D+fAWqesijuT8Izzqw=;
 b=BLSSaOpx9RcbLYPWg/2UG5Lwnj/B0H6Xzo3tkpoJVGh8WYQP6qT9yX5k
 JC0qSoPMFOL4Jcd0LDVkbLx1lX/wKNzSOcGGhzZAnPZ4Y5PapBwFNVLwD
 uXJj3x+nk+f7pBEfGlqdqJ9L9S9+1bBSyPg1XL96qRwAx69OI5XS+ojce
 813PgvM2g3fVtWRHsHWGJrHJEGbET2PmkARF+9HL6s2vfOgFxoEeqnygI
 7cJr53T2g8E0TrjHhp49les+ML4HTcjUlVDoh5YwPkJxHYdwSQZitVJD6
 qS/snk4lJyf0H557ocOYbArtJlB4iIFOJ8hRbesiYW0/orPrYnPnbCqQP Q==;
X-CSE-ConnectionGUID: POV7Bef/T9ysxaTO/xIuxQ==
X-CSE-MsgGUID: 2RJLZ1NGRCiUV6SLpdxWKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11769"; a="77312171"
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="77312171"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:39:53 -0700
X-CSE-ConnectionGUID: 9Tw7WCMEQluD/zG+dJBAAw==
X-CSE-MsgGUID: HknOgkZpS+C2VPk7P0OzgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,204,1770624000"; d="scan'208";a="238967849"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 04:39:51 -0700
Date: Tue, 28 Apr 2026 13:39:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
Message-ID: <afCchCnDdagHgl9M@black.igk.intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-28-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417085812.4013309-28-riana.tauro@intel.com>
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

On Fri, Apr 17, 2026 at 02:28:25PM +0530, Riana Tauro wrote:
> Query system controller when any non fatal error occurs to check
> the type of the error, contain and recover.
> 
> The system controller is queried in the mmio_enabled callback.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
