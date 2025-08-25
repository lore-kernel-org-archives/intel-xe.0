Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B797FCA0EFA
	for <intel-xe@archiver.kernel.org>; Mon, 25 Aug 2025 17:31:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DA1210E518;
	Mon, 25 Aug 2025 17:31:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbQOvtIm";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747B610E518
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 17:31:54 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PG6Vue026003
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 17:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Yi6k+/Sdd3O++LmQoGjAXS8tWRplbAIkwPndWWaTDRI=; b=BbQOvtImvKfdtkzK
 9aaK/zBImPvfWRVdeA9sbSRjUYn1mSuW80872e8AyQ27X6C5bgxaYmnJK2lfqvrx
 50qIJg6G8xR6VIWCB++k6biU7demHVHIUvgUVXyOuIteU+FO7PzQ3TdsEz3fdPjM
 HYqdlOuTIaGAz5Gr1l+HwmvoocNfvkVDhh+Li8g9a7Gk4dGGjJPLf31UivSkK87P
 pEdUDf0SCsQltmrAq3nLfpE27A+jG8TfGVaiZ5/rYwuCsq8lTPUPbnd8HYxKV0we
 tMzPvXbNoXnyF2/12cMdM4GtBkc/vATEXBZutrcIjTe51fv6eGadJ374uU1eDDs4
 igHhWg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x85xub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 17:31:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-246bcd0a112so11141615ad.1
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Aug 2025 10:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756143113; x=1756747913;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yi6k+/Sdd3O++LmQoGjAXS8tWRplbAIkwPndWWaTDRI=;
 b=TmFTCuja18/W7n1f1OgUTWqqs6s7f+wPRMtEXZOk6X79/eLRe0mFlkSFaoSzhrr0gs
 nzFhCW4dg8RHLM81RUZbj+zQ/CjEaAwvfVMuyCr4A3kdKkQqEvaG7HDUCtOb7xn01kTM
 I39TqpY17GPZQGL5aI0+M7Fd5kC5IYQqIkBIKZQWqIqhJA8k/RsiwS7Jc+fB3Y8GpY/G
 3ymMlVEj2lgNZ7M5SRL6dW+7/edwY1OIi//M8B8abxwHYYc41q4WsEr4RksUDeN/vcTN
 0ILcN3zCszUSAD47iNDdSLw3obMzPGpWES9mssofAjBeEJT7GTxnPWR7VU1YSpLQU0u4
 xoLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOQEx036V7av6zUVcM7ETvmqpqdYk9cB9fmNpulenXRt69eVz7B/pjRoicas7c1Bl0krtyYVhcKg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcOlMMimD0GYCX4HeaZAf+Cxj+9Unkv50bIiDE7Z4CAjbVCIvA
 tvEKCvCjXAoiF+P5vG9qdO8v/9SmzIRaXiyryKwO5eNF4kvhIZkr9UrNGAzCQSH+ZzYBuPfUR4F
 7hrPqkiWfcPo1/UoA3KzrrR3zV9xynt9l3nh5KdDrmv0eb1t0JhqIFXP/BkaN8tVbdPtHNw==
X-Gm-Gg: ASbGncvfedo7+H95D8lEkaejULHFvu+uxTljuIXVHjbc4WGlnM5s/1bqfC+ccCwvM98
 DrV/4PAu8kbT+sC+vFU3uThVY0y+DbDK6YbQD3AHA3SvsgXlpzDUOtEWxl8StBxbZxpKlmv3xZu
 MGQHwVQIlwutr5E7MSFdqjLtwBr3cB9X1cBhlDTsQPImLbjVmTidTw/9+IrGDqSgX+8fk5EQkgW
 DPyHo7yBITcJa9m5Qe6QcMQqfTZFBIwsvYZaU2zYxRgkPHNmmnvwwxinfVMXZAukZ02c2TzKZqu
 ggWMkl1kFfjZuILukH2CarGXVld+263WZF+0m2EOTxOJbUkZxcyB3zLVbsjzpbaCZSRixjm0U5n
 YeSMyMtmsxq93scokEadWKU+LSk0=
