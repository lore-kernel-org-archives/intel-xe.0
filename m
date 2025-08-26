Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AEECA0FF2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 16:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3193410E39C;
	Tue, 26 Aug 2025 16:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JbswCT6s";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0BB10E0DA
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 16:08:26 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QDBIEr021029
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 16:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5Y6MH/IfjA1JcEnoDtSw8pJM
 2X/EunOT5oKJPorXhUE=; b=JbswCT6sjJBwB/oXRot1KzTm7NFqJUos8kr5i1CQ
 MP1A0cQ0WBCm2vDiljFK0hOwi19o+0cJpUQVlWAONGs8nOm7/NEe7wEfUuvyhydc
 CmhkC/SkW6VCegD9VGihV7/3wCI+YqYEZI5A1/Fx3TizavTs3DR0NGFBGFUhhTxl
 SnU65YAmgvZinrJ1lwsb93+k8Klg1GXt/QBvWkL4nZ9pJmbQFJHCg5jMMZS1tKnE
 KWpQSqL6k5pfdetx2H7bjnQOy4oeSH6onMkGAxSU27uvyINNG6CJd8IgdNd1kXyE
 Z/lqRkYgZuw4nptDVgV7LXFFAaNJJzX1TbIWhbep88YBhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x89jy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 16:08:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b109affec8so136298221cf.1
 for <intel-xe@lists.freedesktop.org>; Tue, 26 Aug 2025 09:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756224504; x=1756829304;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5Y6MH/IfjA1JcEnoDtSw8pJM2X/EunOT5oKJPorXhUE=;
 b=tJglBiU/E6wD/IdfM/k/8N2KFbCdnEQ4PVpOqOstnJ1HGo2RO0XiwVrST2VCH5FoP/
 0PT47x78BiItYedklb8fWlWNqOf3p3ODPyvT+4rwpoV2aLI7xC6pF1Ju71Y4c8eVGyMt
 d5gtCyjXDe4rr+5E4kvX1F1zBp3Li6XP59ognLVht1KzGVUn+/QAYJebNxnBEn1LF01t
 PQ+gNN8jHtoISiP0ySQV3YVWNL5wMwAUEK8znAUQdHpNIEd3Yx13h1YpxeUKT2HpsyvN
 kIZnfM5CrUsS6t5TG1cp+ff96yM7AB55XblkMaiZC9MlUVb3T47Y0IczOyQeH5AoNksv
 9lvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCViD3VVao19iuqgQYuwcnKakBcRB11Pbl2DQ9xNmSvJJMStWOeLk9+knM826NILQOlrQ8Dy5Cyn3g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycDil66s6bs83CUM4wqCmDHNiCH/HhL6QcPUgFPt2KJpJSo8kj
 3WCK2VOnrvtuN+sbUoqXZicA5Dw5GMEeaPa6HbOXANu+S5peEXHgyyYcJ6Me6Uix69IYQqHdCFV
 nmCdvAIGc2960NSe6u+rMs2Jza4jpRDxbMeOuGJQ3B1q4ElWyRDu3D1AqalCDymkEiHf22A==
X-Gm-Gg: ASbGncvP9wjlIb9tcTgm54mDNsi6XtYxKoAG7ljncJC9vPKjl/3ATQ68DuxSQItJsJA
 obSoskQY3z7CnRyr4MtGDz90/4A9tbc6X271vBg0RE25ah/HSCL1HPc0PSwrbl4NQ14Zv++IYPk
 EMGuRCpKMhx//XbwJiUGhUr+7EVHD1FIryXfaVBVbboCBGvBWZhvlgUrlZO25ah8gYf5/EXVbxB
 buJeOxrzBliblA235ojxt+xQxgFuULL3h70pjqxIl14XxGfSNwl94tWljV+8Or4ZuOdeyk06ieR
 DKnVhrGdPGX3fCTG9IKvMb2DqBCDwgmmDxOn7o+TBlrBZ03pQXFWN9/mwMYNClK5aauYzykvCEK
 Ix4aeuScsFf5cyJPNd5YKLwy2dF0BtRFlxDiUxRAQRdwTWFna2DyM
