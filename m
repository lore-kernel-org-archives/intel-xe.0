Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAAEBCD6E57
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 22:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFAA11241F;
	Wed,  3 Jun 2026 22:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9rG1FPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAA111241F;
 Wed,  3 Jun 2026 22:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780525457; x=1812061457;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rxqipI2h7MPum3jvWlpIUC3cbex52Ks1hL22FFtcnrU=;
 b=H9rG1FPk5mOv7BacXS/kzbzFXBkGwhH7B/I0A+MbIULlOIwxc3/8e4cP
 rj4xDAVT6D0UF5lKRn0fB5eJBEUZLKSm5IiYeL5ueftK9sqiRCo16w/eC
 besmUow6D/72iX5N32ND8tf4pHbBgA3e/azQtPY+w687v/MwpkHoX7IlL
 bLujbMgNeqjHAd0Za6F83URQNLunPr6n37e2p9FXt3IruQ35sgaSRzTl1
 OU8+AaBdtv1Rz1sqMCtHBYKb08PgIGtjWIL1Au5diEijixXT8FF/alve6
 LBhro2q3hbetKYTZXPuLxNEamguw7NTX9WkIyhao4rWSGfXSgNLalLF9D Q==;
X-CSE-ConnectionGUID: UgPRe4dXSsCgBY4/8HYdyQ==
X-CSE-MsgGUID: eZMIHmxAT+SdWG44xMIXxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="83925385"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="83925385"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 15:24:16 -0700
X-CSE-ConnectionGUID: bOjypI9QQ0uov3/4cQF3JQ==
X-CSE-MsgGUID: RqGnvEa5RVCAYcRpP4AW6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="282460998"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 15:24:15 -0700
Date: Thu, 4 Jun 2026 00:24:13 +0200 (CEST)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
cc: "Grzelak, Michal" <michal.grzelak@intel.com>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v5 2/8] drm/i915/bios: store VBT #57's metadata in
 intel_vbt_data
In-Reply-To: <PH3PPFE26A71A1E4DC8DBCC80C029631B11E3132@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
Message-ID: <3a751ac1-7f91-0bd7-bcb6-0d57f2c040af@intel.com>
References: <20260602170031.1163205-1-michal.grzelak@intel.com>
 <20260602170031.1163205-3-michal.grzelak@intel.com>
 <PH3PPFE26A71A1E4DC8DBCC80C029631B11E3132@PH3PPFE26A71A1E.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-188236975-1780525456=:1544314"
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

--8323329-188236975-1780525456=:1544314
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Jun 2026, Kandpal, Suraj wrote:
>> Subject: [PATCH v5 2/8] drm/i915/bios: store VBT #57's metadata in
>> intel_vbt_data
>>
>> Store tables, number of tables, number of rows and number of columns in
>> intel_vbt_data when search for the VBT #57 has succeeded. Structurize all
>> VS/PE-O relevant metadata inside anonymous struct named as vspeo.
>>
>> Display version determines number of rows present in each table. pre-MTL
>> platforms should have 10 rows while MTL+ should have 16 rows.
>>
>> v3->v4
>> - remove unnecessary init of VS/PE-O metadata (Suraj)
>> - add helper for computing number of rows (Suraj)
>> - fix num_rows's type (Jani, Suraj)
>> - declare num_rows (Suraj)
>>
>> Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_bios.c         | 10 +++++++++-
>>  drivers/gpu/drm/i915/display/intel_display_core.h |  7 +++++++
>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_bios.c
>> b/drivers/gpu/drm/i915/display/intel_bios.c
>> index 420b09b4d01ef..d071f0e5d4380 100644
>> --- a/drivers/gpu/drm/i915/display/intel_bios.c
>> +++ b/drivers/gpu/drm/i915/display/intel_bios.c
>> @@ -2185,6 +2185,11 @@ parse_compression_parameters(struct
>> intel_display *display)
>>  	}
>>  }
>>
>> +static int vswing_preemph_num_rows(struct intel_display *display) {
>> +	return DISPLAY_VER(display) >= 14 ? 16 : 10; }
>> +
>
> Bspec: 68963
> Tells me that no of rows is not display version dependent rather it cares if we
> Are using UHBR or not. DP 1.4 being 10 and DP 2.1 being 16

That is correct, but now I realized I haven't mentioned one thing yet. I
agree that it's not precisely display version dependant; and also DP1.4
should have 10 rows while D2.X should have 16. But it's because number
of row is dependant on the PHY type. I don't think there is any helper
for determining PHY type in intel_bios.c, the only I see is
intel_encoder_is_c10phy() from intel_cx0_phy.c but it operates on
intel_encoder. So as for now I am using this rough helper since it quite
strongly coincides with PHY types.

Will update commit message and add Bspec number.

BR,
Michał

>
> Regards,
> Suraj Kandpal
>
>>  static void
>>  parse_vswing_preemph_override(struct intel_display *display)  { @@ -2199,7
>> +2204,10 @@ parse_vswing_preemph_override(struct intel_display *display)
>>  	if (!block)
>>  		return;
>>
>> -	drm_dbg_kms(display->drm, "valid VS/PE-O request but not yet
>> supported\n");
>> +	display->vbt.vspeo.tables = block->tables;
>> +	display->vbt.vspeo.num_tables = block->num_tables;
>> +	display->vbt.vspeo.num_columns = block->num_columns;
>> +	display->vbt.vspeo.num_rows = vswing_preemph_num_rows(display);
>>  }
>>
>>  static u8 translate_iboost(struct intel_display *display, u8 val) diff --git
>> a/drivers/gpu/drm/i915/display/intel_display_core.h
>> b/drivers/gpu/drm/i915/display/intel_display_core.h
>> index 09ce25a6d4b11..061bf479458f0 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_core.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_core.h
>> @@ -242,6 +242,13 @@ struct intel_vbt_data {
>>  	struct list_head display_devices;
>>  	struct list_head bdb_blocks;
>>
>> +	struct {
>> +		const u32 *tables;
>> +		int num_tables;
>> +		int num_columns;
>> +		int num_rows;
>> +	} vspeo;
>> +
>>  	struct sdvo_device_mapping {
>>  		u8 initialized;
>>  		u8 dvo_port;
>> --
>> 2.45.2
>
>
--8323329-188236975-1780525456=:1544314--
