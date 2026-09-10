Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA36C79FBB
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 22:18:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3B10EBD0;
	Thu, 10 Sep 2026 22:18:09 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C73A10EBD0;
 Thu, 10 Sep 2026 22:18:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/2=5D_drm/xe=3A_Inspect_all_forcewake_bits_for_runtime_idlen?=
 =?utf-8?q?ess?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 22:18:08 -0000
Message-ID: <178907868817.147924.9391305246748881424@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20260910215756.2393137-1-vinay.belgaumkar@intel.com>
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

Series: series starting with [v3,1/2] drm/xe: Inspect all forcewake bits for runtime idleness
URL   : https://patchwork.freedesktop.org/series/173817/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
d875049d2b299159a272bd5151994970cdcd1e31
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6939cdd54f64ce9a206fd6c5665fa0c4d989771e
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Thu Sep 10 14:57:56 2026 -0700

    drm/xe: Poll GT for C6 before D3
    
    Check if GTs are in C6 before transitioning to D3. PM subsystem can
    retry if this is not the case. This ensures some component is not
    accessing the GT when D3 state is forced. This check can be added
    to the runtime idle check since it helps to check for pending
    forcewakes as well before we poll for GT C6.
    
    v2: Force resume when we cancel suspend due to C6 check (Sashiko)
    v3: Abort the suspend properly when idle check fails (Sashiko)
    
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch cf3f6830cd1a44f792534b4f5695c5ca7a69943d drm-intel
77ef7baa2596 drm/xe: Inspect all forcewake bits for runtime idleness
6939cdd54f64 drm/xe: Poll GT for C6 before D3
-:18: WARNING:BAD_SIGN_OFF: Duplicate signature
#18: 
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

total: 0 errors, 1 warnings, 0 checks, 91 lines checked


