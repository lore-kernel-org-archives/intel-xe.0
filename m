Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BE0C04FF8
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 05:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125CF10F1C3;
	Fri, 12 Apr 2024 05:06:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YgI5Kblc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BB610F1C3
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 05:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712898408; x=1744434408;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Aop2Nrxs1+HbRozZRb10dIVzXoRP8javP0zSYbho+28=;
 b=YgI5Kblc1Qculzvry3HLIMcqfu39rEmQSvIbqqYg7Lrsh88y0woaTW4A
 i3C5BsotdArTkoONs+y6ksO3aDwjpUAUcWQCWidtixBiaoSG+gSw4N3hI
 OwjQWEFhDMa20TaV0HhTV9UkMBVIBhzgh5gNRN4Ik5859g8cY8/N3Y9B9
 rA/9nQErUj/8hxpRhH0clSCwitmJE3VqNukdNnbEyLymqW9kr2e/4yCG2
 nbrfhk3YPEaQqLjgpTLaecBo9UoYUez3T6O3kVdbAg4TLHOoI5CqxaC7e
 d3O9OkqIFFDmHcsHYe5eHNjPmte6YL7JI+/odWHiSkAXPO+aM5lncr8/M w==;
X-CSE-ConnectionGUID: 3ZcrB6JrQlasIeiXNBuegw==
X-CSE-MsgGUID: cr66u4X4Tfm+IQ2JMhOMDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19053322"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="19053322"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 22:06:47 -0700
X-CSE-ConnectionGUID: Z8SEhfqpSVG+/0iNLpkxLw==
X-CSE-MsgGUID: obHlmfFfQB+ruYhS6k1qew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="52291719"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 22:06:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 22:06:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 22:06:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 22:06:45 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 22:06:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IduQuVHmmH3jEpfqtDIqYpfwwklPb16yT95NxwoWus1JD9FO/3Fxvg5f3N5XY0LR+hKLRX2lG+ccHUbD63FbT7fyeiqv8KUczysVbbf2bDNFHn64McLjNTXZfTXf7/1Af41n2CpoHTj/rjgaD31dxtjnXY0KHNgrAT33Uv+O3cSSc1oNhWsXI73UUwd/ijacGmkkXzB7sVfHLDWhnGWkbRdc4eC56OhCmtTYv9DXn7NFnAmccZq7aQwes39jLStaaLFHegQAuPUXeSkRNVePZCzYgonWHoIMEQFwMXSP5TwG3TO/CEk7aojmootOj82RqWgyLCtoWnhtlQoHJJxqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aop2Nrxs1+HbRozZRb10dIVzXoRP8javP0zSYbho+28=;
 b=lb5rL9IY9LYU3LSIy+74cU4FPLLToQylrGc/q1g2cp+y+CATxqjShC4Doqe5Q/7RaRQAtAlml/u/6nyyfOVNpLsvGFX+hmilX87ZqZaGJUCZpFolF4BdR8wgkU8tY1omoH91KVwAzYpl1BXhECswhp53C/FgPPQ54UTuc/iP1wUxDLRI4thUjwXKzWAYyegx+PH7BNRnYRE1/A8HDbB9ZDLGCS2P54tJTwW2G0nvJD9J1HY1SXRyS1ACFpXVheP84s4FPIMEgzITqxjptGOcSUARBHZZeNACT7YRgoaGKR0xk/MNnPgpbXD8Ns1j+AlwUBqC/v6QzqWZMqn+6CzRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.25; Fri, 12 Apr
 2024 05:06:43 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 05:06:43 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, Nirmoy Das <nirmoy.das@linux.intel.com>, 
 "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Landwerlin, Lionel G" <lionel.g.landwerlin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 Thomas Hellstr_m <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH 0/3] Enable device atomics with a VM bind flag
