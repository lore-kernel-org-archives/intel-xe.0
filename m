Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734CBCAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 21:21:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77510E4AE;
	Mon, 29 Sep 2025 21:21:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L/o76Cvi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44710E4AE
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 21:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759180875; x=1790716875;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sLvuzTVxL4F7BD4QiwJnS1cIr92bcKWbROSooKG16Xs=;
 b=L/o76CviSSFOK4j0RDVryKDQASkHS9vYB1RF3isQVL6AD0JuQCYOl3oH
 GzRLWTByV9uI9XDwWDjqqQ9wTfkppLfFjlnYLu6nTw/yNNZqOmWZ0NhfH
 Fmis5dZkEUjRdlSK/r9BbQJgICQb6LhuiOQCAH358xrKUokHRb7ldRijX
 frxqf9uL3LzQZ3Lu/U1ffC5jld4Ea6nM6K1FR5TNMEu1wc4s2YRMs7msV
 qEk6zeenjNOuXsUAy/98iBeGoXPN5pjHNEW6D5DnNNntx8RioRoRMOwWy
 UCRPLKbhjCBmmt4h+/44fTkd150L/ZnrY6F9lKpt6TPKKdXjBCYUoJ48E w==;
X-CSE-ConnectionGUID: aYkIj61aTcGE+8FdaatmcQ==
X-CSE-MsgGUID: cIDskKC1QEqurHjAvBJeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72533757"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="72533757"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:21:14 -0700
X-CSE-ConnectionGUID: ZPa2KPa4T+uXOz2apILbIw==
X-CSE-MsgGUID: XdL7Fxm2Sa6tCo0sFhxXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178283920"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 14:21:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:21:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 14:21:13 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 14:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waxUE0oBSrivE0eMpoYYw64b0JncfRhGvmLu/2VsezKUDi1OAbBgj1sGzPaManYlwHKWozk9gPEDZxGAOTFo+OMStOXNivFb0Eyg6dm9vgxTLLoAC4qvnhJx4FLUphwmtPyjKvpobj76s5FLcKeeJ9fri0/KlNaOJfs9AO++aoFR9Mu6vIqA27EBS7WSyoHUDGtriB7fylk8vB9gHHr8ZnZSz1wXfPPVjP9SkN7ruWMmbyc6oX9NMVwecSzUc0DUOqcYzi8dhHhD/rBtabjNJHqqtyuK4bEnxe8AYVomlznkSYJOfpG6KVismSnIaaYywPmL+MId1NRA62mEG2Ghpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9MY4nKvIz7oPtIW5dtJt6/97uDpsTaKvC4wQIJ1jDE=;
 b=LLZ43WkgFdQpWiLX8lvhmPEEIjB9uJb3yKK1yS++NtmnkqMGQomBYfj5eXR2iGIUXwQXMV5/yIq+FPDRUVVV9R4iIqLbfjBD+f4RQUXaiAS/e/6QAv6QZNQTbbQLqJujv1JNcml0Et5eIcdocGpY61wHJ4Af8gzpyr33QEB1Hu0ZjSwoWGl9pYtJLLB9G4rEtrtQ/0QDfUT/yErZzrlotagQdRCtBvwsrhsHciEOquwCjWhusfi5UfLnRegThPVHykWYne8aXentfN7qQSpRLRZ4dMtZxirhuTl7hGQl4EadBkIdi/6CG3A+qMX7lNVBYcwBCZRptDvukVzuuC2Tzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7857.namprd11.prod.outlook.com (2603:10b6:8:da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 21:21:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 21:21:11 +0000
Date: Mon, 29 Sep 2025 16:21:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 6/6] drm/xe/pf: Make GGTT/LMEM debugfs files per-tile
Message-ID: <tumjnuasp2qva7xdcmrqf27465dukrm6glrx3kcpx67pobv6sb@edovwioefspw>
References: <20250928140029.198847-1-michal.wajdeczko@intel.com>
 <20250928140029.198847-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250928140029.198847-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7857:EE_
