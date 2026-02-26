Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD77FC591F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 10:29:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2286410E8BB;
	Thu, 26 Feb 2026 10:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1ePLRgx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2899C10E8BB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772101740; x=1803637740;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=bio1ub5/AjTuIcvbJlPH2dK3T7buNrStrNl6OTB8sA8=;
 b=B1ePLRgxw3nM30BRgScHIyaWhJrz/fG7oW7+fLw6N20hKTcbsaPn59dk
 6x9rb70qvExJpMJ5WS+NjX2bg/FKNSBneXO5iDEiVBKePn9x0ognCNWGY
 VkglvFkGCPFQVH8k5sKdY03KLyU6qbtYtKHFeHKfxb9K5A/Uej1UWptZs
 8x3SY0LuvBHAPUlVEh5UlZ9zE4JbjZFKP38sJYYtp61hGd1MkcnF1+JRI
 C/xbxZpATPC08dgeR1V1KqRInWFi8XhiSyEHTJL0IU1/He+VO4lwv2MeS
 puWsuOtAs5yUC5lLCzhUMuhfZBtcrGoQY38+kvyRWNBgi5HP0QTV0PSiu Q==;
X-CSE-ConnectionGUID: YN8j8EtvT8e7louLvB2pbw==
X-CSE-MsgGUID: M+UNDym+SGyWrjWBWX31Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="73229076"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73229076"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:28:59 -0800
X-CSE-ConnectionGUID: LYplWtdESX60eajjIcbtCw==
X-CSE-MsgGUID: 4sOD13OVSBq7K5F850ORLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221518159"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.125])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 02:28:56 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v1 0/6] Introduce Xe PCIe FLR
In-Reply-To: <20260224102618.3105171-1-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260224102618.3105171-1-raag.jadav@intel.com>
Date: Thu, 26 Feb 2026 12:28:52 +0200
Message-ID: <db16f21d4533dbcb7a6653ddfaf4f3df07878064@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 24 Feb 2026, Raag Jadav <raag.jadav@intel.com> wrote:
> Here's my humble attempt at introducing PCIe FLR support in xe driver.
> This is ofcourse a half baked implementation and only limited to reloading
> uC firmwares. This needs to be extended for a lot of different components
> which I've skipped here for my lack of competence, so feel free to join
> in and support them.

It wouldn't hurt to spell out Function Level Reset (FLR) somewhere in
the commit messages and in the xe_pci_err.c file.

BR,
Jani.


>
> PS: This works enough to allow a single exec test run after FLR but it
> follows with a GuC crash on subsequent runs which I'm still investigating.
>
> Raag Jadav (6):
>   drm/xe/uc_fw: Allow reloading firmware
>   drm/xe/uc: Introduce FLR helpers
>   drm/xe/irq: Introduce FLR helper
>   drm/xe: Introduce xe_device_assert_lmem_ready()
>   drm/xe/bo_evict: Introduce xe_bo_restore_map()
>   drm/xe/pci: Introduce PCIe FLR
>
>  drivers/gpu/drm/xe/Makefile      |   1 +
>  drivers/gpu/drm/xe/xe_bo_evict.c |  34 +++++--
>  drivers/gpu/drm/xe/xe_bo_evict.h |   2 +
>  drivers/gpu/drm/xe/xe_device.c   |   4 +-
>  drivers/gpu/drm/xe/xe_device.h   |   1 +
>  drivers/gpu/drm/xe/xe_gsc.c      |  15 ++++
>  drivers/gpu/drm/xe/xe_gsc.h      |   1 +
>  drivers/gpu/drm/xe/xe_gt.c       |  10 +++
>  drivers/gpu/drm/xe/xe_gt.h       |   2 +
>  drivers/gpu/drm/xe/xe_guc.c      |  16 ++++
>  drivers/gpu/drm/xe/xe_guc.h      |   1 +
>  drivers/gpu/drm/xe/xe_huc.c      |  16 ++++
>  drivers/gpu/drm/xe/xe_huc.h      |   1 +
>  drivers/gpu/drm/xe/xe_irq.c      |   7 +-
>  drivers/gpu/drm/xe/xe_irq.h      |   1 +
>  drivers/gpu/drm/xe/xe_pci.c      |   1 +
>  drivers/gpu/drm/xe/xe_pci.h      |   2 +
>  drivers/gpu/drm/xe/xe_pci_err.c  | 147 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_uc.c       |  24 +++++
>  drivers/gpu/drm/xe/xe_uc.h       |   2 +
>  drivers/gpu/drm/xe/xe_uc_fw.c    |  33 +++----
>  drivers/gpu/drm/xe/xe_uc_fw.h    |   1 +
>  22 files changed, 295 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c

-- 
Jani Nikula, Intel
