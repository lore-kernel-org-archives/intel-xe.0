Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82068C6FD18
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 09:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B18210EA48;
	Wed, 29 Mar 2023 09:31:51 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCC810E52B
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 09:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680082309; x=1711618309;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=FitRSvC1AxRDxHiLrDDzfa4YBAO7OEH9bn2ueHQxhvw=;
 b=hSb1/lRDJRifm2Kh3s4Xp5XVHk+cl6e6wcnZIz3T/pz26gZentV7YhKX
 e+pBMY5NS4rvpQbBKBGOv72GxA4IiEUZ9vbFOd+sVF05h46CMYmqWBUeV
 39kwz9rdcWH/KWyVagMtpskxo8IjyvZNOFLCpa7AOZiT9PpZxV9Qcsz2g
 GUugCq34V6kfrf4MBPaYSt75+SiO4CFXQiXcQS9lxpWAmOAZIz5f1gg7h
 0+ZbwoYIyAteknl1xL+YUCuEwlTWvnAjV57vOrpK95a4mDVbMjNqBolo1
 JnsSOUodIkuJK6xHrxIjpB57JdUJOSAUNlEUl0W0SZxUS3VFfs9hxBCEQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="403452019"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="403452019"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 02:31:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="930245914"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="930245914"
Received: from jetten-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.146])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 02:31:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
In-Reply-To: <09b3de5d-4b8a-bf41-5e18-c583958b39b1@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230328161021.669017-1-rodrigo.vivi@intel.com>
 <20230328161021.669017-5-rodrigo.vivi@intel.com>
 <20230328202446.GL4085390@mdroper-desk1.amr.corp.intel.com>
 <fbd73cb1d45a956ed723ba4806e38c78337b37e0.camel@intel.com>
 <09b3de5d-4b8a-bf41-5e18-c583958b39b1@intel.com>
Date: Wed, 29 Mar 2023 12:31:01 +0300
Message-ID: <87o7ob52ga.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [RFC 4/5] drm/xe: Remove useless XE_BUG_ON.
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 28 Mar 2023, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 28.03.2023 22:27, Vivi, Rodrigo wrote:
>> On Tue, 2023-03-28 at 13:24 -0700, Matt Roper wrote:
>>> On Tue, Mar 28, 2023 at 12:10:20PM -0400, Rodrigo Vivi wrote:
>>>> If that becomes needed for some reason we bring it
>>>> back with some written reasoning.
>>>
>>> From a quick skim through this patch, most/all of these shouldn't be
>>> BUG_ON either.=C2=A0 These are assertions that we don't expect to get
>>> triggered, but if we do screw up somewhere we shouldn't be bringing
>>> down
>>> the entire machine; a WARN (and possibly an early exit) would be more
>>> appropriate for most of these.
>>=20
>> yeap! I fully agree on that. I get frustrated when I hit one of these
>> BUG_ONs that should be a graceful exit with a warn without a panic...
>
> Recently there was another discussion with proposal to introduce
> XE_ASSERT as a replacement of XE_BUG_ON - is this still considered ?
>
> We likely don't want to pollute production driver with too many
> redundant BUG_ON/WARN_ON, but still want be paranoid on debug builds
> (with just WARNs and continuing until the unavoidable crash).

There are a number of related factors here. From least subjective to
most subjective:

First, the trend in kernel is to pretty much never use BUG_ON. The idea
is that you WARN_ON, and it's the userspace policy to set panic_on_warn
to oops. This includes the CI.

Second, each of the macros could use a comment describing what it does,
what it does not, what it should be used for, and what not. Currently
there is zero, neither in xe or i915. Everyone just figures it out for
themselves or cargo-cults.

Third, I think having *BUG_ON/*WARN_ON in the name of a local macro that
behaves differently from the originals is misleading. To this end I
suggested naming it ASSERT something or other to model it after C
standard library assert(3) that generates no code for NDEBUG. IMO it
implies debug build behaviour better than *BUG_ON. I think the current
*BUG_ON/*WARN_ON give a false sense of security regarding input
validation.

(I understand the need for asserts that generate no code for non-debug
builds when the asserts have a performance impact.)

Fourth, I do think the current *BUG_ONs are being used too
liberally. They're everywhere, so more is added everywhere. That's the
example being followed. Shouldn't happen so no harm in adding a check,
right? Well, I'm not so sure about that. There are 1300+ GEM_BUG_ON's
and GEM_WARN_ON's in i915. (Of which only 4 under display, but that's
probably due to the "GEM" naming as well as my opinion of them.)


BR,
Jani.



--=20
Jani Nikula, Intel Open Source Graphics Center
