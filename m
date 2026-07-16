Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B56C4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 09:16:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94EF610F23A;
	Thu, 16 Jul 2026 09:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Jrf8g/1d";
	dkim-atps=neutral
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C61110F246
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 09:16:09 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-84830c774a0so2411241b3a.1
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 02:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193368; cv=none;
 d=google.com; s=arc-20260327;
 b=bE+qA6Cpq70ObsR46CF0mNN8o17vsKQtKiDUvTS1G/J/1lbQaFRzYgU4pjT5t44RmS
 +N0XFecgaYrnXodr4nucCCs8r5ycmhyBXaC80SW61X+MA19WVY9tejQ56ZsRGFYh7zFD
 UCCEFrYTZ0cfD6AJzoQJfelbCj9NyGw3OlTCtA+XOQhfGwg0PwpRzREe9ELF7pEQ+lcb
 S3AK+Hg1R7+OKQBrHXF9i072k66JBrwMf99vgLloR/lD3z2Q0axWf5R4Ml87eq+xh0CT
 3kds920atAeJyOTO81EVUciYFss7NcJhuv4SCBKE1+rIjEasMoBODU9uuw5VzmFtz/Ni
 78+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=N3Aj4n5hxVSal6GClm3WYMDJDzMMqX/C9M6A6jZSm1c=;
 fh=3UteJQphV1rgX0xUAPjBv/VI2u7eI69Rl7yp9VXLKIQ=;
 b=I7xZQd+0VySpVpgH0lFOXHbFs7aDnYb/I87NPWI8OkEZ8Nhf0LBbw0Hh+hERwJB37+
 rPKyunktqP6vQN8+5YmkqWUTuYuS5DStrCDV9rrR4EFBQM0wAQdqQubAFyJKPbdzMOF1
 +CEzKYgIQF+9toEnmYU/AWpN7m17YTGsirWsaSOXY7L58jHr09hd/xgyeKYvjgnhXmeY
 7644YgD1oKWa8NEWIh+bFlkhcmK7VbztZtO+COMen09/bc0PtlCAfdljrp07Ilw5FxQ6
 uhGBhL3E/UnJrmGy820GCuFZPrqh1LX28GWkZp0BOFizAzuyIFNWCdJcUw9yTkuElfTx
 aeWg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1784193368; x=1784798168;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=N3Aj4n5hxVSal6GClm3WYMDJDzMMqX/C9M6A6jZSm1c=;
 b=Jrf8g/1dqGRepjv2AzT0NB+gF+KWx/5MPSCaYUwMuETfV6+XVaB3fOweixsWH+R7fQ
 vM5jmiqtvK7D7qc71irPYf9ubTmGwbbsHGLArPcoQKp4tE5++gI9C7lxe4OTi8HnYTAR
 ld9VQ20YQ0BotJx3pfNR9yZUv+fpd9TXZnu8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784193368; x=1784798168;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=N3Aj4n5hxVSal6GClm3WYMDJDzMMqX/C9M6A6jZSm1c=;
 b=NH+uqTH7S4xYSfv6A/A6XMG1LS8bxicfCuEQ7KWrI3GfWs47/Yxr/kcb7IGUZLk1j0
 0qyyr+iD1TArHDxx3rK8U4SQt9FoCbnCvkSAYCyEAF+sYhB32C2tMJaDLTg0HI6JtPyE
 xtu8k9alXfCQrCJvjnaK5ZDwWYCWgaJv68uxZ5XevqarCS62fgnwZaxMXqYbH6VOfV16
 XErVX7Fhxe9eTXSopIT10m7QhaQfJiSrTWHrBXhpfzZD3Mki6HvgYlHc1W3xl6uFrTpC
 qG5ze/5IcmOpvEDslx5ABebqp68QbyjsMMgZTgSeE8smudZZSdPfT7E0nlQRqsGpmniD
 JMxw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqw7XucggGtgjtO3H6ELyZh0SHgCGoBIV3rImeBGLfVPlSMZrYxBLH/qVuJ3W3zoE90BCfDNCt8kQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOnJ6DxSSViU8CIbduEq5HHPKfmd8bFzJG0K2bjGz6RJjiW25l
 2fjjkgPWKL/S7gPILXPfp2+Fzy255N34HZOEvPKtP+6/fWMt06wW5syygLHJ04gxWImoEoH6d6F
 y9twg/d70jJXfXWg89GPZUVJTYdvrzl4rJDVQ3YFP
