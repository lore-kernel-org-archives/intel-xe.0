Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABF1C624DE
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AFD10F682;
	Thu,  3 Sep 2026 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="n+66HtLq";
	dkim-atps=neutral
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86BD10F5A7
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 13:14:36 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-936c02e58dfso228994785a.3
 for <intel-xe@lists.freedesktop.org>; Thu, 03 Sep 2026 06:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788441276;
 x=1789046076; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=9OzcMW4DCeAVquT/pRer644RBv1Bhzwct6ZyKM2ylb8=;
 b=n+66HtLqDocOOODhyOBR49mTjpgt9BmDMwPZrii6pOlaU3mk2Dohq/py6RARMCsrtP
 m9sb1tiFJYqgeYkBpTnCQNpufr9ftBnz9WGGvB26PHP4rn8JnrT5a30cuBK77TddacQA
 jJvLIx0k4WDZ9Y9xjpA1UotnZ3wyYKr2bTH8fIwVy/yYpERib3bH358blnE/Qj51fap+
 iryPC/GEhMEwzQjEgLV5OX7CEFYuYNZmHPjzL8c+yzx2wNFB8mpPp/AVAe2yZqtMzqHH
 MOcoFmpw/4Yd0BWFOwAPf/o870mf9eXMHYwxj74KoZyOkGJyDKTIgfXCqW2JEx6A+XeP
 JOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788441276; x=1789046076;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=9OzcMW4DCeAVquT/pRer644RBv1Bhzwct6ZyKM2ylb8=;
 b=CRA+JNrCFj9489SDHelBxAZCTpWxnVTzl6mXceh07yH2BiBucs8xWx/XcKGZ2CgniT
 6y4IGz/JkoE8mPT/e1rm0uSEYYisKBa062BkVghdNC+NBK12UvnYv2fksJ8YWT0ZsZNh
 KbcCNkHdSiDjsaePciPrfQIKCsXhqTkSIBMWPpPnhzTD/ZuvYSTEQLiCOCauXRE22HnC
 1AiND+DzVSUdwjWMnsYBgHT1PBWFLRbStXqt7lvymtdDKVEDFbc3w50t1ON3IAYFeOwr
 bjLT85kcYzxjAi+cZmxQCzB8+v/1ahGVlPINBmTPdHA7dfcZTVc0aSOlCESe2QdkbwNS
 TUPA==
X-Forwarded-Encrypted: i=1;
 AKwUvByOmOW6c3O2+IytL9s2QYG1GNAtFzjVa++2dGnOH+BHTL76L5A8k5U6j1A+RoNeKJYbrq/PTKVqlg==@lists.freedesktop.org
X-Gm-Message-State: AFuF++k1CQZeKsuVFMHGcKQCQlgRwi5WqVwkfznFe5dsfWruI4n92pMI
 FjkMDVwHRS2mLlQWm0TQVwyxf3pG6mEYuu4voetulqngFRw4lRjrBJNwRWqWR6kWd4s=
X-Gm-Gg: AYBFou0GJ3fupHQf5BavLIxO/2Nn4Ehjck0HXjd1pk0SrOiORSfhOQZT1rLaHFFxMOQ
 B81MzCK0CBYKmu7bNL6R/e9lJ4N8rT61tuIoBoHifLU8oQWUsHTLG1KtGm11qbfRzMecVj9R8jD
 VZ9N5cUxG384dZJdNw38bGMeZT9Gxfo4oUxAHTDh+AFBsrj2VxrXduPJ9m5+/zuxo1WBAB0pfjf
 M7L022FIgDjL9IxY41u/IjfiK6suiQaxlYl1CQU9w3TVWdXzCd2nqF2yl6jpLxwDS4v5xOgeO9e
 2UEv5zvG7qT2VXz1XffFFclv4oHAIA/ysuJ4wthddzBxkGX/6RkmtViRJAH+cmxlC17u7hOAnLQ
 XuWpxpIB3aT+2vNSeSDz9wF3/934k3dlU12jGAWoe1KcQ+gMzlru7JolabojQKxIscPZmHE+KnV
 OkhjKdD8KqK9cy8TtCZTK4KUMTXrEYktxAyTtGT+pUPWry9JpKp6wqdRb4fkG8SEk57K2FTFcvo
 56XDYTpkkzF2fBTXrvGaATgBOr5xSbUE9XrOjo2W7I7uh4lJG+UYk6IB6fc4cnthyHbgrwcX40T
 cHCl7UUWNSNYU2PYQ6OUeWr9hY7KbC4dfUf63g9WjtoquLS1OpSA9hhBWJg=
X-Received: by 2002:a05:620a:280d:b0:939:6dbd:de55 with SMTP id
 af79cd13be357-9396dbdde9dmr741980585a.18.1788441275541; 
 Thu, 03 Sep 2026 06:14:35 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397cebf93asm13692085a.23.2026.09.03.06.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:14:35 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Thu,  3 Sep 2026 09:14:32 -0400
Message-ID: <20260903131432.44250-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902192531.44003-1-j@metarealtyinc.ca>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
 <20260902192531.44003-1-j@metarealtyinc.ca>
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
> Best to report this :
> https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Will do. Filing it in the drm/xe tracker with dmesg from boot to the
reproduction (drm.debug=0xe), VBT, EDID and the run logs, and I'll post
the issue number here.

Jake
