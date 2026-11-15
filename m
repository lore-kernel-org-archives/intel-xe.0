Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C63606A31D
	for <intel-xe@archiver.kernel.org>; Sun, 15 Nov 2026 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xe4GU6Ox
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0076610E0ED;
	Sun, 15 Nov 2026 12:25:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E3F10E0ED
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794745494; x=1826281494;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AEIeSRXjN0FOXLNRMY4C0BOYOWuac4iGY9gWJsv1KyQ=;
 b=Xe4GU6OxGf9Czy+2qviNldpuvRW/AMUV0ExI2IlPYVLk77qtFV0ucUO4
 tnCPPUenAyg7PByJhGTCmwqR52c4VeTHAuS3F6W+rrCk7B6Xxh58waxoG
 rqNdmsqD42Fvfhg9pXhK27pVY45vyprPM9OSH1HmWUVgNgcqtW11l39C9
 nj6UNLCbrOgs9ogJLfiTnpPEwxB1y1M8qIoMR73iygzNZrZZzE5AzEz73
 AUUq3lNBsA38y6izT2sx04GPGBtmy5IE3jaEiX2kpUFt8NwwkfYq45jse
 B5fniT0Xdhkkgn/lARTNSlvLZWj5QEFroXIAXyf4PzWH/LJeiqTisvkBT A==;
X-CSE-ConnectionGUID: OEu69l2VQWyeQgYm5XkzrQ==
X-CSE-MsgGUID: cz/TlQfIRsGND7w7FkJLKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3481538"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3481538"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:24:54 -0800
X-CSE-ConnectionGUID: dqJzXkOTRm2aGgE2qnBp0g==
X-CSE-MsgGUID: MXVDDBUUTi6bMYFRa/FTBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9160028"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 04:24:52 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [CI v1 1/1] Revert "serial: 8250: Switch to nbcon console, take 2"
Date: Sun, 15 Nov 2026 13:24:41 +0100
Message-ID: <20261115122441.3141883-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
References: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit d3539347022ad4eeb9dbd29c50bfca17b9d8a146.

This revert consists of 6 additional reverts; all of them in order of
applying:
- Revert "serial: 8250: export and rename wait_for_xmitr()" [2c5942fd0300cb966339dd0366890be626b405e8]
- Revert "printk: fix kernel-doc name for nbcon_write_context_is_braille" [19ed235c1adcaf40f05997dfe8b96eb209effd35]
- Revert "braille: nbcon: Allow to use a serial console with NBCON API as Braille console" [c83e3d2912432107148cc5e288ddd153a84c0f43]
- Revert "serial: 8250: Change console_msr_work to IRQ_WORK_LAZY" [37aba16e7943634eb3e5e2e7e850ebb38500d935]
- Reapply "serial: 8250: drop lockdep annotation from serial8250_clear_IER()" [bbbb07f9fad6518090b7171dd8f5f737d8ddb63b]
- Revert "serial: 8250: Switch to nbcon console, take 2" [d3539347022ad4eeb9dbd29c50bfca17b9d8a146]
- Revert "serial: 8250_mid: wait for LSR tx empty before setting termios" [1c305d5f1daabd317a60b6a2e2ac6b1aff7e05df]

removed 2 conflicting #include's on top.

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 .../accessibility/braille/braille_console.c   |  57 +---
 drivers/tty/serial/8250/8250.h                |   5 +-
 drivers/tty/serial/8250/8250_core.c           |  65 +----
 drivers/tty/serial/8250/8250_dw.c             |   2 +-
 drivers/tty/serial/8250/8250_mid.c            |  14 +-
 drivers/tty/serial/8250/8250_port.c           | 261 +++---------------
 drivers/tty/serial/amba-pl011.c               |   2 +-
 drivers/tty/serial/imx.c                      |   2 +-
 drivers/tty/serial/sifive.c                   |   2 +-
 include/linux/console.h                       |  15 -
 include/linux/serial_8250.h                   |  16 +-
 kernel/printk/nbcon.c                         |  80 ------
 12 files changed, 70 insertions(+), 451 deletions(-)

