Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D261FC44536
	for <intel-xe@archiver.kernel.org>; Thu, 22 Jan 2026 05:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047F510E149;
	Thu, 22 Jan 2026 05:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N5+miDRn";
	dkim-atps=neutral
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36C410E07C
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Jan 2026 05:26:56 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8c69ffb226eso81744985a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:26:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769059615; cv=none;
 d=google.com; s=arc-20240605;
 b=Y7AAt2PeBH+nMGZpc8lriX5TPKjy190sgQpzVLQpkV03Ya2mM2cSeAGN0LCQysIi6B
 rd8aeET4RsLQKAxYXJb3Gh2hfUKzKdczMovaQ64+iHyg4O5M+8rHi5vry9zvwRgZl7nK
 anfdWHhD4ktV/E5wKBUnfwu2GKwULGVXOeO6NrOr6OqwivqBU06hQzc3eUKn15tSDMzf
 sFGJDBQl04ME2y4LXQHZ756bb05HVLDpX4ecx3CB7sFiClUY5iqWUZPOGVVHba7De7Y0
 lMh+1mNl+O3dY4lzTMRn2ZtJXn6QsTMj6xpBxkgsWZ61OWiWWEFBrCMUv06SvLOYr/vI
 RbPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fBla1J9dueqeZqv+IKTvLuoBDmXhHc5I5EAmZqUprIo=;
 fh=tM/NTOEp/sZxa2foyB59tf9IjXjICDLOm5enyeL4s3A=;
 b=HxeKH33rHXdVBXcfFv/88o8W0vP+V9ht4yB4ght3VnG9sxBySOgLD0iSq1vcturqnw
 QedmXIIyJZo90xEd1wRlpPtpjEIeaxoY77LZwekVsMaA6wxPI/anxZ1vC/M5xWAfSoeN
 bpHbU1mXjvHHp/JVa78WhOtYDbsV5jCWxIlGouA/mCto35qlISLbi8Otc8m4AgD8VcM0
 oYzIDPhihUpKtnX1vfKZSSRyqeg3Ml3+y5VYpRdIJodJsnXkFFkHGJLE7NthAuB5N1xA
 25/dEXACdS19VhOeMg9QXPWX5I/kQ9N0KPv3fHRMVt8PzzRiT5v22ECkPUftqKFX64l0
 4ZZA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769059615; x=1769664415; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fBla1J9dueqeZqv+IKTvLuoBDmXhHc5I5EAmZqUprIo=;
 b=N5+miDRnIbO2kJWioFuKBnGJzeXbR0SrYApLYYXK408/6kF8yCtgXhVLC2hRNt6rWx
 wH5CWhvnuoqDT4KV+1Lm9E5esBXCMOmsr9eoCeE9KyTg4jMlubsZUTKh087juuEv12D7
 4QTDEPbNcruaDiniMRxWid7GdU8pU8MEu+N/EV0oxLx/Fj07gloAY+HsAJe59EVgu6zf
 ZlBORGdRIBf03knVTQI4clfhL1GdkCBC3EnjwXd/1808f2aStoTB1i/+piGkzjraofHc
 wxDsVp0SXMI7+Y/pQP4jqTZT/52yO7Mc70IrK0UNki73zYBVbCXwxsdkyZsFZ4RZgkP6
 ukaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769059615; x=1769664415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBla1J9dueqeZqv+IKTvLuoBDmXhHc5I5EAmZqUprIo=;
 b=YwtlL/Uz4RhMLtIsTu7msqicybEg66qbaRgiqP+eX4cEkXkpY/NPFa15GfYfK7mJcT
 VVgycfvrFFUfMubpWiMGMQU1R91a4nxvXtWKRQ65gh91/nWJa+rTce7NxvpaPBVTrBks
 gRCqyxLv1fZfw7AecJJFVKYsE/+TNSGXIxkpULZXuMUv9LckQYL+cM+jWZ196kTqEB9O
 aJbg6cz3U63HcMgJqNsF8ainfQwrMpCTI/HvGJPlpqEGfFknf9ssNzsMF5BCChSwaHOX
 UVtR2Z/9GHkyekd7iQp83pJ+bR0YdJnaBWswqL8X1u9F4khe8MQ+D34/N5vhZbKV3HDJ
 Atsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzAearFCc3PAGv8GW5lJ4stCcfGG9Savpi2EpXG4jJGFPXJj44OsASGAVIQpCbeygr9yzY3HikfA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywu/vXpvLuptAoNoRmg8yCdfmYgSv48/gnNJL0fJVuuJqipZdBk
 tYo1We4MbeusxZHafq6TRaew7hwrmAsXaNhBsdf8ZMDIFL1t6LwEpLKmiVp+EfJb8RG0JtNciEe
 XZQXi0f6vrbjmR/+XPCQf5OAvvPkUalA=
