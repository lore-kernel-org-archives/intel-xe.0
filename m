Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6970CDB47E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 09:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFDF10E46E;
	Thu, 12 Oct 2023 09:08:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAB4410E46E
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 09:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697101696; x=1728637696;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=On3QOWHB2+U+mDEi5lpipa0OYJjTbXb/k/6MvCVIE1w=;
 b=GQIAcQB4Om/cIqquhzHL/ckLpIMlH4vwiYC1NCCrRgpT+aRmys2aqADs
 GJbPgBGuPVCY7xd7XGmWNgb+F7AG44E4zR7edSWp9xdPRJd2SDVSIrese
 Yg4Is5rMvOeFjcJAIzL0iQL1gj+ckRInGlWdavbPNYE47VmB1jtUvn5dU
 71nfGan7d3MRaOM1u0QPt4vtGpmUECPvXMM076/wfcG2AE5yUQ6VTxyVP
 M4I3dw28wIxBEBW27SB4buX+pfjgmzZw0i6KrPfTVY7/lqnHCL8+sS8H3
 7fEXHfaJac1hLmpF3K1Ub9YGMjVMZrB5y69Gi1QXdKFGLK7NPBuGiYx4C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6423287"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; 
   d="scan'208";a="6423287"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:08:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="1001483324"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="1001483324"
Received: from anikafix-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 02:08:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231012050645.2058219-1-chaitanya.kumar.borah@intel.com>
Date: Thu, 12 Oct 2023 12:08:10 +0300
Message-ID: <87r0m02op1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH v2 0/6] Fix compatibility issue for intel_dmc
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

On Thu, 12 Oct 2023, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> This series reverts hacky #ifdefs from intel_dmc
>
> v2: Rebase
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>

Mmh, come to think of it, the last three patches probably also need to
be fixup! drm/xe/display: Implement display support.

BR,
Jani.


>
> Chaitanya Kumar Borah (6):
>   Revert "FIXME: drm/i915/dmc: xe way of getting at stepping"
>   drm/i915: Add wrapper for getting display step
>   fixup! drm/xe/display: Implement display support
>   drm/xe: Add intel_step.h compatibility header
>   drm/xe: Add i915_gpu_error.h compatibility header
>   drm/xe: Add intel_uc_fw.h compatibility header
>
>  drivers/gpu/drm/i915/display/intel_dmc.c      | 19 ++----------------
>  drivers/gpu/drm/i915/intel_step.c             |  5 +++++
>  drivers/gpu/drm/i915/intel_step.h             |  1 +
>  .../gpu/drm/xe/compat-i915-headers/i915_drv.h |  4 +++-
>  .../xe/compat-i915-headers/i915_gpu_error.h   | 18 +++++++++++++++++
>  .../drm/xe/compat-i915-headers/intel_step.h   | 20 +++++++++++++++++++
>  .../drm/xe/compat-i915-headers/intel_uc_fw.h  | 12 +++++++++++
>  7 files changed, 61 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/i915_gpu_error.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_step.h
>  create mode 100644 drivers/gpu/drm/xe/compat-i915-headers/intel_uc_fw.h

-- 
Jani Nikula, Intel
