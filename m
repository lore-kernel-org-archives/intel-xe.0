Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED72C87FD3
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 09:38:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D336A10E74D;
	Thu, 31 Jul 2025 09:38:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6qWCf5M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A1810E745
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 09:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753954705; x=1785490705;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XDmI/LBAXCno6fAIXnquKyTq4THGX00M+H7OaAgRWF8=;
 b=P6qWCf5MKr0J+RHgF64joGZ1e4s9xDxfS0ZLuY8IxZIX035ENPAX0xer
 jojDNgeYGw7kAhdgh45ujtW31Iyp6oGzyyTwynIww21DNACP1jVcIptHf
 KX9Om4kKBhgRPANr1XJBUPQYdQr5RKtKGnVuNd6FYBiJKlANlQQpgKr9Y
 +Q70+Jq52BNPY38ciUr9bHv4soXOJ76r3xcrgdFH732VYNQivpKDZ9zAT
 NnHSTjEnBjqW3yCcF2RjmHjWRaK2XmCw4e9t/MqjmJQivm1K2qGfJnIId
 U+pIap2k0UwdWLXTQuc3sVRO/mt3wfC5jzNaOkUEmtTcupLPaGatbeFlh g==;
X-CSE-ConnectionGUID: 98VFjkwiRcu8h7kTNSoaTg==
X-CSE-MsgGUID: QE6p4UMcRE+RkwIZ1DkgUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="43877055"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="43877055"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:17 -0700
X-CSE-ConnectionGUID: lJm6HSFgS+akkmlpH1pdyA==
X-CSE-MsgGUID: XtMWWcviQWaw/P5ZXW9TOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="194056849"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.250])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 02:38:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/3] Some more xe_migrate_access_memory fixes
Date: Thu, 31 Jul 2025 10:38:08 +0100
Message-ID: <20250731093807.207572-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.50.1
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

Some more fixes to hopefully to get this working correctly with eudebug testcases. Tested locally on
BMG.

v2:
 - Various improvements from Stuart.

-- 
2.50.1

