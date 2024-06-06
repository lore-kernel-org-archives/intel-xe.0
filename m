Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EF2C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 03:30:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC11010E14D;
	Thu,  6 Jun 2024 03:30:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zc341Ti0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4776410E14D
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 03:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717644605; x=1749180605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fTV/793smSEjx/bne/8cF2aPXqwmoKEirvmM0z3zZiE=;
 b=Zc341Ti08s8diEFMwhQ/fW/LVyX/h5mUxAnP7XrCq+kIMk7+NgvcKqOK
 rV0atiGVHUQ2lNJm4JcR9/TSIvemt8JVMF8h8V5mbZ6bPQ9FnW1CFfxd9
 lGMhOFrTiWgNA8rwqbJQxDoknOabz9HoN4Vhe3l0tpSS5CW4KWkQBaWR3
 WMhejwZj2nrdiSOdJDOxOv9hQZjF4AjgDKaHRjwF0qzMccROMnbxccMQ1
 s+16oWttcNdk1Zqt9xAPN4qQVv3e6o40ctJNhDtpN+0Lb05yUCpdoe/7E
 Qod6z9/wSmxn0S3aF+YONcdFuHpdUFsb18CYzlZDbXeYuB6b//0TkppK6 A==;
X-CSE-ConnectionGUID: pcEU461wRB+YQF6ePYTJgw==
X-CSE-MsgGUID: b+KPnWiTRfeEnHIF8LuZJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14093143"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="14093143"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 20:30:04 -0700
X-CSE-ConnectionGUID: DO7cOPYEQeScUTiPIW4OFQ==
X-CSE-MsgGUID: eCOOkra3TjeZeS34qTq4LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="37919148"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 20:30:04 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 20:30:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 20:30:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 20:30:03 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 20:30:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qc0wDYLGGX8spT1DP6E4RsbGxMJyaDOb8dL/5pI3S+pNg/59Xd6T7rhzCNmCBK1IiJksZc/cUZeei+KuEVb9U6hlmcGUZw66JeXhL4bp2ykwrDPunbIfsHqzepibj0jupUmBbxzoy2uzIzpx54LMQtN5rG0Ao1FGhj6u83v55ssjqt3MSesVfaxo2tAa02ZStw9Mv3NOin8C9Y29HFDTh7OLmvOkfVToVFdvBoCtgOKZE4MM7Gg577rXTG+J1DtL3i1FvwbaqlQbjM0qVNzLXYNjofxB3GqZPAwNXe/goX0qkSFKptTsMnRGVQHIMSNXux1LXC3vt9KWdoE17FQsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLoI5P8WX3VlXM0O0m5z4NMCId6hiEnu/SMW/6Ncs1U=;
 b=OtQC8KpyZ+LjnpUkyBNGJGSrD4nIJxSgYmAxJ+hy9/gtIZdYpulgeYkmQ4HRFJ6azSBt1hM1u7H5qTfrdYdY22xN+b7UALQbtu4O4WkEU0WtF8MuLcIhhh/dGRkXFKyPZl7W/Hz8BXDxg3JSCuMoP++kVGqy0KnNMIyzcG+xQQtWzyTMUQbsA1re4VKlMdymMpE5gMo438GFmTNXCpJ69A4yVgR02AjjoK7Av4BY+XvPP/toCrG52+2kdWxR77dPFgYGpaomJ4ncErn/ymnOmrAyX6GXU+El/13YFYlNzX2Zn5gDS/W7YF33U1FzpscRCP5YJcNnwyNTwNej7yFdiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30; Thu, 6 Jun
 2024 03:30:01 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%3]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 03:30:01 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: RE: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Thread-Topic: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Thread-Index: AQHairldo1MA+p2em0G7f3zr/kPtirFiFhSAgFf3amCAAB+vAIAAKXAw