diff --git a/drivers/accessibility/braille/braille_console.c b/drivers/accessibility/braille/braille_console.c
index 5a3e375f4800f..06b43b678d6ea 100644
--- a/drivers/accessibility/braille/braille_console.c
+++ b/drivers/accessibility/braille/braille_console.c
@@ -62,50 +62,14 @@ static void braille_write(u16 *buf)
 {
 	static u16 lastwrite[WIDTH];
 	unsigned char data[1 + 1 + 2*WIDTH + 2 + 1], csum = 0, *c;
-	struct nbcon_write_context wctxt = { };
-	unsigned long flags;
 	u16 out;
 	int i;
 
 	if (!braille_co)
 		return;
 
-	/*
-	 * Braille console is not registered in console_list. Instead, it
-	 * is integrated with VT and shows what appears on the graphical
-	 * console under console_lock(). From this POV it is a legacy
-	 * console. But it calls serial console driver which might be
-	 * converted to the NBCON API. It is similar to
-	 * nbcon_legacy_emit_next_record() except that we should try
-	 * harder to get the lock. Otherwise, the Braille device won't show
-	 * everything what is displayed on the terminal.
-	 *
-	 * In short, simulate the original locking using NBCON API.
-	 */
-	if (braille_co->flags & CON_NBCON) {
-		if (panic_on_this_cpu()) {
-			/*
-			 * This should be good enough in practice. Most/all
-			 * serial console drivers have the atomic callback.
-			 */
-			if (!braille_co->write_atomic)
-				return;
-
-			local_irq_save(flags);
-			/* NBCON API strictly requires the ownership. */
-			if (!nbcon_braille_try_acquire(braille_co, &wctxt)) {
-				local_irq_restore(flags);
-				return;
-			}
-		} else {
-			braille_co->device_lock(braille_co, &flags);
-			while (!nbcon_braille_try_acquire(braille_co, &wctxt))
-				cpu_relax();
-		}
-	}
-
 	if (!memcmp(lastwrite, buf, WIDTH * sizeof(*buf)))
-		goto unlock_nbcon;
+		return;
 	memcpy(lastwrite, buf, WIDTH * sizeof(*buf));
 
 #define SOH 1
@@ -138,24 +102,7 @@ static void braille_write(u16 *buf)
 	*c++ = csum;
 	*c++ = ETX;
 
-	if (braille_co->flags & CON_NBCON) {
-		nbcon_write_context_set_buf(&wctxt, (char *)data, c - data);
-		if (panic_on_this_cpu())
-			braille_co->write_atomic(braille_co, &wctxt);
-		else
-			braille_co->write_thread(braille_co, &wctxt);
-	} else {
-		braille_co->write(braille_co, data, c - data);
-	}
-
-unlock_nbcon:
-	if (braille_co->flags & CON_NBCON) {
-		nbcon_braille_release(&wctxt);
-		if (panic_on_this_cpu())
-			local_irq_restore(flags);
-		else
-			braille_co->device_unlock(braille_co, flags);
-	}
+	braille_co->write(braille_co, data, c - data);
 }
 
 /* Follow the VC cursor*/
diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b7516..4a90b231bc274 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -183,10 +183,7 @@ static unsigned int __maybe_unused serial_icr_read(struct uart_8250_port *up,
 
 void serial8250_clear_fifos(struct uart_8250_port *p);
 void serial8250_clear_and_reinit_fifos(struct uart_8250_port *p);
-void serial8250_fifo_wait_for_lsr_thre(struct uart_8250_port *up,
-				       struct nbcon_write_context *wctxt,
-				       unsigned int count);
-void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits);
+void serial8250_fifo_wait_for_lsr_thre(struct uart_8250_port *up, unsigned int count);
 
 void serial8250_rpm_get(struct uart_8250_port *p);
 void serial8250_rpm_put(struct uart_8250_port *p);
