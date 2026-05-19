Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06426CD4F5E
	for <intel-xe@archiver.kernel.org>; Tue, 19 May 2026 16:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFDE10EDC3;
	Tue, 19 May 2026 16:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nsrtbew7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ABF310EDBB;
 Tue, 19 May 2026 16:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779208048; x=1810744048;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=3LzFi/6/g9T/wa3rJ6jSGLMahhUdpNE6toetCS9jqYg=;
 b=Nsrtbew7TLw9WB5yv/QsJjz6rZe+2vO0FMFyn2Q9EeuT4z6Q58FaidSu
 Z/6UBZ2Yq2i85SpeCaRjQ9BrZJWdCbgvRx9ovbg48dKWPQ/+XKOmTAKSG
 8Rd+153IlRS5dNb/BdsPyTSFSC6XR+a826V6uVMW7sIDjUtQnwfY3gj/T
 qTvMf1wbS9uogNvbuur0qBXXFwTJLEWWTxI7dU22TpiAC7rmzXk3NbY7P
 7FI8auyT9nrdDJT8UDIkiCw4AGtrquoRLu9o1YnwORzazgSsHoVbvIALO
 9BqCYA2DWMErva0Q/jE0LAmf4WsgtH+FRxrxtkxz+LTQ2N8SQHO9f0cZ8 g==;
X-CSE-ConnectionGUID: 5DAazheuQS6U4QT/J9FTOA==
X-CSE-MsgGUID: EWM2bgNpTSiEAG8F8mXkDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91198174"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="91198174"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 09:27:28 -0700
X-CSE-ConnectionGUID: AbeiZtWWSBGHiDmrwQzkIg==
X-CSE-MsgGUID: EQgujk5jTza9jwVPJ1+z8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="263334962"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.218])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 09:27:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Grzelak, Michal"
 <michal.grzelak@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v3 04/31] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
In-Reply-To: <DM3PPF208195D8D19839A5B3145823CC4FAE3002@DM3PPF208195D8D.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260507013137.527510-1-michal.grzelak@intel.com>
 <20260507013137.527510-5-michal.grzelak@intel.com>
 <DM3PPF208195D8D19839A5B3145823CC4FAE3002@DM3PPF208195D8D.namprd11.prod.outlook.com>
Date: Tue, 19 May 2026 19:27:24 +0300
Message-ID: <bd8fd489ed736d970e0ab2b181d9d9bb45c8b7a1@intel.com>
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

On Tue, 19 May 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> -----Original Message-----
>> From: Grzelak, Michal <michal.grzelak@intel.com>
>> Sent: Thursday, May 7, 2026 7:01 AM
>> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
>> Cc: Nikula, Jani <jani.nikula@intel.com>; Kandpal, Suraj
>> <suraj.kandpal@intel.com>; Grzelak, Michal <michal.grzelak@intel.com>
>> Subject: [PATCH v3 04/31] drm/i915/bios: store VBT #57's metadata in
>> intel_vbt_data
>>=20
>> Store number of rows and number of tables in intel_vbt_data when search =
for
>> the VBT #57 succeeded.
>>=20
>> Display version determines number of rows present in each table. pre-MTL
>> platforms should have 10 rows while MTL+ should have 16 rows.
>>=20
>> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c         | 7 +++++++
>>  drivers/gpu/drm/i915/display/intel_display_core.h | 3 +++
>>  2 files changed, 10 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c
>> b/drivers/gpu/drm/i915/display/intel_bios.c
>> index 3f9e4d31c7375..d64668c1022a7 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -2200,6 +2200,9 @@ parse_vswing_preemph_override(struct
>> intel_display *display)
>>  		return;
>>=20
>>  	drm_dbg_kms(display->drm, "VS/PE-O parsing not yet supported\n");
>> +
>> +	display->vbt.num_tables =3D block->num_tables;
>> +	display->vbt.num_rows =3D DISPLAY_VER(display) >=3D 14 ? 16 : 10;
>
> Where did you get these numbers from. Bspec reference maybe.
> I also see you harcoding this in the next patches maybe you need a helper=
 that can be used.
> Also DG2 also uses 16 rows from what I can see=20
>
>>  }
>>=20
>>  static u8 translate_iboost(struct intel_display *display, u8 val) @@ -2=
997,6
>> +3000,10 @@ init_vbt_defaults(struct intel_display *display)
>>=20
>> !HAS_PCH_SPLIT(display));
>>  	drm_dbg_kms(display->drm, "Set default to SSC at %d kHz\n",
>>  		    display->vbt.lvds_ssc_freq);
>> +
>> +	/* Vswing / Preemphasis Override */
>> +	display->vbt.num_tables =3D 0;
>> +	display->vbt.num_rows =3D 0;
>
> Why expilicitly make the 0 now vbt gets initialized with everything 0'd o=
ut. As intel_display is kazalloc'd
>
>>  }
>>=20
>>  /* Common defaults which may be overridden by VBT. */ diff --git
>> a/drivers/gpu/drm/i915/display/intel_display_core.h
>> b/drivers/gpu/drm/i915/display/intel_display_core.h
>> index 76745ce6a716e..36ea4873deeb0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
>> @@ -242,6 +242,9 @@ struct intel_vbt_data {
>>  	struct list_head display_devices;
>>  	struct list_head bdb_blocks;
>>=20
>> +	int num_tables;
>> +	int num_rows;
>
> Lets keep this u8 here too for consistency

Why? IMO always use int *unless* there's a reason not to.

> Also maybe num_vswing_tables,
> num_vswing_rows_per_table.

I'd rather see a sub-struct.

BR,
Jani.


>
> Regards,
> Suraj Kandpal
>
>> +
>>  	struct sdvo_device_mapping {
>>  		u8 initialized;
>>  		u8 dvo_port;
>> --
>> 2.45.2
>

--=20
Jani Nikula, Intel
