Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3194FD8FD8
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:55:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD4710E081;
	Thu, 26 Feb 2026 16:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B6iFyhbO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614B10E081
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772124928; x=1803660928;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LiUojMkSZt7YkBUZ1bQQxU5nnIqJ0HsYa2DxSb9dCW4=;
 b=B6iFyhbOjNE9CtlSmY2bh7n76/g57eGmVsFQxDfg7fvOlcIY0Zr6X43e
 7vlFeVO9/pSB0/+YqPves8erKo+K+Rvf6jIu0zgdngc37CDyq1Z8tvFpo
 FSh2gmDmGzWLx2Fe1hcJ8kHpZyrh/LvKFF/BQUh0kG18o2QA+RCDKfL+f
 J2z0SZhBgeJT+TRrVREHvnp09gSL2HeK4HMfJpPZo+jlo1IaU7qLVG+Ag
 ISjpLME55KZeJGIPhkAD4+gm5oJ9iTYoeFZjHhNtfP5BzIHHnYpgbgTJd
 YmG+4y3IAOrprRqF+fXigSqCBpDu+AtS3kt4ol5VaMFttZpd06gnasVtF Q==;
X-CSE-ConnectionGUID: pTBhpQtBQ0qFmn0Oe2dV6g==
X-CSE-MsgGUID: Eig6ow0dSsifz/zLMPXkKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73376947"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="73376947"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:55:28 -0800
X-CSE-ConnectionGUID: sOQRbDAiR5uU1iY/VPRxvg==
X-CSE-MsgGUID: OI4WuwMTTgiJvj6quNENfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="215858941"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:55:26 -0800
Date: Thu, 26 Feb 2026 17:55:23 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com
Subject: Re: [PATCH v1 6/6] drm/xe/pci: Introduce PCIe FLR
Message-ID: <aaB6-xuuRd_e0_1d@black.igk.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <20260224102618.3105171-7-raag.jadav@intel.com>
 <38ac79bb-0d22-4f3f-b80b-9763aeb227eb@lankhorst.se>
 <aaB450NUrl3kl6eW@black.igk.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaB450NUrl3kl6eW@black.igk.intel.com>
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

On Thu, Feb 26, 2026 at 05:46:36PM +0100, Raag Jadav wrote:
> On Thu, Feb 26, 2026 at 05:42:05PM +0100, Maarten Lankhorst wrote:
> > Den 2026-02-24 kl. 11:25, skrev Raag Jadav:
> > > With all the pieces in place, we can finally introduce PCIe FLR handling
> > > which reloads hardware state without the need for reloading the driver
> > > from userspace. Memory contents are also wiped along with hardware state,
> > > so user still needs to recreate buffers and reload context after FLR.
> > >
> > This probably needs some more help to support display.
> > I tried using only FLR to tear down the driver during shutdown,
> > but that ran into some issues unfortunately and was reverted.
> 
> Yes, it's missing migrate and lrc pieces. Hold on for v2.

I tried to dive into display parts earlier but didn't find myself qualified
enough to make those changes. So feel free to join in :)

Raag
