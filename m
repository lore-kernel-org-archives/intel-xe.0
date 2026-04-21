Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89322F8FA71
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 12:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4978310EC73;
	Tue, 21 Apr 2026 12:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dg5FBLZR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E28910EC73
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 12:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776776216; x=1808312216;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=hlCyDr0otqdFmzPW5gPmA4zKqRPO5ejLaQXbdyWyL4A=;
 b=Dg5FBLZR7+VxupDKcJ/mgs89bGnng+0cSHkrXBX+LOeLH99Cp42T845/
 7roXo1FlL7jK2Y+BewpsybM+Ok64SowHUIeAuMHjSJdye4N59+0Uhk35t
 IDcny3rFWFinRTFfpgp9JWKawJteWgkF8T5nqDSNw7ARUjHMhMOj7bMpW
 /Q9xaErF2LXhmhHeaHybKYu8iiUY1wXX08WUe2hFoKVL/Le5/XgTNdMz1
 1WSrjxRs9r/pJWTvHn6jDIZV00f6YtjjneNyC1T/278TXxM29ihCs5tWE
 eUoLz1eI1IKWV2JJYhZsHZGFA7rTj2/0kghVxRqmXHe64EIpdOjaK3KWc Q==;
X-CSE-ConnectionGUID: UzH1FcK/RaKNAl2JzQlN3g==
X-CSE-MsgGUID: D95gsl5YTQeBAZpmeKTnzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="80294202"
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="80294202"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:56:56 -0700
X-CSE-ConnectionGUID: 2ERk2IgbRmS1V8KrA6Fl/A==
X-CSE-MsgGUID: RGBX4ykvT0eAQ8VI9yd0FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,191,1770624000"; d="scan'208";a="255292565"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.116])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2026 05:56:52 -0700
Date: Tue, 21 Apr 2026 14:56:48 +0200
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
Message-ID: <aed0EPEZ8oQLzPNc@ashyti-mobl2.lan>
References: <20260416093610.4085667-1-soham.purkait@intel.com>
 <20260416093610.4085667-3-soham.purkait@intel.com>
 <aeDN6g6HWd3v-V72@ashyti-mobl2.lan> <aeJI1WrAr33degB-@intel.com>
 <aeZFqaIlrddHmlCn@ashyti-mobl2.lan> <aeaD3n25U8LqGTM8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeaD3n25U8LqGTM8@intel.com>
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

> > 
> > If we need two strings, then we create two files.
> 
> This part I don't agree. This is just the same as the power cases
> which I already had pointed out.
> 
> But right, you do have a point here. Different from power, we don't
> necessarily need to expose all the supported modes + the current one.
> After all, these states won't be that different from state to state.
> 
> We just need to document it properly and then just print:
> either
> 
> ok
> instead of
> [ok] warning critical
> 
> or
> warning
> instead of
> ok [warning] critical
> 
> or critical
> instead of
> ok warning [critical]
> 
> The full string with all the supported modes do sound bloated for
> this case. Considering that the supported cases themselves shouldn't
> change much and that we keep that documented. My bad, I'm sorry for
> the confusion here.

Think of what a miserable life have userspace developers when
parsing power files. They need to parse for the '[', for the ']'
the number of words, etc. We have here an excellent example of
how *not* to do things. :-)

> > If we just need to provide information to system administrators,
> > then we can either use the debugfs or procfs that don't need to
> > be considered as uAPI.
> 
> That is not true. In many data center deployments the 'debugfs'
> is not available and the admin and cluster tools still need this
> information. It needs to be stable API.

Bingo! :-)

Then you need to define an easily parsable, well documented api,
so that it's accessable to everyone, applications and sysadmins.

Overall, I don't think this is a matter of taste, but, anyway,
you are the maintainer and yours is the last word. To me, this
looks incorrect.

Thanks,
Andi
