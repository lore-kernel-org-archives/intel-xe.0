Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD7AE9A047
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 15:58:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A12C510E085;
	Wed, 18 Feb 2026 15:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8XIp7NY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BC110E085
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 15:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771430314; x=1802966314;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=fj0MmHanPDrbZTX0W+mrNPyGt5+S9NM6kj8ryfge5Zs=;
 b=Q8XIp7NYfmVV9CqznsCIMA/qo3cEKglFJf8OgGw1Y+5U3+TJkAeDLvKq
 ElU1eGhVwQsSwASPFekx9Q4EUbhXailSXOirX7Zpw5+7eUXBzgJ/Zzycv
 9nBeqilRxeY6VrC4mXYP7qlzx03IxtloV8ILSZkqLoDI+YVMqKVpQCA+q
 RPuddip7So/Y7WkwkiKMzOg5lt+JasGD19Bm8vfN4anaqDu93+Lt6wLRv
 CJQqLmWCtRPUcQ4SdvNFOl9fkr6sCVo35SljxUMsyZyPOauRaWxMvjB0+
 sJVx4565xpwG1NOwXON4JGLj0hIMrAacah4JsEHNUEtkLa1ZEXxSo79DI A==;
X-CSE-ConnectionGUID: lVt30Q05QKKoPjPdZKgVwg==
X-CSE-MsgGUID: 3mn7c2xCTky1TsuG/6ZOxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72686476"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72686476"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:58:34 -0800
X-CSE-ConnectionGUID: pvajQrBMSYyhsvZK6KQs3w==
X-CSE-MsgGUID: HOwS1vKzRdK4cig2y3u3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="214227897"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 07:58:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 07:58:33 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 07:58:33 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 07:58:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLzLcir5XVHGrPu9lmQkLIpl3SwmWJzxzk9Yi/UMBiw4JFO3uB/Y2LxOre/Ir1WhgGa+bXBbzIhOqfdPDkV9iY+EolcM5usTgBuNlGatz3fX0+z7XSuHB/fW4CNNTTkt7wCMB9oENtgc1zXEt81Sn1WXMYDz5Wl9PUl2ehSsM9ogQhuNTCxRglpV79okUQa+goP3Sk5Ozm3fmf9GYxVTDePd0vjAznJpMmqSlzqeLXkSEgMzJiPn19vuS1oKyNNArqYRlAqW8rlXUmrdD2XCA5OZamuB1B0ydfdNQ37W1ESu6yE/d3iuASvNN70NJ7R5BO2pHaBnKl7WE0iP3BmmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Cm9iYKbChqvCNnt0YwcibVIERlxGHnPDNRUOaqHekc=;
 b=Z48p8b2fH6t02mglDaAxxIldWy5Ij5+wX0YxdSZcKgI3FV2HAHmZtNnhfyrOFcrKmjBEPAGBq+SZ+j2X6BOjAAWsjZKrQhsRoQsnqdOWD1h6V4UgBiMmnELsRB/+NHe7ukYjs22Wo+K8feHwyXKKEisWGnNnVOJzwpr2mVsQqqvTeIN4o4tPmVQCzNsJWIGvjlstEXncElyKdt91W476X16uL5DQpdkYkueI3/N0VO6+tAM6BRqdq8dpJXvSUySYkqvJIucCt7bXSDjXvUCX/C7O38vkGYEeUQc90dgOKZeRyBhjmfVEiV96p8b0UpUG6zyzM9O/UmrF2F7/r/o89g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW3PR11MB4713.namprd11.prod.outlook.com (2603:10b6:303:2f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 15:58:28 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 15:58:28 +0000
Date: Wed, 18 Feb 2026 10:58:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v2] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <aZXhoXWY8tDl63Lw@intel.com>
References: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW3PR11MB4713:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d6b87cb-6c88-4c93-b459-08de6f068e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bFh3c2QrMWNZZ1E4bUV6M1BMY1dBMHdHZXlQVys1ME0xeGpWWWVCU0FkbUNi?=
 =?utf-8?B?SHdjdGJOYTVMeXJDUnpZQWFlMitTTDdxS1lWcGJ6VmF3ZVpqS1ZmcFhReWov?=
 =?utf-8?B?dDBUMTZNSVlheldYOUhMempTT0dqNlE3dTVpUGF6aHlQNm56ZnVweVpkNldZ?=
 =?utf-8?B?MEplcFk0KzJSVDJZcDZnSG5GUEtIMmRZNU16SWh5ZTdJT1VEMFluVW5iT0lT?=
 =?utf-8?B?anpCSGRhWEEyRSsxaE5mMW1TaXVmSS9mVVhyZ05rWnoyVHdEazR2a29mL2c0?=
 =?utf-8?B?dW4rYkwzSkNQNlk4cGk0b0hycnBtRHJyRFMxTVJpRlNPaW03UWM4MUxSZG5T?=
 =?utf-8?B?RlFUcytFVmpaWGZuamNqai82a1JrMy83dkV4SUxRZFRWWXF0bmwxOVlocFRL?=
 =?utf-8?B?QS9nU0ZSVGxDWVBqWjlodWlpZm9Mb1ZvWkcxbC96K2VsVkliODF3aEVOQTVt?=
 =?utf-8?B?b1RDSGNLUWNvQk1jOElzVUY3OTBuSXd5Q0E5Z09VT0RjZVo5aUZQQ2w0NkR2?=
 =?utf-8?B?Uk1teGZyZnFkOHBkbVpheXpEa2NkKzAwanlneEdwVHNkRWRjTDcvTCsvcjc4?=
 =?utf-8?B?bFkzNk9kVEhDSDRVb3A0WFljVThsMnFOU29PaFk4QnRZQVcybGlMY1BGajlu?=
 =?utf-8?B?ZFA5dGR4NitWUFhOR2s0SjU5U1pOeXBQaVd5aTJZc0xnSGpqZUJsdE5yT0hY?=
 =?utf-8?B?dldWRTdybE5vYVRuUmQrU21oM092c2U4d1dHdGNValhOZnNHZkRGdlFLdWRq?=
 =?utf-8?B?K1lyQUcxLzRzdE9FVVk2NVVyRlluU1RpTWxoM1haSnhiNXNReEthZE92Rzk1?=
 =?utf-8?B?STNPQ1JacXRqSVpkWUw5SnJ3V0tWakZhdDhoMGtwd2VPajN3RnNXc1laWFNG?=
 =?utf-8?B?VjV2Sm9tMno5ekZZNklCdW1qLzcva1FQZjFtdjZFRFVkcjE4ZFlRc1dBcUh4?=
 =?utf-8?B?dCtPRklVeUVEdmdJVUtYR3JsdlFBT1BzUTBDWnNjaGRZYVo4Ti82QkZ0Ym84?=
 =?utf-8?B?UlhLNmZob0E2bTlCRTlXWEs2L3MzK25wT2F6blBWQXl1MGgxS3BjdkREOWIz?=
 =?utf-8?B?bHN5SzIxY0tIV0J2Y1ZxaTJQaVlTS2lDNFVWRW45ZHRUYVB1NGZ4aWZvWXNi?=
 =?utf-8?B?Yk5HM3NhUnVDcjZrNmxHdzdlM0k3NGFQOVV0eVpIOWkyWVZkWHlYQ1Rka2x6?=
 =?utf-8?B?RUVYdEhUR2FjNUE0aStSbTNqc24za3RzTVZWSzgxRWx4bTF3OC9qMkdhTTZD?=
 =?utf-8?B?QkQ0cGVzanByK3hhdGYvUFY2eGVGZ0xJcHlZaXZud0FOaTJ6Ymk0N21pbUpN?=
 =?utf-8?B?cXNwV0RhVE51TG1WNTFtTnlmc2QzMTg0OU1FZ3E2bUdjL3RFMnV1MncxUXh6?=
 =?utf-8?B?ZGxzOTBCYUFJc0U3ODdrM0E1RkQyK1VnUjQwT3JoaTNyV0ZaTGN1UCszZ2J2?=
 =?utf-8?B?emZRNklwd2NORG1maEFHQkV6VTZ6a1ZHa0NCQmRLTldJaFdYSjFHb3FNMVN6?=
 =?utf-8?B?ZmN6S2lmbExRUks0dUtpMVlKN25tWmJnME9iY0tkV0lFb0xOZ1pIbFZadE9G?=
 =?utf-8?B?b1BVL2pJTGptV0lJcmtVdUdNcCtQS3JHdEtxczVaYmZMZ0Y0YTBKRVlNTENH?=
 =?utf-8?B?SkZOZTdvM1dqVE5XcGpOa0RkQk83S1pSSFVtdHZIODV5dnFBY2FqcGE5N3ZD?=
 =?utf-8?B?VzU5WFp5REY1azRCcUZFelZPSm50M2NRYU9JUGx0Vmd6UG5VWGNKZkhhL1k2?=
 =?utf-8?B?NEZCRWVjM0ZaYkp1ZDhlZzNBV1dDWXVGcTZzV01oRnI1WVdXTFE3MUxGWHJN?=
 =?utf-8?B?YnlOM0hGeHlmU1lwMGpBSlMyS240Qk1Ea1lnc2x1ZlFPWjhYcDVjdjF1SVZO?=
 =?utf-8?B?bWh1VmJ2QnNxZUF3MEFjSHlwR0p6aDRqNzk4OWFIR2lqcjBPKzd5S0l5OUpi?=
 =?utf-8?B?Ykhwb3RJRjJwdDY4V2NVTlFaSHdLSTloNnRBbmg5R0M1WEpTU1FsMkE0Mm1M?=
 =?utf-8?B?QVZvbTZybUpTQmJheFppdDhZaG5ZdHFCVEhqZTFpZDVNSWIvc2RmNldpRU15?=
 =?utf-8?B?Mmh3K2tYUWIvcWlGd3krOG5zRFFQTG5PSkhyUkRhaFNsbXpDQ3Z4NVZSMFNi?=
 =?utf-8?Q?aXNI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SVF2bC9TTHZoVEg3ZjhBYzFjOXBjUk1oaE5ETjlTVVdCNVZTWTMxa1BUL0pw?=
 =?utf-8?B?NWM1VnF5YTBsOFdVTUQ2a0J5THFMdmVzMGJxZ0ZyR3ZLYVErdDdMOHlPa2Nj?=
 =?utf-8?B?VmJwQmxVUDRycm5ZbVlBRUxpVUhYZjZwN1dzcVBqTS9uR1BEaGwzaURTNHdL?=
 =?utf-8?B?SjYxaGFUVGdjSmQrNHFsSER6UjJhTXptdnRTL2tuS0RkU0NoRzZ2RGYzbklI?=
 =?utf-8?B?S0U4RFg0OXRCK3htNlpLbWVNVFZiM1NpNTlmQ0dYS2NZKzZQcDJzUGMxTFJR?=
 =?utf-8?B?RkdkR0pBWnd4N3JmOFlhWU0yOVNqakRldWxsZzl6MlpYT3BXejBzaDIvMEk4?=
 =?utf-8?B?UHJySitnL2tyVHRVM3BYRThlMDgycXNvb281QTZNWk15ME1wTDk2aWdtMjlk?=
 =?utf-8?B?WlpQWjFJVnc2QkdaZ2tLQVVKZDU5NGVHLzEvT2oyVlU4Tlg1eEw4R3Z3aWI1?=
 =?utf-8?B?ekNtaEhMV0h4N1c4aEFBb1FNZ3lFcTczbDNJM045K2pYY0lTckcyaW10cjJx?=
 =?utf-8?B?YnVkWXhLZC85TENtekdNdEI0R1pyVFQ0YncyQ3FSeFZuajBWTmJhcE9mZnlN?=
 =?utf-8?B?WC9YT2daM0l1MzV5RzA4b2NYYU14d2tWZXdPc2pUdGJOME4vaXRZUk9tRFRW?=
 =?utf-8?B?VlN5QkxtQ0tEZGhrZDB1aWFpK1I0eXZzNUdqcmw2SmRHa1BoV1lPc1dTcXc3?=
 =?utf-8?B?ZmtWM0FhYlRLNDlMNndDWnhoeDNPUWZMbFJPa1hlTjZrejhXMDJqVFZ3VHJp?=
 =?utf-8?B?UWcraElzaUliWm82cndnNmxkb1FqeDFOQVJkaXlJVVRTRnhNTzQzckNIVTJP?=
 =?utf-8?B?dkxUOGZrTUlNVThoazNySFZnL0xQZDZUVzVlM1dIYUNvZkxsMjBDazhkSzEv?=
 =?utf-8?B?N0VMblo3cmJNNGgyUERCeit2b3Fyb1lRM3dXM2NDWmlURFRiN3ZoSjJVRjRp?=
 =?utf-8?B?dXZCdTVGV0hsbmNDbjJIWmdmQ3VWWTlmZm1xeU5jMEo3OXBNTkppZml1S2pz?=
 =?utf-8?B?VXgxVXhDNHZVSG0xUWY0UTZtN0NnVHpydk5JWlJHeFhSRXFybHU2Y3JLSGto?=
 =?utf-8?B?d0toNVdaNUlPdHN0UTVZcmczL3R5SzhMS0pJS0hqWkRvMDMwbVZkMitVUTRL?=
 =?utf-8?B?NlVXdVlIdTdZcFhyZTV0eFhoVXB6bk5rT1dhMk1xaWZXME40ZlVMNkcxQ0Z0?=
 =?utf-8?B?QlhxZzhHSDNPdEMyQWZoY2RTc3R1V1E0UWZNcWo3ZXhIUk1FWFdnVjBMbDVR?=
 =?utf-8?B?eTVSVU5JcVVaZWY2bHpwSjJZdnBMNElhOUFGQ2pNTHZXOEM5MjJuK2tiQm02?=
 =?utf-8?B?cTRBUHAyejQ2VU9PcFhQMVBsN0FFR210WmpucjVPMzN6ZHlKOWkwUmFZSmJ1?=
 =?utf-8?B?WkxPbERTWU1MdGZCYUJrdVBwdTA2b3l0S0ZjOG1UQnhxczZhY1BEUWtuaGNi?=
 =?utf-8?B?N0xrRGtPRDF2Zm45RW1vVVE3bkFBYlp4VXdoc3lYUjlUbnlyNTQ5OVlGQkZK?=
 =?utf-8?B?ejRoMVlHcGp2cWVMZ0FqTm0zZUNDdnFlTlA4VHVjOE01V2dZQkk5UmlVcDRn?=
 =?utf-8?B?eExoSXhRV2IvUEkvNHBmOGRoQ0d0ZGx1WEdpMlBGazlVVm9EeTB6ZUpMaWZq?=
 =?utf-8?B?RCtvZUIycDJiR0F4akJPWnlNNFM0VnJkTld6VWxBV2l5VUJQMHh1L09TZFh4?=
 =?utf-8?B?NUE5dXYxTWtNRitSUjUxWHdLKzBDbllvbXdTMU1rK3BmNWhzdENHcXZtK0xa?=
 =?utf-8?B?bWRCdjlFVzhpempIcGFTNDRRcUF5d3JNY2RmKzA2R3RpOEJUMEZFYldxRkVo?=
 =?utf-8?B?aGU0SXMweSttTER2WHpCazUxUFUrYmJKcDFTZk1sR2Vxa1JDUWJDdHJhbXJU?=
 =?utf-8?B?WG1EWFpGdldsd3pSUTM2cmVBUlJPKzZYTVlSOXFDUXROaVliRCtnUFVhWEI2?=
 =?utf-8?B?UXZqMm4yMWdDTlQ1cHBsVDhZcFo4aE1raGxOMXhldmFzWW1vREgvbDVuVlNh?=
 =?utf-8?B?ekxtbnJMbUVVRExrOE94L3ZKZE5Zak9HanNzU2djMElhaGVqTGk3RHFna2lh?=
 =?utf-8?B?YVYyVUhrbW5FNGxtNHZBTVRVVlppeFJGUDJtc1BLZFg0dGJlbDRMWXNzREFO?=
 =?utf-8?B?Q3phemtXbzJZb2xZTW4rODM5eHdicnJMNWxWUFJnRkdEUlVVZWZBTlRQYUxo?=
 =?utf-8?B?MzN2VG5UNkRQb2VWaWhCTEZSaWkzMm1MWi9JZ0hnaTlrZWRTbmxPQlczeGk0?=
 =?utf-8?B?dFlYdkR5VUxRczB3V3RIZGN0SVJOQVZqZGNMekpOQnM0aXUwdW9qRlJMZVU2?=
 =?utf-8?B?OUdZVFRwM0JhMURaU0cwRTBJbGtib2x4UG1DdXRQUm96VzN2a1RSQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6b87cb-6c88-4c93-b459-08de6f068e3d
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 15:58:28.2731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LeA4/+MDy6m4nvfodoQSJSSQrx2YAe/nZRcXivuU11bPZB/GhVJHg1yID5dub6eCfQRLj6jz4UlHr3aUrJ9/IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4713
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

