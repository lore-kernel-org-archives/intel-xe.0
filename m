Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5678DD65C56
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 14:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A7A10E06A;
	Wed, 17 Dec 2025 14:45:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CQA6/6y5";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3A510E06A
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 14:45:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A412601A6
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 14:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CC4C113D0
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 14:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765982753;
 bh=Uj7Jw3bncBxQcTu24XpGcQ5wlaHtL0/IWdbHSJUyeAw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CQA6/6y5WmzFuTxhaUZvSMd6SoqYycuu03DUy0GwlUHcET9n/zUE12fLkVuiIIBke
 wQ5VJeNn4nX3E+G/mqWSb7aPcNZ7fjH8F2n+j5zCu8sv8cXhXT0nAGhy38gmgGTnKo
 157hX/9cdbGFg6KkwG8f2QemVtOtPUPcCyclA4wXMA7QyO3XJTsycb1yzsATUXnxLj
 AHd3gKKXtzzSviMM4i31Rd6vEcMj3Ycwog9GUuN0MOiGIzWGycG61MfSN2fRYcfrns
 960hXzOjcJ3/tIQYxZO7FI7oIO0dxPZWtEYCjfyw8Cir872ujGQty+uSml2jA2zOV/
 eD+7M4P5VcHkQ==
Received: by mail-oo1-f41.google.com with SMTP id
 006d021491bc7-65791c35134so3490893eaf.1
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 06:45:53 -0800 (PST)
X-Gm-Message-State: AOJu0Yyzw3cyd7Djdq/a5cgZJVeGhVYx5UQtmpVhkXvfW8PAIoQbXmSW
 27UD+39ty3dTxTpWm9TbKSrl45196QsYxWN4y/H00HD0wF/QL5XrVV4o9kPRUJXMK9IaG3nTE4O
 DcNbwVJ/Z5La7KuDtd1vUqgH3N+7wxVU=
X-Google-Smtp-Source: AGHT+IGru571n6LEQRQcP3oWM3KWt3LuuRTYuBI1b7zy9ahwnzID+Z1zO4ejogcUX3WIGEvnl9hOFuDYJYjxL430aVE=
X-Received: by 2002:a05:6820:2201:b0:659:9a49:8eb2 with SMTP id
 006d021491bc7-65b4523b585mr7664762eaf.54.1765982752979; Wed, 17 Dec 2025
 06:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20251015080710.1468409-1-badal.nilawar@intel.com>
 <20251015080710.1468409-3-badal.nilawar@intel.com>
In-Reply-To: <20251015080710.1468409-3-badal.nilawar@intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 17 Dec 2025 15:45:41 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0itN6X-_vRTbNsaUPkYMZB5KQGDgX3=3oSeq_DkxB7drw@mail.gmail.com>
X-Gm-Features: AQt7F2pgXVF39xZ30iWTdXcNXovHLxA7Mbsd-D9NbtqAfNiN3IUzyVoKlWqsRSE
Message-ID: <CAJZ5v0itN6X-_vRTbNsaUPkYMZB5KQGDgX3=3oSeq_DkxB7drw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] PCI/ACPI: Per Root/Switch Downstream Port allow
 one aux power limit request
To: Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com, rafael@kernel.org, 
 lenb@kernel.org, bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com, 
 ville.syrjala@linux.intel.com, uma.shankar@intel.com, karthik.poosa@intel.com
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

On Wed, Oct 15, 2025 at 10:02=E2=80=AFAM Badal Nilawar <badal.nilawar@intel=
.com> wrote:
>
> Since aggregation of auxiliary power across multiple devices under a
> Root or Switch Downstream Port is not supported, allow only one device
> is to request auxiliary power
>
> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>

Sorry for the long delay, but in addition to the comments posted
earlier, I have some more to say regarding this patch (see below).

