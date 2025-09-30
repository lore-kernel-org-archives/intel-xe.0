Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24268CAC5B8
	for <intel-xe@archiver.kernel.org>; Tue, 30 Sep 2025 20:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A4410E631;
	Tue, 30 Sep 2025 20:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDOAPyJy";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D56310E2D5
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 20:30:47 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBqFbH019070
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 20:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A5MAdGf8N2IXmeD2HSikyGHXMxYdUuVy92vP7GjOTJs=; b=nDOAPyJyz8QfENmG
 6Ya4yWlFzuV+sHmRuXqcoE7XKaVP+2TOCcm3hCC6yVdRDCRwwd/gcwLbUtRAICTA
 6KnVbA6BiDCw2c5AmFQYaHMsZ1VSoDZQnoRR+Ztli0XxOwVpYsv088FtniMUH6Su
 KltjZSLfVpglv0q2ketBHbfrP0FjUB5X7/k1UA/abIyTr+On9m6rUffOKfmxwLSv
 u19+hBete2uQMeDyBG4NOSCclgSUL2HyeDhEfj7ek3VQY4v0fs8ugXSkTsxTTyNo
 Y9Pma35x/+Lve0NBPidw7BSgHx29WF5bYEL2e9bDGN5ASx/i7T2AojlgR3G6/mBO
 u3QzxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tthaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 20:30:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4df7cdf22cbso7558921cf.0
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Sep 2025 13:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759264245; x=1759869045;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5MAdGf8N2IXmeD2HSikyGHXMxYdUuVy92vP7GjOTJs=;
 b=uKVLSGzaXCg2GCC3VX7HH1+0n4fzOhKYq8CiBPoUNAk7HMTCakNbUplqGwxwJPvi37
 T1WmjkCf9zE2sWu0K71bcluq4Xmp+AH0jEuoiYkiWtQ3J6Bv/abjWUnIBxCrQrcpdnw4
 y7R6GMd5Zxn4cU3mxcEGNvPdH2YWzAM+aEPHS/D/z9Rxhe7o7pn/8V1MRG6eI7gndDiT
 I/So7R+iWXDpHBE+QB7amt/7fMDDdsr9JaIOKbf5Tb3r/gQ2uH38LLWFXT4AXRv5Nn2P
 kLT1Ur7NQfvwI9dDBwN2/GKt7L62AStr6uncoDFYVHfDldWR1wS12KL7jRCHqGHUc4/C
 TlBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/X1sRIXhnwx3+6gGPVz63l+YXRKq7WJxMqxitVsHku3/FJPYuA5WCeFZuxiefbWgvFiyl2QR8wQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfLZE+lxCFm0aBZGZwMgpws8tkqngee7nQVl6Y2lU8rDayECsk
 0mCxQryaW6ZUYABmPfZEODR1zvRWnK/q8iS6FKr1InQXdriGc8ffUeNFZMzlIsEImWP1tWnF5Xe
 9Pp9KLhI7nEgFE582fFQj+q6WIdNf9jd/Z7oMpxOKoIHbnqzeaQqCko3AAAHfMrLk1k5Vig==
X-Gm-Gg: ASbGncuv0Q9thk7lDJbSmOHWp+YBwvgb/cJUQQGhUhnei8gbPYJfOOiIY0LncQ6Wt/A
 ifjjdcxAXxxfQO8eO52tiwh0TLc7cepdW9iZPsNYtgIR9iDEH8wSeVPfVt540ZAFKoS7+ly9Psw
 15nElp+bBUBPC3HTMopNAdJ891woJxsVwSokxaQGu0PWhk+d1ZQm1ngTppeOSHmmWVZPj9MjtZ1
 EHV8xMpov+WHu1Q7VE8nQ1kXPa8NHkxhpjXqIHyoBsTs2nOlerF295caL7rY05ya5/9KYS7LsIk
 zittgnlVnF0xxsxSy415vhDK42MUNx2SHbVuhy59UhAeZKGfBdfdmAkVY2Um+c3CUB5/xnoYYK4
 YlbwKrM7FWdVqyOfmg1hLTqQoIj2FbQ4bUdRw6i2q2bqKrZcFbRA/3VfPWg==
