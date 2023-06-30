Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD8EB64D7
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 11:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA6710E456;
	Fri, 30 Jun 2023 11:50:28 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 249EA10E456
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 11:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688125827; x=1719661827;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KDqwIB5QJSPKLAHvyYH+pWbycNZ63nsmw1lkrIrai4c=;
 b=LuLmCJMClc0qLYSd+D99wgxpl9X1yFdpVHZEOkzYwwO3p4c/lgKCTJLG
 84+skN6r7SFBLeuEaUEJQXv36M8leq0pyA1M7OlSCqyBP3I97Pr6cz3i/
 I9BIT4XB/B1IAjlbmMbOfbJGURHdV+gJ97LV9MIVsnJatWWCJ9W3qeZdW
 XOEJnEGNDoa8gxTSQpccJ0j8q3dsR2atznP29L7DlsAC2XT3FsZlASJbc
 S2mdYORBHbblNGefVjVPn9j5uB3uzYQHfwQZ6nLxeH/b12Qlhsmv97ERW
 JI7j76ejNkLwdnFT/bi08Ch5x+xZz1foJ9QdfSQUTG16F5tvTJ+iOLCOg w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342715093"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="342715093"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="891734087"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="891734087"
Received: from lpascal-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.49.62])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:50:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 30 Jun 2023 14:50:14 +0300
Message-Id: <20230630115019.123675-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] xe & i915 display integration, display irqs
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

Resend to hopefully get full CI results.


