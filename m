Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6698DCCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 22:13:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F7910E9E0;
	Thu,  6 Nov 2025 22:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yk0BKc7O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C4B10E9E0
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 22:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762467229; x=1794003229;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZZSq9cha39/9qcpHCDgm46vOXK0sC0L/t1RDxnoOwfI=;
 b=Yk0BKc7O11VueYSX5eOgVo2aDzdT8Ygsq30SC9Vs/8Kh1tZzlcMGbSvu
 3qm6osIRMNSfZ3CfFCyA4bn6TglLaKse+y/fgXME9x2/Qs9lCn8Ecembp
 85Tby70wp1u4C6noz2K05oPWQTJ8lQL7fCtiZyJASMosmBX60G8XZS11d
 crUGJ1lt2hXOBDiBBu5/SPA7eckCaz5IvZQVPRNckPyD0nit2b8RFHfcm
 MFM0r4ARUziYI9LPWpuGK1SsInFsd+04PHYbLVO26SaGNLHbpvCbT7/Ne
 VE6O+RuXm6zSyvlOD0ADKKfwg5EzKd8rg/0uu6n22tVAF0huBZwUHj3RW w==;
X-CSE-ConnectionGUID: gX91VfS9RZCtLSTVfQNFoQ==
X-CSE-MsgGUID: JA5862ekR1eEeIKhciMsnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11605"; a="63629066"
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="63629066"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:13:49 -0800
X-CSE-ConnectionGUID: U9VasEfNTTSrto5ldyTTpA==
X-CSE-MsgGUID: nttsDMInQ5SNVnUd1Fntlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,285,1754982000"; d="scan'208";a="191975571"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 14:13:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:13:48 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 14:13:48 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.16) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 14:13:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElVt+thTc4vd/ysecKurgYSxwV12lAFytWwSlBMDjEOTmzZNxRuBMORiLJMJEKuOSAX0xhdCGcChq3dTi9+rrRKEh49y3fDMx4BNQ0QwRwJRTrgGtQapIsG6uSWO6t0jvIGZybiNU9toSHQQAhgX3Y+7ro+cuqFgT/MTGWYYdgLaOQ0pwkJxnKqLuWGG5C6R15cBo+BNvGbQAnkt/zgA7/laDjCbyXSrXv73h+fm+a4vDUFJvxoDy7o0JrWIQ5ya0M0Qvl+fa/LzwE38oWvM5zp/GGjM/VYCsqFqDPP1K52mkYwedfIu/UqqaVeXQGBdTdwQser2nOBW+Gvyg59BhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZZSq9cha39/9qcpHCDgm46vOXK0sC0L/t1RDxnoOwfI=;
 b=Zc0+lBDpSTb6rcspJL7lccWUihdL2JAjNT66RL3REA/kiA/N8sBDmGoJO8EAxGmEaKc+OI9IJcKPLhL5tMw7XX9AdeS2jn9IfkQOInYlze1UY5pOM6wUMKmNa52FVcEakTozNApQhpnkUAdZI91s3m5mcWto8TmVnb/uHiT4p9c7xFkiW+oWjR+4QeXw9/QzP4QSEgzQc0MWR1Nxla3ZglWYUcAa0h5ARF8WtJPkNfFXSSe7YGueA+4AYDAh+2DUDg1Ga/oti5JqiOxYehiIWpLRU/dQi6btYrWo7wVwuHDQOSRXvAoA+fkmPVnwSy75KWfErZJJsFiMEinBjbmbXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.12; Thu, 6 Nov 2025 22:13:46 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 22:13:46 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 02/12] drm/xe: Make usm.asid_to_vm allocation use
 GFP_NOWAIT
Thread-Topic: [PATCH v2 02/12] drm/xe: Make usm.asid_to_vm allocation use
 GFP_NOWAIT
