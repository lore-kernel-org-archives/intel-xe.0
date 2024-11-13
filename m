Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B57D41C27
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 10:18:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567EF10E0BD;
	Wed, 13 Nov 2024 10:18:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gzznx1GD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7038D10E0BD
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731493108; x=1763029108;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=v5661yWz9wc3wPHKGrR8AZfMyTGxk0fT3jZ3Sa/3MFA=;
 b=Gzznx1GDxAfHaXm27TNqacbB3i3jRzlEHNXP1eLDiGaiijalLHe1nhUq
 mZuw7dK5kuhQZ3D+pR4ohCDvQXPz7jnOuCzlYlY9sJVG+OndG/D5RoVJv
 avshiepiwkp/Kkj4aaTgaHkp4sw6DNiXgfLq16RzgezXa3B/+vvjgrtGu
 g1peSgiBSpOTMRByCsHiRKcYTjkAPW9WVgzl4K7YNVLuRHIDir67gKTrw
 k2RR2D4Z+WCJVb6A/xU7Wy0h5V0CrtIAf8WaDCyb8j7m9pDTzHil7+DVP
 1NspK819vUlY3/ldLfv5jNzlxgU9IS33KLoKFRhEUSKj3vo9jh74JJ/uI g==;
X-CSE-ConnectionGUID: oXF+KrRGQDuuaq3dW9kQ/w==
X-CSE-MsgGUID: RsKI6gPQTUOPWd+NXqbELA==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="31260460"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="31260460"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:18:27 -0800
X-CSE-ConnectionGUID: HfR0bpF3SjyeCoEtN69k5Q==
X-CSE-MsgGUID: ylMLyweDR9iEVs1Sxu8ejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="91870820"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 02:18:25 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1tBAS6-0000000EInK-2gON; Wed, 13 Nov 2024 12:18:22 +0200
Date: Wed, 13 Nov 2024 12:18:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 david.e.box@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Subject: Re: [PATCH v2 0/2] Support BMG PMT features for Xe
Message-ID: <ZzR87mVmsy-AHSDF@smile.fi.intel.com>
References: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112163035.2282499-1-michael.j.ruhl@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Tue, Nov 12, 2024 at 11:30:33AM -0500, Michael J. Ruhl wrote:
> Updates for PMT to support user offsets from the sysfs API.
> 
> Addressed review comments for the Xe driver udpates.

Not sure where the changelog (v1 --> v2) is...

-- 
With Best Regards,
Andy Shevchenko


