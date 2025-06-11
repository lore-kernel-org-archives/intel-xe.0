Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E2FC71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 17:25:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E5D10E6DD;
	Wed, 11 Jun 2025 17:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAGSz/4n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC4610E6E9
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Jun 2025 17:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749662702; x=1781198702;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=dYRiNz5hYNBR0RcabHQYADK+E5je50lN9+ntemHwwJw=;
 b=lAGSz/4ntddHFIxe7wfQSpTXbeV9wQOzlah9xMiV44rmWRQigQV4MIjg
 AVdQ3PvIPS/U6YnFwUKgQAxkGI570UKTpYvSLoan8vEllrzEuyzA31tX3
 vsRd0sDpuf5hb/tWimUxJRiMzCRNFuS/8FdBOJLNdoLguFwb1NVZfzl5L
 0q702xGbMcvs8CwlDh2t6P0E6AcdpXCbj96THXdLDfg/YBQFLJ7Rp1m7l
 wX3gu+j+YXzEQwGgfyZN1H3ld/fkZRZJlspKVY2WIPaGP1+HZQ3dq/bTX
 NneBToDsf15wifJn8XIoEk3WOxox8J6+3dZIYYKSDUDiEUUpLStqr6zc0 g==;
X-CSE-ConnectionGUID: S8UcPhUbRWurCzIHSUhCcg==
X-CSE-MsgGUID: P5+fbgJ9RwaD7hml6ErFdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63162451"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="63162451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:24:58 -0700
X-CSE-ConnectionGUID: f17v9SfoQ/uzpE0w6mdH4g==
X-CSE-MsgGUID: LXOJC/trQ7W4LGqeb57uog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="147620657"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:24:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 10:24:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 10:24:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.51)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 10:24:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWN1AUi44sZooBjuHAio0W1lMKGf/TuonNf3Jyn+PntEwDGIKXn6Xj1fkulnF+tKJArpCYMEQb3SHggH3xijMJQvl8ZYQkoPDitUyVUSkQrjXLjD8aNJA5oPUbYPQdKKiTzPrRQjaBKfrUG6ZZs/8ppOryniruSVQOpiozWuRgRCSmJtbB68ceI5U6wKEC91ikiu1p76CcH1L4Y8u1nUFW/UpeYe9crpJZZl2+jm0DK4WiSCtK+OYg+W1ihjqXUvqcRHut9ko2VJp4c1RB2XRdT2A4y7o+G7Mbs7ewBJ78HIaRAz/OIVkeJL/FPD7e7Oi3o6/VrOpln/IfxxQsOMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dYRiNz5hYNBR0RcabHQYADK+E5je50lN9+ntemHwwJw=;
 b=KyP49ZKy1jfBQylBDW0AYjSPxxiiSy6fAUrLevkfneefpB9wl1RjkA1iZiH/TxW3xo/QgkzACCBDccnVIz1Glt0LhSF1v1qK6Y4DX4lupU8IOhwbfFHIqZ8jh+S7o/DXtgNG6KSSVMLfeKDfF/3v+XUNote3rfaA1EFZpCIq5PiO3cBXCdWhMC3L8ltRqzo0TIV3k7Ln3+61xNVLAMIpXsVa1Yznx7gQ08VK4os4v+59mbvMfKYEEBoXgwApcck6mSeesWNDUG5UBNuufsDEqzdqU5WtsDx6skXjJWaikG5ak8c+Wkj8jimYrwXaWLhhXHb2x48M6LuGmnPYM6rmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.30; Wed, 11 Jun 2025 17:24:42 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 17:24:42 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
Thread-Topic: [PATCH v2] drm/xe/guc: Set wedged on Xe micro hardware
 initialization error
