Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C12BCD5BD5
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 170F510F4D9;
	Thu, 28 May 2026 17:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n9wNk+vy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA3310F4D9
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779990203; x=1811526203;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NtMR+T8thUAxyUN4mNOSYv5OxrHpJ4EHu4Q6CohFlVo=;
 b=n9wNk+vyBlvYhX+34886tDC8908zFOI7qHQYcfAVK9behwWpcDdXBmmO
 p/8WmubWYGM/5ij6D7TII07pPcxU70+b3FIpp84oHi/eB5VJ1xb21y6gp
 fz4fxVPUmvkF8kQZM42I+B6x0tLFSOmSJRARhTQnfZiN/B7i95w8GsyI8
 Nn/hzxJEfspCNrCj0Y0onInJPvpUOD623EYi4Z8v9WVsVK0FFON9qt/wd
 Zu7BD0uLyLSwTulDYahp7eAIOVCE0jB39wC8bhUlySqkRlCZmRVpchV51
 TpEWpV+bjGE1GxUTHg6YJ4pwd+Cx7MjrSf11QYYA9O5DjaWvLfAqU/A+0 w==;
X-CSE-ConnectionGUID: b1sR2vNmT52NyoMJyey/uA==
X-CSE-MsgGUID: AADTYNIETxO8/iaDI1fw3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="91147399"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="91147399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:43:23 -0700
X-CSE-ConnectionGUID: e3aKT59QRD2Srt8lhX438A==
X-CSE-MsgGUID: EljvDqYgT2us9syUvBMpJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="241579060"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:43:21 -0700
Date: Thu, 28 May 2026 19:43:18 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/mmio: Assert MMIO is available
Message-ID: <ahh-tqnD6v3JNaTB@black.igk.intel.com>
References: <20260527175437.22585-1-michal.wajdeczko@intel.com>
 <754ed1a5-ed12-4e0e-bafc-5775106d8e14@intel.com>
 <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7fd718c-413a-4a7e-83d4-cfb0401194fc@intel.com>
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

On Thu, May 28, 2026 at 06:16:49PM +0200, Michal Wajdeczko wrote:

...

> and the fact that mmio.regs is still non-NULL and points to the connected HW, is just our luck?
> 
> maybe we should kill the HW immediately on pci.remove, if it is still present, and just unwind SW state using devm/drmm actions?

There are a lot of instances where we access MMIO on unwind.

1. irq_uninstall()
2. guc_fini_hw()
3. vf_guc_fini_hw()
4. xe_driver_flr_fini()

... and so on.

I assume the teardown was all part of ->remove() call earlier but now most
of the stuff is hooked to devres ever since we decided to transition to it
sometime last year.

Raag
