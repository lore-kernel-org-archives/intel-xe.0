Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F90CF45CD
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 20:04:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2083510E15A;
	Mon, 12 Jan 2026 20:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9lgejR5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A69B10E15A
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 20:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768248281; x=1799784281;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RxdMAXUJQWutC88OMBLREzqF+hrSxZfzDqB4Nmyp86w=;
 b=G9lgejR580xJNdTHBCsuaUW82m307cvDM0b8vIGLDEHH2VGeB9RgRz2F
 FgiBh51X+6ujVSohEKF6es+8npUUEE7a+wYB7SYZcpW5ejcv9w9Rbq1aA
 Rk+FTBG0n5x24N/7X4PdYPBFWtKRa/zMZR79lUfZHASM6lXXfV5Wm4tEb
 iQVG70WEItSKBCiFPh78Acie/eOy6yT4U7alOFBOC2aI9yTCYNjaFsVeC
 dZY9Svb/E5cjt2F3M7UShzejxSJDVSqnnC8PmKMbPLKhs49ARXw5ovYhp
 D23ak3cTxXMmduWAa2tCLJ/uRnlWYH74QYQHhHTZ1m/zSSTnzG3vPHgxS A==;
X-CSE-ConnectionGUID: VvbarF68R4+A375ZQq+QHg==
X-CSE-MsgGUID: g/5E6ChRSLWUUdfUpftmAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68737378"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="68737378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:04:41 -0800
X-CSE-ConnectionGUID: MftFF4AwQWWiaUcFxzJBcQ==
X-CSE-MsgGUID: HK+JRMUBR82Jy1zFSHJacA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="203341478"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 12:04:40 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 12:04:40 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 12:04:40 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 12:04:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqdP6Dsv8j1QLjDizsj/5C2ZAz1BvviliA1ccN+VbxIx0AjRi7KYFmbycBZpKLfGPQR+EU0lXDB8QDu5jkA0En+oXLmDPpQlh+dAYHpN8M0euQ2dr6rQut4SLFpzVTR0XkLFa0HF9Ayk4GqkpOgMgjym2lSHg4+nvw13xOI49XdCP87IAMkmXp+ynRxeA2yv1kRqBVQRft+CLWs3SSn+e0U0XuHt0eSeY22WYPAYREPKmgAfBGXoZLAdlAl3jyk/zjogc/yhAXZ3RiZ6OcRbL6sOg3JkcdZORUWZMvCfbkrqBGgnhhsHh9HmzEXJ+nm1CdLVOpjkDqDwPBPOHFA8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TND3SRmhJ3nPaisbZV2vyYJpCbyJjyCxKAeRacLhoVs=;
 b=sZMZPtUNCjCJlPVhKn6wDUgt8BaFbY3CPl+RVJXKk/ZLm0pyPmROjMsc5V0k6jDc1+D6KVHS6Xib1MdTE94PTVZjVXFK1NmW94A5vEjIXBwEzoD7R/wpT8eKst8kCKrJqx0Sr64FdpkotbEeOK5GRoMJ9n+2fuEJBu87lgsDsC4Z99gsPqXZbNxc0bGRKpLouBV4QwW1yDU+TxTMFt1EJGRRD1NY6mXWyfQUrtc80DdrSVst3eBx7yMv9zMwUOZXZj1goJg4gpmkgtw1/vlK/Z3s0risfek179pQNXANMzb6lWEp4ua//vp4w/zcgKxmK8KndeBmkB9cwJ3nvoBwgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 20:04:33 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%5]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 20:04:32 +0000
