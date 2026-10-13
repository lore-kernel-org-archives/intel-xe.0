Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79664CC6B03
	for <intel-xe@archiver.kernel.org>; Tue, 13 Oct 2026 12:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16DF10E7F0;
	Tue, 13 Oct 2026 12:34:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A59710E7EC;
 Tue, 13 Oct 2026 12:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791894852; x=1823430852;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZSuszy+h0+zwS9bS2rz5x7d+w6gbloYDvtUnB+QqrrY=;
 b=kX8d3SWkTkL0yKk0RJNZSVHMqyTc5Ku0t8E7FKwQ3qJQtM/xPrJOR9ht
 WU5FgWOb64bbgRYnUNBzm8v9i1il/1HstnjVXCT7XVzZdRMlcGpasrYFZ
 Sax0yp5mjF+38oeoQVmNdBUe3Z5BtffkI59KNPbmAaKmNXD26kVa3c2Mx
 LgWD9FLglV5k+0q/xMO9xQ+xRGIdqUcsXCjjv9b3shvtW8QNKL+0mWVkP
 W3nf7/QzcEJBcXyK6Fkfd4s24+ZcJBZliphil1fYwYNruf1+LMBevSHQA
 pY3JfaOzizu3eRiHYS/4qHYOMuQMTEY0V7SHmxMfCM2RCdjLbLjVD1dOr g==;
