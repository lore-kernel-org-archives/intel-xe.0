Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DED606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Nt2xEdRb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I7dc33iS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F5D10EF2C;
	Mon, 23 Nov 2026 15:18:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA9610E50A
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 21:50:56 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AMK7ueb2683084
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 21:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=FzESvL5RepBD0S6/lRBbsnq9PngXav3QxYE
 nG/jUYF8=; b=Nt2xEdRb1RcmoSRGewXuDuAJeNADXx/XFWXGF2fKnKi8Q3fBZvI
 +HePjwcQf86RZkCS/m4M63u05CjLaFZ8uPjZZpFiATogKV5uidKIf7zKcAmqI6u2
 YZNY+45R2IhCV8ZOogYy2w8rxW86BQ+OPwPWE/uNMnVfMKkBu8eq/zuMNPjW+xdh
 /Rw6lJ8fQzyljLVCnSQDQPpVCq25cg254AsOv4qgrK5C8ujLtrQGmQoBURvmptsv
 5kkSCcSPShLlvdQ4ABjfnM7A070w+O0BIQos1MYoBnc5RjtqMRIMags9T0qifo0P
 tuils26gOtnRFjs4lwK0Xeqjmo3lwPJc6Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk456p-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 21:50:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93f1f2fafeaso326384485a.2
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 13:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1795384255; x=1795989055;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=FzESvL5RepBD0S6/lRBbsnq9PngXav3QxYEnG/jUYF8=;
 b=I7dc33iSiq929X6Nfanbwt/lXUdhU30O6733pcG0FHUy2qFVokWAoPcEthST3ZbtRg
 keYW7EsJBMjBPewJNE1G91ePSusjp+e+SE8C4xy8HcS0CEkqrjCRjEjsRFxYnlG0zF9z
 bsqwivY3v1znmbdlox0uzI/8XtTSN+s5XNv3moX4FsLKSGorkfbbB2J5KXb3cD0/aBu0
 zzp452ZL5QNL/s+kE3fztqWPrN1CWCDnIL5QYgLJNVz338eNsnNk6LhCi0kBk4GoKJI3
 x5Kw6myThFdyRXLCFKez6/H1OLxmgFj8MoJDIwSBdaBGYgd4Vc+g0LCBrX1xs66ijZvh
 3I9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795384255; x=1795989055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=FzESvL5RepBD0S6/lRBbsnq9PngXav3QxYEnG/jUYF8=;
 b=c8mduORaAlSrQuOobQcRMDoy0bBfg2/iFmOHL9O146VZs/d95LHd92NdOu2ZuP4mWs
 1WyOic0G2GoHPBK7mebfqf633dYWH0cDKYMsZSHa2k+3EVZ44aSrdWsOGMmP6gaVdxuR
 7lpVUXHmzOZnfd/15T+d3rjeIp38PvLtNHwMCaXFn9OpD9KqcyIdW/UMSkJUl2hdPCiL
 9soFdEfgLg5rq99k+r7EHvi0+mdoBLqGBV40nfTexCtaBYP10lOZWAA9i0hqKn0Y4rtg
 4fyGqXu6URPK9svQU9nFRdf/DGjLNyyJ9Sv+JjLg3xrOBciZMyhYQyceB4Tsk4vWK89x
 MJvQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHe7b2hngrcuOt3sMDXPULa8ustt5N4SiSK+Yt4TkV/8p0Q1pWIXTNTnet/nTG/XnJJvQqydAJCbQ==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/s8NObY6RlGLbsNllU7riNSrU/ElAmGx8AGCjzJJrfXcVzfHbE
 hT/hmrXqLvDtQm4NuouYF2jeKpWf4Vi0UEVCL42yZTrkS6TFWT2BV37GdKMC83rrfB0ZtfpanKN
 QZXpWqxZMBQhhLXsy5jSb9NjXy39ILKZtX+YvaJGySnxEAd0VM9uKQ0e7GXw1YMLumNyCAw==
X-Gm-Gg: AZFdTZekYgHHVLEhgTzl0je3z0lc1da0arctACHByN2NTemf7hIpkHTWXA/GoyqqT0u
 rptFegSSS6lmI6PFVwBh8VMuh2X1VF3TGfSWHUsndkVgb4YAsbJLrDpR5wK9JV+XbWu9qSaBMza
 IrQMXXuiaYwR+1MWvJARxLTyYlHHkCutmZIQ5CbMqBJlQDA5aj1heSrR+cApWOc4T5OFacgRSbH
 TZyNfjeQcO4t2rzJVnaL6v348Bw+R3kAHBSdw+yt+xvMFibqg6a6Dm7OQQNbeclgcuNZXWZUyTD
 6S6EDe/fQ71fIJqhElC7cAeoD7/UxWhVRhWYBdREwlkxXc6q16jU6CJjZhJmTYwajn9SSPq8ztD
 kpPbbYD9eaVjYWZJ6lCBBf+usMWOToNWr6iCjCUqHDsZ68HqUqlG5od+/A4AelHd3UuyGoPJrGe
 Hc+7FTAuyLgfNOq1bOFv8XgL51OO1FHPB2CjDZ03/aXePBRkL76LqOuuOKbY6GY3w=
