Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270D1C6FD1D
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 12:00:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7F910E06A;
	Thu, 23 Mar 2023 12:00:00 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34A7F10E06A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 11:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679572799; x=1711108799;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GTXHJUMR4lbltxwiPbFyNj3Y5xNDzc9Gr/KU9mLf8NU=;
 b=S7MedXOj/ldcAohOvOaQqakekEz3/996BHpbOom7khzqfCpM51ty3sYI
 8aPLveaJgYV2T+UyE6LC7k1dCQ3AZaGC/Mtj1gA8DoF48fusho9t7u8aY
 a8HVJGlHUP/FI5amvWXuqWiguNPsJuC0Rm+YrZd0rENtFyp1kOIvAmnlO
 QlNurRlXfBXpDDBFjCeOrOLS2jJ0s0gSllcFOBNJtYZyoH2SfZAGbTohD
 9WVzJhWtQAFhJdr3xjrdkt9JRfG6jDwlB2I/qCABGr2nheGD0ZfkhL8UX
 Mc17I8+nmxoV8iOV0rekuSOaw5GTooyeABQSd2IWIeT84gF8ll4j1u5+U Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="404352490"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="404352490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:59:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="751463174"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; d="scan'208";a="751463174"
Received: from ehallina-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.2.208])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 04:59:57 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 23 Mar 2023 11:59:20 +0000
Message-Id: <20230323115926.391900-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 0/6] uAPI bits for small-bar
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

-- 
2.39.2

