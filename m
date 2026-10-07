Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56B1CA6002
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 15:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DC810E5A4;
	Wed,  7 Oct 2026 15:36:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcFMTDIh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4211410E4A3
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Oct 2026 15:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791387408; x=1822923408;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1WVlRdV61v6X+LXBDGtTEiRRHn0y6ps0H0P0rraz5oE=;
 b=TcFMTDIh7TeQXULydykarJ5GEa++1Za5d/Wso7eMpRGtkNclONOVggFW
 YkmBMExPHrNfOmHzzaiukZV1IDbTt8d0VIjO6VMNCT+UQj3/tR9D3lCyw
 YodPOKx9jk291gQklh7ePW3E/oARj5l4/DcjHhastdRGfU+8PwNW10l/h
 aTmj3jws9DdTIQOPCEac4BRVV/RANikTx8n5d7vLP5HRoUPATQyLMdagc
 KZSx8skcNR6ItkQ12PwQYndwiRulFVlY7q3P+S8VI8cTqF4oOwbrP6hsO
 iMrkEL6HtF/8VLgjQIIMFLtyEmhsn42afwPOJfj/kDHNfw8IQJDQ6TtsY w==;
X-CSE-ConnectionGUID: A5qE2mQJQMK/z6xUtdqb7A==
X-CSE-MsgGUID: 3c3cxpYWTw+AkLTpiyY03g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="148781"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="148781"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:36:48 -0700
X-CSE-ConnectionGUID: TDjOmQDdSe2mt0kztHEH2A==
X-CSE-MsgGUID: QTF4SzQ/TNaFKCqUaTZ7kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="277583508"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.246])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 08:36:47 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] sticky TT
Date: Wed,  7 Oct 2026 16:36:06 +0100
Message-ID: <20261007153605.1743626-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Try to fix user reported dma-buf perf issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9415

v2:
  - The plot thickens: yes we can have ping-pong, but also p2p itself
    for the window buffer shared with the compositor, which is killing
    perf. Add a new patch to try to workaround this.

-- 
2.55.0

