Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DC11093191
	for <intel-xe@archiver.kernel.org>; Fri, 20 Mar 2026 09:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED34910E541;
	Fri, 20 Mar 2026 09:10:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Feta7U/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF4D10E541
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Mar 2026 09:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773997849; x=1805533849;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g8owH7mu/ARIhznhVnoI8RepGYsH+T6vRCn3tOSEVyc=;
 b=Feta7U/Jfaxkm4j7HdkM5SwSFuYpGDcrQkSpsSYOOr/go/XhDeG6LRG6
 exfGYpOTI3hTitsYjaNolXvRKDwwAOB+8vWzHPSFrusq/l8MYgS+hWX0x
 2k+a9vKF5UNWApCm3PwmA4ERBfq1CCgPBgQCtD215Kvf1xMKEgvsd/BTF
 MkDbLbK7I58w5Wh3x23OQUJjKWjS4DE50tmkRKo0T3ZfnN4/sLF0C5JZT
 mqwRY/ckSSF7X97mfxwv4jgYup4o6RdPvSf0hDV4Jf0zx+tBgc1ahAt8q
 y88Y2frdl1Y+TUGYnp7OwG570C0ee9jh8GRSJxcKt/njUHW2ClgJ9Qose Q==;
X-CSE-ConnectionGUID: EZA6Cm2tQhi3PcVinAQDPQ==
X-CSE-MsgGUID: U0geQMQrQDu641YfJGkeGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="92465628"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="92465628"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:10:48 -0700
X-CSE-ConnectionGUID: t4p7+NS1QiWrHwsKuiucnw==
X-CSE-MsgGUID: EysDrTdST9OEFxV65secEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="222457505"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 02:10:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:10:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 20 Mar 2026 02:10:47 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 20 Mar 2026 02:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GH254Hc2oj0j1BNP3To4faOGOxoe6PERq4IcuIjJr0D0uKchTDhQRUyGsBa9RgRqa1HIzipOsqBlKq0QanwwaV4mlf0E+ZIaHY80FjTs8l64fuoJp0bKv8MGJQhwO02Eq17o3xwrgGxKXbhFeBPXkXG0CuXwpEZwMHtW+zQezbac5zKJgLc49YlnHKpzbkrm+mZyh50z1kmQ0HShYBIELb0RFNwCwc2EsqfVFA4PgT3HHxvaIo+MDp3EuYAg7Ui+rR4P9lQQ4yI55cbhUODLPwk5IaluDNtUp5lxZ+pjJjowqknQNE2DZJYdxBWA368vbsv9aCSG1jIZ/MvufyQE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8owH7mu/ARIhznhVnoI8RepGYsH+T6vRCn3tOSEVyc=;
 b=iO6RzGW/cp0tkNo+jx1TL7PwDWBxiA3c5XqXw2FjKNRao11+LiOzaVLXHnA2vufpibsLmp25iR4ZwbxHBvBmAv040C5ZQKLRSKUPYnuqK1dMEu7xNTWcZFjwjPaWKrgltzRhjy+38Ha8vaXrYV0F6MeWApeptUkfdW2SLNrQe6B1Jz/4zrmed/w9vXA20b9ReJlsqFKpelNmdoGtOS48UTDr+EaCGfigyhjRHieZ11CUGgBMKS4EhN8eCk+kKltqMHG7hbQ6H+CkGYhLq3JjVadrpS94+dcpQTzj21n98Ax8LiAG87qZOVPbVIw7K36Tcpdoal/+vmTVWesOBtA9jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.9; Fri, 20 Mar 2026 09:10:41 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:10:41 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Ruhl, Michael J" <michael.j.ruhl@intel.com>, 
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: RE: [PATCH v23 09/12] drm/xe/display: Change write_dpt_remapped_tiled
 function signature
Thread-Topic: [PATCH v23 09/12] drm/xe/display: Change
 write_dpt_remapped_tiled function signature
Thread-Index: AQHct4g4UxNRObW2z0qLxILlv6mVmLW3I6EA
Date: Fri, 20 Mar 2026 09:10:40 +0000
Message-ID: <DM4PR11MB63600EA387518E3014807627F44CA@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260319100707.60157-1-tvrtko.ursulin@igalia.com>
 <20260319100707.60157-10-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260319100707.60157-10-tvrtko.ursulin@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM4PR11MB6550:EE_
