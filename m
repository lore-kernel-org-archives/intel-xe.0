Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB88C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 19:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2474910E51E;
	Wed,  2 Sep 2026 19:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZbVgX+pd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDAF10E51E
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788379137; x=1819915137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cGJkr0Wr6XrmhzgRuP4KtvFA9c2JakHzgUp09RkKiY4=;
 b=ZbVgX+pdyJOaK8T/XdMp51BUNByVCcnu8FCvyx4Ij64hX0bV80pAUX/w
 5j01OGXx6qqf8dNwJOqUjRUx1c7iRF37BFyRMClbmgLzew9TtIaX5IuqV
 5xSMdsN8ZZvXBFmTnIt27DyLTK+E9s8r7/clRhD9UtFzCpiodzGG5Aa34
 5zKEMpHymlzLdl8G8xKLWAU+9yjUdCKLYU9NlzE4sL5BzjYln6s0hm25I
 e/qSvgGyyUjq7Qe977/j/ME7FCNsxKHpUKzH+LImAgpgOwi78NXIImAPX
 3rxEsmVXYPWYdlgogtAmkz9laYhUC9gQCdGeT6f5lDU3vVJNmAI8IkR0/ Q==;
X-CSE-ConnectionGUID: StQNh/FTQb2P+6MPWfpnBw==
X-CSE-MsgGUID: gOkf20YEQPmNfezcdXKpeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106216464"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106216464"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:58:56 -0700
X-CSE-ConnectionGUID: +AjyPnj4QgGAwJV5xhEmGw==
X-CSE-MsgGUID: 2BIQGVDITmie0WRRH3pFvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="266265674"
Received: from osgc-sh-dragon.sh.intel.com ([10.239.81.44])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 12:58:54 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: alex.zuo@intel.com, jonathan.cavitt@intel.com, michal.wajdeczko@intel.com,
 raag.jadav@intel.com, andi.shyti@linux.intel.com, jani.nikula@intel.com
Subject: [PATCH v6 0/3] drm/xe: Refactor I2C and HECI error messages
Date: Thu,  3 Sep 2026 03:58:48 +0800
Message-ID: <20260902195851.306669-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.53.0
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

Update xe_heci_gsc.c and xe_i2c.c to use the xe error reporting helper
functions in xe_printk.h instead of directly calling the associated drm
print functions from drm_print.h.  While we're here, we should update
the error messages to print the error codes in a more friendly way.

This necessitates creating a new helper function - xe_warn_once() - as
drm_warn_once() currently has no equivalent helper function in
xe_printk.h.

Jonathan Cavitt (3):
  drm/xe/printk: Add xe_warn_once()
  drm/xe/heci: Use xe print functions in xe_heci_gsc.c
  drm/xe/i2c: Use xe print functions in xe_i2c.c

 drivers/gpu/drm/xe/xe_heci_gsc.c | 21 ++++++++++-----------
 drivers/gpu/drm/xe/xe_i2c.c      |  6 +++---
 drivers/gpu/drm/xe/xe_printk.h   |  3 +++
 3 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.53.0

