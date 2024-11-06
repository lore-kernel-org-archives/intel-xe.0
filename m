Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71443D44D55
	for <intel-xe@archiver.kernel.org>; Wed,  6 Nov 2024 12:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F99E10E6C2;
	Wed,  6 Nov 2024 12:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqsPvfhg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0FD10E6C2;
 Wed,  6 Nov 2024 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730894447; x=1762430447;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3xObC3oCrkd06Ez2s6rNRn6JB5RGeND80Bp2r1a5eWc=;
 b=VqsPvfhgU2+dy+144oRUI9/SdD5ovxokETW4SmVk8L/AA5g2LbhYLAj0
 MsFbroZDX5qPoiAywQHnmFxanoCKf33vgUw8n0oovSBdqWtAjEELWdJxx
 q8kwiV/4TsJn5jXuF+48RrICPZEIS6E9YccF6rQ08YXHmCkIb384kz3zn
 hGbO6GzkAt7oxY3t0aPkCTTs51OOAApNEa9CgTXvMDr46MifnGXrj5SQe
 A1/q5q05YxcLLkOb3jGU8fS6zEfKZ3m6oZ4RPg6H8Jp3utcgYaaGt/NCy
 Km6dN4xgS2SiXLce17yqcfPRoz9gJs7cB385Xg52aYfmD0bl5W6WqiSka A==;
X-CSE-ConnectionGUID: AkQOX7WLSO6YtzKQ5hG99g==
X-CSE-MsgGUID: GcOBP6ZvQgKSApHPSUSxCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="56082100"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="56082100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 04:00:40 -0800
X-CSE-ConnectionGUID: 3YlkwrpnQQ6TZp3FWRF05w==
X-CSE-MsgGUID: FS7ZPTwSSjeRxbA/cWOe5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; d="scan'208";a="115284823"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Nov 2024 04:00:30 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 6 Nov 2024 04:00:30 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 6 Nov 2024 04:00:30 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 6 Nov 2024 04:00:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBvVzeG8TvS3AejwAEK+BgoNfVAuo/SacK1WsgMRVf/RmCdNeFaVwDuoHIntLHE7eRfSU/I1GSBwWL6Jp1S053P1IyxExRNAaRsACdTd36NeGn3PUWZrhDVWjX22XdudgmZY9XPDQAFkqMAFl2kxKEfVFN/ipVX8v8+8UKQ8sFbaQVhGxFquaYmO6czNVnXFeuHOGTSpsSrCFLvoBS8G3psiYD34V1wU5WBJJZccncQeGtTxGXWKX9V4YIiuuq7+VWtXw0DEEQ3wyFT5XyTpPFIHIdZDBU905w+HmW+A1cbkhb3lmEZsXtGXKYkN5TylmL/bmtb56DyBJHD7DXR5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3xObC3oCrkd06Ez2s6rNRn6JB5RGeND80Bp2r1a5eWc=;
 b=MRyETTHjXWSnGVjrT2HYvRJItjiel1+v+nPoqnztw+yr2THM6QhGTdTfMDTuECI/n1DOegeX2KHhH0AX9uigA4MmKDxrj2c+a1mnxNprCmHs0pBVOAQxpAq5gEn0vvRtOd8lFaMfLqFPLloGWOSPDda9odfhnTNWovidBsC+tpkusQGBu0EBNgRuOw+3D5/lZO0iihrq7Wnh+gXPm0DNIgDXm8SUL6/561C4/1J3FJ8rtvEA64gDUBkriUD4hdmA0qVWoSbISzf3ym2d/OZpMQiZEgsTmvRUkvHsX5v+e1oFsnyNfqhrCf7bY8gXMjSPIZp+o3/bPU9QSBv/Y/oTVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 12:00:25 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 12:00:23 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
Thread-Topic: [PATCH i-g-t V2 2/2] tests/intel: Add xe_pci_membarrier test
Thread-Index: AQHbJS+HIpG7fSMbRkWD84eWsQTB1bKigPMAgAe69BA=
Date: Wed, 6 Nov 2024 12:00:23 +0000
Message-ID: <SJ1PR11MB6204F3272611F49594373C3181532@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241023094327.965050-1-tejas.upadhyay@intel.com>
 <20241023094327.965050-3-tejas.upadhyay@intel.com>
 <33c9d6a1-b8cf-4449-9311-4d57c185e653@intel.com>