diff --git a/drivers/tty/serial/8250/8250_core.c b/drivers/tty/serial/8250/8250_core.c
index 42319843cb5b0..eeea0d1a59a4e 100644
--- a/drivers/tty/serial/8250/8250_core.c
+++ b/drivers/tty/serial/8250/8250_core.c
@@ -390,34 +390,12 @@ void __init serial8250_register_ports(struct uart_driver *drv, struct device *de
 
 #ifdef CONFIG_SERIAL_8250_CONSOLE
 
-static void univ8250_console_write_atomic(struct console *co,
-					  struct nbcon_write_context *wctxt)
+static void univ8250_console_write(struct console *co, const char *s,
+				   unsigned int count)
 {
 	struct uart_8250_port *up = &serial8250_ports[co->index];
 
-	serial8250_console_write(up, wctxt, true);
-}
-
-static void univ8250_console_write_thread(struct console *co,
-					  struct nbcon_write_context *wctxt)
-{
-	struct uart_8250_port *up = &serial8250_ports[co->index];
-
-	serial8250_console_write(up, wctxt, false);
-}
-
-static void univ8250_console_device_lock(struct console *co, unsigned long *flags)
-{
-	struct uart_port *up = &serial8250_ports[co->index].port;
-
-	__uart_port_lock_irqsave(up, flags);
-}
-
-static void univ8250_console_device_unlock(struct console *co, unsigned long flags)
-{
-	struct uart_port *up = &serial8250_ports[co->index].port;
-
-	__uart_port_unlock_irqrestore(up, flags);
+	serial8250_console_write(up, s, count);
 }
 
 static int univ8250_console_setup(struct console *co, char *options)
@@ -518,15 +496,12 @@ static int univ8250_console_match(struct console *co, char *name, int idx,
 
 static struct console univ8250_console = {
 	.name		= "ttyS",
-	.write_atomic	= univ8250_console_write_atomic,
-	.write_thread	= univ8250_console_write_thread,
-	.device_lock	= univ8250_console_device_lock,
-	.device_unlock	= univ8250_console_device_unlock,
+	.write		= univ8250_console_write,
 	.device		= uart_console_device,
 	.setup		= univ8250_console_setup,
 	.exit		= univ8250_console_exit,
 	.match		= univ8250_console_match,
-	.flags		= CON_PRINTBUFFER | CON_ANYTIME | CON_NBCON,
+	.flags		= CON_PRINTBUFFER | CON_ANYTIME,
 	.index		= -1,
 	.data		= &serial8250_reg,
 };
@@ -608,19 +583,13 @@ void serial8250_suspend_port(struct uart_8250_port *up)
 {
 	struct uart_port *port = &up->port;
 
-	if (uart_console(port)) {
-		/* No irq_work may be queued when suspending */
-		scoped_guard(uart_port_lock_irq, port)
-			up->console_msr_work_allow = false;
-		irq_work_sync(&up->console_msr_work);
+	if (!console_suspend_enabled && uart_console(port) &&
+	    port->type != PORT_8250) {
+		unsigned char canary = 0xa5;
 
-		if (!console_suspend_enabled && port->type != PORT_8250) {
-			unsigned char canary = 0xa5;
-
-			serial_out(up, UART_SCR, canary);
-			if (serial_in(up, UART_SCR) == canary)
-				up->canary = canary;
-		}
+		serial_out(up, UART_SCR, canary);
+		if (serial_in(up, UART_SCR) == canary)
+			up->canary = canary;
 	}
 
 	uart_suspend_port(&serial8250_reg, port);
@@ -649,18 +618,6 @@ void serial8250_resume_port(struct uart_8250_port *up)
 		port->uartclk = 921600*16;
 	}
 	uart_resume_port(&serial8250_reg, port);
-
-	if (uart_console(port)) {
-
-		guard(uart_port_lock_irq)(port);
-
-		/* irq_work allowed again */
-		up->console_msr_work_allow = true;
-
-		/* Handle any pending MSR changes */
-		if (up->msr_saved_flags)
-			serial8250_modem_status(up);
-	}
 }
 EXPORT_SYMBOL(serial8250_resume_port);
 
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a5e893e459593..ebadb41aa4e7b 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -158,7 +158,7 @@ static int dw8250_idle_enter(struct uart_port *p)
 	 *
 	 * FIXME: frame_time delay is too long with very low baudrates.
 	 */
-	serial8250_fifo_wait_for_lsr_thre(up, NULL, p->fifosize);
+	serial8250_fifo_wait_for_lsr_thre(up, p->fifosize);
 	ndelay(p->frame_time);
 
 	serial_port_out(p, UART_MCR, up->mcr | UART_MCR_LOOP);
diff --git a/drivers/tty/serial/8250/8250_mid.c b/drivers/tty/serial/8250/8250_mid.c
index df721418e97ef..0f62961ca9d09 100644
--- a/drivers/tty/serial/8250/8250_mid.c
+++ b/drivers/tty/serial/8250/8250_mid.c
@@ -211,7 +211,6 @@ static void mid8250_set_termios(struct uart_port *p, struct ktermios *termios,
 				const struct ktermios *old)
 {
 	unsigned int baud = tty_termios_baud_rate(termios);
-	struct uart_8250_port *up = up_to_u8250p(p);
 	struct mid8250 *mid = p->private_data;
 	unsigned short ps = 16;
 	unsigned long fuart = baud * ps;
@@ -234,16 +233,11 @@ static void mid8250_set_termios(struct uart_port *p, struct ktermios *termios,
 	}
 
 	rational_best_approximation(fuart, mid->board->freq, w, w, &mul, &div);
+	p->uartclk = fuart * 16 / ps;		/* core uses ps = 16 always */
 
-	scoped_guard(spinlock_irq, &p->lock) {
-		p->uartclk = fuart * 16 / ps;	/* core uses ps = 16 always */
-
-		serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
-
-		writel(ps, p->membase + INTEL_MID_UART_PS);	/* set PS */
-		writel(mul, p->membase + INTEL_MID_UART_MUL);	/* set MUL */
-		writel(div, p->membase + INTEL_MID_UART_DIV);
-	}
+	writel(ps, p->membase + INTEL_MID_UART_PS);		/* set PS */
+	writel(mul, p->membase + INTEL_MID_UART_MUL);		/* set MUL */
+	writel(div, p->membase + INTEL_MID_UART_DIV);
 
 	serial8250_do_set_termios(p, termios, old);
 }
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 36b2b0a2c05cd..5777db9c6d89e 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -726,12 +726,7 @@ static void serial8250_clear_interrupts(struct uart_port *port)
 	serial_port_in(port, UART_MSR);
 }
 
-/*
- * Only to be directly used by serial8250_console_write() and
- * serial8250_put_poll_char(), which do not require the port lock.
- * Use serial8250_clear_IER() instead for all other cases.
- */
-static void __serial8250_clear_IER(struct uart_8250_port *up)
+static void serial8250_clear_IER(struct uart_8250_port *up)
 {
 	if (up->capabilities & UART_CAP_UUE)
 		serial_out(up, UART_IER, UART_IER_UUE);
@@ -739,14 +734,6 @@ static void __serial8250_clear_IER(struct uart_8250_port *up)
 		serial_out(up, UART_IER, 0);
 }
 
-static inline void serial8250_clear_IER(struct uart_8250_port *up)
-{
-	/* Port locked to synchronize UART_IER access against the console */
-	lockdep_assert_held_once(&up->port.lock);
-
-	__serial8250_clear_IER(up);
-}
-
 /*
  * This is a quickie test to see how big the FIFO is.
  * It doesn't work at all the time, more's the pity.
@@ -1319,6 +1306,9 @@ void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier)
 {
 	unsigned char mcr = serial8250_in_MCR(p);
 
+	/* Port locked to synchronize UART_IER access against the console. */
+	lockdep_assert_held_once(&p->port.lock);
+
 	if (p->port.rs485.flags & SER_RS485_RTS_AFTER_SEND)
 		mcr |= UART_MCR_RTS;
 	else
@@ -1334,16 +1324,6 @@ void serial8250_em485_stop_tx(struct uart_8250_port *p, bool toggle_ier)
 		serial8250_clear_and_reinit_fifos(p);
 
 		if (toggle_ier) {
-			/*
-			 * Port locked to synchronize UART_IER access against
-			 * the console. The lockdep_assert must be restricted
-			 * to this condition because only here is it
-			 * guaranteed that the port lock is held. The other
-			 * hardware access in this function is synchronized
-			 * by console ownership.
-			 */
-			lockdep_assert_held_once(&p->port.lock);
-
 			p->ier |= UART_IER_RLSI | UART_IER_RDI;
 			serial_port_out(&p->port, UART_IER, p->ier);
 		}
@@ -2047,7 +2027,7 @@ static bool wait_for_lsr(struct uart_8250_port *up, int bits)
 }
 
 /* Wait for transmitter and holding register to empty with timeout */
