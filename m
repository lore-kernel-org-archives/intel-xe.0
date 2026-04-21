Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274D7F327B1
	for <intel-xe@archiver.kernel.org>; Tue, 21 Apr 2026 06:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E133410E7EA;
	Tue, 21 Apr 2026 06:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="GG49rlbU";
	dkim-atps=neutral
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD2E10E7F5
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Apr 2026 06:45:27 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-12c8cc7a77eso1209566c88.1
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Apr 2026 23:45:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776753927; cv=none;
 d=google.com; s=arc-20240605;
 b=ePhKb5A3IPleVL1cBfer3QtGklFgNhnsa1e69VGue8uxykkcfX14fhQcQagmhruU2k
 NM57UpMPqOJjIo7SCkdgscbOywlqj6UnsTsBDtgt0ikhbOVTsNrJPRjmexisAj4OfS7W
 lM4vi42i5y24kJs5ihF33gQI4zUv9eYvv1nTdCKGzbXOerH8xwDa/SCEqF+3mquly/W2
 sThnU8J5WE7+2hL/zxJL6K162F7hsKftN4pQYhgeyyiBfkcypbQZhTz9z/Q1z+iZm94d
 45XGo0bzoY9iqFk3b41nhaMTuu6kSAc2yeGcfHFh2yJX2yew6MIaMR/i1NuyjZa/ujgT
 I6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=2kOeojKcaj/EwTY7GyYNrTRVTHflluA95rwy8A5+dVo=;
 fh=RrjLVNLUI/H8bWD06sKzRrKFSF6Z5uSPtNG+WPRukXk=;
 b=PcIoyhdbj9Q86MZYWApZbRGLGIeDwRr3S83P2kEk7AG/XvKJQ6RbOKj7xL5+quBkfU
 W8s4uPKMstaqotQoSaHY6RtbfUk+NSyTyOXshANSD48PFOx0DJ7tvwzirgmbq5dGhnXU
 dNjrNk8EJHhrPL1wENZ0GzXyb96Mr4vObhwKM8dmJ7DmXH+WxqouhWQttB9KQNzvI1up
 /+7Hx8U9U5fuimeEui0eBYKnz69S0xmNQH8jgqRbdYib9xDi3KTKAGuxtXYp3sh+iERV
 gXLgcFrli3GkPSZlAQJ7R877cahHavGI92R5M5nBecH5Pn9O/4IKhaxgh0Pcuw9J7YJt
 VZNA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776753927; x=1777358727;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2kOeojKcaj/EwTY7GyYNrTRVTHflluA95rwy8A5+dVo=;
 b=GG49rlbUsmQa7EguWWB0//njducauesgKr7hmIsrRgxrk9VSt//dtRn+imPmlY858j
 TCq+h7ZZLvIzFcobesl4kG/9df6kD60D0M6k6fccb+LlxP4HQ7GrI0BLQnhVSd2JHogN
 wL/IDWgqXR6hBEbyZhO2i1mU1YfB9Ymz/w+XZgld4qgqQyBT1sXIEJzmyepELxAUJoww
 Bq9dl2YUVhCEJYaJxROpzYmXqhspWf3aAtUwmK4OKd3ahTQ9pVTYAZ3gUGVBTd2pjoDO
 /MDQ4yPfJE0cilVQCkL/AQvX90d5jx148Dj+oFKpB7Ndha5PhZp3BbFwJ0MQj6MMYXT5
 GMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776753927; x=1777358727;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2kOeojKcaj/EwTY7GyYNrTRVTHflluA95rwy8A5+dVo=;
 b=Y4hxsLMtR1+85F0/LaBulLeIz/1NkprxTVJEw4+cpIhyE+zK2dH2MwnHKH1kOoP4Ck
 +H3cwvIt1xhlkwPm5Uz7XaMSM0ERAIaPnkKBfqRVelqX+NFUEhUN+D89+hnt1Ftbzy31
 FGRC5JM269LG0Ljba4pZppW/AXDO5oT9xHukGTiqsirPz24D+X6+CuWVm0gJu3fIsY2L
 SPGiGdQDzk0KTbd9WzkjF+0rRMOG6dPPOXq1W4O0BD8EcnDBcF2qccX7OJRFGfGeYkLf
 5hwZEKmZuIQh/rxCzqq5l53t90FynFIKrneVDGB4tEJIlwpKl1OGK0YHYgB8VunCUok4
 Tu0Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Bctlzw3YBeMRTWI9B8SZhVPhD4kWVgtWrgv0zVSfbTs2fLc8yw7nRj4RqXG4CISx8G+F4gREaPA==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwePITli+uC/2xUOpgtdg4LCoDFByxEuDx7ANaLf06xmiV/80wR
 gt+/TZjSMwQ6qVIvpNyulZ8tLGb24UaAjjEPwyp7AJ6rugE9tqjW5b2cl6MOb2X27/MhvRi3Gz+
 BP1HiERnZNp/fVvSG2+AwShSWSaBVIzz5871mnl0=
