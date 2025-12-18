Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C54ED711BE
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 20:57:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C2710E123;
	Thu, 18 Dec 2025 20:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpGlNI3b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58CB10E070
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Dec 2025 20:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766091461; x=1797627461;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Zs6SCGKQEWgehJ6BVAq1rYj9rtjr8W/U/KoxhVzKPcA=;
 b=TpGlNI3bYwZgHwPEuBg/A+K4FTyCbah07bjYSCR3aPKDEMEzRuE0YcuF
 yjBFOg8j/tmD0vIsqgu1iGG49mCwvGGZnBgLywR9XVTkSqFqCBL0cD85D
 5HosH2RtFu2Jd+U1tK2nhqTmDw+D1lTfAaqMn/etdEj5u8MlWXXE/+Z5U
 fZugNjUd3HjrmBNqGhwMcQYl0clrksVOJUGUsb8rbR6A4ALQtaOvMdPHG
 PQrrT6Cb9qbKcMzlyds4uwZ0vqgecZR3/ymqQ5avG87iE1y0Kjo9W1apq
 039pcEg5T3y6Y5w9J0OhOnqLArfWtGRQa/L7BQxTodC3wshwMJm82ITLT Q==;
X-CSE-ConnectionGUID: YlIFZiePTVu2q8GecoAS3A==
X-CSE-MsgGUID: sQ9HVoiOQlSX2LNNAmPQgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="90712372"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="90712372"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:57:41 -0800
X-CSE-ConnectionGUID: uFm/JnmSSUe3PuiPDfCZ/g==
X-CSE-MsgGUID: qz02QTkiSm+8P31eo03Qng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; d="scan'208";a="199510651"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 12:57:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:57:38 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 12:57:38 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.19)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 12:57:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdpJ2HdTlzIoynB2b9waav5m99wc3zOzEBBNBO9SOOoxrX1DgOClpz7ZQo4EnRMRdnHl/xq9NJJNBhPH6tb2npjVDpA5g79NW/OY4oqhkw47Pz3Arns0Hg4Zrdr0Qlx2qSMWKWvpKx0D4liBjC0EAS+VwMdstGnOQ00Ts/dReDIvoIRk4T2IIPsxxFasQHxerDAAF9kwHpGFbAPHPJs0fduxM+KWT6pOsizYuR7n1U2cndO+nUcqP1aeZZQX6hVaV+pQoxjji6qNUZhgV6Zv/S4Dzypvgn46yWpMT1P49O19ergBEepXhIH/DeQhDoxEJUKT068t0Jv7H6AkSbYORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zs6SCGKQEWgehJ6BVAq1rYj9rtjr8W/U/KoxhVzKPcA=;
 b=p0Up+Be6z6qlcC7lDgZDMProxNJP6WQf3cDjSPimL2UVIzqgXZPs8u0iMPIBkEGRVs/Er5QxI4cKOhljzCYHkDa9KAlPbwzwsMzsVu4quFjYMjuHs1Sul0vXpPVzG+F1/39Dno/tjTXSW778ZdkWr9P+oS9Q+/FGmdMyvwlhwbSSVkMaP9TB2ejc6jO7T3Ig75oUdQnvFg3MH7gijQRt0Ak8zT5OMu98ZPoJ+M4AdHULlEFzoRnd77nuF18G35x+Bh8p2SKY5Fcec0hi25HHX9U627zoQE5loSbzh9yBi5FFj/vybK1YvntDLh5S6qNH5+2HzBonTylWqfqnCiQP1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 BY1PR11MB8054.namprd11.prod.outlook.com (2603:10b6:a03:52f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 20:57:35 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 20:57:34 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH] drm/xe/device: Discard check for lmem_init
