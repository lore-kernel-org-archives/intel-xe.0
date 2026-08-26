Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39664C61DBD
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 07:02:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D0210EC09;
	Wed, 26 Aug 2026 07:01:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahBv7Y77";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC59610EC2C
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 07:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787727719; x=1819263719;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=7K0U8HnMoYiMVN64ttF64aBEdTMmZk8ylSIPuBEq5GA=;
 b=ahBv7Y77eAEuDR5eyekbKXzKfYwEJPI/KHrShmrco6wM40YXxG2Dy+HK
 Yaicjf/RF/5vWVWDQ2C+3153Yz7Qb2C6eVc4evgxCKVOnY1bEiN0wl7XL
 X5PxFkY9zIjD7mhLf7Gt/Yp10QKE3vWNogwf6bsjvIhrBpHGL4wECv6yL
 M4VX2hRV7N+csspqnaVPF2KPj37ciPNrqtM0IC4n3G8bFIXSDNuMeXUfl
 4ly7tDYED/4Zha5YXZ26AiPKyz6nlf5lFj3raxJ6EQ5Jg9kBv95Q/WpP9
 QFWsfXQI2a27EQ7DGXBG6cx2Q4+2muzqDQMEAVB4dM/hqSiyIDT4WL/uN Q==;
X-CSE-ConnectionGUID: wKjyp7LARTCnQpqwJMsFJQ==
X-CSE-MsgGUID: OeMlB1PcTI+BmOZYcRzGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="98537648"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="98537648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:01:53 -0700
X-CSE-ConnectionGUID: sLAcBDWDRC6ibud2fYIseQ==
X-CSE-MsgGUID: VIrr4AbUQs6W3xjtcQEwgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271699757"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:01:52 -0700
Date: Wed, 26 Aug 2026 09:01:48 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 07/10] drm/xe/pm: Introduce xe_device_suspend/resume()
Message-ID: <ao6PXPHitn_vMcUg@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-8-raag.jadav@intel.com>
 <20260821114306.23BEF1F000E9@smtp.kernel.org>
 <aoyLymx1-fZkEh-k@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aoyLymx1-fZkEh-k@intel.com>
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

On Mon, Aug 24, 2026 at 02:22:02PM -0400, Rodrigo Vivi wrote:
> On Fri, Aug 21, 2026 at 11:43:05AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> Raag, could you please take a look and respond all Sashiko's new findings one by one
> with your analysis?
> 
> > New issues:
> > - [Critical] External pinned BOs lose their DMA mappings during FLR suspend but are not unbound from GPU VMs and not restored on FLR resume, leading to an exploitable DMA UAF.

I doubt if anything in userspace survives FLR, but MM corner cases are
already documented as TODO.

> > - [High] Deadlock in FLR prepare path due to waiting for migration jobs after disabling interrupts and stopping GuC.

We don't deal with migration in this path, also documented.

Raag
