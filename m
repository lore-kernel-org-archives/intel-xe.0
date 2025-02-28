Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EFBC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 12:57:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E40A10EC8A;
	Fri, 28 Feb 2025 12:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jZIf2yiN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23EF810EC8A
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Feb 2025 12:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740747453; x=1772283453;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=PglV2L2puQ0zcIvuq4ldX0EDLk/nhmHVWagC8X/rPSc=;
 b=jZIf2yiNbq1HEyYdWP7Pog4BKFfh03vOPJvOisGSkyGXu5DNZSjfR1m2
 YT5HbG3QUpbo54F3G4KLrjj88b1Y9Ek51nMxuHX6xMuhT+IE1/FBe+bJy
 +qmYU13LzVO1Och9e0wYCOeO1KPNWz10KNoW9Ymmj4pW9lBoESpN1MrSu
 zxBv57YIk4eNa4C8UBsjUifAWtsQ+3feBdjMiYGgczJBhnGJq5DPxqocm
 ET4SLXSCHkK75RKsS5o9eF1bDzc33rQAWAGuCTkW9MejsN3sDuziEvJXO
 mbllqYZZMA5FySkLlAMXaK+DYY3apw3xT4n8GO8uAE6sy0xBj8pPH2m/S Q==;
X-CSE-ConnectionGUID: GkQ4yN+rT9uhRnVzdgfszw==
X-CSE-MsgGUID: TvEJyHZ8Sdy2rlCPcBBmdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="44488958"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="44488958"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 04:57:33 -0800
X-CSE-ConnectionGUID: zHDRfGk1TQmqHMxwgn//Uw==
X-CSE-MsgGUID: G/BLzpDKSZqCBMeFyDCxXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="117833386"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2025 04:57:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 28 Feb 2025 04:57:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 04:57:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 04:57:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNisfu7aWIZmGmI5+7ZPw6F+kxb9KzPDWOkyBMK9MDHkjtnhBEYb8wZWWbeTpUoPZpVVkmE8Yd7ctlYZ+IEN/a0plg/zqmK2WqDQ/BFfD7Lb3UqtFduaUfDdOK2OyPY73a0c057ZwQy89l5z+ZJ4mWqpruK1AB4jOrQvJgwFFRL5BUYMoHt5w16jxD2RdxaNaMB1bkELTZ2INqUOImm8x5N6nI/KL6w/vjQSes97iX/Q8hkXtWSx2C0aKVLLuCrs51VhiPFkAYq+CF0KUeg9o9jlSKXCwcXKZZpWRYsn8RomCkmfSTXKss2ZaVtvnXrdu90a0ugEsF8leZMa2M/jDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PglV2L2puQ0zcIvuq4ldX0EDLk/nhmHVWagC8X/rPSc=;
 b=nAZJ4T4qb5EOIFrl/tK89shP1wMIueMAfCmXMOr7fbHuFFGSGRr9zbZvuirjimp9yoPjD9t42KGZYxHbYCk7kr/wzGS9zsTh/MfH3VwoKwPD4SA7yEwOQJjVmsqWwWF8H+rASzNqQHnRC90a+pg7OCqJbKlSQO7k7CeLvKoWl203u8f8SgfcyGDUWDugN38g0MK8X0a7enqSlc48lseJg4r+PHSMDEmWLXtgBhBPWwc06jIWX6EWW8a2h6AF1BZ3D4O34SPR59rwwqAtKg1SC71DUJq6PvWVOtjdCV3zhFs7XX3WcBAzgz5FfPjZuNl5FPckH6p9n0jtgM+s8YAN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SJ0PR11MB5056.namprd11.prod.outlook.com (2603:10b6:a03:2d5::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.22; Fri, 28 Feb 2025 12:57:02 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%7]) with mapi id 15.20.8489.021; Fri, 28 Feb 2025
 12:57:02 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Bhatia, Aradhya" <aradhya.bhatia@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed actions
Thread-Topic: [PATCH 1/2] drm/xe_migrate: Switch from drm to dev managed
 actions
Thread-Index: AQHbia1mIZnwzBm7s0uFGGpRmrBRbrNcgdiAgAAN9oCAABVOAIAACA2A
Date: Fri, 28 Feb 2025 12:57:02 +0000
Message-ID: <7238c8a392fc5fb4ce297cd85dacf8ef2b342669.camel@intel.com>
References: <20250228065224.320811-1-aradhya.bhatia@intel.com>
 <20250228065224.320811-2-aradhya.bhatia@intel.com>
 <1b66c78c-82d4-4002-9fa4-6f30e97e0268@intel.com>
 <3a74a434957fb52ebcc36a4d5b88e8428ac2165f.camel@intel.com>
 <1bb4be8a-8058-4066-b447-1af29cbb46c0@intel.com>
