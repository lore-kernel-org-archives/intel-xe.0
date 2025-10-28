Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8EECCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 19:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A018A10E651;
	Tue, 28 Oct 2025 19:54:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PtrDBg+z";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YHrc+n4k";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9235610E652
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlHEv2609607
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=; b=PtrDBg+z1RJoSGZw
 ngQn86Waw+T2U8zDWNrDutSLoe8j2rGOU4ErW+W7tYqptFgesimHadUVZrlht1ng
 CmUKNwb7ereJCI5Q4e/KyV2GRswAopZAku1w5o5l4np9fDq5tIY4CfPbmpZRWH63
 uA1o7cSLf7Fq7TbmIiSeq0pR7CGoHjqgD5H4SttoWiB5yd5o7x4ElY5GVsDiN8+T
 BOZtA5o+WBjmIKIvr1/jXlM5oAajD8efbYjRmeinshLqFUGNz2KNfzhu2IrHFyxI
 dvrhDN3guCj5uHHPZytfGhC2ApcnimbGGdEFEXC+2Haci447ir0uEEI7XhUhjehI
 M2Lj6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a000hw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 19:54:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4e8aafb21d6so159098411cf.1
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761681272; x=1762286072;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
 b=YHrc+n4k2Zs2POjUDpEwGd1MbKTZBmKxl0LQ8XcnLr5evfFM3xhJIY9TZGpNzyCVCZ
 S7my0a2Qc8W8SEEIsJNmb/yu3UWnK8hNWRvDMFqIFKwULpQs9QhqUzTK6QpSC2VQ5o3l
 JSP6r2Jqj6W49yJQmiLW+aQ49PElMkkQhohU9Rt1gJ2AQmYz+ac+2UEhy3RFHUhy7Fhl
 kXNKva2zaHa/G9zs8I8CyLAYr+lbFeVxfYL2EWAsYPLyOFjnMtpXQXHmOxK/24IpD9DE
 O8TpsFo8JagyC8Fjul5EZLDdo96ZEPeGOU7M1fnzf8rpUclHP/VeVr7jeNX4O7WDotft
 cqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761681272; x=1762286072;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2afrDbATXikU2P98B6c0J0m4ZgHNuW/14p+YdDAqu64=;
 b=StR/r7nUOCXgASPQVrSlpJQfa8fEL90nKRyw1EvceNGqSnrenJLaki3Qp/A5Nbr1Sw
 KJ4cbjVJh1aL2TwNlxF4zolg5yCxqOCpRPqskdzlKLu0wPU/WHXEEqxv62n6OKfIq7kE
 fIg3JWbNwrNoTk/Jtp0ezyHvyxqLIVCCsMebY9gdJ42Loasj/mVhE89wIvjSFK1qA/IP
 HungTKz8k/8ry2B4HUw9iZnMPFDw/4P7QkHSH1HKFGEM9AnzLOt43nOvpXlWYtUM4ugA
 wcOAzhfEti6fRwarloBL8GbAAULsSAAdQ3xglZtPk5qO95vNajsr9CjnWuIQGWPZPcKf
 OKAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8uglP/FwcK3293SFmosdrnVK0fh7nJI/ONnynpDPPn9vptxCboMF+0oQf9Zu02AjSEb05quP+6g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOCSWVIhWWbrZoAz4ur6mmGnhHJ/VUvUIC7cjil6wTn9SxqwkP
 2M+M6vqcDJ53cloSlbDLXvI8LVgcrqKVmXvVmhTQNN59dtmFDj3xka9zZj6gMwDhHE1VEj8pemz
 b8ydlGXUGX8mx1nxXnSDo5zYLKGXt836UOCRDLDPdlCzxIwUvUJE+KR0DRpTtT1YYza4N/w==
