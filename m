Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D335FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:34:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260AD10E26E;
	Wed, 29 Apr 2026 05:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xu6du8R/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921B910E26E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777440850; x=1808976850;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=EDDcAwuU3y1Y1nzDxyp3HEWAECH74is2LFIHynwobzE=;
 b=Xu6du8R/P51oYhX5RrYKwWJTHJsSQVK6HvgCcqdPpDlUd9Jo3F7gjcqa
 FUQFn38J83MAeYWmwXu9qonIk9rj54NrXga3UPXlRp43fHIl1hyRCRyIW
 bvW5gr+NIiUcCb+HMFNs3ZwDDhYVHx7pRMOfkvbYPUKzy6X9L6FE0wUIl
 CsVt2TOu6+IBKVIBLxj1QVHFDlJPdQdPhWjtTAj+DcojyLUbKH22LFvWp
 HLcoxChPp6UuBARslFTW5fpDSlDzeYTtf2mK80E8j+DF/aDaXD7/mTPTQ
 N5OmkEQE83WmJueRa63YBqA+4sPfrsOqCdNcJ9oWQbnl3k5GSDKkIbOue Q==;
X-CSE-ConnectionGUID: narQVttrRyyqfFIrAPbDCw==
X-CSE-MsgGUID: kF23Gsf1RneNy+ETBIqOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78346922"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78346922"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:34:09 -0700
X-CSE-ConnectionGUID: LJCz5M5YS42LYKjp3U1vXg==
X-CSE-MsgGUID: 3x6Mr8daSaq70a0Nn7Dc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="239208603"
Received: from black.igk.intel.com ([10.91.253.5])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:34:07 -0700
Date: Wed, 29 Apr 2026 07:34:03 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>
Cc: "Tauro, Riana" <riana.tauro@intel.com>, intel-xe@lists.freedesktop.org,
 anshuman.gupta@intel.com, aravind.iddamsetty@linux.intel.com,
 badal.nilawar@intel.com, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com, andi.shyti@intel.com,
 rodrigo.vivi@intel.com, anoop.c.vijay@intel.com
Subject: Re: [PATCH v2 1/2] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
Message-ID: <afGYS7oBCw4-QQoG@black.igk.intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-2-soham.purkait@intel.com>
 <b77fd9ee-0450-46d3-a038-df0c26a44608@intel.com>
 <3bbb3db0-28be-49ac-a828-1167a1f2ab96@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3bbb3db0-28be-49ac-a828-1167a1f2ab96@intel.com>
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

On Wed, Apr 29, 2026 at 10:54:35AM +0530, Purkait, Soham wrote:
> Hi Riana,
> 
> On 28-04-2026 14:26, Tauro, Riana wrote:
> > 
> > On 4/23/2026 11:09 PM, Soham Purkait wrote:
> > > Add System Controller GPU health status values, RAS response codes
> > > and mailbox payload types for querying and updating GPU health.
> > > 
> > > GPU health states are encoded as numeric values defined by
> > > enum xe_ras_health_status for use in System Controller commands.
> > > The GET_HEALTH command fetches the current health state, while
> > > the SET_HEALTH command updates it through the System Controller
> > > mailbox.
> > > 
> > > struct xe_ras_health_get_input and struct xe_ras_health_get_response
> > > describe the GET_HEALTH request and response payloads, respectively,
> > > while struct xe_ras_health_set_input and
> > > struct xe_ras_health_set_response describe the SET_HEALTH request
> > > and response payloads, including the operation status and current
> > > health state in the response.
> > 
> > This is extremely detailed commit message. Avoid using structs in commit
> > message
> > 
> > My suggestion is to split patches into get/set health and add structures
> > in the patch they
> > are being used. But upto you.
> 
> In my opinion its best to keep this intact in Instead of splitting in
> multiple patches as functionality wise it represent a single feature.

Documentation/process/submitting-patches.rst +81

"Solve only one problem per patch.  If your description starts to get
long, that's a sign that you probably need to split up your patch."

Raag

