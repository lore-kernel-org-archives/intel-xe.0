Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E0F606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BOT/3Lus
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56C910E298;
	Mon, 26 Oct 2026 06:56:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9CA10E298;
 Mon, 26 Oct 2026 06:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792997778; x=1824533778;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=htgCGgunKNqxsZacM9yGQUiM/n0ZAODVkecvuYXU9AE=;
 b=BOT/3Lusj+9eoXocBhQQPK2SJSO+HSyEvcilvkpG4ejOyy0u3XE+isYs
 YcXcimevuVMAd76TCf6eVCRPQsTGWW5AqnKqQZLkLRXm4iIMpvwP//72P
 db4Ou6r9i8/D/pH3KtRuWLarhpIXkZZgw4Dt3w3hY8GixzT0xbI1Pm70f
 L+5DuHUgV4ZoKQ9/bXiCzuFhRs29XI+zGk3tWCEUyeB92pK0V1aUHDx0U
 viLIEHpVV8Ow1BGnBCtUslSd4/T0gAh1C4RK0MF9wOGF/n5kKdYtck/4I
 kHm5AEsrZs8oWILrer7axs93ohhHddwOuOIlcnGcD+rciLtbVy6YGipw9 Q==;
X-CSE-ConnectionGUID: 5Ts/3kRCQAStp7vGUY+g2A==
X-CSE-MsgGUID: zv4B/riqTRqQK0VcrSCf9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1667807"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1667807"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:56:17 -0700
X-CSE-ConnectionGUID: 9KPqAqbgSU2SUIZGsCFOmQ==
X-CSE-MsgGUID: f9eQlQTISQq070VCyuBXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4288327"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2026 23:56:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:56:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 25 Oct 2026 23:56:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 25 Oct 2026 23:56:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGQ5hcsMk1nxotT3+K1k4wnA/L2mouzSGHj6pzH41AG++tnX7o8qj0I3+zlzmZF4hiHNNxLb435jDicNieMVzlMfC2nRpQpgmL+vJ04orliwCmdmZ7kOr7yjDw9eGPZiwZIcKU1fQHKI7TBtUQ4lEM2ALtdcqtPSjrToqe90vPo5xMd+vIMlxGrOTEDGwpKUiKXwMVydJKoHHogZAXHeNZWu8+Tgq5NX3ZHOW4Of6BgrtmGHSQERmB8sPSiqUDtWn/5lVoe+D7DvEqO5LiNUXCHCPmlYYKbxWRfhXFZZ5E4gb//bbd4D4Q8rGbHnKu0QuRmhP+ehAI9SL1T5tnRtjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htgCGgunKNqxsZacM9yGQUiM/n0ZAODVkecvuYXU9AE=;
 b=Fpexr8ADvqM7kwlTeNLfZpDRstyESylroeOstKpmcV38DcmfT/6JdkAYVqbZkAI4ZYcyDFtk5VCG3vR7u7bsQ6qGt1PE8ItUeEmIA2j1kVICWWtvGLmUsBHTukTTx9gCtbbWE0bIEeUASn3z21KCR7E6IYcF6jsNFVvqay2YTzEniXtHfZRvmYEDAy1sozAwNlMYm1Afbz4dcFZQv+41H0Wgo+K5gU9jgJ+tjATK6dnLs/mdzjEjGDzFNV2BUXCGnbiCmj2iGxIl9uqO97MkA3OkHpwnbMp6unJGlxpB7E38OF5Hg1RPplaYAjjXTIlGVrgCBNYgrj8q5lvm1TOE7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Mon, 26 Oct 2026 06:56:08 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:56:08 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Kahola, Mika" <mika.kahola@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3 8/9] drm/i915/psr: Allow Panel Replay and PSR2 with
 joiner
Thread-Topic: [PATCH v3 8/9] drm/i915/psr: Allow Panel Replay and PSR2 with
 joiner
