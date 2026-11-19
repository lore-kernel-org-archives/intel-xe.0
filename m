Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11167606A325
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 23:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agmQRaBl
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC24A1127C5;
	Thu, 19 Nov 2026 23:39:41 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CDF1127C5
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 23:39:35 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9D2FF61407;
 Thu, 19 Nov 2026 23:39:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E111F000C4;
 Thu, 19 Nov 2026 23:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1795131574;
 bh=cI7neNdWWYht8R2pRpPC6a7OtjZ1bTsM5Lm87GMQJ8Q=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To;
 b=agmQRaBlnRQz+4i2K34hHiWFet3cqNaGy+rIIuGNDMQyS6CCXYGX4f48su1vNmqTH
 lcWPu/37Ig2eOx3MisZbCN8uOn0eYQYK4As+PXpuBL8RPb6yhiBgIkTN7uCe9ip4RD
 ASwPDmxcgqVeGE0ekThVF+/G3URZLtIhCnE01BUQnMutEtMI5kKzV5e7CTMmgt3XiG
 u0iTgpes0A5UD9jLbGmE8Vtzf57UKmzeCEDWgFyTnRK7ooazfern61n/++lcQ4djh7
 37YrgNelUeFr05yRxj5FJ4ooavph5VVbSDca7+8KQ48JgRk+pTQJN2O7Y7mXrCIU1n
 8BVcyjloWlN2w==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 00:39:31 +0100
Message-Id: <DMZL176U197K.X7ODAO4CRAOY@kernel.org>
Subject: Re: [PATCH 1/1] driver core: platform: tests: add a shared software
 node test case
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "bartosz.golaszewski@oss.qualcomm.com"
 <bartosz.golaszewski@oss.qualcomm.com>, "heikki.krogerus@linux.intel.com"
 <heikki.krogerus@linux.intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261118223023.19653-3-stuart.summers@intel.com>
 <20261118223023.19653-4-stuart.summers@intel.com>
 <av9hGMZz0SZyxCQR@ashevche-desk.local>
 <c45020ffef39314cee4093ba54e6ce7e0b1b187a.camel@intel.com>
In-Reply-To: <c45020ffef39314cee4093ba54e6ce7e0b1b187a.camel@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Nov 19, 2026 at 11:37 PM CET, Stuart Summers wrote:
> On Thu, 2026-11-19 at 22:50 +0200, Andy Shevchenko wrote:
>> On Wed, Nov 18, 2026 at 10:30:23PM +0000, Stuart Summers wrote:
>> > Cover the pattern used by drm/xe + i2c-designware, where a software
>> > node
>> > assigned as a platform device's primary firmware node is handed to
>> > a
>> > second device via device_set_node(), and make sure removing that
>> > second
>> > device leaves the owner's node intact.
>> >=20
>> > A potential fix for this issue in the drm/xe driver is being
>> > discussed
>> > in [1].
>> >=20
>> > The signature in this case looks like this:
>>=20
>> > Oops: general protection fault, probably for non-canonical address
>> > 0x6b6b6b6b6b6b6b73
>>=20
>> This probably was a single line, make it so in the commit message
>> despite its
>> length.
>
> Thanks for the review! Would you like me to fix that up and resend?
> I'll likely need help merging so is this something that can be fixed up
> as part of the merge?

This can be fixed up on apply.

Did you check the Sashiko feedback?
