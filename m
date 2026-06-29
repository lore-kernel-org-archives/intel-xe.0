Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFC7C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 09:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91AAD10E7AC;
	Mon, 29 Jun 2026 09:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="isT3VW3/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aqU377GD";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336C110E7AC
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 65T6raH82077441
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4jemJMg1mPxTimQgHduXv2Tk1YXpvQTVBHPayB9K7NY=; b=isT3VW3/K/PEvzSt
 0eA9gwQkZ8kGNcHXyYP/wm8BjPG1k2/0bZmE8+1VRn8sVkzUKeHuemwQ+7Q6iNaW
 g4hP1vbZNgohSVU4LwijTPFCUGCwC334q+d9wkz+u/1W3s3Bry317p/IMW2eXaNo
 9/dY+oE+w3vrNs078sXFz/YBaNmRtbCOJkQ2fp5B6/B4hLkNSvAr9oFxQwffENlu
 187qH7MGU2hi/VBn4z3yehsAJt2rFyyiXaSj7y0CPtxHy89C8wPDdEAt0M9nidlf
 qeXHCGlQa05Wx+S79iWEve+eNIoqX2EK+5eUadVOBM8IH25kg/oxZwFqn2kJRM7x
 vK+4Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gkgc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 09:13:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-915d3261c5cso640516885a.3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Jun 2026 02:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1782724381; x=1783329181;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4jemJMg1mPxTimQgHduXv2Tk1YXpvQTVBHPayB9K7NY=;
 b=aqU377GDYGSFsra/szvkHIaMwjpogMaLEFtb2LjFwY9Taxg1x1PHAS7kpPY03jgLkN
 3X7uLelW05DEsz6A8E2LuXpv+8BSZXTRTRxg9aHdcmxtiE0jcsZQyw6FIO0VpJgawXbS
 m9zIpCzR0FuUBxLpuGDkRS6BsWR+NA7eIYK5BMY66m0KW74nFlKcJCn3Bqxfi8PM2EsT
 7wQIxTo9ieJu5IXq4AlMPy4ZFBtxSh+8u9RtLAmDXz+3KJORcUgf3ZZnnnTZRmIW2+3f
 1rkXiaof7TsoQJGoE51i8xcu2WWrURlclrYEjF1XzzAQsmC3Qj5nui+t4UPqwt77vL4l
 QZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782724381; x=1783329181;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4jemJMg1mPxTimQgHduXv2Tk1YXpvQTVBHPayB9K7NY=;
 b=DU4e8LnZqtsXWOCNKx2LP2Cc4ZUr7kx8q6ya504OPmNNBk66yMMBoUKRpMPN+Wwctp
 zxbnffF/1zrfpfzXUrBdcwtmbDaMpUVi6m7l92Q7j7OoblUCcpTJZlUobuDMOOk5CRXj
 zTDPhb1EbgmBsXx5OEqefguhL5Lc3HlZXvlE0e1wK3zJL6hWrzOl8QvHT0LJ5yVwQ1cS
 Uv9PJQfYGKgobPKx37UZIGDBEzaWB1rdujU1FSo0kICCxQZRslmfyH3s1fM8Cb+fu1Xe
 5R8ARchz9T2VISriuJxpWBjFFMn+yb7R62MaeCseBFqw7m3C06Dv3V+gvwLBCrmpA/eI
 MkbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8hG0Ys5l7UlSY41wMGlkJvOmguScniWro7ifN4/nakdGX4f9ABUHUjWMQIf3wvUaENmHamBBzBxA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0ajdr40+ZesBfVREZ3RSQ6Pv1YgcqfvyUi2LgYY4J+VHACSTy
 1kgEe7yIcecRrt4mFZVVzDUwAGZNzrbLyLdXTOZPQwgxPbC9v2o6eCSzI7BGYsczmLkti3FV7/O
 yHi5Z70LhAesJp8SCmXLDrr/OBzW7w76x53FRsQuxoYEUZOobzQcJ4lNiXqcCP8jA2cQCrQ==
X-Gm-Gg: AfdE7ck6TlGX42+6rmn5GK5t6KQ1KBwXIHpsMMzR1qABgr5XLOWSuFUxyvrYsAQK6rc
 YjsjydMi+nw+PJ2X4tEDN/vBnAFW+saMN0jmIZOMwJx06CE2PL3bIzfBiYLFrn48J9vhzPU8+Z7
 NvWCl6By3+XIo59jzdV83TFVCbc1jpfPCYBqgAOlLFJf9Ng7vb6HAgME0ztSj3ZeVtIPnGy4C2W
 PJLpoVsDW/S0TZSHRBfvbuAYI3fckL7vFvb4+Qw4Pc4VnwvfaLcVWBbBKbWL0WQ6ex48vAfC033
 3BVni81VmpNB5v2WRSzCSUrhsr+w41mYQGO6s2USwMr1+hCmFyZ5H9aSNdzTFy1ZESvKBloQwuO
 eLG1OyVCdAyrpLSGUa13+VSj2a2vAc31UJqvR6cUr
