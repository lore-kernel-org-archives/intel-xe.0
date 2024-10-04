Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB4CFA74C
	for <intel-xe@archiver.kernel.org>; Fri,  4 Oct 2024 10:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC2210E25E;
	Fri,  4 Oct 2024 10:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBovFI3a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DB710E1C1;
 Fri,  4 Oct 2024 10:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728036031; x=1759572031;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=6lazpgH4p0hLNCoalUGcO5Izmsq9hosDEf3qBePje2Q=;
 b=LBovFI3azoCl9SJjHcWPN25zg0eCQmgsoHTqWBpsUTr6UAFVDWY115SX
 irUzH/JjPhMWNrZFkB5/WTakLhcQLQDPu89s1vwztVo2HmPYhvbRf+Tlk
 KQWKhAVOhbNpoZOvrug2ZQcVyFnH4iXT8Qru9XhvkymExwwCsEyFB2tEP
 YFc/ST4XcuORdD7XK9/d8qMGoUmxgl6bb/e4XUK8Vmlv5bvok9Ze2XbPs
 ZPHzWdpEaeaRhwRBFdX5iRWeCV+mhgjmifiKaJI5XriktmLm4W+rIBoOi
 9+DDoA4gGfCHrU+l/XZuKu0FLdIV+3CRVxp0IHysrW0/mSLgYkq++ThgE Q==;
X-CSE-ConnectionGUID: Pz7mwf91SwuhWvEOuc5EpA==
X-CSE-MsgGUID: 6KYX52XIRSmQbHx42m+l0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27424112"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="27424112"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:00:30 -0700
X-CSE-ConnectionGUID: PbNmdi4nTh6MEDNXoEffXg==
X-CSE-MsgGUID: SPh/BV3HR2uz8CmWHRGa4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="79498173"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.89])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:00:27 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Gomez <da.gomez@samsung.com>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>
Cc: I915-ci-infra@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 patchwork@emeril.freedesktop.org, tools@kernel.org, d+samsung@kruces.com
Subject: Re: Incorrect response address when using B4
In-Reply-To: <D4MWUZ2F8B75.2LOQZKGUBIBWK@samsung.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20240930133009eucas1p14b11ee712ae3ab1ca3aafc2833103bcb@eucas1p1.samsung.com>
 <20240930133007.u4vm5qj5urikpmvc@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-sapphire-swift-of-reverence-168e2b@lemur>
 <20240930141839.3rjfom4c2tca655n@AALNPWDAGOMEZ1.aal.scsc.local>
 <20240930-rustling-auburn-jaguar-23d200@lemur>
 <D4MWUZ2F8B75.2LOQZKGUBIBWK@samsung.com>
Date: Fri, 04 Oct 2024 13:00:24 +0300
Message-ID: <87bk00rxvr.fsf@intel.com>
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

On Fri, 04 Oct 2024, Daniel Gomez <da.gomez@samsung.com> wrote:
> On Mon Sep 30, 2024 at 4:20 PM CEST, Konstantin Ryabitsev wrote:
>> On Mon, Sep 30, 2024 at 04:18:39PM GMT, Daniel Gomez wrote:
>>> > Was it an automated tool that sent you that message? Normally, email clients
>>> > would honour the "Reply-To" field and not use the From: address put in by the
>>> > relay.
>>> 
>>> It was a CI Patchwork tool. Response [1] to my patch was sent from "From:
>>> Patchwork <patchwork@emeril.freedesktop.org>".
>>> 
>>> [1] https://lore.kernel.org/all/172735727458.1107233.1757281470637305143@2413ebb6fbb6/
>>> 
>>> I think that tool is ignoring the "Reply-To" field [2] from the B4 message and
>>> using the From field.
>>> 
>>> 	From: Daniel Gomez via B4 Relay <devnull+da.gomez.samsung.com@kernel.org>
>>> 	Reply-To: da.gomez@samsung.com
>>
>> It's no big deal as long as you got the email response in the end. We expect
>> this to happen with a lot of automation, which is why any replies to the relay
>> address are auto-discarded.
>
> Konstantin,
>
> B4 web endpoint works very well for me because of the freedom it gives me for
> sending patches. However, as a user of this feature I'm expecting all replies
> to go into my inbox (regardless of whether it is an automated respose or
> not). Unfortunately, they don't. So, what I'm asking here is if it would be
> possible for these automated responses from Intel 0-day, Intel GFX CI (Patchwork
> Freedesktop) and lore (public inbox), to change their responses to use the
> "Reply-To" field instead of "From". Note that the first 2, completely remove all
> the Cc addresses. IIUC and according to the Jani's answer, this seems to be not
> doable on their end. I'm not sure about lore's side.

I think the request is reasonable, and I sure didn't mean to give the
impression that it's not doable.

But it's still three distinct projects with their own developers that
need to be convinced to make the change. (And if it's not clear I'm not
one of those developers.)

> Is it posible to change the "Reply instructions" section in lore, to use the
> "Reply-To" field? It won't solve the problem completely but at least users of
> that would use the right git-send-email command.
>
> Also, what's the use case of using B4 web endpoint if replies may or may not
> land in the sender's inbox? I think the use of this feature requires proactively
> monitoring the patch and/or mailing list.

In most cases you'd expect people to "reply all", and if you have your
address in Cc:, you're covered. Lore's instructions do that. It's the
cases that limit recipients to reduce what might be consider spam that
have the issue.

BR,
Jani.


-- 
Jani Nikula, Intel
