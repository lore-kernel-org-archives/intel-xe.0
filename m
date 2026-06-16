Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DBC2CD98CF
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:26:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D72A510E8C4;
	Tue, 16 Jun 2026 08:26:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1rDkhlz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A887E10E8C4;
 Tue, 16 Jun 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598409; x=1813134409;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=KStbgU0viR/aQuCrDFgSm9fUdI0AG2dWD+egnR5pmIw=;
 b=P1rDkhlzGLhRFULJFPq8Y97u977ieLCuSuNMEHkUq/0T+tSQoL5E1k1C
 /TABFeIUEgNBEUq8dTVyxnPcxpqV1ud8dE506aQCR9C8xCGQiKqna4lmj
 kS1FTIdHukEXtBPfGsNA1Xs/HmQbeextCE4zFWmRJYm8kWESH3EyGMDNf
 6J+WAaRVB80+6N6XG18avAaPaVr1HYs9dvK9CmwIziBO2Kl4hADzwDq9n
 oA3iESAKv2bcyyOGQ5nKz7O8G8s88UE0OoFYwFwTMWQggta8LgDtmy2Nb
 A29Xj0bgNj4oQ2ZMM55vDAmX/tozXzEnp9rVftqwuQDGTLuKIucIrfY42 A==;
X-CSE-ConnectionGUID: JhZjR6gKTDSg4nEaIJb2VQ==
X-CSE-MsgGUID: tSFpFjggTWuzkGMww6EM+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82553499"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82553499"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:48 -0700
X-CSE-ConnectionGUID: awzSjHubT1SgMytXGGZmTg==
X-CSE-MsgGUID: w20U1ZL5SUqBdY2hTV6FBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252834019"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:47 -0700
Date: Tue, 16 Jun 2026 10:26:45 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/i915/cdclk: Introduce bxt_cdclk_cd2x_pipe_mask()
 and use it
In-Reply-To: <20260612173653.7830-6-ville.syrjala@linux.intel.com>
Message-ID: <7357ebd9-5410-5992-6a57-f8cd7079dc11@intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
 <20260612173653.7830-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1775253921-1781597052=:605841"
Content-ID: <06a1ff4c-36eb-9e39-6343-fc09510c2977@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1775253921-1781597052=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <c3efa00d-1630-5dfd-5825-51d50d17a614@intel.com>

On Fri, 12 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Currently bxt_sanitize_cdclk() assumes that
> bxt_cdclk_cd2x_pipe(INVALID_PIPE) gives us the full mask for
> for the relevant bitfield. While that is true, it does make the
> code a bit confusing to read. Introduce bxt_cdclk_cd2x_pipe_mask()
> to make the situation a bit less confusing.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1775253921-1781597052=:605841--
