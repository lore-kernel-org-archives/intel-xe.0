Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF68C28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 14:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0110E7E8;
	Wed,  2 Apr 2025 14:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aaFJsyO7";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63EEA10E7E8
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 14:53:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E15D144406
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 14:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405FEC4CEDD
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743605587;
 bh=3psBfHa6q9GaR3lB9SNaBK+ExW2OnGalIiGqg6cGeFc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aaFJsyO75XOvD+hkgGkC/pjLpQ9z44qG+qB0EPuhY3h3NNu8SgKYRZLHi6vyZxdls
 hcRjnwqclfoecT1i/EUU1Nm0lh2GUpdyQ/1G32FXT3z1uGEo7nWg+W1TKtqTlNx7jG
 zKsMGUgDCr70CcvlJSK4hUlLED3u1GAogAS9kGr5rSkQYqrKaC74TpZrS8uQIn06gM
 DFRVlzOchg3DEzYUYNDfKdLbklYoLZc1hBrL1i3XDgyQ4T6Ch1pLbXKJF5w3K22+q+
 72SZLw8sL0GBYcA/QuGKvqh7dbODeshnW9zm59gWnNKT5unlsCTtB5wJ3m8RrYpd4H
 a0AhjqwjqNuaw==
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-72c0b4a038fso4170436a34.0
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 07:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW1c0lJiQJ9Dsnz5b9kD88+LFv6NiTZVCJmaiE55KYl+w/BFGDU5nOVje2MptMLT8qNQbCw1s7t/A==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw36wLZhaakolh41Y96rXbrHK1AZXYioP7inTvoKi/TgF3QdzuD
 A5A7CAF+tjQO0Ke9g67RdOhWlDgkOdKc7M24eXlErv0SpyUnhsauyy9fum6+PiYvgW4yOYUQm1s
 uSKkFahEtqC9Jkowqupwijs743io=
X-Google-Smtp-Source: AGHT+IEyltbLYDPynv/VzQLX4Ebg0HBz7/B1jIHBOb6/zoWxfWgXBGwqoQ25Jo6yLQIb7QUWPetgCorPQQQ39N8GVbc=
X-Received: by 2002:a9d:3e56:0:b0:72b:8e84:3150 with SMTP id
 46e09a7af769-72dae74a540mr4148634a34.24.1743605586573; Wed, 02 Apr 2025
 07:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAJZ5v0hN1qRzU96uAGf1+BoQyqF-1=C4XbCcPA-0xtGt8gj7qQ@mail.gmail.com>
 <20250402142104.GA1714299@bhelgaas>
In-Reply-To: <20250402142104.GA1714299@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Apr 2025 16:52:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0juJFTbPJh2rTmFe4gF9LzXsfao0k3ne2eXd5OqubtwCw@mail.gmail.com>
X-Gm-Features: AQ5f1JobU1rpqVnO-t8Fh7ASRqyLnoweW7rZorW3wSWSFIFzCBWC5KgtSMi94XI
Message-ID: <CAJZ5v0juJFTbPJh2rTmFe4gF9LzXsfao0k3ne2eXd5OqubtwCw@mail.gmail.com>
Subject: Re: [PATCH 02/12] PCI/ACPI: Add PERST# Assertion Delay _DSM method
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>, 
 intel-xe@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
 linux-pci@vger.kernel.org, lenb@kernel.org, bhelgaas@google.com, 
 ilpo.jarvinen@linux.intel.com, lucas.demarchi@intel.com, 
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

On Wed, Apr 2, 2025 at 4:21=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> w=
rote:
>
> On Wed, Apr 02, 2025 at 01:06:42PM +0200, Rafael J. Wysocki wrote:
> > On Tue, Apr 1, 2025 at 5:36=E2=80=AFPM Anshuman Gupta <anshuman.gupta@i=
ntel.com> wrote:
> > >
> > > Implement _DSM Method 11 as per PCI firmware specs
> > > section 4.6.11 Rev 3.3.
>
> > > +int pci_acpi_add_perst_assertion_delay(struct pci_dev *dev, u32 dela=
y_us)
> > > +{
> > > +       union acpi_object in_obj =3D {
> > > +               .integer.type =3D ACPI_TYPE_INTEGER,
> > > +               .integer.value =3D delay_us,
> > > +       };
> > > +
> > > +       union acpi_object *out_obj;
> > > +       acpi_handle handle;
> > > +       int result, ret =3D -EINVAL;
> > > +
> > > +       if (!dev || !ACPI_HANDLE(&dev->dev))
> > > +               return -EINVAL;
> > > +
> > > +       handle =3D ACPI_HANDLE(&dev->dev);
> > > +
> > > +       out_obj =3D acpi_evaluate_dsm_typed(handle, &pci_acpi_dsm_gui=
d, 4,
> >
> > This is something I haven't noticed in the previous patch, but also
> > applies to it.
> >
> > Why is rev 4 of the interface hard-coded here?
>
> Thanks for asking this because it's related to the whole _DSM revision
> question that I don't understand.
>
> If we didn't use rev 4 here, what should we use?  The PCI Firmware
> spec, r3.3, sec 4.6.11, documents this interface and says "lowest
> valid Revision ID value is 4", so that's the source of the 4.

Well, the "lowest vaild Revision ID" does not generally mean the "only
valid Revision ID".

> My argument is that the spec documents rev 4, the kernel code was
> tested with rev 4, so what would be the benefit of using a different
> revision here?

I'm talking about using a symbol to represent the number 4, not about
possibly using a different number, along the lines of using, say,
ACPI_FADT_LOW_POWER_S0 instead of putting BIT(21) directly into the
code.

The value is not likely to change, but using a symbol for representing
it has merit (it can be meaningfully used in searches, it can be
documented etc.).

Now, I'm not sure how likely it is for the PCI Firmware spec to bump
up the revision of this interface (I suppose that it will do so if a
new function is defined), but even if it does so, the kernel will have
to check both the new revision and rev 4 anyway, in case the firmware
doesn't know about the new revision.
