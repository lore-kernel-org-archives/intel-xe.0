Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32674C4450E
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:02:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC63610F2C5;
	Thu, 16 Jul 2026 12:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MMLtDt5p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D2B10F2C4;
 Thu, 16 Jul 2026 12:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784203366; x=1815739366;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YpjOGorDzPFf057LCYWofknlhqgskFb9+qTgYHh6j3g=;
 b=MMLtDt5pL/dfnIXr2gHGewwvhZHkLtkfsk0C7QBD8o0Qi1RATEsIov1Q
 bN0Js4zFTA22Wxc72ntsYop/AtQ36ki5xCfVBxNCjBYWhZkSjFmUvLW8l
 ZuVXdk59CUFm9IN9MMCaD/BsGfh4TIiTT65125ldRa2rhvNZhtU/2V1aG
 wkkJ4n5Fw+pFkWZEx74LemPNQl3O3oH9M6/edOP1lKFE+HPIr4ZJkNWTI
 iM6e1zAtYhzsUP49U5w58knImxntpzmnncfmLOsw7Kmpk8EZMxm3E39hc
 hCSZmSsmLiTLwgn3hSSjb921wm1MzoVErAc4Nbkk8bbWIrY14oeFM90NO Q==;
X-CSE-ConnectionGUID: 09QW/YiqS+6lR4GWriAIfw==
X-CSE-MsgGUID: U2MG7RbkToK6Y+L1yLi6oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84741165"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84741165"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:02:38 -0700
X-CSE-ConnectionGUID: 44lfi4XLSUmI5/0eC9AZ5A==
X-CSE-MsgGUID: BYov1Q75Tc2KXcyOMFUkKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="261405873"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:02:38 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:02:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 05:02:37 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:02:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSo8SmQG0adDC/J5B9R08DJIGQDOpikCh8lU9YnzVpRSU/VtM5lo2+G6iUV+XGb91P6Uc6elBXxk7yh8I2T3J9KwBH0mjfM4DFlAwg7f2ea73xQ1F7hS6NnoFlZPtj3G1fNpK7hLL3bB85M6QoT4ig17eKW7devviS3Fkoxa/KKmU/ohyznRvGgnWt35c3NfULSpb7LxfBpPYvZpCfTBWEPCml3hOaB559K3V6cQhLgSEkZxPLufpa46De/20DGhNq9bDctvlHSLDkC205RuDSQ3S/+10Dey4YSJYE+U1ZZ31MTakji6xI/dTOVytAnq5blj0RnCay/baaYeBPrYXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpjOGorDzPFf057LCYWofknlhqgskFb9+qTgYHh6j3g=;
 b=rmYrwo1JPos2NWaFqzXBDSSQk523pl5dtp86D28ficoAfQYv/yjje1v/afS/15xem+5vIai/9+uok/A5OkhSK3klOtW5Ieysz773P66nYado55Xh52kaWwxyYwXoE6XA/Gqgk4z9gJFrI0oViH+nBPn6TeMpwtSwrRztrx/gsh4enW+3R7ZImcarmZx8RGyKlnkX6bssOxbvhByrJ88okL4jSzy0tMXWkIpTBfrScCRzmMm+D3f2n/3bmbCe5NKHFvZXr5zO27qMtX70IidCDeG2Hbq0qUo407Xbnem0Wc+YcbBR71x02hw0GseBAgyEfxkmnK4WwqE/4kcKrC/f5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 12:02:33 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 12:02:33 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Shankar, Uma" <uma.shankar@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix
 refresh rate path
Thread-Topic: [PATCH v3 5/8] drm/i915/vrr: Move CMRR hw registers to fix
 refresh rate path
Thread-Index: AQHdE3/bUYYuHZw5cUCluBJij5i6E7ZukMqAgAF9woA=
Date: Thu, 16 Jul 2026 12:02:33 +0000
Message-ID: <IA1PR11MB634858DAD04F80A44D36CB60B2C72@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-6-mitulkumar.ajitkumar.golani@intel.com>
 <4b475ef0-4572-4b6f-957a-0e5bbf256bd2@intel.com>
