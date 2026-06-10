Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F06CD8CB2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 11:42:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2517910E5AE;
	Wed, 10 Jun 2026 11:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bC/aH73x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C455B10E47F;
 Wed, 10 Jun 2026 11:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781091764; x=1812627764;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=XJBj9jZyAaZc4QTyG9X60lFIGGtd8BtMCH8jck9D3ac=;
 b=bC/aH73xloq87UWazulMyjGOa1jVbQjq41xiSzd54n+t5DAa/Fkl8Qew
 nNfa4rygIjzaDOyzSntJVfumlCqVwZLEqFNo0MZy+xDmyT529eErNtBMP
 4Aomo4yurxLSmCszAx9/4Eqg52TC6jBM6nVAMAgKlhxUysg3EwGSwg994
 lEJOIM6Z8dJ51hX8xIg9Bd7L9J8yS/j0xDR/FQmxaeNFkgvWZLM+AHM8k
 9QuNvwDg9SHt6dwvzenTqyQY3kipR/qtnKNch0ccMUyvEs4333oIADzzS
 G+1g5uKuxnjtVnnchYk1wj4wBJ7/T6bw6vfYKSbplFYGMXEO4OgFuSP6d A==;
X-CSE-ConnectionGUID: rGPWiolORY+ABjqU+Ccorw==
X-CSE-MsgGUID: KdTCGyrtRWa+h18pWGfokg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="93369105"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="93369105"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 04:42:43 -0700
X-CSE-ConnectionGUID: OwGuOwyBRAym/zj1uTK6mg==
X-CSE-MsgGUID: Fkm/3at+SIy7oeurejoMrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="251236223"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 04:42:42 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Alexander Kaplan <alexander.kaplan@sms-medipool.de>, Imre Deak
 <imre.deak@intel.com>
Cc: Alexander Kaplan <alexander.kaplan@sms-medipool.de>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 rodrigo.vivi@intel.com, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] drm/i915/tc: Disable outputs instead of modesetting
 them on link reset
In-Reply-To: <20260609184838.4335-1-alexander.kaplan@sms-medipool.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260605212837.4265-1-alexander.kaplan@sms-medipool.de>
 <aia3UtOtXD65T8Eq@ideak-desk.lan>
 <20260608223548.2574-1-alexander.kaplan@sms-medipool.de>
 <aigjtXiFqvxTGUnD@ideak-desk.lan>
 <20260609184838.4335-1-alexander.kaplan@sms-medipool.de>
Date: Wed, 10 Jun 2026 14:42:39 +0300
Message-ID: <b912629b7fc5844a9e9d3262308835ec3745854e@intel.com>
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

On Tue, 09 Jun 2026, Alexander Kaplan <alexander.kaplan@sms-medipool.de> wrote:
> If you have the bandwidth I'd welcome a quick gut check, otherwise
> I'll post them properly once I'm allowlisted:

If you're referring to [1], please just send the patches. We can let the
individual patches through CI.

BR,
Jani.


[1] https://lore.kernel.org/r/178069746256.49942.4174969817609921951@6beec6c84f66


-- 
Jani Nikula, Intel
