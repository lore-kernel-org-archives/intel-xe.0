Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59582C9833F
	for <intel-xe@archiver.kernel.org>; Mon, 28 Sep 2026 13:59:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949BE10EA92;
	Mon, 28 Sep 2026 13:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="cRZPqkJK";
	dkim-atps=neutral
Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com
 [74.125.230.231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5D10E2AD
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 12:23:55 +0000 (UTC)
Received: by mail-qk2-f39.google.com with SMTP id
 d75a77b69052e-5332bdd8296so32270671cf.2
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Sep 2026 05:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1790598235;
 x=1791203035; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ackCyxWNUU3rNFIvxE9uMr/6z+0jDu2f3tDqHq/JIMo=;
 b=cRZPqkJK5jiZ/3O2iBCqvxbPVB/92uVgqH5YAO97sUFputThiBrUyVo4cUCZYiKzg+
 QGeQffju81/8MGgcG9crjEk6N953GJO4vruFTDUzLNKmWRejAp6oH2ddSfMmJlwmaJDi
 rFcNqgzPfDrSo/BBi6/HDExUfWaKp3F+57I4dKW8yYv1BUPd0xaSiihxfxhpfheCIoOm
 KethtFt9TN2q4Km/w6uSD9zk6PDYKYgdkmxLJTf2b+Uc/yPOTKFXpt9dG1j8ey9e10c/
 HliPzAe/kqepFYhyjeLM1OqxsQb6nucoyjXhcxRRRPpVuqqLF7m35cZiN8xoJKr1Iqt9
 LzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790598235; x=1791203035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ackCyxWNUU3rNFIvxE9uMr/6z+0jDu2f3tDqHq/JIMo=;
 b=YjnfQNizYs+6LZwga/wpv68Exeejq0DK7YtjxdAEajwTTZbgjUZ2EsbjoN0weQYyJ2
 iu/Hk5GOGR/LANxNy5+qSRL2MW+p9bRo98AFnq93isaE0Oaou7AEcu0+q4zcyU9vZk4v
 NWPVW6QlLibP+9Orz6Fz+GElmaENAWYOXnbotq/mL37iyAcz6wGoHZnctsYATH1ySflM
 OJdPAyfCW+egqW4fTZOPpt2/IIbGu/f6gGCOWJ2XbuotKxF2DKaZhxw1W7YZpkdlyDtt
 iIPzjZHnDFfNE4OhPplMFt1gS5HzPEDwH3mNcKpKnB7sZSWZR+CjdH5jIJTLg0s3bt1E
 P2lA==
X-Forwarded-Encrypted: i=1;
 AKwUvByoRNwvf2ITRZrIzHwvhc/Nk4sc1RD9tlcxfL+Q593kUCiEBrmVk2kJ0UvjdDDVdGfc3WOj4YqTFw==@lists.freedesktop.org
X-Gm-Message-State: AFuF++lksit2sY7Qtw/kUgbH0z//DkPyOvrGrXG5JpPLqLWTjqzkGHIU
 +RTrsFwvWeCA3yThGwTBUxyhWNzY8p5emccPK5NZM1JU2Hq9rXWEYh7GJFg1mueedWw=
X-Gm-Gg: AYBFou1WbfYBmPNRfhr6PWmew8kemiHXD9mmapyld9hc/n7qI5PCin1yUCuNu0bjvqL
 yNgeb9jjZruPRFyJlX94dBKqKmnrLvgcQZmbOPdnzPcCAXWdRClwHhCZzbdlMumBY1kdMUT32c8
 sfLpMVmmEscPjY6MpXe5V5pBRO0GGwft1y+MOHjgdkN8xCKWo8c+LBczL+32NyM6SvkmUXqei+M
 kzT1zIEfJAaVIJXwSlalgkRGH3mjuAz8uPFcB1ADMBw0z9cLBTMjAo8kkgqCr5Pqwdy/3BgsscP
 mem7LGHyuRsLe/qcKAIUgOMvBuMLzcblZpkK1FE3kLkENGqVbnSDZdrGVp47tf4ZemUA6gY9mj3
 iVIHnGSfTaJ8LbSKngPfpyvPWEt7QWW3Q5TrGdrJ9ePQGKGTJax/YMPxm0wnFzFJUoQJUDbDo66
 +79ErdI23ajRTHwSJ0Td/hUiXvESewUe/T5mactr7TJxzm2DbCk1T31ZtNvxjAHWMEfrhCKxlbQ
 eeapgvz6p6euI3bE+Yl7bQZegwHYaMG9BeXIdWnYlY+N592cC25lEB8Kzr82BReQ3aORovZHMR7
 uH/RWNfv1zyX/Qdn/Uwp7rIDm2QfUVseBciiOrU6bwlfG9KeIsbu
X-Received: by 2002:a05:620a:370d:b0:93b:d7a2:83cc with SMTP id
 af79cd13be357-93c43d235b9mr2074892585a.59.1790598234553; 
 Mon, 28 Sep 2026 05:23:54 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91430da9123sm78933846d6.16.2026.09.28.05.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 05:23:53 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 jouni.hogander@intel.com, animesh.manna@intel.com,
 ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
Subject: Re: [PATCH] drm/i915/dp: Don't promise AS SDPs in PR Active when they
 are disabled
Date: Mon, 28 Sep 2026 08:23:52 -0400
Message-ID: <20260928122352.51004-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923041342.2146450-1-j@metarealtyinc.ca>
References: <20260923041342.2146450-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Sep 2026 13:59:24 +0000
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

Hi Jouni, all,

Gentle ping, with an update on the stutter left open in the notes.

AS SDP bursts turned out not to be reliable on this panel, but leaving
the AS SDP on in PR Active is always smooth, also with 0x107 bit 6
clear. What works here now: clear PR_ALPM_CTL[AS SDP Transmission in
Active Disable] while vblank interrupts are enabled and set it again
when they are disabled. PR already holds DC_OFF while vblank is on
(intel_psr_notify_vblank_enable_disable()), so this costs no DC5/DC6
residency. Smooth here so far; I switched to it this morning.

Would that be acceptable upstream for sinks with async video timing in
PR? Happy to send it as an RFC on top of this patch.

Thanks,
Jake
