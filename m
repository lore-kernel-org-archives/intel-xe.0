Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D07D41C20
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 09:23:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7859D10E6BA;
	Wed, 13 Nov 2024 09:23:15 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81BDD10E6BA;
 Wed, 13 Nov 2024 09:23:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Flrc=3A_Rename?=
 =?utf-8?q?_desc_to_addr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 Nov 2024 09:23:14 -0000
Message-ID: <173148979452.3449415.2147296460987047517@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241112185515.64060-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241112185515.64060-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_lrc: Rename desc to addr
URL   : https://patchwork.freedesktop.org/series/141235/
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
commit ff5a39be05daa18d8209f028e61fec7f5a9758d0
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Tue Nov 12 18:55:15 2024 +0000

    drm/xe/xe_lrc: Rename desc to addr
    
    The qualifier "desc" as used in the xe_lrc_snapshot struct is a legacy
    term used by i915 that has been incorrectly applied to some of the
    attributes.  Said attributes that use the "desc" qualifier, namely
    "context_desc" and "indirect_context_desc", would more accurately be
    referred to as addresses, so replace the incorrect "desc" qualifier with
    "addr" in these cases.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: John Harrison <john.c.harrison@intel.com>
    CC: Matthew Brost <matthew.brost@intel.com>
    CC: Zhanjun Dong <zhanjun.dong@intel.com>
    CC: Alan Previn <alan.previn.teres.alexis@intel.com>
    CC: Matt Roper <matthew.d.roper@intel.com>
    Acked-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch cf3872e462498611b17e5f80f0b1d0900580da20 drm-intel
ff5a39be05da drm/xe/xe_lrc: Rename desc to addr


