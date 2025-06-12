Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0109BC61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 23:02:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DE510E058;
	Thu, 12 Jun 2025 23:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVT0YHOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F8B10E058
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Jun 2025 23:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749769339; x=1781305339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9bXotoJ7r/nWdmWsog0UFxDsx4Cv1O3I0LO1SAdWcek=;
 b=ZVT0YHOCIj0MeNAvvjJGwjAKwm4KIsuK9bCQAfXbL2R86Tf1SYEWCaEV
 h+16EV0qb+5vB8LSHKGRurhjdYc6QolVTOezXhXK5OKd0xfvKH4o9uAKP
 EUmQ6O+jA39KRya/qEk+48mNn0HcYBFEraqOn/aFw8jU2ZSA/rr1yGJrv
 52uG4fdUmcJ6VCoMCwHg1U9ylPWkq5rmym26pk15V6OxP9TAboYuXTC0M
 zKjTrJjBP/XltAPY4Qpk8ZivTtSLDJKsFtSmJP0x9MUR1FQ+5lZ5jE1+w
 m3xueEEmKc42gULBT/tK+EUdnPGe5sAEYlsns4ktDP8dfGemvXL9tN+X+ A==;
X-CSE-ConnectionGUID: 0lDnyLtgR1iTCKvW0FQHSQ==
X-CSE-MsgGUID: DCpMpU+mTgWFypePkxK1Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="77372223"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="77372223"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 16:02:14 -0700
X-CSE-ConnectionGUID: NUtFzj5gQCioh8rEV1/UHw==
X-CSE-MsgGUID: kGsGBqOYQGGRTb/GiqTK3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="147644731"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 16:02:14 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Fix early wedge on GuC load failure
Date: Thu, 12 Jun 2025 16:02:01 -0700
Message-ID: <174976929754.4189033.9854520926726389395.b4-ty@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611214453.1159846-2-daniele.ceraolospurio@intel.com>
References: <20250611214453.1159846-2-daniele.ceraolospurio@intel.com>
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


On Wed, 11 Jun 2025 14:44:54 -0700, Daniele Ceraolo Spurio wrote:
> When the GuC fails to load we declare the device wedged. However, the
> very first GuC load attempt on GT0 (from xe_gt_init_hwconfig) is done
> before the GT1 GuC objects are initialized, so things go bad when the
> wedge code attempts to cleanup GT1. To fix this, check the initialization
> status in the functions called during wedge.
> 
> 
> [...]

Applied to drm-xe-next, thanks!

[1/1] drm/xe: Fix early wedge on GuC load failure
      commit: 0b93b7dcd9eb888a6ac7546560877705d4ad61bf

Best regards,
-- 
Lucas De Marchi

