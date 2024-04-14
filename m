Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355C1C4345F
	for <intel-xe@archiver.kernel.org>; Sun, 14 Apr 2024 13:59:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D3B10E030;
	Sun, 14 Apr 2024 13:59:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dev-mail.net header.i=@dev-mail.net header.b="VEHEwJGL";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Qz2/5Rrn";
	dkim-atps=neutral
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE86010E030
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 13:59:10 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailfout.nyi.internal (Postfix) with ESMTP id 7A084138005B
 for <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 09:59:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Apr 2024 09:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev-mail.net; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
 :subject:subject:to:to; s=fm2; t=1713103149; x=1713189549; bh=ZO
 0nG2vlVMosNmMUZ4e7UtDAE6NS8HU41M4fB75swAM=; b=VEHEwJGL53YVMbnaXz
 Mc8noCFZpQmZ+mMX+aIIQH/s9aj/m6uxMWbqAEa5NAoCZ8FXA65oiaHWMIdixpTX
 EhWZQ1U764LSVtWW/pE43Jr4JcdgEybXb0NYroDt1Ss3WGZtfOYy4rXBfiCshbz3
 1DnTnXZ72l01yoD5ZQLBzBVPkrs170hxa9/KAMJFquGzAhOG56dEE4mHpe6zGrrm
 wLW5WeXoKkgYsuK4z6BNGyhUvzpqNw0heOzlSywZJw2kKSy+rAmi+ghUifVsPEGj
 YEtCtQa5jY0+yZgbhQEuQ5PbTk2WzgqPBAfpp0kRyBA9SmjhzZPpIFDeAU9bUkeT
 GhbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1713103149; x=1713189549; bh=ZO0nG2vlVMosN
 mMUZ4e7UtDAE6NS8HU41M4fB75swAM=; b=Qz2/5RrnOEIH5/XAol165qxnyy4R0
 3xx5KKm2BVofMw4Vw8HqP7lzkIEK4wUUYH/iYo3lSO4CdsgkicPWujjfQAw/o9Qf
 Qb96w6H3Ov5qvYR9wu5nTDbr7CvbXvH22ed0cgUijLFiiLDH8Xa+2oQeqqJz6kHs
 VbKrNbXuCQY9e9ZAHhhWUoOW9bd3lBdbtNjqDAQ2go6ohDzOSg9XwSk8fO5CAdKn
 CtGLyB9l47Q/1HrI11caJsuQ5ARBvvAwyhyXuQt+A8tJME+r8t+9lFyUAWPdxrGA
 urdQmEXHmiSASvwDamFKC98HPuSgrE1NR6Kyyu6jz5176BaaL4X23ktEQ==
X-ME-Sender: <xms:LeEbZjkCTl8_hRfLbZDeYTQd9SSZxcKKEaty7gf6tfcODoPjabmyYA>
 <xme:LeEbZm1EuGxq8KthQYJIXKoFfZxbMiGQA9jBgQq5HJNZUXEiHwQFOFa4H_rncv4Vu
 zUqxPvTjLHye87C>
X-ME-Received: <xmr:LeEbZppoy2mUPWnl5htaMB4V8KR0wxgPFMj1huDsUlRsDchPj5DJY3_QIiKnwN301ygc3vrf8obBSX03JJ0_mfoTrsDsPyIk5LBlcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeiledgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkffggfghrhffvufgtgfesthejre
 dttddvjeenucfhrhhomhepphhgnhguuceophhgnhguseguvghvqdhmrghilhdrnhgvtheq
 necuggftrfgrthhtvghrnhephfduieejieefuefggfevlefglefgudetiefhteduuedute
 evuddthffftdevjeelnecuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphhgnhguse
 guvghvqdhmrghilhdrnhgvth
X-ME-Proxy: <xmx:LeEbZrlRcQqXAZLQJO0T1Me9oJgJ2rNIq31qo75vl095lKt_yfTutg>
 <xmx:LeEbZh3Ge0KxqDpgzBmhMp88zzltiXbLQaLqPjBRqvkfj8EbdtPwbw>
 <xmx:LeEbZqsEVMyJw9T-r3ByWGj5dL4jaC5otv4l2WFPQbQPpL2yRZZ5VQ>
 <xmx:LeEbZlUwOYY-04ndBsy0Zxa8Q2RHmejHD0fe8Q1KEYIe9nM8Ggk5Mw>
 <xmx:LeEbZsSUnu6E2v6gIuJb2Br7E4x8hSIhcm_ceRtakiX4mukLzqdj-LSD>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <intel-xe@lists.freedesktop.org>; Sun, 14 Apr 2024 09:59:08 -0400 (EDT)
Message-ID: <746b25b5-b145-485b-bf70-2d4c2fd6d650@dev-mail.net>
Date: Sun, 14 Apr 2024 09:59:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: pgnd <pgnd@dev-mail.net>
Content-Language: en-US, fr, de-DE, pl, es-ES
To: intel-xe@lists.freedesktop.org
Subject: bug triage request, #1555
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: pgnd@dev-mail.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

gentle-ping for a triage request @

	https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1555

to either just get it into queue before it vanishes into the firehose, or if needs to be redirected.

thx!
