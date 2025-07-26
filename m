Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489EDC83F17
	for <intel-xe@archiver.kernel.org>; Sat, 26 Jul 2025 12:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03CB010E47D;
	Sat, 26 Jul 2025 12:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h6oPrW94";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF6A10E47D
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:39:56 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56QCN1ma026537
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OWv91NLXRDuT4X2MxDjuA0UN
 OQUYmBmQUsyW7/9v0ew=; b=h6oPrW94lXVY5UtPsSY4O9gA7EuzTP8O1Jp8zgLH
 aDMQQVtQkfZUx5saJ1cvjyr+4o+4oeeFtjzqLU25VD9cZHndDKJPq8CTPVsgj5x7
 Vx93hP+4kiH7Zoo2pWZSCSyv0R8TVg0AwAoqdlBxi8Fsv65aUfKZ4BrKHBbDIUrJ
 DESRdCGZ9shRLd6JaErt+q0fOXHTu7ANPhM4mj2JlSqqiKoTH+ef0rHugI7Q3Eis
 EwFS/2ayoHRYFlhTCGhVUH/jQSt9wiXzW4jwNwXv1CK9jHFIeVr2u1k3gev+dxTg
 d7bMl+LRER64VWr2oz5N46L7W4A5VIDs10eSGB20uN0aAw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk0j2w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 12:39:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7071f67a934so17359226d6.3
 for <intel-xe@lists.freedesktop.org>; Sat, 26 Jul 2025 05:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753533595; x=1754138395;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWv91NLXRDuT4X2MxDjuA0UNOQUYmBmQUsyW7/9v0ew=;
 b=NmJ9azGqnE3hs8m4zmwaQmrGBEZtkMi+ni6G2Y1SDWUoPjFkcio0uj41l7/3K35p1y
 9tZpM/+02Pp1gE7gOwesnHmvBta0isaSu16kUjXHDwQB1dTAQiDc0kdUJlnz6TCknTom
 udbh+XsACMxkYfe9w3/eu+KkEZHp9m4hc1QK2OoE7U6KYmTr5grCBvBwJyl1OAxlJumv
 n/+rSrmieU0N6dFlKyPGiFqY4Ll3wRM3hEgSiLD9Z7mo3qcHQi2IWrQVqdSjN59T3dBZ
 r0tSf5zhD0Bq6bQUqiOO2CoNWNTIV/gIPAZKq/gigh40+QGKiTrrciZ2s+Yj0iM1u0du
 f0eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnxOTKaj7i/5E2Bcdno9cCF2vyb82TCoEimUTBrbYedRky/xa/uaAiEqHSofIo42+xOaI6VXbo2Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQk0G83akieVo0BVBGVBbq66ORfS7PqKhLMoTZ8KZ4bHmAwLqv
 rQkZKnJfo8DL482xdiyO6RgxOMTCf2XIXJplxrV5SiEnS7a12Cfgo8E3R7ls78EzDg6+b5LQ0wQ
 NFM9XK3sJ3Yoh2tQnCCFssqndKd7f1EIhxiBsmorRqsImFXvcT35srtIWm5C34tP8nhwwZA==
X-Gm-Gg: ASbGncvqftjqCHgqR5fb7X1RfA9Xa4/6V66l2rD5Md80a/9l1998yCyY2ouoYNBbhUw
 LxUXVhltZ1g8Ky1XXgQ0PHB4DRl2oo08fPWRXNOwcaYjQ9Q59CgDfWw9bz5uDTWg++MT6cP4N2r
 2RzqeOfWh80Rp6xb+KRkIadhO3dFKIMNKMZpPXpQpFFFbC57HbeIdln88r8r6QqOa55wEyxqo6l
 tgntSTU0UtYLAsRcevl4psiycen+C8OUk6spY/mWw4bLABW2ZgRQJPMn+uepGqPtSfPBVf5oxEK
 loxoz2BOX+/icyITHyOO11K3v615TZg2R3jjDyZ7Wh7juWpla5n7hi+a0rpsacn4ckUkQZbpE8D
 Tmah3znm6qamN+7WO6D/jd5uWw2u5I4wNRkuqIxHIrb2iSFV9okuX
