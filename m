Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C6BCC0218F
	for <intel-xe@archiver.kernel.org>; Sun,  2 Feb 2025 14:21:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A9610E0E5;
	Sun,  2 Feb 2025 14:21:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AAC10E0E5;
 Sun,  2 Feb 2025 14:21:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/gpuvm=3A_Add_support_?=
 =?utf-8?q?for_single-page-filled_mappings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Asahi Lina" <lina@asahilina.net>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 02 Feb 2025 14:21:38 -0000
Message-ID: <173850609839.4012540.8637310084062620877@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
In-Reply-To: <20250202-gpuvm-single-page-v1-0-8cbd44fdcbd4@asahilina.net>
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

Series: drm/gpuvm: Add support for single-page-filled mappings
URL   : https://patchwork.freedesktop.org/series/144229/
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
commit 6b4f3c4b8d4181c3c653ff927da790c661dba0f4
Author: Asahi Lina <lina@asahilina.net>
Date:   Sun Feb 2 22:34:53 2025 +0900

    drm/gpuvm: Plumb through flags into drm_gpuva_init
    
    Now that drm_gpuva_op_map has a flags field, plumb it through to the
    helper that populates a drm_gpuva.
    
    This helper is only used by drm_gpuva_remap(), which in turn is only
    used by drivers which do not use flags at all (panthor, imagination),
    so this change has no effect on existing drivers.
    
    Signed-off-by: Asahi Lina <lina@asahilina.net>
+ /mt/dim checkpatch 01f54d1da1ffffff78047186f62b5916dfd43939 drm-intel
14dd6a0030d6 drm/gpuvm: Add a flags argument to drm_gpuvm_sm_map[_*]
ad0f4cd5723c drm/gpuvm: Plumb through flags into drm_gpuva_op_map
e4fcde22dc6c drm/gpuvm: Add DRM_GPUVA_SINGLE_PAGE flag and logic
6b4f3c4b8d41 drm/gpuvm: Plumb through flags into drm_gpuva_init


