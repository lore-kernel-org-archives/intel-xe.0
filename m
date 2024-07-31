Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBF3C3DA64
	for <intel-xe@archiver.kernel.org>; Wed, 31 Jul 2024 12:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517E110E5FF;
	Wed, 31 Jul 2024 12:29:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2BB10E5E8;
 Wed, 31 Jul 2024 12:29:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm=3A_Use_backlight_powe?=
 =?utf-8?q?r_constants?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 31 Jul 2024 12:29:19 -0000
Message-ID: <172242895904.467369.13112132934369348853@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240731122311.1143153-1-tzimmermann@suse.de>
In-Reply-To: <20240731122311.1143153-1-tzimmermann@suse.de>
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

Series: drm: Use backlight power constants
URL   : https://patchwork.freedesktop.org/series/136738/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
7b537a014c4c1a32250e342541870b03977fa7a4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 058561c32b320c604b9419a7fd81e283ab2d6258
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Jul 31 14:17:21 2024 +0200

    drm/tilcdc: Use backlight power constants
    
    Replace FB_BLANK_ constants with their counterparts from the
    backlight subsystem. The values are identical, so there's no
    change in functionality or semantics.
    
    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Cc: Jyri Sarha <jyri.sarha@iki.fi>
    Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ /mt/dim checkpatch 2a74e6714291a2c9cf26c08f729d5feb203e8338 drm-intel
cb6947789332 drm/amdgpu: Use backlight power constants
31ccdfb41710 drm/i915: Use backlight power constants
e6bb29e426ed drm/panel: panel-novatak-nt35510: Use backlight power constants
688d04a6c8ff drm/panel: panel-orisetech-otm8009a: Use backlight power constants
c43f511c48e1 drm/panel: panel-samsung-s6e63j0x03: Use backlight power constants
0034e0eaf176 drm/panel: panel-samsung-s6e3ha2: Use backlight power constants
6d6b1c65a786 drm/panel: panel-sony-acx565akm: Use backlight power constants
18ddca84b139 drm/radeon: Use backlight power constants
058561c32b32 drm/tilcdc: Use backlight power constants


