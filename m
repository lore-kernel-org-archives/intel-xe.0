Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E71B0CF9C69
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 12:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B026310E148;
	Mon, 23 Sep 2024 12:00:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCC9NLCz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233B310E148
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 12:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727092821; x=1758628821;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=harODilHU9Bk0BkQDi2czCNEzYYmzUA5ixtHDzQySKA=;
 b=BCC9NLCzwVg7++AoBPBBqNhFm5mDDV++kEBhxEA40WrxZF8nEvNZ9b67
 dYx0uEGTeQmLJEX9qwQRUxjGorIF+sgrxpbiRK5zhEAzgIztZREncWvfO
 OHBIKieMuoe9tZYZmswhi0xzGFSvrLztta5w/GnpfAinSu++YS9OYIBuO
 pBjqt4h3qZOoiHjbE5h2elJ6pEFPW0S5jPwHGxBorAHI6QJ4PPWdSxi1M
 zo3UzksqZ0oD1yfxzQpUaRHKsjJvzPVF1gCBhmv49NjCZRzhB4rQG7oBX
 bcDwkY4YuchXRA5wMrB9+zgr6hNoTRHAxrC9RdunUVtWj8lginFUGi+hX A==;
X-CSE-ConnectionGUID: UFo1CFT3TXGacpkoXafDrA==
X-CSE-MsgGUID: Iud6m+mjSF+1qQhYf0gudA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25553242"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="25553242"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:00:20 -0700
X-CSE-ConnectionGUID: lXkV3MnlS7i5rUIMwoq2wA==
X-CSE-MsgGUID: fV53wJP4QbCJFvGlKGC3lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="101787150"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 05:00:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Francois Dugast <francois.dugast@intel.com>, intel-xe@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97?= CI.KUnit: failure for drm/xe: Use fault
 injection infrastructure to find issues at probe time (rev2)
In-Reply-To: <ZvFESJTCV91MrTfg@fdugast-desk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240920131834.3368299-1-francois.dugast@intel.com>
 <172684033706.1051009.16907296846862410987@2413ebb6fbb6>
 <ZvFESJTCV91MrTfg@fdugast-desk>
Date: Mon, 23 Sep 2024 15:00:14 +0300
Message-ID: <87frpq60mp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Mon, 23 Sep 2024, Francois Dugast <francois.dugast@intel.com> wrote:
> On Fri, Sep 20, 2024 at 01:52:17PM +0000, Patchwork wrote:
>> =3D=3D Series Details =3D=3D
>>=20
>> Series: drm/xe: Use fault injection infrastructure to find issues at pro=
be time (rev2)
>> URL   : https://patchwork.freedesktop.org/series/138654/
>> State : failure
>>=20
>> =3D=3D Summary =3D=3D
>>=20
>> + trap cleanup EXIT
>> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers=
/gpu/drm/xe/.kunitconfig
>> ERROR:root:In file included from ../drivers/gpu/drm/xe/xe_guc_ads.c:8:
>> ../include/linux/fault-inject.h:97:15: error: unknown type name =E2=80=
=98bool=E2=80=99
>>    97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsign=
ed int order)
>>       |               ^~~~
>> ../include/linux/fault-inject.h:97:43: error: unknown type name =E2=80=
=98gfp_t=E2=80=99
>>    97 | static inline bool should_fail_alloc_page(gfp_t gfp_mask, unsign=
ed int order)
>>       |                                           ^~~~~
>> ../include/linux/fault-inject.h:106:57: error: unknown type name =E2=80=
=98gfp_t=E2=80=99
>>   106 | static inline int should_failslab(struct kmem_cache *s, gfp_t gf=
pflags)
>>       |                                                         ^~~~~
>> make[7]: *** [../scripts/Makefile.build:244: drivers/gpu/drm/xe/xe_guc_a=
ds.o] Error 1
>
> This build error occurs when CONFIG_FAULT_INJECTION=3Dn due to missing in=
clusion
> of linux/types.h in linux/fault-inject.h. It is solved with Jani's series:
>
> https://lore.kernel.org/intel-xe/20240813121237.2382534-1-jani.nikula@int=
el.com/

These two are in Linus' master now, we'll get them after -rc1 and some
backmerges:

6ce2082fd3a2 ("fault-inject: improve build for CONFIG_FAULT_INJECTION=3Dn")
ccbfd2df3018 ("drm/xe: clean up fault injection usage")

BR,
Jani.


--=20
Jani Nikula, Intel
