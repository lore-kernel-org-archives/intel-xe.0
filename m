Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA436CA5FA7
	for <intel-xe@archiver.kernel.org>; Tue, 29 Sep 2026 18:24:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63CA10EFF1;
	Tue, 29 Sep 2026 18:24:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cgf4uLdS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF13C10EFF1
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Sep 2026 18:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790706279; x=1822242279;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version; bh=vICEzJsjox/5hqr2rgBmZNnD0a1Yt+Yr2w0sOKNa+sQ=;
 b=cgf4uLdSRAI4AqQHgVmESCsYIKxHGJj05miY86adKJaofqsB30ysHO6J
 g5tRYY4lUdjmuCa45ydhQQffXU0+3VqNrvaNGYnNUFSyzqnjmjgFoVKAK
 0efqxBiAezMb/EBrUDKet/TagV9pE470pN0AsyejnjC87nGvpc8zcdujv
 gCM9clHrbiJE60yHVXah00r70lSkR1bAhCZxGasExSxeFKxKXnfkpAF2b
 NsRLDVP3YbyzDPCSoFxjgajk6Vbv7UQqiGn+WTA/92dCEyhRLkwse97gH
 JjP7i7Z7oRgAq0+aDmDRphZHq7/6ifVuqVtSvHbMek3GmA3SHVHYYqbtu Q==;
