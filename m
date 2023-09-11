Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C23EC71153
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 19:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C6810E1B8;
	Mon, 11 Sep 2023 19:47:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883B010E0FA
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694461648; x=1725997648;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dAQT4vRmeJvD3E5Jdx0s/9wK/Giu6ia8X8r5YOqiI1U=;
 b=NLlgv9Gn4NAUW2+iWZnYOp3RjzR+Ow2GnYuuN+4whyKrYp9U34tEUtRC
 vFRnk92qJlTpo0nJp2CU8dc/AoeuleRkM+CKfYETIIiAgkp7Fe5uXhu63
 64GxIA+Wy8ueYoIXOMsON2H2EiJLVbj3PSvMNQkC9GVl65JGytqx3cmNJ
 EwqIAu8wSA5A59Bk2tJLwkoqZA/DlmSCGMFJmBbAbZah7Nj/iDh+4n3mg
 HKv5mfkCVsyScDWUh1Rr9HJwH04T657Qj2S51NR39OU+EDThLb2USfgfq
 LtkIN4jahVYt0ZoFM6kUlGDY9mBS+ZUzmLI0YIEF4TQ6+G7H6YQx+YN30 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="380890291"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="380890291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 12:47:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="990236489"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="990236489"
Received: from swedhana-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.33.188])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 12:47:26 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 11 Sep 2023 16:47:11 -0300
Message-ID: <20230911194712.34387-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Turn display finalizers into static
 functions
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Finalizer counterparts of display initializers are registered with
drmm_add_action_or_reset(). Since there are no other explicit users of
them outside of xe_display.c, let's turn them into static functions.

While at it, since this is a fixup patch, also do other cleanups
suggested by Lucas:

    * s/xe_display_modset_driver_remove/xe_display_driver_remove/

    * Remove the unused xe_display_enable()

    * s,xe_display_unlink,xe_display_fini,

      The original suggestion for the above was to replace with
      xe_display_shutdown, but I went with xe_display_fini to be
      consistent with the other "stepped" display finalizers.

    * Group functions in the header by namespaces.

v2:
  - Add more cleanups. (Lucas)

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Gustavo Sousa (1):
  fixup! drm/xe/display: Implement display support

 drivers/gpu/drm/xe/xe_device.c  |  8 ++++----
 drivers/gpu/drm/xe/xe_display.c | 10 +++++-----
 drivers/gpu/drm/xe/xe_display.h | 33 ++++++---------------------------
 3 files changed, 15 insertions(+), 36 deletions(-)

-- 
2.42.0

