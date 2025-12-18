Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED69D6E2A8
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 15:38:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDB110E84E;
	Thu, 18 Dec 2025 15:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UiBq43M2";
	dkim-atps=neutral
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA9C10E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 06:46:49 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id
 98e67ed59e1d1-34b75f7a134so245876a91.0
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 22:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766040409; x=1766645209; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b4DXMpQBlzOPKb0PDGmvx/k+LAdVPHJJW3EIFcNTF2o=;
 b=UiBq43M2lPo1cvgbj7ZkTaNjm+4N5tbrbaQd4q81TxPAfY6uXULWE7a+Z4FLL/Py4M
 1SpN11PBUaUramnDQwRxMYYQlA0oG5rIUhWj11loEr3+Yd/vlqo/FkcdjBNeb7TxbA6o
 gZjiVC+TBGPce0mHz2KaIiHnRMTdQ+awjT5EyE7cOgt92OjA3lSuD3C6WBheOReVxWZk
 Z7UUmCSrlfTAXcvtLWvPf4kFfCskzQ5RfZXYxSxV32ze0lyIRP9Rjn9EcFw/3Rssa9Wy
 J1c1SiHsUkLZtlvGcRS46XHvVO1vLh7s7CdGJ8ETtrmnu2zUtSwlX3/GkE2+X8CtMsKe
 NiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766040409; x=1766645209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=b4DXMpQBlzOPKb0PDGmvx/k+LAdVPHJJW3EIFcNTF2o=;
 b=GA8gWbGPQl2LYEZCCJKyXe1G74acvlD18UHu5seIczYkAEvFKIdA5YYrT+3PLrz77X
 tmvvO/qfQlCv9ynNKadEVAdNPp5U0QU0SErPgxvuaPpkMFFn6INI/Wt4wjL97FOIPeoM
 0Du/LNHiOXlGOFr09MgBHgozGO5OPmbJI2hr7o71ygJur4iGmAPXE29ndAJhyANEhOEa
 1qSQkYKCZkIPgXcVcUZmCKzn4ZxACq7GSAdHVXpQU5OiYSCcqH+3FQQFu2zyTNJ8ZG/O
 PDfxKaRESRHntfIY+AlwU5WJWZo5mo8MM77CRwXcKoCk2mcQ6NQCHrbP2MHNznX9j2xN
 0K9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLnB181vBCn48i/uhwLNcr/XfqRxFaY4GSWrrmkH9rfe88lhNouiaTKorHUDOOXFRzSe2dr251YQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpptBW7InHJXDYsGIkPskwUm77R7G10LrF0OYp5HGx7Bw2IXqj
 mFVkhM3cOebgmZO77LksYjTzSNwl6CzSYwNC+2rlRrX5JmpGgRtS/5Ie
X-Gm-Gg: AY/fxX59IWGIqmdOmIWNqjMnRfqi4kOtcwive1+dqUgGcie7Vmx2nyORU89xPoCgcUx
 hlgOfKW/9iumSgs+OFyGHNnQ2yjtjgepNKU1zQAifpV4CAPeRDfGfy1WndQfjkExmGJu0n0pwUd
 gGu8vXL0NAHbIAKBpY9QVK9YMWuu2a/J/eO81BgInTdZBQ1/wSlb/hOTJDLSComisMJbg5+4p4q
 RJ+iiGvFa47JA77raqlxNjpN0SPIOhqZ47cME+JJVf8nAOgNPWglv7JKJgqISgnsD2Zg79yaM4j
 UtJsq+uSeE3jwdevXj87gk48nojeH7GuiM4eHbvw6d3KyZ9dzmFJjA402sAtyxQ8eP0ibANWIWI
 8LiWxum1TxM5rJMfCeW95ZaxF+M74UHDimrQmXPKARRosmIWK2N9dg7mbRcQHF83vlZudNHmPs2
 FN0R80J4AJSCi0TkOZ4kO5xgiEiEi5xg==
X-Google-Smtp-Source: AGHT+IFdoRZrRw5QtahV2gQwoNmNE41LBDvRqQFg+/l7MdbEQhD1YMberBYJd/2SCYxQ4wWDPjvV0w==
X-Received: by 2002:a17:90b:184d:b0:341:8ad7:5f7a with SMTP id
 98e67ed59e1d1-34abd848874mr17858772a91.18.1766040408650; 
 Wed, 17 Dec 2025 22:46:48 -0800 (PST)
Received: from LilGuy ([2409:40c2:1022:14d2:aaa5:8d6d:efa8:e19c])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-34e70dcc7bcsm1448312a91.13.2025.12.17.22.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 22:46:48 -0800 (PST)
From: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
To: swarajgaikwad1925@gmail.com
Cc: airlied@gmail.com, david.hunter.linux@gmail.com,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, simona@ffwll.ch, skhan@linuxfoundation.org,
 thomas.hellstrom@linux.intel.com
Subject: Re: [PATCH] drm/xe: Fix documentation heading levels in xe_guc_pc.c
Date: Thu, 18 Dec 2025 12:16:38 +0530
Message-ID: <20251218064639.7474-1-swarajgaikwad1925@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
References: <20251209094836.18589-1-swarajgaikwad1925@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 18 Dec 2025 15:38:53 +0000
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

Hi

I’m following up on this patch from last week. It addresses a couple of Sphinx
documentation errors ("A level 2 section cannot be used here") that occur
when building htmldocs.

Please let me know if the changes look good or if you would like me to
adjust anything.

Thanks,
Swaraj
