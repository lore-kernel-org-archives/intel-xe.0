Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F9DC47258
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jan 2024 17:14:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB0F10E82E;
	Tue, 23 Jan 2024 17:14:47 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A646910E82A;
 Tue, 23 Jan 2024 17:14:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Only_allow_1_uf?=
 =?utf-8?q?ence_per_exec_/_bind_IOCTL?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 23 Jan 2024 17:14:47 -0000
Message-ID: <170603008768.683882.7836250934741004047@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240123163422.1570227-1-matthew.brost@intel.com>
In-Reply-To: <20240123163422.1570227-1-matthew.brost@intel.com>
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

Series: drm/xe: Only allow 1 ufence per exec / bind IOCTL
URL   : https://patchwork.freedesktop.org/series/129095/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e7f730565356938dd6c63cd498218fdc5d6a22b0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 09e9af54c901d6b59a3667cbccb3ae55202b6992
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Jan 23 08:34:22 2024 -0800

    drm/xe: Only allow 1 ufence per exec / bind IOCTL
    
    The way exec ufences are coded only 1 ufence per IOCTL will be signaled.
    It is possible to fix this but for current use cases 1 ufence per IOCTL
    is sufficient. Enforce a limit of 1 ufence per IOCTL (both exec and bind
    to be uniform).
    
    Cc: Mika Kahola <mika.kahola@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch fc6b7c6ee7d786e6ed48425a2ce0e674906e4e5c drm-intel
09e9af54c drm/xe: Only allow 1 ufence per exec / bind IOCTL