x-ms-office365-filtering-correlation-id: dd6bb63d-cd32-46d5-e66e-08de86608f10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 7+SAdgQlquZbkHwepYO7tC6Q2KGzWuno/E18XvAwaeGd+dfXY3W+e5njBsMEcn7QQ9pJfTaacO7p5sbYnNzda6i8f8SzEEvGpTznYEQWtnKBkrDTIpu9eREPUnlJts54jeDGh0HZsVJ4wSQTmGzFl751npZ5Vh8yqv/8T4Vt1ysRuCrkw6pFe4ukyESDHaL7g7AKgeQaNB7n0SkCRY8QPAzDV+SgDsAMw5Ohiycv0qn8v/ZjFJgFp6UxPG6JesBAWYNcD5V8CXt9N6OOP5CDjUW+TdY9d324hcJO82F0xfs0UmhwylPJ8Np1gbA8ErF5s/YA+ZzCZ++tZsDQLOyxQKszeOunWAjukCulapqceBTQoX334h0+scOv56DgsrjTjn5CG05EaM2rmtXwEPxMzaEc4DTZDdoEcuPLmQNX125lgF3x55pn/hfTLazn1XSePzvWchCe+7tn3UIL8tiHrXUFDuwlBUausXqQLVp5eeI+nMUDIaQrupjkRfvQLhCqBn5AKlAdH/6uGAUB1PPC0jXq1ZT7Nb85ktrHfaKQADkrrip0vMrQbA3j8BkUFYxDn8HptG0G5YFhH0TCaw0jz+aO1TpO8cDfaOMy7yknqNTNMIdNRta8qn9ePHyCtDC2TwSKWR1c8+oIrIBdltsuMNhtRlljYGxVrfykIPiiotjMEH6xP+mJgZTFwpORXkhwTnX4pd2DIURPC9HREK1GC//di6pi+sSv/2ToC1M00/aGaqX2xDi3BVbDXNTZJ89DKN4lbJzeoWqTfb5pzjfRkhFyDlXyfqHpGMrn4267UlE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UkZGQnVndGxNdm9tWGRaNCt6ZXBFdUlEcFBXRVBqL2tnSjRyZGZ3QmxHcjgy?=
 =?utf-8?B?ZzdNckVIUWxGM1p4azNIM1ptMkxhSUdnUkE0TTRIZGdiaE95YzY4YlBNdndn?=
 =?utf-8?B?Y3RTdFp1eGtvb1pCa1l0TDFpNml3YStpM0h6YUJGdEFWaVBuTGtRM093dkcw?=
 =?utf-8?B?VFlNRXp2Q1VmWE5NcDAzdlE5M08zeGVBKzVDc1pRUTR2V1ZaZWtVT2ovYnkv?=
 =?utf-8?B?Y2tBUStPSjJyZlJnZ1pLWlRsUGJiN3JHWndKV3Q0NjMrSzBjVkp1eUtYblJV?=
 =?utf-8?B?QTJITGY0SkI4M3UvdldwMk5JVUdEOHNTM1RUN2VWUVp5bEtORlhWdmpjQWU4?=
 =?utf-8?B?UG9oNitMYkZ4Q0g2dk9Pc3o2dmtRYjZYcEl4VFltcHZTSjYvaVBzb25aYU8x?=
 =?utf-8?B?TWtzeHk3N3J5bk9SUGFtQzBPMm5BK1dOMzdNeVlUZGNleHI4U1I2S21LUXYv?=
 =?utf-8?B?eU9oWEVLQksrV1RudUhDNktRdFQ4UkpqTVRKaFprUFA4T0tOM1U2N2U2T3Js?=
 =?utf-8?B?K3NkMmJ6YVpJdlNzZ01Lelg5LzdrQTV2UzJFMmo2Y3ZOK1dwYkYvUkhPbGlC?=
 =?utf-8?B?UXRYSkdOcklabk1Eb3VsRi9QUitBcXBGOHFJLzhNS3JtcEJYZ1V5ZEFzNnlw?=
 =?utf-8?B?SkVBdDRxNSttRUx6dWlSK0U1RFQzMUMvM0crTWN1Z1JrOG1GWFVwVXUzeUJN?=
 =?utf-8?B?clBlZ3FWRWRwekxiK1AwdWFqRm05N3B3MDU5eVRoeUlMZFVMeS9BWWc3Z3FN?=
 =?utf-8?B?UlFVU3dieXZkbnR5d3JEY0p4R3Y0TzJlUmp3aURHbHY1M3N4SjlNZDMwUEYy?=
 =?utf-8?B?NXdUZFRtdXhIUytyeFVCcnA2Z1NQZkRERHg1NEJFU0gxTjFuZDk0clRyYmV5?=
 =?utf-8?B?czRHcndoWjEva3Q3VUdJUkFuVnJpQ1hlYjV0eUM2a3lHVjNmWTcwYnNWdVAx?=
 =?utf-8?B?U2ZndWdBblBvTEh6Qkg4WVlIWVplQzhhYXZrSkk3WDl5STBKRFFjQlc1a1hK?=
 =?utf-8?B?VlF2QUlsZEEvbmN5SENxNlFYc3l2ZUYxVzFTZzdwUGovSFM3aENuNlJSY0J2?=
 =?utf-8?B?WVE2d1oxMkJMQVNhS1lSbklzWkcySXp3T05seFNtbnRxc1duNCt2d1lyVFEr?=
 =?utf-8?B?aXpHb251dDZDdjltV2hGOTRDWUQxY0dIMGgrR2YvcWFQcVJXNUpSTmo5MFlt?=
 =?utf-8?B?ZlNoNU1qWmRMVUZGcXpBcmpJanVic0pJbEZyalRKZlhmWUdYSUpFcEV3UFlF?=
 =?utf-8?B?ZERTcDk3a3NpMEgyK2R4SHl1bUo1RWUwc01PRFJjdHVxM25SYWpaRGY5UEJJ?=
 =?utf-8?B?QjVsNStOczl2a3lGQnNEWjErQzc2dlduVTFybCtJWHp6bXBBbFVUSzUyRnFy?=
 =?utf-8?B?aTZsQW1hckpWU09rVmxCbXNGY2FoTzB2NEVjUVJ5MTdNVWo1T3BNNDV3L1Jz?=
 =?utf-8?B?MG1XdzJsWlFuTU9wZVYxaDBoK0UyZWZ2cVlkcUk4M3JTQmdvMXRVV29XWjhT?=
 =?utf-8?B?ZER6YlBoeU52MFRIY3V3bkFpK0w4TCsyZUFiUGJoK09CaEsybTQvV0s2aXI3?=
 =?utf-8?B?d240TllMVXFCY1FHa05wRVRyeDJVUkUwazZudVAwUlg4R3owbjNYb1BCUEpa?=
 =?utf-8?B?S2Njejd3cE4rZzRwNjVMSnVSYXJ4RzFON3haZURwOHd3dWJMeXA1L0JDemVx?=
 =?utf-8?B?cExPMDJVeGlSMzhGWTRXUGJGTXlDUkdITGxjRzdscVVITm1FQll1bnpuR0FV?=
 =?utf-8?B?T3k1OENFRXFhOWNPbHBzMklBQUtnY3dlZ0dhYVZkMm0wcm9qUDFFZm54a0Fs?=
 =?utf-8?B?d3lsUXNCaERPUk1QRXRBTlhDa05JVEg4bkE2ZWZKVVVUcE55dlZWSXJpaDFi?=
 =?utf-8?B?bUFmRjlUVzZ3bzI3ZDdMQTA5L2Z4b3BsMUxwbUpuM0QzcWdLQ0lQa3hPd243?=
 =?utf-8?B?QXRUR3UxY0tBWFY2c0FyLzJTQUlvMTk2aWxhR3NtWGZkNzRYWURESHRSVTVO?=
 =?utf-8?B?aGpxNW00bng2OGRUdlZMVlJKNGZqQnd0bGFBdTRvQ3dCL081RUdIcHdnWEt3?=
 =?utf-8?B?akp1d3l4ZC9KVWxUUkJ1QWIxVDh4TkhHK1EzTzlUZ3lPRnd0elIyM1R6cFd1?=
 =?utf-8?B?eE1kdktjMStIM3VaZnVDTDVOaEJicE1aRE1DbGxBcnFlc05SN3k3R2lsckgr?=
 =?utf-8?B?U21Xd1VLQ0RoM1YvcXUvOXdNVjlUc05tMlMweUtYSXJvdHpIQWcwMkhyWXhq?=
 =?utf-8?B?WFoxUVBnbVNFZkh0RW9Yam12eVZTRlJkN2tpd09zMmRjTVIzUnl0MVM0UzBu?=
 =?utf-8?B?ZDRLQ2xTTFBVU0lOOG40Y0JrKzBhWFBnWFpCK2VLdE14U1F6cUd3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: FcCb5toPX4xLdY6Snjl4Xu3PSChOvhsmCB1CXpDPrxho/flDOnDm61rU98I0yy0/RESAQVfHyY5nEl3BbEVfgbg576DstUVxMGsGMEZxsyqe3He/8KOF1B2ABKs/g9kfQmyc47EcpRiu7APBVpaiKPGcnT4wugZvU9vQ1byuWlTWgNEA3tT3jFzX2cAQpMavwFQttO7ZYl079v9WTFKx1i8nUYrPfmPnD+0cIaFoWGAU1m4ZGlioZ+/X7YlRW7+a/2AukAZGnZ+BEtmcfz8JfSW5ikZWTHsGG9jZGGN2snlegj4lSloYoNqmAeLjkGSwRgf7Qn+bztjl3fNhu8wtzg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6bb63d-cd32-46d5-e66e-08de86608f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2026 09:10:40.8203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmHNGVtjgAdtObgPNV66g70Pqjgm05To066pQe1H7dVVb6/16ZW0imtLg8ddODTmyaTL0SqrCyMEm7hgUwXaDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6550
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJjaCAxOSwg
MjAyNiAzOjM3IFBNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6
IGtlcm5lbC1kZXZAaWdhbGlhLmNvbTsgU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRlbC5j
b20+OyBUdnJ0a28NCj4gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaWdhbGlhLmNvbT47IEp1aGEt
UGVra2EgSGVpa2tpbGENCj4gPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+OyBSdWhsLCBN
aWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47DQo+IFZpdmksIFJvZHJpZ28gPHJv
ZHJpZ28udml2aUBpbnRlbC5jb20+OyBUaG9tYXMgSGVsbHN0csO2bQ0KPiA8dGhvbWFzLmhlbGxz
dHJvbUBsaW51eC5pbnRlbC5jb20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5r
aG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIzIDA5LzEyXSBkcm0v
eGUvZGlzcGxheTogQ2hhbmdlIHdyaXRlX2RwdF9yZW1hcHBlZF90aWxlZA0KPiBmdW5jdGlvbiBz
aWduYXR1cmUNCj4gDQo+IEluIHByZXBhcmF0aW9uIGZvciBhZGRpbmcgc3VwcG9ydCBmb3IgdGhl
IGF1eGNjcyBwbGFuZSBsZXRzIGNoYW5nZSB0aGUgZnVuY3Rpb24NCj4gc2lnbmF0dXJlIG9mIHdy
aXRlX2RwdF9yZW1hcHBlZF90aWxlZCgpLiBUaGlzIHdpbGwgZW5hYmxlIGEgdGlkaWVyIHdheSBv
ZiBleHRlbmRpbmcNCj4gaXQgc3Vic2VxdWVudCBwYXRjaGVzLg0KDQpMb29rcyBHb29kIHRvIG1l
Lg0KUmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQoNCj4g
U2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+
DQo+IENjOiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29t
Pg0KPiBDYzogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+IENj
OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYWFydGVu
IExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogVW1h
IFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj4gLS0tDQo+IHYyOg0KPiAgKiBVcGRh
dGUgZGVzdCBiZXR3ZWVuIHBsYW5lcy4gKFVtYSkNCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0v
eGUvZGlzcGxheS94ZV9mYl9waW4uYyB8IDU4ICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVfZmJfcGluLmMNCj4g
Yi9kcml2ZXJzL2dwdS9kcm0veGUvZGlzcGxheS94ZV9mYl9waW4uYw0KPiBpbmRleCAzMzFmM2Mx
ZGE0NDQuLmVhZDcwZWU0ODAyOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL2Rp
c3BsYXkveGVfZmJfcGluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2Rpc3BsYXkveGVf
ZmJfcGluLmMNCj4gQEAgLTQ5LDMzICs0OSw0NCBAQCB3cml0ZV9kcHRfcm90YXRlZChzdHJ1Y3Qg
eGVfYm8gKmJvLCBzdHJ1Y3QgaW9zeXNfbWFwDQo+ICptYXAsIHUzMiAqZHB0X29mcywgdTMyIGJv
Xw0KPiAgCSpkcHRfb2ZzID0gQUxJR04oKmRwdF9vZnMsIDQwOTYpOw0KPiAgfQ0KPiANCj4gLXN0
YXRpYyB2b2lkDQo+IC13cml0ZV9kcHRfcmVtYXBwZWRfdGlsZWQoc3RydWN0IHhlX2JvICpibywg
c3RydWN0IGlvc3lzX21hcCAqbWFwLCB1MzINCj4gKmRwdF9vZnMsDQo+IC0JCQkgdTMyIGJvX29m
cywgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgc3JjX3N0cmlkZSwNCj4gLQkJCSB1MzIgZHN0
X3N0cmlkZSkNCj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQNCj4gK3dyaXRlX2RwdF9wYWRkaW5nKHN0
cnVjdCBpb3N5c19tYXAgKm1hcCwgdW5zaWduZWQgaW50IGRlc3QsIHVuc2lnbmVkDQo+ICtpbnQg
cGFkKSB7DQo+ICsJLyogVGhlIERFIGlnbm9yZXMgdGhlIFBURXMgZm9yIHRoZSBwYWRkaW5nIHRp
bGVzICovDQo+ICsJcmV0dXJuIGRlc3QgKyBwYWQgKiBzaXplb2YodTY0KTsNCj4gK30NCj4gKw0K
PiArc3RhdGljIHVuc2lnbmVkIGludA0KPiArd3JpdGVfZHB0X3JlbWFwcGVkX3RpbGVkKHN0cnVj
dCB4ZV9ibyAqYm8sIHN0cnVjdCBpb3N5c19tYXAgKm1hcCwNCj4gKwkJCSB1bnNpZ25lZCBpbnQg
ZGVzdCwNCj4gKwkJCSBjb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfcGxhbmVfaW5mbyAqcGxh
bmUpDQo+ICB7DQo+ICAJc3RydWN0IHhlX2RldmljZSAqeGUgPSB4ZV9ib19kZXZpY2UoYm8pOw0K
PiAgCXN0cnVjdCB4ZV9nZ3R0ICpnZ3R0ID0geGVfZGV2aWNlX2dldF9yb290X3RpbGUoeGUpLT5t
ZW0uZ2d0dDsNCj4gLQl1MzIgY29sdW1uLCByb3c7DQo+IC0JdTY0IHB0ZSA9IHhlX2dndHRfZW5j
b2RlX3B0ZV9mbGFncyhnZ3R0LCBibywgeGUtDQo+ID5wYXQuaWR4W1hFX0NBQ0hFX05PTkVdKTsN
Cj4gKwljb25zdCB1NjQgcHRlID0geGVfZ2d0dF9lbmNvZGVfcHRlX2ZsYWdzKGdndHQsIGJvLA0K
PiArCQkJCQkJIHhlLT5wYXQuaWR4W1hFX0NBQ0hFX05PTkVdKTsNCj4gKwl1bnNpZ25lZCBpbnQg
b2Zmc2V0LCBjb2x1bW4sIHJvdzsNCj4gDQo+IC0JZm9yIChyb3cgPSAwOyByb3cgPCBoZWlnaHQ7
IHJvdysrKSB7DQo+IC0JCXUzMiBzcmNfaWR4ID0gc3JjX3N0cmlkZSAqIHJvdyArIGJvX29mczsN
Cj4gKwlmb3IgKHJvdyA9IDA7IHJvdyA8IHBsYW5lLT5oZWlnaHQ7IHJvdysrKSB7DQo+ICsJCW9m
ZnNldCA9IChwbGFuZS0+b2Zmc2V0ICsgcGxhbmUtPnNyY19zdHJpZGUgKiByb3cpICoNCj4gKwkJ
CSBYRV9QQUdFX1NJWkU7DQo+IA0KPiAtCQlmb3IgKGNvbHVtbiA9IDA7IGNvbHVtbiA8IHdpZHRo
OyBjb2x1bW4rKykgew0KPiAtCQkJdTY0IGFkZHIgPSB4ZV9ib19hZGRyKGJvLCBzcmNfaWR4ICog
WEVfUEFHRV9TSVpFLA0KPiBYRV9QQUdFX1NJWkUpOw0KPiAtCQkJaW9zeXNfbWFwX3dyKG1hcCwg
KmRwdF9vZnMsIHU2NCwgcHRlIHwgYWRkcik7DQo+ICsJCWZvciAoY29sdW1uID0gMDsgY29sdW1u
IDwgcGxhbmUtPndpZHRoOyBjb2x1bW4rKykgew0KPiArCQkJdTY0IGFkZHIgPSB4ZV9ib19hZGRy
KGJvLCBvZmZzZXQsIFhFX1BBR0VfU0laRSk7DQo+IA0KPiAtCQkJKmRwdF9vZnMgKz0gODsNCj4g
LQkJCXNyY19pZHgrKzsNCj4gKwkJCWlvc3lzX21hcF93cihtYXAsIGRlc3QsIHU2NCwgYWRkciB8
IHB0ZSk7DQo+ICsJCQlkZXN0ICs9IHNpemVvZih1NjQpOw0KPiArCQkJb2Zmc2V0ICs9IFhFX1BB
R0VfU0laRTsNCj4gIAkJfQ0KPiANCj4gLQkJLyogVGhlIERFIGlnbm9yZXMgdGhlIFBURXMgZm9y
IHRoZSBwYWRkaW5nIHRpbGVzICovDQo+IC0JCSpkcHRfb2ZzICs9IChkc3Rfc3RyaWRlIC0gd2lk
dGgpICogODsNCj4gKwkJZGVzdCA9IHdyaXRlX2RwdF9wYWRkaW5nKG1hcCwgZGVzdCwNCj4gKwkJ
CQkJIHBsYW5lLT5kc3Rfc3RyaWRlIC0gcGxhbmUtPndpZHRoKTsNCj4gIAl9DQo+IA0KPiAgCS8q
IEFsaWduIHRvIG5leHQgcGFnZSAqLw0KPiAtCSpkcHRfb2ZzID0gQUxJR04oKmRwdF9vZnMsIDQw
OTYpOw0KPiArCWRlc3QgPSBBTElHTihkZXN0LCBYRV9QQUdFX1NJWkUpOw0KPiArDQo+ICsJcmV0
dXJuIGRlc3Q7DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQNCj4gQEAgLTgzLDE1ICs5NCwxNCBA
QCB3cml0ZV9kcHRfcmVtYXBwZWQoc3RydWN0IHhlX2JvICpibywNCj4gIAkJICAgY29uc3Qgc3Ry
dWN0IGludGVsX3JlbWFwcGVkX2luZm8gKnJlbWFwX2luZm8sDQo+ICAJCSAgIHN0cnVjdCBpb3N5
c19tYXAgKm1hcCkNCj4gIHsNCj4gLQl1MzIgaSwgZHB0X29mcyA9IDA7DQo+ICsJdW5zaWduZWQg
aW50IGksIGRlc3QgPSAwOw0KPiANCj4gLQlmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZW1h
cF9pbmZvLT5wbGFuZSk7IGkrKykNCj4gLQkJd3JpdGVfZHB0X3JlbWFwcGVkX3RpbGVkKGJvLCBt
YXAsICZkcHRfb2ZzLA0KPiAtCQkJCSAgIHJlbWFwX2luZm8tPnBsYW5lW2ldLm9mZnNldCwNCj4g
LQkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtpXS53aWR0aCwNCj4gLQkJCQkgICByZW1hcF9pbmZv
LT5wbGFuZVtpXS5oZWlnaHQsDQo+IC0JCQkJICAgcmVtYXBfaW5mby0+cGxhbmVbaV0uc3JjX3N0
cmlkZSwNCj4gLQkJCQkgICByZW1hcF9pbmZvLT5wbGFuZVtpXS5kc3Rfc3RyaWRlKTsNCj4gKwlm
b3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShyZW1hcF9pbmZvLT5wbGFuZSk7IGkrKykgew0KPiAr
CQljb25zdCBzdHJ1Y3QgaW50ZWxfcmVtYXBwZWRfcGxhbmVfaW5mbyAqcGxhbmUgPQ0KPiArCQkJ
CSZyZW1hcF9pbmZvLT5wbGFuZVtpXTsNCj4gKw0KPiArCQlkZXN0ID0gd3JpdGVfZHB0X3JlbWFw
cGVkX3RpbGVkKGJvLCBtYXAsIGRlc3QsIHBsYW5lKTsNCj4gKwl9DQo+ICB9DQo+IA0KPiAgc3Rh
dGljIGludCBfX3hlX3Bpbl9mYl92bWFfZHB0KGNvbnN0IHN0cnVjdCBpbnRlbF9mcmFtZWJ1ZmZl
ciAqZmIsDQo+IC0tDQo+IDIuNTIuMA0KDQo=
