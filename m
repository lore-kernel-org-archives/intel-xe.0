Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8C8C3DA4B
	for <intel-xe@archiver.kernel.org>; Mon, 15 Jul 2024 20:19:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E8210E51E;
	Mon, 15 Jul 2024 20:19:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gex/Y6AL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F10510E51C
 for <intel-xe@lists.freedesktop.org>; Mon, 15 Jul 2024 20:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721074763; x=1752610763;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=p4ru5VWczsanOLz3Lq7j7UJuswcb+Rc0gNUKmIEWtAU=;
 b=Gex/Y6ALa+PXeGuSFSSAjga5Zwg5fvQM43omZVS0mAx+VKZ+zDCCXc+0
 UzFMuH4H+JtigbZX314VCX81zo54O2gaFsjoxXr1R8UL+wX4BmTck+ThR
 IzP2Yt9mZZZoS0TTgBjpowzP7fyIK54BCZTGKeYlY1RiyezNshdFJdDLz
 jG+/gY4VgVVXUt2sERUXZyhxQNmrc4QUhriwfq70yAzHsBTmS1sl3w66M
 55LYle70SOvxf65FaM9RPP6/nYecegM9Z6R5M9GP7mmlAAxe5TzfJlIXb
 JAnqrq6Lz4gJ/yseoF2UqGrgpHCUrFjhqRiWzdRbHk16EECCu0LCacaEH A==;
