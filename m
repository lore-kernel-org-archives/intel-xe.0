Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7F7EC1423
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 10:42:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8284A10E77A;
	Tue,  3 Mar 2026 10:42:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d8maX2Z5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D300810E77A;
 Tue,  3 Mar 2026 10:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772534560; x=1804070560;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i4I7herbryEhjxUn8b0ayy5tVKaG+oivmUL49+Q5jPo=;
 b=d8maX2Z54myd3hI4kfUaqDUID9RzyGJyk6yF6+aRK/6fHJKP6vWxXLmo
 AqXYiUF2hXhesehq3/cGCpDVH/0iYmsjCYYQGi76qPPLWDDNYr8OZqlBJ
 nlmozwg5bmL1EMYSVX3sccxq/LkXOMipSGUE6T4sweMCgW57jaHmUPWUv
 Cjn+HwXjTycf6p1xg8sDH65nvCKcpVC8FhzRBhqRY67nX+zJHR0DHZ5C8
 d7l/fLkMtyzVbTN4Sx3MzfJhkb/XAQjt/6iS60AvpWRVd0zmXHPmWS3T/
 Pv/kSl5XKLDlG99EzYAjvQzOWwRTnWXruDhyTowVHXZ5jyj31Ef+KRQ5l Q==;
X-CSE-ConnectionGUID: FowZr88gQO235KAKG1m/FA==
X-CSE-MsgGUID: 1g/RyRmKRDCczle1zkBEAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="77434912"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="77434912"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:42:39 -0800
X-CSE-ConnectionGUID: e03bZsRITvyVSsELPeMbsw==
X-CSE-MsgGUID: URjYr7avT2uhwxmM1AZqcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="217893325"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.21])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 02:42:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [RESEND 0/8] Fixes and updates when using AUX backlight using
 Luminance
In-Reply-To: <20260302040613.3324049-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260302040613.3324049-1-suraj.kandpal@intel.com>
Date: Tue, 03 Mar 2026 12:42:34 +0200
Message-ID: <0ae5957b184a94caf5601faf7f987be6f8e63897@intel.com>
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

On Mon, 02 Mar 2026, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> This series aims to fix/update some code with respect to AUX backlight
> via luminance values for both VESA and INTEL HDR codepaths.
> The below are the major changes made in this series.
> - Do not allow 0 brightness  by default which makes the screen go blank
> leaving user with no way to see the screen and increase brightness.
> - Take into account luminance_set variable when we decide which funcs
> need to be enabled
> - Update debug logs to make them more concise and help debug which
> code path was taken

Seems to me some of the fixes here are regression fixes, but none of
them have Fixes: tags pointing at the commits, which means none of the
fixes will be picked up by the stable team for backports.

I also note that you've eagerly merged most of this series while the
discussion is still ongoing in the other thread. I appreciate not
merging the specific patches, though. In any case, we've usually settled
on only merging full series or none at all, because we only do CI on the
entire series. Which means the CI results here don't match what was
merged.

There's also a regression on the recent commit 40d2f5820951
("drm/i915/backlight: Remove try_vesa_interface") [1]. Whether that's
related to this series, I don't know, because there are no references to
it. But you will have to figure it out.

What I do know is that the DPCD backlight code is fraught with
perils. Basically any change there could lead to a regression, and
generally I would thread very carefully. I appreciate the eagerness, but
now you also get to look after the regressions and bugs, which might
only start flowing in a year from now. It's all yours.


BR,
Jani.


[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7514


-- 
Jani Nikula, Intel
