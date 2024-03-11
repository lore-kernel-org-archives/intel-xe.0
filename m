Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39275C5475B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 05:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E4B10E0F0;
	Mon, 11 Mar 2024 05:25:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K14WLtZu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037DA10E0F0
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 05:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710134701; x=1741670701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ajlgpdp/UGSydO+EdcKW2RnEYNc9e80EsDGMRnR8oqc=;
 b=K14WLtZuHXOgH0f7W5S/wrS4z/N+sr7XrKz+3dRhqwU+C4gKhgDDIjjS
 PaeJG0QpKtiVkvPB6zDXD937+TViCw2AVYTZ2feAoX6/JvWTlJKxilH05
 Uv9RTXj5jRdxGjXYHI/WkJvvdOaOBNjRiMEBjm6jS5F5Y/9G4nol3dQmf
 +1oVPwpjURxAnfmWQW+4HrsYEbumrG4emS74Uo7nlrwLlmB4ke5oO8Esr
 G1rROMB77z/a0sh/ejcpgFYe1N2BoOORtJDyWPbgs2jfUfGtm4Y5sXH3i
 CTAgtceumqJlMX/dDZ/iRbiMwl8eW5USUW8sTFvg0TNlbs9qcgG6nrpV7 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="16219272"
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="16219272"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2024 22:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,115,1708416000"; d="scan'208";a="10932387"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Mar 2024 22:24:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 10 Mar 2024 22:24:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 10 Mar 2024 22:24:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 10 Mar 2024 22:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n69UYe31pC82cmhH/FdhEPMcEWWiKpjd4niMxMYZLfqOLQz/mcuT5BmrW388DlUh45lLzVmVHPyV/a843cdOtRtdk87y9izj/fGsAinem46KF23JQo1YGWFA/cju/sJVliWztmQ6Aspa9oyFHgCXpXn/HHR+ul+E+tV+JqWmtRbVExkz5oKjwP6om8w70GAgvcYJKKwqstYLXnrWJp4YEAVmKnfsCsy7u91s67BIvJBI9YLsSqZEWeYeXlqabS4TZm+dgj5P2lePRk2CrbCSlyvw4cx1AFltGmw6pzHF0RW4oP3xwl7cNEJ2lYoBOUrGZj2bK5kkhfT/JUDpiqZuog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX2D6lCRS4rV/zMHLQL8QpIs1ncqKpVhcIy4zYsa3Z8=;
 b=YX4ulgjxMdzQmsy4zSkPn5MRZZ+L7NiCUR2870ob0X6vVn/21VyKZgcrOdku8XTFsALhlDGZwItaKBywHUUCyJr9yv7JnKOVjUlEiUnqE2fMdsmD/mf8cuh9JrgKgmKXkfUXAeO/1NUwnoi/psPhWJeK2RQZGkd3UFle5Sn8A5/5evzL2EVZGF8R5KpMVZhL1tk+U+6UJGjFvY7UKMEVj1eYSdkAep8L30W9WzEXLNTwL4ke/TOV+4JZeqB8z9onKW887bWVbwZWTN47pHp5uWb91USYLAG3xOW6wM5h+b7rDiVc3tVKWOluXZqzSYO5ooR67DLOL3iKlMA/L7p5og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DS0PR11MB8050.namprd11.prod.outlook.com (2603:10b6:8:117::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.16; Mon, 11 Mar 2024 05:24:55 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::b37a:9d1d:cb38:f4ff]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::b37a:9d1d:cb38:f4ff%7]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 05:24:54 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
Thread-Topic: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
Thread-Index: AQHacV+eWul1Ct9Y706vK7DewsLq5bEt/bYAgAQIRLA=
Date: Mon, 11 Mar 2024 05:24:54 +0000
Message-ID: <DM4PR11MB636045D57FAF90E78FB21271F4242@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20240308134817.1940638-2-suraj.kandpal@intel.com>
 <20240308154939.1940960-2-suraj.kandpal@intel.com>
