Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA944CCA470
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 20:04:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADE110E2DA;
	Tue, 30 Sep 2025 20:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CH3625vM";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EEB10E2D9
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 20:04:52 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC72T0026871
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 20:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zg3Zzvp03iY3h5H8RDIo7/4x7q8AW2bkltfV7Huplrs=; b=CH3625vMwc5ZpLEP
 PTJgEyBaeEd97nArAK5VVcJgYq4U+VtebDDuKkEt0LG4P9608s5uYEgz4IyvElwY
 KLZec41AXZsKRAXolSolL7ZjHZOUnRLRLRG02b67Nj2xjAFcBKAGv7urT3bvpAj2
 DFo8rKj3ipLLfsz1Pdd22QJYOQtgUeTVPHxspw7BNWCQPxs6zd4eCxK4Cf4CNBzm
 D7dBVhEoOX+KmE0fXzxnf4F5vOJDu/OPjyZ9he3BC+TFGoHeURsJO91GW3MgZxyW
 xlt5PTQRUojTj8fV1dsUOxKJyZ1ZnQsP5P+wx3lAPngJ1IR4NK7dENGDEDMekX/y
 8TljaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49fyrf3vv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 20:04:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d91b91b6f8so100211161cf.3
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 13:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759262691; x=1759867491;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zg3Zzvp03iY3h5H8RDIo7/4x7q8AW2bkltfV7Huplrs=;
 b=io9MDoVByneZxKwJdtdcHe2cWpcEo7AunPG0xD7/Cl0GsND1M5TuuTBoNNSB8fAOoY
 9rlP0KaVz7K1M4A3/2rFb89w+QUh2pbdERkkDVnoxfxk1YZezNPcDehlY8eu3Up6voVx
 TbHMYQ9ObtoCSe83z7WBcsSyyZJ3zwGFmHx8UcEoe6103rXVZ5XYXOhJUhdYVZK9mIyE
 0qsGT2bIgzNg/3qXiWylGSv8TUXsVU/rLQtp6Ln4Yn8Hg/GOedxbm5WKVflY63Dt/2ur
 ij/hZA1CjtHZX6/e33PjVGesi3e8/VhYgtvkSuSLBWLZgRB8ditupl9lXWt+g8EFzKxs
 lddA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAJl+z5duIMGPYUwC1MRDTAV5EPi1f4zrnzXdgmrV0M0W7Iuk5eZ6XcwwidQO95sZZupUxYFdfag==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywn2fj3JU4EukKV0r0HAi4Z5IgD0Hzg0o3pYCxiyj7o9pQ8R5bf
 /gLCkNmsWtE9di3DF6k6wOjA9OmlWVCEobdQ5gIydaMRRUKkokHZWQMQ8Ie4xYdKiFPE/PF87LT
 z3GQ8Pwk60mTugr0u+y0xXnHx82uPKv0SS70T/7NuNHSmu8rNap+FED6k7UIHUgaZp5pUXg==
X-Gm-Gg: ASbGncsWkAese1sGgDn9PMzGIX2Z4Gj46EZCoJPno81Vyt6Qm6RXXMgK5nNmsdXUiD4
 /TriOPyK+N4jIFc2r5/znUhHkMUhC1BXxKl6T5+qeGSwcreFToxEEGzfiSlmiaiwQf0XhMHyere
 E9gObN/ugY8mYImQIcBTIQm737/CIdKidat6rmG45tqTUouDDPp31d1ou0Y4+74Z5QzK3aye3Sm
 0xJE8EokllZkE00N10r/dpvqZMJPkfmidgjJSjf2GsAhSg3X6ACRMcB9TlTxrD5v23aT5dBeDp7
 DOkRBu2pR/lYUcfmQtMroLGqnzWROLUZWQyvt3XSBAyE4P0XOP1lsjIVc+jYH+t7PAmIPM1HwSQ
 kC8T12TjMj58cPYFgCPI7aLgJDwnnIl0+bYSpM2RNze8I7zVkXnpOGxpyxg==
X-Received: by 2002:ac8:5784:0:b0:4d2:1a1f:135b with SMTP id
 d75a77b69052e-4e41c352bf6mr11232721cf.3.1759262691069; 
 Tue, 30 Sep 2025 13:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP5ORF0qEE//SUqswuiz6DFvjyfROnKL5KhLvMwinIagTmqNjxOJv7FbfJrexGy1JHt7tofw==
X-Received: by 2002:ac8:5784:0:b0:4d2:1a1f:135b with SMTP id
 d75a77b69052e-4e41c352bf6mr11232231cf.3.1759262690616; 
 Tue, 30 Sep 2025 13:04:50 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583134312ffsm5277474e87.13.2025.09.30.13.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:04:49 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:04:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <2krnfl46ozmjt6ekr3p5gzdcvehadzwbyjow72mqi52ciunioz@oqdgqjt4tpeo>
