Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E48C44501
	for <intel-xe@archiver.kernel.org>; Mon, 13 Jul 2026 10:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45AE10E8F0;
	Mon, 13 Jul 2026 10:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QNFOxgh3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q64Y2H6u";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E4A10E8EE
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 10:29:17 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66D9uimY1089950
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 10:29:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=; b=QNFOxgh31F+aQwWH
 ovN+MuWYrQupUnEJ4E05qCBe2S9rP7KHAIzWX8QuWwVLkBnQCTy1Hz9uUXC1S7DF
 8ziWPWrYXfAPxVQX7yIQ90tkfXiCc0VPr519QCrHicbq5mx/va6EOAY8OJvHnMC3
 RZF+ARzvL1gWrkTRgAmMOSEPMRMgnJsk3tSucarsmgrls/L4q+xlgyoSuIM/bgkt
 B+B96eVD2U0ghoOzlEzmHlymMGN9Zy4snq+v8VItrjMOWQ4hjzJIFO+xwOz3UgBn
 1yZtKxrH/rfPDe0dXOHL2JQMVO51Kqi381IJox02JTjVELMpumm0HRsXH/c9hr2z
 cyqT8w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r3qq-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 10:29:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8f08560ea44so46289066d6.1
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Jul 2026 03:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783938556; cv=none;
 d=google.com; s=arc-20260327;
 b=H5UObMQtc9uzV7z5oWF62GU8lKn136RPzysdWZWOFFMvDBNUeKwgWTEoP6uQRVAWqF
 MsvLJ0l0z3xCexW0GPrTlJsHlPfW/a6gNpL4oBf5oKJwnY0KQ0HHjhcC2P52AsI/XWa6
 gjxV78uE4rkdEgcEGCH81aft4XJQ71sIy3v/BYSMfd/BNDnJCPD0fXrUSaRZGZN8hvzv
 weNDQg9H2xnSzOyyFDbcPMFE5K1nMocyKrDjOdtP7nHUqMngd93M1gdWIKTrOzVgVqVv
 2petOjmvsQsWGeSZM+hFEL+PWYtsTdmqicYa36cvKet16RzQg+hRActAFB8e43FxGTWE
 KBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
 fh=TwBzd4NeeaJnOF8Dmdsw8117l3T+wve/k3Rlqh/biZk=;
 b=WWrcN0w4NXKe7+i9LAIT8KY3stGMlE6eJAo4x3vILILcWDEhbSSYlJub6bI4RTGSY0
 dZM8tnBDKG3fPre3Ml7gqkkW10jXn1C+EkMPWyL7s7BQicSTM+OuhB75vGB7iF500SjR
 HaYsrnm0L7Kw4HnW2GNo4ro/MXsI73+5vgSZOWW+r6naHbtZ3EsjYxH1hkv5nob13oZD
 +Dtm0NJ/h15n4qo34gCLXDZ3oX7sIJ6TSZF4HsVktNBLbphrD2BpQ0Fi0w51HbScGPWs
 1y1BWkzTaxFtyOSe8VAvuMiwqlqR7GtNEFsl6WAPw3u039hMYaqKOpjjb/4i7UXTjDdy
 toMA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783938556; x=1784543356;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
 b=Q64Y2H6uwfNWxZ6T+epJxFKJJu2niQbi6Fzu9H6nFfgppaEV78UvvyiO7rQPqIxu6L
 W2SYNFPVBGBiBAYPqo4JHHGN9Kgmk/VYGox7J42kEs9RpngMG7cMhT4CHIxhl4xqvLzq
 517eO+sSYEFAZoSkdzvMc0puJ66+7qeqJhsxi72AiD4Hw0ASFoHyIwsNRk996G7YobgU
 y4dK6AXN4HrxBrHHpb3Feg9Jys3sfILCUBkc0hSnWkiUx7RTrWo8XfonfxwprbJalOEw
 dAXk6LlEIJ4iHMJmcFkBBgCPw/RR7ZmQa5oAKI7nJSn0aHHkfonDU5AhT1cg4YCsNlBN
 hHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783938556; x=1784543356;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ooopbZ8BXUYSj2UczjbYKP/YkkGSe5M/iCnsrnvSEpM=;
 b=DfMZU1RJ1Pqf9zCNmt8jdYoZ8GwWIll84IdgYEYFmKGktYn8zyZj6IyQRauAjl7V9B
 O6rxTaQQBCAxcJwZSwP8apLCN19UXMk4D9zbPyi8d24N28wEL04wNC3mIkL2rJzreeHw
 xzs0uO/BOFDydhuvPRWrq8J6mlAMM1MT5Hk+ltv/I+fMrNfmj4va17tKRTQpZ5ILr601
 aYkAn5IuRatJBMQXaW7aa5Y43p++Bnl2Ys0E2gIDKoOQ9prpgEe2a5vm3tp0qeVbeZsv
 zwbKZkaVEXln2UGbJN1g8EhVbi+R4QkrVJW0997M0YPeW4gXVhCr05CthtpoXjhhrqDN
 lV7Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrIMoEr/G0q+QesPm2du14pmX4KZwTKyvvz4voYLRuY/v16R3jkgu32IIsBTiMfHguLRtER21F92Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxuuRS9qmmU/BwJf6uG/BWPMdUH50P57E4uLsGHno3SycDJhUsL
 EXuGCgCv+/QsEB5LGfdhofaB6WXHM+WziQpOX8tBtHHcHxTVAP6el3CzvAg/8MDJB1HZCsOSKRQ
 cEh0g2HDCxUiP3UViHy5FbA+ZHGs3k6Jtt5lmCKNu+kTOxBzvu09ULBGAqAOSXhZZticYgtrXC2
 OD+fxyqTd103wtZwyEpsaREDvkYCZSEnoDtAj1/VBSPUS/
