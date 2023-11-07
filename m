Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EBEC4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 16:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4AA10E614;
	Tue,  7 Nov 2023 16:16:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAD810E614
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699373775; x=1730909775;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z+tSTRNt5zzIfF+FkLXbCb6UIuSSMbTaSVKlSbsSbIo=;
 b=n2fdPHqYIDnbbKfp40MBd0Oid4/AA7SPIWPqMIw+EAYHFRZ3aODrEpEi
 ymmgqxOj79YX73sBTgHH/AAgcDdBNtej51y18TcOAsMPXALnkpNHxX4nO
 hPdp3Cyj+1ZlQzQlOLCyh34XdQaGqD/+fPh3rC7dNmIb1iABOIl/TBtIW
 LKyaWS/7Vg2f4g0Dr2NuOh8E8Npi2iZ5hx3XDClSOHcVNh6DAoJ4lzOlI
 5gcOCOaBpvTEcjiKQnqF6YVZsA5ic9cOMXLd+DVJW9Rs2Nupmkr4O4ogV
 kL01y20I0aPN9RjWA+sFsmNQSIpiBczKodCpxOu9z2i/mFeQ5qQdpmmnh w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="386719715"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="386719715"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="797709667"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="797709667"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 08:16:14 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue,  7 Nov 2023 08:16:18 -0800
Message-Id: <20231107161623.135419-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] xe_guc_submit style cleanups
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

Noticed a few issues, mainly old engine nomenclature. No functional
changes.

Matt

Matthew Brost (5):
  drm/xe: s/ENGINE_STATE_ENABLED/EXEC_QUEUE_STATE_ENABLED
  drm/xe: s/ENGINE_STATE_SUSPENDED/EXEC_QUEUE_STATE_SUSPENDED
  drm/xe: s/ENGINE_STATE_KILLED/EXEC_QUEUE_STATE_KILLED
  drm/xe: Fix alignment in GuC exec queue state defines
  drm/xe: Replace engine references with exec queue in xe_guc_submit.c

 drivers/gpu/drm/xe/xe_guc_submit.c | 46 +++++++++++++++---------------
 1 file changed, 23 insertions(+), 23 deletions(-)

-- 
2.34.1