In-Reply-To: <1bb4be8a-8058-4066-b447-1af29cbb46c0@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SJ0PR11MB5056:EE_
x-ms-office365-filtering-correlation-id: c8141759-0217-494b-9278-08dd57f7652e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TDRMMnZTUDk0UW82eDF1c3pGcmdIdTZtdTZ6ZVlBdjRWS1JHbjZ4TzlkZVBw?=
 =?utf-8?B?R3lUMzlDVGw0dytjQW1Ta0ZvcEVIZnNaaHE3bk8wQmgyRmNpWWJ4NmVkemFw?=
 =?utf-8?B?ZG9OQ3Rjd2VmVnRIVjhGazNjUk95K2JVZUxlZ2ZTMVUrSkJzb3FOdnRJdXor?=
 =?utf-8?B?eEV6a1F4aHVWN1Y0bVVmUUI2UUNwc0ZqV3YycmZSVHJ3LzBucTdxbTR3NFZr?=
 =?utf-8?B?NUVLUEkvU0VnUU5ldURvUGRTL1B2ZS9BU2JJMWRTbWxHR1Q4ZXpkMjVsaXBY?=
 =?utf-8?B?Tno4MjZXTnRPMjhjaGVUQ2l1dEZtQ3ZmdmYzMTZ3OW9NZUhKay9aSWhIZkxt?=
 =?utf-8?B?RDZuM2VoMktPQVllS082RG1aR2tBU2cxWE1QeHJCSHVZOEpELzdGNS9WK3N3?=
 =?utf-8?B?cGhod0FaL1ZZTGpGN3p3aUh6dy9iOVlSOHZjK0pvVG94Znl1UEpnMkR5Z04w?=
 =?utf-8?B?eGJGUzhadlFWV2poT3JrejFlTnp0OGVFdFhQVzV3eUFnbUhIUW4zT3lsZkg5?=
 =?utf-8?B?cXhqQXBjaGNQdzBmUzI1QW5ZWDg2akFXd2xRczdsYzNRaVBMZFBxellOcDhw?=
 =?utf-8?B?UVhpUk5nMy8xaTN5YzZXOGc3alppSUFqQW16Sm9wU2toaUlpQkthakNvMytK?=
 =?utf-8?B?cUorQ3AraW5sbHd2TVFDS3NyWGRXMS9RR2tsWDFhdUhjTSt1Mmt2NERleldi?=
 =?utf-8?B?Rk93bnVtM2JBMHQxOCsyWTRTZW9Qd1M1WFZkQ2tTbWd5R2FKYXZvOHRta1pE?=
 =?utf-8?B?WVc5Y2dGZU1sT1Rtbm5HRXdpcGpRczFYczlMVkdBOE04Z0hLVmpiaUpzNU16?=
 =?utf-8?B?aVd0QmlncUx0N1NrUTVORmt1ZUEzODc5dlpiS2p5RitkNUJmR2JwcnNpVGVx?=
 =?utf-8?B?eERPZG9wczl5allRMVZvcUFmY2FrQjA0QzhyaEpqcklaWTRYdENxVU5kaDFa?=
 =?utf-8?B?VGs1aUNCbWU1Vm51clFTUndFbjBTaDdQQ1pteU5oc0pFampxcVVUNXJnUnhJ?=
 =?utf-8?B?SDU4YWNXMXlpejN5TzVCQWVOYno1RExKbXFQVUp1eUZPM2dxb0pqU3hrS2pF?=
 =?utf-8?B?ZEJjK1cyeitqdytzTVhRVjBkV2xaUmlLcGtRN3QwVmxGeFJXaGpnQ2cyck1q?=
 =?utf-8?B?QU9ZcWZXeDNNd0k4OHVIWDVCTFN4MXRnNGtyL09Xb0VmNzZXV0Z2WXVVTjgx?=
 =?utf-8?B?QkdKRXJKR0VZN1dPVGxYOUVGWGZnSWlpejdJY3lKcnNGaFVKc3hkSnBaSnBy?=
 =?utf-8?B?S2ZVczdjR1FQTGlUYS9EejloR25PeEFsZFNRa0RQQ0dzVFdaekRQcXNyQTZk?=
 =?utf-8?B?dlFSbXN0N0xuQTVaOVQwTWRKMEluRWNJWnZzeWttV0o5NjFGN1BhR1Z5elUy?=
 =?utf-8?B?cG9qUlZNcHlIdUljeTNuTDgwa2c0dDMrU2xJZ3pMdlJYRVlUNS81WCttQTBV?=
 =?utf-8?B?WDBQSTgwbFZrL2QvWFBrbDZneUlyU0I2N2duUHZUZGxnYXZlandaUE5MOGt3?=
 =?utf-8?B?MUU1VmRlT2JMbUwvYmJGbzNQZE9YVHFYdVhUTWVNN08yc2s3UndLNy84Z0lx?=
 =?utf-8?B?UXdtSjE4ZjlubXdrOU4vQVhBTzY1OWlrNXl0QTNDN25KQURyUGc2M1F1ekF0?=
 =?utf-8?B?NktQdTRVRHd6RXVUVHY2YnlJR1dqeEk3RXErMGtLVDFpOEZkYm5SZ01rTmdw?=
 =?utf-8?B?NDN0RXBMRjF3ME5LM05RVnlUa1hsTnBTYVB1c1I0UDcrMkxqMTFWU2JIK1pO?=
 =?utf-8?B?aXQ0Z2N0MHJjaXBYeVozdDcvUU1wWDhNckRVOHNwY2QxcnNyTmpTWXoyL2dy?=
 =?utf-8?B?RWpjb3Vob2g1Z3RjQVpQNngyem9mSWNnSE1DZjdVUmdrTXZWOXJSSzROWG5I?=
 =?utf-8?B?ZFcxUUdPL2RqU09JNlREdmoxZHN3QVlWZjN4R0duc0FVdVhzcHowMkliOTdZ?=
 =?utf-8?Q?0s7ocRAGJOX/cU7GqCYvBH0OAyzqISRc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ay9LdjZiT1lzVFBXclVETzVmajF1MmVyaTh5V3VqUTQveDJUNGJwMzRkb21V?=
 =?utf-8?B?dXRpNzh4ZUlHV2NPYjNjZjJjVmIzakxjWWRabVo5U1ZCdDFqMFVjOTlVUzF6?=
 =?utf-8?B?czZUbVJnQ0p6SEtKRld6YkRTNGJlU2p6L2tGTUFZUG1BYk1ROU5pVnpoUStP?=
 =?utf-8?B?Q1I2QWFXeHRZeTZRVmlUbzgrSDZJamR1R1c0akZhV0dTMzdNV21MK09wTUxw?=
 =?utf-8?B?TTVJc3hPSTlvQW5lWGNkcnV2TXF3anpvaEpvUjd4bEF6dVF2L1NnRVZyL2x5?=
 =?utf-8?B?S0dEMkFzc204OUp0VENCRXk3L3RqNndBam9FWllEd3c4ZlBWUjNLYzNGamZP?=
 =?utf-8?B?QkJPMWxpT3F4YXE5bjkyWElGMjg0bm9XR1BHQkdKSDJwWmFvOTNmckRKWllj?=
 =?utf-8?B?VWV2Vi8xK29OVkE0dkVaSGlFL3pDdDBMOVh0YXdheW9adGRqeFB3MXgyQkRz?=
 =?utf-8?B?dThBTWxjVEVqUEtjcGtrL1BJNEZMTmdiUUZDYXhmU1BCUEc0Zk9XTmRjNFgv?=
 =?utf-8?B?UVo2eEdncmlDdS9aK3BGU05CbDdQa25GVjZZZUJhTGZOM0FiTlZpbG95dlFz?=
 =?utf-8?B?WnpHbURnbkNHMzZ0M3Q0VmptQXNuc2E2Y2ZOV0pKZ1M3dkdCY0YrdFBwLzFF?=
 =?utf-8?B?eWNIOE03dmxFckZWN3JHZzJzcXpwZW1qdW1uRmt2REp6aWsrYUJlV1NMMXhZ?=
 =?utf-8?B?Tisrc3BGRUVhVlFEV1o1SkhHNndaSytCZzQ3VjFNclJ2TElVU2hrS01SVnRP?=
 =?utf-8?B?b01XNjM4dlB4QlhZa0I4b1c3bHg0bWV3U25RSXJWTmRzcGRBTkRLeTg2QTBh?=
 =?utf-8?B?SkJxMW82TFVhZytFeDRsY3BIRyswNjNReDN2cWw1MWovR2x1NmtGV0pPZUJh?=
 =?utf-8?B?d21FdFg0QkhKenVvaysvRVRzRFY0WjZyY3hnbGN1dmhSVHVhUFhQaFZKK0E5?=
 =?utf-8?B?SGR4VHVua2pjaU5CYW16Vnh5OGtYekRyN0RlTXpINHFGcktBL25HS1BCQzky?=
 =?utf-8?B?NkMvK3FQQmpKOE5LRlAxaDhjZnQ5ZWI4d2kyWkVvazZmVGp0dktnRXZIZE92?=
 =?utf-8?B?bUZpTVFQc0h5clliM0pTbkhxcUpWK2pjTkY4SWlEMDVkTmxOMzVIc1J5Ukp3?=
 =?utf-8?B?Q1Q2Y2xTVnFxN3lpVHZFYkdBRHlQQXJvS0ZKdFFIVkRqeEZsTXJ5bTBQNzNt?=
 =?utf-8?B?RXA2dEJOSGJQSXBJa0dLTlU3SWdHRnVlMUtNbXo1YXFUM2J6Q3F3T1dJcU13?=
 =?utf-8?B?NExpZFY2OUlqL0Z0ZkxkZ3BEcWRMUUdHTEtrU1ZtdG5mbElGNE9Wc3VpOTRC?=
 =?utf-8?B?bVd2WTRCd0hXQ1RubHNXT0FvaE56cG5kRkRmR1Z2QUVxUFlDNlU3YXpEWUZQ?=
 =?utf-8?B?d0FZQUxxQUhzSFZKWlpXbnAxaktKaUFYSFI1ZDIvenFXM1pOc01ZY01QR0tQ?=
 =?utf-8?B?SVMyZFhaTGNuWGY5Wm5wajNiSWpwdUNnL1c4d1Y3TWJyYmZ1SmZucElsYVpC?=
 =?utf-8?B?Wk82NUY4QmJrcTk0dnVBd3R1UDNyYnNFYUUyeCt6c1dPWjJaVXZmQWx6NGpj?=
 =?utf-8?B?RkxWQzhTaFpPZkNKb29Ccmp2cTlSZmEvRVdkQ3BPTDQzT2VXa0FrOFVLd3FD?=
 =?utf-8?B?dVdLT2V0OWdyRGhPMHpwd25ITUMrQ01RZllZaGIwa3RPUXdONmFxc3BWMmtQ?=
 =?utf-8?B?V1F1MlRyYWZTR2R6dUZSdW9PY2dKVzNrZmdwalFlUU5NaGxjelhRQml4YThZ?=
 =?utf-8?B?NWM2TXJEeWlUWm5wRFdVcUlKeFU4K21zNXJNWithNzR2SHNVVmxDN0YreCtX?=
 =?utf-8?B?NmlnUUxRd2JGTTRoUGltdzhoemp0MVc1WHBwVmgzVWlESG1VcWI5UW9SVU83?=
 =?utf-8?B?TFVZUjlUOFBhOWs3WmM2dWRiaE56UFBEV0hMTUsxL2RvazNJTG8yMGg5TlFr?=
 =?utf-8?B?bTA4Z1YvRG9OSWp4UFhhU3RDMndWWE9VL3gxam95ZU1hWDc1eEV1WXAvZHQ4?=
 =?utf-8?B?VlFKTTlzNWN4NW1ySGpyQitOMS9hQWhVOEVOd2VnZEdjcVovbjFtc0s2aENB?=
 =?utf-8?B?Skh3eFlVbkoyT2phV0RGeG1MODhULzRuTnUyTXdBUzl3bVAzcHJzVTZ2dXF1?=
 =?utf-8?B?YzNFVjFlWk16WFk3aVUwTnE2QUJhZm9rMHVKQ2RzaUM0SkZtZy9NbDFhQks1?=
 =?utf-8?Q?02mv+se/qvXAlpkGGWj24WLxw7NyumW9f/dE1Z0Q2m7W?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <490AEC77CA766541BD21E24AB6F0B2EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8141759-0217-494b-9278-08dd57f7652e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 12:57:02.2038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7o633xsSeNPh/srb03OLVjUqu/nEvkvgHNQK0zUxcpjDPXv+EG3ZxZXwAKk+YhkZxkkdRHDaCQmJ8y0Z3KXOSj+U6zawlQduP9esLTelD64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5056
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

