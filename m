Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B194CF54AB8
	for <intel-xe@archiver.kernel.org>; Tue, 24 Mar 2026 13:32:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235210E6D4;
	Tue, 24 Mar 2026 13:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B8dok5KG";
	dkim-atps=neutral
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A1E10E164
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 17:42:59 +0000 (UTC)
Received: by mail-dl1-f45.google.com with SMTP id
 a92af1059eb24-12a6b260693so279957c88.2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 10:42:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774287778; cv=none;
 d=google.com; s=arc-20240605;
 b=HRegvqsfC3i/gTIUFzoX7L5Rsph+yBGpc4P+bx7sumRKMPdI17sazZEVrSAiOsi2lU
 KkCt5NU6OBIauI9DR77dOXxH9JpK/qtEVQC3sXTyxZ3LCpVnzIrBfBGmzvJzZiyibrQE
 weeuBjsw+ev6v4r9NDZ7Wq7oSMJQOoUakhUAB1ln1TeBu6GsrZUdTGJ4N0dLKv3N8hhb
 ZZvJHRr62ukVOfVmtlSCjsOIcUczgq4e5sNdbosO4MhtxYqTTQ4b5TvtN5s7uhXRGnKg
 Fp2TndNi/TTWnXcg8wY7tjdApgmokMH/yDci3gtlioQIXaWMUKeDRH5w3E8+1qCLlF+u
 /OZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
 fh=5Bp/iNBac0D5lIFWbFgsnme6R9KkmuBIJP5lP2bRFZ8=;
 b=NUqRMuFjjTt/4pL5dUe1L+x+UXLU1sYlNaI60vILGcE/DZuC7DrQdn1X+HpU559mtN
 NVUjfDzJlT8EIZJ7CtG48IJ6s8j/b7Gx1nRarXV6JlGK1AvayuoSc3Sq6I3xomjUrQQb
 Uye00dNzPFxu+fvzXr3QFGYkDW+6MDyHylXvNSZ3T0dYfCOZQHE7X/QfJODuq/yrG56U
 w8nYQFvOmHb3qYJLxMaacsF+It2F9PUs36W1unUygiXDbmxdVNVJdxsHbwRPB20Hzkx/
 qG2Dx09q/+mn+TEMovkXpJLdlZsgakxtYAtAvL9jbksv/mUm9WfWt5YuJ3quLShTrjJ8
 aWjQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774287778; x=1774892578; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
 b=B8dok5KGhi3VJDHLXB09uQF250/MX6qSRC6DE4RRlXxese01grmMsPJ33bLhaHEsYi
 NnIQhHPh/Sw0rFFwyZBvn4FB5C4kJhTG/epKLTgMpjjel/Cd05/pZcXHEpW1SSdOmA1s
 4ElfEBHHptBJStKKvWkbQWIHU1m3YE5fvtBjUfetW74FDbFayndHuNzGKSREj3fR6gnk
 OpUaeo1Dlhi8SQAxuqfEvnufyudPhPADDHkKimpsbUGTkvLoODSmclMdFgNWNBWRRGPt
 CYJ29l3XCcICAFMs36X2A7U+pYlMh+6v6trTGHKfLRmJvSm9XSa79wM5DBvNX00on/LW
 XGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774287778; x=1774892578;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CunB0afxvU/gEx3rEbTE4vI3pmEepGsuyogimCbubLY=;
 b=a/Ac7A2evNY5a+88UdmG4/Lp57IXOtx3ikHqTV5jDLLOFXuY4lI+BDIEUQ2QQQE7+U
 7rf5TeVO434px+Er6fVUcp34CqeEID4oZi8JBbwY+bVe2l5hn3C+cwGzSHsLQ5MohonU
 UkM1gfkeHbFQfu4ic0+KaB1MIBijC7NCLv/hhUbk58zAheWCYRqf70oeZH0BzemPxGwY
 cclN7kTSKnmz8mJhYpjxwmQJUPkHbvY289M7VzAf58fMEv6zdW1I0CP41anSPht/hghB
 9INZopc6M2i38o9AXoMy5fYSB8krbRCn/v2K64gEGBSuAZvemmzKbMGR7hbJGhOdOXZ4
 v4Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW35nwLmtLeNudJARomoC4+6k5rFCFSdsgMyxANLnlM3QLG+lIIgpUYgGGcAP6VpFF63XmRsmOFTA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9DCWodBc4pN3jd6QRSa7jSKtzkodyaV6g+LjXTp8sDxSl3hOE
 7ttYUS192yji7AuNhPR2ZIdbWp4Q+LncZ1hgKbhjTVkM3vSCOYYMTCuCoD0oni+4h1tD+CkgvO3
 nLA+IaVmAgtSVLS8lCsmPM2g0DgUWolU=
X-Gm-Gg: ATEYQzxPM868ppr2JD+rAt1P36knSB/ha+EpEU5BCCV0hnZqkqsle7C7CUNPgwXfq6E
 aGbgya6AOLkDyEV3UiDXFIIsl5JlnwS+R6lT+0A1X5gIYB9krSCMucyg2Vn23ZG7SAD7MHiWt8x
 nz38YYz/MQwWA6AfW2Q5yuvOa4FymEz/yFS5MboKNQoGM+04V18BSWYVSdT3POmxztBrZzKIEqn
 l7XtJd1f7y2+hBDRnUgiRZudU6R9sCtVCQ2TsY357dW0vlEdZMQYkp6/uhHC3I3YiDl5HOcCtMC
 TRlRrDs8pwcglYcwJQn3INghK3bEVppTKZkTuQKSbOCWhsKTak0d3zFeo0fJ17REzDA4NHg0iNk
 M+NkSeNKg9f4ae6LzjYS/mdo=
X-Received: by 2002:a05:7300:d709:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2c109563bbdmr2193158eec.1.1774287778207; Mon, 23 Mar 2026
 10:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com>
 <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
 <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com>
 <CANiq72=Y2g_5=iEzU1L07pMPYD+wVapJXpp9rvYXEzCKEs59Zw@mail.gmail.com>
 <abkQTEcRujrFLsdn@lstrano-desk.jf.intel.com>
 <CANiq72=gHArzFS=SkiZyPpEfSL+0AcU3ifKRnwfEyet42662PA@mail.gmail.com>
 <acF41mM66Gh7m4vS@lstrano-desk.jf.intel.com>
In-Reply-To: <acF41mM66Gh7m4vS@lstrano-desk.jf.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 18:42:44 +0100
X-Gm-Features: AQROBzDKSGfCowA5deNWr-GZ-_NHP2AiqkVwZir4qy3OHPmJLmEcG1YCXbf5NSg
Message-ID: <CANiq72n6aAARCm0_k1gQqKDxOL-MSbP1=M-inbdMSJN8tPn20Q@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
 Jeffrey Vander Stoep <jeffv@google.com>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Stone <daniels@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 John Hubbard <jhubbard@nvidia.com>, shashanks@nvidia.com, jajones@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
 rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 24 Mar 2026 13:32:46 +0000
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

On Mon, Mar 23, 2026 at 6:31=E2=80=AFPM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> I appologize here I shouldn't type when I get annoyed. This the 2nd
> comment that pointing out difference between C and Rust which really
> wasn't direction I have hoping this thread would take.

No worries, it happens to everyone from time to time.

Thanks!

Cheers,
Miguel
