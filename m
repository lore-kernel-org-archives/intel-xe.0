Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9DFC3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 16:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC2E10EAB7;
	Fri,  9 May 2025 16:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npDu+qte";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16FB10EAB7
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746807666; x=1778343666;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dL7KD/TlJeCv74sI23DpTJADqUEeXDYITiCPLXNsLjY=;
 b=npDu+qtevgylzG1Rk+3h0Bmq8a1+Cy8UhMcXq5KsfHXTpV3QTCIjvsTb
 59fBwn6v4FnGmOjDA4PIGU2JkHwjRiRjb6cwcFlSSCBsDLmgRQsZE8yz/
 RyjDpzc8zIITSb6LImwSXb4HqDY7Y3Xi8CGhEvRM/I3R4c8KhDwxmH9I6
 UJQ5ajGEd8jGPUeQjqxX/1ngHsDDcgOlnliJbGvkwvrL+x1K8CUK98M4G
 YbWvRuMapi/o6F2TKVQ9CzF5nySRfXDMBTXIqrmqx8tQRGAHTtT8AfueY
 Q+iy2GC4qcfXNswYhV80AhtJgMQdqC0o6d+dfQysbxJviawg932MVcrfa w==;
X-CSE-ConnectionGUID: 1dzvRN9WRAuisOZV66wHEg==
X-CSE-MsgGUID: Mlslke9oQZSU+oYabFmabg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48339794"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="48339794"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:21:06 -0700
X-CSE-ConnectionGUID: zXuMQpltQAKA3+Ng8M/phg==
X-CSE-MsgGUID: dUIDlxakSoyMHg85kq6Wrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="140724147"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:21:02 -0700
Date: Fri, 9 May 2025 19:20:59 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 x86 Maintainers <x86@kernel.org>, intel-xe@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v1 2/3] PM: sleep: Introduce pm_suspend_in_progress()
Message-ID: <aB4ra4BsLu5Rv5ea@black.fi.intel.com>
References: <5903743.DvuYhMxLoT@rjwysocki.net>
 <2020901.PYKUYFuaPT@rjwysocki.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2020901.PYKUYFuaPT@rjwysocki.net>
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

On Fri, May 09, 2025 at 03:02:27PM +0200, Rafael J. Wysocki wrote:
> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> Introduce pm_suspend_in_progress() to be used for checking if a system-
> wide suspend or resume transition is in progress, instead of comparing
> pm_suspend_target_state directly to PM_SUSPEND_ON, and use it where
> applicable.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Raag Jadav <raag.jadav@intel.com>
