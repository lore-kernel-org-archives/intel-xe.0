Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66CDC48BF6
	for <intel-xe@archiver.kernel.org>; Thu, 29 Feb 2024 19:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7300810E59D;
	Thu, 29 Feb 2024 19:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="aGDakqKV";
	dkim-atps=neutral
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B40A310E59D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Feb 2024 19:45:00 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1709235640; bh=w85pemn9eBCAffAc/Enf4hKOW+K6TCm2a67ObBLntSI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aGDakqKV+QDDhFqih1pioi9dIpNM4Oh3tuF+CSkA6JzeDHMWvJx+pc5qx6Yp/w5PS
 WjQZT14RoOdF/3KYIX07AcTNsXi3pSDVSwPrRrl6J3AVNxX8MO1Gl/wO3ihkckYXlK
 sE2ej9X478JRv4wTf5An0tq8pqQ4O594qZzKHPl9HVMqDb1LiMNn+pyMiuWvLj5rPP
 feH0GWVyI5gq6AOaGv5yXDx40dY7+v8gOJCQl2hDVRhodb6kVzQ0hAN/FX+Zp/ktW9
 IeGGgjKs9LfYTNVPtA2Zn2vVdAtYrmBO+bAKKvZOHfxryzRYGA4mMsrG/b8G0PN3sA
 dLqeYefUni23w==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 ESMTP id 41TJeYId2405218; Thu, 29 Feb 2024 21:40:34 +0200
Date: Thu, 29 Feb 2024 21:40:34 +0200
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Masahiro Yamada <masahiroy@kernel.org>, intel-xe@lists.freedesktop.org,
 ogabbay@kernel.org, obitton@habana.ai
Subject: Re: [PATCH v2] drm/xe: Do not include current dir for
 generated/xe_wa_oob.h
Message-ID: <53v2j7axbrcem66llnozzvtsz3nksi2hgjgk6qhsmybga7jzln@ummz32n6hddp>
References: <20240221083622.1584492-1-dhirschfeld@habana.ai>
 <87sf1fmn9l.fsf@intel.com>
 <CAK7LNASkdW6d77bfoSV36mUmZtYuUvwyMn653N1tZg3q7gM60A@mail.gmail.com>
 <875xybmdt8.fsf@intel.com>
 <lfw7i6ch2u6tmsu5m6iqpyvuoeqrwkwfyqzb4p4k5bguptj5dj@u5nlw7fm4jjn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lfw7i6ch2u6tmsu5m6iqpyvuoeqrwkwfyqzb4p4k5bguptj5dj@u5nlw7fm4jjn>
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

On 26.02.2024 10:17, Lucas De Marchi wrote:
>On Mon, Feb 26, 2024 at 05:43:15PM +0200, Jani Nikula wrote:
>>On Mon, 26 Feb 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:
>>>On Mon, Feb 26, 2024 at 9:19 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>>
>>>>On Wed, 21 Feb 2024, Dafna Hirschfeld <dhirschfeld@habana.ai> wrote:
>>>>> The generated file 'generated/xe_wa_oob.h' is included using:
>>>>> "generated/xe_wa_oob.h"
>>>>> which first look inside the source code. But the file resides
>>>>> in the build directory and should therefore be included using:
>>>>> <generated/xe_wa_oob.h>
>>>>
>>>>Is this documented anywhere?
>>>>
>>>>Is "generated" as a name special?
>>>
>>>
>>>No.
>>>
>>>
>>>It works because drivers/gpu/drm/xe/Makefile
>>>has this line:
>>>
>>>  subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
>>>
>>>
>>>
>>>
>>>generated/xe_wa_oob.h is relative to the
>>>include path -I$(obj).
>>>
>>>
>>>Hence, #include <generated/xe_wa_oob.h> can
>>>include $(obj)/generated/xe_wa_oob.h
>>
>>Thanks!
>>
>>I guess the only real difference here would be if there was a
>>$(src)/generated/xe_wa_oob.h, which would be found first if double
>>quotes "" were used.
>
>which you will have if you mix an out-of-dir build with one that is not
>without properly cleaning it.
>
>I **think** that was the original problem that triggered this patch
>submission, but Dafna can confirm if that was really the case.
>

Hi, yes, this was the case.
Thanks,
Dafna