Thread-Topic: [PATCH 0/3] Enable device atomics with a VM bind flag
Thread-Index: AQHai2rysVT6RIt6ykuMugkQXqRu97FjQfMAgAAK2ACAAAZeAIAAwzwg
Date: Fri, 12 Apr 2024 05:06:42 +0000
Message-ID: <BN9PR11MB5275E250857EE351ED2F5E80E7042@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240410170308.409-1-nirmoy.das@intel.com>
 <SA1PR11MB69919E24A17807B65DB2EA2692052@SA1PR11MB6991.namprd11.prod.outlook.com>
 <545742c9-5f62-46de-a69b-944bc5e6f510@linux.intel.com>
 <SA1PR11MB69917ECA86502D241F8B69BB92052@SA1PR11MB6991.namprd11.prod.outlook.com>
In-Reply-To: <SA1PR11MB69917ECA86502D241F8B69BB92052@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|CO1PR11MB4977:EE_
x-ms-office365-filtering-correlation-id: 47778952-cc14-4a55-da30-08dc5aae582b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n5XaZAKnEy5Fpaz/TKYHenU4enJncghINWMLLZPAPuj3FyHYQB/cyD0YeDbVJK8FrGvWW8Co47ACgKcOQu5KI0xbyM5qZ+v0AO/8rd3Y6h17fcyXUnUB54D70gPl0uw1jIDC0zYxlC/g/sIBLJ5/+GsxeZ+L9AKZ8Lh8DGC0gBYv01lvv8hvopNvf6ITaz173CDtLAHEGSPfd7vY5Om+PMD3fymkXNT2LdGrdqC2PGPmWbe0eWHsT9ossP9k79RIkK58v9Gjj+Dc4ZW2OqJ+JLYHFXD0rStvifIL5iUa+OV69h0rm/wzk4XspX2JPYqvcF3yBpvUdWHV+KTqDpkqsL+Y3hJHU/aoxF1fsTHgSXIMGnfbu70TNoGOGVqbrnrBlxUo+YtmWf0/UcniaWi+hcDQbu6hPUrqK/De6QgJ2HjTR6ycPVpEFa5RNv0QmcgFtaLk+47384cL4/e6BxO7G9Z1sWsG0F1Sp307Bxj1xyUQwO8tRc1jyUYUKeu65MZrRpHiPck3EtlT66KL9jR3ZVlJaksnPKMo0iVGmRs3W9NvP2alsVqYvfBqgtnDX3FNis0c6ROV3ZUqpJbevmLQCVt8RehOZP83djjmjuwLvCt2bw4BafwqucUVE7c6mm+ndlFCyP1jgK4A9HN3Dqhu6/7EF3B9zEaTMLt8RtA0py4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S01XRzRydWtESitKL1dYY0JlSHdpKzZKNDJ3NTVHQkhlY3g5bDNkLzV5Zmoy?=
 =?utf-8?B?VU9aWTg0L1lNY2hRV2llV1FsQXl0WlhmRWVNZzV2dVd1YTZiVEptckZab3M0?=
 =?utf-8?B?bDR3WE1ZdFFuRi8vWndmYVh3R2RabDZwVHlsMGVhL25pYXpweXRuU2F2b0FW?=
 =?utf-8?B?eklhU3R0WEZlSWRocWdhMFgrQVNaaUZuYnk0aTRVUGVtcGFqNFBwTk9kTE1L?=
 =?utf-8?B?YlZ6ZWE2T1BsTk5wb3l1RnkzOWtmN2xISGV4enF0RWJvaEo5VGFIems5WTdY?=
 =?utf-8?B?UHhrNytuNTlMRTlEVzdlZE04eTJCa0djVlFpUDk5b2lsNll2YzNsS3NBZm5Z?=
 =?utf-8?B?T3JMTFkvaXo4UDZKZXRESE5kOCtCRHNRSlBKVWQrZkp1Z0tCRE1PQkNIcGV6?=
 =?utf-8?B?cWRmSlRwd3B5UnZIaU9mbGhsMDg5dHBwVTFnN1pRT3hkcWI5MENwcml0NEtm?=
 =?utf-8?B?TGdWWWVOalhGOTBSTlNRUzZ6c0JybGFkMUZONnMrdGlOd2k1bTFyeGRKbzVz?=
 =?utf-8?B?aEl0dVBtamxJd1BDamI1TU44RGhTOEU5YmpHVEdVNDVJbXlPcjZBNnNWcTcy?=
 =?utf-8?B?ZUJ6ZnhyV2dUTElyM3dTZGRkYkwwRWhDNTZJakhXNUk4Q0NZZnhmM01JM0R6?=
 =?utf-8?B?a2E5QStxV3czK2tYcGxCczZ2TEwwc0thV01UekhRbmUzVUhvOVlYdG5DbER5?=
 =?utf-8?B?cUtIeWtmSEUxNWUxcmtLUVgrWWJJQXpqdVNWV2p3czdWaE1TM01QcEY5cnI4?=
 =?utf-8?B?VDlHTjdvd3djZzd0bStPdDNVR3d1NVA1ZjRwdjlnVlV0ZUNPZm5OWi91Z2xy?=
 =?utf-8?B?TlM3bWp0Q3ZqbWx3OFNoUGFJbkNhUnhFWUxWNWVZRVpFSlpicXJwbnY5SWxJ?=
 =?utf-8?B?Q2g5SWQ5Snl6aW9DcVVhY0tBbkhFNVY4cFBkU0F2cmN5b1I3NmZPOEJhZlFq?=
 =?utf-8?B?QjRhbmV1dzBxbm8zcDRvQW95Y0tYQ3ZBSkl2VHpNTFRhRVdqSFhUT2FZS1lJ?=
 =?utf-8?B?ci93YU1Bb0pNQTliWC9VNEw3MWNkU0hBZEFBTGI0NUhMSk80ckxpam45TXR0?=
 =?utf-8?B?Z1AyUFNKd2tIQ0U2eThBbnlqVkMxMk1vU2E2dmEwaVUzVzU4ckdDZnVGcW5k?=
 =?utf-8?B?a0wwdTdhNndPd3NHOXlXZjNFT1h0KzZkYnhuZTZyQnVXZ2F2N3loQThVNVJ1?=
 =?utf-8?B?NmMvRG1vU1JGeTdwNEZOMUFVVWRuZDRXVUNrc1ZBMVBXZTdHNy9mWXg5cElK?=
 =?utf-8?B?Mkh0Rm9jNDdyOGVpZWQxRTRPNlVQOGI0N09vM0ZOcmZoQ3NQVkNhN0dSOFhO?=
 =?utf-8?B?N0JwU096c2ZGWmZRZTkzNktzYkxLTFYrd3dNTWs5ck1hMnIwaG1ZYU90emUv?=
 =?utf-8?B?aHZyU1dmZyt1NXl6RFdyajhHRU45dnFUMlJJajNEblhVUXYvSkNLYmczTFZB?=
 =?utf-8?B?SlcwWDl5V1g3Z21mSHd5TzhiSEpnalpOdWU2T3QzVUpMUXZldTBTUnBUOElR?=
 =?utf-8?B?cEZXbHkxdGhPTmtzSzBqT2FFTHFUNnI5ZTlCUXJuZ0k3VkhrK3R3WE5aekx1?=
 =?utf-8?B?dmY3c1czR2lEMFdUQXRnYTh6U0hKY2tEYXFhcytJYlV4T2xXWWJBQ2djMllV?=
 =?utf-8?B?UU1rdFU5VzlFRnNrNDBtVnhIQVZ6Z0Y5eFdXSnF6ZmFpWnp6eUJ3bkd5OHlG?=
 =?utf-8?B?L2J1K3g0aEFwU3p3ZEx1TE5FVXhuRFpQWEprSlpJTCtaTUI5c2Z4eG4zUDdl?=
 =?utf-8?B?RTRCMHZZS2J0Q1hZUFdqUzVkZ2o3U1Q4eWxqakM2WnRHTDRhK3ZXRHRwQVMz?=
 =?utf-8?B?RlE2aGRPNFNrR0NxRzZ2cjRpUElLT292QndZYlRTWThaMHgvNlltbWFhRllp?=
 =?utf-8?B?SjNJeXh0TUl5WkF2UXY2Sjk0ZkFXL25MbnpMbDRSM0V0ekc2eXNrQnlwbUor?=
 =?utf-8?B?VlphdWRwMnZZd0pxUEFNK3U2NGF1S21tS0NxdktaWGZIQklLM2hkYkJyS083?=
 =?utf-8?B?d3VDWlZ1Zy9xVk9KcTVER1pSaDgzUkVVS3FWT0hNYnVMWW93TThtQ3d1SVRB?=
 =?utf-8?B?V3RWVTdNQWNkWklhMWpWd29EM2txdkdHMTJEak5SOFVYaTN5WHZxQnIvMGZw?=
 =?utf-8?Q?7bLWZsV7AF40D16738vfnzrBm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47778952-cc14-4a55-da30-08dc5aae582b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 05:06:42.9368 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DV1suIpp0RQSVZKc5X3aI92GycWRT0MQMgse/h+LPL+681PBqxnxEgWykh3YSlMhW2T/JdRb9wSkN/IkD7FySg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4977
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

