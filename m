Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D3EE7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 11:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417510E87C;
	Tue, 10 Dec 2024 11:17:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2536410E87C;
 Tue, 10 Dec 2024 11:17:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22lockdep=3A_Enab?=
 =?utf-8?q?le_PROVE=5FRAW=5FLOCK=5FNESTING_with_PROVE=5FLOCKING=2E=22_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Dec 2024 11:17:58 -0000
Message-ID: <173382947814.816643.13690868059251556014@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241209135602.2716023-1-luciano.coelho@intel.com>
In-Reply-To: <20241209135602.2716023-1-luciano.coelho@intel.com>
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

Series: Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING." (rev2)
URL   : https://patchwork.freedesktop.org/series/142297/
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
commit a65fcda6817d2140128a0ff38520684186536761
Author: Luca Coelho <luciano.coelho@intel.com>
Date:   Mon Dec 9 15:53:51 2024 +0200

    Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."
    
    This reverts commit 560af5dc839eef08a273908f390cfefefb82aa04.
    
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch 5f0f6218ae34ea7cb5bde3d29b7b4a79fdea4ab7 drm-intel
a65fcda6817d Revert "lockdep: Enable PROVE_RAW_LOCK_NESTING with PROVE_LOCKING."


