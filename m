Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2626FD5F99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Apr 2026 09:11:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C2D10E5D6;
	Wed,  8 Apr 2026 09:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="is2Nx4xn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB1710E5D4;
 Wed,  8 Apr 2026 09:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775639467; x=1807175467;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=fyYziRXCH9gJr4eGYouThl+QQ1jqWyxlodXa43e2/Es=;
 b=is2Nx4xnMyoMq53wvsPULqQq3cS3EMc5hHTy7/9XMGgqLFGNEdoc7FMK
 i06q1tbsIl1NDtsmvk/A9rz/+XKJZJY8Vu7yf8DUZ6bbVrBRwBXYfh/CQ
 /8NPIgqfgoHXActgt7IKTrAdQ6H3HO8iD2k/NSbvAI0zrPTTpdAqH51Z+
 i19QLEjmTuWK1gqCtwtoiMOpB4Im+UBPyajLTXCvNZ2Qe+z2HR7Pyhev0
 sqePnBOzSzJI5YxP4k7EQOvy5Nazi7hdLuAKPMhcpYI362eCCbttKpvla
 k1H91eRI8hkVFgKZ68zhZmpjydzgZrIeFYgoxfKiL+TnsGz4XGOw0xk8/ A==;
X-CSE-ConnectionGUID: XpSbwT01T4ebRzvAI49jdQ==
X-CSE-MsgGUID: prMX6KEPRvKqx3ahJxg9zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="86908054"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="86908054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:11:07 -0700
X-CSE-ConnectionGUID: 504mfOiBRaeISEl4CEGx0w==
X-CSE-MsgGUID: M7x1thHDRP60t1AzYF1tTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; d="scan'208";a="228353177"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 02:11:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 07/12] drm/i915/vma: Add helpers to check GTT view type
In-Reply-To: <97be0c2c2ac61e38db7d41254b7fe54610ef26a4@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260407155053.32156-1-ville.syrjala@linux.intel.com>
 <20260407155053.32156-8-ville.syrjala@linux.intel.com>
 <97be0c2c2ac61e38db7d41254b7fe54610ef26a4@intel.com>
Date: Wed, 08 Apr 2026 12:11:02 +0300
Message-ID: <48db71f69330d3265c53fc9a44fff121b0caa3ca@intel.com>
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

On Wed, 08 Apr 2026, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 07 Apr 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> I915_GTT_VIEW_ROTATED is going away and being replaced by just
>> I915_GTT_VIEW_REMAPPED, so we're going to need another way to
>> determine if the view is rotated or not (since width/height
>> will need to be swapped when operating on the destination
>> coordinate space). Provide small helper functions to hide
>> such implementation details from most of the code using GTT views.
>>
>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Funny, I think I have these helpers in a branch somewhere too. :)
>
> It's still not clear to me where we'll end up with this, since the file
> is in i915 and used directly from xe core too, which is something we
> want to get rid of. But seems like iterative improvement, so let's roll
> with this.
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

PS. I note that there's still plenty of places in i915 core that could
be converted to the helpers after this series.

>
>> ---
>>  drivers/gpu/drm/i915/i915_gtt_view_types.h | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gtt_view_types.h b/drivers/gpu/dr=
m/i915/i915_gtt_view_types.h
>> index c084f67bc880..9c4f38db32ff 100644
>> --- a/drivers/gpu/drm/i915/i915_gtt_view_types.h
>> +++ b/drivers/gpu/drm/i915/i915_gtt_view_types.h
>> @@ -56,4 +56,19 @@ struct i915_gtt_view {
>>  	};
>>  };
>>=20=20
>> +static inline bool i915_gtt_view_is_normal(const struct i915_gtt_view *=
view)
>> +{
>> +	return view->type =3D=3D I915_GTT_VIEW_NORMAL;
>> +}
>> +
>> +static inline bool i915_gtt_view_is_remapped(const struct i915_gtt_view=
 *view)
>> +{
>> +	return view->type =3D=3D I915_GTT_VIEW_REMAPPED;
>> +}
>> +
>> +static inline bool i915_gtt_view_is_rotated(const struct i915_gtt_view =
*view)
>> +{
>> +	return view->type =3D=3D I915_GTT_VIEW_ROTATED;
>> +}
>> +
>>  #endif /* __I915_GTT_VIEW_TYPES_H__ */

--=20
Jani Nikula, Intel
