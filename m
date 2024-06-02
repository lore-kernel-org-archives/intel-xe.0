Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DCCC25B7E
	for <intel-xe@archiver.kernel.org>; Sun,  2 Jun 2024 19:18:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588E010E08E;
	Sun,  2 Jun 2024 19:18:14 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532D610E08E;
 Sun,  2 Jun 2024 19:18:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_MAINTAINERS=3A_Update_Xe_?=
 =?utf-8?q?driver_maintainers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 02 Jun 2024 19:18:13 -0000
Message-ID: <171735589333.2260040.3287204758692189396@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240602190959.2981-1-thomas.hellstrom@linux.intel.com>
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

Series: MAINTAINERS: Update Xe driver maintainers (rev2)
URL   : https://patchwork.freedesktop.org/series/134305/
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
commit ea907b6e87bb72360e954e717757b5b0d28ca539
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Sun Jun 2 21:09:59 2024 +0200

    MAINTAINERS: Update Xe driver maintainers
    
    Add Rodrigo Vivi as an Xe driver maintainer.
    
    v2:
    - Cc also Lucas De Marchi (Rodrigo vivi)
    - Remove a blank line in commit the commit message (Lucas De Marchi)
    
    Cc: David Airlie <airlied@gmail.com>
    Cc: Daniel Vetter <daniel@ffwll.ch>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: dri-devel@lists.freedesktop.org
    Cc: linux-kernel@vger.kernel.org
    Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 692c2b76453385a04b1eef40f3cdbc0097074f62 drm-intel
ea907b6e87bb MAINTAINERS: Update Xe driver maintainers


