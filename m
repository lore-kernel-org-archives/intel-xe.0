Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47273CA0FED
	for <intel-xe@archiver.kernel.org>; Tue,  9 Sep 2025 13:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8D7A10E734;
	Tue,  9 Sep 2025 13:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JrPF+Lk3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C8310E734
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Sep 2025 13:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757425275; x=1788961275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vNzTBVBnhgW0DKf0wEo9ZEIPCcNZsFwoPI+djrF6s58=;
 b=JrPF+Lk3gIqWs1LL/UT/K0V1u+E+Wb4pwtTD67Opvfa29Lcfip49GvMy
 ih6i8zdUZDfTuUwhw9J5efRoFboZC8imBnhAcvIT3iWvYvMtzdUAvrX2b
 laBgqf9hSeZA9GuJT88S1Vflsj/wfdD76kyENIBZpaTPA0SDgdumr0U8i
 smP5yWBm+FpKaI9cioTkky0JdCnfD+CWhK+uQo/4rlIvcr5EXtqblD0xN
 Ky7J6xqVL2VhWTZLfJl2KYPR1/HR8peWcTdr/koryZBkSjV3uGdiYfXe7
 d/lawCJNT8478PnEi0fshVECM1DDWQ3mlzEEutuuJW051UYM1ceMMoao0 A==;
X-CSE-ConnectionGUID: jqRnJdYfRheOSdsYmO3/dQ==
X-CSE-MsgGUID: j8/6Q7IySl+l4Jz1cC+tbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59634982"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59634982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:41:15 -0700
X-CSE-ConnectionGUID: kKoiwDtdTpyWyMQjCfr++A==
X-CSE-MsgGUID: 6gCeIgW4RBeOhesRmyp5VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="173553658"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 06:41:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH] drm/xe/debugfs: Make residencies definitions const
Date: Tue,  9 Sep 2025 06:40:58 -0700
Message-ID: <175742523891.1518247.5288284238248737335.b4-ty@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250905180225.8434-1-michal.wajdeczko@intel.com>
References: <20250905180225.8434-1-michal.wajdeczko@intel.com>
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


On Fri, 05 Sep 2025 20:02:25 +0200, Michal Wajdeczko wrote:
> No need to keep them non-const. Also fix declaration of .name
> member, as it points to the const string. This translates to:
> 
>   add/remove: 1/0 grow/shrink: 0/2 up/down: 80/-248 (-168)
>   Function                                     old     new   delta
>   residencies                                    -      80     +80
>   dgfx_pcie_link_residencies_show              365     263    -102
>   dgfx_pkg_residencies_show                    454     308    -146
>   Total: Before=2821548, After=2821380, chg -0.01%
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe/debugfs: Make residencies definitions const
      commit: e57ae80fe01a2b039c689b2d14fef51b1ebbd7f8

Best regards,
-- 
Lucas De Marchi

