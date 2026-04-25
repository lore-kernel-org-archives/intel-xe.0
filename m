Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDC7FF885D
	for <intel-xe@archiver.kernel.org>; Sat, 25 Apr 2026 11:09:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B23B10E160;
	Sat, 25 Apr 2026 11:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJk2YCDy";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPk0xvb9";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E0410E41A
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:09:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63P3RfR12952676
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=skggYkTTFObHeIE3RudQp0G9
 1CjiRon2TwvgONrTWQQ=; b=RJk2YCDyCRrYvpfj7deR0E+7F40sA7ecy3s5LwuC
 JwrLO0+41LY8A8E8LR/ubgVCS5crHRH15ux1KKMvHODIbUrQADAzhDKgh7DgKvuF
 boQxjUCJyrrvL6yo7vKI5fZ2xQpzDowy54280huGdhYwzFB9c65HxxfKNPRI4dgf
 TzvtBwc/KZplZZc4LERPGuSZRVGn6F/7kMgsRm/Bdsa4aRalN+daxsXP7WUoJgWj
 bYrYOvtt7Z3WHlGDs8HW63uk9QF9uu+0o4W20QEDD2bTA4LKfF5OGr5Xv65hOcT6
 YIz1ZbrnMAen9tBpnWm8cneIfIV5cwOaJh3zaOUNqYsNPQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqrgrgm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 11:09:31 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-56f66493ef1so4662532e0c.0
 for <intel-xe@lists.freedesktop.org>; Sat, 25 Apr 2026 04:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777115371; x=1777720171;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=;
 b=cPk0xvb9v5B+q9mJwj3Mma6RzZcgcfccHwNbEMvIYCI+GLZK0kXBnfHEn33MAo2So8
 LR92cE7iFL82ApU2gDxoo/3QYKRjtNafeS5z3plrWtdohHdnBM5ylQq0v2Sjh111i4nQ
 D6lDrr/NXroJbEvWu15xN4jFd6frjJHiYVb+tz0W/1EOKqy4lRprNsCZIdWtFBELXOl7
 07RIOkkIdqwEd17W5lggxqezfU8pO64+9lk2lNvXHLOskqJWC0kqcH3xGTxKvgoTwJmX
 sWFlz/KOXVuWDg3BsMOBloV9TZKyfWnafNiprpbZeZyM+bsabMGS8kDQUHxJ/9d7IPVY
 7gMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777115371; x=1777720171;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=skggYkTTFObHeIE3RudQp0G91CjiRon2TwvgONrTWQQ=;
 b=fpuWU1B/Xx22PBewA5X4DBjz1P0gdD+QbFCj6Vph7gj33TbUOSRbRvIpXO037D37SA
 Rzeo2zx9n5irD3PTzR9PU+6hWIA2F+oouLpbZfxzm/LetZrGl8tnrpXPWifJrNAe+nFb
 0/Y3mR9PkgVVg9T/1kQavN5EWxOhsgNEcXTu4+AjhuyfcNfGT7eBRN5/rAuhw2vA7GBC
 uvNwoxM74GyJ+UP7/5ZxPLGezPCl1UbcQw9+eo6ws8g1bGfi3LLxf9MLM4okAuu9mQUu
 DOtY1f8jZhBOKgfRt/5tpVOEtqV/H1LBa6VwGoZIozs3uJVGahJ0dJBOYc0Ah07+msFr
 ie2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fUA2H73DmmsB35jy0wsdhXIDnq/CsFQzXKlFAYGZ7yatps/f4m0CY0rViigIKgzQIpo3yEoUgsQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQXSI4yr08PV3KsLykvchv2s5naH8yDzZJ3QJLae0JGb8aUS58
 E9iLFzy6VRmD4wq/3sljCAyOywsuW/2FDIzSqUCXGpgX6PKVgCtEDttQ6ShbJEpkxPdNqipOS/d
 xY/mD+DGHcPjrwOLVhPdiAvt2y0uhJmfZvppakDWnouIsG+AGFp8B7qoGnx4xaMZtvxMt4g==
