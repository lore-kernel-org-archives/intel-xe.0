Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0024CCF9EB
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 00:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB910E05F;
	Thu, 30 Oct 2025 00:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jy3Ktocq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HxXvMy7m";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDAE10E05F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 00:12:26 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TLLi0t1697828
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 00:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=; b=Jy3KtocqdD5BKvb/
 uSvsMseZSvEDh6Mk3hdbKAkARftkNcBLbPtjXIxJGTPJ4ScOS0SgMWZGvLSKJkqZ
 VYbIOslbYkCSiL+gyHRiDhs1H4sCIHL0XlWKVvVEYSDaQYksJcKubOxHPCBp0ppS
 ELciUmERhtM7AdvvRUhph6GJopohAPQwSpBRlFAPB8pahUiNOtGbnoorLCCPBmR1
 3fik4T98EukcUS6RSomBkUTYrjZC2/G4pcwZy8yCVPmNkssSW5HtaBxfhXGNrSIh
 dxIU5CuMKqhYo/MIH8Z+iVbgUeDrC6IVnlnFM2poLoMGbcR8pm1D1l2lkNGED7dj
 2IpqJA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv0e67-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 00:12:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed240c3d93so1723531cf.2
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 17:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761783145; x=1762387945;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=;
 b=HxXvMy7mFJrYxxB9MtUs87OysStcvk8pIll0SeMLf/4Q33LWTeOmCJih/U9La/a6uC
 Mf70we9/7ckJ61xsnU8xYmbrb4QjLUJLjcEZmSX8u40yZnwXZHv2iZH9ivE6WmMZ/Lm4
 820Cdd4lhEoO4TO0svatnGgiXhsWwPimbm4igNTayUI0DL29pC8PuZY0pjc7zcsCxeiT
 UEE8bsPOJUghRCIM579eFThmMDlPBbmmkSmmwzixDWk0Yt4eKCm7ZjD/V7YOoNUTRVDw
 VI1E6e1zrSQI3ot0NXr4Qr+O8S/aHVxJGNC7bwZS7ECjGJzkh6tbDSer4CNG3NJrt0OJ
 uhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761783145; x=1762387945;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RlOA3yo8oapL6z88NAIu8PVoZTfephjCzUiz6uOkvUM=;
 b=it8G4UCeBAjZJhW5kA3u4ElrNWhx8MZfxJkDpxZb4At15hSzQzwEFmYfJc4j8a9Sav
 emhW6IR+WKwnfJB2hN3BIlyEPEszhQU5+pn8kp8VqvTDZ229e9WjNr1go12F5Mg3n2No
 i3/m44sYlK8vjhAqPb4fJ4ztH6JwmekTDrNGTNEFILZ3LAjZHaGsBiT/ulKNoEzDOhaU
 DnjLEeQUOof+M2IPl+I0z9FGNARbmZSy+8ZJMVplCqN4Y0yH1LDWgOmQZS766WC0cIkJ
 Ld09vqklfJ9X2C5gMpfZ9wBcXSw7bbMLFMxoG3JD51uCabrzsUxt6JmaiN2mGvBNKfXg
 ROVQ==
X-Gm-Message-State: AOJu0YwrtjEKTX/xtpUv2uVWa3Librz9H7K5v6DHVCuT4t6MZMyjWTYI
 rd2oWMVg8aTQ2qxPf7+Ql1Fg2wno0SOoaqwUSSatM4D1PRA5azPeE1o25dUE4KRX/R3z+B3O1G3
 OKvz9jpak+3NI3o5ZbQMnp/kXZ9NovARBfsMxmagivi5h1Uo+ILZm0Oi0xwhBwdFqEW9C+g==
X-Gm-Gg: ASbGncswPSP3TO85/csQ1k28lxzgUJmvuB0ut8nnyUFHy7spHBNQ2okRxMF913gNofs
 LgKsexrj838Y1Kn1AAs34CQdOBv7s8q55ieJAW3PLYrd4tyteCevYRwIgWXAcVSZz+u2qCWdQZv
 QlkFqHGGMg+BP0E181Se6kGhkHAvWBcnAeSL9W61aBVhR4BX6LlpxhW/2U+DKDPRQL5JUSteC5U
 5Pk9MsiHMtWQoYklY3Ucq9gpw5Fhy/6PotZ9P4e8RwauVWoHe0J9TRdnBfS18MQz9+Mc6+KiyLz
 SEzkfTdCRGXAWC86tNrA4xSSDvbWbH6Q+Yvdq59lJucynCT9l6ncpYh4SxlL1doZHH4Agr20mPR
 0OkV/vRsFEnGdOycCkn5vLRZQEhqcMLaInmhPXxjn5kRf9K8Gca/RxPfdb0pGvk0aZh+ScEC+HY
 l6hkBm5PR5XSr4
