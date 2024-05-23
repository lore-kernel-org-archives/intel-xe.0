Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABF2C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 14:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7DA10E10F;
	Thu, 23 May 2024 14:48:19 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DB510E318;
 Thu, 23 May 2024 14:48:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_HWMON_support_for_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 May 2024 14:48:13 -0000
Message-ID: <171647569392.2169849.8989717553487201313@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20240523144351.4040131-1-balasubramani.vivekanandan@intel.com>
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

Series: Add HWMON support for BMG
URL   : https://patchwork.freedesktop.org/series/133970/
State : warning

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
commit 3b1ed72a36ad5cd6b8a88f270d1ad8b39e28ea7f
Author: Karthik Poosa <karthik.poosa@intel.com>
Date:   Thu May 23 20:13:51 2024 +0530

    drm/xe/hwmon: Expose card power and energy attributes of BMG
    
    In BMG there are separate registers for card/platform power and
    energy.
    These are exposed through channel 0 i.e power_1/energy1_xxx.
    
    Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
+ /mt/dim checkpatch 8e768c3e813ab5519a85997b622edc9a2f79c083 drm-intel
a1ed8e8964c2 drm/xe/hwmon: Add HWMON support for BMG
3b1ed72a36ad drm/xe/hwmon: Expose card power and energy attributes of BMG
-:38: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#38: FILE: drivers/gpu/drm/xe/xe_hwmon.c:90:
+			if (channel == CHANNEL_PKG) {
[...]
+			} else {
[...]

-:60: WARNING:BRACES: braces {} are not necessary for any arm of this statement
#60: FILE: drivers/gpu/drm/xe/xe_hwmon.c:123:
+			if (channel == CHANNEL_PKG) {
[...]
+			} else {
[...]

total: 0 errors, 2 warnings, 0 checks, 49 lines checked


