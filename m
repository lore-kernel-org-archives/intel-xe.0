Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C335C282DE
	for <intel-xe@archiver.kernel.org>; Sun, 16 Mar 2025 08:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B07310E0C5;
	Sun, 16 Mar 2025 08:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WUvJnDCU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805AA10E0C5
 for <intel-xe@lists.freedesktop.org>; Sun, 16 Mar 2025 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742115460; x=1773651460;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XnygywRRZJU2KWgqEEBbuBrH3rKaHgs5auWbY+UW6EQ=;
 b=WUvJnDCU/jNrHM2fltJNftgHAQ4hi7tNzckrBwaGX4j14lnKHiERw4TT
 dY7Ouv8Sf+c01K8W20UvMgV6Sxnokbqs+H/cgq+Il0q+e87p4mliOvuRe
 rhv1/tGM7xNlt5liYu6shlSZ6ZsAz3S9xidnyML5Og4XBqKh4wDOcNem2
 V/uV+ZpBl8ZFdjRoA5jz41LW4zR0waElvFQ6xYcAGtFmmdX5XjTFTrI/e
 rP6d7t7q7UbQG0eqSIv2O+uN0erEdCxNCQy1LEPEj32pJvLggBO2xVsVF
 egXOKLUoAWKl1Ln05mdOmQxe8v659+suUTPANKcIFdkByp7B2JKuQ2d1t A==;
X-CSE-ConnectionGUID: sV8i4Px1RdewooFkQKCdxA==
X-CSE-MsgGUID: 1P14ISURS5Oql2/ySywaZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="60619813"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; d="scan'208";a="60619813"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2025 01:57:37 -0700
X-CSE-ConnectionGUID: Z1pubPc6TQeEpQEiH7nA7w==
X-CSE-MsgGUID: 2qIhWly/QpektOWbPF60RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; d="scan'208";a="144855952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2025 01:57:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 16 Mar 2025 01:57:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 16 Mar 2025 01:57:36 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 16 Mar 2025 01:57:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IgZmmUd78lQGd0KinfoUbv43QIwQTYNyL81AQAAm1Fs+EjnOsenx0fqLHMF8XOMZea04VoH69U8kCwiYPaTUD5pkDiTLEYhJLWgBEDPrr3n93WKy85n6LDoah2QR5F6MU/YJpvmSAmXrR/6r2OS/904TvPEz41lPRJDBQMitedCYYtqHr4h1X5nyQY72/Mktb8gFsWDu2yehug7IqzvZ3nov+mMxBjrxASuaSF+OrjuySvx2I3lIet6eEsKHkoakoBVSSKVPrt6P5F+UXZUlIqv/8NTOv6OJGDAMm1xwqrLVg4x40+Jp3HV7YHKKeymrcGCLquvarARZPGAwiEtFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnygywRRZJU2KWgqEEBbuBrH3rKaHgs5auWbY+UW6EQ=;
 b=Fn7+XqiAq2lHr7vCLXMi6uOAqyjKaijgQtLDsKY6kRxq0IjBP4oW7s43zhlT3j7l7m21niJGL4XdN95u9kGQGy2jc0HqhB/qyDnwxsykyTC9D3sHhZNoiOUMnegWIYMFcjDc7O8K4BpLksOs+h0DrR3VVVo+JU8+PI2KvcYktE8VTZh9WmZLqxomijIA7h13o9OeC/98/b+c+8DpVTCj2O+/UDeJ/FcC+Xa5PCc+YlfZF0/0U4AtgpGKZ7pEVJCSq2bCTKaUKbPms9pFnun4t9u2PIjyqX6jkXE7iGlJscdI5MTaOgPduKDVUkwi5UCn3Y8CRdymRu+PDp1fWHBSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 DS7PR11MB7952.namprd11.prod.outlook.com (2603:10b6:8:eb::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Sun, 16 Mar 2025 08:57:33 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%4]) with mapi id 15.20.8534.031; Sun, 16 Mar 2025
 08:57:33 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBkcm0vZGlzcGxheTog?=
 =?utf-8?Q?dp:_add_new_DPCD_access_functions_(rev2)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIGRybS9kaXNwbGF5OiBkcDog?=
 =?utf-8?Q?add_new_DPCD_access_functions_(rev2)?=
