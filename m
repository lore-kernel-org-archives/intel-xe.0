Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 944C5106B50B
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 11:58:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5428D10E872;
	Wed, 25 Mar 2026 11:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f29pzRfd";
	dkim-atps=neutral
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5552910E126
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 22:48:28 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-7991db3dc98so24396487b3.0
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Mar 2026 15:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774392507; cv=none;
 d=google.com; s=arc-20240605;
 b=cG5UnrbwkNFKhY4LmXen1KObvVq/GfccvIf5kD0NXIWuBIumzWGt7v08HM02KJASiI
 wh4VCrIN4k34DU0PuFce30Y+IJX22mp46xnnp7KX/0RMbIwoxI6oot2+MbYxQy7t9YDR
 zv69VHc9jqLvE+ckzMTJgAkHv4Xb5OenvcvZXaB5aBkh+T7yBUh5OKnXWiQjjHCovyLY
 ADqr/f9Vrqwi9HCdBsIzXkT/3xDuoG3Oah1zOoFHwgSbiAPXb06+SE8YaIOg9YRXYAZZ
 q4nTSlz5QjoDDnj1snjSd8PiiR2fGsqIcIVlPECVrAYB/zh9cfzYZ1bXXliWDTePNk9U
 Gvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=aPz6miKOAJJVcB1GUFq3GLhMrDyf3o3Mtbj+mJunm7c=;
 fh=KI183z17QFrB7gr+BosZHCVpsXahkbYMao/L4DqFgDk=;
 b=kCsKBFOOIshYRJ2klU6lMnPYMHZZ7KwMtpdQMQzo7y579/AyZrm4jtzVkfbhMBHd02
 aHB4SjRQD8K46Mkq+G8kNzOLz8kwWT7scpzJJM3jUDvu1b3AujRWFVc5PjUpckgJ+D0i
 /K9EZknyUR8nfY4epjaGN3GSwsvosFmK4j08CKpWpc0zk0OA2gqNpg5c+qCUlMjyrsmR
 HWY6SG5LE6z29dH9qjKqh3eKrO4LztO/Gsi9Y7bfqV0zf+6S7f045rg7sXxslI+t7oxj
 YOlFQGS6Lj1ZYr+ktrYVpKBBAwHgFuf7Bcu4oubUyQKBksmsqPfxbRww1BILYJCcQIIh
 pB+A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774392507; x=1774997307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aPz6miKOAJJVcB1GUFq3GLhMrDyf3o3Mtbj+mJunm7c=;
 b=f29pzRfd6SoDxxvdB/iUEETW0nJMaisWKpvcaLnf0axp9r0KhwIrsSRgc3UqS29twl
 NphrPQR7MtZCAGmryRkiQZz2QjWaZ79V/WGxbmdiVUvwMIjFM/iYN5Sxl58uPAmBy7Ld
 hTAPcwJlQ7lqeVN6RSkZg/B6V8ldRChgnUq8qQDsYrkA2wqBALhBcqz71iLgkF/IDpSQ
 VDToFBckmDxijKrI9EGDck5tyZUKyMnAASnkJKdy1H2MQpYW7KKFCiu0jXu/Nq5+E/BA
 csz16jwsXyjgxi08JY6QX0qT2ejZdEW1qsnsQaOb7PbVNpjw11MkxArREpCzDW2WJ4fm
 voqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774392507; x=1774997307;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aPz6miKOAJJVcB1GUFq3GLhMrDyf3o3Mtbj+mJunm7c=;
 b=jJpg894iKqUreg8Ax0184j5yDxnsq3yXmo+HCIjGzi/0i1NkZ3mAoufSaAc5HhKPq9
 rotd/utCkz/Sb8AtEWDH6GrTrwx7pU7/VqTdFqHN0qqONY3NC+GQyRdv7DqKPTcRWWcR
 2vQkXMiNl6hl09BqcygdvLgH8kiv91RG++OMCZXjmQ2xnllLcHpK8DQIuLLHyFX6tgDH
 mMkzRlN2wYYYFU0HZdx4a3TO5H9WX7csDhsqNAvyT6j8aByKr/YiU4KUzW9jrjfnBXIX
 suyWwiFo3W14U8h7QoRcVvH4DLUc6SQH4WgMyKEzbNzQ28UdbZpkjs0hpn9j971X0IWw
 sw4w==
X-Gm-Message-State: AOJu0YxlAT7SXC+M02l7PRrmGI8a1kBS3ajob8KrNI6+4qu/Te+qUxbe
 XtZOfpmi63z/t3HXC8Kp8btfqak0K0PTkbQwv+7AIL5OU+ER+sTxebwvxjLUoN9mt8TGndlymTm
 adzwi+QhdJeqCfYtDS6thz1TDvUHyH2mGXrvs
