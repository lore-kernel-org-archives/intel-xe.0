Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A766606A319
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 14:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Kc8iLDO9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621DD10E411;
	Thu, 22 Oct 2026 14:56:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6CB91126E0
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792680967; x=1824216967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zcaWHq0tvV0o9Fc3PZzxcmC/N2CyT0JF3kRt7JyIyEo=;
 b=Kc8iLDO9yAO3lbdcWOJyxHS2WN9TEJbgmMbwa4o1D+NVpFkmtP4sHuZV
 5WyUHKOIBYhRJLUm7cPJ4zXAljNVD6hnFf4OXlctfoTRwk573PYB8H7Ey
 F55iWxsJ4UFe0jWvy5m4H3kMKlpiEqziITgiQDYZ9q8drh2svCiFWaJgs
 ZFYQom/utpKOVShrKE2czgydI+KBk2RTzX0GagBT9TReFyx/oXEGeyxEf
 eLUXJzDzqRvEfO4ypbsnlX/O/ea7qWPamU7NlmGaZv9KICIXaAtHeYklb
 t+36YE5IgWHgp/lZFYP9pPNtKJRHcEgz54P38VdgQQleeDtpBmQj7NNCA g==;
X-CSE-ConnectionGUID: rOmYsZ+GTDGLI6g4zi7+VA==
X-CSE-MsgGUID: 0RGU38ygRpuiMsNH+j+aWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1332307"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1332307"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 07:56:07 -0700
X-CSE-ConnectionGUID: qWj/TfZZRCO5whICy2CwBA==
X-CSE-MsgGUID: ng5KYiNUQFWR25jkgN2xEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3739651"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 07:56:06 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 07:56:05 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 07:56:05 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 07:56:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BouFwNonHms5S9PGvkkohbRLdFbnEfZZU4bH9pB7rqGUZubK7SXnXqoQcidEG1gDOiPBUmhASUcUAkZLcl9qR9+9CSr4eUiyu+sjl/+4K90+LttYqmQhTU8jvUgg06DDjo9LxnA1FhLoGNNYeTTzkfjVwtiaVztvJN1aRQE0GKwMjQZCHKxgKQywH/BYLTZXBGFMzWKnc+SfJAuAwWTMhA00I/yDyBAtRQTl/295nhWJjSGg+Go37CRmUgKLxpsfRTto3S12hfUBiTubQ7kyHUFWwaU1/McDVbx+nsZTFJkYQqt4WYJY5pOW2QMsVfpZ+AYsR9u3DJSonDFdhF0kAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcaWHq0tvV0o9Fc3PZzxcmC/N2CyT0JF3kRt7JyIyEo=;
 b=QHxe7x/+fXdND1jPYBRWHFWExiDXLnZp4Ag3lGi0LQlvt+LxjS3OfK7a9uPKeZwt70gtUKKXkRkqtbKRASkpPzE1XRjW+54WlWgRzxpFu7aE3Re0HyJu5NHYml7/hdjcsvYfM8apFeDGLG00q9PEyzGCeFVM5MEzuuOohEPpcClh9TLKdfNDgLyGMk+ZpPrruSTOJNBKATQNCM91YAw14M6C56SFLWjTNcOHQHaU8CWAajoNpWCi0snW67hOAiYto9JXEMxbS+v+BdHDFcIw+ZwwTBC9ZXG+g9Uhwe9+dlsByJfPsLGtsFZkN7HhOWG1NHrzDz9o35+7jf+b0NDoJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Thu, 22 Oct
 2026 14:55:36 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 14:55:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying
 an index
Thread-Topic: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying
 an index
Thread-Index: AQHdYh47VO1TljzQpECaHxB1DvZv87cJgK0AgAASrACAABLb8A==
Date: Thu, 22 Oct 2026 14:55:35 +0000
Message-ID: <DS0PR11MB8718F0872CAD24BA9D567CE681652@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261022120915.138606-5-matthew.auld@intel.com>
 <20261022120915.138606-8-matthew.auld@intel.com>
 <DS0PR11MB871825975B301935CD33606381652@DS0PR11MB8718.namprd11.prod.outlook.com>
 <3afd42cd-d251-4bb3-9925-06078f35306c@intel.com>
