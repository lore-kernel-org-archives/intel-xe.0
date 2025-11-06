Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C23CCFA03
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 12:17:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DE010E048;
	Thu,  6 Nov 2025 12:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gDQV/Edl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xqos2jtK";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B251C10E8B7
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 12:17:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A66t5QR3156090
 for <intel-xe@lists.freedesktop.org>; Thu, 6 Nov 2025 12:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=gNvmCJ0hrdNJ/9zdjaCrkfGY
 VdoeuP9Y/SBDObi2LCM=; b=gDQV/Edl2ZgDxe6dhgFYWDLZG28wb5c1VGrHAh+R
 1PC7QB7edlWtyn+Xu9Ifd/eFaBRVue653TzMdWcCNCoyBcBkokdy8lvWjEoSshGf
 D/mVJkcKdaPbF2dDOc9zc4cpzXCOsICzMq9/CzkIVkzLV+r+z/UIzNfYF+l5Z35S
 FSAHA2tcw1SpdjqNWeK2IEvnsksy8Zmuzz4CDgjhI/IQ7X54rKJncJkTfe9Qt8NH
 ZOo7EId1Z4l7AWaN2+hzRyBnENv6jbkwTcelMRkJB83a2QDVlE83kT1vR7r9dugJ
 /TJGXVqm0WfBaGkeP3vQ7WYLhucX6u/Is1OJoed1UNBezQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pu0gvka-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Nov 2025 12:17:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-29085106b99so4643595ad.1
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Nov 2025 04:17:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762431432; x=1763036232;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gNvmCJ0hrdNJ/9zdjaCrkfGYVdoeuP9Y/SBDObi2LCM=;
 b=Xqos2jtKozzLJe2oobRbW2ez3nzjaUxdWyjAwwVdEEBjKaEPrrmmOVhKpT3PW9Njld
 niFjqU8Pj5LTjIYiIrREzilwgPoI0Cb//vmqzRzQ6YVLA0pB6V+HGrNvE8RJMLaG6A4R
 oUAGmBXasrzL+lNtheAc94Va4W386OZ4Vnc3oT0sTt8RBPjWuNxNOngJXjeCX4il7L5M
 1AHT4HWsXSjlz3J3HgGih4tdi6AkewhtCjNTpuT/73f4rxtq/mHpHbMHOANC3/N42CkW
 Z7ZxlZQ9YR6mzYlsv10SFrMMP602qF320y1oZUV7zCJXf9+sA1PgMw4IDxF2qoqJgNKg
 /f8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762431432; x=1763036232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gNvmCJ0hrdNJ/9zdjaCrkfGYVdoeuP9Y/SBDObi2LCM=;
 b=TEZUZrYp5B5AOXRLvgWzw7KVMyGBY6p79p6ecUcEdlNezmyhxLXpT+laroXdR7Uz0G
 EUTHzRysEN5FjzNDRBf0+3iqOQ6IVU/LlQt6loTfaDQR807T5pMq7APSJu+2B7LC02m2
 Shy3Fl81HcXTH8/Yut2s2sSyf1G9GmlpWObYJvElz9Nm/EwyV/jRRQBzwPB72BHfgw1w
 a1XmB5oT+74/g3zrWvQnC6yszCqRSfTLD5lBcutkui0FrTvK0Z/TUymA0VeXGykZo929
 dr7HoDf35ffVwa08lLyuZP215Y28VtlHXecBApDQM/lgOzADQDs9Qsqu0B0c1vdUfdv1
 HpGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxAZ0S9ycpbdJGjEbFlXK729GJWPLOeLLwFeRJMkyF3WLmQvqAEG6mUX8U2jQZU3MBw1pCkBCFvA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBiGaFpC/Fwl1zh/Q9SGqJX4jNXV5QbHlEqtXmnb7nSQ+mVo9U
 sbomhm/y20fDhHUfFEWlpkTQXOFyP8j1dtsGhMYsbnuXGAFGVVtpMhf4RqtdoNNFWBxQIM++cIK
 WbrQdak0otEs9nElu8tBGOZiJ7ZfQRev7TSvH5UBDx6eP6BOt2AMgR5rm/dlDEcE0+MNaUtd5zK
 Nk8h/qEArMLQ5HSKRUeBwdzL9jvg1lqwCNeIJGGIWSwZaS
