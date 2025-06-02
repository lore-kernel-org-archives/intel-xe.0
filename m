Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B52C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 21:38:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D6E810E039;
	Mon,  2 Jun 2025 21:38:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NbkDtl7a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9827810E039
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 21:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748900329; x=1780436329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Uxxa4GCceYoGsbCroWs14wyqkfjIOsDc+OhoxVWU1PM=;
 b=NbkDtl7a1n8pT/HcddQoVh+WQB/0LJ7oUHX7M1mz/59UUubnYJuI5UHn
 TeJjoO8UWPAlmKydLy+rGWIjWu4c6fobO4ufdZ7ANctckollKOfNk1Rg/
 apH5f4XEDV36VqgHdnUwK/Xw7kb+XSUZ93jMeIAv5ILZ2asUIOHW1UtsA
 TUSVFytNJy1r/eeHaaLX3cxsPeapJHA3IWAYZAx7RNXBQef+UiKZSi+l9
 TZckzEI38gTJzSlmvfmuJ5dPWb2ecEIQGR6jsB7RImjszVtcqfYuY9Hco
 DZSdDynyhAVFS3shS5ZjBAuwwndmoZhtQcmYpWY0yP2AzQ8xATxM6hlv1 Q==;
X-CSE-ConnectionGUID: bK7eyS4iSwiUTrXbqr46IQ==
X-CSE-MsgGUID: o7Zpa78hSzuVptpL+yv0Ag==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50161858"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="50161858"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:38:48 -0700
X-CSE-ConnectionGUID: S1XiilZwRZ6QqiQY4yekYQ==
X-CSE-MsgGUID: ZpK6QfIaTUG9nk2hQvZ/qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; d="scan'208";a="167818597"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 14:38:48 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 0/5] drm/xe: Add configfs to load with fewer engines
Date: Mon,  2 Jun 2025 14:38:39 -0700
Message-ID: <174890027883.3134393.17101305291553565380.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Wed, 28 May 2025 14:54:03 -0700, Lucas De Marchi wrote:
> 


Thanks for the reviews. Applied to drm-xe-next.

[1/5] drm/xe/configfs: Drop trailing semicolons
      commit: d8636cce7a1c81b67ee1fcfd03fe8397e0101a32
[2/5] drm/xe: Convert "fused off" messages to be gt-based
      commit: 2b0ef1f7a2980bf0c5589ff42806eee2d55ea8e6
[3/5] drm/xe: Allow to disable engines
      commit: 58b51df807d7394a09ddb95b47099d59465e3777
[4/5] drm/xe/configfs: Add attribute to disable engines
      commit: d09bc3edfe5c702463e2640314b7db2219242446
[5/5] drm/xe/configfs: Add internal API to documentation
      commit: 399c5f54090c1c7d8f9eae7897940e8a11604884

Best regards,
-- 
Lucas De Marchi

