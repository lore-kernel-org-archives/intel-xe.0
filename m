Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7903ACD5BCF
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 07:46:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233B910E524;
	Tue, 26 May 2026 07:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ggDAjtHk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6649C10E524
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779781568; x=1811317568;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hoZFLwr2/zd7CZ2S5KfSXom4blhQTFb0fgh8W9Puwu4=;
 b=ggDAjtHkfmikDtmHch3NxSclR/fDlLLqNb3AoPiPomA0SoT80K9iE8NT
 PdxqTRDPTjV7UvZYs1HHZsKfbd4r/utlit59lhs2vMyylOTT+T9DhDyU0
 j7ifPFWgsD1p0Vlv1ap0H+OaGz8JgaUQ1xs+HquTTAu83zNu7RFp/Q4TU
 +CHTpdOreg0q0a2INZ/LnVYjSlT+hcvnxmDK/3iqeAZSJDnSxlwf9o0eR
 SH4u9QwzjC3UT93OWmKZHYZ8ceOplanSzaC7GDQ+Z74oWGLSaazattyuM
 ujwBpqg2ZTe0ptyEd1RWi7A0cqfdF3DR0rRDKS4VkUYHUMa459okUdojU g==;
X-CSE-ConnectionGUID: xoMHgGJwQ+i+sZ9h/F1QGA==
X-CSE-MsgGUID: rWNhClXEQmW7IUW3FiJOmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80439615"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="80439615"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 00:46:08 -0700
X-CSE-ConnectionGUID: X3hV1HbLRFiqsny/JL2J7g==
X-CSE-MsgGUID: nHDGvU/4SiqWJpldBDPLnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="272159544"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 00:46:05 -0700
Date: Tue, 26 May 2026 09:46:02 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 rodrigo.vivi@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH v6 3/6] drm/xe/xe_ras: Add support to clear error counter
Message-ID: <ahVPukjUhC4Qrhs3@black.igk.intel.com>
References: <20260514052205.1340143-8-riana.tauro@intel.com>
 <20260514052205.1340143-11-riana.tauro@intel.com>
 <agtTMBeI6mk1d7Rd@black.igk.intel.com>
 <88f42243-af5e-469f-9769-aa5dfabd6740@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88f42243-af5e-469f-9769-aa5dfabd6740@intel.com>
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

On Tue, May 26, 2026 at 10:45:24AM +0530, Tauro, Riana wrote:
> On 5/18/2026 11:28 PM, Raag Jadav wrote:
> > On Thu, May 14, 2026 at 10:52:09AM +0530, Riana Tauro wrote:
> > > Add structures and helper function to clear error counter value.

...

> > > +static const int ras_status_to_errno_map[] = {
> > Nit: Redundant 'map', just use 'xe' prefix.
> > 
> > > +	[XE_RAS_STATUS_SUCCESS]			= 0,
> > > +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
> > > +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
> > > +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
> > > +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
> > > +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENOSPC,
> > > +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -EIO
> > -EPROTO?
> 
> This is protocol error. Would be misleading to userspace. -EIO is better for
> unknown errors
> indicating an hardware error

This will most likely end up in user land, so probably worth making it
distinguishable from XE_RAS_STATUS_HARDWARE_FAILURE. We return -EPROTO
for similar pcode cases, so I thought we'd make it consistent but I'll
leave it to you.

Raag
