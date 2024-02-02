Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E275C48291
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 08:39:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B2C10E0BC;
	Fri,  2 Feb 2024 08:39:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WagPBdKa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC9EE10E0B7;
 Fri,  2 Feb 2024 08:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706863198; x=1738399198;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SqLi7y2Ecscovmha3kJ/nWrjc1EvfH7q/cvixjCST8o=;
 b=WagPBdKa0ea2lYh9m2sUzeugcjyKql5aHSfNTl4HKxrI+mKY77SARCLS
 D99g8CT48DT9BeMuYi9hHAyRR4pWBEIGzotK+0qbsu23Qu70FbYku2RWC
 ITO30FcSaLfldkF294S8PYjt8le9DEoCbHkW9mUsJWPyIwbvY8AnXmUTt
 uXI2NrhXu+cQoqKKrQRGJs4gLOZMSlq8ukrRP1L8B+wyhEX6TWH+QB1GO
 zbV39WjmPxZUOjmkxnyPQlNZlvySu8RsgSSXGMGqudMtYKnSsmCCKNhYE
 1d9VoXz7dP8WH/HBR8EYmqthKy/KddqhrciPUleX3qS7M2qrXXW8bHwst Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="25562466"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="25562466"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 00:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="4635254"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa004.fm.intel.com with ESMTP; 02 Feb 2024 00:39:50 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: daniele.ceraolospurio@intel.com, chaitanya.kumar.borah@intel.com,
 ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/3] XE HDCP Enablement
Date: Fri,  2 Feb 2024 14:07:35 +0530
Message-Id: <20240202083737.1088306-1-suraj.kandpal@intel.com>
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

This patch series enables HDCP on XE.
Mainly includes rewriting functions that were responsible for
sending hdcp messages via gsc cs.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (3):
  drm/i915/hdcp: Move intel_hdcp_gsc_message def away from header file
  drm/xe/hdcp: Enable HDCP for XE
  drm/xe/hdcp: Add intel_hdcp_gsc_message to Makefile

 drivers/gpu/drm/i915/display/intel_hdcp_gsc.c |   6 +
 drivers/gpu/drm/i915/display/intel_hdcp_gsc.h |   7 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c      | 207 +++++++++++++++++-
 4 files changed, 211 insertions(+), 10 deletions(-)

-- 
2.25.1

