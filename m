Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D440C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 13:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4867110E2FF;
	Tue, 14 May 2024 13:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPQO/jOd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB8010E2FF
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 13:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715694383; x=1747230383;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ZnH22opmoinInK/0E/WnJeOiv7Ko+GfTM0vT4tpue4I=;
 b=KPQO/jOdr37/q2F05UKYhSOSB3GA3RSlOwdbB3MnSf021cLxvCmASFkb
 4i9SYFroEaBYKZjIah69YFGUlRR6CgP5dHDEWV8VKpyswIbyZMX+HlbdA
 DOmYU9nvk43Z1VvGWPMitbPun0eWqZDiRKtPuQ6FIh7ihndIS0tBOb5Tz
 cWIpDvhGw2p+Fbjn+bwsczW33jWPXEdrlUu9Dlc2Ekp3J60UCjU5RL76a
 qMOHmHooJNggTjn3oq09olxbPklaRlbbVUCVuryk71jhrw7OR7BhkljIh
 g7Dsbtv4M915q0KF2dKf8hr1kcuxa+T30/1Kod6gVeiFzpyR+IW0LRE73 g==;
X-CSE-ConnectionGUID: sKJrCypKT9Sr0lPKENAAjQ==
X-CSE-MsgGUID: hSJmZt8kTjOdYEjKjISfMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15498094"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15498094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 06:46:21 -0700
X-CSE-ConnectionGUID: DJMq0nKiTpevOKziFk2crA==
X-CSE-MsgGUID: uw0i0pBBTKC9MCfPiygD6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="35574793"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa004.jf.intel.com with ESMTP; 14 May 2024 06:46:19 -0700
Received: from [10.246.1.253] (mwajdecz-MOBL.ger.corp.intel.com [10.246.1.253])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 5421028169;
 Tue, 14 May 2024 14:46:17 +0100 (IST)
Message-ID: <b49e6b94-ce29-43d8-af23-19366ba45578@intel.com>
Date: Tue, 14 May 2024 15:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Don't advertise support to enable VFs if not
 ready
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
 <aqh6x2lwhruly3g4pxjiljnbodaxidb6np6tievlxk4ivq4nbt@b3z2lzsdectv>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aqh6x2lwhruly3g4pxjiljnbodaxidb6np6tievlxk4ivq4nbt@b3z2lzsdectv>
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



On 14.05.2024 15:09, Lucas De Marchi wrote:
> On Tue, May 07, 2024 at 06:57:57PM GMT, Michal Wajdeczko wrote:
>> Even if we have not enabled SR-IOV support using the platform
>> specific has_sriov flag, the hardware may still report SR-IOV
>> capability and the PCI layer may wrongly advertise driver support
>> to enable VFs.  Explicitly reset the number of supported VFs to
>> zero to avoid confusion.
>>
>> Applications may read the /sys/bus/pci/devices/.../sriov_totalvfs
>> prior to enabling VFs using the sriov_numvfs to check if such an
>> operation is possible.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_sriov.c | 11 +++++++++++
>> 1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c
>> b/drivers/gpu/drm/xe/xe_sriov.c
>> index 1c3fa84b6adb..a274a5fb1401 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -53,6 +53,7 @@ static bool test_is_vf(struct xe_device *xe)
>>  */
>> void xe_sriov_probe_early(struct xe_device *xe)
>> {
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>     enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>>     bool has_sriov = xe->info.has_sriov;
>>
>> @@ -61,6 +62,16 @@ void xe_sriov_probe_early(struct xe_device *xe)
>>             mode = XE_SRIOV_MODE_VF;
>>         else if (xe_sriov_pf_readiness(xe))
>>             mode = XE_SRIOV_MODE_PF;
>> +    } else if (pci_sriov_get_totalvfs(pdev)) {
>> +        /*
>> +         * Even if we have not enabled SR-IOV support using the
>> +         * platform specific has_sriov flag, the hardware may still
>> +         * report SR-IOV capability and the PCI layer may wrongly
>> +         * advertise driver support to enable VFs. Explicitly reset
>> +         * the number of supported VFs to zero to avoid confusion.
> 
> Aren't these 2 different things? The PCI layer is reporting SR-IOV
> availability as reported by the HW, which doesn't mean the driver
> supports it.

Without support in our PF driver we can't support any VFs, even if HW is
reporting that it can. What we do here is aligned what the PCI layer is
expecting from the PF drivers if there is something to adjust - see [1]

/sys/bus/pci/devices/.../sriov_totalvfs

"This file appears when a physical PCIe device supports SR-IOV.
Userspace applications can read this file to determine the
maximum number of Virtual Functions (VFs) a PCIe physical
function (PF) can support. Typically, this is the value reported
in the PF's SR-IOV extended capability structure's TotalVFs
element.  Drivers have the ability at probe time to reduce the
value read from this file via the pci_sriov_set_totalvfs()
function"

[1]
https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing/sysfs-bus-pci#L289


> 
> Lucas De Marchi
> 
>> +         */
>> +        drm_info(&xe->drm, "Support for SR-IOV is not available\n");
>> +        pci_sriov_set_totalvfs(pdev, 0);
>>     }
>>
>>     xe_assert(xe, !xe->sriov.__mode);
>> -- 
>> 2.43.0
>>
