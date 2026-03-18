Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9278AF483C6
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90310E53A;
	Mon, 23 Mar 2026 16:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=sony.com header.i=@sony.com header.b="tNx0spfx";
	dkim-atps=neutral
X-Greylist: delayed 603 seconds by postgrey-1.36 at gabe;
 Wed, 18 Mar 2026 06:01:56 UTC
Received: from jpms-ob02.noc.sony.co.jp (jpms-ob02.noc.sony.co.jp
 [211.125.140.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BBD10E049;
 Wed, 18 Mar 2026 06:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sony.com; s=s1jp; t=1773813717; x=1805349717;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=eoMupIu5zVSqyOQhuq6iQarD8KxsCTZiio2rS8ELzNI=;
 b=tNx0spfxqRHlsXiUAIUNgPc6Ph9DDvCdZ1TkdUv2B91Sv854/teXRGNl
 pVAIIQBOjH4VLPNxHUs4WDG+XbRUasUlF00PeTcvoTOYTUDVlxX+tydlQ
 s5b8P8MKkgGP+WExZ2kb+6CAT5MCDRDOVMcnbaL0iJRbQL5vbHoN1uu0J
 3NV/rji/k6cfHBkk1XaOeNx6/g9IwM4VGYsPjRxqroyQq96mS+foaT0pt
 D2+hwZBZcQszkxjdKDR2uQmWW38LHwV1sBxAuKCSjheLVy1SwCMyLX1fK
 dMNozQE3+Aq4qfn80tVKNz+Uu8TjYj4jEQ+Rr4G/ElA7VKv88kIyrqI0n Q==;
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp)
 ([IPv6:2001:cf8:0:6e7::7])
 by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:51:51 +0900
X-CSE-ConnectionGUID: rLxGr/LJTuiBO7S+Ph9nTg==
X-CSE-MsgGUID: gh60nqK7RPO5TcdDQeuduQ==
X-IronPort-AV: E=Sophos;i="6.23,126,1770562800"; d="scan'208";a="592821526"
Received: from unknown (HELO rahul-Z690-S01) ([43.11.34.175])
 by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 14:51:51 +0900
Date: Wed, 18 Mar 2026 14:51:42 +0900
From: Rahul Bukte <rahul.bukte@sony.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Check set_default_submission() before
 deferencing
Message-ID: <abo9bv1oz_5S66zE@rahul-Z690-S01>
References: <20260203044839.1555147-1-suraj.kandpal@intel.com>
 <864065cfcd3baaff212135beb781b0a5990728d8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864065cfcd3baaff212135beb781b0a5990728d8@intel.com>
X-Mailman-Approved-At: Mon, 23 Mar 2026 16:04:08 +0000
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

Hi,

On Fri, Mar 13, 2026 at 06:34:22PM +0200, Jani Nikula wrote:
> On Tue, 03 Feb 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> > From: Rahul Bukte <rahul.bukte@sony.com>
> >
> > When the i915 driver firmware binaries are not present, the
> > set_default_submission pointer is not set. This pointer is
> > dereferenced during suspend anyways.
> 
> Which kernel vesions did this happen with? Should this have had Fixes:
> or Cc: stable?

Fixes: ff44ad51ebf8 ("drm/i915: Move engine->submit_request selection to a vfunc")
Cc: stable@vger.kernel.org

Suraj, you mentioned that you have commited this to din [1]. Can we add
this fixes and cc tags to that please?

[1]: https://lore.kernel.org/all/DM3PPF208195D8D000253F905FADCA379F9E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com/

Best regards,
Rahul

