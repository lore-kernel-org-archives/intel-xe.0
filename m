Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2C4C4167D
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 13:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A90D10E5EE;
	Tue,  7 Nov 2023 13:51:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AD2010E5EE
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699365085; x=1730901085;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E01dNaIZ7sifAyHCTfEZLk4oJc1QCnh6hSfZPqfKYJw=;
 b=bg6isNIhpvpwM/GffXu77wBNmPE3RPKzVZWnt3zgNmIScuxSS/wJS0Fj
 h5IO/mhMgxCJS8c/j88qum79ijmLuqz3mLqygI86adAsN50vkwcrMzx1B
 uWc//uuwHIzthNauO1QWWplKXPDYA9Kmqp2rHqqEuc/Th2w1b1OTORk60
 rT3TDLQro2yiUAdJGNTAmYXbJpYwY/5aaxq28c+x6Nzf9O5CwzEzqnfeh
 zet3PjX8Z75glbHYueiOv+Q4m9grsB2XcQnC3mnSLo77I5whJoPdSX/xG
 obU4o5haHMczdaiesIoZMXPCNf/tuw/tGQQot708BvL0kUkrspqrR2fHB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420618966"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="420618966"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="762705078"
X-IronPort-AV: E=Sophos;i="6.03,283,1694761200"; d="scan'208";a="762705078"
Received: from sannilnx-dsk.jer.intel.com ([10.12.231.107])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 05:51:22 -0800
From: Alexander Usyskin <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Date: Tue,  7 Nov 2023 15:46:01 +0200
Message-Id: <20231107134606.316651-1-alexander.usyskin@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/5] mei: hdcp/pxp: adapt for Xe driver
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

Alexander Usyskin (5):
  Revert "mei/hdcp: Also enable for XE"
  mei: hdcp: match without driver name
  mei: pxp: match without driver name
  mei: hdcp: add dependency on Xe driver
  mei: pxp: add dependency on Xe driver

 drivers/misc/mei/hdcp/mei_hdcp.c | 15 ++++++++++++---
 drivers/misc/mei/pxp/Kconfig     |  3 +--
 drivers/misc/mei/pxp/mei_pxp.c   | 14 ++++++++++++--
 3 files changed, 25 insertions(+), 7 deletions(-)

-- 
2.34.1