Date: Thu, 6 Jun 2024 03:30:01 +0000
Message-ID: <SA1PR11MB69913A775939C6B27AD8B8A392FA2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
 <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
 <PH7PR11MB7004D00816F98BE869CEE31B92F92@PH7PR11MB7004.namprd11.prod.outlook.com>
 <ZmD2sk3F3TQXNctr@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZmD2sk3F3TQXNctr@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW4PR11MB8290:EE_
x-ms-office365-filtering-correlation-id: 174d316b-8ada-43d9-509c-08dc85d8f2c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?XwtostIHybbmc6jOSzLaZXSmqudSEptp4xAS40FwQyMUXLmh0FGR048J2f?=
 =?iso-8859-1?Q?l10B6WTIxSNvg9tVjxVRfeTTArxnsR1e7NwKtNRo7npSyEtqDGuW3QiqbG?=
 =?iso-8859-1?Q?Ho0cXShZypf0SgOTQ96WYahFJqgNriW+2PtJWaHPRcG1XkctyEg73SIAJw?=
 =?iso-8859-1?Q?n6WTINRsDHMTgDqbpv9bzrBQ0b9YCGrIVKZJSXVifaibDh3Mf6dp78nKZ7?=
 =?iso-8859-1?Q?RunQOfBHx1WNzBoIii60P+hPuxAEnC0nLkqj9tl8yFVvDxFa6LqOkrAtvm?=
 =?iso-8859-1?Q?yzAFHwHBpoeLlOciK0/s430eN8N5MyUaJrncN12SUaxMnKMj2lFQuoOyrj?=
 =?iso-8859-1?Q?SBkCDpktQGQ2PDK79kVuSQzjs1NSvGApmngR+mZBsQrXOWxKKfdml40XI0?=
 =?iso-8859-1?Q?we0DexrGwRc08PiOrI24KhANhwnIy6JWntaHzHIpTvxzegT8VOm77uGjAs?=
 =?iso-8859-1?Q?3MfEUxeBh6IkHBo7/HAadp/lLZcw9ij7GFjC/mKRt0hAc7Ifka5qQvxYKC?=
 =?iso-8859-1?Q?m0Onk5l1xX/lVrjzQywBSGBlUsDKlL4Zsyniukj8SOG8EBlOEELryQ8wg1?=
 =?iso-8859-1?Q?b4xi99UeIIYWc5QfSnexZAL9GjQVCYo+2mI+6LfzeQIU+JfEJZ5TcF9aTj?=
 =?iso-8859-1?Q?tNWOnijrostOz2y5WIBb13o+6cWBjquDrNzyLXRBkq6PHAeLabRoIBQCWJ?=
 =?iso-8859-1?Q?/kb5Jf7q1q7bKoAgA21lbstsGeMORXR599mQcajtfF7qLM471TDpM+DHxO?=
 =?iso-8859-1?Q?E8JkdZJ+knjprVySb+s+USL1FvLk2hEFSiNgy8B8og3glkZnKBXs/jtVJb?=
 =?iso-8859-1?Q?/C/UPBjERIcsjZWTfeeRwrrrljFznC+ICGU9TCq6YGYfnSX3Ox7CNH5QwZ?=
 =?iso-8859-1?Q?/ZlMNPRAfkmFEMX2GJThbRc/2lrwio1FXP0XM08+W/OaUrr4Yxivk6YOK8?=
 =?iso-8859-1?Q?YSTWZtY8cu5/SNvkA+k6FmQUyN5BiRnASMJw3pHfKJhR9/K4b0aPzNG1MS?=
 =?iso-8859-1?Q?t2QOGVWBaAU+FBhnH/gh6JkT8/DLEoPpcn0IDeFaxVWX2w82oH1ufvl27k?=
 =?iso-8859-1?Q?c4ayBmqgjG+w2YrqV8EOUsaeuUuKr24v3ShnUI65xN6b2TlUBovkchEmUA?=
 =?iso-8859-1?Q?ryE6zCe98Cw3YoEXeiyHsGFcevEnDHpqAlZxkLgTiXqJUhL+0hA3JuGAlT?=
 =?iso-8859-1?Q?8n/WnaOEG2oiZbhQecnEmYtd2N4eHzjBNhCFEF3ex0oOsjJNNyFQrZpAtI?=
 =?iso-8859-1?Q?lvYliqMXZ7onoSwfKzXE5LWANo7K2KiFPM40BI3uXfZ3WkeNftnw3kGMy3?=
 =?iso-8859-1?Q?UC12S55QLyU1L7eFsdOpe9Dzw6x21MYyvOg9REZPCk6/o9NiaDsLzQmis2?=
 =?iso-8859-1?Q?IzsvAkw1kB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jVI07mtMs/zyqlFjVylQzcPqLumymFztqYKVF+yqCP+Fiuf5UTflgiMfdS?=
 =?iso-8859-1?Q?XyBfaX3ibBEIoPFsGv7VfYz4vys7C5ifpgoeqmw5/U+nB7z76bgyeixvdb?=
 =?iso-8859-1?Q?GzFTZsK9my60W67opaxCPbpBbgMympSqgTWnSpEBrvqmAfiwwm8YN3rEkH?=
 =?iso-8859-1?Q?r4FsTZC0tP5arC42I6ROohErO0msfADaQH547C9hyrlx8IxzUlkp2SJa24?=
 =?iso-8859-1?Q?0336hLmXD+WPnpM+4wBAjyEi+qCrBb/nyIaDgMmI+UUuwMVAQf9YCJvfh5?=
 =?iso-8859-1?Q?tNGT7iaE4dVmMmGV+9uGwb2it5NTP1Itp+LCFVVymSw6hFJs1fbnDHnjct?=
 =?iso-8859-1?Q?gr2Y0x3Q32wrSHPeyb2Wq67yvRkyzlCL3BNiJwOvg5Xo+d9cfFa0zEy/e0?=
 =?iso-8859-1?Q?hsUFJQ3/D+GW3LQIdEjI2zC+u1pTOKw8hXj0d1ISS6PEZuJFH40ok1st4a?=
 =?iso-8859-1?Q?/CL2mHXlBrNfitsPDy7OK3w1q46CydwREC8tE4AEbBy6LFsXXsBbYPyC5N?=
 =?iso-8859-1?Q?emxK7m/KAFZ+0uKssno+prYeswsPrA0d71IAAGzRT9mp9jKwnsnin5n5AN?=
 =?iso-8859-1?Q?ky2LYvNexZn/ux5zNnSmPpWjJA2D0fHH+px7rUOAE1bXyyuJPgIC8OEW4U?=
 =?iso-8859-1?Q?gVnlEb3MyoBpfpkEGaOpPoa08oCzRlmDzHH6Whxhp1SZJX8lrhT+BPepKe?=
 =?iso-8859-1?Q?8ipCCjVkUAeTnBf7Tf63Mno7my3cNqc0q3h1kGCHJ6uUnlLlv+nTuLnMKz?=
 =?iso-8859-1?Q?EzCe4vKy2lOeyyQrggkBbnupxxTMt6zaSKSwBppD3/lakNIp3ZShlTL1T5?=
 =?iso-8859-1?Q?Lx/zRm3CItXtfwd0srH6SU0HwqfH9pwHHe/Vd0kpVygG9LChvTLtwhbP7x?=
 =?iso-8859-1?Q?kjoywjuYamqfdzOpsBd+XSnAazbvUmoPawS//5E5vlmQ+B6TIZ/ofo4UDc?=
 =?iso-8859-1?Q?NJmNiJlxAoi1geLpETmF7ywZRgU8yScyK7mgOB5ouHWqQTE/OdFCIQZdRw?=
 =?iso-8859-1?Q?2IW2pEJB2ue7atutm/X32UxP/UovRJaIMPEUiOQ7QdTup7ajBRrwsRDE80?=
 =?iso-8859-1?Q?Q6QmMpqt03u8UVFFwqEZZUcjLB2DXE7NuEwJv81Nd8rtdf/hCxDHyW7ng+?=
 =?iso-8859-1?Q?VzvB1rDrN4TtXXj0pqzPIteyCSccGvhv6knVYZhsx/i1W12FC3TiTBO2No?=
 =?iso-8859-1?Q?dpOG9FYuiWfkD89BfXtVsVc6mMiFNIzniBimqsAfSB+iFZ21WYf9MK7Un9?=
 =?iso-8859-1?Q?+f1WNtl41uftg7opGgkFRTf+Cwl+V0/2zMixlOz2B60R0CR99C4VnEHNIJ?=
 =?iso-8859-1?Q?qkr2g7gPzumJ8pTnRvc5YZPBJxmkPBba4Ub+7N46rULBkCx0jMdFgbTtc6?=
 =?iso-8859-1?Q?d0IwNpgGRVzHQizR/G2Rt3AOUu5yUu8Wret93ez8Hg9r96/rVocIMl4Rcg?=
 =?iso-8859-1?Q?JNEQt0Ssa227VaEjQn6/eHyC7bpwXdmnaOQ287PRBJ11EzpbVHR4Av35nz?=
 =?iso-8859-1?Q?0AQHP3ebdso111ls1LDt2iT1rjDsHB33d2fNe2dk2qJuDYKyiS90tyM2uy?=
 =?iso-8859-1?Q?fG+btPG8f9jNuxrsJSob7f8t5IPXzTiRgqLOEOdNjvvv3JYvWSB4a6iOrH?=
 =?iso-8859-1?Q?OaGa1SSE7pylE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 174d316b-8ada-43d9-509c-08dc85d8f2c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2024 03:30:01.2061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oweyTW2uyaGSgF2BJV1nxOSESVbScdUcygFAJdekKbmbF+l9/OFN07nkd9fo++q1g8EF7gtn6+qtdzCqRYCElQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8290
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, June 5, 2024 7:37 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and
> free device memory
>=20
> On Wed, Jun 05, 2024 at 04:16:32PM -0600, Zeng, Oak wrote:
> > Hi Matt,
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 6:24 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Welty,
> > > Brian <brian.welty@intel.com>
> > > Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate a=
nd
> > > free device memory
> > >
> > > On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> > > > Function xe_devm_alloc_pages allocate pages from drm buddy and
> > > perform
> > > > house keeping work for all the pages allocated, such as get a page
> > > > refcount, keep a bitmap of all pages to denote whether a page is in
> > > > use, put pages to a drm lru list for eviction purpose.
> > > >
> > > > Function xe_devm_free_blocks return list of memory blocks to drm
> buddy
> > > > allocator.
> > > >
> > > > Function xe_devm_free_page is a call back function from hmm layer. =
It
> > > > is called whenever a page's refcount reaches to 1. This function cl=
ears
> > > > the bit of this page in the bitmap. If all the bits in the bitmap i=
s
> > > > cleared, it means all the pages have been freed, we return all the =
pages
> > > > in this memory block back to drm buddy.
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > Co-developed-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
> > > >  drivers/gpu/drm/xe/xe_svm_devmem.c | 147
> > > ++++++++++++++++++++++++++++-
> > >
> > > See comments about file in previous patches, they apply here too.
> > >
> > > >  2 files changed, 152 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> > > b/drivers/gpu/drm/xe/xe_svm.h
> > > > index 624c1581f8ba..92a3ee90d5a7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -46,4 +46,11 @@ static inline struct xe_mem_region
> > > *xe_page_to_mem_region(struct page *page)
> > > >  	return container_of(page->pgmap, struct xe_mem_region,
> > > pagemap);
> > > >  }
> > > >
> > > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > > +						unsigned long npages,
> > > > +						struct list_head *blocks,
> > > > +						unsigned long *pfn);
> > > > +
> > > > +void xe_devm_free_blocks(struct list_head *blocks);
> > > > +void xe_devm_page_free(struct page *page);
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > index 31af56e8285a..5ba0cd9a70b0 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > @@ -5,18 +5,161 @@
> > > >
> > > >  #include <linux/mm_types.h>
> > > >  #include <linux/sched/mm.h>
> > > > -
> > > > +#include <linux/gfp.h>
> > > > +#include <linux/migrate.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/dma-fence.h>
> > > > +#include <linux/bitops.h>
> > > > +#include <linux/bitmap.h>
> > > > +#include <drm/drm_buddy.h>
> > > >  #include "xe_device_types.h"
> > > >  #include "xe_svm.h"
> > > > +#include "xe_migrate.h"
> > > > +#include "xe_ttm_vram_mgr_types.h"
> > > > +#include "xe_assert.h"
> > > >
> > > > +/**
> > > > + * struct xe_svm_block_meta - svm uses this data structure to mana=
ge
> > > each
> > > > + * block allocated from drm buddy. This will be set to the
> > > drm_buddy_block's
> > > > + * private field.
> > > > + *
> > > > + * @lru: used to link this block to drm's lru lists. This will be =
replace
> > > > + * with struct drm_lru_entity later.
> > > > + * @tile: tile from which we allocated this block
> > > > + * @bitmap: A bitmap of each page in this block. 1 means this page=
 is
> used,
> > > > + * 0 means this page is idle. When all bits of this block are 0, i=
t is time
> > > > + * to return this block to drm buddy subsystem.
> > > > + */
> > > > +struct xe_svm_block_meta {
> > > > +	struct list_head lru;
> > > > +	struct xe_tile *tile;
> > > > +	unsigned long bitmap[];
> > > > +};
> > >
> > > This looks not needed to me but admittedly haven't looked at the LRU
> stuff.
> >
> > I am moving to page granularity memory eviction, so we can either use t=
he
> lru in the struct page itself, or I will have to introduce some other dat=
a
> structure which have a lru.
> >
>=20
> You almost certainly cannot use struct page, pretty sure that will not
> be well recieved putting a subsystem memory management feature into the
> core memory management.

