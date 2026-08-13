Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC5EFC5CFCF
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 15:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CAF710E4C7;
	Thu, 13 Aug 2026 15:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCRyA/E4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E4FB10E43B;
 Thu, 13 Aug 2026 15:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786636348; x=1818172348;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=3QnaZe/oqzykurKA5x/dXF+NHi/Sm+QF0TS/tDuXGFQ=;
 b=bCRyA/E4EPR/gETfzLL8afcZmOPEKvpWlW2m0sBR+h89NbvxCsuiRQVx
 j5Ov3ka8GLDnUaH5j4GLjxtReuFCIuOIfo0DLXvOUTjN8YAvksdzeOavT
 Xl+8U5X2NS+AGyO9KQ13ttDZwPM3TT8IziYj5qRy3sgjd9xFdA75DP9kH
 /167Ml6rv7TkwADw4d7ImjhN87BpucojM8lp+3bnmcNh9xkK6JZlCDzCZ
 dFj1OPqv4TYJM4eqM9p906BTNMHY8b7jm4t3PAntH6TP9ZqEgTXekSQOt
 hHcPh6Bfix1y25hmGMdMC3JKf6+RJu0INiEIocRqczFTdd75QfyB3bcs+ A==;
X-CSE-ConnectionGUID: bPm4TZzVSPaKKAUUsD/rLQ==
X-CSE-MsgGUID: FpfTrFk6Q7WwFdMm8D0hag==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="90892127"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="90892127"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 08:52:27 -0700
X-CSE-ConnectionGUID: PXymNi2vTTGPivKATvJhDQ==
X-CSE-MsgGUID: pdDzmL4HQGyE6C/lkfpz4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; d="scan'208";a="264000338"
Received: from dev-417.igk.intel.com (HELO devbox) ([10.91.214.181])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 08:52:25 -0700
Date: Thu, 13 Aug 2026 17:52:23 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH v10 6/8] drm/i915: override Snps's VS/PE when requested
In-Reply-To: <85c105f4619e348618c048f0ae3e0f8bc49d947b@intel.com>
Message-ID: <6ed43c45-d606-5ddf-7074-678f21501c1c@intel.com>
References: <20260702185839.4042397-1-michal.grzelak@intel.com>
 <20260702185839.4042397-7-michal.grzelak@intel.com>
 <85c105f4619e348618c048f0ae3e0f8bc49d947b@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1897640465-1786618829=:906814"
Content-ID: <1091dc7e-6618-c33c-1e20-1b8e94821eb5@intel.com>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1897640465-1786618829=:906814
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d33ad180-65e3-be5e-1a86-9f2f24003b34@intel.com>

