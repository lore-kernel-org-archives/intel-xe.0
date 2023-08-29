Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6CAC6FA8F
	for <intel-xe@archiver.kernel.org>; Tue, 29 Aug 2023 16:33:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA4D10E442;
	Tue, 29 Aug 2023 16:33:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC0D10E442
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Aug 2023 16:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693326806; x=1724862806;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nzRXBfauEwBDyDTrO1OXCAWBk3AhFES5Jdeevireq4s=;
 b=B/6KRtspfKBQQIm5zfa/NYhSvC8rT9rsyvYbDnnBuBDCvgpvBbkYp+1x
 z+fHoQ9e2hvh3JK9QYZ7BEmMQ7JaPlm3kycBxK7AFPycC/3pA2wceUYrj
 AwE8wmppbEgOuA9NrMV6ijOst1bPwR9RTFRbnIxRxoA+M7NUQobgMcZtq
 OR968p8SSMa2do2bc/WcNZ8kZ7/uqnT7S6jYEq04PWZhmhiJN+5+e1wN+
 jKJLDIKMbUtgXmPHXLhkmkmZG8vx1GZtaopeomo367fI47ZQw77NZYYSR
 v+SKZkCB1asaOei+NwQt6bGLo+rNKH3lXrwzwAUwdML+UN5N5Z4qlK4G3 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="379186158"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="379186158"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="804189198"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="804189198"
Received: from gtmcgeac-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.21.125])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 09:29:42 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Tue, 29 Aug 2023 17:28:41 +0100
Message-ID: <20230829162840.73444-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 0/5] PAT and cache coherency support
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

Series still needs bunch of testing, but sending as RFC to get early feedback
while the IGT bits are being worked on. Note that the series also directly
depends on the WIP series here: https://patchwork.freedesktop.org/series/122708/

Goal here is to allow userspace to directly control the pat_index when mapping
memory via the ppGTT, in addtion to the CPU caching mode for system memory. This
is very much needed on newer igpu platforms which allow incoherent GT access,
where the choice over the cache level and expected coherency is best left to
userspace depending on their usecase.  In the future there may also be other
stuff encoded in the pat_index, so giving userspace direct control will also be
needed there.

To support this we added new gem_create uAPI for selecting the CPU cache
mode to use for system memory, including the expected GPU coherency mode. There
are various restrictions here for the selected coherency mode and compatible CPU
cache modes.  With that in place the actual pat_index can now be provided as
part of vm_bind. The only restriction is that the coherency mode of the
pat_index must match the gem_create coherency mode. There are also some special
cases like with userptr and dma-buf.

-- 
2.41.0

