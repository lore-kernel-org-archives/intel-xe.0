Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF87D44172
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 15:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D26110E0C2;
	Tue, 19 Nov 2024 15:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="GVuxuRIZ";
	dkim-atps=neutral
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78710E354
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 15:18:44 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6cc250bbc9eso33216246d6.2
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Nov 2024 07:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1732029524; x=1732634324;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X6DUOSITFvhCPuorRuwvg9eBfMG17CCCIcR40Q4q4q4=;
 b=GVuxuRIZnMWAj1YwerC1hj6C6G53/iiH9fMkGpA2oNCuBaTkB+3iTMMXlMM1R9XegQ
 kriwO1yp58iJ4fgTD/SmTmScqTFr9JaWuP9zE5PG35IYJ4sdlD9NxykNtVTkKB+SclMf
 Ih6xtquFb2hPjQYcHcR28JXdMRNEe0Dr1ghRCO3sXCCo9IWg0QQZP2zW2DbaJQ9Zs3Zc
 ThCH5jiaUWVBJIUwba0Vw/awvL0Unk5LvN6V9WjB1F4v0YF6T69lz5dpxO+YU0ea7vZA
 mufhfNtZQq/gBPZzky5uLC8OM3DdcRkfqY1fu8yYVJ9z3j8+L43i7znNUr+kR2+Phlhw
 ML2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732029524; x=1732634324;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X6DUOSITFvhCPuorRuwvg9eBfMG17CCCIcR40Q4q4q4=;
 b=l5oPSNQkvvUz+IleuDFPfHDJCNx4tMWFdb8QKRNaDEiPoDmqpBCEY/A3lspkFAra2o
 +P54KdPozqJIXLGrZWsAoVUNfl+QOPCfMnFNlhcEIsjaPgm/6xWouDQMH4aJGrYTx8HH
 pwx0Ru+ZwDtr+BAcdkc0Y1q75WwIBlELn0wKrfzv3+ARdFgXw4HDlEkKtX0WsUVaOSNp
 9R8yjJto0YLwEtI+alr2D0OCyLem9PdmbKKIB7/+2Cb6slZYejafqbiKT/7Ai5j4LtAW
 j5NbUAwgjuDnXA//zjM0DapfDJ4OQmrrIXBljPMTQ8WfS3taLPt9D/MUSgQZMneiS3La
 ESBw==
X-Gm-Message-State: AOJu0YzNP9t3M7i0lpdnJj8kHNsTOD9rF/WCgOOHaE7BtRwYDYb59uNL
 0jcafKFZMs8Xsw47oBVZdRKnCfhvzjQNJqe0icDGG0A81zjyf8nyDv6Fqhlm25HIOtQLsifUJJ9
 ziNoexkA8JGCza2d4PJP44vmOldsv/XWVKwtmHQ==
X-Google-Smtp-Source: AGHT+IFWSEkItI91noNnedDuNTjILR7p5IbiPGX5mwixZKPZJJKDlrY91BlgB338dRv3VWF0LKhfz+aaLzphyHM4xV8=
X-Received: by 2002:a05:6214:319f:b0:6d1:9e72:596a with SMTP id
 6a1803df08f44-6d3fb88bf7amr217362246d6.37.1732029523710; Tue, 19 Nov 2024
 07:18:43 -0800 (PST)
MIME-Version: 1.0
References: <20241119104521.575377-1-arun.r.murthy@intel.com>
 <CAPj87rOO58Q1jBO3QdygzuSZpPeabNdBMeXXd7RhNWVOUFisTw@mail.gmail.com>
 <IA0PR11MB7307C3B8CB76E54C122A5AF3BA202@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307C3B8CB76E54C122A5AF3BA202@IA0PR11MB7307.namprd11.prod.outlook.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 19 Nov 2024 15:18:32 +0000
Message-ID: <CAPj87rMa7x-GipVVrj5-UVQ6RxaD0dNv9PTNQnv2sqLxU3vkCw@mail.gmail.com>
Subject: Re: [PATCHv5 0/8] Display Global Histogram
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
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

Hi Arun,

On Tue, 19 Nov 2024 at 14:39, Murthy, Arun R <arun.r.murthy@intel.com> wrote:
> > On Tue, 19 Nov 2024 at 10:55, Arun R Murthy <arun.r.murthy@intel.com>
> > wrote:
> > > The corresponding mutter changes to enable/disable histogram, read the
> > > histogram data, communicate with the library and write the enhanced
> > > data back to the KMD is also pushed for review at
> > > https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
> >
> > The Mutter MR you linked does not actually write anything back to KMS.
>
> Yes, writing the IET LUT data back to KMD using a crtc blob property is pending in mutter and is commented in the mutter MR.

Sure, that's fine, but until the actual userspace exists, this cannot
be meaningfully reviewed.

Cheers,
Daniel
