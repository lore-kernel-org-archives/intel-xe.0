Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32753C4332F
	for <intel-xe@archiver.kernel.org>; Sun, 29 Oct 2023 17:56:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA4110E188;
	Sun, 29 Oct 2023 17:56:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id EEDC710E188;
 Sun, 29 Oct 2023 17:56:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EC73CAADF2;
 Sun, 29 Oct 2023 17:56:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Sun, 29 Oct 2023 17:56:35 -0000
Message-ID: <169860219596.25790.17965632660588543649@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231029175326.626745-1-kelbaz@habana.ai>
In-Reply-To: <20231029175326.626745-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_move_the_lmem_verification_code_into_a_separate_functio?=
 =?utf-8?q?n_=28rev2=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: move the lmem verification code into a separate function (rev2)
URL   : https://patchwork.freedesktop.org/series/125544/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d02928321d4ef9108b552a43e906e686dc82df03
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Sun Oct 29 19:53:26 2023 +0200

    drm/xe: move the lmem verification code into a separate function
    
    If lmem (VRAM) is not fully initialized, the punit will power down
    the GT, which will prevent register access from the driver side.
    That code moved into a corresponding function (xe_verify_lmem_ready)
    to make the code clearer.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
+ /mt/dim checkpatch f24c46200dc8fad700f51106e678d68d38496860 drm-intel
d02928321 drm/xe: move the lmem verification code into a separate function


