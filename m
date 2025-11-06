Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D829CCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 17:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29F10E95D;
	Thu,  6 Nov 2025 17:13:53 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC8D10E95D;
 Thu,  6 Nov 2025 17:13:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_migration-friendly_?=
 =?utf-8?q?auto-provisioning_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Nov 2025 17:13:52 -0000
Message-ID: <176244923282.25862.6715391247649358039@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105183253.863-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251105183253.863-1-michal.wajdeczko@intel.com>
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

Series: PF: migration-friendly auto-provisioning (rev2)
URL   : https://patchwork.freedesktop.org/series/157094/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d9120d4d84745cf011b4b3efb338747e69179dfb
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 8c23a6d2309b9fc2b695371039dc7542997bfaeb
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Thu Nov 6 17:59:32 2025 +0100

    drm/xe/tests: Add KUnit tests for PF fair provisioning
    
    Add test cases to check outcome of fair GuC context or doorbells
    IDs allocations for regular and admin-only PF mode.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch fd2676900ab19242ed193a757445cba453254deb drm-intel
7944901804c4 drm/xe/pf: Use migration-friendly context IDs auto-provisioning
b4c64263e371 drm/xe/pf: Use migration-friendly doorbells auto-provisioning
8c23a6d2309b drm/xe/tests: Add KUnit tests for PF fair provisioning
-:16: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#16: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 169 lines checked


