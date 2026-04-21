Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA24AF8FA9A
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 15:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E6710ED01;
	Tue, 21 Apr 2026 15:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzMpBM44";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y4nbOOh5";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47CCD10E8F0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:52:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 63LD7JmI3574120
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=b+TpPDtb4A8gF0EfZG351FvS
 a4dKKMV4oqQnvGwrL7A=; b=FzMpBM445RAAHk5vR+lJe3EuQLfi6pcaUmmL6Xb9
 pkqyCdRuKRhZYAeqdBBJ2p1rB2QhDqfjc4uESrNlx8tLhu9mFxQavV7cIkg86e5E
 jl1qY50x6SO9v9RStaYY3lHz5+nW7bmI7NcFSslRK+7b+S/0C9IUrmJqcZATLUJf
 2A89t2dcihv7AiNmjqqmr/qGXD8xwxUGwSpTeLRoWZi2riO6PFahpYkrbwsFUpRl
 XBQZJyIiY/EUvf9DgVklf9v/P3PRDwS/API4JnlMpTcAHWX8nB71fgG+GogTQYds
 S5CZ8df8UR1qDGBLUvIErjMWyL3xS3pbyYK5gM4Kf7TSbQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465j1pa-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 15:52:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-6057a534ce8so8401448137.0
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 08:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1776786747; x=1777391547;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
 b=Y4nbOOh59qVTOiG8XjepbppA3+WkU2TFZqbzCw4LQW2ZNrWloic0d4d0fimN2Wpq2h
 umfJ3x5oEQ3pxduLMGkf5ijlQb7UEYoYFFbzQVwzHjBmboznzpCLWUBl7lDEjvS8MqsC
 vOo920G08bTA5Sae/EHVkgh3rtvFD2YnKjiD+MFymMa2JM09OAFQsIkACOF8UPHGLYrC
 tPxT/I4EgF1fi5N3w7Oq2A/DCd9dPJRhE8QnYz3BNzQnZvR2gCpnGEuZRAZ4rgiVY5C+
 gVgGRmF3xvxkTl9oaMJMDT3ufGqXiqCngBs1zTFX1gEEPaVJaaT2PuwTU0W4elk9vvHw
 bb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776786747; x=1777391547;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b+TpPDtb4A8gF0EfZG351FvSa4dKKMV4oqQnvGwrL7A=;
 b=or2NIZe5hMqjWb0iFBNj3mM8Eag6/X9R/9sPYRm3T3mb1PSMKTXiQvBzH23fbNwWSc
 6KR5u9vNKehGOD35HNYcbtC4SAhY9u6+62LiOe6d0F9y/0JzBOXOtHmageHyzU4srVEo
 SIcl+qYjTvM/+5Dnk+eY4ClSkvEW1NO+xMY3lvTgqThjQjZpPC3YnMTnwWMlo4yeXsR9
 UXYlLE0zBqpa+tei0PjbzAEXzWExV8Xr8z5fdvNUdtK2P3FYiWzhuWrNuBbN+dKsFm2c
 HHD8CXxuu30YtAO7j11PfqzYkxAZCROuR+AhfKwTgcjjCr76UDtlZrCzhcZW4d22ZRnc
 MVLQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Eiqv/I6bbH1kyCeb7Fynld/5ob2IDzXVMQ9U78nYMRUXeQt3/kxwKu7oFrv3Y2m3SzDBqE4p12Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMi0einY191XGQayfJQlnIHiWOXlrb0s8R4R26dEW+J5FZE45v
 Ok8P6n3j3AUGEBchVynieXCwJ0CoJ8nKr/P5KcPTDXqN8/MReXUityQr70HbQ9KZ2pBl1iNh/56
 16BWvB6cBoXbbTiQ04n3SffPris3uxw+1Dp2A5ZKKSLixlj1L6+tzOVRfkUyIW5jqyMvgXw==
X-Gm-Gg: AeBDietXz4tjYxeLqw73lotb9fq6dZjujvnda+CvdFxzTYce1YMFncz5NTzyJttZEh5
 5XARHKKwvXJKG0kAUCnQI+TZTfKNZ1Mwe+uPyqTQY0f58JvJLEEy9pUMNmSQ81FTyH5PdRohlAW
 rDnr59heIMpMn8YbsxAXydlBT0U6BQhza3zw2i2QO1y8+VXl3APzmImS5FHPkPcGtwjQ6OW8Bs2
 HrFR2vkW9nd0vXpZhfLkIEwg8cNhOVqQC4JnATqZYZVtNZaBhbv5GbivXjRwqp+Rm4TbPdys3K0
 MazT5JA5drwU++w5l8BOVHtggrEvg+U70Kkfru5xip9X13bJh9XUnGF6AReGD3ElssJMp8xcBd6
 nJCUV7eBPaPTVebNziRByQZswxg8HM1DSRz5AlksnB1b3WbpOpTdyFpexvnRB2nLCjTjIjTl/Jz
 O/PFVKWEImjS131AP0enH0jq371+kALpy8SizlqDVoapdcUQ==
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id
 ada2fe7eead31-616fe259128mr6807896137.16.1776786747166; 
 Tue, 21 Apr 2026 08:52:27 -0700 (PDT)
