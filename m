Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F65AC3ABAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 19:41:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2265E10E054;
	Wed, 30 Apr 2025 19:41:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kvv5kUXc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E631A10E054
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 19:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746042074; x=1777578074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jw8HwENbbbgLFXIwBPoEzcqVgm+4HflI1xC381uGUY8=;
 b=kvv5kUXcMfrBjZFOdkQ6LkJzvadI4GV8LFrHwsnB7F0HmtyYc10llgEE
 uoXRgJ9CtRYVQFyfxBaTfg5lyzJ858ZTa/dquZIoZm0EqlzK6WB1P77Ny
 FtxNh7zy/pj1IwFL7xPw1IALZv08GurkxcZi/JJ/Ut95fOr3OjbEOZHHd
 6TF8KZWOf+94vsMn+OwnThi593KsqtWBRfXXnuNpbtqbBalwvDVS5tmWM
 nBd0aYVs1l86aKPhbTqSWr+JIwDPbtzPMF9Q3nhHsIEDwP7NI/AI8gfni
 nMoJMDjJGwbe9Cn+Zpw4l6uIr9vVLBNKCvy/mHnENrGdd/FeWUUrRh/ue g==;
X-CSE-ConnectionGUID: FZkRYX8wQKWdhKbVt9AP2A==
X-CSE-MsgGUID: 60Mn/OjyQm6wMQV0fBhsfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47434509"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="47434509"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 12:41:07 -0700
X-CSE-ConnectionGUID: 3XhLXawrTY+9KDUCSJrwdQ==
X-CSE-MsgGUID: 30DyC5KvT7Gxi2A1P2S/cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="139340244"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 12:41:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 12:41:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 12:41:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 12:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b52who8FcHs7GFjLefuPe7MttLrj08/ccIbhXiQZNXQQVILWm69mCDBtRoFEKQxZL++ULISfoFBdbID3TeFpg//jcO8CUzlkeefbvLl5ZDYYVBzF33ZSEqhu7aKBdDCmxsbrob8Yo2qNTJug6iZWv1AqQ353vc4FqbZ49V7Tthg7x38Q9PnC5K5Sqvbi06Uk0OKFbd5+fJC0pdvlvX3Grz6x5Eas0PeVwEJqi3cthXJ19YgcH7UdYOxnn+4dt3CPJrG2BHcjmetASzSvOXKL5gH6o1YlC9RoVjU385brqULIgf3Z8P+fi3d5XrB8+3X5N8uClzPasSkli9aTKLyIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw8HwENbbbgLFXIwBPoEzcqVgm+4HflI1xC381uGUY8=;
 b=t/IzSsjlH3ahz3sJDXPOufYIdXbL4gcF9sm3MAbsmLMIuXmdcAJH20w/rtsnHp1ARcO9p+4Cd6ln0STWwVf3WBkFvCIJa3xI6Ymtt6vO+DQYbs2YA4GS6O+vca6foBGsOSol0w4sfaW4Q8feUg0V8kjgZO2IUPpn7NGk3doyTvLViy4AXgnnlVVEy5wQbQ97TLuWvrEzqifIc3Oj9NSS/qusWk70C3Th/ext+gI+K9pd9+1f2hWvykwssTgbg5zY2dazymT6qOYAeE4kUkaohjo3+rKP6ZH7IiiHTFNMK66ebS2/o0OzTphn/Gx2EFba8E67BdflEHkUUW96BjWJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH3PPFE26A71A1E.namprd11.prod.outlook.com (2603:10b6:518:1::d58)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Wed, 30 Apr
 2025 19:40:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 19:40:49 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: Re: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Thread-Topic: [PATCH v4 0/3] BMG PCIe Gen5 downgrade attributes and usage
