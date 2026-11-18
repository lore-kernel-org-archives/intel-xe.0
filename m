Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AF606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 20:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BCgZGtJc;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=mx+HebWv
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A8C10E04F;
	Wed, 18 Nov 2026 20:46:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AA7310E04F
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Nov 2026 20:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795034750; x=1826570750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Jrxu2YZPMPZNlI/TMhkV91mPSRLFGxpyB6p6pv692rM=;
 b=BCgZGtJcD3qmQZWbDBHnarPcLNjmkHT0L+sy2+TcKta8ucRMjwl7U+xE
 xRoe83r/yyumWJhdp3rpumIqpmqcIOFttH2v9de+X+oWKLW2FcEJwlibO
 0jJ1RFc0zKwimWbQPvfTpDCgFGoWDup/i+qR1aah4i8W2J/Y4fUJgUWYZ
 X5GYuQ0zbGCy6eEMDZytmYPNQoL2+gMTJDYl5NHiv1Wze6WgjMi18SJiX
 KaO3ULmCSU3F98rE/qvkNZ6APEk6cvx5FN9WFoXArH7sq/0KuCq2zdCSX
 VdysOwx098XNfiAaE3mYmFjuJhJ/dmcFB1Nj7J8ajU7MSiwmxuTXqjnmE A==;
X-CSE-ConnectionGUID: Buvjgxc6Q3+8RDgkKstriw==
X-CSE-MsgGUID: AeffxnITR2qGBePyWpNgYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3725371"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3725371"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:45:50 -0800
X-CSE-ConnectionGUID: 4e0Q5drtQMu707jnuCuVqQ==
X-CSE-MsgGUID: EOc5gO0WTeme+NeyXHt9dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10044817"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 12:45:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 12:45:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 12:45:49 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 12:45:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pyRW6tFj5s1sIUBSFXRanWtXEe1Fo1A+b0SyuVJEaEQMoLv1l+JfvXNiXKOvpdfsGSNRnwEp2nyzUdODA71otCf+8NtOAuhHFDk3EGbFKKlK1D2aQRpd/dly3hM/RSAplvVrFq0nNXcZtcfFfgd8T+77/LWYgIDkkZXX9Bv4lksm4Z6eOvMCCiGM/rLb//jQhP62WwZ+r9+cZ8oJKBwznqAmuW3+sUOEkxqdKt/my4Lih1tAitbr1lRvA00VtLdqiIrEvWGnAJul9TK0yNwjjFkjLz8irksthG9piW2GAox3lYTyNWMD4Xjr6CHv9cQUymQM0EnWlGTR5doWqQz+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jrxu2YZPMPZNlI/TMhkV91mPSRLFGxpyB6p6pv692rM=;
 b=wOUq9doXKKI58gwDJEVR3r2rFTLxxH7WA5BUp6Rchrd+C/LajRQV85dqRbbaQ1+ugWvV0Gu2hqClytBEbGuP3YKyembjBoQfpggPb6+LZub9600MRxHiuY+NYUI6szIDONTs1G7Zsugy3p+xKnjk7TGbDl5C2AIYDEbq4+lHi0bjTDp/B+j3LnxJUwE1wD+pCYQ5Vi5J4U2cazo+Fctxy6Ki1OirLHsuYfRp+H9yJjFNP7p4nEzXiUHPUmdKWsgGUBhuCzU+s2KOmDGScm7Y21xcVJ6QW7PnP50BDdoTyR75o3a9pKGyEMAVgK6zeEykr1l6K8IloH0yFjv75yuLOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jrxu2YZPMPZNlI/TMhkV91mPSRLFGxpyB6p6pv692rM=;
 b=mx+HebWvffihPji5fR6HdIV6KBbyaJ8fq3jpCHZPuqTMSEVjCEzpBt0ZjvFVNbtUR/dXhsdQHhv21rZRkKtJbAWON31+Fgcz/gatwhlmOP4Ln8kMNF9sVIH0xBvypADmLWMH19dxfVJPP6zcBhv4UJ8aC0xc9lW2yv3f+PN53K8=
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 (2603:10b6:170:10a::16) by CY5PR11MB6367.namprd11.prod.outlook.com
 (2603:10b6:930:39::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 20:45:41 +0000
Received: from AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b]) by AT6PR11MB072844.namprd11.prod.outlook.com
 ([fe80::520a:561:ace1:e64b%6]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 20:45:41 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 0/2] drm/xe: add debugfs control for per-context ATS enable
