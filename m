Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B71C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:02:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE3210FD43;
	Thu, 14 Mar 2024 20:02:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A673910FD49;
 Thu, 14 Mar 2024 20:02:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/display=3A_mark_DP?=
 =?utf-8?q?T_with_XE=5FBO=5FPAGETABLE?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 20:02:13 -0000
Message-ID: <171044653368.756190.17017733202174461582@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314164905.239449-2-matthew.auld@intel.com>
In-Reply-To: <20240314164905.239449-2-matthew.auld@intel.com>
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

Series: drm/xe/display: mark DPT with XE_BO_PAGETABLE
URL   : https://patchwork.freedesktop.org/series/131148/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d51b19e43033646cd476557bef0f13ee47118333
Author: Matthew Auld <matthew.auld@intel.com>
Date:   Thu Mar 14 16:49:06 2024 +0000

    drm/xe/display: mark DPT with XE_BO_PAGETABLE
    
    Otherwise in the case where we use normal system memory, the CPU access
    will always be cached, like when filling the DPT PTEs, which is likely
    not what we want since HW access could be incoherent on platforms like
    LNL. Marking as XE_BO_PAGETABLE will force wc/uc underneath on such
    platforms.
    
    Signed-off-by: Matthew Auld <matthew.auld@intel.com>
    Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch f5246a1cf97dd1b9bf955148b0ca2cbf0b18d31e drm-intel
d51b19e43033 drm/xe/display: mark DPT with XE_BO_PAGETABLE


