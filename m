Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39653C282CD
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 10:15:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0447610E3BB;
	Mon,  3 Mar 2025 10:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1nNxYFk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6028E10E3BE;
 Mon,  3 Mar 2025 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740996940; x=1772532940;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=rq196IycefGg+61LY24GXcHrTJWyLoMHf9hGuItaStI=;
 b=l1nNxYFkBZuiOvItTpk8l2MCp8hXnq3W9kiMle8URmtOT7U1mPLD7tBe
 CQkNwIF7eQ7C+dt3VMm29rg0o8BPvaiVhDL8ex+lRky5fbxIaBQ/YTIy+
 mWE57mFXKX69hMmxRA/Nr/8MP8QfmZ8NSr/Fpj/K5FQQp2c8x3GWN50Ef
 zI6mR8qUuXJ+y/eWZ4us02tSxr7C/+9ujTBosEaoBrXmrM9IRe/nMDOC2
 fykoWJVYZoJflcmYOFWC28dQw+0GUOQ5vb0o2lkfNY57IPH5+uu+01pqJ
 bUb0F/kson6cFVuhsMljBqhDLpwzGKrz23NkWlZMyi5zYlnG3OnVXozlA A==;
X-CSE-ConnectionGUID: YZVu4BrySw+Fpf5diXWqKg==
X-CSE-MsgGUID: /bewWQeCSo2k9Pn6YBJWAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="53270976"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; d="scan'208";a="53270976"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:15:39 -0800
X-CSE-ConnectionGUID: rpQ/IDbBT8WdEher9gwziw==
X-CSE-MsgGUID: 8W7VA2N4QnWIXUEsGecT6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118876974"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.122])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 02:15:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: imre.deak@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 0/3] drm/i915/display: add some sub-structs for clarity
In-Reply-To: <cover.1740746939.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1740746939.git.jani.nikula@intel.com>
Date: Mon, 03 Mar 2025 12:15:33 +0200
Message-ID: <87o6yi1ku2.fsf@intel.com>
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

On Fri, 28 Feb 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> Jani Nikula (3):
>   drm/i915/mst: add mst sub-struct to struct intel_dp
>   drm/i915/mst: add mst sub-struct to struct intel_connector
>   drm/i915/hdcp: add hdcp sub-struct to struct intel_digital_port

Thanks for the reviews, pushed to din.

BR,
Jani.

>
>  drivers/gpu/drm/i915/display/g4x_dp.c         |   2 +-
>  drivers/gpu/drm/i915/display/g4x_hdmi.c       |   2 +-
>  .../gpu/drm/i915/display/intel_connector.c    |   4 +-
>  drivers/gpu/drm/i915/display/intel_ddi.c      |   6 +-
>  .../drm/i915/display/intel_display_debugfs.c  |   6 +-
>  .../drm/i915/display/intel_display_types.h    |  44 ++---
>  drivers/gpu/drm/i915/display/intel_dp.c       |  38 ++---
>  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |   8 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   | 154 +++++++++---------
>  drivers/gpu/drm/i915/display/intel_hdcp.c     |  94 +++++------
>  10 files changed, 180 insertions(+), 178 deletions(-)

-- 
Jani Nikula, Intel
