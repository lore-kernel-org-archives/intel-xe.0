Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10568C47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 06:14:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A510E491;
	Wed, 17 Jan 2024 06:14:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C3E10E491;
 Wed, 17 Jan 2024 06:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705472076; x=1737008076;
 h=date:from:to:cc:subject:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7CoJcKPmIq4gonDiFief2YKKzVodueSah8mC1DhaFHs=;
 b=AqclGJ6kp3hetPBCHhyDcVxCPA4wSTzRUUEB1vuhEt6CtovF1gms0gi2
 hKoZuiv7WqFVn+ze6fNMDaANNkbciyyBZ/bMpN/BKhacfk+/dHL6/Agfs
 Q2liReSbfeR4HnTvM+IM+5/4tOF7IEnEVYiQLuDFmCZA55fWkoyM+b3uC
 +2MGqfw5QFWcu92beI5tJTfmxTRf3Q7HeXc7m4o0kA56Tv5ryE7AC8xxk
 WCEzqKFYsNqB9qyW6h3FrTrSjXvXXeBxSBxNHpB57ElMT7AGObcsJeB31
 KjEySCvy/hONpSrc14slYKAvcG6P/Zadk426xbuIIrP00X0Ygc8J2J+YS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="466461146"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="466461146"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 22:14:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="927741751"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="927741751"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 22:14:34 -0800
Received: from maurocar-mobl2 (maurocar-mobl2.ger.corp.intel.com
 [10.94.253.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D71A5580CA2;
 Tue, 16 Jan 2024 22:14:32 -0800 (PST)
Date: Wed, 17 Jan 2024 07:14:30 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] xe_live_ktest: Use xe_live_test kernel
 module
Message-ID: <20240117071430.1d70535e@maurocar-mobl2>
In-Reply-To: <2utfb2ntlzox27wcrqtdzoojj5r6idhkxjhbgur6wnlmh5qpb4@rtlje3o72eit>
References: <20231205224926.2188996-1-lucas.demarchi@intel.com>
 <20231207164152.57be3d07@maurocar-mobl2>
 <3kunqgqyf7tobiwhcpvjp7rcvidrgnz2jq3qqoxjbl7kaftdq7@7hdweo57htff>
 <njwvai6cu7jwmy7lmg3vkg4jd52uq2f6es4obvdplkz43i6hpe@jqrzk4bveqqc>
 <dzacvbdditbneiu3e3fmstjmttcbne44yspumpkd6sjn56jqpk@vxu7sksbqrp6>
 <20240112093252.0a4bf850@maurocar-mobl2>
 <57epajumgzrllmyufx7233yjja2c3fbs2zgfflkhcspfvwak47@h64l4uzne54h>
 <11e1b3f4-b0ba-4095-96c6-f2bf18f27fd2@linux.intel.com>
 <87mst7rri8.fsf@intel.com> <20240115205207.5b491e3e@maurocar-mobl2>
 <2utfb2ntlzox27wcrqtdzoojj5r6idhkxjhbgur6wnlmh5qpb4@rtlje3o72eit>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: igt-dev@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 16 Jan 2024 08:50:51 -0600
Lucas De Marchi <lucas.demarchi@intel.com> wrote:

> On Mon, Jan 15, 2024 at 08:52:07PM +0100, Mauro Carvalho Chehab wrote:
> >On Mon, 15 Jan 2024 09:21:35 +0200
> >Jani Nikula <jani.nikula@linux.intel.com> wrote:
> >  
> >> On Mon, 15 Jan 2024, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:  
> >> > On 1/12/24 15:29, Lucas De Marchi wrote:  
> >> >>> On such case, you should document kunit_debugfs at Documentation/ABI.  
> >> >>
> >> >> debugfs is not part of ABI.  
> >> >
> >> > That's arguable. Check Documentation/ABI and you'll see several debugfs
> >> > nodes documented there.  
> >>
> >> I guess you could argue documenting your debugfs under Documentation/ABI
> >> makes it ABI, but I'd avoid doing that. Usually we use debugfs precisely
> >> to avoid the burden of ABI and all the baggage that brings.  
> >
> >Placing things at debugfs "precisely to avoid the burden of ABI and all
> >the baggage that brings" sounds a bad practice to me, but you can ask
> >others at LKML and see if this is a acceptable.
> >
> >My understanding is that, if userspace tools rely on what's there at
> >debugfs, and a change break such tools, there is a high chance that
> >such change will end being reverted - at best, it will surely provide
> >some flame wars.
> >
> >I remember we had some troubles related to trace logic in the past,
> >due to something similar: even not originally meant to provide a stable
> >ABI, and being under debugfs, there were some changes breaking userspace
> >which caused lots of discussions. Can't remember anymore if the changes
> >were reverted or not, but at the end ftrace ABI was considered as stable.  
> 
> ftrace provides a way for you to read the format of the tracepoint and
> use it (API). If you did it otherwise and hardcoded the format (ABI),
> you are on your own as tracepoints in the kernel keep changing.
> Try grepping "tracepoint" in the last pull requests.

Not quite true. Since when the EDAC subsystem was redesigned back
in 2013, RAS events have been using ftrace API to report hardware
problems to userspace. We did the design of such API together with the
ftrace maintainer, that developed an userspace counterpart (libtraceevent),
designed to have a stable uABI. 

The rasdaemon application uses it since then, originally on a fork, as 
it took a while for libtraceevent to become a separate tree and started
being shipped in distributions. Only last year we finally migrated to use
the current incarnation of libtraceevent, mostly to cleanup rasdaemon code.

During all this time (10+ years), the API remained the same, and we had
only once an incident on such interface - not directly related to uABI,
but to some behavioral change that happened at the logic to flush
ftrace ringbuffer, causing troubles for rasdaemon.

Regards,
Mauro
