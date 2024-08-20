Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B3C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 00:58:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488A310E34B;
	Tue, 20 Aug 2024 00:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyepyeal";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D17E10E32E
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 00:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724115494; x=1755651494;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B0cxo/owIw98r52L7BbYjMNuh5usPgBUID8tPUqVtqI=;
 b=iyepyealSwguMV/ORQ9KlEzVsgCXVyGVencrCkZo6BbJjMVSd40fkq0+
 I+IYY8BatUtqryJoJQLtrzEmZ92knKD1EytwHkNSmrAeK05xDOXhOt3VU
 y9HH5MhhoNe2UmjmaA+TD1ZWC86CbHpyycSVUNmU0C0FQ2+2XMQmoRI6w
 UCOR9RkvoU+NzPYfk2fgDQINwrKPdO+OY3cGVzBWEn6bK5act5XD4khOj
 EoaouLmg/7JaaxKqw9p8lWEO0NoctfysfHl/+I60EOUlvndOu72uhB7bw
 6XHYEvvygXkIfVx8R+Hjmr8MOZ38Me8aoKOd0GmI/aCoeFPp7jyAFtd/3 g==;
X-CSE-ConnectionGUID: pOVLLpucQgyu5ngvLtCyOg==
X-CSE-MsgGUID: MD6vSF9hSjGzWAYVLeaOWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33057759"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="33057759"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:14 -0700
X-CSE-ConnectionGUID: 5M319PdSQ5uxwySZh/Pvdg==
X-CSE-MsgGUID: HclZlouGT9SpCaoPEopt+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91319920"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 17:58:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, Jose Souza <jose.souza@intel.com>,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v2 0/7] drm/xe/oa: xe_syncs for OA
Date: Mon, 19 Aug 2024 17:58:01 -0700
Message-ID: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

OA stream configuration submits batches which can be queued behind other
(say workload) batches. Also, in some cases, additional delay is needed for
an OA configuration to take effect, even after programming batches have
completed executing on HW.

Mesa has use cases where a single workload is replayed repeatedly on the
GPU, each time with a different OA configuration (or metric set), in order
to capture different aspects of workload performance. This requires that OA
configuration takes effect at precisely the correct input batch and also
userspace is correctly informed when a new configuration has been activated
(at batch granularity).

In the previous implementation this is implemented by introducing a delay
in the stream open and reconfiguration ioctl's. This works, except that we
introdce a bubble in the userspace pipeline (the pipeline stalls during the
delays in calls into these ioctl's). Mesa prefers that such pipeline stalls
don't happen.

In this series this problem is solved using xe_sync arrays, similar to
xe_exec and vm_bind. Here OA re-configuration can be made to wait till
input fences signal and OA will signal output fences after a new
configuration has been activated. This can of course be done without
stalling the userspace pipeline.

v2: Address review comments from Matt Brost, Jonathan Cavitt and Jose Souza

Test-with: 20240820003104.1407398-1-ashutosh.dixit@intel.com

Ashutosh Dixit (7):
  drm/xe/oa: Separate batch submission from waiting for completion
  drm/xe/oa/uapi: Define and parse OA sync properties
  drm/xe/oa: Add input fence dependencies
  drm/xe/oa: Signal output fences
  drm/xe/oa: Move functions up so they can be reused for config ioctl
  drm/xe/oa: Add syncs support to OA config ioctl
  drm/xe/oa: Allow only certain property changes from config

 drivers/gpu/drm/xe/xe_oa.c       | 650 +++++++++++++++++++++----------
 drivers/gpu/drm/xe/xe_oa_types.h |  12 +
 drivers/gpu/drm/xe/xe_query.c    |   2 +-
 include/uapi/drm/xe_drm.h        |  17 +
 4 files changed, 478 insertions(+), 203 deletions(-)

-- 
2.41.0

