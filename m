Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EB8606A31F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 15:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqfS20MT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C28410EF07;
	Mon, 23 Nov 2026 15:17:50 +0000 (UTC)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com
 [74.125.82.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA7C10E10E
 for <intel-xe@lists.freedesktop.org>; Sat, 21 Nov 2026 00:42:35 +0000 (UTC)
Received: by mail-dy1-f179.google.com with SMTP id
 5a478bee46e88-3863db981d4so1435102eec.0
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795221754; x=1795826554; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Js5N6yiXwXXSTzZ4KgFGwIMSCZDX/tKTz1lwaDrh2ys=;
 b=zqfS20MT0914sQHBxb3s+KK25oDU0yA6OrbG+VlIKSZ3CGHeWEjrxP4cAUf6MYO62j
 C+iIVGoBn4vX0KUV9bJ7Hu5IFl10iGHrmytysTVTIgcNHuzel7YQnzxLUYuJPXQF1FJr
 s+RwEG28o9yYsdFqwACqsJ0yzmOxMMEee9CN+xeQZxeciuVY4UZb2d2HDtmRJFDLVgi7
 gyyeCdmrn5EXnVD5EhXXpTLrmdMoXWR1vAVyoIzwFIr3nbRXmPwz9A8a3SYDJifaBglX
 BTBtHzLEm/UaJ3fNkSOwAD/pFz1D2uYDixgOw3M6jUsohnOg/9xLj8pOTRoOO2BlPhen
 QFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795221754; x=1795826554;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=Js5N6yiXwXXSTzZ4KgFGwIMSCZDX/tKTz1lwaDrh2ys=;
 b=v5YqxGLXqpOBdTe6XUJ534OPenC1yRKOHrtPpcA0EtFLfu5xlnxAlFneALS/AFRqE0
 Wc6H2t0UsWXuK5i6ecFS5J0gI+9ws4d3qS9rVMHiXnnr772j7aNPfDXT23O+McUAY2Xd
 ZTPWgderl5v0tMQB9/4pZXhf5gkcaTTdGhxt49Km1E0rdpDWt8PGoBuXgmi8NNuIpYBM
 CUA1m+3d+4HjRTR/v9o3YZ1SNdyFUildf9s4GQoaJ79pVJPR5NUOMeOzyk7f5rB1Mmq6
 40dpjnucI1E8r4xjrBzuWFH0/Ol7EUU1VZ6O6KzAhbRx3k12glVtt84OYtKm2rGGqcSl
 AaqA==
X-Forwarded-Encrypted: i=1;
 AL+hErGiYjQmvM3H4rSCg1nw9zqfbVx0ziui3tWa0sjKC0LRZQhb1uPEiLH/W9N/Y6HfztvmjLu47qi0og==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+9HiCRqMUCmSe4oeJTHVGNAUvEuxkshW5YnPhNV1VsUpLiRfeI
 dv/TlX0fZ/OlNlLmtPE5KukSDPbTriWCS/XE1zi8ImMehffv2fncDjwN
X-Gm-Gg: AZFdTZc2NUH9U0WYDXUpq/iARnugFlDiDgfs8Rq6LlBVKEjQmvMzkUKWN2fmXcS5dLo
 6sMryZbqD2OuQ8ZHVzKqxmDs4OtVyknHkf18NfewXzHsZ9vmVk96lkxcz3ClqBUVaek0zRUz54U
 XDZ1lwthev5VBr5WBQMEP+xqL2Qj7/JxZ9LFw8Gc0cJY744XsoNeOH12IMW+NlVr0ysSBktAUXY
 nfurZDZKzdxiuHP0fH77Dqb/7JPWpGPqB3seELxTg0tums+1Sa7SoxOCm34q72b6nJUqDI9UrRe
 JzCyTisHWR73jM7cebZvBcuJJ5mAq15luaVS3t3GaQHyhNAVrV1LXQ3Gg6mQY3jr9z3SBSRQHNz
 KZkcL/sfSUxCSccLnh3mhxXWWhBJPyU3AMQ7L6b7O3vJ2tf6rVQmQdjxPCilPb0pDrDxXkzbrZ/
 /vBK990CVG4zPfc1Y4e5+cDLpkMgt+lpSu6JW5EPb5OYt7Z4JcVel8rPz7Ns1n2PzwkY1A4NfD3
 wTnH0OusZONgn94eQ48mY/ZdXVjw6MBGFr0CBGWd5E7IR6zgJil97NxWPcQlK6j4X6N1eiEbG0Y
 jyizjuYwRjUEgyZBSA2N5x3AVo0zOudXZQ==
X-Received: by 2002:a05:693c:4091:b0:379:4197:5eef with SMTP id
 5a478bee46e88-3856f65b3cfmr5387027eec.8.1795221754060; 
 Fri, 20 Nov 2026 16:42:34 -0800 (PST)
Received: from localhost ([2408:840d:6820:1a1b:6def:d896:8796:4938])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38567da4f85sm12699706eec.27.2026.11.20.16.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 16:42:33 -0800 (PST)
Date: Sat, 21 Nov 2026 08:42:28 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Yao Yuan <yaoyuan@linux.alibaba.com>, Alex Williamson <alex@shazbot.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 David Lechner <dlechner@baylibre.com>, 
 Armin Wolf <W_Armin@gmx.de>, Thierry Reding <thierry.reding@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Karl Mehltretter <kmehltretter@gmail.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, 
 Borislav Petkov <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
 Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
 Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
 Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-trace-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Yishai Hadas <yishaih@nvidia.com>, Longfang Liu <liulongfang@huawei.com>, 
 Ankit Agrawal <ankita@nvidia.com>, Brett Creeley <brett.creeley@amd.com>, 
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>, 
 Julian Ruess <julianr@linux.ibm.com>, Nipun Gupta <nipun.gupta@amd.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Eric Auger <eric.auger@redhat.com>, 
 Mostafa Saleh <smostafa@google.com>, Pranjal Shrivastava <praan@google.com>, 
 Ioana Ciornei <ioana.ciornei@nxp.com>, qat-linux@intel.com,
 virtualization@lists.linux.dev, 
 intel-xe@lists.freedesktop.org, kvm@vger.kernel.org
Subject: Re: [PATCH] vfio: Allow untainted use of driver_override
Message-ID: <awDok7Sm5Dgp-Ty-@sapienza>
References: <DMYH4ED3GWDO.29DGXPK4M82VR@kernel.org>
 <20261118235645.2907908-2-alex@shazbot.org>
 <xzp5gljhburzbpol5bgnyyzwdrgpw3fj6ff3j23ein27raiidw@kti7moeuwvb5>
 <awBUG7-QzXplEiUT@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awBUG7-QzXplEiUT@monoceros>
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:28 +0000
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
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 20, 2026 at 03:10:38PM +0100, Uwe Kleine-König wrote:
> On Fri, Nov 20, 2026 at 10:17:46AM +0800, Yao Yuan wrote:
> > On Wed, Nov 18, 2026 at 04:56:44PM +0800, Alex Williamson wrote:
> > > Driver overrides are the standard mechanism for binding vfio drivers
> > > to devices.  With the introduction of the support_driver_override flag
> > > in the core driver struct, it's now required for drivers to declare
> > > themselves as driver_override compatible, otherwise driver_override
> > > bindings will be denied or generate a kernel taint.
> > >
> >
> > Hi Alex,
> >
> > > Set the support_driver_override flag on the driver struct across all
> > > vfio drivers.
> >
> > LGTM.
> >
> > Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
>

Hi Uwe,

> I missed your reply when I sent the next revision of this patch. I had

Thanks for your reminder, no big deal to me.
Let me follow your link to have a look on v2 there :-)

> to trim the recipients of the v2 because gmail refused to send it with
> everyone on Cc: who was emitted by get_maintainer.pl. So please see
> https://lore.kernel.org/kvm/fb0df5c89336b77a373ae0f890f63427e4adbb28.1795171088.git.u.kleine-koenig@baylibre.com
>
> But also note, that if v2 is picked up using `b4 am`, your Reviewed-by:
> is considered as the patch didn't change.


>
> Best regards
> Uwe
