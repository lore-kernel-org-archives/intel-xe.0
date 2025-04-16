Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E78C369C5
	for <intel-xe@archiver.kernel.org>; Wed, 16 Apr 2025 19:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB3910E068;
	Wed, 16 Apr 2025 19:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BIArnTkW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853CA10E068
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Apr 2025 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744831429; x=1776367429;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=s0FTk5q3mR3UYbrD7Cw25OiorzBaX+uP3k6iJrwmQFE=;
 b=BIArnTkWunaB43hCo42RdKX89EXTxrN9oFJYGFXqkiHn+Gcy4nKh7NIc
 v55/wSzi6pk/wlGfYMFHpRPVuFEv348esOIKbqaA3sWvTnryTpbsJ5Ajd
 /D6GFPKYThan+tYgBRm5jKxoZ8+kgAxAwQHRv9zrSaJgCV3M8UUfoY9PZ
 k5psNl5YAwHVN9EjamLV0kAhEhPxxy6njagrQEjVMKHCO7iDfAX2LgoZx
 IOiTRsigNXeAinCwhrcYptI1JtZN2x3/i6uYSIs/+DAc2rO8Mvk/pFD+n
 Ymri1OynMn8xtQqit3JYZGgeqF4UNotQsVG8MukwNUcamzg5J7mhjt4LH A==;
X-CSE-ConnectionGUID: daDOwCqIRwauOWpKXLrLRg==
X-CSE-MsgGUID: 8BMDaCAYTlmjNrpNzXZEUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46411016"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="46411016"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:23:48 -0700
X-CSE-ConnectionGUID: BaGvd5NZT/mS7rmrdRjI/w==
X-CSE-MsgGUID: ljzblz/dTDW7o2Yi+eiQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="130335542"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:23:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:23:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:23:47 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:23:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eYvuytUMTERgFKJYJXRhuJw5L0S7to+r494cBhKYcFqwGafdTcrjotJk1ebDSh27Cwbii93oy6gBeEdWoTo0TRsY2GXYtvrCVpZGPTqyk4IyHAtqjA6ar6VR5jgWi1GjjQxVU+FqMv9rJXIzbqkw2aCcCLoJ3CK3aGQ4Bav39Ehqdv+TSRQhCnh6UpZ9k3y2IolonybR1FV6A882dVETmQCrM6JObHuMMlooU67tDGTfHo6WcfsLsgiTrb//51CqewPeE0kb9nr5J+PZcsa5Zl8MhGwAfAIOo4B4O4TDEt8kUDNV6mnrKLPq9gVm+yfG1RhnVyj3ziYAJwojgHfVew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s0FTk5q3mR3UYbrD7Cw25OiorzBaX+uP3k6iJrwmQFE=;
 b=wlqMSAI40WV8rqX6VsjPsGvsWmewMlHEqmsLj/slpJS6tai8ww4AN0yS1pQ9LSJf9OFLjh6l3eR7A5SmlAcySqgBiJFxK9K+BMUHAa+Y9D5e8kLWvR0idOPeTWSS3gchaSEkbB/KDesFxL8tyJr1FPCnExRI9ghhNNWci8DV4mQfHtOsiA0yFzf/XFOQRm5DzwhgVMIssLEkuG/f2AhmeQDwLO318+gilcEv9cJtF/isOMQmnG2w3lVFSTpuusxHmGjTyOhYF3sDVBg+r6juEpRGcwdHLgcI8Y6d2CJEvElCa6nmHy2JUmaCnUrlmBbmr6Og7vdfungUjDybuEmvBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM3PPF2DEFDE2DF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 19:23:17 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%6]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 19:23:17 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "nirmoy.das@linux.intel.com"
 <nirmoy.das@linux.intel.com>, "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: Re: [PATCH 1/2] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Thread-Topic: [PATCH 1/2] drm/xe:
 s/tlb_invalidation.lock/tlb_invalidation.fence_lock
