Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFDDFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 00:35:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F7F010E05C;
	Tue,  5 May 2026 00:35:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZ8dU3+9";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HajFwfI8";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D794810E068
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 00:35:07 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 644Jd6Sc3468041
 for <intel-xe@lists.freedesktop.org>; Tue, 5 May 2026 00:35:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=uQstg63rkYXGjNgJVr/eZxEM
 JU0++JvkQrQ5rgtmcrI=; b=XZ8dU3+9D/jxyc3MX2B8VgXlqVBGwjuY6H895wB/
 zjMsQ/No18/RGSnXtXkh8r7TNOB55yXhHATaIzAnyxehqZQVRtmY6qMgqHO53DR7
 8ZtAsx9c6AiBaR7q8gtuEhoS1qKJ8xltd8mQhHdCcrjFUGxI82Y+depJKiQV2vfM
 gg9pmItgri64DPPU8JablL//u7x+unpSUS/9DOAVzhTu0/GmFPpgbzREj1mSROd5
 z/4u+2hS/RtSsFfy3E1IAa0PYg1AYzGYH3gB24vlr3D/rW4RB+6ttU8XF3W3Kc+4
 KNLZyJB+2ZDBDzwMgfHi8akVh2aoRcZYVZF9xPsTBEzyLw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvtjt5d2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 05 May 2026 00:35:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-50d5d1c2289so116462111cf.2
 for <intel-xe@lists.freedesktop.org>; Mon, 04 May 2026 17:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1777941306; x=1778546106;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uQstg63rkYXGjNgJVr/eZxEMJU0++JvkQrQ5rgtmcrI=;
 b=HajFwfI80n/2mHHS3+WMXnB8vbTbwi3+/y9vxm3LJtGiePI5TOYU3grneB17Wmk24P
 TCGQXZdwGWDwOYcLqjEQa6yoV/Z9VXFi0y/znZBZhSBZvo1Fr188/Et9X9D5JLhQtOaV
 7UvQfsxr3zpjfqvU8omEBAkparGUntBDqe5nnPMBmzOhb/WvECyp6puLG1bIjwoDgDFD
 N8gDzL2W7CbtkiSMQNhLbjtOpGMma+RVFgTEfdRM/IX3MCYKo8r68+4A7+T0Fz555uyF
 +O/vVAny6TOdISHu20ufTvr13uuykmquXMSJLHuteIlCtRtOUM0hb7goTi+yWDUM1xUJ
 qdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777941306; x=1778546106;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQstg63rkYXGjNgJVr/eZxEMJU0++JvkQrQ5rgtmcrI=;
 b=jcPIifx1O+t88zBrVM1a8myeJS6nOK5yHKqtnridyuLAdKb//90ENAi2OX/cLVbewT
 h8KjO2CNw7Ep8PyzoksZROwZZPkksD0hF1uhhGee1D52Kq4qbB1leCOEKL4locVPe7tY
 Y/4+4uN73T8ia9CvXOX01j47WNrMrZZgXgOVI7r6piKqHO2QaA6klG/95zWMkQmsF+fv
 OOW1GfKolChgZOAnP7+dSHRA3mIQRSRcIWG15m6pJC2j+NXYztM/HRboIgVMEwEwF6Np
 Aam+l6e4AlfBjAvEmH9ShelEGQwfklTC2a+nVEHu8AfKlrmvnUkVK0XhNyzCupGjf7k6
 4pRQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9gsLcdPzpCRwxNdGNWqlc1c2azE0TxFHUsCz5D6pCsFjRk44aIXl3aicIlLV0OSV43tv1TgEugYA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxgbS/59PNzRXpYnVkx6dmCOEXp9TPtnz1fz+azqN2Wfk1mqJ6k
 1EMru2JxKnoUoi4fn0jac/qM+103bpkomyVcpWkhCORcbd6eZuQYHxzyQkBjoKtLcjRZYKuYK7v
 Bw4b6u7QySIoEXrz2DeNxleReSaH8xX/d1JxlZpXsGrEk00VmEMOd4YrC+c6aSqSUIldHpw==
