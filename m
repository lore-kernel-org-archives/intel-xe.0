Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0AEEB8FD8
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 11:54:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D9CE10E230;
	Thu,  7 Sep 2023 11:54:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DDBC910E230;
 Thu,  7 Sep 2023 11:54:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DE1F8AADE3;
 Thu,  7 Sep 2023 11:54:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 07 Sep 2023 11:54:49 -0000
Message-ID: <169408768990.17903.15529562570019170971@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230830214715.113435-1-rodrigo.vivi@intel.com>
In-Reply-To: <20230830214715.113435-1-rodrigo.vivi@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_drm/xe/uapi=3A_Typo_lingo_and_other_small_ba?=
 =?utf-8?q?ckwards_compatible_fixes=2E_=28rev3=29?=
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

Series: series starting with drm/xe/uapi: Typo lingo and other small backwards compatible fixes. (rev3)
URL   : https://patchwork.freedesktop.org/series/123084/
State : success

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
commit 9380639d76854ba3199cfd6369b3c562c40945ec
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Aug 30 17:47:15 2023 -0400

    drm/xe/uapi: Remove useless max_page_size
    
    The min_page_size is useful information to ensure alignment and it is
    an API actually in use. However max_page_size doesn't bring any useful
    information to the userspace hence being not used at all.
    
    So, let's remove and only bring it back if that ever gets used.
    
    Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch bae46e59a7f667734376ddb0d2451967dfb264f1 drm-intel
142cc77f4 drm/xe/uapi: Typo lingo and other small backwards compatible fixes.
9380639d7 drm/xe/uapi: Remove useless max_page_size


