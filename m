Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D88ECA0EC4
	for <intel-xe@archiver.kernel.org>; Tue, 12 Aug 2025 14:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E023510E5FF;
	Tue, 12 Aug 2025 14:12:04 +0000 (UTC)
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420E610E5AC;
 Tue, 12 Aug 2025 06:59:44 +0000 (UTC)
X-UUID: e7f04eee774911f0b29709d653e92f7d-20250812
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:e46736c3-de8c-47f0-a283-047ffdd95743, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6493067, CLOUDID:9040537a3e6de48336df6fb7ddc47263,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:nil,UR
 L:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,S
 PR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e7f04eee774911f0b29709d653e92f7d-20250812
Received: from node2.com.cn [(10.44.16.197)] by mailgw.kylinos.cn
 (envelope-from <zhaoguohan@kylinos.cn>) (Generic MTA)
 with ESMTP id 545928281; Tue, 12 Aug 2025 14:59:35 +0800
Received: from node2.com.cn (localhost [127.0.0.1])
 by node2.com.cn (NSMail) with SMTP id 5FB40B8258E7;
 Tue, 12 Aug 2025 14:59:35 +0800 (CST)
X-ns-mid: postfix-689AE657-189842208
Received: from localhost.localdomain (unknown [10.42.12.87])
 by node2.com.cn (NSMail) with ESMTPA id DE2B4B812916;
 Tue, 12 Aug 2025 06:59:33 +0000 (UTC)
From: zhaoguohan@kylinos.cn
To: lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@gmail.com, simona@ffwll.ch
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, GuoHan Zhao <zhaoguohan@kylinos.cn>
Subject: [RESEND][PATCH] drm/xe/hwmon: Return early on power limit read failure
Date: Tue, 12 Aug 2025 14:59:30 +0800
Message-ID: <20250812065930.15847-1-zhaoguohan@kylinos.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 12 Aug 2025 14:12:03 +0000
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: GuoHan Zhao <zhaoguohan@kylinos.cn>

In xe_hwmon_pcode_rmw_power_limit(), when xe_pcode_read() fails,
the function logs the error but continues to execute the subsequent
logic. This can result in undefined behavior as the values val0 and
val1 may contain invalid data.

Fix this by adding an early return after logging the read failure,
ensuring that we don't proceed with potentially corrupted data.

Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
index f08fc4377d25..eb410c5293e7 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -190,9 +190,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const stru=
ct xe_hwmon *hwmon, u32 attr
 						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
 						  &val0, &val1);
=20
-	if (ret)
+	if (ret) {
 		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, =
ret %d\n",
 			channel, val0, val1, ret);
+			return ret;
+	}
=20
 	if (attr =3D=3D PL1_HWMON_ATTR)
 		val0 =3D (val0 & ~clr) | set;
--=20
2.43.0

