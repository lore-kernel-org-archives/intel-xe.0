Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A66D3B7F5
	for <intel-xe@archiver.kernel.org>; Mon, 25 Nov 2024 09:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBB810E3A6;
	Mon, 25 Nov 2024 09:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMQVkvAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6895210E3A6
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Nov 2024 09:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732525781; x=1764061781;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BKXQbFmTDHTBi6jQel2OIlyreuMCW9poB185Ebs9rnY=;
 b=IMQVkvAmW4+qtyVXAbQADJQXZrmMIbhBmCtOrSBiTa9IXpx/5QAFNptm
 ufGzzQIjjPZrfBIQwlLpV/8GItGB/9x/BHzB6aC0n3WnvV2IEJsWNuWAR
 W/sGM2uvO9ys7t/i14Z5cvoh+XXq/x/yFoYIbUX5SJ6OmXuVOyi5txlhv
 etQn2sp4DA+JF8ah6SOZCxN+a2l7RG/IN6nOKOR170b8sWpWvImYbaN3z
 hqR94lfnNZ80itw+fiYgUyDM35S1tUmbdgjSsU3GUD//Nbs+KuXpshPnb
 6+DneT66qftSif7MFGZ4vLFxpXoz+K4j6fht+15cPnYAPvloBdbsdbzly g==;
X-CSE-ConnectionGUID: 6ra7WWapSsuzPMHzvbxYFw==
X-CSE-MsgGUID: KlpUmMsSSDi3tGuqE5DrOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="58028174"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="58028174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:09:37 -0800
X-CSE-ConnectionGUID: tE93vq8kRG6dSftmXD7ySg==
X-CSE-MsgGUID: dK0KypenRMuE3XotLAnu9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="114476112"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.243])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:09:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, Jordan Justen
 <jordan.l.justen@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/xe/ptl: Add another PTL PCI ID
In-Reply-To: <20241122230404.GH4891@mdroper-desk1.amr.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241114234410.145863-1-matthew.s.atwood@intel.com>
 <173200808386.5661.16726110968459346849@jljusten-skl>
 <20241122230404.GH4891@mdroper-desk1.amr.corp.intel.com>
Date: Mon, 25 Nov 2024 11:09:31 +0200
Message-ID: <87zflny910.fsf@intel.com>
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

On Fri, 22 Nov 2024, Matt Roper <matthew.d.roper@intel.com> wrote:
> Applied to drm-xe-next (and the referenced GuC patch has also already
> landed earlier today).
>
> Since drm-xe-next hasn't had a backmerge yet to pick up the conversion
> of xe_pciids.h -> pciids.h I had to 'dim cat-to-fixup' to get the change
> to stick around in pciids.h when drm-tip gets re-generated.  Although
> the old xe_pciids.h header also seems to be coming back now and I
> couldn't get the fixup patch to delete it properly.  Presumably that
> will clear itself up whenever a backmerge happens, but +Cc Lucas FYI.

In general, please talk to the maintainers *before* doing stuff like
this, not after.

BR,
Jani.


-- 
Jani Nikula, Intel
