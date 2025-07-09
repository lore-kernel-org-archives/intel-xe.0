Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F63C83F0A
	for <intel-xe@archiver.kernel.org>; Wed,  9 Jul 2025 10:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDED610E78E;
	Wed,  9 Jul 2025 10:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CJXkHIDD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A496610E78E
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Jul 2025 10:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752056493; x=1783592493;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y1l24p5ASRJKyy681GUhqiX2GMDOa14apWTDETi+p4c=;
 b=CJXkHIDDHIFURZx2X8EtFZNKKIMDfkwwjXMx6xudag+It8ecv8G7WKJ9
 tK58j7Rvq1lD+9ChhKhpNZU+pU+KXUOrGZYrMrl2Kh+oAFASPr6iIbhDc
 a6oZTvv9qx7xYBaQAyGa1goVd7OGCd5qqwV14JMy5WrUpIffqeilzBlDG
 1rvTL1TvKGb9rSltZJA6gBDQ5rmU/3IKGQraTB+Un9CjvNDuLqboiQdHD
 o/GuevySnfEg8YznlQ42//36IucSY0SSx6xDyKgDBqCd8ezWj2XPxknER
 i7IM7LyKQRE5uJqJn40QjcIexxKOWYm5w5F4UWOSFhJc37QOljsmnYXGN w==;
