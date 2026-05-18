Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DEDCD343F
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 20:44:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF42710E9C8;
	Mon, 18 May 2026 20:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTVt7ovv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32B410E9C8
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779137083; x=1810673083;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=NilqvC6BeBDsYQignUBwu6eJLZXISCEuU6N+29t7fn4=;
 b=JTVt7ovvsXTZKoxpa0OCw+5f5irdQT96SmC+T2l3cZZHDm2bPSOuq0R5
 xKLYV+Sxg6qEbzHJC8o0cpNj6Gh1oZsN29+PvGuSi3shfW+pup0QynNMv
 16aEaZ5aY4Lbfh0bMFFvR7IYzUGQciCUgNRKFGQl2jaZmnsZYW4ix1wHB
 KiN0eeW19uYBTW4zYkcmzvh0qZykK9dmhB8Rk0qcc/Q4DbA552yG8xcNH
 aAZ4H1gZ/4eYaAn3ORl+5VzPf6ZYGFY9dQFD+IK/BHexT1aPjmVSE1/ql
 LvLLcPhlNCMQ3bxg1fWtwNmGkG38nuPp/fIs+ynneUI7gfG+2KuHl47Yv w==;
X-CSE-ConnectionGUID: NAyadKYISkSLeCtDGeYg5Q==
X-CSE-MsgGUID: 9vcqrQo5ScCsA1fkCtWgkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79981981"
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="79981981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 13:44:42 -0700
X-CSE-ConnectionGUID: aKA20RMUQ068I6EZ/9P04Q==
X-CSE-MsgGUID: B7JcXZRYRfippA/ArHA2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,242,1770624000"; d="scan'208";a="235093397"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 13:44:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 13:44:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 13:44:41 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 13:44:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuOeIwCVN0lLp8RyM0BCIh+ysxqJA2BVF22Tv88fBaGr6tPZV5V58nJtRNSFCzSlqENEdvgaWa8fDuX8rpWXO+VFX7S0ggsfbS4FMA+2g5a3//3IL3CYxv2IWyw/VD0y9+/wcoeHuA92C/URXSyY4SyRq7CmDC45I5J4W6tFb6Y40bJ8kw/bTporm+JpkzPFIJdUoX1MiPfDIpZKMYjuaUpUM4qwd/lb0IsJRU76ziincB5A+1nc5iRHWZYZFmfaESWJXCxDfjkqKi1kNR3GXfjuLjjZJFEy+kwAR7xmHLwOs/hN3OVBMPX6W4csKRCcBpeylxa8pCShUtb7ibD8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gncojSyuYyCi7BFjmr9AmYW1rjHWlK4K2Sfwoqe7pYA=;
 b=h10lZ3AdgluobAlAvByLHYmwVYVNaxfTX2ls5r7QonYTYvce7gntXMtrHPA8FkrpafA+hJY34AZqlvnGXKxenkVNHrt12YghIgfy+A7CLVYtZ6KjDLHfAyH+2FK7eFdgVBySi1kLgn1N9VAex8ZmUqbddatnnMv2n6d2CGnh/cjkfBFb8I16SbKUoCvaAXsr91fpLid9S5snNsMRAQ6zq/C8F8dbBjw3sViJ2D4uAfwlzMlZ+J9Hy6Hgcp6JE8cMBa08a3IoudUB66/Kc5GOY1Okn0yB1QtcFu54sWtshXcjVdv0kmnN4niprcTGYNmOIdAMtYJE8i1LeMRyOn115A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPF2F7FC4EE6.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Mon, 18 May
 2026 20:44:34 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 20:44:34 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH 2/4] drm/xe/rtp: Add GT WAs rule checking
In-Reply-To: <8733zoh3lh.fsf@intel.com>
References: <20260513212129.691628-6-violet.monti@intel.com>
 <20260513212129.691628-8-violet.monti@intel.com>
 <8733zoh3lh.fsf@intel.com>
