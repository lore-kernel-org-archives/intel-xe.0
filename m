Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ADFC25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 18:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3CB10E7BA;
	Fri, 10 May 2024 18:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnIpjkXQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF63A10E483
 for <intel-xe@lists.freedesktop.org>; Fri, 10 May 2024 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715364746; x=1746900746;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M68qc6QyU+4CEiT6tuc3dweJirr4WM+r5ER0xmLJyjo=;
 b=WnIpjkXQqRWMr8aoochIBPkSDKIPLZ2QjKAWEn3r5yNtx8q9l9eITvop
 VnxNtmtiRmLmCiiYDgX2FnNcnVhXb0ERGHBWCJPnTgFDvOlGoJbjhQXmL
 nVY6DG7NBpZoI7eDstCSoO8imp34k9yFIj8wwJvsQ3OJ3XMa05fPUjMs5
 iRLtPRSlDy/frQ9h+aQBXtHMNAzCjo3s8gTnuClzPmiFGqpSo8VO+GSyd
 vxKbNlFNHeIQKGbLHZYmAdu17haxUJ27ouUgq2QS6oCwyayB41mzs+0PA
 EcyBa/baSQmegb/qWaV5lqF/QfdG81hsENMKgKae4AZw5AXXiEJJjrRQM Q==;
X-CSE-ConnectionGUID: wfsxu24NQS+SP9iOCBXHUA==
X-CSE-MsgGUID: 8RTQuVYEQX+LlV83CiTAzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="28844546"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="28844546"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:26 -0700
X-CSE-ConnectionGUID: E2S4/8cYTyWALPcyn8XKEg==
X-CSE-MsgGUID: KHWCXx9HRMadYKcNXUTgtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="60544047"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO mwauld-desk.intel.com)
 ([10.245.244.149])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 11:12:24 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 00/20] core_hotunplug improvements
Date: Fri, 10 May 2024 19:12:13 +0100
Message-ID: <20240510181212.264622-22-matthew.auld@intel.com>
X-Mailer: git-send-email 2.45.0
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

Currently core_hotunplug or in general trying to hotunplug the device is broken in a number of
ways.

-- 
2.45.0

