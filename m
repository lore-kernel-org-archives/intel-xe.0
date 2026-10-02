Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D856BCA5FC4
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 09:13:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8A510E575;
	Fri,  2 Oct 2026 09:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FpSIa43z";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A458510F7EF
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Oct 2026 09:13:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 8E339424CC;
 Fri,  2 Oct 2026 09:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 515E01F00899;
 Fri,  2 Oct 2026 09:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1790932435;
 bh=Hr5PUhpJ8yZm7kKqQjieEF8NIV1UuZYuG3DIS/FmkFY=;
 h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
 b=FpSIa43zOkbOXnS7N8Q9aLtWCM8llMM7z3HsZmzgip8jv2sxnrsgzZPU4KJ+pwtIa
 iSWG4Yqha7yw1UjwM+U3MLQ7qY425+1/cuLowNDDchkUUIJo7Y+MA9UB3OkSEILHce
 3yY6hrcnsjlaTI1RLfzfOvw6qmBSdzZ1KYfFPFHhFZCX6W/WyFTTT5rrzt/aQ2PF1W
 BxI3s0mfy8cvzuakFMqlSservj+K3zEuqwC9O2Z4c4ze49N4vwJeyNEiPTLmxuenqr
 5K3h+L9UbY8HIOCNtlUgZrSOsr1PnvF/b0s0071Hs3hKMtah24B41L4DNsvOZS6CCX
 1TMV/voew4naQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
In-Reply-To: <20261001220351.1592138-4-david.e.box@linux.intel.com>
References: <20261001220351.1592138-1-david.e.box@linux.intel.com>
 <20261001220351.1592138-4-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 09:13:54 +0000
Message-Id: <20261002091355.515E01F00899@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pmt: UAF on crashlog->entry.kobj in uevent_work due to probe error=
 race
--

commit e8839d628e8b60c46da853861c58cccbcc028be6
Author: David E. Box <david.e.box@linux.intel.com>

    platform/x86/intel/pmt: Notify userspace when crashlogs complete
   =20
    A crashlog may already be complete when the driver binds, or it may
    complete asynchronously after userspace requests a manual trigger.
    Userspace otherwise has to poll to discover that data is ready.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index f936daf99e4d2..21e8e2199bdcc 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c

[ ... ]

> @@ -227,6 +235,47 @@ static void pmt_crashlog_set_rearm(struct crashlog_e=
ntry *crashlog)
>  	pmt_crashlog_rmw(crashlog, crashlog->info->control.rearm, true);
>  }
> =20
> +static void pmt_crashlog_uevent_fn(struct work_struct *work)
> +{
> +	struct crashlog_entry *crashlog =3D
> +		container_of(work, struct crashlog_entry, uevent_work);
> +	char *envp[] =3D {
> +		"INTEL_PMT_CRASHLOG_EVENT=3DPRESENT",
> +		"INTEL_PMT_CRASHLOG_COMPLETE=3D1",
> +		NULL,
> +	};
> +
> +	if (crashlog->entry.kobj)
> +		kobject_uevent_env(crashlog->entry.kobj, KOBJ_CHANGE, envp);

[Severity: High]
Can this dereference a dangling pointer in the event of a probe failure?

If intel_pmt_dev_register() in class.c fails late (e.g. devm_ioremap_resour=
ce()
failure) after exposing sysfs attributes, the error path unregisters and fr=
ees
the device, leaving entry->kobj as a dangling pointer.

If a concurrent user writes to the 'trigger' sysfs file during this window,
trigger_store() queues uevent_poll_work for 100ms later.

If the thread running pmt_crashlog_probe() is delayed before calling
cancel_delayed_work_sync(), the timer fires and the work executes, queuing
uevent_work. The uevent_work then executes kobject_uevent_env() on
crashlog->entry.kobj, which points to the freed device.

> +}

[ ... ]

> @@ -572,15 +636,29 @@ static int pmt_crashlog_probe(struct auxiliary_devi=
ce *auxdev,
>  	auxiliary_set_drvdata(auxdev, priv);
> =20
>  	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
> -		struct intel_pmt_entry *entry =3D &priv->entry[priv->num_entries].entr=
y;
> +		struct crashlog_entry *crashlog =3D &priv->entry[priv->num_entries];
> +		struct intel_pmt_entry *entry =3D &crashlog->entry;
> +
> +		/* init before dev_create() exposes trigger sysfs to userspace */
> +		INIT_WORK(&crashlog->uevent_work, pmt_crashlog_uevent_fn);
> +		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
> +				  pmt_crashlog_uevent_poll_fn);
> +		crashlog->uevent_poll_tries =3D 0;
> =20
>  		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, =
i);
> -		if (ret < 0)
> +		if (ret < 0) {
> +			cancel_delayed_work_sync(&crashlog->uevent_poll_work);
> +			cancel_work_sync(&crashlog->uevent_work);

[Severity: High]
Does this cancellation happen too late?

Because the cancellation happens after the underlying device may have alrea=
dy
been destroyed by the error path of intel_pmt_dev_create(), it leaves a race
window where the work queue can use the freed device.

>  			goto abort_probe;
> -		if (ret)
> +		}
> +		if (ret) {
> +			cancel_delayed_work_sync(&crashlog->uevent_poll_work);
> +			cancel_work_sync(&crashlog->uevent_work);
>  			continue;
> +		}
> =20
>  		priv->num_entries++;
> +		pmt_crashlog_notify_pending(crashlog);
>  	}
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001220351.1592=
138-1-david.e.box@linux.intel.com?part=3D3