X-Gm-Gg: AeBDiet+ywTnZ9MhiMD4ca/QNslJP9m51EL1HqMzZBiipMqIq1J+AcsKEdJXlcrLvk7
 gaH5/PKezCOAmxfw0MvwQw56r9ZIP9PlevQ8qgGATT/UwhZqkIkA4FEatxuekh00BlWr0BnbLA/
 wa3kCzwYlcb621f8Nlsnl1iFzQd+jLc/LfofmVHfvBq4vgHM38SPkFWj296sA2GOykyZKqCCYN5
 Zw3P+ipWhJxHqotVhoPnIWR3JJKFIeZHHFFD7jOT+PUeUW0/kgt6D4942Kiw3b9wbJPlK3C+XXD
 Ukv/5L5BMjq5ZYkXp5Zetv2Lk+m5EPu45yorp2I9qY1jO26fB3uQuVafWWONCX4FInB9HCFJOSK
 msM2TBVRe+NlnDDlr1MQ4/aoSpKGlTph8Bk5s/+xK/8vzFYgBlOQga4oMJ7d2iB/A5yG2/NCrzg
 UI9CQkR2kJ6F9HvGfJVmtccbTxzo9D9/yNkY4thIbCPAP4Zw==
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id
 ada2fe7eead31-616f70f0572mr17646751137.13.1777115370992; 
 Sat, 25 Apr 2026 04:09:30 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id
 ada2fe7eead31-616f70f0572mr17646746137.13.1777115370439; 
 Sat, 25 Apr 2026 04:09:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb5f64ebsm50476681fa.10.2026.04.25.04.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Apr 2026 04:09:29 -0700 (PDT)
Date: Sat, 25 Apr 2026 14:09:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org,
 wayland-devel@lists.freedesktop.org
Subject: Re: [PATCH v14 04/28] drm/connector: Let connectors have a say in
 their color format
Message-ID: <5uit4utjrezpuqok36apjrkojaklze4ftgp2r4zrqolus7gkcn@nu2hsrhaj6zy>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
 <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423-color-format-v14-4-449a419ccbd4@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDExMSBTYWx0ZWRfXxbHvRkP+cSLj
 PzEjgh7kb/1G4khAtdLQnmK0u8hlyRpFH7b4b3PExejtCDviGlbZd5qnAipW4xxY3f1jSTAtjTr
 5t56Ra8mQa7yDoU5w5gGwobgwkGIvdyj5OJjRgcxbv5d/8HXkApMuEUlnXnBOugbCSHf606N5XW
 pYJog6OdNfJLnmAZflsBsH7RPOd/5M3EOAJkgwX4jwi7wdGRsMNzlULVhypQ0dHJXDPE9OjYscY
 ahC/bp447oJc0y3WPfFH591gNN3Q18ACXQJMzkWRy4ZOCeisfwezAT/BM3kkoOfeV7h4FKhjahW
 Y89hOqtjSsr7W82Brhs5fLpp/Pf1RydP5+8IQO/mQtVG7f02R0zpK/gVMf0fgSiL3FrrvTpDXYk
 htfkYVz6aazqzNpwAlHoxBjyEaWo8n+KYheGWh8ClVfL7vjP5NPmVDGZmTrWQh0lS17x8eRnNZH
 8hXfhUpJjek5g4ARp/w==
X-Proofpoint-ORIG-GUID: zANTozj-MAfAwV5S1qn1VBDsdVTJlEFa
X-Proofpoint-GUID: zANTozj-MAfAwV5S1qn1VBDsdVTJlEFa
X-Authority-Analysis: v=2.4 cv=UcthjqSN c=1 sm=1 tr=0 ts=69eca0eb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=vpl3xS56dgtxGFZ4nZMA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250111
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

On Thu, Apr 23, 2026 at 09:03:27PM +0200, Nicolas Frattaroli wrote:
> Add a function to get the connector color format from a connector state,
> and a new function pointer in drm_connector_funcs to allow connectors to
> override what connector color format it returns.
> 
> This is useful for the bridge chain recursive bus format selection code,
> which does not wish to implement connector implementation specific
> checks like whether it involves HDMI.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 16 ++++++++++++++++
>  include/drm/drm_connector.h     | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
