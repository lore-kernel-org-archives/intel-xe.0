Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEB3CD4F5E
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 12:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB64F10E47E;
	Thu, 21 May 2026 12:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESUcJTqf";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cHLBGZ0T";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC96310E48B
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 12:05:17 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64L9AM9M3556011
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 12:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=pGY+j87eohBlWubIX+vUu3zL
 xCM+uB8O9JAB1ecXkdM=; b=ESUcJTqfqAtQySEKLKp7KIRCaL9t+erTOvTDfYVG
 fOBbLyDU9ErXoWLj4r4aG9s0cSsb8zoRyM1JEXHKMO58+5AlNlIqYhVm4fJDnyg1
 cl2sJsIct0JQnB6xtZiA/nkLgshpE2ZJ2d8TMb2iE+jiPVc88/YLy+/uMALyWJcO
 EFiCMzn/yB2f4Oj7+vhyZdRM7OScqDwli9yLV5lCf6V/2L0HFXQP/129g+4Vwob2
 zmgClDrJK6DrYqqGGbrsnUTeIGoXHc4aGqrFVjT2e248jtLQepcXVGsiUmf9Vdb9
 yl1pamahY+nuPtJOIFtAZJqeEnapAvzxGfzSceLlDVUI8g==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6md2b-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 12:05:17 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-43a181bcc39so6833649fac.0
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 05:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1779365116; x=1779969916;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
 b=cHLBGZ0TBXqGLuKQN0VK8+SXZI92ulH1Um+jAXseARZ6JAo5pCmcaEi7IpsM1akjGU
 XIQgI3eRBMziFwM45i7fenOeCZF6vdO7l4VHYLlJpyO40zu0aX6Qr1wtSMaXskbYKfdD
 YWlpki8Ez1MdJf9RY+xUVmjShq/KxgviMeIOHPShw7IuRe3tgowHTGXmT5XLP/9OnZMA
 FMVNLR58MVnWgFKLP+prhvXQFsVlemiPHe2sIVY++lUPvW3TeZ0N/3QYJYE4vRWHZHJB
 SnW0Sz+mGgLfXLeugwZyCtlry6MrrnpL1B7mKzujH6ZFtzd/uxWw8lAMTh0WRlhrSe6l
 aOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779365116; x=1779969916;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pGY+j87eohBlWubIX+vUu3zLxCM+uB8O9JAB1ecXkdM=;
 b=inbLbsDlCvpUq1PmNBnHyprrbCgyMkSKq5i65otGDsCS55uTRScCbicbo6WPOtty3B
 EWsAaF3afEDXOIZY45Ef6BmlZC7EdUD5SzsH00u2RhjZ+8LChdVS76E3ZQ4JVY53xKUT
 lcwBaWZ0SesTZ+syCatLDnp4YNoozn4OOTssJlkhnKvklzxeJrctjMO/lViTk+rsSpWq
 MR6CyltaQ6AsFqauXoHprWQ/qXbGJPAUdHu+95ep8SaxAnS2422R2EAkaNzv0lTIzxVE
 RAZmxRQWPqIw5XojtVaweRb3ifVLqGTLdJ42QGk/AuhQ+riJgQYqLSWyq0UWBGx/L7QK
 3OAw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+hsYgo4jQqku18Hrbmzot3snNCNCYO945qKrkgKI3+5SHCeOTctEkWmMf8+RF20SiGoswJxqD3Ig==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeKfm7YKg/QYQfJ+UqK+rWJWMOvdPZS8//cQD9fnJHs2Xq4zDo
 EmY8QLr8GYoEYTY9+u0deLIAJ/Z0/XYbKpRgRDl8A1VEpl8jIcJzDdID9uRiK4m5GnMUcWYZchu
 pnQjHPCsl40kA29iKCN/A1D2mBH3z+HRH8pr+SRjQAKcazFIkqe1DYVSLVIG3zRxewepJUg==
X-Gm-Gg: Acq92OGQnckLZb/fL+x6Vr+i52ND3MP16jJVHR2yTmkvIB3M9FDpzS7iv7snCMXNyfB
 aIh9WNg9AWS1dXI2wuBTMtXYaAGY1MR02MywSOPdUQcelZe25/NzV+v4FtUq6Ys/6GxHhrkFgef
 7h72GBFED86LnAnbNx0TuOk9ZA0OE7wHpHG9UaSOSPyDQvxooshZ1mz0QRqgDEX63NX+Us9sEP3
 XlYQcLG720p8jiiSzXc4mANxO3hOkRDQ2BIiiPyBWHbsSj3ZaymfHgwWTRAen+GvxcZPBA7DrUK
 tZpZWpMmAOSIlKvp6cWyAlJaBFalL5ZyUNVZ741z8LHaflCoBbPdShF2j8slcHo7FxqLC1rJ79X
 KHnGS+bCYZXpRyNlA7vkXNPkD/xtUt+W+G1zWYCpbyQWr/586zYkycsfXApaOVKwuWpWmtRnc79
 vswqmZ7HYSSQf8doD59D+WCG4au53pQkqq/Xw=
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id
 006d021491bc7-69d6ef409f7mr999596eaf.52.1779365116341; 
 Thu, 21 May 2026 05:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:1348:b0:69b:bf80:2db5 with SMTP id
 006d021491bc7-69d6ef409f7mr999560eaf.52.1779365115873; 
 Thu, 21 May 2026 05:05:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-395d0a107afsm2201901fa.16.2026.05.21.05.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2026 05:05:14 -0700 (PDT)
