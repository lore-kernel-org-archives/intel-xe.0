Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40D3C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 15:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447D610E63E;
	Wed, 28 May 2025 15:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="D5MaYfzv";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107B610E63E
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 15:15:26 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9kHJ6029896
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 15:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MgByvl3ckepaF69BlogdaJiFhvkLD/m96L5RpVcp7qM=; b=D5MaYfzvKtuJwZvz
 rLONKXRmnr/g/cNFjxC7n6YCLI/1Xc+m8xKSaI5lrB7z3tS3QiKXZf+L+fkcuRCB
 m4NvPCotvqHQBQOvcFrVscHaVyh5+W6P44GhvJovyilLvwe6yBQYRi5ltXe8h220
 nsddoYvC5MOWtFKED9mN7zc8Vu6lgQISNji01QoYv6rsTpWMT6e9hcVT/xuM158r
 o0A4xdgXDhO0avKWDo0WhylglTtSNx+Othmqy4aNLmBWNJLD27ft3uR0Om+cVsyA
 xpF9OeVWnaSDxnbNHoE6vWrVcir/QEj6MSOWgtmmEkSSlnddsv8f9IaeflInn0CX
 DhrFvg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549jkhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 15:15:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234906c5e29so28603795ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 28 May 2025 08:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748445324; x=1749050124;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MgByvl3ckepaF69BlogdaJiFhvkLD/m96L5RpVcp7qM=;
 b=I5BBWPPrtOhbmidHo/6pxsV2F17vhZSUlRaYSCI29gP2hjX7rkqeCo5CgJZJPRLL47
 HZC4Gjp8kUCrHxJANnLdX2DJOWqBIxQgXgqO57KQihC8p2iKkM0ZugXYgTc/jsNsDkDw
 eRskoMDLL9PtefJVxcJfAGZdZDXUrh3SS0MvocH/ESQ4kG6ZUaVEHzXH2J1UQtXy297N
 oMrkvMkaxUVEvcEM542kXLxc245wERH7gMYDYXGlapvUQXLRbrKY54S0Kty74dMDodtJ
 lbnKQeR3M4F8P8jOFFXw0tnzm70cA8rlV9iM1xyOPabxtUQfFIMvWOj4nCet/YzZXODJ
 ae5g==
X-Gm-Message-State: AOJu0Yz7tzmxHp8C3NkVPQgGagPdW1YBoBluXCXwOI+NZsWMJykLTt7p
 a7o2HX4pfXJjO7p9iZjiha79vgo7GSli3HwRFd0ti8XBjkQEzAUEcahRv39Md0NvMMuKayimSig
 1uza2mWGiDqwUcAV9jDDommBXvQL59rhw3gFdgnsVOFViXj6OcNXW3B3k3RqeaA5bzmFIAQ==
X-Gm-Gg: ASbGncspXZ3iDHlxPbRYPVbBtrzFNrJ0q6+i2CHK5JSQTG1G2bmvdnoy8RligJ4wmZO
 rx7n3w2pivNyD782qBxO4oJE06JExnvdsS8xY+Sc3QY7rmMNzqh1VV90PJ4M/bBkm4PeRRjhkKO
 ggFTXeGV2m3+DeHYmpvbzogBd0EDfaX2KJUkwRM9ZAktmBrjvfDMDmLK9mCBC/OMPAzBN8IXS+D
 4paquluwXsLsH0sgA24qUkF/rTA6FdSMu7K6Fph2ABYIQtGusrofN49fUQcZSPqQZ9H61naTi96
 XOBm9l2vSXTOWugp9OMo9KOR/pVSiaIJkC9QkmOuXMiYKNu9AK2ei+EnsNzkYQ==
X-Received: by 2002:a17:903:1547:b0:234:d679:72e9 with SMTP id
 d9443c01a7336-234d67975f6mr34198845ad.12.1748445324626; 
 Wed, 28 May 2025 08:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+fHExXpmEQ68MffV+vPEWdglq/8jBdvplEo6II6kIixUdE9kLKmnfJY0nJ0aFhZ6ORv5X2A==
X-Received: by 2002:a17:903:1547:b0:234:d679:72e9 with SMTP id
 d9443c01a7336-234d67975f6mr34198595ad.12.1748445324263; 
 Wed, 28 May 2025 08:15:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234d35cbb41sm12929605ad.256.2025.05.28.08.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 08:15:23 -0700 (PDT)
Message-ID: <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
Date: Wed, 28 May 2025 09:15:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: intel-xe@lists.freedesktop.org, Carl Vanderlip <quic_carlv@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250528091307.1894940-5-simona.vetter@ffwll.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N-eBC9_k3-UCsUZ1k0xBKhtyXmKjvvX6
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6837288d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=k3QLI3o3WigVO6453v0A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEzMiBTYWx0ZWRfX1F1jLkT9hTOR
 u0kTF0nSHPfw0PDnDvmXJnDWxaGdzOQ1J/BSY2wjDc/aAZRnYjhTdFYMr5YoIdq+w5zA2itPpCk
 aQy520zdmKm1SMfiYAqF9DHyBtlVUW1nHLRwE0at6tdwczPaGkraZxNGVG+e5oZ1aP8+h1lOyOe
 lr0xPG6vneIh0k0FheaZxXJyybqzs0MxBi2Q4ccythLXmhCkajxpyFEbbxfSqRRvaDAvVXzd+mP
 VZdtIije6Oz8rCHvov/GW72VSsQ2X2//JUn2H9Ni/Cwjm152Fi8Zo3QrC3KSmvDzzoO2wrs+ypK
 vgwdcxjQW/kihhANtiyNIlFrmghVB8d/66lEpopXwD9vV7suXde+RvqfYLnb75RnZm0eMYpoNFA
 49WSI1n8o0vUnVLuCpl98BYxZxNQbvcyLYRI3qacX4VfxfXbxPPm5IvybVmDLgA8YfuIbH0x
X-Proofpoint-ORIG-GUID: N-eBC9_k3-UCsUZ1k0xBKhtyXmKjvvX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280132
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

On 5/28/2025 3:13 AM, Simona Vetter wrote:
> Handles are per-file, not global, so this makes no sense. Plus it's
> set only after calling drm_gem_handle_create(), and drivers are not
> allowed to further intialize a bo after that function has published it
> already.

intialize -> initialize

> It is also entirely unused, which helps enormously with removing it
> :-)

There is a downstream reference to it which hasn't quite made it 
upstream yet, but tweaking that should be fine. This is clearly a 
problem anyways, so we'll need to find a solution regardless. Thank you 
very much for the audit.

> Since we're still holding a reference to the bo nothing bad can
> happen, hence not cc: stable material.
> 
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>

SOB chain seems weird to me. I got this email from @ffwll.ch, which 
would be the author. Where is @intel.com contributing to the handoff of 
the patch?

Overall, looks good to me. Seems like either I can ack this, and you can 
merge, or I can just take it forward. I have no preference.  Do you?

-Jeff
