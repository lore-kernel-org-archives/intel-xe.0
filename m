Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BA9C021B8
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 23:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CB9110E37B;
	Mon, 24 Feb 2025 23:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pd31wN6R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4923E10E37B
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Feb 2025 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740440205; x=1771976205;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iBg3kIuk78i57uWOWINafPSshtGOUGY9TrWM5VU9bBQ=;
 b=Pd31wN6RFJfDniyFDjcbhk63gXbn7aT6LcVlgbBP6uLUQ9QdhQdGqCY1
 hU7uA9oG5ha9j/WxXxn561lIR6EfTDsjS2EmmDMIKp2JKRgym5hpsRJ1+
 jxCWILkD2U0b8y6PuDqgDAtrNWyODK7FUMBplJys+sp2Yz1cJI8nfmb0j
 6uhr7SY+owjb68YTM/eam6d8Bsn7JZvwHTc0Uffqyygb3WfcdW5kZX20a
 j+hhepq6J6Zf5JqIm15ynUyD8kv/MbM+xgD3GsCdCg2H/0mR6DR/Nj2ju
 0UMhwDrvjJLHEQt7Bn3rIHGaMEGzDHXTri1cXfn6T8blYd5rBieFe052n w==;
X-CSE-ConnectionGUID: n2W0GMrmQee9oxFKlZJ9QQ==
X-CSE-MsgGUID: nwG4nH82S/617C77ln57lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40457083"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="40457083"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 15:36:41 -0800
X-CSE-ConnectionGUID: joolK0YJSeeRqDdt1UHXvw==
X-CSE-MsgGUID: NYP9J7R1SsSoUk2JpppA8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="121177520"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 24 Feb 2025 15:36:26 -0800
Received: from [10.245.80.79] (mwajdecz-MOBL.ger.corp.intel.com [10.245.80.79])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 865642877B;
 Mon, 24 Feb 2025 23:36:26 +0000 (GMT)
Message-ID: <954fb6cf-0298-4dd5-ba55-6c340c2f1fdc@intel.com>
Date: Tue, 25 Feb 2025 00:36:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] drm/xe/rtp: Prepare RTP to define SR-IOV specific
 rules
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20250224150700.1778-1-michal.wajdeczko@intel.com>
 <20250224150700.1778-2-michal.wajdeczko@intel.com>
 <20250224194113.GC5109@mdroper-desk1.amr.corp.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250224194113.GC5109@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 24.02.2025 20:41, Matt Roper wrote:
> On Mon, Feb 24, 2025 at 04:06:56PM +0100, Michal Wajdeczko wrote:
>> Almost all currently defined workaround actions are dedicated
>> for the driver running in a privileged mode (native or SR-IOV PF)
>> and those actions should not be used when running in the VF mode.
>>
>> While we can easily skip any attempt to apply tile, engine or
>> LRC workarounds by doing early exit, it's not so easy with OOB
>> workarounds, as on exception basis, there could be some actions
>> expected to be done also by the VF driver.
> 
> A bit orthogonal to the specific patch you're adding here, but stepping
> back and thinking about this for a moment...does it actually make sense
> for LRC workarounds to not apply to VF?  I can understand the tile, gt,
> and engine workarounds not applying since presumably there's only one
> setting at the hardware level and the VFs would use the setting the PF
> had programmed into the hardware.  But LRC workarounds seem different
> because the hardware value is expected to update with each context
> switch to whatever is in the incoming context's LRC.  If we don't apply
> LRC workarounds in a VF, then the actual LRC getting switched in won't
> be inheriting anything from the VF, but rather using whatever unmodified
> value is present in the VF's default LRC.
> 
> Am I overlooking somoething here or should we actually be handling LRC
> workarounds in a different manner?
> 

