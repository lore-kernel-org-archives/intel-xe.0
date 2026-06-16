Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2600CD98DA
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jun 2026 08:26:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B53B310E8C4;
	Tue, 16 Jun 2026 08:26:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8MdLATz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58B10E8C4;
 Tue, 16 Jun 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781598385; x=1813134385;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=szidL+T2+FowAbleVeLIV0nyuMRY98XjVlnxlg2o0Bg=;
 b=Z8MdLATzNWnh7slAR7t4fcDqHCJnAR3sk1RBGuzvd/R2fbIPqpT5nygC
 gvHo1xVNdCivp+nDMfWHEKK9QtLLnQYnPmlRfcxM1Rnsff6sy05lC5tq/
 kX0m7GDdvnL8Ogv6avJFriF4zEahFbqgudsNA/8D7yODtYPpZeH6WMz4G
 r5swfjWIM9hm5BBeW0/mVjT+G9dbFFagMEvRTKRZyaAc5Aa+ptAR84UnW
 4g8BWoloJmQuZuXXypr+06sRTCNE6/b2plHeNJsoKImNgN9QA46aoHudt
 oIXAkmB7xnDcG7U0tLHgtwRhG/QNh6wwZnuBNXPWq0Al4xFzqqboMQT6I A==;
X-CSE-ConnectionGUID: nOmwAVmaSF+tyv7UI4fvhQ==
X-CSE-MsgGUID: 1BG2HGcMR5yqV3faNH5kdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82460994"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="82460994"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:25 -0700
X-CSE-ConnectionGUID: c1xZrraPReuAE8Vd5UZpNA==
X-CSE-MsgGUID: NzPk3/UBRA2JtDpG/KIS0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="246816123"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:26:24 -0700
Date: Tue, 16 Jun 2026 10:26:22 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/6] drm/i915/cdclk Clean up CDCLK_CTL defines
In-Reply-To: <20260612173653.7830-4-ville.syrjala@linux.intel.com>
Message-ID: <91f3c9ed-8337-9275-bebc-0dc56de25df0@intel.com>
References: <20260612173653.7830-1-ville.syrjala@linux.intel.com>
 <20260612173653.7830-4-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1179268910-1781598232=:605841"
Content-ID: <8d4bae5b-2cec-eabb-6373-5f3172abbda8@intel.com>
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

--8323329-1179268910-1781598232=:605841
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <06fefe69-da27-b9be-0c6f-8b53bf2e694c@intel.com>

nit: missing ':' in the title.

On Fri, 12 Jun 2026, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Use the modern REG_BIT/REG_GENMASK stuff to define the
> CDCLK_CTL bits.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Micha³ Grzelak <michal.grzelak@intel.com>

BR,
Micha³
--8323329-1179268910-1781598232=:605841--