Date: Mon, 18 May 2026 17:44:30 -0300
Message-ID: <8733zosb0x.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::26) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPF2F7FC4EE6:EE_
X-MS-Office365-Filtering-Correlation-Id: 596d1443-dd35-45ad-8d63-08deb51e44e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|3023799003|4143699003|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: NINbFMIphrrjt6EikL/0X3F0Fj9s6Ay1GqROApE1sme8XeZ34Q8FuKvnboMDj33Q2SMdupBSeY0mYbNWoSzoppxkmLKbuAIg4lYjjQqVYwj7D++zVgR3UIYw6qh2F8lLMsW7br5FNElGQEABim6L+wARo3FrdbuFA7AWHKw3M78JStsoZhmDIkdo+7gSj3qr9+MxdgNfksSiRccnuOllWXdDQz0Qh0qRrv4gC5zg8cicCZov8/ypkA4j6w+JYCMI/wJKY1iKUOoURfXhe6JwPWVsKLZBl3IYsDl0L477O0n4HnmwGFRt9e3FZDdeAryKMJm2rcyKeL5tSAPURBFQHxO/FIUA8Plvc7Cs7D0e9rpODbxo/eyptfMTE0XyDt6dxsBBvnIAnpx4n2+E1Bs8YiMPBevg91mA2iVowgXfwDLX/jM9vPjjqKIiwugCJhXV5g8kN7AKDlFfU7jhTo7QiCTqqd8G/wHqJWWm5+NMtLveCqOUqDb/Z86zQLksYXg0TO52zXUnCpAYjBlNFxTeYyfiwbSqzMsVfBcMAQl4dpj+xlGmQLr8yJsbzQZJzTAnLlWB6VbG/GwUNHONbPHAEcNNx0ZWZgAzwSyYlxDCeI8/m4TV7JoMxsIE03GztCAOqthlrHsklwjPNmqwHodHfb2uwhPFE4uPslIKOwEoEG1FlXe90OAHd9KrWUvbkRF7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(3023799003)(4143699003)(11063799003)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGRJMDNsZHVQV3I1UVhiSEtUT2c2dW85UmYzeGxOQWlZdExpVSswaFRCaklZ?=
 =?utf-8?B?b2VBVmZPeWR5R0dpSmwzNlJiUExZaXRHZmV3aFplOThpelVaRTlTNVNsVkpS?=
 =?utf-8?B?ak5DbXA5N0NLVnp6Nkk5RTd0V1pwWE1PSm9YK0VmS0lsWFpzNkRNcTJmeDdz?=
 =?utf-8?B?U3F2b3lCVDNXUWNDemU5TldnOVFmMDdLalhVcEVIQ1N1MnlKeTFBeVhIazRJ?=
 =?utf-8?B?VkEvQjBvdEpVaXA1NGlZOUsrT3pCSnZCU0owOEJUakhueDI1TEJEZUdoQU1L?=
 =?utf-8?B?UjUwVXJJSVBTN3FHTFpHVE0xb3psNFJ6alpiazQ5U1Z2ZzZ6akM3K3VWdCtJ?=
 =?utf-8?B?Q0o1RmlBdThFUXJDWjFraWF0Q0dpd20yMVpDUDV6bFBjODRRaEUwd0cwSmVt?=
 =?utf-8?B?U0xMK2p1QXN0YTF6UHE2dmZ3cVdXYjdqQ21HZlJaYVJ0bU5WUjZzaUtCMFB1?=
 =?utf-8?B?c0cvUDgrQTEyY2orVmFBdXllMVlBcitTSC9PRXlyelBjQzN1ckZUd3F1eWhq?=
 =?utf-8?B?eUtURkFDUmkwUXFTd2wrbHY2c0VGdlVmS1I3ZXQxN1gvT3dZekhSekFXM3Jz?=
 =?utf-8?B?Smx2amJ6T1pOT2JJdHI1bFQ4RlFpZDF1TjdCSlEzdE5aSGJId1NUSWI5SVR3?=
 =?utf-8?B?WVJRQ3ExVzBhS1VubUxEdTRrUnZ0TCt1cjRkWFZiT2lnQ2Nld29BNm1USSto?=
 =?utf-8?B?U1A5OFYxT1ZOODNjRmUrWldKeWhkanFkNHNtaWZ0dkxjWC9Wa1FQSVF3disr?=
 =?utf-8?B?T3kxWHVNYWVkdjR6Z3pDWVh0SEkrR2I4Vnl5ekl5aFhJbVdJbjhaTkVLOWpu?=
 =?utf-8?B?cXF0MWhEUzMwVUFwREp0V2NWTWQ5R1JweXdDOFMyZ3pDaVVTVTZ3Y25WMjhW?=
 =?utf-8?B?NG12UitVMi9tNVdpdXQvOVUxNUs2UklZd1VlRm4xR1dNeTVuZVN5VU8zWEIy?=
 =?utf-8?B?VWtacUx5cTZaS0JzNGwzcWI4S2o2MUVVaEV6UXpwYTB6bEdlRDVxOHE5VTZh?=
 =?utf-8?B?QkNrMXQrWXZ5ZXp2U1ZyQlc5enl1SCtNeCs3bjk0Nms2NGd6TDBOYS9DeTBU?=
 =?utf-8?B?UnZ4b1ZSTDZ1UndKaHhvMzJjK3pyMmdHOVB2N1dPNTYwMVhTdUlKZmRUd0VD?=
 =?utf-8?B?TmFTYjlmUXNTcGtPcXlEV1dGOXEvTHU0aUs5WHBqWnN1c1UrTTQwUEVpazZm?=
 =?utf-8?B?ems0d2VobnN3NEtEbWJBOFc4UmtOWHhTT3QxQytORkVEbnc2WXZTOC9FSEI3?=
 =?utf-8?B?Qmw3MU9tb3VWUGEzZ2FWdVp5RjRMbGN2a2szVC81L0JsTUd4UzhSM01zSlp3?=
 =?utf-8?B?SlRCb09BeVFNdm1zcUV0Z0QwWGZ2elY3SG5tTHlkVXBPU1dZcTZFU0hLZDFY?=
 =?utf-8?B?RTFyNExzZTBZa1pCclgya3NDd2IwWHpzaGZFZHRzck8wSmkwNGwvVmx0QzFN?=
 =?utf-8?B?SGFITEN1UEFOeGFSN1RWWHcxdW1kdmh6QWtnS2NzeWFVTVkwT1lxV2piRlZ6?=
 =?utf-8?B?K3VpUWlZQkNTVS9BNGt5dWh0OS9EQTl3OFhLZGpWbDYrRHJiTUpEbjdJWVpl?=
 =?utf-8?B?MzBIa1ZKSGQyZHlxdmJKTDdTcGk2K2U2bkp0dGpKL2pRY2tqODVzTjd3TWR3?=
 =?utf-8?B?QXQ4alczUVhGUUVPcHROSkZoUWJoSGRqTUtxSWFVQURHWXJXeXNQM3hXR3Bv?=
 =?utf-8?B?c3F5eGJwakJaS1lwY3NhSVliU1NFakJBWENKM0RTR2xyK2VDQkpPWGlsNmpD?=
 =?utf-8?B?Qmc0N0RXczVZL3BHQ080ZFVoOGxzL01yV05mMkJLZnpTaE1PZU55ZU5sTVBC?=
 =?utf-8?B?MVRJam45ZjhjMTVFbVZWSmJnTjY2SS9pcUNtMFBXSXFxeTQvVVMySGZva3JV?=
 =?utf-8?B?SlRXWW5panRSRUxSRHZvS25xV3pmcXpzZmxUeTE5K25QYWcxY1lsbnEwQnNP?=
 =?utf-8?B?TDdqcXFrUEJBcnErZ1Boa2RBQkZFbXlESVFrRGVZUVF5YXVRSHR3RG9HZVNF?=
 =?utf-8?B?N0JmVkptbGpxK0RDV21XazFwV1ZtamFENnVqbDY2RTBCSG5QYjJWczFKRjhP?=
 =?utf-8?B?NzYyTk9GOTJJNzJpYzZkUVpwU1JaNkw5NHZlejdnb1NkWFpheDRmN3hldEJR?=
 =?utf-8?B?UUIwNy9yVkZWN1RqNmdQNlk3eUJHZk8rdkNKR2NLWFZ2LzAwVUo2ckV4RGFS?=
 =?utf-8?B?ZGhOZXYxWUJiQ1p6bm10OE9ZdWYwQ09QcWpSaW1qWUpJZzFtSlNtaHFZNGxG?=
 =?utf-8?B?MmVzbHBlejNheXg0YjRHczZqdVB6ajBMRUdzN0RQMXByOHpFMHRxU1dKU0Fp?=
 =?utf-8?B?V0ZwNUhiTTJCdEc0L3ZKcW11c0dVVkMvY2NyeUkxRFpjSnZ6R3ZVQT09?=
