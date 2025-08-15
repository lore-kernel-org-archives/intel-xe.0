Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE7BCA0EDC
	for <intel-xe@archiver.kernel.org>; Sun, 17 Aug 2025 15:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9120B10E0F6;
	Sun, 17 Aug 2025 15:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BI/F33ro";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65710E277
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 17:07:25 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIrlD022652
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 17:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 fmms3KUtyVKVAhnN5qKwpaFerSrUWOJ8TBMlYcAi6+k=; b=BI/F33row5q3cy4E
 n+l/OhhcHbfaNNa40HLZXKMOsdu5DOgjFMaBcot0NR5otuk4VA3IpZKxNh9VUAWl
 q0sCTNQLdFPD7pSmWFMx1sN3akmHEI+1RtstT8eIDc/nCRS8gwYgUrWq0jDonxUG
 oKt7FDOD+e9PyJR87RedqVrv5DFRUG61Nwu7APC8Q5mnLC1ghCCgPR3UETCW1O6s
 L+1kj6mSAgxoTEsYOdHliSaMfx4C3kNBUURd0d9Z8AqcKyUlDcmATbHfi0zB1tUY
 3f7zpDWKraZCiaENmaC9GJhJse9QHvwiTAXLRlOX2TyYjdsfTRtXFIsE2f2ZLv1b
 XL1fkw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdvbnfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 17:07:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-244582bc5e4so23495745ad.2
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 10:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755277643; x=1755882443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fmms3KUtyVKVAhnN5qKwpaFerSrUWOJ8TBMlYcAi6+k=;
 b=Zn18S3+9Si29WBJeik2wTwYgJEk6Cc3bBExifiAtaOaufy2/NR8qr5ZkIFF1IeiZrq
 eA1dUHOUGpdX+/U5S8DkV4IVqColS+h647kf71Kfb/PiLdiPgAuYboGssE5wID5NRTic
 0JUvbE6mN19S/Qj/WOH13ykJcn1bZn8ziCp8kC1r4gEkWuJWFkdfaprANR+8nlqG79iK
 SX2Dn2D1Mus3TnAuE93WpvdXNQoQ9co6gUulxK9pzt6Zi+Tn8gQ6iHsEQ3siUp8idbMz
 LYbcUSRT7IzR6QCqRSdb4fk14r5vc6NfudUF6Urpj+C28ikWTvnb1cza28SsfmJTQA5x
 U9dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsqjd97ZJnVd4ATTiMEb765nIKOrZ1ZH+kZzNsWDQ9WA1TnpuEqvfyRZCNHcNglNMrmHvowPSX6g==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywk2+iJIQJVpFWedXhIArrIeq7fvDTaFgVXjqgSTngXG8b6hnyZ
 4edx74XeA34YzooIJ3JsBaBith7vEB/sZhLZhQ1ShRwN5+r0eb+kchHBwWPvWEcpvOV/ErqiGZu
 Id1a8RbY0pMIHGCc5WhK/ym376MuC1wHRkuOP4DDPVNAiFZSThXyvALMzqMMHaHAXk7/VlA==
X-Gm-Gg: ASbGncvKnxIcpsiqFjCrCNeyC0HeLg9Xj5vR4SvObh3C+zdhqY2tOPxcM3yqcU0PH3u
 wYEQ4y+szxObdhE1OEAuIhhbRrcq6uKDw3/ndCG0nsiooxgEeaWZHlTkpO8dWO5Iy1s58+jGAJc
 HH0yPprLKxiI6xW4UNTRil0ogb+vPpIxo6gpJxx05vkuiB6EFeu8GWyl2tGk7BExqzPpfRGolC/
 +iJtNJPts5wPtHctleZyF3Nsk5nKjAHYVNYuh2LWCPYj6N7GfeH6IC44mV2gzHeGLSQNLbbEky/
 522s/fV4GsdBHhBFIS7fTxp7mdVF7Ke/osPH7OywDxuZfP2KQ6ahJD7/nw6Amb79Yxsv062z8lY
 ZC7ARnSXF5iIJN5aAqVBppu73CrPWF0Va
