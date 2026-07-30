Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F33C55160
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 12:31:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D2310E144;
	Thu, 30 Jul 2026 12:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a+TNk+G/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5323D10E144
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jul 2026 12:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785414672; x=1816950672;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xqyU5isTvLI30lGhCfEyvyUvK5om/IS24JWcc6bbsLk=;
 b=a+TNk+G/efuANZBflkqbbYU8EK7C9Mh/ls1/9hb1qSniU6ABinEsI1zg
 s+ayBR6WggdYZX3fLZIoc8iuOjwKkKRk488u+1Bbz9N7412A2j9l5f6yA
 370My+cTOzeIMOLg1D7aXGH2jOizmIy+G5hzHy/bazwPJSsmqq3BL0gKt
 PdnOMn8v3PItNwTKoJXX7yc3PbYNG085UKdteelPEGDeIy8uNCHA9KWDG
 JdKg208NI8VZTobOMombigPvI+lkM1jnzXcI43Mu0G7S/NZ7kGhHhTnEQ
 xE8ssEFwB40b1+tVo8DTJ3b/tLq/l1dayStCdofx8Mm7BiGeWIxueU16Z Q==;
X-CSE-ConnectionGUID: CRdZoLKxRM6ca8JGWOTD0Q==
X-CSE-MsgGUID: YyRbcsCATH+2k3jYiCmX/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86047417"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="86047417"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 05:31:12 -0700
X-CSE-ConnectionGUID: 9MtFZ520T8OllAgg5YsUCw==
X-CSE-MsgGUID: Oo4/P/uaSwCGER0h/PGv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; d="scan'208";a="284866315"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 05:31:07 -0700
Date: Thu, 30 Jul 2026 14:31:05 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/xe/pm: do not warn about missing runtime PM
 protection after hot-unplug
Message-ID: <amtECTK2qry7RVzR@black.igk.intel.com>
References: <20260730053635.1515929-2-nitin.r.gote@intel.com>
 <amroMZ8MF0PrF8dh@black.igk.intel.com>
 <SA3PR11MB81184728764B0494D31F1036D0C92@SA3PR11MB8118.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SA3PR11MB81184728764B0494D31F1036D0C92@SA3PR11MB8118.namprd11.prod.outlook.com>
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

On Thu, Jul 30, 2026 at 05:35:26PM +0530, Gote, Nitin R wrote:
> > From: Jadav, Raag <raag.jadav@intel.com>
> > On Thu, Jul 30, 2026 at 11:06:36AM +0530, Nitin Gote wrote:
> > > After hot-unplug, device_del() disables runtime PM. A deferred fd
> > > close can still run later during process exit and destroy remaining
> > > exec queues, which may call xe_pm_runtime_get_noresume().
> > 
> > This sounds like could cause many other side effects. Why not make sure the exec
> > queues are taken care of as part of hot-unplug path?
> > 
> 
> Here In igt@core_hotunplug@hotreplug-with-load and igt@core_hotunplug@hotunplug-rescan-with-load subtests, 
> the workload keeps the DRM fd open while the device is pci hot-unplugged. Later, fd close reaches 
> guc_exec_queue_destroy() -> guc_exec_queue_add_msg() -> xe_pm_runtime_get_noresume(), 
> after pci_remove/device_del() path has already called pm_runtime_disable() during pci hot-unplug. 
> 
> So the WARN is a false-positive for the already-unplugged device case.
> I will update the commit message to make this scope clearer.

I guess my question was, is it safe have the exec queues lying around until
fd close? Wouldn't it be more appropriate to have them cleaned up as part
of hot-unplug itself?

Raag
