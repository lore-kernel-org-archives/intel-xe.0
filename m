Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8D8C4167B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Nov 2023 00:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 843A810E35C;
	Wed, 29 Nov 2023 00:17:22 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F29B510E35C;
 Wed, 29 Nov 2023 00:17:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id EF6E3AA3D8;
 Wed, 29 Nov 2023 00:17:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Wed, 29 Nov 2023 00:17:20 -0000
Message-ID: <170121704097.12092.10275459393748175415@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231128203203.1147-1-michal.wajdeczko@intel.com>
In-Reply-To: <20231128203203.1147-1-michal.wajdeczko@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/3=5D_drm/xe/guc=3A_Drop_ancient_GuC_CTB?=
 =?utf-8?q?_definitions?=
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

Series: series starting with [1/3] drm/xe/guc: Drop ancient GuC CTB definitions
URL   : https://patchwork.freedesktop.org/series/127010/
State : success

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
commit 500ebc2558063ebc90bc5f2108224f4f62f6e1f0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Nov 28 21:32:03 2023 +0100

    drm/xe/guc: Include only required GuC ABI headers
    
    On i915 we were adding new GuC ABI headers directly to guc_fwif.h
    file since we were replacing old definitions from that file.
    
    On xe driver we could do more and better by including ABI headers
    only in files that need those definitions.
    
    Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/741
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch b06c9f366cd09b888be061d23eecffed7139c09b drm-intel
27ee4d111 drm/xe/guc: Drop ancient GuC CTB definitions
d5629ed1a drm/xe/guc: Remove obsolete GuC CTB documentation
500ebc255 drm/xe/guc: Include only required GuC ABI headers


