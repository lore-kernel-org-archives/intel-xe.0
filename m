Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECFB606A323
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vD33Wi1y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C644510F242;
	Mon, 16 Nov 2026 14:38:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F4110E004
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 17:30:46 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4bb6c7b6dbdso5095635e9.0
 for <intel-xe@lists.freedesktop.org>; Sun, 15 Nov 2026 09:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794763845; x=1795368645; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BQk1060IN0q7fJvzYOrYlSkwPYl/9jHOslklhh77j30=;
 b=vD33Wi1yXNXvx3wsyvb72xHJAyW4OmjUhh3yCeVeVlgZPzoPa/CxarmO1lK8y1f2Wu
 OU8S2rp+e4QIYcS1/p2KVOyqrr4x1umLt1DMwBmwt5/Wu6c3i7f3blohuNq5TXQtiHMf
 /jxC3QlomOsvzAYmXS5oFZT0g9+Z+f74X0yl20xmKaV5BaRPhjsh0Se4Ts4hPBQ9EOme
 0zleOnVmaMVItSrkUY5+xpAeMnkdfFkpiuwZjoQhUPw22KiTd6IKpHc9XN0+irfxfZpD
 srRdjw3Ztuwz1i3TK5wP+PxWd7MJPW+2I3Lc2f/Mn5XUAg+FpQPGxKhA6hsVwW69gw7Q
 Wx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794763845; x=1795368645;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BQk1060IN0q7fJvzYOrYlSkwPYl/9jHOslklhh77j30=;
 b=hLKdfmCng2R6QYEmlTNZyQKTpQ0RRq2lXGGjCiuJrd1dz39KXPuWAz+nPRnPHPCLzh
 LHBZjE2XiaTv9RWlzLpRvkcznRaffmKNhX7A9ZDjFb/Xm6CHb/1tkBplZRv/moys2cqG
 apz0cUWuVY/UzbItixhNQLyW8t0v2m5LegcDxs8HzIkSlF0RZuq19keTn/mNNG4fSA7S
 vj9w274vneEsgStcRXS6R5/nYd/JlSjgZIJfuagLZ4ksbHi3orrXZgAKL1Nctf0o++wL
 d2PbWfn219gl3GMDzFbGukFDRYfi9eG7/df9cIJFlTu5XoABmxEO+VtnodhfLBjBEKOv
 uaRA==
X-Forwarded-Encrypted: i=1;
 AL+hErFkcl/3vzEOsKWX8fXXCU377DlhmgPUUt+WUzflHirgapvxzW+8LWyXEhpEEQk8ZcUx5Dx7yaJKTA==@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9z+9g+rpgb0hkqTp9R3684EYVVBibgFApdzBDYd1y8H2HC6Hzd
 Ankax3quvisbVPxk/nTjyL6bnC5F/nkRIdqybnCNmzr2yLcccX0I/0ln
X-Gm-Gg: AYBFou1L9FSz10yYH41Hot+H4A4+UeJqSXl4Fkbtu6Mf/96zl/+QZx3MxrKM0jaLZwr
 w6GKpCqCNHXvqoDnhFajEmBrMQTNaqnVg/cgJZUNvf0KUyqOTZpMlvsVhMlIY5j0vuAhGzdQmTl
 zBl8Jb3PXKveK0fkOI7QImWxzt3nQIz81yrDk6IPRgitLBdRaEFOjdAIKR9Qb18Ey1jHeIoQ3d9
 kdIjqLBOurplpvUT42Ku9q5uYbjJbi4vHa6UGUMBaOVHfzNyMpZACLMzUZlDbQXp3TL7YGVlx1G
 81dDHh/XdOkI4m8qgZjbQ3fACLvAiIrOMW8fs14tYHuyTpJxmbFGDfsOlmGvGmON40/8IdPENk2
 Svt8Adh6rCYeNYTABGf7exYgcHLd9zFNIFGH7/SKxJCwB5fMZyBnnQzOv7qFD0GuauqFPiFvxNL
 ZvJnugpf79hHNhzi+Vgvtbdt2CbpDubvphlOkRjc2s03IkMeSNfI2wRsyYxLTfHcM+h1iJoic0q
 WvviMu/AyYwVRg28efkGanwMEj3RmbBCt7pUfj+7PelfKzr3aKvyqH+KEBm9u91KLrFNOSqVea4
 Jb4fu2sK1nKQF5jGdPTerKTY+4QdYFW5tSg5CAN3qDvK/Af5v6thCCVxEaendV0QV+nILm455+m
 FYlTQ5xLLHVchLWvAlk7eMzLPgcfslEMMa8M8hfJkgV1P
