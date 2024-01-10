Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C730CC4707B
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jan 2024 16:50:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E03F10E62A;
	Wed, 10 Jan 2024 16:50:57 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8AFE10E62A;
 Wed, 10 Jan 2024 16:50:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BC?=
 =?utf-8?q?I=2C1/2=5D_Revert_=22mei/hdcp=3A_Also_enable_for_XE=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 10 Jan 2024 16:50:55 -0000
Message-ID: <170490545595.240792.16576482844435032528@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240110155645.523818-1-thomas.hellstrom@linux.intel.com>
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

Series: series starting with [CI,1/2] Revert "mei/hdcp: Also enable for XE"
URL   : https://patchwork.freedesktop.org/series/128437/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
414601bf14e77eeb048ecf6d1c25190801399524
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4161243c15a9f13d13b20f0fcdb9feddea35b382
Author: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Date:   Wed Jan 10 16:56:45 2024 +0100

    Revert "mei: gsc: add support for auxiliary device created by Xe driver"
    
    This reverts commit bea27d7369855e586d22c3e45b155e8e5eecaa7f.
+ /mt/dim checkpatch d6ef9c52d8d2ae4c85bc598b74a259db081fff26 drm-intel
c73d2c990 Revert "mei/hdcp: Also enable for XE"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '52383b58eb8cf7d6a090928c568dfbe5560f848a', maybe rebased or not pulled?
#6: 
This reverts commit 52383b58eb8cf7d6a090928c568dfbe5560f848a.

-:9: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:34: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 17 lines checked
4161243c1 Revert "mei: gsc: add support for auxiliary device created by Xe driver"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'bea27d7369855e586d22c3e45b155e8e5eecaa7f', maybe rebased or not pulled?
#7: 
This reverts commit bea27d7369855e586d22c3e45b155e8e5eecaa7f.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:30: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 16 lines checked


