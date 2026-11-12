Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB005606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 02:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ie8XxgJE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7547810E47A;
	Thu, 12 Nov 2026 02:19:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 539C810E47A
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 02:19:53 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C3C963A5A;
 Thu, 12 Nov 2026 02:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127FE1F00A06;
 Thu, 12 Nov 2026 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794449992;
 bh=HKn75uRxusB/p6rPl6gooIW+WnYjObuoO2WUQe084uI=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=Ie8XxgJEWCmlRrw95R+pINSl6dgtneXKljUE0BRJTvqwvu/b0KRIGYyao8Pw+JGlL
 E4WC0S3ptwVKTSfi6v9o+FGFZQ78G8QmVj9sXynSl+dGUnztCVn3ysDrq5EJrrYJAC
 /LSypbkGvqbVyxWvvjsyV1+dI+804hdAKDEzTitMrFksqlmP+jsi5s+QkYt8M8xHFM
 dkpvafSttYMCcAZDab1B0MEKT+oa0iqhZXdMJENzXdl9bf4Mo3LRs9UcP+F2+hSZa9
 h3w2u4a5AJBtREMxkFkgQhO0VEfRQodyupVtZCwiDaD8IlYMMBj5j/1pp5sHmGglwM
 8+xjkZObncBFg==
Message-ID: <sashiko-outbox-210176@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] platform/x86/intel/pmt: Notify userspace when
 crashlogs complete
To: "David E. Box" <david.e.box@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <c265bd093c23d96417cb5c6504938c90adc36ac9.1794444671.git.david.e.box@linux.intel.com>
References: <cover.1794444671.git.david.e.box@linux.intel.com>
 <c265bd093c23d96417cb5c6504938c90adc36ac9.1794444671.git.david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:19:51 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] platform/x86/intel/pmt: control_mutex lock inversion in
  pmt_crashlog_probe()
--

commit ff673d94c967284b95f515a0ddd6add0a4afc80c
Author: David E. Box <david.e.box@linux.intel.com>

platform/x86/intel/pmt: Notify userspace when crashlogs complete

This commit emits a KOBJ_CHANGE uevent on the crashlog device when a
completed crashlog is found at probe or after a manual trigger finishes
polling.

> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform=
/x86/intel/pmt/crashlog.c
> index d7018b495217c..1796023a2f0e6 100644
> --- a/drivers/platform/x86/intel/pmt/crashlog.c
> +++ b/drivers/platform/x86/intel/pmt/crashlog.c

[ ... ]

> @@ -502,9 +616,17 @@ trigger_store(struct device *dev, struct device_attr=
ibute *attr,
> =20
>  	if (!trigger) {
>  		ret =3D pmt_crashlog_set_clear(crashlog);
> -		return ret ?: count;
> +		if (ret)
> +			return ret;
> +
> +		pmt_crashlog_end_poll(crashlog);
> +		return count;
>  	}
> =20
> +	/* reject triggers until probe has finished setting up this entry */
> +	if (!crashlog->trigger_ready)
> +		return -EBUSY;

[ ... ]

> @@ -661,7 +801,14 @@ static int pmt_crashlog_probe(struct auxiliary_devic=
e *auxdev,
>  	auxiliary_set_drvdata(auxdev, priv);
> =20
>  	for (i =3D 0; i < intel_vsec_dev->num_resources; i++) {
> -		struct intel_pmt_entry *entry =3D &priv->entry[priv->num_entries].entr=
y;
> +		struct crashlog_entry *crashlog =3D &priv->entry[priv->num_entries];
> +		struct intel_pmt_entry *entry =3D &crashlog->entry;
> +
> +		/* trigger_store() rejects triggers until trigger_ready is set below */
> +		INIT_WORK(&crashlog->pending_work, pmt_crashlog_pending_fn);
> +		INIT_WORK(&crashlog->uevent_work, pmt_crashlog_uevent_fn);
> +		INIT_DELAYED_WORK(&crashlog->uevent_poll_work,
> +				  pmt_crashlog_uevent_poll_fn);
> =20
>  		ret =3D intel_pmt_dev_create(entry, &pmt_crashlog_ns, intel_vsec_dev, =
i);
>  		if (ret < 0)
> @@ -672,6 +819,27 @@ static int pmt_crashlog_probe(struct auxiliary_devic=
e *auxdev,
>  		priv->num_entries++;
>  	}
> =20
> +	/*
> +	 * Don't read crashlog registers from probe. The read may go through the
> +	 * parent's read_reg() callback, which can take a lock that the parent
> +	 * holds across intel_vsec_register() and so across a synchronous probe.
> +	 * From a work item, the read just waits for registration to finish.
> +	 *
> +	 * Enable triggers and queue the work only once every entry is created.
> +	 * abort_probe waits for the work items in pmt_crashlog_remove(), which
> +	 * would deadlock if one were already blocked on a lock held by our
> +	 * caller. For the same reason, a parent must not hold that lock while
> +	 * removing the device.
> +	 */
> +	for (i =3D 0; i < priv->num_entries; i++) {
> +		struct crashlog_entry *crashlog =3D &priv->entry[i];
> +
> +		scoped_guard(mutex, &crashlog->control_mutex)
> +			crashlog->trigger_ready =3D true;
> +
> +		queue_work(system_freezable_wq, &crashlog->pending_work);
> +	}

[Severity: High]
Does taking crashlog->control_mutex in pmt_crashlog_probe() invert the lock
order against the parent's register-access lock?

When the parent holds its register lock across intel_vsec_register(),
pmt_crashlog_probe() takes crashlog->control_mutex under that lock, whereas
pmt_crashlog_pending_fn(), pmt_crashlog_uevent_poll_fn() and the sysfs
store handlers take crashlog->control_mutex first and then call
entry->cb->read_reg() or entry->cb->write_reg().  This triggers a lockdep
splat when pending_work runs, and because intel_pmt_dev_create() has
already exposed the sysfs attributes and emitted KOBJ_ADD in the first
loop, a concurrent sysfs store can ABBA deadlock with probe:

CPU0                              CPU1
----                              ----
lock(parent_lock)
                                  lock(&crashlog->control_mutex)
lock(&crashlog->control_mutex)
                                  lock(parent_lock)

 *** DEADLOCK ***

CPU0: intel_vsec_register() -> ... -> pmt_crashlog_probe()
CPU1: trigger_store() -> pmt_crashlog_disabled() -> entry->cb->read_reg()

In addition, trigger_store() calls pmt_crashlog_disabled() and (when
trigger is false) pmt_crashlog_set_clear() before checking
crashlog->trigger_ready, so a write to trigger during probe still accesses
registers and can clear the crashlog before setup finishes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794444671.gi=
t.david.e.box@linux.intel.com?part=3D1
