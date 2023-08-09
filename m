Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A13C04A6A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Aug 2023 15:31:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE2C10E0AE;
	Wed,  9 Aug 2023 15:31:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B6210E0AE
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Aug 2023 15:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691595061; x=1723131061;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Us1PxFJQLVLeIsRvC0If+JWq3Krdu3XLr2Trru4RPLQ=;
 b=Pe7n6phdaOMlV7XSVBF8+mFaQUfTHYOaHEN4eWCAQ2jXz0ULLkIZCYiD
 mNdfHehyE55vp8KOKUrMcmdiivPClRWR+WHJwvHeyu40O1iD0pstC1He3
 O6GPBBnYu24f6Rb1qVONtsZQRRb34zv0Dd1lScfwdahlGYmxG38OzHYU7
 ppCpNdx6GRl30zOynI1aIGVvHQrmD44hT9WxvDL6+hQQfeGrl0F0bxhPN
 Z5HxbTaDtOpcx4CrcFWvaGF7KhMTOkneO+AGzY/Z8rjvEWOei+Vl/b6Tl
 JSR8NgJY1AW34sH+YSF7x8lzXP+0jrxCV2vNTZveLc9Nck9YBG6CxWVWD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370055777"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="370055777"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 08:30:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062513433"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062513433"
Received: from rbujor-mobl.ger.corp.intel.com (HELO localhost) ([10.252.49.48])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 08:30:57 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <z36oxkgfnwkdurwlupkmxl3olty7pfyvk6afnylbdnr2dwmxof@jqnzrnmet65i>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230713150611.7-1-francois.dugast@intel.com>
 <ZLBfsNWDeWYx+c/X@intel.com>
 <3zwh5c6wvaure57flxp5jrqe2rira6des6an3ws25anrauxsnu@a24cb3vjzbh3>
 <87fs4tu7xl.fsf@intel.com>
 <a3bof7gwvoiqgcjlvhogomb45qhylrn6i3mbetvxofs4sthe5u@ka2lh4hbmsk6>
 <87v8dpshff.fsf@intel.com>
 <z36oxkgfnwkdurwlupkmxl3olty7pfyvk6afnylbdnr2dwmxof@jqnzrnmet65i>
Date: Wed, 09 Aug 2023 18:30:54 +0300
Message-ID: <87a5v0s05t.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH 0/7] drm/xe: Code cleanup
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
Cc: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Aug 08, 2023 at 06:05:40PM +0300, Jani Nikula wrote:
>>On Tue, 08 Aug 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Tue, Aug 08, 2023 at 01:47:50PM +0300, Jani Nikula wrote:
>>>>On Mon, 17 Jul 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>>> On Thu, Jul 13, 2023 at 04:33:52PM -0400, Rodrigo Vivi wrote:
>>>>>>On Thu, Jul 13, 2023 at 03:06:04PM +0000, Francois Dugast wrote:
>>>>>>> Fix minor typos and reduce ERRORs reported by checkpatch.pl from 95 to 22.
>>>>>>
>>>>>>I wonder if we should do this with !fixup patches...
>>>>>
>>>>> I think that would be a nightmare to thread through the conflicts.
>>>>
>>>>For display it's a nightmare we have to plunge through. And this just
>>>>made it worse.
>>>
>>> This is automatically resolved when we move display up in the branch
>>> though.  "Automatically" meaning that the pour sould doing the rebase
>>> has to resolve the conflicts. I don't like doing it, but what's the
>>> alternative? Last rebase I did a "squash-heavy approach" because moving
>>> display up means some commits don't make sense anymore, even if they
>>> apply correctly.  Those coding style changes would just be squashed in
>>> the respective commits.
>>
>>Squashing is easy if you have respective commits with 1:1 mapping, but
>>if you have one commit fixing multiple commits, it gets tricky.
>
> no, what I meant is that I turned 10 or so commits into 1 squash to the
> "Add display".  Simply because after moving them up in the branch they
> don't make much sense anymore and just make it difficult to land
> refactors like this on top. It's a nightmare to keep in the long run
> that I should rather avoid. IMO it was fine for a few weeks, but not for
> the several months we are in this situation.

The single huge "add display" is fine for xe, but that doesn't hold for
changes to i915.

All the other decisions regarding the branch management are subject to
that. The proposed changes to i915 must have a clean, sensible history,
and can't be part of patches the likes of "drm/i915/display: Remaining
changes to make xe compile" and "drm/xe/display: Implement display
support".

A month or so ago the latter didn't have a single change to i915. Now it
has several, and they mostly touch stuff changed by the former.

xe development needs to regard i915 as an upstream driver that you can't
change nilly willy outside of drm-intel-next.


BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
