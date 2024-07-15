Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29ACFC3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 18:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F213410E4E7;
	Mon, 15 Jul 2024 18:48:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E73010E4D1;
 Mon, 15 Jul 2024 18:48:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_NEEDS=5F2M_?=
 =?utf-8?q?BO_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Jul 2024 18:48:07 -0000
Message-ID: <172106928718.232772.15754482378668115153@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240715180538.1418-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240715180538.1418-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Add NEEDS_2M BO flag
URL   : https://patchwork.freedesktop.org/series/136107/
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
commit 13086421d4ddf9648f2dc24364c67cce1a197d72
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon Jul 15 20:05:38 2024 +0200

    drm/xe: Add NEEDS_2M BO flag
    
    In addition of NEEDS_64K BO flag, add similar one to force 2 MiB
    alignment of the buffer objects. Explicitly use this flag during
    VF LMEM provisioning as LMTT uses 2 MiB pages and one day we may
    drop requirement of allocating pinned objects as contiguous.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch b6af83ceb593bc4e0d79acda73684462b13a15b9 drm-intel
9d9900797375 drm/xe: Normalize NEEDS_64K BO flag
13086421d4dd drm/xe: Add NEEDS_2M BO flag


