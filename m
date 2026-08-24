Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEE0C5DF9C
	for <intel-xe@archiver.kernel.org>; Mon, 24 Aug 2026 16:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB5C10E57B;
	Mon, 24 Aug 2026 16:08:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N63c+7uZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4798610E57B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Aug 2026 16:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787587727; x=1819123727;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Wuj3p3MT8J4IciJ3DEAn7NumzaK3EjJYqrOdQxYpsFQ=;
 b=N63c+7uZoB+nQiP93ddZFaE2+nk4siqeqX9hZhppswBYUGUIHGZ0KSiM
 Apk7itBHTkNI9E21XKnT4G6XTe5OtC+3Mj5jP5NkfpbVbuvGR3z33hwNk
 RaN6T5JB6au+ofUlz8dRNJXjImK8LPioHeiUb26bifBB4WegjpWEMRZkj
 RG85NGyxmbtVdPLRE9PZQOUDZIEsu9wU1waMcgCC3Bn6KzqPeMHmAo3Z2
 qyzUlYRBE73pXDYKwlcc16md6jyfqYmJnwVdTGquWWRZ+a5CHyDIrlCva
 yY8VYwzz7MqPungTc6KJyUQunOud8LVwsG3o8B8oQXPIiyjPOOwvTTHMJ g==;
X-CSE-ConnectionGUID: o4aum5xFR42RujxWOY3JrA==
X-CSE-MsgGUID: RfKXxTOEQFayo+zLZ4bNmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105421131"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="105421131"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:08:37 -0700
X-CSE-ConnectionGUID: ENRoVwL1TMC38GiF2/hjxA==
X-CSE-MsgGUID: UWP15+/qTyq2l6PUTOJz2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; d="scan'208";a="264425244"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2026 09:08:36 -0700
Date: Mon, 24 Aug 2026 18:08:33 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: sashiko-reviews@lists.linux.dev, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v10 08/10] drm/xe: Introduce temporary device wedging
Message-ID: <aoxsgT0tRuJecTbp@black.igk.intel.com>
References: <20260821112436.545405-1-raag.jadav@intel.com>
 <20260821112436.545405-9-raag.jadav@intel.com>
 <20260821113758.006681F000E9@smtp.kernel.org>
 <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45efbcf8-b598-463e-b415-dfee2a3afe66@intel.com>
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

On Mon, Aug 24, 2026 at 04:30:25PM +0200, Laguna, Lukasz wrote:
> On 8/21/2026 13:37, sashiko-bot@kernel.org wrote:

...

> > - [High] Unprotected state modification and double-increment of `wedged.ref` in `prepare_device_for_reset()`.
> 
> Valid. It should be enough to just take the lock and check xe->wedged.perm
> before taking the reference.

We have a xe_device_wedged() sanity check before landing here, so ideally
we shouldn't be at this point with an active ref. But as mentioned in the
comment, the plan is to drop the whole prepare_device_for_reset() once we
land this series.

Raag

> > > +	/* TODO: We shouldn't be doing such ugly hacks, reuse FLR helpers and drop this. */
> > > +	xe->wedged.perm = true;
