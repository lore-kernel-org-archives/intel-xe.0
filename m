Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C6EC83F3E
	for <intel-xe@archiver.kernel.org>; Tue,  5 Sep 2023 19:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8F510E4EB;
	Tue,  5 Sep 2023 19:50:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C62210E4EB
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Sep 2023 19:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693943404; x=1725479404;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jLRwTsgcVzXzrl5klSe4KfNW33BviPf5Q9cUqhKc8Qw=;
 b=JdzaQYBZPQj+fIuE7T5sU0Um8zvmpNi3mDvKos3uWrbpVOk/oXtA3ju5
 OG+ULlvUfMqTc7Lxgp77O+skXpGFkQMEa+8CjI/K0yvbgqaqZ1CjRtL0i
 A+ukS1823/tfRNSqZtDExNrI9lAoMgOJvTgHOKpXfyRoq1yH97naoXg4g
 e7SXmW9Mr0tKJihwizXEk62isK+LpfIQ0OF3Cx4OfDQnMFXU/AhqxdqI6
 eI3Qfaq9ghUjUrQ15xEgfqmEGkTP7QgoeEU6TBLVsh8oPRgJfPlvtUmWp
 DrhhKdWvcVts9snXMmFO0nPGiQ/ys89GaDBUvffljbtcbphbsweIXoN2n w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407882802"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="407882802"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:50:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="914990526"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; d="scan'208";a="914990526"
Received: from mmehlitz-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.252.60.158])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2023 12:50:01 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue,  5 Sep 2023 19:49:41 +0000
Message-Id: <20230905194942.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/1] Use acpi_target_system_state only if
 ACPI_SLEEP is enabled
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
Cc: Francois Dugast <francois.dugast@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

v2:
 - Add build error message to commit message (Jani Nikula)
 - Move acpi_target_system_state() call to static function (Rodrigo Vivi)

Francois Dugast (1):
  drm/xe/display: Use acpi_target_system_state only if ACPI_SLEEP is
    enabled

 drivers/gpu/drm/xe/xe_display.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

-- 
2.34.1

