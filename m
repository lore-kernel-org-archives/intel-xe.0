Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0AAF8FA90
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:57:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B50B10E250;
	Tue, 21 Apr 2026 15:57:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDFHNou7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTwFiafI";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28C310E250
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:57:51 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63LDVAWw1538479
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=; b=lDFHNou77qSltRFT
 d6mQBV2twhNcfaV3BWEzHvLwNzBM7Kr1tQOtNZtfUAUFioKt1G+wO9ITN72NKDFS
 5UDnm+2ORgJBRVYctxjUSqeXte0QTQI0whKUztK20/S9eDDxSBIKlNzGfG/fTzzZ
 krNDDSq6SqgYvLRhpQAm/le6Ped08gdfIz5V4pBftRdXaXoxVN/KLS6noPl6QxFV
 gnRDH1GOZwh0PUZDpyL5fTxXld3145ylLiprYYjdW/HcbSeUAo6FqsnTbISkgNcV
 Flq5TIjocw4Vyyk0U0euYYEWg4ecfkIQo8O4rKkrzjjubft0Qqaq60D2ufG9NAxB
 IUFJfQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp4hahxtm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:57:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50da31af14cso119014261cf.1
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776787070; x=1777391870;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
 b=XTwFiafI6pPVF9Lv8fKLNrJ8+p1gXLCnaANuPh+B+Va8t3WdIAdjfFz9UJYDQoXaOr
 SMbjgwzpG+aAsg/j0hqupzvilOiqAYHzEuigx6WyKrsIzDzXRzgJtYqalTGV3DhfBn/0
 mBqbhU0CSiH8xvwboRNBl0wbfHs2paA0oGHBukh1rwnSQMEs64+i21CeAlHv9DUEuhjA
 IdDdKOBpjX18mLKC42aaiwLemtD6xQeWbbpV4U2TVzTKaKFcLS++Q423B1V3/Zq5yE+u
 DBwGlMYYidqefDZePk5N8QnXtsn7DBDjX/5qXjQ2SjBSFcC/qiAIqMfunFT0bKGDOjhO
 m84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776787070; x=1777391870;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ys1jyeNpnzd90OZf8N4CxGmEXCPff/CREI6n0RviJik=;
 b=YFOsYPE1TnelW9CNbO9+LKe4VFmc7/m/nfNGzB8i24O+TAN0Jop3Ju6h15TyD+xTvB
 qzbI9YWBwLWay7h7YTuqyCr0hudEwV1LVQa6+qr6klg4xhg2mkf2vKNU4JL4p/jYqE12
 DneVDeWypPoohHLJQHl0Kz1C3YdOyl8KTAd4AvUdrzrKcdLPKYrjF9R/WAmAP+zBax1U
 e0MuKJmtFWIgtVKYxxwMTP3qa5yrvv5Lrwi2PpxWkAlAujKO+g3gfTz9rjDYkrXFqh/j
 FeknWDhD51UynXPvbUfBTBBamTuLAJC1ZbaD8YlpDUBgw48Z4SwEv17tE8GzfENLaJoi
 z6WQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9ERjDoJNYEx028sninJh5WakDo9IHz6BE//udsyCAAHjI9sfqilxSLkePt8yigjdvUFhV7saihWg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGodzVZdp8nSM/lDgf+GdHHxeL3xZ+Cr2ydTZPt0Qb3Js+yHw3
 /PY6cAqydXrrELMsCtIhiov3RgRaBB4DYsYeaSlIaXnX4Sm0rKje6Zq7K+a8tz1ypJUZQOwoDjV
 WVw1NyUV0wTzPUwei2ZeVKQDXLFhitSCdmjtXYrizj8xgxpdnSxEpXaQHmRKMmSmHyl4G/A==
X-Gm-Gg: AeBDietKoQoSDYLPTIaAFAdbRGLeMR4lXbwry664B5KXKYu8NDe41CkLBLdsRmJdMdz
 F0SxM+1c3dWNZgFuJ6Ngy2slm/KfEpTCSs6HIdXRTFe7AEFLpgx4DN2IOeDfsLXQqsPptPf7BsS
 N46ORUf6UR6QQ/9F6ow1QBxtFnhetwr9PSZVmZ3BloZa68jifb0s/YeyVq3Y+ZFMrrH0guJwcJ7
 Meq64BNKduQ5VTSREQeOQs785Sv3wEkTuOD6qy2+Oz3YNUrvwAOQGwVocpK+SWg+KxnVP9/Ix57
 KLYp1/gKKfW6MpJl1wLi/vwtDSQK2U86gxjDl/kbNqd7Y+jzSEG9UpEAf0OC8W+ROlNPJCerf8e
 umntIbBWIdWfNptHriFNqJAAmrDdPFsc4VzqZShOr99LhYM5W9O/H6DFG4xWMK2I50InOibr9mU
 LXrUtbVRaCZm2ywZkl4jRtjbKPkG6Op7SnRe1LQUMcgGO0Qg==
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id
 d75a77b69052e-50e36ca52aemr279020641cf.59.1776787070010; 
 Tue, 21 Apr 2026 08:57:50 -0700 (PDT)
