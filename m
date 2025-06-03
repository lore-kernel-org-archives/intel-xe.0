Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A6BC5AE59
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 14:43:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C6F10E20A;
	Tue,  3 Jun 2025 14:43:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CcPhxPnl";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFA5D10E1B7
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 14:43:52 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JI2W028422
 for <intel-xe@lists.freedesktop.org>; Tue, 3 Jun 2025 14:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WnAaptpZ09VUKJNzbIUmF1fcjudI6kmHz2onAvseKiQ=; b=CcPhxPnlpzXchT0W
 rYpRiNGmoUXzztdK05haJ65s3m72XJKjoLc+gYE2LGHbQC8QvNb2ESa6erWDTmfg
 RKFWBOyFhX/vsFZ6blP8WaDxYopvSA7kOm7nThIMU6MY1BKvtT9FVbXhrxd20yDs
 PjlWNm6eEH/LM3epvdBwLNNqLI51Gf4srrP39cZwR7KzQFVCe7AD80FPIfqf7+kg
 o12HJNPY0bXX9WtQBY2p4j+DUOl8i226inNMllUH4FlxeYHxTpSpeKDDNdpBfSe2
 Ru0V18h2Tg3Kocd0gZJxFEhPuscRr0pvlg6ZFgfpLQR8DN/PuruOXsy7jjq5K0RD
 Xrb2Lw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8ttx5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Jun 2025 14:43:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-73bfc657aefso4109214b3a.1
 for <intel-xe@lists.freedesktop.org>; Tue, 03 Jun 2025 07:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748961830; x=1749566630;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WnAaptpZ09VUKJNzbIUmF1fcjudI6kmHz2onAvseKiQ=;
 b=pLNzpN9r+J6po2kbqjNcvuiMxMrSqVIwFpSTv6MvKco2W1inIYI7mSj5UR7IeZfUIE
 ecT/Cw/bUpgJkkmyFHmMorXPg6sbJizd4RXiLAMdh9Wthn7PYywocu0YUfa9N1yFJ1as
 tk5kzDJ8pNN86OrJ5yQkVv8VNhR36ni9FaaOaNNPADlIf5YRKzfJRjCQKGG3Wr3+2AkC
 9cLiKb+zBOt5m5WfUR/lKhigioPQAuQy7XteGI+V2hgS7QuD1x3bacsI3cArcREZ7tZr
 oDfUY8ScIGpZpt/QJyzbaaU174OgunRsNresziOdZ9ZD8CUX6XGjNTaQ7fNCQkVVR8cs
 3imA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlOFZfZf4qTyIADkIDXgFcZND4IGF6YsNujLj/H/z68v7zH3Mwb8mZolczT+NSfWzoP91OUpyqAQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoFRiRUPs/GGKCC3qBEHrWYa4R7ff/2g4QAcnPNVdHRUzFzFM/
 Wgs7Cqz99AfwFUN3ALpARsYeOX9aryacb+DbHCNhg8yYjoDvvEk5xu1dJ0nZuVbEfC++4JmMyQd
 EspC9DbL7LJvUjft5EC3na7fiM+AoHXiR2MWer7LpLepvM0kQP/7hl9MF2aLeg8F0YlL0mQ==
X-Gm-Gg: ASbGnctrdKwBuDYUoYquN8MFQRP07rjsqHKACgkr91OFL6C524fPM/kJ25Z/1W0wYyy
 dV6suJQ7T4zPEhwbbuMonuvZBYYJXHJm53x6maXZN3jowjxnJ7ODs2kztsQxTEdX7/tCf/ODm/Q
 vVthUXe3Ls09Ca8ErsKlIflj4x7h+fc+ZnD/uukFwWvhTN0meE73KaD02K7SD1EDzvQGLUV0WOu
 xctzwCgAfW++MILCmCd36xgRYGy62yg7+nGQxzfefeij3/nx3hwf3f3V8PByWVKsdMc629iIdCA
 JYl5g4XTwY+YrVYGR8bloS7FhJEOpdJ8OwBp1eiY4QuIvIKx1YzBYDGKylrQOQ==
X-Received: by 2002:a05:6a00:986:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-747d1831e8amr14616276b3a.6.1748961830347; 
 Tue, 03 Jun 2025 07:43:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnmmTTOunEhNpY+I/AcenfSNyAkGLYDYgRj9GMjeyspcUOa3FEYxalBx5CvxbM2n1P45xvWg==