Thread-Index: AQHbtetrurZ24pDSkkWO4VNVg+PqJbO44EwAgACkUACAAAJVgIAAnyYAgAJ9nIA=
Date: Wed, 30 Apr 2025 19:40:49 +0000
Message-ID: <8b0ca59b5c5ed0cf5fb3efb844afa84fe3c39570.camel@intel.com>
References: <20250425140626.3082588-1-raag.jadav@intel.com>
 <aA9UlvQfo5-6-CtB@black.fi.intel.com> <aA_ebBh6mxsEJi1w@intel.com>
 <aA_gYVCQe1JEY_xB@intel.com> <aBBl4ukmZJ0b72dN@black.fi.intel.com>
In-Reply-To: <aBBl4ukmZJ0b72dN@black.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.1 (3.56.1-1.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|PH3PPFE26A71A1E:EE_
x-ms-office365-filtering-correlation-id: 2afe9edf-d735-4ceb-8b07-08dd881ee8d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1NYdVpLczMwM1ZMdXh1OTVyMWNrSWc3RlExQ2QweGxKd0pjRWlMNDdXcVgw?=
 =?utf-8?B?c1l0MWpqYWVMdEc2dlBYcE9ZQkpOdkhFS0pBeC9TSldXOWtPNjdqREpnTXNB?=
 =?utf-8?B?ZExKU2lQcFNPYTR1QTZHYTBtZStlYUtMYVptN0p4VS8yZEhCSnJsS2xaNkh5?=
 =?utf-8?B?ZXgxbGM2dWljMzUwWHhBQ3ZSRE45TVVsZXdneWJmODVSMG9IZk1NbkwrSzJE?=
 =?utf-8?B?TnpjZXN6bTY2d0lDOWg3bXVpUHN1QVBOT1NtT2tIU2w0UExnazlOeENpc1o3?=
 =?utf-8?B?NEFyaUVlZDJmTUwwSTlJZ0RmWnRkMjFBQTk3aUZzRjQ1Vit4QlZEb3UvM29H?=
 =?utf-8?B?cFduK2JkL0tiWmVCSVZQMzRzb2VEYlhLVmFvbkwvRXQxK3VKRmhEQjNxUXAr?=
 =?utf-8?B?U3lTaGNQTWY3bEp0c2t3K3dIUlF0akM1cWpQbEZxRFFLRWJ0SXl2YnFwV3pI?=
 =?utf-8?B?VzNqUWV1SW1YaUc2SDhzNFhNRi84Mm9PVXh3L0UrdGxzaVk0SGJJQzAwZnpD?=
 =?utf-8?B?U040dlBZTVdtZW5JYjU1TnJ6VjdiNmR6NFRld21lMkkxZXdjeTRmVW5IVm03?=
 =?utf-8?B?MTBHeTJNTW1pdHkxakprZVRYa0xkYmo4YVdZZVRmU1NTVVlKYkhGYUVaN2dR?=
 =?utf-8?B?MVV4RUtFREtQTHlCM01OckNiUnpmbm5QcSsyZDd2QlB6UDRKWWZNTFRjN1ps?=
 =?utf-8?B?U2R4Uy9pQ2RKZHNnMFBGNHdUR01EbzIvNUFvVHYwT3NnMXNVdnhFRkNrNldV?=
 =?utf-8?B?UllTME5QYnNsZGNmWm1pdEFzQUJaWUVyRFhsMDV2R213b3RoS1psNGlMVzVa?=
 =?utf-8?B?L2kvdWtRVUlQUlFkaDMxV0d4Ulc2OXgrN09Wd3RNaWxvcG9SRXVaT1pkR3R1?=
 =?utf-8?B?U1dUSjJzakFsTHkzTE1mVUExZ0orUE43UUpaaDIwK2ZiWDFHQWVreXZxRmNr?=
 =?utf-8?B?aDB0MVpuQmNFei81cUNyR2dIdDNkNTE2bXA5UEtTWlBrbmNsclpzWlRRUGF3?=
 =?utf-8?B?SmNWOE1CRy9DRWV2WExONExMV3FPeE0wR1lDUkZaL3ZkTUc3Q2dlcyt1YW53?=
 =?utf-8?B?VlczNkNrVjZXWGJnK2hQTW9vTGMva1E1cHNYZ3JEazBySngrd0ptVTNvWmM2?=
 =?utf-8?B?bTBleTJaTEJqSU5JYVdlQmtLQ1UzTGVSQ2hQbFUrZ1g4cDBWd3p0OTNBK1R1?=
 =?utf-8?B?VVo4T0M0dkdSYkl2TzlmTnBpSWNEYnEyZVAzSnVab1JvNEdDR1o2OWFXTWts?=
 =?utf-8?B?UWZReW54dTE1OHQzMWdBNjhFa3NhbjJldnI3VE5JSDVmUVVlR1d3NVpkTjBE?=
 =?utf-8?B?cWNxN1hCTjBHdWoxc2wyUUVTYU5IMytIcGc4N25jc2Z0ZTNzTlpwa3FBNDIz?=
 =?utf-8?B?anhxcVF6UnVvbjJBMERUZ0hENGxvZXRZZ0M5ZFZRQzVBS0ZLcnQ0b0UvdnR0?=
 =?utf-8?B?RjFrc2JWOEhwb0tKR1EzdWk0b0VWZnBzQm9YWGJlUDc2TGtid1EzN3NhV0hG?=
 =?utf-8?B?UDdVeHA5RXpLblp3WnErRU0xM0ovOFR2dWlIZitmdEFGT25pVkd3M21uTFla?=
 =?utf-8?B?WW9uUEVxQlY0L3JORW1ud3ZIdjJHU0F5VWlkTEQrSmM0L0VIcy9TdTdySWcv?=
 =?utf-8?B?YUk2RndvMTFvZE5EdC9vUld6T1RTVVF6SFEvekdVajhVQ2RoZThiZlpvTmY0?=
 =?utf-8?B?WS94ZGRNY1AzUXRvWlF3VlRoRklHdVl4WVREbGs2dCtsOERTZnZIUS9FKzE4?=
 =?utf-8?B?eC96Qm9jQThQZWNVYkZBZUt0c3VjcllCRXhLcFcrQzhodmpJdnVYWmdVRmsv?=
 =?utf-8?B?enhjME0vbVB5WVVJTGFYajM1b1BwNXRIazRqSXc5ZDgwN3dmbU8yNzBVZ0xt?=
 =?utf-8?B?Z1pCcGcrK1c5N1M2ME1KWklKS0JnZnNyWVFudzJ2dkJQRmNqTm91Q3pPK1ha?=
 =?utf-8?B?OE40R2szZVNLZndXUjFBTHhmblpoMXU4YWVCUzRnclhkMWRHTitVMVp6TVRG?=
 =?utf-8?Q?alrTyEyVOgDqFoNpTvM61MHdZZ7ZwA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a3hIN0s5UHFLa0ZEcDFyQXNEWUJpQkdheEdWU0VYSkRxcFdhZlNjUGlFcm13?=
 =?utf-8?B?UkV6ZWpuTFlLZUw0ZXFYV1BBOWxEeFhYZExYZDBqaVZydHl1ZTZKbGZBQmFy?=
 =?utf-8?B?N1BmQ3RRSEpuR3pxS0p0bjlHckZYUXFMTmk1bklxYzBzOTUyQS9xd2ZVSFp6?=
 =?utf-8?B?UElBZ3BmOFFYQnZ5dDY2TFFvdG94MWQ2aWVnUGFkWXdNQlN3dm04Y0dhOXlz?=
 =?utf-8?B?bFFvMytKaldiZ3FyZ0Fmd0FZZTNiV0dma1UwUzU0VUdDenVjMTV5dlJpQVFa?=
 =?utf-8?B?elhrQTk3M0R5RFh1aXlKODFKSFF6VnFpUWdaU3RNakk3OXdXR0RzY3hiQ2Yr?=
 =?utf-8?B?dGNwazVabUQrMXNjYnIybDhHcm5kL29DNnVsUytMelk1K1lEOUE0QS9tSU5t?=
 =?utf-8?B?dXpUeXR6WHgwcENyTlBLUXQ4dnF0eXVBSDh1Nyt2UTRHVDVDZi95RGtnYzRG?=
 =?utf-8?B?dXBqaEpGb0E1bnhabU1rd21HdEo0REl2a1pQSU02Rml1THhqRUVBY09BUVFR?=
 =?utf-8?B?TEVNWDNJamVFRXNsRXVwaGsyU2tYTDYyVlZGQStYZVNoekN4L0liNllmYnlR?=
 =?utf-8?B?Nm8veDhDZFR4Z1JtZEFoc0tjSE9TQ3owWmIwWG01Z2lsSmhLN0llRWxEd2JK?=
 =?utf-8?B?d2owdHo5TnNmbUl1R3VDdzBuZmRBV3JqQXVQT2hpMFZpQmlqTkxGM25VaUpw?=
 =?utf-8?B?U2pzeTRSbHhIMkJ2YW85RWdSNld0bTM5V0FsWmhpcFBBK3liZnVqS1AyM2Yw?=
 =?utf-8?B?UTBMYkIzdUZhMDU5eEVwVStlWWlUNTlGK3VkdnNyczZYYlZyZ041TnNGM2hE?=
 =?utf-8?B?YlJzQ091cXVPRko2elJPblRqcnYrOWtVM1JEaFFJMWJuQWFTRjhuVkpZakZY?=
 =?utf-8?B?enFkdnI1Y1BxWStnb0JnOTNPZ1NOVm9SL0FEWUkybGFUblVndThSLzBZd1Jo?=
 =?utf-8?B?VExhSUozWUNsQ1NBMCtOUEJ6WXZTenVta0lsam95RUlReFBjMWJlWWduN0dD?=
 =?utf-8?B?SVowNFo0RTcwSDVwNE5KUndwODJSQ3dRbjVXS3FUc1RadW9GMXVJV3ZDdHho?=
 =?utf-8?B?YzR1T09MYlRxcTBQbkN1bjZmMkpwRUVPbDQ4UFNmbzdXN3BFYW5NVFZwZ24x?=
 =?utf-8?B?eVAxa0NSL2Nzd1hXWEhDb0ZWTSt2dEt5bFlzbDFlQ0dXNGFBM09zbzhyNFdU?=
 =?utf-8?B?WGs2bTlhUUNpQ3RoSy9MejJaU01ZN1d5NWo4STN2OFhzYXE1dkNEaTJ4cEFp?=
 =?utf-8?B?aWk1c1FhQ1E3cGlZeFM4dzZBZXZ1dmdOOFNMRGNmajRNcytVN1BYQ282YlRN?=
 =?utf-8?B?dUpMclZPT2h1QkVRNjBjODBrZHdoN2hoeG80cmF5TVZZT2VMd2QzOGtRSDRC?=
 =?utf-8?B?QlkzczU0dUpUOEJZUXMySGxwRm90UGxpTTdsRk5qa2hjQWNYTk91ZWxvWWd1?=
 =?utf-8?B?TW10RmduVVRSalR1SlJlczUyRk9CdzlDS1hEbzlJZG96REZWdmtFVk5JOVJE?=
 =?utf-8?B?djI4U2FCbWUydlo5ZHh6eEd4Ym9pTUhQaEVFSXBxSHE1SmRDajRMQlFsMExW?=
 =?utf-8?B?WEkxU1h1dUZhand6VHRRdzVZWkttemxFWG1UZVpVUnVqNkhwd3phTUNGZjRx?=
 =?utf-8?B?WU5id1J3UXpnUnd6SjJWVTlENm94SHpqMzNrT1oyQkNzVEVNQjJWc3lXVGgr?=
 =?utf-8?B?SFlWOXh3OFM5dXpwY0t1WDNMamNSMVBWNTJHTEpzL3FVczBNT3dqSE1kSFZJ?=
 =?utf-8?B?RWZWZ0Ntd1VPcU4yYXNRK05SZElqb3hiL0lLbmptalU3c2JJbktnSUhDNkZq?=
 =?utf-8?B?bzVPT3JZWWtTWUhKMEJQQ1gwN2pvUkNvTTN4VlhWTGJ4U1hoTDdiUk5yQmtJ?=
 =?utf-8?B?c3lGTytjSDh1dVRqb2l4b0FpYkdSSDh0VllFL0JpRVhDUU5CTkh4L3Z5ZTRj?=
 =?utf-8?B?MG0vTEx3MFQ5S01nNzd2WjVldHd5b083QmZLTHNsME4xbkpEMWVwaUcrODlJ?=
 =?utf-8?B?emdVUkRSa3ZqQ0RvYzdaZERPWkdzaFFxbUdXWUc3NmErbThkYTlMQ0hoQ0hr?=
 =?utf-8?B?dFZuODBXK2FCT1pmaDE3YW04MlBkUFBZblpFeHhxcU1MalNNdkVRZnhwMG1Y?=
 =?utf-8?B?U0JSdXJBbVU4eTVJbHdETENyeUtTbzJlVVRHY1R6Z3J1djJYMnBPdURxZDNw?=
 =?utf-8?B?dWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB1F229C5DA8D148B724A5ED76396893@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afe9edf-d735-4ceb-8b07-08dd881ee8d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 19:40:49.2575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1eotgqZ8DnlkIHHHA17I4nqtRPLrSZ2WAt4nIMV8MCDIuHQ/GFWhR0M5nNhNhrV5E/OjFX0GBvHtwlkNq1u/7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE26A71A1E
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

T24gVHVlLCAyMDI1LTA0LTI5IGF0IDA4OjM4ICswMzAwLCBSYWFnIEphZGF2IHdyb3RlOg0KPiBP
biBNb24sIEFwciAyOCwgMjAyNSBhdCAwNDowOTowNVBNIC0wNDAwLCBSb2RyaWdvIFZpdmkgd3Jv
dGU6DQo+ID4gT24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMDQ6MDA6NDRQTSAtMDQwMCwgUm9kcmln
byBWaXZpIHdyb3RlOg0KPiA+ID4gT24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgMDE6MTI6MzhQTSAr
MDMwMCwgUmFhZyBKYWRhdiB3cm90ZToNCj4gPiA+ID4gT24gRnJpLCBBcHIgMjUsIDIwMjUgYXQg
MDc6MzY6MjNQTSArMDUzMCwgUmFhZyBKYWRhdiB3cm90ZToNCj4gPiA+ID4gPiBUaGlzIHNlcmll
cyBleHBvc2VzIHN5c2ZzIGF0dHJpYnV0ZXMgZm9yIEJNRyBQQ0llIEdlbjUNCj4gPiA+ID4gPiBk
b3duZ3JhZGUgYW5kDQo+ID4gPiA+ID4gZG9jdW1lbnRzIHRoZWlyIHVzYWdlLg0KPiA+ID4gPiAN
Cj4gPiA+ID4gQW55dGhpbmcgSSBjYW4gZG8gdG8gbW92ZSB0aGlzIGZvcndhcmQ/DQo+ID4gPiAN
Cj4gPiA+IEkgYWxtb3N0IHB1c2ggaXQgaGVyZSwgYnV0IHRoZW4gSSBub3RpY2VkIHRoYXQgaXQg
aXMNCj4gPiA+IGdlbjVfZG93bmdyYWRlLg0KPiA+ID4gSGFkbid0IHdlIGFncmVlZCB0byBmb2xs
b3cgd2hhdCBzcGVjIHNheXMgc28/DQo+ID4gPiANCj4gPiA+ICJ0byB0aGVuIGF1dG9tYXRpY2Fs
bHkgcGVyc2lzdCB0aGUgR2VuNCBkb3duZ3JhZGUgZmxhZyBpbiBGbGFzaCINCj4gPiA+ICJXcml0
ZSBHZW40IERvd25ncmFkZSBiaXQgdG8gTVJDIEZsYXNoIEZpbGUiDQo+ID4gPiANCj4gPiA+ID09
IEFwcGx5aW5nwqAgUENJZSBHZW40IERvd25ncmFkZSA9PQ0KPiA+ID4gDQo+ID4gPiBBbHRob3Vn
aCBJIHNlZSB0aGF0IHRoZXJlIGFyZSBzb21lIG1lbnRpb25zIGNhbGxpbmcgIkdlbjUNCj4gPiA+
IGRvd25ncmFkZSIsICJHZW40IGRvd25ncmFkZSIgc2VlbXMgdG8gYmUgdGhlIG1vc3QgdXNlZCB0
ZXJtIGluDQo+ID4gPiB0aGUgc3BlY3MsIHNwZWNpYWxseSB3aGVuIGNhbGxpbmcgYml0cyBhbmQN
Cj4gPiA+IHNlY3Rpb25zIG5hbWVzLi4uDQo+IA0KPiBXaGljaCBpcyB3aGF0IEkgZm9sbG93ZWQg
dW50aWwgd2UgaGFkIGEgY2hhbmdlIG9mIHByZWZlcmVuY2Ugb3ZlciBnZW4NCj4gZGVmaW5pdGlv
bi4NCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvaW50ZWwteGUvMzRiMzNkMzEzNWZjMjQzMDJk
YjI3NjRjZTg2YTY0MWU3YzQ5MDU0Zi5jYW1lbEBpbnRlbC5jb20vDQo+IA0KPiA+IEJlY2F1c2Ug
b2YgdGhlIGluY29uc2lzdGVuY2llcyBhbmQgb3VyIGJhY2sgYW5kIGZvcnRoIGhlcmUgYW5kIHRv
DQo+ID4gZ2V0IHByZXBhcmVkDQo+ID4gZm9yIGZ1dHVyZSBjYXNlcyB3aGVyZSB3ZSBtaWdodCBu
ZWVkIHRvIGRvd25ncmFkZSBmcm9tIGdlbjYgdG8NCj4gPiBnZW41LCB0aGUgY3VycmVudA0KPiA+
IEFyY2hpdGVjdHVyZSByZWNvbW1lbmRhdGlvbiBpcyB0byBzaW1wbHkgZ28gd2l0aA0KPiA+IA0K
PiA+IHNvIC9zeXMvYnVzL3BjaS9kZXZpY2VzLzxiZGY+L3BjaWVfZ2VuX2Rvd25ncmFkZV97c3Rh
dHVzLGNhcGFibGV9DQo+IA0KPiBJIHJlYWxseSBsaWtlIEx1Y2FzJyBwcm9wb3NhbCwgd2hpY2gg
aXMgYWxzbyBjb25zaXN0ZW50IHdpdGggc2ltaWxhcg0KPiBleGlzdGluZw0KPiBhdHRyaWJ1dGVz
Lg0KPiANCj4gL3N5cy9idXMvcGNpL2RldmljZXMvPGJkZj4vYXV0b19saW5rX2Rvd25ncmFkZV9j
YXBhYmxlDQoNCkknbSBzb3JyeSBmb3IgdGhlIGRlbGF5IGluIHRoZSByZXNwb25zZSwgaXQgdG9v
ayBhIHdoaWxlIHRvIGdldA0KY29uZmlybWF0aW9uLiBXZSBjYW4gZ28gd2l0aCB0aGlzIG9uZS4g
b3Igd2l0aCB0aGUgb25lIHlvdSBzZW50DQphbHJlYWR5LiBZb3VyIGNhbGwuIEp1c3QgbGV0IG1l
IGtub3cgdGhhdCBJIHB1c2ggdGhlIHZlcnNpb24geW91IHRlbGwNCmFuZCB0ZWxsIHRoZSBhcmNo
aXRlY3RzIHRvIHVwZGF0ZSB0aGUgc3BlYy4NCg0KPiANCj4gVGhpbmsgd2Ugc2hvdWxkIGdpdmUg
aXQgYSB0cnk/DQo+IA0KPiBSYWFnDQo=
