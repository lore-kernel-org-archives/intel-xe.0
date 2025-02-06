Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E72C02194
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 23:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE9310E0B0;
	Thu,  6 Feb 2025 23:40:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C0B10E0B0;
 Thu,  6 Feb 2025 23:40:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Enable_SR-IOV_f?=
 =?utf-8?q?or_PTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Feb 2025 23:40:53 -0000
Message-ID: <173888525387.2302423.11584269415847644708@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250206214545.940-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250206214545.940-1-michal.wajdeczko@intel.com>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Enable SR-IOV for PTL
URL   : https://patchwork.freedesktop.org/series/144449/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 24a0402284c9bc33197d7522f5a4c99cebeaed63
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Feb 6 22:45:45 2025 +0100

    drm/xe: Enable SR-IOV for PTL
    
    We should now have sufficient changes in the driver to run it on
    PTL platforms in the SR-IOV Physical Function (PF) mode, that would
    allow us to enable SR-IOV Virtual Functions (VFs), and successfully
    probe our driver in the VF mode on enabled VF devices.
    
    To unblock SR-IOV PF mode you need to load xe with modparam:
    
     xe.max_vfs=7
    
    Then to enable VFs it is sufficient to use:
    
     $ echo 7 > /sys/bus/pci/devices/0000:00:02.0/sriov_numvfs
    
    Note that in default auto-provisioning all VFs are allocated with
    some amount of shared resources (like unlimited GPU execution and
    preemption times, fair GGTT space, fair GuC context IDs range, ...)
    
    However with CONFIG_DEBUG_FS enabled it is possible to tweak most
    of the SR-IOV configuration parameters using attributes like:
    
     /sys/kernel/debug/dri/0000:00:02.0/gt0/
     ├── pf
     │   ├── contexts_spare
     │   ├── doorbells_spare
     │   ├── exec_quantum_ms
     │   ├── ggtt_spare
     │   ├── preempt_timeout_us
     │   ├── sched_priority
     │   └── ...
     ├── vf1
     │   ├── contexts_quota
     │   ├── doorbells_quota
     │   ├── exec_quantum_ms
     │   ├── ggtt_quota
     │   ├── preempt_timeout_us
     │   ├── sched_priority
     │   └── ...
     ├── vf2
     │   └── ...
     :
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch f2401c718ce075408a723b147cac70aad2a8246f drm-intel
24a0402284c9 drm/xe: Enable SR-IOV for PTL