-void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits)
+static void wait_for_xmitr(struct uart_8250_port *up, int bits)
 {
 	unsigned int tmout;
 	bool tx_ready;
@@ -2075,7 +2055,6 @@ void serial8250_wait_for_xmitr(struct uart_8250_port *up, int bits)
 		}
 	}
 }
-EXPORT_SYMBOL_NS_GPL(serial8250_wait_for_xmitr, "SERIAL_8250");
 
 #ifdef CONFIG_CONSOLE_POLL
 /*
@@ -2114,15 +2093,12 @@ static void serial8250_put_poll_char(struct uart_port *port,
 
 	guard(serial8250_rpm)(up);
 	/*
-	 * First, save the IER, then disable the interrupts. The special
-	 * variant to clear the IER is used because KDB/KGDB printing
-	 * is synchronized via CPU quiescence without holding the port
-	 * lock.
+	 *	First save the IER then disable the interrupts
 	 */
 	ier = serial_port_in(port, UART_IER);
-	__serial8250_clear_IER(up);
+	serial8250_clear_IER(up);
 
-	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	/*
 	 *	Send the character out.
 	 */
@@ -2132,7 +2108,7 @@ static void serial8250_put_poll_char(struct uart_port *port,
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore the IER
 	 */
-	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 	serial_port_out(port, UART_IER, ier);
 }
 
@@ -2247,7 +2223,7 @@ static void serial8250_THRE_test(struct uart_port *port)
 	 * Synchronize UART_IER access against the console.
 	 */
 	scoped_guard(uart_port_lock_irqsave, port) {
-		serial8250_wait_for_xmitr(up, UART_LSR_THRE);
+		wait_for_xmitr(up, UART_LSR_THRE);
 		serial_port_out_sync(port, UART_IER, UART_IER_THRI);
 		udelay(1); /* allow THRE to set */
 		iir_noint1 = serial_port_in(port, UART_IIR) & UART_IIR_NO_INT;
@@ -3272,32 +3248,13 @@ void serial8250_set_defaults(struct uart_8250_port *up)
 }
 EXPORT_SYMBOL_GPL(serial8250_set_defaults);
 
-void serial8250_fifo_wait_for_lsr_thre(struct uart_8250_port *up,
-				       struct nbcon_write_context *wctxt,
-				       unsigned int count)
+void serial8250_fifo_wait_for_lsr_thre(struct uart_8250_port *up, unsigned int count)
 {
 	unsigned int i;
 
-	/*
-	 * For console writing, enter/exit an unsafe section for each byte
-	 * in order to pass the ownership as quickly as possible if a higher
-	 * priority context wants ownership. Otherwise, an attempt to take
-	 * over the ownership might timeout. The new owner will wait for
-	 * UART_LSR_THRE before reusing the fifo.
-	 */
 	for (i = 0; i < count; i++) {
-		bool tx_ready;
-
-		if (wctxt && !nbcon_enter_unsafe(wctxt))
+		if (wait_for_lsr(up, UART_LSR_THRE))
 			return;
-
-		tx_ready = wait_for_lsr(up, UART_LSR_THRE);
-
-		if (wctxt)
-			nbcon_exit_unsafe(wctxt);
-
-		if (tx_ready)
-			break;
 	}
 }
 EXPORT_SYMBOL_NS_GPL(serial8250_fifo_wait_for_lsr_thre, "SERIAL_8250");
