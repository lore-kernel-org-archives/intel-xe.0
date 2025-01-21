Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1488BC02182
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jan 2025 09:36:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9ED510E1CB;
	Tue, 21 Jan 2025 09:36:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D046D10E1CB;
 Tue, 21 Jan 2025 09:36:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Extended_Wake_Timeout_=28?=
 =?utf-8?q?rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 21 Jan 2025 09:36:57 -0000
Message-ID: <173745221784.2537450.13944986412427371864@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
In-Reply-To: <20250121060522.1296166-1-suraj.kandpal@intel.com>
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

Series: Extended Wake Timeout (rev3)
URL   : https://patchwork.freedesktop.org/series/142516/
State : success

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
commit e3241c67ce9630b912987c60c535857e11eab579
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Jan 21 11:35:22 2025 +0530

    drm/i915/lttpr: Enable Extended Wake Timeout
    
    Usually retimers take around 30 to 40ms to exit all devices from
    sleep state. Extended wake timeout mechanism helps to give
    that additional time.
    
    --v2
    -Grant the requested time only if greater than 1ms [Arun/Jani]
    -Reframe commit message [Arun]
    
    --v3
    -Move the function to drm_core [Dmitry/Jani]
    
    Spec: DP v2.1 Section 3.6.12.3
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch bb123c6e757601d42f71952d879b35f97472d56b drm-intel
c6c24ed0630d drm/dp: Add the DPCD register required for Extended wake timeout
ef5e22b13cb0 drm/display/dp: Define function to setup Extended wake time
e3241c67ce96 drm/i915/lttpr: Enable Extended Wake Timeout