X-Gm-Gg: AfdE7cm+ahFb1y/HaV/LMuzOEmG+bk96XkvAvLIFXvp9JjfVwiQxs8ZLtuZoiINvUwG
 CZZcIRtXrQZ8LcGswd3CvItSWBTqElpDpKmyH4D+bo6Jkl8byW0OVgHRJbtc7lqb+808ijNkTeM
 3HH/8rjieb9ryF9i+9SIfnLFLDhdZSrmH3MNEwJpfECC6VGuJW0TdR/mOwrv8lA66YsAY0Oy8Pv
 8rWsGyPvP7M0yHS31Otfcg+6X5vLWmfbN6yaKhm//oyhGcsA1FjuZwsydTqiTD1SoOraOZysnQ6
 E+bUHtasJuZ4qqSh
X-Received: by 2002:a05:6a00:a229:b0:848:53c7:b927 with SMTP id
 d2e1a72fcca58-848898824c6mr20424018b3a.76.1784193368555; Thu, 16 Jul 2026
 02:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260707141736.1635698-1-akuchynski@chromium.org>
 <22064276-6c56-411a-9f20-6917ceeb865f@intel.com>
In-Reply-To: <22064276-6c56-411a-9f20-6917ceeb865f@intel.com>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Thu, 16 Jul 2026 11:15:55 +0200
X-Gm-Features: AUfX_mzp-_dtH-UipridEtAFINWR6sMaF9la0gNmY9FR86uyrNcL32L4dUU3zN4
Message-ID: <CAMMMRMduSMniMrixGuq=m=00nUvzXQpySE86TpmvfNQtAChB=w@mail.gmail.com>
Subject: Re: REGRESSION: [PATCH] usb: typec: ucsi: Fix race condition and
 ordering in port unregistration
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jameson Thies <jthies@google.com>, 
 Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Pooja Katiyar <pooja.katiyar@intel.com>, 
 Johan Hovold <johan@kernel.org>, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>,
 Linyu Yuan <quic_linyyuan@quicinc.com>, 
 Jack Pham <quic_jackp@quicinc.com>, stable@vger.kernel.org
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