Thread-Index: AQHbrv2wbEObQH68LU6fX8GhJ5HScbOmrAYA
Date: Wed, 16 Apr 2025 19:23:17 +0000
Message-ID: <8a326233ac40dcaa1e63428ed4e88d5b94d55845.camel@intel.com>
References: <20250416183032.70948-1-stuart.summers@intel.com>
In-Reply-To: <20250416183032.70948-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM3PPF2DEFDE2DF:EE_
x-ms-office365-filtering-correlation-id: 60334fca-26bc-4048-cce3-08dd7d1c240a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UzEzdThwRFZCWDNTQXJMOW5kSmdLQm40b1BPNVNuaFBEbjVSUE1nRndLR2Zk?=
 =?utf-8?B?c3FPRlBWK2daSHJuMGszTkVTdjNzU0NVNW5JU3oxUXYrNzRSR2EyWlFBdm10?=
 =?utf-8?B?SGtUWU5BWU9pQnRIaXZWRTVrbUJFbjJhbE9sYjA4VHVLMDk2Z0crY3JRUnlK?=
 =?utf-8?B?cUJSN0dkSkY5ZFBzSkVEK2k1VDlEOStkUzBWT0NtczN6cXlyYk8xb0JyNEk2?=
 =?utf-8?B?K0dJN1pBODMzT2FoOG5ZL2cxeWZqV3l0NEdWSGNMbTM3dW5vaVJFNlpIRTE5?=
 =?utf-8?B?MHJldlJ2RzkxYzUreU1vUmJrbGJmZFRYZVdMTFhlck41Y0ZCOWZJMHlHVXY0?=
 =?utf-8?B?S2s0OVBNQUQ0dUNGNEIzQmNNT2YxV0NtTDUwOThNenlId0JVNW5NZjJiQm5o?=
 =?utf-8?B?RmE2Y2RkQ3ZQMTRHRDJFSURjUlJ4WU96Mlc4bGtJZEZMUG8wMGM4NGR3a2hC?=
 =?utf-8?B?TDZseGpCSFM4VSs3Q3c1akY4TjZGMnhicEZaMVhFM3hLTnBTN2U2MUI2MTJI?=
 =?utf-8?B?bDNBQlcrOUlzMTFScWQ0SXhsUElSem9nZlUwYWt1bWU5WDJrU3ltbDZkZkx6?=
 =?utf-8?B?eTkvajhrSFVvYTE1WDNXeitwcW1OTy9qOFk0SnI0N01LWTdNOFNBY3ppY2dn?=
 =?utf-8?B?TVFOSE1rajRBVFRqdjE0OXJXMi9yMWp6ZXpRYVBJMFRZNzhhenhTcWIyV1Jw?=
 =?utf-8?B?MGlvZFR3ejEwWmxOaDBLTk5MN1hvZDhvRFFzUU1FYkFtMUwwbkV2U0dtUFFF?=
 =?utf-8?B?TVFJVEJKRGFDNVVTNmZ6Q29GYmViZ3M0TzVGS1lKZ3ArRjZhSlpqcUZLZW5v?=
 =?utf-8?B?ODJuTjlxKzJ1a0VUeUFhQjBUSHFJak8yWGxVVDljL3E2RVRQdVJYcDZONG9V?=
 =?utf-8?B?N21RTjRpUkJOamJRRXZmU2RoZXRkOHNNSWVCVlRSTlpJUWh6YVBPTXgzZGlY?=
 =?utf-8?B?N3o0RStKL3Z2SnFDRUdSNUxBVnp5ZDBqZEdtcm5TV2ZHMVRvak10UTBhSUVU?=
 =?utf-8?B?Z21oY3ZCd2lOTDZNSGZsMzNZOXc1cjBac20xZDhicDdlU0haM0c1Qnl3MjR5?=
 =?utf-8?B?Tk92RE0zMlBpNmNlTnNWMlBMVnVlM2srcyszdmoxcEVxZitFQnBGdEY0aHBS?=
 =?utf-8?B?Wml3ZWdtTDJmWjJhVHk2WGwwWFp5NU45UG1wYnhPSUlvdXdxb1RxeUtmMDZ0?=
 =?utf-8?B?cWZ6d2h4WGtBYW5ZT2hMM1pQdEJUQjRuNCtEZDdUb2s0Tlkvc0lPOXYvQU9W?=
 =?utf-8?B?VXhLZ1c0MGEwL0VheFc2ZGltbkh2YUZ1YXorY2VyUW40UTFpcnp5M01idWdl?=
 =?utf-8?B?dFN4QkRhZk03WXZ3UENVRFo2dS9tWC9WM2VrOVA1aExJaXhyRlpyblQ3dXZv?=
 =?utf-8?B?eTMvQVQvMDVGY1o0TXN2bkxxYzNkalJMaW9kMHFYQXEzR2w1SkF5bGlJS21T?=
 =?utf-8?B?ZE9POXhtRlRVTDFGRDlaRVpvNDZmSEpmV1A0ZURqTXRNRG1Vd1l4YTdEWlQ1?=
 =?utf-8?B?SWRzeGFSbmJtbG40ZFhxNjkxRWttbmJGc3F6ZnBvQ0pvVXNGNk1jbTd4bmNW?=
 =?utf-8?B?alpYaUlLd2xMREExSFJHSVFuV2M0TURMamlxcXRvUjVqaCt0UCtqQzUxT1N0?=
 =?utf-8?B?VDRnR2JuaW9UMS9XakVWVXU2V0tBWC81UTBRMjZDNkdiQVh4bFZoNEpQZFZY?=
 =?utf-8?B?VHJoWGNpcTJXK2U4WUlseDBSSlFUMk1iYnNTTjdPbnZ2SG9MK2J0NGdoQW81?=
 =?utf-8?B?S2VyVU0xQ2Joc3MyZStKVDFIcVJ6R1lMVHBzcWlJMFdYZ0srMW5EazN4QnpR?=
 =?utf-8?B?bklqZ29COVIrSGxMNkdlVGJ3d3dzM2dkV1cxQTR5cnEwVDFuNTk4L0ExaWdG?=
 =?utf-8?B?OGM4S3JLQU5idWlwVXRKRWFGVXpmRkd6VzBiZ05TbkFENm5tUEM4Q3Y1SSs2?=
 =?utf-8?B?L28wNVd6NXNqb0NtMFhUNldEQTQzMkNFaC8wb0xkSkRaMVBuMnlkSGRvTExL?=
 =?utf-8?Q?wh0hWJbj4/gmiN9JNuxZFvalTOVZXw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHNkVEgzdFRxVmdGS3V1UDFza3c2TUhRektmN1RnNjRZNk5BdlVncDYwN0k4?=
 =?utf-8?B?NUVXUUJualViQ2syWXhRLzBhckg4ZU9FN2pPQjVjTmM2Yko1eklwV1hFZ1R5?=
 =?utf-8?B?STRzWnBTZjlaWGs3MGhBT2hOZ20vVkJsV0x3Qi8yUVF0NEtsTGdDOWVCVGVS?=
 =?utf-8?B?YVZScndQdXlhQkNTT3pOcnRjdXljSGptd3RsQjIwSTVyaVlMTlBOMzZXT2dO?=
 =?utf-8?B?amtxWjJrZng2NW9McDU2T3dQQ2NiZ0x3bkIwbkovcXpmRVVwbjZCZWNSdm5W?=
 =?utf-8?B?OHg0Z3QwWkFJY3AycGNrMllCQ2lSOWtNeDdpY3pNSmdsTkpJcFFuQ3MxMTZG?=
 =?utf-8?B?TkdNT0tOdmd5ZDhjNmtYS1NZOHFRU3lkUjVWU1RLcWhFdXJ2eTJWVVdUcHVo?=
 =?utf-8?B?bmlhNzlIYkVMQjdoQzlRZ0tDaGVOYUNYeXFrMXczbWpUblE1bUlnZitSaXhI?=
 =?utf-8?B?bWU0VVlBZURoWlJHOTI2empoUnNYcms5UEpaVVdPeS9qMmZFS2l0QVZseWRZ?=
 =?utf-8?B?L0tqTVBKbUk5TWNZRFNZUXRmc1ZzeU9RMWhnd2dPWTNPVEM4L2tkcFdsTjJy?=
 =?utf-8?B?elpNNzV2ZmdmMkNsd1lPakY4SUFpT2k2QVhxd2kzMHk3dVFEdUdqa2d1SFNI?=
 =?utf-8?B?bHo1a21lS0QxNXZZVENDMmJHQldOUFczd251SUpEYWQybkNPYkhGbUNrNmdw?=
 =?utf-8?B?bG5ZdERzQ1ZVbTFMTUlsbkpiZG5PRThaR1lwcVdTWVFHK3ZPQ2VoUzBJNFJJ?=
 =?utf-8?B?MkFPbncvV2Vzd3BMbWtwZ0dHWjhPczVPWnYvTWdvTUZ3M1FZTmozTncvWUpS?=
 =?utf-8?B?SVY0TFI3dnRlbXJhQW1DczcyaGdERU0zRkFXUWFXOHQ3c2l5Z1RtSDNYRGZF?=
 =?utf-8?B?azB4b2gzcU1nZVNMckJtMEpQb2t6aW5oL0RDVlgvbDNGSm5USTlqaVRYZlVr?=
 =?utf-8?B?T0c3aUtVV0FkMnFsZk9CUkFsSzJMZ1dkNUwyd3ZFc2xWQ211bGRCMDE3MnZt?=
 =?utf-8?B?WEZhSk9MWko4Q3o2aWt4RHJxWkJaeG5SelhhbFFsM1Y1Z2kwTDZFTkhZT3BH?=
 =?utf-8?B?OTlSakJ2U01qdEFCWnFxcm9xTisreGRxSFJJTE42c2JzTTB3YUFZV2NrTS9x?=
 =?utf-8?B?TTlacmQvTndGWUx1aEhCak16VXBUaXVHREhrTFdVeldqZ20zcEVwVW5ReWcy?=
 =?utf-8?B?YXZNMGJoc0xvMGJqZ1c1Zy93SHFCbklVSWRrRU51Z0YxTG9yUndJc3dYM29y?=
 =?utf-8?B?UjZiRUQxSlMyUk1mVi9vc3Q0T09Nd2owNDdLb0FPOTFwdk5TTDdrOWF3YVRW?=
 =?utf-8?B?ZWNvSXdsemp0eXIrenFRdHp5QU1LNFZBSTRHKzBhTDBGMStWSVZqVUM2V0Jj?=
 =?utf-8?B?Tkc3WEwwRjVaNjJveWQ0OHVBODNQcnNJK09DYllKdzd3UER0SkZrNU1PMWZN?=
 =?utf-8?B?NmRxb0JSM0NWWFl1eWNLYnNpR3U4c2pVdTJXOUdMZ1ZRQXp5azhCcTFmN1ZU?=
 =?utf-8?B?c2d1ZG5SYjBFc3dqQUw3U1dPdnJKK1h4OGQ2YjEzeHRIVk5taUlNKzN5Nm9I?=
 =?utf-8?B?Z2xGUVJrbVR6Y2wrYzYxVUZRdzI5UEdqUStyNUp0UHhZbXJmN2VNSklIdDNE?=
 =?utf-8?B?ZGxvdFRLbS9ZWGgydU9qK0pySFFPWWt1RDhkYnU5REFIUGU1OTEvclNnbTV2?=
 =?utf-8?B?enI1WGJkN1Z2aS9lZXZWSG1jdnEwY0I5anQzMXZNQTdvQUhoUHpIOFE0TUhP?=
 =?utf-8?B?aDd0eW9IWXdOUlBzV1RlTVZaNW9oRFhNYVZvdU5WelMrZWkvbDAzd1g0UXdi?=
 =?utf-8?B?bUZUK0MyeE50dGU3NTNDNXBkNEF6b0tVUDh4bWZsUnozOWxNUktkTXB2S3Az?=
 =?utf-8?B?ZDdwRXhYREZXRlIrcXlxYlBVemQ4ZWRQVEN4QTVHMFZQUnQ1R1ZocVhNcVBo?=
 =?utf-8?B?eGZTenBuUEJwTEhBSHNmY2R2RTRBa0ZzQXBQYXN2elN5NTFXTnJINVJPQzBC?=
 =?utf-8?B?S3Robk43YXFkdXRCUzlFR0hlRFdaeGRHS0ovd2J5dXJwMkpoYzZORnVFZEVa?=
 =?utf-8?B?OFJ5MHlwdjVnbWl1ZG5Xa0ZwbTZ3SmVaaElMWFhQT1BWUU9DY3VVWURhU2Q1?=
 =?utf-8?B?cUg3NzNnSUFtdGVFZ21PUVBQQm5FeExDRXZpcVFYaGprQXZzQUtzdjdlWElS?=
 =?utf-8?B?OGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43185575789F3B4DB96D838035781EE7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60334fca-26bc-4048-cce3-08dd7d1c240a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 19:23:17.3358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UCmW0HUKzBHe8mPJguvzYFWmxwY2LbcRMveeUttS5q58eMuT5TNw+EIY4LgJ1hLzVjNj5ngCRSjDZdPP3LwIkyZx0klFK6bVKyxeNn74E88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2DEFDE2DF
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

