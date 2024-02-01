Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A5BC48291
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 22:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106B110EBF0;
	Thu,  1 Feb 2024 22:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kERiP50Y";
	dkim-atps=neutral
X-Greylist: delayed 427 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 22:54:30 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A0410E54E
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 22:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706828070; x=1738364070;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TYdiyGrE2J5qwOcGuowcc5ERB03vajOuaebVvP/M6pw=;
 b=kERiP50YlBec5YSfGEsLQTW1kdOnwl7fVNdv37/u0UKqOqNojasTTsqT
 xJRS6ZnRdmY0ZWDIY5Kq7k28nETd+im4vnvSBY8UAwzU3hgdQ/Nd2PNaY
 /KdlWU2PqbNUjyl1gp+nxkJfTV3pS5Jj8gyynrUvWxsk5sNC9NMt1b5OI
 aBVbzWklpPEp8DDDhDAKZ+hw8j2PspbH7JNTdr+SZKOfB7GM3GdCNpw3e
 Hvoxip6H0yj64CGOzxZ3Md141pc1ns2ejhrke3yzMHX/0U7Yuumi+Shbl
 /LczpnT0vNhqwJp1wi9DhCgsy9gXHqxO+9hWaiefh9xDl9BuSeE5HDFCn Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="248431"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="248431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 14:47:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="37338202"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 14:47:23 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 John.C.Harrison@Intel.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 tejas.upadhyay@intel.com, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 0/2] Improve error path handling for firmware loading
Date: Thu,  1 Feb 2024 14:47:22 -0800
Message-ID: <20240201224724.551130-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Provide better output to handle error path handling and allowing
developer to override the selected firmware, even if that platform
doesn´t have a firmware entry in the table.

Lucas De Marchi (2):
  drm/xe: Always allow to override firmware
  drm/xe: Avoid crypt message when there's no GuC definition

 drivers/gpu/drm/xe/xe_uc_fw.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

-- 
2.43.0

