Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D7EE7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 08:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB8D10EF31;
	Fri, 13 Dec 2024 08:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="Qrny3f+i";
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC01710EF31
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 08:05:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3f249f3b2so1857704a12.3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 00:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1734077150; x=1734681950; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lgwYE8AkKohlShjZLrwteb4c+nimfkWQZUupQYO5W68=;
 b=Qrny3f+iKFiqDyOb/8dDJ/AFdJ7F8OYMFNw2GC6HVEqTIJM3VTdLX9bGKMBKLoltdF
 hBMonnBwplrMomw1zNZkEKAFP82A+y96HZqfeI4J2ma5ihdgGyAgemaFAWCzqEYfnMJl
 20pO4s+01y4c5jKLudAK1nMmdAf/sbk3fOJTz0cFDVhySSp+ivGX2NJNHMpXTBqUjHuK
 R3GlnQtW/6YLAvvZ2uqq9ZM5U2K0JujaFDgKdF8PKzpiiOi6ma6kJhjgDwUGnSLSIY+S
 XkrEk07Aiug2a76S9/uK/kj5JJFU1ZWFxw2Zjen+9PFLJkUvR4HgHCYs3kUZRzyX707K
 Q7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734077150; x=1734681950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lgwYE8AkKohlShjZLrwteb4c+nimfkWQZUupQYO5W68=;
 b=pgB17MikB9tdylNAQLp9FP6PmK7FPbPvsk6C5ucbDwlQp4APd66nlCY31Tsj5J6gBH
 WboYi0U1m1decBWg1xkWpxsPz6umHvEcMylT3d4z7pLfQKA5aHUIW13idcwukKu++Sk1
 5jynDZj/IMp8Emb9L8s2T9EgvoBKdZeG7RU3eggcxqs75vWSI2PyiCugxbSxnuaAf2j0
 yRHdjpyMBlaAPh/eGMDb9duZMzP0Fh1z+Qrx7nMHXqSlscCaMvAUcT2EuoxAHyMmvFaj
 hP4gokgfiohFrgnslf/5uWha6VNsqvgnwPB+nwzjQ5UhErQjQCPRJM5IBn9TQtARt5Lp
 Y5FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWg4vZBc1Y95ETg6KWieiPWGJXkBB6XhFyn2o9iB9DmTsGk7BYJqqUCeGU7iJVvQbBBPmgR+nnoQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyea5ZY0KAn5qUiq2nWN7xNW+TMM8L6/LH5nBM68fZDQqTjm5Jz
 SuKd4odhd+lBAEJbq0zcwU0iMJE8nvUW/RxmtmW9NgnEMg0y381h0nPyyLD4ESg=
X-Gm-Gg: ASbGncvA+XuyhRt/+84i4gDKA9tgbj5Aq2bBaL63XjEDg3YfxjX3heM2Bq/bEFCPRYs
 MjVwMFotlm1aH93Qu1X6TMiRfgdn9bqQrF06A8fvKWj2oGRgwrR8WpKt4Ed3ZeeCNvO80gk/iaw
 0el85RxZZvWsXTLlWYrF8rPghNTeD9x5BY+xjLt5Oxx3tiTDb4TTNsFwXfQ324AOJxpy07cyb8m
 qhCHtqW2IOby3q6ifNh6tpNLQrFUR/uEm5xJoD4hhGnQx4FsMFHv/B5cQ==
X-Google-Smtp-Source: AGHT+IEBU3KaEVduDDJFmDiYKp43p4o//mXEFM4u7vCzKG7h47JoeDZ5E1DdrcH3VOsdWE+nfKrYuQ==
X-Received: by 2002:a05:6402:4584:b0:5d0:ea4f:972f with SMTP id
 4fb4d7f45d1cf-5d63c318beemr3590523a12.8.1734077150211; 
 Fri, 13 Dec 2024 00:05:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.50])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3ef026a41sm7507030a12.15.2024.12.13.00.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 00:05:49 -0800 (PST)
Date: Fri, 13 Dec 2024 09:05:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: torvalds@linux-foundation.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 x86@kernel.org, linux-snps-arc@lists.infradead.org,
 linux-wireless@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, ocfs2-devel@lists.linux.dev,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
Message-ID: <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
References: <20241213054610.55843-1-laoar.shao@gmail.com>
 <20241213054610.55843-2-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213054610.55843-2-laoar.shao@gmail.com>
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

On Fri 2024-12-13 13:46:04, Yafang Shao wrote:
> Since the task->comm is guaranteed to be NUL-ternimated, we can print it
> directly. Add a new vsnprintf format specifier "%pTN" to print task comm,
> where 'p' represents the task Pointer, 'T' stands for Task, and 'N' denots
> Name. With this abstraction, the user no longer needs to care about
> retrieving task name.

What is the advantage, please?

Honestly, I believe that the meaning of

	printk("%s\n", task->comm);

is much more clear than using a cryptic %pXYZ modifier:

	printk("%pTN\n", task);


The %pXYZ modifiers makes sense only when the formatting of the printed
information needs some processing. But this is a plain string.
IMHO, it is not worth it. In fact, I believe that it is a
counter productive.

Best Regards,
Petr
