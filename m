Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CD1D41D74
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 10:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E4310E19E;
	Mon, 15 Dec 2025 10:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PAe+LgNV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2BE10E19E
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Dec 2025 10:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765793413; x=1797329413;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=yFWPHbtw26rMPmAL0c5VN7rd0L6OQtM4ivLEBOkcArs=;
 b=PAe+LgNVdrLXLLrjcs7YZZpiVsPIZVN6rsyq1Wk/KcOayjikm59Z6S8h
 fVj+xJCT7Jp2b35IybsSaWJjccCz1/BlaZ1Zv17uTlFvK/cCr/QAkuH6G
 2sZfTAKIiM1sva4oIFPiqRWJ8ZDTRKdNslsfeBJdj7l7sBfd0rVlZhHsc
 Imc+LKNO742cQY9vtDbWj46vtWhxX/FTabFhyRvDSLgX9UBaH2gTNCa8a
 yteRS06xfsd2s3sS85VQehdCCYMgU6R5S0tx8pUeyMEgOcMNaVBFHp64H
 AcjFjcAuRvX2SfNeq1IhSHNMSn6O+INo+ArehTw+62+NfFzo7cWSlSJrw Q==;
X-CSE-ConnectionGUID: N9hvrtF9RPqjz6eteVqpYQ==
X-CSE-MsgGUID: 5Y6FuTcwQjuZKm/W755Czw==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="67568134"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="67568134"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:10:12 -0800
X-CSE-ConnectionGUID: k3pElQZUS6qdCGRE/bJnBw==
X-CSE-MsgGUID: /+VmJ1OzQPSgkOJHCoE82w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; d="scan'208";a="197729063"
Received: from zzombora-mobl1 (HELO [10.245.244.10]) ([10.245.244.10])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 02:10:11 -0800
Message-ID: <a63d1519332fd50e50153983f5642a7a5e6f8fff.camel@linux.intel.com>
Subject: Re: [PATCH v2 2/7] drm/xe: Use usleep_range for accurate
 long-running workload timeslicing
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: francois.dugast@intel.com, michal.mrozek@intel.com
Date: Mon, 15 Dec 2025 11:10:08 +0100
In-Reply-To: <20251212182847.1683222-3-matthew.brost@intel.com>
References: <20251212182847.1683222-1-matthew.brost@intel.com>
 <20251212182847.1683222-3-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
MIME-Version: 1.0
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

On Fri, 2025-12-12 at 10:28 -0800, Matthew Brost wrote:
> msleep is not very accurate in terms of how long it actually sleeps,
> whereas usleep_range is precise. Replace the timeslice sleep for
> long-running workloads with the more accurate usleep_range to avoid
> jitter if the sleep period is less than 20ms.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> GPUs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

> ---
> =C2=A0drivers/gpu/drm/xe/xe_guc_submit.c | 20 +++++++++++++++++++-
> =C2=A01 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 21a8bd2ec672..18cac5594d6a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -990,6 +990,24 @@ static u32 wq_space_until_wrap(struct
> xe_exec_queue *q)
> =C2=A0	return (WQ_SIZE - q->guc->wqi_tail);
> =C2=A0}
> =C2=A0
> +static inline void relaxed_ms_sleep(unsigned int delay_ms)
> +{
> +	unsigned long min_us, max_us;
> +
> +	if (!delay_ms)
> +		return;
> +
> +	if (delay_ms > 20) {
> +		msleep(delay_ms);
> +		return;
> +	}
> +
> +	min_us =3D mul_u32_u32(delay_ms, 1000);
> +	max_us =3D min_us + 500;
> +
> +	usleep_range(min_us, max_us);
> +}
> +
> =C2=A0static int wq_wait_for_space(struct xe_exec_queue *q, u32 wqi_size)
> =C2=A0{
> =C2=A0	struct xe_guc *guc =3D exec_queue_to_guc(q);
> @@ -1903,7 +1921,7 @@ static void
> __guc_exec_queue_process_msg_suspend(struct xe_sched_msg *msg)
> =C2=A0				since_resume_ms;
> =C2=A0
> =C2=A0			if (wait_ms > 0 && q->guc->resume_time)
> -				msleep(wait_ms);
> +				relaxed_ms_sleep(wait_ms);
> =C2=A0
> =C2=A0			set_exec_queue_suspended(q);
> =C2=A0			disable_scheduling(q, false);

