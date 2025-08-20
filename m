Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2A1CA0FE1
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041C10E37A;
	Thu, 21 Aug 2025 13:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="HuH7pQCv";
	dkim-atps=neutral
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com
 [209.85.210.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7AC10E7F6
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 21:18:19 +0000 (UTC)
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-76e2e9a98b4so257489b3a.1
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 14:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1755724699; x=1756329499;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:user-agent
 :references:mime-version:in-reply-to:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P2sI+EmkGPgxhQKQRdeihx9n+/PXLkEt2V+3lWG3atQ=;
 b=HuH7pQCvAQjipSTdMQw246z00VUFQYJh70Fj08IcYvvhmgr/WZpjfNSAGEXtXzTU1Y
 iYf3G7Is3E6obyM+dquciy+VLzCg/m0cw4lsfo2JSxC+Kx4TMiTPVg5uy1+4xu7ZHrrA
 ujeMRuzJGpYtp5ja5KmwRYxn9NvPSkQ3OE9tkMNQ/nAiPeB4vn9LruMvmE41F8q+M9Bk
 CQg41v0NclScuVUwC6p8VtWURiOWuYwZiS+nMMM3ng6wA7dhXgCrhMap4U5LL3O34JjO
 jAiQ1pKa4/EjGpMwxUgyuWCxldYUrtfP4JJ0teYuG7add8JN33liV/CIKsPP9FoHM66K
 fpHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755724699; x=1756329499;
 h=content-transfer-encoding:cc:to:from:subject:message-id:user-agent
 :references:mime-version:in-reply-to:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P2sI+EmkGPgxhQKQRdeihx9n+/PXLkEt2V+3lWG3atQ=;
 b=ukAsuGm86sia3LGIGbAU7Gfdfw4iKQUU4NirGOHEy+WkLS2ETAojUwbMEnz1EFaG6e
 +nLsKtq+XQCW3cb27cBuHWMRyP6nTya5Qoq3cr2HdmauEOkLJeyeyV939Ovtm7U1OSAq
 4eb09zO3rJPUNFiD5I4EBaDU2QU3hOKsPx168TqECsBn0fJ7G0g1A7VALqYqxZ12DP1I
 rEzg6YmuBrIFFKpEJU3PhVncdSs5M0RTDirMVS3y2ZvTpBAYXUa65NuJmmXXcYBqc8iM
 6mVbAzZFbdOYWbrHyXyews+EQWqHac8NYrCfV0Ix75MtGoiB+//ja0hHnxNBEXFQVIZd
 sezA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkI+I2ogRHsmcn+RFGiaHr7i8K2isiu3u3T+9MOIdbvgEUz7n7PHkMgG9SjrzBzfF/fTEhY2BvWg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnHgjwVcsO6halalJg4T6Zx7oVeLBGmRgp2jOJLXyKY1goqIN2
 +YPqq0ED+qrjf2yOVIyvz+wUOSec+3J1NYF6gNU33iQwtxaQvQ9sK8DT8N95/4a7R0UGP+x//YR
 +/qfWNSO6kA==
X-Google-Smtp-Source: AGHT+IGfZP+wKkOwbvIAFQDDRrNs531sY6ekAT/1sq8Dm++Un59KxoImN/CEr2ujCu8EtL5kcx22ioHf3ZVg
X-Received: from pfbhc8.prod.google.com ([2002:a05:6a00:6508:b0:76e:7044:f5e6])
 (user=ynaffit job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2a8:b0:76e:8bb8:b1b8
 with SMTP id d2e1a72fcca58-76ea303345fmr42111b3a.7.1755724699067; Wed, 20 Aug
 2025 14:18:19 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:18:17 -0700
In-Reply-To: <20250820201612.2549797-1-cmllamas@google.com> (via kernel-team's
 message of "Wed, 20 Aug 2025 20:16:11 +0000")
Mime-Version: 1.0
References: <20250820201612.2549797-1-cmllamas@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Message-ID: <dbx8a53t7kva.fsf@ynaffit-alt.c.googlers.com>
Subject: Re: [PATCH] drm/xe: replace basename() with portable strrchr()
From: Tiffany Yang <ynaffit@google.com>
To: "'Carlos Llamas' via kernel-team" <kernel-team@android.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, 
 "=?utf-8?Q?Thomas_Hellstr?= =?utf-8?Q?=C3=B6m?="
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Matt Atwood <matthew.s.atwood@intel.com>, Carlos Llamas <cmllamas@google.com>, 
 linux-kernel@vger.kernel.org, 
 "open list:INTEL DRM XE DRIVER (Lunar Lake and newer)"
 <intel-xe@lists.freedesktop.org>, 
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Thu, 21 Aug 2025 13:06:33 +0000
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

IidDYXJsb3MgTGxhbWFzJyB2aWEga2VybmVsLXRlYW0iIDxrZXJuZWwtdGVhbUBhbmRyb2lkLmNv
bT4gd3JpdGVzOg0KDQo+IENvbW1pdCBiMGEyZWU1NTY3YWIgKCJkcm0veGU6IHByZXBhcmUgeGVf
Z2VuX3dhX29vYiB0byBiZSBtdWx0aS11c2UiKQ0KPiBpbnRyb2R1Y2VkIGEgY2FsbCB0byBiYXNl
bmFtZSgpLiBUaGUgR05VIHZlcnNpb24gb2YgdGhpcyBmdW5jdGlvbiBpcyBub3QNCj4gcG9ydGFi
bGUgYW5kIGZhaWxzIHRvIGJ1aWxkIHdpdGggYWx0ZXJuYXRpdmUgbGliYyBpbXBsZW1lbnRhdGlv
bnMgbGlrZQ0KPiBtdXNsIG9yIGJpb25pYy4gVGhpcyBjYXVzZXMgdGhlIGZvbGxvd2luZyBidWls
ZCBlcnJvcjoNCg0KPiAgICBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ2VuX3dhX29vYi5jOjEzMDox
MjogZXJyb3I6IGFzc2lnbm1lbnQgdG8g4oCYY29uc3QgIA0KPiBjaGFyICrigJkgZnJvbSDigJhp
bnTigJkgbWFrZXMgcG9pbnRlciBmcm9tIGludGVnZXIgd2l0aG91dCBhIGNhc3QgIA0KPiBbLVdp
bnQtY29udmVyc2lvbl0NCj4gICAgICAxMzAgfCAgICAgICAgIGZuID0gYmFzZW5hbWUoZm4pOw0K
PiAgICAgICAgICB8ICAgICAgICAgICAgXg0KDQo+IFdoaWxlIGEgUE9TSVggdmVyc2lvbiBvZiBi
YXNlbmFtZSgpIGNvdWxkIGJlIHVzZWQsIGl0IHdvdWxkIHJlcXVpcmUgYQ0KPiBzZXBhcmF0ZSBo
ZWFkZXIgcGx1cyB0aGUgYmVoYXZpb3IgZGlmZmVycyBmcm9tIEdOVSB2ZXJzaW9uIGluIHRoYXQg
aXQNCj4gbWlnaHQgbW9kaWZ5IGl0cyBhcmd1bWVudC4gTm90IGdyZWF0Lg0KDQo+IEluc3RlYWQg
cmVwbGFjZSBiYXNlbmFtZSgpIHdpdGggYSBzdHJyY2hyKCkgYmFzZWQgaW1wbGVtZW50YXRpb24g
d2hpY2gNCj4gcHJvdmlkZXMgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eSBhbmQgYXZvaWQgcG9ydGFi
aWxpdHkgaXNzdWVzLg0KDQpOaXQ6IHMvYXZvaWQvYXZvaWRzLiBPdGhlciB0aGFuIHRoYXQsDQoN
Cg0KPiBGaXhlczogYjBhMmVlNTU2N2FiICgiZHJtL3hlOiBwcmVwYXJlIHhlX2dlbl93YV9vb2Ig
dG8gYmUgbXVsdGktdXNlIikNCj4gU2lnbmVkLW9mZi1ieTogQ2FybG9zIExsYW1hcyA8Y21sbGFt
YXNAZ29vZ2xlLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dlbl93YV9v
b2IuYyB8IDQgKysrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCg0KDQpSZXZpZXdlZC1ieTogVGlmZmFueSBZYW5nIDx5bmFmZml0QGdvb2dsZS5j
b20+DQoNCi0tIA0KVGlmZmFueSBZLiBZYW5nDQo=
