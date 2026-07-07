Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D535C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D62710E520;
	Tue,  7 Jul 2026 22:16:42 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64DC10E51A;
 Tue,  7 Jul 2026 22:16:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_and_use_mor?=
 =?utf-8?q?e_KLV_helpers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jul 2026 22:16:40 -0000
Message-ID: <178346260087.163327.6358923317892881473@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260707220816.677-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260707220816.677-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add and use more KLV helpers (rev2)
URL   : https://patchwork.freedesktop.org/series/169511/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9c62dd1c6ea11995eeffd93febe453ff33888157
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jul 8 00:08:15 2026 +0200

    drm/xe/pf: Handle migration descriptor using KLV helpers
    
    As we plan to add more KLVs to the migration descriptor packet,
    to simplify such extensions and avoid coding errors, start using
    our KLV helpers for packet preparing and parsing.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
+ /mt/dim checkpatch 2f03cb9f71badfa3418ecfc871655cca1bdb9155 drm-intel
aa37e5af08bd drm/xe/guc: Allow to print single KLV
7977f43bc37e drm/xe/guc: Prepare to print group KLVs
0fdce01a11b1 drm/xe/guc: Add basic KLV encoding helpers
8b54bdb07f78 drm/xe/guc: Add string KLV encoding helper
e70749343ef0 drm/xe/guc: Add object KLV encoding helper
e78187aa0fa8 drm/xe/guc: Add KLV parsing helper
a6fdda1f7de7 drm/xe/guc: Formalize Reserved KLVs
-:51: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#51: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
785fb44dabb5 drm/xe/tests: Add GuC KLV helpers basic tests
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 106 lines checked
6b6ad1752838 drm/xe/tests: Add string encoding helper test
4d74a9942014 drm/xe/tests: Add object encoding helper test
3e782f663a6f drm/xe/tests: Add GuC KLV printer test
c9588bca2fd5 drm/xe/tests: Add migration packet test
-:17: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#17: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 95 lines checked
9c62dd1c6ea1 drm/xe/pf: Handle migration descriptor using KLV helpers


