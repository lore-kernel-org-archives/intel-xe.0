Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6398CCD194
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 17:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 685AF10E8AA;
	Wed, 15 Oct 2025 17:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPlBtzT7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B2D10E8AA
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 17:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760550931; x=1792086931;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GRK/luH1ty2f+Sw64Ms5t3BlJzYAzImhZ4xGdEQYS6I=;
 b=aPlBtzT77qPRTOWwkQPjyCvT97E1AtEhzsqBNXJ/m9AMyR9ABt3PpFcG
 Xe6RN/ABemANZF1+WJCBEpM9y6v86kbzW0BaivsJk1/2yaRHS7+ACwgCn
 0Ww/WDZ1zvo/vdQfBCCQ+PpruvF8l7VNmlaqbW5PHVufrTQaL9PHmCB55
 xVVY7GmFaGJiv+h8xlceZTq/sc/+4VRU8MfD4VAKvjYK8ZnVcgxtXguOs
 5jT/QUz9/9A7uANdooNgC9YCi+NgCkiY0LDx1smLz+3QpSJw2389/PmYb
 dx4XnJCX1nkN8oW5/CBXefzCkwAWh5Dl//WMI9JuCXmNca7IPaYiET7i0 w==;
X-CSE-ConnectionGUID: 98LJMGfATVak8uCUy3xUQg==
X-CSE-MsgGUID: DXLC/Z3gRJeKoqYyBER47Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="61942293"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="61942293"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:55:29 -0700
X-CSE-ConnectionGUID: XKBUPUgUTFy1QLpQ5rdY6Q==
X-CSE-MsgGUID: iJ+AbZTOQq+h0rRduJa8OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; d="scan'208";a="219388374"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 10:55:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:55:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 10:55:28 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 10:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=otlkilvVYdSMN7dMg2sIkmqJ+R7ktkhgkby7LBzmx8UuBiHXbsugftaGtZhWQVxd3rPhwbJMDMmFu/Rlhwjo/G70OwIHZoJHFkpa6yu7OOIf5Vq3oui4EN7QwF0ty8tgA2EyTeKAo5ul4qGGMEH2vtTauXEZouuBRSj7N9kxpACNaTxNndyb3Ld7gdg5Y6T3djgJrWJb+8SLUFH+gGTef3F0pkxp2tiJty6S7wZn8MLud1NEtWQPdGIFsLYnAxKonQedemqdotijk6x6AO02KykooDhujyy+jEHVoZCoH5TZ5j/TmiEru18EXqcPgeCnQRZ6gerdkVL9L5LJmzRnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRK/luH1ty2f+Sw64Ms5t3BlJzYAzImhZ4xGdEQYS6I=;
 b=ujqChG2/r4S6qzgwIkwmh67YBM0kmI1qpnZGjXsu/tkKbmS0rVL/heNFXGbca74IHzn++vlqDs68R9S+DA6DNK3uL4i67WKEPHrY2iad2DK8Bb/Gq6jeRJhM2SLzVTiRhM+Goj23N2J3op3gSanIxJ+43FSBkeWrFfkz9s1dUabXu1zHvLDkipvpOHvHLvNr6hECKmKdrn6yR5kQkjpUn5Hz2bXmpJoz1OqsBs7VxM6iNh0sjnrwmKOtcEAhrcWCJ3VAEwNvUj0rQIiF75EnsauoWbVyWw2/8PNiivKNAH3Ym1infLzWa7P0pbzqO4ygm8HS24YJ9QorF0fELZlheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8122.namprd11.prod.outlook.com (2603:10b6:510:235::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 17:55:19 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 17:55:19 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 5/6] drm/xe: Correct migration VM teardown order
Thread-Topic: [PATCH 5/6] drm/xe: Correct migration VM teardown order
Thread-Index: AQHcPTW4MFwZV5488ECbt8YgGDP8fbTCY2QAgAEb7AA=
Date: Wed, 15 Oct 2025 17:55:19 +0000
Message-ID: <57cb5cea85a3eeed85a1c003a99196854663a118.camel@intel.com>
References: <20251014180927.105077-1-stuart.summers@intel.com>
 <20251014180927.105077-6-stuart.summers@intel.com>
 <aO7x2n5BKTY1toLJ@lstrano-desk.jf.intel.com>