> ---
> V1:
>  - Use guard(mutex) for new mutex (Rafael)
>  - Add mutex_detroy (Ilpo J=C3=A4rvinen)
>  - %s/pci_warn/pci_info/ for -EAGAIN
>  - Allow the same device to re-request auxiliary power if it has already =
been granted
> ---
>  drivers/acpi/scan.c     |  3 +++
>  drivers/pci/pci-acpi.c  | 22 ++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  3 +++
>  3 files changed, 28 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index ef16d58b2949..4573fb0f4f3e 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -518,6 +518,7 @@ static void acpi_device_release(struct device *dev)
>         acpi_free_properties(acpi_dev);
>         acpi_free_pnp_ids(&acpi_dev->pnp);
>         acpi_free_power_resources_lists(acpi_dev);
> +       mutex_destroy(&acpi_dev->power.aux_pwr_lock);
>         kfree(acpi_dev);
>  }
>
> @@ -746,6 +747,8 @@ int acpi_device_add(struct acpi_device *device)
>         INIT_LIST_HEAD(&device->physical_node_list);
>         INIT_LIST_HEAD(&device->del_list);
>         mutex_init(&device->physical_node_lock);
> +       mutex_init(&device->power.aux_pwr_lock);
> +       device->power.dev =3D NULL;
>
>         mutex_lock(&acpi_device_lock);
>
> diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> index c7eab1e75dd5..74f118016b1d 100644
> --- a/drivers/pci/pci-acpi.c
> +++ b/drivers/pci/pci-acpi.c
> @@ -1477,6 +1477,7 @@ int pci_acpi_request_d3cold_aux_power(struct pci_de=
v *dev, u32 requested_mw,
>         union acpi_object *out_obj;
>         int result, ret =3D -EINVAL;
>         struct pci_dev *bdev;
> +       struct acpi_device *adev;
>
>         if (!dev || PCI_FUNC(dev->devfn) !=3D 0)
>                 return -EINVAL;
> @@ -1486,6 +1487,19 @@ int pci_acpi_request_d3cold_aux_power(struct pci_d=
ev *dev, u32 requested_mw,
>         if (IS_ERR(bdev))
>                 return PTR_ERR(bdev);
>
> +       adev =3D ACPI_COMPANION(&bdev->dev);
> +       if (!adev)
> +               return -EINVAL;
> +
> +       guard(mutex)(&adev->power.aux_pwr_lock);
> +
> +       /* Check if aux power already granted to different device */
> +       if (adev->power.dev && adev->power.dev !=3D &dev->dev) {
> +               pci_info(to_pci_dev(adev->power.dev), "D3cold Aux Power r=
equest already granted: %u mW\n",
> +                        adev->power.aux_power_limit);
> +               return -EPERM;
> +       }
> +
>         out_obj =3D acpi_evaluate_dsm_typed(ACPI_HANDLE(&bdev->dev),
>                                           &pci_acpi_dsm_guid, 4,
>                                           DSM_PCI_D3COLD_AUX_POWER_LIMIT,
> @@ -1501,14 +1515,20 @@ int pci_acpi_request_d3cold_aux_power(struct pci_=
dev *dev, u32 requested_mw,
>         case AUX_PWR_REQ_DENIED:
>                 pci_dbg(bdev, "D3cold Aux Power %u mW request denied\n",
>                         requested_mw);
> +               adev->power.aux_power_limit =3D 0;
> +               adev->power.dev =3D NULL;
>                 break;
>         case AUX_PWR_REQ_GRANTED:
>                 pci_info(bdev, "D3cold Aux Power request granted: %u mW\n=
",
>                          requested_mw);
> +               adev->power.aux_power_limit =3D requested_mw;
> +               adev->power.dev =3D &dev->dev;
>                 ret =3D 0;
>                 break;
>         case AUX_PWR_REQ_NO_MAIN_PWR_REMOVAL:
>                 pci_info(bdev, "D3cold Aux Power: Main power won't be rem=
oved\n");
> +               adev->power.aux_power_limit =3D 0;
> +               adev->power.dev =3D NULL;
>                 ret =3D -EBUSY;
>                 break;
>         default:
> @@ -1524,6 +1544,8 @@ int pci_acpi_request_d3cold_aux_power(struct pci_de=
v *dev, u32 requested_mw,
>                         pci_err(bdev, "D3cold Aux Power: Reserved or unsu=
pported response: 0x%x\n",
>                                 result);
>                 }
> +               adev->power.aux_power_limit =3D 0;
> +               adev->power.dev =3D NULL;
>                 break;
>         }
>
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index aad1a95e6863..cfa0c7233f13 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -294,6 +294,9 @@ struct acpi_device_power {
>         struct acpi_device_power_flags flags;
>         struct acpi_device_power_state states[ACPI_D_STATE_COUNT];      /=
* Power states (D0-D3Cold) */
>         u8 state_for_enumeration; /* Deepest power state for enumeration =
*/
> +       u32 aux_power_limit;            /* aux power limit granted by pla=
tform firmware */
> +       struct device *dev;             /* device to which aux power is g=
ranted */
> +       struct mutex aux_pwr_lock;      /* prevent concurrent aux power l=
imit requests */
>  };

So this adds a u32, a device pointer, and a mutex structure to every
struct acpi_device object in the system even on systems that don't
care about the use case at hand at all.

You need to find a different way to attach the information needed to
synchronize the aux power requests to the PCI bridge the _DSM is
evaluated for, sorry.