X-CSE-ConnectionGUID: IA4Wj05SR+y7gWshWXDWAQ==
X-CSE-MsgGUID: G+egL2VDSsOnMBgmwiFjbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="91294686"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208,217";a="91294686"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:24:38 -0700
X-CSE-ConnectionGUID: Q7jduhztSDWKl/FecTiGnQ==
X-CSE-MsgGUID: PB/+1ar3RfSJfx81kwzTFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
 d="scan'208,217";a="275475280"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 11:24:39 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:24:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 11:24:37 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.38) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 11:24:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb41cGYV0pDcEMC+U9POV2DsRwdeQg84S4/h7rrADiu8ftgqWgWnDmaYcl1CC3XXyUtSoNHAmzg1fHFcEDlfUJqAt7Pli7ozQqeHPcNIn7KasPEeeYPkDX7jyi7bgeDoISPyvS5VX5+flyaP48kkC2ykh+wzKKggtcrYpy3P9p16ZlvRUnrpQ4fzJ5Qk9jZHWtdyo/cz/ofB4ERUxkORl1bFBMKDLRbeb5j8ksduYmF1YW5xzGpiPHVlQblBDP6X945TAGgPvwpBfqa6B0mH1GIU8ciMBxAVB3JEaWaSW3bPPfkfgjFgJMr/XapvWgptwAkwAAEOm8XmaJPoDm5nyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vICEzJsjox/5hqr2rgBmZNnD0a1Yt+Yr2w0sOKNa+sQ=;
 b=teZ15zpBA1zlhP7JFLOpc/nkxxjFRnyyjld1XY6EzbS5roVbJo+DsHx2Nv16LGGQJMSloDUC4mGOc1hTSVw1AJ3ZYGu+ipwYLlpCWphpLRoOruMDBa8A/rne0LckKe4PdfJkb6MEz2riIb0zbfMshF5K/tnFwkv24Oi2OGiB5GFoVR3TfMI9Nbw5nnw7ywCASSLVYLbj8YNIxoybqECyEIzoRm4WTUKpjQNZ2Phj6PB1OLOKu6NZLbd9x6FDBNjDWwliu8tcDI11bZXVABh0NsNvW4pNW/XpY1JONhpbX3qvmtOlpvUwEa+9KTppudUTPfB3m90IY23RWTGch5v2ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by DS4PPF93A1BBECD.namprd11.prod.outlook.com (2603:10b6:f:fc02::3c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 18:24:35 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 18:24:35 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBFbmFibGUgR1NDIGxv?=
 =?utf-8?Q?ading_and_PXP_for_NVL-S?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cmUgZm9yIEVuYWJsZSBHU0MgbG9hZGlu?=
 =?utf-8?Q?g_and_PXP_for_NVL-S?=
Thread-Index: AQHdTBa+L2p1vYIVsUKXPqvfGNluC7bl510A
Date: Tue, 29 Sep 2026 18:24:34 +0000
Message-ID: <073cb12a539b63aed0e051d3c526cfe36b757a6c.camel@intel.com>
References: <20260923183600.1186943-4-alan.previn.teres.alexis@intel.com>
 <179024882733.202880.3180124007422961682@61270ab9df2a>
In-Reply-To: <179024882733.202880.3180124007422961682@61270ab9df2a>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|DS4PPF93A1BBECD:EE_
x-ms-office365-filtering-correlation-id: 40798f0c-b195-42bc-5719-08df1e56e9e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|376014|38070700021|56012099006|11063799006|5023799004|8096899003|10067099003|13003099007|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info: cwM1Z56+mU+sU7RyoFuDonIsxtaO3Wqa626LHasR3nGjOMANpA93i7bQ9y+Tcoh7UH8e1Djur85tIDUJ9NPVARcqfroDvL4877KYINdLP4LvYJxVwKFQtAkXBuCM00Uzu8YNvGDi0/fgA+Thxpe0pBO3XyJVO7TWhe+VlRfDI+D0v3GQtgtssgCoOOls+hYSD+905PxPf2r6MRWMJDJdpOR8yTNbWjlGEOa2lq+Ez8hFJR229Iaf+g2jRrYZTTo139kgN0PYr2RE75A8MviT/oUdcl6WgFtoG7ezfEEFDz1CY/XXjLspGqB0EVFa69Thnz2Hsqy0d3nV6z8tYPC/QCcPETOTipff0dQiMRvf/6YSv5G1h9gNDdcKvhJ107Da/WliVstzap5F+WMf0r1K6s7u/rATzPMg5dbgZT1PtuKtf35j2mC0pQonLzhFpYoEutQfyp87rkVpJdO/H3gM00uWQ+CP4BVSxA/FO6C7Tyl3VpzzRG1eC1JqN4jrDvijrZ6mnmUUwastAEwfzJmkELzGzkEn/04s8gEKD6ATwjOCCLFGd3VDLLk/YzLNwRtMIZyIKeJMIzz04znYEu2UxrylmgE0ETVtzb9ffsC72qdTWdQJnqD5qTnJC6X77Bf/z9prsUW6rDLdefbWISAS4+RcPQSH5HG2jBz1J9TBlUw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(38070700021)(56012099006)(11063799006)(5023799004)(8096899003)(10067099003)(13003099007)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?clR3MTNjTkJBeW16Z3FSQzFZR0tEWE5vZ0MyWmREZXVRc1R0VSt5UTVaZ0Y0?=
 =?utf-8?B?cU56NVNpTmlMWm1hdlltYmZBT0lWdUsvNEtucnByUXpHVmxXcklsWTdLRVhB?=
 =?utf-8?B?MkpoblFZOXdkZGp4Yk1ENTRua2ZqcndJTnFtNzJPWk5tOW1iWDErV3kwbWVF?=
 =?utf-8?B?cit1QU5IK3RQZW5mRkVENko1VGpaMXFDZGJjOUdzcVJoZEZ3SFhYTGZwdi8z?=
 =?utf-8?B?THZxd2dNTHdsK1MwTi81TS9XNkJ1aDh6YWd6YTV0dHo2U040aEduNytvb3hq?=
 =?utf-8?B?dXd1ZGQzQmFDdjFQTFFuSDFBcEttSDlPTUFDb0p1VjR2VGorZUxDSmxuWWxp?=
 =?utf-8?B?dE9reE1IR0JVQkZkSmdJU3VabUlSc3ZsVitMczAxMzdUeG9aSHRGV29YbzRR?=
 =?utf-8?B?ekhMVXh5SEc3dUphdGFrK1U4VlJncllYUG11YXRYSVZ4aS9hOGlqUUFNYnp4?=
 =?utf-8?B?UC9RZFJGMU05YkZRaUVBWjBFQ1h1TThFK3lhaHFmYkdZcjNGdXZDQlJKQlBX?=
 =?utf-8?B?bHAxV1R4ZkVvc0ttd3hEekFmbGRjTUc0OFRseFdxdHpyUlk0ZElFdDFDSXVK?=
 =?utf-8?B?SHh2TW51RHBXY21CQmNjMmVqUzk2YkV5N3Y0b2Jpa2JaUXNXVElvRFRoZ2tV?=
 =?utf-8?B?ZWNRMmdIQWdGVVNIbUhHdDFkbUZKRitSNDQ4UTRFWDFTRDd0blNHS2RHMGx2?=
 =?utf-8?B?S1Uzb2gvUGdnVVZrWUpEWTZYakV4UjhzamQ3ekNmTDA4WFZBZWxEZUJvZTdT?=
 =?utf-8?B?aGgwSnhmMTdaZFFuMWFIUk9aMDdubzl2eHpxTGpTYlBMQmJNTmhBOWtmVUlK?=
 =?utf-8?B?QUFPcWFicjUxdjVMaDlvMERSNmNabEJoZXp2WklxSlRVeURUYkU2VnZPVlRY?=
 =?utf-8?B?OUI1VDBjRTdVUFNFd3BxTExWbmphcWhpME9BQ1BDT3RsTXRLeG8vZlZYZnMx?=
 =?utf-8?B?eGxxNkE2U3NKMHdXNHdhWmRmMkRtR05GMTdKbFF5ajNYdTlsMXlDR2hGa25U?=
 =?utf-8?B?NXFMRjAwdHRrZDNvWlJMdElHRS9CTFFQeXA3QWdpaFpRNi9BVHdkMWhLOFpM?=
 =?utf-8?B?YkQ3ckdScUhmOUpHYXE5cks5bE92QStxaWx4Qllac0oxRDZXOVk0cVdLVXRn?=
 =?utf-8?B?ME9TNld2S2JaK2V1S1R6dGZOUzMwRVlTb1RMTUxMdUNDRDZrRlQrTW9VWWdW?=
 =?utf-8?B?MWZCaVZnWHZDanQ3Y01EWXhNYy9FbDVBUTVzc0ErYnFyOGhVaGE2UUtiQlhL?=
 =?utf-8?B?NHM3QkJTSEVXWFhnOGZVVlluT0NINVd3dTZIcVNGNGxVRXVyK1VoaWRlb3dh?=
 =?utf-8?B?d3FlTXc3cWFmZEJFeFlWQlNzOFZQd3dVMTd3akFsY0gyc21pdWhNSVh4Y3A4?=
 =?utf-8?B?RWhmUmJ6N25PZG1DVXA5Mys0V1FSam9VUmMwdHVqcHo5S25QNHBDNDRzWmNL?=
 =?utf-8?B?Rkt5Ylc0UDB6RFFzVEdZWkJ2UEZQWkgyZ0tJZ0JYMk1ROUl4ZWx1RCtnMVFH?=
 =?utf-8?B?SmhkazFmZ3ZjczNrT3dWR1NSZ3VNN25zU2hsVFIzcHBoai9QMTkrQnZZeG5z?=
 =?utf-8?B?OUg0R0EzblJIQkJjMFFkRCtVTTFmVXJaVmVwQzVCNlZEWVBhQjFnN2ZNZUhL?=
 =?utf-8?B?anpxaTBjYjRwZFY2MHJwZThoM0tDVFRpeWJFWEFxNXBHWEZNRkx5WFZka2Ey?=
 =?utf-8?B?S1lGQkdGY1lLcWpqTncwUGZzeWc2WVZlcUVCMk9PR2ZKWThSWHZqc0NBZUo3?=
 =?utf-8?B?enc4M2FwQlRmSXl6cnBraW8zM3Nxd0dlcjJRZG1tZ1N0TytHMGgxT2pjSDlw?=
 =?utf-8?B?QWpGSXlBcy9oTDlKRWZINkVLaDUydlRES05iUWRucVJnTHRvZWNOR2l1SHAr?=
 =?utf-8?B?QVVQVVNzZFl5bS8zOUNOUDE5eDZZR1k1eTRWaVVBRVVva20zY1p5MlI5UlFP?=
 =?utf-8?B?NXpzYmViZ2NNQ3hBTDNGcklaS3pOd1YyYmY2WDY1Tll4N1V4L1VtdmkrUDY4?=
 =?utf-8?B?WC9XcldrOFBFbytYcUVCamlzWTBpNGIwT2w0K2ZBN1gxaE10cmhLM2x3aVg0?=
 =?utf-8?B?Q1BzYVZ2ZGk3WnVNeEVOQU9EL1V6NmtkbE10b2NPREw4VDZvZTd6ZmYxS2FJ?=
 =?utf-8?B?RTMxY2ZEWlZFb1l1Rjc2cFBLWVU4dkc1M1BGMFdsejROeS9aTG9lZVpOSm9s?=
 =?utf-8?B?U1ZJT2VxVllWWVc5RGZ1SW1QVnpCeEFUNUxUQjloVDVBQWF3c21QK3BwWG0z?=
 =?utf-8?B?YjNTemhtZlRkdEtnR2dqejJUbFFZeStFdmhkeklWOVc5aGNBN1lrRURUbW5p?=
 =?utf-8?B?cXhzZVp1VjhQaGFOVXNWdXBCOFlkYXFVMklKK2VSYk1jL2hxQ0pHWEloTVcr?=
 =?utf-8?Q?aobbzqbaHmbu/f0qsiaPEQC3h01C2Y3PCyRKZ?=
Content-Type: multipart/alternative;
 boundary="_000_073cb12a539b63aed0e051d3c526cfe36b757a6ccamelintelcom_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dNCKmhGrECYUCSWzFqoGhXvVTzGHSZhc44291A05854OK2KGERPHoYBzLrJyD0gmF1EXH/UgSa/c7a+WGs5grwhKlW6SDXCWbsAgiAI1ds98pxAeKoaV/YvngrsPIaoNTGY7XCMQumN1Q/m/JVelCw9fw2dr4/Sdu3rMh6jEMkU54J8d0vYu1byAkx+iFx4ne3Ugfla8+kSBlpB+4kRBpnjWmOvTCAyUFHu958wxrc+G0TWF2VzaFKYDowRlQh7CspIAE9vabqsTqBBown8vYilXnbxHabYBeCrEsKshJs1YSeMiTKsyhumYMoB35q2Wph6wHinh41B04RVVBYjqrQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40798f0c-b195-42bc-5719-08df1e56e9e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2026 18:24:34.9645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CY0i4MSEDr+xaSN2vFMjiPaotUJgwBAImNhRrqEBXXqkoCWPAoIJie48LQW83ECAlZw48AhSMHhsRciKYGUXvIN2cYSOcDxQu+L/znuTidoBvNkJDxdn2+27G8IjGXyq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF93A1BBECD
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

--_000_073cb12a539b63aed0e051d3c526cfe36b757a6ccamelintelcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDI2LTA5LTI0IGF0IDExOjIwICswMDAwLCBQYXRjaHdvcmsgd3JvdGU6DQpQYXRj
aCBEZXRhaWxzDQpTZXJpZXM6IEVuYWJsZSBHU0MgbG9hZGluZyBhbmQgUFhQIGZvciBOVkwtUw0K
VVJMOiAgICBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE3NDgzNy8N
ClN0YXRlOiAgZmFpbHVyZQ0KRGV0YWlsczogICAgICAgIGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3NDgzN3YxL2luZGV4Lmh0bWwNCkNJIEJ1ZyBMb2cg
LSBjaGFuZ2VzIGZyb20geGUtNTgxNS03MDNjZDI3MWRiM2EzNTA4ODQ2MGFiM2ZlYzBhOTZiZDQ4
ZTdmZTA0X0ZVTEwgLT4geGUtcHctMTc0ODM3djFfRlVMTA0KU3VtbWFyeQ0KDQpGQUlMVVJFDQoN
ClNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIHhlLXB3LTE3NDgzN3YxX0ZVTEwg
YWJzb2x1dGVseSBuZWVkIHRvIGJlDQp2ZXJpZmllZCBtYW51YWxseS4NCg0KSWYgeW91IHRoaW5r
IHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2Vz
DQppbnRyb2R1Y2VkIGluIHhlLXB3LTE3NDgzN3YxX0ZVTEwsIHBsZWFzZSBub3RpZnkgeW91ciBi
dWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRo
ZW0NCnRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2Ug
ZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KDQpQYXJ0aWNpcGF0aW5nIGhvc3RzICgzIC0+IDMpDQoN
Ck5vIGNoYW5nZXMgaW4gcGFydGljaXBhdGluZyBob3N0cw0KDQpQb3NzaWJsZSBuZXcgaXNzdWVz
DQoNCkhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJv
ZHVjZWQgaW4geGUtcHctMTc0ODM3djFfRlVMTDoNCg0KSUdUIGNoYW5nZXMNClBvc3NpYmxlIHJl
Z3Jlc3Npb25zDQoNCiAgKiAgIGlndEB4ZV9jY3NAc3VzcGVuZC1yZXN1bWVAdGlsZTY0LWNvbXBy
ZXNzZWQtY29tcGZtdDAtc3lzdGVtLXN5c3RlbToNCiAgICAgKiAgIHNoYXJkLXB0bDogUEFTUzxo
dHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS01ODE1LTcwM2NkMjcx
ZGIzYTM1MDg4NDYwYWIzZmVjMGE5NmJkNDhlN2ZlMDQvc2hhcmQtcHRsLTgvaWd0QHhlX2Njc0Bz
dXNwZW5kLXJlc3VtZUB0aWxlNjQtY29tcHJlc3NlZC1jb21wZm10MC1zeXN0ZW0tc3lzdGVtLmh0
bWw+IC0+IERNRVNHLVdBUk48aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwt
eGUveGUtcHctMTc0ODM3djEvc2hhcmQtcHRsLTgvaWd0QHhlX2Njc0BzdXNwZW5kLXJlc3VtZUB0
aWxlNjQtY29tcHJlc3NlZC1jb21wZm10MC1zeXN0ZW0tc3lzdGVtLmh0bWw+ICsxIG90aGVyIHRl
c3QgZG1lc2ctd2Fybg0KDQp0aGlzIGZhaWx1cmUgaXMgdW5yZWxhdGVkIHNpbmNlIHRoZSBvbmx5
IGNoYW5nZXMgaW4gbXkgc2VyaWVzIGltcGFjdHMgTlZMLVMgYWxvbmUuDQo=

--_000_073cb12a539b63aed0e051d3c526cfe36b757a6ccamelintelcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <A02D9DABEB035041B871B8E9909F3177@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjx0aXRsZT5Qcm9qZWN0IExpc3QgLSBQYXRjaHdv
cms8L3RpdGxlPg0KPHN0eWxlIGlkPSJjc3MtdGFibGUtc2VsZWN0IiB0eXBlPSJ0ZXh0L2NzcyI+
DQogICB0ZCB7IHBhZGRpbmc6IDJwdDsgfQ0KICA8L3N0eWxlPjxzdHlsZT5wcmUsY29kZSxhZGRy
ZXNzIHsNCiAgbWFyZ2luOiAwcHg7DQp9DQpoMSxoMixoMyxoNCxoNSxoNiB7DQogIG1hcmdpbi10
b3A6IDAuMmVtOw0KICBtYXJnaW4tYm90dG9tOiAwLjJlbTsNCn0NCm9sLHVsIHsNCiAgbWFyZ2lu
LXRvcDogMGVtOw0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQpibG9ja3F1b3RlIHsNCiAgbWFy
Z2luLXRvcDogMGVtOw0KICBtYXJnaW4tYm90dG9tOiAwZW07DQp9DQo8L3N0eWxlPg0KPC9oZWFk
Pg0KPGJvZHk+DQo8ZGl2Pk9uIFRodSwgMjAyNi0wOS0yNCBhdCAxMToyMCArMDAwMCwgUGF0Y2h3
b3JrIHdyb3RlOjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgc3R5bGU9Im1hcmdpbjow
IDAgMCAuOGV4OyBib3JkZXItbGVmdDoycHggIzcyOWZjZiBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4
Ij4NCjxkaXY+PGI+UGF0Y2ggRGV0YWlsczwvYj48L2Rpdj4NCjxkaXY+DQo8dGFibGU+DQo8dGJv
ZHk+DQo8dHI+DQo8dGQ+PGI+U2VyaWVzOjwvYj48L3RkPg0KPHRkPkVuYWJsZSBHU0MgbG9hZGlu
ZyBhbmQgUFhQIGZvciBOVkwtUzwvdGQ+DQo8L3RyPg0KPHRyPg0KPHRkPjxiPlVSTDo8L2I+PC90
ZD4NCjx0ZD48YSBocmVmPSJodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzE3NDgzNy8iPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTc0ODM3
LzwvYT48L3RkPg0KPC90cj4NCjx0cj4NCjx0ZD48Yj5TdGF0ZTo8L2I+PC90ZD4NCjx0ZD5mYWls
dXJlPC90ZD4NCjwvdHI+DQo8dHI+DQo8dGQ+PGI+RGV0YWlsczo8L2I+PC90ZD4NCjx0ZD48YSBo
cmVmPSJodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNzQ4
Mzd2MS9pbmRleC5odG1sIj5odHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14
ZS94ZS1wdy0xNzQ4Mzd2MS9pbmRleC5odG1sPC9hPjwvdGQ+DQo8L3RyPg0KPC90Ym9keT4NCjwv
dGFibGU+DQo8L2Rpdj4NCjxoMT5DSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIHhlLTU4MTUtNzAz
Y2QyNzFkYjNhMzUwODg0NjBhYjNmZWMwYTk2YmQ0OGU3ZmUwNF9GVUxMIC0mZ3Q7IHhlLXB3LTE3
NDgzN3YxX0ZVTEw8L2gxPg0KPGgyPlN1bW1hcnk8L2gyPg0KPHA+PHN0cm9uZz5GQUlMVVJFPC9z
dHJvbmc+PC9wPg0KPHA+U2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29taW5nIHdpdGggeGUtcHct
MTc0ODM3djFfRlVMTCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmU8YnI+DQp2ZXJpZmllZCBtYW51YWxs
eS48L3A+DQo8cD5JZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5n
IHRvIGRvIHdpdGggdGhlIGNoYW5nZXM8YnI+DQppbnRyb2R1Y2VkIGluIHhlLXB3LTE3NDgzN3Yx
X0ZVTEwsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS1pbmZyYUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW08YnI+DQp0byBkb2N1bWVudCB0aGlzIG5ldyBm
YWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS48L3A+
DQo8aDI+UGFydGljaXBhdGluZyBob3N0cyAoMyAtJmd0OyAzKTwvaDI+DQo8cD5ObyBjaGFuZ2Vz
IGluIHBhcnRpY2lwYXRpbmcgaG9zdHM8L3A+DQo8aDI+UG9zc2libGUgbmV3IGlzc3VlczwvaDI+
DQo8cD5IZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRy
b2R1Y2VkIGluIHhlLXB3LTE3NDgzN3YxX0ZVTEw6PC9wPg0KPGgzPklHVCBjaGFuZ2VzPC9oMz4N
CjxoND5Qb3NzaWJsZSByZWdyZXNzaW9uczwvaDQ+DQo8dWw+DQo8bGk+aWd0QHhlX2Njc0BzdXNw
ZW5kLXJlc3VtZUB0aWxlNjQtY29tcHJlc3NlZC1jb21wZm10MC1zeXN0ZW0tc3lzdGVtOg0KPHVs
Pg0KPGxpPnNoYXJkLXB0bDogPGEgaHJlZj0iaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvaW50ZWwteGUveGUtNTgxNS03MDNjZDI3MWRiM2EzNTA4ODQ2MGFiM2ZlYzBhOTZiZDQ4ZTdm
ZTA0L3NoYXJkLXB0bC04L2lndEB4ZV9jY3NAc3VzcGVuZC1yZXN1bWVAdGlsZTY0LWNvbXByZXNz
ZWQtY29tcGZtdDAtc3lzdGVtLXN5c3RlbS5odG1sIj4NClBBU1M8L2E+IC0mZ3Q7IDxhIGhyZWY9
Imh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE3NDgzN3Yx
L3NoYXJkLXB0bC04L2lndEB4ZV9jY3NAc3VzcGVuZC1yZXN1bWVAdGlsZTY0LWNvbXByZXNzZWQt
Y29tcGZtdDAtc3lzdGVtLXN5c3RlbS5odG1sIj4NCkRNRVNHLVdBUk48L2E+ICsxIG90aGVyIHRl
c3QgZG1lc2ctd2FybjwvbGk+PC91bD4NCjwvbGk+PC91bD4NCjwvYmxvY2txdW90ZT4NCjxkaXY+
PGJyPg0KPC9kaXY+DQo8ZGl2PnRoaXMgZmFpbHVyZSBpcyB1bnJlbGF0ZWQgc2luY2UgdGhlIG9u
bHkgY2hhbmdlcyBpbiBteSBzZXJpZXMgaW1wYWN0cyBOVkwtUyBhbG9uZS48L2Rpdj4NCjxkaXY+
PHNwYW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_073cb12a539b63aed0e051d3c526cfe36b757a6ccamelintelcom_--
