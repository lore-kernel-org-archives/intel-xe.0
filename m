Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D4D2C5478C
	for <intel-xe@archiver.kernel.org>; Sat,  2 Mar 2024 15:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00D10F4C5;
	Sat,  2 Mar 2024 15:45:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B1E10F0CA;
 Sat,  2 Mar 2024 15:45:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_replace_=27grouped_target?=
 =?utf-8?q?=27_in_Makefile_with_pattern_rule?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dhirschfeld@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 02 Mar 2024 15:45:05 -0000
Message-ID: <170939430513.470106.1603310199681812922@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240302153927.2602241-1-dhirschfeld@habana.ai>
In-Reply-To: <20240302153927.2602241-1-dhirschfeld@habana.ai>
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

Series: replace 'grouped target' in Makefile with pattern rule
URL   : https://patchwork.freedesktop.org/series/130635/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
4dc7d0cc630cdd9ac56065b1a22afc329345a519
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ff4c29785240fe0a0c64f477c13ca8b2ccdd6d11
Author: Dafna Hirschfeld <dhirschfeld@habana.ai>
Date:   Sat Mar 2 17:39:28 2024 +0200

    replace 'grouped target' in Makefile with pattern rule
    
    Since 'grouped target' is used only in 'make' 4.3, it should
    be avoided. Replace it with 'multi-target pattern rule' which
    has the same behavior.
    
    Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
+ /mt/dim checkpatch 5f60548dd58e2ad93005c933fd2633d98db60de4 drm-intel
ff4c29785240 replace 'grouped target' in Makefile with pattern rule


