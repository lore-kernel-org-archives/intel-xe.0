Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB69C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 10:59:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F12310E0F5;
	Wed,  2 Apr 2025 10:59:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VTXo5pMA";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601E310E0F5
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:59:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1ACF843A94
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:59:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B4AC4CEDD
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 10:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743591558;
 bh=79vlvCwhFQ7PQ167zysxT2YjCVKh2MWHR+DdDGPB3xk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VTXo5pMATwS4NxbGZVkmTLXUmPqiDdvAl5J6oFqOEa0ItR+yMcZsPRkwg5ViPL508
 VFtKW0iEiRGuqSSNTOFUZaSQtYum0rh4+esxr7aQbZMirdOjURMe2S/6wsEge/qjK/
 MqfWnBIW5FlX480dhZv96IkYU6wsPHy+Fzr03LobSadb5z3GaDK3fYEOmcvtwR+Iar
 2+UsW71kVXjr0ZimbbIYcGG8asPt4WWtbP3mIeo3MBU4OOUlEPRsWWcCUmofSYUlF9
 P1yC2pFO2Ggid++9Y7NviGZxUrH4fvvxSW+0xpJV1/vn0wOkgyvX9b9e4a+YhJj9Uz
 NNRCKKG2KuvuQ==
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-2c2dc6c30c2so2001647fac.2
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 03:59:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YwdHEIL6fWwEREnc/rBar4Wp00Uk4jkMxqxscUvLhrNMkPAr1Gk
 lcJZp05KVTnZKBcnFZ93yGGzyOPnm8/qlyt/mo6nv43U1ha+KxPP+5STs6y53FD9dWjDjUgOhLO
 XhFEarlTZMJ1n74HK/11rag9VPCA=
X-Google-Smtp-Source: AGHT+IH6x+zQ+KQ+Tks6DI6Vj8fOJmmwES4mwbgUQGsKJyto/xGcDz/5bdLYfnSyTqx/izit30fZr0JSawhSg9xHppw=
X-Received: by 2002:a05:6870:9124:b0:2bc:7342:1a6c with SMTP id
 586e51a60fabf-2cc60b4f11cmr914246fac.19.1743591557770; Wed, 02 Apr 2025
 03:59:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250401153225.96379-2-anshuman.gupta@intel.com>
 <20250401182545.GA1675819@bhelgaas>
In-Reply-To: <20250401182545.GA1675819@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Apr 2025 12:59:06 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hs9ddB1dGzGsMfaWrHdq1cw8huao63_m6pKRQq6BnEcw@mail.gmail.com>
X-Gm-Features: AQ5f1Jq5BLkjL0lrW_VjmCt9KmP-6AC44giTO6xw8JDoD2ICihlpU3QmNicg3YQ
Message-ID: <CAJZ5v0hs9ddB1dGzGsMfaWrHdq1cw8huao63_m6pKRQq6BnEcw@mail.gmail.com>
Subject: Re: [PATCH 01/12] PCI/ACPI: Add D3cold Aux Power Limit_DSM method
To: Bjorn Helgaas <helgaas@kernel.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 linux-pci@vger.kernel.org, rafael@kernel.org, lenb@kernel.org, 
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, badal.nilawar@intel.com, varun.gupta@intel.com, 
 ville.syrjala@linux.intel.com, uma.shankar@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Apr 1, 2025 at 8:25=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Tue, Apr 01, 2025 at 09:02:14PM +0530, Anshuman Gupta wrote:
> > Implement _DSM method 10 and _DSM Method 11 as per PCI firmware specs
> > section 4.6.10 Rev 3.3.
>
> Thanks for splitting this into two patches.  But I think now this only
> implements function 10 (0x0a), so this sentence needs to be updated.
>
> I would write this consistently as "0x0a" or "0Ah" to match the spec
> description.  I don't think the spec ever uses "10".
>
> > Note that this implementation assumes only a single device below the
> > Downstream Port will request for Aux Power Limit under a given
> > Root Port because it does not track and aggregate requests
> > from all child devices below the Downstream Port as required
> > by Section 4.6.10 Rev 3.3.

Why is it regarded as compliant, then?

Request aggregation is a known problem that has been addressed for a
couple of times (at least) in the kernel.  Why is it too hard to
address it here?

> > One possible mitigation would be only allowing only first PCIe
> > Non-Bridge Endpoint Function 0 driver to call_DSM method 10.

What about topologies where there is a switch with multiple downstream
ports below the Root Port?