X-Gm-Gg: AfdE7ckbjEqKpt3eMmNNeyn2sLPtI+m3nGfuIFvSDYbr6fByKzd3LELSgMML7qk533u
 cUT1c8DhEopu4OjzYCywsh/mpPMH4Yv4auDJ8HPwi8TJ3JmJ+NNfZ+dDPRCzKPI81Rg4LGO4KQF
 xrpbKC0ShGgvmifwhbtqaHRfU4iO4fz0kRd54e/lKzfXJ7VVqGQ5LhwdfZFKVAHpXerZFx
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-903ff76144dmr97564776d6.1.1783938555914; 
 Mon, 13 Jul 2026 03:29:15 -0700 (PDT)
X-Received: by 2002:a05:6214:238f:b0:8dc:2c21:32bd with SMTP id
 6a1803df08f44-903ff76144dmr97564106d6.1.1783938555502; Mon, 13 Jul 2026
 03:29:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
 <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-11-1ff028e33779@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:29:04 +0200
X-Gm-Features: AUfX_myf4-1EuuJEsM9iEruoBmhvEE1_shBmpnLHYi6rPSO8vgxEgiRb5eZm2os
Message-ID: <CAPx+jO-P3Yt6T5Kb97MjmMB1mYeEgjStCkSACM_wsrqsBVFEvA@mail.gmail.com>
Subject: Re: [PATCH v3 11/20] pmdomain: imx: use platform_device_set_of_node()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>,
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
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Peter Chen <peter.chen@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 driver-core@lists.linux.dev, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
 linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54bdfc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=QyXUC8HyAAAA:8
 a=VwQbUJbxAAAA:8 a=-ghbRyKqcrg4NgclPfMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfXzVLjuNvwHpFs
 uXiD8mwNj3YVeFrHYAmrcpTFOZctXuqR/NkVHNmNgFk1pm776/dN4ofsryHMA3zqiqTUJV6XwwQ
 4/tqsQB9zW2FM7I1fxts81uhVotqK2Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX3amO6h84plUo
 3mLRpeVhLWoxdhPZO1Po23D3zn1swWjA98B9pNfJh0y69vmsGOfanpP+ApcHOZcxvftR2zUNFZd
 SJ7ARhS8eiQtgAER+Kg43UDbN/yYRJLbuDOZu6f7iYDfeHaIzLW6fV9HwHnKruFNLdGtvYKxDnz
 SmDGwE7sW3oYD+8vRquUBaIlM0MhNAfnFftRCJXNjOH6Viam23Qe0kUkML73BBcU0MLW+1QBoiD
 jeOC5BIqjjmQqVindvcRCS/Cm7RgRRhpHJfSmTXpQjKJE+DgZz4TcgWJMFakom8OPxzK+j2+76P
 A7eGlszdr7zLwqSnnZZfFavkrCzr6I0NboXDEpUUq721r3mLLcLvthOOSWUhSaG3N/SZNhs2g/g
 NPx8Op9Y02FVS+VF8Zk1qkERpxSb1Xr36EuYsIPnZoIGpvJ3YuScswE+S350YpTbkLIYcRxxOWO
 uC7s/qnxuOS9sNfyBtw==
X-Proofpoint-ORIG-GUID: l-b6JhBpbKn_FoBgRBf3AophJEKIy2Mq
X-Proofpoint-GUID: l-b6JhBpbKn_FoBgRBf3AophJEKIy2Mq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108
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

On Mon, Jul 6, 2026 at 2:45=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Ahead of reworking the reference counting logic for platform devices,
> encapsulate the assignment of the OF node for dynamically allocated
> platform devices with the provided helper.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

If not too late, feel free to add:

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e=
1395c413160c950 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D of_node_get(np);
> -                       pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
> +                       platform_device_set_of_node(pd_pdev, np);
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>
