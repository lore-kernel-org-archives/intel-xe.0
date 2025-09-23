Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59990CAC5A5
	for <intel-xe@archiver.kernel.org>; Tue, 23 Sep 2025 05:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 188F910E564;
	Tue, 23 Sep 2025 05:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aN83j2Bg";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33B3210E564
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Sep 2025 05:39:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-46cbdf513d7so19994155e9.2
 for <intel-xe@lists.freedesktop.org>; Mon, 22 Sep 2025 22:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758605949; x=1759210749; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y7dGVogYCRH2pb3Tt3vKLKWXrDftLej+oYJZAcuLaQI=;
 b=aN83j2Bg7fp+/nHyMbt5h3BZgVDHlYwBsnye/ViS8L/57IB4PjUuNUqN0juXRN08fO
 UTpsIwSgUmOZQLSqrz8HgPnnN4jZMqzeUgSkOYrgE1na4dQxKUwiHsMfCtdrDz9Um+e6
 iooeR4LZ1E/DNk9GF8Lt/wzecpDU3A+V1Izfmzy9XRXXK9wVk5Zy2QCFHxEgQDxLJ86V
 AAwRr86EpWGAfhXMDPyK/nFGiM9D2PRT5dDtXqodLjnA4TlrIEtjPLGDoiNs3mKo5BS/
 9Ihz0NDSBp0na+06Um5B/blV9aBcIv+QNL0YuFY9fx2NVpPRc6LXUAM0R7aOLQzzQg18
 yXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758605949; x=1759210749;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7dGVogYCRH2pb3Tt3vKLKWXrDftLej+oYJZAcuLaQI=;
 b=bBUNyblyiT+nTGcD735HOImeixXBaBo6eE2dKhcoKdX2TPXgz3NKznfHDrW/EEVJhQ
 iikdyPuITsMZtpWnExMXFUzrldC9kbpzkwxeizQDGoHP+mSiYPJ0hMpLwIUwflf4JPbM
 PqmenAauMC0BJfofyu/hK7rtoMOrdO7l7Us6D/0lRjJbC6bOJU6H1h3gET1jYhAN1SGx
 /2io6VWHKa+Bs+XrRoeJ49ZcLXJY24KGopAuwdUQisp8RgK/8EpzSj543CHBhsNxlgrb
 rapnPE5Q9wpAG0BZ3fOFR3QSL8iQ7FzW+m1/lK36p5qnwWb7q4y/tVuVxf5oXqkfTspZ
 orUQ==
X-Gm-Message-State: AOJu0YzZVNZzCFbqPeUe82iRR9Sg60437IlOF0pefDMashFoZ65Qub0L
 eBFHb4MsacH5Pc0YARBjlGBrIdZUXA+qxPJSwAUZ4vXBdhcVau5loJlADod55NsvFtw=
X-Gm-Gg: ASbGnctnH35wIct9HqOaxi3E3/GyaDl5tsrRAwH76P+dFwQ2aufECciepTvYgMDORoO
 iWf9vqGVzaiXjYhlXfstdi1IWQduS5aCaAb6Z0mnbMrlpukBuaBFbWGsTTjzyWivGCEdBn20vXI
 T7WfeVb8+vAGJYi1Aivy5qKk2jmds9+nsMcCBriTev0HjGFpbKG2i+4e82rlFRoWl1wf4O4v5kW
 xTPxIdPHfnkw34wgVoAhrd5MhriV5xqOd8Ejvaku7mH/u9XqJ4P08Xrc5x70Oznh5cGah/smvi4
 H9o4NVZj0AcCG8jN6GXD3K6wxTBEhDLzEjjWyzImNJKJG6uWm3IahmArCevIbRQpdsKf/JkWLXt
 duVrIab7jAGRQP+w6dGyzrhdtji4h
X-Google-Smtp-Source: AGHT+IH7v8TTl85EVQ3RijpzgsnEQPQdCfB8C5j55DYlbkCdygW60wvCENaHm+xDYiK3O8fMS2WC2g==
X-Received: by 2002:a05:600c:45d4:b0:46d:b665:1d95 with SMTP id
 5b1f17b1804b1-46e1dac98c7mr9740755e9.32.1758605949376; 
 Mon, 22 Sep 2025 22:39:09 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4613ddc01e6sm262212555e9.18.2025.09.22.22.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 22:39:08 -0700 (PDT)
Date: Tue, 23 Sep 2025 08:39:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: Re: [bug report] drm/xe/psmi: Add debugfs interface for PSMI
Message-ID: <aNIyeRv91gZXPUBr@stanley.mountain>
References: <aK1nZjyAF0s7bnHg@stanley.mountain>
 <dcfyppphvrn4xq63bqtfi5nd3ipsqkkhfehjdt77pyr2nlfmd4@xfmqlycgi3cm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcfyppphvrn4xq63bqtfi5nd3ipsqkkhfehjdt77pyr2nlfmd4@xfmqlycgi3cm>
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

On Mon, Sep 22, 2025 at 03:52:40PM -0500, Lucas De Marchi wrote:
> On Tue, Aug 26, 2025 at 10:51:02AM +0300, Dan Carpenter wrote:
> > Hello Lucas De Marchi,
> > 
> > Commit aaa0c1f50a3d ("drm/xe/psmi: Add debugfs interface for PSMI")
> > from Aug 21, 2025 (linux-next), leads to the following Smatch static
> > checker warning:
> > 
> > 	drivers/gpu/drm/xe/xe_psmi.c:93 psmi_alloc_object()
> > 	error: 'bo' dereferencing possible ERR_PTR()
> > 
> > drivers/gpu/drm/xe/xe_psmi.c
> >    68 static struct xe_bo *psmi_alloc_object(struct xe_device *xe,
> >    69                                        unsigned int id, size_t bo_size)
> >    70 {
> >    71         struct xe_bo *bo = NULL;
> >    72         struct xe_tile *tile;
> >    73         int err;
> >    74
> >    75         if (!id || !bo_size)
> >    76                 return NULL;
> > 
> > I really encourage everyone to document why functions return both error
> > pointers and NULL.  Here "bo_size" can never actually be zero so that's
> > an impossible path.  Presumably id can be zero, but what's the point of
> > storing a NULL in xe->psmi.capture_obj[0]?  It feels like it complicates
> > things...
> 
> neither id nor bo_size can be 0 at this point. We could simply remove
> the check or replace by
> 
> 	xe_assert(xe, id);
> 	xe_assert(xe, bo_size);

That works, or you could return an error pointer.  That would also be fine.

regards,
dan carpenter

