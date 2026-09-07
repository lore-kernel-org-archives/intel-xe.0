Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4FEC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 05:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB2910E45D;
	Mon,  7 Sep 2026 05:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JbbvYX8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6793710E45D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 05:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788757343; x=1820293343;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:from:cc:to:date:message-id;
 bh=37k4fYAMQcxJP+ah2XcFYVSrG4kHPpJW/nL8pNhLTnA=;
 b=JbbvYX8tusq/OOD3XsJQcwar3LSgePxrDXstjgN7//BNkjqRfuk8Qvhv
 btdbuf6gcgEB4IehRVWxmI33Lw1tmH1uENd+KAZJlUxqK/+IVXqKfTGZm
 RIPn6juYwgUtNJnqRIq2kePPQO2n/YzYOBpZWAZvXtGzfrTk9HF5l6v/z
 Dr6d/WOeGvw0aXlM4HugPu13mQ6voLjL/ZyG+uB4p6lShuO+FEpTzRMQI
 39q+OMnHmKDZKXuL1UREyhNKNhVtYLcPxqMkTDLGXahdC1OAuvFAEAEq1
 8E/HcmGXJe5RPPX83dprRBSqJAeeWkOM5hA9NX5ZvEMK/HORtm4QBCI5x Q==;
X-CSE-ConnectionGUID: CAK/0z8dRXOKBHtcV51C+w==
X-CSE-MsgGUID: EvfI1u6IQemJUq+AZ471fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="89081914"
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="89081914"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:02:22 -0700
X-CSE-ConnectionGUID: C8XmUdIZRzusHwYB9N175g==
X-CSE-MsgGUID: GO+ARRFhQrK9QPgCuEVRbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,266,1779174000"; d="scan'208";a="275892639"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.184])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2026 22:02:19 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260904160608.2004174-6-badal.nilawar@intel.com>
References: <20260904160608.2004174-4-badal.nilawar@intel.com>
 <20260904160608.2004174-6-badal.nilawar@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/cri: Expose device UUID through sysfs
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com, raag.jadav@intel.com,
 riana.tauro@intel.com, mallesh.koujalagi@intel.com,
 aravind.iddamsetty@intel.com, heikki.krogerus@linux.intel.com,
 himal.prasad.ghimiray@intel.com
To: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org
Date: Mon, 07 Sep 2026 08:02:16 +0300
Message-ID: <178875733653.24152.9971461946293121474@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620
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

Quoting Badal Nilawar (2026-09-04 19:06:11)
> Expose a read-only sysfs attribute, device_uuid, that reports the
> GPU's unique hardware identifier.

This patch is not exposing UUID[1] which has a well defined
format for 128-bit numbers. Instead of Universally Unique ID,
what we have is just 64-bit (locally) Unique ID.

You should replace s/uuid/uid/ everywhere in the patch.

It'll be up to userspace to hash the number with 64-bits to
generate a UUID. Same as with PVC.

Regards, Joonas

[1] https://en.wikipedia.org/wiki/Universally_unique_identifier#Format
