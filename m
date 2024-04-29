Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 047FEC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 15:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D8810E405;
	Mon, 29 Apr 2024 15:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J5+QdsfA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB1510E405
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714405420; x=1745941420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tlHQ34ZexrlUMrKOH4XBHwDS2memF5T/WXmAFrbc3sI=;
 b=J5+QdsfACF+G6eKXOtSr393RPeaCNpuRwLCN1+sRDwb8PBJiHmakw63g
 pNjIAmz/ponEJlRjq9t6byxC2DrV7nL2MIB5S1izkxfIssCzGLT+0cgOH
 tcgtMMA7X/M9rkG1YsDtaSgNCjyJg8yIlj6H9K7s0yt5WKj3xdLnkXLIU
 ExGcWoErEMhmT8jFUUDgUK5k/D26PVXvse/TvQsbDQrROxNxUntR0I6Tg
 4UrcUZNyd2X+W8zI7zQ9tr0HnIQJ2Rj2i+t5NuiB00ZnITN0r73m070JS
 0oMu3J5Z8QdfZcImTtR7t3RP1brIo68/NAeJ12eWXUFnBBAWeATq+NNez A==;
X-CSE-ConnectionGUID: 9+dfSW+2Qk+hBFNzsK2xRA==
X-CSE-MsgGUID: iJ/W1WWhSFmBlJgriP9IqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10194574"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="10194574"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2024 08:43:39 -0700
X-CSE-ConnectionGUID: zcxhgtjHSsOIFgDVpUP09w==
X-CSE-MsgGUID: ZMDUEpADQ+OuO8T5mO0CqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="57031644"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Apr 2024 08:43:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 29 Apr 2024 08:43:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 29 Apr 2024 08:43:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 29 Apr 2024 08:43:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SugasFz5+ih3zKtEnwA9gfpGaJjdc67qbo4WCaDg8EUBsvlvDxF46Fx/OBmdGnIN1JGV4QP8WPjbPslSwTpQpaNBRHpNqrB6Mg/9X15FpmZ7n0OrTAPcCeuICnZUhkN2rJ/QSGMDplzxuHQK5IbXRkGP+ghslh4l/AYLIdKNM0gFzvXjVA59nt749DKY44s/OKCSdytrcoP5NWKGc2WKo7Uij1iqxZM7uzV7u74cIDHPKO2B0hw80DY+bKje07Kf2hUkG99VWdYwORu0M/cio/S0tLj+p9qVmV9UDRZYbn9Pgnpx45PaBco9fyJcp6oZfFouzcD0d7Ib1SSXaQ9Iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlHQ34ZexrlUMrKOH4XBHwDS2memF5T/WXmAFrbc3sI=;
 b=JeoRtsxNfAX74XQhSNajovChWd7SrBZbggeaOZKcqTr3mno3eTZr7rg99vxLcWHopFcFomk6TPLiLCdD9qa2bMfylaB3YLO3tSgRcLxdOBAo8a3OV48e67aKVZZ0k+KiMmKDvugFQvwn89H/HTZtVTRhScE2A1+ZYIQBCy8oA12sFUPH8Tv4TxtADvvYKsmOdfFSHePkw/unNVsOsZi0ZgrINX7dEHzOSMxHLSQvewoWt7vGjXyovmDyv1b1KajZ9XFu/9auxplX6jxrnk0SaZhy344ViX/VNd0EQhr6JQRBA/DyPZ/3T0XyqqdZUqDLZiIXCyk091eEFj5n7sE9tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by IA1PR11MB6490.namprd11.prod.outlook.com (2603:10b6:208:3a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 15:43:36 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::46dd:6e91:5461:35a%7]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 15:43:36 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>, "Yang, Fei" <fei.yang@intel.com>,
 "Souza, Jose" <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Zeng, Oak" <oak.zeng@intel.com>, Thomas Hellstr_m
 <thomas.hellstrom@linux.intel.com>
