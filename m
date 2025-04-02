Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD1C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 10:22:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC81B10E73C;
	Wed,  2 Apr 2025 10:22:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dm4BW8Di";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3010E73B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589332; x=1775125332;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xIqpzJMQtf4jrYgwFCN01BwiGhN91uyysJEQyT17YjY=;
 b=dm4BW8DiINZDDz/l1qUJeFZ2RyRX+NremEB268cV0BRon/7rvkjxaGnP
 fYp4byjCfUoQXdjlGSwjnzr62mXZhqLk0HaQjht+TGMmspkOtcUwQNooG
 8UaDlcu+G9evG0qZBl+6N0ZiGNfmfPghNQbn2pbOQ7VeXeyco+vIK8Y5n
 QBwrMT3nm5+WOcKDx/DN1pQLpuVocV1Wuegpot5/lSTXbr9tmdkV+03wT
 Ov9TRH3l8WI+Z40xkCYHLSm2z8O8Gv0cWU9cCsCHqQUFuf3xdm49e7HEW
 YEJGs5uOkonfLqhXMxJINmSq37K7kDAqTQLNHOD+PE5Gg1iNE3mJ/WSHf Q==;
X-CSE-ConnectionGUID: kZS1iaLJSK+atFwveHt0OQ==
X-CSE-MsgGUID: JwtuplJiSnSqMIMuJm+tRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44651409"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="44651409"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:22:12 -0700
X-CSE-ConnectionGUID: uTtplfxKRl2QD+I0FuI1zw==
X-CSE-MsgGUID: CpTr7GKlRO6a/m0FuD7jpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="126559460"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:22:10 -0700
Date: Wed, 2 Apr 2025 13:22:06 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/doc: Wire up PCIe Gen5 update limitations
Message-ID: <Z-0PzneKHuS3tD1J@black.fi.intel.com>
References: <20250331142336.640226-1-raag.jadav@intel.com>
 <20250331142336.640226-3-raag.jadav@intel.com>
 <Z-qzmk67lxSFy-bk@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-qzmk67lxSFy-bk@intel.com>
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

On Mon, Mar 31, 2025 at 11:24:10AM -0400, Rodrigo Vivi wrote:
> On Mon, Mar 31, 2025 at 07:53:36PM +0530, Raag Jadav wrote:
> > Append PCIe Gen5 update limitations to xe_firmware document.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  Documentation/gpu/xe/xe_firmware.rst | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/gpu/xe/xe_firmware.rst b/Documentation/gpu/xe/xe_firmware.rst
> > index afcb561cd37d..0c3f93e920fe 100644
> > --- a/Documentation/gpu/xe/xe_firmware.rst
> > +++ b/Documentation/gpu/xe/xe_firmware.rst
> > @@ -31,6 +31,12 @@ GuC Power Conservation (PC)
> >  .. kernel-doc:: drivers/gpu/drm/xe/xe_guc_pc.c
> >     :doc: GuC Power Conservation (PC)
> >  
> > +PCIe Gen5 Update Limitations
> > +============================
> > +
> > +.. kernel-doc:: drivers/gpu/drm/xe/xe_debugfs.c
> > +   :doc: PCIe Gen5 Update Limitations
> 
> I believe this should be squashed to the first patch.
> But anyways,

We usually split the changes that are across files or directories,
unless ofcourse they break builds/functionality.

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Thanks,
Raag
