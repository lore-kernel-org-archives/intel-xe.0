Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3AFC83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 09:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D15A810E04A;
	Thu, 10 Jul 2025 09:37:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNBUk9rX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2594D10E04A
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752140229; x=1783676229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ou2eeJ0SRRQ5+34s3eiSK68PbEAyhRyUcIPsesDvYsg=;
 b=kNBUk9rXA8c1hXUUKACYEF8aHVTQUFoc/LLJZZrQKFLbj59J5BQ2d+Uf
 jUPH3Da+3QWUA81UvrhDfgna4zWgFlmLIjzxohXVMdINoNSkfsxY3aLS1
 pyZe5qgJiRysFZAAzhPm75pJBLpRGUPMyaarSCu7NIMZizKk+bgif5u2V
 l4cMsrevL5S1v7cRu7ZOPEUbo6Cabpv/lQkyUtVshFcUBWwZDKJaugpEe
 st4c0fV5npEepi86BDnOp403cJHwaWdnp52D7bm9T+dH561ksJh0Ah+TD
 xApcpf6bigH6I144ZYsK281h1tb/Q3VyijKiYXu5Areio/4uFJZ/cSs8k A==;
X-CSE-ConnectionGUID: 1/VXgRKITUSEFNqbFcX8YA==
X-CSE-MsgGUID: kAPX/vy2Q5GVBoWkCVtQuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="79851261"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="79851261"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:37:08 -0700
X-CSE-ConnectionGUID: WmpMYoFpSqqtVYgixu0Dkg==
X-CSE-MsgGUID: vi7AKJV6TcOtWkFzuDz3lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160038288"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:37:07 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH 0/2] Add SR-IOV support for BMG
Date: Thu, 10 Jul 2025 09:26:28 +0000
Message-Id: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add SR-IOV support for BMG platforms. Exclude VF from using WA
16023588340 and 22019338487 and add has_sriov flag for BMG.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Michal Wajdeczko (2):
  drm/xe/bmg: Don't use WA 16023588340 and 22019338487 on VF
  drm/xe/sriov: Mark BMG as SR-IOV capable

 drivers/gpu/drm/xe/xe_pci.c        | 1 +
 drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.34.1