> >
> > Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/pci/pci-acpi.c   | 78 ++++++++++++++++++++++++++++++++++++++++
> >  include/linux/pci-acpi.h |  6 ++++
> >  2 files changed, 84 insertions(+)
> >
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index af370628e583..ebd49e43457e 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -1421,6 +1421,84 @@ static void pci_acpi_optimize_delay(struct pci_d=
ev *pdev,
> >       ACPI_FREE(obj);
> >  }
> >
> > +/**
> > + * pci_acpi_request_d3cold_aux_power - Request D3cold aux power via AC=
PI DSM
> > + * @dev: PCI device instance
> > + * @requested_power: Requested auxiliary power in milliwatts

How's the caller supposed to find out what value to use here?

> > + *
> > + * This function sends a request to the host BIOS via ACPI _DSM Functi=
on 10
> > + * to grant the required D3Cold Auxiliary power for the specified PCI =
device.
> > + * It evaluates the _DSM (Device Specific Method) to request the Auxil=
iary
> > + * power and handles the response accordingly.
> > + *
> > + * This function shall be only called by 1st non-bridge Endpoint drive=
r
> > + * on Function 0. For a Multi-Function Device, the driver for Function=
 0 is
> > + * required to report an aggregate power requirement covering all
> > + * functions contained within the device.
> > + *
> > + * Return: Returns 0 on success and errno on failure.
>
> Write all this in imperative mood, e.g.,
>
>   Request auxiliary power while device is in D3cold ...
>
>   Return 0 on success ...
>
> > + */
> > +int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 request=
ed_power)
> > +{
> > +     union acpi_object in_obj =3D {
> > +             .integer.type =3D ACPI_TYPE_INTEGER,
> > +             .integer.value =3D requested_power,
> > +     };
> > +
> > +     union acpi_object *out_obj;
> > +     acpi_handle handle;
> > +     int result, ret =3D -EINVAL;
> > +
> > +     if (!dev || !ACPI_HANDLE(&dev->dev))
> > +             return -EINVAL;
> > +
> > +     handle =3D ACPI_HANDLE(&dev->dev);

Well, ACPI_HANDLE() is not a simple macro, so I'd rather avoid using
it twice in a row for the same device.

What about

if (!dev)
        return -EINVAL;

handle =3D ACPI_HANDLE(&dev->dev);
if (!handle)
        return -EINVAL;

>
> This needs an acpi_check_dsm() call to find out whether the platform
> supports DSM_PCI_D3COLD_AUX_POWER_LIMIT.

Absolutely.

> We have several _DSM calls that *should* do this, but unfortunately
> they don't do it yet, so they're not good examples to copy.

Right.

> > +     out_obj =3D acpi_evaluate_dsm_typed(handle,
> > +                                       &pci_acpi_dsm_guid,
> > +                                       4,
> > +                                       DSM_PCI_D3COLD_AUX_POWER_LIMIT,
> > +                                       &in_obj,
> > +                                       ACPI_TYPE_INTEGER);
> > +     if (!out_obj)
> > +             return -EINVAL;
> > +
> > +     result =3D out_obj->integer.value;
> > +
> > +     switch (result) {
> > +     case 0x0:
> > +             dev_dbg(&dev->dev, "D3cold Aux Power %umW request denied\=
n",
> > +                     requested_power);
>
> Use pci_dbg(dev), pci_info(dev), etc.
>
> > +             break;
> > +     case 0x1:
> > +             dev_info(&dev->dev, "D3cold Aux Power request granted: %u=
mW\n",
> > +                      requested_power);
> > +             ret =3D 0;
> > +             break;
> > +     case 0x2:
> > +             dev_info(&dev->dev, "D3cold Aux Power: Main power won't b=
e removed\n");
> > +             ret =3D -EBUSY;
> > +             break;
> > +     default:
> > +             if (result >=3D 0x11 && result <=3D 0x1F) {
> > +                     int retry_interval =3D result & 0xF;
> > +
> > +                     dev_warn(&dev->dev, "D3cold Aux Power request nee=
ds retry."
> > +                              "Interval: %d seconds.\n", retry_interva=
l);
> > +                     msleep(retry_interval * 1000);
>
> It doesn't seem right to me to do this sleep internally because it
> means this interface might take up to 15 seconds to return, and the
> caller has no idea what is happening during that time.

I entirely agree here.

If this is going to happen during system suspend, sleeping for seconds
is a total no-go.

> This seems like it should be done in the driver, which can decide
> *whether* it wants to sleep, and if it does sleep, it may give a nice
> indication to the user.

So during a system suspend in progress, this is rather hard to achieve.

I'd say that if the request is not granted right away, it is a failure
and we don't use D3cold.

> Of course, that would mean returning some kind of retry interval
> information to the caller.
>
> > +                     ret =3D -EAGAIN;
> > +             } else {
> > +                     dev_err(&dev->dev, "D3cold Aux Power: Reserved or=
 "
> > +                             "unsupported response: 0x%x.\n", result);
>
> Drop periods at end of messages.
>
> > +             }
> > +             break;
> > +     }
> > +
> > +     ACPI_FREE(out_obj);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL(pci_acpi_request_d3cold_aux_power);
