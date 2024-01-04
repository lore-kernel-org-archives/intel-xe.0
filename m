Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD52C3DA6E
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jan 2024 00:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0B910E300;
	Thu,  4 Jan 2024 00:09:12 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006F810E2FB;
 Thu,  4 Jan 2024 00:09:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Add_vram_freque?=
 =?utf-8?q?ncy_sysfs_attributes_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
Date: Thu, 04 Jan 2024 00:09:10 -0000
Message-ID: <170432695099.1406.4210531238343811847@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240102052748.1598057-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20240102052748.1598057-1-sujaritha.sundaresan@intel.com>
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

Series: drm/xe: Add vram frequency sysfs attributes (rev3)
URL   : https://patchwork.freedesktop.org/series/127800/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit b8ebe4575697f022508fb72916188a77110be4d1
Author: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Date:   Tue Jan 2 10:57:48 2024 +0530

    drm/xe: Add vram frequency sysfs attributes
    
    Add vram frequency sysfs attributes under the below hierarchy;
    
    /device/tile#/memory/freq0
                            |-max_freq
                            |-min_freq
    
    v2: Drop "vram" from attribute names (Rodrigo)
    
    v3: Add documentation for new sysfs (Riana)
        Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
    
    v4: Create sysfs under tile#/freq0 after removal of
        physical_memsize attrbute
    
    v5: Revert back to creating sysfs under tile#/memory/freq0
        Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
    
    v6: Rename attributes to max/min_freq (Anshuman)
        Fix review comments (Rodrigo)
    
    v7: Make docuemntation more verbose
        Move sysfs to separate file (Anshuman)
    
    Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
    Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
+ /mt/dim checkpatch 7b3b98d034784b125bad7aca46f9e7a3cfcde45a drm-intel
b8ebe4575 drm/xe: Add vram frequency sysfs attributes
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:84: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#84: 
new file mode 100644

-:213: CHECK:BRACES: Blank lines aren't necessary before a close brace '}'
#213: FILE: drivers/gpu/drm/xe/xe_vram_freq.c:125:
+
+}

-:215: CHECK:LINE_SPACING: Please don't use multiple blank lines
#215: FILE: drivers/gpu/drm/xe/xe_vram_freq.c:127:
+
+

total: 0 errors, 1 warnings, 2 checks, 178 lines checked


