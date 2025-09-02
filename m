Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E376CA0FFE
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 10:37:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C0910E658;
	Tue,  2 Sep 2025 10:37:02 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A2810E658
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 10:37:01 +0000 (UTC)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown
 [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 04CD13F1A3
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 12:36:58 +0200 (CEST)
Message-ID: <42b80258-cf6d-488b-ba6a-f1d3fff9d1a4@hogyros.de>
Date: Tue, 2 Sep 2025 19:36:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/14] Driver-managed exhaustive eviction
To: intel-xe@lists.freedesktop.org
References: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250901161250.5279-1-thomas.hellstrom@linux.intel.com>
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

I gave this a quick spin with Piglit (64 threads) again, no issues.

[59172/59172] skip: 7298, pass: 51769, warn: 9, fail: 86, crash: 10

I still don't quite understand how I could get into the lock failure 
path in v1, and if or how v3 avoids that, but it works.

    Simon