Date: Thu, 21 May 2026 15:05:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <vpd5hyote5wspmlpad64kf5peoy5g7wv6c7xjn6ammcmjtai7r@q2tarmr5aoqn>
References: <20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com>
 <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260521-funny-astonishing-mackerel-cc5a01@penduick>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-funny-astonishing-mackerel-cc5a01@penduick>
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ef4fd cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=mRF-X4ptvIx_UuOgb7IA:9 a=CjuIK1q_8ugA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: mx7zgnhWyNN3NlT8dHhr3SN5GKmiikqG
X-Proofpoint-GUID: mx7zgnhWyNN3NlT8dHhr3SN5GKmiikqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMCBTYWx0ZWRfX7dthlg2JvZeb
 VC+7SX3KPt4bDNzDY0Hu6hSWlJjRXye2AeX4XzWLa9xg1ojBFlhiQLX/GisvmDNlGUbJDGJbUbi
 S98dPdMEmiuKt8RI5tkOeSaElPmfmbA33fDEOzBFR7gwv8PWhjr8a1w/kJzXktJB5lw3U0d3zRn
 bWaShTlu0WsuxhSsypBBugiYgmtBwp/lX4DT1xxmEEHgUQsyknQjjEnt0ya1ln4eP415k5W/Yyr
 EQfcp9CpdEcYtKmdaDPbhOrDXbwaii+FdmpYKAV2KOnZ9QhkcQv+eDy4J6bRq5UGBJcSZ8jPGKG
 vxKB7e/Sej+7Lt6HzFhpBN9KOYPF4fjlD6eAeSP7S/g8YEVCl7lyEF5qC4lucG307MUouFG28YB
 59SZfd+S4Mes0YtFtJqQYn/aDiC3EaRn8at8nPQQqsUKZMmx8SD9AXQXBfgoRfaU8mrPiBrwoXi
 6Inbaptvpcdwut9w4lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210120
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

On Thu, May 21, 2026 at 09:47:29AM +0200, Maxime Ripard wrote:
> On Wed, May 13, 2026 at 09:23:21PM +0300, Dmitry Baryshkov wrote:
> > The DisplayPort standard defines a special kind of events called IRQ.
> > These events are used to notify DP Source about the events on the Sink
> > side. It is extremely important for DP MST handling, where the MST
> > events are reported through this IRQ.
> > 
> > In case of the USB-C DP AltMode there is no actual HPD pulse, but the
> > events are ported through the bits in the AltMode VDOs.
> > 
> > Extend the drm_connector_oob_hotplug_event() interface and report IRQ
> > events to the DisplayPort Sink drivers.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_connector.c          |  5 ++++-
> >  drivers/usb/typec/altmodes/displayport.c | 15 +++++++++++----
> >  include/drm/drm_connector.h              | 19 ++++++++++++++++++-
> >  3 files changed, 33 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> > index 47dc53c4a738..edee9daccd51 100644
> > --- a/drivers/gpu/drm/drm_connector.c
> > +++ b/drivers/gpu/drm/drm_connector.c
> > @@ -3510,6 +3510,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
> >   * @connector_fwnode: fwnode_handle to report the event on
> >   * @status: hot plug detect logical state
> > + * @extra_status: additional information provided by the sink without changing
> > + * the HPD state (or in addition to such a change).
> >   *
> >   * On some hardware a hotplug event notification may come from outside the display
> >   * driver / device. An example of this is some USB Type-C setups where the hardware
> > @@ -3520,7 +3522,8 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
> >   * a drm_connector reference through calling drm_connector_find_by_fwnode().
> >   */
> >  void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
> > -				     enum drm_connector_status status)
> > +				     enum drm_connector_status status,
> > +				     enum drm_connector_status_extra extra_status)
> >  {
> >  	struct drm_connector *connector;
> >  
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index 35d9c3086990..7182a8e2e710 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> > @@ -189,7 +189,9 @@ static int dp_altmode_status_update(struct dp_altmode *dp)
> >  	} else {
> >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> >  						hpd ? connector_status_connected :
> > -						      connector_status_disconnected);
> > +						      connector_status_disconnected,
> > +						(hpd && irq_hpd) ? DRM_CONNECTOR_DP_IRQ_HPD :
> > +								   DRM_CONNECTOR_NO_EXTRA_STATUS);
> 
> Since the extra status itself, and what the options mean, are DP specific, do we really want to
> extend drm_connector_oob_hotplug_event()? I think I'd prefer to have a DP specific variant, with its
> own set of parameters.

I can try arguing that drm_connector_oob_hotplug_event() is DP-specific,
there are no other users for it, only the DP AltMode driver.

Anyway, do you just mean new API here or new API and a new connector
callback?

-- 
With best wishes
Dmitry
