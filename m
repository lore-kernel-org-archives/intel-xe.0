Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB0DBCF042B
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 23:27:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BFC10E611;
	Tue,  8 Oct 2024 23:27:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oa7cldOQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28510E606
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Oct 2024 23:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728430031; x=1759966031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v0FEHIgIQcMfJESjskM1XTDD85y6JvUwDcqDU65mDvw=;
 b=Oa7cldOQV7yixfiSj0qlGcHcoTH+1YI+f3b5z/2sHJ1MRqZvsG1dWUse
 2k5tLLHWsPv7ke+/+xYsHVLrwVSxRUyOshgyZxOynMYOKhz5QAk4VGE0P
 X5Mqy+na2rPvsy2i3pi4xb5YF8cQqxrNf9dKai0b6uiSpSBjl7QFWOLke
 nxAnhmDdfSVtG7G33WG2CyaKXiMb1fa5mrBr+K5U4uaFJiMhMW3GDOmCK
 SzBhfgpbz/TGn2IYb4fonLbznm/dBPuYUK8KxHlGLbB/5YNDDZWg65I10
 m8Cg1Iv9pbITqaDjwvj0q0u2AyHnoP6n0+iB1g2UiPDEEHLCeNgvCQgFE w==;
X-CSE-ConnectionGUID: gi+pDT03RTCo8YfHSqpzNg==
X-CSE-MsgGUID: 4eN9XtmbRK+66OYFYlTpWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="39077897"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="39077897"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 16:27:11 -0700
X-CSE-ConnectionGUID: Rga93bTrSsuI+quTd8Y8jw==
X-CSE-MsgGUID: IxK5R+lERX6GJaIoLdAxmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; d="scan'208";a="76382141"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2024 16:27:10 -0700
From: fei.yang@intel.com
To: intel-xe@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
	Fei Yang <fei.yang@intel.com>
Subject: [PATCH 0/1] drm/xe: enable lite restore
Date: Tue,  8 Oct 2024 16:30:58 -0700
Message-Id: <20241008233059.125021-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

The lite restore feature is supposed to be enabled by default.

Fei Yang (1):
  drm/xe: enable lite restore

 drivers/gpu/drm/xe/xe_guc.c      | 2 ++
 drivers/gpu/drm/xe/xe_guc_fwif.h | 1 +
 2 files changed, 3 insertions(+)

-- 
2.25.1

