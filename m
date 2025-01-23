Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD896C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 16:45:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9296B10E87F;
	Thu, 23 Jan 2025 16:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvvHgzTa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834EA10E87F
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jan 2025 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737650724; x=1769186724;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OwZ4wqYlRSXn0JXf3rnTB/IIom/u48qpwB9c3xTjrBw=;
 b=KvvHgzTab67T0OxlHczcNg8ZuZ0wSM+xbUxdTR31m/mInKliDsWi9ubk
 OnbwBP78eYlrS7f/7wgh7J4RD7YUZccgJj6tB6vgR0bpu0boqE7BeGTQ1
 jZB5/Eocaxtgq82bGJc+YD9xkiZixmJ2xhHyirVDHQUsqMfHy/i5PDX4x
 w1pnbvJDbE+bkt3zxo83N3ltb9mIz2ORB08WuiOKkd739u1OtxUKR6dfA
 YRhSKZ5zYmapT/OkrnKrJs6C+GW0s9xG/jphmNeRmRWdf6Dh9XpaG2L1i
 YRsnCQ4zFEuPnO38P53zHflbxZtccWKmbSRitCLibzAXlaxNIJa17p5Mb w==;
X-CSE-ConnectionGUID: toyI3ppKQN2uD9b2+8vJ8g==
X-CSE-MsgGUID: UCKQSNLYRtqBTeLWdmveKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41830942"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="41830942"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 08:45:24 -0800
X-CSE-ConnectionGUID: lMk0UnyFQTmfn/ZWFG4QBA==
X-CSE-MsgGUID: 8/BVSFL2R7yt88cW2SG8RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138387565"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 08:45:22 -0800
Date: Thu, 23 Jan 2025 10:45:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Harrison, John C" <john.c.harrison@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "stable@vger.kernel.org" <stable@vger.kernel.org>, "Filipchuk,
 Julia" <julia.filipchuk@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/devcoredump: Move exec queue snapshot to
 Contexts section
Message-ID: <eucwwgbk6fctubofysjtkvibcci2p4c76bzl2kdsar2c22xjug@zhvnmqvf7zw3>
References: <20250123051112.1938193-1-lucas.demarchi@intel.com>
 <20250123051112.1938193-2-lucas.demarchi@intel.com>
 <f16aac40a9ea1ab40d1083228cd0b460e1d217e3.camel@intel.com>
 <kw4rrdedc3ye5elnis6bjz2xg34ttrul2d6qye5lm3ixeee36l@ncfk65fdvb4s>
 <82a330f4d0c43036e088939cd6ba59790173447f.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <82a330f4d0c43036e088939cd6ba59790173447f.camel@intel.com>
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

On Thu, Jan 23, 2025 at 08:52:13AM -0600, Jose Souza wrote:
>On Thu, 2025-01-23 at 08:30 -0600, Lucas De Marchi wrote:
>> On Thu, Jan 23, 2025 at 08:14:11AM -0600, Jose Souza wrote:
>> > On Wed, 2025-01-22 at 21:11 -0800, Lucas De Marchi wrote:
>> > > Having the exec queue snapshot inside a "GuC CT" section was always
>> > > wrong.  Commit c28fd6c358db ("drm/xe/devcoredump: Improve section
>> > > headings and add tile info") tried to fix that bug, but with that also
>> > > broke the mesa tool that parses the devcoredump, hence it was reverted
>> > > in commit 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa
>> > > debug tool").
>> > >
>> > > With the mesa tool also fixed, this can propagate as a fix on both
>> > > kernel and userspace side to avoid unnecessary headache for a debug
>> > > feature.
>> >
>> > This will break older versions of the Mesa parser. Is this really necessary?
>>
>> See cover letter with the mesa MR that would fix the tool to follow the
>> kernel fix and work with both newer and older format. Linking it here
>> anyway: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/33177
>
>Still someone running the older version of the parser with a new Xe KMD would not be able to parse it.
>I understand that we can break it but is this really worthy? not in my opinion.

because for the debug nature of this file, it's hard if we always keep
the cruft around. In 5 years developers implementing new decoders will
have to get data from random places because we will notice things are
wrongly placed.

isn't it easier to do do it early so we don't increase the exposure
and just say "kernel screwed that up and fixed it", then propagate the
change in mesa in a stable release, just like we are doing in the
kernel?

>
>>
>> It's a fix so simple that IMO it's better than carrying the cruft ad
>> infinitum on all the tools that may possibly parse the devcoredump.
>>
>>
>> > Is it worth breaking the tool? In my opinion, it is not.
>> >
>> > Also, do we need to discuss this now? Wouldn't it be better to focus on bringing the GuC log in first?
>>
>> That's what the second patch does. We need to discuss both now and
>> decide, otherwise we can't re-enable it and have either the guc log
>> parser or mesa's aubinator_error_decode_xe broken.
>
>I can't understand why it needs both, could you explain further?

we are already discussing it, why not?  Also as I said there's the guc
log parser, another tool, that is already expecting it in the other
place. So if we are going to re-enable the guc log, it's the best
opportunity to fix this, otherwise we will probably never do it and keep
accumulating.

Lucas De Marchi

>
>>
>> Lucas De Marchi
>>
>> >
>> > >
>> > > Cc: John Harrison <John.C.Harrison@Intel.com>
>> > > Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>> > > Cc: José Roberto de Souza <jose.souza@intel.com>
>> > > Cc: stable@vger.kernel.org
>> > > Fixes: 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa debug tool")
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_devcoredump.c | 6 +-----
>> > >  1 file changed, 1 insertion(+), 5 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
>> > > index 81dc7795c0651..a7946a76777e7 100644
>> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
>> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
>> > > @@ -119,11 +119,7 @@ static ssize_t __xe_devcoredump_read(char *buffer, size_t count,
>> > >  	drm_puts(&p, "\n**** GuC CT ****\n");
>> > >  	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
>> > >
>> > > -	/*
>> > > -	 * Don't add a new section header here because the mesa debug decoder
>> > > -	 * tool expects the context information to be in the 'GuC CT' section.
>> > > -	 */
>> > > -	/* drm_puts(&p, "\n**** Contexts ****\n"); */
>> > > +	drm_puts(&p, "\n**** Contexts ****\n");
>> > >  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
>> > >
>> > >  	drm_puts(&p, "\n**** Job ****\n");
>> >
>
