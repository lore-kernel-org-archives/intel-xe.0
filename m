Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BC4606A31E
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UnoHmnRg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3099B10E90C;
	Sun, 15 Nov 2026 12:38:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E334210E076
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 12:38:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id C9A94609EB;
 Sun, 15 Nov 2026 12:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631CA1F000C4;
 Sun, 15 Nov 2026 12:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1794746298;
 bh=sAvYSNa9IeYfuPprcy5ZJsakOuZsKSbhrTLSzDwL6bg=;
 h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
 b=UnoHmnRgk0832FOYrT3QfQ8s/iBd4xRDaZuAP8YP/X/J0NtZlXXotxhk29lTg5Uzx
 lpC5u/K+3RXsRJ0mu9NN1IkHruNvSav0tt3HkOrgQ6r+V6hZmtzpLdnZ9drmjnPYJr
 hYc5E6leEMVBx1LrM9pm6BCGHRVD29+/elodWMlUqxzUuFabF/hVe7Br0k5tU7/fZs
 JYXcupEUe68blWvczrJcVfKDLH1ZFdJw4f9J8Ckh9LxNZ9An9zX6IyfKz1q0kfwo2p
 sImX5hYnvsulZXLORlcEE5qQbYdnyTy7MUQiRQcPTM2CRIDB9ZbBWD1NrqmCM39f57
 hscZ/ioOSV/2w==
Message-ID: <sashiko-outbox-215500@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [CI v1 1/1] Revert "serial: 8250: Switch to nbcon console, take 2"
To: =?utf-8?b?TWljaGHFgiBHcnplbGFr?= <michal.grzelak@linux.intel.com>,
 intel-xe@lists.freedesktop.org
In-Reply-To: <20261115122441.3141883-2-michal.grzelak@linux.intel.com>
References: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
 <20261115122441.3141883-2-michal.grzelak@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 12:38:17 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] braille: NULL pointer dereference in braille_write() on NBCON
  consoles
- [Medium] serial: 8250_mid: TX corruption and unlocked writes in
  mid8250_set_termios()
- [Low] serial: 8250: false lockdep warning in
  serial8250_em485_stop_tx() during oops
- [Low] serial: 8250: commit message lacks revert rationale and has
  inaccurate notes
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] serial: 8250: integer underflow in wait_for_lsr() [1]
--

commit 2fbf0749c6335f59fdac63a45592d21cc2a1cdd0
Author: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

> Revert "serial: 8250: Switch to nbcon console, take 2"
>=20
> This reverts commit d3539347022ad4eeb9dbd29c50bfca17b9d8a146.
>=20
> This revert consists of 6 additional reverts; all of them in order of
> applying:
> - Revert "serial: 8250: export and rename wait_for_xmitr()" [2c5942fd0300=
cb966339dd0366890be626b405e8]
> - Revert "printk: fix kernel-doc name for nbcon_write_context_is_braille"=
 [19ed235c1adcaf40f05997dfe8b96eb209effd35]
> - Revert "braille: nbcon: Allow to use a serial console with NBCON API as=
 Braille console" [c83e3d2912432107148cc5e288ddd153a84c0f43]
> - Revert "serial: 8250: Change console_msr_work to IRQ_WORK_LAZY" [37aba1=
6e7943634eb3e5e2e7e850ebb38500d935]
> - Reapply "serial: 8250: drop lockdep annotation from serial8250_clear_IE=
R()" [bbbb07f9fad6518090b7171dd8f5f737d8ddb63b]
> - Revert "serial: 8250: Switch to nbcon console, take 2" [d3539347022ad4e=
eb9dbd29c50bfca17b9d8a146]
> - Revert "serial: 8250_mid: wait for LSR tx empty before setting termios"=
 [1c305d5f1daabd317a60b6a2e2ac6b1aff7e05df]
>=20
> removed 2 conflicting #include's on top.
>=20
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@linux.intel.com>

