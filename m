Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CFECCD19F
	for <intel-xe@archiver.kernel.org>; Tue, 21 Oct 2025 00:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833A810E108;
	Tue, 21 Oct 2025 00:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFWCY/JO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E21110E108
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Oct 2025 00:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761007484; x=1792543484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JiKkAWaY58bu9rlHTSvOLwDTrtjCw6gHYvZWlScLzPM=;
 b=hFWCY/JOq04SQ4NVtQkp1swgAWwfqzvQQlMXZBY9CdIQVSrlp+HD3U6u
 X/XAk7yeuK11Q45ShS6GqdrUQZqPk3ZTWs5ffhhwsKSO0k56x1KzK2D7V
 EfrSqXCTV/Yn6DptQc97JOK4HHSoGa/ZA3dMObrk41G7iVllm1SnSP3Pk
 lUdGg/PC3jge6AXKr3phS6/8d1NIdb++Y75kpAanSkSQQNZ4N4Qi/l3gE
 oeD6TT1KxAgPe6pW7XhSjdrN6nRCRS+/6EFbfiZ+MBN4oREY+tcB3tM/6
 Up7JB3RDU2MJrDugkalajLzbOJ1PGf0/aDOx2FB+O/y5uL8chyW+kQ3H1 Q==;
X-CSE-ConnectionGUID: Yqaxukh+QWSr6Vi7j/jwkw==
X-CSE-MsgGUID: RwfrnAk0QwudNryD725oPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63226965"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="63226965"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:44:43 -0700
X-CSE-ConnectionGUID: EF2tD95QT/qBdEwX/wQOSg==
X-CSE-MsgGUID: 4qj5g/6mSsuvBv8PlEQgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="214081605"
Received: from lucas-s2600cw.jf.intel.com ([10.54.55.69])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 17:44:43 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 Brian Welty <brian.welty@intel.com>
Subject: Re: [PATCH 0/2] drm/xe/xe3p: Use main gamctrl if available
Date: Mon, 20 Oct 2025 17:44:13 -0700
Message-ID: <176100742456.819267.13999952625140059377.b4-ty@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
References: <20251019-xe3p-gamctrl-v1-0-ad66d3c1908f@intel.com>
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

On Sun, 19 Oct 2025 19:05:45 -0700, Lucas De Marchi wrote:
> These patches got dropped after v1 of the xe3p addition[1] while
> it needed to be clarified with HW / spec. Now that is done, we can bring
> these patches back.
> 
> [1] https://patchwork.freedesktop.org/patch/680596/?series=155866&rev=1#comment_1249896
> 
> 
> [...]

Merged to drm-xe-next, thanks!

[1/2] drm/xe/xe3p_lpm: Configure MAIN_GAMCTRL_QUEUE_SELECT
      commit: 94edd6518613072c1bdc1ee69b63373d91cfca62
[2/2] drm/xe/xe3p_lpm: Add special check in Media GT for Main GAMCTRL
      commit: e681ddca301931dbea99fcb4bc5a5dacdb7fad06

--
Lucas De Marchi