Message-ID: <66b789c4-37b6-40f1-a34d-08b6ede3fa9b@intel.com>
Date: Mon, 12 Jan 2026 12:04:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/tests: Fix g2g_test_array indexing
To: Pallavi Mishra <pallavi.mishra@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <niranjana.vishwanathapura@intel.com>, <stuart.summers@intel.com>
References: <20251231233230.428953-1-pallavi.mishra@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20251231233230.428953-1-pallavi.mishra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::6) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: 8338e340-1352-41e0-6564-08de5215cd71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tm5PUXgxRkU3SndXcnh2L2hDSnQ1NEg2OExSZFd0WFo3N1QxOGlwUHU1M2Zu?=
 =?utf-8?B?MjhDcjdoTCt2QmVPbVVHVEtWaHFKSnJBcnpCakJ4MzVzV3BPNkdJK0R5ZEx6?=
 =?utf-8?B?ZUxmVFNQMG1OUU05Z2hWbzVsOFVxeFM3OGRKZmxxeUNIV3owblg0ZFJpRTEr?=
 =?utf-8?B?RThjRDQxQitOcWpvUGZ3VWpCQzhRdW5NWGNGVVF1S09YRkcwamhZSytaTVFw?=
 =?utf-8?B?UHo0RkpDRkdKRFVIVmxNYTBzdnlvOTRqU3FEUjdHd3NQOEF3V2MrYy9MTlht?=
 =?utf-8?B?RkcycWtkUmxQOTFwOGc2TElacldmdk9rQUVrSktCSTZCSC91SGQ0SFY1ZGhi?=
 =?utf-8?B?TUdSMG9JdTJDc2VXRnVzMTA0K21rb1BGWlZvR2JqL29aTk9nNHNOZUtQN0pC?=
 =?utf-8?B?K2I2azEveXFSTW0wdUZVNE5ZV2p2cUxJbjlDc3lhSnRNT0pOYkJSS1I1OEVR?=
 =?utf-8?B?T0prZDNjblNjMU5XcFBTbzEzWnMwVHNSczNzS01lRkp4OUJuMG5aZ3FvQWpw?=
 =?utf-8?B?N2hmU3IwcXp6M0ZGZ2trVHcvd0xIT1BENmVHOVRMTy9Semk2TnNKaU45aXl2?=
 =?utf-8?B?M0xQZE81cTVBQ3A2bzRxVWZuVDRkZVBTcVRDMndhZFZZZUo4aEVycEZ2ZHJ5?=
 =?utf-8?B?R3NRdXVCRThJVTIyMUVzRkd6RTVNYnI3azJKMnJoelVZK013MDFEdW01SFZ0?=
 =?utf-8?B?NHg5bFljOHZMazgxeHRtV3FxZEwvSTdZU21wTERrOVVwQ3FFRE01RUZ5WTl6?=
 =?utf-8?B?YVJsd3pYcm1td3JBMWFzQ2pkTEswZU1VN2IxME9pWUh1akhTRlVHWWg1RWhS?=
 =?utf-8?B?Qi9KY01tdWtEYkZDMnpzU3lxZWx5bEh5V21XNDlXenlDMVRmYnhJeXlmbHZn?=
 =?utf-8?B?MEtJSDBBS3NGM1BHQUdYSHV1czZlYnBLbHlINmp3cnEvcDM4bDVzTGtSL2Vu?=
 =?utf-8?B?QVdjUjFZNE84aitPUnB4UFFFNkhVR0QvSHJiVWlUZVU0R0FKRkROMzYxakFa?=
 =?utf-8?B?dndUQ1p5THN5Y2ZLa0hFOVJUbmw3NXplOHBEQ2VWNkJaeFR3TllCY0kyZi9U?=
 =?utf-8?B?OStqOGF3UjRsWHVIVlRkNlBUcGtwWXUyRVU1eXduKytXbmcrQVByY1VXQlYv?=
 =?utf-8?B?OW81am9Ub3p3QmNlYVQ1YmJ0RXpCenV6MVoySmZIcXdiNFpiY2tsakxrcFZZ?=
 =?utf-8?B?L0dwOUNYZXhHOTF6Qi9GOGxkMVpKU2VDM0tRdGMvaGZTd0NuL3FmN2lVMWhW?=
 =?utf-8?B?Um9WaHF5RUFELzRRdXFneExmK0YrcWN5VVQyUkR3UzJZUkdhbkxtQ2tIamdW?=
 =?utf-8?B?MklNa2d0MExLRWlOU1h5UHQ0blBVcTdqb1duSW81Qm1PVnByMS9Nd2ZibEdR?=
 =?utf-8?B?UmVHUlc3YVpiQnhKY3Awakx3M0xQcHp4MllqL0puNUsrOC82NHB0YmJ6VktT?=
 =?utf-8?B?NjlPRWsrVEd5b1kzK3Q5NGdYUzVsbFBnL2wvSmJMbjljbDQxMm1saklkSENK?=
 =?utf-8?B?bm9ISmRoNElmblNLb29TQnh5UENybGxVQXBUTnBMRWs1UEc5VWx1elNEbVNS?=
 =?utf-8?B?VXlucGxsYjRkU3hTZ1ZmOUVjN3lyUW9MRlViYjU4bEM0ZERUWm15RkZJK0oy?=
 =?utf-8?B?d0laYkY3NjRRb0JmMjZJRE1PT3NBc2hsT05VS09sN2FNQzl2dEV3aUllcnc2?=
 =?utf-8?B?NXVMVmFuc1BTSHRWRXpwb1JJVDZmamkybm1pS1pNM25kWWozdHdDTHNaWGJl?=
 =?utf-8?B?Q2NnR2YxY1I5bnBDZ3Z4MDRSK2RmYkZqREpZYVpuUFlhN0lib3VIa3ZUZmlF?=
 =?utf-8?B?V2k4ZEpyajkyTFRVdTFsQ0czMXZCQkZPZDM4V3FWMjRjR3pPVGFxUy82NmZI?=
 =?utf-8?B?dmo1U3hXbzRETDhlMEVxRWJBc0VCYmRVUHMxaGVMWWZIbXBlZTM0dUE0RVZF?=
 =?utf-8?Q?Cy+O4VT/2ZesWEBZp7CVY4YCUbBv1sCj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eC9oeHBwRVUxRVhOS3VubTNmZ0xSSUw2S2ZBeHFYLzF5N0ViWFRVdzN4Z2FE?=
 =?utf-8?B?NkJXZFhNV1FJRnNjMzBRZytYZklFb2piMmVXdTJndFBFRGdZYzBRUFA3b0Zl?=
 =?utf-8?B?dktSQ3Q2Z1lVeitGN3ZMTTRlNmllQndhNTIwb3dTOTJmQldFOFp6NzBoSWkx?=
 =?utf-8?B?REZhVHdCdXVkMlMyWjJEa0dRaG85UnM0em8zUUVuR1hqR29xU0RWUjN1bXNO?=
 =?utf-8?B?L1JSS00yeWRyWXJKN1U4dk9rSmRQNzN0dVdGR3FJcFBDbUloNjhvZC93OElJ?=
 =?utf-8?B?a3BKaTFDbUluUVJ1bzBkVzMvQWFzbktPT2s4S1dyQS9oNnpONy9oYjRhc1ZF?=
 =?utf-8?B?ZHdxemxxWXhFMyswU0h3ZVQ4QXpVK3NkTjZBendPK3gxckRmTlpYV252TGVn?=
 =?utf-8?B?bFdtcDRpRC9Fdm95T0FMT3c3eXU1WXRiTnV0RHFyVFkzSk9UR0lHOUhOMzZV?=
 =?utf-8?B?RGJkdG5XVit2TDJIMUExS3hUem02eHVYdUxsTDA2enZTN2pQcGlzU1pabzlh?=
 =?utf-8?B?clB6ZTE5dEFUR1ljNGJ2b1R4cXh5ZGQ3VDVHUG9YVEM1dU9zcnk4MU5tL1hJ?=
 =?utf-8?B?MmlNTG5pSVYwck5sdU1WdVFySTJ0OGpCTHNMcUlnVDV0dThHbytkcldJMmNl?=
 =?utf-8?B?dW13UHpkc1F6OFZoMnBHMWh4TDZaQURaWVdLNCtWd1o0ZnIyc3NjVGQ4UWRi?=
 =?utf-8?B?WlVuR25uWnNBaGZqTDRYVExJb2tyZlY5YkRjc0ZhM3p2MjVVRXhpRmU0c0Zs?=
 =?utf-8?B?UnAxYVloYVFZdzcvTHVvSUIyY3VPMFNpOTNOTHpFWlNRS1VFcVUyTTUzSUV2?=
 =?utf-8?B?d0N2ZzNmeFEwWk9sOC9hN0dhOEN6Q3pGVXNJTDZvL3UrTXlMS1RucjZud3Fv?=
 =?utf-8?B?NGJUcnlLcmRmS2FlaE83bFBxUTNSckFscFJ6Y3o5dDNYeVZvUEV5ajBuR3ZG?=
 =?utf-8?B?OGdYcmZ2T09ta1pSSTM3ZXJnWEkyUXBPeEpGRWNNL1JIQkt3Q2VEWVM1clV2?=
 =?utf-8?B?RjV4YVdvakpIZ0hTUllHK3RVa0tQQVJxNTNKK2h5WCtvazE4ZlhPejdTcVdI?=
 =?utf-8?B?UVBMMzkyOE4xdGlCSlk5VDBhUUpsY2syNTVBSFZ4dlpscGRqaHNVZEYyemlo?=
 =?utf-8?B?SEpHMkFxQ0hwOE10V0liZ3VpbG5IdHA1TmtUMUZ1SWdrVFVQNFZJckc2TWh3?=
 =?utf-8?B?Z3pMazd2MGgxcmdZUm4wNnNRazBuMEQveE5hUUtqTnVOL1pMNkIzSWFUSHAy?=
 =?utf-8?B?M3VoeWtxWDZlaUozZC9HZGxFOXRpcUJnK1A3WmpwUkhkOHFNV000eTVxNlpz?=
 =?utf-8?B?VHdlNG1LOG5tVjlMa21QdXo3bHUxdFBVZzFFdnA5OUVxWG80d3pDSVVERDlY?=
 =?utf-8?B?UmxNODJmZDhjVVZDcWZscDR4SDNPaC93bkZDRlNVeVA4dUhqWlJLUU5vUE93?=
 =?utf-8?B?RmVFQlNMdlhjNC9FaFdxRndFMjAxbUM5Qk1FUElWempod1JIZ21UeTFxeGpz?=
 =?utf-8?B?UU96ZlIwdHFLSGNQSmJ6UzZWblhtdDFlQnZNLzRpMnk3bjJjaEJCNG9ZRGRR?=
 =?utf-8?B?NjJmcTBHRFpHbW1Bc3M1bGZHZ2VVaEE4Y1RLc1UzeGVhdm9kUHkxMVJCemZx?=
 =?utf-8?B?K21SN0FGeTZNTFp4YldaVVlkMnFxNzNmNWNIRG5ZZ2Fldyt3ejhlMzBxSWhx?=
 =?utf-8?B?T0pKYk1VU3ZUY1BUbzJmNVEyYzF0eGl5VFF4NUJnSzg2RVFYQTZyTldveVBT?=
 =?utf-8?B?Z3pSSGVkZ01UREhWT2lMZmE4MjMrTEh6MnplWjd6RlZCRFlwTDNrV0I3K1E0?=
 =?utf-8?B?RXpUMExJKy9DLzZhY3FCcWFoL2cwU2ZZb0V6SVAzYUVTV3B4QzZLVkxiVVZl?=
 =?utf-8?B?d2I4SFZIcXNla2RrcXhEdS9LYVhUZDdiMFFyZGE1azN4WmRUdHpTQWpmUVVY?=
 =?utf-8?B?a2pHRks5bVZoYXYzQ2JQZ1FHbStsOFpZbDMvTS9scmZzemhPak5WZnk3dVN5?=
 =?utf-8?B?NE1OWis3V2tlQjdlYlZoK2RCVmdvTkY1R1oySTB0bVhwZncrNjNIVElXSTRj?=
 =?utf-8?B?SEFyYzRkZndBTlJJeEdvdU5iRDh6ZFpTc1NyZFpaMmtqMnVRS3UvcG5aTXRL?=
 =?utf-8?B?UFltVEYyQXJlenN1TFZSUXh6SEU2bGZueHlTWmlRdzJrYkZTazBoMEJLVGI5?=
 =?utf-8?B?LzA5TFdEQmhEcm50NGs0cnBOTDh6eUowVVpBdlgxMWNGZ3lsRThqQTQ3MmRk?=
 =?utf-8?B?dmNzRVJtekJabldRRURNLzh6bC9DTkYxRFg0Q2lPbHExbkE1TGpBYkhrMkhE?=
 =?utf-8?B?UXp1UjYyVHBlem1rMEFiWUM3M1ZRV1JzZFR3NkpYQThRaEhnRU1rMitxc3pz?=
 =?utf-8?Q?gM8Lf43EcA67aEaw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8338e340-1352-41e0-6564-08de5215cd71
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 20:04:32.9097 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OzcgsLCXJwdOXgYMybmK1c7hYV8zw0Enwk9Xj+KWxHpOcZ/XkvAyXoCDqsyychXTHggvjnH1qXfx3hn3sfGlju91LBcVLd4iWijF1xXZ1II=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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



