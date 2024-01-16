Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BCFC47077
	for <intel-xe@archiver.kernel.org>; Tue, 16 Jan 2024 09:33:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E20B10E452;
	Tue, 16 Jan 2024 09:33:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C342C10E452;
 Tue, 16 Jan 2024 09:33:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_base_freque?=
 =?utf-8?q?ncy_balance_sysfs_attributes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Tue, 16 Jan 2024 09:33:16 -0000
Message-ID: <170539759679.500854.2841086726213825619@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240116094600.2503995-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240116094600.2503995-1-sujaritha.sundaresan@intel.com>
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

Series: drm/xe: Add base frequency balance sysfs attributes
URL   : https://patchwork.freedesktop.org/series/128805/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
faa12d3432d7ef7793d934cd9338c555e95a5aad
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit bbaa2245ba093d096f818eba2ad5280ad10b6e11
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Tue Jan 16 15:16:00 2024 +0530

    drm/xe: Add base frequency balance sysfs attributes
    
    Add sysfs attributes for base frequency balance.
    
    device/tile#/gt#/freq0/balance
                            |- base_freq_factor
                            |- base_freq_factor.scale
                            |- base_rp0_freq
                            |- base_rpn_freq
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
+ /mt/dim checkpatch 3a1d727c0061b96ddf8e653130f94ab331e2f065 drm-intel
bbaa2245b drm/xe: Add base frequency balance sysfs attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:29: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#29: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 224 lines checked


