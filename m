Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3604C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jun 2023 11:30:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C199E10E061;
	Fri, 23 Jun 2023 11:30:11 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F010E061
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jun 2023 11:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687519809; x=1719055809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fQSdf+X5/KwzYGFDB+pSR+JxiqWWBxbquRBMLdxMv5s=;
 b=n1XKdmcXb3/Niy9Z0B0RxiIZ6CfDlJWfS2qVa2OS8prhhaD8Tm5yDDCr
 +9tLU9k++bh3q9RXr6aOFRpKzYJAjLOTBc0excw0VtX48JlOaALzwsjpw
 faaWWmz8qfWvwWtACrVIdd+vT/x3TkMtsYCJifmT7NW7Q429bpFstdq5r
 T+ovYLicI8fR1tNakeGHvhmDt/PQOntbsMKZZUrF8BbjwG0P/Sbuwem7B
 oSNP0Wn0Ew4gi45NqzYzcV8i2MZwoA8fv/tauohxk6Lv1VwZTAgVxupTh
 s8a8ZZQIHXd5CRvFhjds8yPjjHIlSbZPexugXWZMCp1GVn/KkKZ4qvmEO Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="363298623"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="363298623"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 04:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="780594232"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="780594232"
Received: from aelizaro-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.24.92])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2023 04:29:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 23 Jun 2023 12:29:22 +0100
Message-ID: <20230623112920.147748-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230623112920.147748-3-matthew.auld@intel.com>
References: <20230623112920.147748-3-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 2/2] drm/doc: include xe_drm.h
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Make sure the uapi gets picked up by the normal docs build.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/driver-uapi.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
index 4411e6919a3d..79f255cf7b10 100644
--- a/Documentation/gpu/driver-uapi.rst
+++ b/Documentation/gpu/driver-uapi.rst
@@ -6,3 +6,8 @@ drm/i915 uAPI
 =============
 
 .. kernel-doc:: include/uapi/drm/i915_drm.h
+
+drm/xe uAPI
+===========
+
+.. kernel-doc:: include/uapi/drm/xe_drm.h
-- 
2.41.0

