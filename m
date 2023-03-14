Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF693C74A4B
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 15:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C964410E14E;
	Tue, 14 Mar 2023 15:32:31 +0000 (UTC)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098E110E14E
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 15:32:30 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id t11so20548746lfr.1
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678807948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnvQ0p3FacrKTsSbHXwy8LVLyAed6Qs5UU1vJRJKw7o=;
 b=WGmlmpKMv6rf760iDfJ5b7kjI4STQHRvA5hNQr4ffEQSZrxobgH9bJUO9AfBNasCO1
 bWbRy19uRCxBUSYqx8YS6X9bRzMJB2KH9zTBr1HlqRd0dzwuNb8kMsIeBi7NRVQYLh76
 nUvLjJN2VLRXm+K3JnOtKzJEqOGEQzKov/uRRVZBA5nNmNJZEkrifa10n3FrNKDVuikZ
 EF9Dj90zRZc8ANUeKwFqW6xb4pxyfOXeSY6plaE4YKQY/xNtzvTYv8oy9nnKer2vsctt
 3sDRbyMxPp+HnHWeXJAlrRK7uDDNu5/yLacperk43r3lRVgRwG5lR/Z0gAJS86ZTSOge
 L6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807948;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnvQ0p3FacrKTsSbHXwy8LVLyAed6Qs5UU1vJRJKw7o=;
 b=J1paj3Y7/IPaDsATPNpk1dDZeHebrVMfLFqeOHnl24Og7EqpfTBsVgU7akXAhc9IcW
 f3iYsJAN/9s9+ruWQA29gIVuLMFH3Xz1DAICFIv5wZeNMlaohKJakTOrIBScuL30FpI/
 tkjQziQAfhswARpokeIZoPwBjH2HikqVZTaLKatCGvxx7JZUYB/WSIkLiW4oQHnR3N/f
 HgcTu46gEkgXOsvIdClWxF0BkO3rAIxyBJrkEyJo4T/wbWkDhaOkK6Ttd1Y8MU+dx4XX
 6YWgfKd9I9lr+b5xa+yW/s6YkgECWF6VnQMSOooLNPKxcyxFVH4uxwV2EHQ9Kcnt0K0h
 o/sw==
X-Gm-Message-State: AO0yUKV4FuHgfkf+foCpZAJqQQQRLtcxWwQ8ZAjux6vXPoqn14nDE64o
 3Ap5CdRuoGB9PRk7pbSqMUl6lwnmC9fwNt2AJvfyMvttUHY=
X-Google-Smtp-Source: AK7set/wxWgD+t2CXk9HO+5E4+Id4HNL/7HYArOshPWhwF+C0Y9wijUs5XCgEb36K0LReKJ9BM1rCNcpLep7LRTWPaA=
X-Received: by 2002:ac2:5923:0:b0:4db:2554:93a6 with SMTP id
 v3-20020ac25923000000b004db255493a6mr892912lfi.10.1678807948184; Tue, 14 Mar
 2023 08:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230313204519.158888-1-thomas.hellstrom@linux.intel.com>
 <20230313204519.158888-5-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230313204519.158888-5-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 14 Mar 2023 15:32:00 +0000
Message-ID: <CAM0jSHOKZqU6rQ0PWQKhRR-a4mYE69z0K6v=f5h6353yW3U4+w@mail.gmail.com>
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH 4/6] drm/xe: Introduce xe_engine_is_idle()
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
> Introduce xe_engine_is_idle, and replace the static function in
> xe_migrate.c.
> The latter had two flaws. First the seqno =3D=3D 1 test might return a fa=
lse
> true value each time the seqno counter wrapped, Second, the
> cur_seqno =3D=3D next_seqno test would never return true.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
