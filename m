Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D59C3DA6E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 01:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE7210E0A5;
	Sat,  6 Jan 2024 01:44:29 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CFB610E099;
 Sat,  6 Jan 2024 01:44:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Only_take_a?=
 =?utf-8?q?ctions_in_CT_irq_handler_if_CTs_are_enabled_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 06 Jan 2024 01:44:27 -0000
Message-ID: <170450546725.40937.8469465192217635105@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105203431.1329368-1-matthew.brost@intel.com>
In-Reply-To: <20240105203431.1329368-1-matthew.brost@intel.com>
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

Series: drm/xe/guc: Only take actions in CT irq handler if CTs are enabled (rev3)
URL   : https://patchwork.freedesktop.org/series/128129/
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
commit 52c8b539960af01c48dae1a3bee413aaaf021f32
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Fri Jan 5 12:34:31 2024 -0800

    drm/xe/guc: Only take actions in CT irq handler if CTs are enabled
    
    Protect entire IRQ handler by CT being enabled rather than just G2H
    handler.
    
    v2: Return on not enabled in CT irq handler (Michal)
    
    Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch cca0607b6f6a21bee68c092ed7ad9f3322e54523 drm-intel
52c8b5399 drm/xe/guc: Only take actions in CT irq handler if CTs are enabled


