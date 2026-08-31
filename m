Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FCBC624D4
	for <intel-xe@archiver.kernel.org>; Tue,  1 Sep 2026 13:43:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A8310ECF4;
	Tue,  1 Sep 2026 13:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wvr4TpYc";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QMjHVEmz";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08FB210EAF8
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 20:59:34 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67VIYpr5072408
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 20:59:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5eH2tkoqrxEkiPHG70y7OV/Rv6ro3jsgF0WXE4qtlyo=; b=Wvr4TpYcqqNSNW/c
 7MbI/noBMgaCUGPiX4RNjBSbAAlI6cOG626h8HzDCimzMCq5DR6dyRBuef3EKvWJ
 pmyeItpWbagjmktj0sQR6TmfTyhz4Dz29ufjJuG9MXRO+8V2/zrD4bGQCfC3APBw
 hwOiP1+IW8UwARVGAPJMqbMy2QKLnpPNKMrcQVuTLITjDisdbqmvph7Fm3vAyImW
 e9Vxp5snkUtEuHev9TE+JQA+XS6pKAnAsKEegcI+Hzf/cHJElkii+UrFnGPWRrOh
 gCXzQJj3Zg5Cx7jUdlKC11q5LIuyIRQ7DYidKoga5yvTGmSj/rYaFXi0krGH/xVc
 IKwn2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6yau583-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 20:59:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-92ec3146553so951596885a.1
 for <intel-xe@lists.freedesktop.org>; Mon, 31 Aug 2026 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788209973; x=1788814773;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5eH2tkoqrxEkiPHG70y7OV/Rv6ro3jsgF0WXE4qtlyo=;
 b=QMjHVEmzllHG9ePlZJkwEtyUGkuj2tv8ltNjxwD5V0oQP9BUUckI9Ewj58fiq2iTwW
 ujcZPRk/tsl31thKuBW1QQE9rsQIdPbeEadQtt5288EaZCFrRBD9qS06NYRHPdad6XIR
 y571glQUWGmwEucdnT3F13vHGz90eY249kMBOxff7/ojFmRYauYgDoixT5ZGeDNzsYRs
 8otHrUwfslkTFbMXNSNf9PDtRMILUHZwvqw235E0sVHS4AWYMQYeCu2KOFHFyQDOnca1
 yiV4rwvSi4wXCasleG7JFnSDE27LZ+JDwaKK9yKUBvPPE0ObsLHhz/Eyz7GFhkqjGAD6
 k2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788209973; x=1788814773;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5eH2tkoqrxEkiPHG70y7OV/Rv6ro3jsgF0WXE4qtlyo=;
 b=m3m6Kd4K2MGINuCaib4EhQs8YQXzvF44drM94yZecV17KH+tINiRGa/Re7hv5lefFw
 b5nkMiO181K5Hm4aYAgbO2s5Cabgjfm0yhSvtoYudAFvPb5fpVOWmxqebgmLoT8jWvq/
 xNjd4wyN3VuYzB0K5r9l+K5Qdv1bvyuZnObRjyA1dwz2538lXQ2FwZS9cqTA4WEkY/Ev
 Mj/3W/4H5hvKuncMdcuadn2v58zgfgGx0pN8zxGI2IvajPimQSgoy17CztGSSMMBHFqx
 f3Jkn6WhOEbvy3/h7YNctx6ltaciLuR2+RDquE5ixaEfBPVHsBc2V5y7JqjhRjDgMxDx
 6xSg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpqOdJsE/ZclTo/KniqIjjpubMZWqGpWZdC+RB3HJizlO+xve75Ky2QS0eNhCUpBKOSfS875w70jA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lCK6A79/gBOdS2mbvYHovCz4cnuavA/PjhN2eSflcML0YJ/CNC
 d7k2QPNG53wKru5aWuvKB7fIyDh2fhOnOUjzaHTbdb96TX2s9xPNyieyf/7mZAtqzekGoEIHjml
 8enhujtRoETNXjRuA2ROY2iXQYi1GL/q8a9pMH6sJlKdnI+xbMwEZDRTrQGqpfSf2+qbirg==
X-Gm-Gg: AR+sD13D1AkraOl8C8JzZnkhYMVEZi9zJ34udrgEcxUTbmxoKtgNX/vjdTIk85+8Dta
 b1ouzlW2WiKIL/1HxWI8A3Cl1Zvan/2jFQZ85pvJPn84Oomr5dkB6OJ0CcB9Pb39raLVTtuzY3B
 LUoefVnYNK/VgiZRmDxefx8hBS8E0SmAa4hde4Qqso3/fc3Bb5kzKlJU1P6T8EByC/mjXxOn94D
 thFr6P4RCSdzRvRtmBtoeBHO58ipiAQsOYJNIoe+M7qpXfDDohP4Hqt3D8IKkQRR2tRFtE1PJp5
 Txr1Htzq0WRC/dScybCB82gOxD1wQLFq0618p5RSnJ+U0jTZIDzN09+Q+ZmIbPGtV3h8AVWHB0D
 zq8p7vu4DNj4BDj4lKGvJ3CGz/pjmP46z7F4HCw==
