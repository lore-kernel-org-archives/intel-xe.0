Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40102C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 11:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0429110E033;
	Thu, 23 Mar 2023 11:13:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA42410EA70
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679569992; x=1711105992;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=uW8Vh/x9GukieoHu25JZybJGv2CJYnq2eym+sdhGmtQ=;
 b=lVypGmiIIIwm5ybDX9Hv7Y4C/nPoIj3C/Ti8hb4AaPwLM5mZhOE8yKW5
 5XjFA8mueKt4jwSassQvZnTEUM3c2Xz/SCR9Ee8APAgkNTOqFn1k7kaVJ
 1ti83LAyf9zcapP31qVCMWVrJsq/7osHuKvZD03QunJQ+7dauTsrWytVk
 dT2p9EhqXKbQfdhCwUs66jungdss7Eyeh7210Lp6iWVPGWYBbldkMn7Sc
 9ZPtPSV5pgMCQNHES7npXXwyQWgin3jbjQ1QMi5qMmVG1nqgzzUs6cnc0
 BClGdb0gwUz1zTLovWifu7oLHqCqTL4hy8E7vUpdzEmhSolq1ss732+5G w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327836952"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="327836952"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="682268578"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="682268578"
Received: from rkiss-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.51])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 04:13:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
In-Reply-To: <ZBtrrTeswE5eg0DQ@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230321160420.1352889-1-jani.nikula@intel.com>
 <87v8iu6qc1.fsf@intel.com> <87sfdy6q9k.fsf@intel.com>
 <20230321230448.rkgnfemrg4ehwfat@ldmartin-desk2.lan>
 <87pm916tba.fsf@intel.com>
 <20230322132841.o7ptwildnnykj4kr@ldmartin-desk2.lan>
 <87iles7ted.fsf@intel.com> <ZBtrrTeswE5eg0DQ@intel.com>
Date: Thu, 23 Mar 2023 13:13:07 +0200
Message-ID: <87355v7mbg.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/i915/rps: split out display rps parts to
 a separate file
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, 22 Mar 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> I believe the easiest way will be to remove the display portion of the
> initial mega-squash and create a display only patch/series and make that
> separated.
>
> Also starting to think to leave display out for the initial merge of Xe.
> Then add display later.

This does have a certain appeal to it.

We have 260+ commits on top of the current drm-tip baseline in
drm-xe-next. The vast majority of them are pure xe, unrelated to display
integration in any way. Most people are working on things not related to
display.

Cleaning up the display integration could use a heavy handed rebasing
and refactoring of the display changes, both the xe and i915 changes. It
would be easier if the display developers had more of a free hand with
force pushes, without distracting the rest, i.e. have a
drm-xe-display-next branch or something, regularly rebased on top of
drm-xe-next.

I'd imagine the goal would be to keep the display integration ready to
merge, with the display pull request immediately following the initial
merge of xe.

Now, the big problem with this, of course, is splitting up the display
parts from drm-xe-next and the individual commits there, in a way that
still leaves us with a decent base for the display branch. Basically how
to have new drm-xe-next + new drm-xe-display-next == old drm-xe-next.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
