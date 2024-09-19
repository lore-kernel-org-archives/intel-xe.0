Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A84DCE8D5C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 08:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455EE10E2BB;
	Thu, 19 Sep 2024 08:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOmFN7x7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F7810E2BB
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 08:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726733965; x=1758269965;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hWrnUElw+lO0+HeRu2/ZVkRjlPistcdE0x2UW8dfQAA=;
 b=cOmFN7x7DCMR3wjZnwZ3HOXb6PnZiqf+CQM4cjh2FvO34IRXgguSkLD/
 svujsNMQZ2mfGDYjFPTHi+mLGbArsFBi3CSjvP0SI0OUOo1qY2Qt1kCqA
 L6LF+VLidFcpzzni4cOKf0oFQmI/s1SIPx2ZIqRUjcRb8ubeQy5W/brRp
 lFa2tFRDIYBMplL9G/ae1ZfAB3xyk2xwru9GCyEClpXs+lgQ4Mrs0G0q6
 iaqzXOwAD30o50vjpbU1zeSWaDPiFr7nNWABhEuh/oog+xwUdaZlJbcjf
 uaY/P6CybqMsn+fijAxLYAhgNMew/NZu1EnNqr0u6E48oUkhiYWs/S1kQ A==;
X-CSE-ConnectionGUID: Z+2eqoe7RUibD6QvMKEypw==
X-CSE-MsgGUID: Bu9lblYxQB6VdLh77TIL4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36255366"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="36255366"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:19:25 -0700
X-CSE-ConnectionGUID: uziEeejhTQOfzm36bb4Zog==
X-CSE-MsgGUID: ljfBDYZfRW+52jqxSFSvjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="107319747"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 01:19:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 01:19:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 01:19:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 01:19:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+x64s7kLfu722oVrIS3W6AfhQrFtlw9Q2z0FRQEaSEEX0CLwJYCS5I6O6oSVKOMVae8gAAGpz2QVtd7Wt6l3rhh8bbEJB/OruH2R/std7sdQGOeheHYIdGqyGq8M8bcLUN2BcDJQVjeSrrtE8hJYGfAh4XnAWBGkCD7+MxaR3hdd0Av37Wub0w9NMQ71uaT5xSPlmMf63STSzGQOmQrqrF/03jg94Sw0APKO5087Es18uRt2lYyGP57KX7+lGrDEbXG5oFsTvUr2VzJtGr5pR+SsXD3d6ws3e1QghG//tgTfxHHdtWW7JMbv34gIdp/dGzrKpL+T/kxIteKfZ2I6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lj/G/wbB8RJl/d5czfV8K6o8JuH8Gg74pKoRppAtB3A=;
 b=OdHTDf+cK2A0IKStkuCmtftfXLCLDszK385NsCEUmgXEMotmQxyX/uAOHl6+cmMAaXRMouuMyv+9DsqPA/ZMyRZT+NRhz1lpzphfaukbFBm1NlpdEq+LAKm2cP7HX4Ckekts/2yyChH2lRkbH+rKZmdumQCZXc+4Pq+J6a93tTfiVxSqbq2Jt27lUtYxB7wpEyPQeJVks+IjsiVfvsVly5gnrRhOZkBoWiq2Zq6pZBXacMBdQ11pNPj3ikJ6/xLm1x3jYclLAicdX+Xi+9X83l25S7j2vjHHnxZK0l1FcQps5u1lAXSoOh3sX8Et+Bz10zPRT1i+ftQyGrsNMW8Y9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by DS7PR11MB7784.namprd11.prod.outlook.com (2603:10b6:8:e1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Thu, 19 Sep
 2024 08:19:21 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 08:19:21 +0000
Date: Thu, 19 Sep 2024 13:49:04 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Vishwanathapura, 
 Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
Message-ID: <ZuveeB0xRivXDe4H@bvivekan-mobl1>
References: <20240918081150.280055-1-balasubramani.vivekanandan@intel.com>
 <SJ1PR11MB6204E9E9031470ED7D32AF5281622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <ZuqlWzSaEso1RgI1@bvivekan-mobl1>
 <SJ1PR11MB6204F9F42C3C6C7344C4777A81622@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <fmn7yawuj6t2o6iwlwftyrxyjefkx2sicow6ynpb3evsdzluwi@vtamjjybuavm>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <fmn7yawuj6t2o6iwlwftyrxyjefkx2sicow6ynpb3evsdzluwi@vtamjjybuavm>
X-ClientProxiedBy: MA1PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|DS7PR11MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 202f5164-29c6-4c4f-adf0-08dcd883c315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zjd3aytrdGRScGU0NERrS3I3aytSMnB4ZjFIV0hpWUsrZHh2SUI0b3dIaXJ0?=
 =?utf-8?B?cTJoUHBrWU1IUktrMnVpSVJRSmNNMUxYUEp6bUJyOEtwY0RSS2xtcXpKYURS?=
 =?utf-8?B?K09YNE5ENGNRWnQyK3Q4YTZrMWJiN25wU2FHa1c2RlM3bzl4TUNRb0U5QjJ2?=
 =?utf-8?B?Sk1OVDhyeVhJc3RkazF2bkpSOHdrR0VTUURvekpwTVVVanNBcjN3cnJ6V29G?=
 =?utf-8?B?OHk3bU9yZlhlVFZwUUtpeUdyNnlJK3BWU05aRUx5UFk3QjNOcmNJRStta2lJ?=
 =?utf-8?B?Rk50SHB4OTRDdDIwcmVYc1Q0VXhqaXFvSXlxQ1o5Yyt3eXQ1SC9oalYvRm9J?=
 =?utf-8?B?SDlWTzRDa2Y4cnZ1UXFxYS93R2NhK21WdE1HQ3UvMlBWdlc2NnRxUTJvV0ZI?=
 =?utf-8?B?amMvSkxVT2Z0SEdSQ2toSHpaOUVGWUkzc3JUY1VXZTdOVmlEblBiSG0reURl?=
 =?utf-8?B?MlIzbXVZeWRpWXRQT1h4Y25uVG1QQWU2VTNtbGZucFY2OG54ZWtCenhnVlh5?=
 =?utf-8?B?VHJnMW9zNFc4eGZZVkliNnQwMWg3RkZvWW5yTTY4TG1qR1NYMWFmMWVhZDA3?=
 =?utf-8?B?UFdaOHEwVnY3V3dGU0RhMXpJU0t0bWRYYys3NTBCSStmU21BdFBxN0x0YVkz?=
 =?utf-8?B?SlgzRlpldHBjb0xoU0ZKUXgwNU9XeTJkbXBkQ3g1cXhEaCs3bW1VVzZKcWoz?=
 =?utf-8?B?MFNQaDhsWWFYYkpWeUVYTU1rbzNQSjUzcmxMRHB4MEhUQ0V1bERFTlhlR25M?=
 =?utf-8?B?YUlCMkc3Nk9kdFRzZ3JrMytSMDNNTHZZaW5sYmE1Q083WW91b1BxZnp5cjVq?=
 =?utf-8?B?aHRxMXhLMzNNeXJzK3Y4TmZnUFV6dTBpTHZneGZMOTZyVWJXZ2RrVVBuOU1q?=
 =?utf-8?B?eUlkQTJ2d21zTVZoUFBYVDQrU0ZZYU0rOEdkRjNyZW9peDdqNmhKS2VLUm1y?=
 =?utf-8?B?ME15TXpiSVQzS3YvNnd1QVp1L1dackZmSDZkSktzOVk2Y0g0TUhKTEs4RE5s?=
 =?utf-8?B?SFk3YTdsSW5uQzBPREdkL1FKVUlKb3dJTHNIMFU0RWxVZGRNUFBQNjF4aUEw?=
 =?utf-8?B?R0xmY2xIUUhZQUdwTzBFZS9obXNjTG5aL1ljTnY4VGM3VTB6aXVlUEZYTlgy?=
 =?utf-8?B?NmZpbC9JUnpkMkplRGluNkxFYnVuVHBiZ3dXNlRjZWFhMVNna00zdk81V3NJ?=
 =?utf-8?B?b3Riakt4SDVTYWhNNzhDbUIvbnNmOUJrVVRxclY4UmJoeWhRTnhSbEFIemlU?=
 =?utf-8?B?U2x4b3NJSDJXTFVwUlBscENtQjNWV2RHN0lPcGNjeGJVM21MYm5talZVaUpw?=
 =?utf-8?B?M2ZWaG4xU0wvZFBxRDYyNGpxa2NiNFNUWkVpb1YwMmZDdGpOVzNtZTFRbkRx?=
 =?utf-8?B?WEZLdjlLUDdKT3IycDlReGpENkhuTnYyR2ltd3E0Sy9VN1lQbkt4WGdnU2p5?=
 =?utf-8?B?djhBNHdjQzZaODZqc3BMMWRvSFFXTHN1MU5ZSmg0ajRvR3VUSytuUTNHOW1X?=
 =?utf-8?B?Mkw4OHJDYUVTeGlKRDVKQW9NeXZJdExPdk1mM1JPZ20rMU53YjRBTDdWTDZn?=
 =?utf-8?B?WDJ1VUdtR3hYdFJPUUt0emwrTS9sWUZHSmhxTVA5RVVrRm13RnBrcFdrRWdi?=
 =?utf-8?B?eEVjNVZ6V3Roc1gwWllkSnJ3eVZIUnRJb0R4bFN1UjQzQ1p5eXVCMmkrTXFC?=
 =?utf-8?B?UDVDZW16ckFZa1QxU1hGcUY5Q3JvZUV1bmVlbStWa0RKWnlYVEVLTUU1eXli?=
 =?utf-8?B?b1RONkVLeW1sWVV6eko5cTRRdUJvQmEyanppT2ZlSWhDUXQ5Vm90WDYyWHVr?=
 =?utf-8?B?ZVNpSTBudHIzSjRlVUN2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak0vL2lvbzFIN3k3T2R5R3VwbnBMU1FDSGpXV1JLZTY3WE53V0Jxc0RNNm5V?=
 =?utf-8?B?WTk3VlIwTzRMM3Y2QjhpZExwWG5zMzMzNEwxN3pvL1NCUTV6VU5USCtwZkt4?=
 =?utf-8?B?UWFkS1F6UnYrU3V1c2k2bzV5MFhOZlppWUp2VUo5ZnpHLyt3VnJlWHpWSTcx?=
 =?utf-8?B?L2VJMmJaV0lEWEZHNkxyajBEeU9yY0ZKMkZwZ3VRMVNWU3QrZnFyK0kwSjEy?=
 =?utf-8?B?MXkyeHplei83T0ora2kvMVJGWC9tZ3VRSlYxbFRpb2NTVFluUmhuSkhvbmJs?=
 =?utf-8?B?VTZwampMK2N3ZGx0YXQxUGlVSEtjN1ltdkhjWmd5aTdlMjhpNU5NRUZkL3Jo?=
 =?utf-8?B?RmYzdUp5Y2ZJTlh2T0JzOGN6ejA1MmNRM01JOTE1TnA3NjJjMDh0TVMxcll1?=
 =?utf-8?B?OE5uZEsrOGp5d1R0aVlnWi9aNk5VVFZ6MEc3RUI2UnVpQWZhSTZ5UzJGd2hl?=
 =?utf-8?B?S0NxR1VyL3RNdktHM0c2K1c0cnllMFBJRnRxMC9jMjg2T1NqV0pPUjdia1hM?=
 =?utf-8?B?S3kzbSt4bjFYUFNZcjRuRmk5SDlDdHZSUWJVejliZ0IzMkMvWkFwcWJ6NWxG?=
 =?utf-8?B?NmtSSGRDanl6RWliNERtanhtS2pnMXZxYVZZTWpIcC9pRXlBUzFyM01zS1I2?=
 =?utf-8?B?eE9wM2NCNEhOR21yekZyaCs3Q05sSWlqWDhSUWJQQ1VlbTB3UEdVK0lnTCtG?=
 =?utf-8?B?dDRjSUQ3b0RIQ0U4bFRwWkdtaGtkR0Y0cG5QWTBQZnJlSDZhOW9UNllEemN6?=
 =?utf-8?B?NVRIZmZjdXNzczA4dFJZOFQxcDYxTXkyaHBZeDZqaHFlQStJM1ROWWlycVp4?=
 =?utf-8?B?VWNkR1Q5VmxGYjlERm5xUVRJL2ZQdlUwRnQ4bUNKVU52WGhSUklHeWpjdXNz?=
 =?utf-8?B?VDA4cWNpMnRobENyeE0zZEE4aDc0eEpOYm5SaG4wU0VZVDRESkRDc1hsa0hF?=
 =?utf-8?B?VkpJODRjM2dZN2NxUitIbkZKNEwyNTZGTGdKTHNmeWx5amFpbU1LNVB6OFdr?=
 =?utf-8?B?cHV4aWJVYklyK3ArZEhlL0JnZjZiY3Q1YjhqdFpuVzVST3V0b2trREFmZ21V?=
 =?utf-8?B?OUZOUit3RmZJSW04WDBOQ3l6STlBVGQxVEQ0M3RiMkJwYkkzQmcycGQrS2ht?=
 =?utf-8?B?WVFWTklrTlpHMzVrQkt5SU5rbzJ6WUFCd1liZzJkWElOYXBFem00Nm45OE5j?=
 =?utf-8?B?U2crMDk3dTNzL1RvL1loczgySzRCd3I3YVJWM0ZlQ0JsUld3ZVF3b0haajRG?=
 =?utf-8?B?T3l5Yjd5aEVmekdvcGhraXJWVU5xL1NMZjh2amFsdnJxZENHamJCczI1ZWk2?=
 =?utf-8?B?a1FlYVFhK0NxUklOUnRXRDcxOSsrTEFVaXNVMUNOTlRDdURzTHp4cWkwWExw?=
 =?utf-8?B?WlRyTmVMcGRyZmsvKzluQkFKSWhUL0dibkQyQmtzSXVnaEJ2bGJ4VkZmbi9N?=
 =?utf-8?B?djFadVo2WHNnQmhFSk1hWTBqeVgxUXlncWFLRThXMGpMQnIyZ3M2RHJZd1ZZ?=
 =?utf-8?B?aWRKMEg2dzM1VjZUU1RqRWg1VlpOZjBOM3NFQ3F2NVEyb1ZFVzhjd0IrMzFE?=
 =?utf-8?B?K0xmNDBxazN6SUk1Rm54TmVHb2VTNmpwT3U0dDR5b1dKcEthcHp0bmFTQlQr?=
 =?utf-8?B?WE5wZGhNdDd6dHBnajUyaTc5NjBBVG1ZanU4NkY3NHRSSmZRZHF0YjVXVnNo?=
 =?utf-8?B?S1dNZmVKRVBTZTUrK0V0QWhMbC96Rk5aOUQ4bGU1dm9sU0tZYktVcWpVQTdU?=
 =?utf-8?B?bUFzV1hIaU5IdmJEbnN4QVBZMDZCbWhHNEVacnNTcENRcld4ZEZ4K0JuMkx1?=
 =?utf-8?B?bXliQXhnVm1LZDJydVBJR1I3KzF0dElvbVdOOW9ybFY3MFQvQndoUDRHZi83?=
 =?utf-8?B?a0lMUjF5b1E0Y3doQnlLL1J4dTUrWmNMaWtLUEJ3dVFqc0hqUEdCNDg3N2Vi?=
 =?utf-8?B?MWlnU0NUclVMWms0U0JGR3Z3OExrVml5dnNaUjhTYnBnb2p4VmhEMS9ISW5x?=
 =?utf-8?B?a0xJQlZON0tySk9SOVh1RU85K2J0Z3U2VmtmME1EaGpKa3duNm40MFNwUnhJ?=
 =?utf-8?B?aVVtSncvemdXRU82NmJtQ0RlZXE2QU1yMlNLZWFUVXBtaWdaUWdSbzhqaXNt?=
 =?utf-8?B?RnMzQjRhaWxVOVd5dHllSTRXbHFwdC9ya2ZRd251N1pQU0Y0dlQzNzM2cGFK?=
 =?utf-8?Q?4LvxqwynJ5TQxlYUaJ59bZY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 202f5164-29c6-4c4f-adf0-08dcd883c315
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:19:20.8438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6YCE2ehVPIy+9lEN27oOJHYogDSHTSp30/bx+ei6P9mHme0upsY2Z7k3qWw4pE8G+mNgCOleyNIWDIDln+rTjUnv/EFlXnltdcTIoJ1NPmKkUq8CYsuIf54b3yreRmem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7784
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

On 18.09.2024 15:43, Lucas De Marchi wrote:
> On Wed, Sep 18, 2024 at 11:11:10AM GMT, Upadhyay, Tejas wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: Vivekanandan, Balasubramani
> > > <balasubramani.vivekanandan@intel.com>
> > > Sent: Wednesday, September 18, 2024 3:33 PM
> > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
> > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
> > > Marchi, Lucas <lucas.demarchi@intel.com>
> > > Subject: Re: [PATCH] drm/xe: Decrement client count immediately on file close
> > > 
> > > On 18.09.2024 15:09, Upadhyay, Tejas wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > > > > Balasubramani Vivekanandan
> > > > > Sent: Wednesday, September 18, 2024 1:42 PM
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>;
> > > > > Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>; De
> > > > > Marchi, Lucas <lucas.demarchi@intel.com>; Vivekanandan,
> > > > > Balasubramani <balasubramani.vivekanandan@intel.com>
> > > > > Subject: [PATCH] drm/xe: Decrement client count immediately on file
> > > > > close
> > > > >
> > > > > Decrement the client count immediately on file close. It is not
> > > > > required to be deferred to the resource cleanup function. Otherwise
> > > > > there will be a small time window, where there will be a non-zero
> > > > > client count even after closing all open file handles.
> > > > > This affects ccs_mode(xe_compute) igt tests as these tests try to
> > > > > change the ccs_mode immediately after closing all file handles, but
> > > > > the driver rejects the ccs_mode change request as it sees a non-zero client
> > > count.
> > > > >
> > > > > Fixes: ce8c161cbad4 ("drm/xe: Add ref counting for xe_file")
> > > > > Signed-off-by: Balasubramani Vivekanandan
> > > > > <balasubramani.vivekanandan@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_device.c | 9 ++++-----
> > > > >  1 file changed, 4 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > > > > b/drivers/gpu/drm/xe/xe_device.c index 4d3c794f134c..3bccea6212ff
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > > > @@ -107,17 +107,12 @@ static int xe_file_open(struct drm_device
> > > > > *dev, struct drm_file *file)  static void xe_file_destroy(struct kref *ref)  {
> > > > >  	struct xe_file *xef = container_of(ref, struct xe_file, refcount);
> > > > > -	struct xe_device *xe = xef->xe;
> > > > >
> > > > >  	xa_destroy(&xef->exec_queue.xa);
> > > > >  	mutex_destroy(&xef->exec_queue.lock);
> > > > >  	xa_destroy(&xef->vm.xa);
> > > > >  	mutex_destroy(&xef->vm.lock);
> > > > >
> > > > > -	spin_lock(&xe->clients.lock);
> > > > > -	xe->clients.count--;
> > > > > -	spin_unlock(&xe->clients.lock);
> > > > > -
> > > > >  	xe_drm_client_put(xef->client);
> > > > >  	kfree(xef->process_name);
> > > > >  	kfree(xef);
> > > > > @@ -178,6 +173,10 @@ static void xe_file_close(struct drm_device
> > > > > *dev, struct drm_file *file)
> > > > >
> > > > >  	xe_file_put(xef);
> > > > >
> > > > > +	spin_lock(&xe->clients.lock);
> > > > > +	xe->clients.count--;
> > > > > +	spin_unlock(&xe->clients.lock);
> > > >
> > > > The file_close here is sychronus and serialized call with respect to
> > > userspace. Any settings done through sysfs post file_close should not required
> > > this change as far as I know. Would please explain scenario better?
> > > 
> > > In the current code, the client count is decremented in the function
> > > xe_file_destroy which is not invoked synchronously from xe_file_close.
> > > It is called when all references to xe_file are lost.
> > > References to xe_file are held during creation of vm and exec_queues. So the
> > > somebody might still be holding reference to xe_file while xe_file_close is
> > > called. Therefore the invocation of xe_file_destroy might be deferred.
> > > As of result, driver might see a non-zero client count even after all file handles
> > > are actually closed which is incorrect. We can defer only the freeing of
> > > resources to xe_file_destroy but the client count can be immediately adjusted
> > > in xe_file_close.
> > 
> > If whoever has hold ref, might still use ccs, why would we allow changing ccs mode in that case!
> 
> if the file is closed, there wouldn't be any submission at all. ref is
> kept alive for the data to be available for updates on the sw side only.
> 
> but I'm wondering on the value of this client tracking... this is so
> uncommon that we maybe should rely just on the list of open files being
> empty?

Using this client count also blocks changing the ccs mode even when any
display activity increments the client count. During module load, fbdev
initialization increments the client count. ccs_mode change should be
independent of display.

I am thinking does it make sense to confirm if the all ccs engines are
idle before attempting the ccs_mode change.
@Niranjana your thoughts?

Regards,
Bala

> 
> Lucas De Marchi
> 
> > 
> > Tejas
> > > 
> > > Regards,
> > > Bala
> > > >
> > > > Tejas
> > > > > +
> > > > >  	xe_pm_runtime_put(xe);
> > > > >  }
> > > > >
> > > > > --
> > > > > 2.34.1
> > > >
