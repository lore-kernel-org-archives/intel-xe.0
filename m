Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E03C79F81
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 15:59:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD97710F68B;
	Thu,  3 Sep 2026 15:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="E/R8IqMV";
	dkim-atps=neutral
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EDB10F327
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Sep 2026 19:25:37 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-936e8bd9caaso134905485a.2
 for <intel-xe@lists.freedesktop.org>; Wed, 02 Sep 2026 12:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788377136;
 x=1788981936; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=eOSZwZkh58hDRqe67j4/nlf7KiAfIEb1LAB7CKHGbec=;
 b=E/R8IqMVLCNlARO/+03vPMCP3Cp3qoRsi3UgdqsDQBRzfmCDeeOfXmKeVX+QUI1CUd
 oV5Z94ykY0Usnp5YEQgKrLj1GU84eiW75ft+Z/tLzKmtps1+chcl2qam/vMW5khUDuM7
 FtOdELMe3bWmu2oTaTwBdQQLAW9PoeX6GFbVyA79KBQPCHOb+aSMIkTjrywvc9bE4uhp
 PMdh4JA3JxkSFheB0K7xVt/nlYRNWBZjGVMR4rhTLemZ90A/xEJH+7psZjynbTGN1rQ2
 gQuvrsPH6WdoC8p6vNKcIYp3yl5gtgXbzm3nO3i13OMqorOdMiyEDmWPm17a7+H4xT5m
 FYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788377136; x=1788981936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=eOSZwZkh58hDRqe67j4/nlf7KiAfIEb1LAB7CKHGbec=;
 b=P0pGJ4dXx8FZ/+a5Fnx5YXBzVhmu8pkLeFaUqZGhW/N+wei58GvxAcymr9zi9QurLV
 /Qyhj29QldOglPksQtDYvm0e9jAN34aYNy+jLETPiHJ1/pmvSEQ6c3A5kW5gCV09ggqT
 13d8APzUctI3v16gxzCbanHN3o7gDzL/ICTaiPpD05AVNWm/zWtS8Zg/zhHiQOkm3va7
 uCjVGUTHcA1myvf3iINtw3UxoGGZYRCtHrcKCYT2RODSz0NlIBbzP26xw/qaqQk7Gcrc
 +lOsyLD7BkF51bHniufD/Z1T6SchGxsM00vLiH2sC9b8M9EIImZA77zAnE3kqXzdhQlz
 qrcg==
X-Forwarded-Encrypted: i=1;
 AKwUvByuRfs81O/QGtcp8BEXF1X2NwRVC2rwSJPIwIDkD5uT6NdRQb2prBRmmHy13sMg7O3DdZxmFlDjlQ==@lists.freedesktop.org
X-Gm-Message-State: AFuF++nf7+Mx/exXPaMCcEbT/Vah1ZWfMB5gE0AU24oQfWUr4MDfC6ix
 k+cmp3uK3Iq+FPBazeDl+t8m3L1eL6wJA4Pfnbbx8qb9yCrQcBVT+d4AeGKA+VawKMQ=
X-Gm-Gg: AYBFou0fqgwqg1vXw/O8CrUql9qWCuLW0BXTrvFRNDcX/wKdn11IIVU2cf0IHbZXxwH
 +MgPvzcF3IQW/8N7mZepWEjFih7VNVy4gF7uDT7ds8hmil0y7Sky7y9y790KiR7yG49jctF+j+Q
 QFJPl87uo6gDXsPi7nJ4Ii8sqMICUqbW9ZsLtIqWY6agUHpaMcl+MfBhPQq4Xsrcefl+kzKl2b8
 dD6qwM+ltyWkScepbr+64I+rbtNh/HP3rgrha/DMjYcVik8KimSYYu0scWLXtOjb3ml9KksGyBT
 FMh2qIg6RVZ//mZ4UfTJnD2XTdGqeth5wzJZ9CMr2k7SlqVloXLSDUJFcl7tGnmpg1uRcgDO9Mc
 H+mOChIkz+lc3y+kXwpCcxpw/Y7fOOmzrgWYS1m50pvZYENJFlfv3X+wSyvzBmSKNG/J98mxpT5
 2J9JYto5xSRFc7e+O7nczwDWwEHCIZvI1nL6a2dpGKGwIWM8ctxGVI6xf04wRQc1HQbr43BZ1CH
 Qz0N0AEmmtK7HPLxcyAvm8aDzfjHV2IX1cHVWgUnSViQbJxWrFY/6IhzaNFk6XE2M9aeCdxDUGf
 INvdg6GXlbYKDBdM7wYCjDkYtqZboCZry9FABzANxp/RXmYOqmt8ZJy3DwXFonW0dV2ryA==
X-Received: by 2002:a05:620a:a716:b0:939:3cb9:553d with SMTP id
 af79cd13be357-93960fdf834mr775651485a.38.1788377134732; 
 Wed, 02 Sep 2026 12:25:34 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9396b7ae401sm102436985a.20.2026.09.02.12.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 12:25:34 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [BUG] PTL eDP PSR2 SU / Panel Replay: engine parks in SU_STANDBY,
 panel never refreshed (Dell XPS 16 DA16260)
Date: Wed,  2 Sep 2026 15:25:31 -0400
Message-ID: <20260902192531.44003-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902162150.58778-1-j@metarealtyinc.ca>
References: <20260902162150.58778-1-j@metarealtyinc.ca>
MIME-Version: 1.0
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

Follow-up after a day of A/B runs, all negative, each verified in the registers
before the run:

- TRANS_VBLANK.VBLANK_START programmed with the real vblank start instead of 0
- guardband forced to the full vblank (127 lines)
- PSR2_MAN_TRK_CTL in the pre-ADL-P layout (4-line units)
- ALPM_CTL with ALPM enable / keep FEC / AUX wake sleep hold set for PSR2
- IO buffer wake at the 5-line minimum
- PSR_DEBUG masking MEMUP only
- no PIPE_SRCSZ_ERLY_TPT / DSC SU parameter writes
- frames-before-SU 2, idle frames 6
- SW VSC DIP disabled with VSC_SELECT = 3
- sink: CRC verification bit set, MSA timing ignore cleared

Individually and all together: two captures after enable, then SU_STANDBY at
every frame change, sink 0x200a never reports SU_VALID. Manual TRANS_PUSH
SEND, CURSURFLIVE and LNL_SFF_CTL writes with the desktop idle are ignored as
well, and PSR2_SU_STATUS stays at the block counts of the two entry captures.

I have exhausted what can be derived from the driver source. What would settle
this is a register dump from a Panther Lake machine where PSR2 SU or Panel
Replay works, taken while it is active: 0x60000-0x610ff, 0x70000-0x707ff,
0x420c0-0x420cf and 0x16fa00-0x16fa7f, plus DPCD 0x2008/0x200a. If anyone at
Intel with a PTL eDP system (Windows or Linux) can share such a dump, or point
at the Bspec condition the PSR2 engine needs to leave SU_STANDBY on Xe3 LPD
with two VDSC streams, I will do the rest.

Instrumented kernel, scripts and all run logs are available on request.
