Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4DAC48BF8
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 18:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F8B10E32E;
	Mon, 19 Feb 2024 18:38:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3B610E1A3;
 Mon, 19 Feb 2024 18:38:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_avoid_using_=27?=
 =?utf-8?q?grouped_targets=27_in_Makefile_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dhirschfeld@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Feb 2024 18:38:08 -0000
Message-ID: <170836788869.107368.10955729472896095751@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219135845.1463992-1-dhirschfeld@habana.ai>
In-Reply-To: <20240219135845.1463992-1-dhirschfeld@habana.ai>
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

Series: drm/xe: avoid using 'grouped targets' in Makefile (rev2)
URL   : https://patchwork.freedesktop.org/series/130088/
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
commit 8e0942e450c660678600213e0f60fb73267b9a30
Author: Dafna Hirschfeld <dhirschfeld@habana.ai>
Date:   Mon Feb 19 15:58:45 2024 +0200

    drm/xe: avoid using 'grouped targets' in Makefile
    
    The feature 'grouped target' ('&:') in makefiles is only added in 'make'
    version 4.3. This cause problems in older version of 'make'.
    (Specifically $(@D) is wrongly interpreted - it creates 'generated' dir
    in the source path instead of the build path).
    Avoid this feature.
    
    Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
+ /mt/dim checkpatch 52bdc58b3b2bd7b77710f0d6710c1b9dbaee1af9 drm-intel
8e0942e450c6 drm/xe: avoid using 'grouped targets' in Makefile


