Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FD9C0015E
	for <intel-xe@archiver.kernel.org>; Fri, 11 Aug 2023 14:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DB5D10E6A2;
	Fri, 11 Aug 2023 14:13:19 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3026510E6A2;
 Fri, 11 Aug 2023 14:13:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2B6C0AA917;
 Fri, 11 Aug 2023 14:13:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Fri, 11 Aug 2023 14:13:18 -0000
Message-ID: <169176319817.3115.12482111321738695285@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230811135616.671971-1-matthew.brost@intel.com>
In-Reply-To: <20230811135616.671971-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Call_=5F=5Fguc=5Fexec=5Fqueue=5Ffini=5Fasync_direct_for?=
 =?utf-8?q?_KERNEL_exec=5Fqueues?=
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
Reply-To: intel-xe@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Call __guc_exec_queue_fini_async direct for KERNEL exec_queues
URL   : https://patchwork.freedesktop.org/series/122348/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e700ea2f248a75138759bcb443affeef4a2d1991
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3b235e3bbe0d1ee87691941f925c75729f6fcb8d
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Aug 11 06:56:16 2023 -0700

    drm/xe: Call __guc_exec_queue_fini_async direct for KERNEL exec_queues
    
    Usually we call __guc_exec_queue_fini_async via a worker as the
    exec_queue fini can be done from within the GPU scheduler which creates
    a circular dependency without a worker. Kernel exec_queues are fini'd at
    driver unload (not from within the GPU scheduler) so it is safe to
    directly call __guc_exec_queue_fini_async.
    
    Reported-by: Oded Gabbay <ogabbay@kernel.org>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch fc4e9b6f03c7991bd711cf31f3363fabc064b8c1 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