X-Gm-Gg: AeBDietgA1f3e8OeD6cTLZPmTTFO1uRTAwAD3eeb4zaJwF407swsLub7A/AFUxN9Nv2
 r+G3KxnHMd5VR3SfAPdeKd5nokqApnUtu11eXirvqUSr2IbMb1Gms4L1b3B1ef+l04vSNnj/5Ao
 3YH/h7ed0+MlVb8kFQv90ZJ+nJdkPbEKRDUakqKLhZwJPdtdnvMnHt/ELnd2o5Ye+bbDYwd5tYz
 q8c1i1hzGpbW8/AhreaxsH6st5PvVhLlqtrOcrsKyGmniTxQF/NhwZ6eMEi+M8Clu/Ls1Ow7GAd
 QhDUgXYpwWmqtwSShZZ+sxjAwI+j31Mxjh45bdSSYNLunkG3o+/v5Jzf6GxNeFQV7dypZ0Q1zQM
 +IEb62zhr43F0f8MMEaQf9lkUUA/GAI6F1EVtjb+vWdNvTRtOZyOX5IPrNjPqBIemI+YJkGCr8g
 juBZisrQGvAKW0IjBQFjO3ndCmCWkBC8XoeKFHGQDC4DV15A==
X-Received: by 2002:ac8:7d87:0:b0:509:4406:44e0 with SMTP id
 d75a77b69052e-5104be44e30mr177321921cf.27.1777941306322; 
 Mon, 04 May 2026 17:35:06 -0700 (PDT)
X-Received: by 2002:ac8:7d87:0:b0:509:4406:44e0 with SMTP id
 d75a77b69052e-5104be44e30mr177321511cf.27.1777941305716; 
 Mon, 04 May 2026 17:35:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a864c6f16esm2684204e87.15.2026.05.04.17.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 17:35:04 -0700 (PDT)
Date: Tue, 5 May 2026 03:35:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-list@raspberrypi.com, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 uma.shankar@intel.com, arun.r.murthy@intel.com, jani.nikula@intel.com,
 harry.wentland@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robin.clark@oss.qualcomm.com,
 abhinav.kumar@linux.dev, tzimmermann@suse.de, sean@poorly.ru,
 marijn.suijten@somainline.org, laurent.pinchart+renesas@ideasonboard.com,
 dave.stevenson@raspberrypi.com, tomi.valkeinen+renesas@ideasonboard.com,
 kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v3 6/7] drm/connector: Modify prepare_writeback_job helper
Message-ID: <kfizwa7jgdyuqc7qxfpgjjfbqydpziptkhrfrnz5umrycahbte@zlqsjuipu5u4>
References: <20260316083008.87466-1-suraj.kandpal@intel.com>
 <20260316083008.87466-7-suraj.kandpal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316083008.87466-7-suraj.kandpal@intel.com>
X-Proofpoint-GUID: kq4tj7m44UUm6HmSxy6MCandpeKFtVbo
X-Authority-Analysis: v=2.4 cv=KuN9H2WN c=1 sm=1 tr=0 ts=69f93b3b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=EWaBjrTCu0zT9WKhau0A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDAwMyBTYWx0ZWRfX6Bi4OA91MZsp
 NYkXHJLBkS2jamsigOfxGsVdZ6NxPp6Q9+8HK9U73lgKp5hrp3qYrJ2JKrkj5rKhKgt26YluBZT
 RorGa5u4BS+/axmRuQjM1MVm0Xe7SLpBNdFwh9XNzoghl4YPmssMzVULl6al9DZUSN19fFYNAU+
 sq5E5SVyr4WzwIDlOkipPepozU9irOVJ1d+CMsTdR8TgcSuV7NAqMdc+aBwZ9K3yaS/iYNs34nK
 AC0PMtInkvoKaDdksVlNmAP+yP/umO4nGt8o80UDlznbVSkEBCKIufgLG3mc5cNX+FpFOqcm5db
 tvd/MY0kqsTHhUhSDOBqnAxLV5IkTbo0EZlbbcAmsID3vlzd1FaQWx1prYHZQBXNVQXoHb/NPdT
 wYM4HKV131n5mFi7Nb1pyxqG4s+M33jgPXhXfuppXmrYMYW8uDcBpTPXOsiOgr8Cp7a3NqXAv40
 HJRBfALg3jfK5r94Bmg==
X-Proofpoint-ORIG-GUID: kq4tj7m44UUm6HmSxy6MCandpeKFtVbo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605050003
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

On Mon, Mar 16, 2026 at 02:00:08PM +0530, Suraj Kandpal wrote:
> Pass drm_connector to prepare_writeback_job since
> drm_writeback_connector now resides within drm_connector.
> It also makes it uniform with params passed to other
> drm_connector_helper_funcs.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c | 2 +-
>  drivers/gpu/drm/drm_writeback.c                      | 2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c        | 4 +---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_writeback.c  | 6 ++----
>  drivers/gpu/drm/vkms/vkms_writeback.c                | 2 +-
>  include/drm/drm_modeset_helper_vtables.h             | 2 +-
>  6 files changed, 7 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
