Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189FFC3601A
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 13:34:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BD610E9C3;
	Thu,  3 Apr 2025 13:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EU4bRLET";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D30F10E9C3
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 13:34:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C3F145C5E55
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 13:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797CDC4AF09
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743687271;
 bh=6RjrX6SmRqnQWq4LY/kZC/9S8/r7qMbPRi0OR7gJ4ow=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EU4bRLETKpzRLpYyYx8qt+c9++6j/Ezgou1aKOtAVKfuRPu0ccVxJpbqd+vxZC4mb
 wur4+Dr2qX+gWMbydgfkgxhB8+8bKppgZeF74T6LZpFcePr/GIe8OtZaNzg3oywhR8
 QUt1pO4XYVJF2nUkeyOJwc1h9y4i7d3mIWrswEvo0fLsihOf2v5t7eW8s7JytZJQJT
 xRBpbhF7Ygc9aBBCX01umOXHbCPaeu14PhZ/2FVuTQpIda9z/VN8sH2tOYSPLUlQO1
 8lWhMhzJ8eb/XKGm5dQLzongXTnh2Jh3eTTvM8Z0pAhYPvyHvmG4TnKLy/i9fqxlTw
 Vhe9vSB4AyBRQ==
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-60402c94319so457365eaf.1
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Apr 2025 06:34:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCX+rpR2PAbkMIQ7rMDKvpx0gUcjWrSR9geJe7xbGW1acF2YiCO5L+smdHIW8S/saaTSiKeuj9oJrQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytLDawsmT2Wmh3TUHIwpz6rc4WtbCjaB+tNNEwlJWTEEst0hsw
 ta+K+BXgXP0UYHr/HEJ+Lluh1Os4KOKoQTs87oIMLAi6sSvgkiXt//Es6p9/Y928ALQBrHoFNSZ
 t5j5R+U5b0swhHgoYZCrRJXhI8Go=
X-Google-Smtp-Source: AGHT+IErzExqZCnHXv6vAXOSSx4sthsks5a9/NeM7CLvDChyPfrDi45shw4D7wTYISZ/wQxQZxZa4i47ESkl/HctuEE=
X-Received: by 2002:a05:6871:2313:b0:296:5928:7a42 with SMTP id
 586e51a60fabf-2cc8397c01dmr1223827fac.22.1743687270755; Thu, 03 Apr 2025
 06:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250401153225.96379-4-anshuman.gupta@intel.com>
 <20250401201349.GA1676401@bhelgaas>
 <CAJZ5v0irNFX6dFrStinNXamrhP143=yjjfx4iK0pY+-dTEkviw@mail.gmail.com>
 <CY5PR11MB6211021207DE5ECAA43BF26595AE2@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6211021207DE5ECAA43BF26595AE2@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Apr 2025 15:34:19 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0inCpM2UhzZ_pD52S0Hf8aaEMa40CyE-dwzVmO1n3PMwA@mail.gmail.com>
X-Gm-Features: AQ5f1Jq5ygn2A-o3P8j6nUP7IfUyydRmUNgORNNjZJ_sXGhr5ufiojwS7vdz5ic
Message-ID: <CAJZ5v0inCpM2UhzZ_pD52S0Hf8aaEMa40CyE-dwzVmO1n3PMwA@mail.gmail.com>
Subject: Re: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "lenb@kernel.org" <lenb@kernel.org>, 
 "bhelgaas@google.com" <bhelgaas@google.com>, 
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, 
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Gupta,
 Varun" <varun.gupta@intel.com>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>
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