X-Received: by 2002:a05:622a:188e:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4b2aaa055c4mr159229951cf.17.1756224504035; 
 Tue, 26 Aug 2025 09:08:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGw4XVvhS8sJ4oPyO5LSxRLiQgorFOHBMUJBTT8et5S5EVGydVwVkXldGpoHbR11UxUC58e2w==
X-Received: by 2002:a05:622a:188e:b0:4b0:677d:d8e1 with SMTP id
 d75a77b69052e-4b2aaa055c4mr159227761cf.17.1756224501655; 
 Tue, 26 Aug 2025 09:08:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f45a230ddsm1241131e87.59.2025.08.26.09.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 09:08:20 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:08:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: "mripard@kernel.org" <mripard@kernel.org>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "liviu.dudau@arm.com" <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "Murthy, Arun R" <arun.r.murthy@intel.com>,
 "Shankar, Uma" <uma.shankar@intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "siqueira@igalia.com" <siqueira@igalia.com>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
 "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>, 
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, 
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor drm_writeback_connector
 structure
Message-ID: <76cmo6pqa534cdnckfgsnspczenzt7kiwkpgg4olxysjn2can7@g5dxteqi5jjs>
References: <20250811094429.GE21313@pendragon.ideasonboard.com>
 <awtqznhquyn7etojonmjn7karznefsb7fdudawcjsj5g2bok3u@2iqcdviuiz2s>
 <20250811111546.GA30760@pendragon.ideasonboard.com>
 <2ah3pau7p7brgw7huoxznvej3djct76vgfwtc72n6uub7sjojd@zzaebjdcpdwf>
 <DM3PPF208195D8D0E55A761A3C16B87BAEEE32AA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aJ4LQvqli36TlETu@e110455-lin.cambridge.arm.com>
 <hc6f6wgsnauh72cowocpm55tikejhiha5z4mgufeq7v6gb2qml@kmgfd26bigos>
 <wr76vyag2osox2xf7ducnkiaanzk2k5ehd2ahnoyqdm5qiywlk@penf4v5bvg5z>
 <DM3PPF208195D8D87AECE8397914A67D9A1E33EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <20250826-skinny-dancing-otter-de9be4@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-skinny-dancing-otter-de9be4@houat>
X-Proofpoint-ORIG-GUID: SYcPUYIOchO7dpBhb8eIDIaRinwvZE7L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfXxLYXf+OuZLbS
 2MHO2xyHJqWy78mxFoMkad8Pta6ofuKZTpbpk+YhCL/Rld5d9mWFqGWipvXLthgJaj+YRWpQEPw
 UY6gjoZs9BrfDIfG7Jzq6RkZzhLHajsRSb/DuIlbyve1wWZWrCSaq2qWp7/0g9z/UX5SKL5cEIa
 u6MefdhIP+dk0WV0wcRhmGRyAufLneiSPGPCYCrHKmo0NH7n7Pn2R3mui4I64A2gzLR+MId7qea
 m7SCixsaBkDoj2GBe+KvLYdFXdfve/z7gbRTGBkizR6ltXjSAudxvOtMVHFjsk7i4xuLfvJqR/x
 koNPAPPZWWcxceHSvUxUnIUKx5hJ/53lp8NWMOItza2giR7bmnXRNrJ6uv1o5ZrYcxdy/v4Digz
 F+TUloGX
X-Proofpoint-GUID: SYcPUYIOchO7dpBhb8eIDIaRinwvZE7L
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68addbf9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=cj-Nge-_NgV5cCdd3SwA:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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

