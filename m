Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43479C3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 17:40:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027F210E460;
	Mon, 15 Jul 2024 17:40:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jl8aT20l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CA010E460
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721065252; x=1752601252;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=XipcFsKH+8oJ2TmCOUt6zWgQ6AFrWvJEsAWNXoyvgbc=;
 b=Jl8aT20lQftReUUrCzrG2ndVc15LDeOm/s3m57yuiQcKcDpJ/xkKbEWq
 4zQdQsFFO0Y3ahL+niUOkUYsvwYw9OZR2SovHOeT/7xPGOO29pfCjcHl9
 ff79TSMFMVbyhXxjYmjk42p1EYR7ceAspczecvXffn5edBXcuyMTCX4Tm
 DJTVsK1e+OARJalYSdgus30SPtloII1xD5kpd5cuO1LXUlbEUgXox4y2W
 b9eGusALo1hRp8OeAcNDuMWZgUMVumwH9Gu5bUCIdRrAf+vWFg4iVIL3k
 Pi6M6/62+3eG0/Y0TxMcCpU57tmzL1NDhhzenUY6q2h4XTAc0xIlUMGbM w==;
X-CSE-ConnectionGUID: mtb0Q0VOTMGOaLCmy2ZQCw==
X-CSE-MsgGUID: HQZlP4CZQQigfdmF6nfbmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="12557338"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="12557338"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 10:40:51 -0700
X-CSE-ConnectionGUID: OA76D9vcS6uEU4Swb9KzSQ==
X-CSE-MsgGUID: gGCxZZGjT0eT3hLpLYKG3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="54871000"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2024 10:40:49 -0700
Received: from [10.94.248.120] (mwajdecz-MOBL.ger.corp.intel.com
 [10.94.248.120])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id C6F1F32EAB;
 Mon, 15 Jul 2024 18:40:47 +0100 (IST)
Message-ID: <64a46ab4-6b7c-49e0-862c-cb8829658d54@intel.com>
Date: Mon, 15 Jul 2024 19:40:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Restore TotalVFs
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20240715114052.1330-1-michal.wajdeczko@intel.com>
 <rzlfgpxzbypgidpwtybd4usfsdk7kic4ieqjzawzpjziv2vj65@tp7zl6unxjpx>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <rzlfgpxzbypgidpwtybd4usfsdk7kic4ieqjzawzpjziv2vj65@tp7zl6unxjpx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 15.07.2024 19:09, Lucas De Marchi wrote:
> On Mon, Jul 15, 2024 at 01:40:52PM GMT, Michal Wajdeczko wrote:
>> If we update TotalVFs to a new value and fail the .probe() then
>> the PCI subsystem will not restore original value, which might
>> impact next .probe() attempt. As a backup plan, use managed action
>> to restore it ourselves.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
>> ---
>> Attempt to fix that at PCI layer is here [1], but until it will be
>> available for us, we can still fix that on our side.
>>
>> [1]
>> https://lore.kernel.org/linux-pci/20240715102835.1286-1-michal.wajdeczko@intel.com/
> 
> I don't think we should merge this while that is pending with no reply.
> If that is not accepted, then we can think about doing this.

fair enough, but idea was to have it little sooner so it will help Piotr
with his quite frequent issue

> 
>> ---
>> drivers/gpu/drm/xe/xe_sriov_pf.c | 48 +++++++++++++++++++++++++++-----
>> 1 file changed, 41 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> index 0f721ae17b26..d61933770f1c 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
>> @@ -17,12 +17,40 @@ static unsigned int wanted_max_vfs(struct
>> xe_device *xe)
>>     return xe_modparam.max_vfs;
>> }
>>
>> -static int pf_reduce_totalvfs(struct xe_device *xe, int limit)
>> +static void restore_totalvfs(void *arg)
>> +{
>> +    struct xe_device *xe = arg;
>> +    struct device *dev = xe->drm.dev;
>> +    struct pci_dev *pdev = to_pci_dev(dev);
>> +    int totalvfs = xe->sriov.pf.device_total_vfs;
>> +
>> +    xe_sriov_dbg_verbose(xe, "restoring totalvfs to %d\n", totalvfs);
>> +    pci_sriov_set_totalvfs(pdev, totalvfs);
>> +}
>> +
>> +static int pf_reduce_totalvfs(struct xe_device *xe, u16 limit)
> 
>         ^^^^^^
> 
> so the current logic assumes the maximum comes from BIOS, but it could
> rather come from a previous (failed) driver load? once we set the value
> is the information lost from the device or can we recover it from
> somewhere?
> somewhere != where we saved in the this driver.