In-Reply-To: <33c9d6a1-b8cf-4449-9311-4d57c185e653@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV2PR11MB6023:EE_
x-ms-office365-filtering-correlation-id: 82407cd7-7e02-48cd-6a2c-08dcfe5a9841
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OFp1SGVUWCswSVFqWlowWDZTWVNINkdDN3Yza1JYUnZqcDhaOEFLeW8zbC9u?=
 =?utf-8?B?RlRJNWgvWEQyYVZJU3VqVUlJRTBDU0ZiK0phZmwyeUV5ZEtRY2JZWnBCY21E?=
 =?utf-8?B?MDZiSmZ5Q2xPbkQzcS9zY1paMHJPS3lLNFB4VzdqTGh2dkxJT21JcmQwMTM3?=
 =?utf-8?B?alhJekhMYlBSZE5tMGZKRnVyYU1BMVZoVUk4NWIvSVFWQ0NsSitDR0xYYmp6?=
 =?utf-8?B?K0hGVVVjbEwxWHgvRDJUYlhtd1pKZ0txUW5iRlBsU3JPK2pFRUtNUFZPUVZq?=
 =?utf-8?B?RzNpbE1CemtNNEQvRWJEQVJjbW9HaE5GVW05MkhnUFFwd1N6b2lDTmUrYVZC?=
 =?utf-8?B?NThFTmdIeGZ3VTBwZTRpMDViNmdPcTZFb0tqNVFYY1laWVNoZVpUZWlCVjM5?=
 =?utf-8?B?R3dXdjRwT29oVWhCY2NrWE5ISTh1Z21oMVdiWnVYd29CRE0rbllMQXFQVEFS?=
 =?utf-8?B?dThVOWtMRTM5MDI1OXo1cGVpT1JkNTcrRFdaRlpsaUxuV3Fua1NjTFEwWEZH?=
 =?utf-8?B?OGgwRjU3YnV3NFdMTnV4RlkwMEFHbW05amRMQUhxWTBxQ1Z6akFiMlpIbC9S?=
 =?utf-8?B?dFNyL2pBbXVxZVJYeTRDQ3RUMkI0NTAyVDVQSG1mUWNSWDM1aEE1aWR2VVE1?=
 =?utf-8?B?cUZWZitvMmZNQVdOUHBIUmtRM2xUSGI5TDN5L1R4NFJaWU1qSXhSSi9PVUo1?=
 =?utf-8?B?Zkd3VzlOR1BBUHJGWDR0dS80TFM2UkVVbzFScys3QWozRmlsZnRZUDU0MmZ0?=
 =?utf-8?B?N1BheFMvemFMQnhsSmg4cTloZVYyYWRvb1VvK3pKdFEzSWhvOXFxd0pxOEpw?=
 =?utf-8?B?VlJvT3lCN2xWd0puRHRMMml5bzRXOXFqdUVUcXZhdUZRM1N3WjJVZEhBR0dC?=
 =?utf-8?B?RTdhNkpLWkZ0RWszWXhYQnBaaU9LaVFkalBTU0c5UWxESzdmRmRpR1RVTjJZ?=
 =?utf-8?B?d0R1NkN5ZGtkYytqME5Pemk5bTdRYnllTmdxVjhWcGVEdkRST21qRzZjTkFR?=
 =?utf-8?B?bW9Bck5ocTVyS1p0MkdqTm9BRSt5Z3NGcWpHcWlBN0lRcWl5bUFLV3padXZT?=
 =?utf-8?B?N2dodUV2TUlSZkp1V1BueGd2U2F4OXZOenEveFROZ08wTC9mdzlZMzYxcG5q?=
 =?utf-8?B?V056UVpFV2RYcEtneGEyYWFPS1JmUUt6Y1JTRmpKY1BOb3RBMVR1M1lOMFli?=
 =?utf-8?B?UEtvNk1GdU45ZWhkT1hWMTVkSlE1WXduZThMOVVFS09Yelg0emczdzNyY3RQ?=
 =?utf-8?B?UGFYVDEveHUxQXJtRkRDT1BaajBwTmpOV0tYd0EzOU13Tmlwa0hKSmwvOTdI?=
 =?utf-8?B?aGhyNHRla0pJdlpqNzRoZlBqSWdsZS8xemVNakwvOXl6LzlOSkMzeFUyNnJv?=
 =?utf-8?B?aFpXaUt5Ynl5ZmNHeTlTZS81U3JiNmdyWHk4bzVYNithRkJ2SnlLQjRmakE2?=
 =?utf-8?B?eXFRaEppNVNhUW56WE9RWWNGTk44VkFmOSs3U2FjOU5MamNvVVBsUnJhQk5r?=
 =?utf-8?B?N3R0OW5BVTEwbXZ6SUUyYWVCdk9NTHBWYnBqQ2pQTU12QTVCMEc1ZzZtWnNX?=
 =?utf-8?B?a1l2aTlTM2llMjU2RTduZzdWNGxNN004Tkl2eitXd3JDc1BpeHIwZWcyQnVR?=
 =?utf-8?B?cjBNdDlEUm11aEVRK1pxZ3ovWTFMYXNFNFNTT2pYcUdHa1E5N09TZ0V0MHhY?=
 =?utf-8?B?RlNZTjBGc3hFdk9tUm9IeTFxUWgwRkVPb3A4QlUvV3M2clNXNjhZV3dIYjJZ?=
 =?utf-8?B?OTZZRXlWVHRmbm9Gd3czZVd2Z3JVRFp0WVBmUU9GNmM1WnhLdmxZeFJWTFlC?=
 =?utf-8?Q?syD7JPpoeWQkRFfYpdWEGpzOgGW1N//AVvrnE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MVVRd2dxMXZCMTh4cmwwQW04NEZ3aitCeHJpVVlmOG5kazVrQWpXaUtselJm?=
 =?utf-8?B?V0lkaG83WG4vYUFXN29QLzYyd044QjBYSUMxb2hpakNnWWFGM0lmb2xtMGNV?=
 =?utf-8?B?dU5hV21SUUdLZGxacE90S0RTSG9CcUZQMWl0SG8xQnZlKzl5TnBxVTUvSWp1?=
 =?utf-8?B?TUVnTWxCRi96bVU4ZW5OYjYzSExHbDNUTmRhamVlQ3c5TisrQ05OaFZxbEIw?=
 =?utf-8?B?bGV5VVJRVGVjVEF4bEZZVi90SWlEajgxK0ZtejNvU1k4ajE4UzJxc3h1QmJT?=
 =?utf-8?B?djZ3TldjdnJjL1NoZE1Gcnh3VU4zTU51VnhaRnBkNEVoTUlFQ1FDeFBxNU9B?=
 =?utf-8?B?cTMzK29aY0laL1dTRkZoYzBQSWVOS0RKWXRsMk9wQU82enZyM0NXQTRLR0tq?=
 =?utf-8?B?c1VYTllLT0VYVmtCbmJ3MWQrS1pZOXJaS3JFYisvZmxtN3BNRHlwdkxZRlpG?=
 =?utf-8?B?UmJYazc2SlFLMzdGd3pSQnN3WUIxL3RWcW4ybGZtQXlUN25rQ2VzUUpYVkJa?=
 =?utf-8?B?K1dodEFJVTN6RDV1UEFGcHMxNGRoVVNQUEtrZW54djhRdFlrUU5tczJCSUxm?=
 =?utf-8?B?TnNNbXlOd0NEVmh1dVNpOVBKNy9YOFI2TWhrSzNJTEYxdGZOazlRMVlLZjNG?=
 =?utf-8?B?eU5DbFFscXdUMnljSE1HUmlmbktIWHdndEZOTjdldjk2UldLenhQZXgxcmFN?=
 =?utf-8?B?N2VBRVFuMUlnZDFyZjJiSHV0YVhoMWgrM08wNHBRSlJNUWRKQUJsQys5Qm0w?=
 =?utf-8?B?WXppUGhENzBpSzVZWTBTaVFtdlF1QkFDWHRSTEZiblVJNFg1QmtuaWJLSkha?=
 =?utf-8?B?c0xQQWFCQjlyY1FZU1lSRHRlSGZOZjdtbTE2SDVmZ3VXVjE5VXIzZDVKS2Zh?=
 =?utf-8?B?b0s5WGJYWXptendnUE9VTHRXZksxWUpFdWt6ODhYR3JNaFlldkJtVzI1cVV6?=
 =?utf-8?B?TEJGWFZpNEYwdm1jTnp0bWN4WjNtQTZkZVFjS0hkNm9hSkNBaUUwTi8xdDRG?=
 =?utf-8?B?dlVWT3NxVThWNW9KWGJOaHdkT096SnVCVEkrTGgwckpMN0tJMGlJQXBzdlZ5?=
 =?utf-8?B?MDFCa0YzRi9NaUUyay9lUmxSVmZobUI2TlBreW1adEZwWFljMlZWcXNMeE0y?=
 =?utf-8?B?R2lLZHc2U204VmIySVJBTXZQM2Vqc0RrQ0RjMHYxL3Z5SWxuRGNaWDhpM1g2?=
 =?utf-8?B?T3NtSlpKdklzV2sxcEw3STVkazA0MEZ0SWlRYnRiUHZBRCtYNFZqOFY3L1lN?=
 =?utf-8?B?MTdqbEZvUHRHOHNPdXNVc2RYT0p0aDk3YVNwS3J6ZjNMdFJ5U1c2NmJKU1B3?=
 =?utf-8?B?WmNtcGpqQjUxTlZNcFpiZkxTSENGQ2YzU2orb21wWUprNUFZWUtLaGRzSU5p?=
 =?utf-8?B?bzVLajZkd3l2TGJJdVVCOGpOTGlsTnRvclVDY3pxMXZQQms4Mnk5Y0F3Zkcw?=
 =?utf-8?B?S2x5L3ZYY0hZaHp0ZVBIOXZXTUVUeXhLVEo5dkVnc0hxT2Zvd3N0azA0VUNB?=
 =?utf-8?B?Wi9pM1FyV3l0ZXVibVBnUTUrdVdJekdESTE2K1FxSXEydGVWN2NkVWRFODgx?=
 =?utf-8?B?OTdlSUtpMXRKQ3pocG5BUnFxL1NUeVNUaUQ4aWJieTc2M3VTb3FrNWVPNHZa?=
 =?utf-8?B?a283WndYdmdndUpEeHBZdzlveGRRbEhmWk5sdW9KVllNTWQzaVc4b1ROck5m?=
 =?utf-8?B?d2NVcVA1c25JK3lweDNndDU2U3p2NjUrSWhoakZGTHFwYm9TUXN0aGZxMmE1?=
 =?utf-8?B?M2VndkRFS25XV0hla296bWlDMEpKZVk1QzM2OHIvcW0wcG1IcmE3eDd5cmQ1?=
 =?utf-8?B?TU9hMGFJZlpOMzF1OEEwQ3A4NjJkaU50V1BOUWFza3RWdlFPNWxGZkhtMkp6?=
 =?utf-8?B?WkpMNExnanBKN1VDc1Y0b2xFbm5ZQXlqTzFBaHdhQXZ6UXdyMUtpRE5GM05B?=
 =?utf-8?B?dkFkSGMxRVdaNHZnMEVsNHJ2NDFVQW5ZNUhDSE9qMXh1YlFWY1NJdkdwRlJY?=
 =?utf-8?B?SUpQbjNzNFpNMGI2K3dydmx6S25aWkMvM0wrUGljUFBhZW02OWtiMGxxd0Ju?=
 =?utf-8?B?NWdiOTRqdkplNlFEYm56OWpiR2lpdXNPZnp2OVVpbEVuVzBUWDg3aTlRcEJs?=
 =?utf-8?Q?/KUUfJ9Pa1aZL1BM3AhhayO8e?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82407cd7-7e02-48cd-6a2c-08dcfe5a9841
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 12:00:23.4093 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QvAoDodaGsPA/xfUvCgkAqCdH9cCLkWOHYVQXOB7HqFxcTRCkZjEp/1FP6buGZ4oLksmIQ2sa+7YLuJZaB3Bjr//wT+QUV8icvzBhPs5CNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXVsZCwgTWF0dGhldyA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxLCAyMDI0
IDc6MjUgUE0NCj4gVG86IFVwYWRoeWF5LCBUZWphcyA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29t
PjsgaWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBpLWctdCBWMiAyLzJdIHRlc3RzL2lu
dGVsOiBBZGQgeGVfcGNpX21lbWJhcnJpZXIgdGVzdA0KPiANCj4gT24gMjMvMTAvMjAyNCAxMDo0
MywgVGVqYXMgVXBhZGh5YXkgd3JvdGU6DQo+ID4gV2Ugd2FudCB0byBtYWtlIHN1cmUgdGhhdCBk
aXJlY3QgbW1hcCBtYXBwaW5nIG9mIHBoeXNpY2FsIHBhZ2UgYXQNCj4gPiBkb29yYmVsbCBzcGFj
ZSBhbmQgd2hvbGUgcGFnZSBpcyBhY2Nlc3NpYmxlIGluIG9yZGVyIHRvIHVzZSBwY2kgbWVtb3J5
DQo+ID4gYmFycmllciBlZmZlY3QgZWZmZWN0aXZlbHkuDQo+ID4NCj4gPiBUaGlzIGlzIGJhc2lj
IHBjaSBtZW1vcnkgYmFycmllciB0ZXN0IHRvIHNob3djYXNlIHhlIGRyaXZlciBzdXBwb3J0DQo+
ID4gZm9yIGZlYXR1cmUuIEluIGZvbGxvdyB1cCBwYXRjaGVzIHdlIHdpbGwgaGF2ZSBtb3JlIG9m
IGNvcm5lciBhbmQNCj4gPiBuZWdhdGl2ZSB0ZXN0cyBhZGRlZCBsYXRlci4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFRlamFzIFVwYWRoeWF5IDx0ZWphcy51cGFkaHlheUBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gICB0ZXN0cy9pbnRlbC94ZV9wY2lfbWVtYmFycmllci5jIHwgODANCj4gPiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gDQo+IENvdWxkIHByb2JhYmx5IGp1
c3QgcGxvbmsgdGhpcyBpbiB0aGUgZXhpc3RpbmcgbW1hcCBvZmZzZXQgdGVzdHMgZmlsZT8NCg0K
SSB0cmllZCB0aGlzLCBidXQgbG9va3MgbGlrZSBub25lIG9mIGV4aXN0aW5nIG1ldGhvZHMgd2hp
Y2ggYXJlIHVzaW5nIGJvLWNyZWF0ZSBsb29rcyByZWxhdGVkIHRvIHRoaXMgdGVzdC4gQWxzbyBu
ZWdhdGl2ZSB0ZXN0cyBhcmUgYWxzbyBnb2luZyB0byBiZSBkaWZmZXJlbnQgZm9yIHRoaXMgdGVz
dC4gSSB3b3VsZCB0aGluayBpdCBzaG91bGQgYmUgZ29vZCB0byBrZWVwIHRoaXMgdGVzdCBzZXBh
cmF0ZS4gV2hhdCB5b3UgdGhpbmshDQoNClRlamFzDQoNCj4gDQo+ID4gICB0ZXN0cy9tZXNvbi5i
dWlsZCAgICAgICAgICAgICAgIHwgIDEgKw0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNl
cnRpb25zKCspDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvaW50ZWwveGVfcGNpX21l
bWJhcnJpZXIuYw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3BjaV9tZW1i
YXJyaWVyLmMNCj4gPiBiL3Rlc3RzL2ludGVsL3hlX3BjaV9tZW1iYXJyaWVyLmMgbmV3IGZpbGUg
bW9kZSAxMDA2NDQgaW5kZXgNCj4gPiAwMDAwMDAwMDAuLmQwYmY0NDdiNg0KPiA+IC0tLSAvZGV2
L251bGwNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9wY2lfbWVtYmFycmllci5jDQo+ID4gQEAg
LTAsMCArMSw4MCBAQA0KPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUDQo+ID4g
Ky8qDQo+ID4gKyAqIENvcHlyaWdodChjKSAyMDI0IEludGVsIENvcnBvcmF0aW9uLiBBbGwgcmln
aHRzIHJlc2VydmVkLg0KPiA+ICsgKi8NCj4gPiArDQo+ID4gKyNpbmNsdWRlICJ4ZV9kcm0uaCIN
Cj4gPiArI2luY2x1ZGUgImlndC5oIg0KPiA+ICsNCj4gPiArLyoqDQo+ID4gKyAqIFRFU1Q6IFRl
c3QgaWYgdGhlIGRyaXZlciBpcyBjYXBhYmxlIG9mIHB1dHRpbmcgcGNpIG1lbW9yeSBiYXJyaWVy
DQo+ID4gK3VzaW5nIG1tYXANCj4gPiArICogQ2F0ZWdvcnk6IENvcmUNCj4gPiArICogTWVnYSBm
ZWF0dXJlOiBHZW5lcmFsIENvcmUgZmVhdHVyZXMNCj4gPiArICogU3ViLWNhdGVnb3J5OiBNZW1v
cnkgbWFuYWdlbWVudCB0ZXN0cw0KPiA+ICsgKiBGdW5jdGlvbmFsaXR5OiBtbWFwIHdpdGggcHJl
LWRlZmluZWQgb2Zmc2V0ICAqLw0KPiA+ICsNCj4gPiArSUdUX1RFU1RfREVTQ1JJUFRJT04oIkJh
c2ljIE1NQVAgdGVzdHMgcGNpIG1lbW9yeSBiYXJyaWVyIGVmZmVjdCB3aXRoDQo+ID4gK3NwZWNp
YWwgb2Zmc2V0Iik7ICNkZWZpbmUgUEFHRV9TSElGVCAxMiAjZGVmaW5lIFBBR0VfU0laRSA0MDk2
DQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogU1VCVEVTVDogYmFzaWMNCj4gPiArICogRGVzY3Jp
cHRpb246IGNyZWF0ZSBwY2kgbWVtb3J5IGJhcnJpZXIgd2l0aCB3cml0ZSBvbiBkZWZpbmVkIG1t
YXANCj4gb2Zmc2V0Lg0KPiA+ICsgKiBUZXN0IGNhdGVnb3J5OiBmdW5jdGlvbmFsaXR5IHRlc3QN
Cj4gPiArICoNCj4gPiArICovDQo+ID4gKw0KPiA+ICtzdGF0aWMgdm9pZCBwY2lfbWVtYmFycmll
cihpbnQgeGUpDQo+ID4gK3sNCj4gPiArCXVpbnQ2NF90IGZsYWdzID0gTUFQX1NIQVJFRDsNCj4g
PiArCXVuc2lnbmVkIGludCBwcm90ID0gUFJPVF9XUklURTsNCj4gPiArCXVpbnQzMl90ICpwdHI7
DQo+ID4gKwl1aW50NjRfdCBzaXplID0gUEFHRV9TSVpFOw0KPiA+ICsJc3RydWN0IHRpbWVzcGVj
IHR2Ow0KPiA+ICsgICAgICAgIHN0cnVjdCBkcm1feGVfZ2VtX21tYXBfb2Zmc2V0IG1tbyA9IHsN
Cj4gPiArICAgICAgICAgICAgICAgIC5oYW5kbGUgPSAwLA0KPiA+ICsgICAgICAgICAgICAgICAg
LmZsYWdzID0gRFJNX1hFX01NQVBfT0ZGU0VUX0ZMQUdfUENJX0JBUlJJRVIsDQo+ID4gKyAgICAg
ICAgfTsNCj4gPiArDQo+ID4gKyAgICAgICAgaWd0X2Fzc2VydF9lcShpZ3RfaW9jdGwoeGUsIERS
TV9JT0NUTF9YRV9HRU1fTU1BUF9PRkZTRVQsDQo+ICZtbW8pLCAwKTsNCj4gPiArICAgICAgICBw
dHIgPSBtbWFwKE5VTEwsIHNpemUsIHByb3QsIGZsYWdzLCB4ZSwgbW1vLm9mZnNldCk7DQo+ID4g
KwlpZ3RfYXNzZXJ0KHB0ciAhPSBNQVBfRkFJTEVEKTsNCj4gDQo+IG5pdDogZm9ybWF0dGluZw0K
PiANCj4gPiArDQo+ID4gKwkvKiBDaGVjayB3aG9sZSBwYWdlIGZvciBhbnkgZXJyb3JzLCBhbHNv
IGNoZWNrIGFzDQo+ID4gKwkgKiB3ZSBzaG91bGQgbm90IHJlYWQgd3JpdHRlbiB2YWx1ZXMgYmFj
aw0KPiA+ICsJICovDQo+ID4gKwlmb3IgKGludCBpID0gMDsgaSA8IHNpemUgLyBzaXplb2YoKnB0
cik7IGkrKykgew0KPiA+ICsJCS8qIEl0IGlzIGV4cGVjdGVkIHVuY29uZmlndXJlZCBkb29yYmVs
bCBzcGFjZQ0KPiA+ICsJCSAqIHdpbGwgcmV0dXJuIHJlYWQgdmFsdWUgMHhkZWFkYmVlZg0KPiA+
ICsJCSAqLw0KPiA+ICsJCWlndF9hc3NlcnRfZXFfdTMyKFJFQURfT05DRShwdHJbaV0pLCAweGRl
YWRiZWVmKTsNCj4gPiArDQo+ID4gKwkJaWd0X2dldHRpbWUoJnR2KTsNCj4gPiArCQlwdHJbaV0g
PSBpOw0KPiA+ICsJCWlmIChSRUFEX09OQ0UocHRyW2ldKSA9PSBpKSB7DQo+IA0KPiBDYW4gdGhp
cyBhY3R1YWxseSBoYXBwZW4gd2hlcmUgdGhlIHZhbHVlIGlzIHdyaXR0ZW4/DQo+IA0KPiBJIHRo
aW5rIGFsc28gY29uc2lkZXIgYWRkaW5nIHNvbWUgbmVnYXRpdmUgdGVzdGNhc2VzLiBGb3IgZXhh
bXBsZToNCj4gDQo+IC0gVHJ5IHRvIG1tYXAgc29tZXRoaW5nIGxhcmdlciB0aGFuIDRLLiBFbnN1
cmUgd2UgZ2V0IGFuIGVycm9yLg0KPiAtIFRyeSBCQVJSSUVSIG1tYXBfb2Zmc2V0LCBhbmQgYWxz
byBzdXBwbHkgYSBCTy4gRW5zdXJlIHdlIGdldCBhbiBlcnJvci4NCj4gDQo+ID4gKwkJCXdoaWxl
IChSRUFEX09OQ0UocHRyW2ldKSA9PSBpKQ0KPiA+ICsJCQkJOw0KPiA+ICsJCQlpZ3RfaW5mbygi
ZmQ6JWQgdmFsdWUgcmV0YWluZWQgZm9yICUiUFJJZDY0Im5zDQo+IHBvczolZFxuIiwNCj4gPiAr
CQkJCSB4ZSwgaWd0X25zZWNfZWxhcHNlZCgmdHYpLCBpKTsNCj4gPiArCQl9DQo+ID4gKwkJaWd0
X2Fzc2VydF9uZXEoUkVBRF9PTkNFKHB0cltpXSksIGkpOw0KPiA+ICsJfQ0KPiA+ICsNCj4gPiAr
CW11bm1hcChwdHIsIHNpemUpOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtpZ3RfbWFpbg0KPiA+ICt7
DQo+ID4gKwlpbnQgeGU7DQo+ID4gKw0KPiA+ICsJaWd0X2ZpeHR1cmUgew0KPiA+ICsJCXhlID0g
ZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJaWd0X3N1
YnRlc3RfZigiYmFzaWMiKQ0KPiA+ICsJCXBjaV9tZW1iYXJyaWVyKHhlKTsNCj4gPiArDQo+ID4g
KwlpZ3RfZml4dHVyZQ0KPiA+ICsJCWRybV9jbG9zZV9kcml2ZXIoeGUpOw0KPiA+ICt9DQo+ID4g
ZGlmZiAtLWdpdCBhL3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQgaW5kZXgN
Cj4gPiAzNGI4N2IxMjUuLjE1MTMxZDgxMiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9tZXNvbi5i
dWlsZA0KPiA+ICsrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQo+ID4gQEAgLTMwNiw2ICszMDYsNyBA
QCBpbnRlbF94ZV9wcm9ncyA9IFsNCj4gPiAgIAkneGVfbm9leGVjX3BpbmdfcG9uZycsDQo+ID4g
ICAJJ3hlX29hJywNCj4gPiAgIAkneGVfcGF0JywNCj4gPiArICAgICAgICAneGVfcGNpX21lbWJh
cnJpZXInLA0KPiA+ICAgCSd4ZV9wZWVyMnBlZXInLA0KPiA+ICAgCSd4ZV9wbScsDQo+ID4gICAJ
J3hlX3BtX3Jlc2lkZW5jeScsDQo=
