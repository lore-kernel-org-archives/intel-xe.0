Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF07CC7EE30
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 11:05:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9115610E58C;
	Tue,  1 Jul 2025 11:05:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxGCbSNY";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF710E595
 for <intel-xe@lists.freedesktop.org>; Tue,  1 Jul 2025 11:05:45 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619qDUH028446
 for <intel-xe@lists.freedesktop.org>; Tue, 1 Jul 2025 11:05:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=; b=HxGCbSNYdM9dEslB
 SjttVn99Amwenu1R7wnkDaKhJaGda/8kM8YFf53/KU128vsYXxNaf/6p19urg5Hm
 mYCDLIZ9YNp0bV30kTJ+Rt4Foy0l704s9vQWadf1pTdTdPoXhVRtrebwpprrgpCi
 UY3DodkPK3T9pc+OLDNmF4JSjRfRTeHRljUvYejXugYVPq2SzWPo2HounfW42x9K
 v188gBN9G0wwqxoqbexRfJGHSn+RRnABE9Pa5gYXip7lwwcUgs+8NTYf5SI0+Mbu
 YEfwZlOmCdqKzcOvF6RoyxB1GUM8rC9ES7eG3VmqFoaRNnK+/03UvbjwbEYabwFJ
 l02HNw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvrj6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 01 Jul 2025 11:05:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d40185a630so662919185a.2
 for <intel-xe@lists.freedesktop.org>; Tue, 01 Jul 2025 04:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751367943; x=1751972743;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZogMt6KKsiaz5/xedtL9aHF64V+0fejV+AuVX29tpF8=;
 b=RstGcqebHVxXj96/s9JY1m9g//maGqDq2xti22w2sm7gFgS69D00xlTHKOAiipJAwW
 18kdo8vx1W3opfKdyO4TG/SHamQUFLK4MIA2UJI6BMOSNUvpDEf74QD+MgDUHtSMaOod
 y0UrnahRjo4idB5rovrfmrwoiuYJfelRbwQpu/34651JTRFOAmsFekguTEz9LbVHqA9S
 gzHzM7Rca/otakOoJsplvK7q+imfEBg+PIiqhhXq0KgDoSqBwVBOd9lPuAtb9vp0LWtC
 9sZeGLV2XxuEkzaVWQcxvBo47tAn+a14Xlb9HYn9X/vnDzAXbz8vFx7El7ZG0j2q/bVt
 ltRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqv/20qCXJUFr/eRl0uRh9OO+vx4q56sBxOonwTDkRLyXUgwVJdViLnEAtVT5RznEtpUm76rO8Eg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1n5RLnRrgBgf/Jc7JSt+Gyz5YOIvV3ms2mMH0Rp3+BlF/hpFC
 fNiPiDONVYXe51COVwBdKu6oYjqwkgEVj5kOzeVzYTt+f/9+g7xXV6JzLqdKvjLKFLwrAakScZA
 GvzQEgpAJB9T++zsl+TFr/yQeM3IfjmAj4mfmpFlIdgnuonjpHmDOu62EZigarb7goiLANA==
X-Gm-Gg: ASbGnctIEfGeJPta4+AFV7qRRl9m5ZVv3n5rvRw9IRagLC4VRxzHDSgWfymILIMake+
 /Wm8hormx4S/BcJ5/fQiCIzHXnMM5xHko+rUea2mvy5lbK2lfjGAYFkWVphqMyt1r4v/Oo28sva
 TWawAXflV/4+LKBzlG34I3sR7cmi0jppnIX/08EMRrXiQ4QKjeTiF7TJjqpTBYOFJgdcNW6BinC
 0e/Zghbob90QXRbyKSHOIbprkTh4tOSfvX8UPTtZ9H9J0zwkycsEeP2BBR7XAPxJl1YVZcaG/Tv
 eYfOn0CjkX8StblmPJH/ZueyKBhQUZBk3IIrjS32h1n26cio4tcVkQjAOjR6UK8qvGnQb7GuJHa
 +ayNTj3XOFV5KNKovOBZVmuoLGLUXkzsGxRc=
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7d44398f399mr2458871785a.55.1751367943318; 
 Tue, 01 Jul 2025 04:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkaK5r4kmwq1bTXLA+Z1Z3MCVlUfECWUH1iOnueMEvJSOkDSVRInqR72D3IhCu8jIVuwHmSw==
X-Received: by 2002:a05:620a:84c3:b0:7c5:5a51:d2d1 with SMTP id
 af79cd13be357-7d44398f399mr2458863485a.55.1751367942731; 
 Tue, 01 Jul 2025 04:05:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5550b24048dsm1783299e87.28.2025.07.01.04.05.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 04:05:41 -0700 (PDT)
Date: Tue, 1 Jul 2025 14:05:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Russell King <linux@armlinux.org.uk>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, virtualization@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 05/19] drm: Allow the caller to pass in the format
 info to drm_helper_mode_fill_fb_struct()
Message-ID: <t6yywwa4z42d3knc3ihr4d4hzenhtzm5noln5y57uwzlotdkxq@6neoszj33sgx>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
 <20250701090722.13645-6-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701090722.13645-6-ville.syrjala@linux.intel.com>
X-Proofpoint-GUID: 84IDWjgKSgI-gfGd2KzP9y7eq5mwjPjH
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6863c108 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=Wb1JkmetP80A:10 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=p4Kof4svB8ImVrqtDUEA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 84IDWjgKSgI-gfGd2KzP9y7eq5mwjPjH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NyBTYWx0ZWRfX3wjaVvzOaPCp
 8hotNFi3arW2twHdd6UgMhWehH88lzV0xbU9p6MseTmkW0dJNxpzT0qve22T0qoGN9MyfhAKk5q
 XG9Gbbo2jrm1SAvDDBujqQc4+o94dwN3gFQkUg7gL68+AFESIiIkSKIrsiGVafRi80EK7dx2x7i
 tpbq/ZjZM0nn2wZItAPcICpYSeXCtV9NUfY57Y5D8lDOVohutZC4S5Tw/AesjLJvycQUNbJOPbv
 pkBCwh5kLebleMsOAiI5/J8x2YAXhtIPmjxaZSaGeCeWGTGshYNYTjdfiNiwSeXRjfuRKxJPjp7
 hgrgKMB50IChvkGyPO3h9XcGPS7rXAzzgpgomHdP5IRpVUZzJYwlwZvP7U2Q3gPa7iWJXe84lh3
 Wv42Nf2ehqMp2oLWlbNusL7mAj9HMgmTekRHIQUEn3zqqCDs/c5paX9G76ldC5HWjJFaNuYQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=603 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010067
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

On Tue, Jul 01, 2025 at 12:07:08PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Soon all drivers should have the format info already available in the
> places where they call drm_helper_mode_fill_fb_struct(). Allow it to
> be passed along into drm_helper_mode_fill_fb_struct() instead of doing
> yet another redundant lookup.
> 
> Start by always passing in NULL and still doing the extra lookup.
> The actual changes to avoid the lookup will follow.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
