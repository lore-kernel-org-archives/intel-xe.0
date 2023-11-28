Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23872C4167B
	for <intel-xe@archiver.kernel.org>; Tue, 28 Nov 2023 20:32:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6446910E33B;
	Tue, 28 Nov 2023 20:32:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2A110E188
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Nov 2023 20:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701203536; x=1732739536;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HpcYmVOJd5thlgJ7FlC9AscIKanreAMmiVCcIdHJ/SU=;
 b=UNzimTC2pPYSXNPo9/J1Ma1tXHc5FFi5DYFeOgJfuAN+PSsBDfrIw10Z
 id0G1JzP0b6d1KGvzYRENxu7DyFlQImAPULQb5V2W+/KTx6D+wurhqmLF
 34WlaHFPNzZx0+z3TG2qln2LIMi3Yjycr82LYKPYGQFwbUf0jUBZ4pmsw
 gZ1kjNHVFSzqzvL1wFtpJGSysPoXsbY2vW51HdprefbIbvmc6tIEe57Pp
 gqmDdZQtpZAcyTG9iiKXr3m4kA5Vwq7SjM/RNkqXmX6i9C/o1NeE03h61
 yJoFRBIyjhKMF7zhA3Ui4EjS0KqNn78ypSTqKqMMMzuJ8iQ0BzYrPJPfL Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="424168784"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="424168784"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; d="scan'208";a="17038408"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.249.140.124])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2023 12:32:15 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 28 Nov 2023 21:32:02 +0100
Message-Id: <20231128203203.1147-2-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20231128203203.1147-1-michal.wajdeczko@intel.com>
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/3] drm/xe/guc: Remove obsolete GuC CTB
 documentation
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

Refer to already described CTB Descriptor and CTB HXG Message.

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 .../drm/xe/abi/guc_communication_ctb_abi.h    | 45 +------------------
 1 file changed, 2 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
index d34f91002789..3b83f907ece4 100644
--- a/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_communication_ctb_abi.h
@@ -120,49 +120,8 @@ static_assert(sizeof(struct guc_ct_buffer_desc) == 64);
  * is based on u32 data stream written to the shared buffer. One buffer can
  * be used to transmit data only in one direction (one-directional channel).
  *
- * Current status of the each buffer is stored in the buffer descriptor.
- * Buffer descriptor holds tail and head fields that represents active data
- * stream. The tail field is updated by the data producer (sender), and head
- * field is updated by the data consumer (receiver)::
- *
- *      +------------+
- *      | DESCRIPTOR |          +=================+============+========+
- *      +============+          |                 | MESSAGE(s) |        |
- *      | address    |--------->+=================+============+========+
- *      +------------+
- *      | head       |          ^-----head--------^
- *      +------------+
- *      | tail       |          ^---------tail-----------------^
- *      +------------+
- *      | size       |          ^---------------size--------------------^
- *      +------------+
- *
- * Each message in data stream starts with the single u32 treated as a header,
- * followed by optional set of u32 data that makes message specific payload::
- *
- *      +------------+---------+---------+---------+
- *      |         MESSAGE                          |
- *      +------------+---------+---------+---------+
- *      |   msg[0]   |   [1]   |   ...   |  [n-1]  |
- *      +------------+---------+---------+---------+
- *      |   MESSAGE  |       MESSAGE PAYLOAD       |
- *      +   HEADER   +---------+---------+---------+
- *      |            |    0    |   ...   |    n    |
- *      +======+=====+=========+=========+=========+
- *      | 31:16| code|         |         |         |
- *      +------+-----+         |         |         |
- *      |  15:5|flags|         |         |         |
- *      +------+-----+         |         |         |
- *      |   4:0|  len|         |         |         |
- *      +------+-----+---------+---------+---------+
- *
- *                   ^-------------len-------------^
- *
- * The message header consists of:
- *
- * - **len**, indicates length of the message payload (in u32)
- * - **code**, indicates message code
- * - **flags**, holds various bits to control message handling
+ * Current status of the each buffer is maintained in the `CTB Descriptor`_.
+ * Each message in data stream is encoded as `CTB HXG Message`_.
  */
 
 #endif
-- 
2.25.1