X-CSE-ConnectionGUID: cjWAB23zTxqu4utGdvZzUw==
X-CSE-MsgGUID: 9VxtLP0FQJ28E6dAYQoo2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54443374"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="54443374"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:21:32 -0700
X-CSE-ConnectionGUID: wNaBkQb1R6KcAqtnFQ9Xfg==
X-CSE-MsgGUID: QuFzcUrjQ+6/ohcYYE4wIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="156072044"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 03:21:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 03:21:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 03:21:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 03:21:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ruoSfaXp/1oOF4NZ2UEa2R8s/mZ9bpMwN6lsogHiWeRJgXVX7ld/pYKr78asdSsLexzaRNcH1IJHl+P0PKD8F4FCheWOT4U8l/r0O1u09USmUF4D29G/Od8zNV+IlHJWIE0ribt3ju2r5c0RmjSbk8kIpK4EXdqL6ZqyaWLh/wcm3vVxJpyop7evbJECS75/aT9k1zovv0nD4aXTpXRg75hSnL9vtYGLfEeUgh1FhFr2V0S+8OaqLvSdwbifMEiyshb3sc+gupli4XfJ5HPKrHttv4fQ0OwMVsnIVpGIhwOTRaWoPcnchYvkpEZpSeIGQF71iusiz2hqvm0Q9wJIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1l24p5ASRJKyy681GUhqiX2GMDOa14apWTDETi+p4c=;
 b=KTJ89U7tN/U8397Zw43Yxr4A1MRnzhgrxv40hiZWQuXw4QGHfLQDpOADnKXLUnXqbwIM3d2DoBFN61eSR72NetmM7g6hAhzczc16pWe2ATXvKUnvaygFIqECykBmZ7w9Ml4gXOQkNkps8Qr9cUlR7I6u6wFpzLDs/0t1QCvGnNNptL1wK32MSHYgwQ4HDw6M/jAkINJjEGDVV74kjFzU9oa8uEOv9H3Hcb2LFFZhvVhtJ632JacExrgdKtXrtb5+EGDUesF3BPXwK9jJAo8Pd2zxEwugHR/VcPUDZJJcDBKe4VrbL3ZyqpUgpsyvpqAJ4/8MK1s+4ExrF3ArX6H/nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7266.namprd11.prod.outlook.com (2603:10b6:930:99::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 10:21:28 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 10:21:27 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Dont skip TLB invalidations on VF
Thread-Topic: [PATCH] drm/xe: Dont skip TLB invalidations on VF
Thread-Index: AQHb7+cDWgE358asA0ubC+3e/g4M8bQoKrQAgAFrbFA=
Date: Wed, 9 Jul 2025 10:21:27 +0000
Message-ID: <SJ1PR11MB62045A11B17840DCFBE3BD058149A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250708090156.741440-1-tejas.upadhyay@intel.com>
 <77280c68-fb75-434e-ac04-6d9e97513c90@intel.com>
In-Reply-To: <77280c68-fb75-434e-ac04-6d9e97513c90@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7266:EE_
x-ms-office365-filtering-correlation-id: ae8a75ec-3537-444b-dcd5-08ddbed25d93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UDdMamRkM2JUZ2IzVVhwR0Fqc3lHQnNQaVdGNnZkV01QdnQ3ejcvTXR6ZXd0?=
 =?utf-8?B?OWNDdDBJL3FJY20wYkRiVHFoVnFwRURZWHBKYk9xVzhmMTRINkg5ajZVTWhM?=
 =?utf-8?B?UFZVL04rbnVSdktCZHV5UW5mVHlGOElqSFVPeEhmRnR1enFEcmJWSWJkYWpR?=
 =?utf-8?B?WXlqcTlVbkdqa1d2dWgzbjRJbW1oUUxSYll1NWJzbVJCTWxic291MEdNT0Zx?=
 =?utf-8?B?andtRXJRQ0tDUDFOa1pudjVCbXh2UEp5ZVdQbkloSEhwZzUvYlUxSElXY1pi?=
 =?utf-8?B?YXpxU0ttWlJKU2Q4a2ZMRHJZWFpGN1JWOWhwMXd1ZWZLaThqVmFPcW5OOEJS?=
 =?utf-8?B?bjNZNGpsVGxyTjBiem40RVRJbGVpL2Vrc0hwMzlUT21HL2xhWExHVE55SVFa?=
 =?utf-8?B?UVArZXR5REdOT3hNNzQyeEM4VUhrcXh4c0E4SVpiSmRUcEtKellDdEZTNk5K?=
 =?utf-8?B?TDBHUVR3VUlNUXI0ZHowSThhSjB5YnJyK0NGVGF4d0UrM3ZDMXZBVHlpZ1B4?=
 =?utf-8?B?VGRMR21IRGwyNENYN0NXcmJMWmZsNmdybWJUYWoxOThUb3hQbHBCL0F6UTli?=
 =?utf-8?B?NGo2MWFTQzlXN0tKTjFWTUVNeU5objhlVi83NmFEMFR0VzJyOWp5YSt1ZDha?=
 =?utf-8?B?QkVTVytYd3pkVFNCVDNIWVJ6L3R2TjhIMUxYMTVmN3IwdUt4Tm41dFVteFh4?=
 =?utf-8?B?ZEpnUEs4RFNscVJLS2FQeGpvSGlvZGZEdGFGaDdiM3JaUHRRNWtxN3pXMnZj?=
 =?utf-8?B?WWR3bDI1WjFFZ0RiakJsTm5TTGdlWThtZUxCQWVGVk1lUUpyQlZWYysySVVw?=
 =?utf-8?B?SkMramZwWEhCNGEvT1F4Q2dRbTNlM3VpdWFsRXFFUm1aTm9ORkdlcTdscFpw?=
 =?utf-8?B?TFVPVSt6aUx4V3JhcnpyUEIyUU5FYTRqTjdVWG51aTRlMzJic0txNmtHaU9R?=
 =?utf-8?B?S3F3eDNHdzRIOU9uSHROMkltQmYvSnd5U09jWlpJbWI1eWxwS0tMZ0ZQaUVX?=
 =?utf-8?B?dUVQYngzUDZaYWVIWnJsTjJTZG5pUERvUkozYnZnUy9jN3ZoaE03TFU2Tk5j?=
 =?utf-8?B?WGFRM3lpSTJBcXgyYzNTTzk0MGphc29CczIzOUFqT290ME9RU1J2ME1xN1VU?=
 =?utf-8?B?RXB6dHBVVXVaOCtOUnhnNHVBNzlSV01DUHVmQ2RZTjlncE1FMU9BTm9scHlk?=
 =?utf-8?B?c2xKUkdZaGZQK1ZXVU9FOGlDOTR5U2ZMbGJocUt3TDhQRmtTKzd0eTMwakdm?=
 =?utf-8?B?OStITmtiWGhLVDdncERiOFRFTWVLSTI4NVl5eFpqOWpZOFlkbHF5RFB0ZHdx?=
 =?utf-8?B?U1dGN3ZON3JoMlNBUmdzUWpHZFpWRHpNNHNSb2dTK0RXZ3ZKb08vN2Zhb1lZ?=
 =?utf-8?B?YnRNY21uRkx1czk1WmxQby9pcXBpclk2aUdZc3d4MVNBS0xiN0Zid0dJdHlC?=
 =?utf-8?B?aURROVJQMmw4aDFFR3lCYzdwSjRyZVhkK2huV1lzc2t5c2FmZ1RwNUJIQk0v?=
 =?utf-8?B?VzdneG51YTFwMUlWUHpGd0JFWVNHRW9Uc3BMWk53MTVIYkRpTXRldkRLNCtw?=
 =?utf-8?B?dm4zalhJUHlIN2dueUdvWnJMOGt6dFFFcUZPY0praTV6Q0tpVUh4dlpkLzU2?=
 =?utf-8?B?bzZuZTFjbG1pZkJYUk93VmpvYlZoUVFxdS9jMlF5Q1dPaEd3citmVVBIRGZj?=
 =?utf-8?B?Q0JmVUsrcjEwb3Fsd1k2aXkvaGh5cWIrbWVmeGRNcysrKzF5NUk0MUtmUG1k?=
 =?utf-8?B?SU9zSVdiUzZGUzdwNTdJRXFtTWFMNXpGRVdja3czOTB1aUs3UWt1RzM4UHB2?=
 =?utf-8?B?bnhBRE8rbFFTbVIyd1RTSVNwZ3JUWTYwdmFjeUwzZ21LT3pVTlArdFVGWDlh?=
 =?utf-8?B?QllmYTIzTlFYbk0zbmlCR0puOUxwT282Y1ljZk51OWxYMVc4TXpsTXFDRzFt?=
 =?utf-8?B?MHVwcGovdDBIdllaYVVSN2xUWkpEQWJtRWdhejVyY1ZtSGtXYnQ4MWlwREJE?=
 =?utf-8?B?UjhpUDJ0eFpBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0g5VHE0UmJXQzFTVjNDd1lVSldBSUtUMnMramE5bmRUYU1UUWdsU2c2UzVk?=
 =?utf-8?B?a1R1K2dTdGFvaW00MEdRYlJrUE9lYnVJR2QxK1RHd3lLSE1JZ0dDbG1TYm5Q?=
 =?utf-8?B?TFAyZUM3MmpHVVowN3VNclZiQzUxUEJtWVBTQkE0ekZSazA3elJJRWVTOXNu?=
 =?utf-8?B?Wkk1SUhYbXdFRHVSNGpSWDZxRitFSHBLMm9QSHE2M0tvWUZrUHZHd0tDWWhs?=
 =?utf-8?B?a3FLaSs3YWdmQlBLRFRkRG9KRE5XTXNPVDN3cURVbXdjU3RVQjFjaFJNQjZB?=
 =?utf-8?B?Y25pVHZweGg4WVFYNElhbm5DOTBwdTNTU00wbmJyTkFpenIzY1dkaHA5dVZ2?=
 =?utf-8?B?cm9VNDlXU0xsNDQ4NU1DWngwK2dIK0NkSFQ0RnZoRjZ0ckNkL1phcW9zaE1I?=
 =?utf-8?B?dzF2ZCtqSkE4UWNrbTFINmpxcndNS1pENjFpM3dGaytBMWtBVkVjamRvOFMw?=
 =?utf-8?B?L1RubE4zRUIzZEN4OCt4WGRybEtJcWJrZmJvc2FsbHNqYWd5Nk0zZ3pNZExK?=
 =?utf-8?B?N2lZcE03Y3VGaGk2cGFFVW5qcnN0RnZpVVBVd3lNRU1KR001dWF1TjVpMGVu?=
 =?utf-8?B?blE1NmorT0NFQkpQeHl2WU9VSEdDZXI0M1l3MFVaT2ZKQWRaS1AxZHFEMTg3?=
 =?utf-8?B?U2RIdkJNTGtOUWNxS3V5R21qaWxOM0YrWE80cVh5aWRGNHJSVTNxUmFiNW0v?=
 =?utf-8?B?UmhSaEpWNXA0eVphb2dOeFBhNE15K2lxcGlvcElMT3RkL3N1OVk4MWRqbEM2?=
 =?utf-8?B?UWp3djByN3BrTVhhZE9kT1FpTXBPbldHRnMwbG5Mb2xwKzRnd01IcnRHczdN?=
 =?utf-8?B?cVk3L1hiSVJvR0cyaFpldzcrOWJwVkZhdUM4SGVPcms4T25BK3YxUnZZV2V5?=
 =?utf-8?B?NjE3bklCZGNURUE4M2NtbVpKdzdYSk5DMm5zV2ora2tVMjIxekswNGlOd1Ey?=
 =?utf-8?B?NHZqeStmeHNhdmNIMUs5a0lYWXM1K1MzSXdZbzVlRk01RHl3eGRPbkNhcFpx?=
 =?utf-8?B?VHBmL3hITzZ3bzVha01XY1ZIRjR6cGFHWmdrQkZ2a3V6ZXpIOE9PVGhuNWpv?=
 =?utf-8?B?Mm5TUWlnNDFpelZuRit4Vm9hVFpvRHd6N2x3ejY5TGpGcDlMYWh0SUNzMS9a?=
 =?utf-8?B?VWRiWG1CNjNkLzFrbmp4TmQ3YTdCdVhxZlRGNmw3K3k4UkFUdjkvZnkrQXNL?=
 =?utf-8?B?NklxZDhsTjVGRU5kR2lxZjJIOEVic1Z4Um8rK0t2VVFWV2Z0cGFQMDY2ZlNs?=
 =?utf-8?B?ZXBpRVRvcnRqTWk0K1huenZ4djBCZ2pUbGVtSFRVK1V4S2ZGT3VuK0daWm56?=
 =?utf-8?B?VEtTNDhHMVhXSzhWTHBJZGdDVlA3d0lzenhzR2RkWFY0NVMyZ1RnNzJoVktR?=
 =?utf-8?B?VENGVDFEdmtScVZTKzlnZUw1QWRPYUthNlFxdjdSYVhqNDU5MzhXT3FCblFI?=
 =?utf-8?B?NGxGQVlhZm5wYVYydUJMeWhDSVNqNEZldmVqVDdaODBZTjg5QkhFbkZtY2Vz?=
 =?utf-8?B?NEpCMGV1a3lKWUV4cTcwMmV3WEhFRzdWWnQxY0xiQ1JFVU8vbk9BZ2xIWDNG?=
 =?utf-8?B?OHBTS0ltSEV4Zit0YzROR21wS3g3RVhISGtqdktocDZSTEVIUU1nRkxhOERy?=
 =?utf-8?B?dyt2S3lPMjNiVlJmMXZnNTBKT2hmYzUxek03UFovVWpZUE40Y0xHUjBINFhY?=
 =?utf-8?B?OHZMeXhKbjVtUklUM2EwTTlXRjFWcGJETWpHNGF5SmpCbWNGcFNzdWs5NVRC?=
 =?utf-8?B?eVJQWjBzZnFhdURLdzJmTGp6Z2lVV2VyQWs0NmdxdisvcndBUlpwdFl5MEVv?=
 =?utf-8?B?OFUwbTdEQlFBNVVjcEFVVmpuVXRNby94Zk1PcGZUNXE4VzNSanZQeU9PcGFn?=
 =?utf-8?B?ZUlJa2o1WUkzdjJoMFBKNGtQckJBRDNxdmgyWDU5UmJOOTg1SEVzU1BzZTc3?=
 =?utf-8?B?eXpuTDlaS2NJVjAxaE1SWldVTW1Ec1JpSE5hNEYxTytHbDVXRWprbzVXanNz?=
 =?utf-8?B?MWkzWnh4RG90MXo3cXlraEEwMUdhaXRkanBIZExBdnlsV1RnekJDL0I2WVlU?=
 =?utf-8?B?NEtkZ3pLNTQ2SlpTcUV4VWU4Y094cXdGZzdFYk9GTGFPazdvTHJTZDBBT3RW?=
 =?utf-8?B?R3Y1dURPU0MycVEwV2p6SHFnK3lzT1pmeGF2eWh1TGJUVFlTUlAralNEbDNv?=
 =?utf-8?Q?Jw4Jq9KO9Y/kwKkRXKKQ8uBMJKjf1Wh/KDuMUIDAfveA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae8a75ec-3537-444b-dcd5-08ddbed25d93
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 10:21:27.8820 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AUt543Dq7elG2x48f3aYuKkQkSFXrefaF6yCAicWA688KlKqY/Zntbq1RP0DHjrDlKQGucMUZ5sUVaOKor2JNHbvxQakC6iMncnc3Fp7WQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7266
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogV2FqZGVjemtvLCBNaWNo
YWwgPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29tPg0KPiBTZW50OiAwOCBKdWx5IDIwMjUgMTg6
MDkNCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgaW50
ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogQnJvc3QsIE1hdHRoZXcgPG1h
dHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0veGU6IERv
bnQgc2tpcCBUTEIgaW52YWxpZGF0aW9ucyBvbiBWRg0KPiANCj4gDQo+IA0KPiBPbiAwOC4wNy4y
MDI1IDExOjAxLCBUZWphcyBVcGFkaHlheSB3cm90ZToNCj4gPiBTa2lwcGluZyBUTEIgaW52YWxp
ZGF0aW9ucyBvbiBWRiBjYXVzaW5nIHVucmVjb3ZlcmFibGUgZmF1bHRzLg0KPiANCj4gb29wcywg
bXkgZGVjaXNpb24gdG8gZHJvcCBpdCBvbiBWRiB3YXMgYmlhc2VkIGJ5IHRoaXMgb2xkIGNvbW1l
bnQ6DQo+IA0KPiAJLyogWFhYOiBEbyB3ZSBuZWVkIHRoaXM/IExlYXZpbmcgZm9yIG5vdy4gKi8N
Cj4gDQo+ID4gUHJvYmFibGUgcmVhc29uIGZvciBza2lwcGluZyBUTEIgaW52YWxpZGF0aW9ucyBv
biBTUklPViBjb3VsZCBiZSBsYWNrDQo+ID4gb2Ygc3VwcG9ydCBmb3IgaW5zdHJ1Y3Rpb24gTUlf
RkxVU0hfRFdfU1RPUkVfSU5ERVguDQo+IA0KPiB0cnVlLCB0aGlzIHZhcmlhbnQgdXNpbmcgR0dU
VCBpcyBub3Qgc3VwcG9ydGVkIG9uIFZGcw0KPiANCj4gPiBBZGQgYmFjayBUTEIgZmx1c2ggd2l0
aCBzb21lDQo+ID4gYWRkaXRpb25hbCBoYW5kbGluZy4NCj4gPg0KPiA+IEhlbHBzIGluIHJlc29s
dmluZywNCj4gPiBbICA3MDQuOTEzNDU0XSB4ZSAwMDAwOjAwOjAyLjE6IFtkcm06cGZfcXVldWVf
d29ya19mdW5jIFt4ZV1dDQo+ID4gICAgICAgICAgICAgICAgIEFTSUQ6IDANCj4gPiAgICAgICAg
ICAgICAgICAgVkZJRDogMA0KPiA+ICAgICAgICAgICAgICAgICBQREFUQTogMHgwZDkyDQo+ID4g
ICAgICAgICAgICAgICAgIEZhdWx0ZWQgQWRkcmVzczogMHgwMDAwMDAwMDAyZmEwMDAwDQo+ID4g
ICAgICAgICAgICAgICAgIEZhdWx0VHlwZTogMA0KPiA+ICAgICAgICAgICAgICAgICBBY2Nlc3NU
eXBlOiAxDQo+ID4gICAgICAgICAgICAgICAgIEZhdWx0TGV2ZWw6IDANCj4gPiAgICAgICAgICAg
ICAgICAgRW5naW5lQ2xhc3M6IDMgYmNzDQo+ID4gICAgICAgICAgICAgICAgIEVuZ2luZUluc3Rh
bmNlOiA4DQo+ID4gWyAgNzA0LjkxMzU1MV0geGUgMDAwMDowMDowMi4xOiBbZHJtOnBmX3F1ZXVl
X3dvcmtfZnVuYyBbeGVdXSBGYXVsdA0KPiA+IHJlc3BvbnNlOiBVbnN1Y2Nlc3NmdWwgLTIyDQo+
ID4NCj4gPiBTdWdnZXN0ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwu
Y29tPg0KPiA+IEZpeGVzOiA5NzUxNWQwYjNlZDkyICgiZHJtL3hlL3ZmOiBEb24ndCBlbWl0IGFj
Y2VzcyB0byBHbG9iYWwgSFdTUCBpZg0KPiA+IFZGIikNCj4gPiBTaWduZWQtb2ZmLWJ5OiBUZWph
cyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyB8IDIyICsrKysrKysrKystLS0tLS0tLS0tLS0N
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9yaW5nX29wcy5jDQo+
ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+IGluZGV4IGJjMTY4OWRi
NGNkNy4uZWUwZmEyMDhlMmY4IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9yaW5nX29wcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMN
Cj4gPiBAQCAtMTEwLDEzICsxMTAsMTQgQEAgc3RhdGljIGludCBlbWl0X2JiX3N0YXJ0KHU2NCBi
YXRjaF9hZGRyLCB1MzINCj4gcHBndHRfZmxhZywgdTMyICpkdywgaW50IGkpDQo+ID4gIAlyZXR1
cm4gaTsNCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBpbnQgZW1pdF9mbHVzaF9pbnZhbGlkYXRl
KHUzMiAqZHcsIGludCBpKQ0KPiA+ICtzdGF0aWMgaW50IGVtaXRfZmx1c2hfaW52YWxpZGF0ZSh1
MzIgYWRkciwgdTMyIHZhbCwgdTMyICpkdywgaW50IGkpDQo+IA0KPiB0aGlzIGhlbHBlciBpcyBv
bmx5IHVzZWQgb25jZSBhbmQgaXQgbG9va3MgYWxtb3N0IGV4YWN0bHkgYXMgYW5vdGhlciBvcGVu
IGNvZGVkDQo+IHNlcXVlbmNlIGF0IHRoZSBjYWxsZXIgLSBlbWl0X21pZ3JhdGlvbl9qb2JfZ2Vu
MTIoKSwgc28gbWF5YmUgbW92ZSB0aGlzDQo+IGNvZGUgdGhlcmUgYXMtYXM/DQo+IA0KPiA+ICB7
DQo+ID4gIAlkd1tpKytdID0gTUlfRkxVU0hfRFcgfCBNSV9JTlZBTElEQVRFX1RMQiB8DQo+IE1J
X0ZMVVNIX0RXX09QX1NUT1JFRFcgfA0KPiA+IC0JCSAgTUlfRkxVU0hfSU1NX0RXIHwgTUlfRkxV
U0hfRFdfU1RPUkVfSU5ERVg7DQo+ID4gLQlkd1tpKytdID0gTFJDX1BQSFdTUF9GTFVTSF9JTlZB
TF9TQ1JBVENIX0FERFI7DQo+ID4gLQlkd1tpKytdID0gMDsNCj4gPiArCQkgIE1JX0ZMVVNIX0lN
TV9EVzsNCj4gPiArDQo+ID4gKwlkd1tpKytdID0gYWRkciB8IE1JX0ZMVVNIX0RXX1VTRV9HVFQ7
DQo+ID4gIAlkd1tpKytdID0gMDsNCj4gPiArCWR3W2krK10gPSB2YWw7DQo+ID4NCj4gPiAgCXJl
dHVybiBpOw0KPiA+ICB9DQo+ID4gQEAgLTM5OCwyMiArMzk5LDE5IEBAIHN0YXRpYyB2b2lkIGVt
aXRfbWlncmF0aW9uX2pvYl9nZW4xMihzdHJ1Y3QNCj4geGVfc2NoZWRfam9iICpqb2IsDQo+ID4g
IAkJCQkgICAgIHN0cnVjdCB4ZV9scmMgKmxyYywgdTMyIHNlcW5vKSAgew0KPiA+ICAJdTMyIGR3
W01BWF9KT0JfU0laRV9EV10sIGkgPSAwOw0KPiA+ICsJdTMyIHNhZGRyID0geGVfbHJjX3N0YXJ0
X3NlcW5vX2dndHRfYWRkcihscmMpOw0KPiANCj4gcGxlYXNlIGtlZXAgZGVmaW5pdGlvbnMgaW4g
cmV2LXhtYXMtdHJlZSBvcmRlcg0KDQpPaywgdGhhbmtzLCBJIHdpbGwgY2hhbmdlIHRoaXMgYW5k
IHJlc3QgY29tbWVudHMgYXJlIGFuc3dlcmVkIGJ5IE1hdHRCLiBJZiBubyBvdXRzdGFuZGluZyBj
b21tZW50IHRoZW4gSSB3aWxsIHJlc3BpbiB3aXRoIHRoaXMgbml0IGNoYW5nZS4NCg0KVGVqYXMN
Cj4gDQo+ID4NCj4gPiAgCWkgPSBlbWl0X2NvcHlfdGltZXN0YW1wKGxyYywgZHcsIGkpOw0KPiA+
DQo+ID4gLQlpID0gZW1pdF9zdG9yZV9pbW1fZ2d0dCh4ZV9scmNfc3RhcnRfc2Vxbm9fZ2d0dF9h
ZGRyKGxyYyksDQo+ID4gLQkJCQlzZXFubywgZHcsIGkpOw0KPiA+ICsJaSA9IGVtaXRfc3RvcmVf
aW1tX2dndHQoc2FkZHIsIHNlcW5vLCBkdywgaSk7DQo+ID4NCj4gPiAgCWR3W2krK10gPSBNSV9B
UkJfT05fT0ZGIHwgTUlfQVJCX0RJU0FCTEU7IC8qIEVuYWJsZWQgYWdhaW4NCj4gYmVsb3cgKi8N
Cj4gPg0KPiA+ICAJaSA9IGVtaXRfYmJfc3RhcnQoam9iLT5wdHJzWzBdLmJhdGNoX2FkZHIsIEJJ
VCg4KSwgZHcsIGkpOw0KPiA+DQo+ID4gLQlpZiAoIUlTX1NSSU9WX1ZGKGd0X3RvX3hlKGpvYi0+
cS0+Z3QpKSkgew0KPiA+IC0JCS8qIFhYWDogRG8gd2UgbmVlZCB0aGlzPyBMZWF2aW5nIGZvciBu
b3cuICovDQo+ID4gLQkJZHdbaSsrXSA9IHByZXBhcnNlcl9kaXNhYmxlKHRydWUpOw0KPiA+IC0J
CWkgPSBlbWl0X2ZsdXNoX2ludmFsaWRhdGUoZHcsIGkpOw0KPiA+IC0JCWR3W2krK10gPSBwcmVw
YXJzZXJfZGlzYWJsZShmYWxzZSk7DQo+ID4gLQl9DQo+ID4gKwlkd1tpKytdID0gcHJlcGFyc2Vy
X2Rpc2FibGUodHJ1ZSk7DQo+ID4gKwlpID0gZW1pdF9mbHVzaF9pbnZhbGlkYXRlKHNhZGRyLCBz
ZXFubywgZHcsIGkpOw0KPiANCj4gaG1tLCBidXQgc2Vxbm8gaXMgYWxyZWFkeSBzdG9yZWQgYnkg
dGhlIGFib3ZlIGVtaXRfc3RvcmVfaW1tX2dndHQoKSwgc28NCj4gbWF5YmUgdG8gZnVsZmlsbCBN
SV9JTlZBTElEQVRFX1RMQiByZXF1aXJlbWVudCBpbnN0ZWFkIG9mIHBvc3Qtc3luYw0KPiBJTU0o
MSkgdXNlIHBvc3Qtc3luYyBUSU1FU1RBTVAoMyk/DQo+IA0KPiA+ICsJZHdbaSsrXSA9IHByZXBh
cnNlcl9kaXNhYmxlKGZhbHNlKTsNCj4gPg0KPiA+ICAJaSA9IGVtaXRfYmJfc3RhcnQoam9iLT5w
dHJzWzFdLmJhdGNoX2FkZHIsIEJJVCg4KSwgZHcsIGkpOw0KPiA+DQoNCg==
