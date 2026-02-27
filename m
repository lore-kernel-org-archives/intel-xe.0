Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE46FD9E26
	for <intel-xe@archiver.kernel.org>; Fri, 27 Feb 2026 00:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FF910EA16;
	Fri, 27 Feb 2026 00:50:58 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118D910EA16;
 Fri, 27 Feb 2026 00:50:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_support?=
 =?utf-8?q?_for_NPK_as_a_GuC_log_target_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Summers, Stuart" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Feb 2026 00:50:58 -0000
Message-ID: <177215345805.293667.8619659421553174683@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260226232648.675128-1-stuart.summers@intel.com>
In-Reply-To: <20260226232648.675128-1-stuart.summers@intel.com>
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

Series: drm/xe/guc: Add support for NPK as a GuC log target (rev2)
URL   : https://patchwork.freedesktop.org/series/162087/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 621d535ee07ff49f574f1198b93e5b136ff78f63
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Thu Feb 26 23:26:48 2026 +0000

    drm/xe/guc: Add support for NPK as a GuC log target
    
    GuC provides the ability to gather logs through a hardware interface
    called NPK. For certain debugging scenarios this can be advantageous
    over getting logs from memory (or in addition to).
    
    Add a hook for this alternate debugging mode via a configfs. This
    translates into a parameter passed to GuC during load time.
    
    v2: Convert to configfs from modparam (Matt)
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 1abdcb654ffbb08bbc96a9806fee60ef65fdad77 drm-intel
621d535ee07f drm/xe/guc: Add support for NPK as a GuC log target
-:32: WARNING:SPACE_BEFORE_TAB: please, no space before tabs
#32: FILE: drivers/gpu/drm/xe/xe_configfs.c:92:
+ * ^I# echo 2 > /sys/kernel/config/xe/0000:03:00.0/guc_log_target$

total: 0 errors, 1 warnings, 0 checks, 151 lines checked


