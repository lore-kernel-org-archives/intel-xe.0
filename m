Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33F1EDB7CC
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 07:45:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87CA210E35B;
	Tue,  7 Apr 2026 07:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OD2UdsPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA1810E35B
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Apr 2026 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775547924; x=1807083924;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=faXF/D+K2YhPW5yucgWZECEm/S+ZEgjZrrEXvcx6xxs=;
 b=OD2UdsPs5Vy01e81PKwUI2lIsLEJ6ACZ4xEUrB5QWk0H0tkaJtisP7Gl
 1rCrg4C14+AAPIEY2fZ7mp4PGzgsEsrIR2BAmgKBVhPIiPChFtIjARs8H
 Piks32IYx17HSW1b4C/+LyvTY+zlLNYZYy7jI1/OX5/IuQPYdQcJTuX13
 hWCgSc3Bem+a8oiGchl1xKJhO9UVok9t7W3hbG8eVl14sFK8HRxNhPv5T
 AyERDPwIEWepzE4N44jWO8a4aFj8OhCB1hWEQGIAa077IaxpI4rUQh8jx
 vLQXTm7rnDdmt9mTv6F0ytdZH7Ssi0G/twb0dce7ULPdah2n/nQu4i0OS Q==;
X-CSE-ConnectionGUID: XzVp/8B3SUCNAoEzW31gGw==
X-CSE-MsgGUID: UV3h7MTzRmS5G0Q3coVKCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76694031"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76694031"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:45:24 -0700
X-CSE-ConnectionGUID: zy6hYb85Taa4ZC47wJsFfA==
X-CSE-MsgGUID: cHVQX4QWS6O4Q5AhrTGcNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="229771615"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:45:22 -0700
Date: Tue, 7 Apr 2026 09:45:19 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH 4/5] drm/xe/xe_ras: Add structures and commands for get
 counter
Message-ID: <adS2D9Ea2DQZ-YdG@black.igk.intel.com>
References: <20260320102607.1017511-1-riana.tauro@intel.com>
 <20260320102607.1017511-5-riana.tauro@intel.com>
 <aczQQLhRCPdifEpA@black.igk.intel.com>
 <bf1fe076-deee-47b2-ba0a-682a664173d1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf1fe076-deee-47b2-ba0a-682a664173d1@intel.com>
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

On Mon, Apr 06, 2026 at 10:53:13AM +0530, Tauro, Riana wrote:
> On 4/1/2026 1:28 PM, Raag Jadav wrote:
> > On Fri, Mar 20, 2026 at 03:55:59PM +0530, Riana Tauro wrote:

...

> > > +	/** @flags: Info queue control flags */
> > > +	u32 flags:8;
> > Why not u8?
> 
> flags, compression type and reserved are part of u32.
> 
> It's in-line with the firmware definition.
> 
> Also it is not recommended to mix the types if the bit fields belong to the
> same type.

By who? I thought it was just matter of readability since we already have
__packed in place? Anyway, I'll leave it upto you.

Raag

> > > +	/** @compression_type: Compression type used for this chunk */
> > > +	u32 compression_type:4;
> > Ditto.
> > 
> > > +	/** @reserved: Reserved for future use */
> > > +	u32 reserved:20;
> > > +	/** @checksum: Checksum of the chunk data */
> > > +	u32 checksum;
> > > +} __packed;
