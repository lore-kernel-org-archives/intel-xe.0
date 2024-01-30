Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB6BC46CD2
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 14:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2928B10E92C;
	Tue, 30 Jan 2024 14:51:51 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71CA113166;
 Tue, 30 Jan 2024 14:51:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?4=2C1/2=5D_drm/xe=3A_Add_functions_to_convert_regular_address_to_?=
 =?utf-8?q?canonical_address_and_back?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 30 Jan 2024 14:51:49 -0000
Message-ID: <170662630994.824492.14952893172643091129@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130135648.30211-1-jose.souza@intel.com>
In-Reply-To: <20240130135648.30211-1-jose.souza@intel.com>
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

Series: series starting with [v4,1/2] drm/xe: Add functions to convert regular address to canonical address and back
URL   : https://patchwork.freedesktop.org/series/129314/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 78f7436b34a8457c1a01ac8736a3f84536b2f8eb
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Jan 30 05:56:48 2024 -0800

    drm/xe: Add batch buffer addresses to devcoredump
    
    Those addresses are necessary to Mesa tools knows where in VM are the
    batch buffers to parse and print instructions that are human readable.
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Maarten Lankhorst <dev@lankhorst.se>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch c655e0fd28045dbaa581d04bf7cc266eec1c3457 drm-intel
8ff04f2f3 drm/xe: Add functions to convert regular address to canonical address and back
78f7436b3 drm/xe: Add batch buffer addresses to devcoredump