> > > v2:
> > >   - Add enum for health status instead of xe_ras_health_status_t.
> > > (Andi), (Rodrigo)
> > > 
> > > Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_ras_types.h             | 83 +++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 15 ++++
> > >   2 files changed, 98 insertions(+)
> > >   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
> > > b/drivers/gpu/drm/xe/xe_ras_types.h
> > > new file mode 100644
> > > index 000000000000..5f884d6e24de
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> > > @@ -0,0 +1,83 @@
> > > +/* SPDX-License-Identifier: MIT */
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#ifndef _XE_RAS_TYPES_H_
> > > +#define _XE_RAS_TYPES_H_
> > > +
> > > +#include <linux/types.h>
> > > +
> > > +/* RAS response status codes */
> > > +enum xe_ras_response_status {
> > > +    XE_RAS_STATUS_SUCCESS = 0,
> > > +    XE_RAS_STATUS_INVALID_PARAM,
> > > +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
> > > +    XE_RAS_STATUS_TIMEOUT,
> > > +    XE_RAS_STATUS_HARDWARE_FAILURE,
> > > +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> > > +    XE_RAS_STATUS_UNKNOWN_ERROR,
> > > +};
> > > +
> > > +/**
> > > + * enum xe_ras_health_status - Device health status values
> > > + *
> > > + * Health indicator status denoted by numeric values to be used in
> > > system
> > > + * controller mailbox commands.
> > > + *
> > > + * @XE_RAS_HEALTH_STATUS_OK: The device is healthy and operating
> > > within normal
> > > + * parameters.
> > > + * @XE_RAS_HEALTH_STATUS_WARNING: The device is experiencing minor
> > > issues but is
> > > + * still operational.
> > > + * @XE_RAS_HEALTH_STATUS_CRITICAL: The device is in a critical
> > > state and may not
> > > + * be operational.
> > > + */
> > > +enum xe_ras_health_status {
> > > +    XE_RAS_HEALTH_STATUS_OK = 0,
> > > +    XE_RAS_HEALTH_STATUS_WARNING,
> > > +    XE_RAS_HEALTH_STATUS_CRITICAL,
> > > +};
> > > +
> > > +/**
> > > + * struct xe_ras_health_get_input - Input for XE_SYSCTRL_CMD_GET_HEALTH
> > > + */
> > > +struct xe_ras_health_get_input {
> > > +    /** @reserved: Reserved for future use, must be 0 */
> > > +    u32 reserved[2];
> > > +} __packed;
> > > +
> > > +/**
> > > + * struct xe_ras_health_get_response - Response for
> > > XE_SYSCTRL_CMD_GET_HEALTH
> > > + */
> > > +struct xe_ras_health_get_response {
> > > +    /** @current_health: Current health status (OK/WARNING/CRITICAL) */
> > > +    u8 current_health;
> > > +    /** @reserved: Reserved for alignment */
> > Future use in case any other fields are added
> > > +    u8 reserved[3];
> > > +} __packed;
> > > +
> > > +/**
> > > + * struct xe_ras_health_set_input - Input for XE_SYSCTRL_CMD_SET_HEALTH
> > > + */
> > > +struct xe_ras_health_set_input {
> > > +    /** @new_health: New health status to set */
> > > +    u8 new_health;
> > > +    /** @reserved: Reserved for alignment */
> > > +    u8 reserved[3];
> > > +} __packed;
> > > +
> > > +/**
> > > + * struct xe_ras_health_set_response - Response for
> > > XE_SYSCTRL_CMD_SET_HEALTH
> > > + */
> > > +struct xe_ras_health_set_response {
> > > +    /** @operation_status: Status of set operation (RAS_STATUS) */
> > use enum or XE_RAS_STATUS
> > > +    u32 operation_status;
> > > +    /** @current_health: Health status after this change */
> > > +    u8 current_health;
> > > +    /** @reserved: Reserved for alignment */
> > > +    u8 reserved[3];
> > > +    /** @reserved_2: Reserved for future expansion */
> > > +    u32 reserved_2[2];
> > 
> > Nit: reserved1
> > 
> > > +} __packed;
> > > +
> > > +#endif /* _XE_RAS_TYPES_H_ */
> > > diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > > b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > > index 89456aec6097..fc73e02c3202 100644
> > > --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> > > @@ -10,6 +10,21 @@
> > >     #include "abi/xe_sysctrl_abi.h"
> > >   +/**
> > > + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
> > > + *
> > > + * @XE_SYSCTRL_CMD_GET_HEALTH: Get current health status
> > > + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
> > > + */
> > > +enum xe_sysctrl_mailbox_command_id {
> > > +    XE_SYSCTRL_CMD_GET_HEALTH = 0x0B,
> > > +    XE_SYSCTRL_CMD_SET_HEALTH = 0x0C
> > 
> > Add comma so that following patches do not have to add.
> > 
> > > +};
> > > +
> > > +enum xe_sysctrl_group {
> > > +    XE_SYSCTRL_GROUP_GFSP = 1
> > 
> > Use 0x01. Also make this consistent with the correctable series by Raag.
> > 
> > Thanks
> > Riana
> > 
> > > +};
> > > +
> > >   /**
> > >    * struct xe_sysctrl_mailbox_command - System Controller mailbox
> > > command
> > >    */