Subject: RE: [PATCH v5 0/5] Refactor default device atomic settings
Thread-Topic: [PATCH v5 0/5] Refactor default device atomic settings
Thread-Index: AQHal8qCuUl0nbfirEWzWIHGQ9g+VbF/aEbg
Date: Mon, 29 Apr 2024 15:43:36 +0000
Message-ID: <BN9PR11MB5275DD7B6975411DC649F2CDE71B2@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20240426105655.23738-1-nirmoy.das@intel.com>
In-Reply-To: <20240426105655.23738-1-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|IA1PR11MB6490:EE_
x-ms-office365-filtering-correlation-id: d210cc1a-cc69-4d93-719a-08dc68632215
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bS9PS0x3Q09CM0JYQ1U3MUtnMEdoYkhuZERORFpleEJZczJLMTVFaXp3SGpF?=
 =?utf-8?B?ZEdJV1lCQlI2a0FtMi9IbkJnY2djNXpZUnVKSFg2OCthUGQwOHgwMGJjUUl6?=
 =?utf-8?B?eEI4WElnZUpMTFBnNFBIR2dBVVFrSHlBL1R5SjhYV3dvb1hQZ0tab05SMnJv?=
 =?utf-8?B?OGtWdDZnbWhsNkFscEVFQ2xzOVFlaDBISTZaMEY1eVg0clJ1RzBoeCsvcWFV?=
 =?utf-8?B?MU9YWnFHcld5UFpJdnhhMFlGV0pRS0hsK1U3b3ltS2xheXMrNXkveHdId2ZT?=
 =?utf-8?B?bU5NSUpNMUhpby9JY2lOMk1RZkZRN3pLYjhheGZPS0NPdWZ6SHdxM0pqZXJ5?=
 =?utf-8?B?UXZTTjRIQjhrb3h3TWZydWdHTVZ4YzZMTldpQitERGVERHV5elhwL3VvUEwz?=
 =?utf-8?B?bGtDK0g4WU9PQUMrZlRYdVp0ejhaQ05laDllb1dWZXAxZkx2dmFRUjdJSlY5?=
 =?utf-8?B?eWNldUxUZ1RGSEhmejVLVWM2WjRRQ0NTZVBEU3FtYzZnMTdIWUwyUlZvYlN6?=
 =?utf-8?B?dm42YnJMaFMyZjJVN1R2MW9Td3RZcmlzUk9nZm94aW9vYmcwbUVTQWpsWlQv?=
 =?utf-8?B?Z1BVTFNyQTVuakxOQkIwNnMzZUEvSWdiMGEvMGdlNithcmpvOE1FTlpBNE5D?=
 =?utf-8?B?VThVZ3RVMU5Za1c1YmV6UXhnZ1ozYzBid1p0RjFYV3lnZlRpdG05R0Vodm9D?=
 =?utf-8?B?ejVoSXFkOEM2UjV4bU1CQjdXOVdDSU9pRy9hb3BRNG5BZEJGL3ZRZ3ZwSkgw?=
 =?utf-8?B?QkE4Ky9GMEg0Qk9yQzd4WFp2RCs1Q3l2aWdNOXJYR1RCclpYcDFPY2hiMjRj?=
 =?utf-8?B?SHRtZWd4bFNkb1o0RW92SlJOME9lYytHY1dnQVlMaFZPa3l2d0dmWEpzQzFy?=
 =?utf-8?B?QkxWQWJtTzBRekNCZWlIMTZzbDd2blI0V1U1NmxMc0hlaUw3OVJNYmVGKzVH?=
 =?utf-8?B?VGxEV0ZjY21YSUJoKy85c0NtZTk5OWo3V3VqK2RKL0h1WTd6NE05QjhDVkRS?=
 =?utf-8?B?TUpPS2NKZUtzT2RET2FGR0o5R1R6ckwvMUFIbTAzUHlhN0lDVlRmaVpwN0F3?=
 =?utf-8?B?TVlxV1ZTUEVGb3pHWm5vTUFuenVWRitjNENPM2ZQVjhVZnRCK0dwWHJvbk1N?=
 =?utf-8?B?RWwzTHlOUHphOFQ3SkJ4bjJoUFlDN3NrQ3N4anZERWJseEJrQ1VlcTY5cWJr?=
 =?utf-8?B?VEp0VVhVTTd3STBES0tsNkdnL2pSbjRPUTd0MTZWeGJGWnlJUkpJazU3N3R1?=
 =?utf-8?B?b0ZFcnVxdHI1V1RnSmkzS24wZ0RIK0FwS3NvSHk4TGZiakpJeVA5ekpVaHlD?=
 =?utf-8?B?MkpMTjBZRTM4eGxuMDhiNi9HRW1wenMxanZqODh2enRwaUgwSC90dlE3UVBq?=
 =?utf-8?B?UmNVWmlCcTJzZEV0Vi9GcGp2ZngrY3RQMWhZQXhDTUhyYnh1NnZ6bTJvcndX?=
 =?utf-8?B?eTBMejZoOUV0bnRzR3NTRGlkaUE5TzdHd3BEMmV5ZWpDdk10NXg1WWRmRXNX?=
 =?utf-8?B?VEgwZWZJcGFyTFZqSlVzTVdHdXpYeXc3d2M0YmFKdDFNajVGWjdnVE5lOTV3?=
 =?utf-8?B?d0N0KzZyNXJ5Q2NTd0ErNTgxK0x2TnlzSnBQdWV0WE9VQVFIQzBOQW43c01K?=
 =?utf-8?B?TW9xamJvQks3bGtsbERDallYY0pENkdKeTBYMFYrY3BXeHVZUE9NZDM0d3BS?=
 =?utf-8?B?d0tsNUZvbWNLd1RDSXFkT0VQbmtSVk5OS3E0V2lVZHZrd1lQK3BrRVNEa2hF?=
 =?utf-8?B?cldSNlI1V3VQa0VidGRYcGVtc1BaQnVCZHc2bVFDcDhjVWNwUURCRDRQS3N3?=
 =?utf-8?B?TjRvRnpGZ0I3cUovRUdSQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NThxVUNZcDBVR3cxYUlwTmp6UUNrRm9qaGN5M3RvYWRhR1dCc1J1RXJ4d041?=
 =?utf-8?B?bkxmZ2R3dCthNXdVVi9hZTRyUFN4bzNoeGsrTFFkWlVHRXBoK3c0cTBOTFBC?=
 =?utf-8?B?enRBM2tnMkE3K3pub2ttY2RQcXhaR3RMT2Zvek4rRm5hSmNFdzJNVGc0czI3?=
 =?utf-8?B?MWRDQjRIUk84Sko4TXY5TG9MNUdXZjl5QTM1ZzVsWDhTd3BBRnB1UjkvQ0Nj?=
 =?utf-8?B?WTZhc1NMcnFaV1RyRUswOXc3NTJiakZ5WDg5Z0g1ZDViNk94bjUrY2pham5F?=
 =?utf-8?B?N3dPbVJiZjJFcm03RTFnbGUyM3BuQzU5WEZwRnZtT05UTEF2a1ZoVksxdXk0?=
 =?utf-8?B?SENUYldWMFR4OHRoTlc2TnliVGx0M2NHWHkvaDRXTDlEZjF4cXlRUXZzdm03?=
 =?utf-8?B?aVVUL2tBbERGT3ROY1krbGFCM2RBcGhFNnAvNndEWTRzd1Mrc0ZSTDZnc1F4?=
 =?utf-8?B?RVlNU1pKOW5wMHVpREVEL2dEY2loNFkwamFBd2hsMk1zQjYyRGdOSk01c0tO?=
 =?utf-8?B?L05PZFpqVmxvVmRqNHZMcHE1TzVLSlN1TmlWRkFSalh3dm9QdjVBMTN6VU9s?=
 =?utf-8?B?d1ExZHlmVTZEcmg5c3Q1WWE2ZzZvbXgrSVIyREVlV2JVZy93dVJRM3F2MzNx?=
 =?utf-8?B?b2FvVW9wb3FPSXY4VGxrdTdDbFEzd080cE41c2hmME80WG5abEhQSFI5VzRB?=
 =?utf-8?B?a21IT0IvUzFFMEIrcFBYeGdUSm4zNWwvcFNab2NLQTcwaTRuYXlEQ0phK2xB?=
 =?utf-8?B?di81djJ4UGxoaHUwVW9idmJKUUdGQ0NyVnd5YkJDNDFkK25ZL1BqSXBNTHMx?=
 =?utf-8?B?UG5BNmhtaXlzZ1NqZzZnb2hEMStqRC9tVGV1SGNGUnMvdDBhcGhUTGozZzhv?=
 =?utf-8?B?aWNIbkd1S21QUVFVL3FDUjNTSmc5NzJMSmVTalFyaWN0V2VFNEo4Uk9zUjhC?=
 =?utf-8?B?MmthdnJubktuT2UybWxjcXB3Z2Mrb0M5dmpNa1ZhSjFFYlJJSW5lVUtmTUxG?=
 =?utf-8?B?bnYwRk1hb3ZhdERPOXJXZ3MvcUxrZmhRUzl5bzNLaytTRmpIMjdHYXFCbDBz?=
 =?utf-8?B?QTZYNjV2aWh1VDZuV2EyN0FLK2dRaVc4OHo0RmovRjBWL2VRVGlhQUJtVHpJ?=
 =?utf-8?B?U0IyU2hUMGR1UE9uYStkRWZVc0haUmFuTFg2Y3pESUNPL2pkY2tZamRweTk5?=
 =?utf-8?B?Y2tucDZqZ20rOXlHQldkWDNxZG9BVHFWZzlFdmEwOWY0cDNJa0lSZ2JmNU0z?=
 =?utf-8?B?SzlnRDBKU1RSeWcrQjlicGJVMkQ3Y3BROWNzR1dFRTFCbkEvbmNmaHZsVWxp?=
 =?utf-8?B?WUEwdUxUems1ZU1DK05ESjU4ZFdYaXlVa0FVbEFzbG9xaXZCTXl4SDFtRzR0?=
 =?utf-8?B?ZnBEWU15SVkwK2hpQkpzZEMwU0gxcVVVV1h0Q0xOemZmMFdDSHkvaWlHQU9t?=
 =?utf-8?B?aTZ6SzJCSGFUSHJzUnlCcG5IMG5iak0wVy9GSzFub2ZFS3I3ciszdzllY25E?=
 =?utf-8?B?QjUyb1JEbjdlaWx1M0dXckRwVWF6YXU0R1psYk1ZTUZDT0ozWGFvcXhoYUln?=
 =?utf-8?B?ZVZQczBWcjhkckxQQjZxdHpiYVNMQkRtLzRGVWdCSTJxVTRTZitNZGtjNGp4?=
 =?utf-8?B?SVMyeGpHSDdHdy9tUjNsRzd0TjB2MnZCaFBERzNFN1ZNL05FVENXS2E2Z3ZJ?=
 =?utf-8?B?T1NSbmVOMTBnVVdGQklkQnVzbEZVb3VsWkE2cS9obHFXYysrWlZEV0J1bmhp?=
 =?utf-8?B?cnB0aXZwOTZadWhUV1NDVEE5cjJYWmF0V2gyMUZKdzhqMkNtU3RMbEJZTDJo?=
 =?utf-8?B?RUw0U08vYUpWbjgvTEt6alg4Y2NJbW9tREF4TEtHRUdkajN3UkJEVWtiS0p6?=
 =?utf-8?B?aXQyS1RGVDhmanpSdW9FUFJ3anRyUGk2ZC9WeDBBaDZ1QkVDQ09LLzlVQURk?=
 =?utf-8?B?dXRkbWIwS3I0MFUvVVRYd054djNwZUFuRHVyVjlNVUpOc2VPZ1prU2p1Mlc2?=
 =?utf-8?B?eTczWldYekVHS0IzOGJabC9DcnZJN3c0WEhtME95TE9VcUVIS0R1akFwR2FD?=
 =?utf-8?B?T2F3THhlYTBWQlZENEdJdXlzOWNObWN6a3crbXlnSUppTSt4MUM0RHFiVWRK?=
 =?utf-8?Q?YD2ks/ZexGUcFWapZgIDhJEsm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d210cc1a-cc69-4d93-719a-08dc68632215
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 15:43:36.2295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFyTFpRhle7gnPO8+Y8MLfQxAgC0R7UxdqvYIxu1TQiPqlWM0RXDK5Hy/eOmxcUY4ms6cNIgaHLFw4wFqZMn8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6490
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

