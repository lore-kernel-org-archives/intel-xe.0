Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0764C54FB3
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 15:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73DD910E2A9;
	Mon,  2 Jun 2025 15:09:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JMYDXMA7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB8810E2A9
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Jun 2025 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748876982; x=1780412982;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWT9RjxVvG+5m6Qf5muKLZdYmSMW8g5JGx71OVD/mIA=;
 b=JMYDXMA7CxYsWW89+GKtln/iWXXo2Wx6R5uWdmFZ5ImpqElYlGCx4JlW
 52RturhyTD8mUGmN4oEZeobdTMNRKx/wJvkXVlOTYfUqXTSuV2KU1zfuw
 /wp2GZEvjVdtZM2p725OuHcaZ7H4QFMxTq+ccs5KeXFv+FQwQiMJbbJ+h
 KukB5jY13d67w0ACAl7aCvnUirQXmKIjQQ0eB+bEJ85vJmH+vddiVoi7o
 ntNT3BiMHAti+SZXPsHhmMl0HYSq2SAh2xcDdkxDAa6/g4H10fkWXGvJR
 tnCWbp9WIGhPRaLz+IJVKH/62pypXYWm5NHuxR/Qm+lEhVuMuMy5S8ocx Q==;
X-CSE-ConnectionGUID: XuH1eVyWRjOIBE09M0ri/w==
X-CSE-MsgGUID: e36R0btIQAy0DtlDF6inFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54554987"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="54554987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:09:37 -0700
X-CSE-ConnectionGUID: NhCDMT0ISr2xLnQgyFGsXA==
X-CSE-MsgGUID: 11aMGmtLQk65aLzMYu+24A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="167732679"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:08:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 08:08:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 08:08:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.66) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 08:08:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZVVA01bQNlECXYnPj7JA5ZPo/83e8101ZTpq3TgSlYi508OdLmWrIZ3kD1STyhoiXBPuJRLMRShOqwH5cqBgw7O6p+4TvVt8118kRZ3OwcBrw/NUjv1W44h6qwQ0gRFKyb1n6/CVzWVxVpaOEhwUAXIaqr0z1zIM0gIUF/SMoUuAbmjDMl/9yS7Vl0krBegfuOdDvGS3TM5mD8oGvI7S7RoEebh9diVcX/3MMx4ShFNFjdrnKgfswuKzR8qdVDDbgBc7A0d0Fk/o+8VeK0UNKj4NUWdeRS0tkT7U/HKrukcejXaL8idXbaCHHCUuUD8jg/cpn9T/eTMCkf7h8B/Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/TibSYHSmmon2crehvQjdZQz81Zzls1uqnqq4/a0Kc=;
 b=OoKE/UNwy9HgUjkaK4OWZuiniuJLsl3kVqywJ3AYWbNeM+BtaBf5VJOiIPutC2GLGOyFtuICiiAzGGJVCSMchvOeu/pnaA7cASj1pKEJY2IBpbb9C+7fOUQalkRWgYDa7W6LBXHWSxJ0K7Yu9XDWZj67idFC+fxuTiab6n9f4D8tCshKmacpPR1HtVjmf0P1j3+6fx99SBa78h3fjavwEcUsHHRFd9qt4hEnmgxLCbg9aqTyivKjc13AL5nPUJuM+5BtWzLbz8HpwTf+hK6/wC1+Jv9exbp2EyToP4zOkPdnonVPrqHtVL6oxw1w61McBfCJLJTU9WK7/JkQxK69yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Mon, 2 Jun
 2025 15:07:51 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 15:07:51 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?iso-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Subject: RE: [PATCH 09/10] sysfs debug
Thread-Topic: [PATCH 09/10] sysfs debug
Thread-Index: AQHb0aJIOL/GvodU2EWvdW6GH9sTlrPsPYMAgAO/RRA=
Date: Mon, 2 Jun 2025 15:07:50 +0000
Message-ID: <IA1PR11MB6418DB4553717FC0049E5FD3C162A@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20250530203356.190234-1-michael.j.ruhl@intel.com>
 <20250530203356.190234-9-michael.j.ruhl@intel.com>
 <d78f55df-db7c-9134-996c-4ef4424ad7ae@linux.intel.com>