X-Received: by 2002:a05:600c:3e1a:b0:4a1:df52:3e36 with SMTP id
 5b1f17b1804b1-4bb55a878camr155447085e9.27.1794763844513; 
 Sun, 15 Nov 2026 09:30:44 -0800 (PST)
Received: from xe-fan-v3-testedby.eml
 (host86-185-73-183.range86-185.btcentralplus.com. [86.185.73.183])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e29daa5sm334451225e9.12.2026.11.15.09.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2026 09:30:43 -0800 (PST)
From: James R Taylor <jrtaylor11@gmail.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: Soham Purkait <soham.purkait@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Victor Ferreira <dev.victorferreira@gmail.com>, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3 0/9] Add fan control support
Date: Sun, 15 Nov 2026 17:30:33 +0000
Message-ID: <1794763833.7934.xefan.hermes@gmail.com>
In-Reply-To: <20261015190751.1268916-1-karthik.poosa@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Nov 2026 14:37:53 +0000
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Karthik,

I've tested v3 on a consumer Arc B580. Victor already covered the basics
on the same board with v2, and I saw the same on v3: the stock table
reads back, pwm1 writes are refused outside mode 1, 200 reads back as
199, and pwm1=0 stops the fan. (Full speed reached 3490 RPM here, so it
stayed under fan1_max = 3600 on this card.) So I'll only add what's new.

Hardware: ASRock Arc B580 Steel Legend 12GB (8086:e20b, BMG G21),
          in a USB4 eGPU dock
Kernel:   7.3.4 with v3 applied, plus 8721a51d4 ("drm/xe/pcode:
          Increase default pcode mailbox timeout to 10ms") and
          1a925ad51, which v3 needs on 7.3. One hunk of 8721a51d4
          needed applying by hand because 7.3's xe_pcode_read() names
          its arguments val/val1.
dmesg:    "Number of fans detected: 1"

1. Fan curves under sustained load. I compared three curves under the
   same load: six parallel 4K HDR HEVC -> 1080p HEVC VAAPI transcodes
   for five minutes each, sampled every 5 seconds.

     curve                      package temp     fan          throughput
     stock (pwm1_enable=2)      rose to 52 C     0 RPM until  721 fps
                                                 near the end,
                                                 then 215-300
     user table, 24% -> 100%    flat 33 C        ~1190 RPM    720 fps
     user table, 10% -> 90%     rose to 44 C     200-310 RPM  721 fps

   The user tables committed cleanly once the tenth point was written,
   and switching back to mode 2 restored the stock table each time. One
   thing to note is that the stock curve keeps the fan stopped under
   real sustained load until about 50 C, not only at idle. In table
   mode, duties of 26-31 kept the fan at only 200-310 RPM.

2. Temperatures freeze while the GPU is idle. Every xe temperature
   channel (pkg, vram, mctrl, pcie) held exactly the same value for at
   least 40 seconds while the card was idle, then dropped on the next
   GPU activity. pkg went from 44 C to 32 C and vram from 52 C to 36 C
   after a one-second decode. This isn't from this series, but it
   matters for anyone writing a curve or a userspace controller on top
   of it: an idle card can look much hotter than it is. It may be worth
   a line in the ABI documentation.

3. pwm1 while in firmware mode. Before pwm1_enable has ever been set to
   1, reading pwm1 fails with -ENXIO and logs "pwm not set for fan 0".
   After using mode 1 and going back to mode 2, pwm1 returns the last
   user value instead. Here it read 61 while the firmware curve was
   running the fan at its 10% point, so monitoring tools show a duty
   the fan isn't actually running at. Would it be better for pwm1 to
   report the current firmware duty in mode 2, or consistently return
   an error there?

I tried to test patch 8 with an s2idle suspend, but on this host the
eGPU doesn't come back from suspend at all: "Unable to change power
state from D3cold to D0, device inaccessible", then pci_pm_resume
returns -5 (the dock's USB controller fails the same way). That's a
USB4/eGPU resume problem, not something in this series, but it means I
couldn't test whether the user table is preserved. What I could see is
that the restore path ran and failed cleanly with the device gone:

  xe 0000:6b:00.0: [drm] failed to activate user fan table for fan 0, ret=-11
  xe 0000:6b:00.0: [drm] failed to disable user fan table for fan 0, ret=-11
  xe 0000:6b:00.0: [drm] *ERROR* failed to read fan 0 user point count, ret=-11

There was no crash, and after a reboot the card and the boot-time curve
came back normally. One small thing from the dead-device state, which
is in the existing fan code rather than this series: fan1_input read
4793553658, apparently the all-ones value from the inaccessible device
turned into RPM. Monitoring tools would show that as a real speed.

Everything else has been stable, and the card now runs a user curve
applied at boot.

Tested-by: James R Taylor <jrtaylor11@gmail.com>

Thanks for the series,
James

