Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC07AC25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 05:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486F7112366;
	Wed, 29 May 2024 05:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVwbq/rx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95385112366
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 05:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716959204; x=1748495204;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4xIz8meYVlvy7qYulRNGK6dY/676qH+ij/egDm1k+rU=;
 b=YVwbq/rxZjg+tgNhgiJQ2IUQpOPc9a1yn5Sc50U1zCPuTgJV7c0drMo3
 5HnxF6/yPyg3/KpS0UV5ayLN0+zkOC5uS09vA84xeskMXfly3RTd0aAXj
 2YORz80IeJFaMFdd41hvhPi8gVYFW1iTiudrbN6XmjwzhjWaa4K2rcMj7
 MMYpnucQrvlbiU+90BJNL13PZDepx6CcBS1bAGfYnabjKrHomWGUSq0/8
 NWIuWzJYxJK9DKhR1vCzzZXeEOI+PoS2oQNbbqaazOKpf+aoJrwFB3Ldy
 5v7BjCTSrudJf/QmWb2oVTpXhZ8XxRu1p7T3jBK5tp/5VRTFdcDO+a4by g==;
X-CSE-ConnectionGUID: lgDfTaLlQUK5OXM4Qickwg==
X-CSE-MsgGUID: uCh5fo6fRDKkoWFf/Ky7ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13216920"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="13216920"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:06:43 -0700
X-CSE-ConnectionGUID: LTKtLUU+Q1usAtYT2dNGxg==
X-CSE-MsgGUID: 11wKcPJhST+dWBRS6GeaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="58484657"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 22:06:41 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 0/2] Add HWMON support for BMG
Date: Wed, 29 May 2024 10:37:56 +0530
Message-Id: <20240529050758.442056-1-balasubramani.vivekanandan@intel.com>
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

v2:
 Fixed checkpatch issues

Karthik Poosa (2):
  drm/xe/hwmon: Add HWMON support for BMG
  drm/xe/hwmon: Expose card power and energy attributes of BMG

 drivers/gpu/drm/xe/regs/xe_pcode_regs.h |  7 +++++++
 drivers/gpu/drm/xe/xe_hwmon.c           | 28 +++++++++++++++++++------
 2 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.25.1

