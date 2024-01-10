Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844F1C4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 15:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BB010E628;
	Wed, 10 Jan 2024 15:23:35 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BD910E614;
 Wed, 10 Jan 2024 15:23:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_PM_snippet?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Wed, 10 Jan 2024 15:23:33 -0000
Message-ID: <170490021393.240792.5418086843229305113@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110152033.1414372-1-matthew.brost@intel.com>
In-Reply-To: <20240110152033.1414372-1-matthew.brost@intel.com>
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

Series: drm/xe: PM snippet
URL   : https://patchwork.freedesktop.org/series/128434/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f96baf2f481dc1a0e21a7aa0f7efa5a0d7001d32
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Wed Jan 10 07:20:33 2024 -0800

    drm/xe: PM snippet
    
    Code snippet for [1] as guide as to where to add PM refs.
    
    [1] https://patchwork.freedesktop.org/series/128044/
+ /mt/dim checkpatch d6ef9c52d8d2ae4c85bc598b74a259db081fff26 drm-intel
f96baf2f4 drm/xe: PM snippet
-:128: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 94 lines checked


