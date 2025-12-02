Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85BAD1267F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Dec 2025 23:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6519D10E5C8;
	Tue,  2 Dec 2025 23:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FZRPjAQE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425F310E5C8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Dec 2025 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764719142; x=1796255142;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yB7Zoc+KUAXnyRocUsBOsm/MobuZK6vQL/pWoUh0PaI=;
 b=FZRPjAQEZShhgGDNc7cvgrW801zuvW6r5UJZvnyrO3uWzWuwGnELuoUZ
 3ZarQHVGbpiINVLxblp4+REFxMP6lubqQZdpXeP9w0MxXilE8LzOBwyM4
 GZbt5n4S533q/MheNfx/QrEFdw6w9iS0gDT7IBOvPD556S8asgzQd/7KG
 Evc4zByJqFsOGa7MYFRkLY6U6696j4xkRhIZjrI6wE0obOjiBcnC8QYX+
 J4o35mha+kJ66QmNIm1hXswoI6FJ0XzPvKnTws8rfr3twlvSfofyUo46/
 CZZbqH82FBi3LTVRVYinIuZyC1GG5EMcsx9r48Oa0n0MfYURH9I7IvSGE w==;
X-CSE-ConnectionGUID: 9+GOSjrUSqejQDN/o8Cgug==
X-CSE-MsgGUID: jVuGGCH3T26pyaaFsubOjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66869571"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="66869571"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 15:45:37 -0800
X-CSE-ConnectionGUID: 4B1YUAiGTta2PRMw3zZ37Q==
X-CSE-MsgGUID: ZX6PmxaLR/iow7Ga/8mbsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="225466847"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 15:45:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:45:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 15:45:35 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 15:45:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0xVQF+AqXtEjHLWTnlT7ea+ZCr2SqaoTiHmYi4NiWZJzBtbJeESSYF7gmxazUQvPwCfnaqkq+gSRUvwcZhDFTknxVKMDQbgPABZ8o3JbaL7fpd0c5TK3jOGnxggA0RqfnjO7TKICq7pqonICIkw4ui5AEs28ncYaXLKY1Z/8JdoFataJF6nnuVLFE+rOAKriGIEfxSVWivUdaT8rLnCZtIzO0rAq4IN9osRDumPmffCQSJTjMaAPwiZ7qsjZ+MCN5EWKC9aUkMeajnQsZQKjLsNzAGnc9aMHVq1D+QJ8Za/BGWwyd591Xli4cNlKIPUnvSc7C8PLtBEV9ClJp01Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yB7Zoc+KUAXnyRocUsBOsm/MobuZK6vQL/pWoUh0PaI=;
 b=oBuQ/aO/yxaRuPUPeuUOaqDsiKCONKxT+RXihdeJO+Oz8L80NUkwauHzJqs17nq6zzwdij3u8yKz1DTW2nJIP9lo/V3hcsf21Ilvjs+2VnQs2z8FT8ne2Fs8c9vHFmgGsivx09NfYshCjLcvnFBKcG/cfl4kQmbKubzmL59w+qO8wiQ4eDnOvhJJEREJRYfuEZSGrxrXV2QXEPskGOYe4hrQ0/zhhwXNh2NhniuOoRGRwvzVR9sYBNvA79VReY0+XnmM+CEn8dAefWW1gShpDZDtyjSqFARBRcyvhdc+PgDHlwZ5+up1GjjdXirP8lZBytHmtfskjgCkX/xVH39oXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 23:45:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 23:45:27 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "jani.nikula@linux.intel.com"
 <jani.nikula@linux.intel.com>
CC: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>, "Gote, Nitin R"
 <nitin.r.gote@intel.com>
Subject: RE: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
Thread-Topic: [PATCH] drm/xe: Use IS_ENABLED() for config checks instead of
 defined()
