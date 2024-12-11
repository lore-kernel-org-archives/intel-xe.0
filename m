Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A73E77180
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 19:58:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2CC10E619;
	Wed, 11 Dec 2024 19:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+NUFVEO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570FE10E619
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Dec 2024 19:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733947095; x=1765483095;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mG5MFsOP8LrxbGfXC7gSLoA6AHdc58a/Vrl/helj7cs=;
 b=b+NUFVEOhbY4sAK8IJr0Jwr5gdwo/kVZTV5MntOKzg1nn1VFQJK7zUlp
 8KUwHM0KMgqgGqY8cprccoSJmLHex2Et2dCDmiBP62GmCzJdEhUCgkxuo
 I7vOmYyFc5Hq6+oFR2T2gsMGGIapEuetFKhuQtGOugK7mUv1GReQOgeDj
 3HgMcYXE6F4YSARywJUH6W5+QmO90iEnuAwOabyyhn+YgoK5EcBXEEefu
 FfSuS/sBO40Z1OvVifvNsjJlx3+k/edsyRLjUvYlG+HzhM73Nhc9eBqOy
 pyrbjQH9NzfQEraDzohKnRy8ULhJbX2mv5V9VOA9SWIsyqYAM13bvH525 w==;
X-CSE-ConnectionGUID: geJwunjAROmW4iaDCL/9pQ==
X-CSE-MsgGUID: 8ZGVQeI0Ssinq7lVup67Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="34071893"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="34071893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:58:14 -0800
X-CSE-ConnectionGUID: C4j76cyxRCSSyxH3fSFEGA==
X-CSE-MsgGUID: HDPTdoWzQoaQC811VX8p8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="95815576"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.33])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:58:13 -0800
Date: Wed, 11 Dec 2024 13:58:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Ilia Levi <ilia.levi@intel.com>, intel-xe@lists.freedesktop.org, 
 piotr.piorkowski@intel.com, koby.elbaz@intel.com, yaron.avizrat@intel.com
Subject: Re: [PATCH] drm/xe: Make irq enabled flag atomic
Message-ID: <b6x4mamnsw2ljm7n7tl7amqmdwqnihjdnufiowudm2i4fxowun@wa2y7s2t2kke>
References: <20241210173506.202150-1-ilia.levi@intel.com>
 <Z1nWXdfn_azp1KLK@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z1nWXdfn_azp1KLK@intel.com>
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

On Wed, Dec 11, 2024 at 01:13:49PM -0500, Rodrigo Vivi wrote:
>On Tue, Dec 10, 2024 at 07:35:06PM +0200, Ilia Levi wrote:
>> The irq.enabled flag was protected by a spin lock (irq.lock).
>> By making it atomic we no longer need to wait for the spin lock in
>> irq handlers. This will become especially useful for MSI-X irq
>> handlers to prevent lock contention between different interrupts.
>>
>> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
>pushing soon to drm-xe-next. Thanks for the patch
>

I just saw the commit in the tree and was wondering... why exactly do we
need that flag checked in the irq handlers?  why can't we simply do
a) turn off irq
b) synchronize_irq()

kind of like xe_irq_suspend() is doing, but in the opposite order. It
seems this was just copy-pasted over and over or am I missing a
synchronization here?

Lucas De Marchi
