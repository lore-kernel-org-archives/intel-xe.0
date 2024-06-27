Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B33C30653
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 23:56:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F5710E1AF;
	Thu, 27 Jun 2024 23:56:25 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D011D10E1AF;
 Thu, 27 Jun 2024 23:56:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Get_hwe_domain_?=
 =?utf-8?q?specific_FW_to_read_RING=5FTIMESTAMP_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Jun 2024 23:56:24 -0000
Message-ID: <171953258485.165875.16374173896008126273@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240627235105.2631135-1-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20240627235105.2631135-1-umesh.nerlige.ramappa@intel.com>
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

Series: drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP (rev2)
URL   : https://patchwork.freedesktop.org/series/135370/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9af9408dd2733552e80d12c52e38e9bd2a328ea1
Author: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date:   Thu Jun 27 16:51:05 2024 -0700

    drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP
    
    Per client engine utilization uses RING_TIMESTAMP to return
    drm-total-cycles to the user. Current code uses XE_FW_GT to read this
    register on the first available engine in a GT. When testing on DG2, it
    is observed that this value is 0 when running test on some engines. To
    resolve that, get the hwe domain specific FW for reading the engine
    timestamp.
    
    v2:
    - update commit message
    - use domain specific FW (Matt)
    
    v3:
    - Drop check for hwe in the helper (Matt, Michal)
    
    v4:
    - checkpatch fixes
    
    v5: Rebase
    
    Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
    Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 136e579ec9cc0e020af2b9adee34798fdb748172 drm-intel
9af9408dd273 drm/xe: Get hwe domain specific FW to read RING_TIMESTAMP


