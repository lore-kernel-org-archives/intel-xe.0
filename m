Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43435CDB47E
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 05:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12FBD10E5A3;
	Fri, 13 Oct 2023 05:39:53 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id E9AC710E5A0;
 Fri, 13 Oct 2023 05:39:50 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id E7DBAAADE3;
 Fri, 13 Oct 2023 05:39:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Date: Fri, 13 Oct 2023 05:39:50 -0000
Message-ID: <169717559094.31155.6284266012923038326@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013053455.835094-1-suraj.kandpal@intel.com>
In-Reply-To: <20231013053455.835094-1-suraj.kandpal@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re?=
 =?utf-8?q?move_Stubs_in_HDCP_code_=28rev5=29?=
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

Series: Remove Stubs in HDCP code (rev5)
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
commit 50aaa98aae2d30b9165c497d454de6b35a94bd41
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Oct 13 11:04:56 2023 +0530

    drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe
    
    Define intel_hdcp_gsc_check_status in Xe to account
    for changes in i915 and Xe.
    
    --v5
    -Define intel_hdcp_gsc_cs_required()
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 6c0d1e36f310682297a5b07336b0883afc77f66e drm-intel
600813558 Revert "FIXME: drm/i915: xe doesn't have gsc hdcp interface or something"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '76d83e375beccee979a13284dc8a8079cc1ba020', maybe rebased or not pulled?
#7: 
This reverts commit 76d83e375beccee979a13284dc8a8079cc1ba020.

total: 0 errors, 1 warnings, 0 checks, 56 lines checked
c79195cc6 drm/i915/hdcp: Move checks for gsc health status
50aaa98aa drm/xe/hdcp: Define intel_hdcp_gsc_check_status in Xe


