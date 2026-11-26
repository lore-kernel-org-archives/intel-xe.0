Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A435A606A32D
	for <intel-xe@archiver.kernel.org>; Thu, 26 Nov 2026 15:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ho+o73rZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=bv7bQlZT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D44210E9E5;
	Thu, 26 Nov 2026 15:32:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C88C10E25E;
 Thu, 26 Nov 2026 15:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795707127; x=1827243127;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zd8ckSQ3ZLTc04hqiIzpMQ/gGDsCbAxE3iJC+j1YoMk=;
 b=Ho+o73rZAHZHOKGeh1OYtt62KFfoGar3+UkIBFD/99m6o/VfQPhiWoHd
 C5OVCzWn2osrxRtmBi3xPy4Um9tn2xPpp+RmnyWHwa/IIHN+0NQx4hypp
 WvgRbOPZu9I/kOc5iUNc3kxiITAkb7qNuotM/MCTuOVI2PdNIRE4OZVzj
 C2JekRYouTeuFV+FEoA/jY8TjqpWKIOYzqNtD/xbzCNGLJRMKAnrq3kms
 +17ob7p4/W4HxubDusr/CIREAifMTJW2zoTG3i5RvWmjnIKRCBNTKmXX1
 okPQ6FyCMDLO0DEFyrNjPLLq6N1ctdq8A6bvvn+ME92IsTYrIyj01J2BH g==;
X-CSE-ConnectionGUID: LiICbRAFTDWF4sepLlGkvQ==
X-CSE-MsgGUID: ZrZ0E4yNTIae3lGq8AANQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4529528"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4529528"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 07:32:07 -0800
X-CSE-ConnectionGUID: fXG2wLggQbOXIVv7xR3j2g==
X-CSE-MsgGUID: VBMZtFpTS7e83tBflT/3GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; d="scan'208";a="12428449"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 07:32:06 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:32:06 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 07:32:06 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 07:32:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P3lnQ/Bs7HQCVyqP6wpNLFhX2rPU+ZYIAs5S61KMr9sgNQZUGfPOdZNAhGpHQWPXwn3+iU4WadktY++lMui2o5BG+3bq++F4Z+dZHLITlHiftLdrJef9o2qD38r38J2/Ytpf7r9I6bid5chhGPxVF1nsJNh/QbM+SIHFcvaHv2s9L8usODObOkfOSRc2hJVUrvYQDTcVqpEPGQq08snTVUw2ChHklCNgKAIR9td2v0+7jleBFQ4RHArMKEquSnhwRA8jD3GElca/JZlnTzrDZt1imQuwCVdh2mDk5qtHw5Rx/iRtxUHM3dL7HvipWg2ymMuSxwxxkSUXncOQqMc2zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEYOlS2Sp3CpzfWqy1hLL8X3l3+xCdP9bjDkT57Covk=;
 b=M18tDHZpFZd5qACAtbrrEnTCrvuLn/6YzY7oIZP8wItDZCH4RpqPzOJkketDZRtgDd1BX2tkRn/dAnY6pzmnBO4keo1UkuFnYLtTQxZCoEagQopLpNQrrxLQaJavYBEXd7Vq62u3J5rcIb6ypYxnZKZDOFbfJ2BlPAKREBbSEqingZo3zFUFoernumV00jQg4xqwE3IvU3SI+4mWcHR6nOYGTkSxsuMPN+2ffoxRmCgz7vOQVHLUW30pSepj1pM6E6o5cFSyPkRdotPs5FEpRZ84fHuOCaf8q+CHu1OYPp2ufbSzbDliCflFstjaiZ3OdllgQC3FqvebwAqoH9CMHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iEYOlS2Sp3CpzfWqy1hLL8X3l3+xCdP9bjDkT57Covk=;
 b=bv7bQlZTpvCVbRJ3Yf1YJJze9Bp2UX1RoVbFV2gPjm0DRCPtd+qZzQTS2C7udG30zuBWW3Pk0v7TxtkDreLhq0rltvESJa+RWTy+d1Z6MEOWVKAMSIC0S9gePIjiNo4OtPI/9ODvTV/P2/msFmwPDarg+5gdWb4bVjBPqEWsSp8=
