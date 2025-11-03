Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4BBCCFA03
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 19:58:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516910E455;
	Mon,  3 Nov 2025 19:58:04 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C9D10E455;
 Mon,  3 Nov 2025 19:58:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Same_NUMA_node_for_MEI_in?=
 =?utf-8?q?terrupt?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 19:58:02 -0000
Message-ID: <176219988275.11360.15478933100934066504@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103174147.2940-1-Simon.Richter@hogyros.de>
In-Reply-To: <20251103174147.2940-1-Simon.Richter@hogyros.de>
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

Series: Same NUMA node for MEI interrupt
URL   : https://patchwork.freedesktop.org/series/156945/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1fd6c3ee1918892d53287c0a743bae4d0ddf0f7e
Author: Simon Richter <Simon.Richter@hogyros.de>
Date:   Tue Nov 4 02:40:49 2025 +0900

    drm/xe: Use same NUMA node for MEI interrupt
+ /mt/dim checkpatch 3d82a6cdc5241dbae65a59cf1197ff3bfd90ec2c drm-intel
1fd6c3ee1918 drm/xe: Use same NUMA node for MEI interrupt
-:8: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:19: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 1 warnings, 0 checks, 8 lines checked


