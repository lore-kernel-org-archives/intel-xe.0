Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF0DC4345F
	for <intel-xe@archiver.kernel.org>; Sat, 20 Apr 2024 17:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCDB10E0C4;
	Sat, 20 Apr 2024 17:33:51 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0071810E02C;
 Sat, 20 Apr 2024 17:33:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Fix_argumen?=
 =?utf-8?q?ts_passed_to_relay_G2H_handlers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 20 Apr 2024 17:33:50 -0000
Message-ID: <171363443000.1537660.15813072224155460037@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419150351.358-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240419150351.358-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Fix arguments passed to relay G2H handlers (rev2)
URL   : https://patchwork.freedesktop.org/series/132651/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ac1bbec4dff27d1763dd2a03fad8b78d767d72e5
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Fri Apr 19 17:03:51 2024 +0200

    drm/xe/guc: Fix arguments passed to relay G2H handlers
    
    By default CT code was passing just payload of the G2H event
    message, while Relay code expects full G2H message including
    HXG header which contains DATA0 field. Fix that.
    
    Fixes: 26d4481ac23f ("drm/xe/guc: Start handling GuC Relay event messages")
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 5b8f5c906246fb3ddf35b775a3b6ac9ea5fdcdd5 drm-intel
ac1bbec4dff2 drm/xe/guc: Fix arguments passed to relay G2H handlers