The reason I was think of struct page's lru because, the lru field is not u=
sed right now for device pages...the lru field is used for system pages onl=
y right now. So I don't see a conflict there. It is just a member not used =
by core mm and we can make use of it if we want.

But it is very possible that we don't use struct page's lru. In this series=
 https://patchwork.freedesktop.org/patch/565501/?series=3D125879&rev=3D1, I=
 have some drm_lru_entity concept. I need to go back to that series to work=
 out the page granularity vram eviction part.


>=20
> I'm going to say this again, I disagree with this design decession as I
> do not think using a BO / or migration + eviction at allocation
> grainularity should be dismissed. Using a BO offers eviction more or
> less for free and possibly dma-buf reuse for multi-GPU. Please study my
> PoC [1]. It has SVM full featured and largely working.

It is completely fine that people disagree with a design. Removing BO from =
system allocator was aligned with DRM community long time ago. The main pro=
blem of BO is the memory eviction and migration is not page granularity.

I know in v2 I am not truly page granularity either. But I am moving to tru=
e page granularity in v3, the memory allocation, free, migration and evicti=
on are all at page granularity. It is very similar to the scheme Linux core=
 mm has. There are much more work at buddy allocator and eviction lru, comp=
ared to the BO approach.=20

Please also note, when said page granularity, it could be one page, but can=
 also multiple pages.