[Severity: Low]
Could the commit message explain why d3539347022a ("serial: 8250: Switch to
nbcon console, take 2") is being reverted?  Also, the note about removing 2
conflicting #include lines does not match the diff, which does not remove a=
ny
#include directives.

> diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/ac=
cessibility/braille/braille_console.c
> index 5a3e375f4800f..06b43b678d6ea 100644
> --- a/drivers/accessibility/braille/braille_console.c
> +++ b/drivers/accessibility/braille/braille_console.c
> @@ -62,50 +62,14 @@ static void braille_write(u16 *buf)
>  {
>  	static u16 lastwrite[WIDTH];
>  	unsigned char data[1 + 1 + 2*WIDTH + 2 + 1], csum =3D 0, *c;
> -	struct nbcon_write_context wctxt =3D { };
> -	unsigned long flags;
>  	u16 out;
>  	int i;
> =20
>  	if (!braille_co)
>  		return;
> =20
> -	/*
> -	 * Braille console is not registered in console_list. Instead, it
> -	 * is integrated with VT and shows what appears on the graphical
> -	 * console under console_lock(). From this POV it is a legacy
> -	 * console. But it calls serial console driver which might be
> -	 * converted to the NBCON API. It is similar to
> -	 * nbcon_legacy_emit_next_record() except that we should try
> -	 * harder to get the lock. Otherwise, the Braille device won't show
> -	 * everything what is displayed on the terminal.
> -	 *
> -	 * In short, simulate the original locking using NBCON API.
> -	 */
> -	if (braille_co->flags & CON_NBCON) {
> -		if (panic_on_this_cpu()) {
> -			/*
> -			 * This should be good enough in practice. Most/all
> -			 * serial console drivers have the atomic callback.
> -			 */
> -			if (!braille_co->write_atomic)
> -				return;
> -
> -			local_irq_save(flags);
> -			/* NBCON API strictly requires the ownership. */
> -			if (!nbcon_braille_try_acquire(braille_co, &wctxt)) {
> -				local_irq_restore(flags);
> -				return;
> -			}
> -		} else {
> -			braille_co->device_lock(braille_co, &flags);
> -			while (!nbcon_braille_try_acquire(braille_co, &wctxt))
> -				cpu_relax();
> -		}
> -	}
> -
>  	if (!memcmp(lastwrite, buf, WIDTH * sizeof(*buf)))
> -		goto unlock_nbcon;
> +		return;
>  	memcpy(lastwrite, buf, WIDTH * sizeof(*buf));
> =20
>  #define SOH 1
> @@ -138,24 +102,7 @@ static void braille_write(u16 *buf)
>  	*c++ =3D csum;
>  	*c++ =3D ETX;
> =20
> -	if (braille_co->flags & CON_NBCON) {
> -		nbcon_write_context_set_buf(&wctxt, (char *)data, c - data);
> -		if (panic_on_this_cpu())
> -			braille_co->write_atomic(braille_co, &wctxt);
> -		else
> -			braille_co->write_thread(braille_co, &wctxt);
> -	} else {
> -		braille_co->write(braille_co, data, c - data);
> -	}
> -
> -unlock_nbcon:
> -	if (braille_co->flags & CON_NBCON) {
> -		nbcon_braille_release(&wctxt);
> -		if (panic_on_this_cpu())
> -			local_irq_restore(flags);
> -		else
> -			braille_co->device_unlock(braille_co, flags);
> -	}
> +	braille_co->write(braille_co, data, c - data);
>  }

[Severity: High]
Does reverting c83e3d291243 ("braille: nbcon: Allow to use a serial console
with NBCON API as Braille console") cause a NULL pointer dereference in
braille_write() when a remaining CON_NBCON serial driver is used as a Brail=
le
console?

Other serial console drivers such as amba-pl011, imx, and sifive remain
CON_NBCON consoles with .write set to NULL.  Booting with console=3Dbrl,tty=
AMA0
(or ttymxc0 / ttySIF0) will crash on the first braille_co->write() call, and
those drivers also lose the !nbcon_is_braille(co) checks in their
write_atomic() callbacks.  Only the 8250_port.c hunk of c83e3d291243 should
be dropped when reverting d3539347022a ("serial: 8250: Switch to nbcon
console, take 2").

[ ... ]

> diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250=
/8250_mid.c
> index df721418e97ef..0f62961ca9d09 100644
> --- a/drivers/tty/serial/8250/8250_mid.c
> +++ b/drivers/tty/serial/8250/8250_mid.c
> @@ -211,7 +211,6 @@ static void mid8250_set_termios(struct uart_port *p, =
struct ktermios *termios,
>  				const struct ktermios *old)
>  {
>  	unsigned int baud =3D tty_termios_baud_rate(termios);
> -	struct uart_8250_port *up =3D up_to_u8250p(p);
>  	struct mid8250 *mid =3D p->private_data;
>  	unsigned short ps =3D 16;
>  	unsigned long fuart =3D baud * ps;
> @@ -234,16 +233,11 @@ static void mid8250_set_termios(struct uart_port *p=
, struct ktermios *termios,
>  	}
> =20
>  	rational_best_approximation(fuart, mid->board->freq, w, w, &mul, &div);
> +	p->uartclk =3D fuart * 16 / ps;		/* core uses ps =3D 16 always */
> =20
> -	scoped_guard(spinlock_irq, &p->lock) {
> -		p->uartclk =3D fuart * 16 / ps;	/* core uses ps =3D 16 always */
> -
> -		serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
> -
> -		writel(ps, p->membase + INTEL_MID_UART_PS);	/* set PS */
> -		writel(mul, p->membase + INTEL_MID_UART_MUL);	/* set MUL */
> -		writel(div, p->membase + INTEL_MID_UART_DIV);
> -	}
> +	writel(ps, p->membase + INTEL_MID_UART_PS);		/* set PS */
> +	writel(mul, p->membase + INTEL_MID_UART_MUL);		/* set MUL */
> +	writel(div, p->membase + INTEL_MID_UART_DIV);
> =20
>  	serial8250_do_set_termios(p, termios, old);
>  }

[Severity: Medium]
Does reverting 1c305d5f1daa ("serial: 8250_mid: wait for LSR tx empty before
setting termios") and 2c5942fd0300 ("serial: 8250: export and rename
wait_for_xmitr()") reintroduce TX data corruption and unlocked register
writes in mid8250_set_termios()?

Those commits fixed an independent bug in 8250_mid where changing termios
while characters are in flight reprograms INTEL_MID_UART_PS,
INTEL_MID_UART_MUL, and INTEL_MID_UART_DIV and updates p->uartclk without
holding p->lock or waiting for UART_LSR_BOTH_EMPTY.  Reverting them also
leaves behind an unused #include <linux/cleanup.h> and
MODULE_IMPORT_NS("SERIAL_8250") in drivers/tty/serial/8250/8250_mid.c.

> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/825=
0/8250_port.c
> index 36b2b0a2c05cd..5777db9c6d89e 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c

[ ... ]

> @@ -1319,6 +1306,9 @@ void serial8250_em485_stop_tx(struct uart_8250_port=
 *p, bool toggle_ier)
>  {
>  	unsigned char mcr =3D serial8250_in_MCR(p);
> =20
> +	/* Port locked to synchronize UART_IER access against the console. */
> +	lockdep_assert_held_once(&p->port.lock);
> +
>  	if (p->port.rs485.flags & SER_RS485_RTS_AFTER_SEND)
>  		mcr |=3D UART_MCR_RTS;
>  	else
> @@ -1334,16 +1324,6 @@ void serial8250_em485_stop_tx(struct uart_8250_por=
t *p, bool toggle_ier)
>  		serial8250_clear_and_reinit_fifos(p);
> =20
>  		if (toggle_ier) {
> -			/*
> -			 * Port locked to synchronize UART_IER access against
> -			 * the console. The lockdep_assert must be restricted
> -			 * to this condition because only here is it
> -			 * guaranteed that the port lock is held. The other
> -			 * hardware access in this function is synchronized
> -			 * by console ownership.
> -			 */
> -			lockdep_assert_held_once(&p->port.lock);
> -
>  			p->ier |=3D UART_IER_RLSI | UART_IER_RDI;
>  			serial_port_out(&p->port, UART_IER, p->ier);
>  		}

[Severity: Low]
Can moving lockdep_assert_held_once(&p->port.lock) out of the if (toggle_ie=
r)
block trigger a false lockdep warning during an oops?

When oops_in_progress is set, serial8250_console_write() uses
uart_port_trylock_irqsave() and continues unlocked if the trylock fails,
calling up->rs485_stop_tx(up, false) at the end of the transmission.  Since
UART_IER is only touched when toggle_ier is true, asserting p->port.lock
unconditionally at function entry will warn when locked =3D=3D 0.

> @@ -2047,7 +2027,7 @@ static bool wait_for_lsr(struct uart_8250_port *up,=
 int bits)
>  }
> =20
>  /* Wait for transmitter and holding register to empty with timeout */
> -void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits)
> +static void wait_for_xmitr(struct uart_8250_port *up, int bits)
>  {
>  	unsigned int tmout;
>  	bool tx_ready;

[Severity: High]
This problem wasn't introduced by this patch, but can tmout underflow to
UINT_MAX in wait_for_lsr() [1] at very high baud rates?

drivers/tty/serial/8250/8250_port.c:wait_for_lsr() {
	if (up->port.frame_time)
		tmout =3D up->port.frame_time * 2 / NSEC_PER_USEC;
	else
		tmout =3D 10000;

	for (;;) {
		status =3D serial_lsr_in(up);

		if ((status & bits) =3D=3D bits)
			break;
		if (--tmout =3D=3D 0)
			break;
		udelay(1);
		touch_nmi_watchdog();
	}
}

When a fast UART runs at a baud rate with a frame_time below 500 ns (such as
24 Mbps), up->port.frame_time * 2 / NSEC_PER_USEC truncates tmout to 0.  If
the LSR bits are not immediately set, --tmout wraps around to UINT_MAX and
spins with udelay(1) for up to 4.2 billion iterations (~71 minutes), locking
up the CPU.

[1] https://sashiko.dev/#/bug/linux-7e6ea87e-575e-4a64-826f-d64665ba4b15

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115122441.3141=
883-1-michal.grzelak@linux.intel.com?part=3D1