Thread-Topic: [PATCH] drm/xe/device: Discard check for lmem_init
Thread-Index: AQHcb1PGfbyO5UEQ4U+eZy5khuR0JbUn4zMA
Date: Thu, 18 Dec 2025 20:57:34 +0000
Message-ID: <a531d0f7bd469d3681c208e1e070afd73cd5df05.camel@intel.com>
References: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|BY1PR11MB8054:EE_
x-ms-office365-filtering-correlation-id: 175d2a4d-67c5-479c-6ed5-08de3e78119d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dm1lVm9pM1J5T3ptb05mejFuQ2VZY2FtRktWQlg0aUtDdlJrMWNFaFJ4K3JF?=
 =?utf-8?B?UEhIR2o4c2htWnk1WmxyRmhxbmxLSmxOTjkrczk0elBrbk54SDJtb3ArYlp6?=
 =?utf-8?B?a1pjR1FkZXBEN3pmdmI3Vmcrc2t2aEErSE5qSTZMUTV4allveTgwRmhDS1NQ?=
 =?utf-8?B?dnowOXBPRFBCZGc2a3FjdTBpNVZjei9adDRmMStrSXY0VElTYXQ2cXNWYlhz?=
 =?utf-8?B?bXZWazFaeEFSQVVoOE5paGx5ZERKRUFlajE4NzhMWWR6MFZNbVNOWHdQYXlW?=
 =?utf-8?B?a2t4N2lzSFJjVGJvTXR4K21SWmdEZEJWdFJ2WkRqekZkM0k5K0hnMTYzdXNJ?=
 =?utf-8?B?MFR1RGc1R2ozUThiUnNMUXVYSmQwL3VISVRFYUtqeGxSbnpKYzJKZVBZZS9q?=
 =?utf-8?B?aGxEbmRtbXg2TkdMTFNtV2VlcnBRWlFyek83MWJvaTFPQVNnUTdJbUFCei9o?=
 =?utf-8?B?S3FEU0NkbkVrSURmMjN3RlM3M3Z4Q1JJVkdFNStTQVVsdUVoM2tCcGlBWkp0?=
 =?utf-8?B?MmJuOUQ5bVZMeG1KUXpGdTRqb0dhWVJhd2E2ODdDOFhwdmVKNjZsUy9tTjhl?=
 =?utf-8?B?bFJQQ3hMVnh0VW9Ob2NrSlg4YVY5eDA3aTNxUFcwMEQ2Tkd1Z2lhNUNMQS9C?=
 =?utf-8?B?UGpEQ2RJekJISzZlanlUdkIwZEk3N2lFd2IzeG5jbENGbVkza2I3alFvc2lW?=
 =?utf-8?B?SkN0VW1PSDJKRUxKdmhYZGVMSmtJS1hDSmxGN2NGVUhIOFdqc25MblZmK2Vu?=
 =?utf-8?B?WHovK1NNbDFzOTVxaW9KTlhQL2cxekpIa25VWS9xeUpOdElGRCtNWXIzSkhF?=
 =?utf-8?B?bFFVV2xmYmlMZ2Z1cHQ1M2UzZnJ4akJOaXAydllCdHZONGpTaXQwa3FQYzAz?=
 =?utf-8?B?bGZFTXZIWlRnVjcvR1dRL2dOeGREZzJGQys2eWNTVi8zVTNyUFdpSGtSS1dB?=
 =?utf-8?B?ZlpjaXZhbXRuallaY3Z3dFdPWnBXQXJvNWtKQUxhWTZmSlRJa2FGT2RsOWlm?=
 =?utf-8?B?VEFDTmphdlZGUkhDWG9mOGg2enVsVnNac0hUNTc0VmNiYmhDT2dDdmRhcUxB?=
 =?utf-8?B?TG5nYXVONEFSSVA1ajM0eUw4RzczN0ZLVjcvaW0xMmZCSktycndrZjc5TmMr?=
 =?utf-8?B?TUlYaEUvSHF1a3c1dDM5eW1wMXU2VnlHQ2VEYlNGYVQxbm94WTB4cXpGN3RG?=
 =?utf-8?B?clJFRHRhaVpJY01HUXEyZWJueHdpQVVNakplbW5qYUF0eTJMbWtERDkzUSt6?=
 =?utf-8?B?Qis2SUdOU3lwYTF5QkN0VEx1L3dkWHdDd1p6dlZTSnk0RWRLMWVNUGhtWUVS?=
 =?utf-8?B?Z2puUklkeXhpOE5MT003eEI1K1VVcUk0SU1KZzVjVzBKVzFya3FQcHExalJB?=
 =?utf-8?B?bHZvT0lESkE0dkhENlJXTlNtSXRybXFQdmYvRStSd2oramxmYVZNTVJCdXY5?=
 =?utf-8?B?TGtGbFBJWjYzSGdseFlFd0NaTVNxMStkZGVKeUxUTjBzTlo0bWlrckpXM2h3?=
 =?utf-8?B?Z2JqUnRzSXJ4RXBNS0ZaVW4wcTNOb0dYczFzS3VoclRXVEwvV3I4YXFjRjls?=
 =?utf-8?B?emliemliajRCaThMa09leWpYMks1Q0hHVzZtMzlhMWE3NDlqZjhRa2N2aG1S?=
 =?utf-8?B?dmRDTnhpeDQvWjNMVVFkdHZEZkExeVArNGZZM084TjdMU2dJbE10RmFaOFNh?=
 =?utf-8?B?U0tOQjNNQUNsNmt0MUZYbEtQb0MvMm8rRlhHYmp0bTZxS2dEU1ZlSWlCcVNL?=
 =?utf-8?B?WWRIV2VTbGFld0lLNDk4bGlwT3RUMDFVQit3ZVd1dVhvR055NFhmRFV5QXRk?=
 =?utf-8?B?dHhhZFk4SEt4dWJHbUsyVXhFdHA2Rmh6WjBRdjkxd3lHekUzeHUvRFZQby9N?=
 =?utf-8?B?U2tTelU0VGxzSGkzZnJSdmJ3RUlFdi83MlliTHZpb3RHb0cweEE3Vk94Y0FP?=
 =?utf-8?B?enljOHdRWXY2dTRIY1Y4SzBVQVIrVWxadWhKcE5DSWVTRjl1SDlMR3gxY2g5?=
 =?utf-8?B?dllkRzh4REJuaWlSL1BmaXJ4SjBVa0RleW5YRGpQanU0aCtUK3hMeVA5d3kz?=
 =?utf-8?Q?VhWzrJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUFpMmlsdFFtVmhjS2xBdmY4NkExaVpIQmFFR1ZublVnTk1La3dSNS9uOUQ3?=
 =?utf-8?B?anJtN2twaTVxaDQ4MzhPU280dHloVUJqbDREZUNWNm9JTCtGZHdOVVg2RVlF?=
 =?utf-8?B?MmlYSGRwOThtNy9MU0trajByRWRnZVRjNkxsaVJIUnRVamJWTCthUGQxQWdp?=
 =?utf-8?B?LzF6QjJqMFB1Y1M3NUdUbUpOUE41SllnVTFTWGNhdzZwK3JWeUdGVUMvSTZy?=
 =?utf-8?B?WTBKVWl0U1ZBNnZWS1ExNExyUld1SU5OQkh5aVh6eXI5dmxFTGV4TEhFUm1y?=
 =?utf-8?B?NzhheVhlZTNzTlJnVVZzbzBQU3dKazc4RzM4T0txOEFWS3NnRTZSNHVOSU9k?=
 =?utf-8?B?Ull0RGpzU2RkcmtabjZOcmgrQ3Jic1drWWhnRUpmMHVoamI5d3AyejMwcVN5?=
 =?utf-8?B?TVBRYVRQYmR2Zm44MG8rT3RWNG02WjcvRGE4U1lTRVVxN3VqOGg4dCtVdzMv?=
 =?utf-8?B?b0F6RW9xS0ZTVGxuRmJZSjhwN2M2eW1uTEZ3YUk0dWFXc3hCRlBqaTQ4UTBt?=
 =?utf-8?B?QitTMXpLRUo2MTI4VzUwcWNaelpRT0Q1Zk1yc0NCYTlaQmQ1aUNWd3dhaTlS?=
 =?utf-8?B?eEdNOHhjT0dnNnJRRWlRTlVKeW9NZ2xNM0c5dGRpNk5LY3N4NXZPSXRmL1ZG?=
 =?utf-8?B?ODhiRFBvWUdQZkxoc3YzSzdBSjFocmpvbTNuRW5qL21XSk4xb3FXcjArV0FR?=
 =?utf-8?B?RUtXSVVwL2hNcUlBT1Vic0g0S2ZhdExuaGtOMTlzUHg5L1BQTktaTHk0Z21z?=
 =?utf-8?B?ZlF1WGFRRGhONnFXWGdwT2d0VnFGMitIelVBem9VT2hBc3MyV2wvVWJUV3RX?=
 =?utf-8?B?cERWdC9sMG1nS2ttMEF2UnVSRWdLOGhnMUk1WWV5cEdSMFZnVFB0T1l1WHJ5?=
 =?utf-8?B?NXRSK0NQT1JsWldyeEZpZXRST1RwZlIrZkdlS282eFZCNkhIZEgrWHhablVM?=
 =?utf-8?B?VXFTWXZoOG4wejVUVWI2dXNlOTNOcnI0UzVBWlhVRytUZHhtNXV4NWlZRkl5?=
 =?utf-8?B?c1pDNEFCSmlrZTM1eVpvSTZ6V2FPenpKZU1SMGs3K2sxSWlhYzVyZzN6NXc2?=
 =?utf-8?B?eTBvQUVZdjdWVU5qMG1MZGc5WjhZRE0xSjhLallwcGc4OEQ0SFZUaUdabVNw?=
 =?utf-8?B?Q1dTeVBFdDVSUDhGK0k2MHgyM0F5SzRSUG5DeSszUzF2NUJQWDZKelhsLzBk?=
 =?utf-8?B?S0FFcUNTdVBzcHZHL1JrZXVzMUtOeWFNTUFSTHVwby82eElNL2RHS1VRaXJa?=
 =?utf-8?B?WkNnMysxTWlsOVZhR040cWlWN3VFY0kzSy9JQlcvT1J2d0lYbnlGL1R1OVVZ?=
 =?utf-8?B?U3JFSHlPZ2s5QjhnSGdvS2w2YW9vL0VCRVVpRmhkQ2cxYUNOR0NPbGcyRzNz?=
 =?utf-8?B?eUpwWkY0ZVlDZkRkS0FubjhJbUE4SGpVWlRieml4MXp4TndKcmVGQ0g0TDN3?=
 =?utf-8?B?bUZVT1FpZFZpME56dVREeStVNUVvQ0Q2Q0srb203cGpmSllibk5YdGZtNFBu?=
 =?utf-8?B?N0RTQmhNRVZPeEN3Qk5ZbjlXRHZvN1A4WFpRcUJOMGowdWlrVUEyWUc4cVk5?=
 =?utf-8?B?Vk9xem9VODBLeDU2bS85VW5lMTN4SnU5a2RBVE1KOHJxQzMreS9SQXo4Z2F6?=
 =?utf-8?B?TE8wZDl1b0cvZnl6ODVMQkZuUmRPYmNPb1JLbWVWRXpYbzhBbnZ4VVhsVTdI?=
 =?utf-8?B?NXo5cjJpZS9LeGRlU1l2Qm5FNERZS3BhUlk4SGZSVE9WZFBwS3FCSFNmWElB?=
 =?utf-8?B?a1EvNUNNYzQ5cmRqek1NUzFNMjNSU2RORFZHQ1NpNUsxb01xa0NwSGtmU2lN?=
 =?utf-8?B?TUllWFRlV29WOTZneDZReVFLU0ZrV3VMYUxBMlNUTnVsVGtrYlJDbU5ITkpy?=
 =?utf-8?B?WXhqcHA4V0JOOFlhTXlzcEZWdTRKbmd2cU1IcEd4V0JsY1pYcWd6THhWQzly?=
 =?utf-8?B?ZmNSR1BOSXRaekh1djBNZ3FDL1dxWVNQeG5IaFlUdmdPS25iV25uL1dmcnZI?=
 =?utf-8?B?WmFrZHJmN2k0QktkeXFWcWNUcmJKblhXMDVsdXY0b2czYlViNERpbGRuR0NR?=
 =?utf-8?B?ZXBSbzFjYWlpYnRrUHN2RzBQbnpBYndEOVpJelROVDNPSHFtaGRhZXdLTVZS?=
 =?utf-8?B?akpjaXBqMEFNcTZUeEpPT1lZamloYTliN2VkK1UzRG45NGtVakFlZURuazV6?=
 =?utf-8?B?eVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8E8E3943709294FA1CDFD8B01BAC937@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 175d2a4d-67c5-479c-6ed5-08de3e78119d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2025 20:57:34.5150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V7fXP7yxMEPFc3t6TKPLFVCbZ04R4Obnqeos+EVcCRLHFcwTDLShZUZrrBnm66YAnR3gMrjWxWqomTzCkc4/+wjH9b76e8htU3yThjiyAKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8054
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

