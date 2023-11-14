Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE87C4167D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 10:14:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCD510E1F2;
	Tue, 14 Nov 2023 10:14:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB8210E1F2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 10:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699956845; x=1731492845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u05kUvN+yAfDdXI2QKGLoiNXnlaVTRU1zJvK+Z7HCwY=;
 b=dDFGDJT66u9zsgFsAy4/ub2kYzJ2rmV0eK9VQRRF/9xPR6Re0DnUSa1c
 TOM7GeyDwRqH8+0Qqp+wfIaeVTZ2gU8tu0Ztg5c0tcbA7rEYHb5irlKUM
 S31qvmtb6ZSpFZxWdor/Ga4RQqjAMLnORcTu4KWFXXEoDz/63/3T819kX
 gggbx5Qy5z44eN+O4zuu85DJaJ3xYOA9gc+uViDopi+ue1E5Fw4WJOIkb
 Zk9obABIlxvoeWC7S1viMLM1qTWApccC+aLD+x5S/ISf0O+hFOOksNsib
 iwqzisRC2a9W+1HZ1L+Lry6sErAz1Tvh5H8VBXw7TTdIIocNbuqQL9a9N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375669105"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="375669105"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:14:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="5974164"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:14:03 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 14 Nov 2023 12:08:42 +0200
Message-Id: <20231114100843.1923977-5-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114100843.1923977-1-alexander.usyskin@intel.com>
References: <20231114100843.1923977-1-alexander.usyskin@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 4/5] mei: hdcp: add dependency on Xe driver
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Optionally depend on either i915 or Xe drivers.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
---
 drivers/misc/mei/hdcp/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/mei/hdcp/Kconfig b/drivers/misc/mei/hdcp/Kconfig
index 54e1c9526909..2ac9148988d4 100644
--- a/drivers/misc/mei/hdcp/Kconfig
+++ b/drivers/misc/mei/hdcp/Kconfig
@@ -4,7 +4,7 @@
 config INTEL_MEI_HDCP
 	tristate "Intel HDCP2.2 services of ME Interface"
 	select INTEL_MEI_ME
-	depends on DRM_I915
+	depends on DRM_I915 || DRM_XE
 	help
 	  MEI Support for HDCP2.2 Services on Intel platforms.
 
-- 
2.34.1

