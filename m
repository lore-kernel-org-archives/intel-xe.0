Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367C7606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nV2RwwGD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F326311284F;
	Thu, 22 Oct 2026 17:41:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F6B11284F
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 17:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792690869; x=1824226869;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=o8Q/o9ig65e7d1JDhENDjdKwOh8OET/ZXwTyRZi2vqE=;
 b=nV2RwwGDeG3Z7AaOc0SZsPshzPsawspEBcrsD1WgBlydg+MjSBULSjKh
 Ehzj7hVL8lmdWzg6wTyqFeDmQk7MobhrIkb8cx45hxuwyBFDkDQgXx9Yw
 33F20puHcYc7OX+ISBT5kWCRtv0RzTBQCZDqc2Yfnt3QKmB99Xm/vx0ty
 +KMhAblaPi6helVE5SjUbIyTAJ+q3RQX4ofanW5vh7KaFy/N1rMfmUjIm
 AucWoo7WhBYRCTjcLT+Pktsj4Jkd7vBAW/ceTq+NOv1UNMhTpUIHnpYJe
 qvBKI0wUgxQ7e0dRfb7FOFFzRceq3D4equKjJGlO918ac7ti55vVPMSeO g==;
X-CSE-ConnectionGUID: PJOn4BFSSMqgKyNDDeYkUQ==
X-CSE-MsgGUID: TS6l7jLLScO00yBcVWJ4QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1435953"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1435953"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:09 -0700
X-CSE-ConnectionGUID: h9NVfDUqT7Gy/CZgMB2hwQ==
X-CSE-MsgGUID: sJehWstZS7aD/zrf4RTj+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3366065"
Received: from abityuts-desk1.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.245.243])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 10:41:09 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 0/2] Uninterruptible bb wait + cleanup
Date: Thu, 22 Oct 2026 18:40:59 +0100
Message-ID: <20261022174058.226432-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Motivation comes from user issue:
https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9644

-- 
2.56.0

