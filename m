Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53386EFCE38
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 18:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0367610EA98;
	Wed,  4 Mar 2026 18:31:13 +0000 (UTC)
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Wed, 04 Mar 2026 18:31:12 UTC
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com
 [216.40.44.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FA810EA97
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 18:31:12 +0000 (UTC)
Received: from omf18.hostedemail.com (a10.router.float.18 [10.200.18.1])
 by unirelay04.hostedemail.com (Postfix) with ESMTP id 5B9481A065F;
 Wed,  4 Mar 2026 18:24:07 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf18.hostedemail.com (Postfix) with ESMTPA id 0FFCF2E; 
 Wed,  4 Mar 2026 18:24:04 +0000 (UTC)
Message-ID: <3b5d09d245b427c37136a8ac268e6696db0d5b65.camel@perches.com>
Subject: Re: [RFC PATCH] checkpatch: teach checkpatch about the Assisted-by:
 tag for AI-assisted patches
From: Joe Perches <joe@perches.com>
To: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, 
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org, Andy Whitcroft <apw@canonical.com>, 
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, 	linux-kernel@vger.kernel.org
Date: Wed, 04 Mar 2026 10:24:04 -0800
In-Reply-To: <01d555cd41dcfc2ec48082a5bc80f014e8c39ed1.camel@linux.intel.com>
References: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
 <aadGPRx0Pbl2Uh53@nvishwa1-desk>
 <01d555cd41dcfc2ec48082a5bc80f014e8c39ed1.camel@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0FFCF2E
X-Rspamd-Server: rspamout06
X-Stat-Signature: 8ab3t116iasjeksyt65edhgf1ywbho8w
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18Ge5bV2/NzOshCaPBx1EiJTDTDR0qoXo8=
X-HE-Tag: 1772648644-553649
X-HE-Meta: U2FsdGVkX18QCB4A/K/exS/ZW7+EMbVhVJuBxwKQtvDebGeilj3kjYX9Q85p4zQOn/ND9awzbhFZtSGxIgriL1e4VA+IcOjvIkNZGMlSTbkdaAvYDMURTCmpuoEiZqnsJI1j/9uFfpfkHvJkzvJaLjNm6hafkURIIzmLXrBq14ObJc22fwwA5wgTCXLQrPKwUqFtRvhx5HDzecQ8xuPNjVQtBwupgbO3cqSGyPWEuixwEKMiP24yzUyQidjpfu1ttzfGtLxvNDrgNRxMzpriokVfYpe0/rRaEKi4tsuBGJMDT9sgYDAr4QMZeoeJwZkoUz4IsdPXuT0PElrslW6VRwn958lxpZ2ubm63/llGKDlyseeKWt0g3+qlYn08LEurxylpQk1VUQo=
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

On Wed, 2026-03-04 at 19:01 +0100, Thomas Hellstr=F6m wrote:
> On Tue, 2026-03-03 at 12:36 -0800, Niranjana Vishwanathapura wrote:
> On Mon, Mar 02, 2026 at 03:36:59PM +0100, Thomas Hellstr=F6m wrote:
> Documentation/process/coding-assistants.rst mandates the use of an
> > > uses an "Agent:Model" notation rather than a name-and-email-address
> > > pair, for example:
> > >=20
> =A0Assisted-by: GitHub Copilot:claude-sonnet-4.6
> >=20
> > Do we need the Agent to be specified along with the model given the
> > agents tend to me more custom built (or private) and model tend to be
> > more generic? Not sure if my assumption is entirely true though.
>=20
> Basically this is following
> https://kernel.org/doc/html//next/process/coding-assistants.html
>=20
> and this patch only ensures *something* is present for
> AGENT_NAME:MODEL_VERSION
>=20
> Not sure whether checkpatch should allow an empty agent, like
> :claude-sonnet-4.6 in this case or whether one should add
> <internal>:claude-sonnet-4.6. I think the latter is the most
> transparent of the two...

Dunno know neither.  These are the current uses in -next.
Perhaps unnamed is useful, but actual transparency would
require an actual tool/agent name too.

HEAD is now at fc7b1a72c6cd5 Add linux-next specific files for 20260304
$ git log -100000 --grep=3D"Assisted-by:" | grep "Assisted-by:"
    Assisted-by: unnamed:deepseek-v3.2 coccinelle
    Assisted-by: Claude:claude-opus-4-6
    Assisted-by: gkh_clanker_2000
    Assisted-by: gkh_clanker_2000
    Assisted-by: Gemini-CLI:Google Gemini 3
    Assisted-by: Gemini-CLI:Google Gemini 3
    Assisted-by: Gemini-CLI:Google Gemini 3
    Assisted-by: claude-opus-4-6-v1
    Assisted-by: Claude:claude-opus-4-5
    Assisted-by: claude-opus-4-5-20251101
    Assisted-by: claude-opus-4-5-20251101
    Assisted-by: Google Gemini
    Assisted-by: Daniel Borkmann <dborkmann@redhat.com>

Perhaps \S:\S validation, but the content will eventually get out of hand.
