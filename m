Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E65C28B28
	for <intel-xe@archiver.kernel.org>; Sat, 15 Mar 2025 18:40:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDCD10E055;
	Sat, 15 Mar 2025 18:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lo/9/dJm";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E1F10E055
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Mar 2025 18:40:04 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52FHbjkP000764
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Mar 2025 18:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UtEbq8V/NtEZkSm+R37gQ1eP
 CKnUAWKaKkHpQvaTI3k=; b=lo/9/dJmUnDmryPWfvxV2+2DSGDJqqIKmath2zzn
 wke0iQQWrBR4fJYraIW/sos3ig6csq6u7ohz2Z2X0lmLNcMAD5S9EbVIrFSiUmDy
 AVNrOC3GW++6tu0hejz7QWgnBasFgYV9BMUEfuqNLYw9Sf9WclVwttlHUVMtQfSU
 lIULCbC0Wwrl4VKUS+98kJqg6DFlRMHglpMdCiFFd1pg3u7GBx9mqhGJsGlBwV9E
 DsfcDTfyZWumyp0LuMSRi0Tln2zgA/7qAeefets/R1LlGuGOc6T6ouTlz4KwpPDP
 hRkYqaIRRCAGTxkzTwvAj6XCnMaKAzGQ4rmR8P30HLDPEQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1r113c0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Mar 2025 18:39:54 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e1b8065ed4so71018726d6.0
 for <intel-xe@lists.freedesktop.org>; Sat, 15 Mar 2025 11:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742063992; x=1742668792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UtEbq8V/NtEZkSm+R37gQ1ePCKnUAWKaKkHpQvaTI3k=;
 b=kQ49vS+mQ3oYBqq59kgx7jyUON2M68Rz7pDC7OiltumsTlFvhJDVcztMfAtge83rL1
 zPLEEGNhsO4SZb60q0Mnf5pge0kf7i8AlQVX3OzFCnfWr49GEJJbZq8CLJidOddkpJl9
 SmpV4FcuXJu2aywtMIGHL/mmEdeg7jcPYKIyuYf7h7a27HUQgC22bDoORoyetxSYrUEf
 VKURytQL/q6gV1Ya7TLOJUIsCd98rcIj6XTbYqnD5R610ofjieuylMcCFyee4a+sRzbY
 GPa8jApUmoQVMLXz1WIUWh9wU67ATrpGoe6HXa/zOVMNJemHAKzLiRAxJTpc88tltq/n
 KAlA==
X-Gm-Message-State: AOJu0YzZKalJbmjxT8MuiAmWhFLPjVXeZDxktLc2CcAs46a2tGKM1Y9T
 TQKi2MVyOY8IfYiMPHDUCu6LC94pt/VM0rlXJFM6kQQXH85PEJRuKNB+E5wlZlz4yKLOLF3XTrm
 hjj3nZHc/1icOqmcb+GPGZQum2Dmup9CIhZlutipA/e39VM87Wsg7V9+IcOw4RtYp3HFbA9r7yQ
 ==
X-Gm-Gg: ASbGncvGSaL/ivmCDiX5IXhlPo+AIkq6vtDJRdSgDh5ZZMOwbPdjkC41Dnf21SoBS8N
 1SvCJSsjNceOhfr9Yp3yt6U9iVRQQ4+1/8TM1/wM51wcAjbUtL7J4rutiFvCZjQ4SMP+G7I4MwK
 lC9/jgfw/Tezz0nxgyXhQzhM6Mu0/LqZR+jCUVyBtsPcDo3vraZHYV2jouwYWbgqgqO/6cGItL0
 pKluTKmuqk/lbPo97oTS3d8Rgx28PljEb0KH3B+WqOKn3SDlYJL57qOgtjloirWovSGAy/xAW0z
 UaKpES3HtTlUVYMjh4GgYWncAq/IXBLDzZtoyGrAMhNeZGnesiiXs/3sWvrMeYp1vuT6JE/Veb8
 JCNM=
X-Received: by 2002:a05:6214:f6f:b0:6e2:49d0:6897 with SMTP id
 6a1803df08f44-6eaeaa5afd4mr96831986d6.24.1742063992604; 
 Sat, 15 Mar 2025 11:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmIGsbXu0hrCN6MCQrzXjGmhIzpZfGVDJrb7bUoHTlS5gnwtzz03IanAnuZ8vH/a6hY2nC1w==
X-Received: by 2002:a05:6214:f6f:b0:6e2:49d0:6897 with SMTP id
 6a1803df08f44-6eaeaa5afd4mr96831776d6.24.1742063992237; 
 Sat, 15 Mar 2025 11:39:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549ba7c0a39sm874193e87.65.2025.03.15.11.39.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Mar 2025 11:39:50 -0700 (PDT)
Date: Sat, 15 Mar 2025 20:39:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: intel-xe@lists.freedesktop.org
Cc: Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 drm/display: dp: add new DPCD access functions (rev2)
Message-ID: <l7v3v4nhgpm3qi4f45l5jtkmgwucenxijkiju3juqmw5qdh7j4@xqcemrfzqqgp>
References: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
 <174199457830.37653.212093362252056402@18a75f3d1eae>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174199457830.37653.212093362252056402@18a75f3d1eae>
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=67d5c97a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Vs1iUdzkB0EA:10 a=5KLPUuaC_9wA:10 a=e5mUnYsNAAAA:8 a=i3X5FwGiAAAA:8
 a=TWr5M0L8PQlDITfRoroA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-GUID: nTqobMRI16EDeWTSM_0uTFPBAgMqUWLA
X-Proofpoint-ORIG-GUID: nTqobMRI16EDeWTSM_0uTFPBAgMqUWLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-15_07,2025-03-14_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503150134
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

On Fri, Mar 14, 2025 at 11:22:58PM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: drm/display: dp: add new DPCD access functions (rev2)
> URL   : https://patchwork.freedesktop.org/series/146000/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from xe-2822-83417b23792d937795320a8804fd97d50c4c6233_full -> xe-pw-146000v2_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with xe-pw-146000v2_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-146000v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in xe-pw-146000v2_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
>     - shard-bmg:          NOTRUN -> [INCOMPLETE][1] +1 other test incomplete
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146000v2/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

I'm really not sure about this one. Is this a result of the DPCD
changes? (I'm especially suspicious about the previous NOTRUN status).

> 
>   * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146000v2/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-2.html

vblank timeout is probably irrelevant

> 
>   * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
>     - shard-bmg:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146000v2/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html
> 

-- 
With best wishes
Dmitry