X-Received: by 2002:a05:6102:5492:b0:611:959c:86b with SMTP id
 ada2fe7eead31-616fe259128mr6807884137.16.1776786746729; 
 Tue, 21 Apr 2026 08:52:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38ecb5f66besm31845671fa.13.2026.04.21.08.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 08:52:25 -0700 (PDT)
Date: Tue, 21 Apr 2026 18:52:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Simon Ser <contact@emersion.fr>,
 Harry Wentland <harry.wentland@amd.com>, Melissa Wen <mwen@igalia.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, Alex Hung <alex.hung@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Daniel Stone <daniels@collabora.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 13/20] drm/connector: Add new atomic_create_state
 callback
Message-ID: <kxp5j2tsermgycxq2wtxsvfml7etawwc7mew523rtkynp2x6oi@trsnzjwlnjto>
References: <20260320-drm-mode-config-init-v2-0-c63f1134e76c@kernel.org>
 <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-drm-mode-config-init-v2-13-c63f1134e76c@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDE1NyBTYWx0ZWRfXwGtUUf2CaN1e
 6UQqQFBsc27J/5MLxB6ajTkwgUo0eSt3WedqteuQRWhkUcgAeA+qPYz6ADmZDGkuXn7/nML6Q/T
 2sScVoux2RePTTyieLXPB/DC7QFeMcmNFWgl1GAW2Kzu07JKzxdAMNQB5Fcfq1By0m0BHMpyvvS
 AV2tHBrz7hiep0ZACl88CL9pIu7Yr8YF/znGfa5Ehr+AbYjaKg39fHCBM6GAJ+CDSdhLxd6qBkP
 Z1vdb9Y3E4oPZL8fR6hYqAQiFwZviUmK9BEAE0NdejGhoX+ZTmUdDbPEji9Hywc9DovGMN4KOgH
 lddfL+JHWYzKoW/sVMQVom9cwHDhP7G+RiPq5ywVPC0vsAJS5mJQffh1dboRv4a/rx35S44aFrm
 vqD/EyqJ/Me0CloG4vi6e601OjkTWsJIYgqOC1srm4HlGl24Kf+jNdRWTd1gLuMH8n0jON92bOt
 TRnZfhODQVzWTP9DfNA==
X-Proofpoint-ORIG-GUID: 3ZaF7R7X1pL6Bxa0w2gPdCeGBv5DoqSo
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e79d3c cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sh7rbVFwc6wKdXg0ZAwA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 3ZaF7R7X1pL6Bxa0w2gPdCeGBv5DoqSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210157
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

On Fri, Mar 20, 2026 at 05:27:20PM +0100, Maxime Ripard wrote:
> Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
> to drm_private_obj") introduced a new pattern for allocating drm object
> states.
> 
> Instead of relying on the reset() callback, it created a new
> atomic_create_state hook. This is helpful because reset is a bit
> overloaded: it's used to create the initial software tate, reset it, but
> also reset the hardware.
> 
> It can also be used either at probe time, to create the initial state
> and possibly reset the hardware to an expected default, but also during
> suspend/resume.
> 
> Both these cases come with different expectations too: during the
> initialization, we want to initialize all states, but during
> suspend/resume, drm_private_states for example are expected to be kept
> around.
> 
> And reset() isn't fallible, which makes it harder to handle
> initialization errors properly.
> 
> And this is only really relevant for some drivers, since all the helpers
> for reset only create a new state, and don't touch the hardware at all.
> 
> It was thus decided to create a new hook that would allocate and
> initialize a pristine state without any side effect:
> atomic_create_state to untangle a bit some of it, and to separate the
> initialization with the actual reset one might need during a
> suspend/resume.
> 
> Let's continue the transition to the new pattern with connectors.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 45 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/drm_mode_config.c         | 21 ++++++++++++++-
>  include/drm/drm_atomic_state_helper.h     |  4 +++
>  include/drm/drm_connector.h               | 13 +++++++++
>  4 files changed, 82 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
