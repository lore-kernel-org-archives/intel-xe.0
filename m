Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D3AEFCE2A
	for <intel-xe@archiver.kernel.org>; Wed,  4 Mar 2026 18:02:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9810EA87;
	Wed,  4 Mar 2026 18:02:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eh7OhObH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF55D10EA87
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Mar 2026 18:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772647327; x=1804183327;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Mc0fgLlktE26aHYazey99FjXGn2IHq/KL+UcVlk8PJU=;
 b=Eh7OhObHOUfsBoyt7CYMX0naHggYCfBWKpqE4Xd3AY2t1uWigXImKKMm
 zO9g+XaQh3UcH11Uj9HLD6L9QIFno6WhslGq+g4MfXjR5ZbsoLXJGXC9i
 nESO0zHkMaY264vCan0d14l9oAUvVprjVIoA3Htzj3Q8eqs/Sf/gUpwWR
 Tuyr8O93kEdvA0QzFxhD6L1ocwslhCci+kenguvAmuHUPUpzrpy4wN+7L
 xjhPOTfAmDmmeSP3mcQaO2O9+7heur92nEmAtBf6fOD4PkaMic7XtTYCQ
 IAQC2WgWTyy6sb8ejmdPB1BdHjaKUKAsI1h2n8GpavIiY+fA4vpjjZtck Q==;
X-CSE-ConnectionGUID: /N7fgbJFR2qRuGbx832R0g==
X-CSE-MsgGUID: BUbmufVwRd2T2lVHUfri9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73843294"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="73843294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 10:02:07 -0800
X-CSE-ConnectionGUID: JqsgrtJZT+Wnt2XFUqe0gQ==
X-CSE-MsgGUID: zKH1l8BkTkqMNCQkz1Uq4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; d="scan'208";a="217654137"
Received: from abityuts-desk.ger.corp.intel.com (HELO [10.245.245.170])
 ([10.245.245.170])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 10:02:04 -0800
Message-ID: <01d555cd41dcfc2ec48082a5bc80f014e8c39ed1.camel@linux.intel.com>
Subject: Re: [RFC PATCH] checkpatch: teach checkpatch about the Assisted-by:
 tag for AI-assisted patches
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org, Andy Whitcroft <apw@canonical.com>, Joe
 Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas
 Bulwahn	 <lukas.bulwahn@gmail.com>, linux-kernel@vger.kernel.org
Date: Wed, 04 Mar 2026 19:01:52 +0100
In-Reply-To: <aadGPRx0Pbl2Uh53@nvishwa1-desk>
References: <20260302143659.41882-1-thomas.hellstrom@linux.intel.com>
 <aadGPRx0Pbl2Uh53@nvishwa1-desk>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
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

On Tue, 2026-03-03 at 12:36 -0800, Niranjana Vishwanathapura wrote:
> On Mon, Mar 02, 2026 at 03:36:59PM +0100, Thomas Hellstr=C3=B6m wrote:
> > Documentation/process/coding-assistants.rst mandates the use of an
> > uses an "Agent:Model" notation rather than a name-and-email-address
> > pair, for example:
> >=20
> > =C2=A0Assisted-by: GitHub Copilot:claude-sonnet-4.6
>=20
> Do we need the Agent to be specified along with the model given the
> agents tend to me more custom built (or private) and model tend to be
> more generic? Not sure if my assumption is entirely true though.


Basically this is following
https://kernel.org/doc/html//next/process/coding-assistants.html

and this patch only ensures *something* is present for
AGENT_NAME:MODEL_VERSION

Not sure whether checkpatch should allow an empty agent, like
:claude-sonnet-4.6 in this case or whether one should add
<internal>:claude-sonnet-4.6. I think the latter is the most
transparent of the two...

/Thomas


>=20
> Niranjana
>=20
> >=20
> > checkpatch.pl currently emits false-positive errors and warnings
> > for
> > this tag:
> >=20
> > =C2=A0WARNING: Non-standard signature: Assisted-by:
> > =C2=A0ERROR: Unrecognized email address: 'GitHub Copilot:claude-sonnet-
> > 4.6'
> >=20
> > Teach checkpatch about the tag:
> >=20
> > - Add Assisted-by: to the $signature_tags regex so it is no longer
> > =C2=A0flagged as a non-standard signature.
> > - Add Assisted-by: to the standard_signature_tags list in
> > =C2=A0find_standard_signature() so that near-miss typos (e.g.
> > =C2=A0'Assited-by:') suggest the correct spelling.
> > - Skip the email-address validation for Assisted-by: tags and
> > instead
> > =C2=A0validate that the value contains at least one colon separating th=
e
> > =C2=A0agent name from the model identifier.=C2=A0 Emit a BAD_SIGN_OFF w=
arning
> > =C2=A0if the notation does not conform.
> >=20
> > Cc: Andy Whitcroft <apw@canonical.com>
> > Cc: Joe Perches <joe@perches.com>
> > Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>
> > Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Cc: linux-kernel@vger.kernel.org
> > Assisted-by: GitHub Copilot:claude-sonnet-4.6
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > ---
> > scripts/checkpatch.pl | 13 +++++++++++--
> > 1 file changed, 11 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index e56374662ff7..dd3327e8fa55 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -641,6 +641,7 @@ our $signature_tags =3D qr{(?xi:
> > 	Reviewed-by:|
> > 	Reported-by:|
> > 	Suggested-by:|
> > +	Assisted-by:|
> > 	To:|
> > 	Cc:
> > )};
> > @@ -737,7 +738,7 @@ sub find_standard_signature {
> > 	my ($sign_off) =3D @_;
> > 	my @standard_signature_tags =3D (
> > 		'Signed-off-by:', 'Co-developed-by:', 'Acked-by:',
> > 'Tested-by:',
> > -		'Reviewed-by:', 'Reported-by:', 'Suggested-by:'
> > +		'Reviewed-by:', 'Reported-by:', 'Suggested-by:',
> > 'Assisted-by:'
> > 	);
> > 	foreach my $signature (@standard_signature_tags) {
> > 		return $signature if (get_edit_distance($sign_off,
> > $signature) <=3D 2);
> > @@ -3107,7 +3108,15 @@ sub process {
> >=20
> > 			my ($email_name, $name_comment,
> > $email_address, $comment) =3D parse_email($email);
> > 			my $suggested_email =3D
> > format_email(($email_name, $name_comment, $email_address,
> > $comment));
> > -			if ($suggested_email eq "") {
> > +			# Assisted-by: uses "Agent:Model" notation
> > without an email
> > +			# address, as mandated by
> > Documentation/process/coding-assistants.rst.
> > +			# Skip email validation for this tag.
> > +			if ($sign_off =3D~ /^Assisted-by:$/i) {
> > +				if ($email !~ /\S+:\S+/) {
> > +					WARN("BAD_SIGN_OFF",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Assisted-by: should
> > use 'Agent:Model' notation (e.g. 'GitHub Copilot:claude-sonnet-
> > 4.6')\n" . $herecurr);
> > +				}
> > +			} elsif ($suggested_email eq "") {
> > 				ERROR("BAD_SIGN_OFF",
> > 				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Unrecognized email address:
> > '$email'\n" . $herecurr);
> > 			} else {
> > --=20
> > 2.53.0
> >=20
