Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5190BCCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120C210E914;
	Thu, 23 Oct 2025 15:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qe7e3F5L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62BE10E914
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761232738; x=1792768738;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xcNzapEzUAyW3Sns9FNTGOWmYk5kOtvyKydIkrpwxLk=;
 b=Qe7e3F5Lq8cW95L8AvN86v/mwMtEga/Z3awWVucWP1EsXALTJV8zZtXK
 BXDTi8y76Wj6vHJBbv1LwnvPHjkLKe4uKyKXsHfDgq80S3qsHfz8FWYdu
 dtdvb56JZ0bY72wiKcj154FlLo9f3yz3HMS1rPpDg1mPLZIJ1qU/Hk4kD
 SJMAfkoqhWlEyuYF6aDTzT9XgqgBH94CNlbHU2yp6qKRwTOnw5IKdNe4h
 i/q1Pr4x/ucxdpa9kNqbSWxF08Q7HGEwvVVonE3J7wh/t7HlIuJqI7ilW
 R+DPXmvR8QsbSq7zEeP9vLIp0lR+xPshTGABJR1KsbycoX+ZcJ+jpX9Q2 Q==;
X-CSE-ConnectionGUID: YHQdr6COSOqhshLg5IKsNQ==
X-CSE-MsgGUID: GUpP8Yw/RYqz445QN89G/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="88871898"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="88871898"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:18:57 -0700
X-CSE-ConnectionGUID: NMa2AEwQQH+cHS2Ypy5m9w==
X-CSE-MsgGUID: Cj0XX0SaTcCGP0hpY/Mp0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184077354"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 23 Oct 2025 08:18:57 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v2 0/2] VF double migration
Date: Thu, 23 Oct 2025 21:06:10 +0530
Message-ID: <20251023153616.3790-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.51.0
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

In scenarios involving double migration, the VF KMD may encounter
situations where it is instructed to re-migrate before having the
opportunity to send RESFIX_DONE for the initial migration. This can occur
when the fix-up for the prior migration is still underway, but the VF KMD
is migrated again.

Consequently, this may lead to the possibility of sending two migration
notifications (i.e., pending fix-up for the first migration and a second
notification for the new migration). Upon receiving the first RES_FIX
notification, the GuC will resume VF submission on the GPU, potentially
resulting in undefined behavior, such as system hangs or crashes.

To avoid these hangs, a new VF2GUC action `VF2GUC_NOTIFY_RESFIX_START` is
sent along with marker and when GUC receives the same marker with
`VF2GUC_NOTIFY_RESFIX_DONE`action, it starts scheduling work loads from VF.

---
V1 - V2:
- Squashed "Enable RESFIX start marker only on supported GUC
versions" commit into a single commit. (Matt B)
- Use fault injection for testing VF double  migration feature (Matt B).

Satyanarayana K V P (2):
  drm/xe/vf: Introduce RESFIX start marker support
  drm/xe/vf: Use fault injection for testing VF double migration feature

 .../gpu/drm/xe/abi/guc_actions_sriov_abi.h    |  38 ++++++
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           | 116 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h     |   5 +
 drivers/gpu/drm/xe/xe_sriov_vf.c              |  42 ++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_types.h        |   5 +
 5 files changed, 198 insertions(+), 8 deletions(-)

-- 
2.51.0

