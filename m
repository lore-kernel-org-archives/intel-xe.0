Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B9BEB64D7
	for <intel-xe@archiver.kernel.org>; Mon, 26 Jun 2023 09:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929610E090;
	Mon, 26 Jun 2023 09:13:28 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1E8110E052
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Jun 2023 09:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687770806; x=1719306806;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KawdyEa7p7mPd63pNnNfDvhlzmfnYayF2ikUj3qhaGk=;
 b=EejXDCDUovkslOiyFiMI68pPbbUoH8AxOjzoYy9LGEpTeKXfdFQX3VSO
 f6DkjNLcZbKGeSwxtsr/KpXWrpGob+e+5DCgDaoixbYPoKuYj//pAiIKV
 vzP71wRySQA3+fQy3c1TVvYW6JbhwsJBmxY2eVs2xnEZoZseO7nDbXCiC
 8A6hPCWrX07+W4O96iZ2i2UkuuNsWIs/EfcZz0jM2rBpFhUL/kbFLLtGI
 GH1+oRTk2kfMi4HHlHtVGusaSLa5ztkUXMMtsjp6YB1KyjdYMLFti1sTC
 lFUERn9HfyFQiI/FZhTfG5uwD+wbe5aYs40QXs2MFa3oDcuQPmj0sa6sE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="345973701"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="345973701"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 02:13:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="781356784"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="781356784"
Received: from ashlykov-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.0.92])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2023 02:13:24 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Mon, 26 Jun 2023 11:13:16 +0200
Message-Id: <20230626091317.83226-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v5 0/1] User fence wait uAPI change to nanoseconds
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

Rebase before merge.

Cc: Filip Hazubski <filip.hazubski@intel.com>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Effie Yu <effie.yu@intel.com>
Cc: Carl Zhang <carl.zhang@intel.com>

Zbigniew Kempczyński (1):
  drm/xe: Use nanoseconds instead of jiffies in uapi for user fence

 drivers/gpu/drm/xe/xe_wait_user_fence.c | 40 ++++++++++++++++++-------
 include/uapi/drm/xe_drm.h               | 15 ++++++++--
 2 files changed, 43 insertions(+), 12 deletions(-)

-- 
2.34.1

