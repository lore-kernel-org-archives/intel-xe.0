Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1AAC83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 22:43:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB02010E239;
	Thu, 10 Jul 2025 22:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uyvgj1+r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3410E239
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 22:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752187431; x=1783723431;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5LEG5lrqJaBLyUNKK5t2ySfROVwSJqbCqB/BC2PV1dQ=;
 b=Uyvgj1+rs+jGSprO5AUawh7sh9r66zYYYLNSqdhhQ2w8ToH7HJC8dQtb
 0IAcb8Sclv/b8pR9t+/UDqOZifNkQxSNiebRONPsXUc8fU4rp16a2UylZ
 RHjWNpORTRaF8gjQViq9LwcfOiLmYcsHfp3OXKDt0nxWta8vQQnU8JI2I
 WV8ukfJGGVNY1Ta+ER3DXSBWI6sbaVpRlr5/BOqQjLEOZKmkZcZeFmHw9
 vS7O2dUmlKZ2fbDgUWUO1QKkSDUZf8IvbZ2VKDuBz+aAwZNVp6rRX1Qn6
 ZBmYHxfOrwjkEtfz6mCBxRkZUrdvpflioObyeX1YMYEeFx4eDK3uBTxJ+ A==;
X-CSE-ConnectionGUID: TX/gEj6FS4arwtDeOB41IA==
X-CSE-MsgGUID: n/x0AlUKTySEETonsOkznw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="53700928"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="53700928"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:43:51 -0700
X-CSE-ConnectionGUID: OO6d+nQmQba9NB//4Ke6zg==
X-CSE-MsgGUID: PbNaZnvFQXqkZM7zYGuhdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156557115"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 15:43:51 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
	Matt Atwood <matthew.s.atwood@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, rodrigo.vivi@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v6 0/6] Create and use XE_DEVICE_WA infrastructure
Date: Thu, 10 Jul 2025 15:43:39 -0700
Message-ID: <175218739637.790653.10343087898582539968.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250709221605.172516-1-matthew.s.atwood@intel.com>
References: <20250709221605.172516-1-matthew.s.atwood@intel.com>
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


On Wed, 09 Jul 2025 15:15:59 -0700, Matt Atwood wrote:
> There is currently no way to apply and track workarounds that are needed
> ahead of GT init. This series adds a bit field to the xe_device
> structure similar to those in the GT structures to apply and track
> workarounds applied at runtime (oobs).
> 
> Device workarounds in this new infrastructure are tracked in sysfs in a
> new workarounds file.
> 
> [...]

Applied to drm-xe-next, thanks!

[1/6] drm/xe: prepare xe_gen_wa_oob to be multi-use
      commit: b0a2ee5567ab0d83ff1f7f7542fead46233f0d04
[2/6] drm/xe: add xe_device_wa infrastructure
      commit: f037e0b78e6da6c0f0243b57bb433929a37e6a8f
[3/6] drm/xe: add new type to RTP context
      commit: e7201d98ca196b72901686d47003a4bde3865364
[4/6] drm/xe: Add infrastructure for Device OOB workarounds
      commit: 661a6950e061e3cc976597273180e19126b32e19
[5/6] drm/xe: Move Wa_15015404425 to use the new XE_DEVICE_WA macro
      commit: ac596dee8008885664274efcebf8ca7538fc2ddc
[6/6] drm/xe: extend Wa_15015404425 to apply to PTL
      commit: 77fa16c8f8ee2736f9fe49d5244bec5c35ea3c5b

Best regards,
-- 
Lucas De Marchi

