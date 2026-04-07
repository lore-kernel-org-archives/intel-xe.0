Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84BEEDB7CC
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 07:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EE510E345;
	Tue,  7 Apr 2026 07:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bez0AJWf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE41E10E2DF;
 Tue,  7 Apr 2026 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775548699; x=1807084699;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=mma7HJ1n0KLMmqMVAxc9GWk3bAyBanUZo0LgYbr8p2E=;
 b=Bez0AJWfO1qG27xmnaNo1Vvee0/RYvXXEdv4a3KBlbh43caOSNUPZq4e
 NYBqtytZkMcauD1NDIPFH+ocAKZpkFVIwhTMfkNZ+tnfFpPoQ9ZjNKmdF
 SPMNZ3XWF8yDSpp634RocV+5VEdW8YU27DubMZ39ACGt0A8cBu+Uz6hO3
 00SA19OtIwK5DSm9OvOqo7yWg6ERFXOv37MyPNuTLBseffKsbq4kMQ+si
 5bMT7Ou8glcfBzHsRns389cQ5kFlprXuGSgt/H0Zv2HpfoGajDsdczWHz
 uWT7kfZjsfsrbf56cMaNbPN3UZ0/o5TRPuGbKMdKwOLCc8qxRwQqHC4/k w==;
X-CSE-ConnectionGUID: YfMwS9cWRkKso3LMshW6tw==
X-CSE-MsgGUID: nG4hUDdyRM6gLe5csF/FQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80098615"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="80098615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:58:19 -0700
X-CSE-ConnectionGUID: IjHhyaFLRDC5+pttPqkcdg==
X-CSE-MsgGUID: wXkmiNF7RWmejq7/TKfqtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="228373782"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 00:58:16 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Coelho, Luciano"
 <luciano.coelho@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2 1/8] drm/i915: move SKL clock gating init to display
In-Reply-To: <DM3PPF208195D8D6D18797DF43D23B2AB3DE35AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331121608.1016333-1-luciano.coelho@intel.com>
 <20260331121608.1016333-2-luciano.coelho@intel.com>
 <DM3PPF208195D8D6D18797DF43D23B2AB3DE35AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Tue, 07 Apr 2026 10:58:13 +0300
Message-ID: <4c2ab7b05e665b3cca5a809917faf3b64d1ce7f5@intel.com>
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

On Tue, 07 Apr 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> +void intel_display_skl_init_clock_gating(struct intel_display *display)
>> +{
>> +	/*
>> +	 * WaFbcTurnOffFbcWatermark:skl
>> +	 * Display WA #0562: skl
>> +	 */
>> +	intel_de_rmw(display, DISP_ARB_CTL, 0, DISP_FBC_WM_DIS); }
>
> Not sure about this being moved here but I feel like this belong in
> intel_display_wa.c see that it is a WA

A lot of intel_clock_gating.c is about workarounds, and I don't really
care a whole lot about moving these to intel_display_wa.c at this
point. It's much more important to move the display related things from
i915 core to display.

BR,
Jani.


-- 
Jani Nikula, Intel
