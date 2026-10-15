Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D18DCC6B33
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 15:46:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF68510E5F5;
	Thu, 15 Oct 2026 15:46:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE9210E3AF
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792079167; x=1823615167;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5cS1zNfUjETyRuWGM+ekF0poDz3rmpmeBVSIgHD71ps=;
 b=KKWh/GC3+a5W8pkY3hmLaW/uRVSb5Fg+Ky93ODZqUeyJsMKx89ncBLl4
 M66ADZW16i1O8nWWjwytj4iPLIfpPMNGSLGGfdP38PEVDsM9yja+n3mfr
 PQJue5IVqTyE0oCCNRB+fEm2vcnCwZkRj8mxrr+BejtVYWPxLOEkjC+kv
 RMqo4jOGzQ5YlfNpck109kM/kkj5/bii8rIzGzejaUn3N05sinbvhQ8bx
 53/xV28bC1yLw9yC0ppYMMccRbasMvelbD1/68KodvFVow5FYzo1T/+2f
 GXiyqwQHXtSVpqTlOHtVHWZPTCvnH+W4MdSs7Q0DbtwvQ7NIxWPnYOb7C w==;
X-CSE-ConnectionGUID: FVXsrYQkTDmw7G0uGTn2QA==
X-CSE-MsgGUID: 9l5eEdrgSnqBf2P4HCNqYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="849782"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="849782"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:07 -0700
X-CSE-ConnectionGUID: tFSvKasCTNmbwQwyO/aVtQ==
X-CSE-MsgGUID: bQFI1n8nTJCPQqwBAK1AXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3474806"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 08:46:06 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] Improve hw reserved PAT checking
Date: Thu, 15 Oct 2026 16:45:54 +0100
Message-ID: <20261015154553.483229-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
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

This came up recently, where there was some confusion around the
!coh_mode checking, for hw reserved PAT index. Series removes that
completely and just uses pat.valid.

v2:
  - Update the kernel-doc to reflect the behaviour change in
    get_coh_mode().
  - With that we should then harden everything else and
    make this consistent. Add a new patch for this.

-- 
2.56.0

