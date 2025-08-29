Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CD6CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:27:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB10110EC0E;
	Fri, 29 Aug 2025 17:27:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0905C10EC24;
 Fri, 29 Aug 2025 17:27:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_SLPC_po?=
 =?utf-8?q?wer_profile_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 17:27:17 -0000
Message-ID: <175648843703.285632.11201980624566268895@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/guc: Add SLPC power profile interface
URL   : https://patchwork.freedesktop.org/series/153723/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
e0fa7d6ad11ac6dc8dfa757164e518968a98b897
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a6b4dbc779f258037c2b2fa27c7ef14582ce108a
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Fri Aug 29 09:43:08 2025 -0700

    drm/xe/guc: Add SLPC power profile interface
    
    GuC has an interface to set a power profile for the SLPC algorithm.
    Base mode is default and ensures a balanced performance, power_saving
    mode has conservative up/down thresholds and is suitable for use with
    apps that typically need to be power efficient. This will result in
    lower GT frequencies, thus consuming lower power.
    
    Selected power profile will be displayed in this format:
    
    $ cat power_profile
    
      [base]    power_saving
    
    $ echo power_saving > power_profile
    $ cat power_profile
    
      base    [power_saving]
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 73ec1b82fc684756350c4bb8ee675158ef439bba drm-intel
a6b4dbc779f2 drm/xe/guc: Add SLPC power profile interface
-:96: CHECK:LINE_SPACING: Please use a blank line after function/struct/union/enum declarations
#96: FILE: drivers/gpu/drm/xe/xe_gt_freq.c:269:
+}
+static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);

-:131: CHECK:BRACES: Blank lines aren't necessary after an open brace '{'
#131: FILE: drivers/gpu/drm/xe/xe_guc_pc.c:1181:
+{
+

total: 0 errors, 0 warnings, 2 checks, 147 lines checked