In-Reply-To: <d78f55df-db7c-9134-996c-4ef4424ad7ae@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH7PR11MB6746:EE_
x-ms-office365-filtering-correlation-id: c2180256-f481-456f-5212-08dda1e73e34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Pxm/dzEqTelYCoagK1h5ZaCX849/uiBq8vw/gPkDOiwtj4ekdMdQ3QdIGP?=
 =?iso-8859-1?Q?hz4I2dEmcmA+yDZxKY2mGRaH7mHc+Yd7y1A7z+ADACPQX0FADizEW4QXT3?=
 =?iso-8859-1?Q?1zAh3RLoJuFMMcRLEVbDRb1xabrWVNOMkV7RzFQYfHGXnmy6fkjLoLVbxQ?=
 =?iso-8859-1?Q?obzKGeOZeDhhzPthbLIvwgxoPRwUfADW8yY9LGNZnnwKKSTLKBnKX76rtk?=
 =?iso-8859-1?Q?EGZwXXsNDZJm+hzNR+e0QjzKSLEmWDaUuGM4ahmRu7eKzMYUB6eMcoR9zu?=
 =?iso-8859-1?Q?ANK1/iUIPc0anuFXV3yqu3kdcEePgkn2KRxVCpUzsKWIv8SVmdbz9oolJO?=
 =?iso-8859-1?Q?Cros2x22FPG/yPB1RjtPkGjinMv3EtuXSBWCNwp3dIrUgV2i7yZTJQDwiA?=
 =?iso-8859-1?Q?SOZRhB49UaT4/0SPuAjNMkk92KUHwGup/2gQWOmbm7IbC8/EGvSelGcyz8?=
 =?iso-8859-1?Q?c3QwRPWsfWdBqMvOJLv0plkvQPTAtHz+nEdYrRYFBbErUTLIH8lkQD8Zou?=
 =?iso-8859-1?Q?Z7iYl8XBD0eLfi5wdYWij47VL9bpQnfI4uYWRh8wZ/hYG/+rXdBoqtNdgR?=
 =?iso-8859-1?Q?O3o+R9Bw3pgOEcJb9JVeY3P7yk6lKAf1TCmpI5cIKUmVmKzTyjT9TMXBqZ?=
 =?iso-8859-1?Q?5iBct4pSRLJxWmXPq9+92wKJp3ZtimeoI0ANtP+x/YlXDf7Ey6DzgduUOH?=
 =?iso-8859-1?Q?zEutYe+84GPWuJqsvgrMCR/TmvTndysTR4yktv/NabDsRpnQiuSsXqodTZ?=
 =?iso-8859-1?Q?tfmwWVsZA7hsn17FG3F3Vho4nSfBAvhoRXTclt9n2JAEIqapcshOYKhXs1?=
 =?iso-8859-1?Q?H4O3iUSVIacNvkOdD2++9KBLeXpHKvlEbUUG0KWUhDp3tUFY+afugyizaD?=
 =?iso-8859-1?Q?K9bgwGsyIKqIWuF4tNUA/rJNnA5Oxkq+HZxPaiAVCFn9UQKyYJOQOdHLBr?=
 =?iso-8859-1?Q?0uQ29bR/9RPDpOKPnCoJC295U3VDssp6F5DktGxUMXuKVwz8vxRewX1Myc?=
 =?iso-8859-1?Q?9Ka1yFmhSh2UKebkjhRL5brwMxmOSZURdZN0IcsL4AplKFJJ5PN2OgSM/f?=
 =?iso-8859-1?Q?2HHMaA2SAuaQd2V9BMjoLsFqpE/GDBY18f+kyvMxM0S1mOFU0WizB6klA+?=
 =?iso-8859-1?Q?pLhYRCCbigqsc52M6WakCahHEigMf+lRp6NmqZoQyphXnCLKZogElN8YQP?=
 =?iso-8859-1?Q?UYY7rYIXE3toisd8ZboeneEI3hCxJIXOeGhn29NX99UoxEy1bsjFNxteNP?=
 =?iso-8859-1?Q?J1PvELR3Tt8L9dD9UAg+wG/fkatq2wi3W6dWprX9+MN2MGs0Hmf/ZPLiN+?=
 =?iso-8859-1?Q?XUQW0+VzU03wfLgBj1fvNWgId/NNizllmIPz4ACqM0QjueDIdpCmNgO5wn?=
 =?iso-8859-1?Q?h9y+AuCnJK2irpaWQobAT1D6Dwi6E2e1bJCIqZnURvY2Mri8aZxLWQAh7b?=
 =?iso-8859-1?Q?jq+G78hqTqLVixq+OSNP5/QefLxXyk41pTi20dvtcD/E0nQVeX+qfQ23+P?=
 =?iso-8859-1?Q?oKu09fKln02aVW9SEe83gDEtH4MlHUtqsI24139Lu4KQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Q/rxYO63sO2DYomTml3hDL3ve4GYhWk0Sbt5jHwRzOabDXqPgVxCjge4CW?=
 =?iso-8859-1?Q?Yc61XeOWRC3pZzqeJ2eqUyvu+L/M/bZQmm13lyBM5LBTP3zPRnma3x/ub5?=
 =?iso-8859-1?Q?xgadNSEXdHcVl/qtXQPAXi0kgNd4KNg82Kxcrdcjg2/lKKv2fmakzujeLp?=
 =?iso-8859-1?Q?7wKZNn5+ce10rW5AGZOdrf/i/xKmQIGVO3Bt9UdACLLbNzbeUJCxXwcD8S?=
 =?iso-8859-1?Q?+X7drfKrpwFVbmjv7jx8FHPuV2TL2wnrwATfMYud4jXRSYPXQZ92kpB1xY?=
 =?iso-8859-1?Q?ae5yb58k0/piEoJ1s8o89scZkovH+elaAYA5fYEzaM2+RePoOxaBZMfKLr?=
 =?iso-8859-1?Q?cxGmdKB4LBGEaoJqvCwa6kfvZwxTeav0w5I0HGXsHWAMJYWBoYIhcDO2Wj?=
 =?iso-8859-1?Q?7nt6lTK7ZtXuf0XvBOKB2DS3q1kejkYtw9jVUfbrEkh42RdQlPxbVDTfpa?=
 =?iso-8859-1?Q?A2NGM7MzAAG6JtJj+Yw1hQoMvMM9pIYkl2ymnZrAxWhliYeYOn/g78J58C?=
 =?iso-8859-1?Q?X3qpyD7KirAlBpx7K+nfh80t3KWr/z4FDtndT6Gb4eDh2xlSRa5h0boVpy?=
 =?iso-8859-1?Q?tvGzkpHKCjgQsLIA7rkMtaxJgj0So1l36yH5VHJQjSqNAlR10L35yRl/wo?=
 =?iso-8859-1?Q?cxyh8bFji6SOGw9DQQv3TrXK+Fq56kMuwHlwVBMv32ejEJvjeJkNCGd2va?=
 =?iso-8859-1?Q?GxNQR8E+97TFgnepppPV55OtWneej/zb4K+jnchEsATF8Jw+Ix8qv8jaUN?=
 =?iso-8859-1?Q?nj6zERAk3HjhW45L5/v19yUD03M5aSFNbfeQ9LMVfUHv9fgKedLVxrMWjC?=
 =?iso-8859-1?Q?ijsFE7XOa6m1Ra823YBsJ6NWynpfJn/tuwsYlIn0Ndn5Jj3SlT5nsylitO?=
 =?iso-8859-1?Q?jFTfgg++Y1txsecj2V8G0l9iFcaZamgNXwiGRWvK8wEchFhO1S4Z5196sm?=
 =?iso-8859-1?Q?jRNvtaQWZrP5rDg1W61aYZFnPMTb0FauKk4qz19T7oWPrMiunSLpMCR1LO?=
 =?iso-8859-1?Q?WJAasscVx3Tb0ou9EX5cTtacKAhqLU5oW60IjDV2fQZvhQz5YYFOyfHwMf?=
 =?iso-8859-1?Q?ForataOLrQTQM/mfji+WzlCVki8DGWgLlmPjf+jl4FH+4vHBZWffUAM9+y?=
 =?iso-8859-1?Q?8ibmVSKYEPUnBPVUbf3LmIH5VnC/wYK6bA7oJKhfN6mHrw6Z75v7rKaGCN?=
 =?iso-8859-1?Q?QmmjDbdhL1rxi6+n060+ERMNqlgQg6HIhPBjYLcyVDgeDMJBUTlF3A6Ld5?=
 =?iso-8859-1?Q?mC/dtXtRyNm8FLlsyRlG/I/5qwxD5PZkEj3G2orz/Jak4OepzOFxKw8ouw?=
 =?iso-8859-1?Q?3zST4ilmuBTs8dZMVN5ATqQMIv7Z34J5uaKuJ2H2k3ulq4NWNFcBdCR196?=
 =?iso-8859-1?Q?1dTvVAETIsLWxVpMeeApA0si2wMfq/DllShhqIbuvoEodjcmdtn3t3j4ts?=
 =?iso-8859-1?Q?1czjqEdIaA8PNOfJGNDyL9Rwr3QGOxTPxXI0It0xQfXpTasf8e+ksw1L+q?=
 =?iso-8859-1?Q?3AiNQkd3mK4VZoEdUTstrOqKdUf7FY0/1d3nusNwlT/TjviiJKDaOHI7BF?=
 =?iso-8859-1?Q?p9+ZcUAk3MfN+hTlbQFycIlL3VvmgYKXlGKOSaHtLJFR+EIpuA8QCXL1cm?=
 =?iso-8859-1?Q?pXaPIPCSW7cSaSSjSB5u/kGH6zIEiUzZ+4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2180256-f481-456f-5212-08dda1e73e34
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 15:07:50.9538 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6VVlI9066eD4uK/oHe5JIWQ1Dv3Uwt55Ne3Ml1AVsmE/L/UIsw75VNzZlQjIV/0lfIBDu1gMm8ssv30w4xisV9cA7IKVCI8vqVVaFB6MXH8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
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

