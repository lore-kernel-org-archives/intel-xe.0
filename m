Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823DBC8303F
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 11:11:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3A510E19E;
	Wed,  2 Jul 2025 11:11:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QpvQVZkG";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFCB710E6F3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:11:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AC2455C5D51
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F013C4CEF2
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751454673;
 bh=bsMtw3zK5TNgNeh1WODeeWPJyyYiNq3OYiYUWQ3xQbY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QpvQVZkG0pyX2a0OZ64i1/52ZJhFl3rNDlcAJTxfuBTXaZkIQF9goRzZMDtYimn7k
 nTajuMNPsrukIX/7m388eGyIvRSsrIKHalXWmLW0QSAxkrWPFsL+mfV30Km+PUJdLl
 oExmDXcw3/z5ghwVQgFgxP1GF6KAKTBJ7R5PgEiaa59TJw1RlSo1xv7Qw3XNSuS+YO
 UHr0oPfEFNdwd704Xne0tOYTRwOri2y8vNCHoC8p/gV2KJRkiTPBfVYH27IW70Rnu6
 /REMrP/lQSNn0crYTBF2vFO/gDyGGY1UbYN7QJ7XeqkJpIR9Z6MJ4Rtl2p/gWnMESF
 AVIyLlmDJNEfw==
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-735a6d7c5b1so3410951a34.2
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Jul 2025 04:11:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUv/ciqR/WALs0PisTe1SawyWKxBlw0bXNY/sc7F0CQjn8cZVgvL4vyTpmNVm7aDrd59DjFjXIq2w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSHgfdjxxqb5Yb+QewuiiptWKwNr61aVPrQ+NhAW/wVCaCqHv7
 yRcUOWKGLY9EKgAeXrcOmCUK/Cau4RrLehuWaiSS8Z3K/5fTm9slIY4FxZVHrPU+kGqQfzFM78f
 +43Qj/jFvY3SRWDvYNxuomcJP3DISRjA=
X-Google-Smtp-Source: AGHT+IGa+Rw/cMy590FiJwiEGqqKmliVcDaetHV3zVOfMk+IIxdLD+NepjMz9wUxEqwLMlQYU2nk4eUA7h0vZMq6H+M=
X-Received: by 2002:a05:6830:6484:b0:72c:320b:fc8c with SMTP id
 46e09a7af769-73b4d1a87fbmr1893227a34.21.1751454672486; Wed, 02 Jul 2025
 04:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250529111654.3140766-1-badal.nilawar@intel.com>
 <20250529111654.3140766-3-badal.nilawar@intel.com>
 <98fc8402-0bda-4333-8407-75c7a6472375@linux.intel.com>
In-Reply-To: <98fc8402-0bda-4333-8407-75c7a6472375@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 13:11:00 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hm_UyEEXz+1LYGwGXNi908vYgKw0CD3C=wmBvT=vAh0Q@mail.gmail.com>
X-Gm-Features: Ac12FXxIAduxIODCi3wN-S2nsn3sMmozW1G3nApQ8LgR_4RlnSXYlEMp9tZ3RUs
Message-ID: <CAJZ5v0hm_UyEEXz+1LYGwGXNi908vYgKw0CD3C=wmBvT=vAh0Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] PCI/ACPI: Per root port allow one Aux power
 limit request
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>, intel-xe@lists.freedesktop.org, 
 linux-acpi@vger.kernel.org, linux-pci@vger.kernel.org, 
 anshuman.gupta@intel.com, rafael@kernel.org, lenb@kernel.org, 
 bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
 rodrigo.vivi@intel.com, varun.gupta@intel.com, ville.syrjala@linux.intel.com, 
 uma.shankar@intel.com
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

