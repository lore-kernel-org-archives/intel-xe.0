Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE318E7718A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Dec 2024 22:51:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7027F10EE08;
	Thu, 19 Dec 2024 22:51:40 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6D110EE08;
 Thu, 19 Dec 2024 22:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Reduc?=
 =?utf-8?q?e_global_state_funcs_boilerplate?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Dec 2024 22:51:38 -0000
Message-ID: <173464869864.549164.512050578501978712@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241219214909.104869-1-gustavo.sousa@intel.com>
In-Reply-To: <20241219214909.104869-1-gustavo.sousa@intel.com>
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

Series: drm/i915/display: Reduce global state funcs boilerplate
URL   : https://patchwork.freedesktop.org/series/142852/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6eb53343503f649120fdacbb46463c19ebfef4c8
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Dec 19 18:48:38 2024 -0300

    drm/i915/display: Use INTEL_GLOBAL_STATE_DEFAULTS
    
    Reduce global state boilerplate by using INTEL_GLOBAL_STATE_DEFAULTS().
    The only case that requires customization is for the duplication of
    CDCLK state, which is resolved by wrapping the generic implementation.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel>
+ /mt/dim checkpatch 08a1cca88fef345cd29ee5f00fac2963b3647e99 drm-intel
b0d521ff8207 drm/i915/display: Do not assume zero offset when duplicating global state
a8d84a342969 drm/i915/display: Add infra to reduce global state funcs boilerplate
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
           INTEL_GLOBAL_STATE_DEFAULTS(struct <prefix>_state, <base_member_name>),

total: 0 errors, 1 warnings, 0 checks, 93 lines checked
6eb53343503f drm/i915/display: Use INTEL_GLOBAL_STATE_DEFAULTS