X-Received: by 2002:a05:620a:29d5:b0:92e:46e7:79a with SMTP id
 af79cd13be357-92e46e70a7emr695288285a.2.1782724381156; 
 Mon, 29 Jun 2026 02:13:01 -0700 (PDT)
X-Received: by 2002:a05:620a:29d5:b0:92e:46e7:79a with SMTP id
 af79cd13be357-92e46e70a7emr695281985a.2.1782724380556; 
 Mon, 29 Jun 2026 02:13:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 02:12:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:24 +0200
Subject: [PATCH v2 01/19] powerpc/powermac: fix OF node refcount
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-1-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@opensource.wolfsonmicro.com>,
 Thierry Reding <thierry.reding@avionic-design.de>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Srinivas Kandagatla <srini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Peter Chen <peter.chen@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 driver-core@lists.linux.dev, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1407;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=d5jcui5x9J+nHSVyJps5DuSu5oenM0O/Al9uUGEdnso=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcGKkeSuvIIpV/DPVwpxHoLTRKrAfS3RpiE8
 glH24pgdmqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3BgAKCRAFnS7L/zaE
 wyj8EACLmIPboyJTTr0o6LOahtd8r1OD1ezaEmjdr9MNJUTSB3k2wDSW0EQmYLVfEyIxWFqTHHQ
 5em3qpvbnfRXSUTJK47zbWG9K/UnsiqlMpjX5BO2mxMlnhYLAFPyVULoWSYAo4JfO2VgNDIxVPQ
 NYJNAPo4fTyS1JEL+okr8KZYFPtT3oUZ1JPZCcrrYlcxTh/PMXG6kxw61fR5aPve3RlVUy4q+cu
 xDHqpPRq9+YS5DOUYpIJ9ufFDc4vabR3feAsDHsFOQqyqXY7sjjr90XFN2LLwl+PI1CIDGSY6L3
 whzLq2A4djBjppjKi4TTwI+3zzMKrtFDRigP4zS5NmCdTy6qGYl7JwcDlQbluwfgemH2ry9a+3M
 3z5f+rfhXQNTX8/esd9xzkVFTaPeL8ICuj1FxrYaxXoeTFqeyiIketmNBN3700viVsmhjoRgbe1
 9wSaJr2PxNmod6oepFw5/rlmqPndAgbwuSsvgexu2OziA4AgA/oltqCHu0SanP3qC5pEAy/c1du
 cr70pKyU3od2xGUpnPOkWsxtWotnF3EVvY5Lm2TcMNoj4uQLY+ursm0qNcqoGpJc5ct99YHcLF2
 tuTPMUvUHkuoWGpprlKF8rxr/TJgkGTao/Eah0YjzNcsNjZCXfJn95wN7lxX4tVoQLUtvLmUYCv
 b4yTpi6iddu/94g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX9MvfxVBa428Z
 ZYjc55fxOWYm7o3BqIvULW5yEcIpKsoY3hq0umnIUQG2Zi6LOcbiuGb4lqtUmdMrXZ0IGxyyL7H
 x8IpAMO3x5Awp3G/E3QJn2Bie1i9+nM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX48tta1u3t6ka
 ZgzXpPvfTnmxoRldINtj/xpRUY2EBkbuZFrut43hUhYWc/M1o7TAhWXPdVYvGRr6WERC1a0gJuk
 6DRGUMEKXdDnQ8OAO6+UtT59sXBcwciIyHImxP541kJXKN6FvC9Egq0vaayf3UViWFnCFgeL0hd
 QZ/Jj3Gcf5+ExqkJDwQgXaA2pfoGrocWKAZlQPlx2t7Yo0Q+OW8r7A9ZvULkSLl6dfVvaF1Av2n
 9vBYbPtDt9icVGo7UY7OLZDbTs74XftIIjpkfOG5+U0U7cZY2+Yt52RYwdIfOD7wX3rF184YPZz
 o/wnUpSlwCJV130Bwktt6WH3+D7fHtM1cBRZ/WfWtVMaWSzLWTMCZnt5TkE7km219D3KJKdmCZf
 bm8uvoDUN/xlaL6OtZY2L5Flpqr2iVy2yHfj10mxeFfV6oGf0L+zQBrpVK8g2lq6Pp3jJqyG0jf
 XKe7A7/1exRppqKbzPQ==
X-Proofpoint-ORIG-GUID: yayGzf4s1oEa5vw0Q-Dx8s84ppYqMLrM
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42371e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lFaTzyIiLygvDfm8gxsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yayGzf4s1oEa5vw0Q-Dx8s84ppYqMLrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074
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

Platform devices created with platform_device_alloc() call
platform_device_release() when the last reference to the device's
kobject is dropped. This function calls of_node_put() unconditionally.
This works fine for devices created with platform_device_register_full()
but users of the split approach (platform_device_alloc() +
platform_device_add()) must bump the reference of the of_node they
assign manually. Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 81e5d8646ff6 ("i2c/powermac: Register i2c devices from device-tree")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index da72a30ab8657e6dc7e6f3437af612155783d8f9..973f58771d9636605ed5d3e91b45008543b584d3 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		bus->platform_dev->dev.of_node = bus->busnode;
+		bus->platform_dev->dev.of_node = of_node_get(bus->busnode);
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

