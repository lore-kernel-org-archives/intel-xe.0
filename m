Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E67AEB64D9
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 21:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3CB10E46A;
	Wed, 14 Jun 2023 21:00:26 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18F3710E46A;
 Wed, 14 Jun 2023 21:00:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 16455AADE3;
 Wed, 14 Jun 2023 21:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 14 Jun 2023 21:00:24 -0000
Message-ID: <168677642408.17431.918769165446099210@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230614205202.3376752-1-matthew.d.roper@intel.com>
In-Reply-To: <20230614205202.3376752-1-matthew.d.roper@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_GM?=
 =?utf-8?q?D=5FID_fixes?=
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

Series: GMD_ID fixes
URL   : https://patchwork.freedesktop.org/series/119348/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1fbbdd6f5b95f71c06c21284cb9d876193d62966
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Wed Jun 14 13:52:02 2023 -0700

    drm/xe: Enable PCI device earlier
    
    Newer Intel platforms require that inspect the contents of the GMD_ID
    registers very early in the driver initialization process to determine
    the IP version (and proper init sequences), of the platform.  Move the
    general PCI device setup and enablement slightly earlier, before we
    start trying to peek at the GMD_ID registers.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 6deb23a615c05c5ec982c74c1af5b8f6de06c967 drm-intel
036268888 drm/xe: Return GMD_ID revid properly
60c2780d7 drm/xe: Don't raise error on fused-off media
dcaded964 drm/xe: Print proper revid value for unknown media revision
1fbbdd6f5 drm/xe: Enable PCI device earlier


