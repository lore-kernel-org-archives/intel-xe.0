Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D81C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 08:48:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068AA89D39;
	Tue, 15 Jul 2025 08:48:53 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F6889D39
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 08:48:51 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id E00F03F1BA
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 10:48:49 +0200 (CEST)
Message-ID: <22a0d36b-cc96-4e51-9b9f-e387e7707b8f@hogyros.de>
Date: Tue, 15 Jul 2025 17:48:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: intel-xe@lists.freedesktop.org
From: Simon Richter <Simon.Richter@hogyros.de>
Subject: DC state mismatch during shutdown
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi,

I have a few error messages during system shutdown:
xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x2 -> 0x4000000b)
xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff4 failed, 
now 0xffffffff
xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x0 -> 0x4000000b)
xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff6 failed, 
now 0xffffffff
xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x2 -> 0x4000000b)
xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff4 failed, 
now 0xffffffff
xe 0033:03:00.0: [drm] *ERROR* DC state mismatch (0x0 -> 0x4000000b)
xe 0033:03:00.0: [drm] *ERROR* Writing dc state to 0xbffffff6 failed, 
now 0xffffffff
xe 0033:03:00.0: [drm] *ERROR* Driver-FLR-teardown wait completion 
failed! -110

Before I debug this: is this a known or easily resolved issue?

    Simon
