Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EF7CAC5BB
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 18:36:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377DA10E0DE;
	Fri, 26 Sep 2025 18:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3Af9PQc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6858410E0DE
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Sep 2025 18:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758911805; x=1790447805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rP6bm4qNdRa0aUvFuVKq4SzT1NmvN1cw/azAEJn7WXc=;
 b=X3Af9PQcPr6b4Uc9vXifD/wZJo/oYNwJexjPcTXdlUEVvsdfKv4lL25p
 nZBNe9SmFYEoxGdnjO8fpsZt8yaCZ4aOuWvCkkeWlBjGvbuMnK9Aa34oB
 AIkMWVE1aS6ynsh99kfrOQ6kSCqZDAwK+CXiSlvYxGhEWkPan7uvl3XpW
 ELFr6u6qoVdUlUcgtsLnXsbPvXIvKxCeePdFSEe3y+EjGXZPn/oW+eDjA
 rQGL2hxeE7/v82vyUiBu/eTGRjmKuRyb8/Gc+Z9IhuwSu28N1VZoWnGfD
 ZQIhXkiA56OkcNYY5cBpBgeAyWd1/yQPxv0GGJwXH1m46uKWIiz7gb+jB w==;
X-CSE-ConnectionGUID: 2nSnoy6LSQa/7sYDVgabXQ==
X-CSE-MsgGUID: qqFLwh07TfOWPGAbch72QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="60952273"
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="60952273"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:36:45 -0700
X-CSE-ConnectionGUID: sXd4aQyPQKaXA40wrm7Fiw==
X-CSE-MsgGUID: AGExbWXSTBe1IQSk8EczFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,295,1751266800"; d="scan'208";a="176811679"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2025 11:36:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:36:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 26 Sep 2025 11:36:41 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.30) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 26 Sep 2025 11:36:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeN8Fy3U8zxvCknoA1whU6lWqspTVw3au8XpkVbMk67Bh017tLsgPn2NY7TuBM2/corLKmNwRy36C1H0UpdTM/Sy7OIiPp4an7vSalp8rh/p7R6bkde9u8pQiPoZjCINd+Di7zN8WwkrOR5QRSyy1vQSvcQkuQCOx/MNtcpj3bOzDDCDGbdQlGqpp6Kgyk7mU1T5OjRxkJD05PyLbhJa1vF+XDGIDcp+L3DC/zeBUVKlXUzJoxI+KGvsRhHv2IVJ5M4McYLMKITZXXokEegW632T1vwjC48xTog8mVBSwa2Iy9Sq/p+n4RXarDZdMr5HEpdw10ZI3S97LeUyzZ3AZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HlEE4xtVd5ULdUydd3GPedCT45wz9hGP09QPzH0VUjM=;
 b=c4stZTsvvutvhdxYgUmcTEDIhxJWMzfW0RZt2iqRkL8QbKjgWpZ4BZ4OBuxMyO2OrMqq+aFYK3w2M1mooBb7rFSOdO8BE5+68b0kH24MzK+f4dUBl0kY5YwbOkNIij3quxyn16yJGVFU8gmvk8jtZd93P4rfa4T8oijDSHnk8UerL3hdBCsCZUyiRoGWkkl8o3wrEdXjWCwYYoNFrpyM1AjP1QxHJ8S4IxzjqY/f0Wex8BRfSN4k8KujDVDf15vnpFX2sgAECfkkrycdIhsqzGSHT2GWPAYi2y1Y0rT6XewUYD8nMuVLfrc5rIDmIX9O4C9/rUe0mdof8v0AyZixAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CH3PR11MB7323.namprd11.prod.outlook.com (2603:10b6:610:152::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Fri, 26 Sep
 2025 18:36:37 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 18:36:37 +0000
Message-ID: <6ba18666-d2e9-4184-b717-b0c5d160d998@intel.com>
Date: Fri, 26 Sep 2025 20:36:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/xe: Guard against NULL GT in xe_guc.c
To: Jonathan Cavitt <jonathan.cavitt@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
CC: <saurabhg.gupta@intel.com>, <alex.zuo@intel.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-11-jonathan.cavitt@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250926155948.145934-11-jonathan.cavitt@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::15) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CH3PR11MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f217b15-d53c-40ef-239d-08ddfd2ba051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c1NYcGlUL1FwYngydC91MmlyZUZERU9lTGZ5RncxZitiMkVZTWV2ekE3TlRV?=
 =?utf-8?B?V0NSZHAvd1I5NUEzeVRBMEJXdVdaNENoUG53amNEZlFoMWRsSlNNdmNUVmxn?=
 =?utf-8?B?b0IvdUI0QU1FMFJYR0RoRjVMRFlpR05Ic2Y0RzE1Y3FsdGhWaXRRK1dSYUJr?=
 =?utf-8?B?QVRiY1E3MUFtZnNwWmdzbjVEQXhwT0U3bTlOQXVrZmNZcW5hV200UnFGTVIw?=
 =?utf-8?B?N3NKQVg4WXJsTWt1dDdHWUtZd3AzUGE5RSt2Y1pzamNpYWVaMDRKb3o1aEdU?=
 =?utf-8?B?TnZEcjJmRmNpZjVldVlqSHdOcFd0alhXTktIWk9iSVhhbFVadTJnbStZRXlG?=
 =?utf-8?B?c2t4UFpESzNDTkFxM2ROcXBWQUU0VmhyQ0FQSHptWDN6TXhJS1JuL3JhRWNU?=
 =?utf-8?B?MEJ5SFRMSTlZZi9QRXgzNk1pRzRJZU9Qc1VJd0JsRDhkbFRvcE8yTHl1NFo1?=
 =?utf-8?B?dWhDMTlpa0RBczBrMzdOUVcvb2R5RlNPTldvMlV1THE2amFPdk1yN0hiUVhM?=
 =?utf-8?B?b3l5czIwTTdyblVUaU85YlVKNzI0OGxLU1R0TXBocU1Hb0ppWXZ1akpQV1lk?=
 =?utf-8?B?MG9nZGhvTUJCNnc2enVJdjVLS3pkYnd3U2s4VHIycExCelNlakhuUURyRHpZ?=
 =?utf-8?B?ZmtuU3l4amdDNHp4U25MQkhHcmZFZ3dzQWJndEs5SlR0SUdiblcyTERPZFpq?=
 =?utf-8?B?ekJhVVJEbmxBMi95cmtEb3FFcVI4U0ZGVDZYWXViVUl2eDdQS1M2VGg1MTRU?=
 =?utf-8?B?N3QrWmFjU3h5TEY4U055OGhhNmV6bTM3NVltTUY1bkkreHdCSFYvU0p0TW5l?=
 =?utf-8?B?bGY0K1M4bU5iVlBmL3FlZ2Y3NmYvNWdRNnN1Rkg0V3EwUTBRVGxvSmVlMkZR?=
 =?utf-8?B?aThvcGM1TXJoc0RzcDVmMVlqZWxGbDc1Ukw2bW1TUkN4MzA1dDNodiswMWx0?=
 =?utf-8?B?c0ZVTTJGMkt3RFBmS2dxM0E5VmRidlprQjBDTlk3bFZZYjU1WGhoTjlYc3Iv?=
 =?utf-8?B?T2tkOFpYZnh1UjI5VVlQMW5LU3c3VUIzM2NKVXFYMFdtWnZhcmtQeDBMazN3?=
 =?utf-8?B?NzRnM08wNk9ZOEdWL0pzMHhFVHpXT3dhTGNNTTdlKzlSd3dmNlRLTDl2TDZV?=
 =?utf-8?B?bm1BUThFandEOWxiOGtndHJTZzBNVmQ5OXNEZ284a2wyaUVQL1RRYVlWQ29N?=
 =?utf-8?B?bmZKU2w1TFFvdGhlY1FaNDNPYWN4WnBvY1VHa1J6MjFLMnFxOUpSSStORHIv?=
 =?utf-8?B?Nzc3RGtaOXIybHR0WmxOWnFXVDhMNEtrTDdKVmM3V1pSY0orUGZrdGFMbU9y?=
 =?utf-8?B?a29MR1pSYi8zNXladEVjZEdNMVppS2lQRUlZSDdYcUdROTcwSkpwdzRIaDJH?=
 =?utf-8?B?RDJabFlmNUpWc3plbFRBV25QSE56VXpLRFYvbWV1TkZweURQRXZNZ3pwKzF0?=
 =?utf-8?B?WXdMM0tOeXFraFFKVG1temx2OWZkY2V0Vm9INy93UDVIVlR5OWN0LzBUVTFT?=
 =?utf-8?B?OE1MUkNRWE1VSE5zV0RpdFNJc0FIYUxWN1lqL2Njdk1rOE9NTzB2cVU5UENY?=
 =?utf-8?B?eXI0YVBnUWZZamQxdVA0TmwvQzA2ekdnNEM2UFY0eFpCY0JQR3p4cnZsSExC?=
 =?utf-8?B?bDlhdVBKNGE3MFdyc2xaS05zL01BeTd1NWxIU3NCaHRhR2NPK3N6STBrSVlF?=
 =?utf-8?B?SmhPTmRDb0tmTjlZRTc5Z05vRnJrNUJsNUdyYk0xMkYxbDFNbFhDdkM5RFVY?=
 =?utf-8?B?aEpxTFFuS3pUb0kxNm1Sby9yc3NWNmx2UkYxUU5XMlZCOUpTNzczQW5DWWRq?=
 =?utf-8?B?YmZ1a2ZmM2ZodFBxdTh1aTRoT0twaVlMenYxeGVKU1g0ODNWbTBXaWdLWGFs?=
 =?utf-8?B?d0pDUWFXak9RU0tRTE9Fc3h4WVVmK3JIejMrZUdTVXZNcFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmY5MDBLcVlncUlGdGV6NEJ2MXEydXdodzF4em9LNGt6bWl1RXZRTVFwOWR2?=
 =?utf-8?B?clllVjdMbFpwOGFHMUU4SlZzNXp5VDZGUlhSYXN5d0J6UDdVMkVrRzF3MDBL?=
 =?utf-8?B?dFBiL2loY0pFMFFWL25rZ2dQWWdiZ2gzVDUycTUxQ0Z5amNLRFg3VDZqWE9L?=
 =?utf-8?B?SHJvMXJSa3lGQmlkV29WMEFMbTFJZkNoRFk1ZVU4eDNVK1F2dzMxK1JZL1NU?=
 =?utf-8?B?MjlHZUZaL1lERU5TWitqUGN6Rm9waEV5UlVsTm9Tdk9Fa2dlWVJHeXBvYlU5?=
 =?utf-8?B?WlYxcVhMV1hFZWlhaHhLRFpMTDhRUEtPaFA1Q0NHZTd0N3VEYXE1dzg3OXlG?=
 =?utf-8?B?YXM2VXdZTEpydndCS3ZwYytEUGxjSnVzZk9MUDFteFY1SkY4U0ZKS3NTeEpU?=
 =?utf-8?B?dU0xamhoSnRvbkJwb0JNR2pYV1NBWUwwb09vUEtuUWNxVkdrVUhMRjlFajQy?=
 =?utf-8?B?NlE4bTVremlJMGx1YWI3T0JoRHByZEo0TkV3M3MrZnk0bmtEV2dKQ1l1Tm14?=
 =?utf-8?B?dEszQllETFRhWGllblpBSWdBc2pEeXNEdkg2VW4raFVaWEs3alY5MlNKbjVn?=
 =?utf-8?B?Ung2OWZUbmdqVHJkNiticEpsUzZmcm4yNGxUcEVoWHVGaU1QN3NRRWVaRENQ?=
 =?utf-8?B?a1VpNkJmLzRmMFluQmcwTmNWQ3I5RUxiVTVWRUZaSXQ4Vk9ET3hFdmpMMzlP?=
 =?utf-8?B?b2dDQTMrMENYODdhQ0o1S1ZEb0srQmZsMlkrOVJmam1yYW1CVGVqc01wZ09L?=
 =?utf-8?B?b0lJNDlZNXh3QXdmOXB5MDZJWlB1b3R6WnJLOEYwNVBCRDdiWElCNlBmS0hW?=
 =?utf-8?B?TTVaVjBDVGdPUzNKemNlMkxtSG9BditFWlJKR2xocW02ZzE0ZXNKUlNjWEVO?=
 =?utf-8?B?dkFMeUtwRHMvcjNlTVV4SG04MFlza2QwMGdZZHVOTFg0NFU0ZVBEUWpwcllm?=
 =?utf-8?B?QndXend4anpTdm9NYVdWQmJ1M2tINGRXTFNWTlUxb0ErdWpka3R1c0hleEJJ?=
 =?utf-8?B?SWYvVTdtSDZqMWtJLzgwOTkvNDJzZlE0dytSWmdDQTM1dHpuRzlOaTBzWTQ4?=
 =?utf-8?B?WjBWaVhqdis3WmZjWTd5OTZBaGpUZHU2MW5JQ3BBbmUwclJreVZIMGMwb0Vx?=
 =?utf-8?B?QlpQanVUMjZZZDRDQmVmaWVXZUtON0phNG1ITzBuOWdzWlU5b08rNk5tMGFo?=
 =?utf-8?B?K3NjbkdFMzBOWkVpYlhESUtpVW40ZVREMm5PWU9aVHBucXhyand3Qm5wSG5n?=
 =?utf-8?B?Wll6SGU5VGo3WGJuUTd1VDFRWGRiN0RHK0VINU1UT0JkU0t1S0V1WXdtTnlY?=
 =?utf-8?B?NDZ5UFZyMnZJQkhwOUcvdkpkV0x6UmJCVzVNVnU0QnFZYzJ3QXJlUFB4Q1Rm?=
 =?utf-8?B?dHFhZkpXUFduZWl4U05pQURBcGNyaExPNlVJUHhlaUZ0dkhha1RlRGlvbWNR?=
 =?utf-8?B?cnFLWWV4TW1wSUpHYTd6L3JJVGtMeGttUmNJeDU4a3M2eXp1dWRPRHBEVEpH?=
 =?utf-8?B?U3RrTDl4blgxK2xRUUdzY09YSll0VXlKWTVrdmZycG92TDV2T3FzbzQvbjdG?=
 =?utf-8?B?Uk9VTFZKY1VTWDJaSTN3NEN6M0dqb2d3SVo4SEtKTGtpZVkvb1VUTkUvMTJK?=
 =?utf-8?B?VWNtMkVJUzZYWmxoTjR0T0p1VlNyRnFIV3dNUWdKaXhtcWVGNjZ6V3dWeWZm?=
 =?utf-8?B?YkU3eFY5UHYwR0I2VXVxaFVoMGJKUFc3UkswVkdRbHhKODU2WmFySUtjbjUw?=
 =?utf-8?B?eWtLM2xxWFZqQm1PUEFGVGd4cnBzZDdpZU42Um9Qd1o0cnVEOGFNSVoxdTgx?=
 =?utf-8?B?VHpGQWJLa1lTRzlzK3pPMWpGQjBXQWhMckZuY2Y2ZXVIVmRGWWZVamE1bmND?=
 =?utf-8?B?S1JhRFUwSU02OGF0aStwbTdZZlhESTRSOVRUbmU5d1pBd3ZYQ1h5Ri9LUXU2?=
 =?utf-8?B?cmNKSFQvSyt6ZjBuQzMrUnVCSFhCTEljUkNWc0EzOTRnYk1scTF5b2M3eXkr?=
 =?utf-8?B?OVU2TVBybW14NkZ0T2w5VHVUQU43RTBFUGpkaUNJOTVDNWtDUVVpSHJZS2k3?=
 =?utf-8?B?L2E0LzV1TDA0dmgwRHA5QnpCVFNLeTBrOTl6S0tRN1QwOHdXcWpEWVBzamVD?=
 =?utf-8?B?djAwbTlQYjZ6Q1p0OTJ2dDFNRkRiT3p6VFFVdWY2V3ROejNaVElxdnFhdWhR?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f217b15-d53c-40ef-239d-08ddfd2ba051
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 18:36:37.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHhhXNkVeBb/zv70kGQ6/o5Fpzr9CbW4bPVuvnTtLuH5+VKGYR9m8yn5cqi+mZUwFJGfY5IfbsYVbE/dliDag7kqT8SAJaTslOnZ+KNRwo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7323
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



On 9/26/2025 5:59 PM, Jonathan Cavitt wrote:
> Static analysis reveals the following issue:
> xe_device_get_gt is theoretically able to return NULL in some cases, but
> several use cases don't check the return value before performing a
> dereference, resulting in a NULL pointer dereference.
> 
> Use xe_root_mmio_gt instead of xe_device_get_gt to prevent this in
> xe_guc.c
> 
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index d5adbbb013ec..0bf1402c61a0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -466,7 +466,7 @@ static int guc_g2g_alloc(struct xe_guc *guc)
>  		return 0;
>  
>  	if (gt->info.id != 0) {
> -		struct xe_gt *root_gt = xe_device_get_gt(xe, 0);
> +		struct xe_gt *root_gt = xe_root_mmio_gt(xe);

while this looks ok today, I'm not sure how this will work after [1]

maybe we should check and abort here? + @Matt

[1] https://patchwork.freedesktop.org/series/154739/

>  		struct xe_guc *root_guc = &root_gt->uc.guc;
>  		struct xe_bo *bo;
>  

