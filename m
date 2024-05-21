Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BABFC25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 09:10:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC1F10E132;
	Tue, 21 May 2024 09:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKhxS3o6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BCE10E7E8
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 09:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282611; x=1747818611;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=f8KI9oAXd52Bzt7ZyECh8x73ZkjY8mGKkk101uqIRNg=;
 b=AKhxS3o6q5KOCIcB/CkCEJQ7QMMf/lA11C+ZPR1VXqEJS7IKnVWRvFmQ
 wCqLJU+S+5BUNFfzSRPjX9CsfT0AICT+8FcC0QCmJsB1PihlTthZq75xk
 1JCySypQ+dQ4AfTB4o8ki/EGH2AmEaB9JTlaZ9/FeKG7jVLfHPFJXfBd7
 xUlPFl3n5m1JAcwsy+KsLlsJUwSH9g5yJULG64EA4tjXmsZ+NRJV6z6kL
 LvkXspIreJAWOxYHCHX5oEPzxwSmonIwOeGi8Fzgt3mfJOZZWfZQ4kCRZ
 K9hCHH7s3bLUIMuLOF91lYTVAtPQnxwwWTS6fpXysk41AStPz/tGAlf1e A==;
X-CSE-ConnectionGUID: slDDXIdtQluN8tbZt9P3mg==
X-CSE-MsgGUID: HEzEOuScTkiEOCL08zwbww==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="23130746"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="23130746"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:10:08 -0700
X-CSE-ConnectionGUID: gGAMvocfQFOy1UQ0YdKwEQ==
X-CSE-MsgGUID: spcN8h04QtmctHHQJs8NRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="33018228"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:10:07 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 vinay.belgaumkar@intel.com
Subject: [PATCH v2 0/2] Enable Coarse Power Gating
Date: Tue, 21 May 2024 14:51:59 +0530
Message-Id: <20240521092201.4183305-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
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

Enable power gating for all units and sub-pipes that
are disabled by default.

Also standardize power gating registers

Rev2: re-phrase commit messages
      fix review comments

Riana Tauro (2):
  drm/xe: Standardize power gate registers
  drm/xe: Enable Coarse Power Gating

 drivers/gpu/drm/xe/regs/xe_gt_regs.h | 10 +++----
 drivers/gpu/drm/xe/xe_gt.c           | 12 +++++---
 drivers/gpu/drm/xe/xe_gt_idle.c      | 43 +++++++++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++-
 drivers/gpu/drm/xe/xe_wa.c           | 10 +++----
 5 files changed, 60 insertions(+), 19 deletions(-)

-- 
2.40.0

