Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91746CD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8610E8E3;
	Tue, 16 Jun 2026 08:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n10vVfMV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4079610E8E3;
 Tue, 16 Jun 2026 08:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598420; x=1813134420;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=eOw38dv2Hetor3ltlCEI2Zu4vXjQUHSYkNoAvXoD1fQ=;
 b=n10vVfMVWWqyVXVszDKc37Eb0fBAkrJHJ6pb7cs/PDlXtPk9XwUnPMRu
 U0QJOHYOUgN4Y4WKf2Qd2LwcsJk9it9Hw7t/qHs37z0b+wwhrv8U+o3Yu
 fjILu0r0QMGsUdV599NdqPU74IgZCC6GgsrNAHEIPbf+wLgJiNVdw9dvo
 SPcfkky5yeAjoGtU1csHbks8bQdecOpnDg598XS8SM7IHqjVCP1uCZJ9C
 7yG3NFeWP2kc1Y0fsT2mIf83Hc6440BvRcKzUNZ2EBzZLIVJ7J7MAxltz
 dheit1rBApwq6iboUF+csD6WU2I+cpGkyhZSosHmDXmcFgEzUqTFh4ceW w==;
X-CSE-ConnectionGUID: lhvTn85uTjG7cGFx4iyKEA==
X-CSE-MsgGUID: AAMCwA6YS0CsWX4nwjn6cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82553565"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82553565"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:27:00 -0700
X-CSE-ConnectionGUID: ht1CckIySe6IirMlbwG10g==
X-CSE-MsgGUID: JOTEvOOiSby49Hzdd3IVZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="252834050"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:59 -0700
Date: Tue, 16 Jun 2026 10:26:57 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/6] drm/i915/cdclk: Use the TGL+ CD2x pipe select bits
 also on ICL
In-Reply-To: <20260612173653.7830-7-ville.syrjala@linux.intel.com>
Message-ID: <cd373ac6-04aa-3fe0-bb67-a25c906ea5f2@intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
 <20260612173653.7830-7-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1027462808-1781597092=:605841"
Content-ID: <24fd9430-260b-f415-ab01-2bdb5f283384@intel.com>
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

--8323329-1027462808-1781597092=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <79089290-afa6-4954-0637-e5055fd94884@intel.com>

On Fri, 12 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Turns out both CDCLK_CTL pipe select 0b110 (what Bspec lists for
> pipe C on ICL) and 0b100 (what BSpec lists for pipe C on TGL+)
> actually select pipe C on ICL. So we can get rid of the weird
> ICL special case and just use the simpler TGL+ definition of
> the pipe select bits.
>
> This was reverse engineered with a hacked up intel_display_poller.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1027462808-1781597092=:605841--
