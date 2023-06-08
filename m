Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B75C7EE29
	for <intel-xe@archiver.kernel.org>; Thu,  8 Jun 2023 13:20:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB2510E588;
	Thu,  8 Jun 2023 13:20:19 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8799610E5B7
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Jun 2023 13:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686230418; x=1717766418;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9gH1Mek5yXTXEjB04cLFfj0diimJ16ayS3/TaNS7bg0=;
 b=lYMppmrf4HV7A6QAJhrK87okSH3WMG6nHclqCGDIJGbCcuLskaILEVDI
 Zd8xs0QtpwjTE8ZvjV3JVZiCnQW7I8UD3K9dTROL33uBbqQuhmhhgDEL+
 moEnmRA1phVtwV0k17+rG7udvwzwPLgmTruQ5Jad9QJFYgAR6Y9NrOmk1
 H/95xakzfnBRy8lkqTOpspI+CIceq0gZEt4+QhDOGR/5YnBps1wDBiYaA
 csT188geqzJlf6fajbq3Gv4Lzvhl7J2WKz0s749391TUb7J0oktttG49L
 jC+9SIzjUw5niOIfwMbHFgp55BwXcvEzOWSW6mAx3Z3uLljhXkqyQ7FQX Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="336935388"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="336935388"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 06:16:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="687379304"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; d="scan'208";a="687379304"
Received: from lardelea-mobl1.ger.corp.intel.com (HELO 8b3e15e1f306.intel.com)
 ([10.251.211.180])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 06:16:47 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu,  8 Jun 2023 13:16:32 +0000
Message-Id: <20230608131634.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/2] drm/xe: uAPI cleanup
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
Cc: lucas.demarchi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This series addresses some feedback on xe_drm.h provided here:
https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

v2: fix ordering of defines and fields in uAPI (Lucas De Marchi)
v3:
  - rebased on drm-xe-next
  - removed some empty lines, add documentation to structures related to
    drm_xe_device_query, changed pseudo code to snippet (Lucas De Marchi)

Francois Dugast (2):
  drm/xe: Document structures for device query
  drm/xe: Move defines before relevant fields

 include/uapi/drm/xe_drm.h | 148 ++++++++++++++++++++++++++++++--------
 1 file changed, 117 insertions(+), 31 deletions(-)

-- 
2.34.1