X-Received: by 2002:a05:622a:355:b0:4e5:6c5e:430a with SMTP id
 d75a77b69052e-4ed22b201demr15246381cf.64.1761783144886; 
 Wed, 29 Oct 2025 17:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTTPJzQ4pPAdhaocWtdADne4C/nq9/kxzm5f9yI/Y1cbenNeHY/sD8/KOO3LAKlfuZ51CL3w==
X-Received: by 2002:a05:622a:355:b0:4e5:6c5e:430a with SMTP id
 d75a77b69052e-4ed22b201demr15246121cf.64.1761783144399; 
 Wed, 29 Oct 2025 17:12:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f8471csm4163592e87.106.2025.10.29.17.12.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 17:12:23 -0700 (PDT)
Date: Thu, 30 Oct 2025 02:12:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "lumag@kernel.org" <lumag@kernel.org>, "sean@poorly.run" <sean@poorly.run>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH] drm/display/dp: Rename bit 4 of DPCD TEST_REQUEST to
 match DP2.1 spec
Message-ID: <75lb7tqpoxvvf72iv3ag23yw32xce6ifxaxq4sghb2jhwxbr5c@wbjnp44tgkm3>
References: <20251028222817.3290035-1-khaled.almahallawy@intel.com>
 <jn7piiqfyeiiinpxu5ht7qza2la3cigdqlhtlvuvkbzqeyhcad@v5aypgcrcdok>
 <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d768e2abf7e27edac66f1d0068540e2b0617561e.camel@intel.com>
X-Proofpoint-GUID: snDslGORswof_U5kHHDrNPDAmmez5SQb
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=6902ad69 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=IdroE-pjToVxfVGS2yYA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: snDslGORswof_U5kHHDrNPDAmmez5SQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDAwMCBTYWx0ZWRfX6wEbrILvFg6M
 xsr4W5gsOiCg7ILP03WN8V5+uylNGnPXj4f5Vo5MQabqhB7e7KWBP3KysRiaCuAdZOpBHgllY3G
 bSXRhJWX54021oYL/UFnL8qqQ8u6mZyeLgW//Vr+6yg//nJACf2Y2x4RoXQqn53sPcEX6tqTwMC
 JsOtUM/HqccbtKTbtvaapu6+7xnIlyWAj9vXBAjyLiss6jnH9UsiYLM24jp2l7Ux9VXAsGCEy7U
 091f9N+Ccw3f58yI8r4lymaRxzPzyODl5Tptq7cDVU/N+4ucDtjfKZpzNRg23MEz02bX8FOV5H0
 7tevDXFcivAuCIeXEhjN0ohtMIL1Lgub3nCDrMlcOM7Cgg6Mnea7OgG5znfKFgYXY9W4skkaDi8
 drGP2vZvtsMSZWlYxHE5mva504ki7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300000
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

On Wed, Oct 29, 2025 at 09:43:45PM +0000, Almahallawy, Khaled wrote:
> On Wed, 2025-10-29 at 10:57 +0200, Dmitry Baryshkov wrote:
> > On Tue, Oct 28, 2025 at 03:28:17PM -0700, Khaled Almahallawy wrote:
> > > The DP_TEST_LINK_FAUX_PATTERN field was deprecated in the DP 1.3
> > > spec.
> > > Update its name to align with the DP 2.1 definition and reflect its
> > > actual use in the code. No functional changes.
> > > 
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> > > Cc: Dmitry Baryshkov <lumag@kernel.org>
> > > Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Cc: Sean Paul <sean@poorly.run>
> > > Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> > > ---
> > >  drivers/gpu/drm/msm/dp/dp_link.c | 2 +-
> > >  include/drm/display/drm_dp.h     | 2 +-
> > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > 
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > Would you prefer to merge this through drm-misc-next or through msm-
> > next?
> 
> Thank you for your review. 
> it would be great if you can merge to drm-misc-next after I address
> Konrad input.

Yes, please send v2 once it's ready.

-- 
With best wishes
Dmitry
