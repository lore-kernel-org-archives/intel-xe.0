Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9F5D3A697
	for <intel-xe@archiver.kernel.org>; Tue, 29 Oct 2024 20:07:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B43910E15C;
	Tue, 29 Oct 2024 20:07:39 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9816710E15C;
 Tue, 29 Oct 2024 20:07:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Move_Wa_1607983?=
 =?utf-8?q?814_to_oob?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Oct 2024 20:07:38 -0000
Message-ID: <173023245861.1361492.12871684403479293704@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241029193258.749882-1-lucas.demarchi@intel.com>
In-Reply-To: <20241029193258.749882-1-lucas.demarchi@intel.com>
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

Series: drm/xe: Move Wa 1607983814 to oob
URL   : https://patchwork.freedesktop.org/series/140687/
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
commit 3960bbd3339003e8b6f34af4e4264d6a5e108807
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Oct 29 12:32:58 2024 -0700

    drm/xe: Move Wa 1607983814 to oob
    
    needs_wa_1607983814() predates wa_oob, so it was not being printed
    in /sys/kernel/debug/dri/0/*/workarounds. Port it to OOB rules.
    This makes the WA show up in debugfs. For TGL:
    
            OOB Workarounds
                    22012773006
                    1409600907
                    1607983814
    
    Eventually the RTP infra may add support for writing registers in a
    loop, which would allow to keep track of the registers as well. But for
    now, just listing it as OOB workaround is already an improvement.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 91b5d7af697c6765039b8700127c1740da858065 drm-intel
3960bbd33390 drm/xe: Move Wa 1607983814 to oob


