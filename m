Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA89D2CE1C
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 05:41:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEF310E0CD;
	Fri,  5 Dec 2025 05:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZ3Dx3Ig";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F38D810E0CD
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Dec 2025 05:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764913309; x=1796449309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=awtpX2E2XAs/eAaiuokMstZxm8wrlbCTw/0sISM+FhE=;
 b=lZ3Dx3IgnnBZwRfxi03xpEo6TDGw3jcnE9TSG7pWmE7WSKgGfEdn6a7V
 BOaMM/uiFuss/f4PbqGbfjktR9O03mPUDQXAp3tqQWu3IdiPM6tzt1E84
 lB7hohCprAA0N1Ul/hXgppZdwW/kVIHiAw44wX3wSgvKpOIdF2YNlspqp
 i6XCJmy3Z3o2ArN/dyduod8Ld8DMufsTiSNB3utIbbOJjYL+p78T+4rve
 QV26qe82y3HvxzRtIJJfna4t/8J+9BYeegi4In+5R8xAMXAQozzpTvtGq
 trp3g/JrSehAqj+m/MPdamBD8kMkUClV2hJxNq6bkvPWydcKlAbFJEicH g==;
X-CSE-ConnectionGUID: 5BRLXGrbQd6+EE98Nc4fAg==
X-CSE-MsgGUID: RGDrGM4UQzyBPNF6bXPiDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="67107728"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="67107728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 21:41:48 -0800
X-CSE-ConnectionGUID: AKG7jtJeToCFvcpQuRO4Hg==
X-CSE-MsgGUID: SPi8vQ4fS3iIpnj8VNrRXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="225864447"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 21:41:46 -0800
Date: Fri, 5 Dec 2025 06:41:43 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, heikki.krogerus@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: Re: [PATCH v1] drm/xe/cri: Enable I2C controller
Message-ID: <aTJwlzgmpwERtOxQ@black.igk.intel.com>
References: <20251128084414.306265-1-raag.jadav@intel.com>
 <aS36G51_xMA1nvBo@intel.com> <aTFzpOHWRm1Dvmr5@black.igk.intel.com>
 <aTHth3B0MOEpnay4@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTHth3B0MOEpnay4@intel.com>
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

On Thu, Dec 04, 2025 at 03:22:31PM -0500, Rodrigo Vivi wrote:
> On Thu, Dec 04, 2025 at 12:42:28PM +0100, Raag Jadav wrote:
> > On Mon, Dec 01, 2025 at 03:27:07PM -0500, Rodrigo Vivi wrote:
> > > On Fri, Nov 28, 2025 at 02:14:14PM +0530, Raag Jadav wrote:
> > > > Enable I2C controller for Crescent Island and while at it, rely on
> > > > has_i2c flag instead of manual platform checks.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > Anything else I can do here?
> 
> Have you inspected the CI failures?

I triggered a new run. Hope this helps.

Raag