In-Reply-To: <aO7x2n5BKTY1toLJ@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8122:EE_
x-ms-office365-filtering-correlation-id: a4ea15e8-3016-44e9-f180-08de0c14013e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Yi9wWms0RTlkRTE0bGRNem5nZFo0WlRWRjJndnNtR09ONDJscmJKZC9pL1hR?=
 =?utf-8?B?T2JJbTRDRlF4MGU1Y0JpeGFaajhjSThNcFI0MnV5c1ZmTlc2R05tL2locmhn?=
 =?utf-8?B?dVFlWjJ4ZERoRVEyUy94OW9PNHBTWExQTFJ5a2pBSmZHM1Z0UHZycyt1RWZX?=
 =?utf-8?B?dnBSRXVMZUg0SzJCU29sUFlFclJLLzNISHYwZncyb0tzck5kbTdxdmlrWFdr?=
 =?utf-8?B?NHVJWkRvQlJNaEVhdjZqbmx0WVZrTUlkaXoxQnNmOTZFcnFjMytSMFQybGRm?=
 =?utf-8?B?d3hWS3dkbXlTdXEvbUtLTTBVTm8wYWpFSVlHU3B2ZVJQdVZUOE54cWJ1eC9s?=
 =?utf-8?B?ODhoSWg5Rk1kZmZzNFVONWIwLzdFeUIzVERIdkJDVGdGYWJzV0ZLTnJhUWFk?=
 =?utf-8?B?OWF1dlp2a1BYR0VjZ2s3OFJBakxyVUxnaE95bVVpU0d0S3lDWVZCNkZUKzB5?=
 =?utf-8?B?Z1diZFZ2ak82L0NqU00xWW9paWp5bDZKOWwybVBSbFEyM1RuNHYzSWlOK25a?=
 =?utf-8?B?SkRsQlFkaHFLR2Jyc3cvNGN5cEdMWTY1dkRzK3YrWTJlT09NQWl1KzQ2dVVh?=
 =?utf-8?B?VzNqTzc3Mjh0NGdQak1NalFoK1VzSE9WS2xlbndkTmxHZURuK2VRVkQ1dm5h?=
 =?utf-8?B?TjBJeCtwWmhyVHRtZnZMZWt0QnlKODc3ZDZrbkR0UDBOWXBobzE5ZzIyWkp6?=
 =?utf-8?B?WDJLNVp6TmhsM3JHMk14dFU3cmlyK1Q5UmVORGhjUFNlemdPT094aXRPeG15?=
 =?utf-8?B?MDNicUJxU0VZYXduRzZiZVZ6c01tYlU0TjVnNVBsWFpNZG1zYlRrakZ5R1dN?=
 =?utf-8?B?R2RjT0VrQVp6NUE2ZHVacU96WThmcXdyOEVPbHg4L2VoZGxrWHdyM3hSVmxT?=
 =?utf-8?B?UDVacm82RTBCK0lHT2lZK29Ic0hJT0d1WTZ4QVVpcmNHRUxPY3dwR0Y0SWFS?=
 =?utf-8?B?SVpNQ3VBMFNaaTBKMmlWZUVKOGxtdUFtSDdUYXI5K3pqWGQ1Yktxb1k2Nkhp?=
 =?utf-8?B?ODBKRWkvTW9aSUYzeFpSaGlDNzgzMDZuYTFpUVMwdmpqRjBCeHpHSGZuN0ZU?=
 =?utf-8?B?dTZhaElSWHovZkdQOHJaMVZ6MXI0Wno3d2FqTExBSU9HVS9JRnFGVVc1YlZH?=
 =?utf-8?B?bmhsTGhLMVVqZFJIb3RyVDlsam5hMlpEMXkxOGl1bXE5RCsrQWFMSXluZ2Ey?=
 =?utf-8?B?MFh0Ukt3Vzd0Vjk3aE84NjdvQVVac1ZOeTFRdXBUOTByZWMxRGg1bEIwMEcx?=
 =?utf-8?B?RC9RWElDa2poVVZSR1kzbGJoRE56MGE4SG9Dalc4VG9LdkpWaUJkSWFQUDF3?=
 =?utf-8?B?R2RhZW54V2J0ZWNnbFVvYmRaL3pvemE1Vmc1ZGNVMmJIYTJmZlQwVkU1NEEw?=
 =?utf-8?B?T2JBVDA4SUszcjArZ2pkYUxzWW0rUmxoUFdKbmVwbTQ3ejBnVVlidHRZanpM?=
 =?utf-8?B?bU9ER1duM0liNGdNWHdQNU81YXVRV3hYdkRabFlHYUkwOENTRDU1TDQrdE94?=
 =?utf-8?B?WkQ4U1c4SHU1ZS95QU04dkIzRzBqUUV2dUtRS29wR1FjbVFzcmxtZ21xZzE2?=
 =?utf-8?B?UGdZcFdSK2MxQWZFV2luK25ZMDhCSGpvbmVFbkNGd3BETStXQVFZeXcvZWtl?=
 =?utf-8?B?MmRUbVh5VTFnT3RDVldRdWNjTngxWHJPL3h5UWQ3TVZzb1pqa08vYWp1SEhj?=
 =?utf-8?B?amw1YXBweWhobFNXRUtCWkFabzluTVVnR0IrK0lJU29XLzZxZ014VmtHNDBS?=
 =?utf-8?B?akFmYzBiSGZ4akM4MHg3amJ4bXVwSFZyTDBuTDN1bUZ1czZNb1pqaWRCbm9Y?=
 =?utf-8?B?SVQ1UWt0b2dtRW41UmdURXQyMmZTYTlKQ0hNSndGbER2ZGUvcys5dGVIUzJz?=
 =?utf-8?B?cUpaOEdQNEV1UGNhallCcTg1RVUweGlPcFpYbHlnTEc5d2h4NHFUdW1tdjF1?=
 =?utf-8?B?WWx1MWRHUzdVOUhLdVlCR3dld3J4WWFVeVJJdzUrL2haVGMwSzYrMDRQMW0z?=
 =?utf-8?B?UWUxN1NNKzdtOHRCMHkxcGErL0doUzNod3VMUXR6cmlSNVdsbDRSUDJ0cUw1?=
 =?utf-8?Q?90MLXd?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWV6L3hRM01FM1JzRzE3dzhwVzJIS2NNaDBEVkN2VE1KMCtLSUttKzl4V2Vs?=
 =?utf-8?B?U0x6RkRvcDlLaTFvR2lFdzVteHIvTFdsWTZxd2ltbXFpNnAzNlpjQkU3d3lt?=
 =?utf-8?B?NjlCRFExZVp6emtLaVBXL3NEUHpXbWtEb3UrcTM3SmVZNm9QSmVQL2VhVEMx?=
 =?utf-8?B?SnVaT2Ntbm1yYjhEbDluZ0NlSjNCajlFRnQzV1VWVzEyOWRhSGdUY0NrbUhC?=
 =?utf-8?B?cktsQytyOXlHWXBEYXR5aEdNQklJbldabEQ5YnNDS3d2d3oweDYwNG1KNE5z?=
 =?utf-8?B?NEIxcTFtVFg5MzRMQ1lpaDZ1SWNudEhRVUVlOTVaODBlUHJwdE5MTUV4bHR0?=
 =?utf-8?B?OUYwSkpkWmxSRjZpYWoxNTQxSlIyUlJITklMVnQvZy9lTDV6ZHlYakpLTmVz?=
 =?utf-8?B?U0FXOWJTdTNxRmNBZUEwbGZ4T3h2ZUtpdTEvc0orKzBaZ0xXZzFMam5oOXcx?=
 =?utf-8?B?cTdkQWdESGJ5NCtBbzNDQjkwNjJTRmhQNlZwL2VTeVhrcFJXOG1kYlFRZEJD?=
 =?utf-8?B?Z1FWK3lvaVJCQjZsdXJXYXdoSG0xMDhEMHZYOWNTbzVpdWJiWTlDUlVtSmtr?=
 =?utf-8?B?WWRTL09LL2Y1ZnU5eXpJNU8wUzhjTzNFU0dTUjJycW10TE14Yk5XTUFNSTdp?=
 =?utf-8?B?a0loRFFodGRBYWExSXU4OURwWkN5SzIxUGlPZnhMcjViZFBCVitvRk9DQWJy?=
 =?utf-8?B?dTJSaEpJRFZjUGhhR1NSQjBvcjByV3l1d3JKWGRpOFl0aEREUFBnaDA4YUpU?=
 =?utf-8?B?VzdXaFFpM3F4dUttcnZXa3ZQVUxpZGZmUitja05PaWJMMkt0LzJFNVJnczhv?=
 =?utf-8?B?UTFLRVNFdTA3eXFVRDk3ODd3Y0RmSitEaE8zWkVta2hNMVRmY3JWVWpnVnM3?=
 =?utf-8?B?ZXQzUndSZ2FPVnptK0ZHQXpvTFRiVGpNVXBCa1QvWFpuMXpncS8vaHNNQlEv?=
 =?utf-8?B?elJEUnFuSGc0Ty84OWFFVEtqRDJ6dFdnbFhmZFJ0bGZqUVFqTXBWM1VMN1Er?=
 =?utf-8?B?WngvdEFrWW5Dc1lCaEozT0RuU21UUTJONzJHZHBsMytqYklSTEtKNTFFdHNK?=
 =?utf-8?B?WVhXdWN4Zk4xQVVRTEFnV3cyaTRBMEdUK3d4NXM3cmV5QUk2bnZrZnl2dWxE?=
 =?utf-8?B?QWpNTmw0SFVhRGNkc3NBeUhzR2llbUx3RXYzYmRZSTViUUtUTzl6enJjQ3RE?=
 =?utf-8?B?bVNvL0xvdWs5TzlpNFkwK2VFTzhCSjVhemtQK2JEUVZZT1pyeFk5UUdnRDAv?=
 =?utf-8?B?bGNxdzJwVGtiZmo2dEhtemtNU1hCRk9aTnJSckxNeXhJMXhSUWJ1VXc1Wm9R?=
 =?utf-8?B?UjZ1dTVvaENncU1OajR3aDFCdHZiekIwMXlCcENzVHU3QmNnS1VyR1U2Nk5J?=
 =?utf-8?B?YnY3RnhDSjRVRUkwYk8rYmlQalUwQmtIQlN6S1hWZG1rS00rYktGOHRsQ2ho?=
 =?utf-8?B?UTNuTEZRb3laeUVCeXNKQjhKWXhmQ2grSWdQc1NHakloUlgrWlZwN0dPWEVn?=
 =?utf-8?B?NEFtY05TTFBmVVNENTlxSFI2UVczdlF5NWFlSE9yYzAxT3pOaW9NeGdSRVJK?=
 =?utf-8?B?RDVUUnpHS1UrRUNiTkhpbDQrSzZrcWo0bWxPL0hOSzIyVW50UHZJMVBtbDZu?=
 =?utf-8?B?NVM1UHlKY2JBbmNwVXFGeWhVVVZXQUUzRjVpTjZSZnNlVEZ4RmhTT1Uza3or?=
 =?utf-8?B?dVlhNUZuRjhZU2M4bWYxT0l1M1dHN1R4SkFuNmZSNFpieHF1d3RCTWluRXla?=
 =?utf-8?B?WkM3dEUzalYrSTcrQVNsUFRMcitSdUxieHN0c2JjL09mSE83dHU1a1k4TEVJ?=
 =?utf-8?B?Rldqb0xZRGROVndubi8rdHh4d0g4c0dyTDJCZWxKQTFiQnBQOW4vNWJNNzVE?=
 =?utf-8?B?c3YyYitlNFJYeEhxVU0rckhHZ2pFNWJTeTBEWGVJTUl6U2M2dUhoeVhOcmI3?=
 =?utf-8?B?cVRUZ1VSY25LOWtmSjh2UElFenNkdmhGVnpTU2U5aFI4QUVFeEFQczlwWThG?=
 =?utf-8?B?QzVaajYzNmhrRmp6WnUyZ2g1NFBCRVFkengyRU1ab0czeGRIODgwUkpKU0JV?=
 =?utf-8?B?UGx6VEd5M2hRTGFubThkVXltYlhUYlFLcytDMjF3ZUxCcTZYWjJsMVQ2OFFV?=
 =?utf-8?B?UFYwRUVaS1VPZmFoTlRIM21ZbWJMYTNaelhucFM2ekFsT1hHa29MbUVPY3E3?=
 =?utf-8?B?ZHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <621CBC33BFE25D49BE0C990780ED78CD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ea15e8-3016-44e9-f180-08de0c14013e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 17:55:19.2330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzceaCdrli2OEB9omb85AKSCH+xHES3680cxPEgWxI6aVDpy+PU4GhRFdwfw6faiyZwd86yj6B/WkS4bggvZCdB83PsTcAKIdoienB4ybA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8122
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

