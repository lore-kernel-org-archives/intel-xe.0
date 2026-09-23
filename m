Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26897C98314
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 14:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9953B10F0B6;
	Wed, 23 Sep 2026 14:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="p11XmyTX";
	dkim-atps=neutral
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com
 [74.125.226.204])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44B10E052
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 04:15:12 +0000 (UTC)
Received: by mail-ua2-f12.google.com with SMTP id
 a1e0cc1a2514c-97e7c796e3aso178118241.1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 21:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790136911;
 x=1790741711; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EURea47r5X4g8kyHzBjKCelWuNPAmm5ZX+TUa34qlJY=;
 b=p11XmyTXclVyiysulELsZqby/rF8vo4u9Vngzhh+LiCJGb0RvuX6aLv7md3mDDdPQJ
 BPjfvUlfC+dklgpVn7IObboJIFYRzMBW7NHB8aMyq0c8CW5CLbRZ/1GnfN8lDZmZ9dJR
 dJR+h/NWareHDii9fgISEHFfyuUjUWh1DeLfU5B4DW0lsIVpl/c7V0gZ97+1u68lV/G1
 FnI/4oCvMctfEUy2yjK24RmIPDWCB3gFxrZ6BIEH0YxxHwoJ4yGDETPJQqJ0mP3/SpFx
 mpbfYJ17vJE5nZ/4cQHGBfsbqL+6ur36OumXF1bVHlxOIrVIxwIvLpbVIMXk9iHpFX4Q
 82Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790136911; x=1790741711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EURea47r5X4g8kyHzBjKCelWuNPAmm5ZX+TUa34qlJY=;
 b=M9fF28NLHfuEFDlTeZrDnGN+/5SC9WzvfuVpH6P7xSNyOf/F/jcR3rk7/2yKqc17Ge
 tyMKv2LGgzG5edPmmwMVFBRSq/f0mg5AjNkVtm1sR5/QpKrg7xFymUWfWSHr2VSRvXwy
 mGmPankDrPzY2EEzdQJDzK2GG/c0BXFN4CyNAbKpM+Iv7l2eFVxIiNn7b05Mxw9CFw8T
 0WN6Tab9j0pfZOds+9R7cUNDHa+4+L7PqNw7GVC4+olYXe4VfYJZOWvcPheJIv4dGUyb
 fexBYz9d3GlxtuDn/RMUmjusoRoIC3DnrhU/tF1jbCe9+AZ0tpMKt61MzsdfmGUqkzGR
 Hknw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxBBO3CaJOJCNzSYMAGfMVEYyH+SDJ0onBg3DsZKnt7XXjrB/5pyiNWQ5gbFp8ZbgcNAnscK434EA==@lists.freedesktop.org
X-Gm-Message-State: AFuF++kEWR+k53xPu8VXfOh4DiDq8VaW5s3vLoAMmueMSYdo5hCsZph+
 9P75fWQPyQWgEn0TJ0XVkwzavNYRR55LQrxZ8XRJAJQFxrS+o08FyQagshlcwQMgoYs=
X-Gm-Gg: AYBFou33idhNRad25W5txVR/V7GKIzjDkjvhYhVVz2koSQYui6pabGlgHcepEJdFBCa
 HJCjg14V8MK9ZF0ptIrJ0JOptZfYVlTYDx+7+lqOZFTSIFYoO3lytrour46GOBWB7mQO1/AmXKl
 zJvwLLN70TsCjHJhQ4TZONYeQq85LpJIflUkoj4ZMGg+c+O8ROR94Iih+OYuMGgQa3tzi8p2NXf
 7UrtENvB9YZmD4ozABozD0bd1BYW9psMfgt8u+nXNhWOqSfx6SbUnXMgQVSOj/mnbh1v5z7zZIT
 4wezF+pogP0IH8fluFXgZp6O837QvQPtwyM3VNRNTuQkUEJ5w84uNtcNIO057gTpEX1JB1z9JfD
 Fi4mpYks3KVZHtWbZPjTaPeaZtySz7awYrbE0nx1LcoG3YUDbHWP38VV1rsmGHkebQRCiFAGXgX
 8lKnjY6LWnncUzDBAd8tUuKjZRKaSQ+06mFiaRgWyX8EWpaYQTYfr6kT6gMe+zrUCYS5C572Ibd
 lQgcTBmtZdcY1UEn6U4uxf0Sk9CloinuQEJJmJckTVYRN/Kgo1UssU/xsEyejtltLRP7/7NTERr
 eEf19+ID/mxzEn/H5T6jPUGkmASPr94k78/lkYENeuf3GYDCsyrs
X-Received: by 2002:a05:6102:32c3:b0:7a7:79c5:d440 with SMTP id
 ada2fe7eead31-7ac1b62639amr1256335137.13.1790136911061; 
 Tue, 22 Sep 2026 21:15:11 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::12ac])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-985169f579bsm2286869241.3.2026.09.22.21.15.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2026 21:15:10 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jouni.hogander@intel.com, animesh.manna@intel.com,
 ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH v3] drm/i915/alpm: Add a quirk to keep the fast wake ahead
 of the IO buffer wake
Date: Wed, 23 Sep 2026 00:15:08 -0400
Message-ID: <20260923041508.2148678-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904004308.185788-1-j@metarealtyinc.ca>
References: <20260904004308.185788-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Sep 2026 14:17:53 +0000
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

Please drop this series (v1 to v3).

The premise was wrong. With the fast wake above the IO buffer wake the
sink stops receiving selective updates at all, which is why the Link
CRC errors went away. That is also the "park" I reported in the bug
thread. With the stock values (fast = io) PSR2 selective update works
on this machine, so my earlier answer to "Is PSR2 working on your
setup with this quirk?" had it backwards: it works without the quirk
and stops with it.

The Link CRC flag at stock is not a failed wake either. The sink does
not resync, so my Sept 8 answer ("every wake fails and the sink
resyncs") was wrong, and so was the Sept 4 reading behind it (SU_VALID
in 2 of 94 polls on 7.2.2). I don't have
a clean explanation for the 2 of 94: that was an unscripted desktop
run, and the sink reported PSR inactive in 44 of those polls. With a
test client driving updates, SU_VALID shows in about 90% of polls.

Jouni, you were right about io >= fast. Thanks for the review and for
sitting through the detour. Details in the bug thread:
https://lore.kernel.org/intel-gfx/20260902162150.58778-1-j@metarealtyinc.ca/

Jake
