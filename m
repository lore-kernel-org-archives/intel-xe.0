Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00095CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 03:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE35E10E51E;
	Tue, 13 Oct 2026 03:50:19 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5310E51E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 03:50:17 +0000 (UTC)
Received: from dummy.faircode.eu (om126158158152.30.openmobile.ne.jp
 [126.158.158.152])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 9314E3F072
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Oct 2026 05:50:15 +0200 (CEST)
Date: Tue, 13 Oct 2026 12:50:03 +0900
From: Simon.Richter@hogyros.de
To: intel-xe@lists.freedesktop.org
Message-ID: <a9d1fc8c-4e13-4ef5-9495-d29e4713dd49@hogyros.de>
In-Reply-To: <18cd0c49-b9fc-4bf2-8929-7bd64e587436@hogyros.de>
References: <20261012104245.2108030-1-cch@e-psn.eu>
 <18cd0c49-b9fc-4bf2-8929-7bd64e587436@hogyros.de>
Subject: Re: [PATCH] drm/xe/hwmon: refresh Battlemage thermal telemetry
 under force-wake
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <a9d1fc8c-4e13-4ef5-9495-d29e4713dd49@hogyros.de>
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

did a cursory test, it seems the *change* in forcewake state is what=20
makes it poll the sensors once, and the "settling" time is not a power=20
state transition, but the time needed until the new values arrive.

If forcewake is set all the time, the sensors are still stuck.

I wonder If there is something else we could be doing to poke that loop.

=C2=A0=C2=A0 Simon
