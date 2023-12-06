Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97958C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Dec 2023 05:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A75010E673;
	Wed,  6 Dec 2023 05:51:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0DC0410E673;
 Wed,  6 Dec 2023 05:51:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 067BCAADED;
 Wed,  6 Dec 2023 05:51:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Date: Wed, 06 Dec 2023 05:51:40 -0000
Message-ID: <170184190002.26423.89048675361035582@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231205232047.3277223-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20231205232047.3277223-1-vinay.belgaumkar@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_Check_skip=5Fguc=5Fpc_before_disabling_gucrc_=28rev2=29?=
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

Series: drm/xe: Check skip_guc_pc before disabling gucrc (rev2)
URL   : https://patchwork.freedesktop.org/series/127210/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit c933d8a6fa74a896a10ea8855f07aab21d61bd39
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Tue Dec 5 15:20:47 2023 -0800

    drm/xe: Check skip_guc_pc before disabling gucrc
    
    Also, use the new C6 helper instead of duplicating that code.
    
    v2: Check skip flag at the beginning of the function (Rodrigo)
    
    Fixes: ff1db4de1e40 ("drm/xe: Manually setup C6 when skip_guc_pc is set")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 9d76164e08c68a3d5d081ff7b07c15a2cadf741a drm-intel
c933d8a6f drm/xe: Check skip_guc_pc before disabling gucrc
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ff1db4de1e40', maybe rebased or not pulled?
#10: 
Fixes: ff1db4de1e40 ("drm/xe: Manually setup C6 when skip_guc_pc is set")

total: 0 errors, 1 warnings, 0 checks, 23 lines checked


