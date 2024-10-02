Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BC7CF3199
	for <intel-xe@archiver.kernel.org>; Wed,  2 Oct 2024 07:56:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C5C10E5D5;
	Wed,  2 Oct 2024 07:56:22 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B4F10E5D5;
 Wed,  2 Oct 2024 07:56:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Fix_s?=
 =?utf-8?q?pelling_mistake_=22Uncomressed=22_-=3E_=22Uncompressed=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 02 Oct 2024 07:56:21 -0000
Message-ID: <172785578178.1161626.2324739033003366280@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241002074903.833232-1-colin.i.king@gmail.com>
In-Reply-To: <20241002074903.833232-1-colin.i.king@gmail.com>
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

Series: drm/i915/display: Fix spelling mistake "Uncomressed" -> "Uncompressed"
URL   : https://patchwork.freedesktop.org/series/139406/
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
commit 1b998c2609689801b133fbd38a11ea1e75928df6
Author: Colin Ian King <colin.i.king@gmail.com>
Date:   Wed Oct 2 08:49:03 2024 +0100

    drm/i915/display: Fix spelling mistake "Uncomressed" -> "Uncompressed"
    
    There is a spelling mistake in a drm_WARN message. Fix it.
    
    Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
+ /mt/dim checkpatch fcdbbdcd11d425434efc837037141c9dfb0fcdec drm-intel
1b998c260968 drm/i915/display: Fix spelling mistake "Uncomressed" -> "Uncompressed"


