Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11FBC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 16:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8888810E782;
	Wed,  4 Jun 2025 16:41:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB0210E782;
 Wed,  4 Jun 2025 16:41:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_and_prepare?=
 =?utf-8?q?_WA_BB_for_more_users?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 16:41:15 -0000
Message-ID: <174905527558.49004.10891324295976368558@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
In-Reply-To: <20250604-wa-bb-fix-v1-0-0dfc5dafcef0@intel.com>
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

Series: drm/xe: Fix and prepare WA BB for more users
URL   : https://patchwork.freedesktop.org/series/149839/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d6bb7046cfba08bfc812c8975ff521b2a037d9ce
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Jun 4 08:03:06 2025 -0700

    drm/xe/lrc: Prepare WA BB setup for more users
    
    The post context restore (WA BB) is a mechanism in HW that may be used
    for things other than the utilization setup. Create a new function
    called setup_wa_bb() that wraps any function writing useful commands in
    the buffer.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 573b98ac3ff9ff95c3316789e97980277e4ffe2b drm-intel
60841603b27c drm/xe/lrc: Use a temporary buffer for WA BB
d6bb7046cfba drm/xe/lrc: Prepare WA BB setup for more users


