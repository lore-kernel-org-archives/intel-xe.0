Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4E6CAC598
	for <intel-xe@archiver.kernel.org>; Tue, 16 Sep 2025 17:01:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9DEF10E3AF;
	Tue, 16 Sep 2025 17:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5PWJNrH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D44210E3AF
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Sep 2025 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758042071; x=1789578071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7SWTf+j9xwk/pMSTLERlLuZKvPOtHN//xwbbuuwplAM=;
 b=A5PWJNrHEIj4duv50hmQfIxiwlwHjyHVwo/DbzcOMfdUv0PDz3/Y3hrW
 KgiQsH/ZFccuSHXSk8ViKhicbmBm8Z1Ew7GC7IJB5knFc/md8vwxxCEFd
 uxa2AnPiuHYEB3fzsx2ts8ugC2/0T7kZP3fbWhqwGNi6g0zvAxxiivSjk
 Oo6swYRoQFYxp4L65Uu5LZwK4DXZJdnE87CNEuhCs4VdQb3YmYy/y2JTl
 +QWiD7BHDxPpMvOzOc+oiWZ+5quOPasLkxRp9z8AXLfQCOoUy98CPO33b
 kT0jWCu6RZMoNTy8T7jp6SnObq9aZuuHwz5VVDJL8m//f4n59nM0e5YMA A==;
X-CSE-ConnectionGUID: 0QE0hhN1RtyPU05fLwcEew==
X-CSE-MsgGUID: 28DulQrvQUSTnAANrR/DFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="47906939"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="47906939"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:00:53 -0700
X-CSE-ConnectionGUID: DMO21LmbRAyz+lRAs6HjVQ==
X-CSE-MsgGUID: psS59s0RQLWuYf0JqEWbdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; d="scan'208";a="180128284"
Received: from rjayathi-mobl1.amr.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.245.98.43])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 10:00:52 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [PATCH v2 0/2] drm/xe/sysfs: Fix attributes registration on VFs
Date: Tue, 16 Sep 2025 19:00:27 +0200
Message-ID: <20250916170029.3313-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
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

v1: https://patchwork.freedesktop.org/series/154534/#rev1
v2: rebased, reordered

Michal Wajdeczko (2):
  drm/xe/vf: Don't expose sysfs attributes not applicable for VFs
  drm/xe/sysfs: Simplify sysfs registration

 drivers/gpu/drm/xe/xe_device_sysfs.c | 106 +++++++++++----------------
 1 file changed, 42 insertions(+), 64 deletions(-)

-- 
2.47.1

