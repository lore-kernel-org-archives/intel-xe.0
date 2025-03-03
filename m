Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1096C282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:30:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F4E10E1BA;
	Mon,  3 Mar 2025 19:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHu+fYtJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E0110E1BA
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Mar 2025 19:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741030239; x=1772566239;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7hcvmhW0ZcwTtMm9SiguaCrlKYLbnTePISDAiqdpmy8=;
 b=jHu+fYtJ1ap9axgMhHrNlnQDJhtdvIXsFflV/4KS8r1cBWlQ+MknNfsn
 RnNk/eaR/kisDAnEApxQdPvt68nXWB0qoXvhs241ejukQ27cROAK6Cz3I
 ig0Paa0Lbjhy1YjflwMwIk9pDGwicQtgiUB+QTPOUP1tQRRZIDr0lbsEj
 vSaW7co5DdrZR+vA7A/3Lp/Q8Z0k3tmMPA1/VmhzKmC49aCZydHp7tdbU
 C0qozL09481iI+Py1cHkCzRMvrb6DuRlLK1TArUwZthCRed0Wy8jbYxXE
 z8xvrwPxQUWCtu1oGjAmNOnBCzDtffQN+0Y7fo61XtBheHyUGXvQHO20M A==;
X-CSE-ConnectionGUID: NIbJWdfHTYSWLvrO7F2HfQ==
X-CSE-MsgGUID: l30b188VTtSXO4GxPRXqaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42175459"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="42175459"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:30:38 -0800
X-CSE-ConnectionGUID: 8RZFSxDxTgS7ZEOZTnUhEQ==
X-CSE-MsgGUID: UyI9Dy0ZQ4uaSYby8vUazQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122267066"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 11:30:35 -0800
Date: Mon, 3 Mar 2025 21:30:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 andi.shyti@linux.intel.com, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com, karthik.poosa@intel.com
Subject: Re: [PATCH v1] drm/xe/hwmon: expose fan speed
Message-ID: <Z8YDWa6i0g-n1aoD@black.fi.intel.com>
References: <20250210100515.2205584-1-raag.jadav@intel.com>
 <Z8VZud-t0j1bMSpv@black.fi.intel.com> <Z8XqZMxo9WTK6rVs@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8XqZMxo9WTK6rVs@intel.com>
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

On Mon, Mar 03, 2025 at 12:44:04PM -0500, Rodrigo Vivi wrote:
> On Mon, Mar 03, 2025 at 09:26:49AM +0200, Raag Jadav wrote:
> > On Mon, Feb 10, 2025 at 03:35:15PM +0530, Raag Jadav wrote:
> > > Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
> > > which will expose fan speed of respective channels in RPM when supported
> > > by hardware. With this in place we can monitor fan speed using lm-sensors
> > > tool.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > ---
> > 
> > Bump, perhaps we can apply this if no further comments?
> 
> Can we really ignore the BAT complain?
> 
> It looks a pcode interaction on PVC and hwmon interacts with PCODE.
> Should we trigger a rerun of CI to confirm?
> 
> <3> [108.256503] xe 0000:aa:00.0: [drm] *ERROR* PCODE Mailbox failed: 1 Illegal Command

My bad, I overlooked this one since we don't treat it as an error in i915.

Considering we're expecting more pcode commands to be used here, this would
rather require some rethinking.

Suppressing pcode errors like i915 (using drm_dbg()) would be controversial
and having platform checks all over the code isn't nearly as good of an
experience, atleast from maintenance standpoint.

Let me know how you'd want to approach this.

Raag
