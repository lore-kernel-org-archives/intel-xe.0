Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED62BCA5FFF
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 18:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDAD10E3C1;
	Tue,  6 Oct 2026 18:37:55 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C48D10E3C1;
 Tue,  6 Oct 2026 18:37:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/2=5D_RFC=3A_drm/xe=3A_Fix_pinned_list_UAF_panic?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "FNU VISHWANATHA" <fnu.vishwanatha@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 18:37:54 -0000
Message-ID: <179131187424.244871.7278447183092142449@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006175741.3582911-1-fnu.vishwanatha@intel.com>
In-Reply-To: <20261006175741.3582911-1-fnu.vishwanatha@intel.com>
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

Series: series starting with [1/2] RFC: drm/xe: Fix pinned list UAF panic
URL   : https://patchwork.freedesktop.org/series/175628/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit cfc3ef5dce17f8f975de65853f1fcd8d97376c4c
Author: Kornel Dulęba <korneld@google.com>
Date:   Tue Oct 6 10:57:41 2026 -0700

    RFC: drm/xe: Prevent pinned_link double add
    
    When running CtsCameraTestCases on a memory constrained, 4GB device the
    following list corruption oops was consistently observed:
    
    list_del corruption. prev->next should be ffff9ebe1ce42ea8, but was ffff9ebdf741fea8. (prev=ffff9ebe1ce43aa8)
    
    After adding printfs in multiple places it was concluded that
    bo->pinned_link was already a part of a list when xe_bo_pin_external
    tried adding it to xe->pinned.late.external.
    To fix this add a list_empty check and a WARN_ONCE in case the list is
    in fact not empty.
    With this addition the CtsCameraTestCases can now complete with no
    kernel crashes.
    
    Test: atest CtsCameraTestCases
    Signed-off-by: Kornel Dulęba <korneld@google.com>
+ /mt/dim checkpatch daeb062fc40f727fafefed080c6d12a5ad1d0d12 drm-intel
098179729bcc RFC: drm/xe: Fix pinned list UAF panic
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
list_add corruption. prev->next should be next (ffff8bb9862912c8), but was ffff8bb9e811e2a8. (prev=ffff8bb9e811e2a8)

total: 0 errors, 1 warnings, 0 checks, 11 lines checked
cfc3ef5dce17 RFC: drm/xe: Prevent pinned_link double add
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
list_del corruption. prev->next should be ffff9ebe1ce42ea8, but was ffff9ebdf741fea8. (prev=ffff9ebe1ce43aa8)

total: 0 errors, 1 warnings, 0 checks, 15 lines checked