In-Reply-To: <4b475ef0-4572-4b6f-957a-0e5bbf256bd2@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|PH7PR11MB6607:EE_
x-ms-office365-filtering-correlation-id: b6a90337-67ac-442d-2fff-08dee3321ebe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|10070799003|376014|1800799024|366016|38070700021|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: HlASgQCftfsivXXaNxcV1DsAmIWg/qFObMIcC26EhsHk0I5fzj67l9mutjVB6CcGj6ET15OX1NAk3HS9UzWeCrmZSmBN/Y0fjd7yv06FrGZZ5qVL8y4OZfA9fnE5f6UjP/hv6lSkESoSu/O9NoekJipvYHC4w3GNJm+P9FQTk7LFEaFnm2BzzMs/iC81f43+G3QE5rNTUbCNnu2/UzLHN0OGCJMKXabsIQU+ZqWQ1F7fek4F/qUnXBSAa737B4kYSqK1ebkxGvW0trNsP1WQEwWFRkFVcMm0L+Qa+ATCvuETPjyUDr7DkgeV7KJx6McxitmBZKM1R+N9t5qBum0ZOiJtSmrEYjxhYYUiJ9wKEYLoTWlZtpGJmyy1VivedNLzEEHPQpTe0ZC9+vlcMeflYyL2QyDTvDt1gBVTbIakdYHPBNZP0o9a6n3odSHYxq62a/tJX4endlkAanfXYzUPb2qPC8BeuMYVzNEd9Yx0HqF7wa9UrxcbEeucjW9OXb+ewDbbFsLbI1TuLhOSuwrXMDgd93wkqVdLoCx59oSyRAqGbvsjYg2xZaCktCOlceBm775enwjVDT81ymFkYJc+Mu0uA03PFwmWymgdVGf9Pwf+PiWI7ULObF7XYnPgcMhYgjxGeBzjmzFgXWu3qX1EGyL05ZgdUhkzO/69eC1+St1Zuwdncrk2sslBIuKnODxdAOmHhr8ZYqHq5qQ4csFLCIqleDYUzyE0Hm4TexlYydc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(10070799003)(376014)(1800799024)(366016)(38070700021)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WEFUTzRnbXNPYWFIc0dqWVBITURVOTlOV1kyeWlyZGY5cEZRY1lrOHFJMUpr?=
 =?utf-8?B?Ukp0YlRzeVh1UUlhU3VwbGMxSkVPYkFwSk0rSDJZZVNrV0U0K0FUTm9vT1V0?=
 =?utf-8?B?aDN2TDFmZjlnbVlRUFV3Y3ptZHVqcmZWOTRIaFBYamJUM201NUlsdm1rNGI1?=
 =?utf-8?B?K2NPeENLeUh4VndwSGNNUmZRV3VxdFJpOWZrWTFWRXc4d0NtUy8wSnlwRWdv?=
 =?utf-8?B?blBPVWdwUlorSjFIZjVpRWRVMFI3ckE2VTBzZ2gxVkNIVjNNQklhTmpPWkRp?=
 =?utf-8?B?YlhxZ3pKczF0VEtxSU16TlRFYnJHMTJuSXR6ek55dkZTTHRUNFV4K1NxRnV3?=
 =?utf-8?B?d1AzTnYvc3lEVEFzQWlJek5oVWYyQnB0TlZlVElUNVN3SnZNc3ZpazhkY1hK?=
 =?utf-8?B?TFlvbFowOFRETzRwSzI1K1gxMGdMYkNIQXFUbjdFSE10Um9FMG5KdzBZMXpJ?=
 =?utf-8?B?MWpGQnRTR2tUZzZvNi9IKzhTaUoyYmV6MXBoT2tZQm9jMFM3UG1aVG82ODZo?=
 =?utf-8?B?NXNsNUtEc200aEdVbGIzWWZGaHk0Vk5uZEU2S0toLzU2Qk01ZURGcGFJbklV?=
 =?utf-8?B?em9MWGQ2T21QaWpLOHlJdVZiQzhpZ1FjNHhYUFFJcnZ6WktiM1VvTjNDWG4z?=
 =?utf-8?B?RFM2V0xNeC9OeURoNUFneEY4UzR3QmJOVW5CdllmTDVOQ0txd3kwaDUxbU5H?=
 =?utf-8?B?bk40clRNYkdjY3dmZzFwVEg0ZytjRW4zdkg3YmxYS3pUa1pHVVVycG5ESkxv?=
 =?utf-8?B?ZXZ1VFlIOUlJWURLalMzNlJuWHpZUXdPekRiZEpLaTZxQm1jTHlsdVVrMitv?=
 =?utf-8?B?V1doVGJhRmp4ZkNydjI1dUN5anUwMGU5ODc2K21kOGFkNUZ0M3g1SHN4Rmk3?=
 =?utf-8?B?cGpvQ29jSm9FcHI4aU1jSHJld3pGSlNvWmVFRnBnZmEzeUpMUlZMbXVYOG9P?=
 =?utf-8?B?YldwK3A5WVErSjRpWFcrNmR0ZW1RS2hDK0NSOU1abklvdk05djlLckplWkVT?=
 =?utf-8?B?dHZ0WGJnSnRTUlltU3FnZXB3WHp2RjZSMEw2Z0hObzF1QVNFZytzTHIwT3Qv?=
 =?utf-8?B?MTFIaTFmMkZXdEwzSnU3WHE0cGZ4VVowMk1BN2d5OFh4NU1lWFpVYjlXN2Iz?=
 =?utf-8?B?L1pPUkZhKy8wVHhiQmNqQjRnalZpMHc1WmNMYms5a1NvRkx5ZDB6OFV3d3RC?=
 =?utf-8?B?Nlk3T21saml5MFZCZm9XQXdhdUlHQWR2SW0wRkZiRjR4c3pkcWRrQVpvRTNx?=
 =?utf-8?B?YW5PeDVpZ3JmbTBrWEQ1UEl4SDZ0eVhGZkZYRXRSY0ZjZXRST0d3Undsdmhy?=
 =?utf-8?B?bm5YWTl4M09zTFZFV0tGL2VXdEg0K3J1TElTL21TcFcwYlRjUmJjUTlXVUtj?=
 =?utf-8?B?aVd6R0dlR0lHZmNVTWFGelBVS1lnUE1tZXJiTVZtRnB6OExvc01OU2pOZU5s?=
 =?utf-8?B?eGg0cEk4ZDgzUkpkaTVOcWVTdG5Fa0ZyWlBUUkVCRzVuTmRkWEtHNGxncUNH?=
 =?utf-8?B?amtvTG5Ebm41elh3b0ZVSnhReTcrZ2F3b0NwZGNMMUpJQ3Z0dW9TbVpLVTBG?=
 =?utf-8?B?TG5QOTJGdXZXWHNhUlVOWUFIaXo4NVJoSTdwdkpJbm1TOUNzQW04b0NsbnQz?=
 =?utf-8?B?clRJanpHbEUvTDBPOGI0YTlid2FOMlo2akppdjl3RmNjMzl4TmJkaDJxeVpo?=
 =?utf-8?B?Wlo2Ykh6RktTQjJHSEkrNENUVVJVZUNBcXZkQ2RrQmV4SkpCMnBaOVRIWlJ0?=
 =?utf-8?B?b3NwTnZQNlBXd3JVQm93WDMyVlBYdGt5YldoSlBPUW5MNEpNd1hTd3Y0TEFH?=
 =?utf-8?B?d1ppNXpXZEJhU04zend2ODRvakgzSjNrU1JLaEtPQVpXVG9aMzBoL0lkRTE4?=
 =?utf-8?B?ZW5RdGtkN3F6YXZ5b1Y2TnVTZGVpNW5tU1BqSk5nbGFtckttODc4aGVEc0p3?=
 =?utf-8?B?aXhGVHptMlo3ZWk5dk95aFRwUkUzUWtxYXREU0RpSXV6bXdpYWhNMkYyZUdP?=
 =?utf-8?B?M0JDeHdGNkIwNDhPeUNOczlaUmhFbDhoL1lDbUZMdm9laE1POC8rdHljV2dO?=
 =?utf-8?B?OXZFWmpaSVo4cVpzSURhcFNRWmxGcmZRdXVXaWxlQWx3M3FDTWVMc0Q4dytB?=
 =?utf-8?B?MTJRUitPdFlBdU13SFJMRlRtempaS1AxTk9nUC9UNHZrdlo0Y1F4M2hFbmFy?=
 =?utf-8?B?NmRJYzd1OC8yQjlKVC9TSmZ3U2RKNHVwbGZpRjMwY3lBQTVNaWFPUHF4aEFO?=
 =?utf-8?B?VHdFdlExbGdMZUg2dHpqRS9rczJ6cTBmSEVSSENqcjl3VGx1UUVjYjNGNGJV?=
 =?utf-8?B?cHRncjUzcmxJVmE0RG9seWlYbnZOdTZBL0J5MXMzZEhuQ3RuOWcva1JZUFJz?=
 =?utf-8?Q?WwpbRcLi6Kw7HSkcQD6D69e1OHW7Zf/9EF9S9y/h5xsAu?=
