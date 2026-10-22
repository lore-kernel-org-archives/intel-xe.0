Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD33160A261F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5DcHFsD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iVluDjtA
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D28112633;
	Thu, 22 Oct 2026 13:28:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CF411263A
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:22 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69MCFxmk3784008
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=M5DcHFsDC+EL8Mkb
 k164l2UnqbYDeXD7sYFe3zZ1ZFexpDf4Kehgy8W1M7DowBtZHzqbQxiu480Df5Sr
 58G46/R9IeHvJl1xCQDw+lQEFSiFaBCWrZGOjjcFn7/5pQ2ihn0c8UReV6pqO2iA
 x2H3g1abdamEIN3kuDeOA1qZCqXJXIYC1rFrtDeXW3n2VMFAugKkF9I43I4MyQpE
 CJSxnmjwGLppgYdiFV9Zwf7JTeBgr8AO5Spg7GGlHd6xRXQ1yumdqUXugaHKhkis
 KtYypKgRDBTKLIkifLi2dUaYLJ7gTuaeQa3V1xwpUi39udR/DonlWwrjpe6a9ToA
 NS/aTA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93auqjb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 13:28:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93cbf2fd504so330121585a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792675701; x=1793280501;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
 b=iVluDjtAFE5A7mPQl+QALTHapav8ajgZI4UiURH2RRhpytk8PbfGpm90hl2Gq03yn6
 3fjrqM18AVJGT4fR7KXLu2+S7JY1SZfIseZShQPm2+UHRHs0AGIAyYLwYQIrS7S5FhFe
 FVqZHEJ/DQm9aYeVugm1pxtAcZZaG37BBszT/AsvDfPGf/QbAk0NdEBmFpi2r/1hRpQx
 aNP5fy0zA8yxfVmXOml3aTUpXrIlP1Xsg18HLsieZDHcqtdIL5yam3lzPc26LUcyRu9T
 bPAlnu2kXVaXTWXK+ogQp7E8+5ZV7ovzXZqyrA2u9lL4ULF1XyPYbRUfyx7fdKbeoNyJ
 Pj3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792675701; x=1793280501;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
 b=kETiZ+3eO5BYc6IeojCDT61z8wIcHheredzG6uMW392Aaun6VJNtBNy7Vg2CFomCKR
 efOZDJGnRqqXg/W982+Ezv/ehagxk0y0I6D0/YBXEOf+EI+UcUIgo6CY4F5Rhu+SzT+z
 UlZts4q3jbBvNRlMi0RsUVYRniLdjNjh/s/u6OjUvWg4R2qiZlSbeQbmAMLhdVyP3pov
 MF+D92NUQiFqU3c2k3IdWQSvTjVisiH+Bl8E0WfAtaeB5sFpMDrthXfmmmFjF6ifV7EF
 kPA1zTZwCW2ESigYTBzYp/loEJb1Ib13mi4RmMmekthYwuNyAznc2+2WI1EceVi2rsgC
 mFig==
X-Forwarded-Encrypted: i=1;
 AKwUvBxNc1eo2+dIf4IzLpJSVYi1u2zIhAng5RI4dpC67vFl37JpIxQr82tBT7BTWQoWNW6w1q2+grOCEQ==@lists.freedesktop.org
X-Gm-Message-State: AFq9FYLAAqOeFmfIKo2iz0V4ctRMAQI83JKBCGWKpEELV6zwbhUSMWam
 noSG5Kryr+1foN1ubcdPbomUqDkFaNyxfYZhGhjClKVbeD3TuGyczbJskGXw6ikkUBNzqzeWUD7
 j8QxzldOAVDDcxvxMHIx5K607S7RxRjxFzZm/qJAmx6CvosvolkFAi1AfQ9ENvsVxiXIj1w==
