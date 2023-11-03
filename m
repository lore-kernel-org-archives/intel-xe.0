Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48447C4332F
	for <intel-xe@archiver.kernel.org>; Fri,  3 Nov 2023 06:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0416F10E3B8;
	Fri,  3 Nov 2023 06:13:13 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 83D3510E3B8;
 Fri,  3 Nov 2023 06:13:10 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 81A2DAADF5;
 Fri,  3 Nov 2023 06:13:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Haridhar Kalvala" <haridhar.kalvala@intel.com>
Date: Fri, 03 Nov 2023 06:13:10 -0000
Message-ID: <169899199052.29105.7963889339643524225@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103054641.3311585-1-haridhar.kalvala@intel.com>
In-Reply-To: <20231103054641.3311585-1-haridhar.kalvala@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Add_Wa=5F14019877138?=
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

Series: drm/xe: Add Wa_14019877138
URL   : https://patchwork.freedesktop.org/series/125942/
State : success

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
commit 6b1786461cf900cbb324924848951490e85640fc
Author: Haridhar Kalvala <haridhar.kalvala@intel.com>
Date:   Fri Nov 3 11:16:41 2023 +0530

    drm/xe: Add Wa_14019877138
    
    Enable Force Dispatch Ends Collection for DG2.
    
    BSpec: 46001
    
    Signed-off-by: Haridhar Kalvala <haridhar.kalvala@intel.com>
+ /mt/dim checkpatch 58dfdb8dc78e5668f9891c798ec3191863c1e0d2 drm-intel
6b1786461 drm/xe: Add Wa_14019877138