Received: from BL1PR11MB5383.namprd11.prod.outlook.com (2603:10b6:208:318::20)
 by MW4PR11MB5775.namprd11.prod.outlook.com (2603:10b6:303:181::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Thu, 26 Nov
 2026 15:32:02 +0000
Received: from BL1PR11MB5383.namprd11.prod.outlook.com
 ([fe80::4277:f517:aed1:ff1]) by BL1PR11MB5383.namprd11.prod.outlook.com
 ([fe80::4277:f517:aed1:ff1%7]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 15:32:02 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] Revert "drm/i915/cdclk: Deal with 2 PPC hscale issues
 when calculating min CDCLK"
Thread-Topic: [PATCH 1/2] Revert "drm/i915/cdclk: Deal with 2 PPC hscale
 issues when calculating min CDCLK"
Thread-Index: AQHdfZ1IGoa7lTu9EEOCe8tyCNPqi7dAQ5sAgAA3IrA=
Date: Thu, 26 Nov 2026 15:32:02 +0000
Message-ID: <BL1PR11MB5383F70EAFEEB0C044A0B959F4422@BL1PR11MB5383.namprd11.prod.outlook.com>
References: <20261126121827.1951200-1-uma.shankar@intel.com>
 <20261126121827.1951200-2-uma.shankar@intel.com> <awgiMrUUq4h8wc9M@intel.com>
In-Reply-To: <awgiMrUUq4h8wc9M@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5383:EE_|MW4PR11MB5775:EE_
x-ms-office365-filtering-correlation-id: 42800428-cbb9-44a6-5af4-08df4bd26b5b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|261009223027099003|22082099003|18002099003|10067099003|5023799004|11063799006|56012099006|261102123227099003|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261022105027099003|38070700021;
x-microsoft-antispam-message-info: oGnY/RXQ6HwQYlFldUwPWHBbPnhfdtZKYWpjbUMzIUeEI1+fgT8NPUFMeOmfI5EmfTEZ2b1MtGMrGje0winj+eUmZs+x1k34CP3Tezg76kkf8W4jmmLvQuysFz3+kFElEkpXpTkXIf9c0smvpTxmnOquV1rzIF5gu4MJu2djbAfGD88N1/AZcoGC/mqLdGn+ONgs/Eeme1tnls6XzRTAEZTYUt0hw582YN080kyGcCBQqRmQSE+0JYxLOEcCG3u0dfKPxDV5xSYNvJTftBDcRRkDzu2iB4dK89HsuWC5LpUGIYW8gk6eSeShRBe3KNe7tCTLAQYIJ7zobr1N2Zzpn18QNyFFTe5ARdv6qdt7NFbVlvT1kTwL3b0rokuDlHK0Ruaa8Jy47tX8nEDErEB+nLvYkG+o+xL/pnf8xKTGmqv1FoHx8WOZzBZFQFwg5JmsId1u+P68FPjXjrWYkVV1FZ/mJq2RNsZHGyGYff8Yd0h28SoQG9XMpBJ4HEUeTucdBX6eaCFbDe/IUhCRHK4yaMOAGh+mfqcGrJW2VUjDIxa4DoE/FxtJxey7rDqOt2JzQcrcS8C04RASistdjovDpxedUW1TmnJ2U4NYKIy8yj9v43U5b6Sc1sKHY2H4gLN65hkBlH152aFep5j+5UApELJiFRZqM24rHW15DkrNsr0lU51PYz6qnzUZoB11k1ILxvGCv2QvJjnnFKz4u+fzSAgnpMo9hVXBFpBVhi6mRAw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5383.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(261009223027099003)(22082099003)(18002099003)(10067099003)(5023799004)(11063799006)(56012099006)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261022105027099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?FSRhSuoVEOVVmokZmnzlKzFX8E3poxvwhjb2YiSN+tp0kdF/NxlTxXy3n1?=
 =?iso-8859-1?Q?RdBunrsjSZXtm1JzdT8B3VCcnamMzyNF3Vp/26I0/h59AoKJn6dNi2aCr4?=
 =?iso-8859-1?Q?gwORtFNMKgv+zT+ZE+FiNdovoVJqYX2ls9nwx4a/1+VHF3+RSdz3OQQGJE?=
 =?iso-8859-1?Q?Z7rtsudCayu+judn+rs7RO58CUWnR5QiBjM8geuyBMmScjf5CijiDZnlNP?=
 =?iso-8859-1?Q?Uu8gWO3DgoSeNX+uLWHX0Wgg+UKft2iMSPYDZ3Y8l6zUm2PFdo2bWz+JGX?=
 =?iso-8859-1?Q?s8OU6ya/ItfgxzTb5d4Ky24xw8ZnJ6Hdo9D5zCjmg3U+Erxxge4CPIkLPN?=
 =?iso-8859-1?Q?3w4gRZDcI2zc0ZGfo5Y4pOYnyTM+ntY562K1qAtatuhl88HRWcookFm3rD?=
 =?iso-8859-1?Q?DN6LAe5n4nUPvdqzt3N3m7ANtXwYAXTy8Jiu07lqQHLIbY3DYrVscfjkpV?=
 =?iso-8859-1?Q?KYeREtn8BOQIsBrfaabs6hIDhDi1nQ+Egq4+v+IB2tjlneronLgy7wN1AR?=
 =?iso-8859-1?Q?KjfSSBfSq5iwOXE+Kdt8lP7p7xM5hoOVYIqTVh1SHeBaf8eRxAPFf1hHAm?=
 =?iso-8859-1?Q?QKK7Vs9w2vl37IIN+Xg5VxJflvU3usMBmUh52wMarM7JOdOC+BDwc9IBrX?=
 =?iso-8859-1?Q?eJCC8GGKP2WF1kUZBTybs3p/4IYeaLKSmdnbXziXbIbI+R6Pq6yuqBHTTh?=
 =?iso-8859-1?Q?bbLCykDlqlopSYPTDcSSGYG25biJHJuGIqpx+SIAvgXUdwS5vcu2pCdC4B?=
 =?iso-8859-1?Q?FprKbHV93XibEIHs8syWlcdqEUdvzmt1l4yEBoMtIQUnbB3D8Sg0K7Z43Q?=
 =?iso-8859-1?Q?RbfJX6LDiLQFn5QZkW4NUVm46CJSy/hGXMEWd0r6m5UQIzr5lTscbMQ3Ns?=
 =?iso-8859-1?Q?ZgMhB/5rBpm3m1LyNhQfIBb4qgLR3PUmscz5td115Vr5m+uG7+5dD6HRim?=
 =?iso-8859-1?Q?AH67HUNiaLrZsjLsOW60l6MpCBd9zHN/PI/KEzJj6S6gq/MLplXk1FYA/G?=
 =?iso-8859-1?Q?jv+DpHY+tae6vr8EIq3mSh0ylHKY8hiOmYZmGM4kj2op39YWLQje1uWQim?=
 =?iso-8859-1?Q?VWxRQKX1fbNUaIbo3h/oL43Pvf7XndxUTx/7Vehs83TFWr5zIg0CFHunOK?=
 =?iso-8859-1?Q?H3NirIsQODWEXzXMzHyKfeeiDUya1VnlpeXohujTQaBx+lUt7yoWByd2ei?=
 =?iso-8859-1?Q?fL1KD3UdHb5Yrd6mFcflfCqV17z4MrUdmhZbr+fhNgcuMRU0BMGz/wqCQx?=
 =?iso-8859-1?Q?+/TS1utPOuisn0H0gk4g8xjgY34iBFA0Hhz4WmkbIbuUMzr4AdhA3HFCyJ?=
 =?iso-8859-1?Q?9RbN2h26v3pYRaWHNXNaH7gQU1lfB2asYU9kSlpovsyyjdaIFcSS9bYOsW?=
 =?iso-8859-1?Q?oR/JQR6HlkmKuC3iic2cD3rZv/V10nZhs7pRVPKQSPY1P1Z879TSWfIVpf?=
 =?iso-8859-1?Q?w51TJM1AgEkA4HdCywvsH2lEIEs4vf9s3n5zvuyASk/oYEepAZVezG4tfh?=
 =?iso-8859-1?Q?BFx1utejv40MJxIMkew/yNFpKpkvfNT/MaXoNKNKE22kVD3dgh/ZB6Hwrb?=
 =?iso-8859-1?Q?Fe508bIMcxaBEU57gm+LMeR201VuGJ2W9aO9M+xRh1d7qwE/jtrV9fhdlr?=
 =?iso-8859-1?Q?BPdd41HIH7gF//tMaEDPdglt3p/extvtGkQlARKpKwIOr/AzjjZmCRtlT5?=
 =?iso-8859-1?Q?VcxrVKtRU63sT1aHI2znfUFt+yuRqdn+lvKeCjHlEK8c+mlAzLTLjXfyI1?=
 =?iso-8859-1?Q?q0h2yGFm3w1iWIgDQCM8vjihHSYedcOyX1T0B2glJJcNeGotQeT2CS+8BR?=
 =?iso-8859-1?Q?dW4IlN4FSw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O4X9m8oRm2tzIjvWDe86zXX+qNMFgbZnz0mp7OUqiYJTbZUEuh2ga7biJmSfec28PBp5aOQczEFapcd+vz4mpo+ff3KWM9cGkA4g/qo21Aou2LpLgQ9mpMDwPdck4lPG+3cJE+9d1eBFXsoQNcjyPV9pCPyI5qrNK/N5Xf7kXc5zxg/+5rCdEP2r9Bud9oOl+lBsKOFGz7DOOifX5OO7qTSudYQwYbVnCTacGPKdWNYWXWOYvunEvCgfQ7Lgl1DX7DN66KKY1BbUR7mXQ2VcOcWLXQV2fKc9Is0O/mdwL2SQHFJ/z/yZQAHVGntORwbWZ87QYxVDTsmL8yP6y2KvvQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5383.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42800428-cbb9-44a6-5af4-08df4bd26b5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2026 15:32:02.6247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gSp5CcWzCd21sj0afoYWcHiRTDY5yFSRZc5ZmBz9Hb7Ky4gczwcom+gKfaZBerIbrLZaEPlf4fq/RF1vV5Oxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5775
X-OriginatorOrg: intel.com
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Thursday, November 26, 2026 5:43 PM
> To: Shankar, Uma <uma.shankar@intel.com>
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 1/2] Revert "drm/i915/cdclk: Deal with 2 PPC hscale i=
ssues
> when calculating min CDCLK"
>=20
> On Thu, Nov 26, 2026 at 05:48:26PM +0530, Uma Shankar wrote:
> > This reverts commit f69946f6d891aca1614233573741543b3bab4e6a.
> >
> > The empirical "double the entire fractional part of hscale and
> > multiply by vscale" formula overestimates the min CDCLK. Bspec now
> > documents the actual 2 PPC downscale formula, which will be
> > implemented in a follow-up patch.
>=20
> Why are you reverting this and then adding it back? Just add the
> min() to the existing thing?

