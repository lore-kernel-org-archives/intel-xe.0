Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AF8CAC597
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 15:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C367C10E4F0;
	Mon, 15 Sep 2025 15:18:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J1Htdo+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE6910E4F0
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Sep 2025 15:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757949535; x=1789485535;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5S/z8uWeoO78ev2/x3vVKhjXB2xZn+xCbE26c9/QKpQ=;
 b=J1Htdo+5Z2vdscPEB6UhdHj5JSY9fiVxO71Y7H6yLl9yNc7u4q3Q620S
 EKCP4eaPL9BkxRigDEraFah7bW3QYx3p/eq+oZIXeUveCyOR/4HNIfrvx
 TCLWF1Lk4VnahS3dVTe2IKHTQVrpA7NFdaas5QIq2+QCgIJXrA3rfnWZC
 9RPSRzebb7rwYG4e0yHqS3neJTfU/K1/nvX+N+IlieDrVJd1++nZDWe1T
 dGA9dT0flLa+nGR4wZybsHlTEA42HwqP3/3+xuJptQ3xL/hKfHMBGRr4N
 ZwEAm2SpyUK6eedwT917VtC0fQP/8LU+BIWEgW1/dVxDhzHGGWuMNrKec A==;
X-CSE-ConnectionGUID: gmiVenXoTW2OiBfM8ESBMw==
X-CSE-MsgGUID: Z2hUCnkrTaSzYV3Qf64Riw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59436498"
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="59436498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:18:55 -0700
X-CSE-ConnectionGUID: b1FgcVRwS9ui101gz4ShtA==
X-CSE-MsgGUID: mHaoJr0sQFiwSQybHOb6rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,266,1751266800"; d="scan'208";a="174744452"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 08:18:54 -0700
Date: Mon, 15 Sep 2025 17:18:50 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/vf: Don't expose sysfs attributes not
 applicable for VFs
Message-ID: <aMguWp_VufXdl5tB@black.igk.intel.com>
References: <20250915140614.2076-1-michal.wajdeczko@intel.com>
 <20250915140614.2076-3-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915140614.2076-3-michal.wajdeczko@intel.com>
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

On Mon, Sep 15, 2025 at 04:06:14PM +0200, Michal Wajdeczko wrote:
> VFs can't read BMG_PCIE_CAP(0x138340) register nor access PCODE
> (already guarded by the info.skip_pcode flag) so we shouldn't
> expose attributes that require any of them to avoid errors like:
> 
>  [] xe 0000:03:00.1: [drm] Tile0: GT0: VF is trying to read an \
>                      inaccessible register 0x138340+0x0
>  [] RIP: 0010:xe_gt_sriov_vf_read32+0x6c2/0x9a0 [xe]
>  [] Call Trace:
>  []  xe_mmio_read32+0x110/0x280 [xe]
>  []  auto_link_downgrade_capable_show+0x2e/0x70 [xe]
>  []  dev_attr_show+0x1a/0x70
>  []  sysfs_kf_seq_show+0xaa/0x120
>  []  kernfs_seq_show+0x41/0x60
> 
> Fixes: 0e414bf7ad01 ("drm/xe: Expose PCIe link downgrade attributes")
> Fixes: cdc36b66cd41 ("drm/xe: Expose fan control and voltage regulator version")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Finally.

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
