Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AEEC3601E
	for <intel-xe@archiver.kernel.org>; Mon, 14 Apr 2025 07:23:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 417F089E47;
	Mon, 14 Apr 2025 07:23:41 +0000 (UTC)
Received: from f7756006eef8 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F8410E2F7;
 Mon, 14 Apr 2025 07:23:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pm=3A_Wait_for_lme?=
 =?utf-8?q?m_ready_in_resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Apr 2025 07:23:39 -0000
Message-ID: <174461541968.244.12664055965501837894@f7756006eef8>
X-Patchwork-Hint: ignore
References: <20250410110057.2497056-1-karthik.poosa@intel.com>
In-Reply-To: <20250410110057.2497056-1-karthik.poosa@intel.com>
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

Series: drm/xe/pm: Wait for lmem ready in resume (rev2)
URL   : https://patchwork.freedesktop.org/series/147520/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
13a92ce9fd458ebd6064f23cec8c39c53d02ed26
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d5f1f8297cd38ae36d3bfe7ce3816dc84840e01e
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu Apr 10 16:30:57 2025 +0530

    drm/xe/pm: Wait for lmem ready in resume
    
    Add wait for LMEM ready during system and runtime resume.
    This wait is there in probe and is missing during resume.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
+ /mt/dim checkpatch 0c0a1695c329c2fe7033bc162d975cdb64e8fb36 drm-intel
d5f1f8297cd3 drm/xe/pm: Wait for lmem ready in resume


