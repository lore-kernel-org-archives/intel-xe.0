Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB1CCCF9EC
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 11:39:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9B010E07F;
	Mon, 27 Oct 2025 11:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1qERhw8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DBC10E07F
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 11:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761565139; x=1793101139;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GnhA2A4inD8oCDHRPbughdJfuqbMnTOIy9vzSULyhSk=;
 b=D1qERhw8LZe75BGkfFXgQenL13g+aOC+TR+ie5G9oOpwdvjcr/HC54N5
 u925r88nNIb1r4wRosD3t5OkrMjtwX3GwcC9D6Mogvs56kG3NQkfQ6ueR
 nn3qWUpMbS+/BN2eGtZYp2wU5rtcPuGpntUmcrDgH7M/zcXQDSuj34qLz
 YzwPRej0G2HkwTqiarkofOLQ+RBM7g3LJ5ItXvgeWvhYXPREwc0EO9lNV
 XzHhyp5Ysl0ec4d8p8Q2LexDsl66agSxiL4q7kxyY3namSMjphdkPptpW
 EjxMWNUSZ6hc270q1N56JxCo6GwMLuaX6N9bLUvkvr50XcEccDxL48zeI g==;
X-CSE-ConnectionGUID: Vuj53lbqTsu7p/mHkryiDA==
X-CSE-MsgGUID: QrIAgWCCT/+AtskKCMf3Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75087426"
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="75087426"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:38:59 -0700
X-CSE-ConnectionGUID: z2KfLy8HQQu0optVHYT5HA==
X-CSE-MsgGUID: liD4qNW+SzqqS1o/opc9Xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,258,1754982000"; d="scan'208";a="184200647"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 04:38:59 -0700
Date: Mon, 27 Oct 2025 12:38:55 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2 5/8] drm/xe/gt_throttle: Tidy up attribute definition
Message-ID: <aP9Zz6VXVtbmcsTP@black.igk.intel.com>
References: <20251026-gt-throttle-cri-v2-0-41f8288a71a7@intel.com>
 <20251026-gt-throttle-cri-v2-5-41f8288a71a7@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-gt-throttle-cri-v2-5-41f8288a71a7@intel.com>
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

On Sun, Oct 26, 2025 at 10:57:17PM -0700, Lucas De Marchi wrote:
> Move the attribute definitions to be grouped together rather than near
> the show() function: checkpatch keeps complaining about the missing
> newline when defining new attributes and it reads better to group
> everything, which should match e.g. the xe_pmu.c style.
> 
> While grouping them, also define a THROTTLE_ATTR_RO(), similar to
> DEVICE_ATTR_RO(), and use it to define all attributes. This makes it
> shorter and with a familiar syntax.
> 
> Finally, during the cri_throttle_attrs[] array definition, also
> highlight what's coming from common attributes and what is CRI-specific.
> 
> These 3 things could be done as separate commits, but they are all about
> the same thing: reduce the attribute definition verbosity and are very
> simple and mechanical.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
