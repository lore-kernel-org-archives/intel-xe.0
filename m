Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD04C77B60
	for <intel-xe@archiver.kernel.org>; Fri, 31 Mar 2023 08:46:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7B10F152;
	Fri, 31 Mar 2023 08:46:55 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732F410F140
 for <intel-xe@lists.freedesktop.org>; Fri, 31 Mar 2023 08:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680252412; x=1711788412;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mmxc0dvaow0CvLqoUgTlXHEjHGohOFGIs+fns0QE1Pk=;
 b=eFUVN1DtG8/91RQSsnb5bvAP9YKwhCnmeWgfpClaQsfEg5Tvn5W41Aa8
 VULhTgFEGVeQViwsP1o95jR8U1/IZQHSnnxysHcEUij9skPV684jpsw+D
 wy5Q754fS0WSr4CYvQ7dEAr2rw4vAXQlggARxzNo9539PEjsq4QBNnoD6
 8YvoamnUDPQShYTqDB6IM0PIXCTNVm4i2l2HbmS4d0xkcAYVr2F7a1YLS
 czG6rf0eP2bT/F/M2AEJbB66TyON6dcbthDppvWtwo7vhvxYniyMAySx6
 wXDMpXwswWT/g5q6UndDksujP/fRd4vQZnwsRz6CNTyjFyOeQsLKafAhi A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="325364329"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="325364329"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678544899"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="678544899"
Received: from kuhnbrex-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.81])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 01:46:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 31 Mar 2023 09:46:23 +0100
Message-Id: <20230331084628.421814-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/5] uAPI bits for small-bar
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
v4: Small kernel-doc fix, also use the correct version of the struct

-- 
2.39.2