X-Received: by 2002:a05:622a:1794:b0:4b2:d40b:997 with SMTP id
 d75a77b69052e-4e27dcb4b08mr75990911cf.11.1759264245484; 
 Tue, 30 Sep 2025 13:30:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGORQhiQcS0PDdJLteS92LEIIj+plRWVAELxeRtbfFmfukIvpLskhG1Uob7e7LVST8jsUGbEg==
X-Received: by 2002:a05:622a:1794:b0:4b2:d40b:997 with SMTP id
 d75a77b69052e-4e27dcb4b08mr75990301cf.11.1759264244891; 
 Tue, 30 Sep 2025 13:30:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5831665671csm5161706e87.75.2025.09.30.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 13:30:43 -0700 (PDT)
Date: Tue, 30 Sep 2025 23:30:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH v6 2/6] drm/dp: Add helpers to query the branch DSC max
 throughput/line-width
Message-ID: <uao62medi7zlhu7p7q4ijnzyd4jfvamaumwhxbhun24eqgwhta@scnknn7slpfy>
References: <20250930182450.563016-1-imre.deak@intel.com>
 <20250930182450.563016-3-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930182450.563016-3-imre.deak@intel.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX2yqTFvjaJC6x
 zzkh0lmuh5FCEQeZvhEs+P1+Ad0UV5Aqgw4ABEEnG72nfcsZlLVMm6+BLPggpY6ppfDpMpn8P1t
 Njv6kwP72+n2KHhpHiUFoVzM+JYbZJOUAMPK1u64bPlZAbK/Y95P/XeRnXlDiaHHld7G935Lz9w
 ByVHJOuFUyULKa/8oYDcMLmqFay4RRO0JFC3speqbiZSCbl4OPq9nzwgYR6wO+vK3TBQO1FfH8j
 VIWb3P42VSMY84Axe4tp+wTUJb8kZ8e2Qzfo3scPdvv+PmnSUKftOeTlVdLYDM1R9kVL2dtQRkl
 Ez1IV6spawOLIqq51bzoOmLglTwhp8wOTcQ01tS1+XIKBclfryd8PtR42QzRdeOT/54oidLDVTV
 oqrdt4Dt9r5OgQtmW8IpMIuyg17MKg==
X-Proofpoint-GUID: hE5Qa1FKwaIA2FFJhpD4x3S14ufWUnaF
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dc3df6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=tvw-fHIMQa-57OEpRgIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: hE5Qa1FKwaIA2FFJhpD4x3S14ufWUnaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029
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

On Tue, Sep 30, 2025 at 09:24:46PM +0300, Imre Deak wrote:
> Add helpers to query the DP DSC sink device's per-slice throughput as
> well as a DSC branch device's overall throughput and line-width
> capabilities.
> 
> v2 (Ville):
> - Rename pixel_clock to peak_pixel_rate, document what the value means
>   in case of MST tiled displays.
> - Fix name of drm_dp_dsc_branch_max_slice_throughput() to
>   drm_dp_dsc_sink_max_slice_throughput().
> v3:
> - Fix the DSC branch device minimum valid line width value from 2560
>   to 5120 pixels.
> - Fix drm_dp_dsc_sink_max_slice_throughput()'s pixel_clock parameter
>   name to peak_pixel_rate in header file.
> - Add handling for throughput mode 0 granular delta, defined by DP
>   Standard v2.1a.
> v4:
> - Remove the default switch case in
>   drm_dp_dsc_sink_max_slice_throughput(), which is unreachable in the
>   current code. (Ville)
> 
> Cc: dri-devel@lists.freedesktop.org
> Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Reported-and-tested-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 152 ++++++++++++++++++++++++
>  include/drm/display/drm_dp.h            |   3 +
>  include/drm/display/drm_dp_helper.h     |   5 +
>  3 files changed, 160 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
