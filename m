Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77997CCFA13
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 08:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6C610F2B7;
	Thu, 30 Apr 2026 08:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPJ+q1Y6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4DF10F2B7
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777537972; x=1809073972;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=pqMrxs/8dXYfubFe+Mnj2erPT9U/YnUMFWgfE7viiFM=;
 b=cPJ+q1Y6FQ4FzqMpjUnvvoWsnCyqQCZE7KeylxOMu/hX+vR99DtNZU2K
 n7Jh4T0yKQ3gXiIyoT9DE1NXFnE6acINrY/56+is3BiY2+q48l6PN6mmv
 LHzRglgQKApB+Bbd5na5H6ose65AUomAEMCFVMgfUTLaOMT8CcDP1cwpk
 sEnMb6/cF3aEJv9aN2cTmUi+ps9FzTO1kBy3zZB/PwSu3Z5w4L/vy7KAD
 xEinEfHEJSnCHYxjvlAw7VjCpssaxq32tmTGxK8T0viGvsa4xViTHfPZ1
 vbaraBVh0PrRgiTtSncl3XsLzL6EghIG+PJMKP2pfNU2UnPb6mS9Gi/S/ w==;
X-CSE-ConnectionGUID: zI8XippSS5atQ/XCjWKBJg==
X-CSE-MsgGUID: syPygQciQn2pXzsIX9TRYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81058437"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="81058437"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:32:52 -0700
X-CSE-ConnectionGUID: rYgtV7+qQEiG4FLVuYmgYg==
X-CSE-MsgGUID: Poxm10alR/69H8DIrFDxvw==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.68])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 01:32:50 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <michal.wajdeczko@intel.com>
Cc: "dev@lankhorst.se" <dev@lankhorst.se>
Subject: Re: [PATCH 01/13] drm/xe/ggtt: Rename parameter name in
 xe_ggtt_init_kunit()
In-Reply-To: <4561363a9ff4fc0449bd56df4c5ea9fa4d756f0b.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-2-michal.wajdeczko@intel.com>
 <4561363a9ff4fc0449bd56df4c5ea9fa4d756f0b.camel@intel.com>
Date: Thu, 30 Apr 2026 11:32:48 +0300
Message-ID: <9452d9c122d77d7b60c3705e7613461d7e1c4ad7@intel.com>
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

On Wed, 29 Apr 2026, "Summers, Stuart" <stuart.summers@intel.com> wrote:
> On Tue, 2026-04-28 at 16:27 +0200, Michal Wajdeczko wrote:
>> The parameter name was changed by the commit 22437f30d2f0 ("drm/xe:
>> Start using ggtt->start in preparation of balloon removal"), but we
>> missed then to update the function prototype.
>>=20
>
> Include the Fixes:?

Does it really matter? It'll lead to a stable backport of an
inconsequental parameter rename.

BR,
Jani.


>
> Otherwise the change looks good I agree:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Maarten Lankhorst <dev@lankhorst.se>
>> ---
>> =C2=A0drivers/gpu/drm/xe/xe_ggtt.h | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h
>> b/drivers/gpu/drm/xe/xe_ggtt.h
>> index c864cc975a69..f0ac7ec0502a 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
>> @@ -15,7 +15,7 @@ struct drm_exec;
>> =C2=A0
>> =C2=A0struct xe_ggtt *xe_ggtt_alloc(struct xe_tile *tile);
>> =C2=A0int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>> -int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32
>> size);
>> +int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size);
>> =C2=A0int xe_ggtt_init(struct xe_ggtt *ggtt);
>> =C2=A0
>> =C2=A0void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>

--=20
Jani Nikula, Intel
