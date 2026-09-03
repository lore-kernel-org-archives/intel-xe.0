Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA904C61DD3
	for <intel-xe@archiver.kernel.org>; Thu,  3 Sep 2026 16:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B71910F648;
	Thu,  3 Sep 2026 16:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YM2ENX5v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F2A10F648
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Sep 2026 16:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788453262; x=1819989262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=UL1yWMrthzhhwZo6svQRvlqTdGJE2CPK4SdZIqlePNE=;
 b=YM2ENX5vTf6c1MSwNmc1rDAGRqftY++tOvaiodS1pyx/9NkUNyWbCZs0
 7FDLcGUFMgOcmedvR8V2KXb8lSyZCD1xX/8fbx+2L2HmtpQyEr3cMTBZF
 vj/jin/cWCrKfKsovvUZMORIjH8+4nh8jpiR7QnQOn9V9IdiRe1lcWYc6
 NJcknNpYI75bj7R4+KSv11GtP0PMgcHwCnm2+SfmW91Ui4VobLHlLB56y
 0Mt/xJLaQLz9ccW9PHic9HWJtopJf39iYxeCYyO1+HMbVCgF15GxW0KBX
 jvlqprH/YFG21pKsYPKxLZQV8+p+J1mKPSfCuCqT6uZ2atIbLKQ0eKzjV w==;
