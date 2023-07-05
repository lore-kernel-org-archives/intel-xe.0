Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1277C001DE
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 16:08:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7955A10E3AC;
	Wed,  5 Jul 2023 16:08:26 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B269510E3AC
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 16:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688573302; x=1720109302;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oAhXMRE2eg22NirUmzB193VYgsMTSeg2ozG0jOjQxYs=;
 b=kZW4mS0M1rhYXeB3c5imvE8FfHHQAzYw2WrlgDkwHN2CYS33+rTfTpKt
 k8I3T9z3qZ2pfPOMXJYvBOg98ySq5LijUEtoliIAy/jMdpyjwO0opIfIH
 gFlfSQAucH+1hT6tw3ecU7wLZZeUQe1JQNqS9JBu/9XXap01l7Bx1VqOZ
 0f48akO/nYXKyvTyJRScM/8kHaK3Tfomq+e4/u09FVDo5hITvVQGMwozt
 xHN9J3uBDBWnmAoM1ZFImAmSASar7fTAtyjLxyk3nySqy5v6P9pk7eUvB
 Quzd+5lNdTGEFfxPHTM5BeG1FSpkulaYcX78XTuXOdq2EVft2HHVDQ2eI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362248930"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="362248930"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965879860"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; d="scan'208";a="965879860"
Received: from peterhox-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.10.156])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 09:06:40 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:06:03 +0100
Message-ID: <20230705160602.237213-9-matthew.auld@intel.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v4 0/7] Try to handle TLB invalidations from CT
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

-- 
2.41.0