Thread-Index: AQHblTgTv+5HYgfMKEengBfCXcJR77N0iNCAgADvfuA=
Date: Sun, 16 Mar 2025 08:57:32 +0000
Message-ID: <DM8PR11MB5655696ED4875E5DFB205E75E0DC2@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20250314-drm-rework-dpcd-access-v4-0-e86ef6fc6d76@oss.qualcomm.com>
 <174199457830.37653.212093362252056402@18a75f3d1eae>
 <l7v3v4nhgpm3qi4f45l5jtkmgwucenxijkiju3juqmw5qdh7j4@xqcemrfzqqgp>
In-Reply-To: <l7v3v4nhgpm3qi4f45l5jtkmgwucenxijkiju3juqmw5qdh7j4@xqcemrfzqqgp>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|DS7PR11MB7952:EE_
x-ms-office365-filtering-correlation-id: 968abbf1-ff0c-4354-cda8-08dd64689706
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WWpxdmEzblBBellwQWtSa3k5OGFXclBEbk0wQ004OTVQUHl4MER5d1Fwekxs?=
 =?utf-8?B?c1B6UjRCRkF3KzlobnVkQVpwZFlOdUhlTm9GOEpxaWlYYitoVVdtN0dSNmxm?=
 =?utf-8?B?a2pqL0lDVzNteldubzJLSDhseXJQU0x0OWp6NVRVVXVnbEVRa29ZcGwvK2Nq?=
 =?utf-8?B?TmMxUFhOVklZUUVaK1dKSGRTYTBwWVZ1MzJlV1RPb3pPVlYyYVF5UTF3d3Qy?=
 =?utf-8?B?THNydmdBY1hNQlpGdkkydkhIYU1RYzYvcklNdUJoRFpmQTdoTHdENGJUd0xp?=
 =?utf-8?B?YzNBS1NxZG5pWVRDbWhQVjlQRExPQ3hWUVpWbDkzR3JkbTZ2N3Jnb3ZyL3VM?=
 =?utf-8?B?R3NXS3hNUnlFT3g4Rk5kRDUranRpUEVjaGFBeldTMHh2bGhqQ0hIR1hjVTR1?=
 =?utf-8?B?QTZteGFhNExxMWJ6M2phZWlTWmVqdUVySC82OTdPTDBIZjh1NHpBNnVpcHVR?=
 =?utf-8?B?dzg5MG1aZWp1cC9TNHZpS3BMU3hlSk9JZkRZU2NXb3dNSU5RV2RVcjU1aGZL?=
 =?utf-8?B?eHg0UG9XampSQm5keDFCbkRZOXh1OWJwQnNMRVFSVWtibjhZMDFUY2dSK05T?=
 =?utf-8?B?eGJGZm92a0w3ZWlZSXdsRjBEZzFFUmh3Y3F3SVdXWFVVcnBHNzkwdHJWdTNT?=
 =?utf-8?B?MWEyMTRKOFhnZTd5Z3YwMTI4VHFuYUk2U0RhLzAxMjVyYzFCdXMva0NBQW02?=
 =?utf-8?B?T0orcXJldXBMUkxkeXV5UVdiQjBQaDJpajEwVSsvMW9WWjJVNkRKSStoLzJy?=
 =?utf-8?B?OU10ZU51TmNDejV0MXR0QnRmRUVwcnYxNnF0dU9JU0gvWWNRTWtoRDBTcndm?=
 =?utf-8?B?R3AzRU5rWnI1SXJaOVVsR0ZLMUY1MzlQSHBuVUZjYWFPN2lIaWt4aS94Zkta?=
 =?utf-8?B?WW91bWJwN20wT1huWTdReHJ6cm9HMjd1c0l4bk5yUExIY3B6elZUN0E4U2xo?=
 =?utf-8?B?WGw1SjhFOWVrZDkzUUExV285eTIvL0ZqT2l0U1VJcXdlMElyd1NMY3dsUlQx?=
 =?utf-8?B?U1FGWWNiK0pqeFJ3Vy9YbkR0UmpyL2FhdWVEelE5WmdWNjd2bmhSbVZQZlIw?=
 =?utf-8?B?T0F5ZGI3RkltczVKdzQ0bDdzSS9XNXZCcW1BTkp0NUdEckNEeGdQVXNBRkRo?=
 =?utf-8?B?OWF0amhmYTNCSUpiTnNOZ3NLd2hXc2phZlJTczQ3ZmxkNzZSbTdrb3hSS2Rx?=
 =?utf-8?B?UlN3VWxBbXdybUVmSmxOWkpMdHhsVWtTZ1E0eXVhTnBGVzg2NFBBVnVPQkNw?=
 =?utf-8?B?YU5UblhsWGdBY3g1c2J4RmV2MXl2Q1pZOU5GbHBnK3lza3htMVZoSGtJdzV2?=
 =?utf-8?B?VktiejFndkIyMC9QdDNQVEpKLzBMcElIeU1tK1YxK2YzMkpYR3NEdGw4VzFr?=
 =?utf-8?B?NWVtc0MrT2JIc3dXT24vNmI2Z2VFcmdNMDRmSWYvenN5UmVMdEs1Mjh3c3F1?=
 =?utf-8?B?NXA3ZVdtaFZtczZHV0lGZlZEQzlxU0tNK0xSM3k0WEs4ejlPQy9JWTJPQWFa?=
 =?utf-8?B?Um56UkozcTUrb3AxbnEvblBhRlFibEZDcWZRYWdtdC9WTVRzV0M5cVNtZHBZ?=
 =?utf-8?B?SWtpaStFVmRSV1Q5RmtHK2ZCUmtxeFhLOG8yOEh0QTU3am02ZGdUZXo3bUdt?=
 =?utf-8?B?T3R1KzFhUlR0ZThpbUpHcnd4S1ZZYW84THE0MkRaY0oyLzZEVDdHUk5pUEtT?=
 =?utf-8?B?Y0x4MC9NSzRkWVZTSHVVNGNsd3kxMnZxZFpaMUUwbVZNajlocGRzNHRMdWJl?=
 =?utf-8?B?a2h5MTNtMW5LMENrY3p2U2EwZjlSMUZubCt4cUhCNkJCY25vZkdzNVYxN0ll?=
 =?utf-8?B?Q1VGTHFueU5lZVlsbDFHWi9vdXlhNVNNMXF5RlJUMXVwcDhBU3ZNMXRDSGha?=
 =?utf-8?B?ci9mY0d6YnJmTXFibHk3V2RsbytpR1FXTGRvNDhqUXNNQ0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmJTcVdzdlZFRkdlWDAweFNBcVdIMlAyc2FXSjkzMEI3ZmF1Q3dYeXU1Tm9M?=
 =?utf-8?B?OFZlYmxGNzZVaEVlcXZkc3BGRDR2SkIwb3R1N01uTFNSdEJ4OUR4N0pwTXJp?=
 =?utf-8?B?KzN5MlF3K2s4UCtOL0c0ZkIybkdIajNNaG84ZEVyem9Tekd3Z2MyLzZvclNk?=
 =?utf-8?B?dDJETUV5enBCVUljK2NqUUpGOFFCeFhEd0tVU0s2WUV4WGtmZjVlN2NxU2M0?=
 =?utf-8?B?Z1NpU0E1cEdXbCt3aDJ5VVJLQzE2SE5idVpKZnYvR3VzUmtnQ0MraDc0QmFt?=
 =?utf-8?B?bzVNczU5d05lSkhDSHp6VjdwaDNSK01hdkRJbFprRVIzdTVYeUF5TzB4UkRu?=
 =?utf-8?B?NzdjMG8yb3RUME1OVVVDUTQ2S3JPWm9RTHlkd01Tb3VhZmQycjZDSmlqWktX?=
 =?utf-8?B?SUlrbWVwTVNtNGdwL0RiYWo0OE83TXk0TDJ5S0diYXQ2TmRCYm4vdG8xMkRN?=
 =?utf-8?B?R2VoTUhwTE1obDE3cndDazdvSnpaTzU2QUNWOHNueHNFZWlvdGVkVml4WnNV?=
 =?utf-8?B?SWZsWjFyNEJST29DZTRRZXJubUhTRDczMXdjd0E5UXdlRVROQzdkcXZQbE4v?=
 =?utf-8?B?Q0NlQU9qYjRGWTRwT2FEeWdibVQwVW1FVnpycTVzOE5keFI0QjNFU1pHamtB?=
 =?utf-8?B?QmVtZndVaWVoM3NPVnM3TTI2Q2NXTWVneWJRQ0cwV3RaZFl4eVVuSWhFTzIx?=
 =?utf-8?B?aDh2ZXAwWmpEK2crUGdOc3BXU1FUSStBNGdEdzJ6Z3dhUUN5YVQ4TklqY05X?=
 =?utf-8?B?alpKcXlDVE05bDB1NndJL1ZIQVhYSHM0cjA3aVlSY2YrTE9qUW5Kd2ZnV3V0?=
 =?utf-8?B?aWVDQVd6N2MxdW9zK2NIeDluWWFabzRYczBXT2ZsUmgwS1BuM3lJVUdmWXNv?=
 =?utf-8?B?WGVSRzNneXRXcFRJVnBnWENLb2RRYk5GUzJPbzJCM3pqNWh5NkxCb2U1bE1M?=
 =?utf-8?B?ZWpOK2hJYmtkSjlxTEdrTWpZZXl2ZXNhdmErKzNYa25hZk9zK2pNaHF6cTRR?=
 =?utf-8?B?WmFPZ1NkR3lWNnFmWU5VS1dMUnhhbWEyVXlNK3Q2ZTRqMXlOSHVBZVRyVDFS?=
 =?utf-8?B?Y3l3V0EwTzlSbkczSmRtc1d3cEorWENCaG5OcWpLNUdQb2JhMHllSFBxQXhQ?=
 =?utf-8?B?ektEejhkcDQ0TnhVMHhEVjdkbXJLVk5Pa0tDSXM1em5DL0hBcmdXMlIzV1g1?=
 =?utf-8?B?QzhOampuRFZ4SkdFOEJGWGllcFNnRlRDWWZKS2F0Q3RZVC8wNU1tRExLOEhM?=
 =?utf-8?B?N0lBQ1AzZVFHOUZSYWFycTU4dlNMZDF0Q0FXbGV0NDUxSVFKVGtJZXBnR2dG?=
 =?utf-8?B?eG9jM2lEZXFNNGJFVk9JMUFzNEcxa3BBUmx6eE41a1Y3NW9ydHRNV1RTNWlZ?=
 =?utf-8?B?N1Jmbm9IdzR3RVBZcVdSaFF4OWZ0KzBXeVhveUs3eVBGaVowR0UyY0tWSWQ4?=
 =?utf-8?B?TlVoWW5SM3lUWEFNSnBoVnhiWUZqUEFCODVhdlYwdGJxUWk4OHhwc0ZMQTZq?=
 =?utf-8?B?MWx5TTNOcHRHOHZoUk1TNFNMd2d2QU1zQlc4WmJUd1orQks2cTZ2Sk9RdTNL?=
 =?utf-8?B?RDBUM3huU3I2ZGd2RjFxSGFhM3RCZTIvdlptTit3WEhSbnVCT1dWRWo1TlhT?=
 =?utf-8?B?RGVsR1NwbHVnQS9YSEVmYWVTQ0lsRkVsWExoVmt6UXAybDQ3OFROMDQ4WENV?=
 =?utf-8?B?T29RenREZjhIcVF6WHZWNmg5dGNEMGZ1MldyREYrZGhFNDVOd1BOdXp4VmdL?=
 =?utf-8?B?b2xFL3Q1MVRnaklWTSttRG15QTd2c2dNNkFPelVOR0NORHhVd3Y3VU5QdzVh?=
 =?utf-8?B?V1FYazBJNG5YaWhua2NCN0tMcEh5bkJEZkhhY2N2enVYZHQrSTZyaHd5Nkd4?=
 =?utf-8?B?bzFUa2EwZk9QSDc4Zkl3bEQ5L3VPeTU4Mjdnb2l0MmoxT1I0Y2trb1Frbk9x?=
 =?utf-8?B?MWh5eHhXWEVlUDVDanJMRm5jLzRmemNvU2J6U0JwVnA1elJTYUMvQjcxTmZP?=
 =?utf-8?B?OXVKQ2FCT0tDc0JHdUFTRUpha1hFT2kxTTNyTDVPTk1tU0dDUVhISDFtUHV0?=
 =?utf-8?B?WjB4L0d1dUdXSXhEZWRSRHFLZmxheGFWUmpiaFVYSjg3L3RZS2JvbktQVExD?=
 =?utf-8?Q?VueExqOcYuIxYTETsncbnDyxf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 968abbf1-ff0c-4354-cda8-08dd64689706
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2025 08:57:32.9416 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uJrRzlfN6lZpGn+cDGI0rvaeztytxu0sIyCkqczO0oLH8Cgzr0/8/qDblQwhmQlmwNr/Vz8JIHpRAT8/32QFyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7952
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

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEludGVsLXhlIDxp
bnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIERtaXRy
eQ0KPiBCYXJ5c2hrb3YNCj4gU2VudDogU2F0dXJkYXksIDE1IE1hcmNoIDIwMjUgMjAuNDANCj4g
VG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRG1pdHJ5IEJhcnlzaGtv
diA8bHVtYWdAa2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IOKclyBYZS5DSS5GdWxsOiBmYWls
dXJlIGZvciBkcm0vZGlzcGxheTogZHA6IGFkZCBuZXcgRFBDRCBhY2Nlc3MNCj4gZnVuY3Rpb25z
IChyZXYyKQ0KPiANCj4gT24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgMTE6MjI6NThQTSArMDAwMCwg
UGF0Y2h3b3JrIHdyb3RlOg0KPiA+ID09IFNlcmllcyBEZXRhaWxzID09DQo+ID4NCj4gPiBTZXJp
ZXM6IGRybS9kaXNwbGF5OiBkcDogYWRkIG5ldyBEUENEIGFjY2VzcyBmdW5jdGlvbnMgKHJldjIp
DQo+ID4gVVJMICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0
NjAwMC8NCj4gPiBTdGF0ZSA6IGZhaWx1cmUNCj4gPg0KPiA+ID09IFN1bW1hcnkgPT0NCj4gPg0K
PiA+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20NCj4gPiB4ZS0yODIyLTgzNDE3YjIzNzkyZDkz
Nzc5NTMyMGE4ODA0ZmQ5N2Q1MGM0YzYyMzNfZnVsbCAtPg0KPiA+IHhlLXB3LTE0NjAwMHYyX2Z1
bGwNCj4gPiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09DQo+ID4NCj4gPiBTdW1tYXJ5DQo+ID4gLS0tLS0tLQ0KPiA+DQo+ID4gICAqKkZBSUxVUkUq
Kg0KPiA+DQo+ID4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCB4ZS1wdy0x
NDYwMDB2Ml9mdWxsIGFic29sdXRlbHkNCj4gbmVlZCB0byBiZQ0KPiA+ICAgdmVyaWZpZWQgbWFu
dWFsbHkuDQo+ID4NCj4gPiAgIElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdlcyBoYXZl
IG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiA+ICAgaW50cm9kdWNlZCBpbiB4ZS1w
dy0xNDYwMDB2Ml9mdWxsLCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktDQo+
IGluZnJhQGxpc3RzLmZyZWVkZXNrdG9wLm9yZykgdG8gYWxsb3cgdGhlbQ0KPiA+ICAgdG8gZG9j
dW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZSBwb3Np
dGl2ZXMgaW4gQ0kuDQo+ID4NCj4gPg0KPiA+DQo+ID4gUGFydGljaXBhdGluZyBob3N0cyAoNCAt
PiA0KQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+DQo+ID4gICBObyBj
aGFuZ2VzIGluIHBhcnRpY2lwYXRpbmcgaG9zdHMNCj4gPg0KPiA+IFBvc3NpYmxlIG5ldyBpc3N1
ZXMNCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAgIEhlcmUgYXJlIHRoZSB1bmtu
b3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQgaW4geGUtcHctDQo+IDE0
NjAwMHYyX2Z1bGw6DQo+ID4NCj4gPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+ID4NCj4gPiAjIyMj
IFBvc3NpYmxlIHJlZ3Jlc3Npb25zICMjIyMNCj4gPg0KPiA+ICAgKiBpZ3RAa21zX2NvbnRlbnRf
cHJvdGVjdGlvbkBsaWMtdHlwZS0wQHBpcGUtYS1kcC0yOg0KPiA+ICAgICAtIHNoYXJkLWJtZzog
ICAgICAgICAgTk9UUlVOIC0+IFtJTkNPTVBMRVRFXVsxXSArMSBvdGhlciB0ZXN0IGluY29tcGxl
dGUNCj4gPiAgICBbMV06DQo+ID4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvaW50
ZWwteGUveGUtcHctMTQ2MDAwdjIvc2hhcmQtYm1nLTQvaQ0KPiA+IGd0QGttc19jb250ZW50X3By
b3RlY3Rpb25AbGljLXR5cGUtMEBwaXBlLWEtZHAtMi5odG1sDQpBdCBsZWFzdCB0aGVzZSBhcmUg
bm90IHNlZW4gbGF0ZWx5IG9uIHRoaXMgdGVzdCBidXQgdGhlcmUgd2FzIGVnIH4zIHdlZWtzIGFn
byBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL3hlL2tlcm5lbC9pc3N1ZXMvMjcx
NSANCj4gDQo+IEknbSByZWFsbHkgbm90IHN1cmUgYWJvdXQgdGhpcyBvbmUuIElzIHRoaXMgYSBy
ZXN1bHQgb2YgdGhlIERQQ0QgY2hhbmdlcz8gKEknbQ0KPiBlc3BlY2lhbGx5IHN1c3BpY2lvdXMg
YWJvdXQgdGhlIHByZXZpb3VzIE5PVFJVTiBzdGF0dXMpLg0KPiANCj4gPg0KPiA+ICAgKiBpZ3RA
a21zX3BsYW5lX3NjYWxpbmdAaW50ZWwtbWF4LXNyYy1zaXplQHBpcGUtYS1kcC0yOg0KPiA+ICAg
ICAtIHNoYXJkLWRnMi1zZXQyOiAgICAgTk9UUlVOIC0+IFtETUVTRy1XQVJOXVsyXQ0KPiA+ICAg
IFsyXToNCj4gPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1w
dy0xNDYwMDB2Mi9zaGFyZC1kZzItNDMyDQo+ID4gL2lndEBrbXNfcGxhbmVfc2NhbGluZ0BpbnRl
bC1tYXgtc3JjLXNpemVAcGlwZS1hLWRwLTIuaHRtbA0KPiANCj4gdmJsYW5rIHRpbWVvdXQgaXMg
cHJvYmFibHkgaXJyZWxldmFudA0KPiANCj4gPg0KPiA+ICAgKiBpZ3RAeGVfZXVkZWJ1Z19vbmxp
bmVAc2V0LWJyZWFrcG9pbnQtc2lnaW50LWRlYnVnZ2VyOg0KPiA+ICAgICAtIHNoYXJkLWJtZzog
ICAgICAgICAgTk9UUlVOIC0+IFtTS0lQXVszXQ0KPiA+ICAgIFszXToNCj4gPiBodHRwczovL2lu
dGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS94ZS1wdy0xNDYwMDB2Mi9zaGFyZC1ibWct
Mi9pDQo+ID4gZ3RAeGVfZXVkZWJ1Z19vbmxpbmVAc2V0LWJyZWFrcG9pbnQtc2lnaW50LWRlYnVn
Z2VyLmh0bWwNCj4gPg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdpc2hlcw0KPiBEbWl0cnkNCg==
