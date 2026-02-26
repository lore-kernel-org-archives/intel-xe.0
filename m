Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A9EFD8FD8
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 16:54:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2733210E9D7;
	Thu, 26 Feb 2026 16:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsecA1zQ";
	dkim-atps=neutral
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A5910E9D7
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 16:54:39 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2bda3b4318dso83093eec.1
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Feb 2026 08:54:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772124878; cv=none;
 d=google.com; s=arc-20240605;
 b=FxrP9cxZMtzmtA/dT87+1Hp3W3hfSFETZIf417jQszNUO+BgfxEf59hRgvIJdJdYOT
 Uh1iB23nQAB/WdJPXPjzfQamPv7yFoQO2LOqH4+F79I/M3UHg4sD/kTNSjkhmI3dau6w
 tmw3/arpEOd/OldVw1QFC0O+sLpuvFjn2SmiVO2uyGWgpYXSxhosC21k8uq3tr0ILmnb
 EjUGXIj2rZzTEuuCEPATSNOIuzK3Mfdq4DKrAQoLeszplZpfuxyDvbRcGN9L0mCdPDON
 iDFr4ZEow3A+WHdB7xa7Nc5IikFwEhBGuJab7ZNxT0xkOo5egkgoLWT+w6YFHMID5yAT
 Jf+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 fh=eDbkEz60HsyiBmtJsvruVBoqSpwStVnMPybjKpDp9ow=;
 b=ZaMCePBgv+/7E9FZrSXf45K8qaKuFjrwAWTRZLpKnWauELnbLWbYPs2qbpI2Ht47LY
 ZiBKTM0xaG8Ajz0PmD9hGpbcyBhLdvKat7brPmWS2EhTpaCgmXKKhn6u+fSDnlktjzKq
 EN1A1KJrJ3JkW/OvwdaTtYnPK6kbupimIDhKxzDRiwJxQxp8JPVZ9yAlLt37ywpNqUjn
 TBT/xSaD8QK0adGFM3N5acTT5aIx16snj6UqXzNtIM9GPqS3ku/B4qWUgsXTCkfRrm4x
 QMFHX+2KAa+4piyo7j0Owhxkp2M2RtAxDWqHgkOEAZR9pktiBVTuKjeLMHSctKhokwCz
 C/ig==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772124878; x=1772729678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 b=bsecA1zQKJaORF7opFUhwDHK8/F5CmhDrs4cMTf8kCB/Qd9A7IO3ubFjBuRBOk+0IE
 ETXIJ7lumShjWf0huZt4fzbO2tHzY47qsoiOXMcSWqV8LBikPRGIsqsnoRAS5koi1QcH
 onPd7O5VOlch3YfSjmt6/BZjlH7Sq711fOgeXsvueGaiYsXDOB+FTQucZGY/ITlzeihK
 M0/xlWEjJ6idR4Ecx0HDt4RQ2CDm9/QC1R4KFDVjBdJu3/dLNfNhtC3/feu+LwXwE3us
 AB/A3VIayIWQmSAYxE/SsiDLJ01DQeFcW8+3YgPOcjhWpXbhIHRIOPKer0dLB3kzITPz
 FhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772124878; x=1772729678;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Up3sT8qjuR5kM0SPkhMO2u8EAJVJK4TECaFQv8JLTOM=;
 b=G2cNFoNDw3FAinEcKXEfjC2o+iAt3yMS+L2OtxXqMrJ5FhtBpjzkpwNcNH7IZjspr6
 0LJ7VBvBx7mF1hsXniy4+yoiU5g8FAzXh1bE/Mq0xqDmOaWDekhZ+GdrUgTRvTsGtBXK
 VjEn8cyJj5YEm+WTBRdM7Hcze8N2jBvnY2TflQHrLu3Irq9Hp6q/FayFpTwVh87wx0KM
 Pc1Y9sk49U3jsa/MdRgGxYwzy2PE8PZkx4mSyAnUBbEenPcOMg2wPKQmHDXVOnPI0daL
 SS1+3Hix8jRf++41eSUuc02WlGofFjxz0QYbuIq/3V3uetPhEYopjHU0j4JcjAg7sRfk
 whGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7YL5qfab2LnqGj3+cIVWFyjXFoq506hkCEFziTv4agbBsT1bcWudciGMndMGAfDt/U0RFVPuN3Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlLj3zEnyIBB90CtlL3OXm1hYj/GcArX9Hgka4Q/OnpSP8l6ea
 mvngNAPCzJgBuxdgpqqRUgPH6clyMQcVxNTwXpFRKJ0uEEXfAZgSGVfoxQSWw63+db6zoFDv3fv
 /ABlWy490/xSL8WcKuwTmbHp2qcnAubE=
