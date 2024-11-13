Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8CE1D41C2C
	for <intel-xe@archiver.kernel.org>; Wed, 13 Nov 2024 09:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E4410E6BF;
	Wed, 13 Nov 2024 09:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkoR4rJM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62E9410E6BF
 for <intel-xe@lists.freedesktop.org>; Wed, 13 Nov 2024 09:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731491658; x=1763027658;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tApnmFhMD9AKKO6rnWVh6uZaSQ0b6iW3XKytxC56M5A=;
 b=YkoR4rJMWVcrbUyAlN8XvLLfMC2/qMwab+S9a+phPvFNm2MWbJjL4JcR
 o7dUAi15ftoQukyOUeCpazil/jCb5qRqiZ4F8rLhzgWMXjGEwBAJqEt7I
 Ku8JhpFWFncsvqaJQKy6I1jyGCe53DXFLksN9Cuq6Sk6xMzy/WeOVMPaS
 BkgtWTUZyXPW4dXXLTLbROY5lz+xLfe0EshKt9AJHtadrZZPc2datMBV4
 F5tAWWwKFyzZbNs64M50V6D5jZlyvP0z2+5qeUG02M5TTofXq9Nv3f3m4
 INHTFBTZ05QyhfVpj4Ux8yMIlObvRgvltnQ9RFmgN5tgVzYPBWzSyMkcK Q==;
X-CSE-ConnectionGUID: cD3hCI9VSj6EtvF0fMb3Hw==
X-CSE-MsgGUID: oXFAYJ4xR2qIdD2nes0Wbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42783079"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="42783079"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 01:54:18 -0800
X-CSE-ConnectionGUID: EXexYZWTTBikJOcLVeqaSA==
X-CSE-MsgGUID: WzDaR8eHTvSamlILZddGRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="88240569"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Nov 2024 01:54:18 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 01:54:17 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 01:54:17 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 01:54:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zh0Si+dNpwPRLFZ/hHZoYdCpHi0uO0wTFRNKxLnOOrVP8gHDJ16BrxBtUtfjghoHTVgUA8WFcb8DC93n9Vs0FTodZKCEmXI2X2XOAM1jycM2eyNMr+GcTtJH0r63xxdNvQQGt7WHatLCAs2KTBPyiPz/0sb9kkVekQwWjRIr+Pub2Zfhw7j1OcjehvW4yAj7Q0WUnFXHb6EcHJPBa9eJj6vthg4ioyGbFgT+uZjtmWhOxIXko9M2AldcUR1zz+V19biSRBUX+5xV+j5rUa1QdaeVCBiJgQm9Suk0L8fOmBkw1YvpYv4Jmw/nNfgLLy4Iwz8UbOfloraqHvNowTwovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tApnmFhMD9AKKO6rnWVh6uZaSQ0b6iW3XKytxC56M5A=;
 b=CalQY9YJk3oyYxh4BLfIKI92MvPxVI6IUdWZQ18/KOxYD12TlMfHy0kbFKsQt2AuTjUdidJ/Lw2l2+TGjBq70oebZel23ODybFog2q5244zWtUeuMZ6WR94A/INjlCfSTJSZWsw5HTS7CodfljqnAvL41vFx0yPfXaQVeYYF7z8GW+CISpLtx1LDupl/95KRA+j+dO8r5PcRPFSG6gWbRO/pTK5HooTIfJUaSPoVhWiD6L+B0NIqtJSrOG78ce9C7lfhyhFRkIpSxvWsg0YUDavEjrol2FUi7LpFRvsK9xmIVB68ehyCzpvOaOP5QTvEquEuRBfi9ILseeU0zDza+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7054.namprd11.prod.outlook.com (2603:10b6:303:219::20)
 by PH0PR11MB7660.namprd11.prod.outlook.com (2603:10b6:510:26f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Wed, 13 Nov
 2024 09:54:10 +0000
Received: from MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e]) by MW4PR11MB7054.namprd11.prod.outlook.com
 ([fe80::9504:33a7:4018:581e%6]) with mapi id 15.20.8158.013; Wed, 13 Nov 2024
 09:54:09 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH v2] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Thread-Topic: [PATCH v2] drm/i915/display: Pcode sets the CD clock frequency
 voltage levels
