Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3DEC77B73
	for <intel-xe@archiver.kernel.org>; Thu, 27 Apr 2023 14:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B31CA10E368;
	Thu, 27 Apr 2023 14:14:03 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCAE10E368
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Apr 2023 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682604841; x=1714140841;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=8e3klp6t5mohmhrFul7H3VRbvWPsi2UpQ//Qk8sQfgk=;
 b=Qs111U6FHEwCKZXWUk0NX+6hFKRiCquXrBbUnTW9EYXXc3xhEkdAyCv7
 NqwYxeuiH34xxXBH9yQXWAHWysFpnyyvcgRB53/WI8v6UHV8AlI5nItIb
 /DG15qt3eRS1x8lnOt572Gqk6aV4xRSYnLgBuzrC0E5LOYp6vtDvAehn4
 JXmS0Zjx8ujXHDuYu4OdUX9rA11Ebo0b6encMk0+YZPf7sxdw0D63bLuY
 uHwFQumbcsERtoJoagnHabHkaTwVpydzWR49RK5C2oWJb0sNblrKcvl/y
 /j+xqxlCkTj9rcoRVv5dE1cWeCT37CZ10W2zAi2BBDVLDmfXNaNrNN41r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336415029"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="336415029"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 06:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="694391767"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; d="scan'208";a="694391767"
Received: from mkuoppal-desk.fi.intel.com (HELO localhost) ([10.237.72.193])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 06:48:12 -0700
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
In-Reply-To: <ptsenxvgflgy34zdvchi7lz56udnye3gasw47a6oxo6lslqgdj@rzrh757fpeyn>
References: <20230412110923.1081273-1-mika.kuoppala@linux.intel.com>
 <ptsenxvgflgy34zdvchi7lz56udnye3gasw47a6oxo6lslqgdj@rzrh757fpeyn>
Date: Thu, 27 Apr 2023 16:45:56 +0300
Message-ID: <877ctxphez.fsf@mkuoppal-desk>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Intel-xe] [PATCH] drm/xe: destroy clients engine and vm
 xarrays on close
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Lucas De Marchi <lucas.demarchi@intel.com> writes:

> On Wed, Apr 12, 2023 at 02:09:23PM +0300, Mika Kuoppala wrote:
>>xe_file_close cleanups the xarrays but forgets
>>to destroy them causing a memleak in xarray internals.
>>Found with kmemleak.
>>
>>Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>---
>> drivers/gpu/drm/xe/xe_device.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>index 45d6e5ff47fd..30415015db4a 100644
>>--- a/drivers/gpu/drm/xe/xe_device.c
>>+++ b/drivers/gpu/drm/xe/xe_device.c
>>@@ -70,6 +70,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> 		xe_engine_put(e);
>> 	}
>> 	mutex_unlock(&xef->engine.lock);
>>+	xa_destroy(&xef->engine.xa);
>> 	mutex_destroy(&xef->engine.lock);
>> 	device_kill_persistent_engines(xe, xef);
>>
>>@@ -77,6 +78,7 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>> 	xa_for_each(&xef->vm.xa, idx, vm)
>> 		xe_vm_close_and_put(vm);
>> 	mutex_unlock(&xef->vm.lock);
>>+	xa_destroy(&xef->vm.xa);
>
> looks good to me considering the xe_file_open() initialized it. But
> shouldn't we print a warning or something on !xa_empty()?

The xe_vm_close_and_put() does not remove from the list.
If I add warn here, it gets triggered.
So some work is needed on vm side if we want to enforce
it being empty at this point.

-Mika

>
> Lucas De Marchi
>
>> 	mutex_destroy(&xef->vm.lock);
>>
>> 	kfree(xef);
>>-- 
>>2.34.1
>>