>-----Original Message-----
>From: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
>Sent: Saturday, May 31, 2025 1:54 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: platform-driver-x86@vger.kernel.org; intel-xe@lists.freedesktop.org; H=
ans
>de Goede <hdegoede@redhat.com>; De Marchi, Lucas
><lucas.demarchi@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Subject: Re: [PATCH 09/10] sysfs debug
>
>On Fri, 30 May 2025, Michael J. Ruhl wrote:
>
>No changelog.
>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  drivers/platform/x86/intel/pmt/crashlog.c | 31
>+++++++++++++++++++++++
>>  1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/platform/x86/intel/pmt/crashlog.c
>b/drivers/platform/x86/intel/pmt/crashlog.c
>> index 7291c93d71df..985f2c685841 100644
>> --- a/drivers/platform/x86/intel/pmt/crashlog.c
>> +++ b/drivers/platform/x86/intel/pmt/crashlog.c
>> @@ -469,6 +469,34 @@ trigger_store(struct device *dev, struct
>device_attribute *attr,
>>  }
>>  static DEVICE_ATTR_RW(trigger);
>>
>> +#define DEBUG_REGISTER_INFO
>> +#ifdef DEBUG_REGISTER_INFO
>
>Ah, I see, this is probably your debug/test patch you included by
>accident. :-)

