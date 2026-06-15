Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A13CD98CF
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jun 2026 14:33:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3238A10E49A;
	Mon, 15 Jun 2026 14:33:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OuQw5HYP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D60D10E48B;
 Mon, 15 Jun 2026 14:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781534023; x=1813070023;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=anczurSsi/vvEJkuBBaX+xvJlZ9dLBA9riKIUd8mxu4=;
 b=OuQw5HYP22Sx+SzO+9YzIC0fKzIQ90s2LCSfTd9207ESemUcykkhHsq0
 oNNqM4Dr/Lz3c+iooWPuBF3l9p9MgRtwWPoBTkdQjfDufEByzN1RDdKV6
 v92jr9QsJPUQaI9XeAePi4mhuNFg5P/QsItwl1WSdYb6yWLkl9/yQz4KD
 2XM5PScHfXrexjVc85KIwgLLYvDpsRKuH9cPF+9j3wuK9/bp/fH2NMUh0
 5l5SfkgG9umfAvuU5PB46GyZQMvczgq1i2F0PIpgXiHIfurx/hNtRvN2q
 QhM6D12h30nD+3CbnwVip3k8/0RDc0wBAERUIJJfMlfq5aoW5KCsNPm4L A==;
X-CSE-ConnectionGUID: h6cKbs0bQRm9PFBfF6Q84A==
X-CSE-MsgGUID: dX9lsMr2S7SOrwOwIEgGTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82258689"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82258689"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 07:33:42 -0700
X-CSE-ConnectionGUID: hb/Wa0NmQKOzDI+7vEInQQ==
X-CSE-MsgGUID: 7SLR+EsnToGpC0xqiCBWWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="243121043"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 07:33:41 -0700
Date: Mon, 15 Jun 2026 16:33:39 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
cc: "Grzelak, Michal" <michal.grzelak@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v7 5/8] drm/i915: override Snps's VS/PE when requested
In-Reply-To: <DS4PPFE901A304FC6AABC8D3D5262E54D49E3E62@DS4PPFE901A304F.namprd11.prod.outlook.com>
Message-ID: <9a5db92a-92ff-4f7a-ce0e-e63534c12afc@intel.com>
References: <20260608192821.3414590-1-michal.grzelak@intel.com>
 <20260608192821.3414590-6-michal.grzelak@intel.com>
 <DS4PPFE901A304F558E4AAFD937F7AD21A4E3E62@DS4PPFE901A304F.namprd11.prod.outlook.com>
 <DS4PPFE901A304FC6AABC8D3D5262E54D49E3E62@DS4PPFE901A304F.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1711786600-1781534022=:605841"
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

