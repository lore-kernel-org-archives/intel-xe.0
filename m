Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0A9C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 16 Mar 2023 21:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050D810E36C;
	Thu, 16 Mar 2023 21:03:55 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873D810E375
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Mar 2023 21:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679000633; x=1710536633;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bjACaLP/3Q4CZorPd99tkzITeBO6af1GcL8S8k2fJo4=;
 b=SRkrLIUIcSAjT/2ct5HYsXGgCq+CrWBBKM+k4dzf+FgoZOug/TpljFWs
 M3/vxGNDJKBij3kIRbaCpnm+o/+NYXYuZ/6uu347erYXz9En/ZvI7mJpm
 k8ztckO/C6MmYGQsFwyVf5ZYT1WFxKFWLj5NVwxLQSG9cw+HL8swRoJWy
 /HJglsmI25yc/tjF7d6L8dPKVmdIazJ2xyjnHDFZSWrbVf9lR7p0kqIPm
 mD+fF6tTCpv2lg49B5fRP9/6FfOMkIskBxlgyBN+F9T7sMwfPMnd/AI/h
 Hm6q9i5A3qnhxVpOYBh9GpoRV7eTUH1XZok/kjlu5hcd0zt5E0Jx34B4/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338127579"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="338127579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="657320516"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; d="scan'208";a="657320516"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2023 14:03:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Date: Thu, 16 Mar 2023 14:03:40 -0700
Message-Id: <20230316210341.3547058-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230316210341.3547058-1-lucas.demarchi@intel.com>
References: <20230316210341.3547058-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-xe] [PATCH v2 2/3] UML: define RUNTIME_DISCARD_EXIT
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
Cc: mauro.chehab@intel.com, thomas.hellstrom@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, maarten.lankhorst@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Masahiro Yamada <masahiroy@kernel.org>

With CONFIG_VIRTIO_UML=y, GNU ld < 2.36 fails to link UML vmlinux
(w/wo CONFIG_LD_SCRIPT_STATIC).

  `.exit.text' referenced in section `.uml.exitcall.exit' of arch/um/drivers/virtio_uml.o: defined in discarded section `.exit.text' of arch/um/drivers/virtio_uml.o
  collect2: error: ld returned 1 exit status

This fix is similar to the following commits:

- 4b9880dbf3bd ("powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT")
- a494398bde27 ("s390: define RUNTIME_DISCARD_EXIT to fix link error
  with GNU ld < 2.36")
- c1c551bebf92 ("sh: define RUNTIME_DISCARD_EXIT")

Fixes: 99cb0d917ffa ("arch: fix broken BuildID for arm64 and riscv")
Reported-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Richard Weinberger <richard@nod.at>
(cherry picked from commit b99ddbe8336ee680257c8ab479f75051eaa49dcf)
---
 arch/um/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/um/kernel/vmlinux.lds.S b/arch/um/kernel/vmlinux.lds.S
index 16e49bfa2b42..53d719c04ba9 100644
--- a/arch/um/kernel/vmlinux.lds.S
+++ b/arch/um/kernel/vmlinux.lds.S
@@ -1,4 +1,4 @@
-
+#define RUNTIME_DISCARD_EXIT
 KERNEL_STACK_SIZE = 4096 * (1 << CONFIG_KERNEL_STACK_ORDER);
 
 #ifdef CONFIG_LD_SCRIPT_STATIC
-- 
2.39.0