X-CSE-ConnectionGUID: Zn9czO/gQL2KWNXmS11vcg==
X-CSE-MsgGUID: TSzk7HpVQOqy8VANaeyLrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="22242414"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="22242414"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 13:19:23 -0700
X-CSE-ConnectionGUID: N9M9nL8CTQy/y7uTaYhuCw==
X-CSE-MsgGUID: iI1US7TMRbSOR+Tb2gOpVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="54572898"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 13:19:23 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 13:19:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 13:19:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 13:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATbflp/M41lvtVSpKJfn2DK2xC7RlAyjBphpTWDI6u8vm1ml0/wgiGxkKg+YKXzGhdji/D2w5VfpqexYbDn1/XEZWlYYvPO/tgsnmYSUHq2rWnl6QlSX/4+frZiGU/ldNxuU5aUiaPJtaahqUOF5GpTGYBXRNlVKGN2ebKxY3l2BF1dLt3V/+EMU9+DK0ljqyKvDgFNSOH7FlnhJXbySxyXqTgWs0zWBRsQW6dj1nEgtRDAGhne42o9MRoh0O+zVmcsIkwWxT9VcWzj9s9QFG03tsm7M6lT7FXt76f0w6j+pkiXPj2W2O5jOlAeqeta63FVtB0erV/CDcQFsvajxrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQSj/RCz+bZJ7ws7sDv7LEXfOUbcjJYk6SJK2HqY328=;
 b=HX5ePYOrymd0v46lR07opKVFdM3buyEtvwR62GUmp1svrcFONhkF2KmuhAQOEYbdUPo2sxF/qLEDREjCUnmBisg3MwuKTpGZA90wYrqeyaSCUDW5Qe+SDQ8EO0YmruSSGs+LiJ1AIr5E0HiRP5gDAd28BVer3b7PP22S9VLNyS8P0XjayJEuTlaY3k312I6T34aGvNfYkKXBy2gLIJ8eABZEAgtzL+xKdHD1lFGB01YNfUZEzv7AdChh/KPAX3/qpYo1AqLf2Iu+MQP5PfYA4vFd9xrhBubnJ9NHW63ej4GSA/k99EbfJE/GVDcQBL0ezyyXGBrEpnURyrnEIKhaLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by DS7PR11MB6104.namprd11.prod.outlook.com (2603:10b6:8:9f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.29; Mon, 15 Jul 2024 20:19:18 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7762.025; Mon, 15 Jul 2024
 20:19:18 +0000
Message-ID: <68734fcf-994f-4995-bc36-a6c6c23de32f@intel.com>
Date: Mon, 15 Jul 2024 13:19:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/14] drm/xe/pxp: add a query for PXP status
To: "Souza, Jose" <jose.souza@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240712212901.2684239-1-daniele.ceraolospurio@intel.com>
 <20240712212901.2684239-11-daniele.ceraolospurio@intel.com>
 <9da733063a97cdf30473f2f97382eed62eacf251.camel@intel.com>
 <7fea79c2-ce58-4238-a4ec-37f3fef5c3d9@intel.com>
 <128f7b2fc964aec983cc6ddbbe31b4f1a615552b.camel@intel.com>
 <21dcb721-bcf7-4b6a-a4a5-cd51bf26449d@intel.com>
 <df2ff9848263e09213a8b739cc74381b09c0d10e.camel@intel.com>
 <61d178c4-fd69-48dd-9548-84ad4458723c@intel.com>
 <d9f73235b9ddc8bbe6dba5fabd5734e5e4e3c7d7.camel@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d9f73235b9ddc8bbe6dba5fabd5734e5e4e3c7d7.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0240.namprd04.prod.outlook.com
 (2603:10b6:303:87::35) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|DS7PR11MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e17e9dc-bf52-4624-5df3-08dca50b67df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0ZONGIyUDFGcGx2VmtNbFk3QkJ1YnBKM00yUnc3S0xvdUwvYUI5VFlJVHg3?=
 =?utf-8?B?ZUVEcjRValVWdi9NMlFzV1RWWlVhcFdadEE2VGhXZ243K0c4Q3h0dFNsRG8y?=
 =?utf-8?B?NjJQUjZZRE9jM0RNeHdIanErOTArTFZGT1ZjWjF0SlRhYldPdWxRNDBEbFB1?=
 =?utf-8?B?d3QzdzRrS3d0eE4vNGRPM0w1L3JnYkw3cktlVFd6UFdUUXcwZ0tDdkdkOTU5?=
 =?utf-8?B?cGxUaFhRc2NjQURlSTdnNmdpTFA1dXM0R3BEUWJkOUUvdWRJc3RTc1VVU2hB?=
 =?utf-8?B?eTNPVWhDdjNDWG9KVFhFczZmWGp3cFVta3JYK2hUWVUxYnM5WHhwSkJoQWVK?=
 =?utf-8?B?WFNwZkl4eS8vSlBTelJuOWhNU3RBUVRCYlFiVDFFUWlNTHhkMVF5c0tQTHRI?=
 =?utf-8?B?NEc1Tk5ONm9JRHZTQmZvZlJiSC81YjIyazBJUktGc2ZaR3o2SUc5NEJQSWZF?=
 =?utf-8?B?SUYzRStUL0QrWWc5dFhQMHU3cmJNQ1JibzlWNVNlTjNTUjhmYWpKNkxUeFV6?=
 =?utf-8?B?WmZSR0U0ZWVwM0ZRdEJaejFmTTBacFdZVWN0RHZ3VDRBdTFIZ3Y2TVVxT3U0?=
 =?utf-8?B?Uy9OVXVrZDlOR1V6YkxDRkZtcG9aM3V3YUFOelhjTVdEVkJtamFZZHBqVnBO?=
 =?utf-8?B?VzBOb3F2Szg3T1BiZ1hWZTIybFRPSHV3Q1l2UThzQ2xyWFRCNzBuOU93Q3c5?=
 =?utf-8?B?aVBVbGFBQks0cHJwYmJBWE1FRDU3d2VBR3Y2VTFHbHRIZ0k4em51Ykt5cEwz?=
 =?utf-8?B?S2Q5emN5cVdBcHFOdVlmNFdQZlFyc1JWT3IvOHExMWdsUTdZQVdmSUpzQklj?=
 =?utf-8?B?aVpUOFJvODRFampaTmVwRmxjQVpxSjUzUGVQb2pCdmZNTjJYbmY4SCtYb1NT?=
 =?utf-8?B?eTRkMlA1eDNVL2t2enh2UHgwZElUOUVYM241VlllczE5eUxRcWhMWDByN1lJ?=
 =?utf-8?B?YTNZM0ticG44WUpJdDJERUl0blFDMWppQzVSbUYwanZHOUVKNFpubUZrVEND?=
 =?utf-8?B?anZSbmQvaGkreHlPMjNqV3dxc0NVUGhJeE5URFAyOHpTRkhnQldMN1loNkpn?=
 =?utf-8?B?cGhwS0R5WGFlVHZQNzlqSFNlbVk4SHYxU1hkMGMrSmQ0aTJ6UnVGVWJuMTM1?=
 =?utf-8?B?dWhpR3BiZkl6MXRsTDYxcXUxditOSFFyZTFKZjBFanFoV1ZnbjNoa1FtN0RD?=
 =?utf-8?B?bG9CQkFBOVhnbGRjc0pqRWVYaGV1R09VM1hlY1NUSEFnZGRHYWdJU3Uyd1hN?=
 =?utf-8?B?ZEFkbDdmZ2NHbHkzcU1QYSt0NFVCSFdJQ1Zna1pjQzVMZVo2blA3OG9iZS9Q?=
 =?utf-8?B?TzVRM3lHUFNQMTRuakk5LzZRN0tDTUUrd05wUU1oVDlJa1VPSkJyTjR3YmtY?=
 =?utf-8?B?aml2eHRZRzUwZWNlMXd5cEcyUEh3VnFVdzhncHRuQjd2RmVVazhmRWFRZmoz?=
 =?utf-8?B?U3pGOWFlNEMzMkZnUmMvRStONmJxR1k1ZkIvcEJIZG14VmpFbUcyenlkOXp6?=
 =?utf-8?B?cGt2UjdXc0ZiUU10ai9yWmJRMzZhaWRReVpFVGRScU04Wi9pSTQyMTdxUVcv?=
 =?utf-8?B?VFJ4V2tUZFYxRVVUU0dkZFRqOTRWL1k4QkdOY2poa3F2Z05hMzdBZWVjNTc5?=
 =?utf-8?B?NHpFbVFrTmFMZ2RCeU5lNkxLaHRTbjZhbXBtQSs3QTZ2R3J5TGZ5dGhuam1Q?=
 =?utf-8?B?cHprWk9WNFFZZ3BpaTVBOG5McFVoUVdEa2hkTE05REhQdmlKSm5nU0NLRWEx?=
 =?utf-8?B?d3hvemxDY3F4VXE0bmhVNWdzYjMySjBzVkIreWxJb2V6NFdaVEFxVUNYK2h5?=
 =?utf-8?B?V1huMEFDUk8yaDl4RHhudz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVJqQzN6QldTeTFiSzQvL0NUQ242RFU4S2o4WFhEZVdwQ1ZTb0pDdEE2aU1z?=
 =?utf-8?B?M2JQOFMxUm9FSWRjc2VOSFFHVWhnQko1TFdCOTVNb0JVSHZmeXZOZzZZYnNo?=
 =?utf-8?B?eWI5N1dvQSsrVThHa1p5cXRLRnkzNytYdkEraDYyNnZPMnl5VjZkQ0pqYU03?=
 =?utf-8?B?VHBkZUZoRS9BWkJBSUppbXNKZjdtd1F1dmFxMUpkWklOL3BCak9IczlEb1NN?=
 =?utf-8?B?TkNsMElBOFk0RHNEclA1dTRGdWQxcHZNTWw1cVk1N2hLaW9OK2UvUEs0TGxD?=
 =?utf-8?B?SmlUbmRtYzRLREJGMDZSQ3JyUnIvK1ZZL1oyVi8rWHV0UTMxeDFiZ296MUwv?=
 =?utf-8?B?RWNqME44bHFDT1VpRm5GYmVxZUxhVk5JcG81c01UbG1iY1VuNGczdjhxUk1x?=
 =?utf-8?B?MytGdS8waUJ5bGNMWEJVNnl3Q2lYOWZiWnUwNXpIZ09EVXBxcmY1VGlLQ1oz?=
 =?utf-8?B?MVE3Vm8wcVF2TisrWXpYLyt3ZUU5TVZ6V01tcDY2YTJraCtBMEE0ZE1ONStj?=
 =?utf-8?B?OTNLcW4vWDhYSzIvVjB1aWJteHVTSktGaDlWNy9PajJEcjdKdDJ5L3ZuNEkw?=
 =?utf-8?B?cnFESzQ5K2xRUkd5cFFyZjJSQU5yTDYzVVRSOUQyWHRUazZCbU8rSkFBdGdQ?=
 =?utf-8?B?YWFyOS9sQXdDbWtsVkppZitvd0VtU3VTZzIvZkRKUFJJQ2owY1VGM2hPWGo4?=
 =?utf-8?B?cTlWaWNSSGJWUG1sKzNGLy9NWSt4WStaQkYybkRGRUo3ZWZNL01sQ3p4RE91?=
 =?utf-8?B?ZkZiYld3MElDYk9uTkxOTWpRcm9HdUFNYzJwTWh5Q2dja2dOTlV0aHBMbjRC?=
 =?utf-8?B?SXp2Y1N5VmsweVRTVzVNdFpIM0VnaFBFSzYxZCtMT0ZsZUF0MUxJaUFtSzNx?=
 =?utf-8?B?Z01tOU9oazN4RlNrMDUrczV4dDg0QnJaUHlIVTM1UnI1dGNRRFlFUHVIbGpj?=
 =?utf-8?B?VXZMUDBUVmFqZFM1eDgraXh1eVlMenpOQzY4NUtSdmtqUWgybEdoUUR2eWNM?=
 =?utf-8?B?MWxjbEdLRnBIbGNDbTNubE44TDRlTnZvcXlKWDlpN0V5S2dYRVVldnRXMXhP?=
 =?utf-8?B?dndiZFpuOHo1MlF2cXNYQzBURHI3cXJ4QlcrZENlWVdKUWxDdW9HU0xpMUIz?=
 =?utf-8?B?b3RQYVAwbERrMGVXUEc1UVJkZGNQb3VNVDVaY1ovc0hLWjZ1OTdSWEp0QnlK?=
 =?utf-8?B?OWZQU3N3VmIxZGU3U3pTcTNhWDBGUVJtYTl4UXFwNVgzUGt1a0JDd3hLZlNU?=
 =?utf-8?B?TDRkKzdnRmtMVzhaWDVIY2pTczNmbDlzVERxRFM1VlF3TkJaR2xSVmJpSFRM?=
 =?utf-8?B?S3hVWUlLTzZpUXhkMVhaUm5rdzB0RVpETDJNSkpUbXNzc0c2YWVyK2J1NCtR?=
 =?utf-8?B?NGRrWG1LKzNiUnBSNERSUktNZTFwQmhhcmVjRkp6cEtKdjJCWko2OVZxRlJ5?=
 =?utf-8?B?bm5yNXlZWVlyQUhXdSs0amxrOUlFczhBUXNrQVBhV0hZMGYwNUg4NTMwZWdY?=
 =?utf-8?B?a0plNFk2WjBkMEN2eFRQeGs3ZUxzZDU1b1RKNk5iTVN3ek5vVmdxRmg1anFL?=
 =?utf-8?B?NzNXWmFYaUxqMFNudFhxNnIzZ2xiVFVXamthRjVIclprdXE3ZWVKekdmRkpw?=
 =?utf-8?B?RzU2aUVZQzBEbjdhNmtKRUgxcXZnYUNhNkh2T3NYOFF3K1lDMk8ybzBVV1Bu?=
 =?utf-8?B?dWU0MWFBV0FscDBSMnp0YW9hWDBSMFgvMzhsZmVOeld1c0NBcmZFMkp6TmFV?=
 =?utf-8?B?YW5uQlRYUGxKSzFlY041bGJreldCeWppTXRSZUJlK1RtOHNxQTYxdlBjNm5T?=
 =?utf-8?B?TXdHYlJjVXpyN1VHWXhteEZaa2Z3SlcyYWhCRWVWQU9hT3k4bnY4YjhOc0hV?=
 =?utf-8?B?bGV0SjhGUnZQZTZwbnJxbit5RSsyYktEWDJFYnpqRTV3SXJTS1IzcGZGOHBy?=
 =?utf-8?B?cHdpUVdqU1Awc3ZFM3Jjc2w4SlNiN1VGQ1liRW9BWmxJcDJCRlgyY01CQ1Fq?=
 =?utf-8?B?M3haTjB3WmsxVGxlUEJRRjhWQTJaeTV5WDRBUFN2SENkTW9KSytQdmFrWDRj?=
 =?utf-8?B?a08xbk1VL0NJSHZaTjRzK2toSWhVeGduaXhqZjQxMnJXVldVbm5Rc1Z3MVJU?=
 =?utf-8?B?NjY1ZzhiOEJlYXc3UTBCMmVBOUtmVm1CSmVWaHVsMjhWSFdFTW1qekp5NS9L?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e17e9dc-bf52-4624-5df3-08dca50b67df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 20:19:18.6848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMgtTwhVV9P1Gq/qYHv47I5AKCSRDgVE4NHif7XHnYM+8xJA8vVkz4+LAuEmshc2DST6ZNgITipVioj53MF9dltvRjFZBFqfLIsy8Pd4ZBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6104
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