X-Gm-Gg: AeBDievJjvwBwgU9NEMuXiEa4gdS/ukS9AOGW3EQ2Zs7gUAkIxJy9/tlZyHVAVxeYtE
 69heyiXS840yQ0AQj4SGm7K3b/qemF+JGOknXvPG6aBH8dRqR4PlSz+nTj9UiKOCZiv5o8t7KxU
 YuPTwArLI3ytuwrYmP8eFlT0J9IZ0Yrh7DX2zz2sVuNFclznYjY/fHIFHlQxKLe+TPutHR4/2wq
 xt12jWPxh+y+mundlIkiQuN+f1Dg4Pu5QOv432F5VXreycu4kyFkqzMwuveTx84Wj2k6Ehb8ivQ
 1huFPRXrFiR/ZUz9+qgbTgz/Z8xCkIRvF3uRfc+28nv9xf1nPvag26XoyA==
X-Received: by 2002:a05:7022:423:b0:12d:b2ad:fded with SMTP id
 a92af1059eb24-12db2adff6cmr715143c88.10.1776753925997; Mon, 20 Apr 2026
 23:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <af005996-05e9-4336-8450-d14ca652ba5d@intel.com>
 <20260327163100.GL3738010@noisy.programming.kicks-ass.net>
 <20260327164353.GM3739106@noisy.programming.kicks-ass.net>
 <df391df3-3a3b-4a65-b3c7-ffe3ab50ee83@intel.com>
 <20260330195037.GW2872@noisy.programming.kicks-ass.net>
 <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
In-Reply-To: <20260420130318.GD3102924@noisy.programming.kicks-ass.net>
From: John Stultz <jstultz@google.com>
Date: Mon, 20 Apr 2026 23:45:12 -0700
X-Gm-Features: AQROBzC7sYC8u1apFvewiWwTXVpQJW6VmrDu78ol2n6JMrUhSWiPWbDmqRj15Kk
Message-ID: <CANDhNCq=oizzud3hH3oqGzTrcjB8OwGeineJ3mwZuGdDWG8fRQ@mail.gmail.com>
Subject: Re: Regression on linux-next (next-20260324 )
To: Peter Zijlstra <peterz@infradead.org>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 willy@infradead.org, linux-kernel@vger.kernel.org, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, "Saarinen,
 Jani" <jani.saarinen@intel.com>, 
 ravitejax.veesam@intel.com, K Prateek Nayak <kprateek.nayak@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 20, 2026 at 6:03=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Mar 30, 2026 at 09:50:37PM +0200, Peter Zijlstra wrote:
> > On Mon, Mar 30, 2026 at 01:56:33PM +0530, Borah, Chaitanya Kumar wrote:
> > > > diff --git a/kernel/locking/ww_mutex.h b/kernel/locking/ww_mutex.h
> > > > index b1834ab7e782..bb8b410779d4 100644
> > > > --- a/kernel/locking/ww_mutex.h
> > > > +++ b/kernel/locking/ww_mutex.h
> > > > @@ -42,7 +42,7 @@ __ww_waiter_last(struct mutex *lock)
> > > >           struct mutex_waiter *w =3D lock->first_waiter;
> > > >           if (w)
> > > > -         w =3D list_prev_entry(w, list);
> > > > +         w =3D __ww_waiter_prev(lock, w);
> > > >           return w;
> > > >   }
> > > Thank you for the response, Peter. Unfortunately, the issue is still =
seen
> > > with this change.
> >
> > Bah, indeed. Looking at this after the weekend I see that it's actually
> > wrong.
> >
> > But I haven't yet had a new idea. I don't suppose there is a relatively
> > easy way to reproduce this issue outside of your CI robot?
> >
> > My current working thesis is that since this is graphics, this is
> > ww_mutex related. I'll go over this code once more...

So I tripped over this in my own testing today preping proxy patches,
bisecting it down to the same problematic commit 25500ba7e77c
("locking/mutex: Remove the list_head from struct mutex").

Inteed it does seem related to ww_mutexes, as I can pretty easily
reproduce it with defconfig + CONFIG_WW_MUTEX_SELFTEST=3Dy  using
qemu-system-x86

Where the test will basically hang on bootup.

> Since you've not provided a reproducer, can I ask you to try the below?
>

Unfortunately that patch doesn't seem to sort it (see the same
behavior).  I'm about cooked for tonight so I'll have to look more
closely tomorrow.

thanks
-john
