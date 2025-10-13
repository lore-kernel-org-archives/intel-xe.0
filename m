Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF97CCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9FE10E13C;
	Mon, 13 Oct 2025 17:30:08 +0000 (UTC)
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C2510E13C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:30:06 +0000 (UTC)
Received: from dummy.faircode.eu (softbank126203194164.bbtec.net
 [126.203.194.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id C78AF3F0F9;
 Mon, 13 Oct 2025 19:30:02 +0200 (CEST)
Date: Tue, 14 Oct 2025 02:29:52 +0900 (GMT+09:00)
From: Simon.Richter@hogyros.de
To: Matthew Brost <matthew.brost@intel.com>
Cc: "Summers, Stuart" <stuart.summers@intel.com>,
 intel-xe@lists.freedesktop.org, "Auld, Matthew" <matthew.auld@intel.com>
Message-ID: <6aa691b1-1c7b-4534-8698-71cec3952d7b@hogyros.de>
In-Reply-To: <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
References: <20251013034555.4121168-1-matthew.brost@intel.com>
 <20251013034555.4121168-3-matthew.brost@intel.com>
 <a435a2a974b8627c945471e75c4dc21b835e9d22.camel@intel.com>
 <aO0zhM9xAMlnUDea@lstrano-desk.jf.intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Enable 2M pages in xe_migrate_vram
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <6aa691b1-1c7b-4534-8698-71cec3952d7b@hogyros.de>
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

14 Oct 2025 02:14:44 Matthew Brost <matthew.brost@intel.com>:

> I'm not handling this but I believe CPU pages are at most 64k on ARM,
> power, or longsoon. I could add an assert I suppose to make sure this
> unhandled case never occurs.
Hi,

POWER can also do 256kB, but that is a very uncommon configuration=20
because it requires the complete userspace to be rebuilt with 256k=20
segment alignment.

For that reason I'd expect even larger pages to be very unlikely.

=C2=A0=C2=A0 Simon
