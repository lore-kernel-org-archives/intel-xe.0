Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D395DCF857C
	for <intel-xe@archiver.kernel.org>; Thu, 20 Nov 2025 10:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF0710E738;
	Thu, 20 Nov 2025 10:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gCsv/Nse";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D70E10E738
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Nov 2025 10:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763634295; x=1795170295;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3fF9bPbbzCXD+7tR3mGTM0SMAh3N8G8UhAZiL4HXAeE=;
 b=gCsv/NseGyRAeph1XPiRA2BFS5FPp1kNZFxLa29UVBdcb+qcFcoSCXOe
 zy1tyP4nfhUVZJhVbvqANTJdBXOulkbT1ftKEw+PjWAXdToZV9z0Ogksz
 bHTamtWUAtX+GKeGPWnTi8uMx+vnnoEFJnAvg4Sn4r8QNULWSv1KmyidY
 UKHY1hCmxRuCWAl5VUcnNEfIMg4L+pk/6VQZEcO5lAcg29f94omNthR+L
 7noSh1hAQmGncffJRA/C6gqB73EieUpGm7ogTksceFmf+UC/mrKNHnWTp
 SYx0dtxd/dCof5+NplkLEPPIbnYzUpsr2CvmFXa60kYMy///x4nMhJ+T3 w==;
X-CSE-ConnectionGUID: muEU0XIkR6e+uA/+1jGI0Q==
X-CSE-MsgGUID: MiyD1oDqQ8iNfsxcPHJIeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="76307624"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="76307624"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:24:55 -0800
X-CSE-ConnectionGUID: gUrSDgV+Qj6sfgvmO3ANQA==
X-CSE-MsgGUID: 2mIBxDF2TBS/hpqqxfES7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; d="scan'208";a="195463200"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.162])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 02:24:54 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v2 0/2] Some bind queue fixes
Date: Thu, 20 Nov 2025 10:24:19 +0000
Message-ID: <20251120102418.300378-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.51.1
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

Notably there is a uAPI change here, with now banning bind queue sharing, which is quite broken at
the moment, but was never actually intended as a usecase. The hope is that no userspace cares about
this.

v2:
 - Some fixes from Matt B.

-- 
2.51.1

