Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50165CD3439
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 17:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E6610E13B;
	Tue,  5 May 2026 17:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eOP3HZBu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7791710E13B
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 17:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778003156; x=1809539156;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6DfO839OJMa/XP7U24Inug2YEe3fYsteVLVcakOgct0=;
 b=eOP3HZBuioR40glEL8EuWBKke9d/TO8Fq+Flr/pevsoaH0pV7nhtx7jJ
 Gy55tnlzxknH5Cx5U1z46okYANGwDp4Wkj/Lhz3aGA+OfwD9NB4Cx8MU9
 v7JlmTXyAE0MhoGPtqtxgdC3GFsZgbFPGpYCBj4sF8c/xd4HVCstpEhOX
 UXqq1mMUHSepI9+pULEU/JUh5OcL6blZfJL9+ICLm54EilN2m75uPMitm
 cCgIlujPzKALCGTQOCPc1+s4KHnqK+Kzf6JjStDuTOjMjnV34LXG1mqvJ
 lRksV8ebFrL9T9yFAHSaGnK2VwXiDldnDjSYbsnqYO+wBxGfgFKSvjilX Q==;
X-CSE-ConnectionGUID: 1mhi+ARoRqGphFkA+umEKA==
X-CSE-MsgGUID: wVLTsnmKQtKoKESoQgVzfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82734551"
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="82734551"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:45:50 -0700
X-CSE-ConnectionGUID: R/akmauXS2OrKE3SqCXqAw==
X-CSE-MsgGUID: CX9BN4IGQFmL8cdw+HiE+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,218,1770624000"; d="scan'208";a="240871809"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 10:45:47 -0700
Date: Tue, 5 May 2026 19:45:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, sk.anirban@intel.com
Subject: Re: [PATCH v5] drm/xe/xe_survivability: Simplify runtime
 survivability error handling
Message-ID: <afosyMxQb4IdeRcp@black.igk.intel.com>
References: <20260504110300.1467303-2-mallesh.koujalagi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504110300.1467303-2-mallesh.koujalagi@intel.com>
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

On Mon, May 04, 2026 at 04:33:01PM +0530, Mallesh Koujalagi wrote:
> xe_survivability_mode_runtime_enable() returns an int, but its caller
> csc_hw_error_work() ignores the return value and cannot take any
> meaningful recovery action on failure. The function logs errors via
> dev_err() and proceeds to declare the device wedged regardless of
> sysfs creation failure, making the return value redundant.
> 
> Change the return type to void and remove the unnecessary
> error handling in the caller.
> 
> v2:
> - Return is not require after the sysfs creation fail. (Rodrigo/Riana)
> - Change int to void return type. (Rodrigo)
> - Remove extra message from csc_hw_error_work().
> 
> v3:
> - Remove ret variable. (Raag)
> 
> v4:
> - Drop ret variable from other part of code.
> 
> v5:
> - Reframe as refactoring instead of bug fix. (Raag)
> - Remove Fixes tag and update subject line.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
