Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87143FD8FD7
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2BD10E9BB;
	Thu, 26 Feb 2026 16:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atRXG8ss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13DF10E9BB
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772124396; x=1803660396;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nUiaD6JmtLoAi0Bi4EKi8Wog0b49vUeMoGEq8hBZ0Cs=;
 b=atRXG8ssxFEyQIUAiCdvlK/niMUxcU2wjlaCpl73Sj7fNNJXDy8+8rAb
 O9adGuT9c5Hm5aPigyZqQqgteM1UuDKqihTaIUhNL6XDATpzXjE0mVoFh
 pkRVvZ8VUhaayUIWR+qIa/vrpAAKbzqa9D0MTONEb+gk2c6C8uNVxxvC2
 t3aD1njSI8jEvGzoZm50Tc6t2Dd5vtb7fnoblVwGu/ln9cdvag35sJkhu
 2OQ6V7tpbD4dClfAEPM7QyS9g3NnXes9SgUEgux/gF0nj6g62dARHZY1K
 g25PamDH79tE1IeJVANuNGlc/Hntz/s2joigPtXEJRbs2GUQ7AVM5p+7b w==;
X-CSE-ConnectionGUID: l9zLKwX9RuikX1cftI3K3w==
X-CSE-MsgGUID: TQcaJQ9tQauh2EvnUn+TfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72226154"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="72226154"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:46:36 -0800
X-CSE-ConnectionGUID: nD0AfD2URD2k1UV+LeNNLA==
X-CSE-MsgGUID: QIa22iH/SiSbCC9NzBkdiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="221622806"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 08:46:34 -0800
Date: Thu, 26 Feb 2026 17:46:31 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: Maarten Lankhorst <maarten@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com,
 riana.tauro@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, michal.winiarski@intel.com
Subject: Re: [PATCH v1 6/6] drm/xe/pci: Introduce PCIe FLR
Message-ID: <aaB450NUrl3kl6eW@black.igk.intel.com>
References: <20260224102618.3105171-1-raag.jadav@intel.com>
 <20260224102618.3105171-7-raag.jadav@intel.com>
 <38ac79bb-0d22-4f3f-b80b-9763aeb227eb@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38ac79bb-0d22-4f3f-b80b-9763aeb227eb@lankhorst.se>
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

On Thu, Feb 26, 2026 at 05:42:05PM +0100, Maarten Lankhorst wrote:
> Den 2026-02-24 kl. 11:25, skrev Raag Jadav:
> > With all the pieces in place, we can finally introduce PCIe FLR handling
> > which reloads hardware state without the need for reloading the driver
> > from userspace. Memory contents are also wiped along with hardware state,
> > so user still needs to recreate buffers and reload context after FLR.
> >
> This probably needs some more help to support display.
> I tried using only FLR to tear down the driver during shutdown,
> but that ran into some issues unfortunately and was reverted.

Yes, it's missing migrate and lrc pieces. Hold on for v2.

Raag