X-Received: by 2002:a05:6214:c4f:b0:705:12b4:154 with SMTP id
 6a1803df08f44-707205b2dbamr58956386d6.33.1753533594478; 
 Sat, 26 Jul 2025 05:39:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQiX8ECR16J6mHdmsGPse8S+RlovYhgXsDP3Lhn1m1Kl+FztM+cvVbVhC24nQNG9WzzdSr2Q==
X-Received: by 2002:a05:6214:c4f:b0:705:12b4:154 with SMTP id
 6a1803df08f44-707205b2dbamr58956126d6.33.1753533593977; 
 Sat, 26 Jul 2025 05:39:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b631a1b0fsm425273e87.73.2025.07.26.05.39.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jul 2025 05:39:53 -0700 (PDT)
Date: Sat, 26 Jul 2025 15:39:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 arun.r.murthy@intel.com, uma.shankar@intel.com,
 Harry Wetland <harry.wentland@amd.com>
Subject: Re: [PATCH 00/28] Enable Pipe writeback
Message-ID: <moagnjfwotoyisjfymvftkm3ndlifgxgjg2b6e74nm3pbityow@us2zmsccovwh>
References: <20250725050409.2687242-1-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725050409.2687242-1-suraj.kandpal@intel.com>
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6884cc9c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=zd2uoN0lAAAA:8 a=QyXUC8HyAAAA:8 a=2U7y_S2j5q8vnCcmH9MA:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: YNBTGzU3ZNmyJ_Hn89FYYnhVyF-XiuxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI2MDEwNyBTYWx0ZWRfX/6NUKtrylKw3
 ga+RoHFfzY43rc6yUwGbNy6OAmedBnLnwm1oV1XLxDxM7zErCjGacuJ43wTzebZ8YQ9VgRpT5J6
 svF2F/h5Ap+acZimN+qQOJggnah8DfCIiJKuVB7doREzIySbP0KcBcuoQ2d6KmqPWfKibq391fi
 i7xI0+sL9qNC34Av8aeVC9Dl5WqskyKOSmdlIcoPyh9tIhDwTxEXKliSpp3KP7VykrM+B6T+K2m
 UXFIonmYQiobzKbGBLsElgh2buuLXNTJ6IMPB5TxRSdsTMmI9F9GSRI+DfgT5RbkrmyJzVfXqZu
 tWDI3UpauRXFyiDQL0GpzS6sy8pMjyoxW92pHQQRr9GmWCLrKu9AH21IY7bHr6xMKR4kecNjyZM
 0jtRc/YZxv7aSqOdbKAzpr4HZr/Z9rcDAui50gaQYgEvkPI5Iygk2DbK9Oo52mLpePGQ8RAN
X-Proofpoint-ORIG-GUID: YNBTGzU3ZNmyJ_Hn89FYYnhVyF-XiuxG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-26_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507260107
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