In-Reply-To: <20240308154939.1940960-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DS0PR11MB8050:EE_
x-ms-office365-filtering-correlation-id: 884b4d5e-e87f-4557-79f9-08dc418b95ab
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1XVbf/h/MwuvX2PBtwEATZb8qMgW2NRO6fs7d3YRFdw12icjZvshVcTJrGTlbaDTzxqeao1tA72qlJ61KjhSRqptPzccq6eGfepNDPGTlK5AK8RGFkQ5+obspZd+NabuWCnjZQlCqcpVboTUdJNVCaVQvfMwFN2ad3X/scA6HP3DRlFsdHWbdAy8QR//cy1bJAdj92vEBLGNoPy7Qgzc0DuhUzi0xtEd7Jlu2T7EERr+Ynk27JyYtg7iyHR9l2wZW0KnIbph2YJuy8gtxbJlsRRWKVjHPVskRYZ/uHwR7eTtDi3Luxl/K0K7tE/M3YYuzPcjHWoMcZt411MPkCGbmZ3FmvzFTYXnuBGSYXz2iunxHdTsFpJMPZR3iANX/SexMi8ZCGEPJGLBjRx3qcdcAXObxWJYEnqZiR3btt5LXZmRVpJjj8dHXuI80N/pA/RE6g/MVVDwwm8TOq2N/ELvxIaZwAGNrUuNndLl6H6EKYWcZo4lmlso5P9VaCRdn7azHgRGzECuIL2/fFdzic8aCIrwKHIk3kaJZy2Q8wU3OXLO5c4UvPoGpCUBhLzekTuGfhc6n+rP6oHflWRXbLTLH9O3txrACCslpJ/oTinoQqgRYKqPgSTBXkntzSYGDaaen0R0t0xSZYXg58KXVIBJaivoJkp88aqjcXqsLnY7yQRDeR076wiuicEih0O22lxD4V66lDZHo3I3cDoHsGsDpnRVDnx3viBItSUL2Q31Mc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T1ZmY08cnMhQixHp5NgR9w0Ja95Zh5zxtK8p8Xn8wPMfRxY/X3/FxpswIzXm?=
 =?us-ascii?Q?pzDIXyYxRa13uHadDMEjSKj1/K2k8g9Zg+vebUhb07heTTaPhGDudwONGYGQ?=
 =?us-ascii?Q?so5RpePJjVv4PGevom4/TlWiRMxnPnrb1vrR34+PqfCMbw6DZDXL4x6wHIH+?=
 =?us-ascii?Q?NwJDlGGz3A8pX+PVfGCGbuPP1era9lPSkQ+LvzKWoyIC1F7jz8ThD346jit5?=
 =?us-ascii?Q?Mm2ERy54b8jY1GwuOt+AtqSES5BafWSt4rzgaR/qMTwISOEUJEYKRURaW+28?=
 =?us-ascii?Q?+EXh/50R2yZ7DITJ5hWTbdSh5vgb21IU5SVjXRm9HfvsBZuKcrehoQXh43bI?=
 =?us-ascii?Q?9MpC8RdCGai9QnmE0hRpfhGY6az9hNzL8o6fzHMhjqZWqrIHY0dSevhw+qq6?=
 =?us-ascii?Q?wbD7NYvBjFNdh1ytgmPGXaISVGSeVJrsOqwXl/5sy50pQveLA4Tbk09kSSkv?=
 =?us-ascii?Q?XAbmGXRDXGonz7Q3vYHs/4WQxIseYdauf7msLe9vo1m1S/Y7pIoByqjZPRjD?=
 =?us-ascii?Q?azY8RUWV03fpmJ9HmGwb8ek3qlXYkwrYrn7lsk8dQokvDCLXbzasUFP1KEiP?=
 =?us-ascii?Q?xpYWJAYCT8AzdNwCElv0N2mtm9FmTF0MtpYTDx5uvLtFGhQKyEDOjQ1wYsbN?=
 =?us-ascii?Q?7OQmBCIbHegzOzpn82djSkNjT36Gr8dTeJBYcmpMj0IhJZ6U/QRiqOksZEZa?=
 =?us-ascii?Q?LJOXF2q+WM0DVr+aXwAyFw8M3fATnN8S764bEgPkPnh15K/+mQUhr/qm+E07?=
 =?us-ascii?Q?Yz2ZQ+dum4b5zBYxdzVseycjY678+QhOq30tWnpbeffgv+gswjUdRuJsp1aV?=
 =?us-ascii?Q?h7xznzNxaCNunN96A63Oxlp4dXYpMnrLUsPwf2XqYAzIhraHEcyArazH2SnY?=
 =?us-ascii?Q?K3af3n8ApKNKKo9RDXMjOh89E4tMYJE9Ijvyd3rn4pKWGk4rqM8SO5h8UbEC?=
 =?us-ascii?Q?QXzi/z71CdwY2HWiBfaPnjwO+mlsignHJb9dNE4B6p7Q61d684LmXK2XnWve?=
 =?us-ascii?Q?eVBdp8HvdyfzKmv6OOthZAx85S5mCMhx6HFLebAeXH14qGDN8itlS65dVIHI?=
 =?us-ascii?Q?NDgVdi1sLTiNSbeV8OTPXE+deQi0AqrcD4uDYWChU0+93u/VCm0boB/Gg6CI?=
 =?us-ascii?Q?jksBQqgaSicyALPJP6fqq8G2vRNwwk7jXFgAt6IytFkWvBazfY4RtXcIMOiF?=
 =?us-ascii?Q?KM1/ApNSa7ujOOeB7bFOH1dIHZ3sHFPv5OMQQ5skbv1OuZwz4qWXzLwk4wrf?=
 =?us-ascii?Q?aQ3+hXpWr0il7ZQv45e19hMhqVDea69p66cRppTxmTRFZOOTps6zWQuPaLSr?=
 =?us-ascii?Q?992gXYz+EeZudmoveXEaorz8ajzgch75LK3vIqKOu6WmYG7kcywN0evNInSC?=
 =?us-ascii?Q?LEJz2tq9ZlyT/F5VBr5lyxzlI7q3a7Ix098Cur7wr0UI1pgAAi+sOrDANIru?=
 =?us-ascii?Q?e7B33k7f7hAs0h2E4M4m4HAjSx0iMqSb6FwjKwxL2NFa8GoN+1JTSX94nbD0?=
 =?us-ascii?Q?xvp48QozijrWUoFv6iQlwbd3pK2ZbHZ1lAD58SJuSoRYAVHt+cMOcRkPB64L?=
 =?us-ascii?Q?DpRXF71IdoJsKPFiAQsAa1IPUKXY51jO+Aftv31L?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884b4d5e-e87f-4557-79f9-08dc418b95ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 05:24:54.7039 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m4NqGTo623onv91ckLjvBXt89E9sQ3oubV3Q/d96QXpGLLWsauk/fZZZr4Ov5FiD6pXOCnym9tmAZnUCPwDfug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8050
