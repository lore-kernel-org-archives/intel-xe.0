Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D666C54FD3
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 13:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D0810E774;
	Fri, 20 Feb 2026 13:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YgOGGEjo";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E6A890BE
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 15:45:14 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48371119eacso10281455e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Feb 2026 07:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771515913; x=1772120713; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvn6+xidEf2AX4Gd05o3pBBmbJYOag8CH+EN06HuqDE=;
 b=YgOGGEjo0YbeOj0heM57cHSlgk8D7X/5FBIByS0jA2Fq34DHrF/uTzS2PdBUprCkuI
 7fl4hywTTx73+DuPcJLYCXg6g8I9udolAeO4DZ0e4x4RJN6jY44NQKFkdDaGz9zOenT6
 d+vDadmxdsPbzw/KehTbofdUg3y6t4Zu/OM4hgrOibplH7DzmLWF3r8x/9fuZgWCriMA
 xSiokWh+Ayq3Ctyf1Jyq5EKglf9kF2GP06epPMuvwuua9pzyoahOuzrui/Cwo4otcAUK
 z5BibnzTjt44ZrwCtUzCBgz7CEaaapTsAyNNjkpLk/MB0brLqNk88If1okv708ue3Yct
 L3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771515913; x=1772120713;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kvn6+xidEf2AX4Gd05o3pBBmbJYOag8CH+EN06HuqDE=;
 b=TVSbzhipSjxaX585TW6mHaBDyZUfp91EWV9f1laqg+U6rSyHuxFPU2c3r7L0DJS7pF
 ByUUKLq+R62hASzCqB7IlzAtu/SQTRtxVYJbwCJnT1yzBUAj5kxNvPqAj/RbBCp0dAvw
 HHxVHwXjJ6zjlVl9cDr1XsOKsHgrSyqVR1C5yecouvp/IjTeZLq0aUHjXHtIRDnkwvgH
 aQJFrLrjpe7yF2zVMSCyUOAwqLmuzz4FGhUIogRRwtIIH+E4ioiLIe+t+M9+6ltCb/0B
 83yOMLt/zN2zkE7fHRt21bxbzwo+JZuqThl8swUUFZoPqQo1J83XBALW/RHbEXNbA4Dl
 GCnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS0gSV26Vyvz7/zxClMcBUqWfueLIWCl2brMsOiR742YpyjHKUXmpuSdLu+DLYx48Anwiy3lLR4w==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyCihixv57P+8F55MdWzUEn4vlOFBwh18RrfMqS7zGk4ZOHekY
 itc7puRSt+7yBIc8dPrDinRXRSyXVdlbAkHn1pllb8ChIcFw++F9qbhc8vuLTsu2f1Y=
X-Gm-Gg: AZuq6aI1ACk9cpt+Od6Who7pEBTfRfIGyro1wdTw8uOgMe+I6g4cYOltKOY+1GqW80w
 mNTqWwzdE2GyrIqhW9ZeFlj/UvM8tqfp4vEYGv3rs+IXMU4IpuhMvHQ6/LSlLFSw/lyJRtmxWPH
 cjJLzn4iujk2bifE9R2ZxhYyYurC/q0lUQTDGyPMww2nwM+0YaWuPBljVXYclNzQ+ZDafJsGAxR
 6U9mAJXVFTudjKo6GR+Gi1JbGX9xRejWOU/hIJx3TAcuYIw2293vU+DqZcloDNurVqClDNixkCw
 gWjYi0HBlVwAoNjjmiersemNVwhGiKFmHWp+JBxuvHUOg24K35EMWV6XFSbPTOZUJEMcr2snYq8
 S30KlxHcIu+IlYp10lyb0vVbHmA8rMR+f8VQWzYKqTsSLJsYTNU3lHwCciIAGDMN+sDqp34seGq
 T+0xXB3ghogwV2AniSMH1w/ReuMsWkFOxQi9j8Izxf7L9ZFokzmjGPI6+R+Q==
X-Received: by 2002:a05:600c:3542:b0:477:54cd:200e with SMTP id
 5b1f17b1804b1-48398a678cfmr103810525e9.1.1771515912461; 
 Thu, 19 Feb 2026 07:45:12 -0800 (PST)
Received: from JTOLLET-M-FKW7 (130.64.3.89.rev.sfr.net. [89.3.64.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31d1e8esm17527205e9.12.2026.02.19.07.45.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Feb 2026 07:45:12 -0800 (PST)
From: Jerome Tollet <jerome.tollet@gmail.com>
X-Google-Original-From: Jerome Tollet <jtollet@cisco.com>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: =?UTF-8?q?J=C3=A9r=C3=B4me=20Tollet?= <jerome.tollet@gmail.com>,
 intel-gfx@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 intel-xe@lists.freedesktop.org
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Thu, 19 Feb 2026 16:45:11 +0100
Message-ID: <20260219154511.86817-1-jtollet@cisco.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <73e0de50-b7e3-4315-ab81-0a3ecebc2363@intel.com>
References: <73e0de50-b7e3-4315-ab81-0a3ecebc2363@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Feb 2026 13:43:49 +0000
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

From: Jérôme Tollet <jerome.tollet@gmail.com>

Hi Ankit,

Thanks for the reminder. I apologize for fragmenting the discussion - I'll make sure to continue in the original thread going forward.

To summarize the testing results for that thread:
- SCDC polling patch alone: Works perfectly
- The v2 delay patch is not needed

I'll post this confirmation in the proper thread.

Thanks,
Jerome
