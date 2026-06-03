Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F6ACD6E56
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 11:12:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C5CB10FC1D;
	Wed,  3 Jun 2026 11:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV/ZBQBW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="StZUOYT0";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445FF10FB57
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 10:15:36 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6536RSE71200262
 for <intel-xe@lists.freedesktop.org>; Wed, 3 Jun 2026 10:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=; b=RV/ZBQBW1Gz7WB7g
 C36gOhNhdL+lLAmqQlpap6noJbbxHcrt5EIxi83XQdvwRajDeMt1YFcY+H3mGLXT
 9XatmhW6r/yTEhIszMkIGbMkNaO+fyhhVMzwIGL7bcpZ9ReeDX5jEpLuRbcstKSQ
 YhnhXEg7Vp0lJ0rPhBLgdWq78t4NPOsw/LugKMhQPSnThw01mcIgA9my3R2A/CFD
 SMxSsEToum0RhiBvscPxkFsFs1FxqjfwWOQrc5lvshnJbrHXt0WtI8psq0P5nZyX
 LEs1LzosAOE89oi/Bezr5wGe+ccK2iGDRjqfsqOH5hQOImzaSe/nMOk3SRXe02I+
 vbBXAg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejckw1gr6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 03 Jun 2026 10:15:35 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8cce42a4e75so88606306d6.3
 for <intel-xe@lists.freedesktop.org>; Wed, 03 Jun 2026 03:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481735; cv=none;
 d=google.com; s=arc-20240605;
 b=iWGt9HebLosDES0YYm+FHMsCxQyzidYBpa0oMR6u1t3raQTo/EnwTvqbbV+Yg4LhgT
 4wvH3MH1a+nrI/UkAmNaYwtqzokRMY6XpqrubXgoJXrw9DYEBC62MvenUx8zogYzJYMR
 YQ7j5iTNaT3irYNxLAjqiis7++Avox6fAgjgA3GqJwK1l1002ptw3fnxHg3vNsxlcMW5
 U07V0FojObQrKUDFEvYFG0UPkOuzBHoJuhSFAu7YjgeslahB22mmbe0P4maFyLV6Kf/X
 BalF0QaPaTQUL15Gp+8qXA861ImQujaR3K6PPYvgEkDKI/+J4ZQ/ganCKyWnPuLJv+Ix
 3UwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
 fh=6APtKwSFh+x0Qca6uR4eRFsADfMTnQazuHVa7p8OIE4=;
 b=dqDN8VNqSIF244yZAjkOQ/wgASffiHoPe3n/+RlMAHL1R1jXpaYaRBsRm5kns5sdlB
 dIcWW8W7hJo2KjYzxPv2xe2pGVcQEvSACu4V1ajkKgnj5XgS5Wpj0RgfyOGNVx2pGQ4M
 TrTvMZFhmShR0oWok0LgT3Kk7pCWI2MpkoyfUjzqCOsUIxy0jVZ2jNoeDLPbfcvZlXbY
 kAtd7Zc2iT8eigxiCbW/YbMzbZnjaY6D/t4A4XP1MfJ6FnIZiCCb2h3EST3qP4MUcecz
 IbFTqMElgl00nYoAxIw29rXyUULbmelnQxmuy95bu9WTT8fnk2/lJ90rz+FmJTclMUJt
 IDpA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780481735; x=1781086535;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
 b=StZUOYT0gM4ZEEzMg20VejLdytgKo+KvuXrY/fzp60cBqzwhIwm2dxGOO+xh/YsgR2
 5ztHBMAmShUlQolvRjdL/ZEYtFQDxAWQNjA7oEibww9BjhtzqMJIT42+rb7Ma4AAtmMT
 5YkyiS0zBHnkI8KFsKdqcaApoxsFnuMXkKJAG3J7JcloP8ZIQZjEkQFtvuvly3YJqsR2
 P33Mea+BiuPLyJMTLPMJLyDdduLEnXDbj3SWviJ5mgv5a8zHVmi2EiqTCzkdajNmE65K
 6Ot1c+odBVcXVeaMHBHOrQElHMnyAQmG22DQHIzhqAKJbPPssfwapCgYo4nyLMEOh6kz
 hdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780481735; x=1781086535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9n9AHlZU6kUO1j38Uc9X0HmM7AR04hZBNstxafGjgo4=;
 b=DEipzrwijbxtwfnDFugESNJdYL6cyAafT4gC50wWI0rBfXbcPfSvBzZQ6Reha5sdWP
 t0EiziCo9nHCfHnFjTo8eYTXXCIBChJVzq/s13nSX7A9avbCGqKyACEunV2jMOQABH0H
 a7cK8AaZBukyhO04zvZTULxLDM1S1JHk7WXl9yxbLjG18i4/xMfE5IQq49WtOiMVM9yb
 WzEo+4i7rorPtFagKqhJRBvyXRanuGjamkkywmVwemgP+lOa+qK3iNw+6gNgstvkv3Ic
 he1BL723T4nrNgkbasrs3RySoRDilg2+o5w2Ed86WhQnN9oJeaWKUYU2oXZsi5fwq7eO
 X6rA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8w3NZwOYsaH8JIYfg/7OCW/YGqzP8AX4cBdZBTzb0n8mIoYsOl5GjT4TR9qNErLikIBuTVoPfsHA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0HyVoCh1VLRdJ4/6TG82vgWfAMyjanHPpKZx4QIcaHIGxXIWv
 docwIzZ+db8dLWC40jVATQPE2yNWmNuXnIpuv9iuyoL/0wT8Td64IRMNqJ4z4mrHuwbv2ViwEvc
 rsfAnCZ4eST/oANRCW/ywB0AKg5PVZT2CB7mxxKmNXvcYRjZCKGzMrH+yYSG4+BC83eA2J66hB3
 OZmBAljJPzU3HQ61bH+FjzU4a2mSlRkIRe/hhEGONaHMYJ
