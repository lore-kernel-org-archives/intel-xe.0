Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84331CAC5B0
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:56:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43CF810E6ED;
	Wed, 24 Sep 2025 11:56:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NNMGSvN3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA73010E6ED
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 11:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758714990; x=1790250990;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2sGmeqpn3po014o6uH7kf68t1M+fnP5nJ/BSFdHQrvk=;
 b=NNMGSvN3hRIARUdTkx3+Guq1nmRm4tA5CFyKZXqSQLzFKXmmFMMVLqog
 oJSK1vHb+4QGnddBcKIrBAOz+HryezrkGUWcN0vvm1kc3fvMykZVSqlUr
 BcIG1izhBS0NYMvs7LKw41VKzyHYlL+RQQZRfRq5tF4SFpfcqMulbIFe1
 t7oI7hIfBE+6tBPSugODoTiPpXiZurVPKo5VBpWqTETSBZ1aUMbQSxldJ
 yU6aQiFao3hWGQ3mOVjk6PyiYa5KvHCPziu+mvzoicCfGsjv/njUXKP6Y
 xOdQayFD01VedH27pluC5DAUsXAyjqmc7v+HnPdsYbB5tx4Cy7ddBQEuJ A==;
X-CSE-ConnectionGUID: F2RPODrBS8yJMb6rU//H7w==
X-CSE-MsgGUID: hLaFA+tpQTak2Jec7PCW3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63636441"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="63636441"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:56:30 -0700
X-CSE-ConnectionGUID: YJ3sV6k3Qhy4Wm6VPPGZZw==
X-CSE-MsgGUID: Rv7JcszFSXCdrqdCGoxptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="181028266"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.144])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:56:28 -0700
Date: Wed, 24 Sep 2025 14:56:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1?= =?utf-8?Q?re?= for
 series starting with [1/2] drm/xe: Fix ggtt fb alignment
Message-ID: <aNPcaaAn0-MXCv0U@intel.com>
References: <20250924081304.10098-1-tvrtko.ursulin@igalia.com>
 <175871229206.361551.6945179096330158702@1538d3639d33>
 <90ac93f9-90c4-4283-9dd7-f274cda34615@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90ac93f9-90c4-4283-9dd7-f274cda34615@igalia.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Wed, Sep 24, 2025 at 12:26:31PM +0100, Tvrtko Ursulin wrote:
> 
> 
> On 24/09/2025 12:11, Patchwork wrote:
> 
> [snip]
> 
> >         Possible regressions
> > 
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events-tiled-
> >     atomic@pipe-d-dp-2-4:
> > 
> >       o shard-bmg: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-154941v1/shard-bmg-1/
> >         igt@kms_async_flips@async-flip-with-page-flip-events-tiled-
> >         atomic@pipe-d-dp-2-4.html> +8 other tests dmesg-warn
> >   *
> > 
> >     igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-c-
> >     hdmi-a-3-4:
> > 
> >       o shard-bmg: PASS <https://intel-gfx-ci.01.org/tree/intel-xe/
> >         xe-3822-af3cdefd0a1ad2dad29fcde0854ccbce494cc28a/shard-bmg-5/
> >         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
> >         c-hdmi-a-3-4.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/
> >         tree/intel-xe/xe-pw-154941v1/shard-bmg-8/
> >         igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-
> >         c-hdmi-a-3-4.html> +18 other tests dmesg-warn
> 
> Mysterious page faults. Looks like the BMG failures due DPT alignment / 
> 512 were real after all. Does it provide any hint to you Ville?

Sounds like the same thing that's happening on MTL.

For ADL I previously forced the DPT alignment in GGTT to 16k
in tgl_plane_min_alignment() to cure async flip faults.

I later tried the same trick on MTL, but I think I had to
bump it to 32k to completely eliminate the faults there.

And the MTL faults didn't seem to be entirely about alignment
because IIRC the other way I could eliminate them was by adding
a few dummy pages around the DPT in GGTT, even while forcing the
start of DPT to be only 4k aligned. And that's when I got pulled
into some other work and didn't have time to finish the
investigation :/

-- 
Ville Syrjälä
Intel
