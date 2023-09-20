Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0C5CE79AB
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 08:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FCA10E450;
	Wed, 20 Sep 2023 08:12:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6254010E450;
 Wed, 20 Sep 2023 08:12:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 640F5A0093;
 Wed, 20 Sep 2023 08:12:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Date: Wed, 20 Sep 2023 08:12:04 -0000
Message-ID: <169519752440.6465.1410934341767745225@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20230920071700.434195-1-chaitanya.kumar.borah@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Us?=
 =?utf-8?q?e_common_wrapper_to_get_step_name_=28rev2=29?=
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

Series: Use common wrapper to get step name (rev2)
URL   : https://patchwork.freedesktop.org/series/123857/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 125d557ba8fc53d331f42cbb3532e506a3466515
Author: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Date:   Wed Sep 20 12:47:00 2023 +0530

    drm/i915/dmc: Use common wrapper to get step name
    
    Use wrapper common for both xe and i915 to get the display step name.
    
    This patch partially reverts the changes made in
    
    commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")
    
    TODO: Find cleaner solution for rest(not stepping related) of the Fixme
          patch
    
    Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
    Signed-off-by: Animesh Manna <animesh.manna@intel.com>
+ /mt/dim checkpatch b3b5f51b66e9f1bf5aecef46446c4e7c49146834 drm-intel
661fa6de3 drm/i915: Add wrapper for xe compatibility
7c6359104 drm/xe: Add wrapper over intel_step_name
125d557ba drm/i915/dmc: Use common wrapper to get step name
-:10: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8c4154824537', maybe rebased or not pulled?
#10: 
commit 8c4154824537 ("FIXME: drm/i915/dmc: xe way of getting at stepping")

total: 0 errors, 1 warnings, 0 checks, 13 lines checked


