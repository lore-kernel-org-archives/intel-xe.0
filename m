Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5D7C8303F
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 11:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A080610E6F3;
	Wed,  2 Jul 2025 11:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Wr33vVt5";
	dkim-atps=neutral
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5F510E6F3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:25:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 87761A535F6
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:25:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3280DC4CEF0
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 11:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751455514;
 bh=8dTzzH6XD0LnYay4bzUgFc2z0nXsE2kke2FZGdNx4nM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wr33vVt5VR19BjqT3F3Sr7rgI3+y6ZUOV3qIBfdxC16QkgjFGmP4n1DtdnIcyMMhu
 AAxQIvxp3Yk/PaAvhdlu9/ubcfcFMoKQr8usHC44Ofto2lIM+Mh8YwYoxP/s5qkAkk
 RCDunzKhcY0FKMNWGGWBuC+BoQMuSUaxWdy8vmkAUY2M3u7zlRUVA8VByyUKFYbhUt
 nojNT9xM1Uy0uWdPIjUlHP0rbUjqyl4o/bwcNpgQuqX0Gh4CQnPchqxOaV6oAevwnp
 zKMkqhODz6AwOf/qiMlkMLneDx9kbvsApK924rnAXRToyC31GlQ8kN78GiKSFG96qK
 Lfvwf7YQ1Hssw==
Received: by mail-oo1-f42.google.com with SMTP id
 006d021491bc7-6119b103132so4068300eaf.1
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Jul 2025 04:25:14 -0700 (PDT)
X-Gm-Message-State: AOJu0YwttzLa5iHHWUZTVjcd9BUyq/t6P3kPOa9A01mPMj9KTMa2TdSu
 LSisRvkVYkp5DhiWcO+hoeH9QcxtWH78ZrheoSuUYL0X0b922iNSdQrZGuqGDo3oCwHBnVPwoC5
 4hwrrrIQQNbOyQxdH4mSZeWfL1foo+XM=
X-Google-Smtp-Source: AGHT+IFcqryTGk2cqRSJP4XnYZ/PNgYLdq3uf9O8wXIGNDre0aUGcDqxLCVTdgRa6tDYI3HSGKzv8ZyDRb9kkLSzmkc=
X-Received: by 2002:a05:6820:206:b0:611:3e54:8d0a with SMTP id
 006d021491bc7-61201765b68mr1615739eaf.1.1751455513424; Wed, 02 Jul 2025
 04:25:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250529111654.3140766-1-badal.nilawar@intel.com>
 <20250529111654.3140766-4-badal.nilawar@intel.com>
 <7bf8430d-fbb5-4e6f-9b09-11f6bc1ff67e@linux.intel.com>
In-Reply-To: <7bf8430d-fbb5-4e6f-9b09-11f6bc1ff67e@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Jul 2025 13:25:02 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jHbGZAePFPopDOWE86j6Ao+_rJ3FRHKyb1asmxgfLYJA@mail.gmail.com>
X-Gm-Features: Ac12FXyl2MeTXS_1Bc8jq9qtu2kQsHl5o51-8kl61hFF0HmIw9CXBlHu_iIJyEI
Message-ID: <CAJZ5v0jHbGZAePFPopDOWE86j6Ao+_rJ3FRHKyb1asmxgfLYJA@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] PCI/ACPI: Add PERST# Assertion Delay _DSM method
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>, 
 Badal Nilawar <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 linux-pci@vger.kernel.org, anshuman.gupta@intel.com, rafael@kernel.org, 
 lenb@kernel.org, bhelgaas@google.com, ilpo.jarvinen@linux.intel.com, 
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com, varun.gupta@intel.com, 
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

