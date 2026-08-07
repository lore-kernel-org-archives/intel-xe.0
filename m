Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26A9C5AC7C
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 12:45:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4802910E412;
	Fri,  7 Aug 2026 12:45:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLV/xDQ5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F5210E412;
 Fri,  7 Aug 2026 12:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786106752; x=1817642752;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lJBJIWfnlJuBrmy0UBwJ59rfYvxzSekY2abk4IjTU/4=;
 b=dLV/xDQ5yDb6D/dHDbLXydSQ2SW04lGuGTtvRdY+HSmyBhDg9yV9q5Dm
 hcgfpq59ZXTEEcSLVT+C8iG0uiSt5XAxfOFWBJY1zHgdcd1emiw5qlmVG
 1nb0t6bUHj5yqD0C4fZKY3jJOZiP5oN47mktu8W8REH7Uj/KJ9LmM/xmu
 JkJGbSIyVPyFFYIpTBb5/VY0v9L/bUQEiUE7bZzkpLynNIAdkya14q+JG
 irjy6+P71mKx84RFiHetBN6aNFqxb0wMvNShzkhOB5fjBFboidZ0b3MLX
 mFbB8jdCNF9Yt8Ktauh57SfA1FUT3N4coo3ve7Zwq82OMZUvnOwOtwOVB A==;
X-CSE-ConnectionGUID: UvXjNdbsScyww/1+stHPFA==
X-CSE-MsgGUID: FiGi4O45S/ScP4bXBkrPVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85683578"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="85683578"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:45:52 -0700
X-CSE-ConnectionGUID: eZDgOUZgSIOAEME3x7UdNA==
X-CSE-MsgGUID: JtUTtpvMRH6WFFyuV9CSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="263019122"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 05:45:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: Re: [PATCH] drm/i915/display: Limit max joined dotclock on pipes
 available
In-Reply-To: <95cc059b-056e-4aa3-8431-1e497002f58d@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260806143738.2710312-1-jani.nikula@intel.com>
 <ca6f4f3b-9c94-4b24-a8e4-7c351e730429@intel.com>
 <788a51d6-4eca-4365-bad1-037d25f388d0@intel.com>
 <95cc059b-056e-4aa3-8431-1e497002f58d@intel.com>
Date: Fri, 07 Aug 2026 15:45:46 +0300
Message-ID: <65d9cdfb093f5e1e048738aaf1b20131f18ed16b@intel.com>
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

On Thu, 06 Aug 2026, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com> wrote:
> On 8/6/2026 9:19 PM, Nautiyal, Ankit K wrote:
>> On 8/6/2026 9:15 PM, Nautiyal, Ankit K wrote:
>>> If fused pipes are AC or BD this will still give us 2. Perhaps should=20
>>> have a check for atleast 2 consecutive pipes from=20
>>> DISPLAY_RUNTIME_INFO(display)->pipe_mask
>>
>>
>> ^I meant :=C2=A0 if fused pipes are B or D, resulting in A,C and B,D=20
>> respectively, as available pipes...
>
>
> Correction (typo'd twice (facepalm)): I meant if the available pipes are=
=20
> non-consecutive, like {A,C} or {B,D}=C2=A0 the count is still 2, but=20
> bigjoiner needs 2 consecutive pipes.
>
> So we should check pipe_mask for a consecutive pair.

Agreed. The more complete approach at [1].

Thanks,
Jani.

[1] https://lore.kernel.org/r/20260806143738.2710312-1-jani.nikula@intel.com


--=20
Jani Nikula, Intel
