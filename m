Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD1AEB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 10:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A299A10E35D;
	Tue, 11 Jul 2023 10:35:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9D69710E35D;
 Tue, 11 Jul 2023 10:35:24 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 99AFDAADF0;
 Tue, 11 Jul 2023 10:35:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Tue, 11 Jul 2023 10:35:24 -0000
Message-ID: <168907172462.18666.11964131899058863482@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230711101633.7-1-francois.dugast@intel.com>
In-Reply-To: <20230711101633.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Pr?=
 =?utf-8?q?event_flooding_the_kernel_log_with_XE=5FIOCTL=5FERR_=28rev2=29?=
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

Series: Prevent flooding the kernel log with XE_IOCTL_ERR (rev2)
URL   : https://patchwork.freedesktop.org/series/120535/
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
commit d2814e1755ce350e92cbf1825869a5718c22efdd
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Jul 11 10:16:33 2023 +0000

    drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
    
    Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
    flooding kernel log. Rely on drm_dbg macro output which includes
    function name, so removing file and name macros.
    
    v2: Rename XE_IOCTL_ERR to XE_IOCTL_DBG (Rodrigo Vivi)
    v3: Rebase
    
    Reported-by: Oded Gabbay <ogabbay@kernel.org>
    Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch d39e49e2ad386bf59f585a05ab659563e0472314 drm-intel
d2814e175 drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
-:13: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#13: 
Reported-by: Oded Gabbay <ogabbay@kernel.org>
Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html

-:337: WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements (8, 15)
#337: FILE: drivers/gpu/drm/xe/xe_engine.c:542:
+	if (XE_IOCTL_DBG(xe, eci[0].gt_id >= xe->info.tile_count))
 	       return -EINVAL;

-:908: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#908: FILE: drivers/gpu/drm/xe/xe_vm.c:2172:
+		if (XE_IOCTL_DBG(xe, (xe_vma_start(vma) != addr ||
 				 xe_vma_end(vma) != addr + range) && !async))

total: 0 errors, 2 warnings, 1 checks, 1207 lines checked