On Thu, May 29, 2025 at 11:41=E2=80=AFPM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
> On 5/29/25 4:16 AM, Badal Nilawar wrote:
> > For given root port allow one Aux power limit request.
> >
> > Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >   drivers/acpi/scan.c     |  1 +
> >   drivers/pci/pci-acpi.c  | 25 ++++++++++++++++++++++++-
> >   include/acpi/acpi_bus.h |  2 ++
> >   3 files changed, 27 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> > index fb1fe9f3b1a3..9ae7be9db01a 100644
> > --- a/drivers/acpi/scan.c
> > +++ b/drivers/acpi/scan.c
> > @@ -745,6 +745,7 @@ int acpi_device_add(struct acpi_device *device)
> >       INIT_LIST_HEAD(&device->physical_node_list);
> >       INIT_LIST_HEAD(&device->del_list);
> >       mutex_init(&device->physical_node_lock);
> > +     mutex_init(&device->power.aux_pwr_lock);
> >
> >       mutex_lock(&acpi_device_lock);
> >
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index 87f30910a5f1..d33efba4ca94 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -1451,6 +1451,7 @@ int pci_acpi_request_d3cold_aux_power(struct pci_=
dev *dev, u32 requested_power,
> >       union acpi_object *out_obj;
> >       acpi_handle handle;
> >       int result, ret =3D -EINVAL;
> > +     struct acpi_device *adev;
> >
> >       if (!dev || !retry_interval)
> >               return -EINVAL;
> > @@ -1464,11 +1465,27 @@ int pci_acpi_request_d3cold_aux_power(struct pc=
i_dev *dev, u32 requested_power,
> >               return -ENODEV;
> >       }
> >
> > +     adev =3D ACPI_COMPANION(&dev->dev);
> > +     if (!adev)
> > +             return -EINVAL;
> > +
> > +     mutex_lock(&adev->power.aux_pwr_lock);
> > +
> > +     /* Check if aux power already granted */
> > +     if (adev->power.aux_power_limit) {
> > +             pci_info(dev, "D3cold Aux Power request already granted: =
%u mW\n",
> > +                      adev->power.aux_power_limit);
> > +             mutex_unlock(&adev->power.aux_pwr_lock);
> > +             return -EPERM;
> > +     }
> > +
> >       out_obj =3D acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4=
,
> >                                         DSM_PCI_D3COLD_AUX_POWER_LIMIT,
> >                                         &in_obj, ACPI_TYPE_INTEGER);
> > -     if (!out_obj)
> > +     if (!out_obj) {
> > +             mutex_unlock(&adev->power.aux_pwr_lock);
> >               return -EINVAL;
> > +     }
> >
> >       result =3D out_obj->integer.value;
> >       if (retry_interval)
> > @@ -1478,14 +1495,17 @@ int pci_acpi_request_d3cold_aux_power(struct pc=
i_dev *dev, u32 requested_power,
> >       case 0x0:
> >               pci_dbg(dev, "D3cold Aux Power %u mW request denied\n",
> >                       requested_power);
> > +             adev->power.aux_power_limit =3D 0;
> >               break;
> >       case 0x1:
> >               pci_info(dev, "D3cold Aux Power request granted: %u mW\n"=
,
> >                        requested_power);
> > +             adev->power.aux_power_limit =3D requested_power;
> >               ret =3D 0;
> >               break;
> >       case 0x2:
> >               pci_info(dev, "D3cold Aux Power: Main power won't be remo=
ved\n");
> > +             adev->power.aux_power_limit =3D 0;
> >               ret =3D -EBUSY;
> >               break;
> >       default:
> > @@ -1500,9 +1520,12 @@ int pci_acpi_request_d3cold_aux_power(struct pci=
_dev *dev, u32 requested_power,
> >                       pci_err(dev, "D3cold Aux Power: Reserved or unsup=
ported response: 0x%x\n",
> >                               result);
> >               }
> > +             adev->power.aux_power_limit =3D 0;
> >               break;
> >       }
> >
> > +     mutex_unlock(&adev->power.aux_pwr_lock);
> > +
> >       ACPI_FREE(out_obj);
> >       return ret;
> >   }
> > diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> > index aad1a95e6863..c4ce3d84be00 100644
> > --- a/include/acpi/acpi_bus.h
> > +++ b/include/acpi/acpi_bus.h
> > @@ -294,6 +294,8 @@ struct acpi_device_power {
> >       struct acpi_device_power_flags flags;
> >       struct acpi_device_power_state states[ACPI_D_STATE_COUNT];      /=
* Power states (D0-D3Cold) */
> >       u8 state_for_enumeration; /* Deepest power state for enumeration =
*/
> > +     u32 aux_power_limit;            /* aux power limit granted by bio=
s */
> > +     struct mutex aux_pwr_lock;      /* prevent concurrent aux power l=
imit requests */
>
>
> Do you need a new lock ?

Yes.

> Is it possible to reuse existing mutex like device_lock()?

No.

Doing such things results in code where nobody knows what the given
lock scope is.
