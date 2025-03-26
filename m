Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1C1C36010
	for <intel-xe@archiver.kernel.org>; Wed, 26 Mar 2025 18:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EDC110E1E1;
	Wed, 26 Mar 2025 18:19:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHXlws3D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 128CA10E1AA
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Mar 2025 18:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743013171; x=1774549171;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rZ4g05q7wQjezCxyoY65NXu8JLNg5qoYXnQDWM4+XTM=;
 b=NHXlws3DpqRim+zmPbSInci5t7tJx322gDgx1WilrUEn9rM1wYyB9FYU
 uax3Y29NVgNL/sH9nWsS20dqXzO1mIklDPw1bQtlc9Mlka/qVoKnwWQCM
 zftkFI8OSQPWIZRkVo9vIwIF/8MgGB0YDUABexr9XqnD0A0m82NLLFCty
 rKyWzh59tCscU47f71mkvcRLJQmlC312xzy0s9g+UZg/O4l7CY7BeEFeX
 gh0xaf3fbsSux5j5+qcwVefj8uakSRsJcsG/egH/iYcDSv1m1XiWsmE6s
 +vcVly4Qqb6iEZiPk5x5E3Z+7mk54Prs1cHblxe7oYWg2G4IhGYo1UIqS w==;
X-CSE-ConnectionGUID: t2MKPzogQIa/kQLrLoSKkg==
X-CSE-MsgGUID: xjaxe+PLTZSbnlGAg2DLBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44213581"
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="44213581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:31 -0700
X-CSE-ConnectionGUID: +mQpnEBlQkulW3+/+K3M3Q==
X-CSE-MsgGUID: XYOORWKITg+D3P3TGO1esg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,278,1736841600"; d="scan'208";a="125383304"
Received: from ettammin-desk.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.12])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 11:19:30 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v4 0/7] Improve SRIOV VRAM provisioning
Date: Wed, 26 Mar 2025 18:19:09 +0000
Message-ID: <20250326181908.124082-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Support non-contig VRAM for pinned kernel objects. Main current usecase is
when provisioning VRAM for SRIOV usecase (final patch). Currently we are
artificially limited to using contig VRAM, however the allocations here are
very large and the contig restriction can result in failing to provision
the VF, even when there is enough free space (we just need at least 2M
pages).

v2:
 - Various fixes for CI reported issues.
v3:
 - suspend/resume and various other fixes.
v4:
 - drop one bogus assert.
 - rebase on the newly merged apply-to-pinned infra.

-- 
2.48.1