X-Received: by 2002:a05:620a:44d3:b0:937:75cd:4627 with SMTP id
 af79cd13be357-9391395431fmr3175556285a.32.1788209973218; 
 Mon, 31 Aug 2026 13:59:33 -0700 (PDT)
X-Received: by 2002:a05:620a:44d3:b0:937:75cd:4627 with SMTP id
 af79cd13be357-9391395431fmr3175550185a.32.1788209972753; 
 Mon, 31 Aug 2026 13:59:32 -0700 (PDT)
Received: from [192.168.0.183] ([80.233.33.41])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d6eafesm277031f8f.24.2026.08.31.13.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Aug 2026 13:59:32 -0700 (PDT)
Message-ID: <da6868f1-1f9c-47a2-ac48-88dd160ae3e3@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 21:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Subject: Re: [PATCH 04/10] drm/gem: Convert drm_gem_private_object_init to
 return error code
To: christian.koenig@amd.com
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com, dakr@kernel.org,
 ecourtney@nvidia.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20260827124910.2245-1-christian.koenig@amd.com>
 <20260827124910.2245-5-christian.koenig@amd.com>
Content-Language: en-US
In-Reply-To: <20260827124910.2245-5-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4MSBTYWx0ZWRfX+MCU1kGuA46Y
 cArUIFHvOtJGGDz/neQ0kTbTiSYTxwY9vTM4dvmArReyJG2j26WOyCJGwCrZ9+RPWC17471uWtO
 Ffa7ibmPwNtCVs4oR2fo+YCOPOdeP94=
X-Authority-Analysis: v=2.4 cv=CpaPtH4D c=1 sm=1 tr=0 ts=6a95eb35 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=le/gl0x2G5+ma5yo0zCuxQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KEyuISjlM5fmf-MbB58A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4MSBTYWx0ZWRfXzOk5DxncPMlI
 cSyRTC0A7InphJo/NTu81nv1WE9/dM6J+cD2e/PS8CpYiJ3U8OqeQ34vSrJmrG1xv27/f4l+Qig
 bATWFYDvmr8D7Eh6alFAtXpw0Z7gT7nWWjL7tdvVYszswFVVeeUFFrHCAYTbCxgFoBDM7k16vSh
 RGd9ztVpS4ZIT0a1X05HIcjiffxXbg4/CnjgsA11Di+h+KPMyfU/NdPZAIxKDzCrp+6m4zeu2mZ
 amVjiC0ZIAfzmdwVj/7ccy9ATpQqOH6JeH0RxhmpO/ReCfpwVH2vyozMAycXEyJGYMheXgoBqqm
 CMxgCWOquytSZks+fr6CGvB+QNqp+ZOELNDJ1gE79ZbhmnSMcba63IUC8q5WX1jirR/1RzjF90p
 BZV0UmFy3lQDWRYz55tk23f4rMnV0c65SJbrW8OPCpWHgyzFiZES9YNDlru622kxv5Ld0GKForg
 uNQJ8A4gbJ/49MurliA==
X-Proofpoint-ORIG-GUID: aWozCg39LD0heu-L_ym-fh_tjlcst21i
X-Proofpoint-GUID: aWozCg39LD0heu-L_ym-fh_tjlcst21i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310181
X-Mailman-Approved-At: Tue, 01 Sep 2026 13:43:25 +0000
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

> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt/dmabuf.c
> index 8a1d6c5636c2..5b198162c588 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -202,13 +202,19 @@ static struct drm_i915_gem_object *vgpu_create_gem(struct drm_device *dev,
>  	static struct lock_class_key lock_class;
>  	struct drm_i915_private *dev_priv = to_i915(dev);
>  	struct drm_i915_gem_object *obj;
> +	int ret;
>  
>  	obj = i915_gem_object_alloc();
>  	if (obj == NULL)
>  		return NULL;
>  
> -	drm_gem_private_object_init(dev, &obj->base,
> +	ret = drm_gem_private_object_init(dev, &obj->base,
>  		roundup(info->size, PAGE_SIZE));
> +	if (ret) {
> +		i915_gem_object_free(obj);
Building on v7.2 with DRM_I915_GVT enabled will result in modpost undefined symbol error.
Exporting i915_gem_object_free() in I915_GVT namespace (drivers/gpu/drm/i915/intel_gvt.c)
should fix it.
> +		return NULL;
> +	}
> +
>  	i915_gem_object_init(obj, &intel_vgpu_gem_ops, &lock_class, 0);
>  	i915_gem_object_set_readonly(obj);
Thanks,
Youssef
