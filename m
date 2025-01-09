Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4532DE77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 17:13:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1230710EE95;
	Thu,  9 Jan 2025 17:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pl99lFN1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CE210EE95
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736442789; x=1767978789;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yYgb19TucTPxDSkqLChuWql7aGX7Zik6UGL2pJdElPA=;
 b=Pl99lFN1deHlnDd7tDzJRyQxp+mAt66lKkLRijtI7wIHY6YEsdMZr6V/
 EfZ9PEodEz/bHUj2sb1aAEfVYbfSLxCQ9sXdJmEvbNJHVsu9NYIkvsuym
 Km/9XiumzEN1izpwAras2IsxA4RGz8S4DQYUg8W25ITJPXITVDkhRo5Mq
 kdr5gvs27ZYbAZdFqsgkfzclG7Pbegt/FtCAu2WcPmpmTK2LIShMDxwDA
 IUxQlQFcND9waM+jBX2susC0N1mC9csy9hBqeAXDmTREpOkr+VB+7f+cr
 hbg/zr451i3W/h9ql1MAk/IDzZO83NhiiA++7ua9+mQDdU7dzWnkYAbXe Q==;
X-CSE-ConnectionGUID: xtrJzHhhS7edVj+Q7+RzDA==
X-CSE-MsgGUID: ERHtHQt6Q9m2qNRnucIbVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48078378"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="48078378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:12:39 -0800
X-CSE-ConnectionGUID: dnHlrZ9SSPy9/3XIsXa6tg==
X-CSE-MsgGUID: ECjC3CC0RrWSCH/Aw5kFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="103535740"
Received: from lbenshus-mobl1.ger.corp.intel.com (HELO [10.245.192.168])
 ([10.245.192.168])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 09:12:37 -0800
Message-ID: <bab99524-f5bb-4a42-aabf-61a9820884c1@linux.intel.com>
Date: Thu, 9 Jan 2025 18:12:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/1] drm/xe: Fix all typos in xe
To: Nitin Gote <nitin.r.gote@intel.com>, intel-xe@lists.freedesktop.org
Cc: nirmoy.das@intel.com, andi.shyti@intel.com,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>
References: <20250106102646.1400146-1-nitin.r.gote@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20250106102646.1400146-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset=UTF-8
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


On 1/6/2025 11:26 AM, Nitin Gote wrote:
> fix all typos in files of xe, reported by codespell tool.

s/fix/Fix

Ideally, this should be split into multiple patches to minimize the risk of conflicts during backports.
I consulted with Thomas and merged it into drm-xe-next as this is the correct time window for such patches.

Regards,

Nirmoy 

>
> Nitin Gote (1):
>   drm/xe: Fix all typos under xe
>
>  drivers/gpu/drm/xe/Kconfig.debug           | 4 ++--
>  drivers/gpu/drm/xe/abi/guc_capture_abi.h   | 2 +-
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h      | 6 +++---
>  drivers/gpu/drm/xe/regs/xe_reg_defs.h      | 2 +-
>  drivers/gpu/drm/xe/tests/xe_mocs.c         | 2 +-
>  drivers/gpu/drm/xe/xe_bb.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_bo.c                 | 8 ++++----
>  drivers/gpu/drm/xe/xe_bo_doc.h             | 2 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c        | 2 +-
>  drivers/gpu/drm/xe/xe_device.c             | 2 +-
>  drivers/gpu/drm/xe/xe_drm_client.c         | 2 +-
>  drivers/gpu/drm/xe/xe_exec.c               | 2 +-
>  drivers/gpu/drm/xe/xe_ggtt.c               | 2 +-
>  drivers/gpu/drm/xe/xe_gt.h                 | 2 +-
>  drivers/gpu/drm/xe/xe_gt_mcr.c             | 2 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 2 +-
>  drivers/gpu/drm/xe/xe_guc_capture.c        | 2 +-
>  drivers/gpu/drm/xe/xe_guc_capture_types.h  | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_ct.c             | 4 ++--
>  drivers/gpu/drm/xe/xe_guc_submit.c         | 2 +-
>  drivers/gpu/drm/xe/xe_hmm.c                | 2 +-
>  drivers/gpu/drm/xe/xe_migrate.c            | 2 +-
>  drivers/gpu/drm/xe/xe_pci.c                | 4 ++--
>  drivers/gpu/drm/xe/xe_pcode.c              | 2 +-
>  drivers/gpu/drm/xe/xe_pm.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_pt.c                 | 2 +-
>  drivers/gpu/drm/xe/xe_rtp.h                | 4 ++--
>  drivers/gpu/drm/xe/xe_uc_fw_types.h        | 2 +-
>  drivers/gpu/drm/xe/xe_vm.c                 | 4 ++--
>  29 files changed, 40 insertions(+), 40 deletions(-)
>
