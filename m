Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9323C38142
	for <intel-xe@archiver.kernel.org>; Tue, 31 Jan 2023 14:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC3D10E351;
	Tue, 31 Jan 2023 14:04:55 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3595D10E351
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Jan 2023 14:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675173894; x=1706709894;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=nODxI/GR0qZAyKhTnOhi4nZEmcT+x0f+AWVEl2HGm8M=;
 b=XLx+Ty8A1kMHPaeRuXFKaYmTgAQ7h0rYcRgHtPXZSo4MPeizniVG8u8t
 sg1inQFT373wkUu4x52E6DPpiyyUI5ZZlf/Ch6/8QdQaomfAT3OBLPGpw
 7NbrZrqH2rsIk5No4noe4G+oIGNrEhSrKODeP9nDpabeg6hNOd24fcu1/
 vlETirYgkhPSRqei85Dy49FcmX8sV9wV8VuhVaGv13j9Ch3ireQac2t2f
 7sV1Tq+Ez9DNAYlUWL5rkMUq26mgzzJ5q6ILRpNU517FtOJj/3u7s/ZS7
 5RTFVHAFv+COj5afm9mJsyrOhAeHL19y1nZ88/fAZCTbw+/PdpHL3ZOqn Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="355173587"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="355173587"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 06:04:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="694952532"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; d="scan'208";a="694952532"
Received: from jmyrcha-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.35.97])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2023 06:04:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
In-Reply-To: <116ea3da679ea8a34379fb83e8edc6842ae73419.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230130161723.42602-1-jose.souza@intel.com>
 <87o7qf2mll.fsf@intel.com>
 <116ea3da679ea8a34379fb83e8edc6842ae73419.camel@intel.com>
Date: Tue, 31 Jan 2023 16:04:08 +0200
Message-ID: <87fsbq3inb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add fake workaround to maintain
 backward compatible in MI_BATCH_BUFFER_START
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
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, 31 Jan 2023, "Souza, Jose" <jose.souza@intel.com> wrote:
> On Tue, 2023-01-31 at 09:24 +0200, Jani Nikula wrote:
>> On Mon, 30 Jan 2023, Jos=C3=A9 Roberto de Souza <jose.souza@intel.com> w=
rote:
>> > +static const struct xe_rtp_entry lrc_additional_programming[] =3D {
>> > +	{ XE_RTP_NAME("FakeWaDisableNestedBBMode"),
>>=20
>> Please add newline after {, and indent with tabs not spaces.
>
> All the xe_rtp_entry arrays have this style pattern, just following
> what is already in the file.

Yuck. :p


--=20
Jani Nikula, Intel Open Source Graphics Center
