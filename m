Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C5ACCD1A5
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 08:45:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8F610E240;
	Fri, 24 Oct 2025 08:45:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="C25+Jqdj";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57ADC10EA10
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 08:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=SckvzvtqAlVsB0xWL+sj9UnbS0aJYxJfJMb2wF6gvDk=; 
 t=1761295516; x=1762505116; b=C25+JqdjkEWYAPB5nafEFlePMC6WTFO/VcgZI1Zu4an0//R
 2TKzNVDgiphAYcEbjviXaBNI98CB3L9BnZrz0edD6++rjM9j1N5iEnIj+yagZILU39pWD+ttag+fX
 yh7MPXY6axt9La7E1fBm9nBv5Lb22OJotP3bjkGJqnQOR9ui7xXx4Hb5PAtMURfdXt+ZGZZGupQN9
 YmVimKjXsJaOdOCZH4UEtGhnfuPJi7xRM91nu9yKtk3lRDLgRnydyurREp+FM9WpfDDFp4Ph/lAtI
 IxiQR60PbLlRIRZ+qThG6V8ennbCVXVMblXcadpJqGnYU9zM6ymaxgehU1bHNBXw==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.2) (envelope-from <johannes@sipsolutions.net>)
 id 1vCCuK-00000002NRR-1tjW; Fri, 24 Oct 2025 10:12:20 +0200
Message-ID: <e683355a9a9f700d98ae0a057063a975bb11fadc.camel@sipsolutions.net>
Subject: Re: [PATCH] devcoredump: Fix circular locking dependency with
 devcd->mutex.
From: Johannes Berg <johannes@sipsolutions.net>
To: Maarten Lankhorst <dev@lankhorst.se>, linux-kernel@vger.kernel.org
Cc: intel-xe@lists.freedesktop.org, Mukesh Ojha <quic_mojha@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Danilo Krummrich	 <dakr@kernel.org>,
 stable@vger.kernel.org, Matthew Brost <matthew.brost@intel.com>
Date: Fri, 24 Oct 2025 10:12:19 +0200
In-Reply-To: <20250723142416.1020423-1-dev@lankhorst.se>
References: <20250723142416.1020423-1-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Wed, 2025-07-23 at 16:24 +0200, Maarten Lankhorst wrote:
>=20
> +static void __devcd_del(struct devcd_entry *devcd)
> +{
> +	devcd->deleted =3D true;
> +	device_del(&devcd->devcd_dev);
> +	put_device(&devcd->devcd_dev);
> +}
> +
>  static void devcd_del(struct work_struct *wk)
>  {
>  	struct devcd_entry *devcd;
> +	bool init_completed;
> =20
>  	devcd =3D container_of(wk, struct devcd_entry, del_wk.work);
> =20
> -	device_del(&devcd->devcd_dev);
> -	put_device(&devcd->devcd_dev);
> +	/* devcd->mutex serializes against dev_coredumpm_timeout */
> +	mutex_lock(&devcd->mutex);
> +	init_completed =3D devcd->init_completed;
> +	mutex_unlock(&devcd->mutex);
> +
> +	if (init_completed)
> +		__devcd_del(devcd);

I'm not sure I understand this completely right now. I think you pull
this out of the mutex because otherwise the unlock could/would be UAF,
right?

But also we have this:

> @@ -151,11 +160,21 @@ static int devcd_free(struct device *dev, void *dat=
a)
>  {
>  	struct devcd_entry *devcd =3D dev_to_devcd(dev);
> =20
> +	/*
> +	 * To prevent a race with devcd_data_write(), disable work and
> +	 * complete manually instead.
> +	 *
> +	 * We cannot rely on the return value of
> +	 * disable_delayed_work_sync() here, because it might be in the
> +	 * middle of a cancel_delayed_work + schedule_delayed_work pair.
> +	 *
> +	 * devcd->mutex here guards against multiple parallel invocations
> +	 * of devcd_free().
> +	 */
> +	disable_delayed_work_sync(&devcd->del_wk);
>  	mutex_lock(&devcd->mutex);
> -	if (!devcd->delete_work)
> -		devcd->delete_work =3D true;
> -
> -	flush_delayed_work(&devcd->del_wk);
> +	if (!devcd->deleted)
> +		__devcd_del(devcd);
>  	mutex_unlock(&devcd->mutex);

^^^^

Which I _think_ is probably OK because devcd_free is only called with an
extra reference held (for each/find device.)

But ... doesn't that then still have unbalanced calls to __devcd_del()
and thus device_del()/put_device()?

CPU 0				CPU 1

dev_coredump_put()		devcd_del()
 -> devcd_free()
   -> locked
     -> !deleted
     -> __devcd_del()
				-> __devcd_del()

no?

johannes