Yup.  Sorry for the noise.  I will attempt to send only relevant patches ne=
xt time.

Thanks,

M

>> +static ssize_t
>> +status_show(struct device *dev, struct device_attribute *attr, char *bu=
f)
>> +{
>> +	struct crashlog_entry *crashlog =3D dev_get_drvdata(dev);
>> +	u32 status =3D readl(crashlog->entry.disc_table + crashlog->info-
>>status.offset);
>> +	u32 control =3D readl(crashlog->entry.disc_table + crashlog->info-
>>control.offset);
>> +	int len =3D 0;
>> +
>> +	len +=3D sysfs_emit_at(buf, len, "clear_support: 0x%08x\n", status &
>crashlog->info->status.clear_supported);
>> +	len +=3D sysfs_emit_at(buf, len, "rearmed: 0x%08x\n", status & crashlo=
g-
>>info->status.rearmed);
>> +	len +=3D sysfs_emit_at(buf, len, "error: 0x%08x\n", status & crashlog-
>>info->status.error);
>> +	len +=3D sysfs_emit_at(buf, len, "consumed: 0x%08x\n", status &
>crashlog->info->status.consumed);
>> +	len +=3D sysfs_emit_at(buf, len, "disable: 0x%08x\n", status & crashlo=
g-
>>info->status.disabled);
>> +	len +=3D sysfs_emit_at(buf, len, "cleared: 0x%08x\n", status & crashlo=
g-
>>info->status.cleared);
>> +	len +=3D sysfs_emit_at(buf, len, "in_progress: 0x%08x\n", status &
>crashlog->info->status.in_progress);
>> +	len +=3D sysfs_emit_at(buf, len, "complete: 0x%08x\n", status & crashl=
og-
>>info->status.complete);
>> +	len +=3D sysfs_emit_at(buf, len, "sts_off: 0x%02x  ctl_off: 0x%02x\n",
>crashlog->info->status.offset,
>> +			     crashlog->info->control.offset);
>> +	len +=3D sysfs_emit_at(buf, len, "status:  0x%08x\n", status);
>> +	len +=3D sysfs_emit_at(buf, len, "control: 0x%08x\n", control);
>> +
>> +	return len;
>> +}
>> +static DEVICE_ATTR_RO(status);
>> +#endif
>> +
>>  static struct attribute *pmt_crashlog_attrs[] =3D {
>>  	&dev_attr_enable.attr,
>>  	&dev_attr_trigger.attr,
>> @@ -482,6 +510,9 @@ static struct attribute *pmt_crashlog_ver2_attrs[] =
=3D {
>>  	&dev_attr_error.attr,
>>  	&dev_attr_rearm.attr,
>>  	&dev_attr_trigger.attr,
>> +#ifdef DEBUG_REGISTER_INFO
>> +	&dev_attr_status.attr,
>> +#endif
>>  	NULL
>>  };
>>
>>
>
>--
> i.

