Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A935C36002
	for <intel-xe@archiver.kernel.org>; Wed,  9 Apr 2025 12:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4E8110E878;
	Wed,  9 Apr 2025 12:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hrbhA0jD";
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8674A10E878
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 12:30:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 01F815C0654
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 12:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2458C4CEE9
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Apr 2025 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744201843;
 bh=7iWC9nEYPCpToQA6iXtDC2J6qxfgzfIxDLa2qvD02YI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hrbhA0jDXRUasOkh9ibVwIRncyKtPVO//uAP3LWCeceCSvt7PmKYeOAKhkV1n9Gri
 cYuZYfrWCIy/9KMUT9ZV44thAD0DKfCKHVzsc7GtypWHkGXV+DsmFrOsrc5YQBca5n
 ZMVqczGUkIWYaacL70ZJbeZ+8XB8NEHQQx7oOISRsHEpH8RojybvquD+cAf+oKid4q
 ArOZbTQM+Wr8WPT9IEAKXuVKbwdnaxgcdtTOQHEQ9QSiXNkyW4An561x8ZfXDtKzjp
 HK0ApmhR2yJO2QdOxasUnmLEKpsrj/bvYB7yL2CeZaKUSuCt36pdbPDz065wmwzxo0
 NgjnsgOpb+XbQ==
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2d09d495c6cso99741fac.3
 for <intel-xe@lists.freedesktop.org>; Wed, 09 Apr 2025 05:30:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVOCqEhptXaQj7WlLKB2Pk81k2ZHpakHGTAjcdVgz/NX955AbiVmRHuyjMlqyHv9NlFOTxAbOfjBg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZ7g5UOngsPWmTAEg/0PuyjSvEfN0j+xHXLiQm9U4ME4d6/mMt
 PUoMihu4SflPAGiGGfwPXiKXNVv5AQphz7R4EQnAyDpWwO20CO1cRRLYyF8LewvkWyND9VoK6n+
 LknNCt+diHiC3Xit0wKCmEtE2GZs=
X-Google-Smtp-Source: AGHT+IHcigN37i8FsTsXewh3/4UfKT/Xs0sUYY7pjtrGMPdG3td+ZNaYaKAPU1EGyXQinmIM6G2uSQkkt+3HipdOmrk=
X-Received: by 2002:a05:6870:ab0d:b0:2c2:2f08:5e5b with SMTP id
 586e51a60fabf-2d0917bb20cmr1122200fac.13.1744201842771; Wed, 09 Apr 2025
 05:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAJZ5v0hQjtTCu1wXgKvBWBBegbj-VD+Z0yBspt1uFes8Xun7Cw@mail.gmail.com>
 <20250408204832.GA64565@bhelgaas>
In-Reply-To: <20250408204832.GA64565@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 9 Apr 2025 14:30:31 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hK9m6-F5V+VWqsVPfr+WGLruHkP7ZvQsmwp21W9PHs_A@mail.gmail.com>
X-Gm-Features: ATxdqUGKD2JHDyrAo8RFry5xmYLdgmdP89xHc8xnZ975hSW-tjI79tXKHQvfHdY
Message-ID: <CAJZ5v0hK9m6-F5V+VWqsVPfr+WGLruHkP7ZvQsmwp21W9PHs_A@mail.gmail.com>
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

On Tue, Apr 8, 2025 at 10:48=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Wed, Apr 02, 2025 at 09:36:01PM +0200, Rafael J. Wysocki wrote:
> > On Wed, Apr 2, 2025 at 8:48=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.or=
g> wrote:
>
> > > I don't *expect* rev 5 to be different.  But as a user of it, why
> > > would I change working, tested code that is not broken?
> > >
> > > The PCI DPC function 0xc is an example where rev 5 (per ECN) and rev =
6
> > > (per r3.3) are not compatible.
> > >
> > > If the OS implemented rev 5, then learns via function 0 that function
> > > 0xc is also supported at rev 6, and starts using the same OS code wit=
h
> > > rev 6, the OS is broken.
> >
> > Yes, in this case the backward compatibility language in the _DSM
> > definition is obviously not followed.
>
> Rev 5 in the ECN isn't compatible with rev 6 in the PCI FW r3.3 spec,
> so it doesn't follow the ACPI compatibility requirement.  And this is
> documented in PCI FW, which says "Fn 0xC was added with rev 5 (see ECN
> for rev 5 details); here is how rev 6 works."
>
> An OS implemented to the ECN doesn't know that rev 6 is different from
> rev 5; it assumes they're the same because ACPI says we can assume
> that, and PCI FW r3.3 even says the OS should use the same rev for all
> functions.

OK (and this is important because PCI FW r3.3 is the spec defining the
interface)

> If OS adds support for rev 6 of a some other function, it is supposed to =
use
> rev 6 of Fn 0xC, which doesn't work as the OS expects.

IMV with respect to _DSM, the spec that has defined the interface (PCI
FW r3.3) takes precedence over the ACPI spec regardless of what the
latter is saying.  In this case ACPI provides a framework the
interface can be based on, but the actual interface is not defined by
it.

Also, I think that the OS should use rev 6 if it is supported by the
firmware (for all functions) and it should literally follow the
definition of rev 6.

If rev 6 is not supported (or some functions needed by the OS are not
implemented by the firmware), it should fall back to rev 5 and in this
case it should literally follow the definition of rev 5.

And so on.

> I guess one could argue that "OS didn't add rev 6 support for anything
> until PCI FW r3.3 added a function at rev 6, r3.3 did mention the
> difference between Fn 0xC rev 5 and 6, and OS should have looked at
> all the already-implemented unrelated functions for possible changes
> between rev 5 and rev 6."

Yes, it should.

> I think that causes unnecessary changes in unrelated code.  The OS can
> avoid the problem by *always* using Fn 0xC rev 5, regardless of what
> rev it uses for other functions.

What if the functions on the firmware side depend on each other
interfally and the firmware gets confused if revisions are mixed up on
the OS side?

Since PCI FW r3.3 says that the OS should use the same rev for all
functions, that's what it should do because the firmware may
reasonably assume that it will.

> Of course, the OS can include support for multiple revs, e.g., it
> could add support for Fn 0xC rev 6 and use that when available.  And
> it could retain support for Fn 0xC rev 5 and use that if rev 6 isn't
> available.

That's what I mean basically.

In practice, the OS needs to assume that the firmware may not
implement a certain rev and so it needs to support other revisions
anyway.
