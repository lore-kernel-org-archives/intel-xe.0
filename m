Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E92C369AB
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 05:57:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA3F710E726;
	Thu, 24 Apr 2025 05:57:44 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E324410E726;
 Thu, 24 Apr 2025 05:57:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Large_devcoredump_file_su?=
 =?utf-8?q?pport?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 05:57:43 -0000
Message-ID: <174547426389.3928.8804591908857000791@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250423171725.597955-1-matthew.brost@intel.com>
In-Reply-To: <20250423171725.597955-1-matthew.brost@intel.com>
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

Series: Large devcoredump file support
URL   : https://patchwork.freedesktop.org/series/148142/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 54fa0700a136864003ebdb3d89c23b3486d600ca
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Apr 23 10:17:25 2025 -0700

    drm/xe: Abort printing coredump in VM printer output if full
    
    Abort printing coredump in VM printer output if full. Helps speedup
    large coredumps which need to walked multiple times in
    xe_devcoredump_read.
    
    v2:
     - s/drm_printer_is_full/drm_coredump_printer_is_full (Jani)
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 25d202c4e1f5a5c295b0c3450c274c16221df6a4 drm-intel
973c0846b660 drm/xe: Add devcoredump chunking
311399d8510a drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
938696856b56 drm/print: Add drm_coredump_printer_is_full
54fa0700a136 drm/xe: Abort printing coredump in VM printer output if full


