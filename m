Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A101C35FF9
	for <intel-xe@archiver.kernel.org>; Fri, 14 Mar 2025 13:04:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C131410E9F3;
	Fri, 14 Mar 2025 13:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9ZB6mEM";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B087910E957
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 06:00:19 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DKD7iH027558
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 06:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YD6Z7HGd6RWZSqIPuwEoc3ezQjdyPxL3+GL3fga18Fk=; b=F9ZB6mEMvQNwJykH
 MrOciWlfhPF8gc6CrJXLfBq6ksxP5I8HK9A04+R9PUhWfPJwCVv8BL0flzdy29AI
 eMEcparMp0Y8s3nwWzXN2Qz/07jcVo9fw40wbZ79dkOHIpPJXZKBLwh0EPiDKdkB
 mF7Gagr/+b3kLvLCU9PcpLZkLyNrIwovXGZN2QhD9SZj71u/ABBGyJst4jmag2kg
 Gs/9yzmzKr3kq5EeXX0YuHMn2IU4FEJlmWQAqpbweVhZHwKeKCIFBhCtLU/b+mWI
 /NiV+EIbFm87IQZvcBnmfGw09vKbyX2bP7W7iXYV840EQmKLmwa34xMDrEED99SE
 siG8LA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45c67313xa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Mar 2025 06:00:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6ead629f6c6so36092566d6.2
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Mar 2025 23:00:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741932017; x=1742536817;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YD6Z7HGd6RWZSqIPuwEoc3ezQjdyPxL3+GL3fga18Fk=;
 b=Fn94l76DJ05IjRoW8eoWhMrRqcl7xQP0aZ+cKQ4gnL5cy4bj3DOT1ohFVr1HqROnNw
 nocHEj/NBMO3lqflHcFN1oJVXyxuF2VD4NyNyCQcxC7b6G3U9kSvNI8TE5VgkfKobVt8
 5EbDL0rRWzw+r1HDJTiMobXME8bi/odu3hsNK60qs/b8Y5Qft8RyXztxKSnssazY5xNb
 xiZmVVMSTipN4H2uSEs197vCExXwd+QEdVZgddVkbax+C4Pt6bAznSKWJs7uRwOvq2Tp
 xHoF+ytrCuUk6kbsCjztjZuXGiFErfDO3G9kUKtjY/q+hr8PpcnVflB3Z2V1F4rh+xwD
 THBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzvD7rJVKWnt+zJt+L+ZXi2wv1YSI4Z/7Gq0FvZAr4mL4dvlTQ/8QjrI+4k6YZRZpAnJz4JkqzHQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/8a+12FwUcDLOA7wc1UicL7+UoZXPG7LFu1D5itLPFtZIPQP4
 GhjB1t1dzw4JsiBJNODqKetxZDkv6Gre98STIPSdhV18hrMnn9tPo68OjJlUpIOfBYFepr3+SEo
 pVpA23f//TQy/2I2eoj1dNOAjL1NXfXmOeSeiQpMUe+atx4srkGfvmCdXarycasbIDQ==
X-Gm-Gg: ASbGnctVeG5zwiw0mLd9fXMpLwQjwFOIQY17aslUisVmQZ7iJ0PXD/TgfqKzPTXHVs+
 XzDTk0FuYYlEMvq0rk3Q76UGVhQwqP7TWUnIVuqWZE7k/CcrDKoGQ6jbb4Q3z1BVxC+yI5lpqBU
 RD9hRLisyBCpkb0998J/deGSEffo/iQKviqXXpOHofELYUCjZkO10xxOTRJIn69XdciM2ChsCbc
 2LLB2PZr2eAYirAimMqU7UAcittmU+s5e5wSaEwmQkWvJ6EZF+UFLmm9NwssdnplRWuY3F5HTi2
 s0YZz3eCe0ZyOdp4crCMA2+NT5oZEe36Vce/OYjxVrFLqoz0RECndw2hCN0pKlHJ3P/0hVoxiXP
 jPChYfR1FzKh2/jp6gvNuSYgbkc4g
X-Received: by 2002:a05:6214:27e5:b0:6e6:6c39:cb71 with SMTP id
 6a1803df08f44-6eaeab0fbbfmr16506496d6.45.1741932017334; 
 Thu, 13 Mar 2025 23:00:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELJcylmUiJ4JEURtcZ0pb2cGp+YTibCxqJbDGjU39ccIquuLoPHTNuJjmGgKfn3GK+0NkRrQ==
X-Received: by 2002:a05:6214:27e5:b0:6e6:6c39:cb71 with SMTP id
 6a1803df08f44-6eaeab0fbbfmr16506016d6.45.1741932016982; 
 Thu, 13 Mar 2025 23:00:16 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba88332dsm416136e87.181.2025.03.13.23.00.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 23:00:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 07:59:47 +0200
