Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3956B108B919
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 12:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA9A10EA83;
	Fri, 20 Mar 2026 12:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S9ecXcsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F74C10EAB9
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 12:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774010791; x=1805546791;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=tuMlyhFXowWQJlTWT/rAvjCmaaPYBabH+m5XFJdd5sY=;
 b=S9ecXcsOQywltVOg69iVs01D0mn4fjOEYH/ktET8JyURwWUc2UKzYOSJ
 o4a/O9t9jCsVtssvXrlX7G0N2Dc7qygKa4n2ZQ47BJyHGTbsQHET3ZAbl
 w0phBKsZAEAVL1Hmsvh96+kTzRdT7DPvRjXA1aSnYer/fPwCs9kIgR626
 oc3PaRW7HSmCa6FbZmwMQ4vKsWZDlrKl89suJE+lvDPhm33WJKHrZoZwO
 8HMl7nCBWSDOk8W4BHNxP4jOo9JPfeD9BvSiOpGCfyl6QUMPgORAjgv8+
 aycgwR0OBdHErI6diwXd7agh1wRzGa/SxvU0qxXGZVIpvcStvxrc16J3i g==;
X-CSE-ConnectionGUID: 93z+L6B4SZCfHqiQRP/4dA==
X-CSE-MsgGUID: HzzRcSlfSqKGMJ94vdEa3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="78950703"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="78950703"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:46:30 -0700
X-CSE-ConnectionGUID: 5v6FXgybR4WBU5PvTdK9Yw==
X-CSE-MsgGUID: RC6IOj3UQ3G5vxONf4qshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="218635962"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.69])
 ([10.245.245.69])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 05:46:28 -0700
Message-ID: <7c282de391630193875e2ffcc3002cc1f6e75178.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Disable garbage collector work item on SVM close
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
Cc: stable@vger.kernel.org
Date: Fri, 20 Mar 2026 13:46:26 +0100
In-Reply-To: <20260227015225.3081787-1-matthew.brost@intel.com>
References: <20260227015225.3081787-1-matthew.brost@intel.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Thu, 2026-02-26 at 17:52 -0800, Matthew Brost wrote:
> When an SVM is closed, the garbage collector work item must be
> stopped
> synchronously and any future queuing must be prevented. Replace
> flush_work() with disable_work_sync() to ensure both conditions are
> met.
>=20
> Fixes: 63f6e480d115 ("drm/xe: Add SVM garbage collector")
> Cc: stable@vger.kernel.org
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>


> ---
> =C2=A0drivers/gpu/drm/xe/xe_svm.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_svm.c
> b/drivers/gpu/drm/xe/xe_svm.c
> index 002b6c22ad3f..f8b57eca76fd 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -903,7 +903,7 @@ int xe_svm_init(struct xe_vm *vm)
> =C2=A0void xe_svm_close(struct xe_vm *vm)
> =C2=A0{
> =C2=A0	xe_assert(vm->xe, xe_vm_is_closed(vm));
> -	flush_work(&vm->svm.garbage_collector.work);
> +	disable_work_sync(&vm->svm.garbage_collector.work);
> =C2=A0	xe_svm_put_pagemaps(vm);
> =C2=A0	drm_pagemap_release_owner(&vm->svm.peer);
> =C2=A0}
