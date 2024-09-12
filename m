Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F42EEE6442
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 05:25:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF76510E1EB;
	Thu, 12 Sep 2024 05:25:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DDF10E1EB;
 Thu, 12 Sep 2024 05:25:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Some_correction_in_the_DP?=
 =?utf-8?q?_Link_Training_dequence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Sep 2024 05:25:50 -0000
Message-ID: <172611875052.989681.2471273638045084995@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240912050552.779356-1-arun.r.murthy@intel.com>
In-Reply-To: <20240912050552.779356-1-arun.r.murthy@intel.com>
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

Series: Some correction in the DP Link Training dequence
URL   : https://patchwork.freedesktop.org/series/138551/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 330dbc61d44753b9678d5c74dba5f6040b1f5998
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Thu Sep 12 10:35:52 2024 +0530

    drm/i915/dp: Include the time taken by AUX Tx for timeout
    
    As per DP spec the timeout for LANE_CHANNEL_EQ_DONE is 400ms. But this
    timeout value is exclusively for the Aux RD Interval and excludes the
    time consumed for the AUX Tx (i.e reading/writing FFE presets). Add
    another 50ms for these AUX Tx to the 400ms timeout.
    
    Signed-off-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 1b37d4587b45639327eeb4cce29f77d487f7700a drm-intel
4160272fe37f drm/i915/dp: use fsleep instead of usleep_rage for LT
c4403c875ca4 drm/i915/dp: read Aux RD interval after reading the FFE preset
330dbc61d447 drm/i915/dp: Include the time taken by AUX Tx for timeout