Ig0KSSB0aGluayB0aGUgdUFQSSBmb3JtYXQgZGVwZW5kcyBvbiB0aGUgZGVmYXVsdCBiZWhhdmlv
cjoNCglJZiBkZWZhdWx0IGlzIHN5c3RlbS13aWRlIGF0b21pYywgdGhlbiB1QVBJIHNob3VsZCBi
ZSBOT19TWVNURU1fQVRPTUlDLCBOT19ERVZJQ0VfQVRPTUlDLi4uDQoJSWYgZGVmYXVsdCBpcyBu
byBhdG9taWMsIHRoZW4gdUFQSSBzaG91bGQgYmUgU0VUX0RFVklDRV9BVE9NSUMsIFNFVF9TWVNU
RU1fQVRPTUlDLi4uDQoNCkBNcm96ZWssIE1pY2hhbCBjYW4geW91IGNvbW1lbnQ/DQoiDQoNClRo
ZXJlIGFyZSBmb2xsb3dpbmcgdXNlIGNhc2VzIGluIENvbXB1dGUgDQoNCjEuIERldmljZSBVU00g
DQpMTUVNIG9ubHkgcmVnaW9uDQpEZXZpY2UgQXRvbWljcyBvbmx5DQpBdG9taWNzIHBvc3NpYmxl
IG9ubHkgZnJvbSBHUFUNCg0KMi4gSG9zdCBVU00NCg0KU01FTSBvbmx5IHJlZ2lvbg0KRGV2aWNl
IEF0b21pY3Mgb25seQ0KQXRvbWljcyBwb3NzaWJsZSBmcm9tIENQVSBhbmQgR1BVLg0KQ29uY3Vy
cmVudCBhdG9taWNzIGZyb20gQ1BVIGFuZCBHUFUgbm90IGFsbG93ZWQuDQoNCjMuIFNoYXJlZCBV
U00gd2l0aCBLTUQgbWlncmF0aW9uDQoNClNNRU0gKyBMTUVNIHJlZ2lvbg0KR2xvYmFsIGF0b21p
Y3MgZW5hYmxlZA0KQXRvbWljcyBwb3NzaWJsZSBmcm9tIENQVSBhbmQgR1BVDQpDb25jdXJyZW50
IGF0b21pY3MgZnJvbSBDUFUgYW5kIEdQVSBhcmUgYWxsb3dlZA0KDQpTbyBpbiBvcmRlciB0byBh
bGxvY2F0ZSAjMSBhbmQgIzIgeW91IG5lZWQgdG8gaW5kaWNhdGUgYSBuZWVkIGZvciBkZXZpY2Ug
YXRvbWljcyBhbmQgbm90IGdsb2JhbCBhdG9taWNzLg0KDQpNaWNoYWwNCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogWmVuZywgT2FrIDxvYWsuemVuZ0BpbnRlbC5jb20+IA0K
U2VudDogVGh1cnNkYXksIEFwcmlsIDExLCAyMDI0IDc6MjQgUE0NClRvOiBOaXJtb3kgRGFzIDxu
aXJtb3kuZGFzQGxpbnV4LmludGVsLmNvbT47IERhcywgTmlybW95IDxuaXJtb3kuZGFzQGludGVs
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTXJvemVrLCBNaWNoYWwgPG1p
Y2hhbC5tcm96ZWtAaW50ZWwuY29tPg0KQ2M6IFZpdmVrYW5hbmRhbiwgQmFsYXN1YnJhbWFuaSA8
YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29tPjsgV2VsdHksIEJyaWFuIDxicmlh
bi53ZWx0eUBpbnRlbC5jb20+OyBZYW5nLCBGZWkgPGZlaS55YW5nQGludGVsLmNvbT47IExhbmR3
ZXJsaW4sIExpb25lbCBHIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNvbT47IFJvcGVyLCBN
YXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBCcm9zdCwgTWF0dGhldyA8bWF0
dGhldy5icm9zdEBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0cl9tIDx0aG9tYXMuaGVsbHN0cm9t
QGxpbnV4LmludGVsLmNvbT4NClN1YmplY3Q6IFJFOiBbUEFUQ0ggMC8zXSBFbmFibGUgZGV2aWNl
IGF0b21pY3Mgd2l0aCBhIFZNIGJpbmQgZmxhZw0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGxpbnV4LmludGVsLmNvbT4N
Cj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDExLCAyMDI0IDE6MDEgUE0NCj4gVG86IFplbmcsIE9h
ayA8b2FrLnplbmdAaW50ZWwuY29tPjsgRGFzLCBOaXJtb3kgDQo+IDxuaXJtb3kuZGFzQGludGVs
LmNvbT47IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogVml2ZWthbmFuZGFu
LCBCYWxhc3VicmFtYW5pIA0KPiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5kYW5AaW50ZWwuY29t
PjsNCj4gV2VsdHksIEJyaWFuIDxicmlhbi53ZWx0eUBpbnRlbC5jb20+OyBZYW5nLCBGZWkgPGZl
aS55YW5nQGludGVsLmNvbT47IA0KPiBMYW5kd2VybGluLCBMaW9uZWwgRyA8bGlvbmVsLmcubGFu
ZHdlcmxpbkBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhldyBEIA0KPiA8bWF0dGhldy5kLnJvcGVy
QGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IA0K
PiBNcm96ZWssIE1pY2hhbCA8bWljaGFsLm1yb3pla0BpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0
cl9tIA0KPiA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMC8zXSBFbmFibGUgZGV2aWNlIGF0b21pY3Mgd2l0aCBhIFZNIGJpbmQgZmxhZw0K
PiANCj4gSGkgT2FrLA0KPiANCj4gT24gNC8xMS8yMDI0IDY6MjIgUE0sIFplbmcsIE9hayB3cm90
ZToNCj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBEYXMs
IE5pcm1veSA8bmlybW95LmRhc0BpbnRlbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgQXBy
aWwgMTAsIDIwMjQgMTowMyBQTQ0KPiA+PiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4+IENjOiBEYXMsIE5pcm1veSA8bmlybW95LmRhc0BpbnRlbC5jb20+OyBWaXZla2Fu
YW5kYW4sIEJhbGFzdWJyYW1hbmkgDQo+ID4+IDxiYWxhc3VicmFtYW5pLnZpdmVrYW5hbmRhbkBp
bnRlbC5jb20+OyBXZWx0eSwgQnJpYW4gDQo+ID4+IDxicmlhbi53ZWx0eUBpbnRlbC5jb20+OyBZ
YW5nLCBGZWkgPGZlaS55YW5nQGludGVsLmNvbT47IA0KPiA+PiBMYW5kd2VybGluLA0KPiBMaW9u
ZWwgRw0KPiA+PiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+OyBSb3BlciwgTWF0dGhl
dyBEIA0KPiA+PiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47DQo+ID4+IE1yb3playwgTWljaGFsIDxtaWNoYWwu
bXJvemVrQGludGVsLmNvbT47IFplbmcsIE9haw0KPiA8b2FrLnplbmdAaW50ZWwuY29tPjsNCj4g
Pj4gVGhvbWFzIEhlbGxzdHJfbSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+
ID4+IFN1YmplY3Q6IFtQQVRDSCAwLzNdIEVuYWJsZSBkZXZpY2UgYXRvbWljcyB3aXRoIGEgVk0g
YmluZCBmbGFnDQo+ID4+DQo+ID4+IEN1cnJlbnRseSBkZXZpY2UgYXRvbWljcyBpbiBTTUVNIG9u
bHkgYnVmZmVyIGlzIG5vdCBzdXBwb3J0ZWQgYW5kIA0KPiA+PiBnaXZlbiB0aGF0IHNpbXVsdGFu
ZW91cyB1c2FnZSBvZiBkZXZpY2UgYXRvbWljcyBhbmQgQ1BVIGF0b21pY3Mgb24gDQo+ID4+IHRo
ZSBzYW1lIFNNRU0gYnVmZmVyIGlzIG5vdCBndWFyYW50ZWVkIHRvIGZ1bmN0aW9uIHdpdGhvdXQg
DQo+ID4+IG1pZ3JhdGlvbiwgYW5kIFVNRCBleHBlY3RzIG5vIG1pZ3JhdGlvbiBmb3IgU01FTS1v
bmx5IGJ1ZmZlciANCj4gPj4gb2JqZWN0cywgc28gdGhpcyBwcm92aWRlIGEgd2F5IHRvIHNldCBk
ZXZpY2UgYXRvbWljcyB3aGVuIFVNRCBpcyANCj4gPj4gY2VydGFpbiB0byB1c2UgdGhlIGJ1ZmZl
ciBvbmx5IGZvciBkZXZpY2UgYXRvbWljcy4NCj4gPiBJZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVj
dGx5LCBwZXIgdW1kLWttZCBjb250cmFjdCwga21kIHNob3VsZCANCj4gPiBhc3N1bWUgYWxsDQo+
IHNoYXJlZCBhbGxvY2F0aW9ucyBzdXBwb3J0IHN5c3RlbS13aWRlIGF0b21pYyBieSBkZWZhdWx0
DQo+IA0KPiBEbyB3ZSBoYXZlIGFueSByZWZlcmVuY2UgdG8gdGhpcyA/IEkgd2lzaCB0aGlzIGlz
IGRvY3VtZW50ZWQgc29tZXdoZXJlLg0KDQpJIGRvbid0IGtub3cgc3VjaCBkb2N1bWVudCBlaXRo
ZXIuLi4gSSBoYWQgdGhhdCBpbXByZXNzaW9uIHdoZW4gSSBkaXNjdXNzZWQgd2l0aCBVTUQgcHJl
dmlvdXNseQ0KDQoNCj4gDQo+IEZvciBMZXZlbDAsIHRoZSBzeXN0ZW0td2lkZSBhdG9taWNzIGlz
IGRlZmF1bHQgZXhwZWN0YXRpb24gb25seSB3aGVuIA0KPiB0aGVyZSBpcyBLTUQgbWlncmF0aW9u
IGFuZCBvbiBidWZmZXIgd2l0aCBTTUVNK0xNRU0gcGxhY2VtZW50cy4gVGhpcyANCj4gaXMgbXkg
dW5kZXJzdGFuZGluZw0KPiANCj4gYWZ0ZXIgbG9uZyBkaXNjdXNzaW9uIHRoYXQgSSBoYWQgd2l0
aCBNaWNoYWwsIE1hdHQsIGFuZCBMaW9uZWwuDQo+IA0KPiBUaGlzIHBhdGNoIGlzIG5lZWRlZCBi
ZWNhdXNlIGEgdnVsa2FuIGFwcGxpY2F0aW9uIGNhbiBhbHdheXMgdHJ5IHRvIGRvIA0KPiBjcHUg
YXRvbWljc8KgIG9uIFNNRU0gb25seSBCTyBhbmQgd2UgY2FuJ3QgYWxsb3cgZGV2aWNlIGF0b21p
Y3Mgb24gdGhhdCANCj4gYnkgZGVmYXVsdC4NCj4gDQo+ID4gICAoaS5lLiBldmVuIGlmIHRoZXJl
IGlzIG5vdCBhbnkgdXNlciBzZXR0aW5ncykuIFNvIGlmIHdlIHdhbnQgdG8gDQo+ID4gaW50cm9k
dWNlIEFQSSB0bw0KPiBsZXQgdXNlciB0byBzYXkgIm9ubHkgZGV2aWNlIGF0b21pYyBpcyBleHBl
Y3RlZCBvbiB0aGlzIGFsbG9jYXRpb24iLCANCj4gdGhlIEFQSSB3b3VsZCBiZSAiTm8gc3lzdGVt
LXdpZGUgYXRvbWljcyBvbiB0aGlzIGFsbG9jYXRpb24iLg0KPiBJIHRoaW5rIHRoZSBmbGFnIG5h
bWUgc3VpdGVzIHdlbGwgd2l0aCBleGlzdGluZyANCj4gIlpFX01FTU9SWV9BVE9NSUNfQVRUUl9F
WFBfRkxBR19ERVZJQ0VfQVRPTUlDUyIuDQoNCllhaCwgeW91ciBmbGFnIG1hdGNoZXMgYWJvdmUg
TDAgZGVmaW5pdGlvbi4gDQoNCldoYXQgaXMgbm90IGNsZWFyIHRvIG1lIGlzLCB3aGF0IGlzIHRo
ZSBkZWZhdWx0IGJlaGF2aW9yIG9mIGFuIGFsbG9jYXRpb24/IElmIHRoZSBkZWZhdWx0IGJlaGF2
aW9yIGlzIHN5c3RlbS13aWRlIGF0b21pY3MgKG1lYW5zIHNpbXVsdGFuZW91cyBob3N0IGFuZCBk
ZXZpY2UgYXRvbWljIG9wZXJhdGlvbnMgYXJlIHBvc3NpYmxlKSwgdGhlbiB3aGF0IGlzIHRoZSBw
b2ludCBvZiBTRVRfREVWSUNFX0FUT01JQy4uLiANCg0KSSB0aGluayB0aGUgdUFQSSBmb3JtYXQg
ZGVwZW5kcyBvbiB0aGUgZGVmYXVsdCBiZWhhdmlvcjoNCglJZiBkZWZhdWx0IGlzIHN5c3RlbS13
aWRlIGF0b21pYywgdGhlbiB1QVBJIHNob3VsZCBiZSBOT19TWVNURU1fQVRPTUlDLCBOT19ERVZJ
Q0VfQVRPTUlDLi4uDQoJSWYgZGVmYXVsdCBpcyBubyBhdG9taWMsIHRoZW4gdUFQSSBzaG91bGQg
YmUgU0VUX0RFVklDRV9BVE9NSUMsIFNFVF9TWVNURU1fQVRPTUlDLi4uDQoNCkBNcm96ZWssIE1p
Y2hhbCBjYW4geW91IGNvbW1lbnQ/DQoNCk9haw0KDQoNCj4gPg0KPiA+IFNpbWlsYXJseSwgd2Ug
Y2FuIGludHJvZHVjZSBBUEkgdG8gbGV0IHVzZXIgc2F5Og0KPiA+IAl0aGVyZSBpcyBubyBhdG9t
aWNzIGV4cGVjdGVkIHRvIHRoaXMgYWxsb2NhdGlvbg0KPiA+IAlubyBkZXZpY2UgYXRvbWljIG9y
DQo+ID4gCW5vIGhvc3QgYXRvbWljDQo+IA0KPiBXZSBjYW4gYWRkIHRob3NlIG9uY2Ugd2UgaGF2
ZSBzdWNoIHJlcXVpcmVtZW50IGZyb20gVU1ELg0KPiANCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBO
aXJtb3kNCj4gDQo+ID4NCj4gPiBCdXQgdGhlIGFib3ZlIGFzc3VtcHRpb24gKGFsbCBhbGxvY2F0
aW9uIGJ5IGRlZmF1bHQgc3VwcG9ydCANCj4gPiBzeXN0ZW0td2lkZQ0KPiBhdG9taWNzKSBkb2Vz
bid0IHdvcmsgZm9yIGRldmljZSBvciBob3N0IGFsbG9jYXRpb25zIG9uIHNvbWUgcGxhdGZvcm0s
IA0KPiBpLmUuLCBhcyBleHBsYWluZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLi4uDQo+ID4NCj4g
PiBTbyB0aGUgQVBJIGZvcm1hdCBpcyBzdGlsbCBhbiBvcGVuIHRvIG1lLiBTaG91bGQgd2UgZGVm
aW5lIHRoaW5nIA0KPiA+IHNpbWlsYXIgdG8NCj4gdW1kIGFwaSBoZXJlOiANCj4gaHR0cHM6Ly9z
cGVjLm9uZWFwaS5pby9sZXZlbC16ZXJvL2xhdGVzdC9jb3JlL2FwaS5odG1sI3plLQ0KPiBtZW1v
cnktYXRvbWljLWF0dHItZXhwLWZsYWdzLXQNCj4gPg0KPiA+IE9haw0KPiA+DQo+ID4NCj4gPj4g
VGVzdC13aXRoOiAyMDI0MDQxMDE3MDA0MS4yNDk2My0xLW5pcm1veS5kYXNAaW50ZWwuY29tDQo+
ID4+IENjOiBCYWxhc3VicmFtYW5pIFZpdmVrYW5hbmRhbiANCj4gPj4gPGJhbGFzdWJyYW1hbmku
dml2ZWthbmFuZGFuQGludGVsLmNvbT4NCj4gPj4gQ2M6IEJyaWFuIFdlbHR5IDxicmlhbi53ZWx0
eUBpbnRlbC5jb20+DQo+ID4+IENjOiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPiA+
PiBDYzogTGlvbmVsIEcgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBpbnRlbC5jb20+
DQo+ID4+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiA+PiBD
YzogTWF0dGhldyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+DQo+ID4+IENjOiBNaWNo
YWwgTXJvemVrIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NCj4gPj4gQ2M6IE9hayBaZW5nIDxv
YWsuemVuZ0BpbnRlbC5jb20+DQo+ID4+IENjOiBUaG9tYXMgSGVsbHN0cl9tIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gPj4NCj4gPj4gTmlybW95IERhcyAoMyk6DQo+ID4+
ICAgIGRybS94ZTogQ29uc29saWRhdGUgc2V0dGluZyBQVEVfQUUgaW50byBvbmUgcGxhY2UNCj4g
Pj4gICAgZHJtL3hlOiBBZGQgZnVuY3Rpb24gdG8gY2hlY2sgaWYgQk8gaGFzIHNpbmdsZSBwbGFj
ZW1lbnQNCj4gPj4gICAgZHJtL3hlL3VhcGk6IEludHJvZHVjZSBWTUEgYmluZCBmbGFnIGZvciBk
ZXZpY2UgYXRvbWljcw0KPiA+Pg0KPiA+PiAgIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jICAg
ICAgIHwgMTQgKysrKysrKysrKysrKysNCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfYm8u
aCAgICAgICB8ICAxICsNCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyAgICAgICB8
ICA0ICstLS0NCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYyAgICAgICB8IDMyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLS0NCj4gLQ0KPiA+PiAgIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bV90eXBlcy5oIHwgIDIgKysNCj4gPj4gICBpbmNsdWRlL3VhcGkvZHJtL3hlX2Ry
bS5oICAgICAgICB8ICA5ICsrKysrLS0tLQ0KPiA+PiAgIDYgZmlsZXMgY2hhbmdlZCwgNTEgaW5z
ZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuNDIuMA0K