@@ -3306,18 +3263,14 @@ EXPORT_SYMBOL_NS_GPL(serial8250_fifo_wait_for_lsr_thre, "SERIAL_8250");
 
 static void serial8250_console_putchar(struct uart_port *port, unsigned char ch)
 {
-	struct uart_8250_port *up = up_to_u8250p(port);
-
 	serial_port_out(port, UART_TX, ch);
-
-	up->console_line_ended = (ch == '\n');
 }
 
 static void serial8250_console_wait_putchar(struct uart_port *port, unsigned char ch)
 {
 	struct uart_8250_port *up = up_to_u8250p(port);
 
-	serial8250_wait_for_xmitr(up, UART_LSR_THRE);
+	wait_for_xmitr(up, UART_LSR_THRE);
 	serial8250_console_putchar(port, ch);
 }
 
@@ -3353,9 +3306,8 @@ static void serial8250_console_restore(struct uart_8250_port *up)
  * It sends fifosize bytes and then waits for the fifo
  * to get empty.
  */
-static void __serial8250_console_fifo_write(struct uart_8250_port *up,
-					    struct nbcon_write_context *wctxt,
-					    const char *s, unsigned int count)
+static void serial8250_console_fifo_write(struct uart_8250_port *up,
+					  const char *s, unsigned int count)
 {
 	const char *end = s + count;
 	unsigned int fifosize = up->tx_loadsz;
@@ -3366,16 +3318,9 @@ static void __serial8250_console_fifo_write(struct uart_8250_port *up,
 
 	while (s != end) {
 		/* Allow timeout for each byte of a possibly full FIFO */
-		serial8250_fifo_wait_for_lsr_thre(up, wctxt, fifosize);
+		serial8250_fifo_wait_for_lsr_thre(up, fifosize);
 
-		/*
-		 * Fill the FIFO. If a handover or takeover occurs, writing
-		 * must be aborted since the string data is no longer valid.
-		 */
 		for (i = 0; i < fifosize && s != end; ++i) {
-			if (!nbcon_enter_unsafe(wctxt))
-				return;
-
 			if (*s == '\n' && !cr_sent) {
 				serial8250_console_putchar(port, '\r');
 				cr_sent = true;
@@ -3383,8 +3328,6 @@ static void __serial8250_console_fifo_write(struct uart_8250_port *up,
 				serial8250_console_putchar(port, *s++);
 				cr_sent = false;
 			}
-
-			nbcon_exit_unsafe(wctxt);
 		}
 		tx_count = i;
 	}
@@ -3393,95 +3336,39 @@ static void __serial8250_console_fifo_write(struct uart_8250_port *up,
 	 * Allow timeout for each byte written since the caller will only wait
 	 * for UART_LSR_BOTH_EMPTY using the timeout of a single character
 	 */
-	serial8250_fifo_wait_for_lsr_thre(up, wctxt, tx_count);
-}
-
-static void serial8250_console_fifo_write(struct uart_8250_port *up,
-					  struct nbcon_write_context *wctxt)
-{
-	__serial8250_console_fifo_write(up, wctxt, wctxt->outbuf, wctxt->len);
-}
-
-static void __serial8250_console_byte_write(struct uart_8250_port *up,
-					    struct nbcon_write_context *wctxt,
-					    const char *s, unsigned int count)
-{
-	struct uart_port *port = &up->port;
-	const char *end = s + count;
-
-	/*
-	 * Write out the message. If a handover or takeover occurs, writing
-	 * must be aborted since the string data is no longer valid.
-	 */
-	while (s != end) {
-		if (!nbcon_enter_unsafe(wctxt))
-			return;
-
-		uart_console_write(port, s++, 1, serial8250_console_wait_putchar);
-
-		nbcon_exit_unsafe(wctxt);
-	}
-}
-
-static void serial8250_console_byte_write(struct uart_8250_port *up,
-					  struct nbcon_write_context *wctxt)
-{
-	__serial8250_console_byte_write(up, wctxt, wctxt->outbuf, wctxt->len);
-}
-
-/*
- * Print the console line using the appropriate variant. If ownership is lost
- * at any time during printing, the printing is aborted.
- */
-static void __serial8250_console_write(struct uart_8250_port *up,
-				       struct nbcon_write_context *wctxt,
-				       bool use_fifo)
-{
-	/*
-	 * If the console printer did not fully output the previous line, it
-	 * must have been handed or taken over. Insert a newline in order to
-	 * maintain clean output.
-	 *
-	 * Braille consoles are an exception. The serial port is not used
-	 * for printk(). The driver is supposed to write exactly what it gets.
-	 */
-	if (unlikely(!up->console_line_ended && !nbcon_write_context_is_braille(wctxt))) {
-		if (use_fifo)
-			__serial8250_console_fifo_write(up, wctxt, "\n", 1);
-		else
-			__serial8250_console_byte_write(up, wctxt, "\n", 1);
-	}
-
-	if (use_fifo)
-		serial8250_console_fifo_write(up, wctxt);
-	else
-		serial8250_console_byte_write(up, wctxt);
+	serial8250_fifo_wait_for_lsr_thre(up, tx_count);
 }
 
 /*
- * Print a string to the serial port trying not to disturb
- * any possible real use of the port...
+ *	Print a string to the serial port trying not to disturb
+ *	any possible real use of the port...
+ *
+ *	The console_lock must be held when we get here.
+ *
+ *	Doing runtime PM is really a bad idea for the kernel console.
+ *	Thus, we assume the function is called when device is powered up.
  */
-void serial8250_console_write(struct uart_8250_port *up,
-			      struct nbcon_write_context *wctxt,
-			      bool is_atomic)
+void serial8250_console_write(struct uart_8250_port *up, const char *s,
+			      unsigned int count)
 {
 	struct uart_8250_em485 *em485 = up->em485;
 	struct uart_port *port = &up->port;
-	unsigned int ier;
-	bool use_fifo;
+	unsigned long flags;
+	unsigned int ier, use_fifo;
+	int locked = 1;
 
-	if (!nbcon_enter_unsafe(wctxt))
-		return;
+	touch_nmi_watchdog();
+
+	if (oops_in_progress)
+		locked = uart_port_trylock_irqsave(port, &flags);
+	else
+		uart_port_lock_irqsave(port, &flags);
 
 	/*
-	 * First, save the IER, then disable the interrupts. The special
-	 * variant to clear the IER is used because emergency and panic
-	 * printing is synchronized only by nbcon ownership without
-	 * holding the port lock.
+	 *	First save the IER then disable the interrupts
 	 */
 	ier = serial_port_in(port, UART_IER);
-	__serial8250_clear_IER(up);
+	serial8250_clear_IER(up);
 
 	/* check scratch reg to see if port powered off during system sleep */
 	if (up->canary && (up->canary != serial_port_in(port, UART_SCR))) {
@@ -3515,41 +3402,23 @@ void serial8250_console_write(struct uart_8250_port *up,
 		 */
 		!uart_console_hwflow_active(&up->port);
 
-	nbcon_exit_unsafe(wctxt);
-
-	__serial8250_console_write(up, wctxt, use_fifo);
-
-	/*
-	 * Re-enter an unsafe section in order to perform final actions
-	 * (such as re-enabling interrupts). If ownership was lost, this
-	 * context must reacquire ownership.
-	 */
-	while (!nbcon_enter_unsafe(wctxt))
-		nbcon_reacquire_nobuf(wctxt);
+	if (likely(use_fifo))
+		serial8250_console_fifo_write(up, s, count);
+	else
+		uart_console_write(port, s, count, serial8250_console_wait_putchar);
 
 	/*
 	 *	Finally, wait for transmitter to become empty
 	 *	and restore the IER
 	 */
-	serial8250_wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
+	wait_for_xmitr(up, UART_LSR_BOTH_EMPTY);
 
 	if (em485) {
 		mdelay(port->rs485.delay_rts_after_send);
-
-		/* Toggle unsafe after possibly long delay */
-		nbcon_exit_unsafe(wctxt);
-		while (!nbcon_enter_unsafe(wctxt))
-			nbcon_reacquire_nobuf(wctxt);
-
 		if (em485->tx_stopped)
 			up->rs485_stop_tx(up, false);
 	}
 
-	/* Toggle unsafe after possibly long delay */
-	nbcon_exit_unsafe(wctxt);
-	while (!nbcon_enter_unsafe(wctxt))
-		nbcon_reacquire_nobuf(wctxt);
-
 	serial_port_out(port, UART_IER, ier);
 
 	/*
@@ -3559,25 +3428,11 @@ void serial8250_console_write(struct uart_8250_port *up,
 	 *	call it if we have saved something in the saved flags
 	 *	while processing with interrupts off.
 	 */
-	if (up->msr_saved_flags) {
-		if (is_atomic) {
-			/*
-			 * For atomic, MSR handling must be deferred to
-			 * irq_work because this may be a context that does
-			 * not permit waking up tasks.
-			 *
-			 * But no irq_work may be queued when suspending.
-			 * In that case, the MSR handling will occur during
-			 * resume in serial8250_resume_port().
-			 */
-			if (up->console_msr_work_allow)
-				irq_work_queue(&up->console_msr_work);
-		} else {
-			serial8250_modem_status(up);
-		}
-	}
+	if (up->msr_saved_flags)
+		serial8250_modem_status(up);
 
-	nbcon_exit_unsafe(wctxt);
+	if (locked)
+		uart_port_unlock_irqrestore(port, flags);
 }
 
 static unsigned int probe_baud(struct uart_port *port)
@@ -3595,24 +3450,8 @@ static unsigned int probe_baud(struct uart_port *port)
 	return (port->uartclk / 16) / quot;
 }
 
-/*
- * irq_work handler to perform modem control during console output.
- * Only triggered via ->write_atomic() callback because it may be
- * in a scheduler or NMI context, unable to wake tasks.
- */
-static void console_msr_handler(struct irq_work *iwp)
-{
-	struct uart_8250_port *up = container_of(iwp, struct uart_8250_port, console_msr_work);
-	struct uart_port *port = &up->port;
-
-	guard(uart_port_lock)(port);
-
-	serial8250_modem_status(up);
-}
-
 int serial8250_console_setup(struct uart_port *port, char *options, bool probe)
 {
-	struct uart_8250_port *up = up_to_u8250p(port);
 	int baud = 9600;
 	int bits = 8;
 	int parity = 'n';
@@ -3622,10 +3461,6 @@ int serial8250_console_setup(struct uart_port *port, char *options, bool probe)
 	if (!port->iobase && !port->membase)
 		return -ENODEV;
 
-	up->console_line_ended = true;
-	up->console_msr_work_allow = true;
-	up->console_msr_work = IRQ_WORK_INIT_LAZY(console_msr_handler);
-
 	if (options)
 		uart_parse_options(options, &baud, &parity, &bits, &flow);
 	else if (probe)
@@ -3646,10 +3481,6 @@ int serial8250_console_setup(struct uart_port *port, char *options, bool probe)
 
 int serial8250_console_exit(struct uart_port *port)
 {
-	struct uart_8250_port *up = up_to_u8250p(port);
-
-	irq_work_sync(&up->console_msr_work);
-
 	if (port->dev)
 		pm_runtime_put_sync(port->dev);
 
diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
index 7b1f99395f6c7..8bfb5b0a5de7c 100644
--- a/drivers/tty/serial/amba-pl011.c
+++ b/drivers/tty/serial/amba-pl011.c
@@ -2743,7 +2743,7 @@ pl011_console_write_atomic(struct console *co, struct nbcon_write_context *wctxt
 				uap, REG_CR);
 	}
 
-	if (unlikely(!uap->console_line_ended && !nbcon_is_braille(co)))
+	if (!uap->console_line_ended)
 		uart_console_write(&uap->port, "\n", 1, pl011_console_putchar);
 	uart_console_write(&uap->port, wctxt->outbuf, wctxt->len, pl011_console_putchar);
 
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index 256d85e398d13..e27e36fe8f95c 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -2136,7 +2136,7 @@ static void imx_uart_console_write_atomic(struct console *co,
 	imx_uart_writel(sport, ucr1, UCR1);
 	imx_uart_writel(sport, old_ucr.ucr2 | UCR2_TXEN, UCR2);
 
-	if (unlikely(!sport->last_putchar_was_newline && !nbcon_is_braille(co)))
+	if (!sport->last_putchar_was_newline)
 		uart_console_write(port, "\n", 1, imx_uart_console_putchar);
 	uart_console_write(port, wctxt->outbuf, wctxt->len,
 			   imx_uart_console_putchar);
diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 892b498540ac4..18f75e32e86de 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -821,7 +821,7 @@ static void sifive_serial_console_write_atomic(struct console *co,
 	ier = __ssp_readl(ssp, SIFIVE_SERIAL_IE_OFFS);
 	__ssp_writel(0, SIFIVE_SERIAL_IE_OFFS, ssp);
 
-	if (unlikely(!ssp->console_line_ended && !nbcon_is_braille(co)))
+	if (!ssp->console_line_ended)
 		uart_console_write(port, "\n", 1, sifive_serial_console_putchar);
 	uart_console_write(port, wctxt->outbuf, wctxt->len,
 			   sifive_serial_console_putchar);
diff --git a/include/linux/console.h b/include/linux/console.h
index cb8be9ea4a767..ca4c9e60792ac 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -619,15 +619,6 @@ extern bool nbcon_allow_unsafe_takeover(void);
 extern bool nbcon_kdb_try_acquire(struct console *con,
 				  struct nbcon_write_context *wctxt);
 extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
-extern bool nbcon_write_context_is_braille(struct nbcon_write_context *wctxt);
-extern bool nbcon_braille_try_acquire(struct console *con,
-				      struct nbcon_write_context *wctxt);
-extern void nbcon_braille_release(struct nbcon_write_context *wctxt);
-
-static inline bool nbcon_is_braille(struct console *con)
-{
-	return con && (con->flags & CON_BRL);
-}
 
 /*
  * Check if the given console is currently capable and allowed to print
@@ -691,14 +682,8 @@ static inline void nbcon_reacquire_nobuf(struct nbcon_write_context *wctxt) { }
 static inline bool nbcon_kdb_try_acquire(struct console *con,
 					 struct nbcon_write_context *wctxt) { return false; }
 static inline void nbcon_kdb_release(struct nbcon_write_context *wctxt) { }
-static inline
-bool nbcon_write_context_is_braille(struct nbcon_write_context *wctxt) { return false; }
 static inline bool console_is_usable(struct console *con, short flags,
 				     bool use_atomic) { return false; }
-static inline bool nbcon_braille_try_acquire(struct console *con,
-					     struct nbcon_write_context *wctxt) { return false; }
-static inline void nbcon_braille_release(struct nbcon_write_context *wctxt) { }
-static inline bool nbcon_is_braille(struct console *con) { return false; }
 #endif
 
 extern int console_set_on_cmdline;
diff --git a/include/linux/serial_8250.h b/include/linux/serial_8250.h
index d91c0477be9d9..2a7a795e45324 100644
--- a/include/linux/serial_8250.h
+++ b/include/linux/serial_8250.h
@@ -150,20 +150,8 @@ struct uart_8250_port {
 #define LSR_SAVE_FLAGS UART_LSR_BRK_ERROR_BITS
 	u16			lsr_saved_flags;
 	u16			lsr_save_mask;
-
-	/*
-	 * Track when a console line has been fully written to the
-	 * hardware, i.e. true when the most recent byte written to
-	 * UART_TX by the console was '\n'.
-	 */
-	bool			console_line_ended;
-
-	/* Allow queuing irq_work for MSR handling */
-	bool			console_msr_work_allow;
-
 #define MSR_SAVE_FLAGS UART_MSR_ANY_DELTA
 	unsigned char		msr_saved_flags;
-	struct irq_work		console_msr_work;
 
 	struct uart_8250_dma	*dma;
 	const struct uart_8250_ops *ops;
@@ -216,8 +204,8 @@ void serial8250_tx_chars(struct uart_8250_port *up);
 unsigned int serial8250_modem_status(struct uart_8250_port *up);
 void serial8250_init_port(struct uart_8250_port *up);
 void serial8250_set_defaults(struct uart_8250_port *up);
-void serial8250_console_write(struct uart_8250_port *up,
-			      struct nbcon_write_context *wctxt, bool in_atomic);
+void serial8250_console_write(struct uart_8250_port *up, const char *s,
+			      unsigned int count);
 int serial8250_console_setup(struct uart_port *port, char *options, bool probe);
 int serial8250_console_exit(struct uart_port *port);
 
diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 5f8afaca88665..d17704fe93ae1 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1887,7 +1887,6 @@ bool nbcon_device_try_acquire(struct console *con)
 
 	memset(ctxt, 0, sizeof(*ctxt));
 	ctxt->console	= con;
-	/* Keep in sync with nbcon_braille_try_acquire(). */
 	ctxt->prio	= NBCON_PRIO_NORMAL;
 
 	if (!nbcon_context_try_acquire(ctxt, false))
@@ -2003,82 +2002,3 @@ void nbcon_kdb_release(struct nbcon_write_context *wctxt)
 	 */
 	__nbcon_atomic_flush_pending_con(ctxt->console, prb_next_reserve_seq(prb));
 }
-
-/**
- * nbcon_write_context_is_braille - Checks whether the nbcon write context
- *                                  is using Braille console
- *
- * @wctxt:	checked nbcon write context
- *
- * Return: True when the write context is associated with a Braille console.
- *	   Otherwise, return false.
- *
- * Context: Can be called in any context but only when Braille console is
- *	registered and the struct console could not disappear.
- */
-bool nbcon_write_context_is_braille(struct nbcon_write_context *wctxt)
-{
-	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
-	struct console *con = ctxt->console;
-
-	return con && con->flags & CON_BRL;
-}
-EXPORT_SYMBOL_GPL(nbcon_write_context_is_braille);
-
-/**
- * nbcon_braille_try_acquire - Try to acquire nbcon console for braille_write()
- *
- * @con:	The nbcon console to acquire
- * @wctxt:	The nbcon write context to be used on success
- *
- * Context:	braille_write() for emitting a single buffer on Braille console.
- *
- * Return:	True if the console was acquired. False otherwise.
- *
- * Braille console is not registered as a proper printk consoles. Instead,
- * it is integrated with the graphical virtual terminal.
- *
- * This function is going to synchronize the Braille write against other
- * operations on the used serial port. The port can be used also for a user
- * input but printk() won't emit the messages there directly. It means
- * the other operations will get synchronized using nbcon_device_try_acquire().
- */
-bool nbcon_braille_try_acquire(struct console *con,
-			   struct nbcon_write_context *wctxt)
-{
-	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
-	bool success;
-
-	memset(ctxt, 0, sizeof(*ctxt));
-	ctxt->console = con;
-	/* Keep in sync with nbcon_device_try_acquire(). */
-	if (panic_on_this_cpu())
-		ctxt->prio = NBCON_PRIO_PANIC;
-	else
-		ctxt->prio = NBCON_PRIO_NORMAL;
-
-	success = nbcon_context_try_acquire(ctxt, false);
-	/*
-	 * Try hard in panic, otherwise the Braille console would
-	 * miss a text on the related VT.
-	 */
-	if (panic_on_this_cpu() && !success) {
-		ctxt->allow_unsafe_takeover = true;
-		success = nbcon_context_try_acquire(ctxt, false);
-	}
-
-	return success;
-}
-
-/**
- * nbcon_braille_release - Release the nbcon console
- *
- * @wctxt:	The nbcon write context initialized by a successful
- *		nbcon_braille_try_acquire()
- */
-void nbcon_braille_release(struct nbcon_write_context *wctxt)
-{
-	struct nbcon_context *ctxt = &ACCESS_PRIVATE(wctxt, ctxt);
-
-	nbcon_context_release(ctxt);
-}
-- 
2.45.2

