Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9610FC87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 15:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D3A310E2EB;
	Sun, 27 Jul 2025 15:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="of+5uJMz";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD59710E1ED
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:34:00 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RENgKW016324
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=FFuTotSMomuMEPi5vf4Cz7UX
 B1aZe/76Ts1Jb5cz+sc=; b=of+5uJMzktn1H60Ln3SjQpTTKidJMRMyMOC5b6Lm
 61vB4d9yoLx1AGCBmPU+Ums9J1cu996CA8jKSvafcJ2ARaHP43ayA4WpCjmf7NI5
 MKZJUzmA1O0ddILOcNfjemPrzpWvL2oXP2GitgyZ8X1w+GfAuoHyUg0NLi13jf/O
 9zOjGydhpG5vW8qjFaTpDkNaJkNBpYrHaovzoXJyoOjmEg9DcJ5LBWx0GWBCVbhW
 Y0/AOMH7V0pzCzYDl5h6oziSnB5e+iVzQjefONno+F5OTLlGLWCYCxgFmOT3F+GS
 IbZFdmLcw5jEyil96uvawCV3cOs9IXFdJ6vkICtvSs7QgA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q3xj8x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:33:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-7073b4fb53eso11708556d6.0
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 08:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753630439; x=1754235239;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFuTotSMomuMEPi5vf4Cz7UXB1aZe/76Ts1Jb5cz+sc=;
 b=LddZf2ZeSvGKwtcfkQtEFTM2gX2NgGAYzQv968cYqvunMlphC4gOCuw6bgZQ2zotaN
 ycuuJ08qGjefzMJ1Jgz9p4pyoy/PWiKd9b8YGq9jDjLbjRN6waxtODxBmo5TTLEOxekE
 1wP9hrkPsD7LDHlmPVKK5yQ9VHSJBiuGHbe8qN6fV8okjdnJcLA1P1UyFSmrKAMK+dYU
 JM2B54BhSXYjGPnkX9gJ+HFNffIMZdiyIHpOl6vC3Qyr5trKR0Nc8AXZ4yeJ/TYLZk68
 JFZ6vQzglmoM66qA/wFqdtAP6eSCsNnA366pTOergM12eSXTt71pZtKX+Kf3Zc8RiJC7
 bLvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+/xabNg8W5xY9WcQoKrgL1GNuOiihiygjyHCNR/BeQjIaEy/E6fCbXKHZZpaBCiNw+avtA15Jqg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbv8kmVwRhiHT4oyn5er2I1CmpGHYuNqIeqNaW703MqYQRFv4E
 BV9cMcHT7CEICDTCT1wjbWlNX9wYHO+0jER9knRpMmicLWCCrMzHlauZis9VEnxiBOuOGDmTe2K
 ZRwjXxQQ3XBzA1RaKhSkcrmeuOKS9xibp4dNGrD2pNKH9Gzh/CCJvZT4roMlSA7iMooeWmQ==
X-Gm-Gg: ASbGncsWYQTJajezTbk2LFckWUbU+b/JG/1f9cp+c8lvR8lQIC1SFbFxiphgn47iRtn
 6j6tlg2WB5wKiJehH63Q/RC3tr2n2yy3lHPuX2aPF0PYBCIQ1e69vEpc6stUlm3S1iMrUXgPNs/
 9RIL/rw/XyAOMcuSDs/8tPhP2tHwegtNolp3eKoNA8zlkHjqp3D/acCw1tEMeYguOrFk+V1rqOB
 TVa5Q6KBdTQejjles4bF/Hs5VkBehXgrKNKYqMa3DKZGvKnipD2DWBMsuen21MRZHAR0aw8lnSt
 YHnianHBOnqoYJVzg6KyVUfntpV9/lyLAJi7h433udIV4hpVMw9JTWwqUexZFJjMBdKsLLnbVHc
 rRTtDZy6cE08j6hPMA2Vk8yQMAZm8V/zRfBvfUfkKcaJhPTOLzAXG
X-Received: by 2002:ad4:5f0f:0:b0:702:b28b:d4c2 with SMTP id
 6a1803df08f44-70720514b41mr123587676d6.17.1753630438760; 
 Sun, 27 Jul 2025 08:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJAdriGo2/MK2xtL3x9zLE7P+RfqpWUllf/GCVRx2ZnAPpdOBW2I2b4UCRihTMssFHdqKZBA==
X-Received: by 2002:ad4:5f0f:0:b0:702:b28b:d4c2 with SMTP id
 6a1803df08f44-70720514b41mr123587276d6.17.1753630438238; 
 Sun, 27 Jul 2025 08:33:58 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b633aed4csm869533e87.204.2025.07.27.08.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 08:33:56 -0700 (PDT)
