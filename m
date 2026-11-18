Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79505606A32C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 22:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YjugnXSe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3875310ECCF;
	Wed, 18 Nov 2026 22:30:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B9111209C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 22:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795041031; x=1826577031;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4zGIZsdmuPzvRgSJ4qawFG5d4oixYPrNtASyWnLjLpc=;
 b=YjugnXSefIhETDonqLMAoMQKkMNLxQOV5U81KoLYT+LbQ/F5h4hUnhTB
 vt9rb3R+YYs39QNkJRMiJPJuJq3jhZjigbVlKKh6YX9wBrODW/iWcroB7
 nPZPmCH4LkLTz/V1SVEDmZZVgJzLms5b9yFv946S+Zab49B7cz26qbsF2
 n0sD/XlWKbb3YWlMS/RfGwRUVRMFs24nswvbN6KuZj4HMd0kIie1yCSiS
 7+rXry9vR/YWOPeu/NGolE0DBiSh4mm1SC9trL5KzLoW68ALOoGYhrHLe
 NNUP9nL4CBDJVQJ43Ay0aTbRwzzPVmvZcEzFHDS952Ppc0cjKXnASJIyq w==;
X-CSE-ConnectionGUID: k72CE9T0QL2EKEgOvgO9pg==
X-CSE-MsgGUID: WhdP+nF4TqWXT7BSOCACeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3758834"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3758834"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:30:26 -0800
X-CSE-ConnectionGUID: b8LnhNXSTvaKsoDPcsocAA==
X-CSE-MsgGUID: 6fQ3npixTQWzEj2o4eUH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10655814"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 14:30:26 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: driver-core@lists.linux.dev, bartosz.golaszewski@oss.qualcomm.com,
 balasubramani.vivekanandan@intel.com, intel-xe@lists.freedesktop.org,
 heikki.krogerus@linux.intel.com, dakr@kernel.org,
 andriy.shevchenko@linux.intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/1]  Add a shared software node test case to driver core
Date: Wed, 18 Nov 2026 22:30:22 +0000
Message-ID: <20261118223023.19653-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Original patch was posted here:
https://patchwork.freedesktop.org/series/177785/

This is just a resubmit with a fixed up commit message and this
cover letter.

After dropping that assisted-by tag, just a quick note that I did
use claude opus in the development here.

Stuart Summers (1):
  driver core: platform: tests: add a shared software node test case

 drivers/base/test/platform-device-test.c | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

-- 
2.43.0

