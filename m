Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB2DCA9EDD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Oct 2026 14:36:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CD210F163;
	Mon, 12 Oct 2026 14:36:25 +0000 (UTC)
X-Greylist: delayed 905 seconds by postgrey-1.36 at gabe;
 Sun, 11 Oct 2026 18:02:08 UTC
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BC810E06C
 for <intel-xe@lists.freedesktop.org>; Sun, 11 Oct 2026 18:02:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EF9123F08F;
 Sun, 11 Oct 2026 18:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gtucker.io; s=gm1;
 t=1791741727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6uzXI2LC3xoy1v6A4HcUQQzYMva/bl3AfUQfAX73I9E=;
 b=lb2w1gc9iFD7aS6GoF0jSkRqvTxfOHlo51e2rb679lEzw00ktuLXT3qW+o6Yt8KFvLrckC
 xrpr+v39hFhTTXWAkxdmm1RGxzxRvUGZ1YHCTSo1HvAFNCvW58YDXsxBK79+CATHdz9xS4
 9ti5E+fhTMG+g6YpQv5dGr0xVeyCS8qBqFYhhjFDmzvEd8WfK6EhWz8pFHEH9bcSgjEwXu
 FkYMc69FS0o7cyhRL6JI7JYrmVn4asJJjTQ+MkqdW0KSfxPHWo3P4Sm5AEE/+2z1hK8sFi
 WbNP5MBE6y/v/t5muyFSPKQWiJ9vr9FotNiqwCRzwjUqZbS/opsZXFDY6s3nxw==
Message-ID: <11bf2d60-c05f-41e7-a8d0-82dcc007a1f7@gtucker.io>
Date: Sun, 11 Oct 2026 20:02:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/33] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>, intel-xe@lists.freedesktop.org
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Riana Tauro <riana.tauro@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Yoni Levitt <yoni.levitt@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 Raag Jadav <raag.jadav@intel.com>
References: <20260814171801.13347-1-michal.wajdeczko@intel.com>
 <20260814171801.13347-3-michal.wajdeczko@intel.com>
 <ce492bcc-e18c-49ba-b9b0-449e484a9e58@intel.com>
Content-Language: en-US
From: Guillaume Tucker <gtucker@gtucker.io>
In-Reply-To: <ce492bcc-e18c-49ba-b9b0-449e484a9e58@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: gtucker@gtucker.io
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTGcSdlMASlSI0+vMbKu0ik51t1HkWQdyhLkAV+PEC7MdjEnu7Aef6FZf6do0gWLgawb/Cq03JafUWP2U5QTxYpQ53i5AndhNkg89j6ARhQjayRAg8/dgOayDmBkBA/KChndrDxhZx60L6arZD6aFGSnre3gtWRqwewXsDXMNne6kl/Lz1G/eydj57hVPQzeXSiUX7A1NAMUX5Z1rKOIkiT/FhpUzzLVroZq/xIYAxQlOR7cwGd4WXOpPRPuBLnyMFdYLrgoh79Y9eI0/pP752XP7IqmP490zMQVS1i8QAime4PYTQWPa5yUN1MIuQtH3/hF4YIFwLKbq8XxrIWeMfdatHLFvVPIBqwWDgbmMXPqXctF7H5ojrv26ihyFc2aWSalWC+R9vrwMEOswpxmBVuwHX6TcyPj2mAqDJFWk2V4w5fR0MEY5OrnNStfpZTFvfvYEdgMiw6OjP36Yrquden7NfIRd7c0HHz3lE4ptcl7VrEvzoR2cIdPqC0W35VDqHn3LNIoHBNi7LBQ02djhWYCHMWtYaOK99ROhwH+B06gYoaUWvwmeoc+nu1jD+drwrPSJ+w6LZOlLOHd/2IlsBpdog6j7EfZ8sxUX+RQconpTz+Xo9oJGoLGfhumIoC11dR0Wlm0Kk3m5kZnY7zljHhCQvCORHGTjZoFxTHnw1b9NQ
X-Mailman-Approved-At: Mon, 12 Oct 2026 14:36:24 +0000
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

Hello,

On 14/08/2026 7:31 pm, Nilawar, Badal wrote:
> 
> On 14-08-2026 22:47, Michal Wajdeczko wrote:
>> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
>> strings that have no stable shape. That is readable for a human, but it
>> gives fleet tooling nothing durable to match on: the wording changes
>> between releases, lines can be rate-limited or dropped under an error
>> storm, and there is no consistent way to ask "which recognised fault
>> just happened?".
>>
>> Introduce a signature identifier (SIGID): a small, stable integer that
>> names one recognised Xe fault site and serves as the primary handle for
>> triage. A SIGID maps, through published end-user documentation, to a
>> description and a recommended action; the driver only has to emit the
>> right SIGID next to the usual human-readable text.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Assisted-by: Copilot:Opus-4.8
>> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Stuart Summers <stuart.summers@intel.com>
>> cc: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> Cc: Yoni Levitt <yoni.levitt@intel.com>
>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> ---
>> v2: CORRECTED is still an error (Michal)
>>      prepare to decorate dmesg with comp/loc (Michal)
>> v3: update SIGID DOC section (Riana/Aravind)
>>      warn about unknown severity (Mallesh)
>> v4: fix typos (Mallesh/Rodrigo)
>> ---
>>   Documentation/gpu/xe/index.rst        |   1 +
>>   Documentation/gpu/xe/xe_sigid.rst     |  14 +++
>>   drivers/gpu/drm/xe/Makefile           |   1 +
>>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 159 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_log.c           | 138 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_log.h           |  20 ++++
>>   6 files changed, 333 insertions(+)
>>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>>
>> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/ 
>> index.rst
>> index 665c0e93601c..0247a255f7e6 100644
>> --- a/Documentation/gpu/xe/index.rst
>> +++ b/Documentation/gpu/xe/index.rst
>> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe 
>> is provided by
>>      xe-drm-usage-stats.rst
>>      xe_configfs
>>      xe_gt_stats
>> +   xe_sigid
>> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/ 
>> xe_sigid.rst
>> new file mode 100644
>> index 000000000000..45d84a62f185
>> --- /dev/null
>> +++ b/Documentation/gpu/xe/xe_sigid.rst
>> @@ -0,0 +1,14 @@
>> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +
>> +========
>> +Xe SIGID
>> +========
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :doc: Xe Error Signatures (SIGID)
>> +
>> +Signature Identifiers
>> +=====================
>> +
>> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> +   :internal:
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 44ed055439d4..92134709d998 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>>       xe_hw_fence.o \
>>       xe_irq.o \
>>       xe_late_bind_fw.o \
>> +    xe_log.o \
>>       xe_lrc.o \
>>       xe_mem_pool.o \
>>       xe_migrate.o \
>> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/ 
>> xe/abi/xe_sigid_abi.h
>> new file mode 100644
>> index 000000000000..ff7c97b4a78e
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>> @@ -0,0 +1,159 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _ABI_XE_SIGID_ABI_H_
>> +#define _ABI_XE_SIGID_ABI_H_
>> +
>> +/**
>> + * DOC: Xe Error Signatures (SIGID)
>> + *
>> + * What SIGID stands for
>> + * ---------------------
>> + *

Please note that there was an htmldocs build error introduced by this
patch as the titles were of the wrong level.  I just sent a fix
"drm/xe/log: fix documentation title levels" for this.

Best wishes,
Guillaume

