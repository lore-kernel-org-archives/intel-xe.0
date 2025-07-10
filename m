Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A18C83F17
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 20:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B278210E053;
	Thu, 10 Jul 2025 20:35:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A/3Yzzvm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE1310E053
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 20:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752179724; x=1783715724;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ziKPe6RlY5BUNNq+dDDBmwcAZ/Irrtm8S/st5gMxCFQ=;
 b=A/3YzzvmAcxihyEEWQ3QVBzA3w8ERRUyrxiQ7VrLT0EN70fNrrXG89vi
 1dhBZ9to6z+YyiI2/tZREMHBUKjtD34mLsAbU36Cj6GkLRDJVc9hCz6R1
 XUDZ32Y5XAq2fJCzrxdJPiyZkzzk+fEQ7j3mu3dMzlDC8ctCFjeqpRKJE
 6fAc5FnJJA8NN0t51QncjJqioG5gbZKFVENnhIos/+fIEx08uzCMxQgSv
 UhCtBa/ViZNiW/kqijjGT5L2c2sHzy63g4doC6pMrzT1aO6NJZUGboIKF
 dh+opY+Vjnc4/uOe5OCgJjeGpQwvxbnU6wPwy5bRxVrq0Dv0wdhCheqvy g==;
X-CSE-ConnectionGUID: l7dT8bRsS3OzrnOvGSaAew==
X-CSE-MsgGUID: iSRwf43SRoiGVMeiszlLgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="79908466"
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="79908466"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:24 -0700
X-CSE-ConnectionGUID: vre1MQidTTCXddAXktnsnw==
X-CSE-MsgGUID: dFuqSj7tR7GKtGZk64Bebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,301,1744095600"; d="scan'208";a="156744237"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 13:35:24 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v2 0/7] drm/xe: LRC refactors
Date: Thu, 10 Jul 2025 13:33:45 -0700
Message-ID: <20250710-lrc-refactors-v2-0-a5e2ca03f6bd@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250625-lrc-refactors-82b10b576547
X-Mailer: b4 0.15-dev-858c0
Content-Transfer-Encoding: quoted-printable
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

A few refactors while investigating the LRC corruption that=0D
were happening before commit 3d85ab36bcb ("Revert "drm/xe/xe2: Enable=0D
Indirect Ring State support for Xe2"").=0D
=0D
They probably conflict with some other refactors by Tvrtko from=0D
https://lore.kernel.org/all/20250703082059.61597-1-tvrtko.ursulin@igalia.co=
m/=0D
=0D
I'm reviewing that one and will figure out the conflicts. I already got=0D
one of those cleanups from another series and added here on top.=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
=0D
People in Cc received this v2 a couple days ago. I just noticed while=0D
looking for CI results that I forgot the mailing list :-/.=0D
Sending again.=0D
=0D
Changes in v2:=0D
- Fix word counting, relocate and reword log message about dword len,=0D
  also change xe_bb_new() prototype according to its implementation=0D
- Also drop comment with FIXME=0D
- Link to v1: https://lore.kernel.org/r/20250703-lrc-refactors-v1-0-6aa22f1=
74041@intel.com=0D
---=0D
Lucas De Marchi (6):=0D
      drm/xe/lrc: Reduce scope of empty lrc data=0D
      drm/xe: Count dwords before allocating=0D
      drm/xe/gt: Extract emit_job_sync()=0D
      drm/xe/lrc: Add table with LRC layout=0D
      drm/xe/lrc: Remove leftover TODO/FIXME=0D
      drm/xe/gt: Drop third submission for default context=0D
=0D
Tvrtko Ursulin (1):=0D
      drm/xe: Waste fewer instructions in emit_wa_job()=0D
=0D
 drivers/gpu/drm/xe/xe_bb.h  |   2 +-=0D
 drivers/gpu/drm/xe/xe_gt.c  | 174 ++++++++++++++++++++++------------------=
----=0D
 drivers/gpu/drm/xe/xe_lrc.c |  61 ++++++++++------=0D
 drivers/gpu/drm/xe/xe_lrc.h |   2 +-=0D
 4 files changed, 127 insertions(+), 112 deletions(-)=0D
=0D
base-commit: ad02e528d11b8cdc56daaa647aed319ba1d1ff03=0D
change-id: 20250625-lrc-refactors-82b10b576547=0D
=0D
Lucas De Marchi=0D
=0D
