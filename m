Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734A5C369C7
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 21:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB0410E0F4;
	Wed, 16 Apr 2025 21:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iaFSDHO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEAB10E0F4;
 Wed, 16 Apr 2025 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744839416; x=1776375416;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=QmNRGpKlvOiEQAxYO1XoHGZbAo7iPW7/pY78efc+J4Q=;
 b=iaFSDHO5Bueqw3wVpHBpDSFkP+NDLnuPDg14EJhuor9nycZsfmv0+PDZ
 gpu8sfkb4gYc3QTABhfTfjsoRlmQpBhi+l5HRV2J1nytTWKZIi/g5ujFH
 QpWE9V4ogL/Qzii2WsxnMU9FuKSoCjRSovIsFjOXmtDDmxMxCU0cj+ins
 lOeZbtL8s/mW+4zxrjOXyRJx4KWgUUIYdw475zSyGk7Qk9CVGQBRrO1ZN
 FBBC/jYMynKwiAA3beEyor7ZN3E8d7j19f8LH/sTv7kGlomNTcXu5iAW5
 3p8HUww0oUa+tJY0/CxCa2iDnjFRR5RUCCkpubdf4tVXEBJcpdJlep5tc g==;
X-CSE-ConnectionGUID: 4x2yE7s6Q6aV7YEfuzRr5A==
X-CSE-MsgGUID: X8GXtblfR+Os4iOigAoGCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="50057064"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="50057064"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 14:36:48 -0700
X-CSE-ConnectionGUID: r9vXPw9gQPmQfDipdL2Zew==
X-CSE-MsgGUID: ng6rmngPQ/udT8Kskv5d0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; d="scan'208";a="161564303"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 14:36:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Egor
 Vorontsov <sdoregor@sdore.me>
Subject: Re: [RESEND 0/2] drm/edid: more displayid timing parsing and cleanups
In-Reply-To: <cover.1744708239.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1744708239.git.jani.nikula@intel.com>
Date: Thu, 17 Apr 2025 00:36:43 +0300
Message-ID: <87ikn3pz4k.fsf@intel.com>
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

On Tue, 15 Apr 2025, Jani Nikula <jani.nikula@intel.com> wrote:
> Resend of Egor's patches [1].
>
> [1] https://lore.kernel.org/r/20250214110643.506740-1-sdoregor@sdore.me
>
> Cc: Egor Vorontsov <sdoregor@sdore.me>
>
> Egor Vorontsov (2):
>   drm/edid: Implement DisplayID Type IX & X timing blocks parsing
>   drm/edid: Refactor DisplayID timing block structs

Thanks for the patches, and the patience, pushed to drm-misc-next.

BR,
Jani.

>
>  drivers/gpu/drm/drm_displayid_internal.h | 31 +++++---
>  drivers/gpu/drm/drm_edid.c               | 91 ++++++++++++++++++++----
>  2 files changed, 99 insertions(+), 23 deletions(-)

-- 
Jani Nikula, Intel