>Lucas De Marchi
>
>>
>>It's just that using angle brackets <> for something that isn't under
>>the top level include hierarchy feels wrong to me.
>>
>>BR,
>>Jani.
>>
>>>
>>>>
>>>>Cc: Masahiro.
>>>>
>>>>
>>>>BR,
>>>>Jani.
>>>>
>>>>
>>>>>
>>>>> Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>>>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>>
>>>>> ---
>>>>> v2 changes: add newline, change patch title
>>>>>
>>>>>  drivers/gpu/drm/xe/xe_gsc.c            | 3 ++-
>>>>>  drivers/gpu/drm/xe/xe_guc.c            | 3 ++-
>>>>>  drivers/gpu/drm/xe/xe_migrate.c        | 3 ++-
>>>>>  drivers/gpu/drm/xe/xe_ring_ops.c       | 3 ++-
>>>>>  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
>>>>>  drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
>>>>>  drivers/gpu/drm/xe/xe_wa.c             | 3 ++-
>>>>>  7 files changed, 14 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>>>> index 0b90fd9ef63a..a61994292c43 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>>>> @@ -7,8 +7,9 @@
>>>>>
>>>>>  #include <drm/drm_managed.h>
>>>>>
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "abi/gsc_mkhi_commands_abi.h"
>>>>> -#include "generated/xe_wa_oob.h"
>>>>>  #include "xe_bb.h"
>>>>>  #include "xe_bo.h"
>>>>>  #include "xe_device.h"
>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>>>> index 868208a39829..fa217f5a386e 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>>>> @@ -7,9 +7,10 @@
>>>>>
>>>>>  #include <drm/drm_managed.h>
>>>>>
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "abi/guc_actions_abi.h"
>>>>>  #include "abi/guc_errors_abi.h"
>>>>> -#include "generated/xe_wa_oob.h"
>>>>>  #include "regs/xe_gt_regs.h"
>>>>>  #include "regs/xe_guc_regs.h"
>>>>>  #include "xe_bo.h"
>>>>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> index 3d2438dc86ee..a66fdf2d2991 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>>> @@ -12,7 +12,8 @@
>>>>>  #include <drm/ttm/ttm_tt.h>
>>>>>  #include <drm/xe_drm.h>
>>>>>
>>>>> -#include "generated/xe_wa_oob.h"
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "instructions/xe_mi_commands.h"
>>>>>  #include "regs/xe_gpu_commands.h"
>>>>>  #include "tests/xe_test.h"
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>> index d5e9621428ef..c4edffcd4a32 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>>> @@ -5,7 +5,8 @@
>>>>>
>>>>>  #include "xe_ring_ops.h"
>>>>>
>>>>> -#include "generated/xe_wa_oob.h"
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "instructions/xe_mi_commands.h"
>>>>>  #include "regs/xe_engine_regs.h"
>>>>>  #include "regs/xe_gpu_commands.h"
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>> index 662f1e9bfc65..3107d2a12426 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>>>> @@ -11,7 +11,8 @@
>>>>>  #include <drm/ttm/ttm_placement.h>
>>>>>  #include <drm/ttm/ttm_range_manager.h>
>>>>>
>>>>> -#include "generated/xe_wa_oob.h"
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "regs/xe_gt_regs.h"
>>>>>  #include "regs/xe_regs.h"
>>>>>  #include "xe_bo.h"
>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>>>> index 836a6e849cda..efe9a0d300c0 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>> @@ -18,6 +18,8 @@
>>>>>  #include <linux/mm.h>
>>>>>  #include <linux/swap.h>
>>>>>
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "xe_assert.h"
>>>>>  #include "xe_bo.h"
>>>>>  #include "xe_device.h"
>>>>> @@ -34,7 +36,6 @@
>>>>>  #include "xe_res_cursor.h"
>>>>>  #include "xe_sync.h"
>>>>>  #include "xe_trace.h"
>>>>> -#include "generated/xe_wa_oob.h"
>>>>>  #include "xe_wa.h"
>>>>>
>>>>>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>>>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>>>> index 3299130ba10a..a0264eedd443 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_wa.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>>>>> @@ -9,7 +9,8 @@
>>>>>  #include <kunit/visibility.h>
>>>>>  #include <linux/compiler_types.h>
>>>>>
>>>>> -#include "generated/xe_wa_oob.h"
>>>>> +#include <generated/xe_wa_oob.h>
>>>>> +
>>>>>  #include "regs/xe_engine_regs.h"
>>>>>  #include "regs/xe_gt_regs.h"
>>>>>  #include "regs/xe_regs.h"
>>>>
>>>>--
>>>>Jani Nikula, Intel
>>
>>-- 
>>Jani Nikula, Intel
