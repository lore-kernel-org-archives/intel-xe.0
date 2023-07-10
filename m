Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958ACEB64D9
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jul 2023 09:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C90910E252;
	Mon, 10 Jul 2023 09:42:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0510E263
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jul 2023 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688982121; x=1720518121;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WHTPb875v2qNHU5bqb4AdDSdCdPkv1cASKZMWKJ7MNE=;
 b=oAStz4TkufNRtRiNdtEuAOFZDvbzopIqktBfXT7w4wTj1m6SkO9+LWbJ
 NqDPA9sTnkK8/ajiXK25GaOe8eoe74dQiOHk8ygcnsbu4ytixjHYYNMNU
 FKu6vEjPEuUyqH0TrItOaEeKkpN7m0O/EcLza1lWqGYDyGwua+99tuAlY
 PCubCI84ARKi+d7Qxxo72RQ35eklT2dMSPZAdyTPvCHh2/yvDKjN1AMQj
 bsecZu0/9UZ2c1mfA08rU1mbrU+xj63cmljzbOpCRZJIn2Rwol2nXTb9I
 ZJv15DPSiNVhiogSmCikQIApg+3lC3GPW2bLk/RfF9pp79T5TJqGmUGyb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="395081095"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="395081095"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:42:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755940597"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; d="scan'208";a="755940597"
Received: from congsip-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.28.16])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 02:41:59 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:40:38 +0100
Message-ID: <20230710094037.28179-13-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v6 00/11] Try to handle TLB invalidations from CT
 fast-path
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

In various test cases and workloads that put the system under a heavy load, we
can sometimes see errors with missed TLB invalidations. If we handle the TLB
completions directly from IRQ we can see a big improvement.

v4:
  - Various tweaks. Big thing is to make sure we grab the fast_lock for the g2h
    reservation when doing the CT send, which closes one big race with the CT
    fast-path.
v5:
  - Various improvements. Fix the race with adding a fence after its seqno has
    already been signalled. (Matt Brost)
v6:
  - One small fix to patch 8 to make sure we write the correct seqno on reset.

-- 
2.41.0