Thread-Index: AQHb1arOkL9ehQqh1kWkBi+CDXEZiLP+QBcA
Date: Wed, 11 Jun 2025 17:24:42 +0000
Message-ID: <0d72b0ec0f7dd251f42bcbbeae17ab7b5766c3d8.camel@intel.com>
References: <20250604234532.1167699-1-zhanjun.dong@intel.com>
In-Reply-To: <20250604234532.1167699-1-zhanjun.dong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|DM4PR11MB7254:EE_
x-ms-office365-filtering-correlation-id: e501a021-5413-4238-181f-08dda90cda1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Tm5IYUxFRzdNa0k5U016TzEyUGU2clc4T2tqdlBBam1tVTJ4VHNoSDlEZzhH?=
 =?utf-8?B?bDhVekN2VkNLNS9vdUtZUG1ob3JRNDBqek5uRWRJc0FpWEVlb2RCSHNudFYw?=
 =?utf-8?B?ZUF2eWs3cVVjTU5DdzFQbkR2VEpzaWJOVnVHUXVLK2NrYk9jZWJiVzhIZXo3?=
 =?utf-8?B?d0xsUFVGbEdsbnFoT2FZbjQ3cndrYmljbWZpaXhRbUFCc3B3SkJWNHBNcmtC?=
 =?utf-8?B?VEZ2WGlwdnZWRHEzd0kxU25aNUMwZ1RhT2FXdmViSTJyNW4rblc4VnJtY0dX?=
 =?utf-8?B?Q04rOE1DMHRZVGpEZGFYank4RE1VUDVBNEZ3c3pDekJaSDlMRFoxcWFkOExQ?=
 =?utf-8?B?eWk1K25SQ0l5aGo2OWZ5NG9oWDQ4Y0lpaG9DUGNYdDFNUFFRQ095b01xYTF2?=
 =?utf-8?B?WHdzcTB4UjVxWXczMmRQRzlMVjdkMVBzWnZGMW5YaFhDbUJNOFQwZG9yRUlh?=
 =?utf-8?B?VTZnYjBYVDFTM2dCNE1VY2dMTWo1TGlaM1grc3gzN1VlaUdLV1RnYmt5MVJs?=
 =?utf-8?B?clNBUkxPSmpyV1h4QzNqRlRCVTd0OUNhcTF1QkdrN25Td0FBUTVBbC8rOE5Q?=
 =?utf-8?B?STB4a3dSL0RVdTgyeE81WjRzR2d4dGpuTnRYRjJtaGxFTVhFaDVNQXBodWhp?=
 =?utf-8?B?ZmxPUXBGZThuY01OcjBLbkFnWXlDNWhTN0pLNXF2NnFsdGFoRmRBQndvZnh1?=
 =?utf-8?B?UzM1bEhwSmRvcnk4Vmp6L0RYVDlkcVdLUER2YXJ2SkE2TE0yczU4RDhuZ0xY?=
 =?utf-8?B?SEc3TWgxVG1GNFVwUElXbFJWdndBK25kSFZ6ekRGOXpqakFZOGF3YW90ZmlH?=
 =?utf-8?B?M3pLVnJCQ3JnUWpXS01tdDJBeVErZTJzQ0VDejljcXIwZ25SUmw4Y1JnM2g0?=
 =?utf-8?B?Q2FpZC9zWjV6Y0lzOUg5cm82N0NGajdzTmthNWlBejJLT09BbFQrRHREeFl4?=
 =?utf-8?B?VUF0eGpLczlvYVlzY281bmxQVklGY2lQc0hTUDQ2aGtsRitmckRjRWkvc00v?=
 =?utf-8?B?VTRoc2JSSE1JK1BNU0VLRVI5Sk44cEVJRUVZd3BtR2JvRFNJT05jbUFZN0Mw?=
 =?utf-8?B?NlZXK1hDYklLc3NuVFpscWZ3bUxvOS8yVDhWQnArU3o1WXM0ZUUrT0cwZnUx?=
 =?utf-8?B?cFRmanA4M0x6c3FwcWxKQzdBTmVxQXYyQjFrbkRiRFp0clFXQVNTRmMxb1Nv?=
 =?utf-8?B?RUUrZWhjMTAxY2NxOFE0VkhHRitjMzJraDVIK0czMTdoUkVWcXp4L0Q2bURq?=
 =?utf-8?B?UUNuYmdjaDZzMTFCTzBhTS9pSkVwVStxUUQ1bHFDRzI0NkkyZGdraDBrNHQ5?=
 =?utf-8?B?K003T2tyUmpweXpuaSthMU1JM0RtMEU3RCtOc2h1aE02UmsxSTB2UUFmbElW?=
 =?utf-8?B?MHVZQ3AzS29tMHJDb0JwTzNUd0h2TVg4bHpyUzhzQ0JaOTlWcWltakJiN2JG?=
 =?utf-8?B?ZURId1VyVzQ1UjJSU1ZLN3BJYVJoYy9ybkx3aGgzYjhyOXlYK3ZsM052Vjhk?=
 =?utf-8?B?ek9zdUtzZTdERTcyejFmQUJFeVptT0RiQy9VKzg5alp5SXUvZUFKeWJhUE5W?=
 =?utf-8?B?NkZpVzl0OFE3UzIxKysxNWNjNk5LNXhsaWZEYjhsL0YrWFFKSVlEcFVIdXFu?=
 =?utf-8?B?NFlsaW0ySSs5U1EyMytRSmF0U21pWGpEZVlQYkdoY0phUDI3dGs0YVlhaUE4?=
 =?utf-8?B?Z1oyZHRTTVRMeFBTNkNBSnFQalVlQ2RWeFlIeGo0M3RDOUpWT0FRdzVHRkwx?=
 =?utf-8?B?cWNacXp1R1ZBWlY2dWNqeXUyQ0NzMXlwc2MzY3M2TjQ4ay9DRUwyUUtDTS8r?=
 =?utf-8?B?cDhXOHYzU0ZZakZTZ3k1d2t5WXh6eituL0VqeUthT2o4SldmRjVsY2tad3VD?=
 =?utf-8?B?NWFVL2dMK3JxY24wNG12OFNCYjcveGVyeFk4WElCNGd5RjdtaVlxbzE1RGxF?=
 =?utf-8?Q?RZSpBZlWX60=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SFBabitydVZnZnBlWGFEamZwTksyV0d0YjA5Z0p6UjQ1WEwyTStqY0ZOQjdK?=
 =?utf-8?B?ZEtrY1hlU3FtM2Y1SEhla2FpcGVyUFdBVW9nSkVUR2plSGdvRHcxZnZYM3ha?=
 =?utf-8?B?aHZTT2hjbmZ6UlIyUm55WkhFUFFrbDNPRS8weFJmM2tpSUQ5LzY5TmIyQVI3?=
 =?utf-8?B?b2VOR1ZXT2lXdlh3aW5jeHB1QWFYSmdlSlB0SjgwV1pkZkVwZmNnZXNRZ3Bi?=
 =?utf-8?B?UmJzRGU0OWcwSWxTejZKeU10bTU2R2d4SHpyQldvRlo3M0Vzb0NiZ2ZrKy81?=
 =?utf-8?B?bGN6OHdSdWtDam1ZSVdMK3lNZ1poRHZYVjZxZ1Q5dHVlaXd4UzNZTUlXTHFK?=
 =?utf-8?B?ZmtRdENKbk00SXFwMFhTa3VXblRwUjJFMUNOZ2oxS2ZvT0M4ajNMVURadmdN?=
 =?utf-8?B?aXVob2dJbzEvL0JaVWdaNVJoaGh2V2hVcVRMcnNVNlRLd2pwZCs0bWpZKzlX?=
 =?utf-8?B?di8xa2NsUVBVS3FhSVFtanVyOUZsV05iVUxjVU9YOHV3SzFtemlxeElNWVZG?=
 =?utf-8?B?SnNSUlFrYVlhYzdBamoxOGVSOFc4aEE5bGR0SEFTSWtQUFphVXplR3ZsZ0Jo?=
 =?utf-8?B?NUxCMkh3SjI1SXBPbGxXYnlXdi96SHpFUGJYWU9mSmhreWVFTXgra2FuZzFp?=
 =?utf-8?B?VmpsdWRmb0JNdi9QZ0pUQUV4aEI3Q2ltNXh4Uk1waUNYTGxpVU9KYXVhdm0v?=
 =?utf-8?B?Q0xiYzluQVNMTE1JY0dpbmNTTVNzODFmL20yZVRDVDZlOGc5Y1NCN1JSUndI?=
 =?utf-8?B?Sms5Z2JEaW5NRTJvd296TGN2UDdkWVhQcFFOMmpUcGpRUUZwNlF4U3lNc3VH?=
 =?utf-8?B?Rms2cCtqdTVkMlFnYlBuUVZ4bnpKNTVzTFE1M05SZ2ZGeUlCc0I5YWVveWFR?=
 =?utf-8?B?ckorUEM5cmcvRm1VMnVOcTRkT0s3MHBVTGkyZ2I4bnNXenhEdFdwRTcxMUxV?=
 =?utf-8?B?ZmdmUFJVbjRic3ZWMUtGeUZ1dTNWaVFQNmpaZ21jbEZtMEI1L0locXlUSXJ5?=
 =?utf-8?B?UFY0U040TmJBRVg3SU1UU1ZCc1YvdWRJVjhZbGVjMVZsTlZPcDFwVmc1a1A1?=
 =?utf-8?B?cDhUSXIrTVlwTDRYRTQ2aDJ6OG5FbWF6VGQ4QXppR21ja3dYNzN1cEI3SU51?=
 =?utf-8?B?RVQ1U2MwSG4zdDBrSFd0WlNHMWU3WldyVU9PY2svM29neDRSdm9idFM4dXlu?=
 =?utf-8?B?TTBzZ0hiRFlFY0t6RUhGelMrZU5LM1lRSmxOd1dJTkNialhMU0JLbUl6UWFR?=
 =?utf-8?B?a2RpN3BwSzdxM0x0RmJnSVV6T3FmYmp5cFR2UURpL0xmamg0aERhdlhXQnpn?=
 =?utf-8?B?MEJmaHBzMjlQVzFqZVh4QnllSDZEYkd4Y0JDYm1xR095K1NUNG9KaFQ4ck9B?=
 =?utf-8?B?SlRsTVdmSWoyY2xUVW5Cd1o0MGtwckhqL0k4cG5ZMFgyUUxKTDVTZkExOUdQ?=
 =?utf-8?B?WkFBc2k0ZFZNZ1Ntd0c2QVZLc2FhUXVjV3pRL0ZNL1BPWHU5dVd4QlZaTzVu?=
 =?utf-8?B?eHFKYTJRZ1JXYWhIWnlHSEhMcFpBOHBtdm1IQjVUemVta09sU0dYeHM2bHdE?=
 =?utf-8?B?RFg4WW5Sb0xxQXFJdE9qRmR6YjVOQW0vVkVBZWRvTTdKT0VEQ0R6dVlpT1FX?=
 =?utf-8?B?ZGJNWXdQZWNVV0RkUkJ3N0tJMnZRU2JNQ0h3Y1BCM2RYZUFsNmxiaER3cm8z?=
 =?utf-8?B?KzRIaHZ6VWdmYTBoTlJxRWR4VFdOaWpoS1lMNFU5T2RMeTk2YUlHcTgzNDJ1?=
 =?utf-8?B?dEcwQW8zYytUVEhYZGEvanVkYVFreXV6eGpyN051RUtDQzZhcGREenVDdDF6?=
 =?utf-8?B?d3JGVWplOEgwb3JvZDM1MkF5TEozVHVnSGlsRkcrdXhISWYwSkR1SXBnYSta?=
 =?utf-8?B?Z3haNzFBNk8vb0NqUTM4TFRaNE9jTGpiTjE1SUhOcGtGZmxUQ25PUE81WTlC?=
 =?utf-8?B?SmxWY24rOEcrMjJMQUF5OWR6a1JUTjV1NUJtcUlXWnhTMjJOemVNcjJQTlpV?=
 =?utf-8?B?b2IvRkE4cW9jbmJlZlBadDlXR1VsY2haUzEvOHdSWW9NVndadDNxdmtwS0JN?=
 =?utf-8?B?ZUMybzFibVJyK3Y0MHhGRWowV1JCcG00aUg2UU9OSWppQUhuNklRYXdkU0xR?=
 =?utf-8?B?MzNWQ04zSFlkbm5JeGZhekpldER4QTIxUElwRTJBVnd4a1U3Y21Db2paS1VX?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63994F27C7B9A34D8FAD55D8D23D88EB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e501a021-5413-4238-181f-08dda90cda1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 17:24:42.0455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n9qrzomTe2RtvTWr3uU3aESXCbqEcsm0Cd/+55pvwxes6ReEDPJBQoSb3J76hx1C6vCmLudbxzw3EIL/wyVHNonAjK3i2KkMrr+Tjh/f6cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
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

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDE5OjQ1IC0wNDAwLCBaaGFuanVuIERvbmcgd3JvdGU6Cj4g
RGVjbGFyZSB3ZWRnZWQgb24gWGUgbWljcm8gY29udHJvbGxlciBoYXJkd2FyZSBpbml0aWFsaXph
dGlvbgo+IGZhaWxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGFuanVuIERvbmcgPHpoYW5qdW4u
ZG9uZ0BpbnRlbC5jb20+Cj4gQ2xvc2VzOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcv
ZHJtL3hlL2tlcm5lbC8tL2lzc3Vlcy80OTE3Cj4gCj4gLS0tCj4gQ2M6IE1pY2hhbCBXYWpkZWN6
a28gPG1pY2hhbC53YWpkZWN6a29AaW50ZWwuY29tPgo+IAo+IENoYW5nZSBsaXN0Ogo+IHYyOiBS
ZW1vdmUgdW5uZWNlc3NhcnkganVtcCB0byBlcnItb3V0Cj4gwqDCoMKgIERyb3AgZGlzYWJsZSBj
dCwgc3d0aWNoIHRvIHNldCB3ZWRnZQo+IC0tLQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Vj
LmMgfCAyMSArKysrKysrKysrKysrKy0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0veGUveGVfdWMuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV91Yy5jCj4gaW5kZXggM2E4NzUx
YThiOTJkLi5iZDFkNGU4ZmFiN2UgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3VjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdWMuYwo+IEBAIC0xMyw2ICsxMyw3
IEBACj4gwqAjaW5jbHVkZSAieGVfZ3RfcHJpbnRrLmgiCj4gwqAjaW5jbHVkZSAieGVfZ3Rfc3Jp
b3ZfdmYuaCIKPiDCoCNpbmNsdWRlICJ4ZV9ndWMuaCIKPiArI2luY2x1ZGUgInhlX2d1Y19jdC5o
Igo+IMKgI2luY2x1ZGUgInhlX2d1Y19wYy5oIgo+IMKgI2luY2x1ZGUgInhlX2d1Y19lbmdpbmVf
YWN0aXZpdHkuaCIKPiDCoCNpbmNsdWRlICJ4ZV9odWMuaCIKPiBAQCAtMTU3LDE5ICsxNTgsMjIg
QEAgc3RhdGljIGludCB2Zl91Y19pbml0X2h3KHN0cnVjdCB4ZV91YyAqdWMpCj4gwqAKPiDCoMKg
wqDCoMKgwqDCoMKgZXJyID0geGVfZ3VjX2VuYWJsZV9jb21tdW5pY2F0aW9uKCZ1Yy0+Z3VjKTsK
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIGVycjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJf
b3V0Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGVyciA9IHhlX2d0X3NyaW92X3ZmX2Nvbm5lY3Qo
dWNfdG9fZ3QodWMpKTsKPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGVycikKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGVycjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ290byBlcnJfb3V0Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHVjLT5ndWMuc3VibWlz
c2lvbl9zdGF0ZS5lbmFibGVkID0gdHJ1ZTsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBlcnIgPSB4
ZV9ndF9yZWNvcmRfZGVmYXVsdF9scmNzKHVjX3RvX2d0KHVjKSk7Cj4gwqDCoMKgwqDCoMKgwqDC
oGlmIChlcnIpCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBlcnI7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyX291dDsKPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gMDsKPiArZXJyX291dDoKPiArwqDCoMKgwqDCoMKgwqB4ZV9kZXZp
Y2VfZGVjbGFyZV93ZWRnZWQodWNfdG9feGUodWMpKTsKCk9uIHRoZSBWRiBzaWRlIHNob3VsZCB3
ZSBiZSByZWR1Y2luZyB0aGUgc2NvcGUgZm9yIHRoaXM/IElzIHRoZXJlIGEgd2F5CnRvIG1hcmsg
dGhlIFZGIGFzIHdlZGdlZD8KClRoYW5rcywKU3R1YXJ0Cgo+ICvCoMKgwqDCoMKgwqDCoHJldHVy
biBlcnI7Cj4gwqB9Cj4gwqAKPiDCoC8qCj4gQEAgLTE5NywxOSArMjAxLDE5IEBAIGludCB4ZV91
Y19pbml0X2h3KHN0cnVjdCB4ZV91YyAqdWMpCj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0ID0g
eGVfZ3VjX2VuYWJsZV9jb21tdW5pY2F0aW9uKCZ1Yy0+Z3VjKTsKPiDCoMKgwqDCoMKgwqDCoMKg
aWYgKHJldCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJfb3V0Owo+IMKgCj4gwqDCoMKg
wqDCoMKgwqDCoHJldCA9IHhlX2d0X3JlY29yZF9kZWZhdWx0X2xyY3ModWNfdG9fZ3QodWMpKTsK
PiDCoMKgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcmV0dXJuIHJldDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ290byBlcnJf
b3V0Owo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoHJldCA9IHhlX2d1Y19wb3N0X2xvYWRfaW5pdCgm
dWMtPmd1Yyk7Cj4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGdvdG8gZXJyX291dDsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSB4ZV9ndWNfcGNfc3Rh
cnQoJnVjLT5ndWMucGMpOwo+IMKgwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnb3RvIGVycl9vdXQ7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgeGVfZ3VjX2VuZ2lu
ZV9hY3Rpdml0eV9lbmFibGVfc3RhdHMoJnVjLT5ndWMpOwo+IMKgCj4gQEAgLTIyMSw2ICsyMjUs
OSBAQCBpbnQgeGVfdWNfaW5pdF9odyhzdHJ1Y3QgeGVfdWMgKnVjKQo+IMKgwqDCoMKgwqDCoMKg
wqB4ZV9nc2NfbG9hZF9zdGFydCgmdWMtPmdzYyk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIDA7Cj4gK2Vycl9vdXQ6Cj4gK8KgwqDCoMKgwqDCoMKgeGVfZGV2aWNlX2RlY2xhcmVfd2Vk
Z2VkKHVjX3RvX3hlKHVjKSk7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiDCoH0KPiDC
oAo+IMKgaW50IHhlX3VjX2ZpbmlfaHcoc3RydWN0IHhlX3VjICp1YykKCg==
