Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223F9C6FD1F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:47:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0201310E833;
	Tue, 14 Mar 2023 15:47:11 +0000 (UTC)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DFA10E833
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:47:08 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id y14so16478336ljq.4
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678808826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JSLJDHwxIuPnyHBTWjf/lMusibFvtmeweriurg7ON4U=;
 b=b1VmU7BKgkDiq4JcRM1bnb9BwYoz7np4jWIp3YWkQGCMSR+1VcvOUeul7njb6Rpmtp
 dxLd6zqTdQwNIB9Oy153vNFSxNwdcNsWYVJfp5kY9KrQU9Das527CTr95felQVNrCMfp
 zDpIY9pPZXz9c8DbQMmccEFlAgMHT0ot3XJP56pb6heXGvfKv5b5gAr7Brh+vcRt3Bze
 i5vj0qTxQub1dydpOJiSytpcwofOZycUjYyEd7BIGjkqgHo3qjgrpEHb+gAS96UwfAGF
 TQcTdwyJjVcujp7y0/f9+9i3uOYHq9HNuVTxwCYhH5JEGAzojzXbTIYHH8BieNwWZ4kE
 N87w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808826;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSLJDHwxIuPnyHBTWjf/lMusibFvtmeweriurg7ON4U=;
 b=1t/sf8PuZ5HCiKweDtbLrlNJhlP3/bvpkn28dob913U+8548twqE/D4rn8/BTamsmv
 dbRw8B8SKdiKbDWTHkhCIT0cUOxtxtkSxsNVhhDXlLCryJqULHqx5oO/QTAEFvIXTH8n
 Ou9Ba7WTjS/uYO5P9kXf/JGku1wHHb78ayCN+/tHT+q1uo6g1Gd0/752rKmDZUxD8q8K
 Be67jsZqMRM6x8MSu7e3PXS9Oi5hPau5Jsbzhs2aSYcZ/6OVzJTbBXvOO/1gcMpnqTwM
 JiLmdeXg3r0qRJPPsKA523no9SJFjLx8V+/At+H5IQ7j/FGOmS/PiORYMxhkxdny990G
 6ngQ==
X-Gm-Message-State: AO0yUKWE3YUPqRs+ZLCrYoJfOe47kAqitM0bdye1sl6NDqg4sOWy/Zpp
 Uc/9kKvG1J1bmWlnF1KL2uGWla2Oq0k/1RieFGPnvWjA+bw=
X-Google-Smtp-Source: AK7set89/OlTiaEeK1IKCJnCp0npLL8eoymxCsZ3G4mv891LLDUmhSsbnnv4hzwrhDMs/Pfhv+2ph2S/3X5DlYp2z2w=
X-Received: by 2002:a05:651c:124e:b0:295:c458:da98 with SMTP id
 h14-20020a05651c124e00b00295c458da98mr12007600ljh.5.1678808826733; Tue, 14
 Mar 2023 08:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-6-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230313204519.158888-6-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 15:46:39 +0000
Message-ID: <CAM0jSHODM0x52f+Vs304vVoEPNPTk_QxGUiQiKbtfYL94+KGwg@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 5/6] drm/xe: Use a small negative initial
 seqno
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, 13 Mar 2023 at 20:46, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> Causes an early 32-bit wrap and may thus help CI catch wrapping errors
> that may otherwise not show early enough.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