In-Reply-To: <3afd42cd-d251-4bb3-9925-06078f35306c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: 9745f1c8-5016-459b-8353-08df304c879c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|23010399003|38070700021|261021121427099003|56012099006|261009223027099003|11063799006|4143699003|22082099003|18002099003|261021123027099003|6133799003|10067099003;
x-microsoft-antispam-message-info: aeBJ4D0QbMJc5bcXy3ukraCrOySQ0IUudAzAPA6vviVwXNCeFihSb6oAWzjqp/KnVxRsDqr+Hj6cg1PdphZJOdh2ucT+/PBDLlt4uChZDwgTqZEQfLqNFEyWzU5zkFxMcwWYBD/zJtZxEKSc2nfr4vEFIJk+ybGM9YdCD1iOjdHYioAWlrLC7jUvY5LuGorEom7EUJg8Zbj49HoZ4y+xrlQ1Mi5dttUvAuI6y+11U2SfiyXckYM1OPn5itCTjwsTk9vHUGL0Hetyy/PxsopP50p3U0q3LP0ZBsUiOoglgZEdGPHNLo+1QsZJkBcrerr03cBAdFOdkHunVKrPkG4ZSi6sB9kXbDjxHDGJF+SI1nk/gyJT8mA5zPDRuCxL1bDeHjeTmcUbxwXOl2Kf6lf4z5x2KW1EGQWAtqNVxIP9c1RSohs9dcHOf5ItQw31w9idizIshrqRpg4bl+v33zSeoMoq6qo6kKeT4I4x6K/HzQBQZqx15KGvBWlYtvuXbqu8owhCcz/JOJiCLacf3hNXAPzVvm1KdlRSGwHLGeildKTbqs/324BAg8KjhlCK7cpbCHJONeao2G4W7Ank8A1Pz+yAbcsC5Yqxd3FhjYlQ7/brtefoL5ci/pMQPzjVHec49LQkGPkDee0pNXN79tDgPCJ8ekBjpbKqLYRfhEDtwb+5isd4Ml+FzWB+KQvyrh344OFEJ0s0pk0tp/vHB3xZOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(23010399003)(38070700021)(261021121427099003)(56012099006)(261009223027099003)(11063799006)(4143699003)(22082099003)(18002099003)(261021123027099003)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUlhbk1CUUE0WnVnamtvS0Rnczd5MTFIbmgvZUtSbmw3NWN1V2s2N1FwSUh5?=
 =?utf-8?B?RGV5TzhoZlBwTzB3T0xGREVXbzhiZDY2Y1pzNWQ3MHpFRlorNzdScEtXOHB4?=
 =?utf-8?B?ODV2NDUyR25qWjE1Z29FT3RmKzJicGtoY2taY3ZqZXZtcWlxRjhMS1o2bXh2?=
 =?utf-8?B?Y2pIUUNYbTA3ZlIzSjY5a3ZRZWxvMENFK1U2ZFU0blFaNHJKbWExYThKVThJ?=
 =?utf-8?B?RzlURlI2RWpzMldOVW1WY2lidzkzR3NJaHVnWThXcTVoV0VjN3JISFV3a0J1?=
 =?utf-8?B?TS9OdCswMVJxV3d2RTlRTGRiWmFYRVdpejFDdXpvckt2dTRSTFFGTDFwZW5J?=
 =?utf-8?B?VE5BYU1pNkdyaWdremc4bXdqZFp3b25lVjBZVzlvYlk2S1RYU2Q2VE1wZmY4?=
 =?utf-8?B?NG0zTUo4TDZuMlpVdEh6ZjU1aVprL1YwWjdlS29VMjU2ZVM2OHF5UkkyZi9S?=
 =?utf-8?B?dkZqcEpxTGJQTlNyWi9KZk45bER2MU5kOHdVWkJ1b29CR1p1V0xYUlVYbUxC?=
 =?utf-8?B?ZVluRExNa1Y1enZBRzVkRE4zWnZNeEVRNEdKK1I5aTZ2Y1I5bmZOZG9La0FR?=
 =?utf-8?B?aWprc1Z1b3FyL09ZRUlLZTBwOE93N2RsOWpoalJHUlVEa3NJT0pTdklFMWdt?=
 =?utf-8?B?ZFVHTnBXanVQc2J0UkovaHdzK0R4Z2pXcnI5QWVBNWZYeTNib3lDaXQ5Rmd0?=
 =?utf-8?B?NXBpSTBMaURkK3RyVElzM2hkZ1l5eDJLdlY2VElpOXRhUHJVS2swRkptN3dS?=
 =?utf-8?B?WTNVQ2dCb0dmc2hqbVhWTkNaclFNbEJLYmNBaWd4bm5QQ0tMaWNLZnVnREwv?=
 =?utf-8?B?MGVJNGV0bXowK2pMWEI4UERXay9OOGl3ckNza2RoaEhsUkNvT25UQ3paMHY3?=
 =?utf-8?B?eEY0WW5VYmZVYmRxNVFUSlFqZ1MwL3MwU1VSZ3VwMWxnNFV6L1ArcWRXbkQv?=
 =?utf-8?B?ckI5SWVwWWYzczdLWHJneXg5NkUyT1N5MUpRRis2U2RsSkxsMGExNG9PSDFs?=
 =?utf-8?B?YkNIVTJIRDRNdzM4K1d3YzhnNFZsSmJDeGl6aUJ3WUxDblpvVDRmdlkxcjVG?=
 =?utf-8?B?dC9oclJNL3JVSGdqdjl0cHVnV2poS2JoUDhnd3dhT0lCV1hXbFMwbVgvYmQz?=
 =?utf-8?B?SS9DTk9DQzZNTEFhWHFzMmlUQWQ3RHlLNVJuam9SeWxwZU55M3hLUTgvejNs?=
 =?utf-8?B?V0cyZEZEWUZpT1NkTEF3ZlZWTUxvNks2a0pldEN0Nm5VN3RCRlFvaDJGeHRh?=
 =?utf-8?B?TFBvRyttS2dIVVZkMXhCeUh4anBtT05TVXh0eTRScXlmeEEycDB6Zk1Ib0pJ?=
 =?utf-8?B?OFpneVVFVU1GVnp0TEIyaHRJeGFwdWN3VHdvcDBBcStJNWN5Yk9pUEVVdml6?=
 =?utf-8?B?L2lSNVBzSzF5NkJ1RHJwaHZRRzF5S21qK3ErdkxxR2lJWkVlejJQUmJsM3Mv?=
 =?utf-8?B?RnZWSElzd2wwMHdNTjB5QWpKeFJhZkNRWmVNbUw4RkVMaG1Za1k1a0gvbFdB?=
 =?utf-8?B?NHBHTWpLTnpKMkdrR3g5ZHVzSW1GNmtDQVBuVUpmOERBY0hXOVBWNWJoVDdh?=
 =?utf-8?B?MGp5Skw5K0gzcVdHWnhxdStTR0xLaDFpeWpIUjdSVUh6ZVhqNnNJVE1HSUsy?=
 =?utf-8?B?NHA1WUh3RjFON2dpdFN2NDhSVTloejRjbUNBbVZvZmh5RGN5aVQ5elJrbkhQ?=
 =?utf-8?B?d01oN3Y1aFBvM3VlN01QUFVXRERVeTJoZHBFazVZSXplK3VJN2U5YTI5b2Ns?=
 =?utf-8?B?Rmc4UXk3aEI3R0NKUEpVMzg0b2Rheks2bS9rOUptdVpGMnlHaVExMjBubWQw?=
 =?utf-8?B?NjUxSitlZ3pCZ1dpUUNXTEEzVitTVTZJbTlaTFJOWG5uOU0xVFgwall1anRV?=
 =?utf-8?B?WkdYNEdFMklYWnRvTVJ6RlB6cTJPRVQ3T1ptMkdPSE9scUExSVE1MzdweHQ3?=
 =?utf-8?B?U2hsK011UWlNdUp1UWdjS0svR1BvZlN6NElpZWRZQ3lBTXVaTWhMNDREazJy?=
 =?utf-8?B?WDFERFNyNnVKSStKQjFyb3J2T0VLRHhGd0Y0Mm5nK2dpY0Zxd0JoU2VRTFpj?=
 =?utf-8?B?RFIyVXNLQUZBYktwanpDMXFWRVQyOFdyaFBMMnFKa0JrWm9aM0M1MUlRVXBW?=
 =?utf-8?B?bHhvbnlsZVQra1BRaXQxTzhwUjVCbTlINjk0b2U4SWZGcmkzam9DU2o5SDNt?=
 =?utf-8?B?bHYvenIvQlA0b2cxQkhIWUFLUmtUMWY3ekNKSkx1bU1JQVJQUVNZcGF3Y3Ex?=
 =?utf-8?B?SU4wVCtkSUlySnJYQ1AwSFZFQ3hVTWhYMjZDclVadEU1L3F6RHV2SitLRXB1?=
 =?utf-8?B?NTNNeWZlZGozQ3ovRHBLaUxhN0V6dE9xZU0weU13QVZHWjJLTXBEQThGcHZM?=
 =?utf-8?Q?+qjatils/2haDYEVeWHUoXdAQC4fA6ixN8TCWhgdMqFnF?=
