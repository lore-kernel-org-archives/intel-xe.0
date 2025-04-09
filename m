Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABF3C36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 17:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63B4310E28E;
	Wed,  9 Apr 2025 17:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iU4pEodU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D77D10E6CC
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744220173; x=1775756173;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6AXKU+/o4JhuV3gm+K9iW9k2yF2lzIRhpl6uBn8R3nc=;
 b=iU4pEodUN3aBv6cDa/VU90hRbormN1o1amM0pBKCIjQxjujETgBcHkyO
 uzMFj7qJA8/NJ/cX99xjd5MSXU8l0uGiUyNIZtM3KvWzVRHnphiBUHoK1
 pviLyzGINfWmcoNMPUMOW8wyVKng3PWG0WSSeyG99RZYIEwL8r5AOzv8w
 0flR1ZyZw56TRpyte/lZZEn5fLTyL8Xo1aVQptnH0GCVvJpZnSvy1D+rY
 qvlLoJdgoT3ZVArPdiQZYdtgZ0Cm+rz4nAevkGpEOQFvuqZT/NKtQFpL2
 NQfs0Mhcdf69t27e02pB/6y6zAft/dP4738eW323gt8Sf+itYZRoT6rEN Q==;
X-CSE-ConnectionGUID: A9t+TSElRnWs8LEWHxTqFw==
X-CSE-MsgGUID: WRIOUMsMSt6AG3AEu7gKyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="48412994"
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="48412994"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 10:36:10 -0700
X-CSE-ConnectionGUID: fAdD1SdzQeehCxjD9Dp7fA==
X-CSE-MsgGUID: vtc+IfyvRAKyDOW+rroT/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,201,1739865600"; d="scan'208";a="129486674"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 10:36:10 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Riana Tauro <riana.tauro@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, matthew.d.roper@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH v4 0/3] Add configfs support for survivability mode
Date: Wed,  9 Apr 2025 10:35:59 -0700
Message-ID: <174422013829.949890.17741065531165830741.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407051414.1651616-1-riana.tauro@intel.com>
References: <20250407051414.1651616-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Mon, 07 Apr 2025 10:44:10 +0530, Riana Tauro wrote:
> Add configfs support for survivability mode
> 
> This series proposes to expose attributes via xe configfs
> subsystem. Xe registers a configfs subsystem named 'xe' which
> creates a directory under configfs. Userspace can then create
> directories for the devices they want to configure and
> set appropriate attributes
> 
> [...]

Applied to drm-xe-next, thanks!

[1/3] drm/xe: Add configfs to enable survivability mode
      commit: 16280ded45fba1216d1d4c6acfc20c2d5b45ef50
[2/3] drm/xe: Add documentation for survivability mode
      commit: 77052ab24590cb72598e31de4a7c29f99d51d201
[3/3] drm/xe: Enable configfs support for survivability mode
      commit: bc417e54e24bc9c96d3c6eba2c8c60f7919e5afe

Best regards,
-- 
Lucas De Marchi

