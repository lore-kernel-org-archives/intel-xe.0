Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B277CA0ED1
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 12:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CADC910E93E;
	Fri, 15 Aug 2025 12:26:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lez1kd7j";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8825610E896
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 14:08:43 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E92CGl027100
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 14:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ZEGtqvxxw89PHwWdjWp85UObLPhN0Lz+7+R1AJ0eQ+s=; b=le
 z1kd7jtLnvmCV/BUZyYxdHTJKaxAnV2XK9Oxsnkeo65rB4HAISUFeXLXEkWRUkZ5
 tVze3hTJhYr4EpkUR675wr2mUYYJdW5FzoAiUGJtr11TjUEUij6bwXsDgc0fhslm
 w33XV5UjZ3Y9peCwOvhFgMMn1nhY5u1UbR7kvyej4sJAiT3QHimebZQ1zA5m8zeH
 WlbQrRFzOBu4TH7cLWHsCkuUqeV1N1Zb5SOvxTIe3RsDQzMZ0IzL4lAp1larOlis
 sAsRmODI7mCePs/ZrIR25zTDLX42wuLpzWJDU3kHqwKAHDpBvmqzJO6ondFShb4h
 /qF8DpzDke7588glDtvA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjusjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 14:08:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-435de80989eso419954b6e.3
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Aug 2025 07:08:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755180521; x=1755785321;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZEGtqvxxw89PHwWdjWp85UObLPhN0Lz+7+R1AJ0eQ+s=;
 b=m9tsGpMjJBbXJyUrB5phZvES44Za+1uDgVZ4S5fGBYB9Yp9CQTbRLJYhjoawwgnobZ
 B1sJdmpfeJ4VTY/7d4gMQfEWuFB5mTXECvCx99DWcHIJRbIdbOGEhaVend6gfzEI89aG
 vooA4m1XApcOoQ19OWYzQNRWK976TSuYfQAwGoe0o5Bc5uJtLahHbH9ee68rfOxMpJGk
 iLOegtiohBojW9F8OgS8rslalEvNzEnqIyqcKVh3K5fjyVdCY6omFz8xSpKOC2onWSC6
 BvstoIhRa+3bv0iwQQMVeauTNtcM40oXYkZsodgd+mCdv6onKs0KqyUF8IMXeZzwFlZ2
 oBbg==
X-Gm-Message-State: AOJu0YwVM+EJCCmywyoURFNs02q1ToNYhiMEidg0GkAnAs3lCOhfTkQN
 4fj1HUc3PsvoqJbsqwCjsYb9jrp8cj7J9ZmU82sgfsxZzEHJYpyFrmB/UPccDcGZ4xAEyv3QfhY
 8hyHsGgSzuzjUSC+l1K8xLRI6Opf5MA32JSYtPTV+KoBCH0NLDLpMbJv6clVo6pV6HymrrtjIjf
 I5s1HduHS6N7dzq/InXf5yqkwCKXOEzdUa6t80G7w2ocgl
X-Gm-Gg: ASbGncvbH5yBaH/6j2RNzJBcxIw6wIWalr17q0xt5nnyZfHr+MqVbJFidSFTMzrbidU
 4E2tMTHYj0rfQaJqfQ+0F58w505KGc3EqlrZgYQMS6tVL2fnVafKIiGZOEf91uM2gk3h277gad0
 7RbRgvuVFrLzgWVLumLNg=
X-Received: by 2002:a05:6808:221e:b0:409:f8e:72a7 with SMTP id
 5614622812f47-435df7fdfbcmr1815416b6e.33.1755180521456; 
 Thu, 14 Aug 2025 07:08:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnwGyQe00Sdph1+bO47gAmxP0iTO5zlZHRdKGWD4e6TYJ1HxKhUH7QDY84M+iUNUDCZDe7SfIB4sFnFnnY4Do=
X-Received: by 2002:a05:6808:221e:b0:409:f8e:72a7 with SMTP id
 5614622812f47-435df7fdfbcmr1815381b6e.33.1755180520932; Thu, 14 Aug 2025
 07:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250814105950.2177480-1-himal.prasad.ghimiray@intel.com>
 <20250814105950.2177480-3-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20250814105950.2177480-3-himal.prasad.ghimiray@intel.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 07:08:29 -0700