T24gVHVlLCAyMDI1LTEwLTE0IGF0IDE3OjU5IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBUdWUsIE9jdCAxNCwgMjAyNSBhdCAwNjowOToyNlBNICswMDAwLCBTdHVhcnQgU3VtbWVy
cyB3cm90ZToNCj4gPiBBZGp1c3QgdGhlIHNlcXVlbmNlIG9mIHRoZSBtaWdyYXRpb24gdGVhcmRv
d24gdG8gbWF0Y2ggd2hhdA0KPiA+IGlzIGhhcHBlbmluZyBpbiB0aGUgaW5pdCgpIGZ1bmN0aW9u
Lg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVy
c0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0
ZS5jIHwgMiArLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmMNCj4gPiBpbmRleCA3
MzQ1YTViNjUxNjkuLmIxNzQ3ZTQ0MmE3YiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfbWlncmF0ZS5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3Jh
dGUuYw0KPiA+IEBAIC0xMDAsOCArMTAwLDggQEAgc3RhdGljIHZvaWQgeGVfbWlncmF0ZV9maW5p
KHZvaWQgKmFyZykNCj4gPiDCoMKgwqDCoMKgwqDCoMKgeGVfYm9fcHV0KG0tPnB0X2JvKTsNCj4g
PiDCoMKgwqDCoMKgwqDCoMKgZHJtX3N1YmFsbG9jX21hbmFnZXJfZmluaSgmbS0+dm1fdXBkYXRl
X3NhKTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgbXV0ZXhfZGVzdHJveSgmbS0+am9iX211dGV4KTsN
Cj4gPiAtwqDCoMKgwqDCoMKgwqB4ZV92bV9jbG9zZV9hbmRfcHV0KG0tPnEtPnZtKTsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgeGVfZXhlY19xdWV1ZV9wdXQobS0+cSk7DQo+ID4gK8KgwqDCoMKgwqDC
oMKgeGVfdm1fY2xvc2VfYW5kX3B1dChtLT5xLT52bSk7DQo+IA0KPiBZb3UgaGF2ZSBVQUYgaGVy
ZSBhcyBtLT5xIGNhbiBiZSBkZXN0cm95ZWQgYnkgeGVfZXhlY19xdWV1ZV9wdXQuDQo+IA0KPiBJ
ZiB5b3Ugd2FudCB0byBzd2l0Y2ggdXAgdGhpcyBvcmRlcmluZyB0aGF0IGlzIGZpbmUgYnV0IG0t
PnEtPnZtDQo+IG5lZWRzDQo+IHRvIHN0b3JlZCBvbiB0aGUgc3RhY2sgYmVmb3JlIHhlX2V4ZWNf
cXVldWVfcHV0Lg0KDQpHb29kIGNhdGNoIE1hdHQgdGhhbmtzLiBJJ2xsIGZpeCBhbmQgcmVzdWJt
aXQuIERvaW5nIGEgbGl0dGxlIG1vcmUNCnRlc3Rpbmcgb24gQk1HIHRvIG1ha2Ugc3VyZSB3ZSBk
b24ndCBoYXZlIHNvbWUgcmVncmVzc2lvbiBoZXJlIGJlZm9yZSBJDQpwb3N0IGEgbmV3IHJldi4N
Cg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gDQo+IE1hdHQNCj4gDQo+ID4gwqB9DQo+ID4gwqANCj4g
PiDCoHN0YXRpYyB1NjQgeGVfbWlncmF0ZV92bV9hZGRyKHU2NCBzbG90LCB1MzIgbGV2ZWwpDQo+
ID4gLS0gDQo+ID4gMi4zNC4xDQo+ID4gDQoNCg==
