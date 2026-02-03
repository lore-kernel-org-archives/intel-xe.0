Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B92AE8305F
	for <intel-xe@archiver.kernel.org>; Tue,  3 Feb 2026 08:56:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A78F10E158;
	Tue,  3 Feb 2026 08:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHXQgAaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC3110E147;
 Tue,  3 Feb 2026 08:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770108970; x=1801644970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcut6guFr00zsxykUjDT8Mj0PjupNBwTMjpR79v/ePQ=;
 b=CHXQgAajKCviw5evzMTri5gnvQbkLVYdZmSznToBDSzdYzO1pESdh2Xi
 i3+5/u0gOOLHe/VgEb14mnDzl2FWjdEFUQ3GUkmz8b2MoXJZGd/42Aypf
 KnI5PrkmU6JntimT4I9zFOdBtEPm4d26+fJNlWH4AP6+li/Livkz0YNHF
 PK5Erc4KMALVFtQk5pLJIA2ldI0dchTtiSG3ZfZTVSaOddcKJUzKYQTMJ
 f3OWfxNCkzYa2s856S1fKIHQhd2UfK/PSyukrb3UqtLh2cs8X60R/2auU
 2NIjLqbB0quFu1GFpgNMEdxHkgcxUxpF/gslQCqxiYHT9LQo6auY6ZUPH w==;
X-CSE-ConnectionGUID: x/pPXwfXSby/tbjqMOFFJQ==
X-CSE-MsgGUID: WkC4JcZRSfKXpaUg2GV0rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="75131566"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="75131566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 00:56:07 -0800
X-CSE-ConnectionGUID: b/lWsNdbRbefnk+h8FV96w==
X-CSE-MsgGUID: 3R+kbWvFRkagYQpkpUTH2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="208888152"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa006.jf.intel.com with ESMTP; 03 Feb 2026 00:56:07 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v3 0/1] drm/i915/display: Implement Wa_16024710867
Date: Tue,  3 Feb 2026 14:15:56 +0530
Message-ID: <20260203084557.1447691-1-mitulkumar.ajitkumar.golani@intel.com>
X-Mailer: git-send-email 2.48.1
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

Defeature port sync feature for xe3lpd onwards.

Mitul Golani (1):
  drm/i915/display: Implement Wa_16024710867

 drivers/gpu/drm/i915/display/intel_ddi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.48.1

