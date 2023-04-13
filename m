Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CD9C77B71
	for <intel-xe@archiver.kernel.org>; Thu, 13 Apr 2023 14:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDC110E38E;
	Thu, 13 Apr 2023 14:29:59 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0690910E36A
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Apr 2023 14:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681396197; x=1712932197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7O/Tvx/7B97jjSNLwQD61R2MEvXLxJzIEHgRMfmJ8Mk=;
 b=CQIYoPDU+b7S7FEVT30XjFsiJ5GLL+jHE1Hnm25pkuaMQN3sjcPBBRTn
 HU0RpTMXWC0UIdwRtjJ96s7Nrr7dqPSqvr2eNwydvciCqdfQ+DhlOnZkx
 Y52fpHSZtO7WuDCI//8C+gm2zqaUNz1gdnXpmlfxXJfiq6ABW8yx7e/ak
 ytzRaK47gicPFLwW6jPV/mknmXHtZkOUh+jbJV6iLGDTKEnd2VuRJDd/M
 UJBB+jbyxjgSnEwS2UDDbxYE0hizx4y5pfOQNflox/8eTk9Kf4R8taiZH
 fa01bph7KqVgNTAzk5nGG6Nx0ku2cAXnwW6kjnVzFcPIx3DOiMW2Xgxs0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342941796"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="342941796"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689370406"
X-IronPort-AV: E=Sophos;i="5.99,193,1677571200"; d="scan'208";a="689370406"
Received: from mkuoppal-desk.fi.intel.com ([10.237.72.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 07:29:55 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 13 Apr 2023 17:27:47 +0300
Message-Id: <20230413142749.1097229-2-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
References: <20230413142749.1097229-1-mika.kuoppala@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [RFC 1/3] drm/xe/eudebug: Export GPL symbol
 ptrace_may_access
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

Export ptrace_may_access for eudebug to handle
access checking for debugger connections.

This is needed to be able to compile xe.ko as module.

Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 kernel/ptrace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 0786450074c1..e6933bbcbd6a 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -364,6 +364,7 @@ bool ptrace_may_access(struct task_struct *task, unsigned int mode)
 	task_unlock(task);
 	return !err;
 }
+EXPORT_SYMBOL_GPL(ptrace_may_access);
 
 static int check_ptrace_options(unsigned long data)
 {
-- 
2.34.1

