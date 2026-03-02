Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C338DEB362C
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 20:11:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CADE10E5CC;
	Mon,  2 Mar 2026 20:11:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW7vv9Rz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F152D10E5B4;
 Mon,  2 Mar 2026 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772482309; x=1804018309;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=XZ7qy3JTXa+wR8ykniT1vG8hSi4IGIy2rc7hCedMyqU=;
 b=iW7vv9Rzv6XdVecv7zcP+CxqWkvsV1eLfDxQIV8Rybvt4hrA4LG174C8
 p9a5GbK0j0X9+yJbXyknL2LFOPsjjq0MnQqQFb+p8altLLsdJ4yj2c62D
 zD3yWevxo8R/t3GMULaOVnhNFcK6QnLFFQJbvnyiUhSAUIAxAIullJ+NG
 pK4phkufeSjxAP266AuUfIaLu70gTyJXHAo9+uY+Tl3VKn0bJBWW6dd5a
 3jSuYNJW4vu1R2ogmEaW9q/LhOqe2QLAt5VdD6gCOBb51pnxSd/G8Dfus
 kH/ZMG99wmSKDPgDwU6QdpVQ73oPK/sf8kL/u94av9MlovI30d52BGl14 w==;
X-CSE-ConnectionGUID: e57bhH1uT3qn3hOofkXWjw==
X-CSE-MsgGUID: RLmTXxIwRoO1/Wm856yE4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="90897250"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="90897250"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:11:49 -0800
X-CSE-ConnectionGUID: ZXWozV03S2q0khKhe8Hn/A==
X-CSE-MsgGUID: 5X9rvQG8RVOQdTz8ddYhtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214936106"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 12:11:47 -0800
Date: Mon, 2 Mar 2026 21:11:45 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 7/8] drm/intel: add pick.h for the various "picker" helpers
In-Reply-To: <fcd70f3317755bf98a6e7ae88974aa8ba06efd1e.1772042022.git.jani.nikula@intel.com>
Message-ID: <9ce79027-3067-4e69-2ea8-bd0e2fd8177f@intel.com>
References: <cover.1772042022.git.jani.nikula@intel.com>
 <fcd70f3317755bf98a6e7ae88974aa8ba06efd1e.1772042022.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="1527428566-1802583461-1772481923=:1837396"
Content-ID: <6e0da1d4-7a11-6917-2a74-670f334f3d12@intel.com>
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

--1527428566-1802583461-1772481923=:1837396
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <206345d9-4917-1d06-28c7-35931e233b8c@intel.com>

On Wed, 25 Feb 2026, Jani Nikula wrote:
> Add a shared header that's used by i915, xe, and i915 display.
>
> This allows us to drop the compat-i915-headers/i915_reg_defs.h include
> from xe_reg_defs.h. All the register macro helpers were subtly pulled in
> from i915 to all of xe through this.
>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--1527428566-1802583461-1772481923=:1837396--
