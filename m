Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92738C77B7D
	for <intel-xe@archiver.kernel.org>; Thu, 18 May 2023 21:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6010E137;
	Thu, 18 May 2023 21:57:28 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A5210E137
 for <intel-xe@lists.freedesktop.org>; Thu, 18 May 2023 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684447046; x=1715983046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hTJ+T1k5MKyIB0dgDvRzCN2whppnfAXrPFZuGNxUR20=;
 b=Bo+3ovIrubD704FpkrAMTUY4efl+eRkBwGmDNfi3ppZ7oSz6y/8QjsV1
 fyLyUgel2yBg6ip3KczdtocYgNfn0a3OzjyWgOuN1rwCxxaTudLUp1M31
 xfemElAHZct+U2n3yoI96kB9QktmEsEdBUhM8SvTfNHzPPWOXniEgs4UV
 lZkcW7w/1a7CyfXgbS7gGp9AGQc5RpfcPh1H9/2Ew0m0t5rxtijGwY3Ex
 i5Rk6a1lvxL+X5fbjBo/9WqtSNOdKw1J+2XDBCsiMlHGnFjgwKY7wKR7k
 VxtZckCF8BPTDmP52cTM5QZyEYMlK4M66AQ1+zYAFETq+5ZFBdkPfMcWL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="349720235"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="349720235"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="876595974"
X-IronPort-AV: E=Sophos;i="6.00,175,1681196400"; d="scan'208";a="876595974"
Received: from rdcurry-mobl1.amr.corp.intel.com (HELO gjsousa-mobl2.intel.com)
 ([10.255.38.227])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2023 14:57:23 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 18 May 2023 18:56:49 -0300
Message-Id: <20230518215651.502159-1-gustavo.sousa@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH 0/2] drm/xe: Proper cleanup in xe_device_create()
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

This is a followup of [1], with an extra patch moving the call
drmm_add_action_or_reset() for a proper cleanup in case of failures.

[1] https://patchwork.freedesktop.org/series/117967/

Gustavo Sousa (2):
  drm/xe: Call drmm_add_action_or_reset() early in xe_device_create()
  drm/xe: Fail xe_device_create() if wq allocation fails

 drivers/gpu/drm/xe/xe_device.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

-- 
2.40.1