On Tue, Aug 26, 2025 at 05:48:18PM +0200, mripard@kernel.org wrote:
> On Mon, Aug 25, 2025 at 06:26:48AM +0000, Kandpal, Suraj wrote:
> > > Subject: Re: [RFC PATCH 1/8] drm: writeback: Refactor
> > > drm_writeback_connector structure
> > > 
> > > Hi,
> > > 
> > > On Sat, Aug 16, 2025 at 01:20:53AM +0300, Dmitry Baryshkov wrote:
> > > > On Thu, Aug 14, 2025 at 05:13:54PM +0100, liviu.dudau@arm.com wrote:
> > > > > Hi,
> > > > >
> > > > > On Wed, Aug 13, 2025 at 10:04:22AM +0000, Kandpal, Suraj wrote:
> > > > > > > > > };
> > > > > > > >
> > > > > > > > I still don't like that. This really doesn't belong here. If
> > > > > > > > anything, the drm_connector for writeback belongs to drm_crtc.
> > > > > > >
> > > > > > > Why? We already have generic HDMI field inside drm_connector. I
> > > > > > > am really hoping to be able to land DP parts next to it. In
> > > > > > > theory we can have a DVI- specific entry there (e.g. with the
> > > subconnector type).
> > > > > > > The idea is not to limit how the drivers subclass those structures.
> > > > > > >
> > > > > > > I don't see a good case why WB should deviate from that design.
> > > > > > >
> > > > > > > > If the issue is that some drivers need a custom drm_connector
> > > > > > > > subclass, then I'd rather turn the connector field of
> > > > > > > > drm_writeback_connector into a pointer.
> > > > > > >
> > > > > > > Having a pointer requires additional ops in order to get
> > > > > > > drm_connector from WB code and vice versa. Having
> > > > > > > drm_connector_wb inside drm_connector saves us from those ops
> > > (which don't manifest for any other kind of structure).
> > > > > > > Nor will it take any more space since union will reuse space
> > > > > > > already taken up by HDMI part.
> > > > > > >
> > > > > > > >
> > > > > >
> > > > > > Seems like this thread has died. We need to get a conclusion on the
> > > design.
> > > > > > Laurent do you have any issue with the design given Dmitry's
> > > > > > explanation as to why this Design is good for drm_writeback_connector.
> > > > >
> > > > > I'm with Laurent here. The idea for drm_connector (and a lot of drm
> > > > > structures) are to be used as base "classes" for extended
> > > > > structures. I don't know why HDMI connector ended up inside
> > > > > drm_connector as not all connectors have HDMI functionality, but that's a
> > > cleanup for another day.
> > > >
> > > > Maybe Maxime can better comment on it, but I think it was made exactly
> > > > for the purpose of not limiting the driver's design. For example, a
> > > > lot of drivers subclass drm_connector via drm_bridge_connector. If
> > > > struct drm_connector_hdmi was a wrapper around struct drm_connector,
> > > > then it would have been impossible to use HDMI helpers for bridge
> > > > drivers, while current design freely allows any driver to utilize
> > > > corresponding library code.
> > > 
> > > That's exactly why we ended up like this. With that design, we wouldn't have
> > > been able to "inherit" two connector "classes": bridge_connector is one,
> > > intel_connector another one.
> > > 
> > > See here for the rationale:
> > > https://lore.kernel.org/dri-devel/ZOTDKHxn2bOg+Xmg@phenom.ffwll.local/
> > > 
> > > I don't think the "but we'll bloat drm_connector" makes sense either.
> > > There's already a *lot* of things that aren't useful to every connector (fwnode,
> > > display_info, edid in general, scaling, vrr, etc.)
> > > 
> > > And it's not like we allocate more than a handful of them during a system's life.
> > 
> > So Are we okay with the approach mentioned here with the changes that have been proposed here like
> > Having drm_writeback_connector in union with drm_hdmi_connector
> 
> I don't think we need a union here. It artificially creates the same
> issue: we can't have two types for a connector if we do so.

Well... What kind of connector would be both HDMI and WriteBack? I think
they are mutually exclusive already.

> > Also one more thing I would like to clarify here is how everyone would
> > like the patches patches where each patch changes both the drm core
> > and all related drivers (ensures buildability but then review is tough
> > for each driver). Or patches where we have initial drm core changes
> > and then each patch does the all changes in a driver in its own
> > respective patch.
> 
> The latter should be preferred, but if you can't maintain bisectability
> that way, then it's the most important and you should fall back to the
> former.

I'd say, we should be trying our best in providing bisectability. It
really a PITA if one can not use `git bisect run`.

-- 
With best wishes
Dmitry
