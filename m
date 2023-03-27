Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553F5C76195
	for <intel-xe@archiver.kernel.org>; Mon, 27 Mar 2023 12:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20B910E59E;
	Mon, 27 Mar 2023 12:48:49 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB1F10E59E
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Mar 2023 12:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679921327; x=1711457327;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tLWdeCakQYYbOIRSlxxaeUEzryTgr0ZhMWvIyRHypRA=;
 b=NZJJbyEm9eAs+7Gdl9v6FzS+UrkapEJM9Dv2Ibf9+c1W9lcmwkVRyO4I
 jJleI2GGQwIPl5+iIeUWrnyqNeTH/N99j7xHPO3k62xrXn+i05q4ljYoo
 shZcx97eiEawaO1kUkU8L68SXDt8v/l4CIBcjzFjbqsOpQ7Kv2Gr3Y+Y9
 gyKPt1cdzv1jzuyLMsZaZdfyai11tGte9gTkR129OA2vTGoCXs1NZjtaB
 VOfJDOo86VFfen1ocNQsoegQgL1iNKv+Hc9xk4nn6xZtXMVqeFujISwH/
 HRskbXK9lavo2E1vZGVH5xhr419O985hMH9sYfYiTCmuSqlipigSF7wAh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="342654366"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="342654366"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 05:48:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="660832401"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; d="scan'208";a="660832401"
Received: from ababushk-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.24])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 05:48:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 27 Mar 2023 13:48:02 +0100
Message-Id: <20230327124807.54459-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v3 0/5] uAPI bits for small-bar
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

The remaining small-bar bits. Add support for requesting CPU access for VRAM
buffers. Also expose this to userspace, along with various bits of related
accounting. Finally turn on small-bar support.

v2: Various improvements suggested by José
v3: Add some kernel-doc (Gwan-gyeong)

-- 
2.39.2

