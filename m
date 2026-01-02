Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF9BFA374F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Jan 2026 15:13:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1850A10E00C;
	Fri,  2 Jan 2026 15:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzX1NYNa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB64310E00C
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Jan 2026 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767366793; x=1798902793;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=NNjEIeUPvUA6/zg+Rraf9fdBT1V5mljTVtoPNs9ejF0=;
 b=PzX1NYNaALjWEs0Ldty1Acf4NWKTO0Qm9LdPAtTvPJVwQrU+c4vwhCav
 wPPD6prLEmMNrcyfkNKdxtI5yoZDlYVQ5zA5mNefssyHQ8R7JSKPnA/MP
 gDaIb79DBRnCzveSTg7vmEx9AigUeTuVUaR09S9z9GYrcaaNFFvOnayas
 dBdXVjMNGkuk+sDI19t2AwjMUXvA9LDa+9WjwUH3ynwP0ToqQhgPBX27N
 rxJMpYUxqSdCw8udb5GZrS9vm889g5+Wqze+L3bdN/OTHOZlI/NYRHl29
 7NgoNx4rBJVES3XLy9cl31et5DUfQre4NrBrytytQP26ZD77SlXiEpqm9 Q==;
X-CSE-ConnectionGUID: lTGt7IAaTbyVmcmF0OHiAg==
X-CSE-MsgGUID: 6CNg8LJFRf+cqPZWbFGkhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="67869453"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="67869453"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 07:13:12 -0800
X-CSE-ConnectionGUID: fv34LGmfT1uE2RjghD82zg==
X-CSE-MsgGUID: ZgnBcubASoC9AbVirdSh/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; d="scan'208";a="202301333"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.226])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jan 2026 07:13:10 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org, anshuman.gupta@intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH] drm/xe: select CONFIGFS_FS dependency
In-Reply-To: <af33cc10-3b5e-44a3-8a51-8e5ae71091cc@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251219080513.848072-2-riana.tauro@intel.com>
 <aUV3dk3wUpf7U6tP@intel.com>
 <a4928fe2e89de39161f8b794e798998a3fbebdd1@intel.com>
 <af33cc10-3b5e-44a3-8a51-8e5ae71091cc@intel.com>
Date: Fri, 02 Jan 2026 17:13:07 +0200
Message-ID: <58dca887809c8b87a137762225ccd2c43a74cdd8@intel.com>
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

On Fri, 02 Jan 2026, Riana Tauro <riana.tauro@intel.com> wrote:
> On 12/22/2025 6:12 PM, Jani Nikula wrote:
>> On Fri, 19 Dec 2025, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>>> On Fri, Dec 19, 2025 at 01:35:14PM +0530, Riana Tauro wrote:
>>>> Xe driver uses configfs functions to expose configuration to userspace.
>>>> If CONFIGFS_FS is built as module (=m) when Xe is built-in (=y),
>>>> undefined reference errors occur.
>>>
>>> Perhaps we don't need  this middle phrase. Only the first and the last.
>>> But anyway, we need the patch in. I just pushed it.
>> 
>> I think the correct fix to this one would've been
>> 
>> 	depends on CONFIGFS_FS || CONFIGFS_FS=n
>> 
>
> I tried this but it causes Kconfig recursive dependencies because some 
> configs select CONFIGFS_FS
>
> error: recursive dependency detected!
>          symbol DRM_XE depends on CONFIGFS_FS
>          symbol CONFIGFS_FS is selected by NET_9P_USBG
>          symbol NET_9P_USBG depends on USB_GADGET
>          symbol USB_GADGET is selected by USB_EHCI_TEGRA
>          symbol USB_EHCI_TEGRA depends on USB
>          symbol USB is selected by MOUSE_APPLETOUCH
>          symbol MOUSE_APPLETOUCH depends on INPUT
>          symbol INPUT is selected by DRM_XE

Yeah, it's the same old thing over and over and over and over again. A
symbol should really only be either selected or depended on, and only
non-visible symbols with no dependencies should be selected.

Documentation/kbuild/kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

DRM_XE also shouldn't select INPUT, and we have that because it's a hack
to work around other selects:

drivers/gpu/drm/xe/Kconfig:

	# xe depends on ACPI_VIDEO when ACPI is enabled
	# but for select to work, need to select ACPI_VIDEO's dependencies, ick

Then people work around the issues by throwing more selects around
everywhere, making the mess even harder to untangle.


BR,
Jani.


>
>
> Thanks
> Riana
>
>> BR,
>> Jani.
>> 
>>>
>>> Thanks,
>>> Rodrigo.
>>>
>>>> Add select CONFIGFS_FS to ensure configfs is built at minimum required
>>>> level.
>>>>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190827.IeXYj4qg-lkp@intel.com/
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512181854.hPyTAXc5-lkp@intel.com/
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202512190407.CcUFXX2F-lkp@intel.com/
>>>> Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/Kconfig | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>>> index 4b288eb3f5b0..1094c5fc5bdf 100644
>>>> --- a/drivers/gpu/drm/xe/Kconfig
>>>> +++ b/drivers/gpu/drm/xe/Kconfig
>>>> @@ -46,6 +46,7 @@ config DRM_XE
>>>>   	select WANT_DEV_COREDUMP
>>>>   	select AUXILIARY_BUS
>>>>   	select REGMAP if I2C
>>>> +	select CONFIGFS_FS
>>>>   	help
>>>>   	  Driver for Intel Xe2 series GPUs and later. Experimental support
>>>>   	  for Xe series is also available.
>>>> -- 
>>>> 2.47.1
>>>>
>> 
>

-- 
Jani Nikula, Intel
