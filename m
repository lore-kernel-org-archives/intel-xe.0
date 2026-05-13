Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D6CCD4851
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 14:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CE210EEBD;
	Wed, 13 May 2026 14:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iZRqOBjB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE0C10EEA4;
 Wed, 13 May 2026 14:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778681964; x=1810217964;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=tWXV9hPhawXhxTxiAsF+R0k3rX4CWNABu+WByqQUgd4=;
 b=iZRqOBjBRsknHGpHEkCavER9/QK5QH3zz8AYc1RbqKzm20R/oW0VSqtT
 8QZ3E/Xe8VOmUMeCykRCJCFC2Udb2E/Dius/h+SXPg76bIpQM+FIAPbaT
 WRXu89sju4JiT01QVk4AQjLtszDfqaLAlQyUwdmXORqprbUnm+GtTkF+X
 ZYk1Fml3pwQ6EC4Vw5X3RYhbySd50/NaD5euRFx9tIBMj21UG2hq3yTpX
 GUhd8UrWGEvOwJtVh9aNdJ873cSi3gxZP4+R5Fk765wNF7a0a9WLls80L
 pbxeEduZg44btbRcCVnnGOLg+nmUTit4hfKbSaadZHg7R/A5bVbuhrZvH g==;
X-CSE-ConnectionGUID: tr2F+i0PQl+ls6iDR2IYKQ==
X-CSE-MsgGUID: t2BV1aZGQKyVAxmZWqfLYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="89916426"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="89916426"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:19:24 -0700
X-CSE-ConnectionGUID: SFFXs38tST6GCQfBqSRQHQ==
X-CSE-MsgGUID: Ws62shZPTJKz9JbpjsveYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="238346458"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.124])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 07:19:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Subject: Re: [RESEND 1/6] drm/{i915, xe}: move
 xe_display_flush_cleanup_work() to i915 display
In-Reply-To: <agRp6Was9FCQbKee@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1778659089.git.jani.nikula@intel.com>
 <7aecde385b66dbf7d0e61759528c6cd643581a3d.1778659089.git.jani.nikula@intel.com>
 <agRp6Was9FCQbKee@intel.com>
Date: Wed, 13 May 2026 17:19:19 +0300
Message-ID: <a6cb2e030e9118084abfc315c557a8b11d8db3d7@intel.com>
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

