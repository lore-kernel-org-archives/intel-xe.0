Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF0CD8CA8
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 06:43:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E04A10E0E2;
	Tue,  9 Jun 2026 06:43:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UOPGhYf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2230D10E0E2
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Jun 2026 06:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780987407; x=1812523407;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q9cZ+hgsea8yMMgunpayYGoGYu8x6wv6pcgTHZlASh4=;
 b=UOPGhYf/ke5kfgVgI2QPjjlT50vJIA8F5sBeuyqHlHgn7BTySveW+t00
 DMgrekLutlrKzXpQb+OjXw5UPyf9ALKByv/bfOjLPl1sYNgkvpdTG2YbZ
 +JBQ7hcUBglGkDG8A+EZir3Vu5Uy8pnwB/BipGy8l0cXiTGkROsInShi0
 TN52wNGe8vUCZl39XLRmG9TKydQVQzMLhg9K+RV6vInIL3FQobcwzXV9s
 Uy6PkEiM2UIilTF2nivrgnO40gHADb/4e11gx9EJ5EzJ5GB3kpPomsSGj
 g05jezcw09sXHqg8rdjxmn/h40SvcU4I2xC0pHHpEeGJMhUT/VJ0DMvTz Q==;
X-CSE-ConnectionGUID: qL6tVCMoRuCDEgvTVMSMqA==
X-CSE-MsgGUID: a3akT3yYQpaSZyQDNPc1bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81803247"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81803247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 23:43:26 -0700
X-CSE-ConnectionGUID: sULccKtdS06SbvnXyRfk7g==
X-CSE-MsgGUID: BJ5va0h9R0a7oUESJwB8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="269781836"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 23:43:25 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 23:43:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 23:43:24 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.8) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 23:43:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCv6eKJ7eEzQ5Z9/EgfJarAWVIRb2p978yoLnH6SaK8OTikL9x78HNzO4mRX0sv7tOiYpnTHgWU5oxQkvxu0sGJC+pTsmZagBOpkWKYvV0ZMQm8phV2M6NpnesegaYyOE+VTC1N5UfG4uOf8sKJQzQzHfdY0MLg6nZRPuljj4U58NnpBjPYVHirBZtPKzfR6g9fj8T2r1kvYJfTR1TrRzGwIStnfnLIuzEixR043M9exPLD0B0v6omv91zT3rmOtX+1FKHMd6vjaiw84RZ/33gOdF/x1Kid2mCoK866ogJx6EooBfMmr+Up48vynwXRYdnx7HscoYywRFKy+8vfHNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9cZ+hgsea8yMMgunpayYGoGYu8x6wv6pcgTHZlASh4=;
 b=Onm1qUnfelNqw9uZCfiTwA8GVtEeiFFG+l+NVsliWh36z+hQF/JORbJYUbQmOvA4HvvLstY6RFHkAkPCnN0te+gzs/LOuwcYc3uJGbUtKYRs9Xwgie4eDxmckBFpzfleijs1TQ2LItQPxwksVnrsUiwPVxcZVc8L8yaZR5bOzeA4cnwpjt2CKrBuRqlwCpEvVlnXsrIJFd8YctTL19Ts5Wpoy9kvDqp00UhnnzNhKu79BYfDzUzyyzJk+b/7UrBdpRZNa+x7VRIPXRFaXjEWUPuHmBc8ZVRdWhGPs4dbM3vF5EvEW7t283Tl8xYBi/eFRRj0xbnR/hyMxz6udaCI4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by DSWPR11MB9954.namprd11.prod.outlook.com (2603:10b6:8:39d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 06:43:16 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 06:43:16 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Yadav, Arvind" <arvind.yadav@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Avoid self-deadlock in queue destruction
Thread-Topic: [PATCH] drm/xe/guc: Avoid self-deadlock in queue destruction
Thread-Index: AQHc7O5rggFUQVcPp0KuLrU2b56+ALY13DzA
Date: Tue, 9 Jun 2026 06:43:15 +0000
Message-ID: <DS0PR11MB8718E599D253957E5C9C3618811D2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260526090202.2957453-1-arvind.yadav@intel.com>
In-Reply-To: <20260526090202.2957453-1-arvind.yadav@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|DSWPR11MB9954:EE_
x-ms-office365-filtering-correlation-id: 46c2f0fa-bca4-48f6-9928-08dec5f26286
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: QegwGR/j7zTFCuH1PSJPFxxrWDD63A6sEU3J5oV2ncOWlI+I044dT0hGLhIvaUNCabFYCJaN+riDmKbwuHvCfVjywmr0N5lWUWOd5UM83pXIAFqsn3EUlesbGLsHSZWwZ3ifECHfn8vNWH6+Y90oh5p1Xp8hoUf9ULsj0X6UA6eRMHN1i88FJrMXNYh3U/uEgDdlY2mCKY5tlgHm1i9WfKFLbHL2ByAMMCTWVfFhvz3AF3vJ9b7PcZwVclM/kdeKH4U519+EN5iPR0Fp/y8/N17AX1dAEabWLyNh+XjiPQLaHqT216E3KhVe5G50XIiwQxarCyvQIaoLPTfmMaOpcVaSW15h1BgHYKjDuU+pSDPrkmhJ4rFgOREM8LqAOJWyRpsAYw38Bl7ayLW+gtQRotTdbV4CujmYT3N3A4sRm4oewlA9vS5FxHrry/pESvOv8lcJV5F0Gnl62lTr+t4GXWRMIpcOjjh+dnjTmhC3MB7N06MRe0GRvB6XY+5vN133bvHEvz4yUZ5Gab7kFYr94DKB91ScQUF+r/QEKLtPuyvmuLeXfqGqmHBGFLaF3QNjwj8Dl2MZstz9gH8umNDbqeQjqvTWb7Mcju1jpB0OOybEZ5OfeXEQZz31nqLetiv9RJur0uUKNSINmKL0aei5yQKA96RD4zLn6+t55FPBC7apySBTOLdt+zzPSZk3xgrHeVhW/4S+iLqAKAjfdY4DYIeYb+snhz+dZa2W3LgMGoWFmVWTvXdoMAZYU6aiaP/V
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFNpbzVRWHl0SXczWCt1Vy82VzQ1Y2ZtTGlqbWNWYnBzVlFmTm52cjRjWHky?=
 =?utf-8?B?eWpzbWFETXNoaWZBVmdTL2x5UmdnNHdmQXV1NUdXUzlZVWhpRVlQclppdmd6?=
 =?utf-8?B?RlV0dGpVNDJMcWQ0Z3FGN0Q2bC9rSk9WN0d0aTdsdVc5RzBEUFpDOW5MTFpr?=
 =?utf-8?B?dCtNc2JxdUEzZk5oTUw3aFg3b2xkU2w4b1J6NzRiKzRFTlREd0oxTFViZldy?=
 =?utf-8?B?OU52WmRTb2MrRTRlbHpHZ1h6VXQ0NWlIZjFrZUgvbUkrY0w5TkVGT2tjREtJ?=
 =?utf-8?B?WUpHOW5WNTFvNC9LMFp1dEU4Si9Xc0QwK3Y4ZU9kU1JBMWw3SXh0RU43S1ho?=
 =?utf-8?B?WFgyZ1lvUThrdC9EUWFLTzMvekx1bFIzbXh4YjJzNS9SZU9qc0s0clRHQ2ti?=
 =?utf-8?B?L3hIaWxaaXpHb1ZuWHlxQnZUTEpUNXNLV241VjZ0WDRvVXpzNldORWdyK0c5?=
 =?utf-8?B?cnJjUy9VQkVSMkMvOUc4eFdqVlBQQWs5RW9uUW40MzBSRnd3alFKdWVrTmZo?=
 =?utf-8?B?RkdGa0RTejJQVTVTekxoQWk3Y05nSzYyeExVLzNtTXVMZzB4bk1DZVVKUjV6?=
 =?utf-8?B?Q2RYU0dXKy9KZjRONGNKVUlUQjNIL3FiSTU0WUY0MXhhVXdHdHViUFJyT2gv?=
 =?utf-8?B?VFFWYjljQ1FIcUpsdkhGY1NBcWx0bjRieEJQNHhMWERvV1lZVnk1Zlhsc3Bu?=
 =?utf-8?B?M1htOXZXVWpmZmdTM004bDFoaGVvODUrRFNiN0paZmZLRnMwMGJaRlphY2ZX?=
 =?utf-8?B?ZXFvV09CcjdzYTNYMmVEYnlnQStSRlZlRzRmbDVCQVluZTBUOHk2ZjF5R2hL?=
 =?utf-8?B?blFzVHNpVU1NMWl0YWhZeWJiNitsYTJoUENDcE9YcElaUElYOVpSZUtlNmdo?=
 =?utf-8?B?cTZiNzRRZnRXSCtRTTEzTFp2NmluM1h0TnVjTURtbnN5L2V3TjVTMzVBbFNR?=
 =?utf-8?B?Ky83ZVhLQTJZY3pFUXljQ2pzZ3lFYm5GU2xxMHFHMEh1MTVUY05BaWkySzlJ?=
 =?utf-8?B?UVR2NHB3T1dxT2Rmc1A1Z2lwMnByK1MyWXgwcnBPRG92RVpOa1hTcFdWbXhG?=
 =?utf-8?B?T2xYZUpHcG5DSU9UdHJ0ak1vdHNEUHlPNldVSURXS3AwYVo4ZnA5UHU0R1N1?=
 =?utf-8?B?bGMvbmZrM21jaUJ1S2x5QWlMaVZOekNoQ1lHSGV3OE96SXYwc1JJNnJUUEtr?=
 =?utf-8?B?K0lKdDlRREJEUzBSN2FVeHArTGVXR3Mxdis5NGYzZy9QWExXdHFRTXErbXdz?=
 =?utf-8?B?TUk4SUZKQk1DNE1qOFlJVnFoOFVhWWFlcmVJYW5meHV1dlMrcmlSK244cU85?=
 =?utf-8?B?N1VJRGlvS0ZqZzZibWRJTWs2R2R4RG5SRlI0bEIyQnNNTndsT1Q2bVd0N29I?=
 =?utf-8?B?R2k5Z2lnQUpaVTFMZ0d3YndrRWRJRFprbHQ0M0UzZmh1NERsR2VTdHp2MzA1?=
 =?utf-8?B?MVg1RkYrWTBsV3drYjh4VFhuQk5wbWpmdklWMEF2K01hNTBYUUp2VW85cXpl?=
 =?utf-8?B?Q1IzYWdEQXIyR1pyODhzZGl2TS9VTjNPMFFkcnlWd2U4dW5uYmpjK3dTMlZD?=
 =?utf-8?B?ajV0R3poMDQzN1l2L3ladzV4YzNmeGxEQTFMNjZWa1JlK0RMbDUwQkx6b1ox?=
 =?utf-8?B?QWE2QUNrd0xQemIxaGlTZHVlMnpiSTljTndHMVBPUHBFSzBhL1dmTTFpU3hP?=
 =?utf-8?B?SVdsS1crRTkvdHhyLzNiMzZlbFB0d01pemUxRHRmQUJEOTRXMmZTalJNVlN1?=
 =?utf-8?B?bHBXelNHVU9LT1dYOFhxak1RTldZNEZDc0VoMHpXa0NrWXM1V24xaVJsalND?=
 =?utf-8?B?OVVoVCt5K3luQUc4V0xKK0RGdWY5Y3NnUkRKSVpiU2dOV2NOOXgwRTRlT01w?=
 =?utf-8?B?MmRaVUhaRHJkcHU4T0MrQlJwY3NDSHordjFkK0xxMkdKcHRJTnJwRmNNa2Ry?=
 =?utf-8?B?RU9ZTkpON0RlTnBEa0ZIUzZHSW92WFZsb0htWnFRcXRQK0J0OHlibDdWbzE5?=
 =?utf-8?B?QWxVT1dMUHhpVFFIbkplTGlXb3A4WnNHUW1xSmlHZ2tYcWZtMHJxckJNSGlD?=
 =?utf-8?B?SlhIdGJRV0NXR0s4ZVdQUk9ZVjZLTU1aV24xSmFHZTBuYWFEek5VVVpuZkdI?=
 =?utf-8?B?ejR3VndYUjhJT3lrMmY5R1A3WmpDUk5zdjVSa0I3QndjQ1BTcFROSkFraVlR?=
 =?utf-8?B?UmpHRUdrSTk3LzdGUFQ0VjFqRHNwVFhBQUx2WkxYdDVyZks0WitlcTdBYkdO?=
 =?utf-8?B?MklMZ3hSSGJlRFI5MFZ5WUs1b1BPS3lIS0VLMk4zRERlUWxDVXhJb1FvR0du?=
 =?utf-8?B?ckJpcGNwaUlML1A3UlNlR2xOaUUyKytoVDJ5K2VaQ2ZPV3c5cEVvZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UkwSKgK7G6o5Uj1+RSiFA5LBSM6v92JLsnPbIc9MxEZgI2KM20NmbgA+vPXSxN2q4eEaPjr3z9ypx0bNcqhMLH1GwHKMR90toohith1sPWWuEsoUX+njWJt3CRkVns8Wu+N67z4tkrHIpp4fAwZLv7jm5b2KtcTltTSwxY6yyvDK/H8ZEBJ6PVMtQqQnqeCqc4ESoxzUn4zxFZrFJFtodvVksNV2zEamTQwVWrE27PKi6qRgxcujRIaliqeKMEMv1pH7zG0lOiF7jE0H+wbYEjdqaGqFf2Mvr1KGipQu0L3hwXsf5YuQVyitvoICK7fB/lDQpSX5fAEUF1/IALFysQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46c2f0fa-bca4-48f6-9928-08dec5f26286
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 06:43:15.8735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qbU+MiVaxduJUgpXy/PjBY2MY1UD644c5jjvBbQLtOmGKhzHZdBxTS+hmRKxfMraeb+d0mlcVHEI41mTazGrEscAiUl3nf6x/tomZiRXcNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9954
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwteGUgPGludGVs
LXhlLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQXJ2aW5kDQo+
IFlhZGF2DQo+IFNlbnQ6IDI2IE1heSAyMDI2IDE0OjMyDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gQ2M6IEJyb3N0LCBNYXR0aGV3IDxtYXR0aGV3LmJyb3N0QGludGVs
LmNvbT47IEdoaW1pcmF5LCBIaW1hbCBQcmFzYWQNCj4gPGhpbWFsLnByYXNhZC5naGltaXJheUBp
bnRlbC5jb20+OyB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgVml2aSwNCj4gUm9k
cmlnbyA8cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIXSBkcm0veGUv
Z3VjOiBBdm9pZCBzZWxmLWRlYWRsb2NrIGluIHF1ZXVlIGRlc3RydWN0aW9uDQo+IA0KPiBHdUMg
ZXhlYyBxdWV1ZSBkZXN0cnVjdGlvbiBjYW4gcnVuIG9uIHhlLT5kZXN0cm95X3dxLiBEdXJpbmcg
cXVldWUNCj4gY2xlYW51cCwgeGVfZXhlY19xdWV1ZV9maW5pKCkgY2FuIGRyb3AgdGhlIGxhc3Qg
cmVmZXJlbmNlIHRvIG9iamVjdHMgd2hpY2gNCj4gZXZlbnR1YWxseSByZWxlYXNlIHRoZSBEUk0g
ZGV2aWNlIGFuZCBydW4gZHJtbSBjbGVhbnVwIGFjdGlvbnMuDQo+IA0KPiBndWNfc3VibWl0X3N3
X2ZpbmkoKSwgcmVnaXN0ZXJlZCBhcyBhIGRybW0gYWN0aW9uLCBkcmFpbnMNCj4geGUtPmRlc3Ry
b3lfd3EuIElmIHRoZSBmaW5hbCBkcm1fZGV2X3B1dCgpIGhhcHBlbnMgZnJvbSBhbiBkZXN0cm95
X3dxDQo+IHhlLT53b3JrZXIsIHRlYXJkb3duIGNhbiB0cnkgdG8gZHJhaW4gdGhlIHNhbWUgd29y
a3F1ZXVlDQo+IHRoZSBjdXJyZW50IHdvcmtlciBpcyBydW5uaW5nIG9uLCBjYXVzaW5nIGEgc2Vs
Zi1kZWFkbG9jay4NCj4gDQo+IEZpeCB0aGlzIGJ5IHRha2luZyBhbiBleHRyYSBkcm1fZGV2aWNl
IHJlZmVyZW5jZSBhY3Jvc3MgYXN5bmMgZXhlYyBxdWV1ZQ0KPiBjbGVhbnVwIGFuZCBkcm9wcGlu
ZyBpdCBmcm9tIHN5c3RlbV9kZmxfd3EuIFRoZSBkZWZlcnJlZCBwdXQgd29yayBpcw0KPiBwcmVh
bGxvY2F0ZWQgZHVyaW5nIHF1ZXVlIGluaXQsIHNvIHRoZSBkZXN0cm95IHdvcmtlciBkb2VzIG5v
dCBuZWVkIHRvDQo+IGFsbG9jYXRlIG1lbW9yeS4NCj4gDQo+IFRoaXMga2VlcHMgdGhlIGZpbmFs
IGRybV9kZXZfcHV0KCkgb3V0IG9mIHhlLT5kZXN0cm95X3dxIHdoaWxlIHByZXNlcnZpbmcNCj4g
ZXhlYyBxdWV1ZSB0ZWFyZG93biBvcmRlcmluZy4NCj4gDQo+IEZpeGVzOiAyZDJiZTI3OWYxY2Eg
KCJkcm0veGU6IGZpeCBVQUYgYXJvdW5kIHF1ZXVlIGRlc3RydWN0aW9uIikNCj4gQ2M6IE1hdHRo
ZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzogVGhvbWFzIEhlbGxzdHLD
tm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0KPiBDYzogUm9kcmlnbyBWaXZp
IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPg0KPiBDYzogSGltYWwgUHJhc2FkIEdoaW1pcmF5IDxo
aW1hbC5wcmFzYWQuZ2hpbWlyYXlAaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBBcnZpbmQg
WWFkYXYgPGFydmluZC55YWRhdkBpbnRlbC5jb20+DQoNCkRlZmVycmluZyBkcm1fZGV2X3B1dCgp
IHRvIHN5c3RlbV9kZmxfd3EgdG8gYnJlYWsgdGhlIHNlbGYtZHJhaW4gZGVhZGxvY2sgbG9va3Mg
Y29ycmVjdC4NClJldmlld2VkLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50
ZWwuY29tPg0KDQpUZWphcw0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZXhl
Y19xdWV1ZV90eXBlcy5oIHwgIDMgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJt
aXQuYyAgICAgICAgICAgfCA2MiArKysrKysrKysrKysrKysrKystLQ0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCA1OSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZXhlY19xdWV1ZV90eXBlcy5oDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL3hlL3hlX2d1Y19leGVjX3F1ZXVlX3R5cGVzLmgNCj4gaW5kZXggZTVlNTNiNDIx
ZjI5Li5iNWRmYzljOTA5MmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dWNfZXhlY19xdWV1ZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNf
ZXhlY19xdWV1ZV90eXBlcy5oDQo+IEBAIC0xMyw2ICsxMyw3IEBADQo+IA0KPiAgc3RydWN0IGRt
YV9mZW5jZTsNCj4gIHN0cnVjdCB4ZV9leGVjX3F1ZXVlOw0KPiArc3RydWN0IHhlX2RybV9kZXZf
cHV0X3dvcms7DQo+IA0KPiAgLyoqDQo+ICAgKiBzdHJ1Y3QgeGVfZ3VjX2V4ZWNfcXVldWUgLSBH
dUMgc3BlY2lmaWMgc3RhdGUgZm9yIGFuIHhlX2V4ZWNfcXVldWUgQEAgLQ0KPiAzNSw2ICszNiw4
IEBAIHN0cnVjdCB4ZV9ndWNfZXhlY19xdWV1ZSB7DQo+ICAJc3RydWN0IHhlX3NjaGVkX21zZyBz
dGF0aWNfbXNnc1tNQVhfU1RBVElDX01TR19UWVBFXTsNCj4gIAkvKiogQGRlc3Ryb3lfYXN5bmM6
IGRvIGZpbmFsIGRlc3Ryb3kgYXN5bmMgZnJvbSB0aGlzIHdvcmtlciAqLw0KPiAgCXN0cnVjdCB3
b3JrX3N0cnVjdCBkZXN0cm95X2FzeW5jOw0KPiArCS8qKiBAZGV2X3B1dF93b3JrOiBkZWZlcnJl
ZCBkcm1fZGV2X3B1dCB3b3JrZXIgdG8gYXZvaWQgc2VsZi0NCj4gZGVhZGxvY2sgKi8NCj4gKwlz
dHJ1Y3QgeGVfZHJtX2Rldl9wdXRfd29yayAqZGV2X3B1dF93b3JrOw0KPiAgCS8qKiBAcmVzdW1l
X3RpbWU6IHRpbWUgb2YgbGFzdCByZXN1bWUgKi8NCj4gIAl1NjQgcmVzdW1lX3RpbWU7DQo+ICAJ
LyoqIEBzdGF0ZTogR3VDIHNwZWNpZmljIHN0YXRlIGZvciB0aGlzIHhlX2V4ZWNfcXVldWUgKi8g
ZGlmZiAtLWdpdA0KPiBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jDQo+IGluZGV4IGFmZDhjYzdiZDIzMS4u
ODFkNTEzZDFmNTRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1
Ym1pdC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMNCj4gQEAg
LTEwLDYgKzEwLDcgQEANCj4gICNpbmNsdWRlIDxsaW51eC9jaXJjX2J1Zi5oPg0KPiAgI2luY2x1
ZGUgPGxpbnV4L2RtYS1mZW5jZS1hcnJheS5oPg0KPiANCj4gKyNpbmNsdWRlIDxkcm0vZHJtX2Ry
di5oPg0KPiAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiANCj4gICNpbmNsdWRlICJh
YmkvZ3VjX2FjdGlvbnNfYWJpLmgiDQo+IEBAIC00Nyw2ICs0OCwxMSBAQA0KPiANCj4gICNkZWZp
bmUgWEVfR1VDX0VYRUNfUVVFVUVfQ0dQX0NPTlRFWFRfRVJST1JfTEVOCQk2DQo+IA0KPiArc3Ry
dWN0IHhlX2RybV9kZXZfcHV0X3dvcmsgew0KPiArCXN0cnVjdCB3b3JrX3N0cnVjdCB3b3JrOw0K
PiArCXN0cnVjdCBkcm1fZGV2aWNlICpkcm07DQo+ICt9Ow0KPiArDQo+ICBzdGF0aWMgaW50IGd1
Y19zdWJtaXRfcmVzZXRfcHJlcGFyZShzdHJ1Y3QgeGVfZ3VjICpndWMpOw0KPiANCj4gIHN0YXRp
YyBzdHJ1Y3QgeGVfZ3VjICoNCj4gQEAgLTE2NzcsNiArMTY4Myw4IEBAIHN0YXRpYyB2b2lkIGd1
Y19leGVjX3F1ZXVlX2Zpbmkoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEpDQo+ICAJeGVfc2No
ZWRfZW50aXR5X2ZpbmkoJmdlLT5lbnRpdHkpOw0KPiAgCXhlX3NjaGVkX2ZpbmkoJmdlLT5zY2hl
ZCk7DQo+IA0KPiArCWtmcmVlKGdlLT5kZXZfcHV0X3dvcmspOw0KPiArDQo+ICAJLyoNCj4gIAkg
KiBSQ1UgZnJlZSBkdWUgc2NoZWQgYmVpbmcgZXhwb3J0ZWQgdmlhIERSTSBzY2hlZHVsZXIgZmVu
Y2VzDQo+ICAJICogKHRpbWVsaW5lIG5hbWUpLg0KPiBAQCAtMTY4NCwyMCArMTY5Miw1NSBAQCBz
dGF0aWMgdm9pZCBndWNfZXhlY19xdWV1ZV9maW5pKHN0cnVjdA0KPiB4ZV9leGVjX3F1ZXVlICpx
KQ0KPiAgCWtmcmVlX3JjdShnZSwgcmN1KTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBfX2d1
Y19leGVjX3F1ZXVlX2Rlc3Ryb3lfYXN5bmMoc3RydWN0IHdvcmtfc3RydWN0ICp3KQ0KPiArc3Rh
dGljIHZvaWQgeGVfZHJtX2Rldl9wdXRfd29ya19mdW5jKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykNCj4gIHsNCj4gLQlzdHJ1Y3QgeGVfZ3VjX2V4ZWNfcXVldWUgKmdlID0NCj4gLQkJY29udGFp
bmVyX29mKHcsIHN0cnVjdCB4ZV9ndWNfZXhlY19xdWV1ZSwgZGVzdHJveV9hc3luYyk7DQo+IC0J
c3RydWN0IHhlX2V4ZWNfcXVldWUgKnEgPSBnZS0+cTsNCj4gKwlzdHJ1Y3QgeGVfZHJtX2Rldl9w
dXRfd29yayAqcHV0ID0NCj4gKwkJY29udGFpbmVyX29mKHdvcmssIHN0cnVjdCB4ZV9kcm1fZGV2
X3B1dF93b3JrLCB3b3JrKTsNCj4gKw0KPiArCWRybV9kZXZfcHV0KHB1dC0+ZHJtKTsNCj4gKwlr
ZnJlZShwdXQpOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBndWNfZXhlY19xdWV1ZV9kb19k
ZXN0cm95KHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxLCBib29sDQo+ICtkZWZlcl9kZXZfcHV0KSB7
DQo+ICsJc3RydWN0IHhlX2d1Y19leGVjX3F1ZXVlICpnZSA9IHEtPmd1YzsNCj4gIAlzdHJ1Y3Qg
eGVfZ3VjICpndWMgPSBleGVjX3F1ZXVlX3RvX2d1YyhxKTsNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNl
ICp4ZSA9IGd1Y190b194ZShndWMpOw0KPiArCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSAmeGUt
PmRybTsNCj4gKwlzdHJ1Y3QgeGVfZHJtX2Rldl9wdXRfd29yayAqcHV0X3dvcmsgPSBOVUxMOw0K
PiANCj4gLQlndWFyZCh4ZV9wbV9ydW50aW1lKShndWNfdG9feGUoZ3VjKSk7DQo+ICsJaWYgKGRl
ZmVyX2Rldl9wdXQpIHsNCj4gKwkJcHV0X3dvcmsgPSBnZS0+ZGV2X3B1dF93b3JrOw0KPiArCQln
ZS0+ZGV2X3B1dF93b3JrID0gTlVMTDsNCj4gKw0KPiArCQlwdXRfd29yay0+ZHJtID0gZHJtOw0K
PiArCQlJTklUX1dPUksoJnB1dF93b3JrLT53b3JrLA0KPiB4ZV9kcm1fZGV2X3B1dF93b3JrX2Z1
bmMpOw0KPiArDQo+ICsJCS8qDQo+ICsJCSAqIEF2b2lkIHJ1bm5pbmcgdGhlIGZpbmFsIGRybV9k
ZXZfcHV0KCkgZnJvbSB4ZS0NCj4gPmRlc3Ryb3lfd3EsDQo+ICsJCSAqIHNpbmNlIGd1Y19zdWJt
aXRfc3dfZmluaSgpIGRyYWlucyB0aGF0IHF1ZXVlLg0KPiArCQkgKi8NCj4gKwkJZHJtX2Rldl9n
ZXQoZHJtKTsNCj4gKwl9DQo+ICsNCj4gKwlndWFyZCh4ZV9wbV9ydW50aW1lKSh4ZSk7DQo+ICAJ
dHJhY2VfeGVfZXhlY19xdWV1ZV9kZXN0cm95KHEpOw0KPiANCj4gIAkvKiBDb25maXJtIG5vIHdv
cmsgbGVmdCBiZWhpbmQgYWNjZXNzaW5nIGRldmljZSBzdHJ1Y3R1cmVzICovDQo+ICAJY2FuY2Vs
X2RlbGF5ZWRfd29ya19zeW5jKCZnZS0+c2NoZWQuYmFzZS53b3JrX3Rkcik7DQo+IA0KPiAgCXhl
X2V4ZWNfcXVldWVfZmluaShxKTsNCj4gKw0KPiArCWlmIChwdXRfd29yaykNCj4gKwkJcXVldWVf
d29yayhzeXN0ZW1fZGZsX3dxLCAmcHV0X3dvcmstPndvcmspOyB9DQo+ICsNCj4gK3N0YXRpYyB2
b2lkIF9fZ3VjX2V4ZWNfcXVldWVfZGVzdHJveV9hc3luYyhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKncp
IHsNCj4gKwlzdHJ1Y3QgeGVfZ3VjX2V4ZWNfcXVldWUgKmdlID0NCj4gKwkJY29udGFpbmVyX29m
KHcsIHN0cnVjdCB4ZV9ndWNfZXhlY19xdWV1ZSwgZGVzdHJveV9hc3luYyk7DQo+ICsNCj4gKwln
dWNfZXhlY19xdWV1ZV9kb19kZXN0cm95KGdlLT5xLCB0cnVlKTsNCj4gIH0NCj4gDQo+ICBzdGF0
aWMgdm9pZCBndWNfZXhlY19xdWV1ZV9kZXN0cm95X2FzeW5jKHN0cnVjdCB4ZV9leGVjX3F1ZXVl
ICpxKSBAQCAtDQo+IDE3MDksNyArMTc1Miw3IEBAIHN0YXRpYyB2b2lkIGd1Y19leGVjX3F1ZXVl
X2Rlc3Ryb3lfYXN5bmMoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEpDQo+IA0KPiAgCS8qIFdl
IG11c3QgYmxvY2sgb24ga2VybmVsIGVuZ2luZXMgc28gc2xhYnMgYXJlIGVtcHR5IG9uIGRyaXZl
cg0KPiB1bmxvYWQgKi8NCj4gIAlpZiAocS0+ZmxhZ3MgJiBFWEVDX1FVRVVFX0ZMQUdfUEVSTUFO
RU5UIHx8DQo+IGV4ZWNfcXVldWVfd2VkZ2VkKHEpKQ0KPiAtCQlfX2d1Y19leGVjX3F1ZXVlX2Rl
c3Ryb3lfYXN5bmMoJnEtPmd1Yy0+ZGVzdHJveV9hc3luYyk7DQo+ICsJCWd1Y19leGVjX3F1ZXVl
X2RvX2Rlc3Ryb3kocSwgZmFsc2UpOw0KPiAgCWVsc2UNCj4gIAkJcXVldWVfd29yayh4ZS0+ZGVz
dHJveV93cSwgJnEtPmd1Yy0+ZGVzdHJveV9hc3luYyk7ICB9DQo+IEBAIC0xOTUwLDYgKzE5OTMs
MTIgQEAgc3RhdGljIGludCBndWNfZXhlY19xdWV1ZV9pbml0KHN0cnVjdA0KPiB4ZV9leGVjX3F1
ZXVlICpxKQ0KPiAgCWlmICghZ2UpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiANCj4gKwlnZS0+
ZGV2X3B1dF93b3JrID0ga21hbGxvY19vYmooKmdlLT5kZXZfcHV0X3dvcmssIEdGUF9LRVJORUwp
Ow0KPiArCWlmICghZ2UtPmRldl9wdXRfd29yaykgew0KPiArCQlrZnJlZShnZSk7DQo+ICsJCXJl
dHVybiAtRU5PTUVNOw0KPiArCX0NCj4gKw0KPiAgCXEtPmd1YyA9IGdlOw0KPiAgCWdlLT5xID0g
cTsNCj4gIAlpbml0X3JjdV9oZWFkKCZnZS0+cmN1KTsNCj4gQEAgLTIwMjcsNiArMjA3Niw3IEBA
IHN0YXRpYyBpbnQgZ3VjX2V4ZWNfcXVldWVfaW5pdChzdHJ1Y3QNCj4geGVfZXhlY19xdWV1ZSAq
cSkNCj4gIGVycl9zY2hlZDoNCj4gIAl4ZV9zY2hlZF9maW5pKCZnZS0+c2NoZWQpOw0KPiAgZXJy
X2ZyZWU6DQo+ICsJa2ZyZWUoZ2UtPmRldl9wdXRfd29yayk7DQo+ICAJa2ZyZWUoZ2UpOw0KPiAN
Cj4gIAlyZXR1cm4gZXJyOw0KPiAtLQ0KPiAyLjQzLjANCg0K