VGhlIGRlZmF1bHQgYmVoYXZpb3Igb2YgZGV2aWNlIGF0b21pY3MgZGVwZW5kcyBvbiB0aGUgVk0g
dHlwZSBhbmQgYnVmZmVyIGFsbG9jYXRpb24gdHlwZXMuIERldmljZSBhdG9taWNzIGFyZSBleHBl
Y3RlZCB0byBmdW5jdGlvbiB3aXRoIGFsbCB0eXBlcyBvZiBhbGxvY2F0aW9ucyBmb3IgdHJhZGl0
aW9uYWwgYXBwbGljYXRpb25zL0FQSXMuIEFkZGl0aW9uYWxseSwgaW4gY29tcHV0ZS9TVk0gQVBJ
IHNjZW5hcmlvcyB3aXRoIGZhdWx0IG1vZGUgb3IgTFIgbW9kZSBWTXMsIGRldmljZSBhdG9taWNz
IG11c3Qgd29yayB3aXRoIHNpbmdsZS1yZWdpb24gYWxsb2NhdGlvbnMuIEluIGFsbCBvdGhlciBj
YXNlcyBkZXZpY2UgYXRvbWljcyBzaG91bGQgYmUgZGlzYWJsZWQgYnkgZGVmYXVsdC4gUFZDIG5l
ZWRzIHNwZWNpYWwgY2FyZSBhcyBpdCBkb2Vzbid0IHN1cHBvcnQgZGV2aWNlIGF0b21pY3Mgb24g
U01FTS4NCg0KdjU6IEZpeCBicm9rZW4gYXRvbWljcyBvbiBQVkMgZnJvbSB2NCBjaGFuZ2VzLg0K
DQp2NDogUHJldmlvdXMgYXNzdW1wdGlvbiB0aGF0IGRldmljZSBhdG9taWNzIHNob3VsZCBiZSBk
aXNhYmxlZA0KICAgIGJ5IGRlZmF1bHQgb24gU01FTSBvbmx5IEJPIHdhcyB3cm9uZyBhcyB0cmFk
aXRpb25hbCBhcHBsaWNhdGlvbnMNCiAgICB3aWxsIG5vdCB1c2Ugc3VjaCBhbGxvY2F0aW9ucyBm
b3IgQ1BVIGF0b21pY3MuIFNvIHJlbW92ZSB0aGUNCiAgICBWTSBiaW5kIGZsYWcgYW5kIHRoZSBx
dWVyeSB1QVBJIGFuZCBpbnN0ZWFkIHJlZmFjdG9yIGRlZmF1bHQgZGV2aWNlIA0KICAgIGF0b21p
Y3Mgc2V0dGluZ3MgYXMgcGVyIFZNIHR5cGUgYW5kIGJ1ZmZlciBhbGxvY2F0aW9ucy4NCiAgICAg
IA0KDQp2MzogQ2FwdHVyZSByZXQgdmFsdWUgb2YgeGVfdm1fYmluZF9pb2N0bF92YWxpZGF0ZV9i
byhNYXR0IEIpLg0KICAgIFJlbW92ZSByZWR1bmRhbnQgY29oX21vZGUgcGFyYW0gZnJvbSB4ZV92
bV9iaW5kX2lvY3RsX3ZhbGlkYXRlX2JvKCkuDQogICAgUmVtb3ZlIGhhc19kZXZpY2VfYXRvbWlj
c19vbl9zbWVtIGZyb20geGVfZ3JhcGhpY3NfZGVzYyhKb3NlKS4NCiAgICBSZXBsYWNlIERSTV9Y
RV9RVUVSWV9DT05GSUdfU1VQUF9ERVZfQVRPTUlDX09OX1NNRU0gd2l0aCANCiAgICBjb25maWcg
ZmxhZyBEUk1fWEVfUVVFUllfQ09ORklHX0ZMQUdfSEFTX0RFVl9BVE9NSUNfT05fU01FTShKb3Nl
KS4NCiAgICBNZW50aW9uIHRoYXQgUFRFX0FFIHdpbGwgbm90IGJlIGFwcGxpZWQgdG8gdXNlcnB0
cihNYXR0IFIpDQoNCnYyOiBBZGQgQk8gaGVscGVyIGZ1bmMgaW4geGVfdm1fYmluZF9pb2N0bCgp
KE1hdHQgQikuDQogICAgVXNlIFhFX0lPQ1RMX0RCRyBmb3IgY2hlY2tzKE1hdHQgQikuDQogICAg
TW92ZSBwbGF0Zm9ybSBjaGVja3Mgd2l0aCBoZWxwIG9mIGFkZGluZyBmbGFncyBpbg0KICAgIGlu
dGVsX2RldmljZV9pbmZvKE1hdHQgQikuDQogICAgQWRkIGRvY3VtZW50IGZvciBEUk1fWEVfVk1f
QklORF9GTEFHX0RFVklDRV9BVE9NSUNTKE1hdHQgQikuIA0KICAgIENyZWF0ZSBxdWVyeSB1QVBJ
IGZvciB0aGlzIG5ld2x5IGFkZGVkIFZNIGJpbmQgZmxhZyhKb3NlLCBMaW9uZWwpLg0KDQpDYzog
QmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4gPGJhbGFzdWJyYW1hbmkudml2ZWthbmFuZGFuQGlu
dGVsLmNvbT4NCkNjOiBCcmlhbiBXZWx0eSA8YnJpYW4ud2VsdHlAaW50ZWwuY29tPg0KQ2M6IEZl
aSBZYW5nIDxmZWkueWFuZ0BpbnRlbC5jb20+DQpDYzogSm9zZSBTb3V6YSA8am9zZS5zb3V6YUBp
bnRlbC5jb20+DQpDYzogTGlvbmVsIEcgTGFuZHdlcmxpbiA8bGlvbmVsLmcubGFuZHdlcmxpbkBp
bnRlbC5jb20+DQpDYzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCkNj
OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCkNjOiBNaWNoYWwgTXJv
emVrIDxtaWNoYWwubXJvemVrQGludGVsLmNvbT4NCkNjOiBPYWsgWmVuZyA8b2FrLnplbmdAaW50
ZWwuY29tPg0KQ2M6IFRob21hcyBIZWxsc3RyX20gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50
ZWwuY29tPg0KDQpOaXJtb3kgRGFzICg1KToNCiAgZHJtL3hlOiBJbnRyb2R1Y2UgaGFzX2F0b21p
Y19lbmFibGVfcHRlX2JpdCBkZXZpY2UgaW5mbw0KICBkcm0veGU6IE1vdmUgdm0gYmluZCBibyB2
YWxpZGF0aW9uIHRvIGEgaGVscGVyIGZ1bmN0aW9uDQogIGRybS94ZTogSW50cm9kdWNlIGhhc19k
ZXZpY2VfYXRvbWljc19vbl9zbWVtIGRldmljZSBpbmZvDQogIGRybS94ZTogQWRkIGZ1bmN0aW9u
IHRvIGNoZWNrIGlmIEJPIGhhcyBzaW5nbGUgcGxhY2VtZW50DQogIGRybS94ZTogUmVmYWN0b3Ig
ZGVmYXVsdCBkZXZpY2UgYXRvbWljIHNldHRpbmdzDQoNCiBkcml2ZXJzL2dwdS9kcm0veGUveGVf
Ym8uYyAgICAgICAgICAgfCAxNCArKysrKw0KIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5oICAg
ICAgICAgICB8ICAxICsNCiBkcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggfCAg
NCArKw0KIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYyAgICAgICAgICB8ICA1ICsrDQogZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3BjaV90eXBlcy5oICAgIHwgIDEgKw0KIGRyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wdC5jICAgICAgICAgICB8IDI3ICsrKysrKysrLS0NCiBkcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYyAgICAgICAgICAgfCA3OSArKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQog
NyBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkNCg0KLS0N
CjIuNDIuMA0KDQpBY2tlZC1ieTogTWljaGFsIE1yb3playA8bWljaGFsLm1yb3pla0BpbnRlbC5j
b20+DQoNCg==
