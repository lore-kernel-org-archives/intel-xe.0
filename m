Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B110C54FB3
	for <intel-xe@archiver.kernel.org>; Mon, 26 May 2025 21:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E435510E3AE;
	Mon, 26 May 2025 21:10:38 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B243210E029;
 Mon, 26 May 2025 21:10:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/dp=3A_Fix_Write=5FSta?=
 =?utf-8?q?tus=5FUpdate=5FRequest_AUX_request_format?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wayne Lin" <wayne.lin@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 May 2025 21:10:37 -0000
Message-ID: <174829383772.21444.5065795919938484560@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250509092218.805771-1-Wayne.Lin@amd.com>
In-Reply-To: <20250509092218.805771-1-Wayne.Lin@amd.com>
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

Series: drm/dp: Fix Write_Status_Update_Request AUX request format
URL   : https://patchwork.freedesktop.org/series/148889/
State : success

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
commit e40594ac9146f1302711f091fb8aeda32862c6ce
Author: Wayne Lin <Wayne.Lin@amd.com>
Date:   Fri May 9 17:22:18 2025 +0800

    drm/dp: Fix Write_Status_Update_Request AUX request format
    
    [Why]
    Notice AUX request format of I2C-over-AUX with
    Write_Status_Update_Request flag set is incorrect. It should
    be address only request without length and data like:
    "SYNC->COM3:0 (= 0110)|0000-> 0000|0000->
    0|7-bit I2C address (the same as the last)-> STOP->".
    
    [How]
    Refer to DP v2.1 Table 2-178, correct the
    Write_Status_Update_Request to be address only request.
    
    Note that we might receive 0 returned by aux->transfer() when
    receive reply I2C_ACK|AUX_ACK of Write_Status_Update_Request
    transaction. Which indicating all data bytes get written.
    We should avoid to return 0 bytes get transferred under this
    case.
    
    V2:
    - Add checking condition before restoring msg->buffer and
      msg->size. (Limonciello Mario)
    - Revise unclear comment to appropriately describe the idea.
      (Jani Nikula)
    
    Fixes: 68ec2a2a2481 ("drm/dp: Use I2C_WRITE_STATUS_UPDATE to drain partial I2C_WRITE requests")
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: Mario Limonciello <mario.limonciello@amd.com>
    Cc: Harry Wentland <harry.wentland@amd.com>
    Cc: stable@vger.kernel.org
    Signed-off-by: Wayne Lin <Wayne.Lin@amd.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
e40594ac9146 drm/dp: Fix Write_Status_Update_Request AUX request format


