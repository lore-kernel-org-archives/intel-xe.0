Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B3AC25B6E
	for <intel-xe@archiver.kernel.org>; Fri, 27 Oct 2023 10:48:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96A1410E06E;
	Fri, 27 Oct 2023 10:48:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B9410E06E
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Oct 2023 10:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698403719; x=1729939719;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kZrNbSQQw22MZ3KKGTPUDjY3dK5Wv0vjN53+lnII+f4=;
 b=Oyb/+SO/6HJSF1Kqh4cJGfO2GJAUR2iuskCSFkbqHlk5DECkWxEy0aFs
 YQQlstvaa1BJCTjOq3EpU9Y9a3Z838bLWWO/kkklbiAYDPAUXbhm9X/4a
 rsvTYpjZYNQ7FdYeH6ApFKUUXD78SkjDeGtMkYG+m8znMJFrY/wu6+281
 LZYXaARMWPDUnMbYXVUhmGtntU8P8md3JPZDKY3pic8wK/B+6SrZ6wCSs
 tXT0Jws/FRF9H96ag6MYzqAQjd3D13G7rvs2ka/7HhjJywpWN77WkBlEa
 dRWir4BaQH846UhMFt9C8iCIKJkgw66AqcderTqPyiXeSegxDtVXTuTXa g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="545158"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="545158"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:48:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="794543070"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; d="scan'208";a="794543070"
Received: from tmarkand-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.2.153])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 03:48:27 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 27 Oct 2023 11:48:11 +0100
Message-ID: <20231027104810.310819-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/3] Some eviction fixes
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

Hopefully fixes the scary corruption issues seen around evicting VRAM, as picked
up by the IGTs written by Zbigniew [1].

v2: Some improvements suggested by Matt B.

[1] https://patchwork.freedesktop.org/series/124626/

-- 
2.41.0

