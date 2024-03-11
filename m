Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D38C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 15:09:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6477112AF0;
	Mon, 11 Mar 2024 15:09:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B122F112AF0;
 Mon, 11 Mar 2024 15:09:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_unused_c?=
 =?utf-8?q?pu=5Fatomic_bo_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 Mar 2024 15:09:14 -0000
Message-ID: <171016975472.680151.5359416002279100389@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240311143415.6509-1-nirmoy.das@intel.com>
In-Reply-To: <20240311143415.6509-1-nirmoy.das@intel.com>
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

Series: drm/xe: Remove unused cpu_atomic bo flag
URL   : https://patchwork.freedesktop.org/series/130984/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9bb2a8a17457065eb398a81e8fd9aec2b519fd6
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e1605b17f136b23fea69d66865117ac3f0748764
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Mon Mar 11 15:34:15 2024 +0100

    drm/xe: Remove unused cpu_atomic bo flag
    
    cpu_atomic is not set so remove it and also related dead
    code.
    
    Fixes: ddfa2d6a846a ("drm/xe/uapi: Kill VM_MADVISE IOCTL")
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
+ /mt/dim checkpatch 64cd27a57871dd20407cd29e58bba05e4c3b022b drm-intel
e1605b17f136 drm/xe: Remove unused cpu_atomic bo flag


