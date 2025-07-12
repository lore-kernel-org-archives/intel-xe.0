Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C931C83F2D
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 16:15:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4E110E4DB;
	Mon, 14 Jul 2025 16:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N9oFHhe/";
	dkim-atps=neutral
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33E310E079
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Jul 2025 08:49:55 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-553b6a349ccso3445187e87.0
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Jul 2025 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752310194; x=1752914994; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=S1whD4nkO0m5CHT4bFf53jfHHh1dkvhz0MK4Q1CMinY=;
 b=N9oFHhe//4KTKVqYpDkjl839o+O0P/wSV0zymwti/e+5jra3FkJAM/eRFgoRbH0SHC
 xKWhjM2c2PaPQQIdjP7nGXGWDleotw5ARSf1fOSG9OD+MElDXeZrJVjFrq9qw3QqcadB
 N14gYl/4Ako9U8mMaiOaoHp4Un6/7EdKofHxytff3jkefNPEuD7WmkxI+aoVqVfVYW9V
 SfkE1N3i0pX5FV3xMEn3kXVWO5lvGd+GWQJl0ijHIsiGusQ9+1mUBHwMghNCJWAddHw3
 nOmcX9AbkTsvOFKyeid73OxxkDaGCIWJBmigwS35gSXOlJ4ODctck4CkGQdo6IqU2L7m
 Ki6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752310194; x=1752914994;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=S1whD4nkO0m5CHT4bFf53jfHHh1dkvhz0MK4Q1CMinY=;
 b=dleh4pM0cPdgFCQ29qQ+trF5XjdF6y6DLVKATS3l8jbPjTRJIw3PX+gP4NfhhGHODm
 YrhOXmv6Y0H3/qFWHd6YwNKVGU00+REBgDPs0HkTAILyji39ijm6OODCrMZGbjZS9uwL
 EaUw15RbG3rEdbw8qmhJxdmDi6baLNAm/cvvNvPaOEhwfBDi4LRt3MGW0JYvvG2kYan1
 nPjmSxkdQ/aUa22qtNH7xk2SQnuRbA2Q2a1XW15X0YQhyuIv7Wya2cGj3GTNfu9+qmiL
 /ZRtCkdjXOnr3QbS1aYXdPxKlW0jp+5ZGlnEnqFSvb8SDubl9K4ttLpnMZVa5XByu8Th
 /kuQ==
X-Gm-Message-State: AOJu0YySRg7Pp/LuVhkm9kBDU33CLjg0i4EUGsrBjDc1XM+Sq8nUotdy
 CTaSadWC6VyoaC0iri+jsucJqsauUsRElMGGQVky/BYXThFvhc0qOLlVzO+MEKk5wJIYv5dDtwt
 ma9Hdlff52+u/8dDKHDjCvUZ2MGeL/K46nFgETKU=
X-Gm-Gg: ASbGncsgicfexUcAknSJMRnz5xJDCaBVyr9gNiqZkIr2Vdg/LqbFixOf8iRvG2FwW/B
 SYIUva8+5SvbQyTtmqbQ04xhXIsWsyCfG8WdgGljqy/B1Csq6RKB2z3aCCJpPdm6y4gTg9Bz304
 14Ifrs9S+PABAsJ+iwd5tL2gRvVgbNyo2bYq+IZuH1r3OaTU0QkLCtLwJZrlZiBXRZPRHZrbkAw
 gKgBjtFeA==
X-Google-Smtp-Source: AGHT+IHI3G2qZ+C17Nkj3rW0HaCbTLToIfIqdb7v8/q/1fpngD1udummX574saY2xNWk7V3KgOXpw5oSfvlTLvAQuOU=
X-Received: by 2002:a05:6512:3f07:b0:54f:c6b0:4b67 with SMTP id
 2adb3069b0e04-55a0448b707mr2196513e87.4.1752310193680; Sat, 12 Jul 2025
 01:49:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6022:c123:b0:72:1ec4:5125 with HTTP; Sat, 12 Jul 2025
 01:49:53 -0700 (PDT)
From: Alex Crow <anonymix777@gmail.com>
Date: Sat, 12 Jul 2025 11:49:53 +0300
X-Gm-Features: Ac12FXxLLhKzDb63V4ISfgmFlectkX5_Pm-_KyAdEhRiQI2q64i43HeUi5hyi9k
Message-ID: <CAMUa8fbvjQFfj_RiOrppi3rmc30dsH6oFQrZ-EOXx=n5wuqWvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/xe/sriov: Mark BMG as SR-IOV capable
To: "jakub1.kolakowski@intel.com" <jakub1.kolakowski@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "michal.wajdeczko@intel.com" <michal.wajdeczko@intel.com>, 
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, 
 "satyanarayana.k.v.p@intel.com" <satyanarayana.k.v.p@intel.com>
Content-Type: multipart/alternative; boundary="000000000000a178100639b78234"
X-Mailman-Approved-At: Mon, 14 Jul 2025 16:15:32 +0000
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

--000000000000a178100639b78234
Content-Type: text/plain; charset="UTF-8"

>For SRIOV to work on BMG also correct, SRIOV-enabled IFWI must be
>flashed on the BMG card.

I'm very interested in checking out this feature on my ASRock Intel Arc
B580 Challenger 12GB OC GPU. Is there a way to get it working?

--000000000000a178100639b78234
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

&gt;For SRIOV to work on BMG also correct, SRIOV-enabled IFWI must be<div>&=
gt;flashed on the BMG card.</div><div><br></div><div>I&#39;m very intereste=
d in checking out this feature on my ASRock Intel Arc B580 Challenger 12GB =
OC GPU. Is there a way to get it working?</div>

--000000000000a178100639b78234--
