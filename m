Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D4D2EE49AF
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 17:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49A2910E3BD;
	Tue, 22 Aug 2023 17:36:46 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5214010E3BD;
 Tue, 22 Aug 2023 17:36:44 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4E6D4AADD5;
 Tue, 22 Aug 2023 17:36:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Date: Tue, 22 Aug 2023 17:36:44 -0000
Message-ID: <169272580431.20552.12469791862414569596@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20230822173334.1664332-1-daniele.ceraolospurio@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_clean_up_kernel_submissions_=28rev4=29?=
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

Series: drm/xe: clean up kernel submissions (rev4)
URL   : https://patchwork.freedesktop.org/series/121470/
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
commit aa0226c7c1d2c684f9b91dad7479b255b72fb907
Author: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Date:   Tue Aug 22 10:33:34 2023 -0700

    drm/xe: standardize vm-less kernel submissions
    
    The current only submission in the driver that doesn't use a vm is the
    WA setup. We still pass a vm structure (the migration one), but we don't
    actually use it at submission time and we instead have an hack to use
    GGTT for this particular engine.
    Instead of special-casing the WA engine, we can skip providing a VM and
    use that as selector for whether to use GGTT or PPGTT. As part of this
    change, we can drop the special engine flag for the WA engine and switch
    the WA submission to use the standard job functions instead of dedicated
    ones.
    
    v2: rebased on s/engine/exec_queue
    
    Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 779f35314dba1441d29f4cfd510e7beb73c5f615 drm-intel
/mt/dim: line 50: /root/.dimrc: No such file or directory