X-Received: by 2002:a05:620a:29c2:b0:946:c55c:dcfd with SMTP id
 af79cd13be357-949ba965a4amr1551178385a.14.1795384254863; 
 Sun, 22 Nov 2026 13:50:54 -0800 (PST)
X-Received: by 2002:a05:620a:29c2:b0:946:c55c:dcfd with SMTP id
 af79cd13be357-949ba965a4amr1551176785a.14.1795384254497; 
 Sun, 22 Nov 2026 13:50:54 -0800 (PST)
Received: from shalem
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513ae8dc60sm339867766b.34.2026.11.22.13.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2026 13:50:52 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, intel-xe@lists.freedesktop.org
Subject: [PATCH] drm/i915/display: Handle type 0 in mipi_exec_send_packet()
Date: Sun, 22 Nov 2026 22:50:51 +0100
Message-ID: <20261122215051.73289-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: DjELZAuLfEzobHIImnzVPAPXcpc0uyYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA4NyBTYWx0ZWRfX9h1x87J+vh5/
 PVPNSM/eYDW0RtmgP2+VTtUpZnSvp2ItMgWanCeXEqpRxTj35ZcXe7uA0FD6T269wKn5YUqCAEd
 han7uXBSLfyU7btwAvdY9jHCIGGkEXr/VaxG+TiTsQP4O+ZEesdeojCPC0obRKwWJB5WzVZ0Y45
 ft3uyYXVGEXe6OfyQ1a0cmoWKQMbM6aEQU1aABdv+c25dx1Rzwf7qeEJCSGYafOSW3R3Tj2Je3S
 HFdE4e3ADxHh8qr59qzO3QQdMHQw314byry8Wb0O2qmBBVwoE6A1CMJ9H06oaOBmHD6AANDJQqY
 5XyGJOhXuExJZuAyQZdPbQMWDkj1zRE28dSe86CqbXpqXnheVmWbAC1hwVr1fyjA5JHouPdx2JJ
 TxpkNC4s423vdeK2g+iuCT3R5ifHf9LY2BiykARIANNkMs69XeoC6JBTDNarlb0mKIBXHkS61em
 C9Bg90RBKxGZCuRBF9w==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b0363bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=M9wYXZ47LKKiO_R-X8EA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA4NyBTYWx0ZWRfX2lF1BXWrztbT
 WpN6lJyxgbgoi1u++wIzFg6+CUvVEpxg9fKkSW2ez7nYf2qxtg5j3iw567s6bQqM+Gn/UpNof+z
 eIqmk/pbno+ViX3qIjGTye7mOq0EV6M=
X-Proofpoint-GUID: DjELZAuLfEzobHIImnzVPAPXcpc0uyYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_05,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220087
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Some devices, like e.g. the MPMan Converter9 tablet have some
MIPI_SEQ_ELEM_SEND_PKT in their VBT DSI init sequences table with a type
of 0. The table for Processor-to-Peripheral commands in the MIPI DSI spec
does not list such a type.

This leads to the following error getting logged:

i915 0000:00:02.0: [drm] *ERROR* DSI send packet failed with -EINVAL

With no ill effects since errors are ignored.

Presumably the intended behavior here is for this to be a no-op like
MIPI_DCS_NOP which is defined as 0; and the display works fine including
powering it off / on.

At handling for a MIPI_SEQ_ELEM_SEND_PKT sequence with a type of 0 and
treat this as a nop to silence the error.

Fixes: b84befa31266 ("drm/i915/display: Add default case to mipi_exec_send_packet")
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index fe12041e913c..423be33443c6 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -142,6 +142,9 @@ static const u8 *mipi_exec_send_packet(struct intel_dsi *intel_dsi,
 		    hs_mode ? "HS" : "LP", type, len, (int)len, data);
 
 	switch (type) {
+	case 0: /* Not in MIPI DSI specification, presumably nop like MIPI_DCS_NOP */
+		ret = 0;
+		break;
 	case MIPI_DSI_GENERIC_SHORT_WRITE_0_PARAM:
 		ret = mipi_dsi_generic_write(dsi_device, NULL, 0);
 		break;
-- 
2.56.0

