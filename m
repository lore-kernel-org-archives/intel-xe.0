Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 125A0F532CE
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 04:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C416310E01F;
	Tue, 24 Mar 2026 04:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="isT0/QTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7610E01F
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 04:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774327372; x=1805863372;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=4FHa4anRfKJI9UDCuJD9gFI9byAUnvEatGR6cjMYALA=;
 b=isT0/QTpnc4fq+8abQllfPqTM19Io/SFO1fQY0fTRdkmSR+6GIk3oo8I
 l4Lo86milYuSTtl2ZDA0GMexzaMGpUQQ55QU4qY746ZgRmCdsyxdki4o0
 8y2Jjpchg8jF/1gZaVzc7KkoX3RvoRPakWWQPlj9mU8YVpHXYthEs0ljD
 LQVvrRsTlrCCYy2V0w4g+a8TOJgsRVZCdVqM1v7Y6gtUcri8+3oP1UYVx
 kb5N7uF8jjk08VHw8mKEGYrTHM7t8WPnXI3rZQOtJUwmSZFyWHkzHdzQt
 gqxqMAkDV+EhF4YZE5rhD/mE/BaMRV2dpndRaYJ/GIuZiufly4ZfLDyQQ g==;
X-CSE-ConnectionGUID: cYbdK3kNSJSF/KNltkl6Cw==
X-CSE-MsgGUID: UbbBanQ6QuCGj1kILx0tnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75527966"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75527966"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:42:52 -0700
X-CSE-ConnectionGUID: bi2u118cTN2J87VXkrODhA==
X-CSE-MsgGUID: 0pMQrgoaQ0qudT724MDnvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="228313051"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:42:49 -0700
Date: Tue, 24 Mar 2026 05:42:46 +0100
From: Raag Jadav <raag.jadav@intel.com>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org, matthew.brost@intel.com,
 rodrigo.vivi@intel.com, michal.wajdeczko@intel.com,
 matthew.d.roper@intel.com, umesh.nerlige.ramappa@intel.com,
 soham.purkait@intel.com, anoop.c.vijay@intel.com,
 aravind.iddamsetty@linux.intel.com, Riana Tauro <riana.tauro@intel.com>
Subject: Re: [PATCH v3 3/4] drm/xe/sysctrl: Add system controller event support
Message-ID: <acIWRql3fNbfYihx@black.igk.intel.com>
References: <20260312090657.4026013-1-raag.jadav@intel.com>
 <20260312090657.4026013-4-raag.jadav@intel.com>
 <c05cf845-311a-440e-973b-7bc17359fecb@intel.com>
 <acEmmG9VgdidyP4z@black.igk.intel.com>
 <5c7b5cac-fcde-4127-9c85-d6c9b25ccc30@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5c7b5cac-fcde-4127-9c85-d6c9b25ccc30@intel.com>
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

