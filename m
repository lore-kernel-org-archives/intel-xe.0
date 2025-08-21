Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C190DCA0EF8
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 14:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8460D10E9AF;
	Thu, 21 Aug 2025 14:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MS6Lp6Lb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EDE710E9AF
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Aug 2025 14:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755786665; x=1787322665;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IF+B+z7v6vCGulfQFfyha3kCBebaUnTF3FSKZCC4gGk=;
 b=MS6Lp6LbC+Xu9L+Opbc0yI0A7dm67F9J+twb0o5fz/42qtoWvunKxf15
 hbvMrHxDi/6WbfhBf/tci2EYjlgFzHk+x95wS0V6RszdNnpU8zCDrkVey
 /S+4NeTzkD4qyX5/e4sPHxQA94syMSed0KC1Yz7DLU9wVOIAhITOjpZK1
 hrW5dSWBTTBJL/OT2vqX2uW5NWHWP96b7cp8uuMv58Bh/Ge0XHWkZneSG
 c+pBOPOnmPQ5K67IXBPC86uLbrCRo+C7Yye6uABT9kHdOrETf8kAfJH70
 WHsNo0jd749B1qyEpmrdCRh47gn9hFWKzRsZtwJFn+7kKPwvuKJgiLm08 A==;
X-CSE-ConnectionGUID: sX5fczMETjOI/nrAc7F6aQ==
X-CSE-MsgGUID: ZZgexegjSD2kLSQy0WNm/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58175756"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="58175756"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:04 -0700
X-CSE-ConnectionGUID: FECNysijSMi6Qoyq1ORa3Q==
X-CSE-MsgGUID: X0H+0tRjQaGsP+l5b3Eq0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="172840840"
Received: from johunt-mobl9.ger.corp.intel.com (HELO fedora) ([10.245.245.201])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 07:31:04 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] drm/xe: Fixes from the exhaustive eviction series
Date: Thu, 21 Aug 2025 16:30:42 +0200
Message-ID: <20250821143045.106005-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

A couple of fixes from the exhaustive eviction series ready to be
merged. Submitted for standalone CI.

Thomas Hellström (3):
  drm/xe/vm: Don't pin the vm_resv during validation
  drm/xe/tests/xe_dma_buf: Set the drm_object::dma_buf member
  drm/xe/vm: Clear the scratch_pt pointer on error

 drivers/gpu/drm/xe/tests/xe_dma_buf.c |  8 +++-----
 drivers/gpu/drm/xe/xe_bo.c            |  5 ++---
 drivers/gpu/drm/xe/xe_vm.c            |  8 ++++++--
 drivers/gpu/drm/xe/xe_vm.h            | 15 ++-------------
 4 files changed, 13 insertions(+), 23 deletions(-)

-- 
2.50.1

