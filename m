Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82007C54EFC
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jul 2026 09:00:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2116A10E812;
	Tue, 28 Jul 2026 09:00:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpGV2G68";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8505510E812;
 Tue, 28 Jul 2026 09:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785229254; x=1816765254;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=fdgV+jDy//T8w/FAaa/Vcp309QDFEglJDuk9Zo1RUDM=;
 b=RpGV2G68ExRGQ5cSP/AyWPKmbjt7b+IJ3c3eBMDWQQpMgDI3n37c/zuj
 4PekPEaL1ZRsUNNd4qEPPhlgUxTe8DnQTjcc17YZ4mTYBBMtFnLkBtHFX
 73OBZxRI52fcLA2A0Ak0lfGATBGcTc8mOg1Me4ZDBNyJNpOjkHJQaG+q2
 BNaqqkBng73Rg3mUaqABcYFIZpiaqrzk5iQNGxLzDZfAuC5Aclmca2Tzw
 uAAfJbP8HTxe2TSZdIUql84yK/D0zp4bkLYHVKz9cS3zjvxZAmXYesUV+
 96sRoyGle3VpUQK4dlq1UMVf/acWoEb8F4zCKDvOWegFTqepwY8MJTGEl w==;
X-CSE-ConnectionGUID: Fg7vfvfWSiqjP+DWsfcd1Q==
X-CSE-MsgGUID: G+9KKPs9SYOQpkjKxi1cDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="96163225"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="96163225"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:00:54 -0700
X-CSE-ConnectionGUID: gZCcZqlGQRSDoLLHiRCiEQ==
X-CSE-MsgGUID: 9kWsb94USDazR7umK5CPkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; d="scan'208";a="255341601"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.76])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 02:00:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org, uma.shankar@intel.com,
 shawn.c.lee@intel.com, kai.vehmanen@intel.com, ankit.k.nautiyal@intel.com,
 chaitanya.kumar.borah@intel.com, suraj.kandpal@intel.com
Subject: Re: [PATCH v3] drm/i915/audio: treat UHBR SST like MST for
 cpu_transcoder signalling
In-Reply-To: <f4e354724191a8d192eb00610179857ac81cac09@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260708113558.1863316-1-mitulkumar.ajitkumar.golani@intel.com>
 <f4e354724191a8d192eb00610179857ac81cac09@intel.com>
Date: Tue, 28 Jul 2026 12:00:48 +0300
Message-ID: <070ed63ce8a1539ea3b4212db3bc7f3dcda09eb7@intel.com>
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

On Tue, 28 Jul 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 08 Jul 2026, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
>> Both DP MST and UHBR SST require the audio component to use a real
>> cpu_transcoder (>= 0) value to identify the audio stream on a port.
>> For DP MST this was already handled; for UHBR SST it was not, causing
>> pin_eld_notify() to signal cpu_transcoder = -1 (the legacy SST sentinel)
>> and find_audio_state() to skip the per-transcoder entry for the UHBR
>> stream.
>>
>> After suspend/resume or replug, the ELD lookup fails and audio goes
>> silent. Fix by detecting UHBR SST alongside DP MST when deciding
>> whether a real cpu_transcoder value must be used for audio state
>> addressing, in both the pin_eld_notify() signalling and the
>> find_audio_state() lookup paths.
>
> [snip]
>
> Going through some merged patches while writing the pull request...

Oh, and PS. Why is this not Cc: stable?

BR,
Jani.

>
>>  
>> -	/* Non-MST */
>> +	/* Legacy SST. */
>
> Please be careful about tossing around "legacy". It's the bog standard
> DP 1.4 non-UHBR SST that's used absolutely everywere that you're talking
> about here. It's not "legacy".
>
> BR,
> Jani.

-- 
Jani Nikula, Intel
