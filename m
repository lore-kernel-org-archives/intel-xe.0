Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379EBCAC58E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 17:02:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF3E10E4CC;
	Tue, 17 Sep 2024 17:02:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D891410E4CC;
 Tue, 17 Sep 2024 17:02:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe2=3A_Extend_perf?=
 =?utf-8?q?ormance_tuning_to_media_GT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Sep 2024 17:02:05 -0000
Message-ID: <172659252588.1022864.11528087102384885607@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240917165400.40592-1-gustavo.sousa@intel.com>
In-Reply-To: <20240917165400.40592-1-gustavo.sousa@intel.com>
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

Series: drm/xe/xe2: Extend performance tuning to media GT
URL   : https://patchwork.freedesktop.org/series/138776/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 60bb3c6341bc6fe7c13228a6ec7cb8c6ee7e1ea4
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Tue Sep 17 13:53:54 2024 -0300

    drm/xe/xe2: Extend performance tuning to media GT
    
    With exception of "Tuning: L3 cache - media", we are currently applying
    recommended performance tuning settings only for the primary GT. Let's
    also apply them to the media GT when applicable.
    
    According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
    only in Xe2_LPM and their offsets do not match their primary GT
    counterparts. As such, we need to have Xe2_LPM-specific definitions for
    them and apply the setting only for that specific IP.
    
    Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and the
    offset on the media GT matches the one on the primary one, so we can use
    the common definition and apply the setting to both IPs.
    
    Bspec: 72161
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 38e1b615fb395b928e514108e908cd6edf3d34c3 drm-intel
60bb3c6341bc drm/xe/xe2: Extend performance tuning to media GT


