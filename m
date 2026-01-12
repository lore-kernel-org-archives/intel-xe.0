Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFBED25044
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 08:11:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278D610E04C;
	Mon, 12 Jan 2026 08:11:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipceBbc+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3766310E04C
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768205489; x=1799741489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jJ3DIP6fWtPv3elD5JP0Z8ZL02GFnF7DhLb9plcPvTM=;
 b=ipceBbc+F1e0LJS6LmW4YgWWOd05gKyL9h4+9QwAtlKRXAt0OFhTGDS3
 bNpMbVSbHsWJmYi3gBVVV5yyb0MvBcFsS7uhk1M+hZ/o0mE0d+sp0mWZ9
 KxP6Eeq51mooV8Mp1UsKPlit5xzw7F3gPt/FhOeT0/NDXO1XS4rcDvz0q
 ITrwsOi0xHgs6HbNmLQGPwpa1zoUrxCSIcSMcxxp5hOqJhwO8Ptn2Z7O3
 V6UrtsQEz5fKdlv2UdxjJ69YlHYsxZXRLbsH4Yd+IsEYuuaBsPMeQNPUV
 6PrQRMFE2vZvWyfCT0m/jS7eNtm1Ua6Gj3crmAmM6oH8357KVJrX7LVXe A==;
X-CSE-ConnectionGUID: rh7PIHl8T/CrKvSC8tW7Ug==
X-CSE-MsgGUID: o+kLWIWdTpmRQIkDyMSTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="87062084"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="87062084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:11:29 -0800
X-CSE-ConnectionGUID: +wMWGhxlQKyo3qJfRc7Kpg==
X-CSE-MsgGUID: +RNl9NkaQBWOK8J1OcT8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="234724224"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:11:28 -0800
Date: Mon, 12 Jan 2026 09:11:24 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Subject: Re: [PATCH v5 4/4] drm/xe/hwmon: Expose individual vram channel
 temperature
Message-ID: <aWSsrNRG4dDjf2PY@black.igk.intel.com>
References: <20260109201644.736483-1-karthik.poosa@intel.com>
 <20260109201644.736483-5-karthik.poosa@intel.com>
 <aWJ9EK0bi7f6WNRH@black.igk.intel.com>
 <79952244-7068-4d03-b142-aa15c81e2b59@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79952244-7068-4d03-b142-aa15c81e2b59@intel.com>
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

On Sun, Jan 11, 2026 at 12:52:39AM +0530, Poosa, Karthik wrote:
> On 10-01-2026 21:53, Raag Jadav wrote:
> > On Sat, Jan 10, 2026 at 01:46:44AM +0530, Karthik Poosa wrote:

...

> > > +static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> > > +{
> > > +	struct xe_reg vram_ch_temp;
> > > +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> > > +
> > > +	vram_ch_temp = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> > > +	if (xe_reg_is_valid(vram_ch_temp) && xe_mmio_read32(mmio, vram_ch_temp)) {
> > > +		/* Create label only for available vram channel */
> > > +		sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N], "vram_ch_%d",
> > > +			(channel - CHANNEL_VRAM_N));
> > > +		return 1;
> > > +	}
> > > +	return 0;
> > > +}
> > I'd write this as
> > 
> > static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> > {
> >          struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> >          int vram_id = channel - CHANNEL_VRAM_N;
> >          struct xe_reg vram_reg;
> > 
> >          vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> >          if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> >                  return false;
> > 
> >          /* Create label only for available vram channel */
> >          sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> >          return true;
> > }
> I'll agree with vram_id and boolean values, for readability,
> other than that I would like to stick to current implementation.

The usual practice is early return negative cases, but upto you.

Also, just curious: Do we need the 'ch' string here? We already know
it's channel, right?

