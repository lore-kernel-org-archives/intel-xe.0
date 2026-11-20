Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DA7606A682
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 22:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m3Ny7JE6;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Br9Vb2/v
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A994710E09A;
	Fri, 20 Nov 2026 22:33:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07F911293E
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 22:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795213999; x=1826749999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XA0TcEPr2rETDy33mR4MBCtNUqAM9ucJc07Kqanlv8c=;
 b=m3Ny7JE62gjvK0fIANnXc4PQ8cXoBunkM/i378oeVPcw7TDH45xLHS2l
 Uw8PhTAilhqodfjsv5xvhhT11QYODpJ6+7MUOD3MLYVwagKlkaIW7259b
 oCDCXIf/WlB2yRE7hoKINEGf7GYaw3IZaWUot2pzY4OYF+NIi8CuL9i+R
 bKkyHTrA9zU4nbtkRr8xWiizQPC6J4UuB2rZ0l4T+isQK0zW0QyTvUhRh
 Nh4dln0XW9TNT90CDjBRDw+2FhcHVp9RW04j5X890IM18oawL0VfUySI2
 3elB13QDhe9O21M6gVn968EIheMr8Ng5z8xXfEtWwCifs/B/cDhxNDrDU Q==;
X-CSE-ConnectionGUID: 4trLXwYuSdaHyXju94gmzw==
X-CSE-MsgGUID: 19v/ywFDTIqtTswQFw1+Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="3984008"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="3984008"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 14:33:11 -0800
X-CSE-ConnectionGUID: L46n3uWrSOebhJSJfb8dJQ==
X-CSE-MsgGUID: gI40Uf76SpqcE2eaFpiinw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="10743197"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 14:33:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 14:33:10 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 14:33:10 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.41) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 14:33:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iPnSQpXXuItUWDwCcvjd2+hPFPgkJ2zidYzRuFhZq6WiuQgWBYF3EP5GoU19qhwYNx9kcAzi8yWS+rxQJQyILvn+ib9GSahuSvbroY/uamo4kLPcYbs6AGHA1zaO0LyCtod5g6MUj9mInvGGWX/eLhYRs+MCAiOX2k0iJF3bKXycYbeeOhkA5h4ykLb9VUoLydmXdKlLrEAOOCAG66lPbizM9cs1pdPD80+WFLnfm+XnYpozNzliN/HT301YspiyVOw5ByUSE3YzIwO+C6zpfVAy7wHGjPv6Yz0PwrWKAN6dBrJwRzlpC18HkywO2DzAk7ziWMHm0lM/7TfY1uhsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XA0TcEPr2rETDy33mR4MBCtNUqAM9ucJc07Kqanlv8c=;
 b=SQQza4TrC5V78Y48ljRRLXz2xSUHFpS2x5pN/xLLDCrfvNO8SNRQmf5QTlRs0EJajHzOYdMyE4YIrW2OwRkkzfWPiId83omvC4zqDduazsOgTAPbHvZxFXSRQsDlKc1ye4OvtYEH9l67jyDldq2tmGMzDgDUp5oxrxgft0/1lXsOIhRzrtQUI8ScadwlK99z8XN0JzVXszYXYz4iuaQjCnKZuUcDKHKXdau43zaHu5kkI/Gu+ZrPQFXpPe0TuJ6rdvzRchqPKkerhjKrGqmj9niHu+1J8CSYRrLyzR6R+OisnRijNK2atMajhcWH1GAk6SVUCamt38To0uPeuu+fmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XA0TcEPr2rETDy33mR4MBCtNUqAM9ucJc07Kqanlv8c=;
 b=Br9Vb2/v9Ok0XjOT40ywCgbb1xkims9EeKr8d8MNnWf4CVoIJ/pl8pt9l8w0LRBqPSNI2yoiFwZCS37w5CSDZ3dvY9DAjs6KPILLSSxz330XVFajCD4jwR2dbWhhkL2JP50F/NURR9X//GuFJfoiSbOaWmdSUjY9V9kF49S2CL4=
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 22:32:59 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 22:32:58 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Poosa, 
 Karthik" <karthik.poosa@intel.com>
