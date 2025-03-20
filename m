Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9EEC36000
	for <intel-xe@archiver.kernel.org>; Thu, 20 Mar 2025 10:26:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D3710E5C9;
	Thu, 20 Mar 2025 10:26:45 +0000 (UTC)
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Thu, 20 Mar 2025 10:26:44 UTC
Received: from smtp125.ord1d.emailsrvr.com (smtp125.ord1d.emailsrvr.com
 [184.106.54.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7CA10E5C9
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Mar 2025 10:26:44 +0000 (UTC)
X-Auth-ID: kenneth@whitecape.org
Received: by smtp16.relay.ord1d.emailsrvr.com (Authenticated sender:
 kenneth-AT-whitecape.org) with ESMTPSA id 40CBF40190; 
 Thu, 20 Mar 2025 06:19:57 -0400 (EDT)
From: Kenneth Graunke <kenneth@whitecape.org>
To: Zhanjun Dong <zhanjun.dong@intel.com>, intel-xe@lists.freedesktop.org,
 John Harrison <john.c.harrison@intel.com>
Cc: Julia Filipchuk <julia.filipchuk@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Disable lite restore for MTL
Date: Thu, 20 Mar 2025 03:23:02 -0700
Message-ID: <6142361.lOV4Wx5bFT@imeretto>
In-Reply-To: <76f06baa-59b2-4d6a-87e5-a89a2d94904b@intel.com>
References: <20250319172825.3334036-1-zhanjun.dong@intel.com>
 <76f06baa-59b2-4d6a-87e5-a89a2d94904b@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Classification-ID: a7f926b3-81f5-4d45-b809-74c4bf509bcd-1-1
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

On Wednesday, March 19, 2025 1:20:40=E2=80=AFPM Pacific Daylight Time John =
Harrison=20
wrote:
> On 3/19/2025 10:28 AM, Zhanjun Dong wrote:
> > Lite restore for MTL is not POR for Xe, then disable it for MTL.
>=20
> The point is that it is causing unexplained problems. And it is Xe as a
> whole that is not POR on MTL, not just lite restore. Hence no priority
> to investigate what is going wrong and how to fix it properly.
>=20
> You should also reference the upstream bug that this is in response to.
> I think the tag is 'Closes:'?

Better yet, I managed to track down the missing invalidation.  I've just se=
nt=20
a patch to intel-xe@fd.o titled "drm/xe: Invalidate L3 read-only cachelines=
=20
for geometry streams too" [1] which fixes the underlying issue and makes=20
=46irefox render correctly on Meteorlake with lite restore still enabled.  =
And=20
probably fixes other bugs.

Assuming that patch is acceptable, I don't think we'll need to disable lite=
=20
restore.  Which is certainly preferable!

=2D-Ken

[1] https://lists.freedesktop.org/archives/intel-xe/2025-March/073997.html