X-Gm-Features: Ac12FXxgZZlfTLhPxicceYSjFANYtct3AaVifZ1TVVl8nq2E17tgu8O0E3x4468
Message-ID: <CACSVV02AWFLNNQ2GssWE0M45WD5OGcU_H=RyiR_wv4iKReWDUw@mail.gmail.com>
Subject: Re: [PATCH v7 02/24] drm/gpuvm: Kill drm_gpuva_init()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Caterina Shablia <caterina.shablia@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfX76HmKs9On/Z2
 gq0eSlgEItrG9EiXVYA8mQF81sR7Bc8rSd6iSJXF7H4y5r202SPQxHuo4CVkRgl3lbDMu8IHF3d
 cGV196EQGoQTLPN4DusKfEH6gvOh+wSRWHTM7Pj7SnA+GKXN/B+WxClZtTTJvgGkoLpQZSRlnmk
 0b17Ec1eMgulSzUIcL6e3cW2SC9HFuTjJoCZe+QH7atouRz74pLa8/2WQHuDGjWDaf/MA+OkuWh
 SP/wiRGE9UwHykiGcpKNgxMnUa3SGgbkVFarM7mKtu81mjnb4MHRPKm5JOQ5zaSX3xiSFzgb4cI
 ULW6WPl1khs9ZmYPLVvk3ecF5hFqP1v9cjRD84D/KNZt+UETI45IsG8B7OWMgYtZhNZC2Gm5HCw
 wC/mf5//
X-Proofpoint-GUID: SYMDq9t-A6aPoxrFoxb44lxk3zxZPwLe
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689dedea cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=QyXUC8HyAAAA:8 a=QX4gbG5DAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Po7tXBdBVODnVSju3cEA:9 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: SYMDq9t-A6aPoxrFoxb44lxk3zxZPwLe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1011 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074
X-Mailman-Approved-At: Fri, 15 Aug 2025 12:26:21 +0000
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 14, 2025 at 3:32=E2=80=AFAM Himal Prasad Ghimiray
<himal.prasad.ghimiray@intel.com> wrote:
>
> From: Boris Brezillon <boris.brezillon@collabora.com>
>
> drm_gpuva_init() only has one internal user, and given we are about to
> add new optional fields, it only add maintenance burden for no real
> benefit, so let's kill the thing now.
>
> v2
> - Remove usage from msm
>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Caterina Shablia <caterina.shablia@collabora.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>

> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c |  8 +++++++-
>  include/drm/drm_gpuvm.h           | 15 ++++-----------
>  2 files changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index e106428369ef..3e97d3d61430 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -371,6 +371,12 @@ struct drm_gpuva *
>  msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
>                 u64 offset, u64 range_start, u64 range_end)
>  {
> +       struct drm_gpuva_op_map op_map =3D {
> +               .va.addr =3D range_start,
> +               .va.range =3D range_end - range_start,
> +               .gem.obj =3D obj,
> +               .gem.offset =3D offset,
> +       };
>         struct msm_gem_vm *vm =3D to_msm_vm(gpuvm);
>         struct drm_gpuvm_bo *vm_bo;
>         struct msm_gem_vma *vma;
> @@ -399,7 +405,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_g=
em_object *obj,
>         if (obj)
>                 GEM_WARN_ON((range_end - range_start) > obj->size);
>
> -       drm_gpuva_init(&vma->base, range_start, range_end - range_start, =
obj, offset);
> +       drm_gpuva_init_from_op(&vma->base, &op_map);
>         vma->mapped =3D false;
>
>         ret =3D drm_gpuva_insert(&vm->base, &vma->base);
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index a9fa44148e0c..05347ac6cc73 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -160,15 +160,6 @@ struct drm_gpuva *drm_gpuva_find_first(struct drm_gp=
uvm *gpuvm,
>  struct drm_gpuva *drm_gpuva_find_prev(struct drm_gpuvm *gpuvm, u64 start=
);
>  struct drm_gpuva *drm_gpuva_find_next(struct drm_gpuvm *gpuvm, u64 end);
>
> -static inline void drm_gpuva_init(struct drm_gpuva *va, u64 addr, u64 ra=
nge,
> -                                 struct drm_gem_object *obj, u64 offset)
> -{
> -       va->va.addr =3D addr;
> -       va->va.range =3D range;
> -       va->gem.obj =3D obj;
> -       va->gem.offset =3D offset;
> -}
> -
>  /**
>   * drm_gpuva_invalidate() - sets whether the backing GEM of this &drm_gp=
uva is
>   * invalidated
> @@ -1089,8 +1080,10 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
>  static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
>                                           struct drm_gpuva_op_map *op)
>  {
> -       drm_gpuva_init(va, op->va.addr, op->va.range,
> -                      op->gem.obj, op->gem.offset);
> +       va->va.addr =3D op->va.addr;
> +       va->va.range =3D op->va.range;
> +       va->gem.obj =3D op->gem.obj;
> +       va->gem.offset =3D op->gem.offset;
>  }
>
>  /**
> --
> 2.34.1
>
