Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C01CC87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 14:34:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E312F10E00F;
	Wed, 30 Jul 2025 14:34:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AkfDoxf+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE4010E00F
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753886067; x=1785422067;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wclLzkJhos3RnMskhFkpFL0lqxLmpUkeWvgfrh5L3FU=;
 b=AkfDoxf+Us00UChiVzMuqKDcRUoG0IiIIaMhaoqtiC8kA8s3aOjPuhVv
 bwaR92HwxVnVx3A/lss0u6IqQTmwOQZBDizv7bIoYX+CZSuZBPh7akHDv
 aUIfOcJo5/EC1+e4BNYODkv7OhR7MM847R98+HLbBW3KiQJqLGlesGCof
 /OI5D0n/sihLhEYm+Nv4DRrEaIH2NRKLsorKCMgWkCltP84wUH4STQad8
 UmJ3gBCB3CVWtljd9zA0BuUsrUVUF9BjA3B/RXksTPtG1r3qas9tfSRml
 GTndHUhx8CBlV9Qi7rJyJ6f9LiG+KpetRqVA2KFdT9y/9SHb6BaOyZaTI w==;
X-CSE-ConnectionGUID: lETqCaAhRaKdbxHou7pwcg==
X-CSE-MsgGUID: DmzzKiO3T22XhD47FMMgww==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56120587"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56120587"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:34:26 -0700
X-CSE-ConnectionGUID: 3irjKYLATYevCiGs8iKPHA==
X-CSE-MsgGUID: pBezP07qQpqWJ9iB73OGDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="167220603"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.102])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 07:34:26 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/3] Some more xe_migrate_access_memory fixes
Date: Wed, 30 Jul 2025 15:33:36 +0100
Message-ID: <20250730143335.174373-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
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

Some more fixes to hopefully to get this working correctly with eudebug testcases. Tested locally on
BMG.

-- 
2.50.1

