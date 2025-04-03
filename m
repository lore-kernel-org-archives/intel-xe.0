Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 546A1C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 13:49:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E9610E9CA;
	Thu,  3 Apr 2025 13:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eLSTksYr";
	dkim-atps=neutral
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E158A10E9CA
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 13:49:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5311D43DF9
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 13:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC89C4CEE8
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Apr 2025 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743688141;
 bh=lwmB6F4GHG5sQgDjJUpeneBFi7U2fOx9rdT4rpecV18=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eLSTksYraA7EQgSpq+dTxMeHGYfb9rPX/IhLg1LCtxu+wPzGEucXK+Dl4qOOQnzH5
 3RzQI97RD2RuOhPM4w2sURynJj2DZMOw7+ZjVjsLsfueBAW+/3qkFFKEkyCiNU5zCd
 irL3JqQhZjLkzTRcIzVF4djDapQUBBP4/IccgLP33dNT3JUlzdQFdwmsgkhGLUUT/5
 OyrFGoM7J4/52epoEpb3u0S8Iq7r1Rv7HxtljfdFtZUFqZNfUINn/2Vp01qfWFpCAC
 ewP/RI/WjwOwSFNIbwLVAEf1AVPc0aF3Fpu/HQY89jURFFURJ91wMQEuBvu+2aBr5H
 ZdcT+dmXeYT+g==
Received: by mail-ot1-f44.google.com with SMTP id
 46e09a7af769-72b0626c785so745629a34.2
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Apr 2025 06:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWDW0/ij9uLsOPS6J9+qj0W5vG6jjD06a+qNOxnYMmFcInp+9hlRRoJmTzI2CS73sQ84lOsQLMkVA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd4r0EMBmtB3hKJ3hN/19DRFWvFA8qJHIwHIsLOpqUFNb1/Ntv
 BonKLUDGxS+5Qq8H2oJ96PS5wF50i0zDoEuzxyoc9kAIeWFQPVTdLl+DtqL8pR761Ep6izMb1qO
 tibxBYHb7dbniqQj/GNS1GEAtamU=
X-Google-Smtp-Source: AGHT+IGFFBEXI7EF5Fv52eA1QamO5Y6TgbCLD9jR80WmbXowftmeK2ZUO085iRfrMqwSLTACoKYG8TGm+G489KvTm6M=
X-Received: by 2002:a05:6830:2714:b0:727:2f79:ce33 with SMTP id
 46e09a7af769-72c6387fce3mr12958802a34.28.1743688140890; Thu, 03 Apr 2025
 06:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250401153225.96379-4-anshuman.gupta@intel.com>
 <20250401201349.GA1676401@bhelgaas>
 <CY5PR11MB6211BE6482B046D8946E1DA995AE2@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB6211BE6482B046D8946E1DA995AE2@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 3 Apr 2025 15:48:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hSK0mgM3ZOj4q38RHpw+v7XQTRk-bRnmEkxUuxJb=Mww@mail.gmail.com>
X-Gm-Features: AQ5f1Jp_OtvVGdMkrSPKp7NTPWPoCB3U59cyfULUJvD1G9MOwgsmdilsIk_FSJc
Message-ID: <CAJZ5v0hSK0mgM3ZOj4q38RHpw+v7XQTRk-bRnmEkxUuxJb=Mww@mail.gmail.com>
Subject: Re: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>, 
 "lenb@kernel.org" <lenb@kernel.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>, 
 "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, 
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, 
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Gupta,
 Varun" <varun.gupta@intel.com>, 
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Shankar,
 Uma" <uma.shankar@intel.com>, "Nasim, Kam" <kam.nasim@intel.com>
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