On 12/31/2025 3:32 PM, Pallavi Mishra wrote:
> The G2G KUnit test allocates a compact N×N
> matrix sized by gt_count and verifies entries
> using dense indices: idx = (j * gt_count) + i
>
> The producer path currently computes idx using
> gt->info.id. However, gt->info.id values
> are not guaranteed to be contiguous.
> For example, with gt_count=2 and IDs {0,3},
> this formula produces indices beyond the
> allocated range, causing mismatches and
> potential out-of-bounds access.
>
> Update the producer to map each GT to a dense
> index in [0..gt_count-1] and compute:
>      idx = (tx_dense * gt_count) + rx_dense
>
> Additionally, introduce an event-based delay
> in g2g_test_in_order() to ensure ordering
> between sends.
>
> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c | 50 +++++++++++++++++++++-
>   1 file changed, 48 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> index 3b213fcae916..85e95c5f643a 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_g2g_test.c
> @@ -48,6 +48,25 @@ struct g2g_test_payload  {
>   	u32 seqno;
>   };
>   
> +static int gt_index_from_id(struct xe_device *xe, int gt_id)
> +{
> +	int idx = 0, id;
> +	struct xe_gt *gt;
> +	struct kunit *test = kunit_get_current_test();
> +
> +	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
> +		gt = xe_device_get_gt(xe, id);
> +		if (!gt)
> +			continue;
> +		if (gt->info.id == gt_id)
> +			return idx;
> +		idx++;
> +	}
> +
> +	KUNIT_FAIL(test, "Invalid index");
> +	return 0;
> +}
> +
>   static void g2g_test_send(struct kunit *test, struct xe_guc *guc,
>   			  u32 far_tile, u32 far_dev,
>   			  struct g2g_test_payload *payload)
> @@ -102,7 +121,7 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   	u32 tx_tile, tx_dev, rx_tile, rx_dev, idx, got_len;
>   	struct g2g_test_payload *payload;
>   	size_t payload_len;
> -	int ret = 0, i;
> +	int ret = 0, i, tx_idx, rx_idx;
>   
>   	payload_len = sizeof(*payload) / sizeof(u32);
>   
> @@ -163,7 +182,9 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   		goto done;
>   	}
>   
> -	idx = (tx_gt->info.id * xe->info.gt_count) + rx_gt->info.id;
> +	tx_idx = gt_index_from_id(xe, tx_gt->info.id);
> +	rx_idx = gt_index_from_id(xe, rx_gt->info.id);
> +	idx = (tx_idx * xe->info.gt_count) + rx_idx;

