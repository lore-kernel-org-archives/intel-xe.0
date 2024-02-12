Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CCCC48297
	for <intel-xe@archiver.kernel.org>; Mon, 12 Feb 2024 18:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B37710EB21;
	Mon, 12 Feb 2024 18:17:48 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E4E310E3BE;
 Mon, 12 Feb 2024 18:17:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/uapi=3A_Remove_unu?=
 =?utf-8?q?sed_flags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 Feb 2024 18:17:47 -0000
Message-ID: <170776186718.1183349.13536189409669831491@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240212161654.7-1-francois.dugast@intel.com>
In-Reply-To: <20240212161654.7-1-francois.dugast@intel.com>
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

Series: drm/xe/uapi: Remove unused flags
URL   : https://patchwork.freedesktop.org/series/129781/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3427d1368a7b013363d631ab6f42de2da3219936
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Mon Feb 12 16:16:54 2024 +0000

    drm/xe/uapi: Remove unused flags
    
    Those cases missed in previous uAPI cleanups were mostly accidentally
    brought in from i915 or created to exercise the possibilities of gpuvm
    but they are not used by userspace yet, so let's remove them. They can
    still be brought back later if needed.
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch 46cf1a7da57fc4fd2306d52aea58a02c7eb06cce drm-intel
3427d1368 drm/xe/uapi: Remove unused flags


