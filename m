Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3B5C77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 19:48:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579FF10E0BE;
	Thu, 11 May 2023 19:48:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3656D10E0BE
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 19:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683834523; x=1715370523;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WREKgzHWKWslkmtcPUqDgDGtz7UAwQWqH/9A3ffUn/M=;
 b=DDlzmsB6jpL6n4IK2S4Ii0R12DggDz7bkuVHXGtZjMcigY+LmfPuOjSq
 1h7mziXOmYobRy8uCrHFyhIyWv1IH7ivn3fXhs8kmkuHimK0/xTIxjO3b
 ziRMRBe/+ZcGIyO+uuoXc2HFuVf6Cm1dk9sWHDQZ3rN2A9IoiSoM957cI
 /RtUympGUWxQ6aZ4FhaBBWG8bNXUX5VJCL5L98wwTom371EHVvrDTZTHx
 0AiMhEDZeDAx+kVJ5A7I7SppxQ3fjjCAFaeJ2zlhUAQ993uEeS9w0vbQx
 bOlLbmu4QRugpUha1FWyxzSHBXPtl03agdqFSAcr8wAyzA+T5QEg5QyQo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="436948170"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="436948170"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:48:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789512306"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="789512306"
Received: from manojsix-mobl.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.34.137])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 12:48:41 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 11 May 2023 16:48:20 -0300
Message-Id: <20230511194822.626036-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/2] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a v2 of this[1] single-patch series.

[1] https://patchwork.freedesktop.org/series/117559/

Gustavo Sousa (2):
  drm/xe: Get rid of MAKE_INIT_EXIT_FUNCS
  drm/xe: Call exit functions when xe_register_pci_driver() fails

 drivers/gpu/drm/xe/xe_module.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.40.1