Thread-Index: AQHdYtV3svCZ/ficL06HI1SoUfBTELcPaHoA
Date: Mon, 26 Oct 2026 06:56:07 +0000
Message-ID: <65340b056d48a5dc511ac636a1b3efea2a1f479e.camel@intel.com>
References: <20261023100052.683192-1-mika.kahola@intel.com>
 <20261023100052.683192-9-mika.kahola@intel.com>
In-Reply-To: <20261023100052.683192-9-mika.kahola@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH0PR11MB4998:EE_
x-ms-office365-filtering-correlation-id: 5d008c09-920c-44e0-923c-08df332e3631
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info: J/8+prPYJH64Sc4kM9D6h8tAXe/k91o4ds6GcgBn9OKKEXpcKNC83maO5XRG3+kdU2CMwQsQtWuxOY64f/QCIcmXcy70ZVl/3TqLeBjUaaVj9xrqdbFcSR2gtz/Ckm24KLYIE13gkeDIXfzSkNS+eSzcIzrb5g6C4SIExrjxI980r1G528X6lqNP992kdipTKVaIPB2Rk5Hik/zZmHg2P+/fyUl7wLxTZUbd36iF9zxyC5O9cCcvdDQiE/za0/lTCLS/X3AAZ/2T0ZMfAMSbPgUT0EDzjym/h3oQrszxgx9KyK+RrqsjfGZJ4959L2jSPaTewnOi+Pgc1zIzRJrV2npv+kgpD7CcA0kt9NZsPuyI8Ami1Ip1AJMD5aVIT43M7fG5Rok2PKEIRGvoH8QQB+xCJbmgZ8ZWVNOLwnIp5QDRR4qfGiJoaoZ3tZ8mBdyG1L9wTr8AXG8PWWDNvS2Dd2RmPgYMdRd49LPUluVSbAxfC20h9hiOgEx/huJf1YcthOy834otKQCjzlVjYp31AhM+Kph9WscAOAooj1iHO+CjWSUWNp2D6xzOPKr2ccSOwxE2nKrLdFdIMfMpLHQ1VD/1KzxPt1J4Z6ncUrUDioiFiAxyOY3VBN0IDJIJC9s70eKps9jFtolbkrroo12p/3VgzlW1jlbA+ubNAeEgRY4u3BX0g1OYMiptxWgOeWHR3BVnqFxhN65TzQvivvKLlRRquL2I77KqIj3NO+qD6Yg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QlZLWlN3ZTQxMC9UaDBQNkt6ZUt2UmNaTWdGaVd3ZWVJbWg0cGorczFKSHpP?=
 =?utf-8?B?Zk1sREI2OGlqVWtPaXkxR0lBZnh6RnFMT0xnblFHRHdtQkJBZEZRb0dPYjNY?=
 =?utf-8?B?NGZlRVZZTFBUd1ZVOHB4akgvS0FsQWFIWnVZK0c0RWZFOHlOakdDL2hNOXRk?=
 =?utf-8?B?VHIyNGhvSTBLZ2VKd2xjSDFlM09hWWdmYUZHcmhTajR3WGJFMlVaWElpR1FN?=
 =?utf-8?B?Wm9XTXE5dWVmbGJCRFF5YU54dmNVVmxFWVJCbW1LdjZZdFBjNXF0TUd0amhu?=
 =?utf-8?B?LzVCeXlueVc5Q0tSS3JvQmJNVE5CT3p6Rk9vSitTQVRORUloYVpydndtUk92?=
 =?utf-8?B?ZnNnNEgvdU4xYk9nUTEydEw1a0NyRWYxRUV3Zi9aWjFBVmJuT0QyNXNOYUV4?=
 =?utf-8?B?RTN1Q0lkY2pUZ3phODZTcTdRUUVPb1RLUzF6b0VEaW1lMWVkajBVQkVwb0tX?=
 =?utf-8?B?NTdqZE9SaVlvNnlsa2pQcTVWbUU5Sjd5SHNxU0ZuS2lWZmtMQTVqMXdoVDVl?=
 =?utf-8?B?SkpXejRKa01oTEh0SDh6SXdseWlmL0lLRXNmTWZEWkZheVNYZEhFUWE0T1c5?=
 =?utf-8?B?ZFZYZ1YrUnY0Q0RwR293d2FSUU1MbERnTWRWdS8yN0tsS3lFWTlHSGtNM1FH?=
 =?utf-8?B?T2dkSlZmNDN6UytkT29BMzZLSEhyTmYyTGlvVEJYbGNzMGtCSjVsdzZGZGFt?=
 =?utf-8?B?NGU3bVp1MUo1MkdHbUN5WXAvK3ZUYlFENGxSSzQreTZyMUhIbEpYUksrTTBs?=
 =?utf-8?B?a1pEUG9VVHN5WjhyN2VaUHFudkp1dnhzekR0K0xHNmFENmgwMXlGb0lZQmsy?=
 =?utf-8?B?UHRhdC8rc1VoY0NOTTh1b2pPcVdQRVJOSVE0ZGpjK3Y2cTZ1bEp5KzRzZjZk?=
 =?utf-8?B?QWdZU1YvVFZGTnBuMUdISEh6WFNRRXJPMzlvbGd0ZjgxbW9PNUdIUXUxVUdU?=
 =?utf-8?B?Vys2OGtpTDBlOTBHZ3BCSG5RZDdwMkwrYWxpZ1JGVmZCNWxFOGNGOFRLbnJ4?=
 =?utf-8?B?S096bVJlMmJBcTF4SzVBMWJQVFFxZkhmY2xFcVd4N1U4aFdqZ3JQZFhEd3Ns?=
 =?utf-8?B?dldEUzdEVjd3R3dhQUhtUnhSQVVwOWRJYmNWWnVBWkJRd0JhYzE5QUVkUkRy?=
 =?utf-8?B?c1FMVStJTmlVY2d4RWdVMWFXeit0NXBReFZEMlQ5UDlubmhUZW43RkRvK2ZX?=
 =?utf-8?B?bEtlaDJRbG1qaGxKeWVwWDFuVG1YRUpPS3RibzF1R0psR284UER2VytIRWM1?=
 =?utf-8?B?RXhCYUdqY3Q2UWRJWDBqM1ZsNVVwZ3FqblQ0ZVQydHd3UjlrdThIZVk0VFdw?=
 =?utf-8?B?UjNDR3JjenBNQnlsRWhleUhQaTVvRWJFK2oveUxvRjY0KzB5aEl5QmQ0RlNr?=
 =?utf-8?B?bndUN01WMTVQM2tuV0wyV1M4RThjMGJOVGJJMS9Nc3ZZUzZWRkdFMnY4cklY?=
 =?utf-8?B?eXpRMHExVVZsb0dldmR5ZDl6aHMzaCtMTHlvRWs5Y2lIekJRaEF4VmtCRmxz?=
 =?utf-8?B?SVl1dVpGZ0s5bERuN1hpWGY0SGgyWHdnejhMU2M0SlJ4UURjcEhNL0ZSaVZI?=
 =?utf-8?B?U202RElYb0xySUtSRXFQeTNzU3NzTHZ1UU5kNHNQY1lhd3Vpc0Q1aXo4QUFt?=
 =?utf-8?B?M2U3b28yVy9pVVVMaEIwOUZRTndjZktiS3l4dGZwUTZxUCtFNW9NeGU2L21j?=
 =?utf-8?B?d2JCejVWZ2pkSEdUenhNUDhtTk02S3E3WXFTWGxRcGFjZFlPYi9jTXdoVCsv?=
 =?utf-8?B?ZEpXbVNWOFZDcmV3a2ZjQ0Z6NWxwMWFVMjZJTmExSldTS3l0TzEyZjhtaVU4?=
 =?utf-8?B?aXNvWXYzZkJseW55eWpuU3I4QkF4WGJER0dpc3dsMnBjZnBsWS9KNXBldklH?=
 =?utf-8?B?K0ltMXJPUTJHdmpsazVwc1hOajFmVUJBcjFPMDk2azlJVHpDdkw1NVI2T25v?=
 =?utf-8?B?UG9oNm1DUk1KenRBQkN4VStEbEUrZW9iY2lJdEs5T0piNUdDSmY2Rkp0enpT?=
 =?utf-8?B?NGo5MDBWbGp4RERndmhmSWpJb2V0ellVSlNIa3hZMnVCY0hNN0VsUnVyUEl2?=
 =?utf-8?B?cU52dFQ0dWJ3d3pFaEFvZnJjdXl5eDEycHJWdkNSRGk1S2dEV2NFcW1xR1Qr?=
 =?utf-8?B?YnE2NDcreXNiVUN5VWdPMVM1a3hHQ0hmQlg4a2xjTmxPb2NYMXpIYUI5bzI5?=
 =?utf-8?B?QWZLRDBuZ3BubEdJN1VhWFIvdE4zeEJOckZ6OGVLb1dBK0tJN0o1RmlwUHJs?=
 =?utf-8?B?OVY1enZvdC9yd2dOOWlsa1crbFRmZHhXTTE5ZUtOSWRta0ozemY0dDJ2WDN3?=
 =?utf-8?B?V3J0SHpnNUQzOC9qZHZkQTBmVTRKTjUvN3phNVV1Mkc4M1RFVVhDYk0xQ1NW?=
 =?utf-8?Q?uvzQsR90YLUUT6ag=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DDCB9AA63CC8843B135A2CD376536AA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Da61bT5OHdZiBnVVfDtv3kEFwpPBoI1I5+7SkVZbK38c52MefB+m4PJYP8kjJxKYQdYsU3PSKaCCGVWRcn5TpFsrj9T/d6bPcsQhcMplplOShcCAZGhj407RCjrmYDYUJTIvDLgrZQews7E54GiqYYDjoYwnu6W+Wicgn9eUqt7NV2JmqGQp0uBwfAhZzQQQN5IZlVQDnDIimoLK7i5a4V74BJzaM3nXR3hNSvboyAV8GVeR50TsAsGhwo1XTM1serXWWnSKd/K2U1y4Tau5Sdfpg2w6RsJngR73iPjzOC9G7cxrygZFZXpeA+U3WYb4cukWJIA9d4PuvRG5mvdL3A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d008c09-920c-44e0-923c-08df332e3631
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 06:56:07.9565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ECwAY5BbmpZcyN0CN/gc3ak72drY5J4rR8vpfnoak2vWQqX5rI+13STtd+vAFDa4ITwwtHybOYs2IBp6sv26goiTnmPY+HbQWPrxdF3E91Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
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
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCAyMDI2LTEwLTIzIGF0IDEwOjAwICswMDAwLCBNaWthIEthaG9sYSB3cm90ZToNCj4g
UFNSIGlzIHJlamVjdGVkIG91dHJpZ2h0IHdoZW5ldmVyIHRoZSBqb2luZXIgaXMgaW4gdXNlLiBQ
YW5lbCBSZXBsYXkNCj4gYW5kDQo+IFBTUjIgc2VsZWN0aXZlIHVwZGF0ZSBkbyB3b3JrIHdpdGgg
dGhlIGpvaW5lciwgc28gb25seSBrZWVwIHJlamVjdGluZw0KPiBwbGFpbiBQU1IxLg0KPiANCj4g
VGhlIGVEUCBQYW5lbCBSZXBsYXkgcGlwZSBBL0IgcmVzdHJpY3Rpb24gb25seSBsb29rcyBhdCB0
aGUgcHJpbWFyeQ0KPiBwaXBlLiBqb2luZXJfcGlwZXMgaXMgYSBjb250aWd1b3VzIG1hc2sgYW5j
aG9yZWQgYXQgdGhlIHByaW1hcnkgcGlwZSwNCj4gc28NCj4gYSBqb2luZWQgY29uZmlnIG9uIHBp
cGUgQiBleHRlbmRzIHRvIHBpcGUgQywgd2hpY2ggaGFzIG5vIFBTUi9QYW5lbA0KPiBSZXBsYXkg
cmVnaXN0ZXIgYmxvY2suIFRlc3QgdGhlIHdob2xlIGpvaW5lZCBwaXBlIG1hc2sgaW5zdGVhZCwg
d2hpY2gNCj4gaXMNCj4gYSBuby1vcCB3aXRob3V0IHRoZSBqb2luZXIuDQo+IA0KPiBQU1IxL1BT
UjIgaGF2ZSBubyBlcXVpdmFsZW50IHBpcGUgQS9CIGNoZWNrIHRvZGF5LiBUaGF0IGlzIGENCj4g
cHJlLWV4aXN0aW5nIGdhcCBpbmRlcGVuZGVudCBvZiB0aGUgam9pbmVyIGFuZCBpcyBsZWZ0IGFs
b25lIGhlcmUuDQo+IA0KPiB2MjogRHJvcCBwc3Jfam9pbmVyX2NvbmZpZ192YWxpZCgpLCBpdCBk
dXBsaWNhdGVkIHRoZSBleGlzdGluZyBlRFANCj4gUGFuZWwNCj4gwqDCoMKgIFJlcGxheSBwaXBl
IEEvQiBjaGVjayBhbmQgd3JvbmdseSBhcHBsaWVkIGl0IHRvIERQIFBhbmVsIFJlcGxheQ0KPiAo
Sm91bmkpDQo+IMKgwqDCoCBFeHRlbmQgdGhhdCBleGlzdGluZyBjaGVjayB0byB0aGUgam9pbmVk
IHBpcGUgbWFzayBpbnN0ZWFkDQo+IChKb3VuaSkNCj4gwqDCoMKgIEtlZXAgb25seSB0aGUgam9p
bmVyIHNwZWNpZmljIGNoZWNrczogUFNSMSBhbmQgWVVWIDQ6MjowIChKb3VuaSkNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQoNCkkgY291
bGRuJ3QgZmluZCBhbnkgbWVudGlvbiBpbiBCc3BlYyBhYm91dCBqb2luZXIgYW5kIFBTUjIgKyBI
Vw0KdHJhY2tpbmcuIEFueXdheXMgTm90IHN1cmUgaWYgdGhlcmUgaXMgZXZlbiBuZWVkIGZvciBo
YW5kbGluZyB0aGF0IGNhc2UNCi4gVGhlcmUgaXMgcHJvYmFibHkgbm8gZURQIHBhbmVscyB3aXRo
IG5lZWQgZm9yIGpvaW5lciBpbiB0aGF0IG9sZCBIVzoNCg0KUmV2aWV3ZWQtYnk6IEpvdW5pIEjD
tmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMgfCAzNCArKysrKysrKysrKysrKystLS0t
LS0tDQo+IC0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkv
aW50ZWxfcHNyLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
DQo+IGluZGV4IGYxZDUyYzM5ZDg4MzQuLjI4ODgzNmQ0YTk5M2MgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfcHNyLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9wc3IuYw0KPiBAQCAtMTU5OCw2ICsxNTk4LDEzIEBA
IHN0YXRpYyBib29sDQo+IGludGVsX3NlbF91cGRhdGVfY29uZmlnX3ZhbGlkKHN0cnVjdCBpbnRl
bF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlLA0KPiDCoAlzdHJ1Y3QgaW50ZWxfZHAgKmludGVsX2Rw
ID0gaW50ZWxfYXR0YWNoZWRfZHAoY29ubmVjdG9yKTsNCj4gwqAJc3RydWN0IGludGVsX2Rpc3Bs
YXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGludGVsX2RwKTsNCj4gwqANCj4gKwlpZiAo
Y3J0Y19zdGF0ZS0+am9pbmVyX3BpcGVzICYmICFjcnRjX3N0YXRlLQ0KPiA+ZHNjLmNvbXByZXNz
aW9uX2VuYWJsZSAmJg0KPiArCcKgwqDCoCBjcnRjX3N0YXRlLT5vdXRwdXRfZm9ybWF0ID09DQo+
IElOVEVMX09VVFBVVF9GT1JNQVRfWUNCQ1I0MjApIHsNCj4gKwkJZHJtX2RiZ19rbXMoZGlzcGxh
eS0+ZHJtLA0KPiArCQkJwqDCoMKgICJTZWxlY3RpdmUgdXBkYXRlIG5vdCBlbmFibGVkLA0KPiB1
bmNvbXByZXNzZWQgam9pbmVyIGRvZXMgbm90IHN1cHBvcnQgWVVWIDQ6MjowXG4iKTsNCj4gKwkJ
Z290byB1bnN1cHBvcnRlZDsNCj4gKwl9DQo+ICsNCj4gwqAJaWYgKEhBU19QU1IyX1NFTF9GRVRD
SChkaXNwbGF5KSAmJg0KPiDCoAnCoMKgwqAgIWludGVsX3BzcjJfc2VsX2ZldGNoX2NvbmZpZ192
YWxpZChpbnRlbF9kcCwgY3J0Y19zdGF0ZSkNCj4gJiYNCj4gwqAJwqDCoMKgICFIQVNfUFNSX0hX
X1RSQUNLSU5HKGRpc3BsYXkpKSB7DQo+IEBAIC0xNzQ1LDggKzE3NTIsOCBAQCBzdGF0aWMgYm9v
bCBfcGFuZWxfcmVwbGF5X2NvbXB1dGVfY29uZmlnKHN0cnVjdA0KPiBpbnRlbF9jcnRjX3N0YXRl
ICpjcnRjX3N0YXRlLA0KPiDCoA0KPiDCoAkvKiBSZW1haW5pbmcgY2hlY2tzIGFyZSBmb3IgZURQ
IG9ubHkgKi8NCj4gwqANCj4gLQlpZiAodG9faW50ZWxfY3J0YyhjcnRjX3N0YXRlLT51YXBpLmNy
dGMpLT5waXBlICE9IFBJUEVfQSAmJg0KPiAtCcKgwqDCoCB0b19pbnRlbF9jcnRjKGNydGNfc3Rh
dGUtPnVhcGkuY3J0YyktPnBpcGUgIT0gUElQRV9CKQ0KPiArCS8qIEV2ZXJ5IGpvaW5lZCBwaXBl
IG5lZWRzIGl0cyBvd24gUFNSL1BhbmVsIFJlcGxheSByZWdpc3Rlcg0KPiBibG9jay4gKi8NCj4g
KwlpZiAoaW50ZWxfY3J0Y19qb2luZWRfcGlwZV9tYXNrKGNydGNfc3RhdGUpICYgfihCSVQoUElQ
RV9BKQ0KPiB8IEJJVChQSVBFX0IpKSkNCj4gwqAJCXJldHVybiBmYWxzZTsNCj4gwqANCj4gwqAJ
LyogMTI4Yi8xMzJiIFBhbmVsIFJlcGxheSBpcyBub3Qgc3VwcG9ydGVkIG9uIGVEUCAqLw0KPiBA
QCAtMTg5MCwxNyArMTg5Nyw2IEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnKHN0cnVj
dCBpbnRlbF9kcA0KPiAqaW50ZWxfZHAsDQo+IMKgCQlyZXR1cm47DQo+IMKgCX0NCj4gwqANCj4g
LQkvKg0KPiAtCSAqIEZJWE1FIGZpZ3VyZSBvdXQgd2hhdCBpcyB3cm9uZyB3aXRoIFBTUitqb2lu
ZXIgYW5kDQo+IC0JICogZml4IGl0LiBQcmVzdW1hYmx5IHNvbWV0aGluZyByZWxhdGVkIHRvIHRo
ZSBmYWN0IHRoYXQNCj4gLQkgKiBQU1IgaXMgYSB0cmFuc2NvZGVyIGxldmVsIGZlYXR1cmUuDQo+
IC0JICovDQo+IC0JaWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBlcykgew0KPiAtCQlkcm1fZGJn
X2ttcyhkaXNwbGF5LT5kcm0sDQo+IC0JCQnCoMKgwqAgIlBTUiBkaXNhYmxlZCBkdWUgdG8gam9p
bmVyXG4iKTsNCj4gLQkJcmV0dXJuOw0KPiAtCX0NCj4gLQ0KPiDCoAkvKiBPbmx5IHVzZWQgZm9y
IHN0YXRlIHZlcmlmaWNhdGlvbi4gKi8NCj4gwqAJY3J0Y19zdGF0ZS0+cGFuZWxfcmVwbGF5X2Rz
Y19zdXBwb3J0ID0gY29ubmVjdG9yLQ0KPiA+ZHAucGFuZWxfcmVwbGF5X2NhcHMuZHNjX3N1cHBv
cnQ7DQo+IMKgCWNydGNfc3RhdGUtPmhhc19wYW5lbF9yZXBsYXkgPQ0KPiBfcGFuZWxfcmVwbGF5
X2NvbXB1dGVfY29uZmlnKGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOw0KPiBAQCAtMTkxMiw2ICsx
OTA4LDE0IEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9kcA0K
PiAqaW50ZWxfZHAsDQo+IMKgCQlyZXR1cm47DQo+IMKgDQo+IMKgCWNydGNfc3RhdGUtPmhhc19z
ZWxfdXBkYXRlID0NCj4gaW50ZWxfc2VsX3VwZGF0ZV9jb25maWdfdmFsaWQoY3J0Y19zdGF0ZSwg
Y29ubl9zdGF0ZSk7DQo+ICsNCj4gKwkvKiBQbGFpbiBQU1IxIGlzIG5vdCBzdXBwb3J0ZWQgd2l0
aCBqb2luZXIuICovDQo+ICsJaWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBlcyAmJiAhY3J0Y19z
dGF0ZS0NCj4gPmhhc19wYW5lbF9yZXBsYXkgJiYNCj4gKwnCoMKgwqAgIWNydGNfc3RhdGUtPmhh
c19zZWxfdXBkYXRlKSB7DQo+ICsJCWRybV9kYmdfa21zKGRpc3BsYXktPmRybSwNCj4gKwkJCcKg
wqDCoCAiUFNSIGRpc2FibGVkLCBQU1IxIG5vdCBzdXBwb3J0ZWQgd2l0aA0KPiBqb2luZXJcbiIp
Ow0KPiArCQljcnRjX3N0YXRlLT5oYXNfcHNyID0gZmFsc2U7DQo+ICsJfQ0KPiDCoH0NCj4gwqAN
Cj4gwqB2b2lkIGludGVsX3Bzcl9nZXRfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNv
ZGVyLA0KPiBAQCAtNDc1NSw2ICs0NzU5LDEwIEBAIHZvaWQgaW50ZWxfcHNyX2NvbXB1dGVfY29u
ZmlnX2xhdGUoc3RydWN0DQo+IGludGVsX2RwICppbnRlbF9kcCwNCj4gwqAJCWNydGNfc3RhdGUt
Pmhhc19zZWxfdXBkYXRlID0gZmFsc2U7DQo+IMKgCQljcnRjX3N0YXRlLT5lbmFibGVfcHNyMl9z
dV9yZWdpb25fZXQgPSBmYWxzZTsNCj4gwqAJCWNydGNfc3RhdGUtPmVuYWJsZV9wc3IyX3NlbF9m
ZXRjaCA9IGZhbHNlOw0KPiArDQo+ICsJCS8qIFBsYWluIFBTUjEgaXMgbm90IHN1cHBvcnRlZCB3
aXRoIGpvaW5lci4gKi8NCj4gKwkJaWYgKGNydGNfc3RhdGUtPmpvaW5lcl9waXBlcykNCj4gKwkJ
CWNydGNfc3RhdGUtPmhhc19wc3IgPSBmYWxzZTsNCj4gwqAJfQ0KPiDCoA0KPiDCoAkvKiBXYV8x
ODAzNzgxODg3NiAqLw0KDQo=
