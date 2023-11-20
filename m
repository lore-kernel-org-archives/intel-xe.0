Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE45C197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E0610E0FF;
	Mon, 20 Nov 2023 18:07:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51EA10E0FF
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700503645; x=1732039645;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ejZUn7Exsf+1oG9Wvi9WwIyVuxJLEe4xOqr3Da4X4cQ=;
 b=LrhOmevHMVVpK7Vowz9LhyYAMCYEXevM7FKHC9AocLA5dZ86aZkwbUg9
 F84+qAf+691aUzP1cLA3XAlLI+cTXMWLUAMfrkKJIIAkRrhMm8LDE/CN5
 AeU/cOqpJDZDRbtdAN+o8IBPNun6pvDdKsUXhRy3QPrLiO+9HLp9N3VaK
 cwfZHJzcJw6whgWUWt/9PBnuY5+Nsrq6+/UUDyIEefeAjz34DxQHN1DkP
 rjtJlh0IHze0t4QsIV5wJyV1/Z4SXnZjz1tpNgnNJTRRi23UAnkG1GR5Z
 KX/v4hau/Ivyl2LeVctJ4qJjpfljczZt0Eh1JOL97S7o6jOoCIYzue3zA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="391454535"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="391454535"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:07:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013665069"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="1013665069"
Received: from josouza-mobl2.bz.intel.com ([10.87.243.88])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:07:23 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 20 Nov 2023 10:07:16 -0800
Message-ID: <20231120180717.55182-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 1/2] drm/xe: Include RPL-U to pciidlist
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

RPL-U is defined as a subplatform but those PCI ids were
not included in pciidlist so Xe KMD would never probe device with
those ids.
This is following what i915 does to include RPL-U to PCI ids
probe list.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
---
 include/drm/xe_pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
index 68fbab161feb0..574a17c022490 100644
--- a/include/drm/xe_pciids.h
+++ b/include/drm/xe_pciids.h
@@ -119,7 +119,8 @@
 #define XE_RPLP_IDS(MACRO__, ...)		\
 	MACRO__(0xA720, ## __VA_ARGS__),	\
 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
-	MACRO__(0xA7A8, ## __VA_ARGS__)
+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__)
 
 /* DG2 */
 #define XE_DG2_G10_IDS(MACRO__, ...)		\
-- 
2.42.1

