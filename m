Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC4BC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463DE112919;
	Mon, 29 Apr 2024 15:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NiiWn7Da";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC95112919
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714402799; x=1745938799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=23z7ENzYv2JraeU1Q6WlsA8VXUbqHBSz+KzTn43USSY=;
 b=NiiWn7DagfpUPbabs6Yb7vYcM5TQhs8qTMXGAE3pg8+mHkEyDJwJ5rHk
 BK1tyBwxsBN/jo2EMhL9djLNmOXG25p5CNWVA4tCv6N0qKMMDAb+x2BvE
 6uiIgXx0G06UcBwFuWKO2W1+cTAlD2yZu+OqYL0Yyg/5iRUqo7PthwuT0
 wKTDn9dlHTvu4ISGGGEd08w33l72Qu3jPdzjWZlWSc5jaznHPcRuKNm5x
 OXehRR5M/EGhXr5m7lIsiQMwpA8p1MEvJ3pXzM1C93Gq2p9uQqrCsA5j5
 LOHQixc3bOC06Rv0oHd7gfhrqFsVZbGxkDNI9p8rG0yYLIlqa4ieFQXUN w==;
X-CSE-ConnectionGUID: SpTaMXEmRS2cRTROz2z8cA==
X-CSE-MsgGUID: 882iRm2kSvW7Jd9Az4Us6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="13847556"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="13847556"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 07:59:56 -0700
X-CSE-ConnectionGUID: xK40g1hSRIyAaZXq2aQQVw==
X-CSE-MsgGUID: XJL7ooHSTh6IY6lh1xs4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="63614719"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 07:59:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org, Shekhar Chauhan <shekhar.chauhan@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	gustavo.sousa@intel.com
Subject: Re: [PATCH] drm/xe/xe2hpg: Add Wa_14021490052
Date: Mon, 29 Apr 2024 08:00:50 -0700
Message-ID: <171440196125.3530154.473502393133351531.b4-ty@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240424034247.1352755-1-shekhar.chauhan@intel.com>
References: <20240424034247.1352755-1-shekhar.chauhan@intel.com>
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


On Wed, 24 Apr 2024 09:12:47 +0530, Shekhar Chauhan wrote:
> Add Wa_14021490052 for Xe2HPG 20.01.
> 
> 

Applied to drm-xe-next, thanks!

[1/1] drm/xe/xe2hpg: Add Wa_14021490052
      commit: bb442bfb9b3d1bc6ebd9fc64fa566e12d64627ce

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
