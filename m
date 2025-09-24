Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B73CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 05:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D3A10E69B;
	Wed, 24 Sep 2025 05:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TVeSG+ij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808C310E697;
 Wed, 24 Sep 2025 05:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758692665; x=1790228665;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oh9GQwksVF4aa1+lMOarcNwE73SpDaTz2AwFA/Rd3lM=;
 b=TVeSG+ijreyjx0Wh3hnG9clNzcENg4FZda+aQ9+5zCieYvdLAkrP2sGO
 9sA50XtuL4ItC0RGaPRy+gIheU+k4bzH8t0sAvhW6aqIxmJW9M8tks+iW
 sgFpE6Xe/3OtZEc2RkEYblS2QcbSHSl97p0m86SiDJyQcJ6wgRh3Nhk3l
 O7o7SGbPwd84PoTJNIWtV4mcaZI69M6TmiW93lUmg2F6T5cvkmf2Ji+cy
 uHMssxzghv10y9D11ZkZbBsx/TmhPbrJUs9pBe1uKNI7jYYlYLY2etE0x
 eyFC/ss218JGwqxNvxMvEFtIxJpiNu6cmNkBjKvwSg8KfKqxpQcO9AWuR g==;
X-CSE-ConnectionGUID: lELwJmVcQwu4sC1XjCuXvg==
X-CSE-MsgGUID: MS8lsLB+SZ6RN3unmpGA+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="71604535"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="71604535"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 22:44:25 -0700
X-CSE-ConnectionGUID: 0r+rGonnRDqX80GT+7MQkA==
X-CSE-MsgGUID: b3k5lMicSHS18m8AShWOHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="180959255"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2025 22:44:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 23 Sep 2025 22:44:24 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 23 Sep 2025 22:44:24 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.25) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 22:44:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jrnp/VksrqP3HLZCw42+w+VJLEnClyxZnYjUYiTrJqP0K1C+Mp4nxqS9t6J35Ywpo881oqc3gJob0abT7p8Tqw6aPrsvE0ut6Tce/vyivignfMyVMzmQy+pkAQguxiKV3Fb7E/cZJqUCC03fGRrrcr4vR7Xe4nyoUO+fe0fRXZJuJpj7/jKH8vqN68GEdREmtSRohp0QQo6/dRbX4ehu0b7JyQO7EWHGKqzpOpTbRFGAqEAKv6pU4gA7CZpRZi3RRdGsd1xSo+9JPKT/TH53BO06cx7GUMTSVVLIZTAIamuqNXaR3nBQmPdT8U2FUz+zHRXgbHt1fyEnIWPDnnwSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh9GQwksVF4aa1+lMOarcNwE73SpDaTz2AwFA/Rd3lM=;
 b=l4uNtbaD/ebLWr780F3IlC7hiBVpeqIdYHNI34aJ8jqbSxNWGp+5jx6DAPHsHN2DFkz8FubN59a0geYwWaobRpKk4aUo9ytcSc5mQ1ef/Pl0gF1gYoMZYAR/1VRN4KpqPVmZ1pIjQYvu6aU1QMQb4xri/aWhwEq7XSBkzOVI38pGHR7kiyVpo8smlt5VlOApzMmIWRkVbyXDp0C8w47YKW/ZvvZLfsuYn+4E+5VfU8yNQr1FaHeTyZw5KIoz+eLQicpPOe2daMZOpHYY/ReCBwNdwqNaM8PcKfGQenMkEH25CVQduliz9a+2FobyUBStD9v5UPJM2/McZrQgawieJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 05:44:21 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 05:44:14 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "Deak, Imre" <imre.deak@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5CQVQ6IGZhaWx1cmUgZm9yIGRybS9pOTE1L2RwOiBX?=
 =?utf-8?Q?ork_around_a_DSC_pixel_throughput_issue_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVyZSBmb3IgZHJtL2k5MTUvZHA6IFdvcmsg?=
 =?utf-8?Q?around_a_DSC_pixel_throughput_issue_(rev3)?=
Thread-Index: AQHcK9rRVpSf7/RMSUq2g5aO1A+URrSh1Jbw
Date: Wed, 24 Sep 2025 05:44:14 +0000
Message-ID: <CH0PR11MB54910AB8C78C0B2AF68154B3EF1CA@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20250918211223.209674-1-imre.deak@intel.com>
 <175855614562.354824.565057761427346128@1538d3639d33>
 <aNFzjwViWnPHjOMk@ideak-desk>
