Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78A7D111A3
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 04:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7257710E36C;
	Mon,  4 Nov 2024 04:05:45 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7833810E36C;
 Mon,  4 Nov 2024 04:05:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Fix_when?=
 =?utf-8?q?_the_first_read_and_write_are_retried?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 04 Nov 2024 04:05:44 -0000
Message-ID: <173069314448.1389734.5083509305730338426@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241104035951.517837-1-suraj.kandpal@intel.com>
In-Reply-To: <20241104035951.517837-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Fix when the first read and write are retried
URL   : https://patchwork.freedesktop.org/series/140853/
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
commit b043d3315f0461eb63decce64be15087f3aebfb9
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Nov 4 09:29:51 2024 +0530

    drm/i915/hdcp: Fix when the first read and write are retried
    
    Make sure that the first read/write in hdcp2_authentication_key_exchange
    are only retried when we have either DP/DPMST encoder connected,
    since we do this to give docks and dp encoders some extra time to
    get their HDCP DPCD registers ready only for DP/DPMST encoders as
    this issue is only observed here no need to burden other encoders
    with extra retries as this causes the HDMI connector to have some
    other timing issue and fails HDCP authentication.
    
    --v2
    -Add intent of patch [Chaitanya]
    -Add reasoning for loop [Jani]
    -Make sure we forfiet the 50ms wait for non DP/DPMST encoders.
    
    --v3
    -Remove the is_dp_encoder check [Jani/Chaitanya]
    -Make the commit message more clearer [Jani]
    
    Fixes: 9d5a05f86d2f ("drm/i915/hdcp: Retry first read and writes to downstream")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
    Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
+ /mt/dim checkpatch e1ed3c4d5631c655c0b97dd481b5334d67ccc8e6 drm-intel
b043d3315f04 drm/i915/hdcp: Fix when the first read and write are retried


