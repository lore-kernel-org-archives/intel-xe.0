Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5851CCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:39:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9533410E1DD;
	Mon, 13 Oct 2025 17:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQLn5W24";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF1910E1DD
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760377153; x=1791913153;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=aLjBjkB4Js4jTSItEBhgUKOvuC1vO/OZyGz4KmF9+mo=;
 b=LQLn5W24gifQfFvWfRen9nr/0NaSBXFlRNy3wYBuG8KBfjZwr1FJqrTk
 I25EDaL+4q44H/AKRAxx430XIsv/Y5p1ie/9BgUW+4kkQdHIIEziZvti5
 87V6oCDFQjAPwlVLNc0OXVdgfl20I/hxmcQN4EnaqHSCU3iaRd3eOzKTT
 daAfwARxtmPgrqg0RIAzxV83yn2L+H8DwefUWAXN8JmiPUPO3v9p294p/
 wFtJyetX7H1OQ2HhhUpBQQ+7lj3NxkMoEhXniMcKO3vVBPQKVHbkaRGTH
 /xvVFGio+u4wSERLXeiOzM1wqkZDRRouvwz3J7XB9kmjYsuUa7HwWAM4T w==;
X-CSE-ConnectionGUID: y0AYApXAQVGzMddMCyW20A==
X-CSE-MsgGUID: ME78aCNaTrKKb5hHxeCu4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62435627"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62435627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:39:01 -0700
X-CSE-ConnectionGUID: 1LUMN0BVSt2T8ct3U8ohHA==
X-CSE-MsgGUID: cSlqpvb6SXObYKmDZlAChg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="205351012"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:38:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:38:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:38:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.45) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Us+CE7K0zwBVlBiw0wgiwGUkjRtBSj6FExqO7ccgcdjWmhW3fhIVSd+Y9IK3ql8ZUGerM+kaKWZeDvi4R3ynF0EijXS0iu/ep3FIJlFsRqvH9U4V27OMpnA51qisLpOpMv6BaeMpOwzsO2n63pbQFv0LxbDhg4ZLP6FseQIiapCzpOOXWnaHI4+kjlRuYM8W/uil9iIi2dywH3TiN8dIWnOc39K42MjkC/2iWDvJDZkhUKlk1tepl7/1/NxxKiYwr+UACXGwIWtig10hVRgj5ZQRYgmq2PijYNE98JZ3EddbC+Mi9HeEp7Ztggieu9mjj6FTFgzAKP69GxRJpHCmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLjBjkB4Js4jTSItEBhgUKOvuC1vO/OZyGz4KmF9+mo=;
 b=gQs3bcyhIjblPrHCR9HT06dD1MwR1N3fdz3ZceYsqkAVELa+sl9vZEhsDERXY1xzgQEMpAWDMzxFIKc4k3L3M7hIIEfoHMa+ZBS2AXeKWn2apDN+5zkFhCzdrhPv3GzzNsNspIKodp1G37B1S/Wd6DY8awubEULjMGw3QYyClp9AMD5nGSFhnYUFXkffsG5SZQ6pmUA5iBhvBmp1Kxe8tIkhuZ1kupjItMZ7opt4XhNAQSQJqwBlqtP0Wxf/m/8jNKektIq9/dEi9NKtN/EUT2j7+JyFZpOWvkkx7IMCMS5u9oavCyhvQ17kHYYNe8Rf+WcpCguM3T8pNDc3mMjyTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 17:38:56 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:38:56 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Thread-Topic: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Thread-Index: AQHcPF371ZmVGh4OnE+kD6NCwCmWbbTAS/GAgAAF9YCAAAO5AIAAAiOA
Date: Mon, 13 Oct 2025 17:38:56 +0000
Message-ID: <a31742e0f4246746954e30e513ba4dde0c099741.camel@intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <20251013162504.7768-7-stuart.summers@intel.com>
 <aO0vRcrh+vYm8JbN@lstrano-desk.jf.intel.com>
 <69295444f047934f6f8a711b939bf1306dce0416.camel@intel.com>
 <aO03ZANSaEfzOo1w@lstrano-desk.jf.intel.com>