from commit 9632dfb0def4 ("drm/xe/vf: Don't run any save-restore RTP
actions if VF") we are doing early exit from xe_rtp_process_to_sr() that
is also used for LRC WAs

and IIUC the Bspec:52398 says that VFs can write only to allowed
registers within the engines, which our chicken WA regs are not, so all
LRI will be NOP'ed anyway

>>
>> Since we process OOB rules also in the SR-IOV VF mode, we had to
>> explicitly decline the ones that were not applicable for VF, by
>> using FUNC(xe_rtp_match_not_sriov_vf). However that may not
>> scale well, since most future workarounds will likely not be
>> needed in VF mode.
>>
>> Instead of forcing us to append more and more FUNC(not_sriov_vf)
>> to potentially every new OOB workaround, change the RTP logic
>> and assume that RTP rules are not applicable to VFs by default,
>> unless there will be added a special SRIOV(VF_READY) rule.
>>
>> As of today only no_media_l3 OOB workaround seems to be applicable
>> also for the VF mode, since the value of MIRROR_FUSE3(0x9118) from
>> the PF is likely unreliable, so mark that WA as VF_READY right away.
>>
>> For completeness define also SRIOV(ONLY) to require PF or VF mode,
>> SRIOV(PF_ONLY) to require PF mode and SRIOV(VF_ONLY) for VF mode.
> 
> For the purposes of a workaround, what would be the difference between
> PF mode and native?  

in PF mode (controlled by xe.max_vfs param) we must retain possibility
to enable VFs, so we might need to make different steps

> I.e., what kind of language in a workaround
> description would signal to us that we need PF_ONLY (or SRIOV(ONLY))?

what about "in PF mode we shouldn't modify XXX or enable YYY, or we must
use different setup for ZZZ, where XXX/YYY/ZZZ are native features, as
otherwise we would completely block VFs enabling"

> Do we have any historic examples of these?

not yet, but in rev1 I was also assuming that VF_READY is just a ready
to use solution for some future undefined yet exception case, but was
shortly pointed by the CI that there is one already (no_media_l3)

> 
> 
> Matt
> 
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> ---
>> v2: tag no_media_l3 workaround as VF_READY
>> ---
>>  drivers/gpu/drm/xe/xe_rtp.c        | 20 +++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_rtp.h        |  8 ++++++++
>>  drivers/gpu/drm/xe/xe_rtp_types.h  |  4 ++++
>>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 +-
>>  4 files changed, 32 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index 7a1c78fdfc92..b607be981590 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -37,6 +37,7 @@ static bool rule_matches(const struct xe_device *xe,
>>  {
>>  	const struct xe_rtp_rule *r;
>>  	unsigned int i, rcount = 0;
>> +	bool vf_ready = false;
>>  	bool match;
>>  
>>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>> @@ -110,6 +111,22 @@ static bool rule_matches(const struct xe_device *xe,
>>  		case XE_RTP_MATCH_FUNC:
>>  			match = r->match_func(gt, hwe);
>>  			break;
>> +		case XE_RTP_MATCH_SRIOV_VF_READY:
>> +			match = true;
>> +			vf_ready = true;
>> +			break;
>> +		case XE_RTP_MATCH_SRIOV_VF_ONLY:
>> +			match = IS_SRIOV_VF(xe);
>> +			vf_ready = match;
>> +			break;
>> +		case XE_RTP_MATCH_SRIOV_PF_ONLY:
>> +			match = IS_SRIOV_PF(xe);
>> +			vf_ready = false;
>> +			break;
>> +		case XE_RTP_MATCH_SRIOV_ONLY:
>> +			match = IS_SRIOV(xe);
>> +			vf_ready = match;
>> +			break;
>>  		default:
>>  			drm_warn(&xe->drm, "Invalid RTP match %u\n",
>>  				 r->match_type);
>> @@ -128,6 +145,7 @@ static bool rule_matches(const struct xe_device *xe,
>>  				return false;
>>  
>>  			rcount = 0;
>> +			vf_ready = false;
>>  		} else {
>>  			rcount++;
>>  		}
>> @@ -137,7 +155,7 @@ static bool rule_matches(const struct xe_device *xe,
>>  	if (drm_WARN_ON(&xe->drm, !rcount))
>>  		return false;
>>  
>> -	return true;
>> +	return IS_SRIOV_VF(xe) ? vf_ready : true;
>>  }
>>  
>>  static void rtp_add_sr_entry(const struct xe_rtp_action *action,
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.h b/drivers/gpu/drm/xe/xe_rtp.h
>> index 38b9f13bba5e..7874ea8588db 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp.h
>> @@ -207,6 +207,14 @@ struct xe_reg_sr;
>>  #define XE_RTP_RULE_IS_DISCRETE							\
>>  	{ .match_type = XE_RTP_MATCH_DISCRETE }
>>  
>> +/**
>> + * XE_RTP_RULE_SRIOV - Create a SR-IOV rule for Virtual Functions
>> + *
>> + * Refer to XE_RTP_RULES() for expected usage.
>> + */
>> +#define XE_RTP_RULE_SRIOV(TAG)							\
>> +	{ .match_type = XE_RTP_MATCH_SRIOV_##TAG }
>> +
>>  /**
>>   * XE_RTP_RULE_OR - Create an OR condition for rtp rules
>>   *
>> diff --git a/drivers/gpu/drm/xe/xe_rtp_types.h b/drivers/gpu/drm/xe/xe_rtp_types.h
>> index 1b76b947c706..02c4e67906cc 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp_types.h
>> +++ b/drivers/gpu/drm/xe/xe_rtp_types.h
>> @@ -53,6 +53,10 @@ enum {
>>  	XE_RTP_MATCH_ENGINE_CLASS,
>>  	XE_RTP_MATCH_NOT_ENGINE_CLASS,
>>  	XE_RTP_MATCH_FUNC,
>> +	XE_RTP_MATCH_SRIOV_VF_READY,
>> +	XE_RTP_MATCH_SRIOV_VF_ONLY,
>> +	XE_RTP_MATCH_SRIOV_PF_ONLY,
>> +	XE_RTP_MATCH_SRIOV_ONLY,
>>  	XE_RTP_MATCH_OR,
>>  };
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 228436532282..ff9da494efcf 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -40,6 +40,6 @@
>>  16023588340	GRAPHICS_VERSION(2001)
>>  14019789679	GRAPHICS_VERSION(1255)
>>  		GRAPHICS_VERSION_RANGE(1270, 2004)
>> -no_media_l3	MEDIA_VERSION(3000)
>> +no_media_l3	MEDIA_VERSION(3000), SRIOV(VF_READY)
>>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
>> -- 
>> 2.47.1
>>
> 

