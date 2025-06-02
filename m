Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 669A6C5AD49
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 11:27:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D2E10E501;
	Mon,  2 Jun 2025 11:27:59 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196CF10E500;
 Mon,  2 Jun 2025 11:27:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_More_missing_XeLP_workaro?=
 =?utf-8?q?unds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 11:27:58 -0000
Message-ID: <174886367810.40640.12537460947856026394@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250602111956.14854-1-tvrtko.ursulin@igalia.com>
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

Series: More missing XeLP workarounds (rev2)
URL   : https://patchwork.freedesktop.org/series/149097/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit e1a7de3ab8db77a9f757920dc5ae9f2e70e18e4f
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Mon Jun 2 12:19:56 2025 +0100

    drm/xe/xelp: Add Wa_18022495364
    
    Add Wa_18022495364 as a context workaround batch buffer workaround.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 0ff2ef88a1494322de07a29f25dabee399b4bd17 drm-intel
e92c2f084111 drm/xe: Clarify LRC size when allocating
76914899d6f9 drm/xe: Use iosys_map helpers for WA BB emission
-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com'
#14: 
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com

total: 1 errors, 0 warnings, 0 checks, 34 lines checked
23ce5660aea6 drm/xe: Prepare workaround batch buffer setup for more users
6b4ffc57da6f drm/xe: Add plumbing for indirect context workarounds
3e6324f3facc drm/xe/xelp: Implement Wa_16010904313
e1a7de3ab8db drm/xe/xelp: Add Wa_18022495364


