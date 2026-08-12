Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8052CC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 09:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 320F910EEF6;
	Wed, 12 Aug 2026 09:03:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZhNa4Pja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E698210EEF6;
 Wed, 12 Aug 2026 09:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786525392; x=1818061392;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=MQWxf2v94ZAkdlW6RzI2FwW3Zq28GQJQKHknAu0Bzws=;
 b=ZhNa4PjaYeuM59NB01F/EJKqMzqOuivwUnfY+dNMhOdIkUsdE1LNVoZ0
 1ppNvwvowF6mw8ybRcuUO6pFVhhCIYXPgwUN/YhmBByFkjeMUyawe2836
 jgpLvf8y2Fk/mzmw93wuSrPHHRbx2mRhTybdeKPbTtdCo8J7fXHS9ws78
 NI5aNrCtUR9Iz0HmDGJg913BT2CxMj+8BgQFMcJ+l4saiRJoa/gPt13f8
 9Y8gTVEV4U78T6kIqQLfrJnYTv/Dtx2on+LJv4s2Q/S1OQYM5TxB8/jt3
 H+H2Isf22akW8kaDoaYQ2WESmLjJf0DgdNAJoZRTJLhHW2RMLA2JXjzVo Q==;
X-CSE-ConnectionGUID: Emw1sjNCTAOXc0FQ0uIQbw==
X-CSE-MsgGUID: aPc2DTUBRn6DmVJKkOj7Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="104603272"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="104603272"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:03:11 -0700
X-CSE-ConnectionGUID: 1hTRIMKiQ8qdpyZn9bV6Gw==
X-CSE-MsgGUID: hKjJKIeyS9aZ5YIpvZVcvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; d="scan'208";a="260271471"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.141])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2026 02:03:10 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
 clock frequency
In-Reply-To: <DS4PPFE901A304FE6C52090B8408482686DE3DC2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260811175844.2613721-1-suraj.kandpal@intel.com>
 <20260811175844.2613721-3-suraj.kandpal@intel.com>
 <d760d5c7-6e2e-45c3-b38e-108571d94cf1@intel.com>
 <DS4PPFE901A304FE6C52090B8408482686DE3DC2@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Wed, 12 Aug 2026 12:03:07 +0300
Message-ID: <2c220c302172f25fcc8e526d2bde0699693c3e62@intel.com>
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

On Wed, 12 Aug 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: Re: [PATCH v2 2/3] drm/i915/cx0: program DDI_CLK_VALFREQ with DDI
>> clock frequency
>> 
>> 
>> On 8/11/2026 11:28 PM, Suraj Kandpal wrote:
>> > DDI_CLK_VALFREQ is programmed with the port clock, which for DP is the
>> > symbol clock computed assuming 8b/10b encoding (link_rate / 10). For
>> > DP 128b/132b (UHBR) rates and for HDMI FRL the port clock needs to be
>> > modfied.
>> > On silicon DDI_CLK_VALFREQ is a scratch register with no functional
>> > impact, so the bug is not observed.
>> > Use intel_ddi_link_symbol_clock() to write the correct DDI clock in
>> > kHz.
>> 
>> Perhaps can be re-phrased as :
>> 
>> DDI_CLK_VALFREQ does not configure hardware, it only records the frequency
>> software intends to set, so there is no functional impact.
>> 
>> Patch LGTM.
>> 
>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>
> Thanks for the review
>
> Pushed to din with above mentioned changes in commit message

Process nitpick #1. This series was pushed before there were xe CI
results AFAICS.

I understand the series is the same as v1, with just the commit message
changed. But that's process nitpick #2. Please don't send a v2 to just
change the commit message, on the same day, with no other review
comments in yet. Wait out for the review comments, and if the only thing
that needs changing in the end is the commit message, you don't have to
resend anything at all. Just fix the commit message and push. Ask in the
review thread if you're unsure about the wording.

In this case, going slower would've gone faster, and saved a full v2 CI
round on dozens of machines, just for a commit message wording change.

BR,
Jani.


-- 
Jani Nikula, Intel
