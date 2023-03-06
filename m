Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19144C678D4
	for <intel-xe@archiver.kernel.org>; Mon,  6 Mar 2023 13:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E4F10E0BB;
	Mon,  6 Mar 2023 13:17:56 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FBC10E0BB
 for <intel-xe@lists.freedesktop.org>; Mon,  6 Mar 2023 13:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678108674; x=1709644674;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YtQcasxc5vVagA2X7SfaT1AmMaJwz6SbHA8nmgZE6hI=;
 b=jfBO8XckD3B+5oLgpot0mpAAnkFAESK5vKNsKgtB3ySouOw2OlZNVxEZ
 yZW7uwXniLbufPOR6yaY5Pz0UaYpQ0wqFD5cr/CuuNFpQjNRZ3Qr0OtNo
 BGl7mRmN1IahknZzz4QdTVKrJHjqucVmNsQN92jyquZceUDhRKhuAyCSE
 9OoPaUA5knUUYneoxa2BbI16/VC0o4yEKvIk70SUIpEPiDVsGZWpGDGKn
 Cqj5I5IOaWnmgt6OgN8lPwhuMBiPKnhcEQiD17trN6jvFl+6SYHpfNR6b
 BvhYtgC1VSIn4kA0vTDqOA18yyJhiDxXj1Xm385fU1SYbqqSuHepmnOqU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337866664"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="337866664"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="653607173"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="653607173"
Received: from jsyrstad-mobl1.amr.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.109])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 05:17:53 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  6 Mar 2023 14:17:35 +0100
Message-Id: <20230306131738.197862-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Move the page-table walker
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

Move the page-table walker to the xe subdirectory.
These patches should not be applied on top of drm-xe-next, but rather
squashed at relevant sites in the branch

Thomas Hellström (3):
  drm/xe: Add a page-table walker
  drm/xe: Use the xe page table walker rather than the drm one.
  Revert "drm: Add a gpu page-table walker helper"

 drivers/gpu/drm/Makefile                      |   1 -
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/xe_pt.c                    | 110 +++++++++---------
 drivers/gpu/drm/xe/xe_pt_types.h              |   4 +-
 .../drm/{drm_pt_walk.c => xe/xe_pt_walk.c}    |  55 ++++-----
 .../gpu/drm/xe/xe_pt_walk.h                   |  70 +++++------
 6 files changed, 119 insertions(+), 122 deletions(-)
 rename drivers/gpu/drm/{drm_pt_walk.c => xe/xe_pt_walk.c} (71%)
 rename include/drm/drm_pt_walk.h => drivers/gpu/drm/xe/xe_pt_walk.h (65%)

-- 
2.39.2

