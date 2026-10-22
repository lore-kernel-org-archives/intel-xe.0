Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD35606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RwLajCeR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2727A11252F;
	Thu, 22 Oct 2026 12:09:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003410E3F0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670973; x=1824206973;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V/U/OMX1TQtf6oizQ+n+eAoGEgBNn2jJrpi+5OJJirA=;
 b=RwLajCeRa70nayhub1ri8W0VmoDdohu5Ze+WdnJgGV8tzkE1G89ntSyq
 NoKqgo5X2jSJHaEAE8hLD0mkZf9XXWHmtUBwOh7Y2qiI1pjcadbQ6xbWd
 EKrxT2CF/WegLUtcGhHxA6CvZopWO7n9YB6B/v/WZgKjwvcvcRTLMJM/m
 /vm3ir/nTSk/X3OekiZqGtQdIveKmL3eWMTzbkOA7BPEknSieODQ+3DJj
 x1uUekkWNUjxeW8xyCLqqFkY9rclADHZ+Yg514FubIjP7kAn7HSUnUqgM
 Vd8rloN3c23AMTGXQr3KktsnxLHSlDWPPrvHq3xRCzM1VMl1G8y25YiNx Q==;
X-CSE-ConnectionGUID: 9ohX+fq/TgGFZcpQZI5CuQ==
X-CSE-MsgGUID: MZc9kZ3vT3W7CGyZgQKlrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1452237"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1452237"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:33 -0700
X-CSE-ConnectionGUID: U5403gEdRwOxf3t3Z5UZ7Q==
X-CSE-MsgGUID: Qbw0L8RyRq6a+1qXQBt99w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3293735"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:09:32 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v3 0/3] Improve hw reserved PAT checking
Date: Thu, 22 Oct 2026 13:09:16 +0100
Message-ID: <20261022120915.138606-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This came up recently, where there was some confusion around the
!coh_mode checking, for hw reserved PAT index. Series removes that
completely and just uses pat.valid.

v2:
  - Update the kernel-doc to reflect the behaviour change in
    get_coh_mode().
  - With that we should then harden everything else and
    make this consistent. Add a new patch for this.
v3:
  - Improve is_valid() to return false for out-of-range (Tejas).

-- 
2.56.0

