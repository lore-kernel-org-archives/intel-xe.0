Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2789BC48BC3
	for <intel-xe@archiver.kernel.org>; Tue, 20 Feb 2024 09:05:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60D710E245;
	Tue, 20 Feb 2024 09:05:54 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09C010E235;
 Tue, 20 Feb 2024 09:05:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_change_=27inclu?=
 =?utf-8?q?de=27_syntax_for_generate/xe=5Fwa=5Foob=2Eh?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dhirschfeld@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 20 Feb 2024 09:05:53 -0000
Message-ID: <170841995385.108022.8553790360070530167@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240220090003.1523866-1-dhirschfeld@habana.ai>
In-Reply-To: <20240220090003.1523866-1-dhirschfeld@habana.ai>
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

Series: drm/xe: change 'include' syntax for generate/xe_wa_oob.h
URL   : https://patchwork.freedesktop.org/series/130107/
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
commit fdc37a179dabc49d8ad9fc274da94f0f594cf804
Author: Dafna Hirschfeld <dhirschfeld@habana.ai>
Date:   Tue Feb 20 11:00:03 2024 +0200

    drm/xe: change 'include' syntax for generate/xe_wa_oob.h
    
    The generated file 'generated/xe_wa_oob.h' is included using:
    "generated/xe_wa_oob.h"
    which first look inside the source code. But the file resides
    in the build directory and should therefore be included using:
    <generated/xe_wa_oob.h>
    
    Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
+ /mt/dim checkpatch 1d882468b34bdc4623b5c7bd302fa1b467d6f782 drm-intel
fdc37a179dab drm/xe: change 'include' syntax for generate/xe_wa_oob.h


