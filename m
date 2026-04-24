Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01EEFED3EF
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 17:06:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4A810E2E5;
	Fri, 24 Apr 2026 17:06:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iKvaOVHw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D695A10E2E5
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Apr 2026 17:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777050375; x=1808586375;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qLjZA/uLdyys8cDoj5gmA9uiwF5HR6mp34/aFQWP0cU=;
 b=iKvaOVHw/ZB+Ed2+ak9PTZeHeiiB7rKtdKM8xCOOE2kLMNIX7AuN1s+G
 w2fbRXOPAgt7Cxk1P2ha8G1ZT/YwMxyaaUfmyOZh3tyoMGfDkEfKPUtqU
 WJb4mKzcDSIivS82Q3rBPkOS0XKfbsuUVpOb+nA92Vjz5QhOKLEdxHSCU
 ByB1hFdSmH2raQ1tS8UV3K8WNad31ni3jHUpjiPn+522da3R2tk3Vyq+s
 8iXzXqFigUmDtH6SmFC0ShkvlU1akplHye9pcNP6t+41hN5LRnjAtrcvH
 NwDSZF4sFRm1qQFhz8C9XB9krQwj71h0TZ+D3b3T088X7VRKNBWCkoI7D g==;
X-CSE-ConnectionGUID: 18LAQemdRLuU7XyiBcCKQQ==
X-CSE-MsgGUID: 8N7FYda0TTKFFvijv4hOBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11766"; a="77943168"
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="77943168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 10:06:14 -0700
X-CSE-ConnectionGUID: BWM+Wg9oQTK42GPacdoqEA==
X-CSE-MsgGUID: IfIbxoY0TmutC2EbZum0gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,197,1770624000"; d="scan'208";a="230358588"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 10:06:14 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 10:06:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 24 Apr 2026 10:06:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.52)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 24 Apr 2026 10:06:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0L27k8MP1e6B3f6WntlQfzBtJOB4z4km5MiHvt56+M47e5eFgXoaSd2sIN9lLcPzNeRe2O78iToPGG6E1jJg40CjlbelbdH6fY8P9w6asxgP+kLCishqwe/UKy6XK3/gXjoh/UIlkz67gogpFrzSwenDBHy+iwSfHEJQgNpPd3Z1KuUInKtkdf+dBYYZ4OpcINs448/lvQ2g8Ov7PlKQ6mbxrsa7fGR/NEx3BpkfDX+IovJyfVp3CZlahDAgkYmspTwANEWXp+MrAjwHk7rdqfx2jzgGtT4GR3XDrdlHZ3n6gokuyAnpsqvUF7RAsRse1ct0TZmkTjJcbbxm5ZNow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLjZA/uLdyys8cDoj5gmA9uiwF5HR6mp34/aFQWP0cU=;
 b=KzZEXuvQPI2Pnn1LvttcbNt4Y+2zeR22vxwwyED/XbD2sXLL2xDOA+GlPrWIOmegtPZn6oSHsRf4Zj2njxfVG71x4w2gRJj6puBFXDgC6OHBFy9tbNNXMTCv19e4fb31e6eWdytiI2kM5PZaUoKAh/zzZqAnoCXNYtzTT+UrfgxSFq+znAWTJHoz/3fDgRLj4J24VTxyEndkaGoIkWOj3H+WbS9MRqQ0iAeTb9lJ/HlUM2U49z1hhI3vBlBhFeRMveK9s0x+TJy2ZAJIRzmv052sKdvQJtgJnzoDRlQG5t/nMwsASZ03nEuc87HWI2i2UDhia+8ne3nxgjY/hifMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CYYPR11MB8305.namprd11.prod.outlook.com (2603:10b6:930:c1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Fri, 24 Apr
 2026 17:06:10 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 17:06:10 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Kuoppala, Mika"
 <mika.kuoppala@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 09/10] drm/xe: Drop xe_hw_engine_mmio_write32()
Thread-Topic: [PATCH 09/10] drm/xe: Drop xe_hw_engine_mmio_write32()
Thread-Index: AQHc03N3HxcBgekI1kuwfUegF0RHmLXubu5w
Date: Fri, 24 Apr 2026 17:06:10 +0000
Message-ID: <DM4PR11MB54568ACD99D5AAD6B5360F3DEA2B2@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260423-engine-setup-v1-0-baa94014e3e5@intel.com>
 <20260423-engine-setup-v1-9-baa94014e3e5@intel.com>