On Thu, Jul 16, 2026 at 10:28=E2=80=AFAM Borah, Chaitanya Kumar
<chaitanya.kumar.borah@intel.com> wrote:
>
> Hello Andrei,
>
> On 7/7/2026 7:47 PM, Andrei Kuchynski wrote:
> > A synchronization issue exists during port unregistration where pending
> > partner work items can race against workqueue destruction, leading to
> > use-after-free conditions:
> >
> >    cros_ec_ucsi cros_ec_ucsi.3.auto: error -ETIMEDOUT: PPM init failed
> >    BUG: kernel NULL pointer dereference, address: 0000000000000000
> >    RIP: 0010:__queue_work+0x83/0x4a0
> >    Call Trace:
> >      <IRQ>
> >      __cfi_delayed_work_timer_fn+0x10/0x10
> >      run_timer_softirq+0x3b6/0xbd0
> >      sched_clock_cpu+0xc/0x110
> >      irq_exit_rcu+0x18d/0x330
> >      fred_sysvec_apic_timer_interrupt+0x5e/0x80
> >
> > Fix this by ensuring strict ordering and proper serialization during
> > teardown:
> >
> > 1. Move ucsi_unregister_partner() to the beginning of the teardown
> > sequence and protect it under the connector mutex lock.
> > 2. Ensure all pending partner tasks are explicitly flushed and finished
> > before the workqueue is destroyed.
> > 3. Switch from mod_delayed_work() to a cancel_delayed_work() and
> > queue_delayed_work() sequence. This guarantees that items currently mar=
ked
> > as pending won't be scheduled an additional time, preventing a double
> > release of resources which leads to the following crash:
> >
> >    Oops: general protection fault, probably for non-canonical address
> >      0xdead000000000122: 0000 [#1] SMP NOPTI
> >    Workqueue: cros_ec_ucsi.3.auto-con2 ucsi_poll_worker
> >    RIP: 0010:ucsi_poll_worker+0x65/0x1e0
> >    Call Trace:
> >    <TASK>
> >      process_scheduled_works+0x218/0x6d0
> >      worker_thread+0x188/0x3f0
> >      __cfi_worker_thread+0x10/0x10
> >      kthread+0x226/0x2a0
> >
> > To ensure these rules are applied identically across both the normal
> > teardown and the ucsi_init() error paths, consolidate the cleanup logic
> > into a new helper, ucsi_unregister_port().
>
>
> This seems to be causing regression in our linux-next CI. [1]
>
> <6>[   18.008557] ------------[ cut here ]------------
> <4>[   18.013166] DEBUG_LOCKS_WARN_ON(1)
> <4>[   18.013167] WARNING: kernel/locking/lockdep.c:238 at
> __lock_acquire+0xa59/0x2750, CPU#1: kworker/u89:1/172
> ...
> <4>[   18.159950] Hardware name: Intel Corporation Meteor Lake Client
> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS
> MTLPFWI1.R00.3471.D89.2401091901 01/09/2024
> <4>[   18.173125] Workqueue: events_dfl_long ucsi_init_work [typec_ucsi]
> <4>[   18.179257] RIP: 0010:__lock_acquire+0xa60/0x2750
> <4>[   18.183927] Code: 44 8b 5d a8 85 c0 0f 84 98 fd ff ff 44 8b 35 07
> 0b 72 02 45 85 f6 0f 85 88 fd ff ff 48 8d 3d 27 25 73 02 48 c7 c6 1b 51
> 27 83 <67> 48 0f b9 3a 31 c0 44 8b 5d a8 44 8b 4d b0 e9 c6 f7 ff ff 31 d2
> ...
> <4>[   18.263886] PKRU: 55555554
> <4>[   18.266583] Call Trace:
> <4>[   18.269014]  <TASK>
> <4>[   18.271110]  ? mark_held_locks+0x46/0x90
> <4>[   18.275007]  lock_acquire+0xd9/0x2e0
> <4>[   18.278562]  ? ucsi_unregister_port+0x36/0x140 [typec_ucsi]
> <4>[   18.284096]  __mutex_lock+0xb2/0x1020
> <4>[   18.287735]  ? ucsi_unregister_port+0x36/0x140 [typec_ucsi]
> <4>[   18.293265]  ? ucsi_unregister_port+0x36/0x140 [typec_ucsi]
> <4>[   18.298797]  ? synchronize_rcu_expedited+0x2b2/0x300
> <4>[   18.303724]  ? __pfx_autoremove_wake_function+0x10/0x10
> <4>[   18.308912]  mutex_lock_nested+0x1b/0x30
> <4>[   18.312806]  ? mutex_lock_nested+0x1b/0x30
> <4>[   18.316878]  ucsi_unregister_port+0x36/0x140 [typec_ucsi]
> <4>[   18.322238]  ucsi_init_work+0x66d/0xc10 [typec_ucsi]
> <4>[   18.327167]  process_one_work+0x2ad/0x8b0
> <4>[   18.331158]  worker_thread+0x200/0x3f0
> <4>[   18.334886]  ? __pfx_worker_thread+0x10/0x10
> <4>[   18.339128]  kthread+0x10d/0x150
> <4>[   18.342339]  ? __pfx_kthread+0x10/0x10
> <4>[   18.346067]  ret_from_fork+0x3bd/0x470
> <4>[   18.349795]  ? __pfx_kthread+0x10/0x10
> <4>[   18.353522]  ret_from_fork_asm+0x1a/0x30
> <4>[   18.357420]  </TASK>
>
> Detailed log can be seen found in [2]
>
> We confirmed that reverting the patch solves the issue.
>
> Could you please check why the patch causes this regression and provide
> a fix if necessary?
>
> Regards
> Chaitanya
>
> [1] https://intel-gfx-ci.01.org/tree/linux-next/combined-alt.html?
> [2]
> https://intel-gfx-ci.01.org/tree/linux-next/next-20260714/bat-mtlp-9/boot=
0.txt
>
> -- Bisect Logs --
>
> git bisect start
> # status: waiting for both good and bad commits
> # good: [5f1b513690edf51727e6928b97705b6437f9a98e] Merge remote-tracking
> branch 'spi/for-7.3' into spi-next
> git bisect good 5f1b513690edf51727e6928b97705b6437f9a98e
> # status: waiting for bad commit, 1 good commit known
> # bad: [49362394dad7df66c274c867a271394c10ca2bb8] Add linux-next
> specific files for 20260713
> git bisect bad 49362394dad7df66c274c867a271394c10ca2bb8
> # bad: [dffddeb046466ed57038295bde28b42b7506a12b] Merge branch
> 'nand/next' of https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.=
git
> git bisect bad dffddeb046466ed57038295bde28b42b7506a12b
> # bad: [d154d0766bf3fe830e1bf98fb2d8648294a4a8da] Merge branch
> 'for-next' of
> https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
> git bisect bad d154d0766bf3fe830e1bf98fb2d8648294a4a8da
> # bad: [671b0fd929bec9ebf863cb376baf9b9d1226a510] Merge branch 'master'
> of https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
> git bisect bad 671b0fd929bec9ebf863cb376baf9b9d1226a510
> # good: [f4fb100039e96211609dfc44fb24b9e4a8a0f2f9] Merge tag
> 's390-7.2-4' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux
> git bisect good f4fb100039e96211609dfc44fb24b9e4a8a0f2f9
> # good: [c296d513e034df93ddb230ad1c7a118d6b58750c] Merge branch
> 'arm/fixes' of https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.gi=
t
> git bisect good c296d513e034df93ddb230ad1c7a118d6b58750c
> # good: [de53c0a584f08f31eb957f8c849a59fb33b27fa8] Merge branch 'for-rc'
> of https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git
> git bisect good de53c0a584f08f31eb957f8c849a59fb33b27fa8
> # bad: [a6969de5a038bc08a948ada52bd7199a8dfa6cec] Merge branch
> 'usb-linus' of
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> git bisect bad a6969de5a038bc08a948ada52bd7199a8dfa6cec
> # good: [15eab2dd63a97587405ab6bfaad9728d5b35b5fe] Merge tag
> 'asoc-fix-v7.2-rc2' of
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into for-li=
nus
> git bisect good 15eab2dd63a97587405ab6bfaad9728d5b35b5fe
> # bad: [c2e819be6a5c7f34344926b4bd7e3dfca58cf48a] usb: gadget: printer:
> fix infinite loop in printer_read()
> git bisect bad c2e819be6a5c7f34344926b4bd7e3dfca58cf48a
> # good: [29a142d3e8b35ebc9e0bcc78f4bc26c9b6a9ac0b] USB: gadget:
> snps-udc: fix device name leak on probe failure
> git bisect good 29a142d3e8b35ebc9e0bcc78f4bc26c9b6a9ac0b
> # good: [1febec7e47cdcd01f43fb0211094e3010474666e] usb: gadget: f_ncm:
> validate datagram bounds in ncm_unwrap_ntb()
> git bisect good 1febec7e47cdcd01f43fb0211094e3010474666e
> # bad: [0583f2fbf8f86ae3a0ce054f96783dd83e65d9bb] usb: gadget: udc: bdc:
> free IRQ and drain func_wake_notify before teardown
> git bisect bad 0583f2fbf8f86ae3a0ce054f96783dd83e65d9bb
> # bad: [7aa7d4bf9d3fa9a6a47b640ad103ab433b7ff261] usb: typec: ucsi: Fix
> race condition and ordering in port unregistration
> git bisect bad 7aa7d4bf9d3fa9a6a47b640ad103ab433b7ff261
> # first bad commit: [7aa7d4bf9d3fa9a6a47b640ad103ab433b7ff261] usb:
> typec: ucsi: Fix race condition and ordering in port unregistration
> >
> > Cc: stable@vger.kernel.org
> > Fixes: b9aa02ca39a4 ("usb: typec: ucsi: Add polling mechanism for partn=
er tasks like alt mode checking")
> > Fixes: b13abcb7ddd8 ("usb: typec: ucsi: Fix NULL pointer access")
> > Fixes: fac4b8633fd6 ("usb: ucsi: Ensure connector delayed work items ar=
e flushed")
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > ---
> >   drivers/usb/typec/ucsi/ucsi.c | 82 +++++++++++++++++-----------------=
-
> >   1 file changed, 39 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucs=
i.c
> > index 92166a3725b16..d9668ed7c80ea 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -1845,6 +1845,42 @@ static int ucsi_register_port(struct ucsi *ucsi,=
 struct ucsi_connector *con)
> >       return ret;
> >   }
> >
> > +static void ucsi_unregister_port(struct ucsi_connector *con)
> > +{
> > +     struct ucsi_work *uwork;
> > +
> > +     if (con->wq) {
> > +             mutex_lock(&con->lock);
> > +             ucsi_unregister_partner(con);
> > +             /*
> > +              * queue delayed items immediately so they can execute
> > +              * and free themselves before the wq is destroyed
> > +              */
> > +             list_for_each_entry(uwork, &con->partner_tasks, node) {
> > +                     if (cancel_delayed_work(&uwork->work))
> > +                             queue_delayed_work(con->wq, &uwork->work,=
 0);
> > +             }
> > +             mutex_unlock(&con->lock);
> > +
> > +             destroy_workqueue(con->wq);
> > +             con->wq =3D NULL;
> > +     } else {
> > +             ucsi_unregister_partner(con);
> > +     }
> > +
> > +     ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> > +     ucsi_unregister_port_psy(con);
> > +
> > +     usb_power_delivery_unregister_capabilities(con->port_sink_caps);
> > +     con->port_sink_caps =3D NULL;
> > +     usb_power_delivery_unregister_capabilities(con->port_source_caps)=
;
> > +     con->port_source_caps =3D NULL;
> > +     usb_power_delivery_unregister(con->pd);
> > +     con->pd =3D NULL;
> > +     typec_unregister_port(con->port);
> > +     con->port =3D NULL;
> > +}
> > +
> >   static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
> >   {
> >       u16 features =3D ucsi->cap.features;
> > @@ -1971,22 +2007,8 @@ static int ucsi_init(struct ucsi *ucsi)
> >       for (i =3D 0; i < ucsi->cap.num_connectors; i++)
> >               lockdep_unregister_key(&connector[i].lock_key);
> >
> > -     for (con =3D connector; con->port; con++) {
> > -             if (con->wq)
> > -                     destroy_workqueue(con->wq);
> > -             ucsi_unregister_partner(con);
> > -             ucsi_unregister_altmodes(con, UCSI_RECIPIENT_CON);
> > -             ucsi_unregister_port_psy(con);
> > -
> > -             usb_power_delivery_unregister_capabilities(con->port_sink=
_caps);
> > -             con->port_sink_caps =3D NULL;
> > -             usb_power_delivery_unregister_capabilities(con->port_sour=
ce_caps);
> > -             con->port_source_caps =3D NULL;
> > -             usb_power_delivery_unregister(con->pd);
> > -             con->pd =3D NULL;
> > -             typec_unregister_port(con->port);
> > -             con->port =3D NULL;
> > -     }
> > +     for (con =3D connector; con->port; con++)
> > +             ucsi_unregister_port(con);

Hi Chaitanya,
Thank you for spotting this!

Could you verify if calling lockdep_unregister_key(&connector[i].lock_key)
after ucsi_unregister_port(con) resolves the issue?

     for (con =3D connector; con->port; con++)
            ucsi_unregister_port(con);
     for (i =3D 0; i < ucsi->cap.num_connectors; i++)
               lockdep_unregister_key(&connector[i].lock_key);

I will also try testing this on my side.

Thanks,
Andrei
