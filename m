Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DA1CCF9E3
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 20:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1740D10EB71;
	Fri,  7 Nov 2025 20:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBMC4zbr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6QfIFai";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9D510EB71
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 20:20:09 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A7DYHSX2280811
 for <intel-xe@lists.freedesktop.org>; Fri, 7 Nov 2025 20:20:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nRbsNOo6UJxtICpkZwkcsd0QvQyPYGLyJjw+iQFDDn8=; b=cBMC4zbrMT0si0ET
 yOXMUgL84VbkcX2xEYJ4v9v6sezYn+KehDPExpU9xBIIw1Mh0kzfi/67TWs8yylt
 GZBLInXuBeJPed5lUsMhy0SmMSrCN+m/5zWwC6FqYLAoZHw696P0TA0NzLxaBsKb
 xttqbTWQYdjOcKb9CJSxPbymaB+PV6pQc5jj9pFdoac1UHeWPEhfu/5Ec+Yfk20c
 VsJZgYXCCWN1WUlJ81Zprohqolu3IzeqBIgOY1pjXCjikT05z6UIpQUYGs/dj57+
 fTjfpZmLh0LbV2FK5EfPrX6yR143wGrYDHzVHXLDo3EBOZNF9GWJd6YWT3UMRT32
 NpKtTw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sjft4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 07 Nov 2025 20:20:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297dabf9fd0so4733735ad.0
 for <intel-xe@lists.freedesktop.org>; Fri, 07 Nov 2025 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762546807; x=1763151607;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nRbsNOo6UJxtICpkZwkcsd0QvQyPYGLyJjw+iQFDDn8=;
 b=Z6QfIFaiGLvUNZ7RhR7pAyFQ9SrkFd5QbBg48271CEzs6YET1BZEtb1NunY+GZrZyo
 c6t+tDn4P1BS7s9tYHc19g5GXEU8HBJF8Qp9f5ECeYTrbbzwsktbXPBHk20gxJN12mC7
 YR3oN+5jSKneaBqepf3eF52B5MQFsqu6XZiWdCSncZcDTJGTXDmYMqHrcdku5z+HqtkJ
 zugp0gDCfZxBWOIj0n2jcjhrvmsnn+cwG3wKPaqx7Tjo4KRnNRpLTTgJ3Hvt0jRVlYda
 +hWqmvB6+8srjQlsKU87PrmSK3VywjWEQRWwvTp9Iu7zjZNgmC/6ZyZ6MNjhaHGr1n1l
 1LnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762546807; x=1763151607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nRbsNOo6UJxtICpkZwkcsd0QvQyPYGLyJjw+iQFDDn8=;
 b=lgWuP9/s2MZioShWtVoJsS0czwZvkbColFV4bu9Pczbcm2TkYmKXrSRxNU4xCwT8o6
 7UKpFcZ0a3Hrfao3kGppUcNlLQaP6/NhaErUE/8GXTgAcD6A7tZlYqWga4UJDz62GImu
 jxjFNktisty0Hi+9QWy1+S6RtCE8rWLx86IfY8AZpda0GMFhYe3bGx0tV9KlrL+siYvK
 dXr9Z5ePxIyVkhfGhTJ0D+H3jAvW1K3Iks1JxVsOri8KrsD2hBk+7ZFdFRKdW5RcbeVk
 YWcnc8Aw1bQhW1DNHQXa89yC4Y6q0Zuq6DkxfSV5QTyRXby6Qh2ABMmNPqyTRMRH1oD6
 4cJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXb1YkHstyNQazs8jDsJZO5kcBHpqiJf9pCNNehjSrYv9/ZPBbIWcCdGGUpr5ki7rQAvkc7OClDw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI7/vEaHmCLW6t/efi4Aw/1zUbi3CjrqXh+Vw0WwWJ07/Hfkfq
 Ypoaa+Qj/l3GjBP6wAf01/UAYrGfBnlT5nTIuq/2pdrTyr6p4fMcx3q0JAXj/NzA0vG5dRfWyn/
 9aVwKnBx2PYOANgdHGk6DuMgg8DzluCoytlFH1s0IsSLWC1LX+FpGA5SPUqSXHWP4jBHR1g==
X-Gm-Gg: ASbGncsJXHOpsKXndzTqTKZUwsZN2UdxJEGI1ey4awYJtby7iI8x4r4cAIaZ+rjA/LH
 +2Kernea2LXzllySmuOIihxn3z/fs/eVMzMIXaHimEQBdYaz9iR1WnqRuAKRKlW8QJlHZwlMBcU
 aSS0i2BN15auZ8sdIgyVHIFwzO0uXjZYKV9afOfL+ddEHa3AbyKv5ouBrfzAE0z6hPDV+8TN5UF
 Dr6tihI5+RIU68vhEmjn44JbVKySVjMVF0RAA1nMEKQGOR6NY650akeVnLi9LMUPJt41g7YoTCD
 SeyG0yttomL33R+VwSkXmqaDZ268WjUSgTplflpQLEirpScZ+IF7sTJ2t7hPU9q9JmWdp3UjL5A
 jvg6qwdGsXeIPQwliOIori3zr6a1qjF171ifUMMHqzNaq75ZQ8Yj3YtYyrSombQ==
