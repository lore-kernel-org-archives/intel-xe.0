Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38F0C55838
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 06:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 772FA10E2D7;
	Thu,  6 Aug 2026 06:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MncIXLzX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E0E10E2D7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 06:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785997668; x=1817533668;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=6sgOjfwpzT1sSWySSD2CqXqVO+gj5ZOwKKcQIqblVXQ=;
 b=MncIXLzXh0IIa90dSwPEgJQ19Ia7o/en8LBDUZVQbGjfMLZSOrW2u9ot
 wOrjxe7lXAUEN4Y09vVxPhubcnGZpawQY4bK+nrD7msDgeX39lRa7mkXv
 o5h2d43K5TBSIBokzH56ZzA0U9ahO1A5WKLUHRwUspKYMim5o9N2CXEok
 tE0ZXYLYm2ZSNqPY9X0J+95peFAHF4isBpo25MDENcmWgoEKZLzidRrTr
 nY6JEB+Ckyz3/yTP1RbDSiVa/N9DYiqGk6bH0LcuM8totcGIewvUqUnBD
 aZbGmNSaWYS9U96/MKhQux8KhLOc6VT8exOnu3RZBHeSkoGO84QMOVKp8 Q==;
X-CSE-ConnectionGUID: Vaxv0SvVQ+6TNLpE0FH1sw==
X-CSE-MsgGUID: UUJ6fzwXRtSMhi8AcE0Ifw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86525139"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="86525139"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:27:48 -0700
X-CSE-ConnectionGUID: 1C5O8GPPQDuBr0x+w3Vr0w==
X-CSE-MsgGUID: pUYL1EkNTtqjDqIabU2oXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; d="scan'208";a="286682929"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2026 23:27:46 -0700
Date: Thu, 6 Aug 2026 08:27:44 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <anQpYPO3Ne4a9GzS@black.igk.intel.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
 <amroMZ8MF0PrF8dh@black.igk.intel.com>
 <SA3PR11MB81184728764B0494D31F1036D0C92@SA3PR11MB8118.namprd11.prod.outlook.com>
 <amtECTK2qry7RVzR@black.igk.intel.com>
 <SA3PR11MB8118FDD028B722BD940FBE85D0D22@SA3PR11MB8118.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA3PR11MB8118FDD028B722BD940FBE85D0D22@SA3PR11MB8118.namprd11.prod.outlook.com>
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

On Thu, Aug 06, 2026 at 11:39:50AM +0530, Gote, Nitin R wrote:
> > From: Jadav, Raag <raag.jadav@intel.com>
> > On Thu, Jul 30, 2026 at 05:35:26PM +0530, Gote, Nitin R wrote:
> > > > From: Jadav, Raag <raag.jadav@intel.com> On Thu, Jul 30, 2026 at
> > > > 11:06:36AM +0530, Nitin Gote wrote:
> > > > > After hot-unplug, device_del() disables runtime PM. A deferred fd
> > > > > close can still run later during process exit and destroy
> > > > > remaining exec queues, which may call xe_pm_runtime_get_noresume().
> > > >
> > > > This sounds like could cause many other side effects. Why not make
> > > > sure the exec queues are taken care of as part of hot-unplug path?
> > > >
> > >
> > > Here In igt@core_hotunplug@hotreplug-with-load and
> > > igt@core_hotunplug@hotunplug-rescan-with-load subtests, the workload
> > > keeps the DRM fd open while the device is pci hot-unplugged. Later, fd
> > > close reaches
> > > guc_exec_queue_destroy() -> guc_exec_queue_add_msg() ->
> > > xe_pm_runtime_get_noresume(), after pci_remove/device_del() path has
> > already called pm_runtime_disable() during pci hot-unplug.
> > >
> > > So the WARN is a false-positive for the already-unplugged device case.
> > > I will update the commit message to make this scope clearer.
> > 
> > I guess my question was, is it safe have the exec queues lying around until fd
> > close? Wouldn't it be more appropriate to have them cleaned up as part of hot-
> > unplug itself?
> > 
> 
> The exec queues are owned by user space through open DRM fds, so they're freed when the fd is closed, not forced at unplug. 
> drm_dev_unplug() marks the device unplugged but keeps the drm_device alive while fds are open, 
> we can't destroy a queue while it's still referenced by an open fd.
> 
> The hardware side is already cleaned up at unplug; guc_fini_hw() runs in the remove path and sanitizes GuC.
> So by the time the fd closes, only the software state of the queue is left, and that's what gets freed here.
> And when it does, the cleanup path checks xe_uc_fw_is_running(), sees GuC is gone, and takes the software only teardown.

Makes sense. Although runtime PM is for when you need to interact with the
hardware, so in my understanding we shouldn't be at this point for software
only teardown, but I'll leave it to you all.

Raag