X-Exchange-RoutingPolicyChecked: XqSJox8QP73SEQlob01eQlDcHGGYXQbPTmT86wq30UtTgBXvvj2bCAUUL79LE67fe3s+XaE0HtpCbJ/hl9DHMVaEfmMK6ih4pnTkInAAiivZC8mqC7tk5HmAZaYVNbp+tQ/xgqcJi/NEjkJ+2Wie3y++iSoTtcg58wDEaqhk21e4OdFCdftsFZfVULAfpzSII/Q74wd5wQwGE1nN0x2/1jzF91kqKEZ8ni90GyEpx8wVCwDE9ZOMKbaqwynGb6oha59fYGn2aEuHXdVbNPbIjn8jsIxhE3r48QNPn+J0w5PXisB+VWxFmfBd012Cn7lBQtrtnncWpGWOBtKIEG0/cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 596d1443-dd35-45ad-8d63-08deb51e44e7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 20:44:34.4463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IYBFprCSP8p0QrVC6oXIGYb0W4Q6szKECWN2+5Y7irQI7Fj6141O7M9yCiAoW3v5M6vEtM7Jk9XHNJer7s1PQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2F7FC4EE6
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


Adding some things I forgot in my previous reply...

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Violet Monti <violet.monti@intel.com> writes:
>

