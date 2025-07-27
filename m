Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF35EC87FCE
	for <intel-xe@archiver.kernel.org>; Sun, 27 Jul 2025 15:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25D710E3D3;
	Sun, 27 Jul 2025 15:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ik4zje6i";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A416C10E2FD
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:54:28 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56RCc373005737
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Ao8IKFarj2aGNM23ibXqNI4j
 6HWiik0jzypmk4vo4jQ=; b=ik4zje6ih9prjzDbBx+IqQPgDEsOnCvLLcOBkr78
 d4sua6FgkeZYoolAT836IpaJOJBa9rNmSvIVU0nK4nuJocI+KYrHu98KJziKdnJ6
 zFjNUjuW0Eys0bQ+75ea90YOwFdv2aykDGvm2/baRLZLrudgsGhK2iuBZTBTK1R5
 /s1xRcMtcTK8NAe0AvFQvndVsbo6OwSN073TOtwmXzSGBSa1tfCH5w1R8FnOu2sx
 PGRwfo5GTNNiXBeU9goxJlMIEfUdrmXkKzad8I+o54KQwRjdkHhGbec1dbufJWCa
 1f4HibXM6dN0aFDnSeccZuwevTCY/EpLqyIWiEMcIQQUZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbkta0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 15:54:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e269587d8eso725636585a.3
 for <intel-xe@lists.freedesktop.org>; Sun, 27 Jul 2025 08:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753631667; x=1754236467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ao8IKFarj2aGNM23ibXqNI4j6HWiik0jzypmk4vo4jQ=;
 b=S6+8F/H6qQSe18oRwt6WMxQhdDNQxMNmQf04tADXq3L3QvfEq+AuzhzF/0NoBCjt9i
 rCrmef/SwjMLysHK/IHOcZjh5lEguX5T4tfU2TClNbz4Bl5XyRhywK5AA/WW5eRoEdtj
 N1LihyEuIzcVeHDihi81MTU5uqmSh9EzYMZqsgVaqAXKPcpJ75VmC2yJAvUEdHnYTtZX
 /7sitWRlr3ttcPaaHw2uZ429XQthr+m7Dy+enZt1LO64QAmhKq+EgHkRFAQIJ5i9LrwS
 Bqf6Y2zzMJ+h3BTqyrm7gAdbpN0nTM0WGWcJzzSm5muPS66YjONaSPQ2WaR+QOIDWAh2
 J2Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXS+hZztzDIK8ut4CUid4B6G3l1SoCLpaG2iGpxbxyfVppFKYXfa0ieRW4R+EiT84fKqq14J6oYiA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxLZdp0w51rZRPmIDJJefD5dBsBo3xAifA/yfvRCMqRP5csxI4
 EvJfLaTycMrSHXC8YeZ686hkNTKkKAb13wRHPRhpekrk/9lbX5kW7RPKH9+Qo3fSxY/DMaw7728
 YnmP21eOR064YOg68WKrpsTt8ZltYrEYByxelopL2UigoCw9tj/gBuMn+riJNP2xm2ObuUA==
X-Gm-Gg: ASbGncv9FtO7tf2kfCjtnNLXgVnawhXpIPvaKIm6tsCPcBYFJdX/hTNCwIAefQrqiMW
 K3sxNcumhmcM87zAhMoaPyiS16wWiMkb515Yudas61eQlni1+LaHVXo1YYaR0upFrqYe21JLMDw
 ULTOLmUA76QYZTgUPKy1lafRPz+/rYvD01Zn3byo74JaVhYbo8+E6iCsWM8bibPwKdRVKsl5q4i
 HtlTNxsy2zUDPmJ4blKic3D/P5NzNuIscOOG9X4CctAyG9tgpyjsgEolIer8o+1WVofvkHQVUlw
 DzIfXWDCwzOS79HeE/nVw2IrOSQkO0doZY+02K0A0PQqtjApkYw3Lw0ixwT8q7sAQ4etcovTKli
 mPfp6+RCHrae2pB0GxznVo0lhx7vGXQpqc/+UvM+dsW9xVhFoJomI
