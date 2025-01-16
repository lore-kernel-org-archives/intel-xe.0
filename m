Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EDDC02183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jan 2025 07:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B70810E8BB;
	Thu, 16 Jan 2025 07:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fXfes0TH";
	dkim-atps=neutral
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C651510E8BB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jan 2025 07:16:09 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so970243276.0
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 23:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737011709; x=1737616509; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pwkwQnM0YTqjaNWS8T/XdTd7CxDB5+nrVli3aUMx8Pg=;
 b=fXfes0THO2Hto8alFAArbEMIfc3gaQcCnL2mRpdqUFswj7ds5kQvcgGBVK3vPAvtqr
 oDzEt9426jHR2I3mc9FMVgdypOMHeL8StVR0q6+3eBSQh+Or5RbwCumaPehVvZHMpIrQ
 U4GUoA0LCRxDJ9Vq+/HhOFYXL6hIuuxEExdzU8aTx3S5VY3oBpzduqxkqt399PUCM97M
 TD0HCBM3fXJlCa9CuM2kEtjxahPwqhpr0UUHtuN7r+x6OVZBDYbCbzEIVnef+NqhO+or
 xyZOLx6TGtEcB5Wj+oKTV93GHyRPr51xHes5nFqXvPItyqdLyzRMoBLMHiczGWBtQA77
 DcCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737011709; x=1737616509;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pwkwQnM0YTqjaNWS8T/XdTd7CxDB5+nrVli3aUMx8Pg=;
 b=OzNfviNRCHz3CcIPpbxua3bkRU+a71QNMey6JDZhrs9GeIvAILN7rvR/CkwQl+TPGn
 d1TwY6k2QpJZ3tkcbo8JAqG7xCFqQszGLlKIWwbd5Qn9SXdKQUQGVp2dojom0cc794lW
 V7l4+p7TQZSOd3l+ogeuFVVoITsDsF4lTYFcCVeBJ4nt+03uXq5o01XAhDL6+Rtz5Svl
 BtWLHLM21iSahEBTVlvCKong9/yQohP4zpLwyXpPrFhu9dNXzrstB504jxMaLM1pVzHe
 mg4uMqRal0labHfbbNI4Bu+sJscH9b5lN0qpq9cM933wqsK4cFyQbJQ7BcOPfZZiAPSN
 6XlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOhprPIKXWisomvf47Yn42cU6il9Du3+WySD0k6yJ5C/ohnCzIf2JojZtwDpv7Rimag2ZOJ1KG5Q==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVoUaD3Zo2r3jlc98tgeT3OZhDC9oQO5ydeMmbGRUYW/8WmjeW
 exKF257EuYk63snEsEMq45t+U5pLRHJ3egkNGZLXBGhH4CaGjikcCjCLXe4ejMgx/QkN0OsBXZh
 0wNwNUH5RA57bi7XcKO0gI7H/qjCEmVEGtlf6yQ==
X-Gm-Gg: ASbGncu7mVH62BZKy81FgFhZlmo3uKWqKzzt0GEMvKRRzvc13ActdyeUz9pZkV4gfwQ
 41KUx7oiSyhEbiryNQ5rM85Bu3eAqgAiWQ0KNpeel56GAcPnsSG4e
X-Google-Smtp-Source: AGHT+IFvuKyX63fcWoQCks5WRvnKN9bcuUvw9s+TvH0HAJPqgriBP0YIXeth6q/7ESlN1T/FPIHWH1Uh/nHWLeGI8ow=
X-Received: by 2002:a25:6a87:0:b0:e38:b6be:1d58 with SMTP id
 3f1490d57ef6-e54ee13bab1mr18370760276.21.1737011708863; Wed, 15 Jan 2025
 23:15:08 -0800 (PST)
MIME-Version: 1.0
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
 <20250110-dpst-v7-7-605cb0271162@intel.com>
 <45k46w3ir4ytz3eqm5sapbqdzgfbkd7zyy5gl26a4ietlc32u2@c7brxhuuitru>
 <IA0PR11MB73078232EED1B5A1B6EF0C66BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB73078232EED1B5A1B6EF0C66BA1A2@IA0PR11MB7307.namprd11.prod.outlook.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 16 Jan 2025 09:14:57 +0200
X-Gm-Features: AbW1kvYz63jUwuBTNUZxDxoNqqMBSKpT1f7b2ksPz_C_wl9FknGsCWwjDM3rRnE
Message-ID: <CAA8EJprKwgmpO0xJ4ib-1TUVkqwJw1K=Qe6Uyybnd9XBWjPmEQ@mail.gmail.com>
Subject: Re: [PATCH v7 07/14] drm/xe: Add histogram support to Xe builds
To: "Murthy, Arun R" <arun.r.murthy@intel.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kandpal,
 Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, 
 "Bhattacharjee, Susanta" <susanta.bhattacharjee@intel.com>
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

On Thu, 16 Jan 2025 at 09:09, Murthy, Arun R <arun.r.murthy@intel.com> wrote:
>
> > On Fri, Jan 10, 2025 at 01:15:35AM +0530, Arun R Murthy wrote:
> > > Histogram added as part of i915/display driver. Adding the same for xe
> > > as well.
> > >
> > > Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> > > Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> >
> > Is building of the Xe driver broken between the previous commit and this one?
> > In such a case, it needs to be squashed into the previous commit.
> >
> No!
> New file for histogram is added and compilation of this file for Xe builds is
> added in this patch. In the previous patch it was done for i915 builds.

Ack


-- 
With best wishes
Dmitry
