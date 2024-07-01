Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA1C30653
	for <intel-xe@archiver.kernel.org>; Mon,  1 Jul 2024 11:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0197A10E39B;
	Mon,  1 Jul 2024 11:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bunjk37U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD7C10E39B
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Jul 2024 11:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719831663; x=1751367663;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qx4qoBTq/Yzv8NdtB1dS4hQuZwy1B90WQNiTcXHpDtQ=;
 b=Bunjk37U6+ktA0XGK+cSLm6tNRSbU2V2Tz/4rZJV9X9l9SeazUNmnLo/
 loFcXRflDreP6DnDL6K6eTC2rlXr+Z85IzvIupQRFu6maqKZEX1L7i9Il
 bNVOwZkpKYpOZjtHh7MsczcfqQAw++8LMelQIQtkF2tTpPQV2K0Aqo5oc
 5mocjZ01A562OBfZRpgtLgtjALXHzR1CBmAOptdPMBHIdFT4ZnD36LdD7
 ou17uQJRBs2aY78KBZNDEgp7Eyi1UGCQzW7JWe72qtNP6f/OSKa16D+Ty
 a3S3C2kTD+u4wM4GuekkqIro2GHOCknN0IvpDYr15Q9qXZrAXI5A6T+0t w==;
X-CSE-ConnectionGUID: jvBdLNkiRIyyO68rtNwtkQ==
X-CSE-MsgGUID: Xghqupz1SO2lApH0O0GHiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="28345250"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28345250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 04:01:02 -0700
X-CSE-ConnectionGUID: ShrGqBjXQoeRA2sr4eX2tA==
X-CSE-MsgGUID: CmGRAhFcTkeMpzAM8aDSag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="50085685"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jul 2024 04:01:00 -0700
Received: from [10.245.82.99] (unknown [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 8280228160;
 Mon,  1 Jul 2024 12:00:58 +0100 (IST)
Message-ID: <fb0e3f23-f4c0-46f7-a7fe-53df450cbe3d@intel.com>
Date: Mon, 1 Jul 2024 13:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [CI] HAX: Try SR-IOV on ADLP/ATSM
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?B?xYF1a2FzeiDFgWFndW5h?= <lukasz.laguna@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20240624120203.1169-1-michal.wajdeczko@intel.com>
 <Zn8GQZo5Qh8oHvIn@intel.com> <61ccf2a7-290e-4eec-86eb-bada852e1e6d@intel.com>
 <tnfd4uxownbmvetljuqvc3lipnpotramxiuqktxipke5hpdfop@xxk4pdlgzcy6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <tnfd4uxownbmvetljuqvc3lipnpotramxiuqktxipke5hpdfop@xxk4pdlgzcy6>
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



On 28.06.2024 22:58, Lucas De Marchi wrote:
> On Fri, Jun 28, 2024 at 10:22:07PM GMT, Michal Wajdeczko wrote:
>>
>>
>> On 28.06.2024 20:51, Rodrigo Vivi wrote:
>>> On Mon, Jun 24, 2024 at 02:02:03PM +0200, Michal Wajdeczko wrote:
>>>> This is for CI only. DO NOT REVIEW. DO NOT MERGE.
>>>
>>> how are these tests looking like at this moment?
>>
>> IMO quite good
> `
> can you list all the tests are covering the sriov enabling?

from what I can see from the results [1] below, we have:

* sriov_basic@enable-vfs-autoprobe-off, see [5]

test will validate whether the PF is able to configure VFs (in
auto-provisioning mode) and then enable any number of supported VFs,
from 1 VF to 7 or more VFs, without actually loading the VF drivers

* sriov_basic@enable-vfs-autoprobe-on, see [6]

like above, but all VF drivers will be loaded automatically by the PCI
subsystem (could be treated as stress-test)

* sriov_basic@bind-unbind-vf, see [7]

like above, but each VF driver will be loaded separately by the test

* igt@sriov_basic@enable-vfs-bind-unbind-each

like above, but each VF driver will be loaded and then unloaded
separately by the test (it should be less stress-full)


+ Lukasz who can tell more about the plans for full SR-IOV validation


[5]
https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@enable-vfs-autoprobe-off.html

[6]
https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@enable-vfs-autoprobe-on.html

[7]
https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@bind-unbind-vf.html

[8]
https://intel-gfx-ci.01.org/tree/intel-xe/igt@sriov_basic@enable-vfs-bind-unbind-each.html

> 
> Also it'd be good to have an "admin guide" to use it.

at the moment we would like to rely only on the default VFs
configurations, aka auto-provisioning, so to enable or disable the VFs
we should only use existing mechanism exposed by the PCI subsystem
attribute 'sriov_numvfs', described in [9]

once we have VF devices enabled, we can use them almost as any other PCI
device, including running IGT tests, where we can specify target device:

	--device pci:slot=0000:4d:00.1

where 0000:4d:00.1 is BDF of the VF1

our experimental/advanced knobs to prepare custom VF configurations,
exposed by the PF driver over debugfs [10], should be used with care and
currently are only aimed for debug/tuning purposes

[9]
https://elixir.bootlin.com/linux/latest/source/Documentation/ABI/testing/sysfs-bus-pci#L302

[10]
https://cgit.freedesktop.org/drm/drm-tip/tree/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c

> 
>>
>> recent run [1] just uncovered two existing issues that actually are not
>> related to the Xe SR-IOV code:
>>
>> first problem [2]:
>>
>> Starting dynamic subtest: vf-2
>> (sriov_basic:1395) igt_device-WARNING: Couldn't find PCI device
>> 0000:00:02:02
>>
>> was due to a test bug, attempt to fix that is under review [3]
>>
>>
>> second problem [4]:
>>
>> <7> [259.552619] BUG: MAX_LOCKDEP_KEYS too low!
>> <7> [259.552626] turning off the locking correctness validator.
>>
>> was reproduced on driver running in non-SRIOV mode (native), not sure
>> whether public bug was created for it, though
>>
>>
>> [1]
>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/index.html?testfilter=iov
>>
>> [2]
>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-2/igt@sriov_basic@bind-unbind-vf.html
>>
>> [3] https://patchwork.freedesktop.org/series/135476/
>>
>> [4]
>> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135295v2/shard-adlp-1/igt@sriov_basic@enable-vfs-autoprobe-on.html#dmesg-warnings1677
>>
>>
>>> I'm wondering if it is already time to add this patch to topic/xe-for-CI
>>
>> it would be great, as this patch allows running few basic SR-IOV tests
>> (including VF driver probe) on the existing BAT/FULL CI runs, so with
>> minimal effort we will be able to catch regressions/breaks that impacts
>> the VF driver.
>>
>> note that being a PF driver by default shouldn't impact any existing
>> results or functionality, as any resources needed for VFs are reserved
>> only when VFs are enable during the SR-IOV tests.
>>
>> additional resources used by the PF until VF are enabled are negligible
>>
>>>
>>> Thomas? Lucas? thoughts?
> 
> 
> //  Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> on merging to topic/xe-for-CI branch.
> 
> thanks
> Lucas De Marchi