Thread-Index: AQHcTcUfR4tinjB0BESxh+/3sMiG9bTmObAA
Date: Thu, 6 Nov 2025 22:13:46 +0000
Message-ID: <f218dc777fff1948ad3a6a1209c2b2c83baf7ac4.camel@intel.com>
References: <20251104195616.3339137-1-matthew.brost@intel.com>
 <20251104195616.3339137-3-matthew.brost@intel.com>
In-Reply-To: <20251104195616.3339137-3-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7362:EE_
x-ms-office365-filtering-correlation-id: 12b49754-e15b-4d31-38e5-08de1d81c157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?OW1PQ1A4VVZ5Vm93V2Y2S2F1VVJaQ2VSY1Uwb29vR3BDWTR1T3l0cXhvUm52?=
 =?utf-8?B?YS96YytrNEt4NXBuYStOWHFQeFJ5VkdCNXhaS3Y3SUQ3U1JTUEhoU1NZOWNJ?=
 =?utf-8?B?dndkRy9VQXRlYkttalJ3bDNtcVdiVERpRU9QQW1UVUJhTGNUZENSUGhQektE?=
 =?utf-8?B?Nk5SMGFUaU9nZTY5K3B2c3JkUEN1R0tYYXVxMlNteWU4aGdTSE9hdm9yNmtP?=
 =?utf-8?B?MHdhMlhwMXFqYmhjbG52OE1XWDJEb010d0tlVFo1S2FIZG9wTWhtdWdYV3NQ?=
 =?utf-8?B?YUtvd0hreTlBSmhqS0xYeExDb2tiVU9lOXVpbVNjMGpmc2UwTVVOVG9yZE1D?=
 =?utf-8?B?NUNjTHpXcFBVQzZ0OEZGNG8ySFRCZ1Z6ejgzT0o0cy9QNFpFYkcyaUx4S0tx?=
 =?utf-8?B?alVLalJCLzZ0NDE5NVhKK0pVNndIN25yUjFqNjFObU5kMXdYa3U0SHFGNDc5?=
 =?utf-8?B?YXQvU0dLRThwOHY1MnZtV2VPNnoxU1dYT3BVY3Z0OUFPWWQyL3Qvc0J4SjJl?=
 =?utf-8?B?bFhnWmRJaHhCNk14Q2Yxbmk0SFl3YzdWUGk4K21VRlJwenZMWGowa1JQbTc3?=
 =?utf-8?B?c09tcGt6Q3pzRDBOekh3dHg1SjJWdU5wNVNIUFRwNVNPOHlTWmFmV28zSG9u?=
 =?utf-8?B?SnI0VTZzN0hMQ1VWWjUwMWpHRXhBemRnNS93TE1URjBuckg5T20xRXlSVm15?=
 =?utf-8?B?LzcydEQ5aldZNlJSUzZtYkgxemQ3ZmtQMDFoMUpwSUZxVnlDMlI3RXEyUFZr?=
 =?utf-8?B?TThKVGNMY0FpbHNYQ1pxVm5MSHZsNUhrREthbnlORThxRFhvZUNzcEp5NHFt?=
 =?utf-8?B?YmtTVnFsYVRBWTR4dFFKa3I5ZmM5UEpoT0QxdDhrM25HYUIyckNKdFZaZVlx?=
 =?utf-8?B?cFRTZkljcFNTdE4xUjd3NVA0M0dNYU4vamt6YXExUjhTQUV1c3VORnFrblox?=
 =?utf-8?B?TTBuNzRJaVYwMWo5TjVrRGI1U3NxRzlCZkRRd0NFQTNuSzR1MjA1aWkveEFx?=
 =?utf-8?B?ajU1U3JYK05YM1kwNCtTblFYSEhDVENNczJBZ0MyUFhxT2h1dzZmQy9rSElR?=
 =?utf-8?B?TENWWWNsZTVLWkVPZHVVb3M4cCtTV094YzRBckVjT0lTNlVuUTYxLzIwVDls?=
 =?utf-8?B?VTVQZDNqZWx4Unoyd2JybUtaQkMwbmx2cUlEeXRLZ1FwTjUvUkZjcVFwTHg3?=
 =?utf-8?B?anl6M1FYOUxLcHExRE15TGw5eEdhTWppanZPc2tIdmJKUEdHQWhYY2RNOE1R?=
 =?utf-8?B?a3hlWUtYenoySnNWbjFOSDc1NnFHcGJHNlRSam1Tc0hvRExYY3RySk5kN05W?=
 =?utf-8?B?Mk1WbFdyd0xsT01Tdy9mM2Zac3ljbm84RmFZeFM2cGYydGVMbEN5NWJ4YVN6?=
 =?utf-8?B?WFE4bTR2eWxLV3VvREdpQzNKSWk3TkVXL0FqVUtnN1lWN04xSlNWLzhkK24y?=
 =?utf-8?B?a0hWR1Q1WG5iTHY5dUMxUGhTODdrRkhhNG8xdjBmdzRNNzgvZFVmNk5tTThU?=
 =?utf-8?B?OWYwOTBXa1d1eWlHbmUrWDhYa0piSk9ob0tZNVVLd05LZDh3Y0ZoRGFKWjF2?=
 =?utf-8?B?ZmdFRTBIS3JKbS9GWXRYMFZ0ZGlNQm5SSTBNbHEzN1RQTWdPdWNhc2VtZG92?=
 =?utf-8?B?YzFHQzlzWitJM1lsK1NKRk1tWThLTzMvcUxnQXpRd3M4STZKU0M2NzF1Y0NU?=
 =?utf-8?B?elE3VllmU3JIdVNNTTEwTjRqU2J6TTdyVW02T28wTWhLVGpaMTFQZDFwRHpF?=
 =?utf-8?B?SllzbmJWZ1NiSUNCQk9TYjcrODdLNXF5VUFNb3BQalptdmVOajAxalhuMytF?=
 =?utf-8?B?TjIzZk9tYkFDZnRmdzdwTTY1UU5waTF0dDVmNTBFb0hXYTd6ZE5jNGdnejJI?=
 =?utf-8?B?QStmK2JpUjNHbVhQQjlIV0ZwNlJsdnovbkI0c28rV3dtakZiTnYxK1hSbzVn?=
 =?utf-8?B?YXByeGN3Z0w4TW5UOEJ4WWh3bEFtV0pSbnYvUHF5VnQyeEFYRk1xZ2J1RFhB?=
 =?utf-8?B?QmpYUVhmL2ZpSjhCR2JWb0NjcGMrS1o2eFpUc0pYbjhVR3ZVUmxIa2s2S0hT?=
 =?utf-8?Q?svDdKX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Y3gwR01nZWFndkw4M2VGaXNBU08zOVkxLyszT3huOXdWR0NseEMzdGRLNkdo?=
 =?utf-8?B?cjZpYU5mVWsxUmNBVnNnUERIczVNUHlrR3hhek9GQ0VNZURjTjJTSk9ybnh6?=
 =?utf-8?B?WUpZT2JKdm9IVjBKbEhYaldXS3o2YW91VmgrM3ZjSjFXdHBFUHAyalpxRmZ0?=
 =?utf-8?B?YlJadUROM1NxMzJNRjdKK01tcUx3TlBlZG9MTktIeEVDSERoWWFITzlub0FP?=
 =?utf-8?B?MVJCVDFXMm9nekpYc201OFFDZ0JwaXA1c09qa2lWQ3p4NmtRR2pPWkd1WUZW?=
 =?utf-8?B?RUZhdEFyaEwzbzR0ekxVcEVibWR3ZFdxQTdHZEtCNWtWUHVDUFJ0ZzlvRFNs?=
 =?utf-8?B?M0RvR2pJYzlZWjB2Wm5TT05ZSmQyTEw1cDdKM2Vqa0ljN0lpQlc2NEtOMUhk?=
 =?utf-8?B?ZGlKbVdWbUd4Wjl0V29TZVozVnhGZzZ6b3c5NUw0QzJJdDJRUS8vRVBkNmFv?=
 =?utf-8?B?YklWSEdFYWw5NXVDdHh2bDJSSUlPQXhDS3RFem5wWGRqYUVHRzI5blVOMUhi?=
 =?utf-8?B?anprbnN4TCtwb202bzUyQ2IzVmxkNmwwTDZKMVVLekVWS1RIdmxFZ2Z0bTVy?=
 =?utf-8?B?a01qZldwU0YxKzFub2k1SldNTnBsZmYxNWdLeFZBRmc4Vy8zWlp1L1V6ZVNp?=
 =?utf-8?B?Mk1nVnZqTUFKeTNsRm02SUhaNG5UL0k2NkY4L2FqWTlQcDZGUFpJdGRKZGh2?=
 =?utf-8?B?anVRMmU2Zjhtdjd4ZDdTVTF5aVFveXkwOHhxeFVWWWNFS28zL3Z6Q2JBNXJo?=
 =?utf-8?B?S0M0bGpZKzhKVDVGNWFLUmJLL25tYmJaRnUzTUYxbUFwREtlLzhGSEFiNVJ3?=
 =?utf-8?B?VW04amdvS0lyV3lOSCtnaEszS1lNNmRCUmRDUFJKTVgzZU9ZUmU0Z2J1akxY?=
 =?utf-8?B?Y3VVS2IrZS81TnR3U25ZNWJuUnJ0VUZWSGpDazV3azAvY2lOUkR2NW9lWHNZ?=
 =?utf-8?B?ZHRDZEgvZVZIdGV4NElXTXI0eFFYWE5hVXBxSUs0TFRIaTZvT0h0dFp2QlFt?=
 =?utf-8?B?Y1J2bWF0OXQzWHhaejYrU0RYREthSmFNalpZcTR5WGtpOUlZelRyeXpjY2JY?=
 =?utf-8?B?UWdsUGI4OHR5Q1ZzTlh2MFYzd2E0SzIyRTIrZkVrL2UxNHZxQkMwRlJnUm1D?=
 =?utf-8?B?Y2pkaHVrdEk3TmtaV25uRGREMnVNSmxtakhDa3VpRHVtS1BTTnByQUt3Tzl6?=
 =?utf-8?B?ZTFIcUlJR3gwaXg1K29FbVZ1SWtzaUJKcm5zaDQwaWMyQzdrZWx4THdyWnFN?=
 =?utf-8?B?MGpnYU40WXRPcllMb05INUxWaCtnc1FUS0Z4TExwWVVZT2dXUi85Q3d3WmM2?=
 =?utf-8?B?WjhwL1k2VnVSNnc5dUVGY1pRSTNRSmN4Rkh1UHNnWWxmNWNTLzAyRnFLVTlR?=
 =?utf-8?B?eWZIV1N5UEJJeUw1WHRrTGFWVlM3Q1pZL2o0UkRhb21senB2Zjh4TXFxY2M4?=
 =?utf-8?B?akNaMXlZOUhlOE40eVZLMkxTQkFHVjBOKzgwRndBY2tQWEdra2llK2VRZ1JW?=
 =?utf-8?B?bDRUUllNNUp5SSsvbTRJc2ZYRUpEQWlzcHhLcWh4dmtFTkNxd214dHBxeStN?=
 =?utf-8?B?Q2VYREhBc3V4dEtWS3lMSms5aEo2ei9Nc2hiSU1Bd005Skg5cTRFdjkwOWN3?=
 =?utf-8?B?c0xRTis3MGR2RTNmUVl5MFR1RTVDUXNQWEFRQ2RhSVUraU5qeDA4cnNHMXBP?=
 =?utf-8?B?azg5UFV0V2dFc09vbE11RjBvaE94RkdoRGZ2OUVSME5GbFRWRUFHdlo3L1NH?=
 =?utf-8?B?ZkpBNTU4Zm8vcGcyRjFJZHlFd3d4WWNld2o2a3BoUXNSNGd1R3hIVmtxQm10?=
 =?utf-8?B?d1RoZ2kwVDJGQmFCWXQwRHM5UHAzcVNCaFh6d1hyUkx4Y3FYV29QeDVJR29Z?=
 =?utf-8?B?cjNoOW9zcjBFYmd0SHpKOS9GcnJYZk5wZ0RnTm1XeXNUS2d0Ym1KeFEyaWZS?=
 =?utf-8?B?cmdWaGhiTkpaQ2V1WXRTZlpyUDhRVXFjSU84dHVIMWpPN0RMNVQ2NlF5MW5i?=
 =?utf-8?B?Umljd0RYblBEZ0pRMmpwekxKQURvMWxmc3F1TWpydnEyOG5ncStTRGplTE1N?=
 =?utf-8?B?a2pYaFE5RDNSL295aVp3MTZSNDdTS0tjcThOMk9VaFhyV1lRRVBKSDFpK1Nn?=
 =?utf-8?B?R1dVSGZRUjFYQklZeW5zNDI4RFhuTnRwMzdYYXR4SlNMRGZ3WEdWcDA3NjAz?=
 =?utf-8?B?a1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <96657761D687B045B31ACC66A6F12812@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b49754-e15b-4d31-38e5-08de1d81c157
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2025 22:13:46.4450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4co8gqZFObQjLhhZRUbzgT92aT+MJRVvYzgATJCB8L+lnmiENAxjZ3gWkbEWdgi3vKGLO/vXmweBciUhX8gLBtlGM/hSfsw1c7Kof8u1bnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
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

