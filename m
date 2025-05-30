Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA5ACC5AD49
	for <intel-xe@archiver.kernel.org>; Fri, 30 May 2025 22:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7503B10E8A8;
	Fri, 30 May 2025 22:38:09 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744B710E8A8;
 Fri, 30 May 2025 22:38:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/hwmon=3A_Simplify_?=
 =?utf-8?q?and_fix_32b_wrap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 May 2025 22:38:08 -0000
Message-ID: <174864468847.36692.6437343589662277381@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250530-xe-hwmon-wrap-v2-1-ce653db7fe4a@intel.com>
In-Reply-To: <20250530-xe-hwmon-wrap-v2-1-ce653db7fe4a@intel.com>
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

Series: drm/xe/hwmon: Simplify and fix 32b wrap (rev2)
URL   : https://patchwork.freedesktop.org/series/149657/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d1ad31de0f8750f153da94ad4c6f97e550b6f9ab
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Fri May 30 15:31:57 2025 -0700

    drm/xe/hwmon: Simplify and fix 32b wrap
    
    Like done in commit eaa287069a70 ("drm/xe/guc_submit: Simplify and fix
    
    diff calculation"), just use u32 for wrapping the value, which is
    simpler and more correct: when wrapping on 32b, the accumulated value
    was off by one.
    
    Also, do not mix the u64 value from pmt with the u32 value used for the
    calculation.
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Raag Jadav <raag.jadav@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 32a1df707ffe59a58d6ab05e62802932ed789b52 drm-intel
d1ad31de0f87 drm/xe/hwmon: Simplify and fix 32b wrap
-:6: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit eaa287069a70 ("drm/xe/guc_submit: Simplify and fix diff calculation")'
#6: 
Like done in commit eaa287069a70 ("drm/xe/guc_submit: Simplify and fix

total: 1 errors, 0 warnings, 0 checks, 44 lines checked


