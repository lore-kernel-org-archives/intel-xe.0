Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B859FC28B28
	for <intel-xe@archiver.kernel.org>; Wed, 12 Mar 2025 09:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E91D10E73D;
	Wed, 12 Mar 2025 09:36:53 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5067910E73C;
 Wed, 12 Mar 2025 09:36:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/hwmon=3A_expose_fa?=
 =?utf-8?q?n_speed_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Mar 2025 09:36:53 -0000
Message-ID: <174177221332.24155.16452505755878744277@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250312085909.755073-1-raag.jadav@intel.com>
In-Reply-To: <20250312085909.755073-1-raag.jadav@intel.com>
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

Series: drm/xe/hwmon: expose fan speed (rev3)
URL   : https://patchwork.freedesktop.org/series/144581/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cbb4e4a079d89106c2736adc3c7de6f9dc56da07
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b3f32ac2629c02e1a58b38cea765b75b5a2d39b5
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Wed Mar 12 14:29:09 2025 +0530

    drm/xe/hwmon: expose fan speed
    
    Add hwmon support for fan1_input, fan2_input and fan3_input attributes,
    which will expose fan speed of respective channels in RPM when supported
    by hardware. With this in place we can monitor fan speed using lm-sensors
    tool.
    
    v2: Rely on platform checks instead of mailbox error (Aravind, Rodrigo)
    v3: Introduce has_fan_control flag (Rodrigo)
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch f7d8381dd3abe62c22d27ea7998f20d8b7dab7c3 drm-intel
b3f32ac2629c drm/xe/hwmon: expose fan speed