X-CSE-ConnectionGUID: bye19PxESUqXUD5fSgz76g==
X-CSE-MsgGUID: lv8ElufCQWGZWOEl9dAt/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100301830"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100301830"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:34:21 -0700
X-CSE-ConnectionGUID: 9CNo+qaCS7uQ36Wwl6rQdA==
X-CSE-MsgGUID: 7Eux9KYUSi+f5oGfrzoWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="263593654"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 09:34:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:34:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 09:34:21 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 09:34:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJuGnJvsfmB6wMYJI5BioGUdZnQ3v9ObkEp/0FwW+1x9XUmbQp4uk3kk/b2lk5KnObRswXs+KOPijdJ5AIVOGs9EeeaSOT1HPGOxlweB4+96Y92BdcAZIxC0AbnV4RtXUUsajWGdJlE0Pirzqm7ynQ3ZdJGEvZUXeQ28zuQpAtCCXafQ06TIivH/wmyqYIrO5VUS09623vnV4blOmNWBZG/GEPDWIe9Hjqqa1AqdvxJ4VrKJV0c+DEypx7Te0zsIpL70foqUix4v2u4y4XRCf0GkinzKe7Y/NywyxXB3QKx1rbILS69Jjy9IuX9z50FmZTJxFhHi77FygtvlPzNpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL1yWMrthzhhwZo6svQRvlqTdGJE2CPK4SdZIqlePNE=;
 b=IfAPJVbiCQoAJoREHs3i0nrbRSF6G/1TVevnrdMw38RjcrlqYhTLD5kV98fXX/kunMo0T8B6MAS26ZlvMULmZ4ahAxBZoP6DploCBtw3nAU8P0REqm7NEPvpXpfr/L0ULK0qOWmZnK4OMZTuQzXGq/eMi8y2HAn/bfVmjgGBL+DYminFw1HhkLu64xQHFAr9yKGbHn8LFKM+oQ+ESApLJrIduBjvB35Irbib/TgkFx+qiutAzCJvCYUJ0hLHBcTCOyIPdlY6LDVSLA9zvUTeRk0yr/2AZbyqe+K1AsAfJop35Jz1qIP29Gk8W7MfYAoKM5IPzZCh1prkxGfJAyIMZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LVWPR11MB9883.namprd11.prod.outlook.com (2603:10b6:408:3c0::11)
 by SA1PR11MB8375.namprd11.prod.outlook.com (2603:10b6:806:38b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:34:14 +0000
Received: from LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e]) by LVWPR11MB9883.namprd11.prod.outlook.com
 ([fe80::310:e83f:69b8:e11e%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:34:14 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro, 
 Riana" <riana.tauro@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
Subject: Re: [PATCH 2/2] drm/xe/xe_guc: Skip GuC reset post SBR
Thread-Topic: [PATCH 2/2] drm/xe/xe_guc: Skip GuC reset post SBR
Thread-Index: AQHdNuDYeZFgyvQ/VkC0gGBAkftFCba9FlgA
Date: Thu, 3 Sep 2026 16:34:14 +0000
Message-ID: <8d12c3ceeb451c09a082bf803dfbbf4ebb77778e.camel@intel.com>
References: <20260828113104.319843-4-riana.tauro@intel.com>
 <20260828113104.319843-6-riana.tauro@intel.com>
In-Reply-To: <20260828113104.319843-6-riana.tauro@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LVWPR11MB9883:EE_|SA1PR11MB8375:EE_
x-ms-office365-filtering-correlation-id: 768d649e-6221-4639-fbf2-08df09d930e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|38070700021|4143699003|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: yb/WI/ErSLyBkpYI/atUgpjDUUJtOTD3zgXuoOCEjoiHKBrOh9dE7drD4uU3THCkcMaS71bN7giYF95tJQ5hDmU8wzS3By9MxYs32cHDuBRLP5jn3ouXT+IBgxjGrn+h5oO2CCqZ6d5JkK05szsrNRkrn0Fkf0n+kKQYI9MANVSi4qtONdpqf9swxuOZLxzwcbIpBWgZb9LB+o49corQ3QpbNzt/d2dVhUFBhtf4+JczXldaTDm0pb+E9MjXghQq2ca+ir6fs8zoXh5vs6FRHWdU+UvrWN6yLvjbVYVUFAX0YxjCeChWyGkAVxnqqP8XYeVdEgh6I65M3svQALFeTQ6msld4fb5D1rvf/yEm9PVxFB7mn1Jx98z16cIl3Q/RuLfcvnT6/2AsLlR8D7lmlUMLOV4s52iHpxElXwki4bYd6XFSXLDTn1qr/baFw8su3+HlWIWbzArLq867WohEulc6OSom+djnOym6Rx2nhjV28inhOf9eVxjOpPBgkw3eY0lB1VszaCU7zcKSjVUx7MyTDdqWHDfSujfQNoLh7+bLTrp26SrUpC6pWl/PlexXRSli+as90418xN5CbQA2Aiu6Tu7LlsoA5PTAMaofhqlH556iu9FfEaeYN50ZnWtjCo9s/e2HiUhI06u+4m7pDauwEX8kGng65KX+9AIbAPC3vHiQZY0E1EEF3Cb1T2zJWXEymBOFriLAejp7ty4MFRUvCquoM6bGuoo7y8nxbQc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LVWPR11MB9883.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WU9vTnVxRjE0ZU0ydUZaWFdaeEgxMkdTbFFFeGswQmtLdE9HaDhDRThIZnNy?=
 =?utf-8?B?Z2NkM051TXVreTYxNFpTaFVWN0RvRjMvL2dsSXdzTTB5emp1T09NaGg4OHMx?=
 =?utf-8?B?Y2FMY2hYTGRRQndFMVNCRXgxcEdBVlNaL3B5ZjNMczcwbjE5UGl1VGlaWDJF?=
 =?utf-8?B?bGo3Q2lBSDhQTTNXazNLbWhqa3hXai84ejJsSVg3NUYwMEc0VVdiZ3VDSE5V?=
 =?utf-8?B?RllHOVd6b21ML01FVmh6Vm5tcHIxeEdLamJ6MUkzWUJ0NzNsZ3pvbG00WVpH?=
 =?utf-8?B?TUI0YW5IbWxuVGFyVkwxTmpHT2kyNUROckJ6RGRDWTN3RUVvdktnaERYR1BH?=
 =?utf-8?B?NFdEVjVQUHJlVitBWmJrL2FyZjdpWjJRUXdnYmZsSE85Y2dZN1d1S1NiaFhH?=
 =?utf-8?B?b2k1NThCdGQ4c1drSGRoMDFBaWt1RG1wWTd5djFYbmYzY3ZkNmIvbDZtcFpq?=
 =?utf-8?B?VFF5azNEWGZEdStyT05BbWpmZjMwUTVWa0dYSE42RDREUFZlS0tkcW82RmF3?=
 =?utf-8?B?Smw0L0JUa1JNSFNrSWEyVkZlOVh2VEltU3drR0RwTWN6eUdRRUd4b3pndDdx?=
 =?utf-8?B?eFlIQUpSS2pyUEtMS1JQVmlHZHdXbWxaMk1XVGZzNDk4WlQ4ZU1iZ0xlV00z?=
 =?utf-8?B?eUp0b1I1WkZUbFQ5ZHZ1V2Vsa1dEbko3TnpTZk9XWEFwbXlvRUpaOGFZeWNX?=
 =?utf-8?B?U2VjZ2tZMG9VMndFSEhnRWZMU3RGdDI5Q21MbzN6VzNNdlFyRDAvVmtTd0FS?=
 =?utf-8?B?aVpZaWdFRWFpUHdKN0ZHK080cTRzMFUwVzduUnEvZVZvdThPUGFSNVZKMHNy?=
 =?utf-8?B?M2JLVlgvRXFsVnpZQ3ZiYy8wTHlsZUdkdHVRdi9reWRJWldYNUI1UHovZmto?=
 =?utf-8?B?bWVWbkcyRFJBV3ZnSjFwaVdlYTdHNHo1eWNITU83NnlscWQrMUJza0piYjJ0?=
 =?utf-8?B?TnRvMFk2ME9yNVZLWU5HSndZOURRcC8rK0RtL3I0K0NQRmM2NlQxUlYya0l5?=
 =?utf-8?B?MTFxb1hUTmFvYjhiZFpvRkI0RXc5b0F3TW1EMVJCTXUvZ2UvNUZVMjZUTC9x?=
 =?utf-8?B?ejVBUGFIUHV6TGNlL3ljSjhBbzArV3NiaTN5QjNsZ0VxcmtSejNBbTlDSGU5?=
 =?utf-8?B?T05KYlgrejBxcmFUbk95Y1c2dUZTaHUyaFlyeDQ2ZGg1dDJ0S09KVFhQSnVT?=
 =?utf-8?B?MmluSkwvMjRnb3RUWGpNSm8rVDlXaVJOWS9NaGt2NFJwZllLWHZuYlBWdGt1?=
 =?utf-8?B?RHQ0OEhucldsYVpWak8vMmRyRW1FcHRmWlhOL1lrdytsRUIzUzJnSk1tM2pX?=
 =?utf-8?B?ZUdkYi9PTURWRG1zcmR2VU1ETXc4KzhxejZHcWt0MkJ4SUQzMTRqV1JhR0Qx?=
 =?utf-8?B?eHJTVmQ0dzMweXR2aUlxUTBrOGt3ZDR6RGVYaXpOL3NqVFBKN1hMV2NtazJL?=
 =?utf-8?B?cWlHNlFNVUx5S3NuL01QQmdPL2ZkN0sxQ0hBYk9FcWFBcDJKYUQrWVVUVGZm?=
 =?utf-8?B?YVhybmZHV3FicmpzVDNMRlZ6Sm04RmVXVDVkejdYS2FYeWY1Z1BmNDF6VzJN?=
 =?utf-8?B?NzZ3RXQ4TXR4N3BHSjVXQVR0NDEreEpiR2VrWmtNYUxOL3pGdFU5K0Z3TlFU?=
 =?utf-8?B?L1VXL1NoMzJ4eWlsOFJoaVRsdGRCQ0lLaGZoUTAzU0cvK1QxcUlOZjlaMHZy?=
 =?utf-8?B?ZmFxL2c1MGgyMjBjdmliazRoMjFWVUhKUWZOMzRwUEEwWEwramZ2a2RLWUdW?=
 =?utf-8?B?R2xjcVVaVjI3TDI1NUZQVVAwbVZYVTNISkhMeUtPRUh2YmZkTGI1SzRuczNO?=
 =?utf-8?B?OEV3VGIzM2ZzT3pIZUhaS3BjYTdQQmEwL0RKQ1Y1UnJrZkVOUm94VDJEekov?=
 =?utf-8?B?U3plQzRaeXloanNSZ2JyME9vSVYvTHdrb25adytCNnJVUDNzTnFpV0pJSTM3?=
 =?utf-8?B?RTAvMHVGcmxHbEt1VEJpVStiODY2N1dEWXJHekJZVTg4ZE5GRzJTK0poUnVa?=
 =?utf-8?B?akluY3RZWENpQkg3QkhLbndjaGRncExhRkw4UERFSVd0ZzRDanhDY0Z5cm1i?=
 =?utf-8?B?UGdGdVA1dlRiTGVWdXZLaHg0ajdNeWtSTTVqcjNEaWJ0OS9UcUk2aVg5Wis1?=
 =?utf-8?B?SnhvU0hyand0VjBPNmc2Vk52a2swc04xMnlHRjViMkFHT0NHN2FycERRNkpr?=
 =?utf-8?B?UEpBTlJweVNmSjdFR0hzdmZId25HTFBHa3FDRERleEk3ams0V1E4R0JtMnpU?=
 =?utf-8?B?TWdZVkpEL1JMVlpQaDRxZVBGOUFEd1dIMk55VG14T2FYdXZNWDRMbXdUdEtX?=
 =?utf-8?B?bEFYSXNsdnJxeDBKajF0UTBkKzBBSWFlc0tpZFhOWHlZRWRuaWNMc0xFa1hp?=
 =?utf-8?Q?nMb2PZyXyOm1xziNO/FKs07pcUb4RuYh5FGTo?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <91DEBE2766F3BA4CBFD9AB1B2140FB67@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: CO4T52FrgVSJL2Qg3+5D1zKOYuJp9/jrBYocDZLepwfywi6/7d7AdfACppQsI95p+WhP+Yomr+SerGh3qkOTYqLqr/1B0iBVyqREQOB6RZ1+4JMCYyMT6BF6lcl1SoQ1JvMcZmm2QbG3V3dyD0YqSSkMF7O609XRL8rWp9KTOwTBaaDQUO9NA7Bs22VdLhSB2q0JlspfY+6caQFp1l60J8b04h0X9Vce+UTJHgpnYZLy9gRErZLkRV5tbTl2z3xxOlArRSF3jmxcbm/V1n42TGB45/Fii/fYBCLLgZO/7rrN41LSGY6yI013PpuOzzyiRPwnjrSHMDEB4V39qLR4dg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LVWPR11MB9883.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 768d649e-6221-4639-fbf2-08df09d930e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 16:34:14.2447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yg602ff3yz13HVM6KSxNPGfAOPyjpi5IcEnBLWJ/LVfgrKjd5surNaA2xx5PYiCM67LRQcc+aUg1q9hqSo0BST3nXeIUtOptgfS2WOl3CqKHTwiab4BQl2fL3BhRftbM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8375
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

T24gRnJpLCAyMDI2LTA4LTI4IGF0IDE3OjAxICswNTMwLCBSaWFuYSBUYXVybyB3cm90ZToNCj4g
U2Vjb25kYXJ5IEJ1cyBSZXNldCBjYXVzZXMgYWxsIFZSQU0gc3RhdGUgdG8gYmUgbG9zdCBhbG9u
ZyB3aXRoIGhhcmR3YXJlDQo+IHN0YXRlLiBUaGUgZ29hbCBpcyB0byBrZWVwIHRoZSBkZXZpY2Ug
aW4gcmVzZXQgdGlsbCB0aGUgdGVhcmRvd24gaXMNCj4gY29tcGxldGUgdG8gYXZvaWQgZGV2aWNl
IGFjY2Vzc2VzIHN1Y2ggYXMgR3VDIHJlc2V0IGluIGFuIHVua25vd24gc3RhdGUuDQo+IA0KPiBG
aXhlczogZTQ2ZWU4MmYxMjBmICgiZHJtL3hlOiBTa2lwIGRldmljZSBhY2Nlc3MgZHVyaW5nIFBD
SSBlcnJvciByZWNvdmVyeSIpDQo+IFNpZ25lZC1vZmYtYnk6IFJpYW5hIFRhdXJvIDxyaWFuYS50
YXVyb0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5o
ICAgIHwgNSAtLS0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Yy5jICAgICAgIHwgNSAr
KysrKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9lcnJvci5jIHwgMSAtDQo+ICAzIGZp
bGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmggYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZGV2aWNlLmgNCj4gaW5kZXggNmM0Y2ZhZWJjNDRhLi5hMTEyN2FiN2QxYTIgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuaA0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZGV2aWNlLmgNCj4gQEAgLTE5MSwxMSArMTkxLDYgQEAgc3RhdGljIGlu
bGluZSB2b2lkIHhlX2RldmljZV9zZXRfaW5fcmVzZXQoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+
ICAJYXRvbWljX3NldCgmeGUtPmluX3Jlc2V0LCAxKTsNCj4gIH0NCj4gIA0KPiAtc3RhdGljIGlu
bGluZSB2b2lkIHhlX2RldmljZV9jbGVhcl9pbl9yZXNldChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkN
Cj4gLXsNCj4gLQlhdG9taWNfc2V0KCZ4ZS0+aW5fcmVzZXQsIDApOw0KPiAtfQ0KPiAtDQo+ICB1
MzIgeGVfZGV2aWNlX2Njc19ieXRlcyhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSwgdTY0IHNpemUpOw0K
PiAgDQo+ICB2b2lkIHhlX2RldmljZV9zbmFwc2hvdF9wcmludChzdHJ1Y3QgeGVfZGV2aWNlICp4
ZSwgc3RydWN0IGRybV9wcmludGVyICpwKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9ndWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBpbmRleCBjN2Y4
YmJkNGNiOTIuLjJjN2Y0MTFiODlhNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2d1Yy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWMuYw0KPiBAQCAtOTg2
LDYgKzk4NiwxMSBAQCBpbnQgeGVfZ3VjX3Jlc2V0KHN0cnVjdCB4ZV9ndWMgKmd1YykNCj4gIAl1
MzIgZ3VjX3N0YXR1cywgZ2Ryc3Q7DQo+ICAJaW50IHJldDsNCj4gIA0KPiArCWlmICh4ZV9kZXZp
Y2VfaXNfaW5fcmVzZXQoZ3RfdG9feGUoZ3QpKSkgew0KPiArCQl4ZV9ndF9kYmcoZ3QsICJTa2lw
cGluZyBHdUMgcmVzZXQsIGRldmljZSBpcyBpbiByZXNldFxuIik7DQo+ICsJCXJldHVybiAwOw0K
PiArCX0NCj4gKw0KYWxhbjogYW0gaSB1bmRlcnN0YW5kaW5nIGNvcnJlY3RseSB0aGF0IGluIG9y
ZGVyIHRvIGVsaW1pbmF0ZSBhbnkgcmFjZSBjb25kaXRpb25zLA0Kd2UgZG9udCBkbyB0aGUgeGVf
ZGV2aWNlX2NsZWFyIGFzIGFwcmV0IG9mIHRoZSB4ZV9wY2lfZXJyb3Jfc2xvdF9yZXNldC4uLiBh
bmQgdGh1cw0KdGhlIHhlX2RldmljZV9pc19pbl9yZXNldCgpIGNoZWNrIHdpbGwgYWx3YXlzIGJl
IHRydWUgdW50aWwgdGhlIHJlcHJvYmU/Lg0KDQpUd28gcXVlc3Rpb25zOg0KDQoxLiBJbSBub3Qg
ZmFtaWxpYXIgd2l0aCB0aGUgU0JSIHJlc2V0IGFuZCBuZWVkIHRvIHVuZGVyc3RhbmQgbW9yZSBh
Ym91dCB0aGUgc3RhdGUgdHJhbnNpdGlvbnMNCm9mIHRoZSBHVCBhbmQgR3VDIGJlZm9yZSwgZHVy
aW5nIGFuZCBhZnRlciB0aGlzIHJlc2V0IHNlcXVlbmNlLiBRdWVzdGlvbjogaG93IGRvZXMgdGhp
cw0KcnVudGltZSBTQlIgcmVzb2x2ZSB0aGUgc3VkZGVuIG1pc21hdGNoIG9mIHRoZSBkcml2ZXIg
c3RhdGUgdnMgdGhlIGh3IHN0YXRlPyBpZiB0aGUgb2xkDQp4ZS1kcml2ZXIgaW5zdGFuY2UgaXMg
anVzdCBjb21wbGV0ZWx5IGZyZWVkIHdpdGggbm8gbW9yZSBDUFUgYWN0aXZpdHksIGFuZCB0aGUg
cmVwcm9iZQ0KZ2VuZXJhdGVzIGEgbmV3IHhlLWRyaXZlciBpbnN0YW1jZSwgd2h5IGFyZSB3ZSBu
b3QganVzdCB1c2luZyB3ZWRnZWRfbW9kZSBiZWZvcmUgdGhlIFNCUj8NCnNpbmNlICJ4ZV9kZXZp
Y2VfaXNfaW5fcmVzZXQiIHdvdWxkIG5lZWQgdG8gYmUgbGl0ZXJyZWQgYWxsIG92ZXIgdGhlIHBs
YWNlIGFuZCB3ZSBkb250DQpuZWVkIHRvIGR1cGxpY2F0ZSBmdXJ0aGVyICJwb2ludHMgb2YgY2hl
Y2tpbmciIC0ganVzdCByZXVzZSB0aGUgc2FtZSBwbGFjZXMgd2hlcmUgd2UNCmNoZWNrIGlmIHdl
IGFyZSB3ZWRnZWQ/DQoNCjIuIHdoeSB0aGlzIGV4dHJhIGNoZWNraW5nIGluICJ4ZV9ndWNfcmVz
ZXQiPyBpIGJlbGlldmUgbW9zdCBvZiBub3QgYWxsIHJ1bnRpbWUgZ3QvZ3VjIHJlc2V0DQpwYXRo
cyB3b3VsZCBjYXRjaCB0aGUgd2VkZ2VkLW1vZGUgb3IgaW4tcmVzZXQgbW9kZSBtdWNoIGVhcmxp
ZXIgaW4gY2FsbCBzdGFjayBiZWZvcmUgcmVhY2hpbmcgdGhpcw0KcG9pbnQuIEFyZSB3ZSB0cnlp
bmcgdG8gZm9jdXMgb25seSBvbiBlbGltaW5hdGluZyB0aGF0IGZpbmFsIG1taW8gcmVnaXN0ZXIg
dG91Y2g/IElmIHNvLCB3aHkgbm90DQpwdXQgdGhpcyBpbnNvZGUgdGhlIG1taW8gcmVhZC93cml0
ZSB3cmFwcGVycz8NCg0KLi4uYWxhbg0KDQo+ICAJeGVfZm9yY2Vfd2FrZV9hc3NlcnRfaGVsZChn
dF90b19mdyhndCksIFhFX0ZXX0dUKTsNCj4gIA0KPiAgCWlmIChJU19TUklPVl9WRihndF90b194
ZShndCkpKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9lcnJvci5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9lcnJvci5jDQo+IGluZGV4IDNlOWM3N2Y4NDgz
ZC4uYjdhYzMzOTY1MTUwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNp
X2Vycm9yLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV9lcnJvci5jDQo+IEBA
IC0xMjEsNyArMTIxLDYgQEAgc3RhdGljIHBjaV9lcnNfcmVzdWx0X3QgeGVfcGNpX2Vycm9yX3Ns
b3RfcmVzZXQoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+ICAJICogVE9ETzogb3B0aW1pemUgYnkg
cmUtaW5pdGlhbGl6aW5nIG9ubHkgdGhlIGhhcmR3YXJlIHN0YXRlIGFuZCByZS1jcmVhdGluZw0K
PiAgCSAqIGtlcm5lbCBCT3MuDQo+ICAJICovDQo+IC0JeGVfZGV2aWNlX2NsZWFyX2luX3Jlc2V0
KHhlKTsNCj4gIAlwZGV2LT5kcml2ZXItPnJlbW92ZShwZGV2KTsNCj4gIAlkZXZyZXNfcmVsZWFz
ZV9ncm91cCgmcGRldi0+ZGV2LCB4ZS0+ZGV2cmVzX2dyb3VwKTsNCj4gIA0KDQoNCg==