X-Gm-Gg: AZuq6aI6B6YgS8q4/sQXl6Vhf26YPq4vuXYgDSnZQPxQptfxAvvbcURE0bKp/1LXIou
 Z/fJTwSnHNOAna6GwVEvCHv2Q8wsKu9K05gx3rzzoBVsNOrZoKq4x169J7dcEqytGbie6YafDEj
 zOxGotaVZwRWDzBpM5P32xUSXJzLm4MRwurKQxyaD845ULsOcJ/qE6oYA3yfrEhiRzlUo97DiyF
 DXP2wE/en0euBM1LH6XU8YdOk9zWRISBx/2NDgeYZ4VQBTCJXgk114OdCxLXwrHdA9adfilpf+3
 Qe1IjIsnmw2SEODPRn+MO8TvmklM80cU6lMryV5ahUVKbvesu1hhce9ilqqdn03qAw==
X-Received: by 2002:a05:620a:46a2:b0:854:442a:f568 with SMTP id
 af79cd13be357-8c6a6944d59mr2795593685a.43.1769059615381; Wed, 21 Jan 2026
 21:26:55 -0800 (PST)
MIME-Version: 1.0
References: <aWkNThVRSkGAfUVv@intel.com> <aXDgaporPS3I6T4J@intel.com>
In-Reply-To: <aXDgaporPS3I6T4J@intel.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 22 Jan 2026 15:26:42 +1000
X-Gm-Features: AZwV_Qhm-U17H0bkhJqLuJLvX10NZw20MoPnZ2d0NLMam21ljZjcsyaU1GyUslw
Message-ID: <CAPM=9tx-3UWevjzbJyDTGzQ=WR3KvVDU8M2xqek39fs4zJZhnw@mail.gmail.com>
Subject: Re: [PULL] drm-intel-next
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dim-tools@lists.freedesktop.org
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

On Thu, 22 Jan 2026 at 00:19, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> On Thu, Jan 15, 2026 at 10:52:46AM -0500, Rodrigo Vivi wrote:
> > Hi Dave and Sima,
> >
> > Here goes our likely last drm-intel-next PR towards 7.0.
> >
> > Thanks,
> > Rodrigo.
> >
> > drm-intel-next-2026-01-15:
>
> Dave, Sima, anything wrong with this one?
>
> I noticed this was not picked up yet.

It should be in drm-next?

commit 9d10cd526111a989eb353c3a4df9d4c79695ea8d
Merge: 37b812b7fdc2 d30f75d2dba9
Author: Dave Airlie <airlied@redhat.com>
Date:   Fri Jan 16 12:57:20 2026 +1000

    Merge tag 'drm-intel-next-2026-01-15' of
https://gitlab.freedesktop.org/drm/i915/kernel into drm-next

    Beyond Display:
     - Make 'guc_hw_reg_state' static as it isn't exported (Ben)
     - Fix doc build on mei related interface header (Jani)

    Display related:
     - Fix ggtt fb alignment on Xe display (Tvrtko)
     - More display clean-up towards deduplication and full separation (Jani)
     - Use the consolidated HDMI tables (Suraj)
     - Account for DSC slice overhead (Ankit)
     - Prepare GVT for display modularization (Ankit, Jani)
     - Enable/Disable DC balance along with VRR DSB (Mitul, Ville)
     - Protection against unsupported modes in LT PHY (Suraj)
     - Display W/a addition and fixes (Gustavo)
     - Fix many SPDX identifier comments (Ankit)
     - Incorporate Xe3_LPD changes for CD2X divider (Gustavo)
     - Clean up link BW/DSC slice config computation (Imre)

    Signed-off-by: Dave Airlie <airlied@redhat.com>

    From: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Link: https://patch.msgid.link/aWkNThVRSkGAfUVv@intel.com


Dave.
