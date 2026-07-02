Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8931C43602
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jul 2026 17:26:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B5510F525;
	Thu,  2 Jul 2026 17:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IUskiXYa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8621B10F521;
 Thu,  2 Jul 2026 17:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783013182; x=1814549182;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=qFsv+54thpe+cg1+KriTBQAGXiAeUO5DM1v51Xqs+XQ=;
 b=IUskiXYaYLRouQUiclDeeo9GLGKsnu3elWJBYMaRWCwmkCAeyXn9FcOl
 9g4GIH/rfhYWyKjfpSWHEWCWPJYZ6n6+arcg3b0sH8PYkB80uPjBAIeqh
 SF+1wBgG4s7hFEK4fN4JB3SGM4LMcubj8zZR9iVHHIuS3umxxiLTgE9Jd
 7L1KBPZ1sSTHyTh0v22yN2BdrDPXJcoVryOcy+cpgj9mdxtHEB43Vl48i
 +YHdhMxud6QubF6uEk6+QCepESglnJX4pwZBbAHec052WW4bhgWatC/TS
 PCDIFU0xZyu34eSM+J+p7zN9kwVuZKTY03VoBAX6BNmB1W+sCsz13vZ6O A==;
X-CSE-ConnectionGUID: 3lKhoD6WTkWXoM0yGq0JFg==
X-CSE-MsgGUID: TXBC/DLbQh2uhfRgpUezRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83964737"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="83964737"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 10:26:22 -0700
X-CSE-ConnectionGUID: sVt2u4UYRe+LmPgoPr3hTg==
X-CSE-MsgGUID: 4LtGRbsSQEGWMubdhVaaqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="251849657"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.54])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 10:26:20 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>
Subject: RE: [PATCH RESEND v2] drm/i915/display: Program TRANS_VTOTAL from
 mode vtotal
In-Reply-To: <IA1PR11MB6348D8D9F53ECCFD47321C83B2F52@IA1PR11MB6348.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260617045850.862100-1-mitulkumar.ajitkumar.golani@intel.com>
 <0b7919083586f3ba26159f909f87666ea9b41045@intel.com>
 <IA1PR11MB6348D8D9F53ECCFD47321C83B2F52@IA1PR11MB6348.namprd11.prod.outlook.com>
Date: Thu, 02 Jul 2026 20:26:15 +0300
Message-ID: <35eef66587306a256764b9d4a5e5316a73893099@intel.com>
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

On Thu, 02 Jul 2026, "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com> wrote:
> No. This change was made to align the driver with the updated VTOTAL
> programming requirements rather than to fix a regression introduced by
> a specific upstream commit.
>
> The regression we've recently observed during the GOP-to-driver
> handoff appears to be a separate issue introduced by this change and
> will need to be addressed with a follow-up fix.

Okay, thanks, sorry for the noise. :)

BR,
Jani.

-- 
Jani Nikula, Intel
