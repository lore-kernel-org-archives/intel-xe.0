Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD824E99057
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 08:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADFB10E8F3;
	Fri, 10 Apr 2026 08:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aqmnfO+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E1B10E8F3;
 Fri, 10 Apr 2026 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775810826; x=1807346826;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HrGJ8IU+97Y6b8oMsG9+XwaEltzsxLLq3icsn0cTk0Y=;
 b=aqmnfO+Yvj6XV0IyBomP1wHf8emVp/Vmfp5eliVNZld51u7alL8DSGVi
 OM5GuywB3i2a8iMMZLlGbnNxP3tWDiZ3AsfBlq9GVZCl6p1d1EUJp0zZV
 5fDB6vwPBUNwEdPAGzR9dctemySUarKkLPNrYg6PhJRCPDQjpjj0cl6F/
 BcJwvAAkbqmyxUgB9+ezzq6FQwytH7UmZoZ6HjGaFHisXSlxP16kW75gx
 NafIb+wcIfR7OsMTb5WYeDx+EAJcqsri9ECMX5skJ9H5JFfGmJVfdOubn
 7sbVWVKApZ/DPfIZ9IucX5c6aLACk6sDbT3+qGjlXlNDuyTZrdbWjN2VE w==;
X-CSE-ConnectionGUID: gp3G59lCQciWQa5jr5+0Zg==
X-CSE-MsgGUID: pJOkO2A5SC2Z1BDXMTKq5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76545080"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="76545080"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:46:24 -0700
X-CSE-ConnectionGUID: W2mPAyAQSDaKaSmJtoiyZA==
X-CSE-MsgGUID: P6mL66mFTb+y9RppLU9AcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="228953936"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.110])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:46:21 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Jouni
 =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/i915/reset: Add "display_reset_count" debugfs file
In-Reply-To: <aditNTEpluzhV_IE@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260410073500.32308-1-ville.syrjala@linux.intel.com>
 <20260410073500.32308-5-ville.syrjala@linux.intel.com>
 <b059bb9ef0df9a2ab98ee9e4f900f8e6e3e82e57@intel.com>
 <aditNTEpluzhV_IE@intel.com>
Date: Fri, 10 Apr 2026 11:46:17 +0300
Message-ID: <00b45015161365915ff61d523acb493b1c772261@intel.com>
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

On Fri, 10 Apr 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Apr 10, 2026 at 10:42:23AM +0300, Jani Nikula wrote:
>> On Fri, 10 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> > +void intel_display_reset_debugfs_register(struct intel_display *displ=
ay)
>> > +{
>> > +	debugfs_create_u32("display_reset_count", 0400,
>> > +			   display->drm->debugfs_root,
>> > +			   &display->reset.count);
>>=20
>> I'm wondering about the names of the debugfs files. We've used the i915_
>> prefix so far, but it's obviously misleading nowadays. I've started
>> using intel_ in some places.
>>=20
>> I primarily worry about the potential clash with drm core debugfs files,
>> which leads to failures to create the file, and clash with other
>> drivers, where the files are created all right, but the contents differ
>> driver to driver.
>
> Fair point. I suppose I'll just stick an "intel_" prefix on it.

Ack.

> Another option could be use a subdirectory to separate the driver
> specific stuff from the core stuff, but dunno if we want to start
> down that path. And I guess we'd then need similar subdirectories
> inside the crtc/connector/etc. subdirectories.

All those could have a "struct dentry *driver_debugfs_entry" or similar
for the directory, and drivers would only be allowed to add stuff under
there. I.e. drivers wouldn't create the directory, the core would. That
would be pretty clean.

The problem is it takes a decade to migrate everything, and the time in
between is an unholy mess.

So maybe not?


BR,
Jani.


--=20
Jani Nikula, Intel