On Tue, 11 Aug 2026, Jani Nikula wrote:
> On Thu, 02 Jul 2026, Micha³ Grzelak <michal.grzelak@intel.com> wrote:
>> Add accessor function for Snps to read requested table from VBT #57.
>> Parse the requested table and transform data into port's buffer.
>>
>> Choose appropriate accessor function in intel_ddi_buf_trans_get() based
>> on display version and PHY type.
>>
>> For C20, use 6th table if encoder supports DP 2.0 or higher. Otherwise
>> use 5th table for DP.
>>
>> For C20, tables 1-4 are not used at all and are most likely to be
>> zeroed. 5th table is used for any mode below DP 2.0 (exclusive). 6th
>> table is used for any mode above DP 2.0 (inclusive).
>>
>> For C10, use 2nd table for external DP if encoder supports any mode
>> beyond or including HBR2. Use 1st table if external DP encoder supports
>> anything lower than HBR2. For eDP, use 4th table if encoder supports
>> HBR3. Otherwise use 3rd table for eDP.
>>
>> For C10, 1st table is used for external DP with modes below HBR2
>> (exclusive). 1st table is also used as a fallback for non-DPs. 2nd
>> table is used for external DP with modes higher than HBR2 (inclusive).
>> 3rd table is used for eDP with modes lower than HBR3 (exclusive). 4th
>> table is used for eDP with modes higher than HBR3 (inclusive).
>>
>> Indices for other tables have not yet been observed to be used as of
>> now.
>>
>> There are no changes to intel_ddi_dp_level() since selection of correct
>> row of intel_ddi_buf_trans_entry is same as when no override request has
>> been done.
>>
>> v9->v10
>> - call dedicated VS/PE-O vfunc
>> - drop deconstifying default tables (Suraj, Jani)
>> - cache `entries` into const field after data is overwritten (Jani)
>>
>> v8->v9
>> - init vspeo before using it
>> - deconstify intel_ddi_buf_trans_entry
>>
>> v7->v8
>> - remove comments (Suraj)
>> - add check for LT (Suraj)
>>
>> v6->v7
>> - handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
>> - remove vspeo's cast to (void *) (Jani)
>> - check devdata->vspeo if VS/PE-O was requested
>> - call encoder->get_buf_trans() once (Jani)
>> - return NULL from intel_bios_get_* when using default (Jani)
>> - validate VS/PE-O in intel_bios.c (Jani)
>> - inline mtl_{c10,c20}_get_vspeo_buf_trans()
>> - remove temporarily LT
>>
>> v4->v5
>> - blend index computation with table parsing
>> - remove enums entirely
>> - change funcs prefix from snps_ to mtl_ (Suraj)
>> - add spaces around operators (Suraj)
>> - remove spaces after type casting (Suraj)
>> - remove INTEL_DISPLAY_STATE_WARN (Suraj)
>>
>> v3->v4
>> - stick to solely changing VBT data into current structures (Jani)
>> - move iterator declaration to declaration block (Suraj)
>>
>> v2->v3
>> - remove unnecessary braces from if block (Suraj)
>> - return -EINVAL instead of -1 (Suraj)
>>
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c     | 104 ++++++++++++++++++
>>  drivers/gpu/drm/i915/display/intel_bios.h     |   7 ++
>>  .../drm/i915/display/intel_ddi_buf_trans.c    |  37 ++++++-
>>  3 files changed, 146 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
>> index a491b8500611..f897ac067585 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -3881,6 +3881,110 @@ bool intel_bios_encoder_supports_tbt(const struct intel_bios_encoder_data *devda
>>  	return devdata->display->vbt.version >= 209 && devdata->child.tbt;
>>  }
>>
>> +static bool
>> +validate_vspeo(const struct intel_bios_encoder_data *devdata, bool has_dp)
>> +{
>> +	struct intel_ddi_buf_trans *vspeo;
>> +
>> +	if (!devdata)
>> +		return false;
>
> When would this be NULL?

Never. I missed that your suggestion makes null pointer dereference seen
earlier [1] no longer possible on Haswell. Will remove it.

>
>> +
>> +	vspeo = devdata->vspeo;
>> +	if (!vspeo)
>> +		return false;
>> +
>> +	if (!has_dp)
>> +		return false;
>> +
>> +	return true;
>> +}
>> +
>> +const struct intel_ddi_buf_trans *
>> +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
>> +			 bool has_dp, bool is_uhbr)
>> +{
>> +	struct intel_display *display;
>> +	union intel_ddi_buf_trans_entry *entries;
>> +	int num_columns, num_rows, level, idx;
>> +	struct intel_ddi_buf_trans *vspeo;
>> +	const u32 *tables;
>> +	size_t offset = 0;
>> +
>> +	if (!validate_vspeo(devdata, has_dp))
>> +		return NULL;
>> +
>> +	display = devdata->display;
>> +	vspeo = devdata->vspeo;
>> +	entries = devdata->entries;
>> +	tables = display->vbt.vspeo.tables;
>> +	num_columns = display->vbt.vspeo.num_columns;
>> +	num_rows = display->vbt.vspeo.num_rows;
>> +	idx = is_uhbr ? 5 : 4;
>
> All of these should just be initialized at declaration.
>
>> +
>> +	offset += idx * num_rows * num_columns;
>> +
>> +	for (level = 0; level < num_rows; level++) {
>> +		u32 vswing = tables[offset];
>> +		u32 pre_cursor = tables[offset + 1];
>> +		u32 post_cursor = tables[offset + 2];
>> +
>> +		entries[level].snps.vswing = vswing;
>> +		entries[level].snps.pre_cursor = pre_cursor;
>> +		entries[level].snps.post_cursor = post_cursor;
>
> The struct dg2_snps_phy_buf_trans (snps) have u8 members. Is the data in
> VBT in only the lowest byte of the u32? Or how is it arranged?

Yes, data in VBT is stored in only lowest byte of u32. Even if other
bytes are set, they should be discarded; that's my reasoning behind this
implicit conversion.

I probably should include it in the commit message.

BR,
Micha³

[1] https://lore.kernel.org/intel-gfx/178042917831.36136.4204902639552043116@6beec6c84f66/

>
>> +
>> +		offset += num_columns;
>> +	}
>> +
>> +	vspeo->entries = entries;
>> +	vspeo->num_entries = num_rows;
>
> It's common to have a blank line before return.
>
>> +	return vspeo;
>> +}
>> +
>> +const struct intel_ddi_buf_trans *
>> +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
>> +			 bool has_dp, int port_clock, bool has_edp)
>> +{
>> +	struct intel_display *display;
>> +	union intel_ddi_buf_trans_entry *entries;
>> +	int num_columns, num_rows, level, idx;
>> +	struct intel_ddi_buf_trans *vspeo;
>> +	const u32 *tables;
>> +	size_t offset = 0;
>> +
>> +	if (!validate_vspeo(devdata, has_dp))
>> +		return NULL;
>> +
>> +	display = devdata->display;
>> +	vspeo = devdata->vspeo;
>> +	entries = devdata->entries;
>> +	tables = display->vbt.vspeo.tables;
>> +	num_columns = display->vbt.vspeo.num_columns;
>> +	num_rows = display->vbt.vspeo.num_rows;
>
> Ditto about initialization.
>
>> +
>> +	idx = port_clock > 270000 ? 1 : 0;
>> +	if (has_edp)
>> +		idx = port_clock > 540000 ? 3 : 2;
>
> if (has_edp)
> 	...
> else
> 	...
>
> seems more idiomatic than assigning twice for has_edp.
>
>> +
>> +	offset += idx * num_rows * num_columns;
>> +
>> +	for (level = 0; level < num_rows; level++) {
>> +		u32 vswing = tables[offset];
>> +		u32 pre_cursor = tables[offset + 1];
>> +		u32 post_cursor = tables[offset + 2];
>> +
>> +		entries[level].snps.vswing = vswing;
>> +		entries[level].snps.pre_cursor = pre_cursor;
>> +		entries[level].snps.post_cursor = post_cursor;
>
> Ditto about u8 vs u32.
>> +
>> +		offset += num_columns;
>> +	}
>> +
>> +	vspeo->entries = entries;
>> +	vspeo->num_entries = num_rows;
>> +
>> +	return vspeo;
>> +}
>> +
>>  bool intel_bios_encoder_is_dedicated_external(const struct intel_bios_encoder_data *devdata)
>>  {
>>  	return devdata->display->vbt.version >= 264 &&
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.h b/drivers/gpu/drm/i915/display/intel_bios.h
>> index 7a50a272cd27..49acf8c405e2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.h
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.h
>> @@ -73,6 +73,13 @@ bool intel_bios_get_dsc_params(struct intel_encoder *encoder,
>>  const struct intel_bios_encoder_data *
>>  intel_bios_encoder_data_lookup(struct intel_display *display, enum port port);
>>
>> +const struct intel_ddi_buf_trans *
>> +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
>> +			 bool has_dp, bool is_uhbr);
>> +const struct intel_ddi_buf_trans *
>> +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
>> +			 bool has_dp, int port_clock, bool has_edp);
>> +
>>  bool intel_bios_encoder_requests_vspeo(const struct intel_bios_encoder_data *devdata);
>>  bool intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data *devdata);
>>  bool intel_bios_encoder_supports_hdmi(const struct intel_bios_encoder_data *devdata);
>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>> index f31283a0331b..92c0d0f933ab 100644
>> --- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>> +++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>> @@ -1784,6 +1784,36 @@ xe3plpd_get_lt_buf_trans(struct intel_encoder *encoder,
>>  		return intel_get_buf_trans(&xe3plpd_lt_trans_dp14, n_entries);
>>  }
>>
>> +static const struct intel_ddi_buf_trans *
>> +mtl_get_c10_buf_trans_override(struct intel_encoder *encoder,
>> +			       const struct intel_crtc_state *crtc_state,
>> +			       int *n_entries)
>> +{
>> +	const struct intel_bios_encoder_data *devdata = encoder->devdata;
>> +	bool has_edp, has_dp;
>> +	int port_clock;
>> +
>> +	has_edp = intel_crtc_has_type(crtc_state, INTEL_OUTPUT_EDP);
>> +	has_dp = intel_crtc_has_dp_encoder(crtc_state);
>> +	port_clock = crtc_state->port_clock;
>> +
>> +	return intel_bios_get_c10_vspeo(devdata, has_dp, port_clock, has_edp);
>> +}
>> +
>> +static const struct intel_ddi_buf_trans *
>> +mtl_get_c20_buf_trans_override(struct intel_encoder *encoder,
>> +			       const struct intel_crtc_state *crtc_state,
>> +			       int *n_entries)
>> +{
>> +	const struct intel_bios_encoder_data *devdata = encoder->devdata;
>> +	bool has_dp, is_uhbr;
>> +
>> +	has_dp = intel_crtc_has_dp_encoder(crtc_state);
>> +	is_uhbr = intel_dp_is_uhbr(crtc_state);
>> +
>> +	return intel_bios_get_c20_vspeo(devdata, has_dp, is_uhbr);
>> +}
>> +
>>  void intel_ddi_buf_trans_init(struct intel_encoder *encoder)
>>  {
>>  	struct intel_display *display = to_intel_display(encoder);
>> @@ -1791,10 +1821,13 @@ void intel_ddi_buf_trans_init(struct intel_encoder *encoder)
>>  	if (HAS_LT_PHY(display)) {
>>  		encoder->get_buf_trans = xe3plpd_get_lt_buf_trans;
>>  	} else if (DISPLAY_VER(display) >= 14) {
>> -		if (intel_encoder_is_c10phy(encoder))
>> +		if (intel_encoder_is_c10phy(encoder)) {
>>  			encoder->get_buf_trans = mtl_get_c10_buf_trans;
>> -		else
>> +			encoder->get_buf_trans_override = mtl_get_c10_buf_trans_override;
>> +		} else {
>>  			encoder->get_buf_trans = mtl_get_c20_buf_trans;
>> +			encoder->get_buf_trans_override = mtl_get_c20_buf_trans_override;
>> +		}
>>  	} else if (display->platform.dg2) {
>>  		encoder->get_buf_trans = dg2_get_snps_buf_trans;
>>  	} else if (display->platform.alderlake_p) {
>
> -- 
> Jani Nikula, Intel
>
--8323329-1897640465-1786618829=:906814--