>=20
> If you have a different design, great. But I'd expect the next post to
> have feature parity, thorough testing, and well thought out design
> choices with explainations of said design choices beyond someone in the
> community said something so I am doing it this way (i.e. deep thought
> and understanding of how all the pieces fit together and why this design
> was chosen).

I understand feature parity and testing are important. The previous posts (=
v1 and v2) were mainly to get some feedback on the design. Since we are at =
the 3rd respin of this series, it is probably a good idea to do more test b=
efore post.


>=20
> [1] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-svm-post/-
> /tree/post?ref_type=3Dheads
>=20
> > Yes, I removed block_meta in v3.
> >
>=20
> I don't like speculation, said this many times. Let's see what rev3
> looks like and will review then.
>=20
> > >
> > > I am thinking roughly...
> > >
> > > - I think we drop all this special tracking (kill xe_svm_block_meta)
> > Agreed.
> >
> > > - Have functions to allocate / free the buddy blocks, store buddy blo=
cks in
> > > userptr
> >
> > Why we need to store buddy blocks in userptr? If you do this, you would
> need another block_list in userptr.
> >
> > I currently use the struct page's zone_device_data to point to buddy_bl=
ock.
> It seems work for me.
> >
>=20
> It doesn't. See my working PoC [1] zdd structure, almost certainly
> something like that will be needed for a variety of reasons. Also if you
> allocate a buddy block then it really isn't page grainularity nor does
> offer an advantage over BO wrt page grainularity. I stated this multiple
> time in lengthly explainations and not heard a reasonable argument
> against this.