On Mon, Mar 23, 2026 at 05:57:50PM +0530, Mallesh, Koujalagi wrote:
> On 23-03-2026 05:10 pm, Raag Jadav wrote:
> > On Thu, Mar 19, 2026 at 07:39:12PM +0530, Tauro, Riana wrote:
> > > On 3/12/2026 2:36 PM, Raag Jadav wrote:
> > > > System controller reports different types of events to GFX endpoint for
> > > > different usecases, add initial support for them. This will be further
> > > > extended to service those usecases.
> > > > 
> > > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > > > ---
> > > > v2: Handle unexpected response length (Mallesh)
> > > > v3: Handle event flood (Mallesh)
> > > > ---
> > > >    drivers/gpu/drm/xe/Makefile                 |  1 +
> > > >    drivers/gpu/drm/xe/xe_sysctrl.c             |  4 +
> > > >    drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
> > > >    drivers/gpu/drm/xe/xe_sysctrl_event.c       | 82 +++++++++++++++++++++
> > > >    drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 52 +++++++++++++
> > > >    drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
> > > >    6 files changed, 150 insertions(+)
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
> > > >    create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > > index 543eb0b2430b..373adb20afb2 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -125,6 +125,7 @@ xe-y += xe_bb.o \
> > > >    	xe_survivability_mode.o \
> > > >    	xe_sync.o \
> > > >    	xe_sysctrl.o \
> > > > +	xe_sysctrl_event.o \
> > > >    	xe_sysctrl_mailbox.o \
> > > >    	xe_tile.o \
> > > >    	xe_tile_sysfs.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> > > > index 30349df1c04b..63b9aaf98669 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> > > > @@ -42,6 +42,10 @@ static void sysctrl_fini(void *arg)
> > > >    static void xe_sysctrl_work(struct work_struct *work)
> > > >    {
> > > > +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> > > > +
> > > > +	guard(mutex)(&sc->work_lock);
> > > > +	xe_sysctrl_event(sc);
> > > >    }
> > > >    /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> > > > index ff60d42b52a7..0821ea44893d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> > > > @@ -18,5 +18,6 @@ static inline struct xe_device *sc_to_xe(struct xe_sysctrl *sc)
> > > >    int xe_sysctrl_init(struct xe_device *xe);
> > > >    void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> > > > +void xe_sysctrl_event(struct xe_sysctrl *sc);
> > > >    #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > > > new file mode 100644
> > > > index 000000000000..47afca586bd1
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> > > > @@ -0,0 +1,82 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#include "xe_device.h"
> > > > +#include "xe_irq.h"
> > > > +#include "xe_printk.h"
> > > > +#include "xe_sysctrl.h"
> > > > +#include "xe_sysctrl_event_types.h"
> > > > +#include "xe_sysctrl_mailbox.h"
> > > > +#include "xe_sysctrl_mailbox_types.h"
> > > > +
> > > > +static void xe_sysctrl_get_pending_event(struct xe_sysctrl *sc,
> > > > +					 struct xe_sysctrl_mailbox_command *command)
> > > > +{
> > > > +	struct xe_sysctrl_event_response response;
> > > > +	struct xe_device *xe = sc_to_xe(sc);
> > > > +	u32 count = 0;
> > > > +	size_t len;
> > > > +	int ret;
> > > > +
> 
> Ensure that response structure fits in mailbox buffer by checking against
> XE_SYSCTRL_MB_MAX_MESSAGE_SIZE (1024).

Any mailbox parameter validation should be part of mailbox call itself and
not for its user to worry about.

Raag

> > > > +	command->data_out = &response;
> > > > +	command->data_out_len = sizeof(response);
> > > > +
> > > > +	do {
> > > > +		memset(&response, 0, sizeof(response));
> > > > +
> > > > +		ret = xe_sysctrl_send_command(sc, command, &len);
> > > > +		if (ret) {
> > > > +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		if (len != sizeof(response)) {
> > > > +			xe_err(xe, "sysctrl: unexpected pending event response length %ld\n", len);
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> > > > +			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> > > > +		} else {
> > > > +			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		if (++count > XE_SYSCTRL_EVENT_FLOOD) {
> > > > +			xe_err(xe, "sysctrl: event flooding\n");
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);
> > > > +	} while (response.count);
> > > > +}
> > > > +
> > > > +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
> > > > +					  struct xe_sysctrl_app_msg_hdr *header,
> > > > +					  struct xe_sysctrl_event_request *request)
> > > > +{
> > > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > > +
> > > > +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> > > > +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
> > > > +
> > > > +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> > > > +	request->fn = PCI_FUNC(pdev->devfn);
> > > > +}
> > > > +
> > > > +void xe_sysctrl_event(struct xe_sysctrl *sc)
> > > > +{
> > > > +	struct xe_sysctrl_mailbox_command command = {};
> > > > +	struct xe_sysctrl_event_request request = {};
> > > > +	struct xe_sysctrl_app_msg_hdr header = {};
> > > > +
> > > > +	xe_sysctrl_event_request_prep(sc_to_xe(sc), &header, &request);
> > > > +
> > > > +	command.header = header;
> > > > +	command.data_in = &request;
> > > > +	command.data_in_len = sizeof(request);
> > > > +
> > > > +	xe_sysctrl_get_pending_event(sc, &command);
> > > > +}
> > > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> > > > new file mode 100644
> > > > index 000000000000..1430a7ee2b39
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> > > > @@ -0,0 +1,52 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +/*
> > > > + * Copyright © 2026 Intel Corporation
> > > > + */
> > > > +
> > > > +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> > > > +#define _XE_SYSCTRL_EVENT_TYPES_H_
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +#define XE_SYSCTRL_EVENT_DATA_LEN		59
> > > > +
> > > > +/* Modify as needed */
> > > > +#define XE_SYSCTRL_EVENT_FLOOD			16
> > > > +
> > > > +enum xe_sysctrl_event {
> > > > +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED = 1,
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct xe_sysctrl_event_request - Request structure for pending event
> > > > + */
> > > > +struct xe_sysctrl_event_request {
> > > > +	/** @vector: MSI-X vector that was triggered */
> > > > +	u32 vector;
> > > > +	/** @fn: Function index (0-7) of PCIe device */
> > > > +	u8 fn;
> > > > +	/** @reserved: Reserved for future use */
> > > > +	u32 reserved:24;
> > > > +	/** @reserved2: Reserved for future use */
> > > > +	u32 reserved2[2];
> > > > +} __packed;
> > > > +
> > > > +/**
> > > > + * struct xe_sysctrl_event_response - Response structure for pending event
> > > > + */
> > > > +struct xe_sysctrl_event_response {
> > > > +	/** @count: Number of pending events */
> > > > +	u32 count;
> > > > +	/** @event: Pending event */
> > > > +	enum xe_sysctrl_event event;
> > > > +	/** @timestamp: Timestamp of most recent event */
> > > > +	u64 timestamp;
> > > > +	/** @extended: Event has extended payload */
> > > > +	u8 extended:1;
> > > > +	/** @reserved: Reserved for future use */
> > > > +	u32 reserved:31;
> > > > +	/** @data: Generic event data */
> > > > +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> > > > +} __packed;
> > > Let's add this in xe_ras_types.h to have a separate RAS layer that utilizes
> > > system controller.
> > > 
> > > Since multiple functions will be using system controller keeping their
> > > headers and functions in a separate file
> > > 
> > > will avoid cluttering everything in a single file. Let sysctrl.c only be an
> > > interface to the firmware.
> > I had an impression that a sysctrl event is meant for wider usecases than
> > RAS. Did things change (again)?
> > 
> > Raag
> > 
> > > > +
> > > > +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> > > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> > > > index 91460be9e22c..d59a825597d3 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> > > > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> > > > @@ -23,6 +23,16 @@ struct xe_sysctrl_mailbox_command;
> > > >    #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> > > >    	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
> > > > +/* Command groups */
> > > > +enum xe_sysctrl_group {
> > > > +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> > > > +};
> > > > +
> > > > +/* Commands supported by GFSP group */
> > > > +enum xe_sysctrl_gfsp_cmd {
> > > > +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> > > > +};
> > > > +
> > > >    void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
> > > >    int xe_sysctrl_send_command(struct xe_sysctrl *sc,
> > > >    			    struct xe_sysctrl_mailbox_command *cmd,
