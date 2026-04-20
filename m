Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43275F588E1
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 15:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F216510E137;
	Mon, 20 Apr 2026 15:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M0pjX5xL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637A710E137
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 15:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776698800; x=1808234800;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KUPRW6OfAAevn/vzzF29h2x1gR1CF3YosHY92mUg8+M=;
 b=M0pjX5xLups8JvXCDNuJtzOsuA+HNvOBZx93s1gU7nLe60pA1P1wCthI
 cdF6r8yZNlnPt+ruV9TNSi3Uxq/235rv6mH3uCuxGczmNkyRNeYlXT7KX
 3Na+XaPKDrd1MGWxLoxztwzQW3gHo9tCnLYKLaFJZjD6V8kL65zFwAcyR
 0e3cHZsNAZ/dJTOWAZhv0Xop/jmOEaWkRQI91L+xjdX8r62aCs1lFBUjb
 iIFSopxMOnQq8/KgD5dWJyE9eYAB4KEHM8+7xue7mVJG4lCRzPv+dvCmW
 9EaufzTylPgqjdAkKQ9SemMrh37ZC7KUKYyCXgFfb2GklQLD8sCeGDvbM w==;
X-CSE-ConnectionGUID: 35Li1UOKQTCby9Xn9gr5DQ==
X-CSE-MsgGUID: Tl8KCY2eR52w5bbzYKxwhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77799717"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="77799717"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 08:26:40 -0700
X-CSE-ConnectionGUID: ItpwJYpWS96egv0m1rrZEQ==
X-CSE-MsgGUID: p6rmIoyUTCWItEVFhIKwfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="255224601"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.102])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 08:26:36 -0700
Date: Mon, 20 Apr 2026 17:26:33 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 intel-xe@lists.freedesktop.org, riana.tauro@intel.com,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, raag.jadav@intel.com,
 ravi.kishore.koppuravuri@intel.com, mallesh.koujalagi@intel.com,
 anoop.c.vijay@intel.com
Subject: Re: [PATCH v1 2/2] drm/xe/xe_ras: Add RAS support for GPU health
 indicator
Message-ID: <aeZFqaIlrddHmlCn@ashyti-mobl2.lan>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan> <aeJI1WrAr33degB-@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeJI1WrAr33degB-@intel.com>
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

Hi Rodrigo,

> > > +static const char * const gpu_health_states[] = { "ok", "warning", "critical" };
> > > +static const char * const gpu_health_fmt[] = {
> > > +	"[%s] %s %s\n",
> > > +	"%s [%s] %s\n",
> > > +	"%s %s [%s]\n",
> > > +};
> > 
> > Please, don't use complex sentences in sysfs outputs. Use a
> > single string/character/value
> 
> I like this one better. So we don't need to have an uAPI entry to define
> the meaning of 0, 1, 2.
> 
> Regarding the sysfs rules, as long as it is one entry per sysfs we should
> be compliant with the rule. So, we should be good here.
> 
> This style is consistent with the style used in /sys/power/ entries for instance:

Well, if it's a sysfs interface, it's a uAPI entry and needs to
be documented (something that I don't see in this series, BTW).

The sysfs interfaces don't really need to be 1, 2, etc, they can
also be strings, as long as userspace applications are able to
easily parse the content and know what to expect from them.

If we need two strings, then we create two files.

If we just need to provide information to system administrators,
then we can either use the debugfs or procfs that don't need to
be considered as uAPI.

Andi

> $ cat /sys/power/mem_sleep
> [s2idle] deep
> 
> $ cat /sys/power/state
> freeze mem disk
