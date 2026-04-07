Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A9CFF510C
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 16:10:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851210E47F;
	Tue,  7 Apr 2026 16:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J6Mjq0uG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BD810E08E;
 Tue,  7 Apr 2026 16:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775578235; x=1807114235;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MGuqhlMOH7Mubdbm2RPvMBNhVZ1Lj2G/JxqP8da/dAc=;
 b=J6Mjq0uG0ZlmeehZnmXBe5rRwpVHluMLCFx6BpEt0kfCOkmGEb7h8/xr
 7lEQiDIMKMuqp2TF1n8vxvXeM3+wCn5nWoL2nAjTS3wBkPMLheitxvxvo
 rXqxV5vSWOyXrgtlgXqyYu8/f0DXHPUSue7+EMovhj5XgEZLHykl3ku3f
 +G1lJMuvWKuKPb7Yz6skXy/Q1JD/h5A8tWo7EaB3meWWzsc/7EjKgqcz6
 H94/HbVmfvFnqrG45cpPYqKwTqzG+OVesN0c8YLFdWx5Fkt/I8N7bYrjc
 UAw9rgUuwwrS/9Z0TNet7Kg0GaxnxNQm6HkeQAwsCErSOW/3+pvg5NwQR Q==;
X-CSE-ConnectionGUID: hV07gUk+R1iEvAX8rORK8g==
X-CSE-MsgGUID: 1bAZOyIbSdeGmWm8ZCOVoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80433754"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="80433754"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 09:10:35 -0700
X-CSE-ConnectionGUID: jahzR2MGRmCTpgUU45Z7LA==
X-CSE-MsgGUID: hfYmRSGNTLKt/zD2DOXQoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228123809"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.211])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 09:10:26 -0700
Date: Tue, 7 Apr 2026 19:10:23 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/i915/mchbar: move intel_mchbar_regs.h under
 include/drm/intel
Message-ID: <adUsb9ODzDKO6jBA@intel.com>
References: <cover.1775559414.git.jani.nikula@intel.com>
 <581eef80fb77b4ab78ca040e60b2a29c844a5232.1775559414.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <581eef80fb77b4ab78ca040e60b2a29c844a5232.1775559414.git.jani.nikula@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Tue, Apr 07, 2026 at 01:57:41PM +0300, Jani Nikula wrote:
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c               | 2 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c                 | 2 +-
>  drivers/gpu/drm/i915/gvt/handlers.c                         | 4 ++--
>  drivers/gpu/drm/i915/intel_gvt_mmio_table.c                 | 2 +-

Those four don't seem to need the header anymore.

-- 
Ville Syrjälä
Intel