X-Received: by 2002:a17:903:388e:b0:240:86b2:aecf with SMTP id
 d9443c01a7336-2446d5bcdb9mr45910745ad.12.1755277643045; 
 Fri, 15 Aug 2025 10:07:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaOFtakU37Wg9SDWWtQ8YWpYfPI6CJQv7V+ryZ8jB//mJtKDTWSmgToKxU8a9rj7TklDrCXw==
X-Received: by 2002:a17:903:388e:b0:240:86b2:aecf with SMTP id
 d9443c01a7336-2446d5bcdb9mr45910215ad.12.1755277642597; 
 Fri, 15 Aug 2025 10:07:22 -0700 (PDT)
Received: from [192.168.0.105] (71-218-101-237.hlrn.qwest.net.
 [71.218.101.237]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-323311913b3sm4729308a91.31.2025.08.15.10.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 10:07:22 -0700 (PDT)
Message-ID: <b84ccec7-3971-4497-b563-21b4807f0c98@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 11:07:20 -0600
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
 Lijo Lazar <lijo.lazar@amd.com>, Ruhl@freedesktop.org,
 Michael J <michael.j.ruhl@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
References: <20250730064956.1385855-1-aravind.iddamsetty@linux.intel.com>
 <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
Content-Language: en-US
From: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>
In-Reply-To: <20250730064956.1385855-2-aravind.iddamsetty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689f694c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fSPwT3sq1xj71pYUIDnCjg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=uU-qHxDN0T-dEARUgNcA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: jUq8WuVRVtcLKG3pwIE-OTgnbLSNBkyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX2TXuE6v5eCzq
 1ri4lasuuOEfAIZzJ+gryjgj7dEynoeDSC3mCwLSQ1InvgGvRvZu2C5MIgLhOfURtdRTRgYr6qM
 6jEhltt0PSOKFe3/FM715OD79ebXGjeLHg55tcHoZZ+swDtADZCrgRn4Fii6vt/MCweZyTqHYs6
 0KPCMd8jOxYzlkdzhEtIeZ5jTJCKxhGDdBju6BEl85+7lUGpulJLfkjdJjCC4DW9j7WF9CJIbDv
 a0i0Z5y1D3HbSFuNofLQ0/mYUQI93BoTMR2AGUIDjqleOG92DbQqkEzneI0z2ufYy7L0hCUBOMd
 4Uqbe8lbIuzrg2jv6Xejws9FGgsST9Gqq1uxFmtMebcAySTx9y0FqISnYhY2RCcYCvA8SKUokSL
 /09CowAc
X-Proofpoint-GUID: jUq8WuVRVtcLKG3pwIE-OTgnbLSNBkyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_06,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-Mailman-Approved-At: Sun, 17 Aug 2025 15:59:37 +0000
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

On 7/30/2025 12:49 AM, Aravind Iddamsetty wrote:
> +static void drm_genl_family_init(struct drm_device *dev)
> +{
> +	dev->drm_genl_family = drmm_kzalloc(dev, sizeof(struct genl_family),
> +					    GFP_KERNEL);
> +
> +	/* Use drm primary node name eg: card0 to name the genl family */
> +	snprintf(dev->drm_genl_family->name, sizeof(dev->drm_genl_family->name),
> +		 "%s", dev->primary->kdev->kobj.name);
> +	dev->drm_genl_family->version = DRM_GENL_VERSION;
> +	dev->drm_genl_family->parallel_ops = true;
> +	dev->drm_genl_family->ops = drm_genl_ops;
> +	dev->drm_genl_family->n_ops = ARRAY_SIZE(drm_genl_ops);
> +	dev->drm_genl_family->maxattr = DRM_ATTR_MAX;
> +	dev->drm_genl_family->module = dev->dev->driver->owner;
> +}

We are interested in using this infrastructure at Qualcomm to 
communicate telemetry information for the AI100 accelerators. It would 
be nice if this function could support drm_minor accel nodes 
(dev->accel) as well.

Thanks,

Zack