References: <20250926211236.474043-3-imre.deak@intel.com>
 <20250929063644.533890-1-imre.deak@intel.com>
 <agzmuyty22gxtm7cwpdl7ynmrubot45e65tfavbq5muamn6qnj@2wsbjqlc3pye>
 <aNpbCWlluJfsjSE6@ideak-desk>
 <6qj46wruaj5k2ywepsrkzfyyq4bsvcfmg7jhvrk4w2jkhcyorg@llo7bzmlarre>
 <aNvBIdJbaCBzKVt_@ideak-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNvBIdJbaCBzKVt_@ideak-desk>
X-Proofpoint-ORIG-GUID: YUK5I76eFFv9zn_-eEEeVUZu72aQNV1D
X-Proofpoint-GUID: YUK5I76eFFv9zn_-eEEeVUZu72aQNV1D
X-Authority-Analysis: v=2.4 cv=etzSD4pX c=1 sm=1 tr=0 ts=68dc37e3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=oTBndsSxvoqh1Z8t8QYA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI5MDE3NSBTYWx0ZWRfX/3XVHS7ddg5q
 hw5AZDRn5bFYlrUs/mgmSg8smshZV4rR0VLeSv4Oo+P7fNxmC7FHAiQ9vB//y4ZWcdorN8vc9PB
 40TXg/iiIirnurHy4PKbxS+iDQaJPvjYD3QJ+qSS/yBbmXzg7qZA9uLDBYqA6hRSfH0bJ7Tijsb
 hhfa0CYR7d1e7XkF4m1eLqgGXpB9NfJ3pXqZ+kHlMMlurTy+JwtZQZzJfVXtz+eLtuAGtYZV3MU
 hy4xq5b+DP0ZBQ58JT6wkzxmnpcW9FWlsq33mhuHe5pJpqHKJ+BO1l1GQ2O8H9Yc7k9tfkpYLp+
 r0ZDFxNIH9xEebXI2BmAFgUGSyypIYG8DdP+dyT3ZZPON+UF/B5FZ1VxIZRR/NX7tNLivD3FsQN
 ZNDNbR5Xp3THkqyjL6DaN7kC7UyCHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509290175
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

On Tue, Sep 30, 2025 at 02:38:09PM +0300, Imre Deak wrote:
> On Tue, Sep 30, 2025 at 08:30:10AM +0300, Dmitry Baryshkov wrote:
> > On Mon, Sep 29, 2025 at 01:10:17PM +0300, Imre Deak wrote:
> > > On Mon, Sep 29, 2025 at 12:00:03PM +0300, Dmitry Baryshkov wrote:
> > > > On Mon, Sep 29, 2025 at 09:36:44AM +0300, Imre Deak wrote:
> > > > > Add helpers to query the DP DSC sink device's per-slice throughput as
> > > > > well as a DSC branch device's overall throughput and line-width
> > > > > capabilities.
> > > > > 
> > > > > v2 (Ville):
> > > > > - Rename pixel_clock to peak_pixel_rate, document what the value means
> > > > >   in case of MST tiled displays.
> > > > > - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
> > > > >   drm_dp_dsc_sink_max_slice_throughput().
> > > > > v3:
> > > > > - Fix the DSC branch device minimum valid line width value from 2560
> > > > >   to 5120 pixels.
> > > > > - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
> > > > >   name to peak_pixel_rate in header file.
> > > > > - Add handling for throughput mode 0 granular delta, defined by DP
> > > > >   Standard v2.1a.
> > > > 
> > > > This one got sent as a separate V5, without a proper changelog. What has
> > > > changed?
> > > 
> > > This is v3 of the patch, the changes are listed under v3. The patchset's
> > > version is v5.
> >
> > Ugh. How one does relate this v3 (which is not mentioned anywhere) and
> > v5 of the series? This is totally counterintuitive. A usual
> > recommendation is to send the full series and to send it as a new
> > thread, sending all the patches in one go.
> 
> It's a common practice on intel-gfx to send a new version of one patch
> on top of the last patchset version in that patchset's thread. For

I don't want to step on intel-gfx ways of working, but how would that
work with e.g. 'b4 shazam'?

> matching the patch version to the patchset version I can change the
> patch version log above to be like:
> 
> v2 (Ville):
> - Rename pixel_clock to peak_pixel_rate ...
> v3-v4:
> - No changes
> v5:
> - Fix the DSC branch device minimum valid line width value ...

Yes, I think that's more obvious, thanks!

> 
> > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/display/drm_dp_helper.c | 156 ++++++++++++++++++++++++
> > > > >  include/drm/display/drm_dp.h            |   3 +
> > > > >  include/drm/display/drm_dp_helper.h     |   5 +
> > > > >  3 files changed, 164 insertions(+)
> > > > > 
> > > > 
> > > > -- 
> > > > With best wishes
> > > > Dmitry
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