X-Received: by 2002:a05:6a00:986:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-747d1831e8amr14616237b3a.6.1748961829866; 
 Tue, 03 Jun 2025 07:43:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747affd41c3sm9788976b3a.149.2025.06.03.07.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Jun 2025 07:43:49 -0700 (PDT)
Message-ID: <40c64ab3-ac6d-4844-bc40-95c895df534c@oss.qualcomm.com>
Date: Tue, 3 Jun 2025 08:43:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] accel/qaic: delete qaic_bo.handle
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org,
 Carl Vanderlip <quic_carlv@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona.vetter@intel.com>
References: <20250528091307.1894940-1-simona.vetter@ffwll.ch>
 <20250528091307.1894940-5-simona.vetter@ffwll.ch>
 <70ad82b5-19f3-4e05-bc7a-858dafc563ef@oss.qualcomm.com>
 <aD24l3NoZWWwScx6@phenom.ffwll.local>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <aD24l3NoZWWwScx6@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0KUEEQNMvoxV9N74lGmQ59C7Kd6JdypE
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=683f0a27 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=He-YNEgCv3n_4aK0K0sA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDEyOCBTYWx0ZWRfX0yHlGQiA2js8
 QEKNjwUPxoVyLCDghF1za+RolPzDzOCtjZgZ0LWqD+nHIvHfXi4LCtqa5kal8Ti0dseWYL9mTpk
 8xZ/wzcn/7lUhDlvL5P7CW58upC7k1CWvALnHepo1BG/054zjFolmJ0/1ZQA2XzDwccFhBdKoZ+
 0NMgDG82N6MgKYob4gqv3MNGTjbCISlS12XYpRovz7QhdX4M/hZHZVRUIcwCK9I1HzSjZlnRpNv
 Xcp0LlPcX1gXDHeN/R6ARvBvLpn45TfCI3iexPs0eV8w5a8PJWTv0H03D0vKNY7Vja+0tAxJrdY
 mHJN0HBRyH+h8MLVFKbU5jbqbeP7mVZ6sNZNsh+aG7G1kDxVwBWrpCwJ54nHzKfEP2OslUteOq5
 zFVpknJQkh39QnqCHNk2CQ7cSN94XveknfKLREu36vZqxv8+mlCWNv0dbDCBg7MvcTpSIBBs
X-Proofpoint-ORIG-GUID: 0KUEEQNMvoxV9N74lGmQ59C7Kd6JdypE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030128
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

On 6/2/2025 8:43 AM, Simona Vetter wrote:
> On Wed, May 28, 2025 at 09:15:22AM -0600, Jeff Hugo wrote:
>> On 5/28/2025 3:13 AM, Simona Vetter wrote:
>>> Handles are per-file, not global, so this makes no sense. Plus it's
>>> set only after calling drm_gem_handle_create(), and drivers are not
>>> allowed to further intialize a bo after that function has published it
>>> already.
>>
>> intialize -> initialize
>>
>>> It is also entirely unused, which helps enormously with removing it
>>> :-)
>>
>> There is a downstream reference to it which hasn't quite made it upstream
>> yet, but tweaking that should be fine. This is clearly a problem anyways, so
>> we'll need to find a solution regardless. Thank you very much for the audit.
>>
>>> Since we're still holding a reference to the bo nothing bad can
>>> happen, hence not cc: stable material.
>>>
>>> Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>> Cc: Carl Vanderlip <quic_carlv@quicinc.com>
>>> Cc: linux-arm-msm@vger.kernel.org
>>> Signed-off-by: Simona Vetter <simona.vetter@ffwll.ch>
>>> Signed-off-by: Simona Vetter <simona.vetter@intel.com>
>>
>> SOB chain seems weird to me. I got this email from @ffwll.ch, which would be
>> the author. Where is @intel.com contributing to the handoff of the patch?
> 
> I work for intel, so I just whack both of my emails on there for sob
> purposes. The intel email tends to be a blackhole for public mail, which
> is why I don't use it as From: for anything public.>
>> Overall, looks good to me. Seems like either I can ack this, and you can
>> merge, or I can just take it forward. I have no preference.  Do you?
> 
> Whatever you like most, I'll resend the series with the wrong patches
> dropped soon anyway.

I think I'll apply it this week, with the typo fixed. Then I can 
mentally check it off my list as closed.

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

-Jeff