X-Gm-Gg: ATEYQzxZAPj3ux50JO0vAyPsfBdZitEDpchvDAGjDBB4Kypl/p2WiHiWROAZmFTQVMY
 LzyBZB2yEp/u+fNer4yuizBLdl/3v9d6JtKyXkSQVXMxh3MOv0aGglYLuK44daxUTvIdVPmQEft
 MSSv2g9vVwQ/RQtwhM+Vt0Bnw3NIw3ls/zBWv3die/jIvMsjn6J3E14/Dx/l2vKZnMvyilkAeGC
 w57wqkMTtSobCiOivIJSipAw0guUqn2n0FzSoEhWUB0s3W9he4pkKvlkg7k625t2K/6mgNF+Bfk
 zHsDbbQJMmqa8puzAH+UnwqhFJuwYVaAXu1WbioQbk8IhctbKHeph0JDYwHdF4tyWQbgkQ==
X-Received: by 2002:a05:7022:f005:b0:11a:43fb:58dd with SMTP id
 a92af1059eb24-1276ad3bcd8mr3975440c88.5.1772124878272; Thu, 26 Feb 2026
 08:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20260226030038.1182961-1-yujie.liu@intel.com>
 <20260226030038.1182961-7-yujie.liu@intel.com>
In-Reply-To: <20260226030038.1182961-7-yujie.liu@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 26 Feb 2026 11:54:26 -0500
X-Gm-Features: AaiRm50FIm7gW9ftKbXM9mUDFZF-JB2g7m56NgkO01zsGUV36mqPkWnCPIpQdvQ
Message-ID: <CADnq5_N819Zv-dQU_rswGDBdt7wKB+fCgFDLswbLgbwhz6J2Sg@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/amd/pm: fix kernel-doc warning for
 smu_msg_v1_send_msg()
To: Yujie Liu <yujie.liu@intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kenneth Feng <kenneth.feng@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Sunil Khatri <sunil.khatri@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Asad Kamal <asad.kamal@amd.com>, Yang Wang <kevinyang.wang@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
 Gangliang Xie <ganglxie@amd.com>, Candice Li <candice.li@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Luben Tuikov <luben.tuikov@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
 Michal Wajdeczko <michal.wajdeczko@intel.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Applied.  Thanks!

On Wed, Feb 25, 2026 at 10:19=E2=80=AFPM Yujie Liu <yujie.liu@intel.com> wr=
ote:
>
> Warning: drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu_cmn.c:415 expecting p=
rototype for smu_msg_proto_v1_send_msg(). Prototype was for smu_msg_v1_send=
_msg() instead
>
> Fixes: 4f379370a49c ("drm/amd/pm: Add smu message control block")
> Signed-off-by: Yujie Liu <yujie.liu@intel.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c b/drivers/gpu/drm/amd=
/pm/swsmu/smu_cmn.c
> index 6fd50c2fd20e..c471c0e2cbd1 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_cmn.c
> @@ -405,7 +405,7 @@ static int __smu_msg_v1_ras_filter(struct smu_msg_ctl=
 *ctl,
>  }
>
>  /**
> - * smu_msg_proto_v1_send_msg - Complete V1 protocol with all filtering
> + * smu_msg_v1_send_msg - Complete V1 protocol with all filtering
>   * @ctl: Message control block
>   * @args: Message arguments
>   *
> --
> 2.43.0
>