Date: Sun, 27 Jul 2025 18:33:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 02/28] drm/writeback: Add a helper function to get
 writeback connector
Message-ID: <xfg7pvilhcbtyh5rtdbve4yjxab5wfsd3zmxffwp5j2pbjtcgw@x2ebzfw3tx2w>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-3-suraj.kandpal@intel.com>
 <wntb2pbszt3aavfuztv4wvr3dxwvpuk673d45xefmp6arb5qu3@s22k7yw5ykjm>
 <DM3PPF208195D8D93CFB788A26D027CF5CEE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D93CFB788A26D027CF5CEE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=JovxrN4C c=1 sm=1 tr=0 ts=688646e7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=XZvbBylhphicoWnzn50A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 12_2Y9OEXUzqYQSRa662F_B71tTylrwQ
X-Proofpoint-GUID: 12_2Y9OEXUzqYQSRa662F_B71tTylrwQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEzNiBTYWx0ZWRfXz7F94JvNxslt
 DedaPYxXrCQi5lr8IPCd88XbGdayYKWaUKQEjkfz0f1PCWz1CVl7HflvYUucO99P0IZkyL5Ofaw
 xhg62NdKLXINmtwnbvtTeNWs0yZyHmQbTq4NKATI7RXe6wyuG+8SiduGFowYjSlVaPXmuiGrhH0
 cfE71YME3r+sVA/LHONSFxAsi9z32ZwwWMmZArjPjrf7aKLcH4djPqJJoQf/pTrqhdZJFbMbpNi
 EM4SmoWmjWgotZ/Wq3Xbtl/ZbIXevUpeiRmc3vTWZLNqNI6R0NarVT2vpLLHtwnvqrVpLVmYKmD
 HlQGSdxZHVI05UHDIoTozULSMonUghALzXLAzkgn+DWbGKt+f9hcBM6BJA7HHsS4/1Z+KMuUhOb
 lirlLEHIAHiZ/ZF6VzUhK4fHXEoG1PEHCk955F4HuEDUToRtZUH6d7jprjUp+IBDzP4EPrL5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507270136
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

