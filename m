Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D136BC4345F
	for <intel-xe@archiver.kernel.org>; Wed, 24 Apr 2024 03:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843D110FA54;
	Wed, 24 Apr 2024 03:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QK1BVRLu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA2410FA54
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Apr 2024 03:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713929478; x=1745465478;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0GDISonIr2TDbz8/JTEo9smItE4jpvIDBgNQHpIb+Us=;
 b=QK1BVRLu4p+RgxjfW/9v16905DFF/Y0LGlfaIk6cMufGZABBqmOXDFCC
 rDYTs4F/c8rxd/iw1+ust7ZQeh4I/kMVZgC40deFYpV/X9GpZWwQNxH1x
 6pk2e4buJ+2UA2kDM6no6WgD5E8oiDuISWT1TNrZe0lLScPkG4NKtKysJ
 OPqC/T9ycnokRnhSLII16uS3u1xZGHE7QqYXMqVuQ4gKjMFxNOlxT+5GB
 TwrXptkzS985SZWvplGqNeheT0X8HiGnf2jnEIQaOpj4IoqPBxaGfTHoO
 592Cz9PojsB4SBaxPS1xxuX+o5L9NlTDOhcgTXAj/ugXWDROlSEwzk4/r A==;
X-CSE-ConnectionGUID: S1+JkAa0TTWA5UiUOB0GRQ==
X-CSE-MsgGUID: AzCXXmaxS6ajxKaVzHmCjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9408517"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9408517"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 20:31:17 -0700
X-CSE-ConnectionGUID: WI3qsriGS9KeLn32tzhjsw==
X-CSE-MsgGUID: y7z/8eaVTye5KZkdiFM5LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="24605651"
Received: from himal-super-server.iind.intel.com ([10.145.169.168])
 by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2024 20:31:16 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/2] Use the helpers for locking/unlocking resv object
Date: Wed, 24 Apr 2024 09:15:13 +0530
Message-Id: <20240424034515.2161938-1-himal.prasad.ghimiray@intel.com>
X-Mailer: git-send-email 2.25.1
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

Use the helpers for locking/unlocking resv object.

Himal Prasad Ghimiray (2):
  drm/xe/vm: Use xe_vm_lock()/xe_vm_unlock() helpers
  drm/xe: Use xe_bo_lock()/xe_bo_unlock() helpers

 drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
 drivers/gpu/drm/xe/xe_vm.c  | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.25.1

