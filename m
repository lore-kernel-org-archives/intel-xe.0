Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A00C4332F
	for <intel-xe@archiver.kernel.org>; Wed, 13 Dec 2023 01:06:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79A4810E1FA;
	Wed, 13 Dec 2023 01:06:15 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9C9FB10E1FA;
 Wed, 13 Dec 2023 01:06:13 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 99FE1AADDD;
 Wed, 13 Dec 2023 01:06:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_duplicat?=
 =?utf-8?q?e_RING=5FMAX=5FNONPRIV=5FSLOTS_definition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Wed, 13 Dec 2023 01:06:13 -0000
Message-ID: <170242957362.10260.12091879339873797465@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212215603.2041841-2-matthew.d.roper@intel.com>
In-Reply-To: <20231212215603.2041841-2-matthew.d.roper@intel.com>
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

Series: drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition
URL   : https://patchwork.freedesktop.org/series/127718/
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
commit 1f75fb5388f7eb6ebc2c8bc745daf0d8ecee455d
Author: Matt Roper <matthew.d.roper@intel.com>
Date:   Tue Dec 12 13:56:04 2023 -0800

    drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition
    
    The engine register header wound up with two definitions for
    RING_MAX_NONPRIV_SLOTS, likely due to a rebase mistake.  Keep the
    definition that's in an appropriate place (i.e., with the
    FORCE_TO_NONPRIV register definition) and remove the other.
    
    Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b7e6b29e607e7c75765d77d4ae315dec580d1ccc drm-intel
1f75fb538 drm/xe: Remove duplicate RING_MAX_NONPRIV_SLOTS definition