On Thu, May 29, 2025 at 11:57=E2=80=AFPM Sathyanarayanan Kuppuswamy
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>
>
> On 5/29/25 4:16 AM, Badal Nilawar wrote:
> > From: Anshuman Gupta <anshuman.gupta@intel.com>
> >
> > Implement _DSM Method 0Bh as per PCI firmware specs
> > section 4.6.11 Rev 3.3.
> >
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> > ---
> >   drivers/pci/pci-acpi.c   | 57 +++++++++++++++++++++++++++++++++++++++=
+
> >   include/linux/pci-acpi.h |  8 +++++-
> >   2 files changed, 64 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index d33efba4ca94..88044491feaa 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -1531,6 +1531,63 @@ int pci_acpi_request_d3cold_aux_power(struct pci=
_dev *dev, u32 requested_power,
> >   }
> >   EXPORT_SYMBOL_GPL(pci_acpi_request_d3cold_aux_power);
> >
> > +/**
> > + * pci_acpi_add_perst_assertion_delay - Request PERST# delay via ACPI =
DSM
> > + * @dev: PCI device instance
> > + * @delay_us: Requested delay_us
> > + *
> > + * This function sends a request to the host BIOS via ACPI _DSM to gra=
nt the
> > + * required PERST# delay for the specified PCI device. It evaluates th=
e _DSM
> > + * to request the PERST# delay and handles the response accordingly.
> > + *
> > + * Return: returns 0 on success and errno on failure.
> > + */
> > +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_=
us)
> > +{
> > +     union acpi_object in_obj =3D {
> > +             .integer.type =3D ACPI_TYPE_INTEGER,
> > +             .integer.value =3D delay_us,
> > +     };
> > +
> > +     union acpi_object *out_obj;
> > +     acpi_handle handle;
> > +     int result, ret =3D -EINVAL;
> > +
> > +     if (!dev)
> > +             return -EINVAL;
> > +
> > +     handle =3D ACPI_HANDLE(&dev->dev);
> > +     if (!handle)
> > +             return -EINVAL;
> > +
> > +     if (!acpi_check_dsm(handle, &pci_acpi_dsm_guid, 4, 1 << DSM_PCI_P=
ERST_ASSERTION_DELAY)) {
> > +             pci_dbg(dev, "ACPI _DSM 0%Xh not supported\n", DSM_PCI_PE=
RST_ASSERTION_DELAY);
> > +             return -ENODEV;
> > +     }
> > +
> > +     out_obj =3D acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_guid, 4=
,
> > +                                       DSM_PCI_PERST_ASSERTION_DELAY,
> > +                                       &in_obj, ACPI_TYPE_INTEGER);
> > +     if (!out_obj)
> > +             return -EINVAL;
> > +
> > +     result =3D out_obj->integer.value;
> > +
> > +     if (result =3D=3D delay_us) {
> > +             pci_info(dev, "PERST# Assertion Delay set to %u microseco=
nds\n", delay_us);
> > +             ret =3D 0;
>
> I think above is a debug message. If it is set properly, why would you wa=
nt to know
> the details?
>
> > +     } else if (result =3D=3D 0) {
> > +             pci_warn(dev, "PERST# Assertion Delay request failed, no =
previous valid request\n");
> > +     } else {
> > +             pci_warn(dev, "PERST# Assertion Delay request failed, Pre=
vious valid delay: %u microseconds\n",
> > +                      result);
> > +     }
>
> May be you don't need to elaborate the error details. Will following work=
?
>
> pci_warn(dev, "PERST# Assertion Delay request failed, result:%u micro sec=
onds\n", result);

Or even

pci_info(dev, "PERST# Assertion Delay request failed, using %u ms
delay\n", result);

And it doesn't really need to be pci_warn().

>
> > +
> > +     ACPI_FREE(out_obj);
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(pci_acpi_add_perst_assertion_delay);
> > +
> >   static void pci_acpi_set_external_facing(struct pci_dev *dev)
> >   {
> >       u8 val;
> > diff --git a/include/linux/pci-acpi.h b/include/linux/pci-acpi.h
> > index 6079306ad754..e53d4893cf56 100644
> > --- a/include/linux/pci-acpi.h
> > +++ b/include/linux/pci-acpi.h
> > @@ -122,6 +122,7 @@ extern const guid_t pci_acpi_dsm_guid;
> >   #define DSM_PCI_POWER_ON_RESET_DELAY                0x08
> >   #define DSM_PCI_DEVICE_READINESS_DURATIONS  0x09
> >   #define DSM_PCI_D3COLD_AUX_POWER_LIMIT              0x0A
> > +#define DSM_PCI_PERST_ASSERTION_DELAY                0x0B
> >
> >   #ifdef CONFIG_PCIE_EDR
> >   void pci_acpi_add_edr_notifier(struct pci_dev *pdev);
> > @@ -135,7 +136,7 @@ int pci_acpi_set_companion_lookup_hook(struct acpi_=
device *(*func)(struct pci_de
> >   void pci_acpi_clear_companion_lookup_hook(void);
> >   int pci_acpi_request_d3cold_aux_power(struct pci_dev *dev, u32 reques=
ted_power,
> >                                     u32 *retry_interval);
> > -
> > +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 delay_=
us);
> >   #else       /* CONFIG_ACPI */
> >   static inline void acpi_pci_add_bus(struct pci_bus *bus) { }
> >   static inline void acpi_pci_remove_bus(struct pci_bus *bus) { }
> > @@ -144,6 +145,11 @@ static inline int pci_acpi_request_d3cold_aux_powe=
r(struct pci_dev *dev, u32 req
> >   {
> >       return -EOPNOTSUPP;
> >   }
> > +
> > +static inline int pci_acpi_add_perst_assertion_delay(struct pci_dev *d=
ev, u32 delay_us)
> > +{
> > +     return -EOPNOTSUPP;
> > +}
> >   #endif      /* CONFIG_ACPI */
> >
> >   #endif      /* _PCI_ACPI_H_ */
>
> --
> Sathyanarayanan Kuppuswamy
> Linux Kernel Developer
>