I think the commit subject is a bit vague. We could try to be more
specific with something like:

  drm/xe/rtp: Ensure gt_was doesn't check for engine types

>> It is currently possible for a RTP rule, and subsequently a workaround,
>> to expect contexts that may not be present when the workaround is
>> applied. For example, the workarounds in the engine_was[] in drm/xe/xe_w=
a.c
>> expect an engine entity to be active. Conversely, the gt_was[] is not
>> depending on an engine entity to implement its workarounds. This kunit
>> test addition checks the gt_was[] workaround list for any workarounds
>> with specifically an engine_class rule. If a workaround does have an
>
> I think "an engine_class rule" can be a bit vague. I would spell out
> ENGINE_CLASS() or XE_RTP_ENGINE_CLASS().
>
>> engine_class rule, the workaround is then checked for the
>> "FOREACH_ENGINE" flag, which ensures the workaround is not implemented
>> in an improper context.
>>
>> The result of this test is an expectation failure if a workaround has an
>> improper engine_class rule, and aims to prevent future issues of
>> gt_was being applied without proper contexts.
>>
>> Signed-off-by: Violet Monti <violet.monti@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
>>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 76 +++++++++++++++++++
>>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h | 24 ++++++
>>  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
>>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
>>  5 files changed, 107 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
>>
>> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/test=
s/Makefile
>> index 0e3408f4952c..f7aa47f11a36 100644
>> --- a/drivers/gpu/drm/xe/tests/Makefile
>> +++ b/drivers/gpu/drm/xe/tests/Makefile
>> @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
>>  xe_test-y =3D xe_test_mod.o \
>>  	xe_args_test.o \
>>  	xe_pci_test.o \
>> +	xe_rtp_tables_test.o \
>>  	xe_rtp_test.o \
>>  	xe_wa_test.o
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu=
/drm/xe/tests/xe_rtp_tables_test.c
>> new file mode 100644
>> index 000000000000..100cac379b08
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>> @@ -0,0 +1,76 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_kunit_helpers.h>
>> +
>> +#include "xe_kunit_helpers.h"
>> +#include "xe_pci_test.h"
>> +#include "xe_rtp.h"
>> +#include "xe_rtp_tables_test.h"
>> +#include "xe_wa.h"
>> +
>> +static void xe_rtp_table_gt_test(struct kunit *test)
>> +{
>> +	const struct xe_rtp_entry_sr *param =3D test->param_value;
>
> I think it makes sense to call the variable "entry" here, like done in
> other places for instances of xe_rtp_entry_sr.
>
>> +
>> +	for (int i =3D 0; i < param->n_rules; i++) {
>> +		if (param->rules[i].match_type =3D=3D XE_RTP_MATCH_ENGINE_CLASS)
>
> We would need to check XE_RTP_MATCH_NOT_ENGINE_CLASS as well.
>
>> +			KUNIT_EXPECT_EQ_MSG(test, param->flags,
>> +					    XE_RTP_ENTRY_FLAG_FOREACH_ENGINE,
>
> If the entry has other flags set along with
> XE_RTP_ENTRY_FLAG_FOREACH_ENGINE, this check would fail.
>
>> +					    "GT WA %s has an invalid engine class rule setup",
>> +					    param->name);
>
> I think it would be simpler to replace this with something like
>
>   KUNIT_EXPECT_TRUE(param->rules[i].match_type !=3D XE_RTP_MATCH_ENGINE_C=
LASS ||
>                     param->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE)
>
> And another one like that for XE_RTP_MATCH_NOT_ENGINE_CLASS.
>
> Since we are using entries as parameters of the test, the RTP entry name
> will be displayed in the kunit output, so I think we can skip the
> explanatory string.
>
>> +	}
>> +}
>> +
>> +static int xe_rtp_table_test_init(struct kunit *test)
>> +{
>> +	struct xe_device *xe;
>> +	struct device *dev;
>> +	int ret;
>> +
>> +	dev =3D drm_kunit_helper_alloc_device(test);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
>> +
>> +	xe =3D xe_kunit_helper_alloc_xe_device(test, dev);
>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>> +
>> +	/* Initialize an empty device */
>> +	test->priv =3D NULL;
>> +
>> +	ret =3D xe_pci_fake_device_init(xe);
>> +	KUNIT_ASSERT_EQ(test, ret, 0);
>> +	xe->drm.dev =3D dev;
>> +	test->priv =3D xe;
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_rtp_table_test_exit(struct kunit *test)
>> +{
>> +	struct xe_device *xe =3D test->priv;
>> +
>> +	drm_kunit_helper_free_device(test, xe->drm.dev);
>> +}
>> +
>> +static void rtp_table_gt_test_desc(const struct xe_rtp_entry_sr *t, cha=
r *desc)
>> +{
>> +	strscpy(desc, t->name, KUNIT_PARAM_DESC_SIZE);
>> +}
>> +
>> +RTP_KUNIT_ARRAY_PARAM(rtp_table_gt, gt_was, rtp_table_gt_test_desc);
>> +
>> +static struct kunit_case xe_rtp_table_tests[] =3D {
>> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, rtp_table_gt_gen_params),
>> +	{}
>> +};
>> +
>> +static struct kunit_suite xe_rtp_tables_test_suite =3D {
>> +	.name =3D "xe_rtp_tables_test",
>> +	.init =3D xe_rtp_table_test_init,
>> +	.exit =3D xe_rtp_table_test_exit,
>
> We do not need fake device initialization for the current test being
> done here.  We can simply drop those functions and the .init and .exit
> initializations here.
>
>> +	.test_cases =3D xe_rtp_table_tests,
>> +};
>> +
>> +kunit_test_suite(xe_rtp_tables_test_suite);
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h b/drivers/gpu=
/drm/xe/tests/xe_rtp_tables_test.h
>> new file mode 100644
>> index 000000000000..3e91dd08f854
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0 AND MIT */
>> +/*
>> + * Copyright =C2=A9 2026 Intel Corporation
>> + */
>> +
>> +// The "gen_params" function functionality does not work to dynamically=
 collect the size
