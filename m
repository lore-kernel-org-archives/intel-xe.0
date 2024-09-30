Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446EACE8350
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 14:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D6D10E51E;
	Mon, 30 Sep 2024 14:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YE7QkTLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9949910E51E;
 Mon, 30 Sep 2024 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727707541; x=1759243541;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=zCFMfgECvvmLSW2Hn+BaeWoB4Tw3BB5KJHZMvi/9ug8=;
 b=YE7QkTLSdK+nsTwlAewNBS1Hs3G50W9MGMQn+iGNF8PhkTNMQuqUGvde
 e2T2UJQgLFTPbb+2aw06J3DEnYYhrCAKYgeBFaMK6qUQI33E8AkBmPgYY
 2I6w/C5kc6ajpVSye5jdn0/0j3ToQ4PjfEEk2RSmBd9CsmBQs7Lk4kS4c
 pEotu4iVdXcScPritsobmzkKQsS8uk9BzHAXWY7HwU7Y8Gm7j80GHXQG/
 kqcx/p8Et/whTCx69UZM9hsaE6qrri5OCYH+6ca4VeJIpMueZ+SEu75Cs
 QW3bwNCJduHwPLN/tSk86tFJOqac7DVKVA7+H7kAzzt6QFBCi4i12DqeT g==;
X-CSE-ConnectionGUID: GxVjUjyJRcWqzqTV0HngbA==
X-CSE-MsgGUID: W3S4ijjUQ6KvNMZDEo/VcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44261874"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="44261874"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:45:23 -0700
X-CSE-ConnectionGUID: YJOa/q1cQkGXBbMajB95yA==
X-CSE-MsgGUID: Wd6p1uBZSuCGbrrbejYexw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73454295"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.136])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 07:45:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <20240930143309.pwl7dzv537b2q3wk@AALNPWDAGOMEZ1.aal.scsc.local>
Date: Mon, 30 Sep 2024 17:45:08 +0300
Message-ID: <87h69xw68b.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 30 Sep 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> On Mon, Sep 30, 2024 at 10:20:57AM -0400, Konstantin Ryabitsev wrote:
>> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
>> > > Was it an automated tool that sent you that message? Normally, email clients
>> > > would honour the "Reply-To" field and not use the From: address put in by the
>> > > relay.
>> > 
>> > It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
>> > Patchwork <patchwork@emeril.freedesktop.org>".
>> > 
>> > [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
>> > 
>> > I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
>> > using the From field.
>> > 
>> > 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
>> > 	Reply-To: da.gomez@samsung.com
>> 
>> It's no big deal as long as you got the email response in the end. We expect
>> this to happen with a lot of automation, which is why any replies to the relay
>> address are auto-discarded.
>
> To clarify, the email response didn't land into my inbox. I realized a response
> was sent after checking at lore.kernel.org.

Yeah, our patchwork instance tries not to spam everyone, and limits the
replies to the submitter + intel-gfx/intel-xe mailing lists, but
apparently uses From instead of Reply-To.


BR,
Jani.

-- 
Jani Nikula, Intel
