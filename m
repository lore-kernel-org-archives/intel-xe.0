Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFACC25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 21:18:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2310E135;
	Wed, 22 May 2024 21:18:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2528F10EDE3;
 Wed, 22 May 2024 21:18:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Nuke_simple_err?=
 =?utf-8?q?or_capture?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 21:18:09 -0000
Message-ID: <171641268915.2168809.9861332510061887242@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240522203431.191594-1-jose.souza@intel.com>
In-Reply-To: <20240522203431.191594-1-jose.souza@intel.com>
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

Series: drm/xe: Nuke simple error capture
URL   : https://patchwork.freedesktop.org/series/133938/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e0fe462f333fd3f7c2197d25c79a4a37ce80c360
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Wed May 22 13:34:31 2024 -0700

    drm/xe: Nuke simple error capture
    
    This error capture prints into dmesg HW state when a gpu hang happens.
    It was useful when we did not had devcoredump, now it is a incompleted
    version of devcoredump that has potential to flood dmesg.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch b912a794bf8a370cde8be56c138f5c82de0dde8f drm-intel
e0fe462f333f drm/xe: Nuke simple error capture


