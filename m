Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 796F9F459FC
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 18:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384F010E9B8;
	Fri, 10 Apr 2026 18:23:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="kdmIGf/O";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5991E10E9B8
 for <intel-xe@lists.freedesktop.org>; Fri, 10 Apr 2026 18:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1775845376;
 bh=YpbxCXRz8HGa03pHTr0LCUKAnGbUuamP+mapOwY6aLg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kdmIGf/OgStIb4Q7F/5GcO1M5W/aS6RTCpmP1GNwv9f2gz5qhzWQnrboduvDvIOlm
 AyFEy+WAmlXoiFMN4DHjHJMbKN2yfYP/uJLwF+i2cNzZi4cMmlcXqkwH1vM/YdaEUs
 WjG8LPvEeDkvQ2SnkxDVYphzEk9LH9/jGTf/TFbd59KL5i7oyVgDjTaSbDmU0b85aP
 FWwSC95ldkZf0fUMJV/v0kd68x6CtZMWmSulo5oDji+ZhiqkSNqDgQ7xKrPrQV1DOb
 6toG3A9yFQsUnAIiZ7r6OeiqhQ5lfijNKEf8k9vTS0yo86V6I9PAW14Lvx+uFTaGz2
 dHxVAEZOj1FZQ==
Message-ID: <a30d5ecc-a097-4511-9b51-c17535b7f8b7@lankhorst.se>
Date: Fri, 10 Apr 2026 20:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Introduce Xe PCIe FLR
To: Raag Jadav <raag.jadav@intel.com>, intel-xe@lists.freedesktop.org
Cc: matthew.brost@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, riana.tauro@intel.com,
 michal.wajdeczko@intel.com, matthew.d.roper@intel.com,
 michal.winiarski@intel.com, matthew.auld@intel.com, jani.nikula@intel.com,
 lukasz.laguna@intel.com, zhanjun.dong@intel.com, lukas@wunner.de
References: <20260406140722.154445-1-raag.jadav@intel.com>
 <adkHpG9RWUGfu60X@black.igk.intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten@lankhorst.se>
In-Reply-To: <adkHpG9RWUGfu60X@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

To me the series looks ok, I don't know if anyone else has objections but might be good to at least have an ack from display.

Kind regards,
~Maarten Lankhorst

Den 2026-04-10 kl. 16:22, skrev Raag Jadav:
> On Mon, Apr 06, 2026 at 07:37:13PM +0530, Raag Jadav wrote:
>> Here's my humble attempt at introducing PCIe Function Level Reset (FLR)
>> support in xe driver. This is ofcourse a half baked implementation and
>> only limited to re-initializing GT. This needs to be extended for a lot
>> of different components which I've skipped here for my lack of competence,
>> so feel free to join in and support them.
>>
>> PS: All xe_exec_basic tests and clpeak run smoothly after FLR. Give it
>> a spin and let me know if any regressions.
>>
>> Trigger it with:
>>
>> $ echo 1 > /sys/bus/pci/devices/<BDF>/reset
> Anything I can do to move this forward?
>
> Raag
>
>> v2: Re-initialize migrate context (Matthew Brost)
>>     Add kernel doc (Matthew Brost)
>>     Spell out Function Level Reset (Jani)
>>
>> v3: Cancel in-flight jobs before FLR
>>
>> v4: Teardown exec queues instead of mangling scheduler pending list (Matthew Brost)
>>
>> v5: Re-initialize kernel queues through submission backend (Matthew Brost)
>>     Prevent PM ref leak for wedged device (Matthew Brost)
>>
>> Raag Jadav (9):
>>   drm/xe/uc_fw: Allow re-initializing firmware
>>   drm/xe/guc_submit: Introduce guc_exec_queue_reinit()
>>   drm/xe/gt: Introduce FLR helpers
>>   drm/xe/irq: Introduce xe_irq_disable()
>>   drm/xe: Introduce xe_device_assert_lmem_ready()
>>   drm/xe/bo_evict: Introduce xe_bo_restore_map()
>>   drm/xe/exec_queue: Introduce xe_exec_queue_reinit()
>>   drm/xe/migrate: Introduce xe_migrate_reinit()
>>   drm/xe/pci: Introduce PCIe FLR
>>
>>  drivers/gpu/drm/xe/Makefile              |   1 +
>>  drivers/gpu/drm/xe/xe_bo_evict.c         |  51 ++++++--
>>  drivers/gpu/drm/xe/xe_bo_evict.h         |   2 +
>>  drivers/gpu/drm/xe/xe_device.c           |  10 +-
>>  drivers/gpu/drm/xe/xe_device.h           |   1 +
>>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>>  drivers/gpu/drm/xe/xe_exec_queue.c       |  37 +++++-
>>  drivers/gpu/drm/xe/xe_exec_queue.h       |   1 +
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
>>  drivers/gpu/drm/xe/xe_gpu_scheduler.h    |   5 +
>>  drivers/gpu/drm/xe/xe_gsc.c              |  14 ++
>>  drivers/gpu/drm/xe/xe_gsc.h              |   1 +
>>  drivers/gpu/drm/xe/xe_gt.c               |  47 +++++++
>>  drivers/gpu/drm/xe/xe_gt.h               |   2 +
>>  drivers/gpu/drm/xe/xe_gt_types.h         |   9 ++
>>  drivers/gpu/drm/xe/xe_guc.c              |  29 ++++
>>  drivers/gpu/drm/xe/xe_guc.h              |   2 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c       |  11 ++
>>  drivers/gpu/drm/xe/xe_huc.c              |  14 ++
>>  drivers/gpu/drm/xe/xe_huc.h              |   1 +
>>  drivers/gpu/drm/xe/xe_irq.c              |  13 +-
>>  drivers/gpu/drm/xe/xe_irq.h              |   1 +
>>  drivers/gpu/drm/xe/xe_lrc.c              |  17 +++
>>  drivers/gpu/drm/xe/xe_lrc.h              |   2 +
>>  drivers/gpu/drm/xe/xe_migrate.c          |  12 ++
>>  drivers/gpu/drm/xe/xe_migrate.h          |   1 +
>>  drivers/gpu/drm/xe/xe_pci.c              |   1 +
>>  drivers/gpu/drm/xe/xe_pci.h              |   2 +
>>  drivers/gpu/drm/xe/xe_pci_err.c          | 160 +++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_uc.c               |  37 ++++++
>>  drivers/gpu/drm/xe/xe_uc.h               |   2 +
>>  drivers/gpu/drm/xe/xe_uc_fw.c            |  39 +++++-
>>  drivers/gpu/drm/xe/xe_uc_fw.h            |   1 +
>>  33 files changed, 510 insertions(+), 21 deletions(-)
>>  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
>>
>> -- 
>> 2.43.0
>>