On Fri, Jul 25, 2025 at 10:33:41AM +0530, Suraj Kandpal wrote:
> This series aims to enable pipe writeback functionality on
> ADLP where it has been tested. The plan is to slowly accomodate
> all supported hardware after this functionality is tested on them.
> This series also brings change to drm core but not in a drastic way.
> We introduce a helper which lets drivers have their own preallocated
> conenctor keeping the connector in drm_writeback_conenctor blank.
> This lets driver have more control over their connector but still use
> the drm core queues for job creation and signalling. Some new helpers
> have been added to aid drivers so that derivation of drm_connector
> from drm_writeback_connector and vice versa becomes easy for drivers
> that will use this helper since it won't be as straight forward as
> wb_conn->connector anymore. Driver not using these API will not be
> affected in anyways.
> This series enables the triggered captured mode where we need to
> trigger a capture.
> 
> Cc: Harry Wetland <harry.wentland@amd.com>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> 
> Suraj Kandpal (28):
>   drm/writeback: Add function that takes preallocated connector
>   drm/writeback: Add a helper function to get writeback connector
>   drm/writeback: Define function to get drm_connector from writeback
>   drm/i915/writeback: Add writeback registers
>   drm/i915/writeback: Add some preliminary writeback definitions
>   drm/i915/writeback: Init writeback connector
>   drm/i915/writeback: Add function for get_writeback_connector
>   drm/i915/writeback: Define the get_connector_from_writeback hook
>   drm/i915/writeback: Add function to get modes
>   drm/i915/writeback: Add hook to check modes
>   drm/i915/writeback: Define encoder->get_hw_state
>   drm/i915/writeback: Fill encoder->get_config
>   drm/i915/writeback: Add private structure for writeback job
>   drm/i915/writeback: Define function for prepare and cleanup hooks
>   drm/i915/writeback: Define compute_config for writeback
>   drm/i915/writeback: Define function for connector function detect
>   drm/i915/writeback: Define function to destroy writeback connector
>   drm/i915/writeback: Add connector atomic check

You are adding hooks one by one. Are you sure that the series is
bisectable? In other words, the driver must work (aka must not crash)
after each commit.

>   drm/i915/writeback: Add the enable sequence from writeback
>   drm/i915/writeback: Add writeback to xe Makefile
>   drm/i915/writeback: Define writeback frame capture function
>   drm/i915/writeback: Configure WD_STRIDE reg
>   drm/i915/writeback: Configure WD_SURF register
>   drm/i915/writeback: Enable writeback interrupts
>   drm/i915/writeback: Initialize writeback encoder.
>   drm/i915/writeback: Define the disable sequence for writeback
>   drm/i915/writeback: Make exception for writeback connector
>   drm/i915/writeback: Modify state verify function
> 
>  drivers/gpu/drm/drm_writeback.c               | 123 +++-
>  drivers/gpu/drm/i915/Makefile                 |   1 +
>  drivers/gpu/drm/i915/display/intel_acpi.c     |   1 +
>  .../drm/i915/display/intel_crtc_state_dump.c  |   2 +-
>  drivers/gpu/drm/i915/display/intel_display.c  | 178 +++--
>  drivers/gpu/drm/i915/display/intel_display.h  |   4 +
>  .../drm/i915/display/intel_display_debugfs.c  |   3 +
>  .../drm/i915/display/intel_display_device.c   |  29 +-
>  .../drm/i915/display/intel_display_device.h   |   2 +-
>  .../gpu/drm/i915/display/intel_display_irq.c  |  10 +
>  .../drm/i915/display/intel_display_limits.h   |   2 +
>  .../drm/i915/display/intel_display_power.c    |   4 +
>  .../drm/i915/display/intel_display_power.h    |   2 +
>  .../gpu/drm/i915/display/intel_display_regs.h |   1 +
>  .../drm/i915/display/intel_display_types.h    |   1 +
>  drivers/gpu/drm/i915/display/intel_dpll_mgr.c |   3 +
>  drivers/gpu/drm/i915/display/intel_opregion.c |   2 +-
>  drivers/gpu/drm/i915/display/intel_pmdemand.c |   3 +
>  drivers/gpu/drm/i915/display/intel_vdsc.c     |   4 +
>  .../gpu/drm/i915/display/intel_writeback.c    | 686 ++++++++++++++++++
>  .../gpu/drm/i915/display/intel_writeback.h    |  23 +
>  .../drm/i915/display/intel_writeback_reg.h    | 142 ++++
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  include/drm/drm_modeset_helper_vtables.h      |  59 ++
>  include/drm/drm_writeback.h                   |  21 +-
>  25 files changed, 1238 insertions(+), 69 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.c
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h
>  create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