X-Received: by 2002:a05:620a:1907:b0:7e6:2893:5c71 with SMTP id
 af79cd13be357-7e63bf69b36mr1029939285a.7.1753631666660; 
 Sun, 27 Jul 2025 08:54:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT+8sCh1nSP0K329lxXeq+dHsVtm1hSC1otyUn4YSpBsXG4/kAOjmm01UTGDjJlvzY+8UI/A==
X-Received: by 2002:a05:620a:1907:b0:7e6:2893:5c71 with SMTP id
 af79cd13be357-7e63bf69b36mr1029936485a.7.1753631666068; 
 Sun, 27 Jul 2025 08:54:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63395aecsm874001e87.183.2025.07.27.08.54.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 08:54:24 -0700 (PDT)
Date: Sun, 27 Jul 2025 18:54:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>
Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
 drm_connector from writeback
Message-ID: <t5fmzuwiy2otubqftwdghakwmbeltavhbsvrfhgi4tc52uigys@sg2jgz6yjjk7>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
 <20250725050409.2687242-4-suraj.kandpal@intel.com>
 <ng2ps7k5h74w6zo62oqazzetunjc2psooobmh3zcrrmxesi2ua@va6z7eqjst2u>
 <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM3PPF208195D8D2676D013483985D2C3FFE358A@DM3PPF208195D8D.namprd11.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=68864bb3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=e5mUnYsNAAAA:8
 a=0sPBWD2CCCFBD5ApftYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI3MDEzOSBTYWx0ZWRfXxnD/5dSScmdp
 euDEroz6F5bVMh7o+dwrwnkC+OaO9R8QC5Ju/WzxGPL1/a53fLvgmHtqN4hB9BevZA5gA08rllj
 Y9rAqAshnFDoSPvQnvDkY4s0+Q01QMlRRtQvsz8YLCQY02/OpvVnUpelEX6AGs94uxE94jvK6fM
 TjLT0Iv/F5Ck6op2n7TFKrrfCQ5veAL9cn9bHJaKvrGRfSiCV/5Xwes+PPqKVWObfKZSHH2L9Xe
 yvg+ndpHFh+Ojt0H9P9HSb/tOCBkYvtz/7YzupS6IT2dhR7ph2wtu1fHL4vt4uVQUmr11cWjnXq
 w2q6W4ySgiyzPpbeTR5VC09Ha2iUEZSI+YkzZ5OMjC8qIJND4kqPc/nBL3mYlq35b/hYzkO4KNT
 iWbJYbfRaTqACASlfDvZ1qy0PcMQa8c7J5adWCvHUCesU/k5bjCicei/X4oepw6wSEnnVgh+
X-Proofpoint-ORIG-GUID: daaJl1_Vt82zybCplxP9C05jFUjNx3nC
X-Proofpoint-GUID: daaJl1_Vt82zybCplxP9C05jFUjNx3nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-27_05,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507270139
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

On Sat, Jul 26, 2025 at 04:49:44PM +0000, Kandpal, Suraj wrote:
> 
> 
> > -----Original Message-----
> > From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Sent: Saturday, July 26, 2025 6:04 PM
> > To: Kandpal, Suraj <suraj.kandpal@intel.com>
> > Cc: dri-devel@lists.freedesktop.org; intel-xe@lists.freedesktop.org; intel-
> > gfx@lists.freedesktop.org; Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>;
> > Murthy, Arun R <arun.r.murthy@intel.com>; Shankar, Uma
> > <uma.shankar@intel.com>
> > Subject: Re: [PATCH 03/28] drm/writeback: Define function to get
> > drm_connector from writeback

Please tune your mail client to insert smaller quotation headers. This
is just useless.

