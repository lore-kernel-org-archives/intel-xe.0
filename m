Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F22C6FD1D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Apr 2023 02:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C9710E0CF;
	Wed,  5 Apr 2023 02:40:34 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AE810E077
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Apr 2023 02:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680662432; x=1712198432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3EYjFqxaS1t7RejWytH9z6LhGl12EN1N0YrL92vulLQ=;
 b=c3G2siu0yWbUGfC5Z+Ja7Rwa6XQJjM3+c5otpcT0dpwRQdHf9I30X7WY
 R3GY8pFtdAPAcXfoBn2YTaOrUDjTgOK+BhrH4gudIVCLuHmMCv779qBFE
 OmR1pW/MqucCxUOws1KWrBUrEFXB8akQnXG66Mg5IedgxkVnu8wrTcNws
 qlzVxKWADMkOaqWm+0RM4lOMGZyMnmf33x/f1tWXgmR+RaWErmNQ2VNGQ
 ODCY5QQXuJSPo4j6UDCebAPJAOfx2J7WUtTwZYR8RHnUXYgNQWfwPPRi8
 7EsFi4ZR++gLiKN6CICUlwmE64M6LCBbZw3Dk812QjhSQ0/9vqVRVRzEy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="370175218"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="370175218"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:40:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="719159707"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="719159707"
Received: from lstrano-desk.jf.intel.com ([10.24.89.184])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 19:40:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  4 Apr 2023 19:40:34 -0700
Message-Id: <20230405024036.3969996-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] Fix driver load
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

Looks like coalescing GGTT invalidations is causing issues with the
driver load, just disable this feature during driver load. Also add
module parameter to disable this feature for user space too in case we
suspect this is causing user hangs. 

v2: Initialize module parameter to false

Matthew Brost (2):
  drm/xe: Always invalidate GGTT on map during driver load
  drm/xe: Add always_invalidate_ggtt module parameter

 drivers/gpu/drm/xe/xe_ggtt.c   | 13 +++++++++++--
 drivers/gpu/drm/xe/xe_module.c |  4 ++++
 drivers/gpu/drm/xe/xe_module.h |  1 +
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.34.1