It is true that the drm buddy interface is not page granularity. But this s=
hould be mainly looked as a drawback of the buddy interface. If you look at=
 the core mm buddy allocator, the interface is page centric. We are working=
 on the drm buddy allocator to improve in this perspective.

>=20
> > > - Blocks are allocated before migration to VRAM
> >
> > Agreed
> >
> > > - Blocks can be freed on either CPU fault after migration or on VMA
> > >   destroy (probably depends on madvive hints for VMA where we free
> > >   blocks)
> >
> > My current understanding is, once device pages is allocated and handed
> over to core mm/hmm, driver doesn't need to worry about the life cycle of
> device pages, i.e., core mm/hmm will take care by calling back to page_fr=
ee
> vfunc.
> >
>=20
> Yes, we definitely need to the page_free vfunc callback implemented.
> This was a misunderstanding on my part, certainly you can make it work
> without this but it is not correct.
>=20
> > > - Blocks allocated / freed at ia chunk (xe_vma in this code) granular=
ity
> > >   (conceptually the same if we switch to 1 to N ratio between xe_vma =
&
> > >   pt_state)
> >
> > As said, I am moving to page granularity, moving away from xe_vma
> granularity, to address concerns from the drm community discussion.
> >
>=20
> That's not what the community is saying or it is not at least how I
> interrupt this. The community is saying on a fault, allocate at a page
> granularity of the CPU mapping. e.g. If the CPU mapping is 4k, allocate
> 4k. If the CPU mapping is 2M, allocate 2M.=20

