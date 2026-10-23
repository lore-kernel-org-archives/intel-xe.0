Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC6606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 23 Oct 2026 13:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JMALdV9k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BjVdOqac
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA3F112B05;
	Fri, 23 Oct 2026 13:40:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62234112B22
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69NCAdoO3822508
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=JMALdV9kc5ziw6Cr
 v1pelBRZuf+CmVaSaSKPbKYKN3oIzBylbQWTrGwg4c6O7Btl7djYMrK445UQYTy8
 YL8i7y6GVlg9i6OJgnIbUcV5GpW8nk5xNMMJIxq3JFXp4QzxmixsAMFQ9XVgbGwE
 WlPUBU+4XFDTstZZfa2D1njrVN08/PT2xRiptPLYfExvXjYMlD8au5WQJYy2kK9d
 IgkdRsLdxT1bs/0fyG+b+ziovRwYKI0a90SWVjPHSiUHmLEHVRn74eDKdjkxbDF8
 DY/ESO5q6pUgLSn5VcOmzHxhhRYmAGKMj3kMXri2DmIw610MR6TEGJ1XCITpgt9t
 i0NecA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw09yr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 13:40:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93f33438950so206393985a.1
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Oct 2026 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792762827; x=1793367627;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
 b=BjVdOqac6UBuVHIhLw9wUkjprMKTV0bGdJXnD+j1Jp3HZqA857ol0q4qSzZ/4l93KV
 phXLU6Zu8ctNvqMHSdckw+1n+EVWpXxwHpDpquxIR5SFcZ9V77dE99Z5OKP8J2GjrgtB
 umD46bXolrU6N9k3VLK1SnoHrF5sqo3pIfTPUF8PZ8Bu6pOSPYutpVMHP7H7ADxPe6nI
 IYqTaaC8wkKtz2wX80a3wiTc50H3RqVpt1LkXg7NDVFLlIToJ9SC5RqNS1GkDt/a+4ew
 oAoTOU4iekX2vkbzzB8cA2t/swV/jj8BqU9LM5wJaiJmffJJV6OoO9EMP/0UmLpG85Ow
 aQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792762827; x=1793367627;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
 b=JmRy6DsGWrSWRUCiv0I7BJOa+wbnFnKrVTcXISww96DZr700Kc5oNU73yPwMV1xkQE
 uoDcgVIadYhpLJ7dN8mJW3XmfKTAlf7yCUc3ABrI6yjNld4mIkXPlgGAlDrPRq558NPB
 cQeOWM6k4f1v7eNLGNrmCthTVYFyBA+JfQnLG49H3roSrkCgzln9Ie20/wcSaIzJOyxb
 Ejn8ruJa3Uom25Jt2Ul7IZHFwUbu5xaFprRe2w87bxQRKG9Cs2O2v5+NcBUxabe4HNe7
 JEBab2r984dRGz4VfEfRQFe7W7K6+YHUp7I857nbfmWw6gsJdgijN9yiY9HZIw8A8mLF
 /Eug==
X-Forwarded-Encrypted: i=1;
 AKwUvBzzj2wMe+38g4gLm1BJ6e/jzj8opKWZ2DboK6oSrDTfbz+Pty63kdalB8o+v9+hGIGmC7c87/HhWw==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIoM2REY5nX5sp6J2xuRTcDcvDcwQxWJF24fJrTXRUjx4Z7VFj+
 TKXL0D2bMGqoAVs2W7Hy+zx9r8HfIRFeFB8qQ/QSGJZlHY1ty9en1B6QjQt6W6EC3Pa61B9L/M/
 CYVUDs5TKNv1RMnl9mGgkM9mgnypy+qq1B5TU4Pnr5JrMtUON8g/lQuQ9cqC6BWD33qOe1A==
