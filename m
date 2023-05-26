Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050CEC77B7C
	for <intel-xe@archiver.kernel.org>; Fri, 26 May 2023 19:08:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB1C10E05F;
	Fri, 26 May 2023 19:08:41 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A9E10E033
 for <intel-xe@lists.freedesktop.org>; Fri, 26 May 2023 19:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685128120; x=1716664120;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8BHEwSKL5ghiZMdikYb5dBzRlgOju2fnG6Gm4cCyOcY=;
 b=ElXkKOKbtSMvSIY8TM9B/YwNQrY+sDG65gsy/8jBwQfox1LmkA5/28c7
 KG4cmIfX/Lj7MzleE9TJ8qNTE5lQXUzKJlUdZRQ4vd/Dzi6cS/a6gphYj
 QNH9XjYgROdTcFiK7QMkhfSIwfcBXv/xXFiaordUCskpPc4nzeLHIMpDc
 dU4XHZVxTHbkqz+6ZiVvXngu4DFbrGzsTgffZ8ehtdTlRPId32Xm9b7uc
 mdb7vXCcHVrRjwwJ/qe0AgJAH/LvnGjfRFvpXX13kYIWxPk11cTKlHlnJ
 BOUTDd2joflCSF/caPd3OgnN4qTFVSZY5ViIS754ZZGQ1A/I8J0bZo3xi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440637341"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="440637341"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="682817868"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; d="scan'208";a="682817868"
Received: from omurra1x-mobl.ger.corp.intel.com (HELO 2082b82b753b.intel.com)
 ([10.252.55.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2023 12:08:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 26 May 2023 19:08:19 +0000
Message-Id: <20230526190824.7-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] drm/xe: uAPI cleanup
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

This series addresses some feedback on xe_drm.h provided here:
https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
likely break CI.

Francois Dugast (5):
  drm/xe: Use SPDX-License-Identifier instead of license text
  drm/xe: Group engine related structs
  drm/xe: Move defines after relevant fields
  drm/xe: Document usage of struct drm_xe_device_query
  drm/xe: Fix some formatting issues in uAPI

 include/uapi/drm/xe_drm.h | 152 ++++++++++++++++++++------------------
 1 file changed, 80 insertions(+), 72 deletions(-)

-- 
2.34.1