> > >   static umode_t
> > >   xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > >   {
> > > @@ -903,6 +944,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > >   		case CHANNEL_MCTRL:
> > >   		case CHANNEL_PCIE:
> > >   			return hwmon->temp.count ? 0444 : 0;
> > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> > Shouldn't we also check hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]?
> that can be secondary check, then this would apply to all channels !

For the channels that return data from the mailbox, we'd want to make sure
the data source is also working. Else we'll have dummy attributes exposing
no useful data.

> > >   		default:
> > >   			return 0;
> > >   		}
> > > @@ -915,6 +958,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > >   		case CHANNEL_MCTRL:
> > >   		case CHANNEL_PCIE:
> > >   			return hwmon->temp.count ? 0444 : 0;
> > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> > Ditto, hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]?
> > 
> > >   		default:
> > >   			return 0;
> > >   		}
> > > @@ -935,6 +980,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
> > >   		case CHANNEL_MCTRL:
> > >   		case CHANNEL_PCIE:
> > >   			return hwmon->temp.count ? 0444 : 0;
> > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > +			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> > >   		default:
> > >   			return 0;
> > >   		}
> > > @@ -963,6 +1010,16 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > >   			return get_mc_temp(hwmon, val);
> > >   		case CHANNEL_PCIE:
> > >   			return get_pcie_temp(hwmon, val);
> > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > > +			reg_val = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_TEMP, channel));
> > > +			/*
> > > +			 * This temperature format is bit 31 for sign, bits [30:8] for whole number
> > > +			 * and bits [7:0] for fraction
> > Nit: "Temperature format is 24 bits [31:8] signed integer and
> > 8 bits [7:0] fraction."
> > 
> > > +			 */
> > > +			*val = (s32)(REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val)) */
> > > +				(REG_FIELD_GET(TEMP_SIGN_MASK, reg_val) ? -1 : 1) *
> > Since you're already casting it, I'm wondering if you need to check
> > for sign?
> |REG_FIELD_GET() returns unsigned type, which gets stored |the lower 24 bits
> of an |s32|, discarding the sign bit; consequently, negative values are
> interpreted as positive, requiring an explicit sign check.

Would something like this work?

	s32 vram_n = (reg_val & TEMP_SIGN_MASK) | REG_FIELD_GET(TEMP_MASK_VRAM_N, reg_val);

	*val = vram_n * MILLIDEGREE_PER_DEGREE;
	return 0;

> > > +				 MILLIDEGREE_PER_DEGREE;
> > > +			return 0;
> > >   		default:
> > >   			return -EOPNOTSUPP;
> > >   		}
> > > @@ -974,6 +1031,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > >   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> > >   			return 0;
> > >   		case CHANNEL_VRAM:
> > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > >   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] * MILLIDEGREE_PER_DEGREE;
> > >   			return 0;
> > >   		default:
> > > @@ -987,6 +1045,7 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
> > >   			*val = hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] * MILLIDEGREE_PER_DEGREE;
> > >   			return 0;
> > >   		case CHANNEL_VRAM:
> > > +		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> > >   			*val = hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] * MILLIDEGREE_PER_DEGREE;
> > >   			return 0;
> > >   		default:
> > > @@ -1356,16 +1415,20 @@ static int xe_hwmon_read_label(struct device *dev,
> > >   			       enum hwmon_sensor_types type,
> > >   			       u32 attr, int channel, const char **str)
> > >   {
> > > +	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
> > > +
> > >   	switch (type) {
> > >   	case hwmon_temp:
> > >   		if (channel == CHANNEL_PKG)
> > >   			*str = "pkg";
> > >   		else if (channel == CHANNEL_VRAM)
> > > -			*str = "vram";
> > > +			*str = "vram_avg";
> > If you look at the readings this is actually not average, so it's a bit
> > misleading.
> 
> what is your suggestion for that label here ?

Since this is a stable ABI, let's first make sure that we can actually
change output string. If we can, then something like vram_high or
vram_peak would be more appropriate.

Note: This is different from _max attribute which signifies the limit.

Raag

> > >   		else if (channel == CHANNEL_MCTRL)
> > >   			*str = "mctrl";
> > >   		else if (channel == CHANNEL_PCIE)
> > >   			*str = "pcie";
> > > +		else if (channel >= CHANNEL_VRAM_N && channel <= CHANNEL_VRAM_N_MAX)
> > > +			*str = hwmon->temp.vram_label[channel - CHANNEL_VRAM_N];
> > >   		return 0;
> > >   	case hwmon_power:
> > >   	case hwmon_energy:
> > > -- 
> > > 2.25.1
> > > 