On Tue, Feb 17, 2026 at 10:34:28AM +0200, Lionel Landwerlin wrote:
> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> people have decided to not rely on putting the register on the
> allowlist for UMD to program and instead have context/queue creation
> flag.

Again, please change this to something like:

Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
that instead of whitelisting the entire register, it restricts
access to only the needed bit when requested.

> 
> This is a recommended tuning setting for both gen12 and Xe_HP
> platforms.
> 
> If a render queue is created with
> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> be programmed at initialization to enable the render color cache to
> key with BTP+BTI (binding table pool + binding table entry) instead of
> just BTI (binding table entry). This enables the UMD to avoid emitting
> render-target-cache-flush + stall-at-pixel-scoreboard every time a
> binding table entry pointing to a render target is changed.
> 
> Bspec: 73993, 73994, 72161, 31870, 68331
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 18 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>  drivers/gpu/drm/xe/xe_query.c            |  2 ++
>  include/uapi/drm/xe_drm.h                |  8 ++++++++
>  7 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index a375ffd666ba2..80a438e51419f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -178,6 +178,7 @@
>  
>  #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>  #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4a..d3168353fcaaf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>  		flags |= XE_LRC_CREATE_USER_CTX;
>  
> +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
> +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
> +
>  	err = q->ops->init(q);
>  	if (err)
>  		return err;
> @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> +		return -EOPNOTSUPP;
> +
> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -862,6 +876,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>  							exec_queue_set_multi_queue_priority,
> +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
>  };
>  
>  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> @@ -946,7 +961,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa5..f4f72d01eb8c8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  /* for migration (kernel copy, clear, bind) jobs */
>  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
> +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 38f648b98868d..a962ac2bb7ca2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -14,6 +14,7 @@
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_gfx_state_commands.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -1447,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
>  	u32 arb_enable;
> +	u32 state_cache_perf_fix[3];
>  	u32 bo_flags;
>  	int err;
>  
> @@ -1579,6 +1581,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>  
> +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> +	}
> +
>  	map = __xe_lrc_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c307a3fd9ea28..083a2167aeef8 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>  #define XE_LRC_CREATE_RUNALONE		BIT(0)
>  #define XE_LRC_CREATE_PXP		BIT(1)
>  #define XE_LRC_CREATE_USER_CTX		BIT(2)
> +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723fa..5927eaf792efe 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c9e70f78e7238..856838fcadd89 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>   *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>   *      This is exposed only on Xe2+.
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX - Flag is set
> + *      if a queue can be creaed with
> + *      %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX	(1 << 4)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1279,6 +1283,9 @@ struct drm_xe_vm_bind {
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>   *    priority within the multi-queue group. Current valid priority values are 0–2
>   *    (default is 1), with higher values indicating higher priority.
> + *  - %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX - Set the queue to
> + *    enable render color cache keying on BTP+BTI instead of just BTI
> + *    (only valid for render queues).
>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1323,6 +1330,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 
