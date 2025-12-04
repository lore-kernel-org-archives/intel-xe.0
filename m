Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C75D1F9C9
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 11:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F25010E934;
	Thu,  4 Dec 2025 11:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+9QpshI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F36410E93C
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 11:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764848553; x=1796384553;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LtMGz3zTg5CrnzWKv7hx8gMb8uOcxInzBjrZRMMnUh4=;
 b=J+9QpshITZ9R0JFjYrRYX6iT/pJ8qr7hXWkBkr4QPvFD2oGHbMDJhpUv
 mg4S0PBkZTtKfg6cSORvBQuZAqlrWjGEKj/pq6VP5L7pNkFUS59fh4w/r
 Td+rXFappc4oxsAKtmIILhu7toaym0neHQyctLxN47qCnd+I4rXE1OueZ
 grJw7ipNIY1hkpILKZE9HpCVPU+i+4pxXDe9eGAce3+UmOGnlQ3IraiLZ
 mPvbnArKKveecWP2SdgM2GsJE57xKgWkdgcXoVAj0edExkD1RPQUR7iWU
 W5vqShzIvev83bzigWeqWiE+8cXQ2zSKjeQFRb896RRoM0meqVCc0YO04 A==;
X-CSE-ConnectionGUID: WinoPOieTnGW0MMKjzVSDA==
X-CSE-MsgGUID: W1NPMWCgSmqh8OHO3Ur2bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66586548"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="66586548"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:42:33 -0800
X-CSE-ConnectionGUID: Day7noWcQW+vss++exkJsQ==
X-CSE-MsgGUID: dAgKiGf2TOu7WRfyo8UxJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199450920"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 03:42:32 -0800
Date: Thu, 4 Dec 2025 12:42:28 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <aTFzpOHWRm1Dvmr5@black.igk.intel.com>
References: <20251128084414.306265-1-raag.jadav@intel.com>
 <aS36G51_xMA1nvBo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aS36G51_xMA1nvBo@intel.com>
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

On Mon, Dec 01, 2025 at 03:27:07PM -0500, Rodrigo Vivi wrote:
> On Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav wrote:
> > Enable I2C controller for Crescent Island and while at it, rely on
> > has_i2c flag instead of manual platform checks.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Anything else I can do here?

Raag