Thread-Index: AQHcY1qmWsnBJBVQPUG3xyfv7P0eh7UPAaxA
Date: Tue, 2 Dec 2025 23:45:27 +0000
Message-ID: <DM4PR11MB5456528DA0046C14B4E1CD5BEAD8A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251202070231.187562-2-nitin.r.gote@intel.com>
In-Reply-To: <20251202070231.187562-2-nitin.r.gote@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CH3PR11MB8496:EE_
x-ms-office365-filtering-correlation-id: a0b30f82-5697-42d1-2290-08de31fcdf2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZWxqcHc5R0pEenU0WXdCTlFhMzVYR0txUWYyR0NiNlp3UTNRaUdsSlEwMVdt?=
 =?utf-8?B?L3BYVDhOa2dlcldVZXM5OWNJeG5nc2VZYVNmUXpscnhsb3lHWVAxbDg0VU5s?=
 =?utf-8?B?eTZWUkk1cWVPcTZaUGphR3NNRSsxeTVmUnVXV0IzMHZGaVJCRVVTMnVEZ3I0?=
 =?utf-8?B?ZllrVDFqVHYyNHp0MVpOMDB1cUYrbHo1ZEE2aXdhQTQ2VGVKZkFIaUFaTlY4?=
 =?utf-8?B?cDJiSlZBRk1uYXQ2NnRnamF1K3VNOExDUkRJeUI3Z21sZlIrQ2Q5MHpnRFpY?=
 =?utf-8?B?ZzlCUHdyWkx5Ni85Und2ZmlGMUU1dGtsTEtxZzFvZ0NHOFBrOFlPeTRWN1Vs?=
 =?utf-8?B?aU8xeXhlVTIzZ3FtQm9nSDhzNUUxZ0VKT0pMNXQyTGlrZXUyMytnNnBYd2Zk?=
 =?utf-8?B?ZVlxa1RPNnpLUWxLcnhMVkFaSk5sbWs2UVhrZHBROTN1TTVVRExiUzBpbDM5?=
 =?utf-8?B?blQ3MVhJNE9OeEZaZytpUVZLOUR3WXExanUzbU9SZkVzZ3BWcTNTSEwrRE5S?=
 =?utf-8?B?WGkxYkJoNlZtYnhWOG82SE1DR2ppRmdka2U1NTlvbXhtVDA2RnNIb1kzWEJY?=
 =?utf-8?B?Y0VIM25aYVpCaDRpYzYrWDNJYlJ4SnF5eGdCSzF6Y3JJLzBuK25NcXVFK0J6?=
 =?utf-8?B?bCtFNjhwcVZjdGhIaFp4YWlySUx4V1pOeFA3ZktNbWt6bUJVcmhucUp0eFk3?=
 =?utf-8?B?OXdjdHRIY0lJZ2p3MXVFNDdyS2lEMTRXbTlLZ3RUQXBxSjBOODhITzhqTWdm?=
 =?utf-8?B?UlAydVprOGxtNS9YV0Z1bGZvOEVUV2NoL2l2eUtXUFpRMjZsSzdTWlN1WlhQ?=
 =?utf-8?B?WnphMFdITWg5QlRscHNLMi8wc25IYk05alZlWEN0dXZVSHF4Vy9oZGR2OHlh?=
 =?utf-8?B?bXY3VXJZZFJJbEwrbE4vNkc2TlhiTCt5VldwenIyMisvNWNQOUJUTVhZa0d5?=
 =?utf-8?B?YVEzUkp1TUd6N1RMcTU5VzlVYnh2VXRlNzlhcVBScmZGMWUyL0U1OGRld2Zh?=
 =?utf-8?B?MkhzVHBTdUh1VnNLZUgrTVpKbzVsN2EvOU1SandLQVk2VmdpVDdWdC9RQ0Rn?=
 =?utf-8?B?NXFwZjNLS2o0ZUtUYW1TbGxQUWMwZlJ4cGE5R1ExQnJzdkt3aW5GZnVCR2tw?=
 =?utf-8?B?TlBuUTJSanJuU2R2TTlHRnpIWHBPQ2ZlaWRMSkhpM2NOOWdUSTgzVDRwTjRk?=
 =?utf-8?B?cWtPL0pLai9yNWgxNHJZcjZUMVpPMGV5dXhYTXNaNjlyT3FDWDlWdDN0dnlW?=
 =?utf-8?B?anNWbjFja1pZeG10Z0l3dm5IVThhbnNTT3hzMnV3OXp6Qzk2OXRUcFFMNHhT?=
 =?utf-8?B?YjV3ZE5JZEZlRFpjQk5aTENBTE9rNUh3dnMvVXR6OGE1Wm9VMWlPZlg3OGcx?=
 =?utf-8?B?cHcrQXRQWm9GVXJ1MEFYTGNwK01wN1B1YlhrZ2R6aFREem9FSU5xS0NmRDlS?=
 =?utf-8?B?TkpxK0dESDlWVU0xT25ZWHUrN01QZ2I3R0Z6MEtVU2w5bi84VFY4SGllQXJB?=
 =?utf-8?B?aXBud0QrVS96ZlhkSmQ0bnRMb2JqWFZDcHl5MmlkcHNTQkRSZ0VRaFJ0SU1y?=
 =?utf-8?B?L1FQTEQ0dFBHK05rdS9FRWo2cU5kSGNKLzhwdngwNllpYnVDUDkzd0RSdnpa?=
 =?utf-8?B?bFJ6Rytycmp6UGxPRUhIMCt5bjJncmZITjJNWnBhbElOSlhqblhMRUEweWlL?=
 =?utf-8?B?bVFrekdPZ0pXRVA3Y2pYUnlEeXBwVmkrV3dHamlreW96UmxHNzdhMW1hMGRH?=
 =?utf-8?B?OHJsbTBTa2ltM2VqR0pmZzFPZ3hTUSt4UWkxUFpKT2hVY3hEaldjdFBPM0pw?=
 =?utf-8?B?VWp3ZHNMNjNhYzNudHJDVWdoMlJoZm84R3dFTU9KWHpCQUxxb1QxS3M4c1Zj?=
 =?utf-8?B?TFRBQXJhNklUbDhhNStsbmdHMnR5Q2t1T3ROMDFDWWVSRW9SUmJGYk11RWtt?=
 =?utf-8?B?ZHkyY2kyK0xmajVSakFrY2d1UFJmdXp5M3V0b2JrQ0lzczJ4Z0h4RmVVY1R0?=
 =?utf-8?B?NE5neHNiS0N5bFlhcXFCZ3grY29SbE82TUxvZVZscXhoY3RIRWlwbHJKOWU4?=
 =?utf-8?Q?az4O+k?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WE1JTHhPa2ozbnFnd1haZ3JYMlIwL0kvb0IyWEFaeTF0TWtwTkYvanVWLzBt?=
 =?utf-8?B?cE11RVhxNlZvMjJjY2tFeExhVkxDVjVVaElCcVh0ZUhjVFlYci8wR1lZMkJE?=
 =?utf-8?B?YnVjRlhkcnN2V1lUWllDMXZrYXR4STNEalBPRUFINzVUbllwaXF4QUMxT0Fs?=
 =?utf-8?B?eEdadEFvbGV2OXlEbTRHNi9JcDhNVXo1bkhzSTdZQVl1T0F0MFI2aWM1aVdv?=
 =?utf-8?B?R0VWRzZUbFJlNVp0R1ZvSlQ1QXdBaUJ2VHEyS0xzTTYzQjFaY1BtV211bFNN?=
 =?utf-8?B?eks3d1B2MkdFOWNvdkx4dDhQSUFPc0l0ZjJJNmZMTDh1Um5XQi9QSFgxK1NL?=
 =?utf-8?B?Zk53S0dKNG1JR1ZSWEdpWExGNjVMSThHbnZjVGNHRGhhS0FvTFJlUkVvNnBv?=
 =?utf-8?B?ZS9EZ3NxUnd5am5ERlFUeEpLQ0NRTVdTNEZFZVVJSGZBSm5lV05SMjJlZzd4?=
 =?utf-8?B?TEcxZWswZnhVMkZqWXBJM3lJbDgrWmd3NmhZUGZyelBWZisrdnlUdHhYQ0tK?=
 =?utf-8?B?K081c3VIZ0c4U0J0TkhzVitibC9rcFhaeXYrL3JvTC9HYzlnRy94NmdYMmV1?=
 =?utf-8?B?RkdsSUVhWmlYYmFvVWpMZWNxdnhta1R5R1kvdHNwWUFBd0Y1aVlyanNDOGdG?=
 =?utf-8?B?bXFLUUV3cEFSekUzWFFrUCtEUGk1dnlXV3lTM3Bkb2lEeHFJQ3d4NUVlQ1Zj?=
 =?utf-8?B?QnArN1oyYmdBdTNWcDY1L3dUWkZKeXJvWkZPbisxVU9HV3IxMUxWM2lHV2hl?=
 =?utf-8?B?RkVLZ2J2OHJHdUVYVmRFb3J1NUhxSWErQVZtWnZ1d01WM1RDUU8zaWloWmUz?=
 =?utf-8?B?Z2MxclR3bHdQbWgxSDFoeWpsdHNUYWM3WEJ6Q2tGMEkzdllPRmNTYmE2YUQ5?=
 =?utf-8?B?SzlzeTI3c0lzc2txeUkzdVdRNGhKMDVmWmM5YUc4SHFQTlQ0dWlXaS9yeDRQ?=
 =?utf-8?B?UnRucXRXS3RnSmFWV0hJdmtpYlQ3YlFDSkEydm03cENCcU4ya1JsTjlWRWto?=
 =?utf-8?B?STFOeE05RlgwOHhseStmZERCOER6eE5OWTYzd1RCeG50bTVkekd5TEczbnkv?=
 =?utf-8?B?YklsREZqdnBwRHZ4SmU2dENSZkZhNnFETkdiVFJGUXFzcTZYZlE2SHpMRTV5?=
 =?utf-8?B?bVZ3aXUzWHU1Yzh1REl5bE8zRW1JWHhaQzgwRmJibWovcUtaYUVTVFQwV3FW?=
 =?utf-8?B?cHVwZWNBRFQ5NGJidmJnc0pPUExBci95bU8weFlQUHlubW4vbC8yZ29QSmFl?=
 =?utf-8?B?bmhzZ2oyOWdjQ0hXbjZZYjNDREh4RzNyZFRya3BBNUN2d1l4TkcvSE9OS2V5?=
 =?utf-8?B?WnZMMnFSWC9zSGFQdGZpdkd0ang1U1J0V0MxRHkwa1Q4N1dvZFltUjNSZ1Zu?=
 =?utf-8?B?cTBSQk9zcVI0K002dXM3bmJiak1Za2czVUV3NzczaGZtR210aHRubFQwMTdJ?=
 =?utf-8?B?MEg4RFNSUnlDdDJpeFBGdWdhRGFWUTlWNEVxbGtUUUZhbTJHTEdnc1pIV1lm?=
 =?utf-8?B?Q01KTDZaUmxFYXhCWk1KUVJIVGhSSlplQ2RmZFphM2dZU3E2RkVudzIxeFVV?=
 =?utf-8?B?Ry9rV2dGZ1dvdjMzS3duT3dpOVVCd21hT2lpejFjQTN5QkNsRlV4cStYdG9G?=
 =?utf-8?B?S3FKcXB6U0RKNm5rT1lodmlOYzZMSGwxVVZmOFdHK0huVmNDVnUyZ0VZZVJt?=
 =?utf-8?B?STRZTnR5eE1uUVlxRk5ZeVhaR3JXeE52OVRBVTdTdFM1N2EzU1dlWTAwQjRO?=
 =?utf-8?B?QUFucG1HVS9YVkRHVStESTk0QkN6OW9mc3hUb3hoOWxMQkxBdm10N0J5M3Fs?=
 =?utf-8?B?WXdockhDTEZYYUZrRWd5dUl5ejR1cjVqM2RLMXJMcC9ybzZXbDE1S3JIQjJW?=
 =?utf-8?B?ek5zL3d3WGNBNitzcDdXSWk5aXBQTk15aFJ5QWlTTDhqSktlY3MvVVpXRFIy?=
 =?utf-8?B?Z2h5RVVRMVAxcS9Sb0JxQVBWRm1pc0dmS0lqbEVaRXpaZGtVelB3OWRJOXIv?=
 =?utf-8?B?Z0JoYmFIUUZFNWNNOFRFaTJlSjYrd1VGaTBvR1BVUit4MzNXbDJDRm9yRTVx?=
 =?utf-8?B?MXF1N0dLdTB6T3QvbjdwcGlCR0lsTDluS2RqdFk3VTR1T3hnaUQ4aHhCTkNP?=
 =?utf-8?Q?kcYSA3qc0a1n3XHRouwznpHm+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b30f82-5697-42d1-2290-08de31fcdf2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 23:45:27.8879 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DfgU43McM0WkOCqGTZggLtKjPuKo63SeG5Na9QIJwxoPS/3MwH/uuJHtodkMmDHzJYUuRbNJRdZ1bSeoxMvwDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8496
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

