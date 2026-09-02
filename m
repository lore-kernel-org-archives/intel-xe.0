Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C04C61DD6
	for <intel-xe@archiver.kernel.org>; Wed,  2 Sep 2026 17:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B217210F30B;
	Wed,  2 Sep 2026 17:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SxNjw49v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8246E10F30B
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 17:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788371818; x=1819907818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=stiBUFsWQCtFJiJoFmanBTzZx1owlAInYg7JoK99kG4=;
 b=SxNjw49vjPoK5pIEXPS16t5J46F8jiMCHUbbdtdAMMBBbLNKqScLnhTF
 z6+qBY5tGYpbUcnfVyLek5pn3ORPqXMe9hxpBhdt7u2Im7Fc1RbwzqH7R
 GzcklJ/J+FprpbzB/Y16ra9XeiKiDDBCU5dpOlepZuPumV03F3VOxgAP1
 /efKuHo2hSVp3MWRJPNT2ukcz6Xeny7h+hJesMCwB2b0O1LC9VJkskH01
 +WtA6jG6LZcmTbFmOsc1/us6QGmI3yJPJPslDIJu8xRD4PHHXjG0uN6bb
 tQqPUSUpxkLz4tqVvsPswbvmk8svE3iBREnlaKgWqBzf9asdQBwelme5u g==;
X-CSE-ConnectionGUID: BvkLZugKRk+P0mU3OpZzJg==
X-CSE-MsgGUID: d1aF7fUHTFq/Xw8wsreelg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="76393493"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="76393493"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:57 -0700
X-CSE-ConnectionGUID: xH5OoMTfRsiVwM1bvzh0Bw==
X-CSE-MsgGUID: nF6z1ZLAQ6WNBJcN4QfOCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="273638045"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 10:56:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH v2 5/5] drm/xe/hwmon: Disable memory controller and PCIe
 temperatures on CRI
Date: Wed,  2 Sep 2026 23:25:07 +0530
Message-Id: <20260902175507.3910573-6-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260902175507.3910573-1-karthik.poosa@intel.com>
References: <20260902175507.3910573-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Temporarily disable memory controller and PCIe temperature reporting on
CRI platforms.
 
The definitions and interpretation of these temperature sources are not
yet sufficiently clear, which may result in inaccurate reporting.
Disable them until the hardware interface and corresponding definitions
are fully validated.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 639fdb09ab3e..79a3f081ee9e 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1085,8 +1085,14 @@ static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
 
 		return true;
 	case CHANNEL_MCTRL:
+		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+			return false;
+
 		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
 	case CHANNEL_PCIE:
+		if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
+			return false;
+
 		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
 	default:
 		return false;
-- 
2.25.1

