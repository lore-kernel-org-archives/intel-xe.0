Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA113C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 23:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8C7410E31B;
	Thu, 14 Dec 2023 23:00:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 78D9510E920;
 Thu, 14 Dec 2023 23:00:18 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 0BAF8AADFA;
 Thu, 14 Dec 2023 23:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe=3A_Return_error_if_drm=5Fbuddy=5Finit=28=29_fails?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Thu, 14 Dec 2023 23:00:18 -0000
Message-ID: <170259481804.19959.63349468578892907@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214213954.3223263-1-lucas.demarchi@intel.com>
In-Reply-To: <20231214213954.3223263-1-lucas.demarchi@intel.com>
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

Series: series starting with [1/3] drm/xe: Return error if drm_buddy_init() fails
URL   : https://patchwork.freedesktop.org/series/127845/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ed48d01ab932fb5b4dda55c86d6ab77314e36e16
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Dec 14 13:39:54 2023 -0800

    drm/xe: Enable W=1 warnings by default
    
    Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")
    for i915, enable W=1 warnings by default in xe.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c drm-intel
0ec8c55bd drm/xe: Return error if drm_buddy_init() fails
e91d77a66 drm/xe/bo: Remove unusued variable
ed48d01ab drm/xe: Enable W=1 warnings by default
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")

-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '2250c7ead8ad', maybe rebased or not pulled?
#6: 
Like done in commit 2250c7ead8ad ("drm/i915: enable W=1 warnings by default")

total: 0 errors, 2 warnings, 0 checks, 53 lines checked


