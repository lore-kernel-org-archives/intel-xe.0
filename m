Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D7CD3439
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 14:50:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B37310F1A9;
	Thu,  7 May 2026 14:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eYCOekNL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FAAC10F1C8
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778165432; x=1809701432;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KjK+pjChQWSou8t3Qq/LsBcjmWoxL3qzwP6ITKSifYY=;
 b=eYCOekNL4w/BQSv8mrS8f8gq64QX2OIwatPzh5okB+DZz7TgMGiC0o9X
 MUAKxZENUXPwrFNK1T7HZmSQQQ3ZFAROWEjNXR9Qvz5QK68vrxCsdZC/y
 VmRsiP1OCm8zYwnru7zUFrxjlCvtoO8Vxs3Tn5y2+GJqx4xfj7XcQjVFy
 1Y9D+2WH1KLzpmp1ki7TpyzEZiqNonbjAohybYwj9HXusbqcuHehR/DjE
 WICKEnMNKh3VD+lYMXk9/e8a/MXFrUdjyO66eOLQTC3w7mKQBh3lKQjRl
 g/4BrrGquCPW6S6PHrPdbawWtixr3NebxP9dLTmMgAuBD9o/ZaFXTycnN w==;
X-CSE-ConnectionGUID: ZRvkFlq6R72qmk8esc/rEQ==
X-CSE-MsgGUID: xNXEgVeXSeO34NX0LlAUDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82987226"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="82987226"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:50:31 -0700
X-CSE-ConnectionGUID: Ru7B4DCETk+lGhn3ZHznvg==
X-CSE-MsgGUID: 4dbMz6jPSyOC1BCwSfGMYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="231946887"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 07:50:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 07:50:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 07:50:30 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 07:50:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgTtWpKaUHVYf+C4lsDJxFSHgSBd6tQZrGLlbIvBmZ5+AO2gn9xv6iC11STNiz0bvI1/ZMBMvCV5WOaI8cW8os1DN/RyoryOwY5KZNcUex2W8yLPaqNcRSpvFrAmE7NJGZR3WeXXjjKBKEJ3IOnkcPl+Gnfv42F9+KwFyMiKxd8A4SOB9b+eLVOR5rN6NoQ8UnZeXmSI1gH4CPUKF9SjR41XL7VW7ACcVZiCIQBkGNEtsgfg56fEJyHFfeEcyZfFTaPjWyr0k9qA6gZWq881qMXGNc7kKFVmdrhX7Smcqzn0Ae2QUBmHg4M3KvTgsq7XIi1Tfxcr5z/XV9ACwWWkBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjK+pjChQWSou8t3Qq/LsBcjmWoxL3qzwP6ITKSifYY=;
 b=Issx0c09b1H0M+Nwln0gXUnVkYNlzvm79StGQ9ueGVUD7Gr0pVvIYkKuQjyaP8LAyNq9aV912g/z5KySLjiezRzCFzicUOLlMCRVl3XoBJK4DoFkaFJvzuHKF6El6uhuYykMnDDJEmRl+raMhoQ2dSdXFm2yXsqphnfNi1u03qXnXPVcit/bM6HpGP7UBFcl7wcD+woeqb+rre3VRApE3VO8832jodBu5/6uvRWmI1klxTqNcO/HE5gHXXFuGAHET9h9jY8GPnwlc93Ug2Jel7R74L6C5fJLQ03fdED68ZmNiW4ExlaqvqKbb0+u3QyRCW++Q27g4zajCOKmv8BuHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 (2603:10b6:518:1::d41) by DS0PR11MB6542.namprd11.prod.outlook.com
 (2603:10b6:8:d2::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 14:50:26 +0000
Received: from PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::62cf:3d13:b91:6a5b]) by PH3PPFAB4263235.namprd11.prod.outlook.com
 ([fe80::62cf:3d13:b91:6a5b%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 14:50:26 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>, "Xiong, James"
 <james.xiong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Xiong, James" <james.xiong@intel.com>
Subject: RE: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during async
 firmware load
Thread-Topic: [PATCH 1/1] drm/i915/dmc: fix assert_dmc_loaded WARN during
 async firmware load
Thread-Index: AQHc3bsIykU80JXXzUOHRiq+1mK5ZbYCo2wAgAACfRA=
Date: Thu, 7 May 2026 14:50:26 +0000
Message-ID: <PH3PPFAB4263235366FD006E5F293C5B9F0E03C2@PH3PPFAB4263235.namprd11.prod.outlook.com>
References: <20260507004631.574300-1-james.xiong@intel.com>
 <878q9v8eqt.fsf@intel.com>
In-Reply-To: <878q9v8eqt.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFAB4263235:EE_|DS0PR11MB6542:EE_
x-ms-office365-filtering-correlation-id: 1e173b05-ef63-454e-6b7f-08deac47f984
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: S1Crepx8+gWlLIgACrIUbKqSPy+Uop1erJSCWM0V+bQVR+N+7GZ6vAi3DpikhbiUseCDPLi1gVymJuYaJKyQYk7qd9ekYzN7zo1nDn90QC5+GH1sXF0bu0SR2llxbY+VBJfJ8ekwwjcZYejAJ3k9lvcFj74gO8mSs7kA//n1A6aFE/n6+l0rxP6e9k3ixYr+9gJ5Hnv17Ipzj1AIHhwmsQCosEfpFPz+eSZoqNwf94rsU+EpLKbRwcJZJxhToCEan79wjjYx5Ad0g+JkdIPA0/Q+UUMkSFOMNhYd+wLXAm+E4ixUnOdRn/9ABO/F+4ISuPOna7LiZHbGQqdqdrut7PvioQD1cx6Wx+aX+bCJfHCw3lv0Nfg2piU2QccVRHN4Dyz/m5b2+Ba0oKXamynV4K4GmkjVfaHjrNuh67SWSKXJ8LhvSbtJE+1NtM+L/+cAcdutlB5haAifas400UXrrJE3sE2wxVbr4E0quvmXBP+tO1Dixcj4XxrEt7MT5cYUyNCEnMw1HlyTPE5kiZsU9Iv5DEn6nc++m9AzEVdwqoQmMWW24RUcDkF+W9zz3Ww3cv0qCg81HUTMpkCoky4in/VuBzStyC1ybPmCqZqzN5HAEl2Vbwm0jqebjNBxC7jKSGa142/447LZigJWtNdzTtGoU1CyCxHLYAmoxgB6UJSIsl6m3KsKYZ/MLnaNU0G4pN9HU5No2pP8uv53BhjO2Jg5wRdxz2XlDOY3/CGj6aoXNKBZ1IuzvD4MPnPARJn/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPFAB4263235.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkdIU3FzWjlQb3QwSWJaZkw1dCs5c29Tek4zdHN4QkVtSXdoaVRLbjR4cmVC?=
 =?utf-8?B?bFdlMlJld1BySjhLeE5NNS9jVVRueFN4K1A0R1ZqQnlUeWk4RkdaK1FFb0Vk?=
 =?utf-8?B?TitVOFF5N0ZjZkl0UDFWWklpN283SElCM25qN2k5aEllaElUeEdPVlRYSEYx?=
 =?utf-8?B?cExjUGNJdWovVG1YNjRRbHFiYm4xMGsvNk54TXY2UmNhMnJNZm9TWFAxMHdM?=
 =?utf-8?B?Z2lUMTU0VWlxK0tkTmtMSWVCSDkzWkxyc0RrMUc1S2RrM1hVdmZ2ZHljcmY5?=
 =?utf-8?B?RFlkbjExQnQwVWVWZEFYcExlVlk2TWNRZ1lQT1N4VEpveHR5OW1IL1RPMnJE?=
 =?utf-8?B?a2liZzJnZnFDaUlyZmJJckpveW1iaGZvNDJSV2ZtblhOYWsweUIzRzJGTFF6?=
 =?utf-8?B?WE9mOGM2Z2FUVnRkd0FLalZXd09sL2hXd2k1bm43Z3cwQktRYVplNEwxa0Nq?=
 =?utf-8?B?cGNmMlFKOEtwVWNJaG1tT0dvODdxa0lJRzdMbU1LTHcvYk9tNHZGV0d6Y3NO?=
 =?utf-8?B?NmFTdEdpRXVGVXQrRGgyN1dMVi9uazRUUS9meHR4U1pOQ01KZFZVRkFUZEFi?=
 =?utf-8?B?YVlxUzNOeGdITGVEbFZIUEdDazVzM29MaVJYdnlaSWxvSU9VZkorS0lYVWdv?=
 =?utf-8?B?S2xQWFJLRGNiMU1XMFZud3RJMWtEbXoxM1hkNHZudmpJdS9qeGo1UVhkUUVU?=
 =?utf-8?B?aEMyN040SEFjOG1wRE5xUFI1OHJkZmtTV2czYU1nMjFzTmcwSk5qb1FGbDRZ?=
 =?utf-8?B?M3c1Yk9Nd1FxZCt4Wk95Zk1abWE4WXdpVURzaVpkYmlsVXdjWXIvNEhkS3J0?=
 =?utf-8?B?ak5VSFQvK1FzWWtXUCtROHZEWG5xVmJFY1NVSXlGam9UT2pjWWZaVE8wdXlo?=
 =?utf-8?B?MUovbTJJTkxLb0RwTm1HdG1IQlhVd3FtYnkvbkE3OWF5WnBwQmxNQ05vRW9I?=
 =?utf-8?B?WndyU1lKSHZrYnNVNDdPc011ZjhTU0FOVmpsQzlwS3hycFdQd2Rhanp4VWNK?=
 =?utf-8?B?OWtRcmhJWk15VnRvdVZ1cUJUa0RZVEpFS29YTFFoYTlsQmhqcGhFakVDMVZZ?=
 =?utf-8?B?Y01zc09nRUZVTURyMUY0aldyTk04VFZCR3I3TUNDY0N3TnFZTW9uNXhKSUdj?=
 =?utf-8?B?bGVDeElJTTVrMGtOMGN1VCtCUk5jdXRIMW5QWnp1MkIzMmtId28rNGxaWjFP?=
 =?utf-8?B?dVRYanJrNlhkUHAyRlJKNkZXNWlPL2VBaHNLVWJVd3drRTAySS9TWmdubEp6?=
 =?utf-8?B?ZWFxQTdWT0xnUVlwdlNTZjltL2R6UG15SlRxc1J2Rzk1cXJjY29WS2o1eSsr?=
 =?utf-8?B?a3lrakhFeWRnT2o1OS9YWjlQN0ZCVHdHelBXZVhqWXhQcG02N3dKcXFPemwz?=
 =?utf-8?B?QU94ZWwzUHdud2FYNmxHWUFlRHNxQWsyQ2VwSW5rcGFLNHl5ZXZWVUdyNkow?=
 =?utf-8?B?dWJjOGdCNHJydU9CbkVGZEkrbVZKNjhpMUxhaWlkbHpQZlZwQVlUQmFYWUE5?=
 =?utf-8?B?YzZuRFNuRTRqTUI4MXFaL3ZXTEczNDl0QnBMbTEyWEQ2eEpWR3I4YVhLK1Bm?=
 =?utf-8?B?SEtVWUNDdFdZQ0w0V1RJMWxOU2tBa3lONnlQdElQRXlFcGtiMnlBL043aU5V?=
 =?utf-8?B?TFl2Y2lDK25Ob2llOW9iQmVFMmEyM0tMZG5DSUdLenNsNkhWelBORnZRVE1r?=
 =?utf-8?B?NFd3bmhDeDQrUXQ4NGpFbUFnMy80cEFYVmFIZWVQcTFUOGM0ZEtGcjMraW9T?=
 =?utf-8?B?WnRJanlqNkNwUUlxbldINmpNRWU2KzhXZngvV1V5MXc5SCtFZ3N5alBHcmtP?=
 =?utf-8?B?MGk1L0VicUR5aUduRkVaSGJaTlBnVWROS3NDYW5VUkNlUWJtY1lldk1tNGsr?=
 =?utf-8?B?Z2p1a2laQmJNY21aUUhVVytVdlVxbzZQQ2dsZkdLQThBYVZIQWpKTWpyVDll?=
 =?utf-8?B?K1lUN0JYUnVnc1Q3SEU1SExiQU1kSEhaMUdPejVEWEtkSzY4MzA2SnBmMEcx?=
 =?utf-8?B?VHBjcUtFYlpEZjFiL204cXdMOHFvMjl6ZnQ3bVdPZlppdGd3NDB6TllYRDQr?=
 =?utf-8?B?bElneWFIQllwNncxSWJnQy80N3pOc3Q4Qy9KaGVQZkRKMUtwRWRKZFdRY2cv?=
 =?utf-8?B?dXV3djNIaE1vZjJ0Ti9rUXBac3BQMUcvUTJ0akNlTzY2b29ya1BhQVIvRjZW?=
 =?utf-8?B?b3ArdTdVRXpHNEdjc25yZzk4MlRndGhMTjloQi95VUptMEJiYytVK0hCcmxv?=
 =?utf-8?B?ZWVET1JsMktuZk5uWDNtTzdZT2N1UHkyc0REcURQbE9PS2hxSEtLNmZRZUV1?=
 =?utf-8?B?eW9oMEp2OW9HRnY4TlVqS2Y4MkFFSzBxQ0orWFo4dThhRjN1VEZHUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HOJ9w0XM0+tINUuhPLzcU/428VBPAy7ywPzXLwE+xHmPA1CO0JUhvbhVanF00Hfpt27mj59vNAcF2QrauNjZlrvrp60NDy3gY7q9muv8YTjpgdwMpMhi1emeUhFROKUMhfTjTl4ToSAHE5upzW/8FAGLZw5c9NxSdfqgXaAnwJ0GKVfE2IaSdexE9ukyVPETP7m1ODObrNOs0LUfMifmjSskAG8nTr5mAGChVZ0gi10AFmNRjOIfzbNcuT6YM4hWDnVI81VBzOnnUL5sROQa4XjbgRE6imd1MOshq4/+pa7y20DQHetXwirttZooeoMVfxTBT3Zip3YBIdIMHrbDPQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFAB4263235.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e173b05-ef63-454e-6b7f-08deac47f984
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2026 14:50:26.1892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EXOvUlh2TUZxMj+afsS8rW/LfzCP+7KzI/kJ5arbhg7YAJEvFxCmMUbci8kr7G/BOV8r7uLIBG5Zwv9SSX+txg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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
bnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEd1c3Rh
dm8NCj4gU291c2ENCj4gU2VudDogVGh1cnNkYXksIDcgTWF5IDIwMjYgMTcuNDANCj4gVG86IFhp
b25nLCBKYW1lcyA8amFtZXMueGlvbmdAaW50ZWwuY29tPjsgaW50ZWwteGVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+IENjOiBYaW9uZywgSmFtZXMgPGphbWVzLnhpb25nQGludGVsLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAxLzFdIGRybS9pOTE1L2RtYzogZml4IGFzc2VydF9kbWNfbG9h
ZGVkIFdBUk4gZHVyaW5nDQo+IGFzeW5jIGZpcm13YXJlIGxvYWQNCj4gDQo+IEphbWVzIFhpb25n
IDxqYW1lcy54aW9uZ0BpbnRlbC5jb20+IHdyaXRlczoNCj4gDQo+ID4gRHVyaW5nIGRyaXZlciBw
cm9iZSwgRE1DIGZpcm13YXJlIGlzIGxvYWRlZCBhc3luY2hyb25vdXNseSB2aWEgYQ0KPiA+IHdv
cmtxdWV1ZS4gVGhlcmUgaXMgYSByYWNlIGJldHdlZW4gcGFyc2VfZG1jX2Z3KCkgc2V0dGluZyB0
aGUgcGF5bG9hZA0KPiA+IHBvaW50ZXIgKG1ha2luZyBoYXNfZG1jX2lkX2Z3KCkgcmV0dXJuIHRy
dWUpIGFuZA0KPiA+IGludGVsX2RtY19sb2FkX3Byb2dyYW0oKSB3cml0aW5nIHRoZSBmaXJtd2Fy
ZSB0byBoYXJkd2FyZSByZWdpc3RlcnMuDQo+ID4gSWYgdGhlIHByb2JlIHRocmVhZCBjYWxscw0K
PiA+IGludGVsX2RtY19lbmFibGVfcGlwZSgpIC0+IGFzc2VydF9kbWNfbG9hZGVkKCkgaW4gdGhp
cyB3aW5kb3csIGl0IHNlZXMNCj4gPiBwYXJzZWQgcGF5bG9hZCBidXQgc3RhbGUgSFcgcmVnaXN0
ZXJzLCB0cmlnZ2VyaW5nIGEgfjIwJSBpbnRlcm1pdHRlbnQNCj4gPiBXQVJOSU5HIG9uIEFETC1O
IHdhcm0gYm9vdC4NCj4gPg0KPiA+IEZpeCB0aGlzIGJ5IGFkZGluZyBhICdsb2FkZWQnIGZsYWcg
dG8gc3RydWN0IGludGVsX2RtYywgc2V0IHdpdGgNCj4gPiBXUklURV9PTkNFKCkgYWZ0ZXIgaW50
ZWxfZG1jX2xvYWRfcHJvZ3JhbSgpIGNvbXBsZXRlcy4gQ2hlY2sgaXQgd2l0aA0KPiA+IFJFQURf
T05DRSgpIGluIGludGVsX2RtY19lbmFibGVfcGlwZSgpIGFuZCBpbnRlbF9kbWNfZGlzYWJsZV9w
aXBlKCkgYXMNCj4gPiBhbiBhZGRpdGlvbmFsIGd1YXJkIGJlZm9yZSBoYXNfZG1jX2lkX2Z3KCku
DQo+IA0KPiBNYWtpbmcgaW50ZWxfZG1jX2VuYWJsZV9waXBlKCkgYmFpbCBpZiB0aGUgRE1DIGlz
IG5vdCB5ZXQgbG9hZGVkIGRvZXNuJ3QNCj4gbG9vayBsaWtlIHRoZSBjb3JyZWN0IHNvbHV0aW9u
IGhlcmUuDQoNClNob3VsZCB0aGlzIGJlIGFsc28gc2VudCB0byBpbnRlbC1nZnggdG8gZ2V0IHRl
c3RlZCBvbiBpOTE1IHN5c3RlbXM/IA0KPiANCj4gRG9lcyB0aGUgd2FybmluZyBjb21lIGZyb20g
aW50ZWxfbW9kZXNldF9zZXR1cF9od19zdGF0ZSgpJ3MgY2FsbCBzdGFjaz8NCj4gSWYgc28sIEkg
d29uZGVyIGlmIGFkZGluZyBhIGNhbGwgdG8gaW50ZWxfZG1jX3dhaXRfZndfbG9hZCgpIGJlZm9y
ZSBpdGVyYXRpbmcNCj4gdGhlIGNydGNzIHdvdWxkIGJlIGEgc2FuZXIgYXBwcm9hY2guDQo+IA0K
PiAtLQ0KPiBHdXN0YXZvIFNvdXNhDQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMg
WGlvbmcgPGphbWVzLnhpb25nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kbWMuYyB8IDE2ICsrKysrKysrKysrKysrLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kbWMuYw0K
PiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kbWMuYw0KPiA+IGluZGV4
IDBkZjRmNDJiYTNlMy4uYzUxMTAzNTE1ODIwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZG1jLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RtYy5jDQo+ID4gQEAgLTc5LDYgKzc5LDcgQEAgc3RydWN0IGlu
dGVsX2RtYyB7DQo+ID4gIAkJdTMyICpwYXlsb2FkOw0KPiA+ICAJCWJvb2wgcHJlc2VudDsNCj4g
PiAgCX0gZG1jX2luZm9bRE1DX0ZXX01BWF07DQo+ID4gKwlib29sIGxvYWRlZDsNCj4gPiAgfTsN
Cj4gPg0KPiA+ICAvKiBOb3RlOiBUaGlzIG1heSBiZSBOVUxMLiAqLw0KPiA+IEBAIC00MTcsNiAr
NDE4LDEzIEBAIGJvb2wgaW50ZWxfZG1jX2hhc19wYXlsb2FkKHN0cnVjdCBpbnRlbF9kaXNwbGF5
DQo+ICpkaXNwbGF5KQ0KPiA+ICAJcmV0dXJuIGhhc19kbWNfaWRfZncoZGlzcGxheSwgRE1DX0ZX
X01BSU4pOyAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBib29sIGludGVsX2RtY19sb2FkZWQoc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkpIHsNCj4gPiArCXN0cnVjdCBpbnRlbF9kbWMgKmRtYyA9
IGRpc3BsYXlfdG9fZG1jKGRpc3BsYXkpOw0KPiA+ICsNCj4gPiArCXJldHVybiBkbWMgJiYgUkVB
RF9PTkNFKGRtYy0+bG9hZGVkKTsgfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHZvaWQgaW5pdGlhbGl6
ZV9zdGVwcGluZ19pbmZvKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0KPiA+IHN0cnVj
dCBzdGVwcGluZ19pbmZvICpzaSkgIHsNCj4gPiAgCWNvbnN0IGNoYXIgKnN0ZXBfbmFtZSA9IERJ
U1BMQVlfUlVOVElNRV9JTkZPKGRpc3BsYXkpLQ0KPiA+c3RlcF9uYW1lOw0KPiA+IEBAIC03ODYs
NyArNzk0LDggQEAgdm9pZCBpbnRlbF9kbWNfZW5hYmxlX3BpcGUoY29uc3Qgc3RydWN0DQo+IGlu
dGVsX2NydGNfc3RhdGUgKmNydGNfc3RhdGUpDQo+ID4gIAllbnVtIHBpcGUgcGlwZSA9IGNydGMt
PnBpcGU7DQo+ID4gIAllbnVtIGludGVsX2RtY19pZCBkbWNfaWQgPSBQSVBFX1RPX0RNQ19JRChw
aXBlKTsNCj4gPg0KPiA+IC0JaWYgKCFpc192YWxpZF9kbWNfaWQoZG1jX2lkKSB8fCAhaGFzX2Rt
Y19pZF9mdyhkaXNwbGF5LCBkbWNfaWQpKQ0KPiA+ICsJaWYgKCFpc192YWxpZF9kbWNfaWQoZG1j
X2lkKSB8fCAhaW50ZWxfZG1jX2xvYWRlZChkaXNwbGF5KSB8fA0KPiA+ICsJICAgICFoYXNfZG1j
X2lkX2Z3KGRpc3BsYXksIGRtY19pZCkpDQo+ID4gIAkJcmV0dXJuOw0KPiA+DQo+ID4gIAlpZiAo
IWNhbl9lbmFibGVfcGlwZWRtYyhjcnRjX3N0YXRlKSkgeyBAQCAtODIxLDcgKzgzMCw4IEBAIHZv
aWQNCj4gPiBpbnRlbF9kbWNfZGlzYWJsZV9waXBlKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0
YXRlICpjcnRjX3N0YXRlKQ0KPiA+ICAJZW51bSBwaXBlIHBpcGUgPSBjcnRjLT5waXBlOw0KPiA+
ICAJZW51bSBpbnRlbF9kbWNfaWQgZG1jX2lkID0gUElQRV9UT19ETUNfSUQocGlwZSk7DQo+ID4N
Cj4gPiAtCWlmICghaXNfdmFsaWRfZG1jX2lkKGRtY19pZCkgfHwgIWhhc19kbWNfaWRfZncoZGlz
cGxheSwgZG1jX2lkKSkNCj4gPiArCWlmICghaXNfdmFsaWRfZG1jX2lkKGRtY19pZCkgfHwgIWlu
dGVsX2RtY19sb2FkZWQoZGlzcGxheSkgfHwNCj4gPiArCSAgICAhaGFzX2RtY19pZF9mdyhkaXNw
bGF5LCBkbWNfaWQpKQ0KPiA+ICAJCXJldHVybjsNCj4gPg0KPiA+ICAJaWYgKERJU1BMQVlfVkVS
KGRpc3BsYXkpID49IDE0KQ0KPiA+IEBAIC05NDIsNiArOTUyLDggQEAgdm9pZCBpbnRlbF9kbWNf
bG9hZF9wcm9ncmFtKHN0cnVjdCBpbnRlbF9kaXNwbGF5DQo+ICpkaXNwbGF5KQ0KPiA+ICAJZ2Vu
OV9zZXRfZGNfc3RhdGVfZGVidWdtYXNrKGRpc3BsYXkpOw0KPiA+DQo+ID4gIAlwaXBlZG1jX2Ns
b2NrX2dhdGluZ193YShkaXNwbGF5LCBmYWxzZSk7DQo+ID4gKw0KPiA+ICsJV1JJVEVfT05DRShk
aXNwbGF5X3RvX2RtYyhkaXNwbGF5KS0+bG9hZGVkLCB0cnVlKTsNCj4gPiAgfQ0KPiA+DQo+ID4g
IC8qKg0KPiA+IC0tDQo+ID4gMi4zNC4xDQo=
