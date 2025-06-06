Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA735C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 16:25:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9742610E089;
	Fri,  6 Jun 2025 16:25:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="S6NAfD7H";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E50710E374
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 16:25:50 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9I9t018552
 for <intel-xe@lists.freedesktop.org>; Fri, 6 Jun 2025 16:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zfn1QVQKiLHUIdJ2K7+OnM+Hl764UqzsTlMn1/g/KYQ=; b=S6NAfD7H6C9Upz4z
 RNcyE5eEnPxff/4v2v7cXL5+iiHXDLG5eumGcPeSMpXSJD/KYBm9jeoKzQ4YV5tS
 Qa1raFYpBD7IKF36d5fB1MMeyYZJgzc+UF2d1aILh7bLIXMc06hJj212cgnj4ujC
 53Xq+Ke2VEuaz1HNE4siV3/RTEVzbNBHee9M8/H4gSsCZPAcD3L4QW4VRsRVcBPJ
 tctFiUDTF/UtLxLf1j1ZcUSOJAxvuh14pCFbRqeXpsq0mR5Qb0+Fe746Yhk9Un5z
 qXAqgcremyD+LCUANLA9ND5eTBBMODF45wwCP7Vnzma+vV5EC1QkuAlllEZrw4wo
 zQ3K7g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nw61f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Jun 2025 16:25:46 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b1ffc678adfso1493686a12.0
 for <intel-xe@lists.freedesktop.org>; Fri, 06 Jun 2025 09:25:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749227145; x=1749831945;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zfn1QVQKiLHUIdJ2K7+OnM+Hl764UqzsTlMn1/g/KYQ=;
 b=Ijr9IjPPdevbiSl6j+3e2VF2QvLK01eTU1zqwTUiwe/X9Dq7Ib03HvvZE+FhsruK98
 4Yq2S0mK3WxCpwtERGVnew0UbAl0UHsxsxCmUdE9Pw/qPoyFsFk789lGcBOhGpr74j/1
 s12uVedTegYyg7R3hpYLuBT40OzowUdSFqdcH6KPeJvbQRJ5OAj3xAIDEB/YPvfOO6vg
 sHZLHvo4jK6n/qIcpkolSeeUuUOtbZAQCeTyJoIjyRAnOlQnZ0N/nIeqlD5hTu/39m0b
 O7GIkn54tOzY7Lcy/SyUPaOpLjGNSSbmUB5AcmoSRJpn7DrLLc9njT/28ZE/BXfvq7/I
 L2LQ==
X-Gm-Message-State: AOJu0YyukjgjmNi41vfreEN458xengzcaAIPMwWpkaJXV5oAjqE6oI6x
 BYQ9sggpYQTY7U+6cu0Swnw5ZgLX20kfQfFfZvuGM8WgzVUgDlm+y7jWWrcTsXUZ2BOFwqrdN1C
 vPURftHRJR4E5dDTAWI5Yx2SQ3GfuiEuNbdXjMVeeIatkSCdUZgPzlREXF2kKjCikfsU053bAGD
 GY4w==
X-Gm-Gg: ASbGnctYuEiGEdxSPtRrRIdxz1FjuYOwgR7eizRxnzDzZ5ex17Gr/7lJthUGQkR6HgI
 p5TgVroUNERCFtLuTV9fobMuaopIa22sBxdH7hGD/kkHQqubKcEP87m7vvcNRNbrO6zQ1zn0f7n
 hexkUc0GIr4kRJfrZGHaaYcBTNWdfRTlQW//5CZGyj/ozCuMW0qCtBsw0proHUasBgrvYlQQbV8
 kVfPElRwcdTzJIuppcw72FCGE/l8GBf39zUuZt4IigHYhTf6twJoACpBF4OeQE6pT8xWPaqq90e
 BfgSbjhPAg00JlKaauZRjJj5M7tsVl7GRzZcVXJJ5QH/x+oXajM6iT2c1iQjgw==
X-Received: by 2002:a17:90b:380b:b0:311:ffe8:20ee with SMTP id
 98e67ed59e1d1-31346b29b0emr5977873a91.11.1749227145021; 
 Fri, 06 Jun 2025 09:25:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5/TnYlvyb4M14Pmzr8iKZ1ci5qsNHCWuKvIK0rgVK6v7M1LCvE2hfrlqwqQfHjtlm+gAmw==
X-Received: by 2002:a17:90b:380b:b0:311:ffe8:20ee with SMTP id
 98e67ed59e1d1-31346b29b0emr5977844a91.11.1749227144596; 
 Fri, 06 Jun 2025 09:25:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603504efasm14229585ad.221.2025.06.06.09.25.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jun 2025 09:25:44 -0700 (PDT)
Message-ID: <577fc3b0-6e0e-48df-8f4c-7ac2e160080a@oss.qualcomm.com>
Date: Fri, 6 Jun 2025 10:25:43 -0600
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
X-Proofpoint-GUID: 54QIo8dcCDRpDCnqPWIkMVUu7bS0T_98
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE0MyBTYWx0ZWRfX++466cDA+2nh
 MV5rNObkE4G0+n1pOE6hy6ww8+C3E3Jv6OreNL7mdCSWbi4XwPImtIKV3Na5nEQ6xOFi6GQvJEa
 ALMF2sMcC/AqkpGtwtDNosd3rc3ul2O7GeQtaPM7F28NuzML7lh4QZgGsTjBeiBJoyIQuCq88bb
 6UgnPsQgqInUCiY13ouF4jPHAOBBbkxJtYZ37p7iHAX2ySHrIrCE+ehSm78AwcqjPDP+ZW80+Md
 5NXGXhstTJAuWqHXqQIxajKz9Z0K2EhrjOQmWh03HVNskEEhtVggicof1fT2VeqbGvzcanDN7gA
 l3Qd1FrE9vBKk5kXknFqiANU+/viceZxmc3FlXuyN2bIdE7XFj8QOvDJ9snR9vg30m6T3LzUWAU
 tDpfgRdEXP4fCEVnrzIg52r7CFMBpznzfr80YHBzCq6Mwft0K5cvl5vcsgy4tl4kxX8DFcgj
X-Proofpoint-ORIG-GUID: 54QIo8dcCDRpDCnqPWIkMVUu7bS0T_98
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=6843168a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=-sWgwtkE3efGhls0agMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=968 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060143
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
> 
> It is also entirely unused, which helps enormously with removing it
> :-)
> 
> Since we're still holding a reference to the bo nothing bad can
> happen, hence not cc: stable material.
> 
> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
> Signed-off-by: Simona Vetter <simona.vetter@intel.com>

Pushed to drm-misc-next

-Jeff
