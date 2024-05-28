Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C94C41513
	for <intel-xe@archiver.kernel.org>; Tue, 28 May 2024 12:34:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 254E710F199;
	Tue, 28 May 2024 12:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kFPBIWrQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B07F10E334
 for <intel-xe@lists.freedesktop.org>; Tue, 28 May 2024 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716899654; x=1748435654;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=RKIfLUoCTTU00EjWp6JDdyOC2yyyCd7dhE8FjAQTsP4=;
 b=kFPBIWrQJnLDT9UXCSAmh49ovQ4Fx31QH8ac+FDmJSwcfH+dVxGt9Vhy
 x+a3PBtiraAvNbCWI+EZ1sb1LOJq9NDk4rFN9DTgTFq1wPv9H/EWiJxC6
 JVm27c5fAmb81Tw1m7/r2jKXBVyJYdCzdMn1b5lUj3v1k3y/Dz3cMw4V8
 lXPex24wmtijnfeAH9lQS09wjO1BQmeZ8HXdNlyUHo7CcTqTSG46zfLIf
 o3lC859evFSajnszo9Z4e8R9jCkLlHj18JnLOJVMCkLIctqrIaDfK+btU
 ElPW2sf36hFodk1+h/rzSnezW6kOqPP+XafIIGieDJE1a2MO75lCRUw9J g==;
X-CSE-ConnectionGUID: /ihEEMKxS2276wmDkrW1Uw==
X-CSE-MsgGUID: zbFosrddTm+Q8Weq14bFJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13065059"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="13065059"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:14 -0700
X-CSE-ConnectionGUID: MPILNn+TRtusmDGodNacLg==
X-CSE-MsgGUID: eQhZOz/lTG+3AYptwBIMSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; d="scan'208";a="39880510"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO fedora..)
 ([10.245.244.233])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 05:34:14 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [CI v5 21/22] HAX: Add a missing include
Date: Tue, 28 May 2024 14:33:42 +0200
Message-ID: <20240528123343.169970-22-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
References: <20240528123343.169970-1-thomas.hellstrom@linux.intel.com>
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

Add a missing include that causes xe CI kunit failures.
---
 lib/iomap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/iomap.c b/lib/iomap.c
index 4f8b31baa575..a296303b833d 100644
--- a/lib/iomap.c
+++ b/lib/iomap.c
@@ -6,6 +6,7 @@
  */
 #include <linux/pci.h>
 #include <linux/io.h>
+#include <linux/iomap.h>
 #include <linux/kmsan-checks.h>
 
 #include <linux/export.h>
-- 
2.44.0

