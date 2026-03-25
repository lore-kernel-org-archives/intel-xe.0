Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD6E109C02F
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 15:40:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28F810E15F;
	Wed, 25 Mar 2026 15:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2Ly43je";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85E6F10E15F;
 Wed, 25 Mar 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774453207; x=1805989207;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=KpWRqnfn2KKx9CCG0GyuvAV6EokwwGAW4V17iSMngq0=;
 b=j2Ly43jeqaj8I0h7clKDFjTKHbqGymqMF2898XsusXDtpxAUoHuOLB4E
 4uFHupup4VZ9wubkqu1B3ydIEKBw4EzSWs2Jgyl9ryWvvG0AARVUvLFF+
 Bsr+sK3OlBWjzGwKX6P401qSksVoO3jdQSJ/70cfVLH1LLCK0rLURvnvz
 Z3V6YGco3O4m38Kr13M6uBQ0vxTFNkvlMfrB9ykv8uczhKykSdxoV/JyY
 WO0WBlurvsoRAPqnhqK5lRLXHUq+1Ht0TA/kMalwVXi9wwGlprTL4arTo
 4xKX/utDgJ5h9dDZ213kz4CV0sV5fekGt+u7G4zP9AZ3kUO8UJcwq295e g==;
X-CSE-ConnectionGUID: /hD5fPUYTfi57aGK9vn8gA==
X-CSE-MsgGUID: uNDRiALJTByhhri0Ds3vrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75381499"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="75381499"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:40:07 -0700
X-CSE-ConnectionGUID: ze0fWeg7TUSYluyZtWDJjQ==
X-CSE-MsgGUID: a2wsMCdFS7SElKPQHnVZ8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; d="scan'208";a="262634792"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 08:40:05 -0700
Date: Wed, 25 Mar 2026 16:40:02 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 stable@vger.kernel.org, Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH 1/6] drm/i915/cdclk: Do the full CDCLK dance for
 min_voltage_level changes
In-Reply-To: <20260325135849.12603-2-ville.syrjala@linux.intel.com>
Message-ID: <4790e7bb-c9b3-001b-9f1d-c9990721e2c0@intel.com>
References: <20260325135849.12603-1-ville.syrjala@linux.intel.com>
 <20260325135849.12603-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1013487388-1774451849=:294612"
Content-ID: <2951095b-2979-b733-5139-967941db4e64@intel.com>
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

--8323329-1013487388-1774451849=:294612
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <e61e61d2-5f39-3c08-b676-e546fa696723@intel.com>

On Wed, 25 Mar 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Apparently I forgot about the pipe min_voltage_level when I
> decoupled the CDCLK calculations from modesets. Even if the
> CDCLK frequency doesn't need changing we may still need to
> bump the voltage level to accommodate an increase in the
> port clock frequency.
>
> Currently, even if there is a full modeset, we won't notice the
> need to go through the full CDCLK calculations/programming,
> unless the set of enabled/active pipes changes, or the
> pipe/dbuf min CDCLK changes.
>
> Duplicate the same logic we use the pipe's min CDCLK frequency
> to also deal with its min voltage level.
>
> Note that the 'allow_voltage_level_decrease' stuff isn't
> really useful here since the min voltage level can only
> change during a full modeset. But I think sticking to the
> same approach in the three similar parts (pipe min cdclk,
> pipe min voltage level, dbuf min cdclk) is a good idea.
>
> Cc: stable@vger.kernel.org
> Tested-by: Mikhail Rudenko <mike.rudenko@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15826
> Fixes: ba91b9eecb47 ("drm/i915/cdclk: Decouple cdclk from state->modeset")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1013487388-1774451849=:294612--
