Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFA1CD342F
	for <intel-xe@archiver.kernel.org>; Mon,  4 May 2026 22:31:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C65C10E8B7;
	Mon,  4 May 2026 22:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVfDxF1l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5477C10E8AB;
 Mon,  4 May 2026 22:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777933908; x=1809469908;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=5yMXE45XY2OiC7KT9kJguw2aARuxkbEZHPrAkGKzwZE=;
 b=XVfDxF1lRtIoE1lAi7MXfbWrAs3+4KvJpeDTXxZAxi15vJrBeD8EUUvI
 l4Yr+1Px9r2AgNuHFRuh/soaaRMxhhusKGUOEcVOiwRDnQLX+ag0MM9VE
 nPUrR4i2RiproYkwsKNOd6NRkoh429a89ydnWG0Im+3COxRVN0NSTHIEJ
 PiNLvuqzr11B3OP3BU/H2gezQ4DPaCAL+LS0CNHtjznyXojFRZDGLjE5M
 EmNqbchTeIz7nt0FV17cztXiaZiOfOBuGWPDCz/XD9G5PM4xuwLVgYvrX
 VANYqs7hodSBGIFM4ze2n4azxOb1qAfBGAAGoSMQAccl1o5WtVbsX/DI9 A==;
X-CSE-ConnectionGUID: N9Ku+MLQQ3yqppEzNCHciw==
X-CSE-MsgGUID: qbaHUXYBT9SLuAxjm/Bstg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66329379"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="66329379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:31:48 -0700
X-CSE-ConnectionGUID: bsMYqishT7eAieW2Q8F3Bw==
X-CSE-MsgGUID: TnT1UTdwSOqFLUT5GFL6QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="239927023"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 15:31:47 -0700
Date: Tue, 5 May 2026 00:31:44 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH 3/4] drm/i915/display: add struct intel_error_regs and
 use it
In-Reply-To: <08aab16c568f7a19dd9514cc92168abc00cf4834.1775653994.git.jani.nikula@intel.com>
Message-ID: <8901f1d5-6bd3-8e9f-d735-ea8afe91476b@intel.com>
References: <cover.1775653994.git.jani.nikula@intel.com>
 <08aab16c568f7a19dd9514cc92168abc00cf4834.1775653994.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-349730366-1777932843=:12090"
Content-ID: <b102461c-914e-9f83-bfd5-1b37d89bb589@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-349730366-1777932843=:12090
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <ac85179f-cfe6-0911-3ac1-cb4c7d59232f@intel.com>

On Wed, 8 Apr 2026, Jani Nikula wrote:
> Add struct intel_error_regs, a display version of struct
> i915_error_regs, and use it. The goal is to reduce the dependency on
> i915 core types and headers.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-349730366-1777932843=:12090--
