Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990AEC02192
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 15:43:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5625B10E690;
	Tue, 28 Jan 2025 15:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.b="SgQsCISD";
	dkim-atps=neutral
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC3E510E690
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 15:43:22 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-e4419a47887so7893361276.0
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 07:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore.com; s=google; t=1738079001; x=1738683801;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
 b=SgQsCISD2ARChUn+FanJHHayZDVewcLyRNdvgsO9EhiJEeiS4IfOnSggU+bOeyaSN4
 Ol+koI+Ru2JOAWwVpqXZlrxJ9aIBW4LayBojP99bdCr+73YZxd9KThHsHprmSrB42JGe
 Uf6XaJikmf3bHqbi51phHGJR6VcJ8KsAV1jWnHQnOTYjeLRqvOvaaLD8JdPHWDJPuEvp
 DbXjza7nkmW5CIQBF3qfm/B0pxVUrHWSqBVbNBJ3Rox3Y+zLxVA7P4OrPa3QvuTs8uvV
 yw+LdjNqhbAg4MstUoKFuE82qI3mza5LoexOQpJP9rL9Ujo9naBBTxqKkGWcVoSUJubB
 Vrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738079001; x=1738683801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4CM+Y34LzyqTPbJa964bMKTZoegb6ZCbeVLJYvxkr2Y=;
 b=ravt21twYcuqmeWn/vRDe1D0Cqsd2031l6DH7QVW5ZtxP3ZsT5ylJy7SRGo6iZeZh2
 5X1y6h7luR/eExlTX1AMcHcflKsg8+/vYGm/W1sLZdBxhDwW6EZrs+hkB7lEWtz26zJ+
 hQXLbmvAqCOrA/02MMIVAv7LYFtb/QuVOHo6wV/BYl/qBmR604kGeTdl3RoHpsForNwp
 f0kSBS2ty+2plt3W9Lzepm+HbXyUSisTqkoRfwbWddnC55XbPVG9aKF0/sTQ0+JATmbr
 AkCMQKfS9WF2g7q8/Hs+8EHgCMF3g3RwwwLCCxL1pgJjuw+SEdMpNBD37pNaqgwu392a
 wecg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIoM6gFX5jj5v2cnj30FFovv1dsN5t9PaR3ZtXD2kzxz8JR1XZws3iCaKIxjTAKQV8NgkXPL/biw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+Q4so3812QQOfRZULowa9APJwOzGSgJSH7nCoqg3XmuQH4FEx
 fihSLs/cneBHsOqAEIJnBx0Qdza9F166uyvd8l3iirjG2Kv5CHsnm0K+S/3d3HWlE+E9KUFxYq7
 S44XV5VjAOZlFWON444doU2BNnodovixxEtjE
X-Gm-Gg: ASbGncuOkDOvs5pTuJ3kAcuR5YAVAjJBN+tt/ZcfXl1wAOOq1v9R5rvwj11XZJlS/ti
 UHInWst6I86LgpZJ9MT7vBzNuMOGymXOT5fAgezVe1Qbq8/iO/ifj+CHY1Be7t5F+XFdBfG4=
X-Google-Smtp-Source: AGHT+IGuLqrmdoXiE8apV7tzhOJZ5Xm1OF/NxWm8Kjkh7RMoG05FR1MdO9WMx2ebniwyt0o5rEC0Jv+xP432BtVJDY0=
X-Received: by 2002:a05:690c:4d02:b0:6ef:6646:b50a with SMTP id
 00721157ae682-6f6eb6b2881mr361409457b3.20.1738079001445; Tue, 28 Jan 2025
 07:43:21 -0800 (PST)
MIME-Version: 1.0
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
 <87jzag9ugx.fsf@intel.com> <Z5epb86xkHQ3BLhp@casper.infradead.org>
 <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
In-Reply-To: <u2fwibsnbfvulxj6adigla6geiafh2vuve4hcyo4vmeytwjl7p@oz6xonrq5225>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 28 Jan 2025 10:43:10 -0500
X-Gm-Features: AWEUYZkHRaUuCTQsu1U9C5jhigmIE9c2_8OmkE_i2Qv7ILXtAaTfDLC5EcLBZNk
Message-ID: <CAHC9VhQnB_bsQaezBfAcA0bE7Zoc99QXrvO1qjpHA-J8+_doYg@mail.gmail.com>
Subject: Re: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
 Ard Biesheuvel <ardb@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
 Song Liu <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Corey Minyard <cminyard@mvista.com>
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

On Tue, Jan 28, 2025 at 6:22=E2=80=AFAM Joel Granados <joel.granados@kernel=
.org> wrote:
> On Mon, Jan 27, 2025 at 03:42:39PM +0000, Matthew Wilcox wrote:
> > On Mon, Jan 27, 2025 at 04:55:58PM +0200, Jani Nikula wrote:
> > > You could have static const within functions too. You get the rodata
> > > protection and function local scope, best of both worlds?
> >
> > timer_active is on the stack, so it can't be static const.
> >
> > Does this really need to be cc'd to such a wide distribution list?
> That is a very good question. I removed 160 people from the original
> e-mail and left the ones that where previously involved with this patch
> and left all the lists for good measure. But it seems I can reduce it
> even more.
>
> How about this: For these treewide efforts I just leave the people that
> are/were involved in the series and add two lists: linux-kernel and
> linux-hardening.
>
> Unless someone screams, I'll try this out on my next treewide.

I'm not screaming about it :) but anything that touches the LSM,
SELinux, or audit code (or matches the regex in MAINTAINERS) I would
prefer to see on the associated mailing list.

--=20
paul-moore.com
