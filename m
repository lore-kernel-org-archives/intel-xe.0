Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A7BCAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 20:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB9A10E845;
	Thu,  2 Oct 2025 20:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaROFznE";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A0F10E848
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 20:38:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59291Fst012307
 for <intel-xe@lists.freedesktop.org>; Thu, 2 Oct 2025 20:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 M4x/junmy+fj03/LZZBzwfiTmBsCnIUC7WDiYxw7F3I=; b=kaROFznEaRc89L7D
 x5baXEL7Yeup+eeFubnAaA+lIEygh/JQLF+maNGW4BtczGYq3JGtHAGzZzloMnOT
 b67FoW2PQR82SNjals9Hnf2RgC0EqUrLZ4Q8jLfdD4mTi6P8hgpkERi8HJtJdIws
 QkQH7vFiwsF76jfwHsExIcXJEGtT/L0P1+BEMxlLrQ/EpihnJLZxgl4mAck+HqkG
 HZ139l8j/AQGpv7JJYkhy7sfFM1yoifq0XYhxen/O+KNPp9GCnvCCQyCYkKutflm
 Didb5r2Rsxdt+HpSf9FGLx9Ojt8Dxk+BvuLBgGcSBKLWXWU9Chq2sAj0A7TRoYb0
 5Soliw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80u14pd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Oct 2025 20:38:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-78108268ea3so2435580b3a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 02 Oct 2025 13:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759437531; x=1760042331;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M4x/junmy+fj03/LZZBzwfiTmBsCnIUC7WDiYxw7F3I=;
 b=Te9eGAidkyzZBizC/Vk/exaDJ1sJ7kwZXyyWssZvnQtk9l4fDV5GCgpvws0Lo7mwOe
 K54ohcASCiqokvlZSD59LjZLMzzEUGW2cW2HpwNuY4/k0yL8jZfhRe5gzxZTFPUU8WnK
 12SLnPgwwgj86OC9UaTknXqOlnq4o+QqrUKslb/Z09jd2lZ4QstEV5+LFGqObYIHsCJI
 KuG3urWW4XUrah8JAuKA1BV96USCU/ZnKofLP/cKORoAAPk5MZPv88os/enQtpeiXMlb
 qZWwoVrZolcbi+leSdnjayjYDV/MJC/3ozVOOKf+f0Mgt1Pzv4SL5GfS2AV9hNn5v5Lg
 9aJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkdN5XVC7t87jP5cquPO3W260saK9RKQ/kS3z9G1Q/8ayAJY3D6zf44GRse7V1khFjWRcB0K3AeQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0VlL/XGjPiZJFSQZi2R2NCKtk0x92zGmC91T6zgaC9vktJ+Py
 zpkEn+1b60cx47vaTasrWHmr9TjZYZdCVFernzXaoMVf/MuetocPLOs6I9yWDH10yK4/xx6EhFJ
 d1pNeHL7UoqgiFcQcJhP9nGy37xYdbK1E3WmU9nPoOJ1plY03iFE1qsBhQ6oDwQsPZk/ntA==
X-Gm-Gg: ASbGncvTsp1KH3Ly4KPpAqRap9Q7/eVpJt0+AEYnmeMQ178qw4eJHepNX4dw0O/fmnn
 lb2KVN/Ut7UHQwmRgP9V90OVRstLdf6FPdptV0BGlgDjJ2r5RDYNfrTExyDBHbACH09C1yrudFi
 5jqNUpkf6XAVtxLVqVxVgEaYPqqmwTjNRwOi0nQKxtD2U3eEzTOIAL2Z810ld0qWupkGjuPUmbg
 Aw/iiXqd/wHoE1BU8oL38rK1qnsz3wxrxlbUIgDgkRI3X/CcXh7xXVHDnN9aljjMyrSJjKmAdGr
 8P5QTC1lbeNwq3MPN+gNLHInN1bjOM01PcfhKOL34CvRWAYdTwMQQpPMewZETfwF7iNBds7b+hs
 TU5LCeSo7y5P+a6GGYMh0xYkLDX0tYkPo
X-Received: by 2002:a05:6a00:3c8c:b0:77e:d2f7:f307 with SMTP id
 d2e1a72fcca58-78c992116c7mr845542b3a.9.1759437530698; 
 Thu, 02 Oct 2025 13:38:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhslu8A5VT8wFaS2qNtZbxY38+uYrEOLOZI2YFZUzBLIBrm8UHrrp8gR7lGYANij91N5/Faw==
X-Received: by 2002:a05:6a00:3c8c:b0:77e:d2f7:f307 with SMTP id
 d2e1a72fcca58-78c992116c7mr845516b3a.9.1759437530238; 
 Thu, 02 Oct 2025 13:38:50 -0700 (PDT)
Received: from [10.226.49.150] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-78b020537e0sm2939261b3a.56.2025.10.02.13.38.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 13:38:49 -0700 (PDT)
Message-ID: <c8caad3b-d7b9-4e0c-8d90-5b2bc576cabf@oss.qualcomm.com>
Date: Thu, 2 Oct 2025 14:38:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Introduce DRM_RAS using generic netlink for RAS
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: Hawking Zhang <Hawking.Zhang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lukas Wunner <lukas@wunner.de>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20250929214415.326414-4-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX3tk3v7kDHFfW
 g2dzdZTQdxyXbdTSkLwR+6qaXjTLd4j7MEiFvxSR43m7O5YcKxQ1boCMi/SvrLNU6IOQ7qn+iEd
 EoaFZEy4I5frQo22W8NPSS7YHkgbtZIY6YdS1tY/YlfLFodJ9De/US9P2V4GQqT0yB0sa/bsylC
 ibj77N5uH+aEVdpIkg1a2u/9Axj4PNkKKhyck2acbFEHgex4n+nuuZjuiM5rVezo15lCVrclRM4
 JTSPBAbDxtJSvil0ZoyJvIrB/YhvlQ9I54Xw808eL9lSjYccuEz4A64kvMHN5WASqsYDrsKWve1
 9fWe2o3NkiGSaGihzY/faGfVitLKV5sJ5wvPWFeqmOlQxLgrNnkMIqth/RjIwBKAzG6+iE2vF5B
 /Txw4rS8v1+51H+mGH8PnFp9+/E9Vw==
X-Proofpoint-GUID: BXP665RbNmO7C6RcpaPemslLJOVF5B3B
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dee2db cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=U-pXEFeJcyFK5CHIgrgA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: BXP665RbNmO7C6RcpaPemslLJOVF5B3B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-02_08,2025-10-02_03,2025-03-28_01
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

I think this looks good, adding telemetry functionality as a node type 
and in the yaml spec looks straightforward (despite some potential 
naming awkwardness with the RAS module). Thanks for adding this.

Have you considered how this might work for containerized workloads? 
Specifically, I think it would be best if the underlying drm_ras nodes 
are only accessible for containerized workloads where the device has 
been explicitly passed in. Do you know if this is handled automatically 
with the existing netlink implementation? I imagine that this would be 
of interest to the broader community outside of Qualcomm as well.

> Also, it is worth to mention that we have a in-tree pyynl/cli.py tool that entirely
> exercises this new API, hence I hope this can be the reference code for the uAPI
> usage, while we continue with the plan of introducing IGT tests and tools for this
> and adjusting the internal vendor tools to open with open source developments and
> changing them to support these flows.

I think it would be nice to see some accompanying userspace code that 
makes use of this implementation to have as a reference if at all possible.

As a side note, I will be on vacation for a couple of weeks as of this 
weekend and my response time will be affected.

Thanks,

Zack