T24gVHVlLCAyMDI1LTExLTA0IGF0IDExOjU2IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IEVuc3VyZSB0aGUgYXNpZF90b192bSBsb29rdXAgaXMgcmVjbGFpbS1zYWZlIHNvIGl0IGNhbiBi
ZSBwZXJmb3JtZWQKPiBkdXJpbmcgVExCIGludmFsaWRhdGlvbnMsIHdoaWNoIGlzIG5lY2Vzc2Fy
eSBmb3IgY29udGV4dC1iYXNlZCBUTEIKPiBpbnZhbGlkYXRpb24gc3VwcG9ydC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiAtLS0K
PiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jIHwgMiArLQo+IMKgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMKPiBpbmRleCAw
MGYzNTIwZGVjMzguLjg0ZjRjOGYxYmUzMyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jCj4gQEAgLTE2MzIs
NyArMTYzMiw3IEBAIHN0cnVjdCB4ZV92bSAqeGVfdm1fY3JlYXRlKHN0cnVjdCB4ZV9kZXZpY2UK
PiAqeGUsIHUzMiBmbGFncywgc3RydWN0IHhlX2ZpbGUgKnhlZikKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRvd25fd3JpdGUoJnhlLT51c20ubG9jayk7Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4YV9hbGxvY19jeWNsaWMoJnhlLT51c20uYXNpZF90
b192bSwgJmFzaWQsIHZtLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhBX0xJTUlUKDEsIFhFX01BWF9B
U0lEIC0gMSksCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmeGUtPnVzbS5uZXh0X2FzaWQsCj4gR0ZQX0tF
Uk5FTCk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmeGUtPnVzbS5uZXh0X2FzaWQsCj4gR0ZQX05PV0FJ
VCk7CgpMb29rcyBsaWtlIHRoZXJlJ3MgYWxzbyBhIGZvci1jaSB1c2FnZSBvZiB0aGlzIGluIHhl
X2RldmljZS5jIHRoYXQKYXR0ZW1wdHMgdG8gZm9yY2UgYW4gYXNpZF90b192bSB3cmFwLiBTaG91
bGQgd2UgbWFrZSB0aGUgc2FtZSBjaGFuZ2UKdGhlcmU/CgpUaGFua3MsClN0dWFydAoKPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVwX3dyaXRlKCZ4ZS0+dXNtLmxvY2spOwo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGVyciA8IDApCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfY2xvc2U7Cgo=
