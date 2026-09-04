Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BA0C79F82
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 18:37:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86CFD10E142;
	Tue,  8 Sep 2026 18:37:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="gMFOM89M";
	dkim-atps=neutral
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71FD510F970
 for <intel-xe@lists.freedesktop.org>; Fri,  4 Sep 2026 13:32:35 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-92e50a650a0so96867885a.1
 for <intel-xe@lists.freedesktop.org>; Fri, 04 Sep 2026 06:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788528754;
 x=1789133554; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nUDERenzGagFWWWNYxzhz036bpMy1iX3Z2WSyHGWcNI=;
 b=gMFOM89Mh7O1cuAhCQbPxC0aJ0fovGCTnWxLjayOO/rhx8RygJ3N3hNZIhMO6r/T1f
 OXesTmhdszXW6JjO4SFGXvYEnRu9ARvIatsJq7jORv7tcwjoQYnz9yVOP3wrq++w0CuC
 JTZHcAsWsHSlgF3JU4AzHuRrvDEHeJFbW7fLQyWU1dcvVmt4RgCMiwWfx6x1YCCVOcp/
 QfI17oeQcW6Q1ZbKMUKBRFMKLGTc3ihVAoUq/gxU7o9z7WtjhDGajb5fY7K627cEqjCt
 eYh/rqifZZBqXJsarqeWJuyWB+AD5MibiO0BVAjquSlXmSpGHM7Ztid6MDinzoSiFGyN
 DtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788528754; x=1789133554;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nUDERenzGagFWWWNYxzhz036bpMy1iX3Z2WSyHGWcNI=;
 b=AvurmztdW2qJzkGcmoIQG5GA0sww3cEMITvwNfX0cv+A1PulQpR8jD+QhmSaXpfw+G
 OBsdf8wf8UxOf57Ott218XhG2+N56PQiqHK0TI22Bp60VRRhxZWgHFI8YWsCACJ0zFgl
 EsLAPGjiFf6Un1SRTqW2FBsDQuagSxDHqhSV6HzKkkSHiNDMEhnuj4vkQQPt+sArzctH
 kV0NJ0d/4jXEl+zBh4iflss1WIXkcjrB+08HRfaIc2NwEdw5Yx6xv2e5kEqdSpDjDi0b
 6nsvo8sUC5NoDEI7ryM0OD5wAljTvn1OtB60cBgB7v504AFkFZZeBU+S3yDbWnVC8bWs
 HOjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByxxnfM/Nhb/JDW9X7Z9CmeVw5uu4VQngOuPwNMiL9Ryx0MtdhUYT5xFfe5jphd9JQkqrHOt82CDg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++khZEPXYl4mm6Lcn7qJZ3188a/eaoFyC8t1hcI34dzX0b73/a2d
 xjqEOoqtfY2JDFbJewADprXuiv00mDWbr9PZq7OHzMDbXClVRcMHpdNCJI0HakKu/VQ=
X-Gm-Gg: AYBFou11hqjUzy3SvSXwJZPgWxsU8EKJcna23R+HTkUkoJWn7q5L6pOCfNV+lzwLYGd
 XLHCQhu3ylEMfJiQk72U5rQ5Uv3atjldjJEtLm/p4fz9YVBog3K/9M21mexkcy57+kc9HJjmFTZ
 jZefyKe4KvarKRt9CLGm/FZeDXWZiYlYXHt8r9rfjUwPsUfp7NYvaOwIj1l3Cze5qbx19Jd9qsD
 4wEXrwaXrTXvkIdGIppban1Dp9Tdaa5WrRXRcatZHzlgElofCWIGJ8Od1NsF908+hRyeLZSe7yg
 JKHE2fe6MC423Wh0T8u3F220N68IN+mowYAnPnwTuKdgMt7Bin8ILvzhdwLx5Pzw6k5V3EwrmuH
 uGCNjv/idIr7f+fLilqg4sT2zxp9bHnRaEEBtakjLiunxYG9gqoSl885uYkmZCNShDOo4GrIQaL
 rsbRZAV61GgECEHqI1aozJh5aqNi8ewcQMTWX4SS21sK5knPU7WNWPSr/ZbBXk6e6o578JLpRJN
 EpksFOLDhsbaONgIMky4ewI+fedkqkhKPPmoxfXIuek0GRAt1zzS87g//Wwt+mI6KLb61367aOx
 HWGkiwFpzFJvSNrb5PcBDuEk9z6/a48khTX4hUnE6x27TCTwgRpIbOp1Ip0T4Y1/kSZx
X-Received: by 2002:a05:620a:870d:20b0:939:6df9:1278 with SMTP id
 af79cd13be357-939804c0ce4mr468511785a.51.1788528754174; 
 Fri, 04 Sep 2026 06:32:34 -0700 (PDT)
Received: from jake-laptop ([153.67.39.26]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91041fa4d65sm14043076d6.15.2026.09.04.06.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 06:32:33 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Fri,  4 Sep 2026 09:32:31 -0400
Message-ID: <20260904133231.9028-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904114835.483057-1-j@metarealtyinc.ca>
References: <20260903131724.49496-1-j@metarealtyinc.ca>
 <20260904004308.185788-1-j@metarealtyinc.ca>
 <20260904114835.483057-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Sep 2026 18:37:11 +0000
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

On Fri, 2026-09-04 Jouni Högander wrote:
> I think PSR2 was working on that setup at the point when I introduced
> that quirk
> ...
> Maybe this is actually matter of bisection?

Checked that today with a probe that only polls the sink (0x2006,
0x2008, 0x200a every 200 ms, error bit cleared after each read), so it
runs the same on any kernel:

  stock 7.2.2, io/fast 11/11:    CRC error re-latched on every poll,
                                 0x2008 = 3 throughout,
                                 0x200a shows SU_VALID in 2 of 94 polls
  7.3-rc1, io/fast 11/11:        same, SU_VALID in 7 of 90 polls
  7.3-rc1, io/fast 11/12:        no CRC errors, 0x2008 = 2,
                                 SU_VALID never

So what looks like PSR2 working is the link failing on every wake and
the engine re-entering over and over. Each re-entry does its two entry
captures, those carry SU_VALID, then the engine parks in SU_STANDBY
until the next failed wake resets it. Screen updates come from the
resyncs, not from selective updates. With the wake clean there are no
resyncs and the panel stays on the stale frame.

I doubt bisecting finds anything for PSR2: it was in this state in
April too unless the wake formulas were different then, and
intel_alpm.c has four commits since March, none touching them. Panel
Replay uses the aux-less wake, which does not fail, so it froze
outright from the start. That is the quirk.

Probe script and logs are on 9119.

Jake