On Thu, Apr 3, 2025 at 9:57=E2=80=AFAM Gupta, Anshuman <anshuman.gupta@inte=
l.com> wrote:
>
> > -----Original Message-----
> > From: Bjorn Helgaas <helgaas@kernel.org>
> > Sent: Wednesday, April 2, 2025 1:44 AM
> > To: Gupta, Anshuman <anshuman.gupta@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; linux-acpi@vger.kernel.org; linux-
> > pci@vger.kernel.org; rafael@kernel.org; lenb@kernel.org;
> > bhelgaas@google.com; ilpo.jarvinen@linux.intel.com; De Marchi, Lucas
> > <lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Nil=
awar,
> > Badal <badal.nilawar@intel.com>; Gupta, Varun <varun.gupta@intel.com>;
> > ville.syrjala@linux.intel.com; Shankar, Uma <uma.shankar@intel.com>
> > Subject: Re: [PATCH 03/12] PCI/ACPI: Add aux power grant notifier
> >
> > On Tue, Apr 01, 2025 at 09:02:16PM +0530, Anshuman Gupta wrote:
> > > Adding a notifier to notify all PCIe child devices about the block
> > > main power removal. It is needed because theoretically multiple PCIe
> > > Endpoint devices on same Root Port can request for AUX power and _DSM
> > > method can return with 80000000h signifies that the hierarchy
> > > connected via the slot cannot support main power removal when in
> > > D3Cold.
> >
> > I wish the spec used different language here.  "D3cold" *means* "main p=
ower
> > is removed" (PCIe r6.0, sec 5.3.1.4.2), so it doesn't make sense to say=
 that
> > "the slot cannot support main power removal when in D3cold".  If a devi=
ce is
> > in D3cold, its main power has been removed by definition.
> >
> > I suppose the spec is trying to say if the driver has called this _DSM =
with
> > 80000000h, it means the platform must not remove main power from the
> > device while the system is in S0?  Is that what you think it means?
> Thanks for review.
> what I understand here, S0 term essentially means here PCIe Runtime PM or=
 s2idle
> (both refers system is S0 state). AFAIU during both Runtime PM and s2ilde=
 path
> Root Port can transition  to D3Cold if it support _PR3.
> I observed Root Port either have D0 or D3Cold state.
> /sys/bus/pci0/devices/$root_port_bdf/firmware_node/real_power_state
>
> Driver can disable the D3cold by pci_d3cold_disable(), so I wonder there =
is no use
> case driver calling _DSM 0xa with 80000000h.
> PCIe specs shall be simplified by removal of value 80000000h from _DSM 0x=
a Arg.
> >
> > The 2h return value description says it "indicates that the platform wi=
ll not
> > remove main power from the slot while the system is in S0,"
> > so I guess that must be it.
> >
> > In this series, pci_acpi_aux_power_setup() only supplies a 16-bit
> > aux_pwr_limit value, so the driver cannot *request* that the platform n=
ot
> > remove main power.
> Yeah but that value Xe driver received from GPU firmware.
> >
> > So I guess the only scenario where the _DSM returns 80000000h is when t=
he
> > platform itself or other devices prevent the removal of main power.  An=
d the
> > point of the notifier is to tell devices that their main power will nev=
er be
> > removed while the system is in S0.  Is that right?
> Yes the notifier will safeguard against the use case if some other PCIe d=
evice
> calls _DSM 0xa with Arg3 Value of 80000000h or its request return with 0x=
2h.
> >
> > > This may disrupt functionality of other child device.
> >
> > What sort of disruption could happen?  I would think that if the _DSM r=
eturns
> > 80000000h, it just means the device will not have main power removed, s=
o it
> > won't see that power state transition.  The only "disruption" would be =
that
> > we're using more power.
>
> Let's say during Xe Driver initialization BIOS firmware grants the Xe dri=
ver
> Aux power request successfully.

Slightly OT, but if you do it at init time, you also need to do it
after hibernation because the original ini-time request may not
survive it.

> Xe driver will prepare to transition D3Cold state with VRAM Self Refresh.
> VRAM Self Refresh relies on vram shall derive power from Aux power.
> But later at any point if some other PCIe device under same root port
> Calls _DSM either with 080000000h or _DSM returns with 02h, will
> Block the main power removal.

As I said in the previous message, this cannot happen if only one
driver at a time is allowed to request the Aux power on a given Root
Port.

If multiple drivers are allowed to do it, aggregation of requests is necess=
ary.

> But Xe driver is unaware of it can still
> program the VRAM Self Refresh and that make VRAM to derive power
> from Aux and that will disrupt the GPU VRAM as there is no switch to Aux

This is a rather unfortunate and counter-intuitive design decision
IMV.  If the main power is still there, I'd expect the VRAM Self
Refresh to use it instead of the Aux power.
