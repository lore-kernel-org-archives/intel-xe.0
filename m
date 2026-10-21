Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D7F606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=moTlCens
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AC410F8EE;
	Wed, 21 Oct 2026 06:05:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ECA10F8F2;
 Wed, 21 Oct 2026 06:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792562706; x=1824098706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+C/xO6JckWkkmgIJor6kMpN4HdjDz3sldZ2axnTwZMY=;
 b=moTlCensVOqvs8Uz8s7GeIRmyBwG9cZbdixdQCiWRc7nNmy1R2QXNBiW
 KROO8l2G4lbLceHuGzYzNppgYjzE7gEWUxPp2UEar4Ue4WM3TLm5G1bNA
 iJ5m9TGlwXFlAXSxLCktEr2vK7zMRftPaOW8hk3dSBFNmTkAoSn/tNlDR
 rb5BPMrL7bm5s7Av+a0ZUD+VexfBDaXmx9z2fLt3VmoR4ZdEbq/AN+Zya
 Os3WuPXuiB5GX6o49e2g/7jLOT5HXbvmZahYi0VdYzrSdyefGzPtjWAxZ
 jxsySR6izSUx+whiIIqbKw+awu1YaI7EMJJgPEzfZXg08R0w4qyrN7Ays Q==;
X-CSE-ConnectionGUID: jjc8IdAHTua6XzgG5OQEeA==
X-CSE-MsgGUID: v/8NbWM3SWajDzolU4eE1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1289307"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1289307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 23:05:06 -0700
X-CSE-ConnectionGUID: uPYKk8BxQt2wssC/cplKFg==
X-CSE-MsgGUID: 9CtydauBSqe7nAbnupPSxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="2951361"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 23:05:05 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 23:05:04 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 23:05:04 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 23:05:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wc89bXai5BxlwVQWnUHkELRALULdgmayFoL2AcEoOYLveteF+NqH85S4xmcgS2iQ4V3w3IA5hSDR1VZnKLwnfVAPQ2psVUAWjzcNw0b2jBvt7TOKhNHmD5iruCAYbMGj2HXtqzm++8+lB5HJKBCLAM08EnnHsRd3/3XSBkgei79jZIjs3uYUGDN6xnvKV9veu5py42FPRay0sXfYFKaAsHu5B/OdbAhaoSpnBEHEydkK1lI3ayzoPlQ6ry/5dWurZtntr4rxIeAdM6E5aSZR8lSIC0hHN1AbwbaI3GkeD/kBopjlVJlXhsjewUPGpb/Z4GZ9ZkHhyjJKD7KsyRhh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+C/xO6JckWkkmgIJor6kMpN4HdjDz3sldZ2axnTwZMY=;
 b=KV7oq1hMovqm8T2ZixqbNIhZ9OBqhNcE6ljFYro6jHWYANvD+L5Kp4AZomJw2R3MseBqT4BbxJNBru4QJqGV3EuYCFAdKxr/XHozrdJqbsxgZVS8FrLdCX645JBDkNwhmElE/p49PM1MdeRcOQcBfN3Qyr+Xn0aPkSHEe7ZQ891C3j+dtiFLB5qkBVp7UerzdebL9iiIIbBjp/aH0JMN3ENjI3NnVU/wpftC5NcE5HPfag9UiKRsvgUODiQkdkf5xzwoSsyAqodjz4PcfBMJa+bGDUqELXIxMruNEv1J6LSOkEX7ew3eFSW2IIqRpG+eeF9IS9Jl6VDo6RQ87wlwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8049.namprd11.prod.outlook.com (2603:10b6:8:116::6) by
 PH7PR11MB6881.namprd11.prod.outlook.com (2603:10b6:510:200::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Wed, 21 Oct
 2026 06:05:01 +0000
Received: from DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb]) by DS0PR11MB8049.namprd11.prod.outlook.com
 ([fe80::603c:772d:6793:d4eb%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 06:05:01 +0000
From: "Manna, Animesh" <animesh.manna@intel.com>
To: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
 disable timeout
Thread-Topic: [PATCH] drm/i915/cmtg: Disable CMTG after PSR exit to avoid
 disable timeout
Thread-Index: AQHdJjZFYOq1TsypMU+g00F8WbtuebaSOcoAgAABiWCAAAJJAIBuYEwAgAdYuQA=
Date: Wed, 21 Oct 2026 06:05:01 +0000
Message-ID: <DS0PR11MB8049643B520538110EFB41EEF9662@DS0PR11MB8049.namprd11.prod.outlook.com>
References: <20260807055452.2997983-1-animesh.manna@intel.com>
 <220f80c2de131ecf25a869bd9218af30fbbe4b54@intel.com>
 <DS0PR11MB8049B57E8E753BDDBEBE62E9F9D12@DS0PR11MB8049.namprd11.prod.outlook.com>
 <636908b4af9b34f638e05e574e18438ef4f28bc2@intel.com>
 <98843ea9-a6a6-44ea-85fe-270dd84c056c@intel.com>
In-Reply-To: <98843ea9-a6a6-44ea-85fe-270dd84c056c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8049:EE_|PH7PR11MB6881:EE_
x-ms-office365-filtering-correlation-id: 306801a1-d63c-4a14-d159-08df2f393e33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|10070799003|6133799003|22082099003|10067099003|18002099003|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: xw29A4F+fuiWQvN8B94G8IvxyzD6xTnd+0HlRYkTvh9S+KbYkr/Nz0DQoFBp5YUjZ+WjSpp3AAMRjqWKuyZ0o1Jc6HdZ/uv+/XegSyOU7B5l7LxWt1rVxchhBrbgjMyIbwnUlft8Ss6xpG0Ruq4DjskjThkPVu33HATPm0sWeO0OgFxNuM7Cfaq+AiUh1h/t9QdUIBKL4myBESyOz8mr9Tbx8her/hZW1ZJJvF6TXCO9TMPa/4vzbNvhDGslVI2zcRE6I9DdDFeTkLImoOHl4AdihtkeVs42uKBltfh1IkGLlGZPBlBkAqCe+9ep18ivNIuOu+0B2UysuFsW6Y8PdfrlXfQEtQLZPw8dDq4FICHxHOpte2rUtVXMncEEMPXx60FPLb3NybJdYRhITOXcmyXEmydhYzktefLjoiabOtOtg47BAcCgGEkGnp7NVU5lsoVWJVDcqij6OL5Eo1LlAhV8ru7aWOz5HJnSh+cek34jiyLui0jRLWELe8dFhIbzH16tcPiVbfbvlY9s4tzWXrMSqFQ7rjyNR3vpfsP/uNcXnCDE68BwaCSJYg3KaGcwje7dyQdurrtCi6vzw9Hm7U760/aaWnBF8qDDuGoLaSv6pBSrUCJk1qwxVf8qvY3HjvV4s1Xy01DRYEjktlJ8Jz2RVl6X4hObJXpGWC4YL0uiBslBmz3JFOkTzG9aFrvyNqx+wz+ZtpQypIcwkUEHMoRcu5MTgvQf5Aw3zwGlFDk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8049.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10070799003)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WDd6ZDhRM1pFT1ZoUkVrSmJSSjhOYjFRVjN3bHMxa2xnS1paYVJtemtPclBL?=
 =?utf-8?B?OVEzVFQrZXRDTW1aZGJvM0FtUjNjTi9sTUlDNHM0RHpzdWx6TmVnNXFzTVox?=
 =?utf-8?B?NHQ3dWh6Qkp3VVpDNXpjOUxXRHhBZTVYZVd2WXMxOHoxYjZJVk9QTnBFQWNk?=
 =?utf-8?B?ZjNjQkhYN3FvSmJLemJRUjY2bzdFVGJCL0lYeVF0QVBnbWlUTlQrd1h0MHlr?=
 =?utf-8?B?T09YWGROek82T2I4d1gwQnp6MU1lUnlyQnNNcitRaTdJS3VvQ05kQ3o4NVpC?=
 =?utf-8?B?RUl4dGhyVVZWZU02YnZPYkVNVlY1amZTYTRZMkUrYmcxdTAwVm5MNG4wYTV1?=
 =?utf-8?B?Q2ltdEVMekFDV3NvY05Eclh0OUMyYXp6dkZ2bDZXYmdXZHZvZlVDeFF1dEc5?=
 =?utf-8?B?eXM2UmxGd1ZvemwvZUdoYU50L3V1dG8wQVhiT0V1RVJrRlZIV29YVlRiTFN5?=
 =?utf-8?B?V0xreUxLdEhNSVNuMWEyM3ZVYUlNWWFVOHNMWG5IT0hzZ3V6T2lvQnN3c3lJ?=
 =?utf-8?B?V1BnZFZkN1NuUDA4dFdTYnN3VHBMNXBvbzR2bTdKSGlIUWl3aC91RGJqc2pU?=
 =?utf-8?B?bnBuQm9sbDdncjMzLy9iaXhHWXhuYmdGM3ZFRzhmT2ViNEU0dHpJMGlxajYr?=
 =?utf-8?B?TjNsMWpFVmVEU1Iwazg5UC9YYjhZNmVVQkRiaStsSHZoU2I4Ykd1b0NRZWlY?=
 =?utf-8?B?V2Z4cVRFbkpLYjVaVC9JdU1MWXlQNjk3bDVsZExlR0d2RmNPczByQmhaRGxa?=
 =?utf-8?B?ODc5U3d6YUs4RktRa0xCWXZWR09uVWhjNGx6NEl3aElzVnlNMjJPdTBCc0Vj?=
 =?utf-8?B?NURoWFhmRW1iSDZOblZmb0hmRDJkQ3I1ZkpXbmpsR0wvL0NkcmJWWVBLTXVD?=
 =?utf-8?B?cFl2bTd5b2YwUkJPeFRhdmw5a1F6N1NadEFWdUY0Q0pSK0F5QXUwVEl4RktT?=
 =?utf-8?B?WW1YdHdFMk1ycitjVzhGbDdyTmpjb0ltN3lTdHZ0b2czeEtTRWd6VWxRSzJE?=
 =?utf-8?B?YVdYSzFSdm9BVzloMSswN2pHdnVRa1V4TENBeDVRQmk5U1gzMHRaZGl4cXg1?=
 =?utf-8?B?NXkxYldtQUc5K1NWc2oxa2hNMlNWN0N5N1pyWnZiWTRONllZbHhqQXhzekRL?=
 =?utf-8?B?RW9MZ1NBQUNvelk1aWJjaU1ZbXRoTDVwYzl2bDdjdUp4R3pvVzVIV093TDB1?=
 =?utf-8?B?TG5rbE9vZDIwNXlTakNPOWRycXUrLzN5ZUo4bnlMVVUwWkVRL1NVR0paV2RC?=
 =?utf-8?B?VXRxNFVmSGZPWkJOcDNJNHdqQ2p0c2h3QUlGVnZnT05xWE9uR2NqdHlwbWtn?=
 =?utf-8?B?WGdyT3JhN2VlOXN1K0lJVDh0LzRaQzR3NU90N011UlhlMzRPOW1JSE9EaE9j?=
 =?utf-8?B?cE5scEtkdVpCajNhN09EWFJST3J1VjQ2TlYzZENGWU94QmphYzR6dzdmdFpo?=
 =?utf-8?B?SFlZTGhtcVdwdE51dkF5d0JhU3lnVFBuZEo3QnBVY21NdFVZd3ZNYVBjMXZa?=
 =?utf-8?B?aVVHNkZpUGNtakROTHIzeFYxb2g5MWNNaHR0aTRabmk4OHZEeHFldlFqSGNJ?=
 =?utf-8?B?aHkwY1ZmU2tJdVM3dVE4c1hxd2hud2dzVElrVjEzcjhyRkNsbHJlOVVNdEZF?=
 =?utf-8?B?a29TRkRHZm4rbTFKMDV1SWZKWWJNWDRaSXJieDB2VFE5NitvNHJqZFZRWEgy?=
 =?utf-8?B?TnhYbXZTcFJoYXhVL2VoRHVnemc1VkFjMDlHS3FFVlh3cGdGOXZjblNhczU5?=
 =?utf-8?B?MXJuTGk0UlhJZE5Rb01MQzVEZGFvOE9rRmNLSUFnaWVhTGI4bDRxTnExOFd1?=
 =?utf-8?B?YTY1TlhJRi9SMUJaRnhvSTRJS0lTbmtCM1lDaEJnN0VnbURVK1o3RGFEdmV6?=
 =?utf-8?B?YWcrUVNKMFVndnVPbmV1QTBuQlpyR2hyMFlZdHhjVVpGTzVHVTdRUlJIWllW?=
 =?utf-8?B?Sng3eSt1TEpFRldZTDlLYm10aUpRM0IyclU1YlFmZFZYM0dka1pENVdJT2hk?=
 =?utf-8?B?Tzd3d0loR0gxZ3dVa0kraENGMStpbG45aEw4eHZQM1EwRVVVOW9IMUFQZi9P?=
 =?utf-8?B?eEFTcFU5bW9yVk9DTzk2SHl0NmMwRWxqNEJGeks0R0ZGS0FNd3BTaytYbysr?=
 =?utf-8?B?YVpxaDJINEN0bElQYktYWkQ0dW53MnpmT1gxZlhkazhMMVNETlBxcjdNSFhL?=
 =?utf-8?B?ems0Ykw5WHpxeUJDcENheTAyenY5YWNQdEtlMHVheVhHcE9nczlrMWN6QjQw?=
 =?utf-8?B?VEhGNDF4N05FNXRPNEpNb0JrZzQ3UHQ4cm5ESndNZTYrbEdNejFPNTZMR2Zu?=
 =?utf-8?B?ZUpnb05XNTV0SUF6QjMwVm9hTVhtWGx3WHhJNWkrQjJCMUJwZTI1UVh0OWVj?=
 =?utf-8?Q?p/7/ij0UszHPJojE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0qt5Pn/tsWOKAJJQbjENLE4WFBpIjE1WmwER5+JVTRjI1uhlQ8gpXQeE3jo+X2W2z7sY7Aa5F0IZMECx/u7ZbiTZnV8rSFoO/gTIv3bwM9q+/vpWWusAdnV5RJYRWxJVDQpqv1Pidpe3qRFMz+BS13NwiNqAVjK7rNON321SRTydLVnGqDhbaameXWG9LWmjhFW7RInhK0tJ64sQf3Yy2sDXLhZT4+3QMH5cUseh6w6o6JWZ5JliJapIIlDd5ATD/qTTOqjVvvZ3DdPXlemTLbOqthsB+tSA5HimFBaMWQeeuFjZtVsV+W4m9CZr6YW4WvB+eNWOp0m7qtG5BvQQkg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8049.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 306801a1-d63c-4a14-d159-08df2f393e33
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 06:05:01.3064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +CrK69zDbmak6I6UlnvKY7S0Bm+epdQMrkOT/1YLrDk5qZMW5FsDM0gj7v28XQCjQNJvKY4dycuhzEuARNsKKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6881
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGliaW4gTW9vbGFrYWRh
biBTdWJyYWhtYW5pYW4NCj4gPGRpYmluLm1vb2xha2FkYW4uc3VicmFobWFuaWFuQGludGVsLmNv
bT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDE2LCAyMDI2IDc6MjAgUE0NCj4gVG86IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+OyBNYW5uYSwgQW5pbWVzaA0KPiA8
YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBpbnRlbC0NCj4geGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBTaGFua2FyLCBVbWEg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUv
Y210ZzogRGlzYWJsZSBDTVRHIGFmdGVyIFBTUiBleGl0IHRvIGF2b2lkDQo+IGRpc2FibGUgdGlt
ZW91dA0KPiANCj4gT24gOC83LzIwMjYgMTo0NiBQTSwgSmFuaSBOaWt1bGEgd3JvdGU6DQo+ID4g
T24gRnJpLCAwNyBBdWcgMjAyNiwgIk1hbm5hLCBBbmltZXNoIiA8YW5pbWVzaC5tYW5uYUBpbnRl
bC5jb20+DQo+IHdyb3RlOg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+
IEZyb206IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+DQo+ID4+PiBT
ZW50OiBGcmlkYXksIEF1Z3VzdCA3LCAyMDI2IDE6MzMgUE0NCj4gPj4+IFRvOiBNYW5uYSwgQW5p
bWVzaCA8YW5pbWVzaC5tYW5uYUBpbnRlbC5jb20+OyBpbnRlbC0NCj4gPj4+IGdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+Pj4gQ2M6
IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT47IERpYmluIE1vb2xha2Fk
YW4NCj4gPj4+IFN1YnJhaG1hbmlhbiA8ZGliaW4ubW9vbGFrYWRhbi5zdWJyYWhtYW5pYW5AaW50
ZWwuY29tPjsgU2hhbmthciwNCj4gVW1hDQo+ID4+PiA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPg0K
PiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2k5MTUvY210ZzogRGlzYWJsZSBDTVRHIGFm
dGVyIFBTUiBleGl0IHRvDQo+ID4+PiBhdm9pZCBkaXNhYmxlIHRpbWVvdXQNCj4gPj4+DQo+ID4+
PiBPbiBGcmksIDA3IEF1ZyAyMDI2LCBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVs
LmNvbT4NCj4gd3JvdGU6DQo+ID4+Pj4gQ01URyBpcyBlbmFibGVkIGluIHN5bmMtdG8tcG9ydCBt
b2RlLCBzbyBpdHMgcnVubmluZyBzdGF0ZQ0KPiA+Pj4+IChDTVRHX1NUQVRFKSBjYW4gb25seSBj
bGVhciB3aGlsZSB0aGUgcG9ydCBpcyBhY3RpdmVseSB0aW1pbmcuIEluDQo+ID4+Pj4gaHN3X2Ny
dGNfZGlzYWJsZSgpIHRoZSBDTVRHIHdhcyB0b3JuIGRvd24gYXQgdGhlIHZlcnkgYmVnaW5uaW5n
IG9mDQo+ID4+Pj4gdGhlIHNlcXVlbmNlLCBiZWZvcmUgdGhlIGVuY29kZXJzIHdlcmUgZGlzYWJs
ZWQuIEF0IHRoYXQgcG9pbnQgUFNSDQo+ID4+Pj4gbWF5IHN0aWxsIGJlIGFjdGl2ZSBvbiB0aGUg
ZURQLCBsZWF2aW5nIHRoZSBwb3J0IHRpbWluZyBnZW5lcmF0b3INCj4gPj4+PiBpZGxlLiBBcyBh
IHJlc3VsdCwgYWZ0ZXIgY2xlYXJpbmcgQ01UR19FTkFCTEUgdGhlIHdhaXQgZm9yDQo+ID4+Pj4g
Q01UR19TVEFURSB0byBjbGVhcg0KPiA+Pj4gbmV2ZXIgY29tcGxldGVzIGFuZCB0cmlnZ2VyczoN
Cj4gPj4+PiAgICB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dIENNVEc6IEEgZGlzYWJsZSB0aW1lb3V0
DQo+ID4+Pj4gICAgV0FSTklORzogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9j
bXRnLmM6MjA1DQo+ID4+Pj4gaW50ZWxfY210Z19kaXNhYmxlKzB4MzMxLzB4M2QwIFt4ZV0NCj4g
Pj4+Pg0KPiA+Pj4+IFRoaXMgaXMgaW50ZXJtaXR0ZW50bHkgc2VlbiB3aXRoIGlndEBrbXNfaGRy
QGJwYy1zd2l0Y2gtc3VzcGVuZCwNCj4gPj4+PiB3aGljaCByZXBlYXRlZGx5IGN5Y2xlcyB0aGUg
ZURQIGluIGFuZCBvdXQgb2YgUFNSIGFjcm9zcw0KPiBzdXNwZW5kL3Jlc3VtZS4NCj4gPj4+Pg0K
PiA+Pj4+IE1vdmUgdGhlIENNVEcgZGlzYWJsZSB0byBhZnRlciBpbnRlbF9lbmNvZGVyc19kaXNh
YmxlKCkgKHNvIFBTUiBpcw0KPiA+Pj4+IGV4aXRlZCkgYnV0IGJlZm9yZQ0KPiA+Pj4+IGludGVs
X2VuY29kZXJzX3Bvc3RfZGlzYWJsZSgpL2ludGVsX2RwbGxfZGlzYWJsZSgpLA0KPiA+Pj4+IHNv
IHRoZSB0cmFuc2NvZGVyIHRpbWluZyBnZW5lcmF0b3IgYW5kIHBvcnQgUExMIGFyZSBzdGlsbCBh
Y3RpdmUNCj4gPj4+PiB3aGlsZSBDTVRHX1NUQVRFIGlzIHBvbGxlZC4gVGhlIG9yZGVyaW5nIHJl
cXVpcmVtZW50IG9mIGRpc2FibGluZw0KPiA+Pj4+IENNVEcgYmVmb3JlIHRoZSB0cmFuc2NvZGVy
IGFuZCBwb3J0IFBMTCBhcmUgYnJvdWdodCBkb3duIGlzDQo+IHByZXNlcnZlZC4NCj4gDQo+IFRo
ZSBuZXcgQ01URyBkaXNhYmxlIHBvc2l0aW9uIHByZXNlcnZlcyB0aGUgb3JkZXJpbmcgYmVmb3Jl
IHRyYW5zY29kZXIgYW5kDQo+IFBMTCBzaHV0ZG93biwgc28gdGhlIGNoYW5nZSBpbiBwbGFjZW1l
bnQgc2VlbXMgdmFsaWQuDQo+IA0KPiBIb3dldmVyLCBJIHRyYWNlZCB0aGUgUFNSIGZsb3cgaW4g
dGhlIGNvZGUsIHdpdGggc29tZSBoZWxwIGZyb20gYW4gTExNLCBhbmQNCj4gdGhlIGZsb3cgaXMg
YXMgZm9sbG93czoNCj4gMS4gYGludGVsX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVzKClgIGNhbGxz
IGBpbnRlbF9wcmVfcGxhbmVfdXBkYXRlKClgIGZvcg0KPiBDUlRDcyByZXF1aXJpbmcgYSBtb2Rl
c2V0Lg0KPiAyLiBgaW50ZWxfcHJlX3BsYW5lX3VwZGF0ZSgpYCByZWFjaGVzIGBpbnRlbF9wc3Jf
cHJlX3BsYW5lX3VwZGF0ZSgpYCwgd2hpY2gNCj4gY2FsbHMgYGludGVsX3Bzcl9kaXNhYmxlX2xv
Y2tlZCgpYCB3aGVuDQo+IGBpbnRlbF9jcnRjX25lZWRzX21vZGVzZXQobmV3X2NydGNfc3RhdGUp
YCBpcyB0cnVlLg0KPiAzLiBgaW50ZWxfcHNyX2Rpc2FibGVfbG9ja2VkKClgIGRpc2FibGVzIFBT
Ui9QU1IyL1BhbmVsIFJlcGxheSwgd2FpdHMgZm9yIHRoZQ0KPiBzdGF0dXMgdG8gYmVjb21lIGlk
bGUsIGRpc2FibGVzIFBTUiBvbiB0aGUgc2luaywgYW5kIGNsZWFycyBgcHNyLmVuYWJsZWRgLg0K
PiA0LiBBZnRlciBwbGFuZSBkaXNhYmxlLCBgaW50ZWxfb2xkX2NydGNfc3RhdGVfZGlzYWJsZXMo
KWAgY2FsbHMNCj4gYGhzd19jcnRjX2Rpc2FibGUoKWAuDQo+IDUuIExhdGVyLCBgaW50ZWxfZW5j
b2RlcnNfZGlzYWJsZSgpYCBjYWxscyBgaW50ZWxfZGRpX2Rpc2FibGVfZHAoKWAsIHdoaWNoIGNh
bGxzDQo+IGBpbnRlbF9wYW5lbF91bnByZXBhcmUoKWAgYW5kIGBpbnRlbF9wc3JfZGlzYWJsZSgp
YC4gQXQgdGhpcyBwb2ludCwgUFNSIHNob3VsZA0KPiBhbHJlYWR5IGJlIGRpc2FibGVkLCBtYWtp
bmcgdGhpcyBQU1IgZGlzYWJsZSBjYWxsIGEgbm8tb3AuDQo+IA0KPiBCYXNlZCBvbiB0aGlzIGZs
b3csIFBTUiBleGl0cyBiZWZvcmUgYGhzd19jcnRjX2Rpc2FibGUoKWAgZGlzYWJsZXMgQ01URy4N
Cj4gTW92aW5nIHRoZSBDTVRHIGRpc2FibGUgYWZ0ZXIgYGludGVsX2VuY29kZXJzX2Rpc2FibGUo
KWAgdGhlcmVmb3JlIGRvZXMgbm90DQo+IGFwcGVhciB0byBjaGFuZ2UgdGhlIFBTUiBleGl0IG9y
ZGVyaW5nLg0KPiANCj4gSXMgdGhlcmUgYW5vdGhlciBQU1IgZmxvdyBJIG1pZ2h0IGhhdmUgbWlz
c2VkPw0KPiBEbyB3ZSBoYXZlIGFueSBsb2dzIHNob3dpbmcgdGhhdCBQU1IgaXMgc3RpbGwgYWN0
aXZlIHdoZW4gdGhlIENNVEcgdGltZW91dA0KPiBvY2N1cnM/DQoNCllvdSBhcmUgcmlnaHQsIFBT
UiBleGl0IGlzIG5vdCB0aGUgcm9vdCBjYXVzZS4gRGVsYXlpbmcgQ01URyBkaXNhYmxlIEkgZmVl
bCBpcyBoZWxwaW5nLg0KVGhpcyBpc3N1ZSBpcyB2ZXJ5IGhhcmQgdG8gcmVwcm9kdWNlLg0KSSB3
aWxsIG1vZGlmeSB0aGUgY29tbWl0IGRlc2NyaXB0aW9uIGluIG15IG5leHQgdmVyc2lvbi4NCg0K
PiANCj4gUGxlYXNlIGFsc28gYWRkIHRoZSBhcHByb3ByaWF0ZSBgRml4ZXM6YCB0YWcuDQoNClll
cy4NCg0KUmVnYXJkcywNCkFuaW1lc2gNCg0KPiANCj4gPj4+Pg0KPiA+Pj4+IENjOiBEaWJpbiBN
b29sYWthZGFuIFN1YnJhaG1hbmlhbg0KPiA+Pj4+IDxkaWJpbi5tb29sYWthZGFuLnN1YnJhaG1h
bmlhbkBpbnRlbC5jb20+DQo+ID4+Pj4gQ2M6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRl
bC5jb20+DQo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQW5pbWVzaCBNYW5uYSA8YW5pbWVzaC5tYW5u
YUBpbnRlbC5jb20+DQo+ID4+PiBGaXhlczogPw0KPiA+Pj4gQ2M6IHN0YWJsZSA/DQo+ID4+IFN1
cmUsIHdpbGwgYWRkIGluIG5leHQgdmVyc2lvbi4NCj4gPiBJZiB0aGVyZSBpcyBubyBuZXh0IHZl
cnNpb24gb3RoZXJ3aXNlLCB5b3UgZG9uJ3QgaGF2ZSB0byBhbmQgc2hvdWxkDQo+ID4gbm90IHNl
bmQgYSBuZXcgdmVyc2lvbiBqdXN0IHRvIGFtZW5kIHRoZXNlIHRyYWlsZXJzLiBKdXN0IHJlcGx5
IHdpdGgNCj4gPiB0aGVtIHRvIHRoZSBwYXRjaC4NCj4gPg0KPiA+IEJSLA0KPiA+IEphbmkuDQo+
ID4NCj4gPj4gUmVnYXJkcywNCj4gPj4gQW5pbWVzaA0KPiA+Pj4+IC0tLQ0KPiA+Pj4+ICAgZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgfCAxOCArKysrKysrKysr
KysrKy0tLS0NCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiA+Pj4+DQo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jDQo+ID4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYw0KPiA+Pj4+IGluZGV4IDgyOWQ3YTQxMWRjYy4uY2M0
ZDIwZmRkYTQ0IDEwMDY0NA0KPiA+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGlzcGxheS5jDQo+ID4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlz
cGxheS9pbnRlbF9kaXNwbGF5LmMNCj4gPj4+PiBAQCAtMTc5MSwxNSArMTc5MSwyNSBAQCBzdGF0
aWMgdm9pZCBoc3dfY3J0Y19kaXNhYmxlKHN0cnVjdA0KPiA+Pj4gaW50ZWxfYXRvbWljX3N0YXRl
ICpzdGF0ZSwNCj4gPj4+PiAgIAkJaW50ZWxfYXRvbWljX2dldF9vbGRfY3J0Y19zdGF0ZShzdGF0
ZSwgY3J0Yyk7DQo+ID4+Pj4gICAJc3RydWN0IGludGVsX2NydGMgKnBpcGVfY3J0YzsNCj4gPj4+
Pg0KPiA+Pj4+IC0JaWYgKGNydGMtPmNtdGcuZW5hYmxlZCAmJiBpbnRlbF9jbXRnX2lzX2FsbG93
ZWQob2xkX2NydGNfc3RhdGUpKSB7DQo+ID4+Pj4gLQkJaW50ZWxfY210Z19zZXRfY2xrX3NlbGVj
dChvbGRfY3J0Y19zdGF0ZSk7DQo+ID4+Pj4gLQkJaW50ZWxfY210Z19kaXNhYmxlKG9sZF9jcnRj
X3N0YXRlKTsNCj4gPj4+PiAtCX0NCj4gPj4+PiAgIAkvKg0KPiA+Pj4+ICAgCSAqIEZJWE1FIGNv
bGxhcHNlIGV2ZXJ5dGhpbmcgdG8gb25lIGhvb2suDQo+ID4+Pj4gICAJICogTmVlZCBjYXJlIHdp
dGggbXN0LT5kZGkgaW50ZXJhY3Rpb25zLg0KPiA+Pj4+ICAgCSAqLw0KPiA+Pj4+ICAgCWludGVs
X2VuY29kZXJzX2Rpc2FibGUoc3RhdGUsIGNydGMpOw0KPiA+Pj4+ICsNCj4gPj4+PiArCS8qDQo+
ID4+Pj4gKwkgKiBEaXNhYmxlIENNVEcgYWZ0ZXIgdGhlIGVuY29kZXJzIGFyZSBkaXNhYmxlZCAo
c28gUFNSIGlzIGV4aXRlZCkgYnV0DQo+ID4+Pj4gKwkgKiBiZWZvcmUgdGhlIHRyYW5zY29kZXIg
dGltaW5nIGdlbmVyYXRvciBhbmQgcG9ydCBQTEwgYXJlIHRvcm4NCj4gPj4+PiArZG93bg0KPiA+
Pj4gaW4NCj4gPj4+PiArCSAqIGludGVsX2VuY29kZXJzX3Bvc3RfZGlzYWJsZSgpL2ludGVsX2Rw
bGxfZGlzYWJsZSgpLiBDTVRHIGlzDQo+ID4+PiBzeW5jZWQgdG8NCj4gPj4+PiArCSAqIHRoZSBw
b3J0LCBzbyBpdHMgcnVubmluZyBzdGF0ZSAoQ01UR19TVEFURSkgY2FuIG9ubHkgY2xlYXINCj4g
Pj4+PiArd2hpbGUNCj4gPj4+IHRoZQ0KPiA+Pj4+ICsJICogcG9ydCBpcyBhY3RpdmVseSB0aW1p
bmcuIERvaW5nIHRoaXMgd2hpbGUgUFNSIGlzIHN0aWxsIGFjdGl2ZSBsZWF2ZXMNCj4gPj4+PiAr
CSAqIHRoZSBwb3J0IGlkbGUgYW5kIG1ha2VzIHRoZSBDTVRHX1NUQVRFIGNsZWFyIHdhaXQgdGlt
ZSBvdXQuDQo+ID4+Pj4gKwkgKi8NCj4gPj4+PiArCWlmIChjcnRjLT5jbXRnLmVuYWJsZWQgJiYg
aW50ZWxfY210Z19pc19hbGxvd2VkKG9sZF9jcnRjX3N0YXRlKSkgew0KPiA+Pj4+ICsJCWludGVs
X2NtdGdfc2V0X2Nsa19zZWxlY3Qob2xkX2NydGNfc3RhdGUpOw0KPiA+Pj4+ICsJCWludGVsX2Nt
dGdfZGlzYWJsZShvbGRfY3J0Y19zdGF0ZSk7DQo+ID4+Pj4gKwl9DQo+ID4+Pj4gKw0KPiA+Pj4+
ICAgCWludGVsX2VuY29kZXJzX3Bvc3RfZGlzYWJsZShzdGF0ZSwgY3J0Yyk7DQo+ID4+Pj4NCj4g
Pj4+PiAgIAlpbnRlbF9kcGxsX2Rpc2FibGUob2xkX2NydGNfc3RhdGUpOw0KPiA+Pj4gLS0NCj4g
Pj4+IEphbmkgTmlrdWxhLCBJbnRlbA0KDQo=