X-MS-Office365-Filtering-Correlation-Id: f78e246e-fabc-4eab-e21a-08ddff9e1ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVQxWDdjdHhFdE5JUk91cWtJVEdlaG83OGpmY1ZtUGZ5NGxlM1RZMW92aTEw?=
 =?utf-8?B?aGtBVFB5dTFuU1ppVmRadjB0RUFYUmJUU09oUW4zZzhmK2E2OTcxcXI3QUVr?=
 =?utf-8?B?b09BVFEvQ2hUQmVQOXNTK0YvdE9mMWE5c2xldHNNam50SkZjTGw5Z0FRTGVZ?=
 =?utf-8?B?cDV0MEVJbENCQmRqajdyTzhBS0dRWXNRNExWcEozR0owTVpNU0ZxZ3lTNEN4?=
 =?utf-8?B?cGJSR3Y4YUxIcVQ0YncrTGdjemxJKzB2UU4xOHpkZU5jR1VZV2VaTkZxc215?=
 =?utf-8?B?dnRFeW4weFJFSXVYeUhjMmw1QWcwNm1Ddkt0b3NVbDUyQTBaZDcrS2FEOUhx?=
 =?utf-8?B?SlRLZ3JXQ3VIclZDTDhPbFQ0emdkUkZnNXRmRTUrRUpIUkFjQ1VLTVNoSVZX?=
 =?utf-8?B?WmFUUDhIa1JRVk95MGFQNWdvTTV6MC9Hd1N1dUl4Y2RqV0FzQlRWMS9keitM?=
 =?utf-8?B?dUVQUXVHYzAvdnl1Mk5vdnFBaS91eWVmQlV5ankxNWpCRHp5Ky9vaTRCeCtE?=
 =?utf-8?B?Z1dRWHpCUUFUVk5CZ01XVCtWdCsyVVRnRksrdEN6Z21lSjJrWmR0djBZTHJR?=
 =?utf-8?B?Lzd5WWJmblN2RXVJWWw2TWUycVdIVVIzbE1NSzNuRFd6clhFNmtZQkRZd1pT?=
 =?utf-8?B?aTR1YWlFaEFUZDJFNFBiZU1sZmZEWmpGVWVld1NETkRtV25tSU5KdTJxWkIw?=
 =?utf-8?B?K3o4K2Y0UlA1TWRoK2dva0JMcjJnTGlpL0xDMXNRSWVmVWd3MjREK1Z1YzFY?=
 =?utf-8?B?NFZ5ZGxXYjBrQll3ZGFVcjlMK0twcFkybDAwUVRmTlhTbGI1ekN2YjF0eG9U?=
 =?utf-8?B?bHEwZGFiQUJCNy9kVzlXcU9zcTZnOStWU1VNTkorcHNsQjdWaHEvREEwYnBu?=
 =?utf-8?B?cXU5ZmdNb3QyK0wwbFFLMTE5TXo0emtQMkN2MXBhMTg4N0dqK0RtbTZmT3pt?=
 =?utf-8?B?L1FUMDhITklUUlNmYzRmanZLWUJvZnYxWGdOMEpLWVVBQXh4T3h6bVY0Q2xY?=
 =?utf-8?B?eWRlaGFVclRQY3Vkc3hmMXVRc3p1cGJpMkpwSGl3MlBaSExVQzJtMW1TYlJp?=
 =?utf-8?B?Y2hvZ3grVkVOVlhXS2M3STYxaWcxeG5ZSURhTDgrTmNxelpEQTJXUDhKVFJ5?=
 =?utf-8?B?THZiV09rcVNxRUFJR1ozNFducmoveTkwcGl6RWFRODMwNlZyakpxWm43T3A4?=
 =?utf-8?B?WXEzZW11M3QxK2pSdlp3eWlNY3MwWkRHYjlUOVN5RE1EdlBsZ1BOck1WSWNK?=
 =?utf-8?B?T1dxS3BySXhNd29nVkNaUnpCVThjZFVmVjNHTFNVU1JZYU04TURqK0h0alAy?=
 =?utf-8?B?ZGdwc2ZselVYSUZIMFlkd3hlK0lpLzBOTTdJd0Q4S1RvNEFIMWx6cDdYbDd5?=
 =?utf-8?B?cjJyNlorcm9INHRqMjJwdzlndU44U2lka3hwN0lJOXNFY1JOc0JBSmxsdDFV?=
 =?utf-8?B?dVNhYno1LzZoVWFjcWZYcXJuQlJma0doS05MSFhwbTFFblA0YmhxZUVhd1pZ?=
 =?utf-8?B?RmM1QlRFVHFhUURIRXpGTStiN21sVWtxMzZHTm1VUmVmdUsrUFlpbmFOZ1dx?=
 =?utf-8?B?dVlmTzJKMEczM3loRDhHUEpZNWVGUnd3dE1lOUo0THlVeEpBUTMrdG5jQjdy?=
 =?utf-8?B?cDFKakpLa1VvY09EeWw0dnFNZEhIa3U4UFRITFh1VDEzSUE5c3VrbzFEMnJ2?=
 =?utf-8?B?YzF4cm1hSHEwcHJDamUrRjRqOVRuZnlVSGFRRHVrWVc1cmxNdkZsYUhsZFdu?=
 =?utf-8?B?eW1LTjBQQlRLUldhS3I5KzF0RmdwVXNTWGZZK0RMUmFqTDVocytQbW9SeGVC?=
 =?utf-8?B?SlNPUHZwU1UrU0xYd2RXVWdEK0pJT2RaaXZkK0YyRGtQQVFLbU9EREpsbW40?=
 =?utf-8?B?SUcyR1FacGFnQnJuaGp0QWx6OG1PajVGT3BHS0IyMElvRDNLUTJpOWgvQzNm?=
 =?utf-8?B?N0hzZHQrS0dEb1VBYUhSb2R2aDFBa2ZRenM0T0N4UDFlU25oN3JJNGJQRHcw?=
 =?utf-8?B?cXYrcEZBL2N1S1BZZXNGT2dSNWFTSU1YanJLVWFNMjlRN2pTc2RFWVBGbEc2?=
 =?utf-8?Q?UE9Tac?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHJ6dXN1WEVCMzBTbjJmbHJlNUNtT201anE1WHVHYzlhSVI3U0ZsaTdUSGNV?=
 =?utf-8?B?aCtWeXc5dmxDbFpwM09xREdldmFIallDYkVGdmMzbVNHTjdnWkduTmNRV2Q3?=
 =?utf-8?B?bnB2NlhZdUIrakZ3VUp1bjFDWWFRRjVURGFIRkY3dkZqWHEwU1lXNnBQOXBN?=
 =?utf-8?B?a1JsNlhVZDBIeG4wdGJvK3lUZkcrOU9GWEZXcDUrNEFPUXhaY1d0aTZESXZP?=
 =?utf-8?B?bnNGTCtVSmh5eTkxM0FpNk5BSUcxTmpwK3MxbytvUGlCRmw5OGNWUkNScitl?=
 =?utf-8?B?M3c3OTZPdGduakJ6S3d3RHE4UEE0SkNGM0RxdVZjVjRGSHIydmNSdmRiMFM0?=
 =?utf-8?B?OU1wV0xYQ3dreFcwbkF0SUhqQWJ1RW1ydjY5VEh0bisvR2VOSXQvZGxmSkxl?=
 =?utf-8?B?bHRpMnRFTzNHVXlta21pdkN1dDQ1WnVoZ29sMkI5NVJtOWZ2TTJQNVZOZmFE?=
 =?utf-8?B?cFZhVXd5R1VvNElSUm9wME9hQTQweXNqRWN3dXl4OEZYei9zRERkaU9Lamhl?=
 =?utf-8?B?RzEvUTB5ZnJueFpFeFlwTktXNTJvS2lUM001S0xVN1B4UktpOU1NOXdXb1dM?=
 =?utf-8?B?UzdnUWJvcG9GUXNRSmtiRmI0cU1UUjdPc3M5NUZLYjA3TGV6cWcyZEtsaFdJ?=
 =?utf-8?B?ajJjTlNBaXkrUGVYeTV2c04rMy9pbUk1cmN2SVZ0dGlKK0puWjNqWVVMMjZR?=
 =?utf-8?B?WDk1c0Mwanh2SkZCblBHR1U0VVQ2MXh3K2VCb0lkamR4S3FuOThRdkFZY2lo?=
 =?utf-8?B?UVZ6MTdqNG1FQlovSHRCdnRHbUVZc1pwWllmWjFsVlNoTnBiZ29xZTVBSEo1?=
 =?utf-8?B?Umxnb2FqaldHWS9tVTN5bDl1cktyVDVNUHllSk5pdThHeWVLR0x0TGFrSkZN?=
 =?utf-8?B?TlR6WWNQMjA2VmJISjMrRWNnRmdTc1RoSUxXczE4VEI4a2dsS3JndHc5cTUw?=
 =?utf-8?B?bzFZU0dNUWUrTUNIZUFpbCtxaEFubEd4WFJNUExnOUs5VkR3dkJ3T3d3OEpl?=
 =?utf-8?B?K2V6LzZrZlE2SUxGYUxKRVNadjNtQ2pLR3A5V2o2ZnhqRTZpQ2NVSUxEeURN?=
 =?utf-8?B?N25QOHZ4THJZMUo0YllId2U5Z0pyOVQwR3MyVTVUZlBsNGlVV2R1TVVabHd6?=
 =?utf-8?B?a2VuR3pEQ2lyWjJQUHdFdjBNYlhhYnRDcWx4MjhwdE1Bakk4L2FaeFcwQVVW?=
 =?utf-8?B?dHRiV3RNRjY3andtekNCZTZwQk9sK2JUQndhOGVIVzZPS3VOZEpxdThHVkRr?=
 =?utf-8?B?TmRWdWo4em9neTRYcGZPekNmY01vSVNJN05UMXhNK1Qrb2NhN2pwZ295c2cy?=
 =?utf-8?B?UjhBU1FDMzRqczJ3aXBEZzd2YlpkZFljdWRKdmZadGswQnpnYklzbXYyWW8x?=
 =?utf-8?B?SUVhak1ta2FENzlGOSs5WUp0K2llbTFaLzd4bDNPTVdHM1NNNUlrdGJwSkZF?=
 =?utf-8?B?djZGNExMY1pDYmdBenQwV2NQakRPN3EyamZsT21XLzFxUlNsdElQMDJSRXIw?=
 =?utf-8?B?eXZCNVJnVFoycnBRNm9mVEs1aWpFbE1HcXBuQXA5cjVyNGJyeEx3dHBLVUo2?=
 =?utf-8?B?d21hYU00S09jaVg4eTUzd082TTVHNXUwb1lKRDdDK01TVk4xak9rcDlkVjIz?=
 =?utf-8?B?eGQyR3NDT2g3MDNjZjdDaUJPNjRJSWw3bXJpd0Q0SGw0ZmQ4dkRGQy9scXRH?=
 =?utf-8?B?T2l0dWE0WFRyYjZWK2dCeEJGTmNPenF5ZnFGVjdhMksxNUJiWHdPRUxqMzVX?=
 =?utf-8?B?U1FxbE5nM1FjTSt5eWc1YkRRVGt6dzJVNTJPM2FHWUZBeUhpQzdZQzgxQWVD?=
 =?utf-8?B?eDA3djdBdGdyd2FqY0FNOElhUWRUZGhqZHB5UHFNZWxrWFR4WUd0WEFBTWlT?=
 =?utf-8?B?Y2x6cG9leGdoRFVCRXdUUXJZdk12bVNCRnFaSzQ5dGVmRlU5ME92SkVuOU9T?=
 =?utf-8?B?eGQxVCt6SGtKVHg2R24xUG9oSWZGVG55djhzT3ZKbzJZTXVxR0dOVUVYMEk2?=
 =?utf-8?B?TE1iUVhndXpoU1FpaUdTK25qVjJFOUgwdDhiUlUrY0lPSmFYQmpqSVFuWm5k?=
 =?utf-8?B?c1UrTnM4azVQdndPSVJxN1NuTE96a3NBdXB6clFmdlB0M1c3dUNxMVA2cWRq?=
 =?utf-8?B?KzkxaUtNdWV1UFVsM1VPTWszSzQzaG9vc1laeWpPN1Z4MU5KZmVoTXhNc0ls?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f78e246e-fabc-4eab-e21a-08ddff9e1ceb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 21:21:11.2936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6b3DhcBUCJpIJqOwe13zmQgEqQED7W+qMLlhvjSJDyJiNmr4rza2JuO9Ic5GRvcycc/m5h5K8X0sn2UDbW2M4RPZwq0+Pyq6qGM8DsaUVGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7857
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