x-ms-exchange-antispam-messagedata-1: b6L9JmqsSGaJas7Wq8YM5De6IOpadwpgxgIHQpHzOQxP8tJJSnd4Ll0V
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TMU/6OdQCbIZqkTjC7yO6zHeIu9C2tif3DHyCD89vUBnYvjcLJWFgwhpxOtju+ldqGdddOdJOHdKNOzS36zctWiXvvur9D1FnmWIaDcd9j3RAqtmbkXVSTvw1WOCi/7dtI3GyDfc1h5cELOf88Yd2K24zncGhWpjXaJFk/8/K9ZzWngh9NW0puEK2ZeZjkLxOB8GfyAaxzEsOhwpJJn2WokPYdkLe8wPyebaypai5xxyqkIA9wADyVxsWNRJXsPCSDLykB74SSyRRprYpferiYM93LH9Zck+MagonHKRsEo+58dO/wdokjEaHnee7ibJMI9mAs56DvLh3fpfV4H0uA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6a90337-67ac-442d-2fff-08dee3321ebe
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2026 12:02:33.6457 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hIKZK3PATnO7Xs9DTyCCqGVZccVtsm4mUNrpxIzIIDZPVeAZ9MMuyoaFHId+2gGhykkYbw1f3I3/z8V/9p98vf7/jVgEemXbFERUsjAalWBpalvq7H3pb1y2MobzOTxZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQm9yYWgsIENoYWl0YW55
YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFoQGludGVsLmNvbT4NCj4gU2VudDogMTUgSnVs
eSAyMDI2IDE4OjQ1DQo+IFRvOiBHb2xhbmksIE1pdHVsa3VtYXIgQWppdGt1bWFyIDxtaXR1bGt1
bWFyLmFqaXRrdW1hci5nb2xhbmlAaW50ZWwuY29tPjsNCj4gaW50ZWwtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBTaGFua2Fy
LCBVbWEgPHVtYS5zaGFua2FyQGludGVsLmNvbT47DQo+IE5hdXRpeWFsLCBBbmtpdCBLIDxhbmtp
dC5rLm5hdXRpeWFsQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyA1LzhdIGRy
bS9pOTE1L3ZycjogTW92ZSBDTVJSIGh3IHJlZ2lzdGVycyB0byBmaXgNCj4gcmVmcmVzaCByYXRl
IHBhdGgNCj4gDQo+IA0KPiANCj4gT24gNy8xNC8yMDI2IDQ6MDkgUE0sIE1pdHVsIEdvbGFuaSB3
cm90ZToNCj4gPiBNb3ZlIENNUlIgcmVnaXN0ZXIgd3JpdGVzIHRvIGZpeCByZWZyZXNoIHJhdGUg
cmVnaXN0ZXIgd3JpdGUgcGF0aCB0bw0KPiA+IGNvbnNvbGlkYXRlIHdpdGggZml4IHJlZnJlc2gg
cmF0ZSBpbXBsZW1lbnRhdGlvbi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1pdHVsIEdvbGFu
aSA8bWl0dWxrdW1hci5haml0a3VtYXIuZ29sYW5pQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJyLmMgfCAyMiArKysrKysrKysr
Ky0tLS0tLS0tLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF92cnIuYw0KPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF92cnIuYw0KPiA+IGluZGV4IDI1Y2U1NmQ0OGJiMS4uOTVjN2IwYzA1ZWMzIDEwMDY0NA0K
PiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfdnJyLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Zyci5jDQo+ID4gQEAgLTMz
Nyw2ICszMzcsMTcgQEAgdm9pZCBpbnRlbF92cnJfc2V0X2ZpeGVkX3JyX3RpbWluZ3MoY29uc3Qg
c3RydWN0DQo+IGludGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsDQo+ID4gICAJaWYgKCFpbnRl
bF92cnJfcG9zc2libGUoY3J0Y19zdGF0ZSkpDQo+ID4gICAJCXJldHVybjsNCj4gPg0KPiA+ICsJ
aWYgKGNydGNfc3RhdGUtPnZyci5jbXJyLmVuYWJsZSkgew0KPiA+ICsJCWludGVsX2RlX3dyaXRl
KGRpc3BsYXksIFRSQU5TX0NNUlJfTV9ISShkaXNwbGF5LA0KPiB0cmFuc2NvZGVyKSwNCj4gPiAr
CQkJICAgICAgIHVwcGVyXzMyX2JpdHMoY3J0Y19zdGF0ZS0+dnJyLmNtcnIuY21ycl9tKSk7DQo+
ID4gKwkJaW50ZWxfZGVfd3JpdGUoZGlzcGxheSwgVFJBTlNfQ01SUl9NX0xPKGRpc3BsYXksDQo+
IHRyYW5zY29kZXIpLA0KPiA+ICsJCQkgICAgICAgbG93ZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52
cnIuY21yci5jbXJyX20pKTsNCj4gPiArCQlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBUUkFOU19D
TVJSX05fSEkoZGlzcGxheSwNCj4gdHJhbnNjb2RlciksDQo+ID4gKwkJCSAgICAgICB1cHBlcl8z
Ml9iaXRzKGNydGNfc3RhdGUtPnZyci5jbXJyLmNtcnJfbikpOw0KPiA+ICsJCWludGVsX2RlX3dy
aXRlKGRpc3BsYXksIFRSQU5TX0NNUlJfTl9MTyhkaXNwbGF5LA0KPiB0cmFuc2NvZGVyKSwNCj4g
PiArCQkJICAgICAgIGxvd2VyXzMyX2JpdHMoY3J0Y19zdGF0ZS0+dnJyLmNtcnIuY21ycl9uKSk7
DQo+IA0KPiBTaG91bGRuJ3QgVFJBTlNfQ01SUl9OX0hJIGJlIHRoZSBsYXN0IHJlZ2lzdGVyIHRv
IGJlIHdyaXR0ZW4uDQoNCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGhhcyBkb25lLCBqdXN0IG1vdmVk
IHRvIGZpeCByZWZyZXNoIHJhdGUgcGF0aC4gDQoNCkluIGxhdGVyIHBhdGNoZXMgd2hlbiBhY3R1
YWwgZW5hYmxlL2Rpc2FibGUgc2VxdWVuY2UgaXMgY29tcHV0ZWQsIHRoZXJlIHN1Z2dlc3RlZCBj
aGFuZ2VzIGFyZSBhcHBsaWVkLg0KDQpUaGFua3MNCg0KPiANCj4gPiArCX0NCj4gPiArDQo+ID4g
ICAJaW50ZWxfZGVfd3JpdGUoZGlzcGxheSwgVFJBTlNfVlJSX1ZNSU4oZGlzcGxheSwgdHJhbnNj
b2RlciksDQo+ID4gICAJCSAgICAgICBpbnRlbF92cnJfZml4ZWRfcnJfaHdfdm1pbihjcnRjX3N0
YXRlKSAtIDEpOw0KPiA+ICAgCWludGVsX2RlX3dyaXRlKGRpc3BsYXksIFRSQU5TX1ZSUl9WTUFY
KGRpc3BsYXksIHRyYW5zY29kZXIpLCBAQA0KPiA+IC02NDgsMTcgKzY1OSw2IEBAIHZvaWQgaW50
ZWxfdnJyX3NldF90cmFuc2NvZGVyX3RpbWluZ3MoY29uc3Qgc3RydWN0DQo+IGludGVsX2NydGNf
c3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gICAJCXJldHVybjsNCj4gPiAgIAl9DQo+ID4NCj4gPiAt
CWlmIChjcnRjX3N0YXRlLT52cnIuY21yci5lbmFibGUpIHsNCj4gPiAtCQlpbnRlbF9kZV93cml0
ZShkaXNwbGF5LCBUUkFOU19DTVJSX01fSEkoZGlzcGxheSwNCj4gY3B1X3RyYW5zY29kZXIpLA0K
PiA+IC0JCQkgICAgICAgdXBwZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52cnIuY21yci5jbXJyX20p
KTsNCj4gPiAtCQlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBUUkFOU19DTVJSX01fTE8oZGlzcGxh
eSwNCj4gY3B1X3RyYW5zY29kZXIpLA0KPiA+IC0JCQkgICAgICAgbG93ZXJfMzJfYml0cyhjcnRj
X3N0YXRlLT52cnIuY21yci5jbXJyX20pKTsNCj4gPiAtCQlpbnRlbF9kZV93cml0ZShkaXNwbGF5
LCBUUkFOU19DTVJSX05fSEkoZGlzcGxheSwNCj4gY3B1X3RyYW5zY29kZXIpLA0KPiA+IC0JCQkg
ICAgICAgdXBwZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52cnIuY21yci5jbXJyX24pKTsNCj4gPiAt
CQlpbnRlbF9kZV93cml0ZShkaXNwbGF5LCBUUkFOU19DTVJSX05fTE8oZGlzcGxheSwNCj4gY3B1
X3RyYW5zY29kZXIpLA0KPiA+IC0JCQkgICAgICAgbG93ZXJfMzJfYml0cyhjcnRjX3N0YXRlLT52
cnIuY21yci5jbXJyX24pKTsNCj4gPiAtCX0NCj4gPiAtDQo+ID4gICAJaW50ZWxfdnJyX3NldF9m
aXhlZF9ycl90aW1pbmdzKGNydGNfc3RhdGUsIGNwdV90cmFuc2NvZGVyKTsNCj4gPiAgIAlpbnRl
bF9jbXRnX3NldF92cnJfdGltaW5ncyhjcnRjX3N0YXRlKTsNCj4gPg0KDQo=