X-Gm-Gg: Acq92OE/BVNntp1roHfFhPBYInOylOsYHMKb5oFdwNjTmCk6RFO2XSISVhQ8fXVXXxE
 CQw0oahzceS3nADZS2Amg/42Q7y7VD0bsm8Hp0VaHXwS3wG8k7tCuPE24DhH71fegiMTOlElEnp
 ECio2sKYu6gaTJu61KJSc3v8WByBgZe0XLz6j1obz3ZIrYtlvJ8AwBjpyuSFJfTpIx8cc5kQoAU
 FEX9s+3jUqo1A0K
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951786d6.9.1780481734741; 
 Wed, 03 Jun 2026 03:15:34 -0700 (PDT)
X-Received: by 2002:ad4:4984:0:b0:8cc:6c08:552f with SMTP id
 6a1803df08f44-8cecdc03682mr27951226d6.9.1780481734358; Wed, 03 Jun 2026
 03:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:23 +0200
X-Gm-Features: AVHnY4J4K5UzPNs1yW8q3X0LoIQq3c8UfPuD4kHDjf5PzjApCRf1PSF1rlsmtoU
Message-ID: <CAPx+jO9iJBx6Yifap55NOhn5YZk8Bbwpnk+aeH+0PgYuMxke1Q@mail.gmail.com>
Subject: Re: [PATCH 04/23] pmdomain: imx: fix OF node refcount
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
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 741RAlOMwoZFnJZs0lQRFLl6ZB942RA8
X-Authority-Analysis: v=2.4 cv=edUNubEH c=1 sm=1 tr=0 ts=6a1ffec7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX1cfpaVwUlKsA
 V4HS2bSAWjul7S7pL3S3yIRpNvuZ7sg5ixVSb95agK4LNBCAXUeSi8AYgLvwn+YzRubvBgHYX3W
 NGwfm6k1vhXEW7VzBdKc/ZVI5a+uso0XLSJd97w8PXY5LkR6W+bM53j1VMYiu9ZWJuiOkLfD5cA
 /88UkpypBgtrp/jkE8P9LcY5vWL8JXEU/IAOzxmbTdecEzJEq70eW5wFHbsILyzqTZrye2Iok7U
 6CZ2RbgNKULo4GgADO5gOdFKDZPlh3KN5+v0tyThL8O2Po8n4d7WU4eNKSsl7wFUT/ZK2prH5mn
 vOkFOvfelVGKOp/0aCJQC5BeWmLt7ExtqpgX8ba2DlIeYclhejalPpjsLwCX9TduMyHc4omuaCG
 Yhm7gv9OU+IyUXoZnemmpp1LdsJ/+9K7w0zSGNsnA06iX76DGN7zk2g4iKcf/LX3DvxZtjyaGz3
 1sUNACwUd5Ex9Ise4aQ==
X-Proofpoint-GUID: 741RAlOMwoZFnJZs0lQRFLl6ZB942RA8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606030097
X-Mailman-Approved-At: Wed, 03 Jun 2026 11:12:01 +0000
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

On Thu, May 21, 2026 at 10:36=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> for_each_child_of_node_scoped() decrements the reference count of the
> nod after each iteration. Assigning it without incrementing the refcount
> to a dynamically allocated platform device will result in a double put
> in platform_device_release(). Add the missing call to of_node_get().
>
> Cc: stable@vger.kernel.org
> Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each O=
F child loop")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d=
4eb5168942a893c 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       pd_pdev->dev.of_node =3D np;
> +                       pd_pdev->dev.of_node =3D of_node_get(np);
>                         pd_pdev->dev.fwnode =3D of_fwnode_handle(np);
>
>                         ret =3D platform_device_add(pd_pdev);
>
> --
> 2.47.3
