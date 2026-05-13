Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2840CD4F24
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 13:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD8F710EE88;
	Wed, 13 May 2026 13:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nnd1R8TF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 958D410EEAB;
 Wed, 13 May 2026 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778680216; x=1810216216;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=0cWMOH3cBRmJY22XSyVGBt4aRE7ovrIk3k3C8xamZW8=;
 b=Nnd1R8TF+XH1IcM7MbTybqqzS/RhFKbChZA6mK39BlXr4gVo7Qt7YiSQ
 CjVXPrB0KrBPZnTzBYF0cZ9foc53zQvBCF5MzmhcR9ngkZ4NvgUy05Cec
 yTMnhZR67/F7mXSUR7YRWArLonlL7VZwoNZw4dFxMoMMSe2BcQ5xwdj6k
 bsBzrb4B6Y/7aqHR7mwGaQ4OiTibrXNz1F5cg71C9IcyktLnBmwSQM7iW
 fgzj2uFWMKDdffFBr5kzOxp2vgT8RifxuEzHgjCY04M/vsUigWdB7lrRl
 kqFeDyrDN9rIlTJbu1HKXhZwfvWDB/mPXjTG8DLOssgMvNslDNthmyP5S g==;
X-CSE-ConnectionGUID: EgqEz0pfRGGdf3p97NSDvw==
X-CSE-MsgGUID: uYmO6f+kQk2jMWD3wUVT2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="78635159"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="78635159"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:50:16 -0700
X-CSE-ConnectionGUID: W5aOwUh/RU2xFlm3KMfU7g==
X-CSE-MsgGUID: Uz66MMtwQAyGw+1Z5TKNEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="237109554"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.124])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:50:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 =?utf-8?Q?Micha=C5=82?= Grzelak <michal.grzelak@intel.com>
Subject: Re: [RESEND 0/4] drm/i915/display: start switching to display
 specific reg types
In-Reply-To: <agRvJsmqqi1q0MnL@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1777972548.git.jani.nikula@intel.com>
 <0fb8d06a63af7f22dea6d08d69d94350c97a1e83@intel.com>
 <agRvJsmqqi1q0MnL@intel.com>
Date: Wed, 13 May 2026 16:50:11 +0300
Message-ID: <558ac9d46f77130a5a70cd16c6e7af65717682a1@intel.com>
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

On Wed, 13 May 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, May 08, 2026 at 02:29:50PM +0300, Jani Nikula wrote:
>> On Tue, 05 May 2026, Jani Nikula <jani.nikula@intel.com> wrote:
>> > Jani Nikula (4):
>> >   drm/i915/display: add typedef for intel_reg_t and use it
>> >   drm/i915/display: add struct intel_irq_regs and use it
>> >   drm/i915/display: add struct intel_error_regs and use it
>> >   drm/i915/display: define and use intel_reg_{offset,equal,valid}()
>> >     helpers
>>=20
>> Ville, ack on this one?
>
> Looks fine by me
>
> For the series
> Acked-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks for the review and ack, pushed to drm-intel-next.

BR,
Jani.


--=20
Jani Nikula, Intel
