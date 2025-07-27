Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC485C87FCC
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 15:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AB710E1B5;
	Sun, 27 Jul 2025 15:33:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbFmqgNb";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E455010E2E2
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:33:22 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56REsXEE023276
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dh/cKerYP538krae+Lx4PtgG
 sbnWM7OFv3/FQBKxxwg=; b=UbFmqgNb7Vr558Ukim6kCbyHfgYlTqrUF27cuxwe
 hvmDIvPYmSr97Qlve4ix20LV7O/WdJXMTjWo3zN2nEdoYFpudvG86+/XmoE2G6m9
 wmtLU3UsbdO5ynwDxK9Kz6zwBQUz0JutDtThgV8/1LNTwaRJccy1HU/0MQIAdjT9
 rYkLa5sCxS4Y+tIbw5Mw+JOu3LTvoVy6MUPu4I8T7XbbFZL0bKA1iVyhPhQp88Cn
 VCm/0BZ76bDcw+sOcUl0LidQbEuEAcMgikmXW4lTVOzTYfurFXJKmiIoGKC4lFZz
 orDb/cl9GE3cLSxEoRJyRFof3zH9BKxYkaO8DGC5oLHMag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyttdn4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:33:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e350826d99so626047885a.2
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 08:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753630401; x=1754235201;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dh/cKerYP538krae+Lx4PtgGsbnWM7OFv3/FQBKxxwg=;
 b=bLh1ohiCsliT433sDtrT+vZTZ1LTxd+Hia5eMPE1NR3G7eQAS68RH80D1NICSELulM
 IoGTgjpk0/2UMmNsabb89O2JW1tVIR5ydVnGNVgU5Ac+xeZguRc6T3bCjZQKvgGyOVrU
 YEEIPJCcm1i/gGfbXYDAmGc8Ra5HqlSgnL7AwYWyzj4QMFOWiY98LjEACJUgrtuZuz/6
 glgJa9ci/ksUa8rD0KARPJS/t0beHaj2evbcvLDd8GlSTvhJhMCM+V4Ub8omVb5n+NeE
 XWe68o4NFfZrIdt8KUPR7igZ95vC/gPUjGd/0IXJWTrw7nrId6eoLKpN5FdYvudBqfyJ
 a7Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIF1rTrgGj24cLWyaqvDpbNQ4FhkLv9fDeVyeyrz84P4zO+hbqcZUnpS2WVq522GeeqEwbmxRdlA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6fxo3ja1FH4KuOBRer5W60RsHtmbKMOAajzyemqfBqF2zR2Zk
 3LXb5WXunH/oQ1rr0QiuvWOizdq9RhYgKxBQwK66/0Q/W8MCm4qShzHerELOw8OiXIVLvapQWG8
 U/x8kXYAVPmBzsKmSWv7HvsWDaBJyvZwzxazN3DzDltsjOP+Im/wXSND2P16RiUCK7nNMCA==
X-Gm-Gg: ASbGncs+b4ZDlN/55XasEwEEyMjzvT1BBooPtuhYW1ZW1YMCBPdSs0FxruJlj1QS2Ol
 QFhkPQ0r+Oe9LwxzWdIpfzHQ3+UUR2QYXRuYTNZ8dhmRf427KO2ceHT03DvUf6EaEi0R1HpdDYe
 jVvPta+UIAmbpCyFMOgNvjleKD+O2S4+6vUMPO/6rlQFXjUk6AvXdBv/QIQgxUHbsh2N5QFxfwd
 JhO8lsDBuPn5boWVoP/BARBQQm+MENKlwuC6YT67QT6PDjz/Yexv8VaWkcixgCpmUJ9rWwhwHTH
 Z/+2/x6XNcgABWEfnMxhm0iGWUETbXJ+muV/Sa1nVAiyrgPQErruKBx+2nKsE1IQJLLd1OXCtpV
 u/UIFeRUF+Jg3Q7RTEUz7OLkTD70HK9EfBue0C/PR9ot0/FEVfMTe
X-Received: by 2002:a05:620a:191f:b0:7e0:2c05:6ba1 with SMTP id
 af79cd13be357-7e63bcb5381mr1167396385a.0.1753630400668; 
 Sun, 27 Jul 2025 08:33:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKIDm3CaPdVj5Q6o9fA3RaIhO750yOPHcxLXcttC0WMEHyiDfIsCVflhSSN7Ccb2+bcGZQug==
X-Received: by 2002:a05:620a:191f:b0:7e0:2c05:6ba1 with SMTP id
 af79cd13be357-7e63bcb5381mr1167391985a.0.1753630400145; 
 Sun, 27 Jul 2025 08:33:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6317b8e1sm868194e87.44.2025.07.27.08.33.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 08:33:17 -0700 (PDT)
Date: Sun, 27 Jul 2025 18:33:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 01/28] drm/writeback: Add function that takes
 preallocated connector
Message-ID: <5qawf2olp7m2opwnotrzrvx7563dyqw6i3pkqzrzsqtn4l3vyf@4q5tisgxqpxf>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-2-suraj.kandpal@intel.com>
 <tglzdolw5nxc7tbscpfjcvx5jiydbghvouws7fl7xqryh7q5c4@klo5yncolqah>
 <DM3PPF208195D8DB4B4B18D41EAB4FC3CBAE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8DB4B4B18D41EAB4FC3CBAE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Proofpoint-GUID: dNUK6z-g5pqn4tr66yjX77p-5E0LDNMo
