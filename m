Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E22C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 10:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618F10E1EE;
	Tue, 14 Nov 2023 10:13:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F325810E1EE
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 10:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699956836; x=1731492836;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=czLBxCG0ycMVlzSI8YTc4LkTPbQ2ByuuFTnPd0JyF1A=;
 b=WvKn1stedTDOTCh/a4c0JAjX2428EDa3nC2RErQXnqKtlTDrnDzPOJT1
 /p0jJJEYAr3RmXJMprW1dMwbKC0FpbSLHdkwbQGlXWE9whtlcg+C8WWBi
 0Zh5y2zVKFNjS9+Hiwcc8/+4ka4pLOQjDzZq6lqwmu1fHuNyQEYNNs67t
 X9q7V8xbOpKSnghHnUZLkEbvHd0Q7o98XsYaMWlZ3q0+oap4qkuakn7Gj
 ISgGIh44DeRWR3UDXLMz9TZx2ML6yQ9mFef1D6OsQjZ/3q2pzZrrgIlvZ
 9BQZcs57O4fzfXuRqgVET1qOLu732wpWqUR07nZ6iSju+D6DOp8+lpBC6 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="375669076"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="375669076"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:13:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; 
   d="scan'208";a="5974142"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:13:53 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue, 14 Nov 2023 12:08:38 +0200
Message-Id: <20231114100843.1923977-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/5] mei: hdcp/pxp: adapt for Xe driver
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
Cc: linux-kernel@vger.kernel.org, Tomas Winkler <tomas.winkler@intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Update mei-hdcp and mei-pxp drivers to work with Xe driver
alongside with i195 driver.
Revert previous partial attempt.
Update match functions to match without driver name
and update module dependencies to optionally depend on Xe.

GregKH: this series intended to bake and merge through drm-xe tree
where Xe driver is developed.

V2:
 - drop first empty line cleanup, will be sent separately
 - add commit message to revert patch

Alexander Usyskin (5):
  Revert "mei/hdcp: Also enable for XE"
  mei: hdcp: match without driver name
  mei: pxp: match without driver name
  mei: hdcp: add dependency on Xe driver
  mei: pxp: add dependency on Xe driver

 drivers/misc/mei/hdcp/mei_hdcp.c | 15 ++++++++++++---
 drivers/misc/mei/pxp/Kconfig     |  2 +-
 drivers/misc/mei/pxp/mei_pxp.c   | 14 ++++++++++++--
 3 files changed, 25 insertions(+), 6 deletions(-)

-- 
2.34.1

