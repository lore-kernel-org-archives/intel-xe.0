Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25314CD6E65
	for <intel-xe@archiver.kernel.org>; Wed, 11 Oct 2023 12:38:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F038910E7A3;
	Wed, 11 Oct 2023 12:38:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF24110E7A3
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Oct 2023 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697027918; x=1728563918;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hk0jXkGdqLO51cvY9O/+xAJlRdaea/UhBbmjjyuLo74=;
 b=jx8am0IL/Bfl1Jo/Jj0/HT3THMQtt4Tt1fcs7b86gGOz6o7vKXlNPtAW
 h8r73K6Qh1hflKkxUe/ELCi/YYrnTc3hLYHBBv7cWAbt/HkAszaSGO58w
 S4KpzoNErC1nlQsGwo4wANeSY/vwJRUvicnwl9QUCcCFWgi4DWAjbHN8/
 aX2xdTOgBAR8phUp8ZJUT6RQiwlpKGjuRONrE9Ri/uBbBBabcqLSI0TYy
 GBEeI5KCXM54d8aGVZKyhTppcR0geKV3e5S9IwHya42sDyHQ/m2NOLEev
 OuLGIhHuVZfS8Jen5EhG2TpowYc/X8pdMAHKuBQ6kZhRG4VC+UQUPq6z5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381895402"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="381895402"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="824153739"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; d="scan'208";a="824153739"
Received: from bjvanakk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.42.111])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2023 05:38:36 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231011122215.2025850-1-chaitanya.kumar.borah@intel.com>
Date: Wed, 11 Oct 2023 15:38:32 +0300
Message-ID: <87cyxl49mf.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/6] Fix compatibility issue for intel_dmc
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

On Wed, 11 Oct 2023, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> This series reverts hacky #ifdefs from intel_dmc

Acked-by: Jani Nikula <jani.nikula@intel.com>


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
