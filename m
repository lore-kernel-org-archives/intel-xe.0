Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F397DC28B20
	for <intel-xe@archiver.kernel.org>; Wed,  2 Apr 2025 11:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA77510E0F3;
	Wed,  2 Apr 2025 11:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nT7o9CTE";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310F010E0F3
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 11:24:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3122761163
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 11:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66E3CC4CEED
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Apr 2025 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743593049;
 bh=EPzhky8croBlcg3eXw8ESbq4G0rLFB2FIRqwovbykyQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nT7o9CTEBu3Ik6VwdtBopclTuAxO298exnHL6+jFEuTzhJTvH0bDo76mTOHnKZpMx
 WWQsVsporobcTVHT1pRGtxHnqyomX2UaPnk8V1tyTxCdg1ayYNPZQa+JCgYfqw8aIs
 c1ffxYaIz5l5yl18dxyBORcOCB6B0XeTCsLCYmtjSYW62IA6EuUnqGSIGGOWxjhnq6
 B4dmmUiP1EmaIqwow/sYNT/HoLpQs/F/Nzf2zCNHFyhZHM2F37vOgY7nbE9+wpPJdX
 c1/15kWCz8nmm+5Nvgs9Zm0K9Pqv0uUsEbujmNnqu3ky/ewT0/9EdCS9KRCeB5z7PT
 aQRBoifZsNSNA==
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2c7e5fb8c38so4334943fac.1
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Apr 2025 04:24:09 -0700 (PDT)
X-Gm-Message-State: AOJu0YzHGXWa65OIWFYMRLUV0/obcaCDPkWjWWBg4G/zoumcGhcH7n5k
 DzKAVrH3A0cZcTan3MTiSMDX07+mw6AnBQOaOUMmtmo6N4yGt4tJI2KHC29lsKlL9CJEhyAq165
 HkhtkGl9weX/Q6S7opH2kO393zaA=
X-Google-Smtp-Source: AGHT+IGSQqFvL1910IXuvRtcou/I3UYbe7Y4dIVCIemMKHGWcy8OEIN0tGE8/B6eMTj/nIzTwWHfCa0qWM4/ll5bAaA=
X-Received: by 2002:a05:6870:d14f:b0:29e:3921:b1ea with SMTP id
 586e51a60fabf-2cc60d5c606mr1151048fac.30.1743593048601; Wed, 02 Apr 2025
 04:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250401153225.96379-4-anshuman.gupta@intel.com>
 <20250401201349.GA1676401@bhelgaas>
In-Reply-To: <20250401201349.GA1676401@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 2 Apr 2025 13:23:56 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0irNFX6dFrStinNXamrhP143=yjjfx4iK0pY+-dTEkviw@mail.gmail.com>
X-Gm-Features: AQ5f1JpD5yN41W6zicEv53RCDwYurpfQc2ba6-PISKF2FZ8VNX9mAf1AbD1wLQ0
Message-ID: <CAJZ5v0irNFX6dFrStinNXamrhP143=yjjfx4iK0pY+-dTEkviw@mail.gmail.com>
Subject: Re: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
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

On Tue, Apr 1, 2025 at 10:13=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Tue, Apr 01, 2025 at 09:02:16PM +0530, Anshuman Gupta wrote:
> > Adding a notifier to notify all PCIe child devices about the
> > block main power removal. It is needed because theoretically
> > multiple PCIe Endpoint devices on same Root Port
> > can request for AUX power and _DSM method can return with
> > 80000000h signifies that the hierarchy connected via
> > the slot cannot support main power removal when in D3Cold.
>
> I wish the spec used different language here.  "D3cold" *means* "main
> power is removed" (PCIe r6.0, sec 5.3.1.4.2), so it doesn't make sense
> to say that "the slot cannot support main power removal when in
> D3cold".  If a device is in D3cold, its main power has been removed by
> definition.
>
> I suppose the spec is trying to say if the driver has called this _DSM
> with 80000000h, it means the platform must not remove main power from
> the device while the system is in S0?  Is that what you think it
> means?
>
> The 2h return value description says it "indicates that the platform
> will not remove main power from the slot while the system is in S0,"
> so I guess that must be it.
>
> In this series, pci_acpi_aux_power_setup() only supplies a 16-bit
> aux_pwr_limit value, so the driver cannot *request* that the platform
> not remove main power.
>
> So I guess the only scenario where the _DSM returns 80000000h is when
> the platform itself or other devices prevent the removal of main
> power.  And the point of the notifier is to tell devices that their
> main power will never be removed while the system is in S0.  Is that
> right?
>
> > This may disrupt functionality of other child device.
>
> What sort of disruption could happen?  I would think that if the _DSM
> returns 80000000h, it just means the device will not have main power
> removed, so it won't see that power state transition.  The only
> "disruption" would be that we're using more power.
>
> > Let's notify all PCIe devices requested Aux power resource
> > and Let PCIe End Point driver handle it in its callback.
>
> Wrap to fill 75 columns.
>
> s/Adding/Add/
> s/Let's notify/Notify/
> s/and Let/and let/
> s/End Point/Endpoint/ (several places here and below)
>
> > Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> > ---
> >  drivers/pci/pci-acpi.c   | 34 +++++++++++++++++++++++++++++++---
> >  include/linux/pci-acpi.h | 13 +++++++++++++
> >  2 files changed, 44 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pci/pci-acpi.c b/drivers/pci/pci-acpi.c
> > index 04149f037664..d1ca1649e6e8 100644
> > --- a/drivers/pci/pci-acpi.c
> > +++ b/drivers/pci/pci-acpi.c
> > @@ -1421,6 +1421,32 @@ static void pci_acpi_optimize_delay(struct pci_d=
ev *pdev,
> >       ACPI_FREE(obj);
> >  }
> >
> > +static BLOCKING_NOTIFIER_HEAD(pci_acpi_aux_power_notify_list);
> > +
> > +/**
> > + * pci_acpi_register_aux_power_notifier - Register driver notifier
> > + * @nb: notifier block
> > + *
> > + * This function shall be called by PCIe End Point device requested th=
e Aux
> > + * power resource in order to handle the any scenario gracefully when =
other
> > + * child PCIe devices Aux power request returns with No main power rem=
oval.
> > + * PCIe devices which register this notifier shall handle No main powe=
r
> > + * removal scenario accordingly.
>
> This would actually be called by the *driver* (not by the device).

Apart from this, there seems to be a design issue here because it
won't notify every driver that has requested the Aux power, just the
ones that have also registered notifiers.

So this appears to be an opt-in from getting notifications on Aux
power request rejection responses to requests from other drivers
requesting Aux power for the same Root Port, but the changelog of the
first patch already claimed that the aggregation of requests was not
supported.  So if only one driver will be allowed to request the Aux
power for the given Root Port, why would the notifiers be necessary
after all?
