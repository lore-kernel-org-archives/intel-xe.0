Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16557C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 20:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1C8F10E8F9;
	Tue,  3 Jun 2025 20:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CF+GQVr2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C36B10E8F3
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748982108; x=1780518108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sw9i9qmo7OQ3PwZZis5oQ3YzfTWxr3T8JROqiCInXsU=;
 b=CF+GQVr2grE3Zm0EkNabS4RExAkgVBB/Vw5JeXmO8UtQjQn7jyltkbYd
 IQMz+b4qf6/diyViIg27XPJw0Kmh7pxLJf0niPb2Lrj/l4AZg1SzllONS
 gLiJiZ+CGZvVxJlYwYwe7MFJEHRbBKXry8GPhKzyzgUeLc5SuANydUkK3
 94rdXrcrZXr6VElHwHkgTTvnDNL5JGcC/laKEuCx2HGcxeU7avp0pU8TR
 LWSO3eGHfIQ+b4HIoLms1XlrfDSZ3LRVBSnmgCNIT21tkvKTtgepZg4oT
 30GA9/7uUw7UwHKsOTuZ/xDH92vnJ+qNiPqZKAa8gtWDH29bGGfxxYS5+ Q==;
X-CSE-ConnectionGUID: Ky9FKDLFS9C6SCSPw/xy+g==
X-CSE-MsgGUID: YDgAmk05TwaAOwgWmiBDAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="76427534"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="76427534"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:21:48 -0700
X-CSE-ConnectionGUID: 6RMtz4YIQLW9H37qywPgpg==
X-CSE-MsgGUID: 1QAylrqeRL+bY7XEGQ5qwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="175833196"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 13:21:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH v3 0/5] Enable media OA
Date: Tue,  3 Jun 2025 13:21:28 -0700
Message-ID: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

We had previously enabled render and compute OA units. Enable media OA
units with this series.

v3: Introduce DRM_XE_OA_UNIT_TYPE_OAM_SAG
v2: Added Patch 5

Ashutosh Dixit (5):
  drm/xe/oa/uapi: Expose media OA units
  drm/xe/oa: Print hwe to OA unit mapping
  drm/xe/oa: Introduce stream->oa_unit
  drm/xe/oa: Assign hwe for OAM_SAG
  drm/xe/oa: Enable OAM latency measurement

 drivers/gpu/drm/xe/regs/xe_oa_regs.h |   3 +
 drivers/gpu/drm/xe/xe_oa.c           | 205 ++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_oa_types.h     |   6 +
 include/uapi/drm/xe_drm.h            |   3 +
 4 files changed, 163 insertions(+), 54 deletions(-)

-- 
2.48.1