Thread-Index: AQHbNQdoKk23NNWwI0Kd5PW4F9V8N7K0E0oAgADk/YA=
Date: Wed, 13 Nov 2024 09:54:09 +0000
Message-ID: <MW4PR11MB7054DA83A51BF3AA4631DC5EEF5A2@MW4PR11MB7054.namprd11.prod.outlook.com>
References: <20241112132411.491540-1-mika.kahola@intel.com>
 <20241112200844.GI5725@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20241112200844.GI5725@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7054:EE_|PH0PR11MB7660:EE_
x-ms-office365-filtering-correlation-id: f95f1f0c-4062-4417-b762-08dd03c91ee7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SldKd21QUUFWV0o2REpucEt4c1ljQkRCN1YrcEYxZTNHeVlFUGwraXBBS0g1?=
 =?utf-8?B?SUt6RW9wcDNoMmRMMUdKVzFJWHlUWENUcEdvSFVJSG41eUQrQTlGZ2t4WmFW?=
 =?utf-8?B?L2xNMVY5bFlaMDdlc0dFUDZEZjBXelByOUZnVHF4NXBvRHl1RTNGNWN1dUZm?=
 =?utf-8?B?dTk5N0diTngvVDM1bVp1TWZLZUF1bDV6alBNVGlDT3dZKytEdHBkNnFPRjNl?=
 =?utf-8?B?TVROR3FsdUkwb1R5VTFUd3BOTXE0WU5NMFZ5d0l3TThXck1ZdDd5TmhoMjBs?=
 =?utf-8?B?bVhNZEpSVytvekdHdzhnZVVZZXM5Qzl5MDU4MjcxdHZsS0FEMUhHNUFqWXI0?=
 =?utf-8?B?UjNRTXJZT2xDaGtTeXNxZ2U2YWZacUxLSUV3Z2dQUGFTL2UvOSt3NlNHeG4v?=
 =?utf-8?B?N2xBRXZnaU53TlR3R3d0TEt2WEF3azhKNU82YVRUUURudG1KS0FxVU0yZU5Y?=
 =?utf-8?B?Wktmd1FsOUJ1Y3FhQkJpWG1lTlJmbTcvY2JvNnF3bndmTzhIMStLYTRFNjBK?=
 =?utf-8?B?L0xjNUhXRW54K2JaL3lrZDJ1WEo3U2xUcFJzMlZwcktIVkZXYTZUbm5TZ1Ba?=
 =?utf-8?B?UkdYbGRoaUJvY0pLQjFjdjBtdjViM0Eyd0gxRGtkQ3IvWlRYK3JGVWFvVFU1?=
 =?utf-8?B?SVlWS1RDUUpYTjJJakZYRmNpb3VjNCtyMnJMSFN2NFBpbTN4S2dDbFYwSkg4?=
 =?utf-8?B?VVBOZVZqbUMxcDAxZUVSSFAwb25zUUxHTHBkRFBoOWRZNW9IM1dkdXI4SHVj?=
 =?utf-8?B?QThVR3pkMmZSVU1vODhncTU3Q1oxY0x3M0hpQnIyVFBwZ3E1RlB0eDg2L0tE?=
 =?utf-8?B?Zi9IN1UwaGxKYnhoYXRQWjc4dndkbnc5VzNVR2s0MjFNd3Q5a2tmRWErTnhr?=
 =?utf-8?B?TFNwV2tBaGdoWTcvQ0Z0ZkhOLzd1VVpHUFRXd0oxUTNrbi82alJvaFFYVTVa?=
 =?utf-8?B?NmM5ek1xUWp3WElORWprZHFLUDJjM2xpcU1DL0RqRUZReFFuWVQzZS9Ua3pC?=
 =?utf-8?B?RW1vakFjYUxaUVZweVRXNDgxcGMxS0hOTGJUYkR1K3Zna1hhb1VmbWV4ZDNB?=
 =?utf-8?B?elEzeE5XVVBTSS91SFdYMXJDd0s0Zyt0SHFlZnJKTERKS2hBeWxDbTJRTFJy?=
 =?utf-8?B?ZGcvRnNtZVNrL0RZNy9uV09weDdNTC9EOER2OExaRnBua1U4Z05rWitwUTA1?=
 =?utf-8?B?UDl6QTdtSzF4cUZnLzRwY0I4MkpFcTBqTXUwaHM4ak95a2owWmRUTjJCNExv?=
 =?utf-8?B?c1AxTm9FMncxdEhxU1VodUxnZnZqd2d3eUVWOG5SZ25ieWhzNXlHSGlSWDFq?=
 =?utf-8?B?enp1VCt3elNvMzN1eCtPdTB5ZFloK1Z0SllpbFhEaFlUSjRBY1F2d0R4QVNN?=
 =?utf-8?B?aHFKcU0xQjBLWW1GQ05qM1dGNUFocHlsVFJkWEE2YlpidHhSY01Pbk5OYlFE?=
 =?utf-8?B?N1grVmlGWEszK0ZFSW9sOE9nNHliVXJ6NHJTUndtenpwZUYrZFRlTHVEa2Y4?=
 =?utf-8?B?Umc1YmlPQ3ROZXovKzFFZlhmUUNycWRrM0gyRGJnOXFTYjk0UGhZQ2s4UGoz?=
 =?utf-8?B?T2NuQ1J4TWE3TTZzQWtvQmI1ck1CK0FpeFBtZUpIU2I5TEU0M1ZNaDM4aDhL?=
 =?utf-8?B?T1pVMHRqbHBpeUlHd21kbFNjL2NLYmRUVkwvSmE5RVF4ZTRYd0lFa2IxVVpR?=
 =?utf-8?B?b25nL2tobVlnY1ZLbUhvKzMya284MGE4SG9adFZpL091UFpKQzlZU3VRbVpU?=
 =?utf-8?B?NWxnZGpvcG01cDJuRHI2KzhOcWhMZzNjYVFQaXl0NnQvbDdqOGVEWVBkREZ2?=
 =?utf-8?Q?Q/leqeYvYwDO4dEEaexJmYn0SfuXn2cc0stlY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7054.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2VodFI5eTBmS2RaZGJJRUdFMUNnMnpmYnl2bkgzTi9wdHArZmlOdWxld2ly?=
 =?utf-8?B?L1AvSnBIaE85VmxxYjVLZmJ6MTBKWXU5NzQrMTlUKzI1S05LOGN0d25DYjNF?=
 =?utf-8?B?VkIxQnFUQnBubUxBRTNBUVFTZVN5dm5DaVpzNkRJaHI5MUlOa2RBNlhLd01Z?=
 =?utf-8?B?eVQ4MFpkaTF1bEFRVUo2S2ZFZmJXVDhyN3Z6QzNaQjRZY1ZyY2hyZlU2Tlls?=
 =?utf-8?B?bnZJcm9GRUlwMkh2ZjlON3E1THZFTjF1d2FYQUZMU0lwZ1I0a0l3eVMxOW90?=
 =?utf-8?B?b1NFL2pOZlBMdW51QWtIYzNGNUtGeStRblZuOTFIbk16bytTeEN3ZmhCK1Yz?=
 =?utf-8?B?SksvOE5xVjFNaFB1TVcrMmRPbUJ6d3dZcXQ4VWd5Ti9XbWJaNW5QOFJQZ3I1?=
 =?utf-8?B?WktLVHVSWDYvak9DWjhxS0R3N3N4RGw3RDZ1S3hlYllhSkVXVWdaNnZEYUJL?=
 =?utf-8?B?aURQbHFEVjVsd2IrZ3F1UnIrTEZHT0tMUnFKMDRhUUEvT2VUSEJGVXpDeHEy?=
 =?utf-8?B?U1RyR1RPMjZnZDVXMkZ1NmdVUWo1YVQ3UzBDbDNHdEZ2Yzd4Zm9ReU5ZVjBm?=
 =?utf-8?B?UVZUbjdMSi9QcWFBaUxzWlJseTU4cUt0aGpvY3V3ZzB3WS9TT29KV3NTT2pj?=
 =?utf-8?B?MHNueUJLKzdmS2ZtWTNCMlM0QkhDaXJWRGtWQ1VjOS92TmkyZUVpSmhZWFJu?=
 =?utf-8?B?STFHOCtqQ3k5Rzd2bVo3K2syNmdKY2RSY011elA2bG1xMlFrMkNHd3dRTTdj?=
 =?utf-8?B?cjFQeXdzNFI0ZU9SVnZVVU52MS9VejUwZjRheER4eTF1MmVITitaUEkybFFS?=
 =?utf-8?B?K1huNklqM1pyUDQ4eGxkSkp4OUMxcnhXeVY0SVF2Ry83RGFGbDY2YllId0c5?=
 =?utf-8?B?TzE5K1F0UDBPbUxjUGFkbUIzK3VRcHkzb0hqTjdERnFheFdOeDlTWEliUWVt?=
 =?utf-8?B?VGVQbnpSa1FSVy92Zng5anJVbDdUT1dCNHBHc1J4YW44T0p0bC80bWM4QUhq?=
 =?utf-8?B?bjhTSHdvMVh2TE5EZkZPOGJDVEdEZlVxVUc0WDdlYnY3dzZOelNQZjBmai8v?=
 =?utf-8?B?SkwwZi9MZHRYYnFiVjJyMGJSQVJoL0JzM29iWGhqcGQzVkdJT0IzbkhHYzNB?=
 =?utf-8?B?ZW5aYk85bzNzSVZMTytraUJFa3RxTzhzcVM2ZnNudWxHbDY3Q1diRlNKd3V6?=
 =?utf-8?B?MmszZDRKRS9kZ0ZzN1JUSTVObDhYazYrVC85K3pvNnRJSkg2ZDFuOXJJblVp?=
 =?utf-8?B?TDZzbFc1MlloQUtMTEpBeUJ4Zy9VbjNLTjZRSzdqTW51eWpJUWVzWC9IUUcy?=
 =?utf-8?B?Wk85d0k5Ujc5a1hrTjJ1T0M2WXpyM0JBWURCUGkyUHFWM1l0WHc2ZW8rQnFU?=
 =?utf-8?B?NmhwczYyNjFUM0JDNkF5UklrUkJEUXh3azlxRWZPc2prekkzbnp1VDUxbkQ2?=
 =?utf-8?B?OFhnMS9jUTUwNVp4UXo3Y3VWM082U1ZYK3pzYzZ2S2ovaVE5OCs1T2ZXZXcy?=
 =?utf-8?B?clZpa3JqRWNIZ0dHVEJxMU1aUjEyeCtLdHRpZm8vbW5HUUQyUU9wdEZvdEda?=
 =?utf-8?B?dmZFbll3V1dTdmEvaGtpWnIyZ0RFM2ZOSm90SjlVM21wUUtLMGhhTmpucDNW?=
 =?utf-8?B?K1BDNWJ6YVRFODdYRDI1a2oxYnNhMVNKeVZtN3V0OXFhb1oxYldxOUFSc1FE?=
 =?utf-8?B?UG1UVGFjS1hVK2ZrazN3TS9DRHk4czlxVnBtejd3UWM5b0JBc0dEM1Y2dWND?=
 =?utf-8?B?NlVjb3VPM2Z1L2RJUEp2b1UvTFMxLzlzZUwxU2ZDeENWU0VXZ05sV3BQMklk?=
 =?utf-8?B?Umt4d2YzU0lBYllyT01IRTdFWmlPTytDU2VDSTVPVFloUnhjWDFkWUFGSXhH?=
 =?utf-8?B?dEdKSjdmdWpjZmdVTEpEVGtSYlVXYm5weFN4cFZINHIxdlpjTXA5RkdZa0w0?=
 =?utf-8?B?ck1lVmdnZTl3N2MxVDd2b1RFdWhiTlVRMU05cHdzYTdFblBnaWZTWWFIc2Jy?=
 =?utf-8?B?WFlFT29sN3NpWGEwQ01iOXIxOHJ0Q1dTVUhVdWdldXF0WGwwQ040aXZUUHdp?=
 =?utf-8?B?dDBueVhOcHc3VUwxTFIwMGZzREVwOFJ4eHBzLy9CTEdlR0lBWG5kTUVHT09O?=
 =?utf-8?Q?Y+OsuwWOQMvz+Z/H8mHx2U/sx?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7054.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f95f1f0c-4062-4417-b762-08dd03c91ee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2024 09:54:09.7861 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqdRZlnlonhNpIl5Yt86g6mJw7Uo/Xo0n4hu4R6/Ph6yaAMgBauAP/Pq0aSjqFnFOg8/ufKEG1BfwVYnwnnMUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7660
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3BlciwgTWF0dGhldyBEIDxt
YXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCAxMiBOb3ZlbWJlciAy
MDI0IDIyLjA5DQo+IFRvOiBLYWhvbGEsIE1pa2EgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4NCj4g
Q2M6IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgdmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2Ml0gZHJtL2k5MTUvZGlzcGxheTogUGNv
ZGUgc2V0cyB0aGUgQ0QgY2xvY2sgZnJlcXVlbmN5DQo+IHZvbHRhZ2UgbGV2ZWxzDQo+IA0KPiBP
biBUdWUsIE5vdiAxMiwgMjAyNCBhdCAwMzoyNDoxMVBNICswMjAwLCBNaWthIEthaG9sYSB3cm90
ZToNCj4gPiBPbiB4ZTNscGQgdGhlIENEIGNsb2NrIGZyZXF1ZW5jeSBpcyBzZXQgYnkgdGhlIGRy
aXZlciB3aXRob3V0IHNldHRpbmcNCj4gPiB2b2x0YWdlIGxldmVscy4gUHJldmlvdXNseSwgd2Ug
aGFkIDQgbGV2ZWxzIG9mIHZvbHRhZ2VzIHRvIGNob29zZQ0KPiA+IGZyb20uIEhvd2V2ZXIsIGhh
dmluZyBvbmx5IDQgbGV2ZWxzIGlzIHJhdGhlciBjb2Fyc2UgYW5kIHdlIG1heSBlbmQgdXANCj4g
PiBjb25zdW1pbmcgbW9yZSBwb3dlciB0aGFuIG5lY2Vzc2FyeS4gVGhlcmVmb3JlLCB0aGVzZSBh
cmUgbm93IHJlbW92ZWQNCj4gPiBhbmQgY2hvb3NpbmcgdGhlIGNvcnJlY3Qgdm9sdGFnZSBsZXZl
bCBpcyBub3cgaGFuZGVkIG92ZXIgdG8gUGNvZGUNCj4gPiBmaXJtd2FyZSB3aGljaCBpcyBhYmxl
IHRvIHNldCB2b2x0YWdlIGxldmVsIHdpdGggaGlnaGVyIGdyYW51bGFyaXR5Lg0KPiA+DQo+ID4g
djI6IExlYXZlIHZvbHRhZ2UgbGV2ZWwgY2FsY3VsY2F0aW9ucyB1bnRvdWNoZWQgYXMgaXQgcmV0
dXJucw0KPiA+ICAgICBhbHdheXMgMC4gRHJvcCBvbmx5IHZvbHRhZ2UgbGV2ZWwgbm9maWNhdGlv
biB0byBwY29kZSAoVmlsbGUpDQo+IA0KPiBDYW4ndCB3ZSBqdXN0IGRyb3AgdGhpcyBwYXRjaCBj
b21wbGV0ZWx5PyAgU2luY2Ugd2UgYWx3YXlzIGxlYXZlIHRoZSB2b2x0YWdlIGxldmVsDQo+IGFz
ICIwIiBvbiBYZTMgYW5kIGJleW9uZCwgdGhlIGV4aXN0aW5nIG1hY3JvIGRvZXMgZXhhY3RseSB0
aGUgc2FtZSB0aGluZyBhcyB0aGUNCj4gbmV3IG9uZSB5b3UncmUgYWRkaW5nIGhlcmUgKE9SJ2lu
ZyBpbiBhbiBleHRyYSAwIGhhcyBubyBlZmZlY3Qgb24gdGhlIHJlc3VsdGluZw0KPiB2YWx1ZSku
DQpXZSBjYW4gZHJvcCB0aGlzIHBhdGNoLiBBcyBwZXIgY2hhdCB3aXRoIFZpbGxlIHRoaXMgdm9s
dGFnZSBsZXZlbCB3YXMgdGhlIG9ubHkgdGhpbmcgdGhhdCB3ZSBjb3VsZCBkcm9wIGZyb20gcGNv
ZGUgbm90aWZpY2F0aW9uLiBXZSBzdGlsbCBoYXZlIGNkIGNsb2NrIGNhbGN1bGF0aW9uIGxvZ2lj
IGluIHBsYWNlIGV2ZW4gdGhvdWdoIHdlIHdvdWxkbid0IG5lZWQgdG8gZG8gdGhhdC4gVG8gbWUg
dGhpcyBsb29rcyBsaWtlIGEgZGVhZCBjb2RlIHNpbmNlIHZvbHRhZ2UgbGV2ZWwgaXMgbm90IHVz
ZWQgYnkgdGhlIHBjb2RlIGZpcm13YXJlLiBIb3dldmVyLCBkcm9wcGluZyBldmVuIHZvbHRhZ2Ug
bGV2ZWwgY2FsY3VsYXRpb25zIHdvdWxkIHlpZWxkIGlmLWVsc2UgY2hlY2tzIGFsbCBvdmVyIHRo
ZSBkcml2ZXIgd2hpY2ggaXMgbm90IGdvb2QgZWl0aGVyLg0KDQpBbGwgaW4gYWxsLCBsZXQncyBk
cm9wIHRoaXMgcGF0Y2ggZm9yIHNpbXBsaWNpdHkuDQoNClRoYW5rcyENCg0KLU1pa2EtDQoNCj4g
DQo+IA0KPiBNYXR0DQo+IA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1p
a2Eua2Fob2xhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9jZGNsay5jIHwgNSArKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pOTE1X3JlZy5oICAgICAgICAgICAgfCAzICsrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfY2RjbGsuYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jZGNsay5jDQo+ID4gaW5kZXggNWE0YzhjMjQxMGFlLi4z
MjUxMDBjZDMxMzAgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxh
eS9pbnRlbF9jZGNsay5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9jZGNsay5jDQo+ID4gQEAgLTI0OTcsNyArMjQ5NywxMCBAQCBzdGF0aWMgdm9pZCBpbnRl
bF9wY29kZV9ub3RpZnkoc3RydWN0IGludGVsX2Rpc3BsYXkNCj4gKmRpc3BsYXksDQo+ID4gIAlp
ZiAoIUlTX0RHMihpOTE1KSkNCj4gPiAgCQlyZXR1cm47DQo+ID4NCj4gPiAtCXVwZGF0ZV9tYXNr
ID0gRElTUExBWV9UT19QQ09ERV9VUERBVEVfTUFTSyhjZGNsaywNCj4gYWN0aXZlX3BpcGVfY291
bnQsIHZvbHRhZ2VfbGV2ZWwpOw0KPiA+ICsJaWYgKERJU1BMQVlfVkVSKGRpc3BsYXkpID09IDMw
KQ0KPiA+ICsJCXVwZGF0ZV9tYXNrID0gRElTUExBWTMwX1RPX1BDT0RFX1VQREFURV9NQVNLKGNk
Y2xrLA0KPiBhY3RpdmVfcGlwZV9jb3VudCk7DQo+ID4gKwllbHNlDQo+ID4gKwkJdXBkYXRlX21h
c2sgPSBESVNQTEFZX1RPX1BDT0RFX1VQREFURV9NQVNLKGNkY2xrLA0KPiA+ICthY3RpdmVfcGlw
ZV9jb3VudCwgdm9sdGFnZV9sZXZlbCk7DQo+ID4NCj4gPiAgCWlmIChjZGNsa191cGRhdGVfdmFs
aWQpDQo+ID4gIAkJdXBkYXRlX21hc2sgfD0gRElTUExBWV9UT19QQ09ERV9DRENMS19WQUxJRDsg
ZGlmZiAtLWdpdA0KPiA+IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaCBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfcmVnLmgNCj4gPiBpbmRleCAyNjFmMzg4YjQ5YzcuLjhlNGFh
NTU4NGFkYiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3JlZy5o
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9yZWcuaA0KPiA+IEBAIC0zNTM5
LDYgKzM1MzksOSBAQA0KPiA+ICAJCSgoRElTUExBWV9UT19QQ09ERV9DRENMSyhjZGNsaykpIHwg
XA0KPiA+ICAJCShESVNQTEFZX1RPX1BDT0RFX1BJUEVfQ09VTlQobnVtX3BpcGVzKSkgfCBcDQo+
ID4gIAkJKERJU1BMQVlfVE9fUENPREVfVk9MVEFHRSh2b2x0YWdlX2xldmVsKSkpDQo+ID4gKyNk
ZWZpbmUgICBESVNQTEFZMzBfVE9fUENPREVfVVBEQVRFX01BU0soY2RjbGssIG51bV9waXBlcykg
XA0KPiA+ICsJCSgoRElTUExBWV9UT19QQ09ERV9DRENMSyhjZGNsaykpIHwgXA0KPiA+ICsJCShE
SVNQTEFZX1RPX1BDT0RFX1BJUEVfQ09VTlQobnVtX3BpcGVzKSkpDQo+ID4gICNkZWZpbmUgICBJ
Q0xfUENPREVfU0FHVl9ERV9NRU1fU1NfQ09ORklHCTB4ZQ0KPiA+ICAjZGVmaW5lICAgICBJQ0xf
UENPREVfUkVQX1FHVl9NQVNLCQlSRUdfR0VOTUFTSygxLCAwKQ0KPiA+ICAjZGVmaW5lICAgICBJ
Q0xfUENPREVfUkVQX1FHVl9TQUZFDQo+IAlSRUdfRklFTERfUFJFUChJQ0xfUENPREVfUkVQX1FH
Vl9NQVNLLCAwKQ0KPiA+IC0tDQo+ID4gMi40My4wDQo+ID4NCj4gDQo+IC0tDQo+IE1hdHQgUm9w
ZXINCj4gR3JhcGhpY3MgU29mdHdhcmUgRW5naW5lZXINCj4gTGludXggR1BVIFBsYXRmb3JtIEVu
YWJsZW1lbnQNCj4gSW50ZWwgQ29ycG9yYXRpb24NCg==