Subject: [PATCH RFC v4 6/6] drm/display: dp-tunnel: use new DCPD access helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-drm-rework-dpcd-access-v4-6-e86ef6fc6d76@oss.qualcomm.com>
References: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
In-Reply-To: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
To: Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4082;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AezDpTs9i2rYRC6AeDwZvqAV87zlWZZG2GdTd51PPFs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn08XZFN6uPDdiX1R7XmfB1vXISASqSFYGN569O
 I6KV6qdI3WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9PF2QAKCRCLPIo+Aiko
 1eM5B/9jhOE9nI9V6mDRKubJu0/SPcbZoi/lHs71XyG/da3UMGC32Qt16u66xFuLg4inRbB79MC
 lZllWHwPgl1Q5/YeMrd7mbZ4SMoiH9evqV5y0/FTvifqU6zwgcpJ6ZCMWGixnm3Ezlb0aiz5nI9
 XYnzCZ3lNXvh8AkwMZMgXNfGOA71gEm/MhhXwmgqXHN48nVlgfkYc1J84RrrNot9sLmiQgfQHzR
 F4KZYvVt5YGhuR97yx5BeXuJOeT2S6L6rAfmV5RybP6JJdi6id/B10zo5H3f/e3tm+QFyIddeuv
 fYEScrVe2IVsan3JCnn6Al2YeCZugz0rJLJveu4Idywf2rlt
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=a5Iw9VSF c=1 sm=1 tr=0 ts=67d3c5f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=QyXUC8HyAAAA:8
 a=VzZmvmfVK_LU_xpdqU4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wEUNMBCS9HUB4MeJHr8SLh6tXoxEnVEq
X-Proofpoint-ORIG-GUID: wEUNMBCS9HUB4MeJHr8SLh6tXoxEnVEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_02,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140045
X-Mailman-Approved-At: Fri, 14 Mar 2025 13:04:08 +0000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Switch drm_dp_tunnel.c to use new set of DPCD read / write helpers.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 90fe07a89260e21e78f2db7f57a90602be921a11..076edf1610480275c62395334ab0536befa42f15 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -222,7 +222,7 @@ static int read_tunnel_regs(struct drm_dp_aux *aux, struct drm_dp_tunnel_regs *r
 	while ((len = next_reg_area(&offset))) {
 		int address = DP_TUNNELING_BASE + offset;
 
-		if (drm_dp_dpcd_read(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
+		if (drm_dp_dpcd_read_data(aux, address, tunnel_reg_ptr(regs, address), len) < 0)
 			return -EIO;
 
 		offset += len;
@@ -913,7 +913,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	u8 mask = DP_DISPLAY_DRIVER_BW_ALLOCATION_MODE_ENABLE | DP_UNMASK_BW_ALLOCATION_IRQ;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, &val) < 0)
 		goto out_err;
 
 	if (enable)
@@ -921,7 +921,7 @@ static int set_bw_alloc_mode(struct drm_dp_tunnel *tunnel, bool enable)
 	else
 		val &= ~mask;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_DPTX_BW_ALLOCATION_MODE_CONTROL, val) < 0)
 		goto out_err;
 
 	tunnel->bw_alloc_enabled = enable;
@@ -1039,7 +1039,7 @@ static int clear_bw_req_state(struct drm_dp_aux *aux)
 {
 	u8 bw_req_mask = DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED;
 
-	if (drm_dp_dpcd_writeb(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
+	if (drm_dp_dpcd_write_byte(aux, DP_TUNNELING_STATUS, bw_req_mask) < 0)
 		return -EIO;
 
 	return 0;
@@ -1052,7 +1052,7 @@ static int bw_req_complete(struct drm_dp_aux *aux, bool *status_changed)
 	u8 val;
 	int err;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	*status_changed = val & status_change_mask;
@@ -1095,7 +1095,7 @@ static int allocate_tunnel_bw(struct drm_dp_tunnel *tunnel, int bw)
 	if (err)
 		goto out;
 
-	if (drm_dp_dpcd_writeb(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
+	if (drm_dp_dpcd_write_byte(tunnel->aux, DP_REQUEST_BW, request_bw) < 0) {
 		err = -EIO;
 		goto out;
 	}
@@ -1196,13 +1196,13 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	u8 mask = DP_BW_ALLOCATION_CAPABILITY_CHANGED | DP_ESTIMATED_BW_CHANGED;
 	u8 val;
 
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_TUNNELING_STATUS, &val) < 0)
 		goto out_err;
 
 	val &= mask;
 
 	if (val) {
-		if (drm_dp_dpcd_writeb(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
+		if (drm_dp_dpcd_write_byte(tunnel->aux, DP_TUNNELING_STATUS, val) < 0)
 			goto out_err;
 
 		return 1;
@@ -1215,7 +1215,7 @@ static int check_and_clear_status_change(struct drm_dp_tunnel *tunnel)
 	 * Check for estimated BW changes explicitly to account for lost
 	 * BW change notifications.
 	 */
-	if (drm_dp_dpcd_readb(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
+	if (drm_dp_dpcd_read_byte(tunnel->aux, DP_ESTIMATED_BW, &val) < 0)
 		goto out_err;
 
 	if (val * tunnel->bw_granularity != tunnel->estimated_bw)
@@ -1300,7 +1300,7 @@ int drm_dp_tunnel_handle_irq(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_aux *a
 {
 	u8 val;
 
-	if (drm_dp_dpcd_readb(aux, DP_TUNNELING_STATUS, &val) < 0)
+	if (drm_dp_dpcd_read_byte(aux, DP_TUNNELING_STATUS, &val) < 0)
 		return -EIO;
 
 	if (val & (DP_BW_REQUEST_SUCCEEDED | DP_BW_REQUEST_FAILED))

-- 
2.39.5