X-Received: by 2002:a17:902:cf4c:b0:246:7d4c:9f90 with SMTP id
 d9443c01a7336-2467d4ca180mr125172605ad.6.1756143113015; 
 Mon, 25 Aug 2025 10:31:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHCj9RYgtm6uGodfQ7CuZA/ZASRmW3qOx+WCjIx1AkSj4Yt/AjpQUG3ygOE+EekbJyvOtHrLA==
X-Received: by 2002:a17:902:cf4c:b0:246:7d4c:9f90 with SMTP id
 d9443c01a7336-2467d4ca180mr125172185ad.6.1756143112511; 
 Mon, 25 Aug 2025 10:31:52 -0700 (PDT)
Received: from [10.226.49.150] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466889de07sm73428935ad.149.2025.08.25.10.31.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 10:31:52 -0700 (PDT)
Message-ID: <b92002ac-0fc7-404f-92b6-6bfe9964dfac@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:31:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/5] drm/netlink: Add netlink infrastructure
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Hawking Zhang
 <Hawking.Zhang@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Michael J <michael.j.ruhl@intel.com>,
 Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
 <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
 <b0447abc-5082-4c87-a21d-6a43de5c788c@linux.intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <b0447abc-5082-4c87-a21d-6a43de5c788c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6yDPHl-Y_ccMqtFyHcgpQjEQm9-yWoxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX9HtBv940bDUo
 a7zA9LKr/rtANIegsEE1wKO8l73Ofl3iNwaksguI/n0GDOlg+7JbbrEy9p4HM8tvFYvxRyh2mIQ
 0ov2pJbHzt9tRtEMbOfWwoidKLIoTSUaR/URaCQKQa8ALykIf9pLFa1TaQ0UfGxs7zbYf3PjFh9
 s2/CSe4ioz8QRECD8Am942hPD/0NufPjjHLB0JRGzFx7DIroN4Ymsti0XxABoJuCGPn7MUX9VCn
 SpwX/2pCedP+VpY2LkV3QCFUyK5O9m6b77Cy1Nzw+IEkQgj5SyncCgUEXUHAtHtL9lrISv/8TFK
 rkqR/VIyc/fz/VOq6Ar78R1ROoi9EhzdbdhqGOdgTlKqNlKaDDWppVv3/5xUq8nxQZZpfeyVe/s
 T0MEm+tn
X-Proofpoint-GUID: 6yDPHl-Y_ccMqtFyHcgpQjEQm9-yWoxP
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ac9e0a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=WtnXQbCkuiZG9bo0y7MA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
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



On 8/21/2025 3:45 AM, Aravind Iddamsetty wrote:
> Glad to know the interest,  at present the code does create drm netlink
> family for accel device as well, but it is tries to register with the
> drm primary node name which might not be present for dev->accel,
> checking for the "DRIVER_COMPUTE_ACCEL" and registering with the name
> will fix that.

This is correct, trying to access dev->primary->kdev->kobj.name through 
an accel device will cause a fault. I believe your solution will work, 
and the node name can instead be retrieved via dev->accel->kdev->kobj.name.
> But also to bring to your attention the current series focuses on
> reporting RAS errors and hence the commands are as well oriented towards
> errors, anything specific to telemetry needs to be added. Do you have
> any thought as to what kind of data and what kind of command support you
> might need.

Understood. We will likely be interested in RAS functionality in the 
future but thought this would be a good avenue for telemetry as well 
since our device currently has a functional RAS implementation.

An early prototype for this might add a new command for telemetry and a 
new policy with 4 new attributes: the type of telemetry to read/write 
(e.g., SoC temp), whether the request is a read or write from/to the 
device, the status of the request, and the telemetry value read or 
written. As actual telemetry fields are likely device specific, these 
can be defined in the driver's uapi header and passed opaquely through 
the netlink interface.

The above description was sufficient for an initial prototype on top of 
our driver. Mostly, however, we want to reiterate our interest in these 
changes and will keep an eye out for a future patchset that incorporates 
generated boilerplate from a YAML description.

Thanks again,

Zack

> Thanks,
> Aravind.