Given that we call this twice, it might be  useful to just have a single 
function to do both the idx search and the follow-up math. Something 
like (untested):

static int slot_index_from_gts(struct xe_gt *tx_gt, struct xe_gt *rx_gt)
{
	struct xe_device *xe = gt_to_xe(tx_gt);
	int idx = 0, found = 0, id, tx_idx, rx_idx;
	struct xe_gt *gt;
	struct kunit *test = kunit_get_current_test();

	for (id = 0; id < xe->info.tile_count * xe->info.max_gt_per_tile; id++) {
		gt = xe_device_get_gt(xe, id);
		if (!gt)
			continue;
		if (gt == tx_gt) {
			tx_idx = idx;
			found++;
		}
		if (gt == rx_gt) {
			rx_idx = idx;
			found++;
		}

		if (found == 2)
			break;

		idx++;
	}

	if (found != 2)
		KUNIT_FAIL(test, "GT index not found");

	return (tx_idx * xe->info.gt_count) + rx_idx;
}


>   
>   	if (xe->g2g_test_array[idx] != payload->seqno - 1) {
>   		xe_gt_err(rx_gt, "G2G: Seqno mismatch %d vs %d for %d:%d -> %d:%d!\n",
> @@ -180,6 +201,10 @@ int xe_guc_g2g_test_notification(struct xe_guc *guc, u32 *msg, u32 len)
>   	return ret;
>   }
>   
> +#define G2G_WAIT_TIMEOUT_MS 100
> +#define G2G_WAIT_POLL_MS 1
> +
> +

Extra blank line

>   /*
>    * Send the given seqno from all GuCs to all other GuCs in tile/GT order
>    */
> @@ -187,6 +212,7 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
>   {
>   	struct xe_gt *near_gt, *far_gt;
>   	int i, j;
> +	u32 idx;
>   
>   	for_each_gt(near_gt, xe, i) {
>   		u32 near_tile = gt_to_tile(near_gt)->id;
> @@ -205,6 +231,26 @@ static void g2g_test_in_order(struct kunit *test, struct xe_device *xe, u32 seqn
>   			payload.rx_dev = far_dev;
>   			payload.rx_tile = far_tile;
>   			payload.seqno = seqno;
> +
> +			/* Calculate idx for event-based wait */
> +			int tx_idx = gt_index_from_id(xe, near_gt->info.id);
> +			int rx_idx = gt_index_from_id(xe, far_gt->info.id);
> +
> +			idx = (tx_idx * xe->info.gt_count) + rx_idx;
> +
> +			/* Wait for previous seqno to be acknowledged before sending */
> +			int waited = 0;

Although C11 allows it, I think we try to avoid having variables defined 
not at the beginning of the scope.

Daniele

> +
> +			while (xe->g2g_test_array[idx] != (seqno - 1)) {
> +				msleep(G2G_WAIT_POLL_MS);
> +				waited += G2G_WAIT_POLL_MS;
> +				if (waited >= G2G_WAIT_TIMEOUT_MS) {
> +					kunit_info(test, "Timeout waiting! tx gt: %d, rx gt: %d\n",
> +						   near_gt->info.id, far_gt->info.id);
> +					break;
> +				}
> +			}
> +
>   			g2g_test_send(test, &near_gt->uc.guc, far_tile, far_dev, &payload);
>   		}
>   	}