X-Gm-Gg: ATEYQzwl1oMrKc94+oazQ2Nizp1fYUr6gdmpX8YVIhXVkFkuGNzBKKDJXbMATsUC1aV
 vRy7QNsQ36r2T/qP3EWFAGYnkQ9B6XguxavV6tpaK9bC+GIhi6W5UNfo25sYGPrJMuqPfWDM4oG
 U4lLG5S2rzVy86LjkFqJHGJqmg1yjDVOlAZbvmBQSu/nqoFxkmmAzLv2qaE6pq0F3beBVWM70Tz
 ueL5h/+1ihy/gAneMs5ZYswaNQ2iEKJnLcSlsth70nYOwa/g/kOQlc4YDRUWKTj9RQDlxQ0558Q
 gEP+EOZHN6nwt76PawR/q0Ekva2/lMCI7m8OGv1MZe234Z7eXJkyviFCXBdj/+wt7ma8GY7Kn/C
 HPg==
X-Received: by 2002:a05:690c:6283:b0:79a:b824:ccbb with SMTP id
 00721157ae682-79acf6b3d88mr15774177b3.42.1774392506843; Tue, 24 Mar 2026
 15:48:26 -0700 (PDT)
MIME-Version: 1.0
From: Nick LeRoy <leroy.nick@gmail.com>
Date: Tue, 24 Mar 2026 17:48:16 -0500
X-Gm-Features: AaiRm51awg0FQfPjkqYxddT5Ts5FLw0JPyQIAzmHtz-PgScG2yX-LxW7xLGApOI
Message-ID: <CAOfPCV-FBwk3A-rxoR_n_VBE-eUV6hJMfjXNO-HXkUrWmPhn=g@mail.gmail.com>
Subject: Build errors on 6.12.77 with CONFIG_DRM_XE_DEBUG=y
To: intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Wed, 25 Mar 2026 11:58:07 +0000
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

Building 6.12.77 with gcc-15 on openSUSE Leap 15.6 fails if
CONFIG_DRM_XE_DEBUG is set.  I suspect that a couple of source files
are missing from a commit?

Thanks,

-Nick

/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c: In function
=E2=80=98ct_dead_capture=E2=80=99:
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c:1829:24:
error: implicit declaration of function =E2=80=98xe_guc_log_snapshot_captur=
e=E2=80=99;
did you mean =E2=80=98xe_guc_ct_snapshot_capture=E2=80=99?
[-Wimplicit-function-declaration]
 1829 |         snapshot_log =3D xe_guc_log_snapshot_capture(&guc->log, tru=
e);
      |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                        xe_guc_ct_snapshot_capture
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c:1829:22:
error: assignment to =E2=80=98struct xe_guc_log_snapshot *=E2=80=99 from =
=E2=80=98int=E2=80=99 makes
pointer from integer without a cast [-Wint-conversion]
 1829 |         snapshot_log =3D xe_guc_log_snapshot_capture(&guc->log, tru=
e);
      |                      ^
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c:1836:17:
error: implicit declaration of function =E2=80=98xe_guc_log_snapshot_free=
=E2=80=99;
did you mean =E2=80=98xe_guc_ct_snapshot_free=E2=80=99?
[-Wimplicit-function-declaration]
 1836 |                 xe_guc_log_snapshot_free(snapshot_log);
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~
      |                 xe_guc_ct_snapshot_free
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c: In function
=E2=80=98ct_dead_print=E2=80=99:
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c:1855:33:
error: implicit declaration of function =E2=80=98drm_line_printer=E2=80=99;=
 did you
mean =E2=80=98drm_info_printer=E2=80=99? [-Wimplicit-function-declaration]
 1855 |         struct drm_printer lp =3D drm_line_printer(&ip,
"Capture", ++g_count);
      |                                 ^~~~~~~~~~~~~~~~
      |                                 drm_info_printer
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c:1855:33:
error: invalid initializer
/nfs/sources/linux-stable/drivers/gpu/drm/xe/xe_guc_ct.c:1872:9:
error: implicit declaration of function =E2=80=98xe_guc_log_snapshot_print=
=E2=80=99;
did you mean =E2=80=98xe_guc_ct_snapshot_print=E2=80=99?
[-Wimplicit-function-declaration]
 1872 |         xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
      |         xe_guc_ct_snapshot_print
make[7]: *** [/nfs/sources/linux-stable/scripts/Makefile.build:229:
drivers/gpu/drm/xe/xe_guc_ct.o] Error 1
