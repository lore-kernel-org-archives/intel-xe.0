Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD63EB64DC
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jun 2023 14:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4943510E49E;
	Wed, 21 Jun 2023 14:51:18 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52FBD10E49E;
 Wed, 21 Jun 2023 14:51:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4D027AA3D8;
 Wed, 21 Jun 2023 14:51:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Date: Wed, 21 Jun 2023 14:51:16 -0000
Message-ID: <168735907631.7800.5792254432408871918@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230621144531.4189853-1-riana.tauro@intel.com>
In-Reply-To: <20230621144531.4189853-1-riana.tauro@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Ad?=
 =?utf-8?q?d_gtidle_properties_=28rev4=29?=
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

Series: Add gtidle properties (rev4)
URL   : https://patchwork.freedesktop.org/series/119262/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5fd76f7b4ff0db22b53876c1e9b8bf6566191786
Author: Badal Nilawar <badal.nilawar@intel.com>
Date:   Wed Jun 21 20:15:31 2023 +0530

    drm/xe/mtl: Add support to get C6 residency/status of MTL
    
    Add the registers to get C6 residency of MTL SAMedia and
    C6 status of MTL gts
    
    v2:
       - move register definitions to regs header (Anshuman)
       - correct reg definition for mtl rc status
       - make idle_status function common (Badal)
    
    v3:
       - remove extra line in commit message
       - use only media type check in initialization
       - use graphics ver check (Anshuman)
    
    Bspec: 66300
    Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
    Signed-off-by: Riana Tauro <riana.tauro@intel.com>
    Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
+ /mt/dim checkpatch f0727faae3ac98601f3f4299a967f26542b3e482 drm-intel
ea043a650 drm/xe: add a new sysfs directory for gtidle properties
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
Traceback (most recent call last):
  File "scripts/spdxcheck.py", line 6, in <module>
    from ply import lex, yacc
ModuleNotFoundError: No module named 'ply'
-:81: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#81: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 340 lines checked
5fd76f7b4 drm/xe/mtl: Add support to get C6 residency/status of MTL


