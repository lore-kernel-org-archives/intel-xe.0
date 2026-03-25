Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B0F109C034
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 15:45:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D5810E7BC;
	Wed, 25 Mar 2026 15:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EDz/07gH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C23610E15F;
 Wed, 25 Mar 2026 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453498; x=1805989498;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=VZSLGJzW9XH1BgGyEJjc+svrbxEZM072OmlPPqHmNEA=;
 b=EDz/07gHi7PSdgQPlRErLYr1yqo0RbB0e44OEuAX+GkJHz5zxm5VySvt
 +5NJOTXEp5f64D+tD+Qqp/7ognto8mL2TuxKOvN8pBk28R0ykuHQdMOVG
 cD45zEd+kQXWZYyhTNNGld+VsfHKvpvJezbwEQDpm0J0WiWqsdEZAwA/e
 /69gnxNSAo0ULK+7iKlX3UNc0kdLZ91wYuEd0GYohrNAxzVI5/rSBMEji
 ekJT51omCc12/o98LJuh146RSaDe+MbE+kiIUeasayZFplKvht2amldAE
 psG+vpNrvDRhEKvvS4HNHfyG5Z6TOYWWzcKgQICQxZrd0tkz44EKhPLKb A==;
X-CSE-ConnectionGUID: TezsleKDSU+kvqU5hmS8HA==
X-CSE-MsgGUID: 6ah0FiliSwWqPy4UE326fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75381872"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75381872"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:44:58 -0700
X-CSE-ConnectionGUID: tjk9WVQER6a4rby5uQKjsQ==
X-CSE-MsgGUID: Ux3GzOihRWK0uJcuQD6SLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="229651731"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:44:57 -0700
Date: Wed, 25 Mar 2026 16:44:55 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/i915: Split the pipe_src dump to its own line
In-Reply-To: <20260325135849.12603-4-ville.syrjala@linux.intel.com>
Message-ID: <086072d1-f979-f2db-391d-4d56822e56db@intel.com>
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
 <20260325135849.12603-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-592578929-1774452030=:294612"
Content-ID: <fdcbbb17-6332-c7a0-e97a-11a8bf945b5d@intel.com>
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

--8323329-592578929-1774452030=:294612
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <52bb0e2c-d02b-30ad-89c6-97c9fae142f7@intel.com>

On Wed, 25 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> The pipe_src dump doesn't really fit in with the rest
> of the guys (pixel_rate, port_clock, min_cdclk) included
> on the same line. Split pipe_src onto its own line,
> next to the related pfit stuff.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-592578929-1774452030=:294612--
