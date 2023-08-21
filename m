Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3A9EE4993
	for <intel-xe@archiver.kernel.org>; Mon, 21 Aug 2023 11:57:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3D410E169;
	Mon, 21 Aug 2023 11:57:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A751610E169
 for <intel-xe@lists.freedesktop.org>; Mon, 21 Aug 2023 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692619046; x=1724155046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KcbLm3rNf+d1M3PlRcj5S9kaLCLuPhnIkDqqPS6Zyy0=;
 b=iJUR1K2urrywPVyp2XjWgalUgQ43s8lurY4dEh07nQpkfP3xoK1Hv4mu
 H2RcWjV/f5YexAZenmFG7Ea022xZFgyThiIeZBUSaP5s1CuhlF6Ic2zZ5
 q3oG5X/bHaCmKuU/HMB541mFfVJXaK3O0k+ZJpmbmt0UM8TYV+4B8yQNh
 Z3IEd12QSYU1D8RCvYgYGF4ZDn/1P4dFsIqJmTwAI+NnZKq+BcVPpMciC
 zz/zbPiXH4sbT8+SzypUKkes/fO1BPCuLnzvri3kgtsdAk+slxejUxOhz
 oYtdQ1o9tjVrFVQ0lDEVaRTS5VDrbps5bOYJYEGELWaf8B08EwrkhYXeU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="376317630"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="376317630"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2023 04:57:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10808"; a="770918633"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; d="scan'208";a="770918633"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 04:57:24 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 21 Aug 2023 17:37:26 +0530
Message-Id: <20230821120728.3871527-1-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC][PATCH 0/2] Add vram frequency sysfs attributes
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Adding vram frequency sysfs along with pcode helpers required

Sujaritha Sundaresan (2):
  drm/xe: Add a couple of pcode helpers
  drm/xe: Sysfs entries to query vram fused min, max frequency

 drivers/gpu/drm/xe/xe_guc_pc.c    | 55 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.c     | 28 ++++++++++++++++
 drivers/gpu/drm/xe/xe_pcode.h     |  3 ++
 drivers/gpu/drm/xe/xe_pcode_api.h |  8 +++++
 4 files changed, 94 insertions(+)

-- 
2.25.1