In-Reply-To: <aO03ZANSaEfzOo1w@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: aa3a1f10-43d6-4bd7-f318-08de0a7f62c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aTJYTzdiZlE0WVl3dnZPNHVJdVhVYXIzVnJzRXJ6aWprUEVsMy9rbFZNVE9n?=
 =?utf-8?B?VkduTC9uNURKYnRmdURscFpMZTJoc2xOd0JlWHdoWHNDbW9ZWStleVZDbno4?=
 =?utf-8?B?SDdFRGliMGN2TmY2dXZiblIxSUV6SU9MZW00Vm1DV1puQUZGSytnM2dQTUNq?=
 =?utf-8?B?TGhQWXllWnNhQ084Zy9uU0kzd2RJK2JqTmpwcDhjKzc5L1p5WXZHNWRCNTFO?=
 =?utf-8?B?RWlLdlp1S3JYMC82SWVKTGo1NkgxOU5rbkpBRzVMR3FKSCt4RzdOaW4wRHhH?=
 =?utf-8?B?Z2ZYdDlidko4WWhoV0djV2VnQ3Brd1BqNFpqaXdFZEUrZjFsRnY2ZFlkWm1o?=
 =?utf-8?B?SFRZYVppL0Z4OTNxaE1iZ1BINXE0UjVpR3VUYWdveDJBS3JYbEJ4RDZsSy84?=
 =?utf-8?B?UkxUd3lUaFVzbE9tdVpaL0t5NUVXYWtzOHJkM0dYK00wZVNQcmp2dnlVTTZn?=
 =?utf-8?B?WnpvQWcxbGoydXNiKy84dDhtTERGRGV3TEFiZjFhS1BFbS9CR2luVmIxRlNP?=
 =?utf-8?B?c2hDMXhING1SZnJ4NnhWTmZobkNZc2hobnJxclEwclVoRWxZYXNselZwaDZG?=
 =?utf-8?B?SVZYQkVCM3pDcFhpekNuYjB1aTJnQk5NcHdXcE9VckVzN0RKZ1JnTmVoaS9V?=
 =?utf-8?B?bUFCdnNYK1g3a2QyVWxIVEZPTS9xRFJtWWk4emFLenJoVlhraG1zTVNEakpt?=
 =?utf-8?B?UHlWNEl1QU1manFXQ2dEeGtvYyt4S3dlTXpGc1ZxMkxoRSsxVzlYZ1ZFUkdM?=
 =?utf-8?B?dUlBb01MQmp0b05SbjhnNGJ4QW15bUFac1UrdWlyYmk5RktLUklHSmM1QWNk?=
 =?utf-8?B?dXRQekh6ckhPWW1VcjhOUmRPdVhOVFJwYndjaDV2bDE3VzM0bFdwRXFjdUZq?=
 =?utf-8?B?enRPZlhTc0VwUG1idU1EaTFBRVhBWGZCMDRWemxST3R2dVBMblVHVFJNRHBl?=
 =?utf-8?B?c2lMM1Q5S0hJcjN3UkVhbi9BTmt1djlMMktoY0ZxTC9sS3FLUXVTUFlUdTRt?=
 =?utf-8?B?ZXZKRzYzYis4UUovc0lxZFVaWVZ3dHJmcENQZEZMTjQvMWozTVg3ZjZQZTU5?=
 =?utf-8?B?Tm5HK0tvOXFVaTZjS0N2OE9aZlZpQ2ZFQlgwNExpNnhUdGpIMk50N0lYeFdQ?=
 =?utf-8?B?eDhkb3pvcDd1Zk04VkRQYlUyZWtYUXVPQlNGMjAvNlNlWUpkVWR3ZnhDZzQ0?=
 =?utf-8?B?d1dVM2tDZ1FLZVFQZlNlRU1HVzZZMUl3WHFySERXdkhpODAvVXF5Mlg2b1o4?=
 =?utf-8?B?cmM0Ryt6VWcvTk5PWi8yOWlGeDF3SHU4b3F1ZG54NVEwNUJKZUlvNWZTQUhC?=
 =?utf-8?B?TEF3aVdrTVlNajA4VkVEdzVIODMyRndkN3BJQTYrRi9GWmpVTkFMdGpJalJS?=
 =?utf-8?B?UU9Fa0FVdVMreFRQaUoydHB2Y2hvYXBURVdmYnQ0d0NWL2daTkh6eVZhNWEx?=
 =?utf-8?B?STNtOEs2TkxzR3VTU2tRbDByOEFaNjVTcDdhTkEvRjZUMlFONG5HdXlqVTJt?=
 =?utf-8?B?R1NkOWZIdUNscE5kT2RkWUlYZHBlOE02VDZDZDZ3V1luZnJZS0xod2VWcmlQ?=
 =?utf-8?B?RUdxVkdaQXYzTHRyZDB5c2ZJODZVN2JxcmJibzA0T3kxOG5jN0U1aDdXTmRk?=
 =?utf-8?B?dnpvU3B1SHE1QjJaeVJsTDRNSHBTbjdjcE1JdkVNWWYvV3ZlN29ySnZFVzg0?=
 =?utf-8?B?bktyUFlMZkk0eWh1UXQ2YmtOaEh6M2RNMXFzcUkrR2FoaVF6N3FjTisyMGhq?=
 =?utf-8?B?T0JML2tHUVRodzhFckxEWlpTTDY5OVI4Tk9IL3BjdTlrTStmSzdKR05Ucmk0?=
 =?utf-8?B?d2EzTzRvV2luU0dSQ1ZFaFlnNGl4blBVd1BpNWFnLzVJczhqS1UxeU9YbHpq?=
 =?utf-8?B?b3FsT0lqODNwN2ZLcndRRmYrSmNaaS9seEhwMXpGdEFtY3dLY1k2NEw5RkVk?=
 =?utf-8?B?NFFoZmN5YXlMSGovb2xWNmJWNStLaElEREdOcVEyOHRFakdieENOTWpHRlBU?=
 =?utf-8?B?ZVFyNUx5NTBnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z0szTkVHRWg1elVmSnQ3ck5tT3owMUovZlZRRWsxOGJtdTN1QVN3eWp6WlBC?=
 =?utf-8?B?bUFMN3BHUktObjhhWkVBS0lhcnp6WWxCclVsUW11cjdVZW5rb25EWllOZStk?=
 =?utf-8?B?c0pSdWFYS040dGk2ZCs3K2VQZFVXTzZtQWpGQ1VXdnVFclFIbkZrMi96N1Mr?=
 =?utf-8?B?NFIwYkZETi83MEdGYTZTN3FoaFJSYWV0Z2RnVUYwUG05anVTUW8yMUE4U1Bi?=
 =?utf-8?B?R2NmR1Z5SkN5Vy9LV0UySUhmemZPYXFwUzdoa1BXS09GVVZ3cSs5dXNMSXRs?=
 =?utf-8?B?SlVaYVNqblBwMytJYlQvZ3N5NlJqeVZianVIdTdkU2w1YkZabUNzMmhqTUs5?=
 =?utf-8?B?aHRkT2lyQzBkRTdkcVdDYmZES3Ixd3d5UHJSNTUrWm9xQzlrSXdSMTBxUEpl?=
 =?utf-8?B?d3lPem4zbnlTa1F1ck1yOUlKMDBLd1VPMU5lNXFIblViR2VlMEcvUE1JcWdU?=
 =?utf-8?B?WVowai9HTWdEaEFIV0xiMUJTY3kzVzlTNXdQcHlNekJoekRSV0FzRFlvbXR2?=
 =?utf-8?B?cWxCY0hMdTc4Q002ZmtlOUdIdUtETHlVWFJjVG4vYmNsbFdRZ0QwVVNLK0Jo?=
 =?utf-8?B?UEh6NFo2SkV3aE4rZzEzYmsxSExOenM3eU5kRjdxU2RCeFc0V0tMZDd2TVA3?=
 =?utf-8?B?S2djdG5CQ3o2TnN0UGZVdE1uWVBwbWpLT3FJbHMyUzFGRlhORi9Zd0x0d3FI?=
 =?utf-8?B?WnduOXNodUMxcFVWZWdLQVNQc2pXdUdtM0pTdEl4cXNnK1NxNkcreGxidngw?=
 =?utf-8?B?VVA1M0QxRW1GSFZYM1NBaGR4UWNxMVgvdnNIT3orN3hUa0JNRnRhSUp5ZUMv?=
 =?utf-8?B?ZkVKN1dUWXpNR2QyRXQ1bTlxZHp6UzlnQm0ydTNMZU4wbFp5aWdVU0VVTWkx?=
 =?utf-8?B?d1FYM1Y5RXllMk1GNFJwakFrZHF5VFgwbFltam9yWTNLREV3cXNpeEs3MGlt?=
 =?utf-8?B?NHZ2NjBYVitOOEhJckhSYzNGQjFRVlBleXZKZm5IUG5qRkdiWlhCSXBZUVRu?=
 =?utf-8?B?MHF3NjRYSDE1WmJFSTM3WTV6K3ByOE1tRnBWQ2NTU3BPaWFOMzJ3cmhROGl3?=
 =?utf-8?B?OFVSZmVTdXR0bzlKcHIzVzZXbGpOV01wV2Y1V2tkVEtId0pmNktWMHJyODhu?=
 =?utf-8?B?YzlEcy9rN3J3cU95bVNFYit0RlRyclFkTUNMdVlySlJzTm0zTkNqT05KZ25L?=
 =?utf-8?B?cDJqbE9SZWpkYWtGeUxYNnU5TVd1d3N2ZDU0MEZML0VTNlVybGltTjRnVU5a?=
 =?utf-8?B?UXlacHpLUUlxRlNCdlE3ZmFEM0M5NGhTeTZNSmRac3FQZFhQckVWMTB4K1E5?=
 =?utf-8?B?SE9ZSXhmcytmQlRUZ1R0SUZZN0V6S1NJNE84cGJGdHlVbUFZWE9SSm1LN3lM?=
 =?utf-8?B?bjM0a1B4NVB4cXQ4bDNZdDIwcGNDNC9EOEJGci9JYm5sZDZWMGU2NkxNSklN?=
 =?utf-8?B?eFBtS0IvZHpZSWd4cjlMV3FTS1MrZHZkV3R0Y0xDU3VEekhZOHJlUzN3bklI?=
 =?utf-8?B?UEl2RjlaazNJdHIzY0gxdnJadFJqQkxWU3pRQ09wNVJQSTRwOGRKZ0crbHRZ?=
 =?utf-8?B?UXF4NVpTTmkwRU5KYlFnbG5xWGplVEN6WmVNT1doemt4RW4zRllMWDhONDNk?=
 =?utf-8?B?SUo1MDVYcmk1bWpuZEdPQzRPVi9sL0VoaHJCcWJrbGRzelZLVWkwS3BuOHZx?=
 =?utf-8?B?bGQzZkF4a0ZROHpteW5GQ1JUSlI1Y3ZUVFN2eVdiZm5mdi9aYzQwMGVRMC9C?=
 =?utf-8?B?SjJsY25HT0FXZ2Fid0d6OEF0TTRmaXBNdmt4NmdvNXJ5MGVhRVhPbGV3TUxG?=
 =?utf-8?B?TGt3Z1VuM0haMHVZUVJ2OGw4aThINTJHdHhzSjZZWkp4c0xyL1ZVdGVkZ3B5?=
 =?utf-8?B?U1M1UWFKbktvNEltSi9lTnJGN1plWGhIZi9kQkJqbHZGQ1VmeWtYRjZPajQ1?=
 =?utf-8?B?Z0MzdTNUcDVmb3M5TFdzcmMrd212dTNoV0w3d2pqZi8rbGU4YlBMRy9rMmk4?=
 =?utf-8?B?RHlmSjhRVzBXMUpzY2o1ZjdmQkR4Tmp4RE5ERytVUHRESStoVlBZd0VLdmNW?=
 =?utf-8?B?VmFKQm8wcmtUM3BsaTcvNUNmZ09MNGx2N2dDbCtDek84aFE1ZlRWbjloZGI2?=
 =?utf-8?B?YlkxbU5PY0JhQUdJaktxaERscE9PdGZDdGlHM3RrTnQ4K0x2R0dhVVQ4RTF1?=
 =?utf-8?B?aVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87557B7D57913E468745102EBA10EEFE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa3a1f10-43d6-4bd7-f318-08de0a7f62c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 17:38:56.7264 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QW5rNWoK/o/ahzKbaLHYMJzxY6dGjNnvoztXi63AiPYrG/2DaX3ePW419NTyUPEu+xkaaK0sGEJo+89tSyKvCOc3qjKcITyU4T1EgTQiMKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDEwOjMxIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBPbiBNb24sIE9jdCAxMywgMjAyNSBhdCAxMToxNzo1OEFNIC0wNjAwLCBTdW1tZXJzLCBTdHVh