PCI layer keeps the original value read from the device PCI config space
and currently restores it only on .remove but not after failed .probe

[2] https://elixir.bootlin.com/linux/latest/source/drivers/pci/iov.c#L934

lucky for us, we already were caching this original value for debugfs
reporting, so it's quite easy to restore it by ourselves

> 
> 
>> {
>>     struct device *dev = xe->drm.dev;
>>     struct pci_dev *pdev = to_pci_dev(dev);
>>     int err;
>>
>> +    xe->sriov.pf.device_total_vfs = pci_sriov_get_totalvfs(pdev);
>> +    xe->sriov.pf.driver_max_vfs = limit;
>> +
>> +    xe_sriov_dbg_verbose(xe, "reducing totalvfs from %u to %u\n",
>> +                 xe->sriov.pf.device_total_vfs,
>> +                 xe->sriov.pf.driver_max_vfs);
>> +
>> +    /*
>> +     * XXX: If we update TotalVFs to a new value and fail the .probe()
> 
> why XXX?

as only this chunk (comment/call) could be removed when [1] lands on our
tree, but even if it stays it will be harmless

> 
>> +     * then the PCI subsystem might not restore original TotalVFs value,
>> +     * which might impact next .probe() attempt. As a backup plan, use
>> +     * managed action to restore it ourselves.
>> +     *
>> +     * Note that it's not critical if registering that action fails.
>> +     */
>> +    devm_add_action(xe->drm.dev, restore_totalvfs, xe);
>> +
>>     err = pci_sriov_set_totalvfs(pdev, limit);
>>     if (err)
>>         xe_sriov_notice(xe, "Failed to set number of VFs to %d (%pe)\n",
>> @@ -37,6 +65,14 @@ static bool pf_continue_as_native(struct xe_device
>> *xe, const char *why)
>>     return false;
>> }
>>
>> +static bool pf_continue_ready(struct xe_device *xe, u16 max_vfs)
>> +{
>> +    xe_assert(xe, max_vfs > 0);
>> +    xe_sriov_dbg(xe, "preparing for %u VF%s\n", max_vfs,
>> str_plural(max_vfs));
>> +    pf_reduce_totalvfs(xe, max_vfs);
>> +    return true;
> 
> what's the point of splitting this function that always return true? I'd
> rather leave it where it was

I've moved statements to store device_total_vfs & driver_max_vfs to
pf_reduce_totalvfs() so below function is now just a _dispatcher_ and
this function name also acts a self-comment

> 
> Lucas De Marchi
> 
>> +}
>> +
>> /**
>>  * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
>>  * @xe: the &xe_device to check
>> @@ -58,18 +94,16 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>>     if (!dev_is_pf(dev))
>>         return false;
>>
>> +    if (!totalvfs)
>> +        return pf_continue_as_native(xe, "no VFs reported");
>> +
>>     if (!xe_device_uc_enabled(xe))
>>         return pf_continue_as_native(xe, "Guc submission disabled");
>>
>>     if (!newlimit)
>>         return pf_continue_as_native(xe, "all VFs disabled");
>>
>> -    pf_reduce_totalvfs(xe, newlimit);
>> -
>> -    xe->sriov.pf.device_total_vfs = totalvfs;
>> -    xe->sriov.pf.driver_max_vfs = newlimit;
>> -
>> -    return true;
>> +    return pf_continue_ready(xe, newlimit);
>> }
>>
>> /**
>> -- 
>> 2.43.0
>>
