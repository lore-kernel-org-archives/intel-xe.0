Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB12B606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 13:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fzfhnCGS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFXfKm2c
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4312410E1C0;
	Thu,  5 Nov 2026 13:35:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9730411241B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 13:35:09 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5B3N1h3193917
 for <intel-xe@lists.freedesktop.org>; Thu, 5 Nov 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C6les2P6C3VYvsc8kD6y8hS8
 7HftniHxNnR9mHrsnsE=; b=fzfhnCGS61R5KeLTKzhUcDeAl/a29wFH1O5NR8ZL
 Iw6z2btcm6+JaEDnK9eSRH8JWClTBhbiW1AFYg/luuhSwwunNo2lkKeM8EYe8rvZ
 TV7x7CaQX3OrmcH16RuJqyNZaCGDINouoX1PTlszEStB77ayp7XVqjs4moIZ4Xso
 E6/GKvXrqnzlh6tuy2aaE4RkQ/asZV+KBiDYP4qK9qy4XiIAloPmt7N3Uj5FTN0f
 HCbfzWU/oCCQ7Jmpz8VKhvc9YoBR8esCIXqkfvzL9IGE8Mvw/QTBa0j286UPKh9Y
 aM/5s7PwOIzIj6WL90/6ma44jvKpdaijgodIthb/ysITBA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrmx7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Nov 2026 13:35:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cbf2fd504so370351485a.2
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Nov 2026 05:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1793885708; x=1794490508;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
 b=JFXfKm2caeL45rU6qXn/1/q2iRxI/Lv3cIwEyDz3MiMjfaGBh4OMIzsxra8ES0Ce0A
 W5mEcwr+0j9LCE/Ecee4wsbZXN/8KKfLaeZxXUAfDMsEag0O6F7RELOsg/iCHPr7wNUS
 VAEOw9hk6j8+8AugyMBf7LdPrdYIWDEDW9JQmlAMOVxPA6PtebIqCdzUeaJNDA3XW6ae
 MPOZb8jO7F1J4VoP+FZ+zSrgqwOW3o5/NFBFZxdZfTnh3r1J4eTTGy9V5V8KOWGmZ+Tj
 QYZVXwVIxe2ECy7kt2uWZBe1EnHq2rOHxckMgy/pIhIV+5ToIHKELm81/x4vINU+iqV7
 dO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793885708; x=1794490508;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=C6les2P6C3VYvsc8kD6y8hS87HftniHxNnR9mHrsnsE=;
 b=S/EzI8/Ay84F0oTpKhVPGF1jQAENXFNu6pFErV68oDE5RCa5ctDysC6pdyn6YGamWC
 sgHsZwUIQEoKqwbFF8ajo7bndx+8NbeErh4EXL2UvnNOmYCBHAIsJzuImPr65P7iLR+Z
 v0SB4k9ngeBrpzAQVUMNGCD/2kwfW9w/j4DdPNSUpMby0WLzHPhSW06v/t43ZCzxnT7j
 Ic8WXm8N4anm/+0hCZ0hLRIxvABXja6chPUslhuCXnjbItyPC5yrd7r9M2DM0UMbppL9
 zC8gBApZQivF4mZoilyTFPRwP3F8JQw1w9zG23nZ1wrSe0qKwWZcNJLnCnQ4FOv3RCb0
 bvlQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByWulQk+9RNkR2EdL1Z3ni+bkQmMWMZ4OGHnS+t86rCrd2h+DJnl+qw9gPwhDRlpZFr0HS4ME6vkw==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/2WQLxFUPTnhS4rjeHQsufcI2UXpcc8qaJTjfgJVNYIoYSFp+w
 sAsxR7VjWDjzkPXRaI8lpnXGxaELHSDxdMvMbzBpEGXWuRZE/5gykz/3d8sJ4f2IjOUvf8Zb6rK
 aPphbd7oibHF/dzoT4Bl2u9xycifviG3OLV5h8WRNBbvX50uOkg+BCphMAQjuZU1BnbvaSQ==
