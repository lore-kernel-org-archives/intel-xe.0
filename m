Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE112C54791
	for <intel-xe@archiver.kernel.org>; Wed, 13 Mar 2024 11:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762F510F55C;
	Wed, 13 Mar 2024 11:24:06 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0EBF10F55C;
 Wed, 13 Mar 2024 11:24:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_LMTT_improvements_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Mar 2024 11:24:03 -0000
Message-ID: <171032904385.730296.1445000999567606627@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313104132.1045-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240313104132.1045-1-michal.wajdeczko@intel.com>
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

Series: LMTT improvements (rev2)
URL   : https://patchwork.freedesktop.org/series/129855/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
a9eb1ac8298ef9f9146567c29fa762d8e9efa1ef
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7e8185a3de2a656928e273fb60016be21e68faa0
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Mar 13 11:41:32 2024 +0100

    drm/xe/pf: Always select Multi-Level LMTT for platforms 12.60+
    
    The Multi-Level LMTT variant is not specific only to the PVC.
    Change logic to select it for all new platforms beyond 12.60.
    
    Bspec: 52404, 67468
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c323e03ff602c24e09dd579aae3e1c2ceb4b8531 drm-intel
e39436e75cdf drm/xe: Allow VRAM BO allocations aligned to 64K
db65c8a5ba82 drm/xe/pf: Request 64K aligned allocations for LMTT PD
7e8185a3de2a drm/xe/pf: Always select Multi-Level LMTT for platforms 12.60+
-:14: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Rodrigo Vivi <rodrigo.vivi@intel.com'
#14: 
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com

total: 1 errors, 0 warnings, 0 checks, 8 lines checked


