Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238FCC3600C
	for <intel-xe@archiver.kernel.org>; Tue,  8 Apr 2025 13:02:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FD210E227;
	Tue,  8 Apr 2025 13:02:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bx/u3rSO";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDA10E227
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 13:02:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6E2E25C0269
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 12:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D40C4AF0B
 for <intel-xe@lists.freedesktop.org>; Tue,  8 Apr 2025 13:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744117323;
 bh=8GaiwcHWfRvoK90OTJYH2v6UniBDmHmB840KjBxhX9I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bx/u3rSOYgMC7jIRf7LSFxGKUAE49p5zlPuOAGFbp6ba/lgcNkjmUfK+dNiDlZiCA
 N6gpP7SyrT/+mGmXKbmseT05/H9DB4N5ZkjNBWR4m5mXbrJVUqvGw68IyeswxfbFid
 mjzHPiydS/R95kzWi+Agq2Wnft8UvxJjXPjJl1zT6qublMQ+uHN+dK5vBEnNnJiRv3
 fenZLDwbSIN5ae9T7sGBH0aiFAukS00fmNQx8TTEDJyJbHTpVv5l62DoiZC5NnjoWO
 oLZxCdLlf67Dqc2zY5n5Qzs2YSYFmqeCGxiIKeY1UWewFy5Ok28pLOI5ERzE8ZLM01
 1CNlXj/8qPujA==
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2cca475546fso2150267fac.1
 for <intel-xe@lists.freedesktop.org>; Tue, 08 Apr 2025 06:02:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCU+e/wuGs53pk3rJBCdL0rCdOgHbNwWzS+6m7Bq4sQHvXpmrO8aVkITk/z5mspSM/vrMVpLq0Y6gA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Zjdrl83DzNv6p+/Toq+jQXQ/9VHEEKgSn8qRGijSd5jW7gUB
 afjF8AJXJsUCEdvkwoK0858IU/ysTBPzSbymwncEZCffo8PKijSmV7W9yIKtRl9cp/qporztIUh
 t/DRtmISg9C+/KBdiWAXKbEUecT4=
X-Google-Smtp-Source: AGHT+IFjkp5ajfGr7EdSG92rcHQnSQqd9flrT9xcE+UImXVlpGkb6J2F1cd6PRh1PbU8p/vO/e6sJj2DBsJQNGW87m4=
X-Received: by 2002:a05:6870:b520:b0:2c2:3da4:6389 with SMTP id
 586e51a60fabf-2cc9e659fb9mr9436751fac.23.1744117322463; Tue, 08 Apr 2025
 06:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250401153225.96379-4-anshuman.gupta@intel.com>
 <20250401201349.GA1676401@bhelgaas>
 <CAJZ5v0irNFX6dFrStinNXamrhP143=yjjfx4iK0pY+-dTEkviw@mail.gmail.com>
 <CY5PR11MB6211021207DE5ECAA43BF26595AE2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <CAJZ5v0inCpM2UhzZ_pD52S0Hf8aaEMa40CyE-dwzVmO1n3PMwA@mail.gmail.com>
 <MN0PR11MB6207F55ABAA2187609BB872695AE2@MN0PR11MB6207.namprd11.prod.outlook.com>
 <CAJZ5v0gKBYa_N-dA1JwF0yVbc6XSmQEy1LpVytDM7uc9kbZ8fA@mail.gmail.com>
 <CY5PR11MB621174B9AF1B5C6EA4FE27F095A92@CY5PR11MB6211.namprd11.prod.outlook.com>
In-Reply-To: <CY5PR11MB621174B9AF1B5C6EA4FE27F095A92@CY5PR11MB6211.namprd11.prod.outlook.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 8 Apr 2025 15:01:51 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hp-bYn8JFiBnTgrSdJWHm1jgCjcvbVZkzeOaySjvAQQg@mail.gmail.com>
X-Gm-Features: ATxdqUHqV0sOwFWqSUOVlfsgC6-e9g7HrCV9B3ZHAiWPRSwaiLow0_l4zBDiy30
Message-ID: <CAJZ5v0hp-bYn8JFiBnTgrSdJWHm1jgCjcvbVZkzeOaySjvAQQg@mail.gmail.com>
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

On Fri, Apr 4, 2025 at 2:53=E2=80=AFPM Gupta, Anshuman <anshuman.gupta@inte=
l.com> wrote:
>
> /snip
> > > >
> > > > Exactly like I said: If you only allow one driver to use the _DSM t=
o
> > > > request the Aux power from a given Root Port, it will have all of
> > > > the information and does not need to be notified about any changes.
> > > > Since no one else is allowed to use this interface for that Root
> > > > Port, no one else will need a notifier either.  For this to work,
> > > > you need some mechanism allowing drivers to claim the interface so
> > > > no one else can use it (on a per Root Port basis) which is currentl=
y missing
> > AFAICS.
> > >
> > > IMHO such kind of mechanism will require to add Root Port specific
> > > data structure to claim the interface. But real problem is the criter=
ia  to claim
> > the interface.
> > > Is first PCIe Non-Bridge Endpoint Function 0 driver can be criteria
> > > to claim the Interface. Or first come and first serve approach ?
> >
> > IMV, the first PCIe Non-Bridge Endpoint Function 0 driver approach woul=
d be
> > sort of fragile and cumbersome to enforce.
> >
> > First come, first serve is much simpler and should be sufficient for no=
w AFAICS.
>
> We are enabling VRSR only for default vga boot device.
> As it needed only GPU driving the display for better user experience.
> Can we use same logic vga_default_device() to claim the interface under r=
oot port.
> That will simplify the criteria to claim the interface.

Basically, you need to prevent somebody else from running
DSM_PCI_D3COLD_AUX_POWER_LIMIT concurrently for the given Root Port
and store the information that it has been run already.

Personally, I'd add aux_power_limit to struct acpi_device_power and
I'd use a static mutex in pci_acpi_request_d3cold_aux_power() along
the lines of:

1. Acquire the mutex.
2. If power.aux_power_limit is set for the ACPI companion of pci_dev,
release the mutex and bail out.
3. Evaluate DSM_PCI_D3COLD_AUX_POWER_LIMIT and if it fails, release
the mutex and bail out.
4. Set power.aux_power_limit for the ACPI companion of pci_dev to the
requested value.
5. Release the mutex.

Of course, this would only allow it to be set once per kernel boot, so
in order to handle hibernation properly, the same Aux power limit
would need to be requested again automatically on Root Port restore.
