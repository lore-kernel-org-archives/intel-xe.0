Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0AEC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 09:29:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E46B10E6F2;
	Wed,  2 Apr 2025 09:29:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/E5V0u7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668C610E6F2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743586181; x=1775122181;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O0+QFQn4r8X3h4c3huolH3PJcPrVy3SmaeRHSYd89sA=;
 b=i/E5V0u7QZSaOpvIQzze5tAFv+WBE9cNNTWWunoFlQT3YSRJAGQOUuC5
 U/Wq8zQVuo3m8bnsg6tNsKADLj+bDIk3BFRGYyR3lxtVrAzl0gKIZk6Ao
 5rnuLw8rhgfnsxFDNgB5fXxgAv4WeSkH9tN6OWRUUQJ/Bft5kRtmKAWao
 a58pyhez7QfbYp+33y63izXw0NTTBbfc/ranS10UCklUF7QzgblEDe2Dn
 VBqvkFJW6zj7YzY9PqPbgq2V4nyDUnmW4CWIHV/X9Ai7bRIJ6JuiLsZKL
 XdQqqpd0hIz+W3FjBzgxEtT9Y74VDoMiZGS743ZN5peOLRUYmhLesSCtt Q==;
X-CSE-ConnectionGUID: egI84CP5QteqxkBzXE6I6Q==
X-CSE-MsgGUID: fh8d3DgzTrWuQMpWMq9/WQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44824852"
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; d="scan'208";a="44824852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:29:36 -0700
X-CSE-ConnectionGUID: 9fo0qiIdS1GUIZlYXTko1A==
X-CSE-MsgGUID: KpojXqs+Q9KHzfHXQ9mZsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,181,1736841600"; d="scan'208";a="126538371"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.252])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 02:29:36 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 0/7] Improve SRIOV VRAM provisioning
Date: Wed,  2 Apr 2025 10:29:22 +0100
Message-ID: <20250402092921.79918-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.49.0
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
v5:
 - rebase on newly merged dma-unmap on unplug, which interacts with
   the pinned lists.

-- 
2.49.0