> > 
> > On Fri, Jul 25, 2025 at 10:33:44AM +0530, Suraj Kandpal wrote:
> > > Now that drm_connector may not always be embedded within
> > > drm_writeback_connector, let's define a function which either uses the
> > > writeback helper hook that returns the drm_connector associated with
> > > the drm_writeback_connector or just return the drm_connector embedded
> > > inside drm_writeback_connector if the helper hook is not present. Lets
> > > use this function and call it whenever drm_connector is required
> > > mostly when connector helper private funcs need to be fetched.
> > >
> > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > ---
> > >  drivers/gpu/drm/drm_writeback.c | 33
> > > ++++++++++++++++++++++++++-------
> > >  1 file changed, 26 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_writeback.c
> > > b/drivers/gpu/drm/drm_writeback.c index e9f7123270d6..d610cb827975
> > > 100644
> > > --- a/drivers/gpu/drm/drm_writeback.c
> > > +++ b/drivers/gpu/drm/drm_writeback.c
> > > @@ -120,6 +120,18 @@ drm_connector_to_writeback(struct
> > drm_connector
> > > *connector)  }  EXPORT_SYMBOL(drm_connector_to_writeback);
> > >
> > > +static struct drm_connector *
> > > +drm_connector_from_writeback(struct drm_writeback_connector
> > > +*wb_connector) {
> > > +	const struct drm_writeback_connector_helper_funcs *funcs =
> > > +		wb_connector->helper_private;
> > > +
> > > +	if (funcs && funcs->get_connector_from_writeback)
> > > +		return funcs-
> > >get_connector_from_writeback(wb_connector);
> > 
> > The get_connector_from_writeback() and
> > drm_writeback_connector_helper_funcs should be moved to this patch.
> 
> Want to keep them separate since they themselves introduce a lot of changes on of them
> has use introducing a new writeback_helper_function structure.

Let's see how the series will take shape.

> 
> 
> > 
> > However it feels really awkward to make drm_writeback_connector, which is
> > a wrapper around the drm_connector, to use some external DRM connector.
> > A quick grepping reveals API (which you missed) that expects
> > drm_writeback_connector.base to be a valid connector. And it would be very
> > hard to catch sunch an API later on.
> 
> Also seems like I did miss the fence_get_driver_name one which is an easy fix or
> did you see anything else.
> Really don't see any other problematic areas

Yes, it was that function. However it is a nice example of how easy it
is to miss a call. Likewise anybody else changing the code might easily
not notice that Intel driver uses drm_writeback_connector in a strange
way.
> 
> > 
> > If you want to use DRM framwework, while retaining intel_connector for
> > writeback connectors, I'd suggest following slightly different path: extract
> > common parts of drm_writeback_connector into a common structure, and
> > use it within the DRM core. Then provide functions to fetch drm_connector
> > from that struct or fetch it from drm_connector.
> 
> Causes a lot of changes in the drm_writeback_connector structure causing every other driver
> Using this to change how they essentially call upon drm_writeback_connector. This API
> was to provide more non invasive way to give everyone another alternative.

Currently drm_writeback_connector is documented and implemented as being
a wrapper around drm_connector. You are changing that contract in a
non-intuitive way. I think there are several options on how to proceed:

- Clearly and loudly document that drm_writeback_connector is no longer
  a wrapper around drm_connector. Clearly document how to distinguish
  those two cases. In my opinion this is the worst option as it is
  significantly error-prone

- Make sure that the DRM framework can use writeback without
  drm_writeback_connector and them implement all necessary plumbing in
  the Intel driver. This can result in singnificant amount of code
  duplication, so I'd skip this option.

- Separate writeback parts of drm_writeback_connector into a struct,
  make drm_writeback_connector include drm_connector, new struct and
  most likely drm_encoder. Implement conversion callbacks (like you did
  in your patchset).

- Rework drm_writeback_connector and drm_connector in a similar way, but
  use writeback structure as a field inside drm_connector (similar to
  how we got the HDMI data). This saves you from having all conversion
  callbacks and makes it extensible for other drivers too. In fact you
  can use an anonymous union, making sure that HDMI and writeback
  structures take the same space in memory.

My preference is shifted towards the last option, it follows current
HDMI subclassing design and it doesn't add unnecessary complexity.

Yes, this requires reworking of all writeback drivers. Yes, it's a price
of having your own subclass of drm_connector. No, in my optionion,
leaving a semi-broken abstraction is not an option. Whatever path gets
implemented, it should be internally coherent.

-- 
With best wishes
Dmitry
