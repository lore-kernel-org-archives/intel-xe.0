Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5EB9CDB484
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 10:12:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7E710E18B;
	Mon, 16 Oct 2023 10:12:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7716B10E18B
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 10:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697451150; x=1728987150;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rr85rtUNzYvEqqOYLfdce29MXk63ivW0USLQ+0huAxE=;
 b=I2+gvCgqTuecH9ud315vlcWsNEPk2q9w8g2a1M5k96gqhMgpi1I08AJL
 ETBLZO7QMOUijPRYtPLklGnqQNn+OBknswm1R9SfvgVNZOxvrVk5E/NJc
 UztxuexRjQXn+9VWV5sguLbTdVbG/tdKxCkx343KRXnGBSBVO03HPG6HE
 MArL+l49ALVtx4ceHfLJWbUB1o1AQ8It9FVM9mpUp97Z1CYCoVgoKhChi
 4jxMNcubCsn0lCodvhfkCJaFJ3x+Mm01jME9QZgLtpkyxHFdFywMW+9sY
 Ugefdz5cwLSjj2cW44IUBRqVFKcZQtZ8wJp8V2BWoGgKxCWtLwtyP5JXD g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="416560445"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="416560445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 03:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825948504"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="825948504"
Received: from bvivekan-desk.iind.intel.com ([10.190.239.116])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 03:12:29 -0700
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 16 Oct 2023 15:47:18 +0530
Message-Id: <20231016101720.1657746-1-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] Event tracing for GuC CTB
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

Add event tracing for GuC CTB.

Balasubramani Vivekanandan (2):
  drm/xe: Add event tracing for CTB
  drm/xe/trace: Optimize trace definition

 drivers/gpu/drm/xe/xe_guc_ct.c |  13 +++-
 drivers/gpu/drm/xe/xe_trace.h  | 128 ++++++++++++++++++++-------------
 2 files changed, 91 insertions(+), 50 deletions(-)

-- 
2.25.1

