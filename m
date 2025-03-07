Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFA9C28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 17:58:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5685A10EC1D;
	Fri,  7 Mar 2025 17:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khgsKIAs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E79710E15D
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741370309; x=1772906309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mnvQcb73xMRPVJ0BPD9g8e2iEOOVpuoaBFsnRkTDQMk=;
 b=khgsKIAsa5hRpv+yYVu9aprFO9AN5zzMt+eKU7toRnGlR9q+cA+ClD+H
 F07m1wTFMwybWOULb6KCFk3aNTMm34wwXku3GbHlm7gfzzB8r0kIJGX9y
 MvgQa1EqH8Pgz4KjBOthdXbsuF5q7RFWsQkScc+LTSkfcru787OF2esEs
 0RQqmK3lzxa0WORk7uQzQGKR742BVeOU8oTG7bOR9DxZQMbj1ic1GG+50
 p070TIrljdYQMJb8pxEU7X4BHWRrThLgGmqja01H9TGLleIynbEkrKFHl
 2kRdeZAXOXIssumMAVPpiQc+Owb/2P11URbiGAecQdgFaWY/WlGnVRD4O Q==;
X-CSE-ConnectionGUID: yvCmUP2+Q8upW384hRcRRA==
X-CSE-MsgGUID: YDlLGw07T+etnRbvdnCMcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42655478"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42655478"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:58:27 -0800
X-CSE-ConnectionGUID: Yyi6X2IuTWWDxBDvskBphg==
X-CSE-MsgGUID: QnqCbC7WTqKtBFjwvFNz5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124620227"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:58:23 -0800
Date: Fri, 7 Mar 2025 19:58:20 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com,
 aravind.iddamsetty@linux.intel.com
Subject: Re: [PATCH v2] drm/xe/hwmon: expose fan speed
Message-ID: <Z8szvNhAaAsN0IjJ@black.fi.intel.com>
References: <20250307125112.575242-1-raag.jadav@intel.com>
 <Z8sDoWxu0dUEpAQ-@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8sDoWxu0dUEpAQ-@intel.com>
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

On Fri, Mar 07, 2025 at 09:33:05AM -0500, Rodrigo Vivi wrote:
> On Fri, Mar 07, 2025 at 06:21:12PM +0530, Raag Jadav wrote:

...

> > +	case REG_FAN_SPEED:
> > +		if (xe->info.platform == XE_BATTLEMAGE || xe->info.platform == XE_DG2) {
> 
> we should probably have a has_fan_control flag in the platform definition struct so you
> don't need to do platform checks here and it gets easier when we need to add new platforms.

My experience with struct level flags has mostly been with high stakes
features which require maintaining a state (usually atomic), and I'm not
sure if fan control is worth having one of them.

Raag
