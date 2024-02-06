Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A811C4828D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Feb 2024 12:28:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2612112B57;
	Tue,  6 Feb 2024 12:28:08 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79310112B64;
 Tue,  6 Feb 2024 12:28:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/3=5D_drm/ttm=3A_Allow_TTM_LRU_list_nodes_of_different_types?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Feb 2024 12:28:07 -0000
Message-ID: <170722248749.1055288.16424706134689016107@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240206121716.13365-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240206121716.13365-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/3] drm/ttm: Allow TTM LRU list nodes of different types
URL   : https://patchwork.freedesktop.org/series/129578/
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
commit aef83409c5512f757bf144a06e2f8b5169ceea30
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Tue Feb 6 13:17:16 2024 +0100

    drm/ttm: Consider hitch moves within bulk sublist moves
    
    To work around the problem with hitches moving when bulk move
    sublists are bumped, keep a second hitch when traversing a bulk
    move sublist, which is attached to the list *after* the bulk
    move sublist. If we detect a sublist bump, we use that second
    hitch as the continuation point of list traversal.
    
    Sublist bumps are detected by checking the sublist age which is
    increased by 1 each time it was bumped. The age is then compared
    to that of the last iteration returning an item within the sublist.
    
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 7c79a8cb401543f9c8aa8a60e497ae1720ec4cf0 drm-intel
4f966e54b drm/ttm: Allow TTM LRU list nodes of different types
86b9c9223 drm/ttm: Use LRU hitches
aef83409c drm/ttm: Consider hitch moves within bulk sublist moves