X-OriginatorOrg: intel.com
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



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Sura=
j
> Kandpal
> Sent: Friday, March 8, 2024 9:20 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Kandpal, Suraj <suraj.kandpal@intel.com>; Nikula, Jani
> <jani.nikula@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>
> Subject: [PATCH] drm/xe/hdcp: Fix condition for hdcp gsc cs requirement
>=20
> Add condition for check of hdcp gsc cs requirement rather than assuming g=
sc cs to
> always be required when xe is loaded. It is not required for display vers=
ion < 14
>=20
> --v2
> -Use display version in commit message [Lucas]

Pushed to drm-xe-next. Thanks for the patch and reviews.

Regards,
Uma Shankar

> Fixes: 152f2df954d8 ("drm/xe/hdcp: Enable HDCP for XE")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/display/xe_hdcp_gsc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> index dcde1d0ac1f8..25c73602ef55 100644
> --- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> +++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
> @@ -32,7 +32,7 @@ struct intel_hdcp_gsc_message {
>=20
>  bool intel_hdcp_gsc_cs_required(struct xe_device *xe)  {
> -	return true;
> +	return DISPLAY_VER(xe) >=3D 14;
>  }
>=20
>  bool intel_hdcp_gsc_check_status(struct xe_device *xe)
> --
> 2.43.2

