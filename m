Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF5AC83F2C
	for <intel-xe@archiver.kernel.org>; Mon,  4 Sep 2023 12:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0D710E1D4;
	Mon,  4 Sep 2023 12:38:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF2A10E1D4
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Sep 2023 12:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693831105; x=1725367105;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qUNvPcScarXaxHGad+Qg7GH2/FPL2tdN6DA/2K7YC+g=;
 b=mESLDYCvE6rwBJo/AO+Y0boNrvXNWlhK25QHXi/UfG3Hutr4B8eaOWb/
 vbk6Q6xu++AkK8VDxhkKsyDj7hif2FWbmDTiJKJz/AxHi0RYOUcmm0TGZ
 +uz7ggWUTatdTTslvTkdNV9bYobCwEpVuBEobZXNKEaXOhpFVLsw0dvph
 JthK4Lp+3S6DPgCoO4YUEE8shdxQdBWvbFMgXJbmzQ7EcGgEr9kO09PyQ
 RdfuzRJUKciy+PTenKwpSS4bsSYoFNdRbp+/G2Avy2EYDVE3zOV8WAHpB
 uCcUIohohO1GXe9uiITqX65wih6YbitEMLsQfHwtl6Duxew1qGibVxUNS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="442986862"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="442986862"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 05:38:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="717538233"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; d="scan'208";a="717538233"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2023 05:38:22 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon,  4 Sep 2023 15:36:04 +0300
Message-Id: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC PATCH 0/1] [UAPI]: Make bind op extensible
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
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

There is a need for eudebug to add metadata per vm bind operation.
For example, during mapping to associate the bind with particular ELF/ISA.

Suggestion is to add an extension capability to vm bind operation to
accommodate this and future needs to extend.

Now we grab the reserved field. Another option would be to just
add extensions as a first struct member.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Mika Kuoppala (1):
  drm/xe: Extend drm_xe_vm_bind_op

 include/uapi/drm/xe_drm.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.34.1