X-Gm-Gg: AYBFou068TaYXufpiUVbPfDCfCohQJ2JUKJ5OLS5YEwU+/rJVDcjC9urtV6ecGH7tdh
 06U+Z8KJsoRHs2rvgzNODBlnxV7t+QgsQpf8WQSsa7QFKischUVghRw4uy+jhBX8iqz/KZQORQ7
 hS8CJdQ2uWQb3PdDQCs7IR1Bx9VZysDNW0lLCb4UAqsfeZVBZ9zlxPTvGuGS0CbOnMIQz9kV+ql
 Y4rFU/dJ4n4gdLMkvy2qrH47Rj6RljhcfeeK/fBaG/pEVovfNryc3dTv65mpsREUagvjW4wVXVZ
 Q8bMCMAtThC8ZihJ6xTi2aRexSXxB0iWeqcNxfmxZqOuZR6sFWfkcuuJ6yCN8hy7N119YLnLjnu
 xgPqhrraaGf5f6AMc+Yp6ClnPgrMFzQUsVmWRv7qGywvRebohZYRORK1hyJu759fmq7dbqEw/qJ
 YvHS3T3R/Uf6TZ
X-Received: by 2002:a05:620a:6408:b0:939:6de9:4cff with SMTP id
 af79cd13be357-93f57f3d80amr951085785a.45.1792675700405; 
 Thu, 22 Oct 2026 06:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:939:6de9:4cff with SMTP id
 af79cd13be357-93f57f3d80amr951079285a.45.1792675699899; 
 Thu, 22 Oct 2026 06:28:19 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2026 06:28:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:57 +0300
Subject: [PATCH v6 2/9] drm/connector: pass down IRQ_HPD to the drivers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-hpd-irq-events-v6-2-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/hSzFpHE6ev+vJn//9zUP0H8ontkeSIVJ4sXfporv
 CZgVUNcJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwl3K/j+ENcuEteD7on9S
 j+81h/AWqFyzznIP3uBqN8nG8EjUrlnhk+bZ5s6ecU3jb3Xqp89vU2+yrGk3K19kb6LJIJ7qFcK
 idd0sL7tImefD4i8ybw8Lx+tqPv9YfTVsLZ9+0/TTprn7U4oLfyxKTyi+sdJlVb219rJXGus3nL
 kps1T8hEfTnPtWE03tv9pp5VzwZcnRbVvZN11mv3nJXUb+6+ue3eT/xpleUxq2l2ERc+vNrLqno
 uq+Mjyr9yguaLWZvYNZ/YxHQT6nkbtX2esXB9nNxB0POd0qb9Q5vvi9jKKO5/JNLkHf9p896G7N
 Uc3NbtyY/8v/sWnA3kNTv/FtXCX32+Kq1/tjn+wbdVRjAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfXxiLxt0NEQKiq
 H+pETsYzlxSSiPE5Drv2OYVSqyAVqL8dy3H0GM4HxFnHiPhwb78xnwPMNlb/wnKehEijOnbG/FY
 /DBUBHwVRib0553zpIb3l5W3DPSOBMBf4jK4CLLqyFaY6qDXvv5z7p9eVBJS8ZwG115Gp7J4hjm
 Calh06qR4AKewBZgeo6wb7s+Qg6qQkMFTYgheImjE6OO72PJUS9lRmnm62F+3cOw38kRxN7tccz
 qQjBfhgVevfa6Ws6Xfye8wpWSRwJdEpYl716oF6gGlSHKSPRaLEPi/owO5AapF2UqXzU0LefUhS
 QyXwNzLfT+MzZCo3t3hexLPIeOVNY5giKpR0dgXBfN15kG6liklVfjwax0FgpTwKgHzZ0TsssBM
 mAsKRpP9SobW9TTGt6Gb6t6kOOwjXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX25pEIUUkQaG1
 ZVVH9x/Nq2oGOrZi90WFHNY+/NqnZTqV5FxxpFxqpl3B49KgsvUTQjXhKfVHOI5Aa1aQVaj1VYf
 ihHvNUi+PJyOtHcPPIlRiLTt9HAW9YU=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ada0f75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: uVKHMyuNNwjjNV9kIhK8XLu20bFcSFxr
X-Proofpoint-ORIG-GUID: uVKHMyuNNwjjNV9kIhK8XLu20bFcSFxr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610190000 definitions=main-2610220053
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

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