X-Gm-Gg: AYBFou2nrxg15zQ8/nrFAc/Ftu4K+FQ7qmndZgc+JEPxt4Vo42clDAELbEZLrG/f00+
 9Twy3Xj82cQftndjUgmiy/foQ6lX1gDe7JvXPcV7T7mzf7VqLfM5NJLPsIbK1Rff2yjxijzgH3h
 Q8PsU2tVy0ygy+kTakuMyvmFq0nhXTZ795FFoUyo5B+YkhrWB5/r4KoFW1+0R6tKLMmgp5PyZ5m
 RZjffNujX1xdUWrxkF451hwyzzWhrRPF29hTpQneKZOVkL083xeShq3agdoJ/mfPPXWEYNmVX+H
 Kaoluo2v4SdRLU9Te6vRA1Gb+nf252Jf0P73ZkJitJ7lUGHv0i+X+nhLQQkaR+Xayg99Dt2wtXx
 iXU1aJjCychqVrlRhVH8Q86qeX9fLxtPvSkukJQN3t4NwcPvraq326sz51HcITVAnycXVuxzLts
 4uriyeLKb2prrxtracC1wgv2INJC/DDoIf+d5mNJR/ixz3iFWg8ALBFB1DtWRU
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id
 af79cd13be357-945b9c8dedbmr1578450885a.20.1793885707690; 
 Thu, 05 Nov 2026 05:35:07 -0800 (PST)
X-Received: by 2002:a05:620a:a905:b0:945:b9c8:de5a with SMTP id
 af79cd13be357-945b9c8dedbmr1578445985a.20.1793885707078; 
 Thu, 05 Nov 2026 05:35:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3acdc6e07fdsm10695471fa.28.2026.11.05.05.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2026 05:35:05 -0800 (PST)
Date: Thu, 5 Nov 2026 15:35:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH v8 5/9] drm/bridge: aux-hpd: let drivers pass IRQ_HPD
 events
Message-ID: <6x7dtyvhbk22ri6nnpuo5jpk2ijphaebgbbchoramc4fhnvgjl@slhivetxacte>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
 <20261024-hpd-irq-events-v8-5-6ee949e7a384@oss.qualcomm.com>
 <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179387924494.1025980.3024349339803589757.b4-review@b4>
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec860c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=P-IC7800AAAA:8
 a=oSBH3dYeosbuySqTTykA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: J-0qGgdK_86uIb1GDLt0-H5YpB12B3pU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX0gF/+QGB0pIg
 RHHT3d5xanwSFksPoYKR0SxyiWA7bsqQpfhwHBdMHBBUj+rs+VLbe3q4buFlBl8v7sLDW+4MdjZ
 NNe0AqD/PlRnnRp/y7CBUk56NCBl5+w=
X-Proofpoint-GUID: J-0qGgdK_86uIb1GDLt0-H5YpB12B3pU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1NCBTYWx0ZWRfX6KrB8N7Ebipd
 nJMOhAkzj1nIMIXrCel4cwiSNPw55YmvQ0pASzcRm6yEn9EXtYrXkAns9O0Zs277+lbHU24Ii/G
 XUh1ezhfRUFh8XG6Q0eBdwQjhEg23KEgU0sgeeomtPVoPURXe6CFd3XxdguGhbVJieG1RjiwVpR
 aJ2IYnAfg7F4lGe0w4wdi680WhaTYQLen6r1L5CefF1luUF87ZB9UXq2i5EsQSm9bCnJpPYAsU0
 PdAOGlFOeSC92rVYzKWR4tIEUfVJapnmd+eBWzPaDCda96wa5B4rNRV48hL9zCPU1UJq+ukyq6l
 a5uhfS+KR1A7b1SzSvwjhXICt/yhYKzfHgaixVDkFiEylfGseAP6gIHY00nKL/gtRFre6yQI8TI
 o4qVQhI7ZvaASeB/RaQSowiJyw+uJKsRzHzxj36JteD+JZJ7ZMOnZ6ef/nuB2TtCHO3rugaXXYS
 5IJxe1YMrZfEUy8NE7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050054
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 12:47:24PM +0100, Luca Ceresoli wrote:
> > The DisplayPort standard defines a special kind of HPD events called
> > IRQ_HPD. These events are used to notify DP Source about the events on
> > the Sink side.
> >
> > Let users of aux-hpd, the UCSI and PMIC GLINK drivers pass the IRQ_HPD
> > events to the DisplayPort drivers.
> >
> > The drm_aux_hpd_bridge_notify() is kept to ease merging of the series,
> > preventing extra cross-tree merges. It will be removed once all
> > drivers are converted. The drm_bridge_hpd_notify() function is kept for
> > the drivers which only care about the connector status and will always
> > pass DRM_CONNECTOR_NO_EXTRA_STATUS as the extra status.
> 
> Do you have a plan to later convert all drm_bridge_hpd_notify() to the new
> _extra() variant, then remove drm_bridge_hpd_notify() and eventually rename
> drm_bridge_hpd_notify_extra() to drm_bridge_hpd_notify()?

I'd say, only if they require the extra status. Otherwise, it's just a
noise which is perfectly handled by the wrapper.

> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
With best wishes
Dmitry