X-Gm-Gg: ASbGncuTfQTqA0O9hEXlbwPowe1nalFZgdroKDCvqoN1pvRdyX0d2CNMqjvOJ2REjpD
 8CUSotYFJjtr3dZdpxcJbpijQEPKhG2PDOutbAKXBIo6aoerquppgCzo455iGPuNwaBpYOATpuD
 oxK6kjAGhZBJR7YyLz545leS6JURQFcECxYJYrgUVP36XqAHV03U2gUkbBcAFLggo4yjArrbxmV
 mIiIvbXehGjN97eR08EJwriQk09ujI5reLZ2p/V0yZ5LsmER5QGVmrfiJFcKYueIgg3E2KvpIy4
 PudAUAOHlxxbPEIehKwUxKInOnv3xIo67NSZ8u5t2q5rjoGZ9T5AcvZJ5NmNzPVbjx3116+YSpT
 OcfiPq8cP36axn02GVZlLTyTiHqAIskznkkHXKgPEtLruDpRa231Wgms3dCqxQ03n5D2JZfb3/Q
 p3UrWElNOoORCR
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id
 d75a77b69052e-4ed15bb30c4mr5992741cf.17.1761681271906; 
 Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp30l/mxiO0/x28DsAYuBVAOl6GnYN2VrIZ7Onq+dUKIoHEjlqng8hPS5TJz3djMSRii/+MQ==
X-Received: by 2002:ac8:5754:0:b0:4d7:bf73:7641 with SMTP id
 d75a77b69052e-4ed15bb30c4mr5992331cf.17.1761681271214; 
 Tue, 28 Oct 2025 12:54:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f87f14sm3312685e87.112.2025.10.28.12.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:54:30 -0700 (PDT)
Date: Tue, 28 Oct 2025 21:54:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, linux@armlinux.org.uk,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, patrik.r.jakobsson@gmail.com,
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 robin.clark@oss.qualcomm.com, lumag@kernel.org,
 abhinav.kumar@linux.dev, sean@poorly.run,
 marijn.suijten@somainline.org, tomi.valkeinen@ideasonboard.com,
 alexander.deucher@amd.com, thierry.reding@gmail.com,
 mperttunen@nvidia.com, jonathanh@nvidia.com,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/fb-helper: Allocate and release fb_info in single
 place
Message-ID: <dlvkkogiueskk4emkwdkpst4pvqk54ordyuqobh3hzqckuzz3f@gguhnqagpvwj>
References: <20251027081245.80262-1-tzimmermann@suse.de>
 <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d1bc193-fbee-464a-b62e-ceca06d8829f@amd.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NyBTYWx0ZWRfX0UKk154NKlKQ
 WiWNae/L84hOM+KWFIy1574vX8ht1KPkVX7N2MVsqF8f7WOdXKrO2h+m7ETLcAM4JhYArsbVy9W
 qgeJlwN1e1OvaVmKUuIPr1gL7F19AjB582FakVVKj+18fyBaG1JCHuF8u3ICHCCg7G1BkSLmIgv
 TMc0shxq9zdOdO2tddBQeA8yCCgkBxE/MG6qBTsblNG6MrZlNH1irA2WaCco3BTSfeY6mZ6wVPe
 7GYgGAbKdYMYKbbUFOtuXM5yR6yMcOfEPLckw56krI2w0i5phl3KS1XgavFKq/XL3GxcPbTN4cH
 5jTRY4qm4O18062r9pxLZm9pYpkUG72KucErnk1+3fSuMCIHfOY/mjzyR5o9Kw/KNAi+ifCIold
 c3betenDV5ATDlrAjYfZtvl2vW8m3w==
X-Proofpoint-GUID: 1lB3n8Qt0T3W81HlJOV1Viv5a4AphpYO
X-Proofpoint-ORIG-GUID: 1lB3n8Qt0T3W81HlJOV1Viv5a4AphpYO
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69011f78 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=zd2uoN0lAAAA:8 a=EUspDBNiAAAA:8 a=G-TusFqAXxKo-7y7638A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280167
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

On Tue, Oct 28, 2025 at 08:58:10AM +0100, Christian König wrote:
> On 10/27/25 09:12, Thomas Zimmermann wrote:
> > Move the calls to drm_fb_helper_alloc_info() from drivers into a
> > single place in fbdev helpers. Allocates struct fb_info for a new
> > framebuffer device. Then call drm_fb_helper_single_fb_probe() to
> > create an fbdev screen buffer. Also release the instance on errors
> > by calling drm_fb_helper_release_info().
> > 
> > Simplifies the code and fixes the error cleanup for some of the
> > drivers.
> > 
> > Regular release of the struct fb_info instance still happens in
> > drm_fb_helper_fini() as before.
> > 
> > v2:
> > - remove error rollback in driver implementations (kernel test robot)
> > - initialize info in TTM implementation (kernel test robot)
> > 
> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Acked-by: Christian König <christian.koenig@amd.com> for the radeon changes.
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # msm


-- 
With best wishes
Dmitry
