Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B49CC3ABCC
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 14:32:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24A410E659;
	Wed, 14 May 2025 14:32:36 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7D610E287;
 Wed, 14 May 2025 14:32:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=5Fsubmit=3A_Si?=
 =?utf-8?q?mplify_and_fix_diff_calculation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 14:32:35 -0000
Message-ID: <174723315545.77995.3612969195551757316@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
In-Reply-To: <20250513-time-wrap-v1-1-fba9a69a65c8@intel.com>
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

Series: drm/xe/guc_submit: Simplify and fix diff calculation
URL   : https://patchwork.freedesktop.org/series/148966/
State : success

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
commit d20baccd37795386208c0f6d0ba2f7c7eee62257
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue May 13 07:25:49 2025 -0700

    drm/xe/guc_submit: Simplify and fix diff calculation
    
    With a u32 type, there's no need to check which one is greater: the
    current is always the latest and if it's less than the previous, it's
    because it wrapped: just do the unsigned calculation that will lead to
    the same result, or better the correct one. It fixes an off-by-one in
    the wrapped calculation, however that doesn't really matter for the
    timeout calculation.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch dd6a856541dd90fa4ef755783898fcfbea3b9961 drm-intel
d20baccd3779 drm/xe/guc_submit: Simplify and fix diff calculation


