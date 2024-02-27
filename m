Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC81C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 18:40:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31FB10E53C;
	Tue, 27 Feb 2024 18:40:48 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDDA310E7EC;
 Tue, 27 Feb 2024 18:40:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Convert_xe=5Fpm?=
 =?utf-8?q?=5Fruntime=5F=7Bget=2C_put=7D_to_void_and_protect_from_recursion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Feb 2024 18:40:47 -0000
Message-ID: <170905924791.337279.5290475674603973611@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240227183533.505053-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240227183533.505053-1-rodrigo.vivi@intel.com>
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

Series: drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
URL   : https://patchwork.freedesktop.org/series/130448/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9ab59fc4b7cb7663906ac4471a262434aef57f03
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 95751a942b229fc58e84d6ae5dd3a885b0d18257
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Tue Feb 27 13:35:33 2024 -0500

    drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion
    
    With mem_access going away and pm_runtime getting called instead,
    we need to protect these against recursions.
    
    For D3cold, the TTM migration helpers will call for the job execution.
    Jobs execution will be protected by direct runtime_pm calls, but they
    cannot be called again if we are already at a runtime suspend/resume
    transaction when evicting/restoring memory for D3Cold. So, we will check
    for the xe_pm_read_callback_task.
    
    The put is asynchronous so there's no need to block it. However, for a
    proper balance, we need to ensure that the references are taken and
    restored regardless of the flow. So, let's convert them all to void and
    use some direct linux/pm_runtime functions.
    
    Cc: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 0d7a78693be62a8d1cd311376815b89b18de8204 drm-intel
95751a942b22 drm/xe: Convert xe_pm_runtime_{get, put} to void and protect from recursion