On Wed, 13 May 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Wed, May 13, 2026 at 10:58:35AM +0300, Jani Nikula wrote:
>> xe_display_flush_cleanup_work() is a bit of an oddball function in xe
>> display code. There shouldn't be anything this specific or xe
>> specific. While I'm not sure what the correct refactor for the function
>> should be, move it to shared display code for starters, next to the
>> eerily similar but slightly different intel_has_pending_fb_unpin() that
>> is only called from i915 core.
>>=20
>> The main goal here is to unblock some refactors on
>> for_each_intel_crtc().
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 21 +++++++++++++++
>>  drivers/gpu/drm/i915/display/intel_display.h |  1 +
>>  drivers/gpu/drm/xe/display/xe_display.c      | 27 +++-----------------
>>  3 files changed, 25 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/=
drm/i915/display/intel_display.c
>> index d5cf1476c7b9..50feca52b962 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -737,6 +737,27 @@ bool intel_has_pending_fb_unpin(struct intel_displa=
y *display)
>>  	return false;
>>  }
>>=20=20
>> +void intel_display_flush_cleanup_work(struct intel_display *display)
>> +{
>> +	struct intel_crtc *crtc;
>> +
>> +	for_each_intel_crtc(display->drm, crtc) {
>> +		struct drm_crtc_commit *commit;
>> +
>> +		spin_lock(&crtc->base.commit_lock);
>> +		commit =3D list_first_entry_or_null(&crtc->base.commit_list,
>> +						  struct drm_crtc_commit, commit_entry);
>> +		if (commit)
>> +			drm_crtc_commit_get(commit);
>> +		spin_unlock(&crtc->base.commit_lock);
>> +
>> +		if (commit) {
>> +			wait_for_completion(&commit->cleanup_done);
>> +			drm_crtc_commit_put(commit);
>> +		}
>> +	}
>> +}
>> +
>>  /*
>>   * Finds the encoder associated with the given CRTC. This can only be
>>   * used when we know that the CRTC isn't feeding multiple encoders!
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/=
drm/i915/display/intel_display.h
>> index a43ada0c0502..65f8c81a7bae 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display.h
>> @@ -402,6 +402,7 @@ void intel_disable_transcoder(const struct intel_crt=
c_state *old_crtc_state);
>>  void i830_enable_pipe(struct intel_display *display, enum pipe pipe);
>>  void i830_disable_pipe(struct intel_display *display, enum pipe pipe);
>>  bool intel_has_pending_fb_unpin(struct intel_display *display);
>> +void intel_display_flush_cleanup_work(struct intel_display *display);
>>  void intel_encoder_destroy(struct drm_encoder *encoder);
>>  struct drm_display_mode *
>>  intel_encoder_current_mode(struct intel_encoder *encoder);
>> diff --git a/drivers/gpu/drm/xe/display/xe_display.c b/drivers/gpu/drm/x=
e/display/xe_display.c
>> index aa73023b7398..ef27fdfdbab2 100644
>> --- a/drivers/gpu/drm/xe/display/xe_display.c
>> +++ b/drivers/gpu/drm/xe/display/xe_display.c
>> @@ -258,27 +258,6 @@ static bool suspend_to_idle(void)
>>  	return false;
>>  }
>>=20=20
>> -static void xe_display_flush_cleanup_work(struct xe_device *xe)
>> -{
>> -	struct intel_crtc *crtc;
>> -
>> -	for_each_intel_crtc(&xe->drm, crtc) {
>> -		struct drm_crtc_commit *commit;
>> -
>> -		spin_lock(&crtc->base.commit_lock);
>> -		commit =3D list_first_entry_or_null(&crtc->base.commit_list,
>> -						  struct drm_crtc_commit, commit_entry);
>> -		if (commit)
>> -			drm_crtc_commit_get(commit);
>> -		spin_unlock(&crtc->base.commit_lock);
>> -
>> -		if (commit) {
>> -			wait_for_completion(&commit->cleanup_done);
>> -			drm_crtc_commit_put(commit);
>> -		}
>> -	}
>> -}
>> -
>>  static void xe_display_enable_d3cold(struct xe_device *xe)
>>  {
>>  	struct intel_display *display =3D xe->display;
>> @@ -292,7 +271,7 @@ static void xe_display_enable_d3cold(struct xe_devic=
e *xe)
>>  	 */
>>  	intel_power_domains_disable(display);
>>=20=20
>> -	xe_display_flush_cleanup_work(xe);
>> +	intel_display_flush_cleanup_work(display);
>>=20=20
>>  	intel_opregion_suspend(display, PCI_D3cold);
>>=20=20
>> @@ -347,7 +326,7 @@ void xe_display_pm_suspend(struct xe_device *xe)
>>  		intel_display_driver_suspend(display);
>>  	}
>>=20=20
>> -	xe_display_flush_cleanup_work(xe);
>> +	intel_display_flush_cleanup_work(display);
>
> intel_display_driver_suspend() already flushes the cleanup wq. So I
> think this is doing nothing. The correct answer seems to be to nuke
> the whole thing. We are missing the wq flush from the shutdown() path
> in i915 however, so I suppose we should add it there.
>
>>=20=20
>>  	intel_encoder_block_all_hpds(display);
>>=20=20
>> @@ -379,7 +358,7 @@ void xe_display_pm_shutdown(struct xe_device *xe)
>>  		intel_display_driver_suspend(display);
>
> This should rather be the same atomic helper shutdown that i915 uses.
> I guess what we want is a intel_display_driver_shutdown() to pair
> up with intel_display_driver_suspend().

Yeah, well, another "Hal fixes a light bulb" moment. I just wanted to
clean up the iterators, but I can't do that with xe having crtc
iteration, which it never should have had in the first place.

I think all of the i915/xe/display probe/cleanup/suspend/resume paths
are a gigantic mess. It was a mess with just i915, and xe added another,
*different* mess. They both do things differently, but *neither* should
be calling low-level display stuff directly.

I'll try to cook something up for this.


BR,
Jani.


>
>>  	}
>>=20=20
>> -	xe_display_flush_cleanup_work(xe);
>> +	intel_display_flush_cleanup_work(display);
>>  	intel_dp_mst_suspend(display);
>>  	intel_encoder_block_all_hpds(display);
>>  	intel_hpd_cancel_work(display);
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