T24gTW9uLCBEZWMgMSwgMjAyNSAxMTowMyBQTSBOaXRpbiBHb3RlIHdyb3RlOg0KPiBQcmVmZXIg
SVNfRU5BQkxFRCgpIGluc3RlYWQgb2YgZGVmaW5lZCgpIGZvciBjaGVja2luZyB3aGV0aGVyIGEg
a2NvbmZpZw0KPiBvcHRpb24gaXMgZW5hYmxlZC4gSVNfRU5BQkxFRCgpIGV2YWx1YXRlcyBib3Ro
IGJ1aWx0LWluICg9eSkgYW5kIG1vZHVsYXINCj4gKD1tKSBjb25maWd1cmF0aW9ucyBhdCBjb21w
aWxlIHRpbWUsIHdoaWxlIGRlZmluZWQoKSBvbmx5IHRlc3RzIHN5bWJvbA0KPiBwcmVzZW5jZSBh
dCBwcmVwcm9jZXNzaW5nIGFuZCBjYW7igJl0IGRpc3Rpbmd1aXNoIGJldHdlZW4gYnVpbHQtaW4s
IG1vZHVsZSwgb3INCj4gdW5zZXQgc3RhdGVzLg0KPiANCj4gVGhpcyBpcyBwdXJlbHkgY29zbWV0
aWMg4oCTIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCg0KQ09ORklHX0RSTV9YRV9QQUdFTUFQIGlz
IGJvb2wgdHlwZSwgc28gaXQgd29uJ3QgYmUgbW9kdWxhciB0eXBlLiBJdCBpcyB0aGUgc2FtZSBm
b3IgYm90aCBjaGVjay4gIA0KSSBjaGVja2VkIGNvZGUsIGFsbCBvdGhlciBwYXJ0cyBhcmUgd2l0
aCAiSVNfRU5BQkxFRCgpIiBmb3IgdGhpcyBjb25maWcuIA0KU28gaXQgTEdUTSB0byBjaGFuZ2Ug
aXQgYWxzby4NCg0KUmV2aWV3ZWQtYnk6IFNodWljaGVuZyBMaW4gPHNodWljaGVuZy5saW5AaW50
ZWwuY29tPg0KDQo+IA0KPiBDQzogUGlvdHIgUGnDs3Jrb3dza2kgPHBpb3RyLnBpb3Jrb3dza2lA
aW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBOaXRpbiBHb3RlIDxuaXRpbi5yLmdvdGVAaW50
ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92cmFtLmMgfCAyICstDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbS5jIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3ZyYW0uYw0KPiBpbmRleCAwYTY0NWU3NmU1ZmEuLjhmYWMxY2MwOGRjOSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZyYW0uYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdnJhbS5jDQo+IEBAIC0zMjUsNyArMzI1LDcgQEAgc3RydWN0IHhlX3ZyYW1f
cmVnaW9uICp4ZV92cmFtX3JlZ2lvbl9hbGxvYyhzdHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSwgdTgg
aWQsIHUzMiBwbGENCj4gIAl2cmFtLT54ZSA9IHhlOw0KPiAgCXZyYW0tPmlkID0gaWQ7DQo+ICAJ
dnJhbS0+cGxhY2VtZW50ID0gcGxhY2VtZW50Ow0KPiAtI2lmIGRlZmluZWQoQ09ORklHX0RSTV9Y
RV9QQUdFTUFQKQ0KPiArI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9QQUdFTUFQKQ0KPiAg
CXZyYW0tPm1pZ3JhdGUgPSB4ZS0+dGlsZXNbaWRdLm1pZ3JhdGU7ICAjZW5kaWYNCj4gIAlyZXR1
cm4gdnJhbTsNCj4gLS0NCj4gMi41MC4xDQoNCg==
