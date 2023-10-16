Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2392CDB482
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 09:21:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E52010E1A4;
	Mon, 16 Oct 2023 09:21:36 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F340610E171;
 Mon, 16 Oct 2023 09:21:33 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id F17B0A3ECB;
 Mon, 16 Oct 2023 09:21:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Date: Mon, 16 Oct 2023 09:21:33 -0000
Message-ID: <169744809398.13508.5743188122662110037@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231016090139.850525-1-suraj.kandpal@intel.com>
In-Reply-To: <20231016090139.850525-1-suraj.kandpal@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?move_Stubs_in_HDCP_code_=28rev6=29?=
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

Series: Remove Stubs in HDCP code (rev6)
URL   : https://patchwork.freedesktop.org/series/124093/
State : warning

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
commit 93816db4c6bd359b0330995eab89f9e8f17b3f6f
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Oct 16 14:31:41 2023 +0530

    drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
    
    Define intel_hdcp_gsc_check_status in Xe to account
    for changes in i915 and Xe.
    intel_hdcp_check_status always returns false as gsc cs
    interface is not yet ported.
    intel_hdcp_gsc_cs_required always returns true as going
    forward gsc cs will always be required by upcoming
    platforms
    
    --v5
    -Define intel_hdcp_gsc_cs_required()
    
    --v6
    -Explain reasons for the return values [Chaitanya]
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch ab7cd1b4af95baba2d6ce5487d35ffda523e895d drm-intel
b11763675 Revert "FIXME: drm/i915: xe doesn't have gsc hdcp interface or something"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '76d83e375beccee979a13284dc8a8079cc1ba020', maybe rebased or not pulled?
#7: 
This reverts commit 76d83e375beccee979a13284dc8a8079cc1ba020.

total: 0 errors, 1 warnings, 0 checks, 56 lines checked
b2644940a drm/i915/hdcp: Move checks for gsc health status
93816db4c drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe


