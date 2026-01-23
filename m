Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BB7D778B0
	for <intel-xe@archiver.kernel.org>; Fri, 23 Jan 2026 20:13:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A7B10EBD8;
	Fri, 23 Jan 2026 20:13:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKvd8+3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6104F10EBE3
 for <intel-xe@lists.freedesktop.org>; Fri, 23 Jan 2026 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769199192; x=1800735192;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=A/ROX7uln9eg+V00a3BSuJDfqyTEdAcNkEXa3JVEhlA=;
 b=gKvd8+3sarm+FRkNdWxZ8SXJ2nL8vZHMj7SkiZ/dFaczxpqVCsD3MpdX
 Si0Aljm+/OoWBWYNJHpNfkuOv1RJbATUYY6b6EHhM+cdfwJfaEyrKrBxc
 kT87x42K2Cx1+X3nHqtQYLdWrtno3WWf6NT+687gFrHxZy4+n0C9KhKpt
 Kaeh4bL20VjOvhMDSp7XaUWnkmcAyTGZKoO2WcFFMlHVhO/AfYM6W59og
 bmrXWzC6SnXlr+tkGOYJ5HlEkhq5o1jMTAYzcc0po1hyeBlIW5tlJmcIF
 khlIZxzsWd78+oy4x8s7u+Z4iKn/7NlPQVMSj7pNG0zDgtQK64lzxvtcU Q==;
X-CSE-ConnectionGUID: dlx2uYgiQgi1Wqc53tupow==
X-CSE-MsgGUID: kZ3ye8l2QnOzkCM/WL/RUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="81569988"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="81569988"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 12:13:12 -0800
X-CSE-ConnectionGUID: JKN6xkJ5TAm+MEGYYH//rg==
X-CSE-MsgGUID: OCRC3GDgQAOekfZJWaoliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; d="scan'208";a="211974177"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2026 12:13:12 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 12:13:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 23 Jan 2026 12:13:11 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 23 Jan 2026 12:13:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjHhFU1SaMLOcGo8viOXzitdmYw8UHhDcpR9crD5rHLf124We2scMimvsA2BiyAvK8rMLD+fSkY0s7nkqSyKUY8bhIOiLtoN5jAuY3Noe4S0zQHtIoVFiL+up2OO2V4b258eJAwW0R39GTByHdEdfdE6sldiKve1pg/K2XRiHCgJKd8I/eWElt0D7itA4dGeR0/7eLu6ZnuMUHkIxz+9NapjbV10NGc+B/RZ2sED88Zs3/5GLjMJ25jtRNMNcWe+oil+o5KclMmuQx5u6YiCnTaWDe/BLMJDZndTu+BdrQMAbZZ/9CfQP8cAZcgiOLkQNMjkDw4S5fLH8D9MSbkrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/ROX7uln9eg+V00a3BSuJDfqyTEdAcNkEXa3JVEhlA=;
 b=hBfzuZTSH0TTAtSkxip2BtzzhFcU89sS6CYwTow5AiM7lJkblT/kRKwPLEJ6hJRE0hVO4anBJRHfA0gd4a1Y6+lGc2YeyoDirnf8J09hmR5CApabZPKG9UMnhtgrR5Se3vVbhLpqYFr0/qKkNQ7YeG+Nx+tpaXJviQ1qOAJc+hOw3HfQEWYXLsrWLjOr+IXMAMh22FBvAMYdGwlqZZKAhZXWo9clD1SoLGOogwcPDQ2r9qY7VbWk/yl2IwKc9ZYg71B3LwavpLbfUSceK6J9G3nqJVbrT/n0s/+KVT+yETHEw2z7wv5B9iBkIkPM30abGqr60/H5qMCtqy3mt6w2jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 20:13:08 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 20:13:08 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "broonie@kernel.org"
 <broonie@kernel.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Souza, 
 Jose" <jose.souza@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
Subject: Re: Mail problems for Lucas De Marchi?
Thread-Topic: Mail problems for Lucas De Marchi?
Thread-Index: AQHcjH46dqtjT6n8CUaWhLY9SILSBrVf7E4AgAAOee+AAACiAIAANPkA
Date: Fri, 23 Jan 2026 20:13:07 +0000
Message-ID: <ca24e8a12732720302823d1571e217017e5744c4.camel@intel.com>
References: <3135e2fd-fdac-469c-be2e-6c1cb024883f@sirena.org.uk>
 <8542127c23736029c476033bc933e12503bc3fd3.camel@intel.com>
 <CYYPR11MB8430903D2AE8BDD782B59B128B94A@CYYPR11MB8430.namprd11.prod.outlook.com>
 <2919dcfb-68ec-46e4-858a-08a0d42c27ff@sirena.org.uk>
In-Reply-To: <2919dcfb-68ec-46e4-858a-08a0d42c27ff@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.2 (3.56.2-2.fc42) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SA1PR11MB8320:EE_
x-ms-office365-filtering-correlation-id: f7b3fced-cc66-4b06-a8cc-08de5abbd31d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?N05LbFh3SVhwVzl0aWNTaE9yeVdOQlJDZ0RTdzhLUE1JOGdVMGZmR0Zza2pY?=
 =?utf-8?B?M2swbHI1NDh3UUxhT2wvZkI3dVpzUGd4cEc0T2NHNjVTUDlkd080cjY4a01i?=
 =?utf-8?B?dHFXeUJ5WkQ1eEIxL2lWVzM0LzZtRjRWV2NKSU5ZZzI1UzUvTVRlTDBsdXVJ?=
 =?utf-8?B?VGhOR1pERmNEVkpxSk9iZE82TCtaTXZveGNsMzRxZUlxUUlZcjFoTENIOFMr?=
 =?utf-8?B?RWJIbVRwc3ZSWldtdTN2NXR6eUxqcnJHeFpNcGhOMEc5YXRzUHphYjJ5enNu?=
 =?utf-8?B?U21FLzBYcVpHMVpWNUM2TW9jdFFmcWdLTytIcVZBL1BLVTVIZ0FNaHA1UkpS?=
 =?utf-8?B?d2YxRUw3cTN0K1FhQWZoVmVEaXFhWG9rTG1ENXZoQnFySE1EL2NxMTVXT0xR?=
 =?utf-8?B?bCtIcDBtRE54WEY2aGoyQkVVemZNRDFpc2xOQW1ieDVYQmtjMXkrd3M5NEJM?=
 =?utf-8?B?MHBWMERlS3lsRS9xK2wyNVA3ekdMWGp2QUdHS1lMOWVhMDZ4Y0tGWmYxNElT?=
 =?utf-8?B?QVQwVXdXU3ExM2R1aUVsSXdlS0pzZjdyd3htS0Z5UU5EM3JnbnN5MlE5RmRh?=
 =?utf-8?B?YWxWVXkvYzF0WU1PWnIrU3B2SGhHbEZlWVA5azhnQVJFaGFNbm9ZeHBqU01x?=
 =?utf-8?B?V3M3NzREQnVDNkNQRGUvcTF0RldMandnMC9JQUlrRG5hSkdtazJQL09iOVFQ?=
 =?utf-8?B?d0w1WWZQd1lwWDF3R2hzU0Fyb01SZFp3Unk1bXhOU1JvakhWU29hYlVjazJp?=
 =?utf-8?B?ZjZkMVo3MlVOWSsxOU9ydk1MeE50b245ZXhVUzE1bEZsRCtCaWp3ZFhReVUx?=
 =?utf-8?B?Z2pST3dYR0xGdHlYM21LOWN5TXNlOHp4K29HRGZjcmozc0tHZmFWQ09KVmpT?=
 =?utf-8?B?Ync4dlM2VkZJTHl6bFdVVzhlaXNXMUhKV1RxKzdaMEpVcDJ0V084aEszOGZT?=
 =?utf-8?B?U3FFNGdyOEJnamU2UDBnaU9YNmhrakliNHdNdHhhNnVhcXlhdW5LTnpyUCtn?=
 =?utf-8?B?ajZBQ21IRVQyd09NNm1mS25LZ0FiTjhEWStLNUo3b1pwdUpnc2h1cGxIdEJW?=
 =?utf-8?B?eXROTjF6RmFWRG80QnNWR2llYlErTjBKNkJTQTU4OTBpSGhnNUVLZ3lMODZJ?=
 =?utf-8?B?a29oWlVpNmVSQlFlaG51dXdPYytWVEZ5NU85WTIxNUlyWUV0YXduQ3MzYkds?=
 =?utf-8?B?ckJyVVpoYm1zZUJxKzhYeGNSWmg4aG5LYnhpd0lmWVFSMFlEYkQrS0kySytj?=
 =?utf-8?B?QlE4My9OaEpJMjZzVzlYaDJtMGs0YmxVWXEwWHV5alAyaVVGNVFpOWVSaVpT?=
 =?utf-8?B?ZklBbmF3aXVNdE9zQk1kZ1lxelFMd0RwUVJ4dTFaLzIxajJ6UmRGalVXdDgr?=
 =?utf-8?B?Qlo2SjJjd0ZHQ1lEMXZXc0RrNFBGbVl1RUpDSzFQWW1OWU01bHlodTVNelda?=
 =?utf-8?B?M2FHVS9vQ3lSZUNTYVorei9CRkFmT0MxRnZDbld5Z2xNNEdTQ0hseGx2Snlt?=
 =?utf-8?B?cGMzb2RHUWRtRzRXVHh2NW9aRFcxR0tMQ0hTRm5TSDBreUlyakZDY1FSZ2FY?=
 =?utf-8?B?aVNhdW5xbVNRZzcyUUNuUDJtUGVEVlFQZVVLRmZwWFd4a0V3cFdUTkNSV3dU?=
 =?utf-8?B?N0dnVjl3V1NPR1lLMk9zbkVYMm5mKzFKdGc3L1NXK2xTTGE0RWNlbVA5Snps?=
 =?utf-8?B?SFdQbEVqdDVuQWRmbWJ0Qjc1ZGVDTy9UQ2xOMW05cDcvSHhldWpRMzBIMm9h?=
 =?utf-8?B?STl3Z2UyM0c3dWdWbWZwdUR1TDFQMDl3ekZnVXRtcVkrY2VRZnVvV2xlS0Nl?=
 =?utf-8?B?UGErbXBLY2thcHpkQktTM0ZGQzVmYlg2L1dFRzY3TjB0a21ZTEtSMzNMbE4z?=
 =?utf-8?B?ajRTMWNjaHZlUTQ0WlRPNWZnazJkODBBQ3p2UjJJcEtLemR2TU9lNVFzQTBV?=
 =?utf-8?B?S1pNZUN3dml5NjZBRXp5WDlwc2ZGQWJmbXZrdFNQUk44MytlaHc2VklsWC9r?=
 =?utf-8?B?MENkQzlYcGMydUhoekJzcy91TFNVL0MxS2hxNG50M29mT2s1RHdhMzdFNDRT?=
 =?utf-8?B?RG9vbHR5bEQ5WGdrSktPZ1pXRCtmY3Fldk1zUzFtUER3RHVwR0NaVFY3RzZ6?=
 =?utf-8?B?QlN4QXpFWWZRZkdSSnJ3S0taTHkvTmVRMjl3aFRsSno1QzRGSHNDd2dPSHJi?=
 =?utf-8?Q?GFZbkgBXsJDjXngW+EjyEWY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rkc2VnVCUHg4QjdoeHF3V000VmpTdFdFQXdtUy83T2h1TkJXRW9mTXdyWWlX?=
 =?utf-8?B?MHh1K2IxdzZaVEk3U0VoM2l6WnVleFRIL1hQS25WcCs0SHZONjcwK1oxMElu?=
 =?utf-8?B?dVhTYkpXSGtpNGkwSHRpUFlYeVoxSEVxMXRKVForUEl3RzF5RlhRQ2FUb3BY?=
 =?utf-8?B?UFNpNFpybWI0Wm5BMWdQTmpJc0lTVktmYk80T0pyNzZzeW9ZOTdkalRRZzZo?=
 =?utf-8?B?NzcwdUcyeVpYZGRNZ0Zock13cjVha25QS3ZMUWI4ckNzVVZxNWM1K3VDSzdO?=
 =?utf-8?B?Yy9aQ0MvRnhPL0ZxRDRQWm5HaXk2eDF0b200NTlNUExMYnBBOEtldjU1OHZj?=
 =?utf-8?B?S3VPeGFGeFgvSDIyNjlqR041dHozU2xrTTI3MWZEL3NqZjBwMHh3eFN4dGVh?=
 =?utf-8?B?QzhpR1hDcmU1UC9iVGZ2QzU1cnRSSGR3ZGxOeFNHT2VER0lIT0V0NEFxVzNV?=
 =?utf-8?B?WDB3TC9mT1ZXYU5pOHVBZFRjUm1WTnVZTWZhSFI3S3J2bFpkeVhRTTB1WnJ4?=
 =?utf-8?B?WmxjTHRkZ0p2azlWOFZ5bElMd0IzNWMzcE5KUzZPcWczSzJaMTNSTjNGbk4z?=
 =?utf-8?B?c1VNbUZjWHlWSng5c1lxU2U2ZkJrMURjeDVveUFmMlAyWUFoWXgxU3kwU0tv?=
 =?utf-8?B?SjNyQmF0ZThoNkJ0bTFKdzVpUVJnWVd3STV2UUk3OTgwNml2UG9SRTJ6L00y?=
 =?utf-8?B?N1Q5NVEwOGZUQUZSWXFRMWFtbmRyaUNucE1MaVlvSW5vbW9TTzN4VFM5VWk5?=
 =?utf-8?B?aHdwdmlhUlpoSXBJMXVnS3JoODR3T0NhMmJQUE9hSDVsZnZjVVVYaU5pSTRQ?=
 =?utf-8?B?UGU3WG92K201c1I1bTIvSDFLV3JmY0tQMmxrOEhERkJzMHN5cUt5aVRrM3dz?=
 =?utf-8?B?SUJaTUNBT294aTI1Z0lHMmF0R3lPWDVpOWVGeTJ2Y2FITnYzL1dRZWlTcXEy?=
 =?utf-8?B?V1RWR1ROVHZBaVRiT3JKYTVJeDBlaHAzVW0rWkdOcWRMMXBGZjA4YkJHK0lD?=
 =?utf-8?B?NjNFcHpjNG5MSFVtSkxqVThoVU5uMDNkY1NzTEdMN0RQc3NNOGxiUGdiUFBU?=
 =?utf-8?B?bmgrZUU4UXBseGNOVmd6UjUxbjF0dDFBOGc5TUV3TUVuaHQrM1VrUGorMkhI?=
 =?utf-8?B?Yjc1MjV3WTF5bGhnS0JoYTJjQTdUM1JFM1dNSXBtZ3hzT01MMmlsRXJ4d0VX?=
 =?utf-8?B?aUcxOXZoeUVyOHRsNXEyalZ3dllRVkFYL1VENWpBUmwzWHo5OHo2RmZWNWxC?=
 =?utf-8?B?b09rd2g0VTdZSXN3M0t6TUhPd1E5T1p1SmgrSkt5dUIzd1V0NXZQcWVRa21a?=
 =?utf-8?B?and2ODJoelNXUjBaM0lTbGxkRkZyZ0lqTWp6OHp6Zkw1NTBVajI5UmpzcXVK?=
 =?utf-8?B?WC9tZDBKdG84TmdTRGQvSkt1dFNBREpER1pTL0ROZnJoMFFDUVpuSmRadWls?=
 =?utf-8?B?eGtkczBHZ3d1YVd1ZzQ2WGk0bzRQVmU2cjVtZTZYei9VbDVQR0R4K25VUzFL?=
 =?utf-8?B?Q3Voa25RaEFIWmdCV3hwQjJVOXlGb0loRU5YSzNoZGhSNHJEWTJ2M1N6c0p1?=
 =?utf-8?B?RzUyaG1RWVhCaThIQ2k3a2V2bUVvRDN1QkdhWm1hbTB6TXMyNWFCUnRlem5j?=
 =?utf-8?B?Z2syWEcrUTlNQ0Rjemw5UnEzQXNPazM2ZFRqNGFsU0Q3a3pJKzkyMkdMYXNu?=
 =?utf-8?B?Nm1qb1hVR1ZGcGpQcTE2NjFLQWZSUzJ4MEhoMGUxNG9iN3I3NzJoLzNHU3VJ?=
 =?utf-8?B?NXNYYUxNOVlDSWRqbURxSEhYZkVjUFR3Z0F4STdNTlFRZGpDaC9zd1hGZ3k5?=
 =?utf-8?B?STZUalhRMmtBb2JiZWRoeExITURURDdFSkxvelZlNmlvRG9LTnc3RXdSQkwr?=
 =?utf-8?B?L0V4KytFQ3l6NHpXeW1hUHFWeUNOdmdiNGcrN2F3M2UvK0REdmdaS0lQV3J2?=
 =?utf-8?B?Z1ROYUs5RGVCNlNOeTVGTlRMSU1mTkw5b01SSzNSZFFaVmtBUmtnS1FqcnVv?=
 =?utf-8?B?ODN2TDI0aDl1WmpEaEpPMGM0azE0TExmZlpWdzR2Y1BoVytEb3lINnZORURK?=
 =?utf-8?B?K1N5bnF1ZG5FVTdwcWVMNjA1cm9yUnJUd1dWSWxnWGl4a0pRVkdyUHBhR1Bi?=
 =?utf-8?B?TzRXd2cya21KVkkvK2ZZZVhUMURpaE5pYktHU3FyZ3pzUG0xVEZXSDQ5MXpy?=
 =?utf-8?B?SWRFRFIwSjczVnJ1NUhoQ2svaVpaT0FIWUQ4eVZGVEFtZWRsUmlVcmtGZUxp?=
 =?utf-8?B?SXdSb3FiMzJXVGFZb3lLMERQRU12MXlxb1RJaTNoZUVpZVFlaU1kSTUxeWxJ?=
 =?utf-8?B?MkxXbXYyY2JIbHQ2WjYrUTJpVnRqTENYdzZWODVtN2tBd1BLRlg0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76336950B5360841BEC5BDD21153BB11@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b3fced-cc66-4b06-a8cc-08de5abbd31d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 20:13:08.0328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7n4MGFrvUrVyPFz+oiFcXs6OX8k5ebKV/1q9TgfW65oW3ak13DqCvri9KobcuYV/SeIVnjaJOVM6u/mqXn/sDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
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

