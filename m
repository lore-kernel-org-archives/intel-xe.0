Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 293EAC369D5
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 04:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A8410E36B;
	Mon, 28 Apr 2025 04:35:52 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0076710E36B;
 Mon, 28 Apr 2025 04:35:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Avoid_plain_mod?=
 =?utf-8?q?ulus_in_devcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 04:35:52 -0000
Message-ID: <174581495200.17556.5731205106836914756@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250426001039.860444-1-matthew.brost@intel.com>
In-Reply-To: <20250426001039.860444-1-matthew.brost@intel.com>
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

Series: drm/xe: Avoid plain modulus in devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/148301/
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
commit d8130fcd541cfec1006158ecab9f1a6d846450ac
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Apr 25 17:10:39 2025 -0700

    drm/xe: Avoid plain modulus in devcoredump
    
    Avoid plain modulus in devcoredump rather use div_s64_rem to fix xtensa
    build.
    
    Reported-by: kernel test robot <lkp@intel.com>
    Closes:  https://lore.kernel.org/oe-kbuild-all/202504251238.JsNgFeFc-lkp@intel.com/
    Fixes: c4a2e5f865b7 ("drm/xe: Add devcoredump chunking")
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 3169be72c46a44190c6bb7dcf3a0b80986809319 drm-intel
d8130fcd541c drm/xe: Avoid plain modulus in devcoredump


