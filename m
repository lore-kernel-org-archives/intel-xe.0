Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798E0C71136
	for <intel-xe@archiver.kernel.org>; Fri, 13 Jun 2025 21:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0C910EA69;
	Fri, 13 Jun 2025 21:52:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7E310EA69;
 Fri, 13 Jun 2025 21:52:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Tweak_default_G?=
 =?utf-8?q?uC_log_level_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Jun 2025 21:52:26 -0000
Message-ID: <174985154663.78866.1411468881367920989@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
In-Reply-To: <20250613-guc-log-level-v2-0-cb84a63e49fe@intel.com>
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

Series: drm/xe: Tweak default GuC log level (rev2)
URL   : https://patchwork.freedesktop.org/series/150183/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f8ff75ae1d2127635239b134695774ed4045d05b
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2be111f0468a73e69e50fb206b37718c2e35a308
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri Jun 13 13:00:39 2025 -0700

    drm/xe: Normalize default param values
    
    Document xe module params with the default values following a similar
    strategy for all of them:
    
            1) Define a DEFAULT_* macro with the default value. When the
               value can't be directly stringified, also define a *_STR
               variant
            2) Use __stringify() or the _STR variant to make sure the
               default value shows up in the param description
    
    This allows us to show the correct default according to the
    configuration. max_vfs for example was wrongly documented for
    CONFIG_DRM_XE_DEBUG and svm_notifier_size didn't have its default
    documented.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 4d016d6e602638e0ebc3895331224e057508c07a drm-intel
5612509e25cd drm/xe/guc: Default log level to non-verbose
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
                          Test \ Log Level                        3      0      1      2

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
db4b27e00a56 drm/xe: Annotate default for guc_log_level param
2be111f0468a drm/xe: Normalize default param values


