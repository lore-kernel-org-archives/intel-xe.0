Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8617AC5DF88
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 03:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E8810E27B;
	Fri, 21 Aug 2026 03:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UJhwzt+j";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BE410E27B
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 03:51:04 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-c2020421077so92127266b.3
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787284263; x=1787889063;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=f2GYSCwkuP4SKTO+kMUObbL8oCnO5Szbm9F7xR8yMhY=;
 b=UJhwzt+j6ERcuW1SEgzQACUJCUZUhRnZ3mzQyHuqtw7RnuYa4AqzKDTAUL/du0xfNV
 MV3PSwbjemGPpAXGLVj0t/WcS4b9SErN9yanBvz/hkmgcMM055GqMyn4AAwCGdEMcSSr
 9CchBFn356+QI4cnglgHqntlFCtyTDnLXmIZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787284263; x=1787889063;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=f2GYSCwkuP4SKTO+kMUObbL8oCnO5Szbm9F7xR8yMhY=;
 b=ibuw+1lWb+zuUFdD4hWGOEbmGELpTU7TDh26JSwY6ablKT3JX3dR88a9x9Sr6iIbQd
 vHCHJgeSKIZrlrcPq5u++8U3dB9YvnHW5MCUbC59vhEqEz+p6sDwenb55zX7u2LOyHK0
 HdSaa32KL1dJGLTYP110MzyKdkvtqN+dgsagWeuHRR2+Kg1IR7vKh/m1TUGp85tNAkcW
 oBa5ant97pSZQQLqTc6Rp0o2DAvUlUrB9FJqzORqkudvK7+2nSXzm+X9QASEikDX9F+3
 3x7rdZe7gh04d2D0Rb4kZ1AadCUbLif5l7uzm3z27bI5v+6+kIpjRw4ysWMSRPPr1lpH
 31Bg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrkPneexfaQiL6Q4eps2l4o1SlkUEGxrmphYDR7HRHWQMwyzQSbEyAX7+53fmSX1S2DA04pEgNoGw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXZchfDnwGUXNB1byylhxmgS4Xg/e02ZF9+CPAX+YVKMDKCWQ+
 SlNLEGmMEOIUwPtd0GJdm1wiokGaaec9QY7sC+tnkhlnCWpd9DG7wx5yoiCExfJwjmFdkTV8Oz2
 NM26aBIX3HQ==
X-Gm-Gg: AR+sD13ms/M4smS8T5Wfq1YqCvOO66lk4tC50dOAQSkgReeoIB+7tMRgd2oc2Ktjd7s
 aE81iQhpz+ABHID17AUweF9FXagFgH7AI0i2/pfsJGxqqVASEzDrNgeBqOr9+gCSYZyvCNyD5lB
 ciJeagytI//NQbUC5fpWjaOSaPV2TFr/kP3QDIBUhamyuOSMmQENxZp/CJrwgCblUvNmyCWVqhz
 CFpBvjRNAdV2O2l57JyZfzmxNLlJ+qSsiy1KoPSb/j7mQJA9HFVT/IkSFdcdjoa4qgTQs8uXkyq
 SvOFmT1jUPM0y692G7vOUYL716ga+1dLOQbNhA//WkLo1/FKWe9e9Rpbba3jyJKlxZEPm/m8Xsx
 xLdK8NhIywZD2Ks6YSRBOxVYc1bWrc7ARZt4yFIbMkjhkeKHSlQI3R4itu7is46qucULQch9Hoz
 AwmEwX40RHoURUrr+fNtWyjc7harLT7mDXnIo0BzEx++AaWHm35XcFIMrJOzecTuXeaEby53dL0
 xSdBhWBkzcCxE7cxkg/b3RsHaE48dLAHU6ckA==
X-Received: by 2002:a17:907:6b0d:b0:c24:6505:8f66 with SMTP id
 a640c23a62f3a-c246a693337mr369849866b.13.1787284262963; 
 Thu, 20 Aug 2026 20:51:02 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2459198d59sm248696266b.35.2026.08.20.20.51.01
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 20:51:01 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c1712a04ddaso91666766b.2
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Aug 2026 20:51:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RoIvCB/BBWC7Hb1xlEFyAcjj4sRAeLQFtD4K0FimWg8byd78qp5XixbnjbNMPVdmMrpuNFH0FXogw==@lists.freedesktop.org
X-Received: by 2002:a17:907:d64a:b0:c1c:4e36:eec6 with SMTP id
 a640c23a62f3a-c246a728577mr322970066b.18.1787284261126; Thu, 20 Aug 2026
 20:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=whiv=b+dAvjaZDsZkfUEzjZMSSLExDOWVcbJ0exsCj6_Q@mail.gmail.com>
 <6874536d-ab1a-4dd7-a23f-2a071bda145e@lankhorst.se>
 <CAHk-=wj5aE1yVMb8RM2AuNUHSMnQDaGT+Vy+At5ds1vxBA+Kng@mail.gmail.com>
 <ahDAErDSE-SFA0oM@intel.com>
 <CAHk-=whX59mtUnU2ayMWoDQX6Ee2NXLK2NxQ+dZnb-Qc_mF1hw@mail.gmail.com>
 <af9278d3-4002-4e09-9bcf-bc75d1cf8145@lankhorst.se>
 <CAADWXX-pfvA3mKWSjdahnihAXHQB2VP9BOJDCXonG3Q_nxurLg@mail.gmail.com>
 <anYZ8nUFP5dnRy/h@gsse-cloud1.jf.intel.com>
 <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
In-Reply-To: <CAHk-=whyk2-u_1bTh5ZTeX6jW3HgAtjJh0mV_oWtgsqCe=3w7g@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Aug 2026 20:50:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjJJH-1q6TK45=z0poSE92mp77JLsF3jHeWXibEtJu7EQ@mail.gmail.com>
X-Gm-Features: AcwNN1U_3QIbtj0n8gohWgZzrSIAiCGi0r0JsQODOTr5FIeO--VUUHcQcS8xh_A
Message-ID: <CAHk-=wjJJH-1q6TK45=z0poSE92mp77JLsF3jHeWXibEtJu7EQ@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, 
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Lucas De Marchi <demarchi@kernel.org>
Cc: Maarten Lankhorst <dev@lankhorst.se>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, 
 dri-devel <dri-devel@lists.freedesktop.org>
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

On Tue, 18 Aug 2026 at 23:55, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> It turns out that now I can generate those drm job timedout issues at will.
>
> [  +1.222075] xe 0000:4b:00.0: [drm] Tile0: GT0: Engine reset:

Ok. I've spent all day today on chasing this down in between merge
window work, since it finally *was* repeatable.

And the fix ends up being basically a one-liner, even if the debug
session to get there was not.

The Xe driver takes the memory address used for the memory stolen for
CCS, and rounds it up to the nearest 128kB area.

And that is very VERY wrong, because it means that the xe driver will
then *use* that part of memory that wasn't at a 128kB boundary. And
the HW engine will too and write to it.

And when that memory happens ot be used for GPU page tables, very bad
things happen.

I bet this also explains some occasional random screen corruption I've
seen - when the memory isn't used for something as important as a page
table, it "only" corrupts random bitmap memory and the like.

I committed the fix as commit 818bebeb63dd ("drm/xe: Don't hand out
the flat CCS storage as usable VRAM").

Adding some people from commit 37173392741c ("drm/xe/vram: fix ccs
offset calculation") to the cc, because that's where the problem came
from. Two years ago. I'm not sure why it became so repeatable for me
now, but some user space behavior change clearly triggered it now
pretty much every single boot.

                 Linus