I guess by CPU mapping you meant CPU vma.

I think we can create a mmu notifier to match the range of the cpu vma.

Regarding how much gpu memory be allocated and migrated,  my current thinki=
ng is, this can be decided by a memory hint attribute. i.e., if CPU vma is =
16M, but memory attribute say 2M, we can allocate/migrate 2M. if memory att=
ributes says 32M, we will migrate 16M.

So I don't understand why you want to allocate the same size as CPU vma...


There quite a bit of core MM
> work that would need to be done for this to properly work though, namly
> the migration layer splits TPH into smaller pages. I think that should
> fixed (e.g. teach core MM to understand device private pages that are
> larger than 4k, likewise coherent pages). Conceptually I think this is
> the right approach but would take quite a bit of work. But with that, if
> we layer the code properly only the DRM layer needs to be aware of this.
> e.g. We could build SVM without this like I do in my PoC and then switch
> over to this model once we complete the core MM work is done mostly only
> modifying the DRM layer. This would eliminate the partial unmapping /
> invalidation scenarios which my PoC implenents and provides
> documentation for.

I don't quite follow here. Afaik, THP is only enabled for linux core mm, ma=
naging system memory. I am not aware of it in xekmd. By THP do you mean THP=
 in xekmd? Or huge page (compound page, 2M or 1G etc) to back up cpu vma in=
 linux core mm?=20


