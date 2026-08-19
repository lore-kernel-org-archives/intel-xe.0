Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E795C5B572
	for <intel-xe@archiver.kernel.org>; Wed, 19 Aug 2026 15:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1338F10E56C;
	Wed, 19 Aug 2026 15:23:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SQbxlCDL";
	dkim-atps=neutral
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1EE10E56C
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 15:23:56 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-ca88130e09aso601013a12.3
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 08:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1787153035; x=1787757835;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=V60tevbddFfWBo1AUJqlLkHLzjHgSzjesmlx3BJhNy4=;
 b=SQbxlCDLaObbEUtYL1SAlrvIVYd5vbxRkJ+04RDbwcbhpqeTANArTHNzAjZTEjsp6w
 v+M4SrD3blm6AHPSDFMTRwHD4kIy91W23QFkQhMiFBHrBK1tC5fwu0eix8TxRCGfou1R
 uafAdx1WofrY9Iam4NZ4JVoFu46DiobuHCK7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787153035; x=1787757835;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=V60tevbddFfWBo1AUJqlLkHLzjHgSzjesmlx3BJhNy4=;
 b=YT3pyvs5QkvrPmScOYEvteNACYR4sss2T3h5q6KKmc9GTG+VRhoDa5DlkrlKPzoYEX
 kwtz6NG2IHirvWft/VPkS74hfCAlF/rXz0FFIJ8tum3TYeKpMPipsTGogQu+AVaeetAm
 JYq4SJsivG0OpDowWnRkCvt1rIqU7SKFPjBffQ/loa0I1OhE6pC4Lq8LHoS1xwEGAwAf
 xZrB4gVJq5NNPLW410d63/p8BiwXAcjEAuLEbs0w/06stmZW4Q032b8VnPVVYKNgavEF
 jCJGe8LSKq+xrS+qq/gH3yv/6euE8tVSuvD0dT3BXHwKKqKbb3/wrYzqCfG+Fo9YJzEw
 wz4A==
X-Forwarded-Encrypted: i=1;
 AHgh+RpLn8PqJ7Y8hkRTQGRPDUyCPVnV3JZ3hjZGJ8aR6iyDgjQD3MsfwkXfUKH4dyBu7RH+Ettea/jITw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nnPjjLyVhyOmW72eUcY5Uu97phu83uYyjJjLLz9CjhvegHJe+p
 Jw1HueyJ4YJDzMt1yX8b67XE1Yp6MMJGbny0F7UE9UTwm2vV3GlQUdaottCATDJgrS/ID4gXGin
 0gf5Xxls=
X-Gm-Gg: AR+sD13aVVeogkj9d7ci0GSPoD1XXV1XFTbKB1bI915xwZXcJ9Hy/JGRodoy4Vj2fgu
 YOPJY7JghJioDhPfXFpcTHIHiU12Ui7Irf8KTv1Ojv7trBZnxdDy2RIyC2BoV0J1UviXI9wYqxt
 2lBpyFXzZgjPdmTHGaZ4TaGLLLtaLebD+402U3yaVCcFRIpNA2t/YtA6Ix+oaF3JrcbeH9rsgmL
 RzvnkiOVKc/zxlkAeJvYlwWiKqoeqhownYAlV4EQnOnJQ26RAb6ugv60fXiNDJINJJtAlfCsRzJ
 sMKj/wCscIoxQtW4uUZnAQrPrf/dnIDkUNO9SxbETw/H4I5tkUDkMgSTvZx/fTol+j8urT4D3qa
 wF83gGSdG0h9Y7rEhVaSOwtBKFi/DkLA2TtaElT9RKAOR13xEBLYe59diUkkEdRiL8h2z/6A7Yb
 GpCdFvIgyfYNMW26fjweQwU9W35T8sYuyvI1NZ1A0wY/JKwM6OeSdEPMHBgP7pyVdijE3MhsppC
 fdNdT4Q5BvSP+41Pz/2rMbr8W+1ZLaTeeG+DA==
X-Received: by 2002:a17:90a:fc45:b0:38f:aab1:5148 with SMTP id
 98e67ed59e1d1-3958106f758mr10769356a91.13.1787153035197; 
 Wed, 19 Aug 2026 08:23:55 -0700 (PDT)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com.
 [209.85.216.48]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3957f9ab8besm2993530a91.6.2026.08.19.08.23.51
 for <intel-xe@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 08:23:51 -0700 (PDT)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-38e58034d05so1052154a91.2
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Aug 2026 08:23:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+Rod6Zog3UE2F56UI+Yq2inU2tWrbQ0Qal/b0y70fLeJP+xy+eziQam0RekoTDixFS0VuscDehFSkw==@lists.freedesktop.org
X-Received: by 2002:a17:90a:f94f:b0:37f:fdc8:71b4 with SMTP id
 98e67ed59e1d1-39580840397mr10513690a91.2.1787153030497; Wed, 19 Aug 2026
 08:23:50 -0700 (PDT)
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
 <aoWHKmz17HQo2uy5@gsse-cloud1.jf.intel.com>
 <CAHk-=wjv7SCjtg6JGDabGMXdqobx+WHogHfQeMPF2g_HmAU5qg@mail.gmail.com>
In-Reply-To: <CAHk-=wjv7SCjtg6JGDabGMXdqobx+WHogHfQeMPF2g_HmAU5qg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Aug 2026 08:23:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whskfzdWdUs3NwYm+e9py91xdiG5mLfYf=g_6QLpdaP4g@mail.gmail.com>
X-Gm-Features: AcwNN1VK8xm2EEhJ71tHkaXSYqe2wNMVKK0IEd-4YCwbEX0AGK9JHqpkPEveNyc
Message-ID: <CAHk-=whskfzdWdUs3NwYm+e9py91xdiG5mLfYf=g_6QLpdaP4g@mail.gmail.com>
Subject: Re: drm: xe: Kernel-submitted job timed out
To: Matthew Brost <matthew.brost@intel.com>
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

On Wed, 19 Aug 2026 at 07:46, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> With the standard Fedora 44 kernel, it also hung, although at a
> slightly different point.

I take that back. It hangs at the same point.

I realize that it says

  GuC firmware: xe/bmg_guc_70.bin
  GuC version: 70.72.1 (wanted 70.54.0)

but that bmg_guc_70.bin is the newest version in F44:

    intel-gpu-firmware-20260810-1.fc44.noarch

which is just a few days old according to that name.

              Linus