On Thu, Apr 3, 2025 at 1:30=E2=80=AFPM Gupta, Anshuman <anshuman.gupta@inte=
l.com> wrote:
>
> > -----Original Message-----
> > From: Rafael J. Wysocki <rafael@kernel.org>
> > Sent: Wednesday, April 2, 2025 4:54 PM
> > To: Bjorn Helgaas <helgaas@kernel.org>; Gupta, Anshuman
> > <anshuman.gupta@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; linux-acpi@vger.kernel.org; linux-
> > pci@vger.kernel.org; rafael@kernel.org; lenb@kernel.org;
> > bhelgaas@google.com; ilpo.jarvinen@linux.intel.com; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Nil=
awar,
> > Badal <badal.nilawar@intel.com>; Gupta, Varun <varun.gupta@intel.com>;
> > ville.syrjala@linux.intel.com; Shankar, Uma <uma.shankar@intel.com>
> > Subject: Re: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
> >
> > On Tue, Apr 1, 2025 at 10:13=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.o=
rg> wrote:
> > >
> > > On Tue, Apr 01, 2025 at 09:02:16PM +0530, Anshuman Gupta wrote:
> > > > Adding a notifier to notify all PCIe child devices about the block
> > > > main power removal. It is needed because theoretically multiple PCI=
e
> > > > Endpoint devices on same Root Port can request for AUX power and
> > > > _DSM method can return with 80000000h signifies that the hierarchy
> > > > connected via the slot cannot support main power removal when in
> > > > D3Cold.
> > >
> > > I wish the spec used different language here.  "D3cold" *means* "main
> > > power is removed" (PCIe r6.0, sec 5.3.1.4.2), so it doesn't make sens=
e
> > > to say that "the slot cannot support main power removal when in
> > > D3cold".  If a device is in D3cold, its main power has been removed b=
y
> > > definition.
> > >
> > > I suppose the spec is trying to say if the driver has called this _DS=
M
> > > with 80000000h, it means the platform must not remove main power from
> > > the device while the system is in S0?  Is that what you think it
> > > means?
> > >
> > > The 2h return value description says it "indicates that the platform
> > > will not remove main power from the slot while the system is in S0,"
> > > so I guess that must be it.
> > >
> > > In this series, pci_acpi_aux_power_setup() only supplies a 16-bit
> > > aux_pwr_limit value, so the driver cannot *request* that the platform
> > > not remove main power.
> > >
> > > So I guess the only scenario where the _DSM returns 80000000h is when
> > > the platform itself or other devices prevent the removal of main
> > > power.  And the point of the notifier is to tell devices that their
> > > main power will never be removed while the system is in S0.  Is that
> > > right?
> > >
> > > > This may disrupt functionality of other child device.
> > >
> > > What sort of disruption could happen?  I would think that if the _DSM
> > > returns 80000000h, it just means the device will not have main power
> > > removed, so it won't see that power state transition.  The only
> > > "disruption" would be that we're using more power.
> > >
> > > > Let's notify all PCIe devices requested Aux power resource and Let
> > > > PCIe End Point driver handle it in its callback.
> > >
> > > Wrap to fill 75 columns.
> > >
> > > s/Adding/Add/
> > > s/Let's notify/Notify/
> > > s/and Let/and let/
> > > s/End Point/Endpoint/ (several places here and below)
> > >
> > > > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > ---
> > > >  drivers/pci/pci-acpi.c   | 34 +++++++++++++++++++++++++++++++---
> > > >  include/linux/pci-acpi.h | 13 +++++++++++++
> > > >  2 files changed, 44 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c index
> > > > 04149f037664..d1ca1649e6e8 100644
> > > > --- a/drivers/pci/pci-acpi.c
> > > > +++ b/drivers/pci/pci-acpi.c
> > > > @@ -1421,6 +1421,32 @@ static void pci_acpi_optimize_delay(struct
> > pci_dev *pdev,
> > > >       ACPI_FREE(obj);
> > > >  }
> > > >
> > > > +static BLOCKING_NOTIFIER_HEAD(pci_acpi_aux_power_notify_list);
> > > > +
> > > > +/**
> > > > + * pci_acpi_register_aux_power_notifier - Register driver notifier
> > > > + * @nb: notifier block
> > > > + *
> > > > + * This function shall be called by PCIe End Point device requeste=
d
> > > > +the Aux
> > > > + * power resource in order to handle the any scenario gracefully
> > > > +when other
> > > > + * child PCIe devices Aux power request returns with No main power
> > removal.
> > > > + * PCIe devices which register this notifier shall handle No main
> > > > +power
> > > > + * removal scenario accordingly.
> > >
> > > This would actually be called by the *driver* (not by the device).
> >
> Hi Rafael,
> Thanks for review.
> > Apart from this, there seems to be a design issue here because it won't=
 notify
> > every driver that has requested the Aux power, just the ones that have =
also
> > registered notifiers.
> IMHO that is what intended, if any device has functional impact in our ca=
se it is
> INTEL GPU has functional impact if other PCIe device's (on same root port=
) Aux
> Power request returns with 0x2. We need to handle such case to handle it =
gracefully.
> >
> > So this appears to be an opt-in from getting notifications on Aux power
> > request rejection responses to requests from other drivers requesting A=
ux
> > power for the same Root Port, but the changelog of the first patch alre=
ady
> > claimed that the aggregation of requests was not supported.  So if only=
 one
> > driver will be allowed to request the Aux power for the given Root Port=
, why
> > would the notifiers be necessary after all?
> >
> Please guide us, if we remove the above limitation from the commit log.
> Then do we have any design issue with notifier approach ?

Exactly like I said: If you only allow one driver to use the _DSM to
request the Aux power from a given Root Port, it will have all of the
information and does not need to be notified about any changes.  Since
no one else is allowed to use this interface for that Root Port, no
one else will need a notifier either.  For this to work, you need some
mechanism allowing drivers to claim the interface so no one else can
use it (on a per Root Port basis) which is currently missing AFAICS.
I think that this is the option you want to pursue.

OTOH, if you want to allow multiple drivers to use this interface for
the same Root Port, you need to aggregate the requests (as required by
the spec IIUC) in the first place, or else the users can override each
other's request.  In that case you'll likely need a notification
mechanism of some sort to let the requesters know whether or not the
Aux power will be provided, but maybe that can be done through a
callback associated with a request.

The second option is genuinely more complicated because all of the
devices requesting the Aux power from the same Root Port cannot be
suspended independently in that case, so until there is a clear
real-world use case for it, my recommendation would be to go for the
first option.

But the first option means exclusive access and so no need for
notifiers and such.
