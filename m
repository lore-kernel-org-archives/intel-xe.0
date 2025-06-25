Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1B4C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 09:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6277F10E6AE;
	Wed, 25 Jun 2025 09:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J4d1O67I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1E710E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 09:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750842006; x=1782378006;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=x/bksDZFfdCBN5AI6XiDNCazx5IZegJ7W+lXLCFxJeg=;
 b=J4d1O67IsTuKmAfSUjMS3KiLdm+ZO3YFlZ3xj3jDLC/PgYKQVIz+ZTBL
 e8T1MpA864NbkVZIAXyC4G4OfLXWygalvldgzPYnAKuDAxgjniB209kEB
 WgO0gaswcwKPg8M5jaTiOa5hAf0LLXGN0i2Q+mva1RCGEb/pqZcOhGhTF
 hmlp77UyVr8LCulYnaejgawA33knrc0mFVVl2KLRFG+Pj2BGZDR+WWIGz
 4oDVYcH3CYUwOdBkg8/qGyoJ0193eAnYiUy/ZfcAJsEE1SuVs8N9jzPTi
 cbtQjXaobo9rvrTnFoM4a2nFQz9QbUzdVijwStAmuNc6UTs6IXLR6xFV4 w==;
X-CSE-ConnectionGUID: 1YZj/6uFQvmYWPLmpkfQ8Q==
X-CSE-MsgGUID: hyfBfCa1QC+dzeW2zJ9jnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56904422"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="56904422"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:00:06 -0700
X-CSE-ConnectionGUID: vzI//C5GQFOKE8dlF31Bzw==
X-CSE-MsgGUID: kH68RJu5R4avk6xA3pWwkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151575960"
Received: from monicael-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.78])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 02:00:03 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, =?utf-8?Q?Pi=C3=B3rkows?=
 =?utf-8?Q?ki=2C_Piotr?=
 <piotr.piorkowski@intel.com>, intel-xe@lists.freedesktop.org
Cc: Stuart Summers <stuart.summers@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
Subject: Re: [PATCH v3 1/2] drm/xe: Use dynamic allocation for tile and
 device VRAM region structures
In-Reply-To: <33d3faf0-40b3-400a-be2c-7366e28b7f94@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250624092213.2876711-1-piotr.piorkowski@intel.com>
 <20250624092213.2876711-2-piotr.piorkowski@intel.com>
 <33d3faf0-40b3-400a-be2c-7366e28b7f94@intel.com>
Date: Wed, 25 Jun 2025 12:00:00 +0300
Message-ID: <7e9a6252c25be63da00605273614edb2ea31c196@intel.com>
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

On Tue, 24 Jun 2025, Michal Wajdeczko <michal.wajdeczko@intel.com> wrote:
> On 24.06.2025 11:22, Pi=C3=B3rkowski, Piotr wrote:
>> diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_asse=
rt.h
>> index 68fe70ce2be3..cd63cdd2dc78 100644
>> --- a/drivers/gpu/drm/xe/xe_assert.h
>> +++ b/drivers/gpu/drm/xe/xe_assert.h
>> @@ -145,7 +145,7 @@
>>  	const struct xe_tile *__tile =3D (tile);							\
>>  	char __buf[10] __maybe_unused;								\
>>  	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,=
			\
>> -		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical=
_size, 1,	\
>> +		      __tile->id, ({ string_get_size(__tile->mem.vram->actual_physica=
l_size, 1,	\
>>  				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
>>  })
>>=20=20
>
> this assert will cause NPD on !DGFX, likely you need at least this:
>
> __tile->mem.vram ? __tile->mem.vram->actual_physical_size : 0

There'd be other benefits in adding abstractions for this, such as
making vram an opaque pointer and not requiring its definition be
included absolutely everywhere via xe_assert.h.

BR,
Jani.


--=20
Jani Nikula, Intel