T24gV2VkLCAyMDI1LTA0LTE2IGF0IDE4OjMwICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToK
PiBGcm9tOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiAKPiB0bGJf
aW52YWxpZGF0aW9uLmxvY2sgaXMgdGhlIGxvY2sgZm9yIEdUIFRMQiBpbnZhbGlkYXRpb24gZmVu
Y2VzLAo+IG5hbWUKPiB0aGlzIGFjY3VyYXRlbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWF0dGhl
dyBCcm9zdCA8bWF0dGhldy5icm9zdEBpbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmlybW95
IERhcyA8bmlybW95LmRhc0BpbnRlbC5jb20+CgpUaGlzIG9uZSBtYWtlcyBzZW5zZSB0byBtZSBh
bmQgSSdtIGhhcHB5IHRvIGFkZCBteToKUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVh
cnQuc3VtbWVyc0BpbnRlbC5jb20+CgpCdXQgZ2l2ZW4gSSBwb3N0ZWQsIG1heWJlIGdvb2QgdG8g
aGF2ZSBvbmUgbW9yZSBvbiBoZXJlPwoKVGhhbmtzLApTdHVhcnQKCj4gLS0tCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jIHwgOCArKysrLS0tLQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCAr
Ky0tCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRp
b24uYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbGlkYXRpb24uYwo+IGlu
ZGV4IDA4NGNiZGViYThlYS4uMDMxYzRkNDNmMzZiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF90bGJfaW52YWxpZGF0aW9uLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3RfdGxiX2ludmFsaWRhdGlvbi5jCj4gQEAgLTExOSw3ICsxMTksNyBAQCBpbnQgeGVf
Z3RfdGxiX2ludmFsaWRhdGlvbl9pbml0X2Vhcmx5KHN0cnVjdAo+IHhlX2d0ICpndCkKPiDCoMKg
wqDCoMKgwqDCoMKgZ3QtPnRsYl9pbnZhbGlkYXRpb24uc2Vxbm8gPSAxOwo+IMKgwqDCoMKgwqDC
oMKgwqBJTklUX0xJU1RfSEVBRCgmZ3QtPnRsYl9pbnZhbGlkYXRpb24ucGVuZGluZ19mZW5jZXMp
Owo+IMKgwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmZ3QtPnRsYl9pbnZhbGlkYXRpb24u
cGVuZGluZ19sb2NrKTsKPiAtwqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaW5pdCgmZ3QtPnRsYl9p
bnZhbGlkYXRpb24ubG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgc3Bpbl9sb2NrX2luaXQoJmd0LT50
bGJfaW52YWxpZGF0aW9uLmZlbmNlX2xvY2spOwo+IMKgwqDCoMKgwqDCoMKgwqBJTklUX0RFTEFZ
RURfV09SSygmZ3QtPnRsYl9pbnZhbGlkYXRpb24uZmVuY2VfdGRyLAo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlX2d0X3RsYl9mZW5jZV90aW1l
b3V0KTsKPiDCoAo+IEBAIC01NjQsMTEgKzU2NCwxMSBAQCB2b2lkIHhlX2d0X3RsYl9pbnZhbGlk
YXRpb25fZmVuY2VfaW5pdChzdHJ1Y3QKPiB4ZV9ndCAqZ3QsCj4gwqB7Cj4gwqDCoMKgwqDCoMKg
wqDCoHhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKGd0X3RvX3hlKGd0KSk7Cj4gwqAKPiAtwqDC
oMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxKCZndC0+dGxiX2ludmFsaWRhdGlvbi5sb2NrKTsKPiAr
wqDCoMKgwqDCoMKgwqBzcGluX2xvY2tfaXJxKCZndC0+dGxiX2ludmFsaWRhdGlvbi5mZW5jZV9s
b2NrKTsKPiDCoMKgwqDCoMKgwqDCoMKgZG1hX2ZlbmNlX2luaXQoJmZlbmNlLT5iYXNlLCAmaW52
YWxpZGF0aW9uX2ZlbmNlX29wcywKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICZndC0+dGxiX2ludmFsaWRhdGlvbi5sb2NrLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmd0LT50bGJfaW52YWxpZGF0aW9uLmZlbmNlX2xv
Y2ssCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2Zl
bmNlX2NvbnRleHRfYWxsb2MoMSksIDEpOwo+IC3CoMKgwqDCoMKgwqDCoHNwaW5fdW5sb2NrX2ly
cSgmZ3QtPnRsYl9pbnZhbGlkYXRpb24ubG9jayk7Cj4gK8KgwqDCoMKgwqDCoMKgc3Bpbl91bmxv
Y2tfaXJxKCZndC0+dGxiX2ludmFsaWRhdGlvbi5mZW5jZV9sb2NrKTsKPiDCoMKgwqDCoMKgwqDC
oMKgSU5JVF9MSVNUX0hFQUQoJmZlbmNlLT5saW5rKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHN0
YWNrKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc2V0X2JpdChGRU5DRV9TVEFD
S19CSVQsICZmZW5jZS0+YmFzZS5mbGFncyk7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndF90eXBlcy5oCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfdHlwZXMuaAo+
IGluZGV4IDdkZWYwOTU5ZGEzNS4uYmU4MTY4N2NiZTJiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndF90eXBlcy5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0
X3R5cGVzLmgKPiBAQCAtMjEwLDggKzIxMCw4IEBAIHN0cnVjdCB4ZV9ndCB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB4ZV9ndF90bGJfZmVuY2VfdGltZW91dCBhZnRlciB0
aGUgdGltZXV0IGludGVydmFsCj4gaXMgb3Zlci4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRlbGF5
ZWRfd29yayBmZW5jZV90ZHI7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBA
dGxiX2ludmFsaWRhdGlvbi5sb2NrOiBwcm90ZWN0cyBUTEIgaW52YWxpZGF0aW9uCj4gZmVuY2Vz
ICovCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHNwaW5sb2NrX3QgbG9jazsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqIEB0bGJfaW52YWxpZGF0aW9uLmZlbmNl
X2xvY2s6IHByb3RlY3RzIFRMQgo+IGludmFsaWRhdGlvbiBmZW5jZXMgKi8KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgc3BpbmxvY2tfdCBmZW5jZV9sb2NrOwo+IMKgwqDCoMKgwqDC
oMKgwqB9IHRsYl9pbnZhbGlkYXRpb247Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgLyoqCgo=
