Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D6EE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 19:48:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CCD010E3BC;
	Fri, 13 Dec 2024 19:48:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52FA10E3BC;
 Fri, 13 Dec 2024 19:48:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Revert_some_cha?=
 =?utf-8?q?nges_that_break_a_mesa_debug_tool?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 19:48:41 -0000
Message-ID: <173411932167.2244279.5281312459709847566@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241213172833.1733376-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Revert some changes that break a mesa debug tool
URL   : https://patchwork.freedesktop.org/series/142576/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 0ff2ea8027827e4842e3efda4b3882597f487b53
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Fri Dec 13 09:28:33 2024 -0800

    drm/xe: Revert some changes that break a mesa debug tool
    
    There is a mesa debug tool for decoding devcoredump files. Recent
    changes to improve the devcoredump output broke that tool. So revert
    the changes until the tool can be extended to support the new fields.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Fixes: c28fd6c358db ("drm/xe/devcoredump: Improve section headings and add tile info")
    Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper function")
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch 3002940575eb5832d1fb8d10fd6311467b29c6d7 drm-intel
0ff2ea802782 drm/xe: Revert some changes that break a mesa debug tool