In-Reply-To: <20260423-engine-setup-v1-9-baa94014e3e5@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CYYPR11MB8305:EE_
x-ms-office365-filtering-correlation-id: b5124f32-364a-4a60-446e-08dea223c889
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|38070700021|18002099003;
x-microsoft-antispam-message-info: ogrngVf2T0ZmtQO2KyWhMmGYCEnu85O6gFKaWW+P23Y3XN5EOhtTTrieD9nqwdXLFe9NmVJ+fiCKOyZetnAy8Byn81yZclm8yotNU3U0pz8IBeY2kVKl3pmYIm8bXtEbWUWN/5aiTWNXeppelZ5PFJvfZqcGq55ghSWvC+FbepwLmbxfjtD5HguQdKoQK3PcR8RwXiJ4rzT9GKFHHq6LuFKkY6j6SJWdPBEQS4EYaI/j/3WjNsH6zZcTCJtGWCh0X7qppeCzgXxnOt0jKRDoD9M4hrFExqcmMZxEVQZjfrXah9IOpXbazoiPphmKsv/pHLh19/QEA59fOXIGYU6O+EN8I6vUzdaYZnjlwNXAANeS9F2j/t9NBVA2nQOkFkdMLl2lghZMHJclJfMT2fkY3nCJAdb6qmurRgIuQKf8B9yuRicnLulthniP81nWQjNQGM61YhUBsyoSanksmONyGGPJ9x2gPJjyhcfxLdZNtLle9xcRt+Ue4iGZpRu6ogYzAV7bTmmjjFJeXl55PPETCLiLEVrju6Y2VyUSC4e7A+79pUcHRFc9+DSfQWv1LyxgOw8E29b2r3/c4XHDI6SVE4NZMQ4arZtM4xd0hxeOGKa4a+lX4zB42jZskl4NH7R/kd1DulRROc05LGBeozUnaZCvCseAmORGUNbK0gYjbEQ+Toch0j9QNYYdoFF6UP/PD6JI5+N98wof7imf73Rvph3oInXvNdm+8yMr0WR8ZPXmKaBUapAbJYE299h1C91ev/skKlOkbrL1x/SJMWOYX8EViPIphrIpIeuEARp7AR0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(38070700021)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTlTMVY1RUFaZnlDUXpSNHQrbUh4WE9ZeURvb2RBN2dYQ1dqcTV4SHUvVFVh?=
 =?utf-8?B?ZDZLTG1ITGRFem5Ednhtd2FBd1JQSmVVeldFaVd0M1dzWmJaRC9WTGY2V3FU?=
 =?utf-8?B?L2g5NkszYjM3ZnRRdUVraHZ1OSt2S1AxYXRuNytOOTFZUm1HNVBiVnhLYzJ4?=
 =?utf-8?B?OHZhN1F5WVp5LzNxMDQyWW56QTY3SmVRcjN3ZWpLaCs2ZU0yaFU2YlQ1U1lF?=
 =?utf-8?B?Wm1NamxLdVpMT0pDeXFSdkY0cFR3b2Y4WWV5R3JKbmFDUzNXSEhVSGw4SFdp?=
 =?utf-8?B?a2hDTHBMK3h3OERtbmJBejRjRHJUd1pLYWRCcUl4ZHBQblgxTTljbTA2UDMy?=
 =?utf-8?B?QVNsVWxtOUdCbUdOZnU5bHNSK1duSjlNRE5qbzRoQzhTN2FGdlNtK0NubTJ0?=
 =?utf-8?B?eER5YjRSaGVGY2lIanFqRzRKOUpQdjlFQ3FZbC81d3BmMXl4TEpYZ0NwSVo0?=
 =?utf-8?B?T3VCVEljNzJCWkxRVStyeGpVUTRCLzZ1REU3dVFpY1BDS2tNVlJDN3pVbE5h?=
 =?utf-8?B?SUFiWm4rV2RPOVc1ekhIR1pUWWFjMzNxV1JpT245aC9BQlVRYzJGekRYbVNy?=
 =?utf-8?B?WHJFbDQwWE1WQ21PQW1icHFqbUMyTFlISVRteEVmb1N4WTJ5RjdvMWtXSnRp?=
 =?utf-8?B?V0Z1UkpHMy9xRUhUNnJ4QUNxVURJU2crdnJ6ZnZqNzlURTJIL3l2eFBoMlRS?=
 =?utf-8?B?dXduNlJzSmZLTkU1Ui9MYlFFUUNtL2hoQW9Ldms2c3dkcitjZk03ZTYxZkxE?=
 =?utf-8?B?b1hNaVI5eWt2UkJuaTRpWmVWODgvME9VZWFKVzhqeUtwazNCc2VnRGFGb3F4?=
 =?utf-8?B?K2NmOFpkTkZpSmFuSmgzQ29oUHNod0RGSUIvcHVTRENHRDN6N3ZLdnVqcWlG?=
 =?utf-8?B?OThJT0pld216dURZdmVsRlJmekxHY1Q1bXNsbitHTE51VVZkSnNCM3JSakdE?=
 =?utf-8?B?akZRYlF3a3FxMmRSSjR5TThITHUvVUkzWWRVT205MTUvTTZnT2U2R3M2RzJr?=
 =?utf-8?B?OU9zcWJhMmR1anMrVFlQRzQ2cC8xcS9qTVA3TzVWbDZlNEtEODVTMEp6VENG?=
 =?utf-8?B?TEpUV3dsNlNUdkJ5bTdRcFBrQkNUbTB2Vk4vSmtlTGtWS3RTWU1nS0J5czFp?=
 =?utf-8?B?c2RaTnhvTEJFR1hxc1E3M0lidHMwcTl3WjIrSWVrZWxUSDlTVVBaRkVISGZM?=
 =?utf-8?B?YVEzU3NmZ3dpV2NIMzVwZE1nd0sxTk9ZZTNjQ2VaNmdnVlh2Tk50RnRZVTYr?=
 =?utf-8?B?NGhucXViSW1DUldqbW9BdmIyVzFtNFZrUWhHR0NjeG45RE5TY3NsK3R4OXhT?=
 =?utf-8?B?NWRjZElQekpPRDY5eC94UkFHb0syY201NlNmOEtFN3BvcU01VENiaTVCbXhX?=
 =?utf-8?B?OEc3Rm5qTzRBa0haN3lueitmcFFSVlVlWENzVFdkR0RMUGNHVjRjbnY2aVhN?=
 =?utf-8?B?MHkyOGNRdjFjR1J5M25oR2psQWZweEN1djRvYUVtQ1phVHhvS2dkdk1UVmd0?=
 =?utf-8?B?RzNGL2FTM2JQYmlvYTNvbGhQSndoTndIOGRndjNTa2ZKNGpKbmxkYnRFZUs4?=
 =?utf-8?B?WEtKaWhTTW5ocnR5QnNaTUdiS2hyQ1dSaU5TdFkzV3llTnBzUzEyaHdjT09p?=
 =?utf-8?B?QUFlRW5VMklqQmFCci9ETGUyZTY4VDU2eFBpcUsxTVBMa2V5VDBwM0g3L3RW?=
 =?utf-8?B?SDFCUkx6WUxjTTMzcGRpNStoS1ZQRzE3eHkwVDRPUDArOGd6U01OL0Flczhm?=
 =?utf-8?B?aSs0VU9ZWnloajMrY0lRRkxlWWJWeEpYZUpvV3NjTDZQVUhqbkcrTjZmZ2hB?=
 =?utf-8?B?NmN0V20ybzRLdTNCSmZvSzBpWXRKMHFGbFJydmJjbDVlekpMRkdCSFU2OFp4?=
 =?utf-8?B?YmkxYnhEaEVPSmpGRzJVMkhsVzRsWEtFWDM3UUxpdCtWbjBuZldyTVhRK1BB?=
 =?utf-8?B?NW1VOXcyNUplR25SdEtEQVlOQTVwWFFQM2J5a3VjVlJGK2hLek1BWExYejVC?=
 =?utf-8?B?d2RUWURqOWIxVTZmUDZqVHRsYUpYamRNbWlxSjlLZnFFeWZCTU8wREI0UVY2?=
 =?utf-8?B?U3d6eFhIYlpmWkZxQlkrSGpYRXZrdmVKTE05YU8xRFUzRWtVMFNTQ1FQSGtI?=
 =?utf-8?B?YzN1Y3FBMkhqUStWZFhQZTd6VFkzaHFPOVBsVkwxQ28rZnp1R3QvZ0xLZzh5?=
 =?utf-8?B?S2NNbTIwREVlRWYyWGFXZWR3a1cvS1grWUFtTzVVc2R2OXdEWlF3K0ZPbTVI?=
 =?utf-8?B?NUhHb2FUTmNpZnZrOUtsN1Fia2hKbEIrYnFaaW1QQ2Nxd1c3d2hpWUpObFZo?=
 =?utf-8?B?WG1Pak04WFJZaCt3USs4NGN0bHp4TFM0WERHZHBROHlNYzYxWGx3Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: M7a+SLpgi6pzFDGNLPveAJTi4a9+2BiP2hppa3Peu/GaWHnh2v8ofX8368XR/CdB6BoM6O6omUPC8l0hD6hCRIpaC/6XwAne2CgFoBLpNdaJKVplBG2JjJRptalK1orAm6rNkA6tdGfpG+XI+/xWBf8qTK64EHIMzEPbFCvrcabnqbajP170ist8twF+tyDz2IuJd4/xKzClfgB6HVOLwfRSRBikBPc+tJlJeY3Z/3DHXquZ3gdlvjQfkFgNL9nV79i3SCFC32UrqA+NGBC1CV81D4XUzGxJhnqn7tMvOM4uXb8+HpdUbh0IFSo7rusV9mHd4iwew69vIGhzNRVOdg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5124f32-364a-4a60-446e-08dea223c889
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 17:06:10.4906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dofk5Z5hsW6MhJbKZIb+PD2vIC2o9rO4SR3w44dCtzkZMAZP9z9pug1uMCNavnBrcpThbUDfj59NZA9s0KirRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8305
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

