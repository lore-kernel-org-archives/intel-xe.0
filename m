Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5FDC88E77
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 08:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D2B10E21A;
	Wed, 16 Sep 2026 08:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+fu89eN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18AC510E21A;
 Wed, 16 Sep 2026 08:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789547387; x=1821083387;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xvx/gwYUnM0bNcgmPpO0KJr34qy1+2LGndUC6rdzyfk=;
 b=h+fu89eNFF7MaWw4LS8+jTug+mj3kRjCQjtuC+qGKUZPBgsm4KHPSJCC
 t4dhwsyxB6Ucmrc2F+Qzt3AomNWYUm21/33KxX10v3unjFQzjceHRGbnV
 IK6R+ifwBh7mbu9SPcgip6y6D5iYZVO/n1yBV++R+NqgFDED8zlGkZCzM
 wdFH+fsgG4FonFXV8QunR0MjOym2zg0GbgP6ZTlu6GY+lAGjJfIGS3+V0
 fJ/jjLmJed4jvESVRDubd8Ztt6vsneFOOivULrpF7VykQKTprq/CDx2Wc
 igA55Un3QhDOy1OvpJyUFiKdozWb8V902M5aX7gS4YJDlPzS/7AP9b4eY Q==;
X-CSE-ConnectionGUID: GfHi23cRS3+hiy7YmV1eww==
X-CSE-MsgGUID: D9YxdOa7SHaTcYjI9X2R4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89858816"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89858816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:47 -0700
X-CSE-ConnectionGUID: Bsydz90WRg2ZgEE9hwddcA==
X-CSE-MsgGUID: 6yCp8dw3Rq6KjelyjRo3aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="277017926"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.147])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 01:29:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH 00/11] drm/i915/display: switch to modern drm_dp_dpcd*
 accessors
Date: Wed, 16 Sep 2026 11:29:31 +0300
Message-ID: <cover.1789547331.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Switch to the modern DPCD access functions that return negative error
codes on errors, -EIO for incomplete access, and 0 on success.

Jani Nikula (11):
  drm/i915/lspcon: use u8 variable to hold 1-byte DPCD reads
  drm/i915/lspcon: switch to
    drm_dp_dpcd_{read_byte,write_byte,write_data}
  drm/i915/alpm: switch to drm_dp_dpcd_{read_byte,write_byte}
  drm/i915/ddi: switch to drm_dp_dpcd_write_byte()
  drm/i915/lspcon: switch to
    drm_dp_dpcd_{read_byte,read_data,write_byte,write_data}()
  drm/i915/dp: switch to
    drm_dp_dpcd_{read_byte,read_data,write_byte,write_data}
  drm/i915/hdcp: switch to
    drm_dp_dpcd_{read_byte,read_data,write_data}()
  drm/i915/dp: switch link training to
    drm_dp_dpcd_{read_byte,read_data,write_byte,write_data}()
  drm/i915/dp-mst: switch to drm_dp_dpcd_read_byte()
  drm/i915/dp-test: switch to
    drm_dp_dpcd_{read_byte,read_data,write_byte,write_data}()
  drm/i915/psr: switch to
    drm_dp_dpcd_{read_byte,read_data,write_byte,write_data}()

 drivers/gpu/drm/i915/display/intel_alpm.c     |  10 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |  16 +-
 drivers/gpu/drm/i915/display/intel_dp.c       | 142 ++++++++------
 .../drm/i915/display/intel_dp_aux_backlight.c |  51 +++---
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  | 173 +++++++++---------
 .../drm/i915/display/intel_dp_link_training.c |  48 ++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_dp_test.c  |  57 +++---
 drivers/gpu/drm/i915/display/intel_lspcon.c   |  48 +++--
 drivers/gpu/drm/i915/display/intel_psr.c      |  65 +++----
 10 files changed, 326 insertions(+), 286 deletions(-)

-- 
2.47.3