X-Received: by 2002:a17:902:fc4f:b0:295:595c:d002 with SMTP id
 d9443c01a7336-297e5643d62mr4435145ad.15.1762546807185; 
 Fri, 07 Nov 2025 12:20:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjlIBWO8KYF6P/PNB+fj/0Z6Jmz8mLVHUG89yR435QivYEb+MO8cT71+Q6lnS/aYFc+tGslw==
X-Received: by 2002:a17:902:fc4f:b0:295:595c:d002 with SMTP id
 d9443c01a7336-297e5643d62mr4434865ad.15.1762546806655; 
 Fri, 07 Nov 2025 12:20:06 -0800 (PST)
Received: from [10.226.49.150] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29651c701e9sm68086695ad.52.2025.11.07.12.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Nov 2025 12:20:06 -0800 (PST)
Message-ID: <7820644f-078a-4578-a444-5cc4b6844489@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 13:20:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce DRM_RAS using generic netlink for RAS
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lukas Wunner <lukas@wunner.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
 <c8caad3b-d7b9-4e0c-8d90-5b2bc576cabf@oss.qualcomm.com>
 <aQylrqUCRkkUYzQl@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <aQylrqUCRkkUYzQl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e5478 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PTgRNUtVYmAdSUgUj-UA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE2NyBTYWx0ZWRfX4vOC9XtrU+RM
 ivnsSNFaaldSPwgYSsQy0NHFm3kBM4dzLvcNkX2dVLXHUjA3uyHksp3OuiTBUtu2YsJ5bMRrmk4
 FPlNy7nD6u1uzNm/ZVn/J77G008Umu5UwCU6PDl21YlwBpqUfynCf0oj8TcTcMKCjUNmk5txOkv
 UEu9qfpadWCHD3iALVTza/Ke0gjwE6hAU88Bz9Uza4Xze14HHhCyPDgfSbb1mcAdeyAqkse7CNB
 u3+QmjzsaxINrNFl2bd5j/Upa6a5LKgNxrWWx3nliDR+VVmsQm6sl8gDREPSCMiLDVxPeV1Y2kX
 KkExwYHjxJAjGtAxi7Fwnrs1SZv9XNbIOb0O5RXlOjsym2HfRIovOYrud3e0FCxnOZLijyJXyRh
 hXez7vQVGFs3NqyzaWsJ+anh8WKH5Q==
X-Proofpoint-ORIG-GUID: gL01R5wpfCoyVijts_ZBEYtDiez9AHRA
X-Proofpoint-GUID: gL01R5wpfCoyVijts_ZBEYtDiez9AHRA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070167
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



On 11/6/2025 6:42 AM, Rodrigo Vivi wrote:
>>
>>> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
>>> exercises this new API, hence I hope this can be the reference code for the uAPI
>>> usage, while we continue with the plan of introducing IGT tests and tools for this
>>> and adjusting the internal vendor tools to open with open source developments and
>>> changing them to support these flows.
>>
>> I think it would be nice to see some accompanying userspace code that makes
>> use of this implementation to have as a reference if at all possible.
> 
> We have some folks working on the userspace tools, but I just realized that
> perhaps we don't even need that and we could perhaps only using the
> kernel-tools/ynl as official drm-ras consumer?
> 
> $ sudo ynl --family drm_ras --dump list-nodes
> [{'device-name': '00:02.0',
>    'node-id': 0,
>    'node-name': 'non-fatal',
>    'node-type': 'error-counter'},
>   {'device-name': '00:02.0',
>    'node-id': 1,
>    'node-name': 'correctable',
>   'node-type': 'error-counter'}]
> 
> thoughts?
> 

I think this is probably ok for demonstrating this patch's 
functionality, but some userspace code would be helpful as a reference 
for applications that might want to integrate this directly instead of 
relying on CLI tools.

>>
>> As a side note, I will be on vacation for a couple of weeks as of this
>> weekend and my response time will be affected.
> 
> Thank you,
> Please let me know if you have further thoughts here, or if you see any blocker
> or an ack to move forward with this path.
> 
> Thanks,
> Rodrigo.
> 

No further thoughts on the patch contents, I think it looks good. I see 
that Jakub posted some TODOs while I was away, so I assume there will be 
another iteration that I will take a look at if/when that comes in.

>>
>> Thanks,
>>
>> Zack
