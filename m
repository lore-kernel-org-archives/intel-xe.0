Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC83EFCE33
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 18:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4255A10EA5A;
	Wed,  4 Mar 2026 18:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PZNroz75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E6910EA5A
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772649601; x=1804185601;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HATRrnyULkIKdQhATKZ6XCxOgaHYWpCGsp468/d2o+k=;
 b=PZNroz750BLfvGLDwO9LzLy6/pXJa6xTei62oy4oVAfw5oF/bOYjes+i
 akltPvFADPRH8bVWDiR1+Cy8QHW1+sCBBsiMD1oFwIwWx53cwrMTnjhYu
 NAf1BL3I5vPkWU+JgrodQQ+asRMT0NxvBdzRYlUMU88EimFglz+6LNmyT
 mp7WYHKoCUUqkkbeCKXmGCzDlgZFb+TiAdYsvtyhNsqDifgNKfAGVAnJA
 VsKNvyUCnthMzt0i4I5oTikF3T127jaDG3kNV1AOVEO3hPz4gU4/8Cp+I
 RQ+sW4YOCbEJL7inNrjKGFQvISsxkXfROjdfIaefc01qY3lYjrKde5TTV Q==;
X-CSE-ConnectionGUID: BTQJ8ruFTpu4y4rasR/5bQ==
X-CSE-MsgGUID: q7BYGRl5S/yIZ9bOAgK0bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77564999"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="77564999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 10:40:00 -0800
X-CSE-ConnectionGUID: 5FTADu26T9m9Eh+IdPgOVA==
X-CSE-MsgGUID: blL25ZFqT2yzJ9ZvNLUhnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217589818"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.81])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 10:39:56 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix overflow in guc_ct_snapshot_capture
In-Reply-To: <aahgKt4kHpXWwenB@lstrano-desk.jf.intel.com>
References: <20260304112501.230992-1-mika.kuoppala@linux.intel.com>
 <aahgKt4kHpXWwenB@lstrano-desk.jf.intel.com>
Date: Wed, 04 Mar 2026 20:39:52 +0200
Message-ID: <87a4wn4ex3.fsf@mkuoppal-desk>
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

Matthew Brost <matthew.brost@intel.com> writes:

> On Wed, Mar 04, 2026 at 01:25:01PM +0200, Mika Kuoppala wrote:
>> snapshot->ctb is u32*, so pointer arithmetic on it scales
>> the byte offset from xe_bo_size() by 4, overshooting the
>> intended start of the g2h portion and writing past the
>> allocated buffer.
>>=20
>> Fix this by using *u8 to get the arithmetic right and also
>> prevent future mishaps.
>>=20
>> Fixes: af3de6cf06f9 ("drm/xe: Split H2G and G2H into separate buffer obj=
ects")
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>> Cc: "Thomas Hellstr=C3=B6m" <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: intel-xe@lists.freedesktop.org
>> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_guc_ct_types.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct_types.h b/drivers/gpu/drm/xe/x=
e_guc_ct_types.h
>> index 46ad1402347d..1b4b9b713d42 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct_types.h
>> @@ -74,7 +74,7 @@ struct xe_guc_ct_snapshot {
>>  	/** @ctb_size: size of the snapshot of the CTB */
>>  	size_t ctb_size;
>>  	/** @ctb: snapshot of the entire CTB */
>> -	u32 *ctb;
>> +	u8 *ctb;
>
> Ah, I see the issue. Maybe 'void *ctb'?
>

What is the benefit? We clearly do arithmetic on it.
You want u8 * cast on where memcpy is done?

> Matt
>
>>  };
>>=20=20
>>  /**
>> --=20
>> 2.43.0
>>=20