CC: "Anirban, Sk" <sk.anirban@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "Koppuravuri, Ravi Kishore"
 <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Purkait, Soham" <soham.purkait@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
Subject: Re: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
Thread-Topic: [PATCH] drm/xe/hwmon: Expose powerX_cap_max
Thread-Index: AQHdeBIt3Y1pVJPOeEeQUvA9dGKM6Lc3jggA
Date: Fri, 20 Nov 2026 22:32:58 +0000
Message-ID: <6af580630e7b618aee5d4a92b7163814488a4530.camel@intel.com>
References: <20261119104029.3066660-1-karthik.poosa@intel.com>
In-Reply-To: <20261119104029.3066660-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.60.2 (3.60.2-3.fc44) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7187:EE_|MN0PR11MB6184:EE_
x-ms-office365-filtering-correlation-id: 6074132e-2185-4063-718d-08df47563ab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|56012099006|261026140227099003|261028144727099003|261021123027099003|261022105027099003|261009223027099003|261102123227099003|261021121427099003|261026121527099003|18002099003|22082099003;
x-microsoft-antispam-message-info: wsSTfgaMlvdirAw0Q1UDNWH5cNYcueIRaySHa7IgDSnpPEg8GXqZ99+PTYDOxxIQO22eCc/O8hykBlJFn1jq1smqKWoQvGDsx5lTctPt9SlwcvNIOaXS6++J7aHd8L1ofpy7Q5YfEocRVZ0TPDrfWl6VJLF8dVpoCUrgjRIZEhYjD7bp0swBkQQkkSyDFsnFD+tKZtfpNL4NF9zy0NSpeNJX2T381CiMYJ5DzeLyCKqcSvb9cNjhy1hUSLHg2U5lr/GZ66+6Es5lLFVINXPTFjZqrNrnno8OaTgTACmekodowoVgzv7kENlPAqGepSjNjYrc190FQ+UrAh0Y3r4e5V/dVAu/XlXRnbpEfLn9HxzSuNWqWvPTutP7EXN7l1JrjAWfBCIgaatFag/uOhAB9aVUiUeXVryswjVED0onaDwg/yo/BKSt6US2MYloSnrHpo6P2bmefqv41YiIoFDVO2aeJ39WpWyLMNnpazsj6337tt2ql5S2b3VMs9HU6y6C+rzQcX456Htcnz/V298k7YNjNwFKuaRxRP2R2VzmIoASEXPkxM9Eys9fNsn2lr3kDCJbXq3M8Qjcne6ghWggFhQCyj1Sh7fahlBtFZLO0NgqwbCEZsUDT3GR4zX8U5ms91JmA3BcGXtDnAQOtme42X3ev4B6+5dyT3KHVkGcRd0Z4AIyNa0reMJghNExkq4lJdJIYjFT6NZpNu0J+/0/tkLOD4gEDYapdA82HqcQbdk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261022105027099003)(261009223027099003)(261102123227099003)(261021121427099003)(261026121527099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mk5CcFo5T0syV2xSQ3p4NGcycDVaeG9RMWxkRFBNQnlmd2ZlR0gxd3M2OElI?=
 =?utf-8?B?NVpGM2NCMGVxemlvMC9JNFdxQk9wcVRnMUJsRWhSTmx0ZUlUdExDRWhIZFh3?=
 =?utf-8?B?cVk0b29YRko0VkxmM1Y4UXNraUtLb1g5L0x3cm1iK2FzZHBxUTkvUjRGbWZo?=
 =?utf-8?B?ZXJjVDdrRHJzWERyQUJJeWdQTEJxNXR6N2pPeU00TmpvcWRyNmFLU3cvNUNK?=
 =?utf-8?B?MU1HRGJqRXpwRFhYckJuSVZqNXBBNVRndEIyeU5iRzhUNWc1Y01SSGNZTTgv?=
 =?utf-8?B?SlNkQndJT0traldzN1FYWlJHRTE4WCt1RWZJdGM3TlQ1d1dEcmozak9mTG9V?=
 =?utf-8?B?b25qL2pXYk42MXdCN00vY3haWDVZQjFxRVk2ODljWkV2M2JUTmlIbm9kMU5X?=
 =?utf-8?B?NjZka0xrZGZkZzBzRlZSNGpKYldGVzdoVWVJUElYZUtIekszV1hPdk9UUXh5?=
 =?utf-8?B?dUVOQnB6TXFtOEpsUlJweVBuMmxyTU0yTEEzMW41bXkxNUZ3QU0ycU5sc2F2?=
 =?utf-8?B?SE1nQ0t0bHpmYzVsT1lURlNTeW1ReDl0d0VFYUhnU2JKdGJYbDJkeWxUSUtK?=
 =?utf-8?B?d0FPRnRzdU1vRjlTL292TlNxR0xNWk9TcFZnck5aMUJHVDNWN3lZTWtadHhS?=
 =?utf-8?B?cW5Rc0JaTTBRNy9PemtiMU0xNjNobnRIb1pNTjZOVXBBcUZMSFBBQThiYkJ6?=
 =?utf-8?B?eThPcm9xY3BETEs1Y0xza1hGeEsza21Yc3Z2UlJXYlorN2FOcTFaanBUcmdZ?=
 =?utf-8?B?R1JCcmlEeTdkVzFoVEhFeFo1a2graHNxU1I1RXpOQW1kdzNHM25IMzVjWm9Q?=
 =?utf-8?B?R042SzdOVVVQc3dlSDczcVZrcHlkWmZjeUozRXp2N0hFQzh3ak9KOTZOamZ2?=
 =?utf-8?B?ZnJSdUIzVHB4aDRFN1JuZXlKb2Z1RTF4QzdaeDA5b0VhMjkyeS9NaUN2YkRp?=
 =?utf-8?B?VVlMZ2JVRy92NDExU1hjM3hCQVJnQzBEakkyc1BKMzJFUVE2TXpOanZsZ2hi?=
 =?utf-8?B?b2p2S1p0eUhCWE1iRWh1Z1YvQ3QyckpCdzhaNkhzZ2dNLzJYaDRHS1BpTnVO?=
 =?utf-8?B?ZWphaDl3dlk3UHF4cExGcFhsaSt3aUlzRzZNQkpqcFNvMUx2b3NHdXpqWllG?=
 =?utf-8?B?N3BZTjMzeGxyTFVkTml2WkE0cElnbk56SlRHTGRtNVZtWDZWMGxBWWpLKzlZ?=
 =?utf-8?B?eWgrSzYybjN2Mko2YllzczlUdnQ3ZUhNY2Zmd1FsWUV2dUcyKzZaVFp0QlZl?=
 =?utf-8?B?bnd5SzlXL21EN1daTXpTSzRIR3o5U0hDNGFNcjR3SHVWOWVUQ0wwZVZYWko2?=
 =?utf-8?B?SlFxYjZWSWNTV2NCcCtaMEFOQVF4YUY0aHh3M3grUzI5akpzc2FCclcyZU5n?=
 =?utf-8?B?bzI2NGFXQTVQZjgzazNERnJWa3dKVFpIQmoydnBaYnNKMkdHRXJpUVNLeDJZ?=
 =?utf-8?B?UkxHaTZ0UStuMDJlUWNwQjExMlpLcHZnd3Y5cGVjZ2R6akk2aWRZMjFQVi8w?=
 =?utf-8?B?MDJuYzBVRzk2NXBCU2JPUC82WUh5U1FnMVdRNDNQOHNZSjNNU1duSkhiRVJu?=
 =?utf-8?B?OWtnQUV3c2NzUG9pRFNLZXIzb2RtSGtGQWN5UzVwckY0bkNqcEltN251TXRp?=
 =?utf-8?B?R1I0WjhiazhURFR5UzRHcW9zU2dJNXBTMHhPd040SHB3dHR6S0M4MDRMZHZx?=
 =?utf-8?B?dkpuQUhXdnVKUjZxSnVsalIwSG5JSlpGN2xRdXFvYWdGVWUyd3VFeUl4Lzht?=
 =?utf-8?B?bHowVDhRWVBHRmJialF6ZE1SaUVXZDJzM2s3bnZKR3hZN3JUSENnQ3IwTVZK?=
 =?utf-8?B?RHY4NUhBUDRhd3huV1VtZjVUOHhQelBKa3RQd0ljYVV4TnIyMDV0YWNKTDR0?=
 =?utf-8?B?NmdoM2VqNmpNVnpwd052bjBvcmw4TVB4SEpuTE9HVHAyQWZTSVRMVzVCZ2Fz?=
 =?utf-8?B?N24rUlUyM3d5UmRKTE1JZDJWc2s5S1NkUnAyZUZ0c3o0aVp3WE1OSXVyNitX?=
 =?utf-8?B?bjlZemdhODlSUnNWa2FrSVVQOXdseE1XTzFsTENIM0wxUHVZYUN2QWZyYXdv?=
 =?utf-8?B?UCs3RzVsMm9NWHUzVW1NVlNkUTRTWHBtVWM1SFBzNEE0OVRNWWRucDRKVER3?=
 =?utf-8?B?TlM4VEhkVXJPVUs0N1NuTXRic0YyUzlTV3F1ZVI5N1o2NytYTWd4R08wajZa?=
 =?utf-8?B?ODVlN0VkRTg4bnY5ZVEzYVRhQjB6QjdIQnJudHBFTU14NjdnRkdUVnYzczBj?=
 =?utf-8?B?SXdZSDlDN3MxT2lOMlNYVkV0OEdJNXhPS1pwa1drQzNjc3NMdlFpbloyS3Fz?=
 =?utf-8?B?dXhURDFMdUg3d1ZaOHlYa1UzTmNJZkxuTWtzWjcrQjJTeGdKVlVtbTdrbUQv?=
 =?utf-8?Q?9IPV8vAys7PkW4pY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A38D92A41F539E4AAF89959CE3FC6720@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jwgfp9686BueBD1yVBtYBEZUgdpU9jAupcTuCZePZt0qF233XSp0zvOBuEBBtiwuqAhQBwLIEEaYR9scvmkRM8m4DXXFbMeLFaoX75S4fkgp37SgGX3ltyFfBh7itGIzf3yPx1ZFS97x55wxWGcaxDFHL0ft7nLRnN746VXpIRaGlRU935iMLjBP5ziMpaC5PmrC7KV1jdJIQBt4KrXhnfs/RL7EBiTo43XKgzfnlLDAqqUM3Jzye8ZB/C7HTCCaU4dj5dUNDfm8pCERGSsfdQUwN8Wy4qFwz4h+7OsxYES4u0nt/ThWzZGW7KKCaG4toNzqmUTAWEGWBSGs4ax6bw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6074132e-2185-4063-718d-08df47563ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 22:32:58.7126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1dhaz8lhxnlnHdfnoGEor9iYKgeSy8BKl/bUlYQBGx37EGRJQontkr3/GQR7PvYprWfmtiSGktE8m4RULuywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
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

T24gVGh1LCAyMDI2LTExLTE5IGF0IDE2OjEwICswNTMwLCBLYXJ0aGlrIFBvb3NhIHdyb3RlOg0K
PiBBZGQgYSByZWFkLW9ubHkgcG93ZXI8aT5fY2FwX21heCBhdHRyaWJ1dGUgZm9yIHRoZSBjYXJk
IGFuZCBwYWNrYWdlDQo+IGNoYW5uZWxzLiBJdCByZXBvcnRzIHRoZSBQTDIgKGJ1cnN0KSBwb3dl
ciBsaW1pdCB0aGF0IGZpcm13YXJlIHNldHMNCj4gYXQNCj4gYm9vdCwgd2hpY2ggaXMgdGhlIGhp
Z2hlc3QgdmFsdWUgdXNlcnNwYWNlIGNhbiB3cml0ZSB0byBwb3dlcjxpPl9jYXAuDQo+IFRoZSBh
dHRyaWJ1dGUgaXMgcHJlc2VudCBvbmx5IG9uIHBsYXRmb3JtcyB1c2luZyBtYWlsYm94IHBvd2Vy
IGxpbWl0cw0KPiB3aGVyZSBQTDIgaXMgZW5hYmxlZCBhdCBib290Lg0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogS2FydGhpayBQb29zYSA8a2FydGhpay5wb29zYUBpbnRlbC5jb20+DQo+IC0tLQ0KPiDC
oC4uLi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaW50ZWwteGUtaHdtb27CoMKgIHwgMjQNCj4g
KysrKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArKysrKysrLS0NCj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaW50ZWwteGUtaHdt
b24NCj4gYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWRyaXZlci1pbnRlbC14ZS1o
d21vbg0KPiBpbmRleCAwZGE3MzlkOWE4MTYuLjA5NzkwMmZkODM0NiAxMDA2NDQNCj4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaW50ZWwteGUtaHdtb24NCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9BQkkvdGVzdGluZy9zeXNmcy1kcml2ZXItaW50ZWwteGUtaHdt
b24NCj4gQEAgLTI5Niw2ICsyOTYsMzAgQEAgRGVzY3JpcHRpb246CVJXLiBQYWNrYWdlIGJ1cnN0
IChQTDIpDQo+IHBvd2VyIGxpbWl0IGluIG1pY3Jvd2F0dHMuDQo+IMKgDQo+IMKgCQlPbmx5IHN1
cHBvcnRlZCBmb3IgcGFydGljdWxhciBJbnRlbCBYZSBncmFwaGljcw0KPiBwbGF0Zm9ybXMuDQo+
IMKgDQo+ICtXaGF0OgkJL3N5cy9idXMvcGNpL2RyaXZlcnMveGUvLi4uL2h3bW9uL2h3bW9uPGk+
L3Bvd2VyMV9jYQ0KPiBwX21heA0KPiArRGF0ZToJCU5vdmVtYmVyIDIwMjYNCj4gK0tlcm5lbFZl
cnNpb246CTcuNA0KDQo3LjUgaWYgbWVyZ2VkIGluIHRoZSBuZXh0IDEuNSB3ZWVrLg0KNy42IGFm
dGVyIFRob21hcyBzZW5kIHRoZSBsYXN0IGRybS14ZS1uZXh0IFBSIG9mIHRoaXMgY3ljbGUuDQoN
Cj4gK0NvbnRhY3Q6CWludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiArRGVzY3JpcHRp
b246CVJPLiBDYXJkIGRlZmF1bHQgYnVyc3QgKFBMMikgcG93ZXIgbGltaXQgaW4NCj4gbWljcm93
YXR0cy4NCj4gKw0KPiArCQlUaGlzIGlzIHRoZSBmaXJtd2FyZS1wcm92aWRlZCBkZWZhdWx0IGxp
bWl0IGFuZCB0aGUNCj4gbWF4aW11bQ0KPiArCQl2YWx1ZSBhY2NlcHRlZCBmb3IgcG93ZXIxX2Nh
cC4NCj4gKw0KPiArCQlPbmx5IHN1cHBvcnRlZCBmb3IgcGFydGljdWxhciBJbnRlbCBYZSBncmFw
aGljcw0KPiBwbGF0Zm9ybXMgd2hlcmUNCj4gKwkJUEwyIGlzIGVuYWJsZWQuDQo+ICsNCj4gK1do
YXQ6CQkvc3lzL2J1cy9wY2kvZHJpdmVycy94ZS8uLi4vaHdtb24vaHdtb248aT4vcG93ZXIyX2Nh
DQo+IHBfbWF4DQo+ICtEYXRlOgkJTm92ZW1iZXIgMjAyNg0KPiArS2VybmVsVmVyc2lvbjoJNy40
DQo+ICtDb250YWN0OglpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gK0Rlc2NyaXB0
aW9uOglSTy4gUGFja2FnZSBkZWZhdWx0IGJ1cnN0IChQTDIpIHBvd2VyIGxpbWl0IGluDQo+IG1p
Y3Jvd2F0dHMuDQo+ICsNCj4gKwkJVGhpcyBpcyB0aGUgZmlybXdhcmUtcHJvdmlkZWQgZGVmYXVs
dCBsaW1pdCBhbmQgdGhlDQo+IG1heGltdW0NCj4gKwkJdmFsdWUgYWNjZXB0ZWQgZm9yIHBvd2Vy
Ml9jYXAuDQo+ICsNCj4gKwkJT25seSBzdXBwb3J0ZWQgZm9yIHBhcnRpY3VsYXIgSW50ZWwgWGUg
Z3JhcGhpY3MNCj4gcGxhdGZvcm1zIHdoZXJlDQo+ICsJCVBMMiBpcyBlbmFibGVkLg0KPiArDQo+
IMKgV2hhdDoJCS9zeXMvYnVzL3BjaS9kcml2ZXJzL3hlLy4uLi9od21vbi9od21vbjxpPi9wb3dl
cjFfY2ENCj4gcF9pbnRlcnZhbA0KPiDCoERhdGU6CQlNYXkgMjAyNQ0KPiDCoEtlcm5lbFZlcnNp
b246CTYuMTUNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2h3bW9uLmMNCj4gaW5kZXggNTE1YjI4OGYxOGU1Li4w
MjNhMzE3YTQ0M2UgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9od21vbi5jDQo+IEBAIC04NjUsOCArODY1
LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBod21vbl9jaGFubmVsX2luZm8NCj4gaHdtb25fdGVt
cF9pbmZvID0gew0KPiDCoHN0YXRpYyBjb25zdCBzdHJ1Y3QgaHdtb25fY2hhbm5lbF9pbmZvICog
Y29uc3QgaHdtb25faW5mb1tdID0gew0KPiDCoAkmaHdtb25fdGVtcF9pbmZvLA0KPiDCoAlIV01P
Tl9DSEFOTkVMX0lORk8ocG93ZXIsIEhXTU9OX1BfTUFYIHwgSFdNT05fUF9SQVRFRF9NQVggfA0K
PiBIV01PTl9QX0xBQkVMIHwgSFdNT05fUF9DUklUIHwNCj4gLQkJCcKgwqAgSFdNT05fUF9DQVAs
DQo+IC0JCQnCoMKgIEhXTU9OX1BfTUFYIHwgSFdNT05fUF9SQVRFRF9NQVggfA0KPiBIV01PTl9Q
X0xBQkVMIHwgSFdNT05fUF9DQVApLA0KPiArCQkJwqDCoCBIV01PTl9QX0NBUCB8IEhXTU9OX1Bf
Q0FQX01BWCwNCj4gKwkJCcKgwqAgSFdNT05fUF9NQVggfCBIV01PTl9QX1JBVEVEX01BWCB8DQo+
IEhXTU9OX1BfTEFCRUwgfCBIV01PTl9QX0NBUCB8DQo+ICsJCQnCoMKgIEhXTU9OX1BfQ0FQX01B
WCksDQo+IMKgCUhXTU9OX0NIQU5ORUxfSU5GTyhjdXJyLCBIV01PTl9DX0xBQkVMLCBIV01PTl9D
X0NSSVQgfA0KPiBIV01PTl9DX0xBQkVMKSwNCj4gwqAJSFdNT05fQ0hBTk5FTF9JTkZPKGluLCBI
V01PTl9JX0lOUFVUIHwgSFdNT05fSV9MQUJFTCwNCj4gSFdNT05fSV9JTlBVVCB8IEhXTU9OX0lf
TEFCRUwpLA0KPiDCoAlIV01PTl9DSEFOTkVMX0lORk8oZW5lcmd5LCBIV01PTl9FX0lOUFVUIHwg
SFdNT05fRV9MQUJFTCwNCj4gSFdNT05fRV9JTlBVVCB8IEhXTU9OX0VfTEFCRUwpLA0KPiBAQCAt
MTQyMyw2ICsxNDI0LDggQEAgeGVfaHdtb25fcG93ZXJfaXNfdmlzaWJsZShzdHJ1Y3QgeGVfaHdt
b24NCj4gKmh3bW9uLCB1MzIgYXR0ciwgaW50IGNoYW5uZWwpDQo+IMKgCXN0cnVjdCB4ZV9tbWlv
ICptbWlvID0geGVfcm9vdF90aWxlX21taW8oaHdtb24tPnhlKTsNCj4gwqANCj4gwqAJc3dpdGNo
IChhdHRyKSB7DQo+ICsJY2FzZSBod21vbl9wb3dlcl9jYXBfbWF4Og0KPiArCQlyZXR1cm4gaHdt
b24tPnBsMl9vbl9ib290W2NoYW5uZWxdID8gMDQ0NCA6IDA7DQoNCkkgYmVsaWV2ZSB3ZSBhbHNv
IG5lZWQgdG8gdGFrZSBQV1JfTElNX0VOIGluIGNvbnNpZGVyYXRpb24gaGVyZSwgbm8/IQ0KDQpQ
ZXJoYXBzIGNoZWNraW5nIGhhc19tYnhfcG93ZXJfbGltaXRzICYmIChwbDJfb25fYm9vdFtjaGFu
bmVsXSAmDQpQV1JfTElNX0VOKSA/IQ0KDQo+IMKgCWNhc2UgaHdtb25fcG93ZXJfbWF4Og0KPiDC
oAljYXNlIGh3bW9uX3Bvd2VyX2NhcDoNCj4gwqAJCWlmIChod21vbi0+eGUtPmluZm8uaGFzX21i
eF9wb3dlcl9saW1pdHMpIHsNCj4gQEAgLTE0ODYsNiArMTQ4OSwxMCBAQCBzdGF0aWMgaW50DQo+
IMKgeGVfaHdtb25fcG93ZXJfcmVhZChzdHJ1Y3QgeGVfaHdtb24gKmh3bW9uLCB1MzIgYXR0ciwg
aW50IGNoYW5uZWwsDQo+IGxvbmcgKnZhbCkNCj4gwqB7DQo+IMKgCXN3aXRjaCAoYXR0cikgew0K
PiArCWNhc2UgaHdtb25fcG93ZXJfY2FwX21heDoNCj4gKwkJKnZhbCA9IG11bF91MzJfdTMyKFJF
R19GSUVMRF9HRVQoUFdSX0xJTV9WQUwsIGh3bW9uLQ0KPiA+cGwyX29uX2Jvb3RbY2hhbm5lbF0p
LA0KPiArCQkJCcKgwqAgU0ZfUE9XRVIpID4+IGh3bW9uLQ0KPiA+c2NsX3NoaWZ0X3Bvd2VyOw0K
PiArCQlyZXR1cm4gMDsNCj4gwqAJY2FzZSBod21vbl9wb3dlcl9tYXg6DQo+IMKgCWNhc2UgaHdt
b25fcG93ZXJfY2FwOg0KPiDCoAkJcmV0dXJuIHhlX2h3bW9uX3Bvd2VyX21heF9yZWFkKGh3bW9u
LCBhdHRyLCBjaGFubmVsLA0KPiB2YWwpOw0K
