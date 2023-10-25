Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD3DC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 17:39:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB6610E6BF;
	Wed, 25 Oct 2023 17:39:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFE010E6D5
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Oct 2023 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698255589; x=1729791589;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qnrB/2tPcYQFW8dH0hPe2P9ynbye+Hh6WlkLEbGmDrw=;
 b=jCj3uLTxNNaoDJJrd6aeFi9VLcjlQo5NbW4eOW+LvXOZE+c6AZJq3pz0
 sD5RAXBVq9UADpfDVJ0yt5oPyHfq7GMf/frl/Ec+1YNMqKPJ5AOAwzg9F
 BYTE3v0pQPLddxoh34B33NqfM9I9Ul1PEmQusP6PcBRaJ3kCLTi0+Zque
 pIll4x/W9EZSb7pzTH7LwvJZVlR12UWzrpqsYQlKOeE9FmUoG2FB3leJW
 XCIgulwW0XfPy2kNnxKe9rHuKxhnIOWPvt9L4TjJ2I8pP+aO0B05bJ+N1
 Dcac1BRX63DEaoK0DzTqDxeZgfXP6iqyFFGpfUc1VQmHx6LHCuqxLU0QQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="391233689"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="391233689"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:39:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="735464912"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; d="scan'208";a="735464912"
Received: from kozlovdm-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.91])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 10:39:48 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 25 Oct 2023 18:39:38 +0100
Message-ID: <20231025173937.197744-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/3] Some eviction fixes
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

[1] https://patchwork.freedesktop.org/series/124626/

-- 
2.41.0

