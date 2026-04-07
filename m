Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F7CCF3D5E1
	for <intel-xe@archiver.kernel.org>; Tue,  7 Apr 2026 11:03:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C495410E3D8;
	Tue,  7 Apr 2026 11:03:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I696drKv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CD410E3D8;
 Tue,  7 Apr 2026 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775559809; x=1807095809;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=STBtpTM58f/d7SFK7qwDcsvb6BNCeEoK+N9hBw7h+ys=;
 b=I696drKvzmQskGRWaqWmg7U3tJV/b+XaU/3Bad2aHFz8CTDulVqb9rp0
 CfPwd2fwh+KJcDEBEegSr21nYu8g6SpiW0RhDW8yrAlwQWWXygd7itoVH
 DMce5IHKcqyluOamjl0xmiE7asYyFonKdBDCbC9N6yF3uG+XrBjo6glzn
 kN1BfT5wjl8h3iuL0eyMw9V4fD8mRbTV1Pwbtz7QwRK7dXn3gtJDA1BmA
 lQ8UJgg97fd0DZWYuePprae9q/4KUB95/OzqWCZmoGnlPplitEmHtRXIy
 FSOQQShxPqfSn+oTvADjK/bJ+wZUpzxM5oG6tpUs7gYyi9lO1zf53sPyZ g==;
X-CSE-ConnectionGUID: MG9xtX5UTO+K7q5HXowaaw==
X-CSE-MsgGUID: A2qabnZvTbKCBIIe/nFOIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76531908"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="76531908"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:03:29 -0700
X-CSE-ConnectionGUID: 56zJhXMoR16/oBoU9KKY0A==
X-CSE-MsgGUID: J5XJ++ELSuSxzZBROb2h7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; d="scan'208";a="232541072"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.244])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2026 04:03:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Animesh Manna <animesh.manna@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 uma.shankar@intel.com, dibin.moolakadan.subrahmanian@intel.com
Subject: Re: [PATCH v3 03/12] drm/i915/cmtg: set timings for CMTG
In-Reply-To: <adTVoIgNc0K3_Zok@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260313153300.3530695-1-animesh.manna@intel.com>
 <20260313153300.3530695-4-animesh.manna@intel.com>
 <2fd3f2334a8a85590a74c0636b941f31ddf9aba3@intel.com>
 <adTVoIgNc0K3_Zok@intel.com>
Date: Tue, 07 Apr 2026 14:03:23 +0300
Message-ID: <d048866d707e0f02a811c2bc8ba866cda2a16b38@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 07 Apr 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Apr 07, 2026 at 11:03:37AM +0300, Jani Nikula wrote:
>> On Fri, 13 Mar 2026, Animesh Manna <animesh.manna@intel.com> wrote:
>> > +#define TRANS_HTOTAL_CMTG(trans)	_MMIO(0x6F000 + (trans) * 0x100)
>> > +#define TRANS_HBLANK_CMTG(trans)	_MMIO(0x6F004 + (trans) * 0x100)
>> > +#define TRANS_HSYNC_CMTG(trans)		_MMIO(0x6F008 + (trans) * 0x100)
>> > +#define TRANS_VTOTAL_CMTG(trans)	_MMIO(0x6F00C + (trans) * 0x100)
>> > +#define TRANS_VBLANK_CMTG(trans)	_MMIO(0x6F010 + (trans) * 0x100)
>> > +#define TRANS_VSYNC_CMTG(trans)		_MMIO(0x6F014 + (trans) * 0x100)
>> > +
>> > +#define TRANS_SET_CTX_LATENCY_CMTG(trans)	_MMIO(0x6F07C + (trans) * 0=
x100)
>
> These are all just normal transcoder registers, so no new definitions
> should be necessary at all.

Right, so the question becomes why are their writes duplicated, and
what's with the whole "Timing registers are separate for CMTG" part in
the commit message???

BR,
Jani.

>
>>=20
>> We have a bunch of helpers to avoid doing the manual multiplication
>> here.
>>=20
>> BR,
>> Jani.
>>=20
>>=20
>> --=20
>> Jani Nikula, Intel

--=20
Jani Nikula, Intel