On 7/15/2024 1:16 PM, Souza, Jose wrote:
> On Mon, 2024-07-15 at 13:06 -0700, Daniele Ceraolo Spurio wrote:
>> On 7/15/2024 12:52 PM, Souza, Jose wrote:
>>> On Mon, 2024-07-15 at 12:38 -0700, Daniele Ceraolo Spurio wrote:
>>>> On 7/15/2024 11:41 AM, Souza, Jose wrote:
>>>>> On Mon, 2024-07-15 at 11:03 -0700, Daniele Ceraolo Spurio wrote:
>>>>>> On 7/15/2024 10:54 AM, Souza, Jose wrote:
>>>>>>> On Fri, 2024-07-12 at 14:28 -0700, Daniele Ceraolo Spurio wrote:
>>>>>>>> PXP prerequisites (SW proxy and HuC auth via GSC) are completed
>>>>>>>> asynchronously from driver load, which means that userspace can start
>>>>>>>> submitting before we're ready to start a PXP session. Therefore, we need
>>>>>>>> a query that userspace can use to check not only if PXP is supported by
>>>>>>>> also to wait until the prerequisites are done.
>>>>>>>>
>>>>>>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/xe/xe_pxp.c   | 33 +++++++++++++++++++++++++++++++++
>>>>>>>>      drivers/gpu/drm/xe/xe_pxp.h   |  1 +
>>>>>>>>      drivers/gpu/drm/xe/xe_query.c | 33 +++++++++++++++++++++++++++++++++
>>>>>>>>      include/uapi/drm/xe_drm.h     | 28 ++++++++++++++++++++++++++++
>>>>>>>>      4 files changed, 95 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.c b/drivers/gpu/drm/xe/xe_pxp.c
>>>>>>>> index e979b47f155a..e39a47aeb050 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pxp.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.c
>>>>>>>> @@ -60,6 +60,39 @@ static bool pxp_prerequisites_done(const struct xe_pxp *pxp)
>>>>>>>>      	return ready;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +/**
>>>>>>>> + * xe_pxp_get_readiness_status - check whether PXP is ready for userspace use
>>>>>>>> + * @pxp: the xe_pxp pointer (can be NULL if PXP is disabled)
>>>>>>>> + *
>>>>>>>> + * This function is used for status query from userspace, so the returned value
>>>>>>>> + * follow the uapi (see drm_xe_query_pxp_status)
>>>>>>>> + *
>>>>>>>> + * Returns: 0 if PXP is not ready yet, 1 if it is ready, an errno value if PXP
>>>>>>>> + * is not supported/enabled or if something went wrong in the initialization of
>>>>>>>> + * the prerequisites.
>>>>>>>> + */
>>>>>>>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp)
>>>>>>>> +{
>>>>>>>> +	int ret = 0;
>>>>>>>> +
>>>>>>>> +	if (!xe_pxp_is_enabled(pxp))
>>>>>>>> +		return -ENODEV;
>>>>>>>> +
>>>>>>>> +	/* if the GSC or HuC FW are in an error state, PXP will never work */
>>>>>>>> +	if (xe_uc_fw_status_to_error(pxp->gt->uc.huc.fw.status) ||
>>>>>>>> +	    xe_uc_fw_status_to_error(pxp->gt->uc.gsc.fw.status))
>>>>>>>> +		return -EIO;
>>>>>>>> +
>>>>>>>> +	xe_pm_runtime_get(pxp->xe);
>>>>>>>> +
>>>>>>>> +	/* PXP requires both HuC loaded and GSC proxy initialized */
>>>>>>>> +	if (pxp_prerequisites_done(pxp))
>>>>>>>> +		ret = 1;
>>>>>>>> +
>>>>>>>> +	xe_pm_runtime_put(pxp->xe);
>>>>>>>> +	return ret;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      static bool pxp_session_is_in_play(struct xe_pxp *pxp, u32 id)
>>>>>>>>      {
>>>>>>>>      	struct xe_gt *gt = pxp->gt;
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pxp.h b/drivers/gpu/drm/xe/xe_pxp.h
>>>>>>>> index 8f0a3a514fb8..b2aae4abdd0e 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_pxp.h
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pxp.h
>>>>>>>> @@ -14,6 +14,7 @@ struct xe_pxp;
>>>>>>>>      
>>>>>>>>      bool xe_pxp_is_supported(const struct xe_device *xe);
>>>>>>>>      bool xe_pxp_is_enabled(const struct xe_pxp *pxp);
>>>>>>>> +int xe_pxp_get_readiness_status(struct xe_pxp *pxp);
>>>>>>>>      
>>>>>>>>      int xe_pxp_init(struct xe_device *xe);
>>>>>>>>      void xe_pxp_irq_handler(struct xe_device *xe, u16 iir);
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
>>>>>>>> index 4e01df6b1b7a..5da9f403c2b9 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_query.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_query.c
>>>>>>>> @@ -22,6 +22,7 @@
>>>>>>>>      #include "xe_guc_hwconfig.h"
>>>>>>>>      #include "xe_macros.h"
>>>>>>>>      #include "xe_mmio.h"
>>>>>>>> +#include "xe_pxp.h"
>>>>>>>>      #include "xe_ttm_vram_mgr.h"
>>>>>>>>      
>>>>>>>>      static const u16 xe_to_user_engine_class[] = {
>>>>>>>> @@ -678,6 +679,37 @@ static int query_oa_units(struct xe_device *xe,
>>>>>>>>      	return ret ? -EFAULT : 0;
>>>>>>>>      }
>>>>>>>>      
>>>>>>>> +static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
>>>>>>>> +{
>>>>>>>> +	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
>>>>>>>> +	size_t size = sizeof(struct drm_xe_query_pxp_status);
>>>>>>>> +	struct drm_xe_query_pxp_status resp;
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	if (query->size == 0) {
>>>>>>>> +		query->size = size;
>>>>>>>> +		return 0;
>>>>>>>> +	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
>>>>>>>> +		return -EINVAL;
>>>>>>>> +	}
>>>>>>>> +
>>>>>>>> +	if (copy_from_user(&resp, query_ptr, size))
>>>>>>>> +		return -EFAULT;
>>>>>>>> +
>>>>>>>> +	ret = xe_pxp_get_readiness_status(xe->pxp);
>>>>>>>> +	if (ret < 0)
>>>>>>>> +		return ret;
>>>>>>>> +
>>>>>>>> +	resp.status = ret;
>>>>>>> when status is == 0? does it means that will always succeed? it just matter of time.
>>>>>> no, it just means the init is still in progress. It can still end up in
>>>>>> an error state if something goes wrong during the init (e.g. GSC proxy
>>>>>> init failure), although that's unlikely.
>>>>>>
>>>>>>> For i915 in some older kernel versions we had to create a gem_context with I915_CONTEXT_PARAM_PROTECTED_CONTENT set to verify for sure if supported or
>>>>>>> not.
>>>>>> This query is enough to confirm. That's true for i915 as well, the query
>>>>>> was added explicitly to avoid having to create a context just to check
>>>>>> for PXP.
>>>>> But as you said above, if status == 0 it could still fail, so UMD will still need create a exec_queue to verify because UMD needs to report to
>>>>> applications if protected stuff is supported or not as one of first steps of Vulkan API.
>>>> If you need the answer and the status is 0, you need to wait a bit an
>>>> then check again. There is no other safe way of knowing if PXP fully is
>>>> supported or not.
>>>> Note that we expect this to complete relatively quickly after driver
>>>> load; the init itself takes ~500ms, but since it is done in a worker
>>>> thread it can be delayed a bit if the system is busy. The only exception
>>>> is if the mei driver doesn't load, for which case the timeout is 10s,
>>>> but that should in theory never happen unless the HW is in a very bad
>>>> state or the mei driver is totally busted.
>>>>
>>>>>    From what I looked to the code, exec_queue will return EBUSY if UMD tries to create a exec_queue with DRM_XE_PXP_TYPE_HWDRM but
>>>>> pxp_prerequisites_done() is still returning false. Can't you make something block in KMD until PXP initialization is running? Maybe add a blocking
>>>>> parameter in the status uAPI?
>>>> I can't block the driver init given that GSC init can be slow and we
>>>> don't want to delay the whole driver load by 500ms or more.
>>> I mean not block driver init but block exec_queue_create or DRM_XE_DEVICE_QUERY_PXP_STATUS.
>>>
>>>> I could add a parameter to block the pxp_status query until the result
>>>> is certain, but is there any reason you can't do such a wait in
>>>> userspace? I think it's better to block in userspace when possible and
>>>> it should be relatively simple to implement, something like:
>>>>
>>>> while (time_ms < timeout_ms) {
>>>>            err = ioctl (<query pxp status>);
>>>>            if (err || pxp_status == 1)
>>>>                    break;
>>>>
>>>>            msleep(50);
>>>>            time_ms += 50;
>>>> }
>>> The problem of doing this in UMD is that we would need to wait up to 10s in all cases.
>>> KMD could do some checking like if mei is loaded then wait up to 500ms, if not ready after 500ms mark as not supported.
>> We actually can't do any extra checking inside KMD. I haven't found a
>> way of figuring out if mei is working; the mei driver has a number of
>> sub-components, one of which is the one we need, and I couldn't find any
>> way to figure out if it's not up because we're still waiting for it to
>> load or if something went wrong. The only thing we can do is timeout on
>> it (more on this below).
>>
>>> And from what I understood there is no timeout in pxp_prerequisites_done() so even after 10s it would still return 1, so the next application starting
>>> would need to wait again up to 10s.
>> There is a timeout on the GSC FW init and HuC auth, so the FW status
>> will move to error if the init doesn't complete or something goes wrong.
>> We check the FW status at the beginning of
>> xe_pxp_get_readiness_status(), so  all calls from that point onward
>> would return an error code. The status can only be 0 in the first 10s
>> from driver load (which is the worst case and should never happen, in
>> normal scenario it should resolve within 1s even if there is a problem),
>> after that it'll either move to 1 or return an error.
> Okay will do the wait on UMD but can you add some comments to drm_xe_query_pxp_status with the time expected for PXP to finish initialization?
> Mesa reviewers will ask from where did I got the timeout value.

Sure. I'll also try make it clearer that the status will move one way or 
the other within that timeout, so follow-up queries won't have to wait.

Daniele

>
>>>> I have something similar in the local IGT that I'm using for testing.
>>>>
>>>> Also note that the proposed behavior is basically the same as i915.
>>>> Apart from the defines, the only difference is that in i915 we wait for
>>>> a bit (250ms) on context creation, but if PXP is not ready within that
>>>> time we do return a try again later error. Relevant i915 snippet:
>>>>
>>>> ret = intel_pxp_get_readiness_status(pxp, PXP_READINESS_TIMEOUT);
>>>> if (ret < 0) {
>>>>            drm_dbg(&pxp->ctrl_gt->i915->drm, "PXP: tried but not-avail
>>>> (%d)", ret);
>>>>            return ret;
>>>> } else if (ret > 1) {
>>>>            return -EIO; /* per UAPI spec, user may retry later */
>>>> }
>>>>
>>>>>>>> +	resp.supported_session_types =
>>>>>>>> +		BIT(DRM_XE_PXP_TYPE_NONE) | BIT(DRM_XE_PXP_TYPE_HWDRM);
>>>>>>> Looks odd to me that you return DRM_XE_PXP_TYPE_NONE as supported...
>>>>>> I just added it in to have all values of the enum represented. I can
>>>>>> take it out no problem if you think it is clearer that way, I'll just
>>>>>> add a note in the interface doc that DRM_XE_PXP_TYPE_NONE is always
>>>>>> supported.
>>>>> Ah just notice that enum drm_xe_pxp_session_type is set in exec_queue. But still, if PXP is not supported/available this will fail, so I can't see a
>>>>> case were only DRM_XE_PXP_TYPE_NONE is returned.
>>>>> So I don't think you need to return it as supported.
>>>> ok, I'll update it.
>>>>
>>>> Daniele
>>>>
>>>>>> Daniele
>>>>>>
>>>>>>>> +
>>>>>>>> +	if (copy_to_user(query_ptr, &resp, size))
>>>>>>>> +		 return -EFAULT;
>>>>>>>> +
>>>>>>>> +	return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>>      static int (* const xe_query_funcs[])(struct xe_device *xe,
>>>>>>>>      				      struct drm_xe_device_query *query) = {
>>>>>>>>      	query_engines,
>>>>>>>> @@ -689,6 +721,7 @@ static int (* const xe_query_funcs[])(struct xe_device *xe,
>>>>>>>>      	query_engine_cycles,
>>>>>>>>      	query_uc_fw_version,
>>>>>>>>      	query_oa_units,
>>>>>>>> +	query_pxp_status,
>>>>>>>>      };
>>>>>>>>      
>>>>>>>>      int xe_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>>>>>>>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>>>>>>>> index 631fdc2ed493..746bc16bd220 100644
>>>>>>>> --- a/include/uapi/drm/xe_drm.h
>>>>>>>> +++ b/include/uapi/drm/xe_drm.h
>>>>>>>> @@ -619,6 +619,32 @@ struct drm_xe_query_uc_fw_version {
>>>>>>>>      	__u64 reserved;
>>>>>>>>      };
>>>>>>>>      
>>>>>>>> +/**
>>>>>>>> + * struct drm_xe_query_pxp_status - query if PXP is ready
>>>>>>>> + *
>>>>>>>> + * If PXP is enabled and no fatal error as occurred, the status will be set to
>>>>>>>> + * one of the following values:
>>>>>>>> + * 0: PXP init still in progress
>>>>>>>> + * 1: PXP init complete
>>>>>>>> + *
>>>>>>>> + * The supported session type bitmask is based on the values in
>>>>>>>> + * enum drm_xe_pxp_session_type, including TYPE_NONE.
>>>>>>>> + *
>>>>>>>> + * If PXP is not enabled or something has gone wrong, the query will be failed
>>>>>>>> + * with one of the following error codes:
>>>>>>>> + * -ENODEV: PXP not supported or disabled;
>>>>>>>> + * -EIO: fatal error occurred during init, so PXP will never be enabled;
>>>>>>>> + * -EINVAL: incorrect value provided as part of the query;
>>>>>>>> + * -EFAULT: error copying the memory between kernel and userspace.
>>>>>>>> + */
>>>>>>>> +struct drm_xe_query_pxp_status {
>>>>>>>> +	/** @status: current PXP status */
>>>>>>>> +	__u32 status;
>>>>>>>> +
>>>>>>>> +	/** @supported_session_types: bitmask of supported PXP session types */
>>>>>>>> +	__u32 supported_session_types;
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>      /**
>>>>>>>>       * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>>>>>>>>       * structure to query device information
>>>>>>>> @@ -638,6 +664,7 @@ struct drm_xe_query_uc_fw_version {
>>>>>>>>       *    attributes.
>>>>>>>>       *  - %DRM_XE_DEVICE_QUERY_GT_TOPOLOGY
>>>>>>>>       *  - %DRM_XE_DEVICE_QUERY_ENGINE_CYCLES
>>>>>>>> + *  - %DRM_XE_DEVICE_QUERY_PXP_STATUS
>>>>>>>>       *
>>>>>>>>       * If size is set to 0, the driver fills it with the required size for
>>>>>>>>       * the requested type of data to query. If size is equal to the required
>>>>>>>> @@ -690,6 +717,7 @@ struct drm_xe_device_query {
>>>>>>>>      #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
>>>>>>>>      #define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>>>>>>>>      #define DRM_XE_DEVICE_QUERY_OA_UNITS		8
>>>>>>>> +#define DRM_XE_DEVICE_QUERY_PXP_STATUS		9
>>>>>>>>      	/** @query: The type of data to query */
>>>>>>>>      	__u32 query;
>>>>>>>>      