T24gV2VkLCAyMDI1LTEyLTE3IGF0IDE4OjIxICswNTMwLCBCYWxhc3VicmFtYW5pIFZpdmVrYW5h
bmRhbiB3cm90ZToKPiBQcmlvciB0byBsbWVtIGluaXQgY2hlY2ssIGRyaXZlciBpcyB3YWl0aW5n
IGZvciB0aGUgcGNvZGUgdW5jb3JlX2luaXQKPiBzdGF0dXMuIHVuY29yZV9pbml0IHN0YXR1cyB3
aWxsIGJlIGFzc2VydGVkIGFmdGVyIHRoZSBjb21wbGV0ZSBib290Cj4gYW5kCj4gaW5pdGlhbGl6
YXRpb24gb2YgdGhlIFNvQyBieSB0aGUgcGNvZGUuIHVuY29yZV9pbml0IGNvbmZpcm1zIHRoYXQK
PiBsbWVtCj4gaW5pdCBhbmQgbW1pbyB1bmJsb2NrIGhhcyBiZWVuIGFscmVhZHkgY29tcGxldGVk
Lgo+IEl0IG1ha2VzIG5vIHNlbnNlIHRvIGNoZWNrIGZvciBsbWVtIGluaXQgYWZ0ZXIgdGhlIHBj
b2RlIHVuY29yZV9pbml0Cj4gY2hlY2suIFNvIGl0IGNhbiBiZSByZW1vdmVkLgoKTWF0dCBoYXMg
c29tZSBnb29kIGNvbW1lbnRzIGhlcmUuIEknbSBhbHNvIGEgbGl0dGxlIHdvcnJpZWQgYWJvdXQK
ZmlybXdhcmUgYnVncyBpbiBlYXJseSBicmluZy11cCB3aGVyZSB3ZSBtaWdodCBnbyB0aHJvdWdo
IHRoZSBwY29kZQppbml0IGJ1dCBiZSBtaXNzaW5nIHRoZSBQQ0kgY29uZmlnIHVwZGF0ZXMgYXNz
b2NpYXRlZCB3aXRoIGxtZW1faW5pdC4KVGhpcyBhdCBsZWFzdCBndWFyYW50ZWVzIHRoYXQgd2Un
cmUgY2hlY2tpbmcgdGhhdCBoZXJlLgoKVGhhbmtzLApTdHVhcnQKCj4gCj4gU2lnbmVkLW9mZi1i
eTogQmFsYXN1YnJhbWFuaSBWaXZla2FuYW5kYW4KPiA8YmFsYXN1YnJhbWFuaS52aXZla2FuYW5k
YW5AaW50ZWwuY29tPgo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIHwg
NjcgKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAtLQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2UuYwo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZS5jCj4gaW5kZXggMTE5N2Y5MTRlZjc3Li4zODE4ZDBjY2NiMGUgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2RldmljZS5jCj4gQEAgLTgsNyArOCw2IEBACj4gwqAjaW5jbHVkZSA8bGludXgvYXBlcnR1
cmUuaD4KPiDCoCNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+IMKgI2luY2x1ZGUgPGxpbnV4L2Zh
dWx0LWluamVjdC5oPgo+IC0jaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+Cj4gwqAjaW5jbHVkZSA8
bGludXgvdW5pdHMuaD4KPiDCoAo+IMKgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5o
Pgo+IEBAIC02MzAsNjMgKzYyOSw2IEBAIHN0YXRpYyBpbnQgeGVfc2V0X2RtYV9pbmZvKHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gZXJyOwo+IMKgfQo+IMKg
Cj4gLXN0YXRpYyBpbnQgbG1lbV9pbml0aWFsaXppbmcoc3RydWN0IHhlX2RldmljZSAqeGUpCj4g
LXsKPiAtwqDCoMKgwqDCoMKgwqBpZiAoeGVfbW1pb19yZWFkMzIoeGVfcm9vdF90aWxlX21taW8o
eGUpLCBHVV9DTlRMKSAmCj4gTE1FTV9JTklUKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gMDsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgaWYgKHNpZ25hbF9wZW5kaW5nKGN1
cnJlbnQpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gLUVJTlRSOwo+
IC0KPiAtwqDCoMKgwqDCoMKgwqByZXR1cm4gMTsKPiAtfQo+IC0KPiAtc3RhdGljIGludCB3YWl0
X2Zvcl9sbWVtX3JlYWR5KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IC17Cj4gLcKgwqDCoMKgwqDC
oMKgY29uc3QgdW5zaWduZWQgbG9uZyBUSU1FT1VUX1NFQyA9IDYwOwo+IC3CoMKgwqDCoMKgwqDC
oHVuc2lnbmVkIGxvbmcgcHJldl9qaWZmaWVzOwo+IC3CoMKgwqDCoMKgwqDCoGludCBpbml0aWFs
aXppbmc7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoGlmICghSVNfREdGWCh4ZSkpCj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqBpZiAo
SVNfU1JJT1ZfVkYoeGUpKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4g
MDsKPiAtCj4gLcKgwqDCoMKgwqDCoMKgaWYgKCFsbWVtX2luaXRpYWxpemluZyh4ZSkpCj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+IC0KPiAtwqDCoMKgwqDCoMKg
wqBkcm1fZGJnKCZ4ZS0+ZHJtLCAiV2FpdGluZyBmb3IgbG1lbSBpbml0aWFsaXphdGlvblxuIik7
Cj4gLcKgwqDCoMKgwqDCoMKgcHJldl9qaWZmaWVzID0gamlmZmllczsKPiAtCj4gLcKgwqDCoMKg
wqDCoMKgLyoKPiAtwqDCoMKgwqDCoMKgwqAgKiBUaGUgYm9vdCBmaXJtd2FyZSBpbml0aWFsaXpl
cyBsb2NhbCBtZW1vcnkgYW5kCj4gLcKgwqDCoMKgwqDCoMKgICogYXNzZXNzZXMgaXRzIGhlYWx0
aC4gSWYgbWVtb3J5IHRyYWluaW5nIGZhaWxzLAo+IC3CoMKgwqDCoMKgwqDCoCAqIHRoZSBwdW5p
dCB3aWxsIGhhdmUgYmVlbiBpbnN0cnVjdGVkIHRvIGtlZXAgdGhlIEdUIHBvd2VyZWQKPiAtwqDC
oMKgwqDCoMKgwqAgKiBkb3duLndlIHdvbid0IGJlIGFibGUgdG8gY29tbXVuaWNhdGUgd2l0aCBp
dAo+IC3CoMKgwqDCoMKgwqDCoCAqCj4gLcKgwqDCoMKgwqDCoMKgICogSWYgdGhlIHN0YXR1cyBj
aGVjayBpcyBkb25lIGJlZm9yZSBwdW5pdCB1cGRhdGVzIHRoZQo+IHJlZ2lzdGVyLAo+IC3CoMKg
wqDCoMKgwqDCoCAqIGl0IGNhbiBsZWFkIHRvIHRoZSBzeXN0ZW0gYmVpbmcgdW51c2FibGUuCj4g
LcKgwqDCoMKgwqDCoMKgICogdXNlIGEgdGltZW91dCBhbmQgZGVmZXIgdGhlIHByb2JlIHRvIHBy
ZXZlbnQgdGhpcy4KPiAtwqDCoMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgwqBwb2xsX3Rp
bWVvdXRfdXMoaW5pdGlhbGl6aW5nID0gbG1lbV9pbml0aWFsaXppbmcoeGUpLAo+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaW5pdGlhbGl6aW5nIDw9IDAs
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAyMCAqIFVT
RUNfUEVSX01TRUMsIFRJTUVPVVRfU0VDICoKPiBVU0VDX1BFUl9TRUMsIHRydWUpOwo+IC3CoMKg
wqDCoMKgwqDCoGlmIChpbml0aWFsaXppbmcgPCAwKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqByZXR1cm4gaW5pdGlhbGl6aW5nOwo+IC0KPiAtwqDCoMKgwqDCoMKgwqBpZiAoaW5p
dGlhbGl6aW5nKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kYmcoJnhl
LT5kcm0sICJsbWVtIG5vdCBpbml0aWFsaXplZCBieQo+IGZpcm13YXJlXG4iKTsKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIC1FUFJPQkVfREVGRVI7Cj4gLcKgwqDCoMKg
wqDCoMKgfQo+IC0KPiAtwqDCoMKgwqDCoMKgwqBkcm1fZGJnKCZ4ZS0+ZHJtLCAibG1lbSByZWFk
eSBhZnRlciAldW1zIiwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgamlmZmllc190
b19tc2VjcyhqaWZmaWVzIC0gcHJldl9qaWZmaWVzKSk7Cj4gLQo+IC3CoMKgwqDCoMKgwqDCoHJl
dHVybiAwOwo+IC19Cj4gLUFMTE9XX0VSUk9SX0lOSkVDVElPTih3YWl0X2Zvcl9sbWVtX3JlYWR5
LCBFUlJOTyk7IC8qIFNlZQo+IHhlX3BjaV9wcm9iZSgpICovCj4gLQo+IMKgc3RhdGljIHZvaWQg
dmZfdXBkYXRlX2RldmljZV9pbmZvKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQo+IMKgewo+IMKgwqDC
oMKgwqDCoMKgwqB4ZV9hc3NlcnQoeGUsIElTX1NSSU9WX1ZGKHhlKSk7Cj4gQEAgLTc0MCw2ICs2
ODIsMTEgQEAgaW50IHhlX2RldmljZV9wcm9iZV9lYXJseShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkK
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKElTX1NSSU9WX1ZGKHhlKSkKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHZmX3VwZGF0ZV9kZXZpY2VfaW5mbyh4ZSk7Cj4gwqAKPiArwqDCoMKg
wqDCoMKgwqAvKgo+ICvCoMKgwqDCoMKgwqDCoCAqIENoZWNrIGZvciBwY29kZSB1bmNvcmVfaW5p
dCBzdGF0dXMgdG8gY29uZmlybSBpZiB0aGUgU29DCj4gK8KgwqDCoMKgwqDCoMKgICogaW5pdGlh
bGl6YXRpb24gaXMgY29tcGxldGUuIFVudGlsIGRvbmUsIGFueSBNTUlPIG9yIGxtZW0KPiBhY2Nl
c3MgZnJvbQo+ICvCoMKgwqDCoMKgwqDCoCAqIHRoZSBkcml2ZXIgd2lsbCBiZSBibG9ja2VkCj4g
K8KgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX3Bjb2RlX3Byb2Jl
X2Vhcmx5KHhlKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVyciB8fCB4ZV9zdXJ2aXZhYmlsaXR5
X21vZGVfaXNfcmVxdWVzdGVkKHhlKSkgewo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaW50IHNhdmVfZXJyID0gZXJyOwo+IEBAIC03NTYsMTAgKzcwMyw2IEBAIGludCB4ZV9kZXZp
Y2VfcHJvYmVfZWFybHkoc3RydWN0IHhlX2RldmljZSAqeGUpCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gc2F2ZV9lcnI7Cj4gwqDCoMKgwqDCoMKgwqDCoH0KPiDCoAo+
IC3CoMKgwqDCoMKgwqDCoGVyciA9IHdhaXRfZm9yX2xtZW1fcmVhZHkoeGUpOwo+IC3CoMKgwqDC
oMKgwqDCoGlmIChlcnIpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBl
cnI7Cj4gLQo+IMKgwqDCoMKgwqDCoMKgwqB4ZS0+d2VkZ2VkLm1vZGUgPSB4ZV9tb2RwYXJhbS53
ZWRnZWRfbW9kZTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4ZV9kZXZpY2VfdnJhbV9h
bGxvYyh4ZSk7Cgo=
