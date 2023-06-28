Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E78AEB64D7
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 05:51:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E028910E35A;
	Wed, 28 Jun 2023 05:51:51 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253B810E35A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 05:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687931510; x=1719467510;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BVcc4aYlW3YlQc5yhe8+ZfECV2o0U/fjpF3YpeL/b5k=;
 b=QVbRk0EcOFpD1tkrdhQ4SaI5N/N2N9pyqb0M6UhXr356UVO9HDPmtaz3
 O6p/bUzXjBl7BnQc9tiy3/N4CEzQYQwjEktHDd5wCbUVLeN20XhTSKyXn
 CJuwsEDXIX+8RQKHjacAC44EDCSmDGgO3mkFxbcySN+XYTgcTXzjg0/Jf
 mSLZ5GMw/arzkKcHC32bxVsWMKV46EfcsgqeJj5ARjW9I6aPWoa8xMZxg
 qHLc2qFb0cCfSvedAztPd4Vk5EY3GfCiLxg58cut8FlsNE6UpGZ7K7f4V
 clB0nK+dxm/y4mmiUtmFumxDpt8pAY+1Hvp3w8wSJejqzkYEIPwoneM7M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="360608037"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="360608037"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 22:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="890924068"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; d="scan'208";a="890924068"
Received: from krichert-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.0.148])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 22:51:48 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Wed, 28 Jun 2023 07:51:40 +0200
Message-Id: <20230628055141.398036-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v7 0/1] User fence wait uAPI change to nanoseconds
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

Fix negative timeout issue which lead to premature timer expiration
on signal delivery.
v7: restructure a bit to avoid checkpatch warning

Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>

Zbigniew Kempczyński (1):
  drm/xe: Use nanoseconds instead of jiffies in uapi for user fence

 drivers/gpu/drm/xe/xe_wait_user_fence.c | 47 +++++++++++++++++++------
 include/uapi/drm/xe_drm.h               | 16 +++++++--
 2 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.34.1

