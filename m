Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8B7CA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 14:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D10810E8A2;
	Thu,  8 Oct 2026 14:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UPJhlrz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C06410E8A2;
 Thu,  8 Oct 2026 14:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791468483; x=1823004483;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s2uVbRXLVOSm9D7G8EeEgzSFVqTdnwqXhdPcnUoc59Q=;
 b=UPJhlrz7zGoOQrH5VN0t5TP05D4OAd9TvXdW9ZBw+g602wWyYcPwNAmf
 u4zrhUNdNzsT6OTbnh5QPbnITj/+ClXLyua0bMYsSOFkq5F2jEMCamHoy
 98QuKNhi2vjE+HcIxOLMESe8g6Y2gRrFJQwbR7G/VEGbu+GimU2WJxC//
 b5pI7FcOvMvd023I3FJKRbPIqABjwV9HTM7frEvrSG/70LQpCUaOX41i1
 qz4gr5Gj5lYAjnAGUPBs75o/f9VNnAHp6byMaNGdErdbogC1bioGxdGIL
 WQsd5AL6136qe4qe/EgJkKSbBlF1MNA9l8DWhKlsfJuH/XKz9ZuW4J5wT g==;
X-CSE-ConnectionGUID: DyqeTb6jQUOyGJKlj4xbMA==
X-CSE-MsgGUID: V0o99/4oRXWpA6t7qPFKmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="145851"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="145851"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:08:03 -0700
X-CSE-ConnectionGUID: CFfkPoUMSvSb0ENmxv5wBw==
X-CSE-MsgGUID: 3l4lkhvfQCCuHcrsL4nM6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="377535"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.142])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 07:08:01 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Cc: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/i915/scaler: Prune YUV420 modes against the max
 source width
In-Reply-To: <DS4PPFE901A304F1782FA1CD962D6DDE3BFE3942@DS4PPFE901A304F.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20261007070601.3611674-1-arun.r.murthy@intel.com>
 <DS4PPFE901A304F1782FA1CD962D6DDE3BFE3942@DS4PPFE901A304F.namprd11.prod.outlook.com>
Date: Thu, 08 Oct 2026 17:07:59 +0300
Message-ID: <013890ff0c99723aeb304a0a6997543ba646524d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 07 Oct 2026, "Kandpal, Suraj" <suraj.kandpal@intel.com> wrote:
>> Subject: [PATCH] drm/i915/scaler: Prune YUV420 modes against the max
>> source width
>> 
>> skl_scaler_mode_valid() compares the mode's hdisplay against the pipe scaler
>> maximum source height instead of the maximum source width, so single pipe
>> YUV420 modes are pruned against the wrong limit.
>> 
>> Commit 3347b55f2c6c ("drm/i915/xe3lpd: Prune modes for YUV420")
>> intended to reject modes whose hdisplay exceeds the scaler horizontal source
>
> I think no need to mention  this commit since you already mention this in fixes
> Also 
> Cc: stable@vger.kernel.org

Yeah we have 'dim fixes' for this.

$ dim fixes 3347b55f2c6c
Fixes: 3347b55f2c6c ("drm/i915/xe3lpd: Prune modes for YUV420")
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com> #v2
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.18+

Don't put all of it in the trailers, but it gives you an idea who should
perhaps be Cc'd and what the stable target should be.


BR,
Jani.


>
> Otherwise LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
>> limit, since pipe scaling does not support YUV420 for a source width above
>> 4096. Comparing against max_h makes the check far too permissive from
>> display 12 onwards, where max_h is 8192, and too strict on display 11, where
>> max_h is 4096 while the horizontal limit is 5120.
>> 
>> Compare against max_w instead.
>> 
>> Fixes: 3347b55f2c6c ("drm/i915/xe3lpd: Prune modes for YUV420")
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/skl_scaler.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c
>> b/drivers/gpu/drm/i915/display/skl_scaler.c
>> index 7994b983d509..7e65c4fffbc0 100644
>> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
>> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
>> @@ -145,7 +145,7 @@ skl_scaler_mode_valid(struct intel_display *display,
>> 
>>  	if (num_joined_pipes < 2 && output_format ==
>> INTEL_OUTPUT_FORMAT_YCBCR420) {
>>  		skl_scaler_max_src_size(display, &max_w, &max_h);
>> -		if (mode->hdisplay > max_h)
>> +		if (mode->hdisplay > max_w)
>>  			return MODE_NO_420;
>>  	}
>> 
>> --
>> 2.25.1
>

-- 
Jani Nikula, Intel