X-CSE-ConnectionGUID: B+OkJSROR2OHoNMGdx6ANg==
X-CSE-MsgGUID: QHzr/CymTuC6+TNwYCYHpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="622170"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="622170"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 05:34:11 -0700
X-CSE-ConnectionGUID: yD2FrtdCS0ODw//UrtJsdA==
X-CSE-MsgGUID: 2/Pi0Hd1SWaZkKUsd9Xh8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1242984"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 05:34:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 05:34:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 05:34:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 05:34:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IllgpG9/DTctnHaZSWfrom4YUMAYsH/3wLsw8plG2T09NrZb7UELGVsE3ioBc3QDjMP+I5ZOjMZYTyUMENoBJ9PL7OBFIq1WJBedJonHeM0TFogK6nmXVu1oHvAJa/sfiQ1ooCZ6y5Xqu6Rbp7jlQ0Z3wpqe8pfTj8eAFYr8DRDBXmspeaIF2i9GVRZ6SKCLxbR62nmrXQd+gxuFglio0xr8iLyeeFcGhTkjRhmDRlGYNzZvZ/THZIA1nDFfcUGfpkhaEhTXiyiA5msg16ryDqkhLIGoa22cu+N639qlhyxrAGx+Q3qANiDdmdkxr1jDvQgg0QtnADKAgVz5MC/32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZSuszy+h0+zwS9bS2rz5x7d+w6gbloYDvtUnB+QqrrY=;
 b=NPJTzc0/pcz0Nli7wCKqyVHKjbOqjbMAnkDnWjti/Fz1F6fmn4Vqtst/Iv/OabHHbYQcn7ofFhXCRaCcpVtaOQKhNVV4ktAht2ZnYYkknHy1cXOFAG9Rk79eiBV5vB4keljzTE82d5PYHOe6rjiO41i9NKdb5pdlL8dNmWxB6vQNFTys8ky4GpgdwPviwUy6f0ielt/fOGFWk3tyz+XhD9TOJJ7D0A5A9vQLYlpcKXaOYiuHyHv0Dh2NsxcisbUkxa5W4s6gLptKI7IDuW18epagOzwwYrF7NEl1Q4t0UyDE4TQeiKvDCmVPWvn/PVZC1iQSHwDpTZbnsdX4z8ZaWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::28) by MW4PR11MB5910.namprd11.prod.outlook.com
 (2603:10b6:303:189::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 12:31:02 +0000
Received: from DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9]) by DS4PPF69154114F.namprd11.prod.outlook.com
 ([fe80::79ab:f4ae:b1c2:61d9%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 12:31:01 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port A
 only
Thread-Topic: [PATCH 2/5] drm/i915/dpll: apply the PLL power save W/A to port
 A only
Thread-Index: AQHdV9oBn6mEPhDl2Eivx5DzTRQ/b7b6KEAAgAFEdZA=
Date: Tue, 13 Oct 2026 12:31:01 +0000
Message-ID: <DS4PPF69154114FE5A707C5339FD36A7CF2EF9E2@DS4PPF69154114F.namprd11.prod.outlook.com>
References: <20261009103552.1864818-1-mika.kahola@intel.com>
 <20261009103552.1864818-3-mika.kahola@intel.com>
 <as0Tgm77ARcfcHQI@ideak-desk.lan>
In-Reply-To: <as0Tgm77ARcfcHQI@ideak-desk.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF69154114F:EE_|MW4PR11MB5910:EE_
x-ms-office365-filtering-correlation-id: 3ff26de3-27a7-4bd6-3216-08df2925d7a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|22082099003|18002099003|260925021911599003|260925022911599003|260925021311599003|10067099003|38070700021|11063799006|5023799004|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: 5PeFPREdRJQSgzD1r46JwW3gjKi+ERB1GqmKUJ3ygPC3J0slhLjIlavmsMn6O5AVW9fT3NZa6sRCqRTvSu6PCbp53ZJ9FMJEXrxlJCD+etVy/G1nBwivh9IKkmtABB5AH5TNit/FzQX1zT12QjY1ppIxfSqLJdhgO/PDrnWYw94VQbQWGQP60qCD0Qw3OVryPv9KpgbllaeKOGJ3GCgrnIGqA9qDTxZ6WjffGxyNBduKK3y21ylsmLhcfs557cSgjvwAGnhXCJd79e8+9IbjQjM4Kt99E0ipDsrqQMqAy/xfCYt4i4NhEbnFIagdXs+ZQAzZdexlKKoo3O2AsaAHUbWfaevFn1sCK62M9qeQix1cf9NoE4PB4GRrGltK3cCUSOGtzMTjUqeaH4BAz7ktOVGnX5zA2ko79bM6NLPsVJz1rj1e2jNzvnAxM13m0dKjqoYibJ4mOsYMZpK1lt0KtwkEj6oKFU9Dbt4JbObhQpdhU2Tn+8+Oto7sVVL5asawMz3iqQlYn5ZkdM7rL6sORhNgPhvaZvRxYsMB7QQEOowm/bTtb4IArPZNuO6BfqlC7akOo4ANWl6ZcZzlIfxQCmZnZ0LbUMiFPrMEykWA6V6+un9v5CSQL1f/2JUVbKtpbWqoMsUNpaz7EKWpOxRdpd7u1KbMvc8cFen/vp3g4wOJ1szQVWMDyU3jUrQlg1erwmt/wXETkk83eQwIWlfQLpijuemt2FZIbh8v44BbJ0o=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF69154114F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(22082099003)(18002099003)(260925021911599003)(260925022911599003)(260925021311599003)(10067099003)(38070700021)(11063799006)(5023799004)(4143699003)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkU2M2lRVk4wbnpaeHJDZnRacGlaaEV4TFRSZDhpS2pKSktSVkswdk43QU9Y?=
 =?utf-8?B?ZS9CM0Q1bHU5UnYzaXo5Y29PRHRtd1U2YlBIT0sydm81WFNtY2ZWWGFJaHFj?=
 =?utf-8?B?eGpFdTdJOGZMOXJNZ2czUEM0R0VRb3gzd2VHYXgwMXVhSXZkRFkwZGxOTWpE?=
 =?utf-8?B?YjdsZGRmbCt3TmNiQ3hvMDBaMmtGdkFHckRhYVhHbGdKOHpJaFVDZldKK3h1?=
 =?utf-8?B?QVF4R2tJR1IwQk4zdytCNnFIeFo0bGVZYTZGMlpLRHVCdXpXdzYvZFhsWXJ4?=
 =?utf-8?B?VDltSlhjcjY5WHcwS042cUpmRThRZFk0NjdTS1Noai9IdjUrdysrdHlyMWVM?=
 =?utf-8?B?dUJnaVhlMHJQSVlFVFBCV25IS3BlQmgrWjdmckRZOFhsSXZNQlp3elNLVXBE?=
 =?utf-8?B?bUlFYVZFd3NES1hEak9IWDJhMGFQSGkzUW9jNGtKdmlnakVJampndmRSZjZz?=
 =?utf-8?B?em03Nk9VeDliRHVXRVdyZlRKSEV2TGgvZ1IwbXV6UlIvbVlUUUVQbE9UR2tw?=
 =?utf-8?B?MDdRdGlVbXJtNHRjUVExY0hXK2dXclFGcEMzRXlWdFowVUFtb1lzWXd6M0Zu?=
 =?utf-8?B?dTFZZzFhbFFsZ3IrVXU2YXhiUTEwaHR1eml5Z3NIektNVWlHVCs5aVFzNG10?=
 =?utf-8?B?ejZnRzdUM0J0b0VUYTFQakQ1SGlYYmJSSzZSUU1YMzZtcmRQVFd6Q3NkU2Zh?=
 =?utf-8?B?V0JqVTVlb2RGRU82MHRDZHA4UWpueVRLdjBqUUlpMkNDQTFvdENGMWF1dlVt?=
 =?utf-8?B?TE10TkpzNlAzcmhwU3g3ais1TFB2Vkc5QyswZ3RpZjRGc3ZVamFVck03d256?=
 =?utf-8?B?Z0tTTGNyd0h3TGVKcEdJN0wvTFM0TWpvODhIYUlHT1haNVZuZ2hUeFFJdDE1?=
 =?utf-8?B?RzhoTVorZjBlSGtvb2FTTFJ4R1h5TlVGL2FHRnRSOFh4YXN5ZlJJSUlDOXRJ?=
 =?utf-8?B?eU1NZ3pMSHJyUWt4Z0dJYTFUbXFYdDRiVUw0QlAvM2xXQlVJOFdhMlhveitG?=
 =?utf-8?B?NktqVWZHQThHMEhaOC9GRnVhQ2JyYktUdzVidGwySHVpVUdpZHpuYmNBYUkx?=
 =?utf-8?B?bTlsdUlvaGx3K3FXVHI1YnY5MWN3VVBJU2h6WjY1aUpuOHdDSS9tNnVreWQ5?=
 =?utf-8?B?QXdIMkNKdVA5TVRBcG9CUmJmS1ZreTBnU0s5aWorZjRscDlHSkljNmhIRld2?=
 =?utf-8?B?eFZXUFZ4R1NaQUFoSUZFN2VheFlVVWF2bUVrVDY2UzU3UFJjZitmWDZlcVZu?=
 =?utf-8?B?dndLU04vWjNQdHE2RUs3RzFDWDVKdkhHbXVxTHdQcElTNWk2a2lLRy9yN1ZT?=
 =?utf-8?B?MFhPY1hidThhQUl1VjBjOHdUYUNHL2hUNnRqbUFqRGpVbW5TS0JKSEtBWUgv?=
 =?utf-8?B?dWptS3liQ2J6UytpeTV3TUdRMnJWRXM0QWpEVmNHRXdzczlaZEREdE93THZX?=
 =?utf-8?B?aUJTaWVmL2M5YVE5YlEwYnl2R3JXSzk2VGdzamtJVUs4d25XazlhSDdtNzZs?=
 =?utf-8?B?eWZCdmk4RHRpaStSRlVoeWhBT3NxVUxBTGxyS3NpUTl4K2dVQTdQTzZqNTI4?=
 =?utf-8?B?RUd0YWllTVFJK1c1TytxbWRUTDZYajRrZC9NZ1c4dnp2Q2Vta0lLaUw2R2V3?=
 =?utf-8?B?L1psOE0xRUpOblUrM1lTVzRNM2VaK29GeUhJYjBlZTNyUmp6Y1E4ZURCRDlj?=
 =?utf-8?B?ZTBGTUVqVUtGUUp5K21vbVZYZ3BTdVVndWhPeUIvclF6TXo4a2hUZkpaNVI0?=
 =?utf-8?B?MkpSVWk3QitkNFZYZTI0dnR6Z2hPdHRPSWdvclYvMUZpekg3WVREYkkxMmFa?=
 =?utf-8?B?MGtROCtDSkN6Sk1Kd0lJeWZzQ1NlRVZmYUduOUtNMmZIaUo2MUN2ZEVMcEd4?=
 =?utf-8?B?OVdJWWF5TEx0cjJzMk0xWG1NeU5pNU1nNEJBSDBQVnlXR1hMdURKMDhvb2dF?=
 =?utf-8?B?WnRBeXEyS2JQY3kvUGhwRDhtSTd6TU9aMk1FcGNZS2FXT0hPWUFpemZRQTgy?=
 =?utf-8?B?NzVxRkNPTlZUTDN4WWhSZHV6YlRGTE9hVW9ZZGVVR0NLQUxXbGdiMnBIalY4?=
 =?utf-8?B?Q0FZNytQdGNOdzY4ampSODFQeHIrbGs0ZnVHUnZRcnZjYXdGeHV0Y1ZLcG0z?=
 =?utf-8?B?OCtraWN3L1BUdU1XNlVUUUtTTWN3MStLYzhkVkt2ZHZPRVNhTndNdlVnejZJ?=
 =?utf-8?B?Y2NqYTJIWWlINC9HUmtGNUhmQ0IvY0N0WUxRdytKaXJjNFBySll1THAvTkpr?=
 =?utf-8?B?QXN1aWQyclhET2xPaUFGazBJMG03RWUrZ21FQmVVdTFUMWNTTU5Vc0taeXM0?=
 =?utf-8?B?MVNoQUQ0Tkx1cGlBQjNOQmh3WXR1TmJ6S2NzdDBaMlREV2VxZHJQZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: m4xh8mG65nvbtT7llDA/4zq623zp+yph+QFq1QikghmxE1Ujz0+VxO6DgLHWjdQkJ1QYmUBacsu4r2QBGZbYS+X1TwnbAQaXZPsVL2rY7WFn74OCmV92/SbPfpQw1GU226aIv2GYmoQNe7F3fS8Mbf7ltexnIIkHTkX9JVLannQfLHEU00A+JNWmtehuVyrfNBlyoR6jNuwTLOp1iS3ovWJhXil6hrWr071Umklrt6PTqYdOUb2iWlpz7snMN4a3ig7q19TtyepQdbj0rUvfQyRPToaZ1KDTk8sVan0hs03plN2NmxixqPs/rkiT6ik/i+/YcUblwSQiiNjKhfTlBg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF69154114F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ff26de3-27a7-4bd6-3216-08df2925d7a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 12:31:01.7534 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEyrvWHOpBx7vWzN7G1ZcOiWNpuYfPJa7i9DAoFSfL69pjVJ/DWtNRS2XaU3sRxx1WlpUm6JX9gc6wEDUmV0Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5910
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBEZWFrLCBJbXJlIDxpbXJlLmRl
YWtAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIDEyIE9jdG9iZXIgMjAyNiAyMC4wNg0KPiBU
bzogS2Fob2xhLCBNaWthIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+IENjOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCAyLzVdIGRybS9pOTE1L2RwbGw6IGFwcGx5IHRoZSBQTEwgcG93
ZXIgc2F2ZSBXL0EgdG8gcG9ydCBBIG9ubHkNCj4gDQo+IE9uIEZyaSwgT2N0IDA5LCAyMDI2IGF0
IDEwOjM1OjQ4QU0gKzAwMDAsIE1pa2EgS2Fob2xhIHdyb3RlOg0KPiA+IFcvQSAxNDAyMjA4MTE1
NCBhcHBsaWVzIHRvIHBvcnQgQSwNCj4gDQo+IFdoZXJlIGlzIHRoZSBhYm92ZSBkZXNjcmliZWQ/
IEkgb25seSBmb3VuZCB0aGF0IHRoZSBXQSBpcyBDMTAgUEhZDQo+IHNwZWNpZmljIGFuZCBjYW4n
dCBzZWUgaG93IHRoZSBwb3J0L1BIWSBBL0IgYmVpbmcgdXNlZCB3b3VsZCBtYXR0ZXIuIEl0DQo+
IHNlZW1zIG1vcmUgbG9naWNhbCB0aGF0IHRoZSBXQSBpcyBuZWVkZWQgd2hlbmV2ZXIgYSBDMTAg
UEhZIGlzIHVzZWQsIGluDQo+IHdoaWNoIGNhc2UgaXQncyBiZWluZyBjb3JyZWN0bHkgYXBwbGll
ZCBpbiB0aGUgV0NMJ3MgQzEwIHBvcnQvUEhZIEIgY2FzZQ0KPiBhdG0uDQoNClRoZSBCU3BlYzog
NzQxNTEgDQoNClRoZSB0aXRsZSBvZiB0aGUgd29ya2Fyb3VuZCBvbmx5IHRhbGtzIGFib3V0IHBo
eSBvbiBwb3J0IEEgdGhhdCBuZWVkcyB0aGlzIGFkZGl0aW9uYWwgcHJvZ3JhbW1pbmcuIEhlbmNl
LCBJIHRoaW5rIGV2ZW4gd2l0aCB0aGUgV0NMIGNhc2Ugd2Ugc2hvdWxkIGxpbWl0IHRoaXMgdG8g
cG9ydCBBLg0KDQpUaGFua3MhDQpNaWthIA0KDQo+IA0KPiA+IGJ1dCBpbnRlbF9lbmNvZGVyX2lz
X2MxMHBoeSgpIGFsc28gbWF0Y2hlcyBQSFkgQiBvbiBXQ0wsIHNvIHRoZSBXL0ENCj4gPiByYW4g
b24gcG9ydCBCIHRoZXJlLiBGaWx0ZXIgb24gUEhZX0EuDQo+ID4NCj4gPiBPbiBQVEwgbm90aGlu
ZyBjaGFuZ2VzLCBpbnRlbF9lbmNvZGVyX2lzX2MxMHBoeSgpIGFscmVhZHkgbWF0Y2hlZCBwb3J0
DQo+ID4gQSBvbmx5LiBNVEwgYW5kIExOTCBhcmUgbm90IGFmZmVjdGVkIGVpdGhlciwgdGhlIFcv
QSBpcyBmb3IgUFRMKy4NCj4gPg0KPiA+IEFzc2lzdGVkLWJ5OiBDb3BpbG90OmNsYXVkZS1vcHVz
LTUNCj4gPiBTaWduZWQtb2ZmLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29t
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwbGxf
bWdyLmMgfCA2ICsrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHBsbF9tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfZHBsbF9tZ3IuYw0KPiA+IGluZGV4IGU4OTliMmViMDg3MS4uMTY0ZmU3MTA0NTQ1IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9t
Z3IuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBsbF9t
Z3IuYw0KPiA+IEBAIC01MjI2LDggKzUyMjYsNyBAQCBzdGF0aWMgdm9pZCBzYW5pdGl6ZV9kcGxs
X3N0YXRlKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5LA0KPiA+ICAgKiBUaGUgZGVkaWNh
dGVkIGRpc3BsYXkgUEhZcyByZXNldCB0byBhIHBvd2VyIHN0YXRlIHRoYXQgYmxvY2tzIFMwaXgs
IGluY3JlYXNpbmcgaWRsZQ0KPiA+ICAgKiBzeXN0ZW0gcG93ZXIuIEFmdGVyIGEgc3lzdGVtIHJl
c2V0IChjb2xkIGJvb3QsIFMzLzQvNSwgd2FybSByZXNldCkgaWYgYSBkZWRpY2F0ZWQNCj4gPiAg
ICogUEhZIGlzIG5vdCBiZWluZyBicm91Z2h0IHVwIHNob3J0bHksIHVzZSB0aGVzZSBzdGVwcyB0
byBtb3ZlIHRoZSBQSFkgdG8gdGhlIGxvd2VzdA0KPiA+IC0gKiBwb3dlciBzdGF0ZSB0byBzYXZl
IHBvd2VyLiBGb3IgUFRMIHRoZSB3b3JrYXJvdW5kIGlzIG5lZWRlZCBvbmx5IGZvciBwb3J0IEEu
IFBvcnQgQg0KPiA+IC0gKiBpcyBub3QgY29ubmVjdGVkLg0KPiA+ICsgKiBwb3dlciBzdGF0ZSB0
byBzYXZlIHBvd2VyLiBUaGUgd29ya2Fyb3VuZCBpcyBuZWVkZWQgb25seSBmb3IgcG9ydCBBLg0K
PiA+ICAgKg0KPiA+ICAgKiAxLiBGb2xsb3cgdGhlIFBMTCBFbmFibGUgU2VxdWVuY2UsIHVzaW5n
IGFueSB2YWxpZCBmcmVxdWVuY3kgc3VjaCBhcyBEUCAxLjYyIEdIei4NCj4gPiAgICogICAgVGhp
cyBicmluZ3MgbGFuZXMgb3V0IG9mIHJlc2V0IGFuZCBlbmFibGVzIHRoZSBQTEwgdG8gYWxsb3cg
cG93ZXJkb3duIHRvIGJlIG1vdmVkDQo+ID4gQEAgLTUyNDUsNiArNTI0NCw5IEBAIHZvaWQgaW50
ZWxfZHBsbF9wb3dlcl9zYXZlX3dhKHN0cnVjdCBpbnRlbF9kaXNwbGF5ICpkaXNwbGF5KQ0KPiA+
ICAJCWlmICghaW50ZWxfZW5jb2Rlcl9pc19kaWdfcG9ydChlbmNvZGVyKSkNCj4gPiAgCQkJY29u
dGludWU7DQo+ID4NCj4gPiArCQlpZiAoaW50ZWxfZW5jb2Rlcl90b19waHkoZW5jb2RlcikgIT0g
UEhZX0EpDQo+ID4gKwkJCWNvbnRpbnVlOw0KPiA+ICsNCj4gPiAgCQlpbnRlbF9jeDBfcGxsX3Bv
d2VyX3NhdmVfd2EoZW5jb2Rlcik7DQo+ID4gIAl9DQo+ID4gIH0NCj4gPiAtLQ0KPiA+IDIuNDMu
MA0KPiA+DQo=
