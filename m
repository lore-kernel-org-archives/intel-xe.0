Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E171C19F32
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:07:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85010E161;
	Fri,  7 Mar 2025 18:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VcPHMhWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4534A10E161
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741370870; x=1772906870;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ZDF52P4dIFyQ5DPGC07TY3STbqX4279qI0nLDYH5m4M=;
 b=VcPHMhWZDS1qDonXzNRAzH2UAoY5V4fbO47Boaktj2Q/Ark3ts9Ni8pq
 Jy7xXt7lk3g5sXY+RHD9Y6eFqlvIuDmTq7ftJFpISj6EjaiDuIGH6hFrO
 TesIwwj8iDta9aW6mibbFdpgzHaWPFcdOrcphK8+KksoO/4WHs3VdSJKP
 SzW/bEum1TW7pcDoEgqSEAMAiOr00w0L5yUqGkUHiKlsY9W9FGQ6zM6bo
 Z/66d+X31tI2Nw1urQeLXRoEV/Q334CLnlbNa9YcQUK4K8c8UPlMgBMFq
 XHgL66t6GWYTffWA0jqDmxdilG5DT65toPHP8HL7XERE0TU4e1QMhh7I0 A==;
X-CSE-ConnectionGUID: s7xoJ+zVReuPjS2C2YAKaw==
X-CSE-MsgGUID: 6TVAtbx9TCikjPwVrg47Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42343250"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42343250"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:07:50 -0800
X-CSE-ConnectionGUID: 5xK5EIDmTZK38GnyGZrFkg==
X-CSE-MsgGUID: cBemsZ6dSXm4KIbnVl2bXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120306144"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:07:47 -0800
Date: Fri, 7 Mar 2025 20:07:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z8s18CcpHN5O6Ysr@black.fi.intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com> <Z8szvNhAaAsN0IjJ@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8szvNhAaAsN0IjJ@black.fi.intel.com>
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

On Fri, Mar 07, 2025 at 07:58:26PM +0200, Raag Jadav wrote:
> On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> > On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:
> 
> ...
> 
> > > +	case REG_FAN_SPEED:
> > > +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
> > 
> > we should probably have a has_fan_control flag in the platform definition struct so you
> > don't need to do platform checks here and it gets easier when we need to add new platforms.
> 
> My experience with struct level flags has mostly been with high stakes
> features which require maintaining a state (usually atomic), and I'm not
> sure if fan control is worth having one of them.

I know it's always taken on a lighter note in drm but we might never
know the cost of it overtime.

https://lore.kernel.org/netdev/20231129072756.3684495-1-lixiaoyan@google.com/

Raag