In-Reply-To: <aNFzjwViWnPHjOMk@ideak-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|CY5PR11MB6533:EE_
x-ms-office365-filtering-correlation-id: b8800b53-6fe6-4e1c-0a34-08ddfb2d6532
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|13003099007|7053199007|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d1NGdkNBS2FpSFo1VmloVDlHSXV3MXBqVDAxWnByYTRrNTBXK2hFM04xaTdM?=
 =?utf-8?B?THBRaU0wQjVHblpPNHRzcW9xWFNSenF6K3RRMTZHZjZVd0xPdXJ1dUdFanFX?=
 =?utf-8?B?cmY1emRZeUJGREN0b1FCdXBrWmkrQ3hmeGVmdWg3MzhZMWcrUkM3ZlI3aHA4?=
 =?utf-8?B?SW56cElVUEFDM0pSUG1lNDd0QldyVzNxZVJYN3JiR0kzaWhOVHBzUlFPWVBp?=
 =?utf-8?B?Vzh2N0FkMGJQZVF3eExyanJvNWtUbTZ4QnJwOG9JK0JuWHkyajVidmREcDho?=
 =?utf-8?B?ckRiK0grU014S0xnSkVmUzE1VXdPOUwxcEN5b0RvUHVTK1RGU25ibXN3bkxU?=
 =?utf-8?B?QnlxUzM0QlhuelplZVAxbnFRMGtjV1ZDVkxMRHNrci9URVlMYlB4OFBLWEdB?=
 =?utf-8?B?L3cxN1ZtcFI1d2MyRFlLeU9JZ3BTOFplUWVZVWxXRVFvSmMrL2NmY2oyWG44?=
 =?utf-8?B?bmRCTUp4Y0JDNURJQ2hhaHpKL2J6eHhxSmhETmlDOHo2MEhpeC9RTmo1Lzdj?=
 =?utf-8?B?a2JrOSsxUEJKTDhWOWlPZlluK0NuQkFQdDdkNkN1MzJtd3BYS3RtNkEwSk1i?=
 =?utf-8?B?NkFpQk5xMGxWTGE4V1ArenpCRlpOUmI3T3VlSlVLZGxBMUZETDc0dXhZMld0?=
 =?utf-8?B?RzdiT2oybDM5QWMyME1qTm5lMU91T0xKYk1SdDd6R3UxR2JvOHljTWJLYjVW?=
 =?utf-8?B?dG9WWXpUbW1BUGRLbURHTzJOdHdlTEQwQ2M1S3Y5a2Qvd3VNTHY0RkN4NEx4?=
 =?utf-8?B?ZjAxRFJTTGF6RWphNWpVMUlHUklOYmlSdmJkOTMvS0dOM1ZLRWRNbWptNXhP?=
 =?utf-8?B?VjF6d3RadGhmZkNnRmJrUFdQZ3M4YU1GZmczOThMeldPK2R1SmIvVE1tNGV1?=
 =?utf-8?B?TGhKNS9qMmZrcWJqM3FoQjlWaFovcG9XbVhBZDdhVmVxQ3lRd2o2LzFBanJO?=
 =?utf-8?B?ZmNjQjVLRkhnUVVqVktHbWZtT0dDckRLckl1NDBFV3FoTWlVcDh1TEdDQWd0?=
 =?utf-8?B?Q2RmOUQ1K0pVUFpWZ2d6TjFOWFhYdmpIZzhycFpBM1d2d1ZNWU9uNmRYaXV4?=
 =?utf-8?B?aFZvVFRCaHQrK1BxeVlod3lBcFo3TUgzMnJoNlZQZFIyK2FUVWpCdXdLYUxT?=
 =?utf-8?B?ODYrdXFOS05ITmJFaFVVZ3JXdFZqZ1UxVTY4T3IweGNsYlZMU1cwTkNaVEtE?=
 =?utf-8?B?TEVsQm41OHBoeW9hMFBqeC9rZFBQbGhDSlNUZU1aSGpGbVlYTGxKWTc2anM2?=
 =?utf-8?B?OFRFaFlHb3d4MklnL1U1V3VVejlVTmxxaEt0VmV4UEs5RkZsaG9RYVNaeGg5?=
 =?utf-8?B?d3pmZmM0ZnVsZDlZN3RJczM4UGdJWExRZU96ZG5VaDJ2REhpUlNzbWpkZjlV?=
 =?utf-8?B?N2ZpVVdPZHRFdG1rK2VoQ2VwV1htMUU5UkFTdHdDZFZLUmZaLzlEcHluQ2Nq?=
 =?utf-8?B?NmhTV3daM29LSVFXUVhMTmdUK3Q5L09FSUZ1Z2NOd0ovVDBzVXBYSzh5UWFK?=
 =?utf-8?B?M2J3azFXODJOaC9uNEQ3NmRkUXFSSml0KzRBQVlkcVZYZ3poR3krZFh3aDZY?=
 =?utf-8?B?dU05YkF6VklNcktpMFIxd3h2UFhwcDJQVmNsdjNDdnpvL0dlYlFLUW5aMFZ6?=
 =?utf-8?B?dll0QTNCWTFYNDhjZ0RBNy8xOUxneGVRdzF6ay90MXo1RUZRdWZ0bVVmMDRi?=
 =?utf-8?B?U3QzUTBrbCtqaklQZnFNdHBzY0FKRm1jd3hFbEI5UDdYcTRiNXU3Qk5OYzVk?=
 =?utf-8?B?T2NQV1IzcjkySkhTeGFLc1dXOS9oVUlkVzRsaTd1RVNsSVFibjZpc3hYbEhY?=
 =?utf-8?B?TlZmWGhEaU02TGpXTTFlYXhhK3RabGdUVkFnMXlXUkx4ZndqOUsxMnd5QWNE?=
 =?utf-8?B?WElYSW9SMFpiWTJaSm0wSFdyMUNXWFplcWJrRUhVaDFDcTA3bDhhMVYyd1Jw?=
 =?utf-8?Q?lzc9Fyya+OhWbkrb3zFMWS4kBgN28FCp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(13003099007)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dnQvS244NlRXR2pPMXdZbGdUNUJYYWVUSVBNU2YrTFZNcWVBOTlmOExwQVJt?=
 =?utf-8?B?T1pZYUk3ZjRBY1FnYWhFcEpKOEFRRjdFdm5iL2RVNzUxUkgxL2VIblR5aVk1?=
 =?utf-8?B?UTZwNnF6WnVOTGIweW9NbnIyK290WVlqY243RkljNXREaGpXd2JwRzQ0ekM2?=
 =?utf-8?B?Vk5tTFloZlBLVUsxUDBuUWMwU1hMOTdkUHlvTnBnRENsQkpzWHlWV3kxVmZE?=
 =?utf-8?B?YWlYVEJoVEhmRG5xZlNjVVlDakNjNks5dEpyeUZEWUFqbWJsN2ppUGl5OUxy?=
 =?utf-8?B?S0lLZWp2bE9oVlhLVENETUdJaE45NDc3MEQ4K2p3dTJ4Y0lsQnYyUFZKK0R3?=
 =?utf-8?B?THZBaXc5Q2R0NnpzWTdsWWk2WnFja2thcktJTWRFRldudFl4MVVXZVQrbWI0?=
 =?utf-8?B?eEIvUzVaVFdDSEJnZUd3TVRvNG80NUpCTTc0S09nQkIxWlZxeUgwUm1NYTBI?=
 =?utf-8?B?R3E3c1l4ZlUrMHo0Ty9JcVVMMmM1N0V2NnpIM1lrVS9vbFFvT25qZEJaVU1r?=
 =?utf-8?B?ZlVaYzdBV0ZHZS9vb2ZRRTZnbE9KanBmNHRQZnIvallmTURxbVlXbmY5cVVW?=
 =?utf-8?B?eEhLZzNMZ0p3UFdxVXNQQ2lIdkNkWGROcWhwNExzaHBiVmw0NlZQbmRLV3JI?=
 =?utf-8?B?b0tEZkFtWUNtZTZGbXNMeFBlcnpFc20xVmNtcWU3TlhmMFlkQk1GN0pvanRW?=
 =?utf-8?B?cDZ3R1pVTEQ3UHluVFowaitvZkY0YmVkTFo1c1VqVDlaNStOU2k3YTVTYXZy?=
 =?utf-8?B?L1U1K0xrM2QyVWUrOHBXbWNyaDAxVlF1eFlpaUVBbjZWdjJQL1lqUDM1TzFw?=
 =?utf-8?B?K1JBZnB3ZTNMTXM3bzdLOGdjdmQyZnYxV2htZ0RqbThIWHIvRm1VOUhVbWd5?=
 =?utf-8?B?Zit4Vm04SlVWd25mY2RraXlLeUxFZlpTK0FkL1lrUUt2NG1mOW84anZ1MUN2?=
 =?utf-8?B?c3B4NUxIMWxOWE90NFY5Q1JlVGJGME1rMVR3MjIyVUgwUzdsWVkwOVBKWFRp?=
 =?utf-8?B?RjNSK3pXTUFFKy9WY0ZaUkxsVUlraGdmVjdsYzU4UURzdWU4Z04reXRCWVk4?=
 =?utf-8?B?R0xsTUo5RzhqTlRLcWJiTyszSWdGSmdHaFRwOG9hakNJZDRIdW94L3I3ZXlJ?=
 =?utf-8?B?NGJUNUZRZkhsZFR3NGhCYkxhWEUxK1UzalZtamtNNU9weGh2Q0ZZZnlDOUlr?=
 =?utf-8?B?UkdIbHlBcTU1RnI5dlNubVRnYks4SWtJWnFoTlhmb3FOd09jL1BseWFKNkN4?=
 =?utf-8?B?S0F1Q3JyT3poQ0MwWEJ3UHYyMGZIVEhQUHhCejNCNUhINWRBMmxVbzd5cFVh?=
 =?utf-8?B?ZXRsQkpCbm5ZUHpXSXFpdUE3SmUwVlBoNldQNFNSNDlWcGhodDM5TnQvVzQr?=
 =?utf-8?B?dnNoU3hLQmp4VFcvWEtNMWhSTEhXU0VwNCtOZWw5NnlVWmRSTm5vdzN4NFUv?=
 =?utf-8?B?S29ZWEorUWEySTBLTm0xbkpsekFuYXlaMTA1c1ZPbi9zVXU5SGloMEZnU0Uz?=
 =?utf-8?B?M2xjRWdseTJHUXVKZUNrRUZ0aGhPSmdwY1g2WWVNVnp6V3RSSlc3UXZBUlhJ?=
 =?utf-8?B?NWhLdEltaGJqU0pheE16YzlSN2lHanpBR1NQalhaREJVVWk2SEgwREYzdnpN?=
 =?utf-8?B?Y0hXQThENFRSajk5U1UyaGRWa01paExZNnE2Skc2Mm9ORHowNytFQWpDTGFm?=
 =?utf-8?B?ak40aTNrOHVZTHg2K2VYcDN3STBCQmpSbDM4c3J3Yy9tRzI0VnJpMm5FTlZR?=
 =?utf-8?B?TklNZlg2OVBDcVppWmxGVnoyT1U2UnVFTGszaEVYVTlBMXRPdk1kRG8wb29z?=
 =?utf-8?B?OWY0N3ZkTEZraStwZDErNGFNMHlmZEkwYmpDUlAySUphWHRqSnlSL2J0MlR5?=
 =?utf-8?B?QkRjcXFkSDlXSzJGK0duNjhZcFJHZXRqek9vT3pwSFJMYTF5Z0t5TVBJUmFY?=
 =?utf-8?B?WVpkZ0JLcnlmcXBDb0tvWEZEdXhMS1Y3NExJYUdiTmV5bXJ1c1NnNHQzcVg5?=
 =?utf-8?B?KytGcERYamJ2TWx1MWNTY1hUeEs0THhFKzBXaTM1SkU0T01SUXFkMUxFd20x?=
 =?utf-8?B?clRESWVmL2FnQ0p0YUo1T21OTis5cHpBZm9hK0Nyb05KMGd2S1AwR0FvS2hT?=
 =?utf-8?B?dlhyaVBLaVQ0RjBVTXVTb2JqcU4vSzA1MWtNdmxhcWhjQ2NNcExzcjk4cEtF?=
 =?utf-8?Q?m3E1WnWdmRdU/Yfm9+WgGm1RHhFfDI1OZKEHMBjbKfPN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8800b53-6fe6-4e1c-0a34-08ddfb2d6532
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 05:44:14.6129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4FVdZdXVzPfFwr+Eg4rFBIW/AH1TqYje6iJ5q4NB9zFbN24fDeN6ochjJ4cpBHiCOpPJTAIDN3+szGMoNpyFgYd9HljbTsW1HAEcVl8aG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
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

SGksDQoNCiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1NDczNy8N
ClhlLkNJLkJBVCAtIEFkZHJlc3NlZCBmYWlsdXJlcywgWGUgY2Fubm90IGJlIHJlLXJlcG9ydGVk
Lg0KDQpUaGFua3MsDQpSYXZhbGkuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBJOTE1LWNpLWluZnJhIDxpOTE1LWNpLWluZnJhLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPiBPbiBCZWhhbGYgT2YgSW1yZSBEZWFrDQpTZW50OiAyMiBTZXB0ZW1iZXIgMjAyNSAyMToz
NQ0KVG86IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogaW50ZWwteGVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyXIFhlLkNJLkJBVDogZmFpbHVy
ZSBmb3IgZHJtL2k5MTUvZHA6IFdvcmsgYXJvdW5kIGEgRFNDIHBpeGVsIHRocm91Z2hwdXQgaXNz
dWUgKHJldjMpDQoNCk9uIE1vbiwgU2VwIDIyLCAyMDI1IGF0IDAzOjQ5OjA1UE0gKzAwMDAsIFBh
dGNod29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogZHJt
L2k5MTUvZHA6IFdvcmsgYXJvdW5kIGEgRFNDIHBpeGVsIHRocm91Z2hwdXQgaXNzdWUgKHJldjMp
DQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTQ3
MzcvDQo+IFN0YXRlIDogZmFpbHVyZQ0KDQpIaSBDSSB0ZWFtLA0KDQpjb3VsZCB5b3UgcGxlYXNl
IHJlLXJlcG9ydCB0aGlzIHJlc3VsdD8NCg0KVGhlIGlzc3VlIGlzIHVucmVsYXRlZCwgaXQncyBw
cmVzZW50IGluIGJhc2UtbGluZSBJR1QveGUgdGVzdHJ1bnMgYXMgd2VsbCBhbmQgaGFzIG5vdyBh
biBvcGVuIHRpY2tldCB0b286DQoNCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0v
eGUva2VybmVsLy0vaXNzdWVzLzYyMDENCg0KSSBzdXBwb3NlIHRoZSBjaWJ1ZyBmaWx0ZXIgY291
bGQgYmUgc2ltcGx5IHNldCB0byBhbGwgcGxhdGZvcm1zIGZvciB0aGlzIGlzc3VlLg0KDQpUaGFu
a3MsDQpJbXJlDQoNCj4gDQo+ID09IFN1bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFu
Z2VzIGZyb20gDQo+IHhlLTM4MTItYzRkMTkzMjBhMGUyZjdkOGRlYzk3ZDRhNTkzMDkzNDlhM2E2
M2VjMF9CQVQgLT4gDQo+IHhlLXB3LTE1NDczN3YzX0JBVCANCj4gPT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3VtbWFyeQ0KPiAtLS0t
LS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5rbm93biBjaGFuZ2Vz
IGNvbWluZyB3aXRoIHhlLXB3LTE1NDczN3YzX0JBVCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4g
ICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVk
IGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1
Y2VkIGluIHhlLXB3LTE1NDczN3YzX0JBVCwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJ
OTE1LWNpLWluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiAgIHRv
IGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUgbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2Ug
cG9zaXRpdmVzIGluIENJLg0KPiANCj4gICANCj4gDQo+IFBhcnRpY2lwYXRpbmcgaG9zdHMgKDEx
IC0+IDkpDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5n
ICAgICgyKTogYmF0LWFkbHAtdm0gYmF0LXB0bC12bSANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1
ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBj
aGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluIHhlLXB3LTE1NDczN3YzX0JB
VDoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUgcmVncmVz
c2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljQGZvcmNl
LWVkaWQ6DQo+ICAgICAtIGJhdC1ibWctMjogICAgICAgICAgTk9UUlVOIC0+IFtBQk9SVF1bMV0N
Cj4gICAgWzFdOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50ZWwteGUv
eGUtcHctMTU0NzM3djMvYmF0LWJtZy0yL2lndA0KPiBAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNp
Y0Bmb3JjZS1lZGlkLmh0bWwNCj4gDQo+ICAgDQo+ICMjIyMgU3VwcHJlc3NlZCAjIyMjDQo+IA0K
PiAgIFRoZSBmb2xsb3dpbmcgcmVzdWx0cyBjb21lIGZyb20gdW50cnVzdGVkIG1hY2hpbmVzLCB0
ZXN0cywgb3Igc3RhdHVzZXMuDQo+ICAgVGhleSBkbyBub3QgYWZmZWN0IHRoZSBvdmVyYWxsIHJl
c3VsdC4NCj4gDQo+ICAgKiBpZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpY0Bmb3JjZS1jb25u
ZWN0b3Itc3RhdGU6DQo+ICAgICAtIHtiYXQtcHRsLTF9OiAgICAgICAgW0FCT1JUXVsyXSAoW0lu
dGVsIFhFIzYyMDFdKSAtPiBbQUJPUlRdWzNdDQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngt
Y2kuMDEub3JnL3RyZWUvaW50ZWwteGUveGUtMzgxMi1jNGQxOTMyMGEwZTJmN2Q4ZGVjOTdkNGE1
OTMwOTM0OWEzYTYzZWMwL2JhdC1wdGwtMS9pZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpY0Bm
b3JjZS1jb25uZWN0b3Itc3RhdGUuaHRtbA0KPiAgICBbM106IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNTQ3Mzd2My9iYXQtcHRsLTEvaWd0DQo+
IEBrbXNfZm9yY2VfY29ubmVjdG9yX2Jhc2ljQGZvcmNlLWNvbm5lY3Rvci1zdGF0ZS5odG1sDQo+
IA0KPiAgIA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tDQo+IA0KPiAgIEhlcmUgYXJl
IHRoZSBjaGFuZ2VzIGZvdW5kIGluIHhlLXB3LTE1NDczN3YzX0JBVCB0aGF0IGNvbWUgZnJvbSBr
bm93biBpc3N1ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+IA0KPiAjIyMjIFBvc3Np
YmxlIGZpeGVzICMjIyMNCj4gDQo+ICAgKiBpZ3RAa21zX2ZvcmNlX2Nvbm5lY3Rvcl9iYXNpY0Bm
b3JjZS1jb25uZWN0b3Itc3RhdGU6DQo+ICAgICAtIGJhdC1ibWctMjogICAgICAgICAgW0FCT1JU
XVs0XSAoW0ludGVsIFhFIzYyMDFdKSAtPiBbUEFTU11bNV0NCj4gICAgWzRdOiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS0zODEyLWM0ZDE5MzIwYTBlMmY3ZDhk
ZWM5N2Q0YTU5MzA5MzQ5YTNhNjNlYzAvYmF0LWJtZy0yL2lndEBrbXNfZm9yY2VfY29ubmVjdG9y
X2Jhc2ljQGZvcmNlLWNvbm5lY3Rvci1zdGF0ZS5odG1sDQo+ICAgIFs1XTogDQo+IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhlL3hlLXB3LTE1NDczN3YzL2JhdC1ibWct
Mi9pZ3QNCj4gQGttc19mb3JjZV9jb25uZWN0b3JfYmFzaWNAZm9yY2UtY29ubmVjdG9yLXN0YXRl
Lmh0bWwNCj4gDQo+ICAgDQo+ICAge25hbWV9OiBUaGlzIGVsZW1lbnQgaXMgc3VwcHJlc3NlZC4g
VGhpcyBtZWFucyBpdCBpcyBpZ25vcmVkIHdoZW4gY29tcHV0aW5nDQo+ICAgICAgICAgICB0aGUg
c3RhdHVzIG9mIHRoZSBkaWZmZXJlbmNlIChTVUNDRVNTLCBXQVJOSU5HLCBvciBGQUlMVVJFKS4N
Cj4gDQo+ICAgW0ludGVsIFhFIzYyMDFdOiANCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS94ZS9rZXJuZWwvaXNzdWVzLzYyMDENCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+
IC0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgKiBJR1Q6IElHVF84NTQ2IC0+IElHVF84NTQ3DQo+ICAg
KiBMaW51eDogeGUtMzgxMi1jNGQxOTMyMGEwZTJmN2Q4ZGVjOTdkNGE1OTMwOTM0OWEzYTYzZWMw
IC0+IA0KPiB4ZS1wdy0xNTQ3Mzd2Mw0KPiANCj4gICBJR1RfODU0NjogODU0Ng0KPiAgIElHVF84
NTQ3OiA4NTQ3DQo+ICAgeGUtMzgxMi1jNGQxOTMyMGEwZTJmN2Q4ZGVjOTdkNGE1OTMwOTM0OWEz
YTYzZWMwOiBjNGQxOTMyMGEwZTJmN2Q4ZGVjOTdkNGE1OTMwOTM0OWEzYTYzZWMwDQo+ICAgeGUt
cHctMTU0NzM3djM6IDE1NDczN3YzDQo+IA0KPiA9PSBMb2dzID09DQo+IA0KPiBGb3IgbW9yZSBk
ZXRhaWxzIHNlZTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2ludGVsLXhl
L3hlLXB3LTE1NDczN3YzL2luZGV4Lmh0bWwNCg==
