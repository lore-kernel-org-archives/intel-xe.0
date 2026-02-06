Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064CCE81BDD
	for <intel-xe@archiver.kernel.org>; Mon,  9 Feb 2026 15:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE80310E41E;
	Mon,  9 Feb 2026 15:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.b="PIAwJYem";
	dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B3E10E8FE;
 Fri,  6 Feb 2026 20:30:49 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 616JuQFB3705465; Fri, 6 Feb 2026 20:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=corp-2025-04-25; bh=cbcnDXpQUdGpMoucDkdq+JxpMSx4D
 gRc5ZuXWysEC/8=; b=PIAwJYemn01hMc2j6VXf9i8ZINcpDRmrflqO3AY607Uc0
 FXXAiYH0Dmx+ckcUKiIJ8dqT6hL+0C+I90gOi4qV4/TTmeH8jF966UQ2M96VZCUP
 QQQpBDyJRR7vqWwrMobDoVzd4+Az/ypfwQ9c2WgsyDm2O6ChV4VS2dmZELfdKBFZ
 KkdvyGv+caMnxWd99pjfht3RKnBOr5wbvb1Yyon4pW2oLkFHOwh7D6ed50AfXJF3
 09xp8P/H054nwffpOQsL3fXt5eK8UvcI+AAtUAwHmb7xo7CWR8rY0z0mIjUge0Gj
 dsC5+A+6xywceeQg8AVWmmwSGOJ/uf9KwFRnFR/dQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4c50fmhueu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Feb 2026 20:30:47 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 616IVHqb007860; Fri, 6 Feb 2026 20:30:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4c257dpf5b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Feb 2026 20:30:46 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 616KUjnU003022;
 Fri, 6 Feb 2026 20:30:45 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 4c257dpf48-1; Fri, 06 Feb 2026 20:30:45 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, rodrigo.vivi@intel.com,
 samasth.norway.ananda@oracle.com
Subject: [PATCH] drm/i915/gmbus: fix spurious timeout on 512-byte burst reads
Date: Fri,  6 Feb 2026 12:30:44 -0800
Message-ID: <20260206203044.3892925-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2601150000
 definitions=main-2602060151
X-Proofpoint-ORIG-GUID: 81Sjqj7opb1ogDJhGUuDRQmyaN6RKH8n
X-Proofpoint-GUID: 81Sjqj7opb1ogDJhGUuDRQmyaN6RKH8n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDE1MSBTYWx0ZWRfX3PzuDjzW2CL/
 agUXLRHd8zk5eHKqLrpD+KwE5H61CT0aBCjHxE1bY0FIT+ATwYwDeU94jkj9EpnNifE5bxFKuGa
 EKPNR8/l3uKneDSUvNifUdTNTrSKMgVFK8vngKdYJHBFw04wCvHQix6roCHn9tABUJKX/2fAXOf
 quoOPbhCqznaq1HigY70DzTfzu5JnyR6+O02Me8dE/s0FtEi86I7K3eI9pHIYD14wLllq58RI6b
 okl05vPE4m9GaGqfp+isBnkjnyU4fTtXngHnlKyisjL73qf5r5HFIHsaV4/SmbpUeJZi2F0HkOC
 MBgCeHEf5wVXZOR/64Nrgc4hwOGeMSXyW3RfP4OZ/2A9PjUYdOflsEUQz6LSB7OENdkcyRzqrZs
 k+YYGskkA9wbizhXzEmbJUgiHQAYM3d3x0NMGKTkzY6fFR80Hp0W8cFFqkEDfFbETJef9UJFKsP
 9JBVGq2j9ox99C9ReTxQS2rR8Dbkba9UqDEYPcLs=
X-Authority-Analysis: v=2.4 cv=BcbVE7t2 c=1 sm=1 tr=0 ts=69864f77 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=yPCof4ZbAAAA:8 a=PuaH-Lx6fdjQJ0Tf4ZkA:9 cc=ntf
 awl=host:13644
X-Mailman-Approved-At: Mon, 09 Feb 2026 15:22:58 +0000
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

When reading exactly 512 bytes with burst read enabled, the
extra_byte_added path breaks out of the inner do-while without
decrementing len. The outer while(len) then re-enters and gmbus_wait()
times out since all data has been delivered. Decrement len before the
break so the outer loop terminates correctly.

Also fix a typo in a nearby comment ("generata" -> "generate").

Fixes: d5dc0f43f268 ("drm/i915/gmbus: Enable burst read")
Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 2caff677600c..5fb3fee34af4 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -496,8 +496,10 @@ gmbus_xfer_read_chunk(struct intel_display *display,
 
 		val = intel_de_read_fw(display, GMBUS3(display));
 		do {
-			if (extra_byte_added && len == 1)
+			if (extra_byte_added && len == 1) {
+				len--;
 				break;
+			}
 
 			*buf++ = val & 0xff;
 			val >>= 8;
@@ -693,7 +695,7 @@ do_gmbus_xfer(struct i2c_adapter *adapter, struct i2c_msg *msgs, int num,
 			goto clear_err;
 	}
 
-	/* Generate a STOP condition on the bus. Note that gmbus can't generata
+	/* Generate a STOP condition on the bus. Note that gmbus can't generate
 	 * a STOP on the very first cycle. To simplify the code we
 	 * unconditionally generate the STOP condition with an additional gmbus
 	 * cycle. */
-- 
2.50.1

