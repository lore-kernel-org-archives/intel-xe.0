Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60A9C624DD
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FFD110F656;
	Thu,  3 Sep 2026 15:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="p+yHKLOU";
	dkim-atps=neutral
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95CA310F5A7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:14:33 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-5304310b3e0so12046621cf.3
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788441272;
 x=1789046072; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fI50F7BC1P+zeX5uS6qAgaZ+kpRVSjzAsyT5yWCuILk=;
 b=p+yHKLOUefIF7Nj/HelQV8N7d8Oqqw1RZuUGV8s943KBWtVCvJyi+CyJKuaSuMDqFi
 cENI4cyp5kkQh44kx0sMB1ehIAvlfgbOo4e4rez8Gool26DGCelWE3uYY89co4Jo2/ci
 ImSRkeIFMGwRW4Ztl4gf5FV10eGc+zNegr4NkXWEYNkhokb18MzjH3gMfGI8B7yxp39u
 4u6O4D0QsxrjWwZjBiUCCugex6nWQdI3FiqCSGykgbi2VB6ecLQoZYer5Yy3aRptrJlx
 TIZD5sXeBe7Ur1aXucBxdiyDp0B35fVVneK2Vndmcdua9xxjdpRZ6+F4NKlCP/9bAHYn
 ivaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788441272; x=1789046072;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fI50F7BC1P+zeX5uS6qAgaZ+kpRVSjzAsyT5yWCuILk=;
 b=YlHf0hIGU+1AErX2zEexTmak3ucp8CMpCmxCadzoADME7w960wzAfIbOIAQSC+QMzB
 B3KVibFHnq75EXvVV+5ahH3fsjWe4rmyeQy/XHkRGElcMd/AIYMvhjGi50Syk8UvU2Tb
 MfnU55b2P5WHSpAQwkUmEh3CAYbneGCZDmn65Zb0vPy4ziLKOoHrx71sB9p+jQX89uI6
 7GFjsMFWXDNPQw6pgkVzh0dzarH+Z5NUbqWR1Gl+Y5CaEZlaDZqA0Y7atJRgk8NJHqNv
 AZF3WqdiX3xpmT8521H5SRxBbv6/JY07KQxt7OhpvRd81Z4T0B8EGRaNIoHr85/cOCer
 AS0Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+4/7YdboT7MpRpyVi6gsUBWAcIra1V/ZKDCsvimhVYS4KgEm0Qrdjhos/way0F/IGJgCj4V4oBg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mCY6WCSztEd4sovV/d65GJgs6I6NI5o7K9AFSXUVecND32MT5C
 4xsGFUFm5Idnq92zeZBVQfNfSFLOAaALfZi+TChkIPGs4R3m91AYV03A/846HvzNnkM=
X-Gm-Gg: AYBFou39B7MjdMaM3tt27fq5/ny5NldMxBSGEBP9lKO7TITy9SodQiMWJvrLh8nruF6
 zme78nZoxJA+zfOeiBaaFbA9Qp368VORhEthkzTtKzneKL6pCs8B+XL66jFN/WJY7ARyspmuXvf
 fubRn4ObLjIlP5udQrKd4yqueNBo43LbRKDckVgKFJqJQKg3cJ8TGf/kteKdzP0pELojXTHgb3/
 ANQGYnbvdRQRXIS2u5FeYLKbnSckXA8pIncVvFcgQ/khh1KIlzvBrrS1pqN7mTVNs52lIzEhWqK
 wZrDzPoUH1roeQMZmu71FHSESxsjghIOAdZ3Hdt/2qp3dUrIe+wEST9/IJznHWg6S2BPx0f4eHC
 Qw1IZ6iKcZ9INei+GLCxdDU3GPyYoERVnC/ahAfCQJ29G+/3hm/kJYbFLGViKL4TO0mju8Np9Fb
 qOTaTTutLDXngJpedgsAYEpWk8baTUTHdAFeHXwb26weyGcSNSy9IL4zp/GSGzraJJHUCmtTFBq
 ePzTYoEF/vRUwtS5mmcn6JZeMmg4imqwY8ylwah/Mvrk0OO+cCLkbZD/hovAbhXHpPz4t2jpLEX
 Ts/GnuyQ1ZQuxF0JiUH0FpXPxN1c8fXLgiuNDHLAJVftMEHlMUxLID+0Bf8=
X-Received: by 2002:ac8:7d51:0:b0:52d:824c:4856 with SMTP id
 d75a77b69052e-53036d12e8cmr114697601cf.31.1788441272177; 
 Thu, 03 Sep 2026 06:14:32 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530434bd168sm20388111cf.2.2026.09.03.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:14:31 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/alpm: Keep the extended fast wake ahead of the
 IO buffer wake
Date: Thu,  3 Sep 2026 09:14:29 -0400
Message-ID: <20260903131429.44150-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902162531.73598-1-j@metarealtyinc.ca>
References: <20260902162531.73598-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 15:59:47 +0000
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

On Wed, 2026-09-03 Jouni Högander wrote:
> Thank you for the patch. Have you tried increasing vblank/guardband
> alone?
> ...
> Have you tried fiddling with the fast wake sync pulse count? See
> driver/gpu/drm/i915/display/intel_dp_auc.c:intel_dp_aux_fw_sync_len.

Tried both today. Each run is 15 s of PSR2 with DP_PSR_ERROR_STATUS
polled every 200 ms and cleared after every read, so the number is how
many polls found the Link CRC error bit set again:

  io/fast 11/11, guardband 60 (stock)          70 of 71
  io/fast 11/11, guardband 127 (full vblank)   70 of 70
  fw sync len 20 -> io/fast 12/12              68 of 69
  fw sync len 24 -> io/fast 13/13              69 of 70
  io/fast 11/12 (this patch)                    0 of 71

Guardband and sync pulse length make no difference, and moving both
wake times up together doesn't either. Only fast > io does.

> Your change is conflicting with the spec. It might be a trace to the
> actual problem.

Understood. I'll respin it as a quirk for this panel (LG, sink OUI
00:22:b9, the DA14260/DA16260 pair) unless you prefer a different key.
DPCD OUI quirk or the device id table next to the Panel Replay entry,
whichever you want.

For what it's worth, with the stock 11/11 the screen keeps updating
under PSR2 only because every wake fails and the sink resyncs (0x2008
reads 3 the whole time). With the wake clean, the SU problem from the
other thread is what you get.

Jake