T24gRnJpLCAyMDI1LTAyLTI4IGF0IDEyOjI4ICswMDAwLCBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+
IEhpLA0KPiANCj4gT24gMjgvMDIvMjAyNSAxMToxMSwgSGVsbHN0cm9tLCBUaG9tYXMgd3JvdGU6
DQo+ID4gSGksIE1hdHRoZXcNCj4gPiANCj4gPiBPbiBGcmksIDIwMjUtMDItMjggYXQgMTA6MjEg
KzAwMDAsIE1hdHRoZXcgQXVsZCB3cm90ZToNCj4gPiA+IE9uIDI4LzAyLzIwMjUgMDY6NTIsIEFy
YWRoeWEgQmhhdGlhIHdyb3RlOg0KPiA+ID4gPiBDaGFuZ2UgdGhlIHNjb3BlIG9mIHRoZSBtaWdy
YXRlIHN1YnN5c3RlbSB0byBiZSBkZXYgbWFuYWdlZA0KPiA+ID4gPiBpbnN0ZWFkDQo+ID4gPiA+
IG9mDQo+ID4gPiA+IGRybSBtYW5hZ2VkLg0KPiA+ID4gPiANCj4gPiA+ID4gVGhlIHBhcmVudCBw
Y2kgc3RydWN0ICZkZXZpY2UsIHRoYXQgdGhlIHhlIHN0cnVjdCAmZHJtX2RldmljZQ0KPiA+ID4g
PiBpcyBhDQo+ID4gPiA+IHBhcnQNCj4gPiA+ID4gb2YsIGdldHMgcmVtb3ZlZCB3aGVuIGEgaG90
IHVucGx1ZyBpcyB0cmlnZ2VyZWQsIHdoaWNoIGNhdXNlcw0KPiA+ID4gPiB0aGUNCj4gPiA+ID4g
dW5kZXJseWluZyBpb21tdSBncm91cCB0byBnZXQgZGVzdHJveWVkIGFzIHdlbGwuDQo+ID4gPiAN
Cj4gPiA+IE5pY2UgZmluZC4gQnV0IGlmIHRoYXQncyB0aGUgY2FzZSB0aGVuIHRoZSBtaWdyYXRl
IEJPIGhlcmUgaXMNCj4gPiA+IGp1c3QNCj4gPiA+IG9uZQ0KPiA+ID4gb2YgbWFueSB3aGVyZSB3
ZSB3aWxsIHNlZSB0aGlzLiBCYXNpY2FsbHkgYWxsIHN5c3RlbSBtZW1vcnkgQk8NCj4gPiA+IGNh
bg0KPiA+ID4gc3VmZmVyIGZyb20gdGhpcyBBRkFJQ1QsIGluY2x1ZGluZyB1c2Vyc3BhY2Ugb3du
ZWQuIFNvIEkgdGhpbmsgd2UNCj4gPiA+IG5lZWQNCj4gPiA+IHRvIHJhdGhlciBzb2x2ZSB0aGlz
IGZvciBhbGwsIGFuZCBJIGRvbid0IHRoaW5rIHdlIGNhbiByZWFsbHkgdGllDQo+ID4gPiB0aGUN
Cj4gPiA+IGxpZmV0aW1lIG9mIGFsbCBCT3MgdG8gZGV2bSwgc28gbGlrZWx5IG5lZWQgYSBkaWZm
ZXJlbnQgYXBwcm9hY2guDQo+ID4gPiANCj4gPiA+IEkgdGhpbmsgd2UgbWlnaHQgaW5zdGVhZCBu
ZWVkIHRvIHRlYXJkb3duIGFsbCBkbWEgbWFwcGluZ3Mgd2hlbg0KPiA+ID4gcmVtb3ZpbmcNCj4g
PiA+IHRoZSBkZXZpY2UsIGxlYXZpbmcgdGhlIEJPIGludGFjdC4gSXQgbG9va3MgbGlrZSB0aGVy
ZSBpcyBhbHJlYWR5DQo+ID4gPiBhDQo+ID4gPiBoZWxwZXIgZm9yIHRoaXMsIHNvIG1heWJlIHNv
bWV0aGluZyByb3VnaGx5IGxpa2UgdGhpczoNCj4gPiA+IA0KPiA+ID4gQEAgLTk4MCw2ICs5ODAs
OCBAQCB2b2lkIHhlX2RldmljZV9yZW1vdmUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+ID4gPiAN
Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZGV2X3VucGx1ZygmeGUtPmRybSk7DQo+ID4g
PiANCj4gPiA+ICvCoMKgwqDCoMKgwqAgdHRtX2RldmljZV9jbGVhcl9kbWFfbWFwcGluZ3MoJnhl
LT50dG0pOw0KPiA+ID4gKw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2Rpc3BsYXlfZHJp
dmVyX3JlbW92ZSh4ZSk7DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV9oZWNp
X2dzY19maW5pKHhlKTsNCj4gPiA+IA0KPiA+ID4gQnV0IEkgZG9uJ3QgdGhpbmsgdXNlcnB0ciB3
aWxsIGJlIGNvdmVyZWQgYnkgdGhhdCwganVzdCBhbGwgQk9zLA0KPiA+ID4gc28NCj4gPiA+IGxp
a2VseSBuZWVkIGFuIGV4dHJhIHN0ZXAgdG8gYWxzbyBudWtlIGFsbCB1c2Vyc3B0ciBkbWEgbWFw
cGluZ3MNCj4gPiA+IHNvbWV3aGVyZS4NCj4gPiANCj4gPiBJIGhhdmUgYmVlbiBkaXNjdXNzaW5n
IHRoaXMgYSBiaXQgd2l0aCBBcmFkaHlhLCBhbmQgdGhlIHByb2JsZW0gaXMNCj4gPiBhDQo+ID4g
Yml0IGNvbXBsZXguDQo+ID4gDQo+ID4gUmVhbGx5IGlmIHRoZSBQQ0kgZGV2aWNlIGdvZXMgYXdh
eSwgd2UgbmVlZCB0byBtb3ZlICphbGwqIGJvcyB0bw0KPiA+IHN5c3RlbS4gVGhhdCBzaG91bGQg
Y2xlYXIgb3V0IGFueSBkbWEgbWFwcGluZ3MsIHNpbmNlIHdlIG1hcCBkbWENCj4gPiB3aGVuDQo+
ID4gbW92aW5nIHRvIFRULiBBbHNvIFZSQU0gYm9zIHNob3VsZCBiZSBtb3ZlZCB0byBzeXN0ZW0g
d2hpY2ggd2lsbA0KPiA+IGFsc28NCj4gPiBoYW5kbGUgdGhpbmdzIGxpa2UgU1ZNIG1pZ3JhdGlv
bi4NCj4gDQo+IE15IHRoaW5raW5nIGlzIHRoYXQgZnJvbSB1c2Vyc3BhY2UgcG92LCB0aGUgYnVm
ZmVycyBhcmUgYWJvdXQgdG8gYmUNCj4gbG9zdCANCj4gYW55d2F5LCBzbyBnb2luZyB0aHJvdWdo
IHRoZSB0cm91YmxlIG9mIG1vdmluZyBzdHVmZiBzZWVtcyBsaWtlIGENCj4gd2FzdGU/IA0KPiBP
bmNlIHRoZSBkZXZpY2UgaXMgdW5wbHVnZ2VkIGFsbCBpb2N0bHMgYXJlIHJlamVjdGVkIGZvciB0
aGF0DQo+IGluc3RhbmNlIA0KPiBhbmQgd2Ugc2hvdWxkIGhhdmUgc3RvcHBlZCB0b3VjaGluZyB0
aGUgaHcsIHNvIGFsbCB0aGF0IGlzIGxlZnQgaXMgdG8NCj4gY2xvc2Ugc3R1ZmYgYW5kIG9wZW4g
dXAgYSBuZXcgaW5zdGFuY2UuIFZSQU0gaXMgYmFzaWNhbGx5IGp1c3Qgc29tZSANCj4gc3RhdGUg
dHJhY2tpbmcgYXQgdGhpcyBwb2ludCAoZm9yIHRoaXMgZHJpdmVyIGluc3RhbmNlKSwgYW5kIGFj
dHVhbCANCj4gbWVtb3J5IGZvb3RwcmludCBpcyBzbWFsbC4gSWYgd2UgbW92ZSB0byBzeXN0ZW0g
bWVtb3J5IHdlIG1pZ2h0IGJlDQo+IHVzaW5nIA0KPiBhY3R1YWwgc3lzdGVtIHBhZ2VzIGZvciBz
dHVmZiB0aGF0IHNob3VsZCByZWFsbHkganVzdCBiZSB0aHJvd24gYXdheSwNCj4gYW5kIHdpbGwg
YmUgb25jZSB0aGUgZHJpdmVyIGluc3RhbmNlIGdvZXMgYXdheSBBRkFJSy4gQW5kIGZvciBzdHVm
Zg0KPiB0aGF0IA0KPiBoYXMgYW4gYWN0dWFsIHBvcHVsYXRlZCB0dG1fdHQsIHdlIGp1c3QgZGlz
Y2FyZCB3aXRoIHNvbWV0aGluZyBsaWtlIA0KPiB0dG1fZGV2aWNlX2NsZWFyX2RtYV9tYXBwaW5n
cygpIGR1cmluZyByZW1vdmUuDQoNClRoYXQncyB0cnVlIGZvciBtb3N0IGN1cnJlbnQgdXNlLWNh
c2VzIGJ1dCBleHBvcnRlZCB0aGluZ3MsIGxpa2UNCm11bHRpZGV2aWNlIFNWTSwgaWYgeW91IHVu
YmluZCBhIGRldmljZSB5b3UnZCBjdXJyZW50bHkganVzdCB3YW50IHRvDQptaWdyYXRlIHRvIHN5
c3RlbSwgYW5kIGl0J3Mgbm90IGZhdGFsIHRvIHRoZSBydW5uaW5nIGFwcGxpY2F0aW9uDQooc3Vi
amVjdCB0byByZXZpZXcgb2ZjKS4gQW5kIEknbSBub3Qgc3VyZSB3aGF0IHRoZSBleHBlY3RlZCBk
bWEtYnVmDQpzZW1hbnRpY3MgYXJlLCBhbHRob3VnaCBpZiB3ZSBmcmVlIHBhZ2VzIHRoYXQgdGhl
IHJlbW90ZSBkZXZpY2UgaGFzDQpwaW5uZWQgYW5kIGtlZXAgYWNjZXNzaW5nLCB0aGF0IHNvdW5k
cyBiYWQuDQoNCj4gDQo+ID4gDQo+ID4gQnV0IHRoYXQgZG9lc24ndCByZWFsbHkgaGVscCB3aXRo
IHBpbm5lZCBib3MuIFNvIElNTyBzdWJzeXN0ZW1zDQo+ID4gdGhhdA0KPiANCj4gSSB0aGluayB0
dG1fZGV2aWNlX2NsZWFyX2RtYV9tYXBwaW5ncygpIGFsc28gaGFuZGxlcyBwaW5uZWQgQk8sDQo+
IEFGQUlDVC4NCg0KWWVzLCB5b3UncmUgcmlnaHQuIEkgc3RpbGwgdGhpbmsgaXQncyByZWFzb25h
YmxlLCB0aG91Z2ggdG8gDQoNCj4gDQo+IEkgYmVsaWV2ZSB0aGUgcGlubmVkIEJPIGFyZSB0cmFj
a2VkIHZpYSBiZGV2LT51bmV2aWN0YWJsZSwgc28gaW4NCj4gdGhlb3J5IA0KPiBpdCB3aWxsIG51
a2UgdGhlIGRtYSBtYXBwaW5nIHRoZXJlIGFsc28gYW5kIGRpc2NhcmQgdGhlIHBhZ2VzLg0KPiAN
Cj4gPiBhbGxvY2F0ZSBwaW5uZWQgYm9zIG5lZWQgdG8gYmUgZGV2bSBtYW5hZ2VkLCBhbmQgdGhp
cyBpcyBhIHN0ZXAgaW4NCj4gPiB0aGF0DQo+ID4gZGlyZWN0aW9uLiBCdXQgd2UgcHJvYmFibHkg
bmVlZCB0byBkZWFsIHdpdGggc29tZSBmYWxsb3V0LiBGb3INCj4gPiBleGFtcGxlDQo+ID4gd2hl
biB3ZSB0YWtlIGRvd24gdGhlIHZyYW0gbWFuYWdlcnMgdXNpbmcgZHJtbW1fIHRoZXknZCB3YW50
IHRvDQo+ID4gY2FsbA0KPiA+IGV2aWN0X2FsbCgpIGFuZCB0aGUgbWlncmF0ZSBzdWJzeXN0ZW0g
aXMgYWxyZWFkeSBkb3duLg0KPiA+IA0KPiA+IFNvIEkgdGhpbmsgYSBuYXR1cmFsIHBsYWNlIHRv
IGRlYWwgd2l0aCBzdWNoIGZhbGxvdXRzIGlzIHRoZQ0KPiA+IHJlbW92ZSgpDQo+ID4gY2FsbGJh
Y2ssIHdoaWxlIHN1YnN5c3RlbXMgd2l0aCBwaW5uZWQgYm9zIHVzZSBkZXZtXw0KPiA+IA0KPiA+
IEJ1dCBhZG1pdHRlZGx5IHRvIG1lIGl0J3Mgbm90IHJlYWxseSBjbGVhciBob3cgdG8gKmJlc3Qq
IGhhbmRsZQ0KPiA+IHRoaXMNCj4gPiBzaXR1YXRpb24uIEkgc3VzcGVjdCBpZiB3ZSByZWFsbHkg
c3RyZXNzLXRlc3QgZGV2aWNlIHVuYmluZGluZyBvbiBhDQo+ID4gcnVubmluZyBhcHAgd2UncmUg
Z29pbmcgdG8gaGl0IGEgbG90IG9mIHByb2JsZW1zLg0KPiANCj4gWWVzLCB0aGVyZSBhcmUgbG90
cyBvZiBvcGVuIGlzc3VlcyBoZXJlLCBidXQgb3VyIHRlc3RpbmcgaXMgc3RpbGwNCj4gbGFja2lu
ZyA6KQ0KPiANCj4gPiANCj4gPiBBcyBmb3IgdGhlIHVzZXJwdHJzLCBJIGp1c3QgcG9zdGVkIGEg
c2VyaWVzIHRoYXQgaW50cm9kdWNlcyBhIHBlci0NCj4gPiB1c2VycHRyIGRlZGljYXRlZCB1bm1h
cCBmdW5jdGlvbi4gV2UgY291bGQgcHJvYmFibHkgcHV0IHRoZW0gb24gYQ0KPiA+IGRldmljZSBs
aXN0IG9yIHNvbWV0aGluZyBzaW1pbGFyIHRoYXQgY2FsbHMgdGhhdCBmdW5jdGlvbiAob3IganVz
dA0KPiA+IGdlbmVyYWwgdXNlcnB0ciBpbnZhbGlkYXRpb24pIGZvciBhbGwgdXNlcnB0cnMuDQo+
IA0KPiBTb3VuZHMgZ29vZC4NCj4gDQo+ID4gDQo+ID4gL1Rob21hcw0KPiA+IA0KPiA+IA0KPiA+
IA0KPiA+IA0KPiA+IA0KPiA+ID4gDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGUgbWlncmF0ZSBzdWJz
eXN0ZW0sIHdoaWNoIGhhbmRsZXMgdGhlIGxpZmV0aW1lIG9mIHRoZSBwYWdlLQ0KPiA+ID4gPiB0
YWJsZQ0KPiA+ID4gPiB0cmVlDQo+ID4gPiA+IChwdCkgQk8sIGRvZXNuJ3QgZ2V0IGEgY2hhbmNl
IHRvIGtlZXAgdGhlIEJPIGJhY2sgZHVyaW5nIHRoZQ0KPiA+ID4gPiBob3QNCj4gPiA+ID4gdW5w
bHVnLA0KPiA+ID4gPiBhcyBhbGwgdGhlIHJlZmVyZW5jZXMgdG8gRFJNIGhhdmVuJ3QgYmVlbiBw
dXQgYmFjay4NCj4gPiA+ID4gV2hlbiBhbGwgdGhlIHJlZmVyZW5jZXMgdG8gRFJNIGFyZSBpbmRl
ZWQgcHV0IGJhY2sgbGF0ZXIsIHRoZQ0KPiA+ID4gPiBtaWdyYXRlDQo+ID4gPiA+IHN1YnN5c3Rl
bSB0cmllcyB0byBwdXQgYmFjayB0aGUgcHQgQk8uIFNpbmNlIHRoZSB1bmRlcmx5aW5nDQo+ID4g
PiA+IGlvbW11DQo+ID4gPiA+IGdyb3VwDQo+ID4gPiA+IGhhcyBiZWVuIGFscmVhZHkgZGVzdHJv
eWVkLCBhIGtlcm5lbCBOVUxMIHB0ciBkZXJlZmVyZW5jZSB0YWtlcw0KPiA+ID4gPiBwbGFjZQ0K
PiA+ID4gPiB3aGlsZSBhdHRlbXB0aW5nIHRvIGtlZXAgYmFjayB0aGUgcHQgQk8uDQo+ID4gPiA+
IA0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBBcmFkaHlhIEJoYXRpYSA8YXJhZGh5YS5iaGF0aWFA
aW50ZWwuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gwqDCoCBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfbWlncmF0ZS5jIHwgNiArKystLS0NCj4gPiA+ID4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfbWlncmF0ZS5jDQo+ID4gPiA+IGluZGV4IDI3OGJjOTZjZjU5My4uNGUyM2Fk
ZmEyMDhhIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0
ZS5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiA+
ID4gQEAgLTk3LDcgKzk3LDcgQEAgc3RydWN0IHhlX2V4ZWNfcXVldWUNCj4gPiA+ID4gKnhlX3Rp
bGVfbWlncmF0ZV9leGVjX3F1ZXVlKHN0cnVjdCB4ZV90aWxlICp0aWxlKQ0KPiA+ID4gPiDCoMKg
wqAJcmV0dXJuIHRpbGUtPm1pZ3JhdGUtPnE7DQo+ID4gPiA+IMKgwqAgfQ0KPiA+ID4gPiDCoMKg
IA0KPiA+ID4gPiAtc3RhdGljIHZvaWQgeGVfbWlncmF0ZV9maW5pKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmFyZykNCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHhlX21pZ3JhdGVfZmluaSh2
b2lkICphcmcpDQo+ID4gPiA+IMKgwqAgew0KPiA+ID4gPiDCoMKgwqAJc3RydWN0IHhlX21pZ3Jh
dGUgKm0gPSBhcmc7DQo+ID4gPiA+IMKgwqAgDQo+ID4gPiA+IEBAIC00MDEsNyArNDAxLDcgQEAg
c3RydWN0IHhlX21pZ3JhdGUgKnhlX21pZ3JhdGVfaW5pdChzdHJ1Y3QNCj4gPiA+ID4geGVfdGls
ZSAqdGlsZSkNCj4gPiA+ID4gwqDCoMKgCXN0cnVjdCB4ZV92bSAqdm07DQo+ID4gPiA+IMKgwqDC
oAlpbnQgZXJyOw0KPiA+ID4gPiDCoMKgIA0KPiA+ID4gPiAtCW0gPSBkcm1tX2t6YWxsb2MoJnhl
LT5kcm0sIHNpemVvZigqbSksIEdGUF9LRVJORUwpOw0KPiA+ID4gPiArCW0gPSBkZXZtX2t6YWxs
b2MoeGUtPmRybS5kZXYsIHNpemVvZigqbSksIEdGUF9LRVJORUwpOw0KPiA+ID4gPiDCoMKgwqAJ
aWYgKCFtKQ0KPiA+ID4gPiDCoMKgwqAJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KPiA+ID4g
PiDCoMKgIA0KPiA+ID4gPiBAQCAtNDU1LDcgKzQ1NSw3IEBAIHN0cnVjdCB4ZV9taWdyYXRlICp4
ZV9taWdyYXRlX2luaXQoc3RydWN0DQo+ID4gPiA+IHhlX3RpbGUgKnRpbGUpDQo+ID4gPiA+IMKg
wqDCoAltaWdodF9sb2NrKCZtLT5qb2JfbXV0ZXgpOw0KPiA+ID4gPiDCoMKgwqAJZnNfcmVjbGFp
bV9yZWxlYXNlKEdGUF9LRVJORUwpOw0KPiA+ID4gPiDCoMKgIA0KPiA+ID4gPiAtCWVyciA9IGRy
bW1fYWRkX2FjdGlvbl9vcl9yZXNldCgmeGUtPmRybSwNCj4gPiA+ID4geGVfbWlncmF0ZV9maW5p
LA0KPiA+ID4gPiBtKTsNCj4gPiA+ID4gKwllcnIgPSBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQo
eGUtPmRybS5kZXYsDQo+ID4gPiA+IHhlX21pZ3JhdGVfZmluaSwgbSk7DQo+ID4gPiA+IMKgwqDC
oAlpZiAoZXJyKQ0KPiA+ID4gPiDCoMKgwqAJCXJldHVybiBFUlJfUFRSKGVycik7DQo+ID4gPiA+
IMKgwqAgDQo+ID4gPiANCj4gPiANCj4gDQoNCg==