X-Gm-Gg: AYBFou0cbibbtWHDfVB4T93cQUftRutK2zOdM+ooS0a7UUQ5jk5ymqHHNh922GslBhD
 j+dwtEIV9xWkyBFsJnshdRFR5uz86HIQV0wutchPDhFbOz6IJiYgphNcsxjrK+UtiLZGnPTCIrY
 GJt0HliBAKqURCMu/evn+b/Ly4Ot9VBbTFSdcwSbVwaIPqpnUoKuBKJFHI4amlhmnuv5QmY3iJF
 GMd7EwYzNGzEue2ixZRYLCu+3J6c5ifvu+qtUO6LsigLYoeS99Q/RRzrjyrTa7GAwb4oIZppBRV
 UgTxPOS5OQhG7UGj5cnJQM7RDhGwaqVZnJPiy9hcjR3nP8UPW9eTvNlGRrQWKPvl3IayQYLKdSD
 4D8Jeh0Dg1ObDii/LbDGt1VpRjOymhoHA3DavaATSMLT7btYrW/c1hxwpLI8xsTgwokfqbkawsv
 4xZgWXdjxbjniS
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id
 af79cd13be357-93f6f656ccemr406094285a.13.1792762826759; 
 Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
X-Received: by 2002:a05:620a:7086:b0:93f:5843:1055 with SMTP id
 af79cd13be357-93f6f656ccemr406089485a.13.1792762826136; 
 Fri, 23 Oct 2026 06:40:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:40:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:46 +0300
Subject: [PATCH v7 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-6-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Francesco Dolcini <francesco@dolcini.it>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Pengyu Luo <mitltlatltl@gmail.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OqJOhixgIg9VA7IzyAGhBk6OzyCFXXMBbpS
 bq6XeHn7UCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjqgAKCRCLPIo+Aiko
 1aCEB/wJ8fNt4uH886JgFUulIe0+m2ySGRzn3AiPyxGkRwEFYwZVhXVPrSSDHoMW3xC8CJGxMA6
 akzlQzOCMNnGmyfRVQv9VC3GYfTRdB5YcrzCxwLohO/6nK3VVONFWTC3xq0BuFYq2X9EtQkr4Cf
 ZULvB5WBskmMM3/ZGAShDmPFWGG7/klJ1gV4ogm6oGdvEmwJym12Q7UbD0MQ0GXc+xhOFWKF6yS
 62bTAq0+FVAk84ja4eSe2YqJ+Sa2fVijVHzaIBWlSehdvaxYUFhCXhPzO2rsODtqnDYQujolgve
 S/I0avJ4Q91feNdGGesDsgv2uP3Y0LhYqJ3peVj6mP/fqS4p
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: WqviQNAuHoCMsRV5klt1lf5getimh_Ol
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXy/yzBpuq9Zep
 QEESoiixNBFFUtXYIL0JQ/EtyCCJp+bgPjiIFLd0NPf7v+GJI/PE2OdcQkLQ9mVMw4J/GwoGY+F
 +tDp8FRDhcLWpb/i8WE49Cis80QsZMA=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb63cb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WqviQNAuHoCMsRV5klt1lf5getimh_Ol
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyrsxCwgJoqab
 mUWGgd2cxJMr1nv9ubZViJacOGo5h/C1z8z7McVWaIWK5oSmyDhYIYJWIqsjomiJSR1UcinXaXi
 7fOqPD+DhKSJi8X6d34PS7LYYj4yEtmFaaaby7wyPa4nA9TdvKNe+dvstq0tcraDaziA6pzdngp
 BW25zNC1rNkgEBYFDWUUi21pU72gtHhtPgfFycemBp59Ge6Q70TYGdYc5xWy8Seuwqzwx732f/M
 2IKK2vCktdoyVMHiABkw/C6fvcIvObIM0DlWID+d/Cp9Zm3Z05wiG/YtNYnsFH3UpF1j0TelSKC
 3o03GMxarNax/DnAP5tkSEuyOpSeqcA2R4D/Xn1Yz3AuUOm+jqeggIZ0GYYEakJMpu7/33gSsTx
 Wr0K1wGwEZsus2WVfBiUMYtLmwdqIxsPF847YRWvyOGDemkfiiPXFYwhKAAd//MDv9Ds3aP5+Ix
 g5A/aOud0g2E8WGAdrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053
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

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

