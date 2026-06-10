Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 595E0CD8CB9
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 13:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B0BF10E98F;
	Wed, 10 Jun 2026 13:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dP0nmHRJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C695610E99D
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781098180; x=1812634180;
 h=from:to:cc:in-reply-to:references:subject:message-id:
 date:mime-version:content-transfer-encoding;
 bh=JG3JuNxSjRbujF9iMmxO24OWtssU66AA/iJqj+tOYh4=;
 b=dP0nmHRJN1ZuzfnLddAg4CgOOrA6fiZv/UDVGmlNib8WlTwr9Khf6AM9
 dzgqLsGD+xxC0OkrK9RBNe0PAJ57z3ziutOUuHPjgxHF7IAgvgH4uUIwI
 x+hmZW53HSivHw1+JGjJL6Oein3pR614FyFurj1p82K7esIEvOjLx0L92
 ejrewt/32TSJ78OzZCxebtDtJajUV2kc/Nu6aB9yfg4MAVOpF/xht4bHH
 6+JCCUbpMgBIQhdO63THKMNPixGTivbHbrryMJNYnwDmMFE/Iw27DhfKO
 c1IwgXM3kLogvooouBpAm30swMWu0353aYQRNQWpiDx7ZuzXCM25jKJu1 g==;
X-CSE-ConnectionGUID: DwlYf4WLS/2SrLycm8rw7g==
X-CSE-MsgGUID: +HTwe2mWSU2l73Qek5OIuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="84460618"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="84460618"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:29:39 -0700
X-CSE-ConnectionGUID: 2R+4T5QeShSPguEEDLXkbA==
X-CSE-MsgGUID: ai5HphkPSVGpfMoCzAbtQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="243712258"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.18])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 06:29:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: michael.j.ruhl@intel.com, "David E. Box" <david.e.box@linux.intel.com>
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, 
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org
In-Reply-To: <20260529183150.129744-1-david.e.box@linux.intel.com>
References: <20260529183150.129744-1-david.e.box@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel/vsec: Restore BAR fallback for
 header walk
Message-Id: <178109817239.24283.13772452562650349778.b4-ty@b4>
Date: Wed, 10 Jun 2026 16:29:32 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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

On Fri, 29 May 2026 11:31:49 -0700, David E. Box wrote:

> The base_addr refactor changed intel_vsec_walk_header() to pass
> info->base_addr as the discovery-table base address. For the PCI VSEC
> driver this info comes from driver_data, but exported callers may provide
> their own static headers and leave base_addr unset.
> 
> For xe, this made the discovery-table base address zero instead of the BAR
> selected by header->tbir, preventing PMT endpoints from being created.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86/intel/vsec: Restore BAR fallback for header walk
      commit: 375bbbbd112af028ee0b45d833a6233c23d19bbf

--
 i.