On Sun, Sep 28, 2025 at 04:00:28PM +0200, Michal Wajdeczko wrote:
>Due to initial design of the Xe debugfs, the GGTT and LMEM files
>were defined on the primary GT, instead of being per-tile.
>
>While PF provisioning code is now still maintaining GGTT and LMEM
>also on the per primary-GT level, this will be refactored soon,
>but we can fix debugfs layout now, as part of the new SR-IOV tree.
>
>For backward compatibility we will provide some symlinks that can
>be removed once our tools will be fully converted.
>
>As we are making all those changes in the user facing interface,
>take this as apportunity to also start replacing the "LMEM" term,
>used by the SR-IOV code, with the "VRAM" term, used by Xe driver.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v1

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>---
>v2: use VRAM where possible (Lucas, Rodrigo)
>    s/deprecated/compat (Lucas)
>---
> drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  92 ++++--------
> drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 136 ++++++++++++++++++
> 2 files changed, 163 insertions(+), 65 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>index fbb3cb3200fb..44fec2aae536 100644
>--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>@@ -100,46 +100,6 @@ static const struct drm_info_list pf_info[] = {
> 	},
> };
>
>-/*
>- *      /sys/kernel/debug/dri/BDF/
>- *      ├── sriov
>- *      :   ├── pf
>- *          :   ├── tile0
>- *              :   ├── gt0
>- *                  :   ├── ggtt_available
>- *                      ├── ggtt_provisioned
>- */
>-
>-static const struct drm_info_list pf_ggtt_info[] = {
>-	{
>-		"ggtt_available",
>-		.show = xe_gt_debugfs_simple_show,
>-		.data = xe_gt_sriov_pf_config_print_available_ggtt,
>-	},
>-	{
>-		"ggtt_provisioned",
>-		.show = xe_gt_debugfs_simple_show,
>-		.data = xe_gt_sriov_pf_config_print_ggtt,
>-	},
>-};
>-
>-/*
>- *      /sys/kernel/debug/dri/BDF/
>- *      ├── sriov
>- *      :   ├── pf
>- *          :   ├── tile0
>- *              :   ├── gt0
>- *                  :   ├── lmem_provisioned
>- */
>-
>-static const struct drm_info_list pf_lmem_info[] = {
>-	{
>-		"lmem_provisioned",
>-		.show = xe_gt_debugfs_simple_show,
>-		.data = xe_gt_sriov_pf_config_print_lmem,
>-	},
>-};
>-
> /*
>  *      /sys/kernel/debug/dri/BDF/
>  *      ├── sriov
>@@ -199,9 +159,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  *      :   ├── pf
>  *          │   ├── tile0
>  *          │   :   ├── gt0
>- *          │       :   ├── ggtt_spare
>- *          │           ├── lmem_spare
>- *          │           ├── doorbells_spare
>+ *          │       :   ├── doorbells_spare
>  *          │           ├── contexts_spare
>  *          │           ├── exec_quantum_ms
>  *          │           ├── preempt_timeout_us
>@@ -209,9 +167,7 @@ static void pf_add_policy_attrs(struct xe_gt *gt, struct dentry *parent)
>  *          ├── vf1
>  *          :   ├── tile0
>  *              :   ├── gt0
>- *                  :   ├── ggtt_quota
>- *                      ├── lmem_quota
>- *                      ├── doorbells_quota
>+ *                  :   ├── doorbells_quota
>  *                      ├── contexts_quota
>  *                      ├── exec_quantum_ms
>  *                      ├── preempt_timeout_us
>@@ -249,8 +205,6 @@ static int CONFIG##_get(void *data, u64 *val)					\
> 										\
> DEFINE_DEBUGFS_ATTRIBUTE(CONFIG##_fops, CONFIG##_get, CONFIG##_set, FORMAT)
>
>-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, u64, "%llu\n");
>-DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(lmem, u64, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(ctxs, u32, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(dbs, u32, "%llu\n");
> DEFINE_SRIOV_GT_CONFIG_DEBUGFS_ATTRIBUTE(exec_quantum, u32, "%llu\n");
>@@ -331,13 +285,6 @@ static void pf_add_config_attrs(struct xe_gt *gt, struct dentry *parent, unsigne
> 	xe_gt_assert(gt, gt == extract_gt(parent));
> 	xe_gt_assert(gt, vfid == extract_vfid(parent));
>
>-	if (xe_gt_is_main_type(gt)) {
>-		debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>-					   0644, parent, parent, &ggtt_fops);
>-		if (xe_device_has_lmtt(gt_to_xe(gt)))
>-			debugfs_create_file_unsafe(vfid ? "lmem_quota" : "lmem_spare",
>-						   0644, parent, parent, &lmem_fops);
>-	}
> 	debugfs_create_file_unsafe(vfid ? "doorbells_quota" : "doorbells_spare",
> 				   0644, parent, parent, &dbs_fops);
> 	debugfs_create_file_unsafe(vfid ? "contexts_quota" : "contexts_spare",
>@@ -558,6 +505,28 @@ static const struct file_operations config_blob_ops = {
> 	.llseek		= default_llseek,
> };
>
>+static void pf_add_compat_attrs(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
>+{
>+	struct xe_device *xe = gt_to_xe(gt);
>+
>+	if (!xe_gt_is_main_type(gt))
>+		return;
>+
>+	if (vfid) {
>+		debugfs_create_symlink("ggtt_quota", dent, "../ggtt_quota");
>+		if (xe_device_has_lmtt(xe))
>+			debugfs_create_symlink("lmem_quota", dent, "../vram_quota");
>+	} else {
>+		debugfs_create_symlink("ggtt_spare", dent, "../ggtt_spare");
>+		debugfs_create_symlink("ggtt_available", dent, "../ggtt_available");
>+		debugfs_create_symlink("ggtt_provisioned", dent, "../ggtt_provisioned");
>+		if (xe_device_has_lmtt(xe)) {
>+			debugfs_create_symlink("lmem_spare", dent, "../vram_spare");
>+			debugfs_create_symlink("lmem_provisioned", dent, "../vram_provisioned");
>+		}
>+	}
>+}
>+
> static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
>@@ -583,17 +552,10 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
> 		pf_add_policy_attrs(gt, dent);
>
> 		drm_debugfs_create_files(pf_info, ARRAY_SIZE(pf_info), dent, minor);
>-
>-		if (xe_gt_is_main_type(gt)) {
>-			drm_debugfs_create_files(pf_ggtt_info,
>-						 ARRAY_SIZE(pf_ggtt_info),
>-						 dent, minor);
>-			if (xe_device_has_lmtt(xe))
>-				drm_debugfs_create_files(pf_lmem_info,
>-							 ARRAY_SIZE(pf_lmem_info),
>-							 dent, minor);
>-		}
> 	}
>+
>+	/* for backward compatibility only */
>+	pf_add_compat_attrs(gt, dent, vfid);
> }
>
> /**
>diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>index 335a79d09639..c8df18af4d00 100644
>--- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>@@ -8,9 +8,13 @@
>
> #include "xe_device.h"
> #include "xe_device_types.h"
>+#include "xe_gt_sriov_pf_config.h"
> #include "xe_gt_sriov_pf_debugfs.h"
>+#include "xe_pm.h"
>+#include "xe_tile_debugfs.h"
> #include "xe_tile_sriov_pf_debugfs.h"
> #include "xe_sriov.h"
>+#include "xe_sriov_pf.h"
>
> /*
>  *      /sys/kernel/debug/dri/BDF/
>@@ -53,11 +57,143 @@ static unsigned int extract_vfid(struct dentry *d)
> 	return pp == extract_xe(d) ? PFID : (uintptr_t)pp;
> }
>
>+/*
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          :   ├── tile0
>+ *              :   ├── ggtt_available
>+ *                  ├── ggtt_provisioned
>+ */
>+
>+static int pf_config_print_available_ggtt(struct xe_tile *tile, struct drm_printer *p)
>+{
>+	return xe_gt_sriov_pf_config_print_available_ggtt(tile->primary_gt, p);
>+}
>+
>+static int pf_config_print_ggtt(struct xe_tile *tile, struct drm_printer *p)
>+{
>+	return xe_gt_sriov_pf_config_print_ggtt(tile->primary_gt, p);
>+}
>+
>+static const struct drm_info_list pf_ggtt_info[] = {
>+	{
>+		"ggtt_available",
>+		.show = xe_tile_debugfs_simple_show,
>+		.data = pf_config_print_available_ggtt,
>+	},
>+	{
>+		"ggtt_provisioned",
>+		.show = xe_tile_debugfs_simple_show,
>+		.data = pf_config_print_ggtt,
>+	},
>+};
>+
>+/*
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      :   ├── pf
>+ *          :   ├── tile0
>+ *              :   ├── vram_provisioned
>+ */
>+
>+static int pf_config_print_vram(struct xe_tile *tile, struct drm_printer *p)
>+{
>+	return xe_gt_sriov_pf_config_print_lmem(tile->primary_gt, p);
>+}
>+
>+static const struct drm_info_list pf_vram_info[] = {
>+	{
>+		"vram_provisioned",
>+		.show = xe_tile_debugfs_simple_show,
>+		.data = pf_config_print_vram,
>+	},
>+};
>+
>+/*
>+ *      /sys/kernel/debug/dri/BDF/
>+ *      ├── sriov
>+ *      │   ├── pf
>+ *      │   │   ├── tile0
>+ *      │   │   │   ├── ggtt_spare
>+ *      │   │   │   ├── vram_spare
>+ *      │   │   ├── tile1
>+ *      │   │   :   :
>+ *      │   ├── vf1
>+ *      │   :   ├── tile0
>+ *      │       │   ├── ggtt_quota
>+ *      │       │   ├── vram_quota
>+ *      │       ├── tile1
>+ *      │       :   :
>+ */
>+
>+#define DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(NAME, CONFIG, TYPE, FORMAT)	\
>+										\
>+static int NAME##_set(void *data, u64 val)					\
>+{										\
>+	struct xe_tile *tile = extract_tile(data);				\
>+	unsigned int vfid = extract_vfid(data);					\
>+	struct xe_gt *gt = tile->primary_gt;					\
>+	struct xe_device *xe = tile->xe;					\
>+	int err;								\
>+										\
>+	if (val > (TYPE)~0ull)							\
>+		return -EOVERFLOW;						\
>+										\
>+	xe_pm_runtime_get(xe);							\
>+	err = xe_sriov_pf_wait_ready(xe) ?:					\
>+	      xe_gt_sriov_pf_config_set_##CONFIG(gt, vfid, val);		\
>+	xe_pm_runtime_put(xe);							\
>+										\
>+	return err;								\
>+}										\
>+										\
>+static int NAME##_get(void *data, u64 *val)					\
>+{										\
>+	struct xe_tile *tile = extract_tile(data);				\
>+	unsigned int vfid = extract_vfid(data);					\
>+	struct xe_gt *gt = tile->primary_gt;					\
>+										\
>+	*val = xe_gt_sriov_pf_config_get_##CONFIG(gt, vfid);			\
>+	return 0;								\
>+}										\
>+										\
>+DEFINE_DEBUGFS_ATTRIBUTE(NAME##_fops, NAME##_get, NAME##_set, FORMAT)
>+
>+DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(ggtt, ggtt, u64, "%llu\n");
>+DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(vram, lmem, u64, "%llu\n");
>+
>+static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
>+{
>+	xe_tile_assert(tile, tile == extract_tile(dent));
>+	xe_tile_assert(tile, vfid == extract_vfid(dent));
>+
>+	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>+				   0644, dent, dent, &ggtt_fops);
>+	if (xe_device_has_lmtt(tile->xe))
>+		debugfs_create_file_unsafe(vfid ? "vram_quota" : "vram_spare",
>+					   0644, dent, dent, &vram_fops);
>+}
>+
> static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
> {
>+	struct xe_device *xe = tile->xe;
>+	struct drm_minor *minor = xe->drm.primary;
> 	struct xe_gt *gt;
> 	unsigned int id;
>
>+	pf_add_config_attrs(tile, dent, vfid);
>+
>+	if (!vfid) {
>+		drm_debugfs_create_files(pf_ggtt_info,
>+					 ARRAY_SIZE(pf_ggtt_info),
>+					 dent, minor);
>+		if (xe_device_has_lmtt(xe))
>+			drm_debugfs_create_files(pf_vram_info,
>+						 ARRAY_SIZE(pf_vram_info),
>+						 dent, minor);
>+	}
>+
> 	for_each_gt_on_tile(gt, tile, id)
> 		xe_gt_sriov_pf_debugfs_populate(gt, dent, vfid);
> }
>-- 
>2.47.1
>