>=20
> Below general comment:
> If we post something that we view as good and working, community
> feedback can be pushed back on with a justifiable design. Blindly doing
> things without understanding (e.g. community said do it this way) of the
> larger issues is not a great way to work. Nor is posting untested code
> with a partial implementation.
>=20
> > > - block->private =3D=3D memory region so we can get pfn from block
> >
> > In v3 code, block->private is not used. Will use it if needed.
> >
> > Each struct page has a pgmap pointer which points to xe_mem_region's
> pgmap memory. We can use this information to get a page/fpn's memory
> region.
> >
>=20
> That probably works but there may be scenario where you need to from
> block to mr in which the device pages are not readily available. You
> always can go from block -> pages -> mr but it may be advantageous to
> short circuit that with block -> mr, especially in hot (performance
> critial) paths.

In my v3, I don't have a need for block to mr. but it is a good idea to use=
 block private for this purpose.

Oak

>=20
> Matt
>=20
> > > - When we need migrate_pfns we loop over buddy blocks populating
> > > migrate.dst
> > >
> > > Also I noticed the drm_buddy_* calls in this file are not protected b=
y a
> > > lock, we will need that. Currently it is tile->mem.vram_mgr->lock in =
the
> > > VRAM mgr code, we either need to reach into there or move this lock t=
o
> > > common place so the VRAM manager and block allocations for SVM don't
> > > race with each other.
> >
> > Ok, will add this lock. Lets keep the lock in vram_mgr->lock for now fo=
r
> simplicity
> >
> > Oak
> >
> >
> > >
> > > Matt
> > >
> > > >
> > > >  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > >  {
> > > >  	return 0;
> > > >  }
> > > >
> > > > -static void xe_devm_page_free(struct page *page)
> > > > +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offse=
t)
> > > > +{
> > > > +	/** DRM buddy's block offset is 0-based*/
> > > > +	offset +=3D mr->hpa_base;
> > > > +
> > > > +	return PHYS_PFN(offset);
> > > > +}
> > > > +
> > > > +/** FIXME: we locked page by calling zone_device_page_init
> > > > + *  in xe_devm_alloc_pages. Should we unlock pages here?
> > > > + */
> > > > +static void free_block(struct drm_buddy_block *block)
> > > > +{
> > > > +	struct xe_svm_block_meta *meta =3D
> > > > +		(struct xe_svm_block_meta *)block->private;
> > > > +	struct xe_tile *tile  =3D meta->tile;
> > > > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > > > +
> > > > +	kfree(block->private);
> > > > +	drm_buddy_free_block(mm, block);
> > > > +}
> > > > +
> > > > +void xe_devm_page_free(struct page *page)
> > > > +{
> > > > +	struct drm_buddy_block *block =3D
> > > > +					(struct drm_buddy_block *)page-
> > > >zone_device_data;
> > > > +	struct xe_svm_block_meta *meta =3D
> > > > +					(struct xe_svm_block_meta *)block-
> > > >private;
> > > > +	struct xe_tile *tile  =3D meta->tile;
> > > > +	struct xe_mem_region *mr =3D &tile->mem.vram;
> > > > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > > > +	u64 size =3D drm_buddy_block_size(mm, block);
> > > > +	u64 pages_per_block =3D size >> PAGE_SHIFT;
> > > > +	u64 block_pfn_first =3D
> > > > +					block_offset_to_pfn(mr,
> > > drm_buddy_block_offset(block));
> > > > +	u64 page_pfn =3D page_to_pfn(page);
> > > > +	u64 i =3D page_pfn - block_pfn_first;
> > > > +
> > > > +	xe_assert(tile->xe, i < pages_per_block);
> > > > +	clear_bit(i, meta->bitmap);
> > > > +	if (bitmap_empty(meta->bitmap, pages_per_block))
> > > > +		free_block(block);
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_devm_alloc_pages() - allocate device pages from buddy
> allocator
> > > > + *
> > > > + * @xe_tile: which tile to allocate device memory from
> > > > + * @npages: how many pages to allocate
> > > > + * @blocks: used to return the allocated blocks
> > > > + * @pfn: used to return the pfn of all allocated pages. Must be bi=
g
> enough
> > > > + * to hold at @npages entries.
> > > > + *
> > > > + * This function allocate blocks of memory from drm buddy allocato=
r,
> and
> > > > + * performs initialization work: set struct page::zone_device_data=
 to
> point
> > > > + * to the memory block; set/initialize drm_buddy_block::private fi=
eld;
> > > > + * lock_page for each page allocated; add memory block to lru
> managers
> > > lru
> > > > + * list - this is TBD.
> > > > + *
> > > > + * return: 0 on success
> > > > + * error code otherwise
> > > > + */
> > > > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > > > +						unsigned long npages,
> > > > +						struct list_head *blocks,
> > > > +						unsigned long *pfn)
> > > > +{
> > > > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > > > +	struct drm_buddy_block *block, *tmp;
> > > > +	u64 size =3D npages << PAGE_SHIFT;
> > > > +	int ret =3D 0, i, j =3D 0;
> > > > +
> > > > +	ret =3D drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> > > > +						blocks,
> > > DRM_BUDDY_TOPDOWN_ALLOCATION);
> > > > +
> > > > +	if (unlikely(ret))
> > > > +		return ret;
> > > > +
> > > > +	list_for_each_entry_safe(block, tmp, blocks, link) {
> > > > +		struct xe_mem_region *mr =3D &tile->mem.vram;
> > > > +		u64 block_pfn_first, pages_per_block;
> > > > +		struct xe_svm_block_meta *meta;
> > > > +		u32 meta_size;
> > > > +
> > > > +		size =3D drm_buddy_block_size(mm, block);
> > > > +		pages_per_block =3D size >> PAGE_SHIFT;
> > > > +		meta_size =3D BITS_TO_BYTES(pages_per_block) +
> > > > +					sizeof(struct xe_svm_block_meta);
> > > > +		meta =3D kzalloc(meta_size, GFP_KERNEL);
> > > > +		bitmap_fill(meta->bitmap, pages_per_block);
> > > > +		meta->tile =3D tile;
> > > > +		block->private =3D meta;
> > > > +		block_pfn_first =3D
> > > > +					block_offset_to_pfn(mr,
> > > drm_buddy_block_offset(block));
> > > > +		for(i =3D 0; i < pages_per_block; i++) {
> > > > +			struct page *page;
> > > > +
> > > > +			pfn[j++] =3D block_pfn_first + i;
> > > > +			page =3D pfn_to_page(block_pfn_first + i);
> > > > +			/**Lock page per hmm requirement, see hmm.rst.*/
> > > > +			zone_device_page_init(page);
> > > > +			page->zone_device_data =3D block;
> > > > +		}
> > > > +	}
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_devm_free_blocks() - free all memory blocks
> > > > + *
> > > > + * @blocks: memory blocks list head
> > > > + */
> > > > +void xe_devm_free_blocks(struct list_head *blocks)
> > > >  {
> > > > +	struct drm_buddy_block *block, *tmp;
> > > > +
> > > > +	list_for_each_entry_safe(block, tmp, blocks, link)
> > > > +		free_block(block);
> > > >  }
> > > >
> > > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > > > --
> > > > 2.26.3
> > > >