--8323329-1711786600-1781534022=:605841
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Mon, 15 Jun 2026, Kandpal, Suraj wrote:
>> Subject: RE: [PATCH v7 5/8] drm/i915: override Snps's VS/PE when requested
>>
>>
>>> Subject: [PATCH v7 5/8] drm/i915: override Snps's VS/PE when requested
>>>
>>> Add accessor function for Snps to read requested table from VBT #57.
>>> Parse the requested table and transform data into port's buffer.
>>>
>>> Choose appropriate accessor function in intel_ddi_buf_trans_get()
>>> basing on
>>
>> * based
>>
>>> display version and PHY type.
>>>
>>> For C20, use 6th table if encoder supports DP 2.0 or higher. Otherwise
>>> use 5th table for DP.
>>>
>>> For C20, tables 1-4 are not used at all and are most likely to be
>>> zeroed. 5th table is used for any mode below DP 2.0 (exclusive). 6th
>>> table is used for any mode above DP 2.0 (inclusive).
>>>
>>> For C10, use 2nd table for external DP if encoder supports any mode
>>> beyond or including HBR2. Use 1st table if external DP encoder
>>> supports anything lower than HBR2. For eDP, use 4th table if encoder
>>> supports HBR3. Otherwise use 3rd table for eDP.
>>>
>>> For C10, 1st table is used for external DP with modes below HBR2
>> (exclusive).
>>> 1st table is also used as a fallback for non-DPs. 2nd table is used
>>> for external DP with modes higher than HBR2 (inclusive).
>>> 3rd table is used for eDP with modes lower than HBR3 (exclusive). 4th
>>> table is used for eDP with modes higher than HBR3 (inclusive).
>>>
>>> Indices for other tables have not yet been observed to be used as of now.
>>>
>>> There are no changes to intel_ddi_dp_level() since selection of
>>> correct row of intel_ddi_buf_trans_entry is same as when no override
>>> request has been done.
>>>
>>> v6->v7
>>> - handle VS/PE-O's VBT details in intel_bios_* functions (Jani)
>>> - remove vspeo's cast to (void *) (Jani)
>>> - check devdata->vspeo if VS/PE-O was requested
>>> - call encoder->get_buf_trans() once (Jani)
>>> - return NULL from intel_bios_get_* when using default (Jani)
>>> - validate VS/PE-O in intel_bios.c (Jani)
>>> - inline mtl_{c10,c20}_get_vspeo_buf_trans()
>>> - remove temporarily LT
>>>
>>> v4->v5
>>> - blend index computation with table parsing
>>> - remove enums entirely
>>> - change funcs prefix from snps_ to mtl_ (Suraj)
>>> - add spaces around operators (Suraj)
>>> - remove spaces after type casting (Suraj)
>>> - remove INTEL_DISPLAY_STATE_WARN (Suraj)
>>>
>>> v3->v4
>>> - stick to solely changing VBT data into current structures (Jani)
>>> - move iterator declaration to declaration block (Suraj)
>>>
>>> v2->v3
>>> - remove unnecessary braces from if block (Suraj)
>>> - return -EINVAL instead of -1 (Suraj)
>>>
>>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_bios.c     | 100 ++++++++++++++++++
>>>  drivers/gpu/drm/i915/display/intel_bios.h     |   7 ++
>>>  .../drm/i915/display/intel_ddi_buf_trans.c    |  21 ++++
>>>  3 files changed, 128 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c
>>> b/drivers/gpu/drm/i915/display/intel_bios.c
>>> index 3d8864374cac..59ffb5bc8848 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>>> @@ -3861,6 +3861,106 @@ bool intel_bios_encoder_supports_tbt(const
>>> struct intel_bios_encoder_data *devda
>>>  	return devdata->display->vbt.version >= 209 && devdata->child.tbt;
>>> }
>>>
>>> +static bool
>>> +validate_vspeo(const struct intel_bios_encoder_data *devdata, bool
>>> +has_dp) {
>>
>> Ahh ohkay so you deal with that allocation problem this way. This seems good
>> too.
>>
>>
>>> +	struct intel_ddi_buf_trans *vspeo;
>>> +
>>> +	if (!devdata)
>>> +		return false;
>>> +
>>> +	/* if vspeo is allocated then VS/PE-O was requested */
>>> +	vspeo = devdata->vspeo;
>>> +	if (!vspeo)
>>> +		return false;
>>> +
>>> +	/* if crtc_state has eDP it also has DP */
>>> +	if (!has_dp)
>>> +		return false;
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +const struct intel_ddi_buf_trans *
>>> +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
>>> +			 bool has_dp, bool is_uhbr)
>>> +{
>>> +	struct intel_display *display;
>>> +	union intel_ddi_buf_trans_entry *entries;
>>> +	int num_columns, num_rows, level, idx;
>>> +	struct intel_ddi_buf_trans *vspeo;
>>> +	const u32 *tables;
>>> +	size_t offset = 0;
>>> +
>>> +	if (!validate_vspeo(devdata, has_dp))
>>> +		return NULL;
>>> +
>>> +	display = devdata->display;
>>> +	entries = (void *)vspeo->entries;
>>> +	tables = display->vbt.vspeo.tables;
>>> +	num_columns = display->vbt.vspeo.num_columns;
>>> +	num_rows = display->vbt.vspeo.num_rows;
>>> +	idx = is_uhbr ? 5 : 4;
>>> +
>>> +	offset += idx * num_rows * num_columns;
>>> +
>>> +	for (level = 0; level < num_rows; level++) {
>>> +		u32 vswing = tables[offset];
>>> +		u32 pre_cursor = tables[offset + 1];
>>> +		u32 post_cursor = tables[offset + 2];
>>> +
>>> +		entries[level].snps.vswing = vswing;
>>> +		entries[level].snps.pre_cursor = pre_cursor;
>>> +		entries[level].snps.post_cursor = post_cursor;
>>> +
>>> +		offset += num_columns;
>>> +	}
>>> +
>>> +	return vspeo;
>>> +}
>>> +
>>> +const struct intel_ddi_buf_trans *
>>> +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
>>> +			 bool has_dp, int port_clock, bool has_edp) {
>>> +	struct intel_display *display;
>>> +	union intel_ddi_buf_trans_entry *entries;
>>> +	int num_columns, num_rows, level, idx;
>>> +	struct intel_ddi_buf_trans *vspeo;
>>> +	const u32 *tables;
>>> +	size_t offset = 0;
>>> +
>>> +	if (!validate_vspeo(devdata, has_dp))
>>> +		return NULL;
>>> +
>>> +	display = devdata->display;
>>> +	vspeo = devdata->vspeo;
>>> +	entries = (void *)vspeo->entries;
>>> +	tables = display->vbt.vspeo.tables;
>>> +	num_columns = display->vbt.vspeo.num_columns;
>>> +	num_rows = display->vbt.vspeo.num_rows;
>>> +
>>> +	idx = port_clock > 270000 ? 1 : 0;
>>> +	if (has_edp)
>>> +		idx = port_clock > 540000 ? 3 : 2;
>>> +
>>> +	offset += idx * num_rows * num_columns;
>>> +
>>> +	for (level = 0; level < num_rows; level++) {
>>> +		u32 vswing = tables[offset];
>>> +		u32 pre_cursor = tables[offset + 1];
>>> +		u32 post_cursor = tables[offset + 2];
>>> +
>>> +		entries[level].snps.vswing = vswing;
>>> +		entries[level].snps.pre_cursor = pre_cursor;
>>> +		entries[level].snps.post_cursor = post_cursor;
>>> +
>>> +		offset += num_columns;
>>> +	}
>>> +
>>> +	return vspeo;
>>> +}
>>> +
>>>  bool intel_bios_encoder_is_dedicated_external(const struct
>>> intel_bios_encoder_data *devdata)  {
>>>  	return devdata->display->vbt.version >= 264 && diff --git
>>> a/drivers/gpu/drm/i915/display/intel_bios.h
>>> b/drivers/gpu/drm/i915/display/intel_bios.h
>>> index 7a50a272cd27..49acf8c405e2 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_bios.h
>>> +++ b/drivers/gpu/drm/i915/display/intel_bios.h
>>> @@ -73,6 +73,13 @@ bool intel_bios_get_dsc_params(struct intel_encoder
>>> *encoder,  const struct intel_bios_encoder_data *
>>> intel_bios_encoder_data_lookup(struct intel_display *display, enum
>>> port port);
>>>
>>> +const struct intel_ddi_buf_trans *
>>> +intel_bios_get_c20_vspeo(const struct intel_bios_encoder_data *devdata,
>>> +			 bool has_dp, bool is_uhbr);
>>> +const struct intel_ddi_buf_trans *
>>> +intel_bios_get_c10_vspeo(const struct intel_bios_encoder_data *devdata,
>>> +			 bool has_dp, int port_clock, bool has_edp);
>>> +
>>>  bool intel_bios_encoder_requests_vspeo(const struct
>>> intel_bios_encoder_data *devdata);  bool
>>> intel_bios_encoder_supports_dvi(const struct intel_bios_encoder_data
>>> *devdata);  bool intel_bios_encoder_supports_hdmi(const struct
>>> intel_bios_encoder_data *devdata); diff --git
>>> a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>>> b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>>> index 4cd1e4d76c7a..b4120b9c49b2 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c
>>> @@ -1857,5 +1857,26 @@ const struct intel_ddi_buf_trans
>>> *intel_ddi_buf_trans_get(struct intel_encoder *
>>>  							  const struct
>>> intel_crtc_state *crtc_state,
>>>  							  int *n_entries)
>>>  {
>>> +	struct intel_display *display = to_intel_display(encoder);
>>> +	const struct intel_bios_encoder_data *devdata = encoder->devdata;
>>> +	const struct intel_ddi_buf_trans *buf_trans = NULL;
>>> +	bool has_edp, has_dp, is_uhbr;
>>> +	int port_clock;
>>> +
>>> +
>>> +	is_uhbr = intel_dp_is_uhbr(crtc_state);
>>> +	port_clock = crtc_state->port_clock;
>>
>> We don't need a separate port_clock variable its just called at one place just
>> directly use crtc_state->port_clock.

Later patches also use port_clock for eg. Combo, so I think it
could be better to retain it in current state instead of overwritting
it. Assuming that it is right approach of course.

BR,
Michał

>>
>>> +
>>> +	if (DISPLAY_VER(display) >= 14) {
>>
>> This needs to use >= 14 && < 35 so that this does not spill into LT PHY territory
>>
>>> +		if (intel_encoder_is_c10phy(encoder))
>>> +			buf_trans = intel_bios_get_c10_vspeo(devdata,
>>> has_dp, port_clock, has_edp);
>>> +		else
>>> +			buf_trans = intel_bios_get_c20_vspeo(devdata,
>>> has_dp, is_uhbr);
>>> +	}
>>> +
>>> +	if (buf_trans)
>>> +		return intel_get_buf_trans(buf_trans, n_entries);
>>
>> I think this code block belongs inside the above if block guarded by
>> DISPLAY_VER check
>
> Or maybe not since this later becomes a else if ladder you can ignore this comment.
>
> Regards,
> Suraj Kandpal
>
>>
>> Regards,
>> Suraj Kandpal
>>
>>> +
>>>  	return encoder->get_buf_trans(encoder, crtc_state, n_entries);  }
>>> --
>>> 2.45.2
>
>
--8323329-1711786600-1781534022=:605841--
