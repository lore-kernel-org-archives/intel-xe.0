Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB06DCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 11:01:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7746E10E3A8;
	Mon, 17 Nov 2025 11:01:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rGWYzEGJ";
	dkim-atps=neutral
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com
 [74.125.224.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4112F10E3A9
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 11:01:15 +0000 (UTC)
Received: by mail-yx1-f43.google.com with SMTP id
 956f58d0204a3-6420c0cf4abso296374d50.1
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 03:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763377274; x=1763982074; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/RSfdrwfxNJQiZz80hQXf9twz6yOQXKrW5ZfA5HxaxE=;
 b=rGWYzEGJqEi99qHctaP87trGMrdAGuwv4GrrQXjH3cU+eAResOFjd1qo5/ugh57pLN
 /32eix5G2SniEuad4khM+xi4mkAbBnQwcnoOFxUEnebbVBRK8cjBFVkP2mGpsJF4xH7v
 40kl4fX1DNVz6LkWqGQDaJeU8ID+Y2JM2FqOQ5HzrzZJQ44rA4NlP+Fpug5M3XdUr6X1
 6lYE0UCqUTwjiONC6szlx/AHer8mzCgOBdGJq7LhX/QfFxxJDHktGefqs9UZq3B6cLMb
 ExtpH9Wu9whBjnboY8+T/HokG15TUIzP8nK3fB12na76M9Tz9XDr3tCz5k29G+hNvnoO
 ZSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763377274; x=1763982074;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/RSfdrwfxNJQiZz80hQXf9twz6yOQXKrW5ZfA5HxaxE=;
 b=Nr4Ylj7kRZiRZ4GPhhbp0gKWAswqX7ktdY3WFdHs9n9LyQAyI3TrYwi7jcefeKm+R9
 A/Tjqd3sT6LRg6IA5e8LoGC2uj05RoDwuhstLW4fk1vOZHfYVQuOuK8ntwhD29L0H2WJ
 Wfq5378k35vkDD43M2sbOenaoGRrD4tN3fooauMZrQqeJw06uP26h3uqYJtBe39pN4DX
 MGSYTXH8A9JzNioT/m+Xo61C0cFyndrXpLV61apCPAkPWgue3affTLhRAVzCiPcqxGWA
 81Uw5QDleaC2erHhvkHNu5r3tF647tvOVnJ5qU5E+Zkv29PEhJR2FIBddNBYUEAQiRZ0
 rNnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmZcppY/sJ4Lyl7DFqeimnvgrOFgTUxhFHChGeYNGv6hRudRnV1B5cZsD3nr4MqBPUVhb39UDrYA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsHm3QjtuFj4Yyb2+Q+ZS2LR9s8Sw5tqCxtpyRr5P1k/mmlid9
 uP/y0kyWLv2hLX2ulPjHhWsqAU1uFs0huoFgDpwS7yVsSs0qX+emvbQJLttKGtrdXI6Ir8KliJ2
 TmWg/ect0WvE5bq6HaG2oVBGl8NAYBaLmanwKwe70WA==
X-Gm-Gg: ASbGnctDNJUrzpZaqIr1Yu1gTYQhsb/lAAkSlI7tob0EqoG9VEVZd6URnt1GAl3JVel
 CaVHa+MMN7/sil03XT2kOR2cLAzWBhMgHFxV+9jNfAvedy8LxflVc9I3Lo5YOQ/+KrJ1/D9QttD
 aYHpnhqpaT1eeGa54Rhu7bz3c10i1udkmN3ZiCagLxv06pZZw6Nm1MGhLbHVdHgHfeIr6UAObgd
 xRVg9HnnCs7xyrpuzQtDa78AFfxwHOEjALcstN+s7YFkDDpFDDUcD2ywkNY+zVij68Fl/KggVXk
 /+8klPE=
X-Google-Smtp-Source: AGHT+IEjvegoUIWfi8UaBD0jEKwHtT+y2Cbu5UHhJ+VHUPJu6okR0AoxTFiIq+cxtmlIxdFEnLzs3e2dtieQR/hKIVs=
X-Received: by 2002:a05:690e:d86:b0:642:84a:7ba4 with SMTP id
 956f58d0204a3-642084a7c6bmr1567493d50.85.1763377273901; Mon, 17 Nov 2025
 03:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-14-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20251113150217.3030010-14-andriy.shevchenko@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Nov 2025 12:00:38 +0100
X-Gm-Features: AWmQ_bk2fwrMGKoLr3e8DW_NORum6cYwB-Ynf9Wgckyt3WUUk5QWFuYE7vXt0wM
Message-ID: <CAPDyKFotmQyHzBim-8nib-KVvQaQgA_ELbgdC_Q4Y95-GrvRSw@mail.gmail.com>
Subject: Re: [PATCH v3 13/21] mmc: mmc_test: Switch to use %ptSp
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Alex Deucher <alexander.deucher@amd.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Vitaly Lifshits <vitaly.lifshits@intel.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Calvin Owens <calvin@wbinvd.org>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Sagi Maimon <maimon.sagi@gmail.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Karan Tilak Kumar <kartilak@cisco.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Casey Schaufler <casey@schaufler-ca.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, 
 Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>,
 Max Kellermann <max.kellermann@ionos.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 openipmi-developer@lists.sourceforge.net, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
 intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vladimir Oltean <olteanv@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Rodolfo Giometti <giometti@enneenne.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>,
 Stefan Haberland <sth@linux.ibm.com>, 
 Jan Hoeppner <hoeppner@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, 
 Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 13 Nov 2025 at 16:03, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Use %ptSp instead of open coded variants to print content of
> struct timespec64 in human readable format.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/mmc/core/mmc_test.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index a74089df4547..01d1e62c2ce7 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -586,14 +586,11 @@ static void mmc_test_print_avg_rate(struct mmc_test_card *test, uint64_t bytes,
>         rate = mmc_test_rate(tot, &ts);
>         iops = mmc_test_rate(count * 100, &ts); /* I/O ops per sec x 100 */
>
> -       pr_info("%s: Transfer of %u x %u sectors (%u x %u%s KiB) took "
> -                        "%llu.%09u seconds (%u kB/s, %u KiB/s, "
> -                        "%u.%02u IOPS, sg_len %d)\n",
> -                        mmc_hostname(test->card->host), count, sectors, count,
> -                        sectors >> 1, (sectors & 1 ? ".5" : ""),
> -                        (u64)ts.tv_sec, (u32)ts.tv_nsec,
> -                        rate / 1000, rate / 1024, iops / 100, iops % 100,
> -                        test->area.sg_len);
> +       pr_info("%s: Transfer of %u x %u sectors (%u x %u%s KiB) took %ptSp seconds (%u kB/s, %u KiB/s, %u.%02u IOPS, sg_len %d)\n",
> +               mmc_hostname(test->card->host), count, sectors, count,
> +               sectors >> 1, (sectors & 1 ? ".5" : ""), &ts,
> +               rate / 1000, rate / 1024, iops / 100, iops % 100,
> +               test->area.sg_len);
>
>         mmc_test_save_transfer_result(test, count, sectors, ts, rate, iops);
>  }
> @@ -3074,10 +3071,9 @@ static int mtf_test_show(struct seq_file *sf, void *data)
>                 seq_printf(sf, "Test %d: %d\n", gr->testcase + 1, gr->result);
>
>                 list_for_each_entry(tr, &gr->tr_lst, link) {
> -                       seq_printf(sf, "%u %d %llu.%09u %u %u.%02u\n",
> -                               tr->count, tr->sectors,
> -                               (u64)tr->ts.tv_sec, (u32)tr->ts.tv_nsec,
> -                               tr->rate, tr->iops / 100, tr->iops % 100);
> +                       seq_printf(sf, "%u %d %ptSp %u %u.%02u\n",
> +                                  tr->count, tr->sectors, &tr->ts, tr->rate,
> +                                  tr->iops / 100, tr->iops % 100);
>                 }
>         }
>
> --
> 2.50.1
>