Thread-Topic: [PATCH 0/2] drm/xe: add debugfs control for per-context ATS
 enable
Thread-Index: AQHdc4Qxm7MIBDjmlUCzyJNaGsr+j7c0VIGA
Date: Wed, 18 Nov 2026 20:45:41 +0000
Message-ID: <62e13923d059faa1c7e321196ef2bb535b07512e.camel@intel.com>
References: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
In-Reply-To: <20261113151324.2806375-1-naresh.kumar.g@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AT6PR11MB072844:EE_|CY5PR11MB6367:EE_
x-ms-office365-filtering-correlation-id: a6e79b34-d0ee-4a0d-3d4d-08df45b4e8ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|261009223027099003|18002099003|11063799006|56012099006|261026121527099003|261102123227099003|261028144727099003|261026140227099003|261021121427099003|261022105027099003|261022113327099003|38070700021|261022075727099003|10067099003;
x-microsoft-antispam-message-info: d1Q0sTU8KRvJdDL5U6VC6cmiBMbC0Y5KVVQ+260LrMKgzMfo6WU12bbolgb3zfkG7/Av0h1qfhslTpt6+ZsqnFQWkH6LSFA8OyNRbwEh2FLvxHnu4K1TZe6NXHeh/lYVGw7Sw2N0rfaVHVuOe4eqMouJsUU5vmOM1youUocWgITYJpFrQdDfhXiPPTxnv/FCiOCi9gLjRLKlsVS8vzysdFTEHz9egR7zboC34H//Z9zW66KkGvv2BkKj8JiZwpgYoyR+/iOQevepUOgtLTEwQRYwLlQV70IlXlCP1WG7Yd4St2TVvfmTMtdDe6ecXqLLc4g8oasM3IIhXdo8iRNa1iaQnlCdlAOif9aRaVGQGTih4LnsuwWB6M7kV9HvuFUPvk+DoJhWD/lAPWCfahfZm4kN/EFoYXMBjAEIqh5j9seHFvfOJhzHDejuPSa8h2Q2FvF/yh8V1UvGTDSPndKZrl08BSrJ0wkEC6pTMxUKfNfHqmDWCUos1a7sZ3h1yCN/FFSpIVavKrO3U5bmTsFEufpdoiEVOoUVAKSRQp/YZSnVyNaL99lW20q/06g1g33VcADN4wqkIgUBvOeigs82O/BLrP9s+CWl6p0jHGft8UoDOqlyJfRklO6NFHI9cocUSEvWS1onNwFf9tMRqgYtjSv8JFHwgd79y2yDerSEpC+FjJklju3OZzxUQFzZr3gXze1aV69cdsqG7bggmYb7RFcGflLpKZHNJxH7ClAyTdQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT6PR11MB072844.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(261009223027099003)(18002099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022113327099003)(38070700021)(261022075727099003)(10067099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Ykl0UUQ1Ykg2UzVqbllKY3NOd3hNWmdmRDNVRzdmTUdnTkVtUFMxcEpoYlJ3?=
 =?utf-8?B?OE1wS3NUNU5YMytiMUZ2U2tkL29adEViNUlWWm9GRlUzOFIrdlV0WW40N1h5?=
 =?utf-8?B?YzFIa0lkYk5jbHgwQWpZZWgrMGlrWDVjTzhWUFF3Y3RyRVhlNlpneS9oamJ6?=
 =?utf-8?B?YjJXdHdKSjN6R3RkdjhMcTd6OXFHYmpmbkR1czIxRXNsT0FCTnl2VGtjK0h4?=
 =?utf-8?B?M3oxQ3NjSkt0MmxZbFByZ1F1V2tBMTNmTXhRYkt4cjF5OW9LRDQwK1pCWnNy?=
 =?utf-8?B?YUhJV0oxNFlCZDgrUXVyS1N5d1NLTkU5akdKaGlzZjlkbmE1dEo3LzJ5aHpq?=
 =?utf-8?B?MDQzNmNaSlFWR2ZxVnJKMmdMcEFLR3ZZV3dRUUd5anRCT1hHNURzTzAyczA4?=
 =?utf-8?B?VjlDRnF4RStnbGlhcXdqMHVvNzdSRWNVNFRFL3I0RUQzRnpTSVBGcEoxeFhS?=
 =?utf-8?B?VFlxdFAzbENGeEYrWnNNVU9lZ3N1Y2p1MFN5d0lyUWY3UWRhNVgrZFdaNk1h?=
 =?utf-8?B?anVycFBqa201eWpLVmp1SkNzdndHVkgyNXRSZ0s5RncwS3pqTy82dzRoZ3k4?=
 =?utf-8?B?ZDRYUzRHWTZwZFZJdk51c0ozbU9vdzVQU3JrSEhEZHh1aVg3UmJkci9EZnJl?=
 =?utf-8?B?cENHZjhha2NSdHhVNFZ0SDcwQjBET2RtMXFzUGNaaGpBdVRub2owNjZYSmlm?=
 =?utf-8?B?elRtbFhETnIvT2J6ZmtXdk51a0hDODYrT1FpRnRwb1pQVUE0dGRpa0JXbGJ0?=
 =?utf-8?B?REdRWisvNlBTcGkxR2xMSGJKUEVPdEdlc0ZoREpXbXVjV3krbUhEWmtDckZl?=
 =?utf-8?B?NnhpS2JzSERCczg3OFNrT2dBa2pCQ2FGdUZOb1pxYzRGbFVnMDQ4R0JlS1JT?=
 =?utf-8?B?SHI4YlA5cERuRkRsL0pUdUVZWDFLMXFsNmdIKzgwK3FFdVovVHZNRWJIRmpo?=
 =?utf-8?B?Yi9kMUNKY2t3Y1NzWmxicXhUSGtJdXc0Q2VBNXpDclA5c2VobzRrSXB1TFVO?=
 =?utf-8?B?enEyNEJ0RWg0L3NuODlrbklVc2hvNlFUUkNTT3d4WnNLWE1MekM2STA2bzIw?=
 =?utf-8?B?NmJqNXc3dVdtRFd0ejlBVlBPeHNBSjIvdlc4UlJFRWRsdnQ0NGs1cW9nM3Bl?=
 =?utf-8?B?d3BrQjRSMnlnZkpPYWxDS3o4eFVYZXZROHJtSEtMdkJyRVlvWnVUTkNNUGtP?=
 =?utf-8?B?a2VvWVBrU0xLcDlhZ1JjR2FxN3NzdFJrUkdEd2kvZ3dSUFUwZ1ZXanVEeWlU?=
 =?utf-8?B?NXp4Um9ncGFnT3NqYzViclU1cTFaQ0kyd1BIN09xWlpTVTVpbmtBUk90elBT?=
 =?utf-8?B?S1JwL0Q3d2I2K2ZsNFgxdzhQQnRMUlUyL2U4TlJIbVN5eGZuV20rMm9mdm1J?=
 =?utf-8?B?N2M3WERjK2d1WWQ1dk51bXlVY3FFTkg0Rk5iNG93WisxZHpLWElQS0hlRkk0?=
 =?utf-8?B?QkEvblIvR0xISjByK0d4ZWJ2TGdNc0NoaUZSOWZrVDMxU1MrcUFoZTZESVRO?=
 =?utf-8?B?SUs4M01NN0ZqaWZFWi9ZMzlpV1VCUUc5eDJzUVJ0ZHpjbC9KMkh5V1VWMzBE?=
 =?utf-8?B?SEFCUlBPNXlxaXJCYm16Z2NBOVBKV1ZwOXhsdE5ESWQ3TGhJTjhTd2xiNWN5?=
 =?utf-8?B?ZHRuTDJQUjdOTkhuS2h5N3pQVkJuQ2pseDdWc0VzdlYvVjJ2WTNYL2hXdFlP?=
 =?utf-8?B?OGQ0RW5URVQ4cFBnSjl4d3R2SDh4eVFHcVNMbmN4YnBKeGpQYUNPbkdTWkVX?=
 =?utf-8?B?ZTVhSUpKOVdiRVZ4TlN6bkNLM0dOVUhaVzFhcDFod0tXU0NPc2pEM0JZS0dT?=
 =?utf-8?B?TVFsQktzSUtFRFpRcUVwWXFQQlZqREE2SWd5TVl3SWwrcXRMZVp4NXRyUTRV?=
 =?utf-8?B?b1hibk5XWjh3anN5TS9zckJsSmZLWFpxd241cnl6eFJrNXJlQTVQWGpzYlhS?=
 =?utf-8?B?Rzl4bGpoTDR2VUNzOC9JUDVBeTlaYmZKci9sZWFoWnFYZThyRUpodW92TlY5?=
 =?utf-8?B?L0hmNEdYaVVEYXdiL203WFJaMER3TXU4eVFROGltalBDb0ppUkJIYTBLRTRr?=
 =?utf-8?B?Ti9DYUduS2dFemZmN3NjbHdRUHV6QWFFWnQySTQvSUY4WVVmS3Qxb29MY1dB?=
 =?utf-8?B?dGpRdE5Sd2wrZjdXYXRkb3A5K2ZiU3VHajhTUlF6RkRIbEVTakV1cmZGMHI2?=
 =?utf-8?B?VzJmcHBXRkhhSkRmZjRLenY2eEpmNFVDTVY0VTFTRHZkMUtKMmc1Q0h5UHYy?=
 =?utf-8?B?ZEFZWEFJSjRYS3BuL3FuSCt3OEhnOWZtRGxqdEZkbVd1Uk5OTStvamF5b2JS?=
 =?utf-8?B?ZlF6TVY2U2M5Mko4aHM5TG5CU1Fpckx4dVFzWTlVOW0zRlRIMXNKbXYyYVRO?=
 =?utf-8?Q?c5l2sYDwNFt1xkYQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4CA8B1338E143046B6F94496D58BC930@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TUYnK+opdQg+BV/Y+zbhi29rWzn8ik3OI+eoXiCmgMK9y+VrDZBXYNOp9ewyKOz6VGhNsZNtxTCkiVw9T6Od7a+G52NHSpz44osjgYZrrJSLdXNUSPfXwm3qnc/IfJ1VuBE9vJj8nmDcTafwcq+NguFnmBwSGflx4e/77tPDlVUA5PbCWSqUz9AIvoIA0aQ+3yUdNe97sAHerjBeoErCD4ePOFFHKSxfUjZdHJ/bprR8LdX+Fk4jp0VV0Zr+gmukOHP3o+YgpXRthlUY2nEZKNWzeSuHA34rZSmTNAuvwndmSxAF8srmwHYj94ZTbmJ0mZAqlds/o7blKtHTTjCxoQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT6PR11MB072844.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6e79b34-d0ee-4a0d-3d4d-08df45b4e8ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 20:45:41.3983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fnahAdSpGVTCesZnce4HBrfrsQ5EKyy4RbiWYcy6yYGTzU8iOy76uNTLfJWeVtQLywPznJfRJVPUr5oGmxYOx7FL2Y6gUXL+G4Sfh43HM14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6367
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTExLTEzIGF0IDIwOjQzICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IFRoaXMgc2VyaWVzIGFkZHMgYSBkZWJ1Z2ZzLWNvbnRyb2xsZWQga25vYiB0byBm
b3JjZSB0aGUgcGVyLWNvbnRleHQNCj4gQVRTDQo+IGVuYWJsZSBiaXQgaW50byBYZSBMUkMgc3Rh
dGUgZm9yIGhhcmR3YXJlIHZhbGlkYXRpb24uDQo+IA0KPiBUaGUgZmlyc3QgcGF0Y2ggaW50cm9k
dWNlcyBhbiBlbmFibGVfY3R4X2F0cyBkZXZpY2UgZmxhZyBhbmQgZXhwb3Nlcw0KPiBpdA0KPiB2
aWEgZGVidWdmcywgZGVmYXVsdGluZyB0byBkaXNhYmxlZC4gVGhpcyBpcyBpbnRlbmRlZCBzdHJp
Y3RseSBhcyBhDQo+IGRlYnVnL3ZhbGlkYXRpb24gY29udHJvbCBmb3IgU1YvRlYgdGVzdGluZyBv
ZiBwZXItY29udGV4dCBBVFMNCj4gYmVoYXZpb3IuDQo+IA0KPiBUaGUgc2Vjb25kIHBhdGNoIGFk
ZHMgdGhlIHJlbGV2YW50IENUWF9TWVNfUEFTSUQgTFJDIGxheW91dA0KPiBkZWZpbml0aW9uDQo+
IGFuZCBBVFMtZW5hYmxlIGJpdCwgdGhlbiBwcm9ncmFtcyB0aGF0IGJpdCBkdXJpbmcgTFJDIGlu
aXRpYWxpemF0aW9uDQo+IHdoZW4gdGhlIGRlYnVnZnMga25vYiBpcyBlbmFibGVkLiBUaGUgY2hh
bmdlIGlzIGludGVudGlvbmFsbHkgbGltaXRlZA0KPiB0bw0KPiB0aGUgQVRTLWVuYWJsZSBjb250
cm9sIGJpdCBhbmQgZG9lcyBub3QgbW9kaWZ5IFBBU0lEIG9yIFNWQSBiaW5kaW5nDQo+IHN0YXRl
Lg0KPiANCj4gV2l0aCB0aGUga25vYiBsZWZ0IGF0IGl0cyBkZWZhdWx0IHZhbHVlLCB0aGVyZSBp
cyBubyBmdW5jdGlvbmFsDQo+IGNoYW5nZS4NCg0KSXMgdGhlcmUgYSByZWFzb24gdGhpcyBpcyBk
ZWJ1Z2ZzIGFuZCBub3QgY29uZmlnZnM/IFRoYXQgc2FpZCwgaWYgd2UgZG8NCndhbnQgdG8gZ28g
Y29uZmlnZnMgd2UgcHJvYmFibHkgd2FudCB0aGF0IGRlYnVnIGluZnJhc3RydWN0dXJlIHRoZXJl
DQpmaXJzdC4uLg0KDQpJIGd1ZXNzIHRoaXMgbGV0cyB1cyB0dXJuIHRoaXMgb24gYW5kIG9mZiBh
dCBydW50aW1lLi4uIEJ1dCBpcyB0aGVyZQ0KbXVjaCB2YWx1ZSB0aGVyZT8NCg0KVGhhbmtzLA0K
U3R1YXJ0DQoNCj4gDQo+IE5hcmVzaGt1bWFyIEdvbGxha290aSAoMik6DQo+IMKgIGRybS94ZS9k
ZWJ1Z2ZzOiBhZGQgQ29udGV4dCBBVFMgZW5hYmxlIGtub2INCj4gwqAgZHJtL3hlL2xyYzogZ2F0
ZSBwZXItY29udGV4dCBBVFMgZW5hYmxlIGJlaGluZCBkZWJ1Z2ZzIGtub2INCj4gDQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3JlZ3MveGVfbHJjX2xheW91dC5oIHzCoCA0ICsrKw0KPiDCoGRyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZWJ1Z2ZzLmPCoMKgwqDCoMKgwqDCoMKgIHwgNDENCj4gKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlw
ZXMuaMKgwqDCoCB8wqAgNiArKysrDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2xyYy5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKw0KPiDCoDQgZmlsZXMgY2hhbmdlZCwg
NjAgaW5zZXJ0aW9ucygrKQ0KPiANCg0K
