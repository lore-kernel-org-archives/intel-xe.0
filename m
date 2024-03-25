Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C0FC54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 16:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A85210E9B8;
	Mon, 25 Mar 2024 16:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="Favlhtiv";
	dkim-atps=neutral
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50E10E9B8
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 16:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=iqd5OHPf33Dh5alJMaoDDA/B+/g9AZhWz6dwwQoYzH0=; 
 t=1711385294; x=1712594894; b=FavlhtivaKjIDTQIZOwzvHAiTPXfa8iExns4goKWpNFK7gT
 nQo8oQaICwJ9UMNyCjP7lQivN388HX8qxOwAnUQTpxLOJhtLiQ0YRr/Aw8IyyT/+YxtoEotht9lNZ
 SsLmQTrti2WYj2/8EvPp6DgO/OOhqZH0xLGMh4m8RLoekwRHaWhDtzxsJBaZBy15IKDa+tnQU/66/
 N6VpZreOlIEU4//715nJDW0AYU/vC9B5JPPJZddqBdiRdjMHqp0+WLx9jNA7K2J7h8rpwEH864kdr
 gDtZucLL609flzlS6zplDGz1M2wn1xL8ZomM7vt5HBe6ztCdho48ivq+BlGFSAFg==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97) (envelope-from <johannes@sipsolutions.net>)
 id 1ronUY-0000000DxcA-1M7f; Mon, 25 Mar 2024 17:48:10 +0100
Message-ID: <4aa1f6ae3ac72a5eb3303740242d53d46a338d6b.camel@sipsolutions.net>
Subject: Re: [PATCH v3 1/4] devcoredump: Add dev_coredump_put()
From: Johannes Berg <johannes@sipsolutions.net>
To: =?ISO-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>, 
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, Mukesh Ojha
 <quic_mojha@quicinc.com>,  Jonathan Cavitt <jonathan.cavitt@intel.com>
Date: Mon, 25 Mar 2024 17:48:09 +0100
In-Reply-To: <20240304143905.52740-1-jose.souza@intel.com>
References: <20240304143905.52740-1-jose.souza@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
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

On Mon, 2024-03-04 at 06:39 -0800, Jos=C3=A9 Roberto de Souza wrote:
> It is useful for modules that do not want to keep coredump available
> after its unload.

Why not though? Maybe if this is a common case we should have devm_...
coredump functions? Dunno.

Anyway, I'm fine with this, even though I'd like to see a bit more
discussion than "do not want". Code looks good.

Reviewed-by: Johannes Berg <johannes@sipsolutions.net>

johannes