Yes sure Ville, will update the existing one with Fixes instead of revert.

Regards,
Uma Shankar

> >
> > Conflicts resolved against the later GMCH pfit rework: the shared
> > intel_crtc_compute_pixel_rate() now simply uses the pipe pixel rate as
> > the CDCLK pixel rate again. GMCH platforms are 1 PPC, so nothing
> > changes for them.
> >
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c  | 27 +--------
> >  drivers/gpu/drm/i915/display/intel_plane.c    | 55 -------------------
> >  drivers/gpu/drm/i915/display/intel_plane.h    |  5 --
> >  .../drm/i915/display/skl_universal_plane.c    |  6 +-
> >  4 files changed, 4 insertions(+), 89 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index 19caae633d29..3235bcbbf054 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2283,30 +2283,6 @@ intel_pipe_pixel_rate(const struct intel_crtc_st=
ate
> *crtc_state)
> >  				   pixel_rate);
> >  }
> >
> > -static unsigned int
> > -intel_pipe_pixel_rate_cdclk(const struct intel_crtc_state
> > *crtc_state) -{
> > -	struct intel_display *display =3D to_intel_display(crtc_state);
> > -	u32 pixel_rate =3D crtc_state->hw.pipe_mode.crtc_clock;
> > -	unsigned int ppc =3D HAS_2PPC(display) ? 2 : 1;
> > -	struct drm_rect src;
> > -
> > -	/*
> > -	 * We only use IF-ID interlacing. If we ever use
> > -	 * PF-ID we'll need to adjust the pixel_rate here.
> > -	 */
> > -
> > -	if (!crtc_state->pfit.enabled)
> > -		return pixel_rate;
> > -
> > -	drm_rect_init(&src, 0, 0,
> > -		      drm_rect_width(&crtc_state->pipe_src) << 16,
> > -		      drm_rect_height(&crtc_state->pipe_src) << 16);
> > -
> > -	return intel_adjusted_rate_cdclk(&src, &crtc_state->pfit.dst,
> > -					 pixel_rate, ppc);
> > -}
> > -
> >  static void intel_mode_from_crtc_timings(struct drm_display_mode *mode=
,
> >  					 const struct drm_display_mode *timings)
> { @@ -2332,8 +2308,7
> > @@ static void intel_crtc_compute_pixel_rate(struct intel_crtc_state
> > *crtc_state)  {
> >  	crtc_state->pixel_rate =3D
> >  		intel_pipe_pixel_rate(crtc_state);
> > -	crtc_state->pixel_rate_cdclk =3D
> > -		intel_pipe_pixel_rate_cdclk(crtc_state);
> > +	crtc_state->pixel_rate_cdclk =3D crtc_state->pixel_rate;
> >  }
> >
> >  static void intel_joiner_adjust_timings(const struct intel_crtc_state
> > *crtc_state, diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> > b/drivers/gpu/drm/i915/display/intel_plane.c
> > index d23de0f34e4b..82dcb1d87b5e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> > @@ -265,50 +265,6 @@ unsigned int intel_adjusted_rate(const struct drm_=
rect
> *src,
> >  				dst_w * dst_h);
> >  }
> >
> > -static unsigned int hscale_cdclk(const struct drm_rect *src,
> > -				 const struct drm_rect *dst,
> > -				 unsigned int ppc)
> > -{
> > -	unsigned int hscale;
> > -
> > -	hscale =3D drm_rect_calc_hscale(src, dst, 0, INT_MAX);
> > -	hscale =3D max(hscale, 0x10000);
> > -
> > -	/*
> > -	 * Double the fractional part due to some 2 PPC granularity issue
> > -	 *
> > -	 * FIXME: BSpec calls for doubling only the <0.5 fractional part,
> > -	 * and rounding it down to a unit fraction. In practice that is
> > -	 * not sufficient, and we need a more aggressive CDCLK bump in
> > -	 * many cases. The updated formula was derived empirically.
> > -	 * This may need to be updated once we have better undestading
> > -	 * of what's happening in the hardware...
> > -	 */
> > -	return (hscale & ~0xffff) + ppc * (hscale & 0xffff);
> > -}
> > -
> > -static unsigned int vscale_cdclk(const struct drm_rect *src,
> > -				 const struct drm_rect *dst)
> > -{
> > -	unsigned int vscale;
> > -
> > -	vscale =3D drm_rect_calc_vscale(src, dst, 0, INT_MAX);
> > -	vscale =3D max(vscale, 0x10000);
> > -
> > -	return vscale;
> > -}
> > -
> > -unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
> > -				       const struct drm_rect *dst,
> > -				       unsigned int rate,
> > -				       unsigned int ppc)
> > -{
> > -	unsigned int hscale =3D hscale_cdclk(src, dst, ppc);
> > -	unsigned int vscale =3D vscale_cdclk(src, dst);
> > -
> > -	return DIV64_U64_ROUND_UP((u64)rate * hscale * vscale, 1ull << 32);
> > -}
> > -
> >  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crt=
c_state,
> >  				    const struct intel_plane_state *plane_state)  {
> @@ -329,17
> > +285,6 @@ unsigned int intel_plane_pixel_rate(const struct intel_crtc_s=
tate
> *crtc_state,
> >  				   crtc_state->pixel_rate);
> >  }
> >
> > -unsigned int intel_plane_pixel_rate_cdclk(const struct intel_crtc_stat=
e
> *crtc_state,
> > -					  const struct intel_plane_state
> *plane_state)
> > -{
> > -	struct intel_display *display =3D to_intel_display(crtc_state);
> > -	unsigned int ppc =3D HAS_2PPC(display) ? 2 : 1;
> > -
> > -	return intel_adjusted_rate_cdclk(&plane_state->uapi.src,
> > -					 &plane_state->uapi.dst,
> > -					 crtc_state->pixel_rate_cdclk, ppc);
> > -}
> > -
> >  unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc=
_state,
> >  				   const struct intel_plane_state *plane_state,
> >  				   int color_plane)
> > diff --git a/drivers/gpu/drm/i915/display/intel_plane.h
> > b/drivers/gpu/drm/i915/display/intel_plane.h
> > index dba2be24aae2..31a6229aea73 100644
> > --- a/drivers/gpu/drm/i915/display/intel_plane.h
> > +++ b/drivers/gpu/drm/i915/display/intel_plane.h
> > @@ -29,13 +29,8 @@ bool intel_plane_can_async_flip(struct intel_plane
> > *plane,  unsigned int intel_adjusted_rate(const struct drm_rect *src,
> >  				 const struct drm_rect *dst,
> >  				 unsigned int rate);
> > -unsigned int intel_adjusted_rate_cdclk(const struct drm_rect *src,
> > -				       const struct drm_rect *dst,
> > -				       unsigned int rate, unsigned int ppc);
> >  unsigned int intel_plane_pixel_rate(const struct intel_crtc_state *crt=
c_state,
> >  				    const struct intel_plane_state *plane_state); -
> unsigned int
> > intel_plane_pixel_rate_cdclk(const struct intel_crtc_state *crtc_state,
> > -					  const struct intel_plane_state
> *plane_state);
> >
> >  unsigned int intel_plane_data_rate(const struct intel_crtc_state *crtc=
_state,
> >  				   const struct intel_plane_state *plane_state, diff -
> -git
> > a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > index def4798f8502..4cd868d11ad6 100644
> > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > @@ -267,7 +267,7 @@ bool icl_is_hdr_plane(struct intel_display
> > *display, enum plane_id plane_id)  static int icl_plane_min_cdclk(const=
 struct
> intel_crtc_state *crtc_state,
> >  			       const struct intel_plane_state *plane_state)  {
> > -	unsigned int pixel_rate =3D intel_plane_pixel_rate_cdclk(crtc_state,
> plane_state);
> > +	unsigned int pixel_rate =3D intel_plane_pixel_rate(crtc_state,
> > +plane_state);
> >
> >  	/* two pixels per clock */
> >  	return DIV_ROUND_UP(pixel_rate, 2);
> > @@ -291,7 +291,7 @@ glk_plane_ratio(const struct intel_plane_state
> > *plane_state,  static int glk_plane_min_cdclk(const struct intel_crtc_s=
tate
> *crtc_state,
> >  			       const struct intel_plane_state *plane_state)  {
> > -	unsigned int pixel_rate =3D intel_plane_pixel_rate_cdclk(crtc_state,
> plane_state);
> > +	unsigned int pixel_rate =3D intel_plane_pixel_rate(crtc_state,
> > +plane_state);
> >  	unsigned int num, den;
> >
> >  	glk_plane_ratio(plane_state, &num, &den); @@ -318,7 +318,7 @@
> > skl_plane_ratio(const struct intel_plane_state *plane_state,  static
> > int skl_plane_min_cdclk(const struct intel_crtc_state *crtc_state,
> >  			       const struct intel_plane_state *plane_state)  {
> > -	unsigned int pixel_rate =3D intel_plane_pixel_rate_cdclk(crtc_state,
> plane_state);
> > +	unsigned int pixel_rate =3D intel_plane_pixel_rate(crtc_state,
> > +plane_state);
> >  	unsigned int num, den;
> >
> >  	skl_plane_ratio(plane_state, &num, &den);
> > --
> > 2.50.1
>=20
> --
> Ville Syrj=E4l=E4
> Intel
