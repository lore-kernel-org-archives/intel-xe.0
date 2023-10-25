Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1BC9C25B6B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 08:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 758FF10E5BC;
	Wed, 25 Oct 2023 08:38:55 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCCB210E5BC;
 Wed, 25 Oct 2023 08:38:52 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id DA11DA0169;
 Wed, 25 Oct 2023 08:38:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Date: Wed, 25 Oct 2023 08:38:52 -0000
Message-ID: <169822313288.20489.8192566568718412995@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025071252.168758-1-kelbaz@habana.ai>
In-Reply-To: <20231025071252.168758-1-kelbaz@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_move_the_lmem_verification_code_into_a_separate_functio?=
 =?utf-8?q?n?=
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

Series: drm/xe: move the lmem verification code into a separate function
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
commit b6c291205aa734cd40aed49ffa3e3a46c3e6a339
Author: Koby Elbaz <kelbaz@habana.ai>
Date:   Wed Oct 25 10:12:52 2023 +0300

    drm/xe: move the lmem verification code into a separate function
    
    If lmem (VRAM) is not fully initialized, the punit will power down
    the GT, which will prevent register access from the driver side.
    That code moved into a corresponding function (xe_verify_lmem_ready)
    to make the code clearer.
    
    Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
+ /mt/dim checkpatch 4354e27efb78582ee567ba6264c79d0872a3a4e7 drm-intel
b6c291205 drm/xe: move the lmem verification code into a separate function