>> +// of the WA array, even with the new n_entries pointer. This addition =
builds on that framework
>> +// to allow dynamic sizing
>> +#define RTP_KUNIT_ARRAY_PARAM(name, array, get_desc)						\
>
> The only user of this macro is xe_rtp_tables_test.c, I don't think we
> need to expose it via a header.
>
> I also think RTP_TABLE_PARAM() would be a good name for the macro.
>
>> +	static const void *name##_gen_params(struct kunit *test,				\
>> +					     const void *prev, char *desc)			\
>> +	{											\
>> +		typeof((array.entries)[0]) *__next =3D prev ?					\
>> +			((typeof(__next))prev) + 1 : (array.entries);				\
>> +		if (!prev)									\
>> +			kunit_register_params_array(test, array.entries, array.n_entries, NU=
LL);\
>
> Do we really need to call kunit_register_params_array()?  Looking at the
> implementation of kunit, it appears kunit_register_params_array() is
> meant to be used together with kunit_array_gen_params() as the parameter
> generator.  Here we are using our own custom generator.
>
> By the way, I wonder why kunit itself is doing that for
> KUNIT_ARRAY_PARAM() and KUNIT_ARRAY_PARAM_DESC().  Commit b820b9077b7f
> ("kunit: Enable direct registration of parameter arrays to a KUnit
> test") is the one that added kunit_register_params_array() and says the
> following:
>
>     "The arrays passed to KUNIT_ARRAY_PARAM(,DESC) will also be registere=
d to
>     the parameterized test context for consistency as well as for higher
>     availability of the parameter count that will be used for outputting =
a KTAP
>     test plan for a parameterized test."
>
> , however, the registered data is only used if the generator is
> kunit_array_gen_params() anyway, so the registration in those macros
> seems useless.
>
> Bottom line: I think we can simply drop this call.
>
>> +		if (__next - array.entries < array.n_entries) {					\
>> +			void (*__get_desc)(typeof(__next), char *) =3D get_desc;			\
>> +			if (__get_desc)								\
>> +				__get_desc(__next, desc);					\
>
> Since we are writing this macro specifically for RTP entries, I don't
> think we need a "get description" function: we can use __next->name
> directly here.
>
> Also, for the description, I think we could also include the name of the
> variable, for completeness.  Today we are only adding gt_was, but in the
> future we could add others.  Using the variable name in the parameter
> name here should make it easy to correctly spot the offending RTP entry
> in a expectation failure.
>
> Hence, here is what I would suggest for such a macro (tested locally):
>
>     #define RTP_TABLE_PARAM(array)								\

Maybe we should use "table" for the parameter here, since we are
expecting xe_rtp_table or xe_rtp_table_sr instances?

--
Gustavo Sousa

>     	static const void *array##_gen_params(struct kunit *test,				\
>     					     const void *prev, char *desc)			\
>     	{											\
>     		typeof((array.entries)[0]) *__next =3D prev ?					\
>     			((typeof(__next))prev) + 1 : (array.entries);				\
>     		if (__next - array.entries < array.n_entries) {					\
>     			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #array "/%s", __next->name)=
;	\
>     			return __next;								\
>     		}										\
>     		return NULL;									\
>     	}
>    =20
>
>
> --
> Gustavo Sousa
>
>> +			return __next;								\
>> +		}										\
>> +		return NULL;									\
>> +	}
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 39c507edb8ce..285072fe0a47 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -130,7 +130,7 @@
>>  __diag_push();
>>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> =20
>> -static const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
>> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_S=
R(
>>  	/* Workarounds applying over a range of IPs */
>> =20
>>  	{ XE_RTP_NAME("14011060649"),
>> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
>> index a5f7d33c1b32..17dff615e507 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.h
>> +++ b/drivers/gpu/drm/xe/xe_wa.h
>> @@ -6,6 +6,7 @@
>>  #ifndef _XE_WA_H_
>>  #define _XE_WA_H_
>> =20
>> +#include <kunit/visibility.h>
>>  #include "xe_assert.h"
>> =20
>>  struct drm_printer;
>> @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *til=
e);
>>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
>> =20
>> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
>> +extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;
>> +#endif
>> +
>>  /**
>>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as n=
eeded.
>>   * @gt__: gt instance
>> --=20
>> 2.43.0