T24gVGh1LCBBcHIgMjMsIDIwMjYgMzo0OSBQTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiB4ZV9od19l
bmdpbmVfbW1pb193cml0ZTMyKCkgaXMgb25seSB1c2VkIGluIGEgc2luZ2xlIHBsYWNlIGFuZCBp
cyBlYXNpbHkNCj4gcmVwbGFjZWQgYnkgYSByZWd1bGFyIHhlX21taW9fd3JpdGUzMigpIGNhbGwu
ICBSZWdpc3RlciByZWFkL3dyaXRlIGludGVyZmFjZXMNCj4gYXJlIGFscmVhZHkgY29tcGxpY2F0
ZWQgZW5vdWdoIHdpdGggTUNSIHZzIG5vbi1NQ1IgaGFuZGxpbmcsIHNvIHdlDQo+IHNob3VsZCBh
dm9pZCBhZGRpbmcgZXh0cmEgd3JhcHBlcnMgdGhhdCBqdXN0IG1ha2UgaXQgbW9yZSBjb25mdXNp
bmcgd2hhdCB0bw0KPiB1c2UuDQoNClRoZSBjb2RlIGl0c2VsZiBMR1RNLiANCkJUVywgdGhlIGZ1
bmN0aW9uIGRlY2xhcmF0aW9uIGluIGhlYWRlciBmaWxlIGNvdWxkIGJlIHJlbW92ZWQgYWxzby4N
Cg0KRnJvbSBnaXQgaGlzdG9yeSwgaXQgaXMgYWRkZWQgZm9yIGV1ZGVidWcgY29kZS4gQWRkIG9y
aWdpbmFsIGF1dGhvciB0byBjb25maXJtIHdoZXRoZXIgaXQgaXMgc3RpbGwgbmVlZGVkIG9yIG5v
dC4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+IHhlX2h3X2VuZ2luZV9tbWlvX3dyaXRlMzIoKSBkaWQg
aGF2ZSBhIGZvcmNld2FrZSBhc3NlcnRpb24gdGhhdCB3ZSdyZQ0KPiBkcm9wcGluZyBoZXJlLCBi
dXQgdGhhdCBhc3NlcnRpb24gd2Fzbid0IGVudGlyZWx5IGNvcnJlY3QgYW55d2F5LiAgSXQgd2Fz
DQo+IGNoZWNraW5nIGh3ZS0+ZG9tYWluIHdoaWNoIGlzIGN1cnJlbnRseSBzZXQgdG8gWEVfRldf
UkVOREVSIGZvciB0aGUgQkNTDQo+IGVuZ2luZSwgZXZlbiB0aG91Z2ggQkNTIGVuZ2luZXMgcmVz
aWRlIGluIHRoZSBHVCBkb21haW4uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0IFJvcGVyIDxt
YXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV9od19lbmdpbmUuYyB8IDI1ICsrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9od19lbmdpbmUuYw0KPiBpbmRleCAxNTQwNzMwMjdiNTEuLmEyYTJiMjk2YWY5MSAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3X2VuZ2luZS5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od19lbmdpbmUuYw0KPiBAQCAtMjgyLDI3ICsyODIsNiBA
QCBzdGF0aWMgdm9pZCBod19lbmdpbmVfZmluaSh2b2lkICphcmcpDQo+ICAJaHdlLT5ndCA9IE5V
TEw7DQo+ICB9DQo+IA0KPiAtLyoqDQo+IC0gKiB4ZV9od19lbmdpbmVfbW1pb193cml0ZTMyKCkg
LSBXcml0ZSBlbmdpbmUgcmVnaXN0ZXINCj4gLSAqIEBod2U6IGVuZ2luZQ0KPiAtICogQHJlZzog
cmVnaXN0ZXIgdG8gd3JpdGUgaW50bw0KPiAtICogQHZhbDogZGVzaXJlZCAzMi1iaXQgdmFsdWUg
dG8gd3JpdGUNCj4gLSAqDQo+IC0gKiBUaGlzIGZ1bmN0aW9uIHdpbGwgd3JpdGUgdmFsIGludG8g
YW4gZW5naW5lIHNwZWNpZmljIHJlZ2lzdGVyLg0KPiAtICogRm9yY2V3YWtlIG11c3QgYmUgaGVs
ZCBieSB0aGUgY2FsbGVyLg0KPiAtICoNCj4gLSAqLw0KPiAtdm9pZCB4ZV9od19lbmdpbmVfbW1p
b193cml0ZTMyKHN0cnVjdCB4ZV9od19lbmdpbmUgKmh3ZSwNCj4gLQkJCSAgICAgICBzdHJ1Y3Qg
eGVfcmVnIHJlZywgdTMyIHZhbCkNCj4gLXsNCj4gLQl4ZV9ndF9hc3NlcnQoaHdlLT5ndCwgIShy
ZWcuYWRkciAmIGh3ZS0+bW1pb19iYXNlKSk7DQo+IC0JeGVfZm9yY2Vfd2FrZV9hc3NlcnRfaGVs
ZChndF90b19mdyhod2UtPmd0KSwgaHdlLT5kb21haW4pOw0KPiAtDQo+IC0JcmVnLmFkZHIgKz0g
aHdlLT5tbWlvX2Jhc2U7DQo+IC0NCj4gLQl4ZV9tbWlvX3dyaXRlMzIoJmh3ZS0+Z3QtPm1taW8s
IHJlZywgdmFsKTsNCj4gLX0NCj4gLQ0KPiAgLyoqDQo+ICAgKiB4ZV9od19lbmdpbmVfbW1pb19y
ZWFkMzIoKSAtIFJlYWQgZW5naW5lIHJlZ2lzdGVyDQo+ICAgKiBAaHdlOiBlbmdpbmUNCj4gQEAg
LTMyNSw4ICszMDQsOCBAQCB1MzIgeGVfaHdfZW5naW5lX21taW9fcmVhZDMyKHN0cnVjdA0KPiB4
ZV9od19lbmdpbmUgKmh3ZSwgc3RydWN0IHhlX3JlZyByZWcpDQo+IA0KPiAgdm9pZCB4ZV9od19l
bmdpbmVfZW5hYmxlX3Jpbmcoc3RydWN0IHhlX2h3X2VuZ2luZSAqaHdlKSAgew0KPiAtCXhlX2h3
X2VuZ2luZV9tbWlvX3dyaXRlMzIoaHdlLCBSSU5HX0hXU19QR0EoMCksDQo+IC0JCQkJICB4ZV9i
b19nZ3R0X2FkZHIoaHdlLT5od3NwKSk7DQo+ICsJeGVfbW1pb193cml0ZTMyKCZod2UtPmd0LT5t
bWlvLCBSSU5HX0hXU19QR0EoaHdlLQ0KPiA+bW1pb19iYXNlKSwNCj4gKwkJCXhlX2JvX2dndHRf
YWRkcihod2UtPmh3c3ApKTsNCj4gIH0NCj4gDQo+ICBzdGF0aWMgYm9vbCB4ZV9od19lbmdpbmVf
bWF0Y2hfZml4ZWRfY3NsaWNlX21vZGUoY29uc3Qgc3RydWN0IHhlX2RldmljZQ0KPiAqeGUsDQo+
IA0KPiAtLQ0KPiAyLjUzLjANCg0K