X-Received: by 2002:ac8:7f0b:0:b0:50b:4e4e:1a20 with SMTP id
 d75a77b69052e-50e36ca52aemr279019841cf.59.1776787069503; 
 Tue, 21 Apr 2026 08:57:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a5241f6583sm1444371e87.39.2026.04.21.08.57.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 08:57:48 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:57:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simon Ser <contact@emersion.fr>,
 Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Alex Hung <alex.hung@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 15/20] drm/drv: Call drm_mode_config_create_state() by
 default
Message-ID: <rkrhykm7dcttupn3plthf2m5sshtnnojib3f4pj4lxwrswetai@ncxm7oos35zz>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-15-c63f1134e76c@kernel.org>
 <79cc30d5-80b5-4d87-a3ad-36d6fad98853@suse.de>
 <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd39f423-1598-4749-8c95-98b8daf69680@suse.de>
X-Authority-Analysis: v=2.4 cv=bOQm5v+Z c=1 sm=1 tr=0 ts=69e79e7f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=iox4zFpeAAAA:8 a=YNIvkKx5IWywne6YJjgA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-GUID: 9m_paQPJI6BLZV1pN8kEn9k9W05NbZRZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfX2Zph7EE7rS7q
 ku4mtGXQG40tkmrOyQE469m66LBNJiExY7XitL2F+UbCQjOJLu4ugg9RE+HxNxL84RJehDHzh4L
 lnP4AnMidQOz3rKExNXHD6eLwYSci4WSLUOdtJoImRhANmJh8+We/VY5e59WkUT+bTC79/+3CpL
 zmN/kVh8gG6D5SSMemPBgrbkhKNJBs9B4oH/V7PSr3biNGRcTlFAZAWz0DcKDGABEFTb1UpT1Nf
 Uii6CoQ1xHMehJ6mlOIBCX1Mi/trNtlSnvBiPbhZuAhfuomCufnNieqQjAOpkbhl7r1qm064cBc
 gB+XexQlcTsKKR6QAQjrBAFZhqmpURYZGrjKj2aNjL2KATZ1z+Bbzerp6Ej/8rE57/NeWGhxy6k
 qHvHo9b2irQY1B83r3pwefFSMZVNi3gadpwZ4dm45teYigv6m+j00nmsjQB5XhYAlxpfG72qE+0
 IQyukJ/4FwoBqAuzwmg==
X-Proofpoint-ORIG-GUID: 9m_paQPJI6BLZV1pN8kEn9k9W05NbZRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157
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

On Tue, Apr 21, 2026 at 05:33:12PM +0200, Thomas Zimmermann wrote:
> 
> 
> Am 21.04.26 um 15:38 schrieb Thomas Zimmermann:
> > Hi
> > 
> > Am 20.03.26 um 17:27 schrieb Maxime Ripard:
> > > Almost all drivers, and our documented skeleton, call
> > > drm_mode_config_reset() prior to calling drm_dev_register() to
> > > initialize its DRM object states.
> > > 
> > > Now that we have drm_mode_config_create_state() to create that initial
> > > state if it doesn't exist, we can call it directly in
> > > drm_dev_register(). That way, we know that the initial atomic state will
> > > always be allocated without any boilerplate.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >   drivers/gpu/drm/drm_drv.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > > index 2915118436ce8a6640cfb0c59936031990727ed1..820106d56ab399a39cac56d98662b5ddbcae8ded
> > > 100644
> > > --- a/drivers/gpu/drm/drm_drv.c
> > > +++ b/drivers/gpu/drm/drm_drv.c
> > > @@ -1097,10 +1097,14 @@ int drm_dev_register(struct drm_device *dev,
> > > unsigned long flags)
> > >         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
> > >           ret = drm_modeset_register_all(dev);
> > >           if (ret)
> > >               goto err_unload;
> > > +
> > > +        ret = drm_mode_config_create_state(dev);
> > > +        if (ret)
> > > +            goto err_unload;
> > 
> > Way too late. Lets rather go through drivers and call this where they
> > currently call drm_mode_config_reset() for initialization. This can be a
> > single-patch mass conversion IMHO.
> 
> On a second thought, can't we modify the suspend code and leave the reset
> as-is for now?  I'd still be interested to use reset as a means of
> initializing the hardware or loading state on probe. So keeping the _reset()
> calls in place might be helpful for that.

But isn't it the expected behaviour? The driver can reset(), but if
it didn't, the default would be to create empty working state. In the
end, the drivers also can call this function to create the state, don't
they (and then perform the readout logic)?

> 
> What's the long-term plan here?
> 
> Best regards
> Thomas
> 
> > 
> > Best regards
> > Thomas
> > 
> > >       }
> > >       drm_panic_register(dev);
> > >       drm_client_sysrq_register(dev);
> > >         DRM_INFO("Initialized %s %d.%d.%d for %s on minor %d\n",
> > > 
> > 
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstr. 146, 90461 Nürnberg, Germany, www.suse.com
> GF: Jochen Jaser, Andrew McDonald, Werner Knoblich, (HRB 36809, AG Nürnberg)
> 
> 

-- 
With best wishes
Dmitry
