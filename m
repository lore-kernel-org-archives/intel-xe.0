Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C1AC4450A
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 15:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E96310EDB5;
	Tue, 14 Jul 2026 15:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oztwX5PP";
	dkim-atps=neutral
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EE510E640
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 15:46:15 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-7ebd88be784so565056a34.2
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jul 2026 08:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784043974; x=1784648774; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nNt4aFBQBTeC6gh7XjshPB2bRqBQHmW7ChcRLsTBtjU=;
 b=oztwX5PPCy3FIDC/381yuzjqFrAtiy7JnrnZMmSeDSv3PS6Uu5O9uBvtkM7GJa0Fqh
 r+/wRRBr9dQ80Bm0ekdruwEiLu1SXW18ZRMtKIP6EXjVWO7oCXxSxI8oEV29hENh91yB
 cNKRKfKhCNwWeHWdpSQQ242a7X1coE2BFNvgT+F5QwITvzKB3v5mnkVEl6tFB2o9NodT
 ZDQvyQBaCd6Jqus43XJ08akyC9UIDACZnvhK+ksjBtaq1MEdiTxqupf3vLA49X6nvMhh
 WExzW+/W5qpNZfxlzTyG5PgN5vuHOFqhjmupIvk7CeaeNw2AatTvHd1s4qdP5E+u/Rnd
 2TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784043974; x=1784648774;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :content-type:mime-version:references:message-id:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=nNt4aFBQBTeC6gh7XjshPB2bRqBQHmW7ChcRLsTBtjU=;
 b=FNlrVNhO4WUtMMzm5QVU4jauXjpzfQNIkCWB7YXRguUiqERR5dfVHFF8GWkQqJ4p2S
 LvzNIFyBxLxdI41fmIrLK/ad2lE2e9NcLUEiceT7oqEvMtv1my+j/eNYbTaXfGWJ29Iz
 hOQLtvqThTZDtcKmMVo6Cxr7CBi9MyLqrgZYpk2EFCef+1qc8jSYgxrVHWQgnkUCAiGV
 NqVNrSgGxILmrbjO4o/RxmrIPGWm2dXTuchawyS5jSqua4ofNvEDBIr/MEds7xkj5uR1
 rxgOgnOmI1cKlDN24CLE0NUz4bQjqGxxaaTtX1zVXHGX+q1AYaycHwDAMll7OkqA4s7+
 6zuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9rqYGVdgRWcIb/2v40YLfu9ftqo/PLgvHREPi7fDRN38f5D/+tnGqTAatoC3eh25j9nPGTlL26cg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqnQx/jjlxbemlASDVRNJy1rFLCbIMN2SccymLKpu0ajDlrjZl
 G0uSA/BNDUnAvggGhFYqBMuqRjqCRaGchHN6U4uiNpXIdSGM5SF7uwBQ
X-Gm-Gg: AfdE7cnxPDG/Pphbj9fBFm1T7nlCx6/ozG3YOrx8BTqILfK7ctY0PlWyYH+SF2cd501
 mV/rjtipfzaGyNSD5fJavkMnGUiLQlZJldRd9TABsca5fKGlqzvX49HZwlWq9me+FNXKtlCdl2t
 iNcm+CiKS5vGrpM+/V03x4s3wtXbtLEF4l35eRoPw2IRiNfA3LDYdUFySDRG1LTGRWdGuhVEKzr
 lTIwKkj7ZwmPylDEcqsXEM/Aeg8AcKelgl8dVxggpykCKWpg/0HZ/pd16Yabgxl4eIyOl6pWXPL
 lm3a905CXQO2wtfMCJLcPxuz5yGA6sXGiBN+uNOtF2ZGRZTfJzo/m7QmdJl4e0GDrCA7/sPLo2m
 +P0PHGQ2mnMcMwcYVO76dxGkE1IKALQfPrc7eeV1LDxdM1zqnH+WJCGSwcBzxjxaVnJkvR3C4C0
 3yNzvPQIjcI9ZY8zc=
X-Received: by 2002:a05:6830:3108:b0:7e9:c76c:abe3 with SMTP id
 46e09a7af769-7ec096027a7mr9375213a34.6.1784043974139; 
 Tue, 14 Jul 2026 08:46:14 -0700 (PDT)
Received: from localhost ([74.80.182.78]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ebcb2bc241sm15641928a34.20.2026.07.14.08.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2026 08:46:12 -0700 (PDT)
Date: Tue, 14 Jul 2026 18:46:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/i915/bios: Move a variable assignment behind a null
 pointer check in intel_bios_encoder_supports_dp_dual_mode()
Message-ID: <alZZviFT2jfABiZq@stanley.mountain>
References: <e81277a0-93f8-45e9-9fa4-7c2c2df9c311@web.de>
 <alZVl0o7uBoncUos@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alZVl0o7uBoncUos@intel.com>
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

On Tue, Jul 14, 2026 at 11:28:23AM -0400, Rodrigo Vivi wrote:
> On Mon, Jul 13, 2026 at 04:05:53PM +0200, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 13 Jul 2026 15:56:46 +0200
> > 
> > The address of a data structure member was determined before
> > a corresponding null pointer check in the implementation of
> > the function “intel_bios_encoder_supports_dp_dual_mode”.
> > 
> > Thus avoid the risk for undefined behaviour by reducing the scope for
> > the variable “child” behind condition checks.
> > 
> > This issue was detected by using the Coccinelle software.
> > 
> > Fixes: 044cbc7a74c136f12a80c855cadd1b085084aef1 ("drm/i915/bios: Nuke DEVICE_TYPE_DP_DUAL_MODE_BITS")
> > Cc: stable@vger.kernel.org

Please stop adding Fixes tags to these and talking about "undefined
behavior" in the commit message.  Pointer math is defined...  It's
just a style preference on your part.

regards,
dan carpenter

