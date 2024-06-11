Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D140C27C65
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jun 2024 16:35:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D348589D7C;
	Tue, 11 Jun 2024 16:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZmp3RaU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8510E105
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Jun 2024 16:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718123752; x=1749659752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PI1+lulu0h6Nw65YiwsjZjg0I1EHtGt1ofA1y0k83q8=;
 b=FZmp3RaUllpbwwQ2zCk37Guq38R9Oxv8KEHqGJaeo8H31sPhza1Fh+U2
 l5E/ATt5x2lMAdtQ89Eweg86ZKx95leTbl8r5t2jlna/h8W/1EF3ZPf35
 vrnaZf6e7rXE7g/eJbNaXY+Fc5F5hwsbvf2f+L6iikvSBuOvZW9nU75F+
 dh0aKOThCmJZS3GmSwDRcHySXEC61ncXxsDEKJLGzKDga1ql7AIUqRN8t
 2yI2hnxedKUdhoNxS7k6l1+d3N10L5l7YQ+d/IUM1SMLacX2Q3wnNH1TW
 U+TWg+k0t818thgQWluTtZVXdqVJvF5AVdCPJcSrcFYjw45o3pB+QuoNH g==;
X-CSE-ConnectionGUID: HhE4cF2JRFGZ4XnNdex3Yw==
X-CSE-MsgGUID: jCr9iF77QvCroeOm8U3KUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40247873"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="40247873"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:52 -0700
X-CSE-ConnectionGUID: toeY4EYlR3WY9qROOmHZfg==
X-CSE-MsgGUID: RNrXppoXQ8+aXZxgjXXKFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; d="scan'208";a="44388674"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.248.185])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 09:35:49 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Badal Nilawar <badal.nilawar@intel.com>
Subject: [PATCH v3 0/5] Prepare Xe force-wake code for VFs
Date: Tue, 11 Jun 2024 18:35:32 +0200
Message-Id: <20240611163537.1944-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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

The control and ack force-wake registers are not accessible for
the VF drivers. To avoid changing existing code logic that tracks
woken domains, simply ignore all attempts to access control or ack
registers if we are running as a VF driver.

But before doing that, make some improvements inside xe_force_wake.c

v1: https://patchwork.freedesktop.org/series/134690/#rev1
v2: remove ret2 and rename str_wake_sleep helper param (Rodrigo)
    drop inline from str_wake_sleep helper (Michal)
v3: kill fw_to_gt() helper (Lucas)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>

Michal Wajdeczko (5):
  drm/xe: Prefer GT oriented messages in xe_force_wake.c
  drm/xe: Kill fw_to_gt() helper
  drm/xe: Include additional info on failed force-wake operation
  drm/xe: Combine common force-wake code into helpers
  drm/xe/vf: Ignore force-wake requests if VF

 drivers/gpu/drm/xe/xe_force_wake.c | 78 ++++++++++++++++--------------
 1 file changed, 43 insertions(+), 35 deletions(-)

-- 
2.43.0

