Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0E45C52D6F
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 09:11:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9F810E327;
	Tue,  6 Aug 2024 09:11:56 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6F010E327;
 Tue,  6 Aug 2024 09:11:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pm=3A_Change_HPD_t?=
 =?utf-8?q?o_polling_on_runtime_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 09:11:54 -0000
Message-ID: <172293551495.542712.18382892271604852283@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806085513.3051107-1-arun.r.murthy@intel.com>
In-Reply-To: <20240806085513.3051107-1-arun.r.murthy@intel.com>
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

Series: drm/xe/pm: Change HPD to polling on runtime suspend
URL   : https://patchwork.freedesktop.org/series/136916/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a93b19e1fe9b5150ed1a5361e3733cc4a33b2499
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Tue Aug 6 14:25:13 2024 +0530

    drm/xe/pm: Change HPD to polling on runtime suspend
    
    HPD is interrupt based and on runtime suspend change it to polling as
    HPD is not a wakeup event. A worker thread is scheduled for doing this
    polling and it keeps polling for HPD live status on an internval of 10s.
    On runtime resume disable polling and fallback to interrupt mechanism.
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 28edc41db567c4c555fff23119c10d39689131c2 drm-intel
a93b19e1fe9b drm/xe/pm: Change HPD to polling on runtime suspend