X-Gm-Gg: ASbGncvUFpfybsQyj90ayxYHKSSAkn0YXpArhfX7571LpRyeLX4N773j/hL3BWnxtnD
 Or0NRCC0tLeP29/wdTXtZZGYKh0CelZpb7jUxu9AHrfgeiXaZXruoNalAseXEKuxF0AegkLT56l
 TjePMXkh1hx5DLZhDS6biKgLqHEtl3VHUglt2X//ZSmDzehYDH7jgcGay8XP9EqF0tv8JqwLWz8
 Lb2rIRGflac2A==
X-Received: by 2002:a17:903:1ce:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-2962ad3d72fmr86648325ad.27.1762431431476; 
 Thu, 06 Nov 2025 04:17:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTXH8NGkIDg7Ywz6RX10UIWewqyu96hZrjWXSo9nV+y7WP4ZxR0xQhes+p81qNvau23TvKRF0R0V1UeWn9oko=
X-Received: by 2002:a17:903:1ce:b0:290:7e29:f59f with SMTP id
 d9443c01a7336-2962ad3d72fmr86647725ad.27.1762431430643; Thu, 06 Nov 2025
 04:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20251007054528.2900905-1-suraj.kandpal@intel.com>
 <20251007054528.2900905-2-suraj.kandpal@intel.com>
 <aQjDejhzGRYJT614@e110455-lin.cambridge.arm.com>
 <DM3PPF208195D8D5DDD56AA88E006E66AD9E3C4A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <aQoIBroBqQc3B-RD@e110455-lin.cambridge.arm.com>
 <CAO9ioeX2qEyjwi9LsnUh-cRv88iaRcdZtFr_yidf55A9_ZbLWw@mail.gmail.com>
 <aQyApokLttxf9spU@e110455-lin.cambridge.arm.com>
In-Reply-To: <aQyApokLttxf9spU@e110455-lin.cambridge.arm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 14:17:02 +0200
X-Gm-Features: AWmQ_bmmb7qkmOjV1MvJBVbTKPSje7kfBu1HmXRF-M95TYAq_55qEAFRaKc2Oxc
Message-ID: <CAO9ioeUwt2aR5y9FkMPOKz-4dPO8pUvxeEYUqGrGVZWaUHYw-g@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor drm_writeback_connector
 structure
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
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
 "mripard@kernel.org" <mripard@kernel.org>,
 "robin.clark@oss.qualcomm.com" <robin.clark@oss.qualcomm.com>,
 "abhinav.kumar@linux.dev" <abhinav.kumar@linux.dev>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "jessica.zhang@oss.qualcomm.com" <jessica.zhang@oss.qualcomm.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "marijn.suijten@somainline.org" <marijn.suijten@somainline.org>,
 "laurent.pinchart+renesas@ideasonboard.com"
 <laurent.pinchart+renesas@ideasonboard.com>, 
 "mcanal@igalia.com" <mcanal@igalia.com>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "tomi.valkeinen+renesas@ideasonboard.com"
 <tomi.valkeinen+renesas@ideasonboard.com>, 
 "kieran.bingham+renesas@ideasonboard.com"
 <kieran.bingham+renesas@ideasonboard.com>, 
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA5NyBTYWx0ZWRfXxPNxJ4rCignM
 k3j/4TX4ZDA04tC02ohLjEJsiauUIDuoCNDcpJgXJwzMXaPVkEWicloeGqv8Hp3prAHLPc1+/EU
 z9+UdhJ7V80g4OltVnPAk0sRwVFBnoZm8buTkWSoM6cJ3wUOKDvsl42nwyLGNQAjIqIHuaKpbUn
 M5blOxHikdMKO9FGcogvkbW9cmfhRTjKNhUHIR+ryklAig2aL95QROTcNczYMwXVjllJEjx6aQ1
 uKKMoNJ40fT+BOcrZzB6kxb0nac3GAyupkQmmth8s5Wi4WzDxnlNKLUZDX3+84GPpe27/wCoC52
 YR6jpA6sZbunKQyOnGRiFT6lxZKUL8rXEHmxYu2A2PXP/ptV2UhbWBuMbfmZ1YG72jB/BvQNFfM
 k5vbKxip9tL+qLnK5ZO73BkEoGYYwA==
X-Authority-Analysis: v=2.4 cv=bIYb4f+Z c=1 sm=1 tr=0 ts=690c91c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8
 a=_xLGP-AJQIWHLRMqBqIA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: f95XKYjJaWnNXMxIQ_afFNDBivazlU6C
