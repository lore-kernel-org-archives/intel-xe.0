Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6CF9CD6E55
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 16:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C6611211B;
	Wed,  3 Jun 2026 16:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lk6dIhZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E05511211B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 16:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780505485; x=1812041485;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dW+kI8QxTTyOD9wWSDpKjc7edp3jkh3FjJOb76YAm7U=;
 b=Lk6dIhZmbeXnFQbcoVOm2yUBknzWbEfhmxbfX824vHG0Xhc1fwXr0fAk
 QwqNzXv/PZNTGzLcVWF2ef7bcUblVfq3DoI5Q9C8HANdMwtZkXN6GR6SG
 1uNb4C4VQU74dKRlWJBcuxZMEGAgthYITWsoOHcGbX58TE0yM5cfO2qnO
 DDNbDlEK+CdtOiUsUWsXQ5OyuGYtmzT24JA5VErt/bW6QqF7wqafua9F7
 7M8UwXVfNU8XliH0InmtBKNic7MhgOOLR+EnUDqTlThsSkDOI3e7MR48k
 Il9B9/n/xrUhYPVBsmHlgEDb4xfKyLWeqjzOYP8bWsjPHzerHsucYQyfI g==;
X-CSE-ConnectionGUID: vPUYFvU8RZe9LZAoKkP50Q==
X-CSE-MsgGUID: lvLsVDFeRSqGXzzo1esuNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81449057"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="81449057"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:25 -0700
X-CSE-ConnectionGUID: ayikZ1/yRMq+O85sGAh5ew==
X-CSE-MsgGUID: xUoe6rHkSxywucn4j8H/5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; d="scan'208";a="239817866"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.195])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 09:51:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 00/10] GuC paging engine support
Date: Wed,  3 Jun 2026 17:50:53 +0100
Message-ID: <20260603165052.183465-12-matthew.auld@intel.com>
X-Mailer: git-send-email 2.54.0
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

On NVL-S+, the GuC will be moving towards a dedicated GuC engine class for
the driver reserved copy engine(s), which we need for USM flows. With this
the GuC will now be able to internally differentiate KMD paging operations,
like clearing/migrating/binding, from other copy engine submissions.

Note that this is purely a software view within the GuC. There is no new
physical engine, or anything like that. With that in mind the design here
keeps this contained on the GuC side, with upper layers not needing to know
about this distinction.

v2 (Sashiko):
 - In VF query patch, we shouldn't call guc_has_paging_engine(), since this
   is too early in the VF sequence, and GUC_SUBMIT_VER() is still unset.
v3:
 - Revamp the paging engine setup in patch 5 (Sashiko)
 - Some more improvements from Daniele
v4:
 - Some more improvements from Daniele, plus some other tweaks
v5:
 - Some improvements from Michal
 - Update with the official GuC version: 70.68.0 (1.36.0)

-- 
2.54.0