x-ms-exchange-antispam-messagedata-1: z4SjmxLmBHh5dw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SN4p/tpyvH45Ke8ixgvk8OcjYEHdiAdfEmQMlnmhOXSBc1pAlZN2FJtSzMSPrQ9HjaQM+4jX8ausNB6QesCrB2BS8ma51edyWfoL3+L3idnURlxLMkColYoa2gTbG/7lF9dbTM//iee1hGixELw18fXgYsXvtG5yLhBHZVPezBYy6V93JkDYJEpuNXw8r6RocDmHNV00KASIiF+J5Wk2nqHTQ4p/qvuOBZnrdV523Iq6iq8A1XDGHU0dEC3U47Q3rbDmlZNc5Xzx5KYPqFi3NuVB++5F3haNIwcLhcez8V/+BLgowTHR+sGYzVC4fJZuU1a3D65/MlH0gWakmti92Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9745f1c8-5016-459b-8353-08df304c879c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 14:55:36.0162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdKOLLvBvW065tcx4Ikvv0E9gx9Vd6MtWLBmLZoFOxruHiU77t+SjCvp0HuCI/QgBPZYD/V4mPlu/9ghF70Y8k2xL8J5RaEuNW+KiEVhHio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogMjIgT2N0b2JlciAyMDI2IDE5OjE3DQo+
IFRvOiBVcGFkaHlheSwgVGVqYXMgPHRlamFzLnVwYWRoeWF5QGludGVsLmNvbT47IGludGVsLQ0K
PiB4ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFRlcmVzIEFsZXhpcywgQWxhbiBQcmV2
aW4gPGFsYW4ucHJldmluLnRlcmVzLmFsZXhpc0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMy8zXSBkcm0veGUvcGF0OiBhbHdheXMgY2hlY2sgaXNfdmFsaWQoKSB3aGVuDQo+
IHF1ZXJ5aW5nIGFuIGluZGV4DQo+IA0KPiBPbiAyMi8xMC8yMDI2IDEzOjQxLCBVcGFkaHlheSwg
VGVqYXMgd3JvdGU6DQo+ID4NCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBBdWxkLCBNYXR0aGV3IDxtYXR0aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+PiBT
ZW50OiAyMiBPY3RvYmVyIDIwMjYgMTc6MzkNCj4gPj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiA+PiBDYzogVGVyZXMgQWxleGlzLCBBbGFuIFByZXZpbiA8YWxhbi5wcmV2
aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT47DQo+ID4+IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMu
dXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjMgMy8zXSBkcm0veGUv
cGF0OiBhbHdheXMgY2hlY2sgaXNfdmFsaWQoKSB3aGVuDQo+ID4+IHF1ZXJ5aW5nIGFuIGluZGV4
DQo+ID4+DQo+ID4+IE1ha2UgdGhlIGJldmF2aW91ciBjb25zaXN0ZW50LiBJZiB0cnlpbmcgdG8g
ZXh0cmFjdCBjb21wIG9yIGwzIG9uIGFuDQo+ID4+IHVua25vd24gaW5kZXgsIGp1c3QgdHJlYXQg
YXMgYSBwcm9ncmFtbWVyIGVycm9yLCBsaWtlIHdlIGFscmVhZHkgZG8NCj4gPj4gZm9yIGNvaF9t
b2RlIChpbXBsaWNpdCkuDQo+ID4+DQo+ID4+IHYyIChUZWphcyk6DQo+ID4+ICAgIC0gTWFrZSBp
c192YWxpZCgpIHJldHVybiBmYWxzZSBmb3IgYW4gaW5kZXggd2hpY2ggaXMgb3V0IG9mIHJhbmdl
LCB0bw0KPiA+PiAgICAgIGF2b2lkIG11bHRpcGxlIFdBUk5zLg0KPiA+Pg0KPiA+PiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+ID4+IENjOiBB
bGFuIFByZXZpbiA8YWxhbi5wcmV2aW4udGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gPj4gQ2M6
IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+
PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXQuYyB8IDEwICsrKysrKy0tLS0NCj4gPj4gZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oDQo+ID4+IHwgIDYgKysrKy0tDQo+ID4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jDQo+ID4+IGIvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3BhdC5jIGluZGV4DQo+ID4+IGQyMzk2OTNiODAzYi4uNTNjNWY0MDMwYmY4
IDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGF0LmMNCj4gPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5jDQo+ID4+IEBAIC0yOTcsMTMgKzI5NywxNSBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3BhdF90YWJsZV9lbnRyeQ0KPiA+PiB4ZTNwX2xwZ19w
YXRfdGFibGVbXSA9IHsNCj4gPj4NCj4gPj4gICBib29sIHhlX3BhdF9pbmRleF9pc192YWxpZChz
dHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTE2IHBhdF9pbmRleCkgIHsNCj4gPj4gLQlXQVJOX09OKHBh
dF9pbmRleCA+PSB4ZS0+cGF0Lm5fZW50cmllcyk7DQo+ID4+ICsJaWYgKFdBUk5fT04ocGF0X2lu
ZGV4ID49IHhlLT5wYXQubl9lbnRyaWVzKSkNCj4gPj4gKwkJcmV0dXJuIGZhbHNlOw0KPiA+PiAr
DQo+ID4+ICAgCXJldHVybiB4ZS0+cGF0LnRhYmxlW3BhdF9pbmRleF0udmFsaWQ7ICB9DQo+ID4+
DQo+ID4+ICAgdTE2IHhlX3BhdF9pbmRleF9nZXRfY29oX21vZGUoc3RydWN0IHhlX2RldmljZSAq
eGUsIHUxNiBwYXRfaW5kZXgpICB7DQo+ID4+IC0JV0FSTl9PTihwYXRfaW5kZXggPj0geGUtPnBh
dC5uX2VudHJpZXMpOw0KPiA+PiArCVdBUk5fT04oIXhlX3BhdF9pbmRleF9pc192YWxpZCh4ZSwg
cGF0X2luZGV4KSk7DQo+ID4NCj4gPiBXaXRoIHRoYXQgd2UgbmVlZCBzb21ldGhpbmcgbGlrZSBi
ZWxvdyByaWdodCBvciBlbHNlIHN0aWxsIHdlIHdpbGwgaGF2ZSAyDQo+IHdhcm5zIGZvciBzYW1l
IGNoZWNrLCBsZXQgbWUga25vdyB5b3VyIHZpZXcgOg0KPiANCj4gSSdtIG5vdCByZWFsbHkgZmFu
IHRiaC4gSXQncyBhIGJhc2ljYWxseSBqdXN0IGEgQlVHX09OKCkgbGV2ZWwgZXZlbnQgaWYgd2Ug
Z2V0IGhlcmUNCj4gYW5kIG5vdCBzb21ldGhpbmcgd2Ugc2hvdWxkIHNlZSBpbiBwcm9kdWN0aW9u
LiBUcnlpbmcgdG8gdGhlbiBhZGQgZmFsbGJhY2tzDQo+IG1pZ2h0IG5vdCBiZSBoZWxwaW5nIG11
Y2ggKGFsc28gbm8gdGVzdCBjb3ZlcmFnZSkuDQoNCk9rYXkgdXAgdG8geW91LCBhbnl3YXlzIExH
VE06DQpSZXZpZXdlZC1ieTogVGVqYXMgVXBhZGh5YXkgPHRlamFzLnVwYWRoeWF5QGludGVsLmNv
bT4NCg0KVGVqYXMNCj4gDQo+ID4gdTE2IHhlX3BhdF9pbmRleF9nZXRfY29oX21vZGUoc3RydWN0
IHhlX2RldmljZSAqeGUsIHUxNiBwYXRfaW5kZXgpIHsNCj4gPiAgICAgIGlmICgheGVfcGF0X2lu
ZGV4X2lzX3ZhbGlkKHhlLCBwYXRfaW5kZXgpKQ0KPiA+ICAgICAgICAgIHJldHVybiBYRV9DT0hf
Tk9ORTsNCj4gPg0KPiA+ICAgICAgV0FSTl9PTigheGUtPnBhdC50YWJsZVtwYXRfaW5kZXhdLmNv
aF9tb2RlIHx8DQo+ID4gICAgICAgICAgeGUtPnBhdC50YWJsZVtwYXRfaW5kZXhdLmNvaF9tb2Rl
ID4gWEVfQ09IXzJXQVkpOw0KPiA+ICAgICAgcmV0dXJuIHhlLT5wYXQudGFibGVbcGF0X2luZGV4
XS5jb2hfbW9kZTsNCj4gPiB9DQo+ID4NCj4gPiBib29sIHhlX3BhdF9pbmRleF9nZXRfY29tcF9l
bihzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTE2IHBhdF9pbmRleCkgew0KPiA+ICAgICAgaWYgKCF4
ZV9wYXRfaW5kZXhfaXNfdmFsaWQoeGUsIHBhdF9pbmRleCkpDQo+ID4gICAgICAgICAgcmV0dXJu
IGZhbHNlOw0KPiA+DQo+ID4gICAgICByZXR1cm4gISEoeGUtPnBhdC50YWJsZVtwYXRfaW5kZXhd
LnZhbHVlICYgWEUyX0NPTVBfRU4pOyB9DQo+ID4NCj4gPiB1MTYgeGVfcGF0X2luZGV4X2dldF9s
M19wb2xpY3koc3RydWN0IHhlX2RldmljZSAqeGUsIHUxNiBwYXRfaW5kZXgpIHsNCj4gPiAgICAg
IGlmICgheGVfcGF0X2luZGV4X2lzX3ZhbGlkKHhlLCBwYXRfaW5kZXgpKQ0KPiA+ICAgICAgICAg
IHJldHVybiBYRV9MM19QT0xJQ1lfVUM7DQo+ID4NCj4gPiAgICAgIHJldHVybiBSRUdfRklFTERf
R0VUKFhFMl9MM19QT0xJQ1ksDQo+ID4geGUtPnBhdC50YWJsZVtwYXRfaW5kZXhdLnZhbHVlKTsg
fQ0KPiA+DQo+ID4gVGVqYXMNCj4gPj4gICAJV0FSTl9PTigheGUtPnBhdC50YWJsZVtwYXRfaW5k
ZXhdLmNvaF9tb2RlIHx8DQo+ID4+ICAgCQl4ZS0+cGF0LnRhYmxlW3BhdF9pbmRleF0uY29oX21v
ZGUgPiBYRV9DT0hfMldBWSk7DQo+ID4+ICAgCXJldHVybiB4ZS0+cGF0LnRhYmxlW3BhdF9pbmRl
eF0uY29oX21vZGU7DQo+ID4+IEBAIC0zMTEsMTMgKzMxMywxMyBAQCB1MTYgeGVfcGF0X2luZGV4
X2dldF9jb2hfbW9kZShzdHJ1Y3QNCj4geGVfZGV2aWNlDQo+ID4+ICp4ZSwgdTE2IHBhdF9pbmRl
eCkNCj4gPj4NCj4gPj4gICBib29sIHhlX3BhdF9pbmRleF9nZXRfY29tcF9lbihzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSwgdTE2IHBhdF9pbmRleCkgIHsNCj4gPj4gLQlXQVJOX09OKHBhdF9pbmRleCA+
PSB4ZS0+cGF0Lm5fZW50cmllcyk7DQo+ID4+ICsJV0FSTl9PTigheGVfcGF0X2luZGV4X2lzX3Zh
bGlkKHhlLCBwYXRfaW5kZXgpKTsNCj4gPj4gICAJcmV0dXJuICEhKHhlLT5wYXQudGFibGVbcGF0
X2luZGV4XS52YWx1ZSAmIFhFMl9DT01QX0VOKTsgIH0NCj4gPj4NCj4gPj4gICB1MTYgeGVfcGF0
X2luZGV4X2dldF9sM19wb2xpY3koc3RydWN0IHhlX2RldmljZSAqeGUsIHUxNiBwYXRfaW5kZXgp
ICB7DQo+ID4+IC0JV0FSTl9PTihwYXRfaW5kZXggPj0geGUtPnBhdC5uX2VudHJpZXMpOw0KPiA+
PiArCVdBUk5fT04oIXhlX3BhdF9pbmRleF9pc192YWxpZCh4ZSwgcGF0X2luZGV4KSk7DQo+ID4+
DQo+ID4+ICAgCXJldHVybiBSRUdfRklFTERfR0VUKFhFMl9MM19QT0xJQ1ksIHhlLQ0KPiA+Pj4g
cGF0LnRhYmxlW3BhdF9pbmRleF0udmFsdWUpOyAgfSBkaWZmIC0tZ2l0DQo+ID4+PiBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9wYXQuaA0KPiA+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wYXQu
aCBpbmRleCBmNmIwZmFjMjAwMGEuLjE2YmVkYTZkYjk3ZQ0KPiAxMDA2NDQNCj4gPj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BhdC5oDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9wYXQuaA0KPiA+PiBAQCAtNTcsNyArNTcsOCBAQCBpbnQgeGVfcGF0X2R1bXAoc3RydWN0
IHhlX2d0ICpndCwgc3RydWN0DQo+ID4+IGRybV9wcmludGVyICpwKTsgIGludCB4ZV9wYXRfZHVt
cF9zd19jb25maWcoc3RydWN0IHhlX2d0ICpndCwgc3RydWN0DQo+ID4+IGRybV9wcmludGVyICpw
KTsNCj4gPj4NCj4gPj4gICAvKioNCj4gPj4gLSAqIHhlX3BhdF9pbmRleF9pc192YWxpZCAtIENo
ZWNrIHdoZXRoZXIgdGhlIGdpdmVuIHBhdF9pbmRleCBpcyB2YWxpZC4NCj4gPj4gKyAqIHhlX3Bh
dF9pbmRleF9pc192YWxpZCAtIENoZWNrIHdoZXRoZXIgdGhlIGdpdmVuIHBhdF9pbmRleCBpcyB2
YWxpZC4NCj4gPj4gKyBJbmRleA0KPiA+PiArICogbXVzdCBiZSB3aXRoaW4gdmFsaWQgcmFuZ2Uu
DQo+ID4+ICAgICogQHhlOiB4ZSBkZXZpY2UNCj4gPj4gICAgKiBAcGF0X2luZGV4OiBUaGUgcGF0
X2luZGV4IHRvIHF1ZXJ5DQo+ID4+ICAgICoNCj4gPj4gQEAgLTc1LDcgKzc2LDcgQEAgdTE2IHhl
X3BhdF9pbmRleF9nZXRfY29oX21vZGUoc3RydWN0IHhlX2RldmljZQ0KPiAqeGUsDQo+ID4+IHUx
NiBwYXRfaW5kZXgpOw0KPiA+Pg0KPiA+PiAgIC8qKg0KPiA+PiAgICAqIHhlX3BhdF9pbmRleF9n
ZXRfY29tcF9lbiAtIEV4dHJhY3QgdGhlIGNvbXByZXNzaW9uIGVuYWJsZSBmbGFnDQo+ID4+IGZv
cg0KPiA+PiAtICogdGhlIGdpdmVuIHBhdF9pbmRleC4NCj4gPj4gKyAqIHRoZSBnaXZlbiBwYXRf
aW5kZXguIEluZGV4IG11c3QgYmUgdmFsaWQgZm9yIHRoZSBody4NCj4gPj4gICAgKiBAeGU6IHhl
IGRldmljZQ0KPiA+PiAgICAqIEBwYXRfaW5kZXg6IFRoZSBwYXRfaW5kZXggdG8gcXVlcnkNCj4g
Pj4gICAgKg0KPiA+PiBAQCAtODgsNiArODksNyBAQCBib29sIHhlX3BhdF9pbmRleF9nZXRfY29t
cF9lbihzdHJ1Y3QgeGVfZGV2aWNlDQo+ICp4ZSwNCj4gPj4gdTE2IHBhdF9pbmRleCk7DQo+ID4+
ICAgI2RlZmluZSBYRV9MM19QT0xJQ1lfVUMJCTMgLyogVW5jYWNoZWQgKi8NCj4gPj4gICAvKioN
Cj4gPj4gICAgKiB4ZV9wYXRfaW5kZXhfZ2V0X2wzX3BvbGljeSAtIEV4dHJhY3QgdGhlIEwzIHBv
bGljeSBmb3IgdGhlIGdpdmVuDQo+IHBhdF9pbmRleC4NCj4gPj4gKyAqIEluZGV4IG11c3QgYmUg
dmFsaWQgZm9yIHRoZSBody4NCj4gPj4gICAgKiBAeGU6IHhlIGRldmljZQ0KPiA+PiAgICAqIEBw
YXRfaW5kZXg6IFRoZSBwYXRfaW5kZXggdG8gcXVlcnkNCj4gPj4gICAgKi8NCj4gPj4gLS0NCj4g
Pj4gMi41Ni4wDQo+ID4NCg0K