X-Proofpoint-GUID: f95XKYjJaWnNXMxIQ_afFNDBivazlU6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060097
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

On Thu, 6 Nov 2025 at 13:04, Liviu Dudau <liviu.dudau@arm.com> wrote:
>
> On Wed, Nov 05, 2025 at 02:39:15AM +0200, Dmitry Baryshkov wrote:
> > On Tue, 4 Nov 2025 at 16:05, Liviu Dudau <liviu.dudau@arm.com> wrote:
> > >
> > > On Tue, Nov 04, 2025 at 05:11:25AM +0000, Kandpal, Suraj wrote:
> > > > > Subject: Re: [PATCH v2 1/7] drm: writeback: Refactor
> > > > > drm_writeback_connector structure
> > > > >
> > > > > On Tue, Oct 07, 2025 at 11:15:23AM +0530, Suraj Kandpal wrote:
> > > > > > Some drivers cannot work with the current design where the connector
> > > > > > is embedded within the drm_writeback_connector such as Intel and some
> > > > > > drivers that can get it working end up adding a lot of checks all
> > > > > > around the code to check if it's a writeback conenctor or not, this is
> > > > > > due to the limitation of inheritance in C.
> > > > > > To solve this move the drm_writeback_connector within the
> > > > > > drm_connector and remove the drm_connector base which was in
> > > > > > drm_writeback_connector. Make this drm_writeback_connector a union
> > > > > > with hdmi connector to save memory and since a connector can never be
> > > > > > both writeback and hdmi it should serve us well.
> > > > > > Do all other required modifications that come with these changes along
> > > > > > with addition of new function which returns the drm_connector when
> > > > > > drm_writeback_connector is present.
> > > > > > Modify drivers using the drm_writeback_connector to allow them to use
> > > > > > this connector without breaking them.
> > > > > > The drivers modified here are amd, komeda, mali, vc4, vkms, rcar_du,
> > > > > > msm
> > > > > >
> > > > > > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > > ---
> > > > > > V1 -> V2: Use &connector->writeback, make commit message imperative
> > > > > > (Dmitry)
> > > > > > ---
> > > > > >  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
> > > > > > .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +-
> > > > > > .../drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c  |  8 +--
> > > > > > .../gpu/drm/arm/display/komeda/komeda_crtc.c  |  6 +-
> > > > > >  .../gpu/drm/arm/display/komeda/komeda_kms.h   |  6 +-
> > > > > >  .../arm/display/komeda/komeda_wb_connector.c  |  8 +--
> > > > > >  drivers/gpu/drm/arm/malidp_crtc.c             |  2 +-
> > > > > >  drivers/gpu/drm/arm/malidp_drv.h              |  2 +-
> > > > > >  drivers/gpu/drm/arm/malidp_hw.c               |  6 +-
> > > > > >  drivers/gpu/drm/arm/malidp_mw.c               |  8 +--
> > > > > >  drivers/gpu/drm/drm_atomic_uapi.c             |  2 +-
> > > > > >  drivers/gpu/drm/drm_writeback.c               | 35 ++++++----
> > > > >
> > > > > For the komeda and malidp drivers, as well as for the drm_writeback.c
> > > > > changes:
> > > > >
> > > > > Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> > > > >
> > > > >
> > > > > [snip]
> > > > >
> > > > >
> > > > > > diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> > > > > > index 8f34f4b8183d..1b090e6bddc1 100644
> > > > > > --- a/include/drm/drm_connector.h
> > > > > > +++ b/include/drm/drm_connector.h
> > > > > > @@ -1882,6 +1882,61 @@ struct drm_connector_cec {
> > > > > >   void *data;
> > > > > >  };
> > > > > >
> > > > > > +/**
> > > > > > + * struct drm_writeback_connector - DRM writeback connector  */
> > > > > > +struct drm_writeback_connector {
> > > > > > + /**
> > > > > > +  * @pixel_formats_blob_ptr:
> > > > > > +  *
> > > > > > +  * DRM blob property data for the pixel formats list on writeback
> > > > > > +  * connectors
> > > > > > +  * See also drm_writeback_connector_init()
> > > > > > +  */
> > > > > > + struct drm_property_blob *pixel_formats_blob_ptr;
> > > > > > +
> > > > > > + /** @job_lock: Protects job_queue */
> > > > > > + spinlock_t job_lock;
> > > > > > +
> > > > > > + /**
> > > > > > +  * @job_queue:
> > > > > > +  *
> > > > > > +  * Holds a list of a connector's writeback jobs; the last item is the
> > > > > > +  * most recent. The first item may be either waiting for the hardware
> > > > > > +  * to begin writing, or currently being written.
> > > > > > +  *
> > > > > > +  * See also: drm_writeback_queue_job() and
> > > > > > +  * drm_writeback_signal_completion()
> > > > > > +  */
> > > > > > + struct list_head job_queue;
> > > > > > +
> > > > > > + /**
> > > > > > +  * @fence_context:
> > > > > > +  *
> > > > > > +  * timeline context used for fence operations.
> > > > > > +  */
> > > > > > + unsigned int fence_context;
> > > > > > + /**
> > > > > > +  * @fence_lock:
> > > > > > +  *
> > > > > > +  * spinlock to protect the fences in the fence_context.
> > > > > > +  */
> > > > > > + spinlock_t fence_lock;
> > > > > > + /**
> > > > > > +  * @fence_seqno:
> > > > > > +  *
> > > > > > +  * Seqno variable used as monotonic counter for the fences
> > > > > > +  * created on the connector's timeline.
> > > > > > +  */
> > > > > > + unsigned long fence_seqno;
> > > > > > + /**
> > > > > > +  * @timeline_name:
> > > > > > +  *
> > > > > > +  * The name of the connector's fence timeline.
> > > > > > +  */
> > > > > > + char timeline_name[32];
> > > > > > +};
> > > > > > +
> > > > > >  /**
> > > > > >   * struct drm_connector - central DRM connector control structure
> > > > > >   *
> > > > > > @@ -2291,10 +2346,16 @@ struct drm_connector {
> > > > > >    */
> > > > > >   struct llist_node free_node;
> > > > > >
> > > > > > - /**
> > > > > > -  * @hdmi: HDMI-related variable and properties.
> > > > > > -  */
> > > > > > - struct drm_connector_hdmi hdmi;
> > > > > > + union {
> > > > >
> > > > > This is a surprising choice. Before this patch one had to have a separate
> > > > > writeback connector besides the HDMI connector. Going forward it looks like
> > > > > you still need two connectors, one that uses the writeback member and one
> > > > > that uses the hdmi one. Is that intended?
> > > > >
> > > > > I was expecting that you're going to declare the writeback member next to the
> > > > > hdmi, without overlap. If you do that, then you also don't need to move the
> > > > > struct drm_writeback declaration from the header file and it should be enough
> > > > > to include the drm_writeback.h file.
> > > >
> > > > Hi,
> > > > Thanks for the review
> > > > The reason for this came from the discussion on previous patches and was suggested by Dmitry.
> > > > The idea is that a connector can never be both an HDMI and writeback connector at the same time
> > > > Hence we save space if we pack them together.
> > >
> > > Hmm, but you can still have all the CEC and HDMI codecs data in that connector,
> > > which feels strange.  Also, what's the issue with having a connector that has
> > > both a valid HDMI state and an associated writeback at the same time (i.e.
> > > don't use the union)? Writing back the memory the output that goes to HDMI is
> > > valid, right?
> >
> > Writing back to memory requires a separate connector (with separate
> > setup). The CRTC should also support outputting data to both HDMI
> > _and_ Writeback connectors at the same time (aka cloning). Not all
> > configurations are possible, writeback requires additional bandwidth,
> > etc., etc.
> >
> > >
> > > Maybe that is not something that you considered, but with this patch (without union)
> > > we can drop the need to have a separate connector just for writeback. We're breaking
> > > user space compatibility, true, but it feels like a good change to be able to
> > > attach a writeback to any connector and get its output. The drivers that don't support
> > > that can reject the commit that attaches the writeback to the existing connector.
> >
> > Well... No. It's not how it is being handled in the (existing)
> > hardware. Nor does it make it easier to handle resources for the
> > writeback.
>
> Which (existing) hardware? Komeda can do it mainly because it doesn't have an HDMI connector,
> but an output that can be cloned to writeback while it is being sent out on a bus to an encoder.
> You have to remember that writeback is a connector because we didn't have a better concept for
> it. It doesn't have to be a separate connector from an HDMI or eDP or DP.

drm/msm. It requires a separate setup for the Writeback, which is
described as an encoder. As such, we need a separate connector for the
writeback.

-- 
With best wishes
Dmitry