X-Proofpoint-ORIG-GUID: dNUK6z-g5pqn4tr66yjX77p-5E0LDNMo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEzNCBTYWx0ZWRfX7GZkHbp9tqRC
 WUVjkoTXpQ4DBYNn3nEKs3eaD3AxRZB3yCl2Yere5hbTqjoqAe4XwgiHPOtM+mmbTeZXBETXznK
 5DVgNBl9T32606vvKfi701fiRzQmVOwLPKb1bqqMQ3vrjHvRA4tL8dWh0y3Rqz6paQ3neLod6r1
 fUWv44LUXP7+ItFOJ+aAaVGq/oeS2RIO9xPFzAcSqAY6kVB4Ni0RC17XoP6b98eW2IghGHKfgMH
 o0T0t8omP/jeWh2tFUobIcWpqsFxwKhuU0EZJfY8+N1XximVvtGsNIUeYQKuvs+pY514JTE3+Gb
 yIPWTYASm1UVJIsKQFnlyrh+iMkRspCULRFUU4hrnShPrAVsJMV76f1MfRcdM+CI+5LfVivLYWg
 64YRdsbK3jGnBXGWGxJATcLHdiMRdXytxqrMZ8wGoneTbqfIgp3zaGEIQP0LGk+eUSSUf0NW
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=688646c2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=QmJApBX6WoVuYgKOPdwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270134
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

On Sat, Jul 26, 2025 at 04:41:29PM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, July 26, 2025 5:46 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: Re: [PATCH 01/28] drm/writeback: Add function that takes
> > preallocated connector
> > 
> > On Fri, Jul 25, 2025 at 10:33:42AM +0530, Suraj Kandpal wrote:
> > > Write a function that takes a preallocated drm_connector instead of
> > > using the one allocated inside the drm writeback connector init
> > > function.
> > 
> > Please start your commit message with describing the problem.
> > 
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 76
> > +++++++++++++++++++++++++++++++++
> > >  include/drm/drm_writeback.h     |  7 +++
> > >  2 files changed, 83 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > b/drivers/gpu/drm/drm_writeback.c index 95b8a2e4bda6..fa58eb0dc7bf
> > > 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -416,6 +416,82 @@ int drmm_writeback_connector_init(struct
> > > drm_device *dev,  }  EXPORT_SYMBOL(drmm_writeback_connector_init);
> > >
> > > +/*
> > > + * drm_writeback_connector_init_with_conn - Initialize a writeback
> > > +connector with
> > > + * custom encoder and connector
> > > + *
> > > + * @enc: handle to the already initialized drm encoder
> > > + * @con_funcs: Connector funcs vtable
> > > + * @formats: Array of supported pixel formats for the writeback
> > > +engine
> > > + * @n_formats: Length of the formats array
> > > + *
> > > + * This function assumes that the drm_writeback_connector's encoder
> > > +has already been
> > > + * created and initialized before invoking this function.
> > > + *
> > > + * In addition, this function also assumes that callers of this API
> > > +will manage
> > > + * assigning the encoder helper functions, possible_crtcs and any
> > > +other encoder
> > > + * specific operation.
> > 
> > Why?
> 
> The problem would that not every want can have a drm_connector embedded inside the drm_writeback_connector
> We have a restraint where all connectors need to be a intel connector and since the we are not allowed to make connector 
> Inside the drm_connector into a pointer this gives a good alternative.

All of this needs to go to the commit message.

> 
> > 
> > > + *
> > > + * Drivers should always use this function instead of
> > > +drm_connector_init() to
> > > + * set up writeback connectors if they want to manage themselves the
> > > +lifetime of the
> > > + * associated encoder.
> > > + *
> > > + * Returns: 0 on success, or a negative error code  */ int
> > > +drm_writeback_connector_init_with_conn(struct drm_device *dev, struct
> > drm_connector *connector,
> > > +				       struct drm_writeback_connector
> > *wb_connector,
> > > +				       struct drm_encoder *enc,
> > > +				       const struct drm_connector_funcs
> > *con_funcs,
> > > +				       const u32 *formats, int n_formats) {
> > > +	struct drm_property_blob *blob;
> > > +	struct drm_mode_config *config = &dev->mode_config;
> > > +	int ret = create_writeback_properties(dev);
> > > +
> > > +	if (ret != 0)
> > > +		return ret;
> > > +
> > > +	blob = drm_property_create_blob(dev, n_formats * sizeof(*formats),
> > > +					formats);
> > > +	if (IS_ERR(blob))
> > > +		return PTR_ERR(blob);
> > > +
> > > +	connector->interlace_allowed = 0;
> > 
> > This function contans a lot of copy-paste from
> > __drm_writeback_connector_init(), which is obviously a no-go.
> 
> The whole point is the minore difference inbetween then and how it derives a lot of things from the
> drm_writeback_connector because of which this looks like a similar function but is essentially different.

It surely is. This means that you need to extract common code rather
than duplicate it.


-- 
With best wishes
Dmitry