T24gRnJpLCAyMDI2LTAxLTIzIGF0IDE3OjAzICswMDAwLCBNYXJrIEJyb3duIHdyb3RlOg0KPiBP
biBGcmksIEphbiAyMywgMjAyNiBhdCAwNTowMToyOFBNICswMDAwLCBWaXZpLCBSb2RyaWdvIHdy
b3RlOg0KPiANCj4gPiBDb21taXQgYWE4MjI1ZDRlZTg3ICgiTUFJTlRBSU5FUlM6IFJlbW92ZSBt
eXNlbGYgZnJvbSB4ZQ0KPiA+IG1haW50YWluZXJzIikgYWRkcmVzcyB0aGF0DQo+IA0KPiBJZiB0
aGlzIGhhcHBlbnMgaW4gZnV0dXJlIHBsZWFzZSByZW1lbWJlciB0byBhbHNvIHVwZGF0ZSBsaW51
eC1uZXh0LA0KPiB3ZSd2ZSBnb3QgYSBzZXBhcmF0ZSBsaXN0IG9mIGNvbnRhY3RzIGZvciB0aGUg
dmFyaW91cyB0cmVlcyB3ZSBtZXJnZS4NCg0KSSBjb3VsZCBzd2VhciB0aGF0IGRybS14ZS1uZXh0
IHdhcyBmZWVkaW5nIGxpbnV4LW5leHQgYWxyZWFkeSwgb3INCnBlcmhhcHMgZHJtLW5leHQ/DQoN
CklzIGRybS1pbnRlbC1uZXh0IGZlZWRpbmcgaXQ/DQoNCg0K
