Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66163C28B23
	for <intel-xe@archiver.kernel.org>; Fri,  7 Mar 2025 18:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2DD10E191;
	Fri,  7 Mar 2025 18:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lbt3X8K6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986EA10E191
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Mar 2025 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741372159; x=1772908159;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2jSF2TZFbcswe0T+T1a0KIeImB2dN/4kz7LrpwqIQAg=;
 b=Lbt3X8K6GyfE4/UK8RrdgQsEQhD3aV7Ax3xS0Zj9acTkA8fl8kRuGju1
 Lk7jpQ6Q8vaVQjaDdBuF5PXUQbDRQzlKcgHjqWOLcckpvxIGDARPkQ8RC
 lOGYrqGL2goyhqKwYRe6HmVmFHYB/0QnWKazAoqVfp+D6nltE2ef8U6RY
 2f4evEXH6WGzUURaowaKwyhfhiQegHK45t7+zf2Zt4IOuG8si2QUj+6un
 SeGxo/SN/XWDqvHFgbKnQc2Hm+TW6+uozuNTZx3qeFjSjpJoNbpSYyJzn
 bvFaBP9XcWbMqVQNA4MLut5LK/tOvPUdSrg6QnsfN4uV5PgVSuhxaV9iX w==;
X-CSE-ConnectionGUID: t+pDcSwSQ0eNWe07c0sKUA==
X-CSE-MsgGUID: 3MO5lr4KSIGhG1PzNQbPVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52639827"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="52639827"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:18 -0800
X-CSE-ConnectionGUID: 6JcqeZxJQ36WOABgNwtKxg==
X-CSE-MsgGUID: PwEUCQvaR8Km5h/xpYVLcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124625634"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.99])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 10:29:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/8] Improve SRIOV VRAM provisioning
Date: Fri,  7 Mar 2025 18:28:57 +0000
Message-ID: <20250307182856.304850-10-matthew.auld@intel.com>
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

-- 
2.48.1

