Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9B1C3DA61
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jul 2024 07:19:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EB310E27F;
	Sun, 21 Jul 2024 07:19:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118E310E22D;
 Sun, 21 Jul 2024 07:19:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/oa=3A_Don=27t_use_?=
 =?utf-8?q?hardcoded_values?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ohad Sharabi" <osharabi@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 21 Jul 2024 07:19:15 -0000
Message-ID: <172154635506.309244.7049756253676200631@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240721071335.101234-1-osharabi@habana.ai>
In-Reply-To: <20240721071335.101234-1-osharabi@habana.ai>
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

Series: drm/xe/oa: Don't use hardcoded values
URL   : https://patchwork.freedesktop.org/series/136313/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3366ead2e343254f3e9be62695d5375e4930f477
Author: Ohad Sharabi <osharabi@habana.ai>
Date:   Sun Jul 21 10:13:35 2024 +0300

    drm/xe/oa: Don't use hardcoded values
    
    The current implementation uses hardcoded values instead of common defines.
    
    v2:
     - Make the commit a regular commit instead of a fixup commit
     - slightly modify commit message
    
    Signed-off-by: Ohad Sharabi <osharabi@habana.ai>
+ /mt/dim checkpatch 51eaf1afceb400cf4fe9ed1147dffccc4cc8204f drm-intel
3366ead2e343 drm/xe/oa: Don't use hardcoded values