On Sat, Jul 26, 2025 at 04:43:11PM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, July 26, 2025 5:50 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: Re: [PATCH 02/28] drm/writeback: Add a helper function to get
> > writeback connector
> > 
> > On Fri, Jul 25, 2025 at 10:33:43AM +0530, Suraj Kandpal wrote:
> > > Now that we can initialize a drm_writeback_connector without having to
> > > initialize the drm_connector within it and leaving the responsibility
> > > of initialising the drm_connector and maintaining the association with
> > > drm_writeback_connector to it. This helper hooks lets drivers return
> > > the drm_writeback_connector associated with the give drm_connector.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c          | 14 ++++++
> > >  include/drm/drm_modeset_helper_vtables.h | 59
> > ++++++++++++++++++++++++
> > >  include/drm/drm_writeback.h              | 14 ++++--
> > >  3 files changed, 82 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > b/drivers/gpu/drm/drm_writeback.c index fa58eb0dc7bf..e9f7123270d6
> > > 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -107,6 +107,19 @@ static const struct dma_fence_ops
> > drm_writeback_fence_ops = {
> > >  	.get_timeline_name = drm_writeback_fence_get_timeline_name,
> > >  };
> > >
> > > +struct drm_writeback_connector *
> > > +drm_connector_to_writeback(struct drm_connector *connector) {
> > > +	const struct drm_connector_helper_funcs *funcs =
> > > +		connector->helper_private;
> > > +
> > > +	if (funcs->get_writeback_connector)
> > > +		return funcs->get_writeback_connector(connector);
> > > +
> > > +	return container_of(connector, struct drm_writeback_connector,
> > > +base); } EXPORT_SYMBOL(drm_connector_to_writeback);
> > > +
> > >  static int create_writeback_properties(struct drm_device *dev)  {
> > >  	struct drm_property *prop;
> > > @@ -443,6 +456,7 @@ drm_writeback_connector_init_with_conn(struct
> > drm_device *dev, struct drm_connec
> > >  				       struct drm_writeback_connector
> > *wb_connector,
> > >  				       struct drm_encoder *enc,
> > >  				       const struct drm_connector_funcs
> > *con_funcs,
> > > +				       const struct
> > drm_writeback_connector_helper_funcs
> > > +*wb_funcs,
> > >  				       const u32 *formats, int n_formats)  {
> > >  	struct drm_property_blob *blob;
> > > diff --git a/include/drm/drm_modeset_helper_vtables.h
> > > b/include/drm/drm_modeset_helper_vtables.h
> > > index ce7c7aeac887..6b89b33d2304 100644
> > > --- a/include/drm/drm_modeset_helper_vtables.h
> > > +++ b/include/drm/drm_modeset_helper_vtables.h
> > > @@ -31,6 +31,7 @@
> > >
> > >  #include <drm/drm_crtc.h>
> > >  #include <drm/drm_encoder.h>
> > > +#include <drm/drm_writeback.h>
> > >
> > >  /**
> > >   * DOC: overview
> > > @@ -1179,6 +1180,25 @@ struct drm_connector_helper_funcs {
> > >  	 *
> > >  	 */
> > >  	void (*disable_hpd)(struct drm_connector *connector);
> > > +
> > > +	/**
> > > +	 * @get_writeback_connector:
> > > +	 *
> > > +	 * This callback is used by drivers to get the writeback connector in
> > > +	 * case the init is done via drm_writeback_init_with_conn. Which
> > means
> > > +	 * the drivers don't have drm_connector embedded in
> > drm_writeback_connector
> > > +	 * so they need to send the associated writeback connector with this
> > > +	 * function.
> > > +	 *
> > > +	 * This operation is optional.
> > > +	 *
> > > +	 * This is mainly called from drm_writeback_set_gb.
> > > +	 *
> > > +	 * RETURNS:
> > > +	 *
> > > +	 * drm_writeback_connector assoiciated with the drm connector.
> > > +	 */
> > > +	struct drm_writeback_connector *(*get_writeback_connector)(struct
> > > +drm_connector *connector);
> > >  };
> > >
> > >  /**
> > > @@ -1192,6 +1212,45 @@ static inline void
> > drm_connector_helper_add(struct drm_connector *connector,
> > >  	connector->helper_private = funcs;
> > >  }
> > >
> > > +/**
> > > + * struct drm_writeback_connector_helper_funcs - helper operations
> > > +for writeback
> > > + * connectors.
> > > + *
> > > + * These functions are used by the atomic and legacy modeset helpers
> > > +and by the
> > > + * probe helpers.
> > > + */
> > > +struct drm_writeback_connector_helper_funcs {
> > > +	/**
> > > +	 * @get_connector_from_writeback:
> > > +	 *
> > > +	 * This callback is used by drivers to get the drm_connector in
> > > +	 * case the init is done via drm_writeback_init_with_conn. Which
> > means
> > > +	 * the drivers don't have drm_connector embedded in
> > drm_writeback_connector
> > > +	 * so they need to send the associated drm_connector with this
> > > +	 * function.
> > > +	 *
> > > +	 * This operation is optional.
> > > +	 *
> > > +	 * RETURNS:
> > > +	 *
> > > +	 * drm_connector assoiciated with the drm_writeback_connector.
> > > +	 */
> > > +	struct drm_connector
> > > +	*(*get_connector_from_writeback)(struct drm_writeback_connector
> > > +*wbconnector); };
> > > +
> > > +/**
> > > + * drm_writeback_connector_helper_add - sets the helper vtable for a
> > > +connector
> > > + * @wb_connector: DRM writeback connector
> > > + * @funcs: helper vtable to set for @wb_connector  */ static inline
> > > +void drm_writeback_connector_helper_add(struct
> > > +drm_writeback_connector *wb_connector,
> > > +				   const struct
> > drm_writeback_connector_helper_funcs *funcs) {
> > > +	wb_connector->helper_private = funcs; }
> > > +
> > >  /**
> > >   * struct drm_plane_helper_funcs - helper operations for planes
> > >   *
> > > diff --git a/include/drm/drm_writeback.h b/include/drm/drm_writeback.h
> > > index 149744dbeef0..77c3c64c132d 100644
> > > --- a/include/drm/drm_writeback.h
> > > +++ b/include/drm/drm_writeback.h
> > > @@ -84,6 +84,13 @@ struct drm_writeback_connector {
> > >  	 * The name of the connector's fence timeline.
> > >  	 */
> > >  	char timeline_name[32];
> > > +
> > > +	/**
> > > +	 * @helper_private:
> > > +	 *
> > > +	 * helper private funcs for writeback_connector
> > > +	 */
> > > +	const struct drm_writeback_connector_helper_funcs
> > *helper_private;
> > >  };
> > 
> > Unrelate to the commit? Also, where is this defined?
> 
> This is very much related to this commit and defined on top right here in this commit.

Then please split this patch into two.


-- 
With best wishes
Dmitry
