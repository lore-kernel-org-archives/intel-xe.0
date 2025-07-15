Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34665C83F1D
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 08:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF17810E374;
	Tue, 15 Jul 2025 08:39:51 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798A410E374
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 08:39:50 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id B50993F1BA
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 10:39:48 +0200 (CEST)
Message-ID: <9c276000-9300-4e46-95e3-1373cfe8b64a@hogyros.de>
Date: Tue, 15 Jul 2025 17:39:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: EINVAL while registering interrupt for MEI GSC
To: intel-xe@lists.freedesktop.org
References: <20250715083132.3748-1-Simon.Richter@hogyros.de>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250715083132.3748-1-Simon.Richter@hogyros.de>
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

On 7/15/25 17:31, Simon Richter wrote:

> two quick Kconfig changes to make the Management Engine Interface available
> in configurations where it wasn't needed before.

By the way, that is not sufficient to make it work yet:

mei_gsc xe.mei-gscfi.3343104: irq register failed -22
mei_gsc xe.mei-gscfi.3343104: probe failed: -22
mei_gsc xe.mei-gscfi.3343104: probe with driver mei_gsc failed with 
error -22

    Simon
