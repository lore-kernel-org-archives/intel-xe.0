Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4539C46CA1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 14:17:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABC5F10E0C7;
	Mon, 18 Sep 2023 14:17:42 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 63BB710E04D;
 Mon, 18 Sep 2023 14:17:41 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 63364A0169;
 Mon, 18 Sep 2023 14:17:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Date: Mon, 18 Sep 2023 14:17:41 -0000
Message-ID: <169504666140.32416.3632817210297099279@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230918120229.338270-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Us?=
 =?utf-8?q?e_common_wrapper_to_get_step_name?=
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

Series: Use common wrapper to get step name
URL   : https://patchwork.freedesktop.org/series/123857/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e2c4276f93ece00c00b611387e50ae49bb46bd81
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Mon Sep 18 17:32:29 2023 +0530

    drm/i915/dmc: Use common wrapper to get step name
    
    Use wrapper common for both xe and i915 to get the display step name.
    
    This patch partially reverts the changes made in
    
    commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")
    
    TODO: Find cleaner solution for rest(not stepping related) of the Fixme
          patch
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch 717f01815b20bde3f081a18f42f31673ce1f107f drm-intel
3d43f2f01 drm/i915: Add wrapper for xe compatibility
3f86bc5ef drm/xe: Add wrapper over intel_step_name
e2c4276f9 drm/i915/dmc: Use common wrapper to get step name
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8c4154824537', maybe rebased or not pulled?
#10: 
commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