cnQgd3JvdGU6DQo+ID4gT24gTW9uLCAyMDI1LTEwLTEzIGF0IDA5OjU2IC0wNzAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgMDQ6MjU6MDNQTSAr
MDAwMCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IFJpZ2h0IG5vdyB3ZSBhcmUgdXNp
bmcgdGhlIHN0YXRlIG9mIHRoZSBHUFUgc2NoZWR1bGVyDQo+ID4gPiA+IHRvIGRldGVybWluZSB3
aGV0aGVyIHdlIHNlbmQgYW5kIHJlY2VpdmUgbWVzc2FnZXMuIFRoZXJlDQo+ID4gPiA+IGFyZSBz
b21lIHN0YXRlcywgaG93ZXZlciwgd2hlcmUgd2UgbWlnaHQgaW50ZW50aW9uYWxseQ0KPiA+ID4g
PiBwYXVzZSB0aGUgc2NoZWR1bGVyLCBsaWtlIGEgZGV2aWNlIHdlZGdlLCBhbmQgZXhwZWN0IHRo
YXQNCj4gPiA+ID4gbWVzc2FnZXMgYXJlIHJlc3VtZWQgbGF0ZXIgb25jZSB0aGUgdXNlciBoYXMg
dGFrZW4gdGhlDQo+ID4gPiA+IGhhcmR3YXJlIHN0YXRlIGFuZCBpcyBhdHRlbXB0aW5nIHRvIHJl
c2V0LCBsaWtlIGFuIHVuYmluZC4NCj4gPiA+ID4gDQo+ID4gPiA+IFJlbW92ZSB0aGVzZSBjaGVj
a3MgaW4gdGhlIFhlS01EIGFuZCBsZXQgdGhlIEdQVSBzY2hlZHVsZXINCj4gPiA+ID4gaGFuZGxl
IHN0YXRlIGNoZWNrcyBpbnRlcm5hbGx5Lg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gV2UgY2Fu
J3QgZG8gdGhpcy4gVGhlIGVudGlyZSBxdWV1ZSBzdG9wIC8gc3RhcnRpbmcgbWVjaGFuaXNtDQo+
ID4gPiByZWxpZXMNCj4gPiA+IG9uDQo+ID4gPiBnZXR0aW5nIGV4Y2x1c2l2ZSBhY2Nlc3MgdG8g
dGhlIHF1ZXVlIGJ5IGVuc3VyaW5nIHRoZSBzY2hlZHVsZXINCj4gPiA+IGlzDQo+ID4gPiBmdWxs
eQ0KPiA+ID4gc3RvcHBlZCAtIHRoaXMgaW5jbHVkZXMgbWVzc2FnZXMuIFRoaXMgd2lsbCBicmVh
ayBqb2IgdGltZW91dHMsDQo+ID4gPiBHVA0KPiA+ID4gcmVzZXQNCj4gPiA+IGZsb3dzLCBhbmQg
VkYgbWlncmF0aW9uLg0KPiA+IA0KPiA+IEknbSBub3Qgc3VyZSBJIGZ1bGwgdW5kZXJzdGFuZCBo
ZXJlLiBUaGUgc2NoZWR1bGVyIHNob3VsZCBiZQ0KPiA+IHN0b3BwZWQgYXMNCj4gPiBpdCB3YXMg
YmVmb3JlLCBpdCBqdXN0IG1lYW5zIHdlIGtlZXAgc2VuZGluZyBtZXNzYWdlcyByaWdodD8gSSBj
YW4NCj4gPiB0ZXN0DQo+ID4gdGhlIGpvYiB0aW1lb3V0IHBpZWNlIHRvIG1ha2Ugc3VyZS4uLg0K
PiA+IA0KPiANCj4gVGhpcyB3aWxsIHNob3cgdXAgYXMgYW4gb2JzY3VyZSByYWNlIGNvbmRpdGlv
biDigJQgOTklIG9mIHRoZSB0aW1lIGl0DQo+IHdpbGwNCj4gd29yayBqdXN0IGZpbmUsIGJ1dCBJ
IGNhbiBhc3N1cmUgeW91IGl0IHdpbGwgYnJlYWsgdGhlIGVudGlyZSBkZXNpZ24NCj4gb2YNCj4g
c3VibWlzc2lvbi4NCg0KT2sNCg0KPiANCj4gPiBCYXNpY2FsbHkgSSdtIGFyZ3VpbmcgdGhlIHN0
YXJ0L3N0b3AgbWVjaGFuaWNzIHNob3VsZCBiZSBpbnNpZGUgdGhlDQo+ID4gc2NoZWR1bGVyIGFu
ZCBub3QgaW4gdGhlIGNhbGxpbmcgZHJpdmVyLg0KPiA+IA0KPiANCj4gVGhlIG1lc3NhZ2UgaW50
ZXJmYWNlIGlzIGJ1aWx0IG9uIHRvcCBvZiB0aGUgRFJNIHNjaGVkdWxlciwgcmF0aGVyDQo+IHRo
YW4NCj4gaW50ZWdyYXRlZCBpbnRvIGl0LiBPcmlnaW5hbGx5LCBJIGhhZCBpdCBidWlsdCBpbnRv
IHRoZSBzY2hlZHVsZXIsDQo+IGJ1dA0KPiBiYXNlZCBvbiBmZWVkYmFjaywgSSBtb3ZlZCB0aGUg
Y2hhbm5lbCB0byB0aGUgZHJpdmVyIHNpZGUuIFRoZXJlZm9yZSwNCj4gd2UNCj4gbmVlZCB0byBo
b29rIGludG8gdGhlIHN0b3BwaW5nIG1lY2hhbmlzbSBvbiB0aGUgZHJpdmVyIHNpZGUuIFRoZQ0K
PiBsYXllcmluZyBjb3VsZCB1c2Ugc29tZSBjbGVhbnVwLCBidXQgdGhlIGZ1bmN0aW9uYWxpdHkg
d2lsbCByZW1haW4gb24NCj4gdGhlIGRyaXZlciBzaWRlLg0KDQpBaCwgdGhhbmtzIGZvciB0aGUg
aGlzdG9yeSB0aGVyZS4gSSB3YXNuJ3QgYXdhcmUgb2YgdGhhdC4NCg0KPiANCj4gPiA+IA0KPiA+
ID4gV2hhdCBleGFjdGx5IGlzIHRoZSBwcm9ibGVtIHlvdSBhcmUgdHJ5aW5nIHRvIHNvbHZlPyBU
aGUgZGV2aWNlDQo+ID4gPiBpcw0KPiA+ID4gd2VkZ2VkIGFuZCBxdWV1ZXMgYXJlIHN0b3BwZWQs
IHRoZW4gYW4gdW5iaW5kIG9jY3Vycz8gVGhhdCBpcw0KPiA+ID4gcHJvYmFibHkgYQ0KPiA+ID4g
YnVnLiBJSVJDIGV2ZW4gd2VkZ2luZyBhIGRldmljZSAvIHRlYXJpbmcgZG93biBhIHF1ZXVlIHdl
IHNob3VsZA0KPiA+ID4gYWx3YXlzDQo+ID4gPiBzdGFydCB0aGUgcXVldWUgYWdhaW4uIFdlIGNv
dWxkIGFzc2VydCBpbiBndWNfc3VibWl0X3dlZGdlZF9maW5pDQo+ID4gPiB0aGF0DQo+ID4gDQo+
ID4gSSB0aGluayB0aGVyZSdzIGJhc2ljYWxseSBhIHJhY2UgYmV0d2VlbiBzZW5kaW5nIHRoZSBj
bGVhbnVwDQo+ID4gbWVzc2FnZQ0KPiA+IGFuZCBzdG9wcGluZyB0aGUgc2NoZWR1bGVyLiBBbmQg
b25jZSB3ZSBzZW5kIHRoYXQgbWVzc2FnZSwgd2UgZG9uJ3QNCj4gPiByZWFsbHkgdHJhY2sgaXQg
b24gdGhlIHhlIHNpZGUuIFNvIGlmIHdlIGFydGlmaWNpYWxseSBwYXVzZSB0aGluZ3MNCj4gPiBv
bg0KPiA+IHRoZSB4ZSBzaWRlIChieSBhZGRpbmcgdGhlIGNoZWNrcyBJJ20gcmVtb3ZpbmcgaW4g
dGhpcyBwYXRjaCksIHdlDQo+ID4gY2FuDQo+ID4gZ2V0IGludG8gYSBzY2VuYXJpbyB3aGVyZSB0
aGUgY2xlYW51cCBtZXNzYWdlIGlzIHNlbnQgKmFmdGVyKiB0aGUNCj4gPiBzY2hlZHVsZXIgaXMg
cGF1c2VkIGFuZCB0aHVzIHRoYXQgY2xlYW51cCBtZXNzYWdlIGdldHMgZHJvcHBlZCwgYW5kDQo+
ID4gd2UNCj4gPiBuZXZlciBpc3N1ZSB0aGUgZGVyZWdpc3RyYXRpb24gZm9yIHRoYXQgcGFydGlj
dWxhciBleGVjIHF1ZXVlLg0KPiA+IA0KPiANCj4gVGhhdCdzIG5vdCBob3cgc3RvcHBpbmcgd29y
a3MuIFN0b3BwaW5nIHByZXZlbnRzIGZ1dHVyZSB3b3JrIGl0ZW1zDQo+IGZyb20NCj4gYmVpbmcg
cXVldWVkIGFuZCBmbHVzaGVzIGFsbCBpbi1mbGlnaHQgd29yayBpdGVtcy4gVGhlc2Ugd29yayBp
dGVtcw0KPiBpbmNsdWRlIHJ1bm5pbmcgam9icywgZnJlZWluZyBqb2JzLCBvciBwcm9jZXNzaW5n
IG1lc3NhZ2VzLiBXaGVuDQo+IHN0b3BwZWQsDQo+IGVhY2ggb2YgdGhlc2UgaW50ZXJmYWNlcyBj
YW4gc2V0IHVwIHN0YXRlIHNvIHRoYXQgd2hlbiB0aGUgc2NoZWR1bGVyDQo+IGlzDQo+IHN0YXJ0
ZWQgYWdhaW4sIHRoZSB3b3JrIGl0ZW1zIGFyZSByZXF1ZXVlZCBmb3IgcHJvY2Vzc2luZyAoZS5n
LiwNCj4gbWVzc2FnZXMgYXJlIHN0b3JlZCBpbiBhIGxpbmtlZCBsaXN0KS4gVGhlIGtleSBwb2lu
dCBpcyB0aGF0IHdoZW4gdGhlDQo+IHNjaGVkdWxlciBpcyBzdG9wcGVkLCB3b3JrIGl0ZW1zIHRo
YXQgY291bGQgYmUgbW9kaWZ5aW5nIHRoZSBxdWV1ZQ0KPiBzdGF0ZQ0KPiBhcmUgbm90IHJ1bm5p
bmcsIHNvIHRoZSBlbnRpdHkgdGhhdCBzdG9wcGVkIHRoZSBzY2hlZHVsZXIgaGFzDQo+IGV4Y2x1
c2l2ZQ0KPiBhY2Nlc3PigJR3aXRob3V0IHJlcXVpcmluZyBhbnkgbG9ja3MuDQoNCk9rIHNvIGJh
c2ljYWxseSB3ZSBzdGlsbCBuZWVkIHRvIGtlZXAgaW50ZXJhY3Rpbmcgd2l0aCB0aGUgc2NoZWR1
bGVyDQp3aGVuIHBhdXNlZCwgd2UganVzdCBhcmVuJ3Qgc3RhcnRpbmcgdGhlIHdvcmsgcXVldWUu
IFRoZW4gb25jZSB0aGUNCnF1ZXVlIHN0YXJ0cyB3ZSBleHBlY3QgYWxsIG9mIHRob3NlIG1lc3Nh
Z2VzIHRvIGJlIHByb2Nlc3NlZC4NCg0KTGV0IG1lIGxvb2sgYSBsaXR0bGUgaGFyZGVyIGF0IHdo
eSB0aGF0IGlzbid0IGhhcHBlbmluZyBoZXJlIGFuZCBJJ2xsDQpnZXQgYmFjay4uLg0KDQpUaGFu
a3MsDQpTdHVhcnQNCg0KPiANCj4gTWF0dA0KPiANCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+
ID4gDQo+ID4gPiBhbGwgcXVldWVzIGFyZSBub3QgcGF1c2VkLg0KPiA+ID4gDQo+ID4gPiBBbHNv
IGlmIHlvdSBoYXZpbmcgaXNzdWVzIG9uIHVuYmluZCAtIHRoZXJlIGlzIHRoaXMgcGF0Y2ggWzFd
DQo+ID4gPiB3aGljaA0KPiA+ID4gZml4ZXMgYW4gaXNzdWUgdG9vLiBJJ20gZ29pbmcgdG8gbWVy
Z2UgWzFdIG5vdy4NCj4gPiA+IA0KPiA+ID4gTWF0dA0KPiA+ID4gDQo+ID4gPiBbMV0gaHR0cHM6
Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNTU0MTcvDQo+ID4gPiANCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNv
bT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2dwdV9zY2hl
ZHVsZXIuYyB8IDYgKy0tLS0tDQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ncHVfc2NoZWR1bGVyLmMNCj4gPiA+ID4gYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZ3B1X3NjaGVkdWxlci5jDQo+ID4gPiA+IGluZGV4IGY5MWUwNmQwMzUxMS4uZDlk
NmZiNjQxMTg4IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3B1
X3NjaGVkdWxlci5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ncHVfc2No
ZWR1bGVyLmMNCj4gPiA+ID4gQEAgLTcsOCArNyw3IEBADQo+ID4gPiA+IMKgDQo+ID4gPiA+IMKg
c3RhdGljIHZvaWQgeGVfc2NoZWRfcHJvY2Vzc19tc2dfcXVldWUoc3RydWN0IHhlX2dwdV9zY2hl
ZHVsZXINCj4gPiA+ID4gKnNjaGVkKQ0KPiA+ID4gPiDCoHsNCj4gPiA+ID4gLcKgwqDCoMKgwqDC
oMKgaWYgKCFSRUFEX09OQ0Uoc2NoZWQtPmJhc2UucGF1c2Vfc3VibWl0KSkNCj4gPiA+ID4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHF1ZXVlX3dvcmsoc2NoZWQtPmJhc2Uuc3VibWl0
X3dxLCAmc2NoZWQtDQo+ID4gPiA+ID4gd29ya19wcm9jZXNzX21zZyk7DQo+ID4gPiA+ICvCoMKg
wqDCoMKgwqDCoHF1ZXVlX3dvcmsoc2NoZWQtPmJhc2Uuc3VibWl0X3dxLCAmc2NoZWQtDQo+ID4g
PiA+ID4gd29ya19wcm9jZXNzX21zZyk7DQo+ID4gPiA+IMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4g
PiDCoHN0YXRpYyB2b2lkIHhlX3NjaGVkX3Byb2Nlc3NfbXNnX3F1ZXVlX2lmX3JlYWR5KHN0cnVj
dA0KPiA+ID4gPiB4ZV9ncHVfc2NoZWR1bGVyICpzY2hlZCkNCj4gPiA+ID4gQEAgLTQzLDkgKzQy
LDYgQEAgc3RhdGljIHZvaWQgeGVfc2NoZWRfcHJvY2Vzc19tc2dfd29yayhzdHJ1Y3QNCj4gPiA+
ID4gd29ya19zdHJ1Y3QgKncpDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY29udGFpbmVyX29mKHcsIHN0cnVjdCB4ZV9ncHVfc2NoZWR1bGVyLA0KPiA+ID4gPiB3b3Jr
X3Byb2Nlc3NfbXNnKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9zY2hlZF9t
c2cgKm1zZzsNCj4gPiA+ID4gwqANCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKFJFQURfT05D
RShzY2hlZC0+YmFzZS5wYXVzZV9zdWJtaXQpKQ0KPiA+ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcmV0dXJuOw0KPiA+ID4gPiAtDQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqBt
c2cgPSB4ZV9zY2hlZF9nZXRfbXNnKHNjaGVkKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlm
IChtc2cpIHsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzY2hlZC0+
b3BzLT5wcm9jZXNzX21zZyhtc2cpOw0KPiA+ID4gPiAtLSANCj4gPiA+ID4gMi4zNC4xDQo+ID4g
PiA+IA0KPiA+IA0KDQo=
