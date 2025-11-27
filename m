Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8C5CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 19:06:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7504A10E76C;
	Thu, 27 Nov 2025 19:06:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 222B310E76C;
 Thu, 27 Nov 2025 19:06:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/guc=3A_Add_LFD_for?=
 =?utf-8?q?mat_output_for_guc_log_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Nov 2025 19:06:42 -0000
Message-ID: <176427040213.36740.1572515413789593823@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
In-Reply-To: <20251127170759.2620994-1-zhanjun.dong@intel.com>
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

Series: drm/xe/guc: Add LFD format output for guc log (rev8)
URL   : https://patchwork.freedesktop.org/series/146541/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
2de9a3901bc28757c7906b454717b64e2a214021
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a854164ed02e1bf6be9182ec262d615a5299174f
Author: Zhanjun Dong <zhanjun.dong@intel.com>
Date:   Thu Nov 27 12:07:59 2025 -0500

    drm/xe/guc: Add new debugfs entry for lfd format output
    
    Add new debugfs entry "guc_log_lfd", prepared for output guc log
    in LFD(Log Format Descriptors) format.
    
    Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
    Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch d858d76d3596e85f00b062a894e38e7fda3d9916 drm-intel
a90993a3a0de drm/xe/guc: Add log init config abi definitions
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 77 lines checked
ac3f972644a5 drm/xe/guc: Add LFD related abi definitions
-:12: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#12: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 171 lines checked
750e6fbb0870 drm/xe/guc: Add GuC log init config in LFD format
9f17d2fb51e4 drm/xe/guc: Add GuC log event buffer output in LFD format
0c7019f71f30 drm/xe/guc: Only add GuC crash dump if available
a854164ed02e drm/xe/guc: Add new debugfs entry for lfd format output


