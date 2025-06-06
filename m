Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF37EC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B0010E082;
	Fri,  6 Jun 2025 21:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiqQL4wB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79E410E082
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 21:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749246594; x=1780782594;
 h=message-id:subject:from:reply-to:to:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LCDY0orRICHHd2UnAwtpcP/omWDauE2VDzkZc7MZKvw=;
 b=MiqQL4wB6fbnOOtG+tM4QCxgVJda5S3AvF8mPZ3TlWGbkWP/CXKlAKE3
 3jH3Bm6kYVctTJX6+sHhmMNtF3/oJf0MsQxkMkvbNRlNZeOaSOwtH/uRI
 4C2hE6tgL5TpEo10i6lLGfZJTD1SAmqnTzOk1uhiO0vQciE4Xoa8/shZ3
 mv9+Z/Rd22N6bHt29QJusx+7082bvbH4QmOfmkmju/wqYwQPvAsUYFbeP
 uKa79aUDNnZcU86dg0vkTsqECKGqVEkjCkMtmbQ/HKQ6zU/ML1AXoh6OZ
 Q/GRvRMluVUOE2VMgOXhcGAITLp1ju25d/kEc2giCOpn5M3UZuRfKkdyn A==;
X-CSE-ConnectionGUID: KcB+w5m+RdK3HmFLTEky2A==
X-CSE-MsgGUID: 0fhaga1AQlGVr6s6M8dHAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="76799810"
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="76799810"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:49:54 -0700
X-CSE-ConnectionGUID: dnsClYC4Tqyp5wM7+iuLeQ==
X-CSE-MsgGUID: DNTcvHx3SRukLegMuyxiuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,216,1744095600"; d="scan'208";a="146454382"
Received: from aschofie-mobl2.amr.corp.intel.com ([10.124.222.251])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 14:49:53 -0700
Message-ID: <b970f20722f050f55acd11eb71793fc899154299.camel@linux.intel.com>
Subject: Re: [PATCH v3 06/11] platform/x86/intel/pmt: re-order trigger logic
From: "David E. Box" <david.e.box@linux.intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>, 
 platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 lucas.demarchi@intel.com,  rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, airlied@gmail.com,  simona@ffwll.ch
Date: Fri, 06 Jun 2025 14:49:53 -0700
In-Reply-To: <20250605184444.515556-7-michael.j.ruhl@intel.com>
References: <20250605184444.515556-1-michael.j.ruhl@intel.com>
 <20250605184444.515556-7-michael.j.ruhl@intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
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
Reply-To: david.e.box@linux.intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, 2025-06-05 at 14:44 -0400, Michael J. Ruhl wrote:
> Setting the clear bit or checking the complete bit before checking to
> see if crashlog is disabled seems incorrect.
>=20
> Check disable before accessing any other bits.
>=20
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> ---
> =C2=A0drivers/platform/x86/intel/pmt/crashlog.c | 8 ++++----
> =C2=A01 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
> b/drivers/platform/x86/intel/pmt/crashlog.c
> index 94858bfb52f8..aa3f57fbe018 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
> @@ -191,6 +191,10 @@ trigger_store(struct device *dev, struct device_attr=
ibute
> *attr,
> =C2=A0
> =C2=A0	guard(mutex)(&entry->control_mutex);
> =C2=A0
> +	/* if device is currently disabled, return busy */
> +	if (pmt_crashlog_disabled(&entry->entry))
> +		return -EBUSY;
> +
> =C2=A0	if (!trigger) {
> =C2=A0		pmt_crashlog_set_clear(&entry->entry);
> =C2=A0		return count;
> @@ -200,10 +204,6 @@ trigger_store(struct device *dev, struct device_attr=
ibute
> *attr,
> =C2=A0	if (pmt_crashlog_complete(&entry->entry))
> =C2=A0		return -EEXIST;
> =C2=A0
> -	/* if device is currently disabled, return busy */
> -	if (pmt_crashlog_disabled(&entry->entry))
> -		return -EBUSY;
> -
> =C2=A0	pmt_crashlog_set_execute(&entry->entry);
> =C2=A0
> =C2=A0	return count;

LGTM

Reviewed-by: David E. Box <david.e.box@linux.intel.com>
