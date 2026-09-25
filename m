Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B5CC98335
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 19:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4932110FC23;
	Fri, 25 Sep 2026 19:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UWttT2gq";
	dkim-atps=neutral
Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com
 [74.125.230.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC20B10FA50
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 12:52:47 +0000 (UTC)
Received: by mail-qk2-f13.google.com with SMTP id
 af79cd13be357-939109f067cso80189885a.3
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 05:52:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790340767; cv=none;
 d=google.com; s=arc-20260327;
 b=ptytLvGk7mt+bzXczMJB4CBqh5KmowClbre0xcpwll5e31benzIIQhMP9px3P3l2MQ
 byYUn+ImxKjB+u9qhRJLHknrdGk5kO0khe/vJ+bkLHqiEksfFMJd2g/ntDN+ZtaxFIqk
 ihfIUDDEFqxb78JGy1LLDOB+bo+MXhdiY4GDm4t3spyIvdaRqLJd0QMRyujpRTxuDQOx
 2TPyvDpPsLglTgOn7tHnGBAlxNjrbZeyChL52RsmOARD0qpYEG/G8Attt1cBkvwM1GGe
 5rY1LSyxb67bpwN3BkOjiyddOZPtp0JtfVaMwl1tFpdqOv8me3wZzrok8WsjFuVsAoI+
 uW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9LWDCzcn0ysfmdsUdgkxA//1tZg5vvX+0Vm1HrB/0WM=;
 fh=7GWPjtqcha9sfTFXeV8WIk04kwkLa2pW3tdBw5SwvQY=;
 b=LEBKVnkrWeC+et1AcdnwoBSzs7eCpKElGZmGKMGYDuqeb+5WKYTApH4Ijc1oRLAwhX
 HZ4i6CBjZDlttfsiV7D9CdVfIpJQqvKmpq5q1dwPdNtAEECYFamPFBgXS2axa2JSiw8w
 EhUmJtShdrdb418WuYO8rCH4YfqZi45vV8JlFK5F4fdIHm/wXgEb5XvUDmVF9SjIuM5r
 XEJwtfYqZmrpBA0DTSFQdMbVdmFhlLrtAsuU4nuihwvRxMcEKq1ZEyPIlEJpkd0ppLDf
 TNQdOZZ+r/8Tjd2G3tf3YlRFW7xLw/US7vO+Jd771k41ph0h1wpmRyMTQbVt/QC0rn9G
 hCQA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790340767; x=1790945567; darn=lists.freedesktop.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9LWDCzcn0ysfmdsUdgkxA//1tZg5vvX+0Vm1HrB/0WM=;
 b=UWttT2gqZVLPbAc3FiQ6UUGZWc71HKtC/B9fYuDd5qL85uSR+/wc9OtTujQ9mTJw0W
 UO7LxC4yuGDfZ7UcyjXLpjhi4WO407347tRmvp8U8YJHROJ82XEugNWIy44v/suliVg3
 isYdQHw3bbfMqgLWvrwNMuPhuv6dmwWOUxfMrguj7ZpSeijQAK/w5BUQxEkoHvTKPhcx
 4zD/CxDAJBPgk1NydMPyLO344UYulyWFzYtET5Ub5pxal42wOLsn+W83zwZL+zqgEudx
 SQqG3A+NNqNNTT33p9INoEh4yc3DklM22rw6iR/P93G2drzEtFJ9N8vXBPZl+QLjF2On
 1mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790340767; x=1790945567;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=9LWDCzcn0ysfmdsUdgkxA//1tZg5vvX+0Vm1HrB/0WM=;
 b=HvGJ9cWoQw3x9F2VqqZWS7cAnYH7hvXqv6pQqq7UkxZ7+CJCchEnL7j467lRF2HYbt
 HQNBjE+piQPwgXwh5/d36kJkyhSGQlqJoXDlXNNB4PX2tMSJyLJxv0gAFEBQC/xKOZ/v
 7WtWnvNWEmxeIsBmcZL1iEK/NpvW8WJyaUdkoR9vo97LPuq4rnarvDUKjnxTesxun4oF
 Eie7jMM4wDjuhikf/tilPQrLxvYhJhJHPD9Bmh4CWGjVsdP0n4i80tmVPJvo/AsBGsEu
 BvIOsa087quJiZp4ICIgJ6lCOB5kkZvym8XPCEYa4yuVNtQnO8GJ9/Ryma5wUUX8eXLT
 xfFg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwbzB445j4xR1qY5WehjWmApXCw6pfzKwu4OEDSbGuNX0lDQFLh507vSEKzFJhrkjCvJZqPPMEr0g==@lists.freedesktop.org
X-Gm-Message-State: AFuF++mN7I2T6JxqL7DUT6XXW+CihdJaxQXN14axTMGcdQ+9duwnjeuR
 /LPhtjg0BkGBT0vbdlmntehF4sgDjmRC7hluhS3rR87rRL1RqHQ0Oua3a1KW5Fwh91oKL8jLUhb
 e0Bs+yDcXxYpMGtEPWMHqZW+MFKQ3ZYQ=
X-Gm-Gg: AYBFou3QaAOb415FliH3vaClNRoWDJNC9fszR3US+pZ9bFDAKS9Addwcp4BuleY0k41
 ym7KxB1GwKPfPbfzYn8JmVxwN6DtsMYKKsMeFeZwLsCpQKUpdzQILo08LC1ciWP8ErNgkRsFUXN
 RI7UiEMIF7EV+XhcYFGn26wIj35wtQOCfqVFraQrxULyNKtFaR+5CpsL5dtmMIsFceK9PZTTHh1
 +SrCgu+0vXodWVfOm4ZcM/nbh40jxD2G8iplZ1XLeMnjobsGc+2H0BFo1bbo+LFdwLAZEXkaYKN
 Dmf6AMbiu6Tr80dydXaXRui6XEnBZjj7hM1NZ8eehXJDO5V5t1nffSj/GQ==
X-Received: by 2002:a05:620a:8389:b0:93a:3d22:3122 with SMTP id
 af79cd13be357-93c43cc7043mr442767385a.3.1790340766713; Fri, 25 Sep 2026
 05:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260908044035.62093-1-mario.limonciello@amd.com>
 <20260908044035.62093-3-mario.limonciello@amd.com>
 <0fb724cc-ac12-4502-b338-1c4f310f043a@suse.de>
 <CAFOAJEdFPrwHZV5y1E_u_Wd6oE_viPsPztxYW6PRZHJ-zdPFMQ@mail.gmail.com>
 <ff86caeb-4388-4660-b3c0-ddc42bc274e3@amd.com>
 <b60d3430-ca99-40b6-aaa0-7b8d481ebda6@suse.de>
In-Reply-To: <b60d3430-ca99-40b6-aaa0-7b8d481ebda6@suse.de>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Fri, 25 Sep 2026 14:52:34 +0200
X-Gm-Features: AclHuK_7Zf-6pQcm6muMqKFw6mcOuy1gYopDSlUKmT8vyhgjq4Te-A38Cn1BR-c
Message-ID: <CAFZQkGzUuOh2tGa_otw7yDUd9rSne2PG5Vdte-hwhLZEDf24dA@mail.gmail.com>
Subject: Re: [PATCH v8 02/14] backlight: add kernel-internal backlight API
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 harry.wentland@amd.com, Simona Vetter <simona@ffwll.ch>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, amd-gfx@lists.freedesktop.org, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>, 
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hansg@kernel.org>, 
 David Herrmann <dh.herrmann@gmail.com>,
 Marta Lofstedt <marta.lofstedt@intel.com>, 
 Mario Limonciello <superm1@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 25 Sep 2026 19:10:48 +0000
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

Am Di., 22. Sept. 2026 um 14:05 Uhr schrieb Thomas Zimmermann
<tzimmermann@suse.de>:
> > The whole design here is to put the compositor in control.  For
> > example if compositor wants to enforce brightness to be a certain
> > value when certain content is being displayed.
>
> And as I mentioned, it might not be that easy. Sysfs has been the entry
> point to backlight brightness so far AFAIU.
Yes, but this doesn't remove or break the sysfs API for old userspace,
it just allows new userspace to handle things more properly.

> Did you consider treating this similar to display hotplugging?  When the
> user plug a display in or out, the DRM driver sends a message to the
> compositor in user space. [1]  I think it might be possible to do a
> similar thing for changes to brightness.
Notifying the compositor after the fact would not be ok. All the other
display properties are under exclusive control of the process that
holds drm master, backlight being different is one of the problems
fixed by this new API.

- Xaver
