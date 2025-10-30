Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F4DCCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 15:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB58D10E9D5;
	Thu, 30 Oct 2025 15:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cssF1v0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74DB010E9D5
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761837068; x=1793373068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jE+mtXYh80UGWPNtcS4VHKUXhj5asoU2eMsOWsab89Y=;
 b=cssF1v0AAZqMUYkoDbnUOhGtBh6lErSajspLrQg342nQ2BxrytxnsVpH
 2lgw63rahHqtnA0oMZhha4BNmfzAUH0y5JiJY0s1PtA/y+unwYX/41zmg
 9uKIxyc6i66QpCXTGuZxA7HJBYuyt2wnhPHF0nLfAAo8yOsjBBVLLC6YC
 uwQM3FigJvWOl42j5xk3RH2ea5HA3enmcz/ANrkvTYjdT8DxFzebRdZ7L
 EctUiTSxeZVH6BRhsGJCPaKoSTw2v0UafXtNzbFkhKjElXAK6vkeP8Q4g
 AlhQg1PkuQAEpKo+CDB388+tpOJGUPdON5CvaCpNXZMkODh5k3GKKephv w==;
X-CSE-ConnectionGUID: wQqUM05ESLiaR+jrLkfIKQ==
X-CSE-MsgGUID: CyIWYNoOTdiBRCGpyE9Ekg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="89448427"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="89448427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:08 -0700
X-CSE-ConnectionGUID: 4os79ftVQbOgUnL/1v1jhg==
X-CSE-MsgGUID: E7+aqHniQWqZz70AWMUHdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="185638985"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 08:11:07 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH v2 0/2] Fix user-after-free during driver unbind
Date: Thu, 30 Oct 2025 20:41:23 +0530
Message-ID: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
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

There are a couple of worker threads in the driver which could be                                                                                                                                                                                 
running while unbinding the driver. Ensure those threads are stopped                                                                                                                                                                              
before unbinding the driver to avoid any user-after-free from those                                                                                                                                                                               
workers.

Balasubramani Vivekanandan (2):
  drm/xe/gt: Synchronize GT reset with device unbind
  drm/xe/guc: Synchronize Dead CT worker with unbind

 drivers/gpu/drm/xe/xe_gt.c     | 2 ++
 drivers/gpu/drm/xe/xe_guc_ct.c | 3 +++
 2 files changed, 5 insertions(+)

-- 
2.43.0

