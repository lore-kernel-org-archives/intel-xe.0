Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EE3D25959
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 07:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FDF10E4CF;
	Tue, 27 Jan 2026 07:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGpId0IE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D7F10E468;
 Tue, 27 Jan 2026 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769500619; x=1801036619;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kcut6guFr00zsxykUjDT8Mj0PjupNBwTMjpR79v/ePQ=;
 b=OGpId0IEgFTR25vTy1fZY2c89uAGKXbFSBOEK4UG/QbsTpod9DUObqO0
 vkyyVDw2+X1yUzAImvg69ZazIKUsIHF0gRAbywBr3rQDNrBwmJSsrJOYM
 wbgoFHdjzHPY1T9BZa884m8RNFsasIMnCD8m0asRUo5woWYD7taBx86O5
 E2awwOXml6KMnSVDXOc291hSQgosLdprTw+D+K3ZRUcH0eKJ/fKyf8HX2
 dcmX9lqDc8/AeV3S44+HckcpWq8HvVQ2f+VJZQfM+i9SU45ronrWhboW3
 j8aJpjL7h1VKzcglEUPwpYfF6La3+ecpGKxx06rT4k6Cjzmw2ga+vCc84 A==;
X-CSE-ConnectionGUID: 0GPpNzGcQ1GkCo+7Lbv16A==
X-CSE-MsgGUID: 7pERr7TfTP+JRft20EdY0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81320947"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="81320947"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 23:56:59 -0800
X-CSE-ConnectionGUID: 6+vjITTeSom/7e1tXxc4Zw==
X-CSE-MsgGUID: mYp7+BWASNuG4ojCqwnUPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207026705"
Received: from mgolanimitul-x299-ud4-pro.iind.intel.com ([10.190.239.114])
 by orviesa006.jf.intel.com with ESMTP; 26 Jan 2026 23:56:58 -0800
From: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: suraj.kandpal@intel.com
Subject: [PATCH v2 0/1] drm/i915/display: Implement Wa_16024710867
Date: Tue, 27 Jan 2026 13:16:43 +0530
Message-ID: <20260127074644.991015-1-mitulkumar.ajitkumar.golani@intel.com>
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

