Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD50D111A5
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 04:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2365010E371;
	Mon,  4 Nov 2024 04:50:07 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5674910E371;
 Mon,  4 Nov 2024 04:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_series_starting_with_=5BR?=
 =?utf-8?q?ESEND=2CPATCHv2=2C1/3=5D_drm/i915/dp=3A_use_fsleep_instead_of_usl?=
 =?utf-8?q?eep=5Frange_for_LT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 04:50:05 -0000
Message-ID: <173069580534.1389949.14156639750010167792@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104035859.3796797-1-arun.r.murthy@intel.com>
In-Reply-To: <20241104035859.3796797-1-arun.r.murthy@intel.com>
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

Series: series starting with [RESEND,PATCHv2,1/3] drm/i915/dp: use fsleep instead of usleep_range for LT
URL   : https://patchwork.freedesktop.org/series/140855/
State : warning

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
commit 1c126593a6f781566d51fb0396a9bd12a2c17201
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Mon Nov 4 09:28:59 2024 +0530

    drm/i915/dp: Include the time taken by AUX Tx for timeout
    
    As per DP spec the timeout for LANE_CHANNEL_EQ_DONE is 400ms. But this
    timeout value is exclusively for the Aux RD Interval and excludes the
    time consumed for the AUX Tx (i.e reading/writing FFE presets). Add
    another 50ms for these AUX Tx to the 400ms timeout.
    Ref: "Figure 3-52: 128b132b DP DPTC LANEx_CHANNEL_EQ_DONE Sequence" of
    DP2.1a spec.
    
    Co-developed-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Acked-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch e1ed3c4d5631c655c0b97dd481b5334d67ccc8e6 drm-intel
c7f28ae1c2e7 drm/i915/dp: use fsleep instead of usleep_range for LT
-:12: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#12: 
Co-developed-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

total: 0 errors, 1 warnings, 0 checks, 24 lines checked
5d0e1c6d1fb1 drm/i915/dp: read Aux RD interval just before setting the FFE preset
-:14: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#14: 
Co-developed-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

total: 0 errors, 1 warnings, 0 checks, 28 lines checked
1c126593a6f7 drm/i915/dp: Include the time taken by AUX Tx for timeout
-:13: WARNING:BAD_SIGN_OFF: Co-developed-by and Signed-off-by: name/email do not match
#13: 
Co-developed-by: Srikanth V NagaVenkata <nagavenkata.srikanth.v@intel.com>
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>

total: 0 errors, 1 warnings, 0 checks, 8 lines checked


