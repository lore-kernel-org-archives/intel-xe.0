Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7923CCCD183
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 21:51:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B8C210EAAB;
	Thu, 16 Oct 2025 21:51:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glSekC1b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6572B10EAAB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 21:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760651501; x=1792187501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=8LoXOGhbWwLNGdM2QLUBLT3fs2IrBFroAwQVVMb9lkk=;
 b=glSekC1bOKGAceIM8BtFGc/iUwR6MmjG9sOxOTTQhefAdCTA4b0DePpc
 SfrworpBRnAn4sAVdVMyp1FZfbylK9iMmuTH7H3m8AscvSufctlfgHt2m
 OiQiycgXrfEmwoa8aBMlgyFyW1nZQdIy5qBNJ5pVJdVa7EizsOu9YgwPA
 BvejuNPTtNgBelCSy14hf4z2awNvwQPAen+OxDXnLKct+4hewOFHM5F9U
 IIjGJJtKCcb6LrS8X3go0P304dxOg+W2ueXh9RaB9lh/w+awQzJudqRPV
 h74nDOqER7T97tjBHTweHBi8CfdKse1S77sawEkLXcskp33Dsi0o1pU0L g==;
X-CSE-ConnectionGUID: /EsgL8OLSIONShVGgNIxVg==
X-CSE-MsgGUID: BNr7N5OuR9uUEPwc8XIIpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62768880"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208,217";a="62768880"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:51:39 -0700
X-CSE-ConnectionGUID: PBD7hCWjTHuofssHTwZYGA==
X-CSE-MsgGUID: fRfVRhERTomM0m13VwZ24w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
 d="scan'208,217";a="182554649"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 14:51:39 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:51:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 14:51:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.25) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 14:51:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFsJZxskzLJD0DNPleQZO2aDZ+AlZPrglvd0zHnioRy+Qd0wEsFWHAuHzVvi4QtWyo6wUAnkrZ95hRL1dSH0eg6XQd5p2zJyxloBJtxIBhrD4lap95Fr3qJD326WSz0FuwJkGwUF4pTTdhgUgjQAaeD9iQHUzj42h46q4dJJMlGSjaaXrSo0lWYyUH2maBvSHHiUT3lpsMOeSTgy5l0ejVzB1vUW/EFNZ8+5av3NQrCcPFLjuhgieQOJITnsPhqmiYyOIAn2lMjpqJcWIF2tuT1kpqZ2p2VO2s/GxtkxPSMQi8qkgtHjs0+nGdteLJU8/0C7rBy5l+Nd2YJw10njsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6KezUfAv0Qnoigef2MiVj30i/3eroTEZbHfaBFEF2k=;
 b=sPMVQe32HF0LNslaLwJI3P+jQZqgxGSilcAzdsN9zuhXpZaeI/Ta8PWjlJx2oCMxn9JoGGIbP+FgTODn4+j7SOAzSsP+XzpyqHY+qvakp08r/LOp6CuqZUXHSxpJcl98nf0uaCbinMGC9CIEBWeTf4Plrbz85Ws45rHvz9zsGhjGkHUMiidWv8Dvqs80QXNJDCg+TmjMlW9DX5DB85puyaBtE6wLokpUyyloEVQ05wj7Ikv3zWL0xy+lP2gJzVeFeumxrHuRTtHCYL8y6gLHyUhrfTwgvNXxcPhA7b9iwaX5aptX3rhrG4MHFwsIc8jZ/E/3obFzt4cy8BT8wELlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 21:51:31 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9203.009; Thu, 16 Oct 2025
 21:51:30 +0000
Content-Type: multipart/alternative;
 boundary="------------V40HFklYRy2znk80Dwc9CX7i"
Message-ID: <6122f4b9-8742-4062-820d-deb00bf13173@intel.com>
Date: Thu, 16 Oct 2025 23:51:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/vf: Helper for telling whether CCS
 migration BBs are needed
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-2-tomasz.lis@intel.com>
 <8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com>
X-ClientProxiedBy: BE1P281CA0428.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::20) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|MW4PR11MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd27c1d-5743-4bcf-3fe2-08de0cfe2a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHZGZlp0aHZKWTQxbHhQVHhRSnVVdjIzWUszaWFuYWdTN2JockJVT05wSEVP?=
 =?utf-8?B?enRZZ2Uydll1V2FLdFBTSFprUUlnT0JiU0lRM3NUcytEekgrbm1ydDhZQ1Mw?=
 =?utf-8?B?eU44SUNVWEdWYkgwbWxWbTV0NFVzNHorcmpoWmdhUTg5eTBxayt0UTlrM0tx?=
 =?utf-8?B?MnllcjBKdytJQ2FVb1lFb2RvSC9OWERYb1gwQ3MrOHU4Sm1iTEgxdEFTMUh0?=
 =?utf-8?B?U3lBRWRwTlY2c0ZVVUZhREJwa01BOWR2OWR4a0ZUKzlaUU5OdW9lZzdOMXox?=
 =?utf-8?B?ZGUrc0J2MHE5VW5CTGcvaEtwNmo4bGVYMGpLV0ZFcC9tUSszNjBRSkRjZmVW?=
 =?utf-8?B?elNiaHN0cldrd3RlS0h6aUR6TXVIblZRbDhFRmtnQmN6UkZkODdYanFTVmpB?=
 =?utf-8?B?RXowdkIyWlM4Z0lwZmloMmNwSzdDRkNlK1V0aVE5TkZuWkhac1BEcDBqb0w2?=
 =?utf-8?B?NmJLUnhhNFRpdEdrS0FjSmpvZ2Q4ajNaTkRURTBiQTNsZjFWN1BxSkdTSnBI?=
 =?utf-8?B?b0xaOHppdmJMTUxIaWpmZy9TeGlodkVTNGtQYmVuellNeU5vSnRkVHlHeDI3?=
 =?utf-8?B?REhDRzdsZTNONEMwd3FwVzRyOXdzRlpiSTcyRlU3UXBYa3FqM1NWY3hTSXpJ?=
 =?utf-8?B?N2ExRjZzVFZDSG4zL2hEMXVxRW5hNFpGdktteVNaUmo1V3NJemljS0laVlhV?=
 =?utf-8?B?Q2ppWHpPOElKQ0hUU3JMRU9qVGw0cTlXNkVjNXB3VHMwQ0ZpUXluMmFlWVlY?=
 =?utf-8?B?NVp0QWcvcjNOQzhQNmh4UzhzNXMxNHkwN3hOaVFmMW1YcUkxcndIeTdqSTNU?=
 =?utf-8?B?QXlvTU9UemgrRDdOd3Jnd28rQlFJQ21wWm4xWDBYOUdPWmdGUlZvQlp1QlJK?=
 =?utf-8?B?Vis4TzJDL1UwOHQ3cHZSb1RzZzVwdWVGb1EybTJuUXR2a0E1ekxBU25rcmFM?=
 =?utf-8?B?V1VNMjJwa3kzV0xzMnlLRjNTZXZTZjR2VnBJYlVLQVVHNHRuQ3UrQmZweDBP?=
 =?utf-8?B?WlpBQ2Y4WnRmZ1lvWlFRS0ljbFF5dXlWZEJxdnMyUmE5NGhRbktPM1JGcnU2?=
 =?utf-8?B?K0Q2czkzQWJQWlRoYnV3K0FDd09zZWVCWDN1aWZBTkpSU2tUYU9LWExyQ2JC?=
 =?utf-8?B?TWY1UVoyTDVrb3h4WUJGbHcxUVdYL2pWL1pKU2FRV2ZhZTNSS0gxTjI3WW9r?=
 =?utf-8?B?VjhTbUZKRTFDY1FuTFVzOWFSeDFDbVBHVWFueitmZUlOUzJLZUVITFVuM3d5?=
 =?utf-8?B?UWdrM2NJa2t6aCtjVDJvOWptUEIwcmZYYzBYdWdSdzEzbk9VdWpHZTdzQ2ow?=
 =?utf-8?B?Q2Y5TEFQT1duQk02QUprRDZmVmtkSWVvRlNMR2pSN2hINlp2Y0M3V3B1eExw?=
 =?utf-8?B?bXpPcGlhODdKbVA3a2greGJqZlBudno0bGNsL3ZPYk5iQ3JJVldBUzZrVUg5?=
 =?utf-8?B?RWdWMTBjLzZOWVdGUWNWemkxbXh2SU5zZWhEZ3E5Rm1WNTFTS0JRRGM1SmZU?=
 =?utf-8?B?QWZ4Rmd2VHhRM2x2cTZzSllvQ1lGN2U0cFpaZEhNMW1UbzVoaTNZcitCZy9X?=
 =?utf-8?B?Vm9PbzVMY3hHRHN5K2JtV2ZnNnpKUzFjSm1tK0ZpV1JzU0RGQm5UbUdvaW84?=
 =?utf-8?B?Mms5QzlWVWR2V2JqTXhqRWRxSjNOYlMwNStPMG5DbEdsMWdIcDBMcEFURU1J?=
 =?utf-8?B?NlhXaG9DNEsxT1RDS1BVRlVJQ2lyV0xXclN0U0IvWVJiajNaU1hKVFd6VFVT?=
 =?utf-8?B?cTk4VW5uSnBXdEtVRXFFMHNmVk9yclZsNllEWHJTbDQrMmtqUkI4UkpQNjBh?=
 =?utf-8?B?ZTlDbm5qc3lHWHVpTzJxaE9ueFhZWnB0L3hmMTRob0FtTVE1UW9Ud0hjNmtV?=
 =?utf-8?B?MFNhR2theGg1SWo4ajRjRStBS1djdUMyMzVQVkhHQmFtZWZUZEVJMHBHWjUv?=
 =?utf-8?Q?bFhnUD9qpmNr3Nq6J8vsFlKQm6IJUxyN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVpBT1ZtdlNrVFFSYTFxQ2Ztbjk5Um1qZVQwR2grVW1JZ09NTFZrQjJadlpt?=
 =?utf-8?B?SjN5cThCZkJkR0k1bkxUTWtiN3V2MXVUMy95NUtyQk4zWmQwNzZBb3dMMFhi?=
 =?utf-8?B?WWpZeWZUUkpyUWx3U1pBdW5VVGcwS1RybVppTVhvRHp2bXRkbW9zamwyRjlj?=
 =?utf-8?B?dis1YVF2UEVzK05iN2FiZXNUWjlBSzdSTHJGSTZTakR4b3NhOHZNc0J6eUQ2?=
 =?utf-8?B?VnNSckZMZ0VSN1BRdnBTQWE5OFM0SUZsL0lZM0ZOYVd1UTFsSFFEcnBLVnln?=
 =?utf-8?B?bjhXQUlvb1JwUXpMYkFpZDdaSlZJSzVUVWN4b2hzcHkzT3hNRGMrRk9oTzNX?=
 =?utf-8?B?Sk9lQ2VkNjRQWW55R2Y4OURjRWZIeG4xSTlad2N3dU4vM3JNTlhLUFJhWDIv?=
 =?utf-8?B?b2VHck9ZSEZ1NjMvb2FkNVNTV3pLdWdUd2NwRFVFTGp3MXJRUU9FVWRGYXJG?=
 =?utf-8?B?azhXSUlCRlhrbjQxdVFDdWlycVBjTTQ3cWdRdnhVdFoyeTVQa3FSZUpmYlBN?=
 =?utf-8?B?N2JIaGx4dldBOXVJaXEvQ1ZwSDNwTTFEM2QwSVo5TzQ3SW9ldjNRMjhSbWsz?=
 =?utf-8?B?dnlyTGFGenhUNG5EWHJSdGIwSGw1M3hkLytZVU94Z0s3Z05EbUlYZkVlRkdZ?=
 =?utf-8?B?RnIvWUwrUVlCK0IrZnMwdFZzR1JRUEZnMTdGTGkrNE9EUmI2cEFPdHZzT3hS?=
 =?utf-8?B?cmhKdTVmcFNMTzFDb25TaE0vMjJJd0k0L09ncXRjeXNMYWtDNnIwYWxQV3h1?=
 =?utf-8?B?clBvV2ltWE5ZdFhUNkJtNFV0Z2ZzVHk1Uy96R0pGeEhJT0FPSFJ4SG9YRmV6?=
 =?utf-8?B?alczSExLdFB4M1NwNHlmVEJZYU5EYldCbW85Yy9xWUxiTE5LNWp1aTBlaE9m?=
 =?utf-8?B?aUlCWjV5enYrcEFBTHBOWkdXbjBmQ2x6QUVhM2ZIMUxSd1BzbG9kTEY2aWEz?=
 =?utf-8?B?QXdSdGl3K0taQlM2eWMxUm5YbUswQVF3VUs3NTlHUUtHWFNYQ1BPQldieHVO?=
 =?utf-8?B?Zk5JTzYvYUdhTk1QTEJJMXlpbHZFR3drQlk0R05BK2wrUnQwOXYxdG1LajFX?=
 =?utf-8?B?ODE5L0YxdUZEbWdxbm1rd2pzdW41TFRCOGlkZWdhV0pqdDhVNGN0YTlEdzBh?=
 =?utf-8?B?RThKWHVwa3hOWHpyTXFEU0VvWjJFbVdsMzYvQ2VicTJPaklsUUpIVE9HQUZr?=
 =?utf-8?B?OXNOSC9LS1krMS9XYUp4aFc0RlYreVh1RVJ6WlRmRXM3cnJWTHZ3dmRkN2N3?=
 =?utf-8?B?TnVhMWlobHYyc1lkdURDRUVZNk8wL3ZkRXpQUXlIL3lRaG9DOEtJM1hqN1hq?=
 =?utf-8?B?NUkwdUx2V0dCNStSc0hwelVQVUgrbkw0L3pRSnNhNkdFd01QUjdENkM0cWw1?=
 =?utf-8?B?aCt3dXo4c1ZhNTVvUkFNVGk1YUZjVk9LbFJMYTVqR002VmtwaldwSDdicExh?=
 =?utf-8?B?OHFQbW01ZTkyYmZRUTA5T3VCemlGZmRDQWhBK3hIMDZIaDN1ZGJ1aGN5L1FU?=
 =?utf-8?B?S2huQjJwZHE5YkxrT01rQTlVYk50ZVpuWjhteXpycjh3VExoSEY1NVhtZUc3?=
 =?utf-8?B?UDkwcjY4YllOMUdpdnZUWUUrZ2VoMERHUlhJa0JXeHdUMnJWOHA2VGJBYkxE?=
 =?utf-8?B?ckNhTFY2VEY1Nk9BME82MWJCS25QUVZwZ0VDRUpVVGxiWGp3M3BiQ3VtemZJ?=
 =?utf-8?B?Y3J6alZyVVIxcExhTFV3bHdmTmZVNnl4ZTRnYU5nbDA5VDAyalRwdmh6TnRk?=
 =?utf-8?B?YXBHQ0VmN0hGYlM3RmV3M05NV1J2bnhlZWxoZW9rMzhzcXA4VzIya2p2UzBR?=
 =?utf-8?B?SWNRN0puWFRIdjl0WER3QjlSYWdJSGZWS1JMT2lPK2hKK0dhY0FqTFhLY1Bl?=
 =?utf-8?B?akJwY2loaVpEYmlEVTIzRm02SlJ5NG94ZXRTUE1vWWZmSksxWXJQRm5VZEdz?=
 =?utf-8?B?QVdHMm1uOWh4VThtdkdzaEQ1ZWhFR01Tc1NVWlNjeDEvMEQzMjkya2JlbEdo?=
 =?utf-8?B?TUgvc1NVa3FWdmFDdjJoeDd1N0JCbkY3R2hQbEs1VEdmcWlkWkw5MytiMDQx?=
 =?utf-8?B?TVFLVmd0Q2o2N2plL1lzMGlPRFVZRVVCVlhVWUVacVFmNGZmVXovZVAwdGhD?=
 =?utf-8?Q?nMFwxAjIF4aLf/VExUNcMSrTr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd27c1d-5743-4bcf-3fe2-08de0cfe2a3f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 21:51:30.5753 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mt1eOA9lwnCI7s9fMDV59ardZIV9zgSPGRc85N1Zgw2Gm67w2rmPhs3uOrm85BIQCuaChnwHcqJjC+3jDXsKDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
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

--------------V40HFklYRy2znk80Dwc9CX7i
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 10/16/2025 9:57 PM, Michal Wajdeczko wrote:
>
> On 10/16/2025 2:05 PM, Tomasz Lis wrote:
>> To avoid having duplicated checks, and also provide clear
>> documentation of what are we checking for, the conditions
>> for initing CCS BBs for VF migration are closed into a function.
> I would drop "BBs" from title and commit message, as this is
> just an implementation detail of the "VF CCS migration" feature
> that doesn't need to be exposed right now.

Is it though? Does that mean DGPUs do not need "VF CCS migration"?

VF CCS migration, like migration of all chunks/blocks of VF state, is 
handled by PF side.

What we have here is VF-side workaround for hardware limitation of few 
integrated platforms. When it's no longer needed on the next platform, 
will we say VF CCS migration was eliminated?

This workaround has been named under main feature name. That wasn't the 
best idea, but it's done. Though in future changes, I'd propose we move 
towards naming it what it is.

We may change the name to something else, but disguising it under main 
feature name does not feel right to me. It is important part of this 
feature for certain platforms, but it is not this feature.

>> Signed-off-by: Tomasz Lis<tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 15 ++++++++++++++-
>>   drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
>>   2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> index 790249801364..7688d1baf42f 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>> @@ -260,6 +260,19 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_sriov_vf_ccs_migration_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
> all functions in xe_sriov_vf_ccs.c are related to "migration"
> but only this one mention it in its name, either rename other
> functions to match this one, or name this one simply as:
>
>        xe_sriov_vf_ccs_is_needed()

When I imagine anyone trying to understand this code and reading 
"vf_ccs_is_needed", it's hard for me to find a path when it doesn't just 
end with confusion. That would be a confusing name.

So I guess renaming everything in the file is needed. But that should be 
done as separate patch, and most likely will end up being a separate series.

We may still discuss whether "ccs_migration_bb" should be the name, or 
something else/shorter. I considered "ccs_wa" - shorter, but rather 
generic, and by this logic the whole recovery should have "_wa" in 
function names. I also considered "ccs_lrcas"/"ccs_migration_lrcas", but 
the additional contexts are really just required accompanying stuff to 
what is the central part here - the batch buffers. And that's how I 
settled on the current name.

The word "migration", when not accompanying directly by "vf", also has a 
different meaning in the Xe driver; but I can't find a more unique but 
still true word. We have "recovery", but that is only connected to 
"restore" part of the process. The words "vf" and "sriov" are still 
close in the name, so I consider that good enough.

>> + * @xe: the &xe_device instance.
>> + *
>> + * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
>> + *
>> + * Return: true if the BBs are needed, false otherwise.
> "true if VF driver must participate in the CCS migration"
that's good. Ack.
>
>> + */
>> +bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe)
>> +{
> this should be always called from VF code, so even if not strictly required:
>
> 	xe_assert(xe, IS_SRIOV(xe))

ack.

-Tomasz

>
>> +	return !IS_DGFX(xe) && xe_device_has_flat_ccs(xe);
>> +}
>> +
>>   static void xe_sriov_vf_ccs_fini(void *arg)
>>   {
>>   	struct xe_sriov_vf_ccs_ctx *ctx = arg;
>> @@ -294,7 +307,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>>   	xe_assert(xe, IS_SRIOV_VF(xe));
>>   	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
>>   
>> -	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
>> +	if (!xe_sriov_vf_ccs_migration_bb_needed(xe))
>>   		return 0;
>>   
>>   	for_each_ccs_rw_ctx(ctx_id) {
>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> index f8ca6efce9ee..dcba4173c712 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>> @@ -14,6 +14,8 @@ struct drm_printer;
>>   struct xe_device;
>>   struct xe_bo;
>>   
>> +bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe);
>> +
>>   int xe_sriov_vf_ccs_init(struct xe_device *xe);
>>   int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
>>   int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
--------------V40HFklYRy2znk80Dwc9CX7i
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/16/2025 9:57 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com">
      <pre wrap="" class="moz-quote-pre">

On 10/16/2025 2:05 PM, Tomasz Lis wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">To avoid having duplicated checks, and also provide clear
documentation of what are we checking for, the conditions
for initing CCS BBs for VF migration are closed into a function.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I would drop &quot;BBs&quot; from title and commit message, as this is
just an implementation detail of the &quot;VF CCS migration&quot; feature
that doesn't need to be exposed right now.</pre>
    </blockquote>
    <p>Is it though? Does that mean DGPUs do not need&nbsp;<span style="white-space: pre-wrap">&quot;VF CCS migration&quot;?</span></p>
    <p><span style="white-space: pre-wrap">VF CCS migration, like migration of all chunks/blocks of VF state, is handled by PF side.</span></p>
    <p><span style="white-space: pre-wrap">What we have here is VF-side workaround for hardware limitation of few integrated platforms. When it's no longer needed on the next platform, will we say VF CCS migration was eliminated?</span></p>
    <p><span style="white-space: pre-wrap">This workaround has been named under main feature name. That wasn't the best idea, but it's done. Though in future changes, I'd propose we move towards naming it what it is.</span></p>
    <p><span style="white-space: pre-wrap">We may change the name to something else, but disguising it under main feature name does not feel right to me. It is important part of this feature for certain platforms, but it is not this feature.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Signed-off-by: Tomasz Lis <a class="moz-txt-link-rfc2396E" href="mailto:tomasz.lis@intel.com">&lt;tomasz.lis@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c | 15 ++++++++++++++-
 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h |  2 ++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
index 790249801364..7688d1baf42f 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
@@ -260,6 +260,19 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
 	return err;
 }
 
+/**
+ * xe_sriov_vf_ccs_migration_bb_needed - Whether GuC requires CCS copy BBs for VF migration.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
all functions in xe_sriov_vf_ccs.c are related to &quot;migration&quot;
but only this one mention it in its name, either rename other
functions to match this one, or name this one simply as:

      xe_sriov_vf_ccs_is_needed()</pre>
    </blockquote>
    <p>When I imagine anyone trying to understand this code and reading
      &quot;vf_ccs_is_needed&quot;, it's hard for me to find a path when it
      doesn't just end with confusion. That would be a confusing name.</p>
    <p>So I guess renaming everything in the file is needed. But that
      should be done as separate patch, and most likely will end up
      being a separate series.</p>
    <p>We may still discuss whether &quot;<span style="white-space: pre-wrap">ccs_migration_bb&quot; should be the name, or something else/shorter. I considered &quot;ccs_wa&quot; - shorter, but rather generic, and by this logic the whole recovery should have &quot;_wa&quot; in function names. I also considered &quot;ccs_lrcas&quot;/</span><span style="white-space: pre-wrap">&quot;ccs_migration_lrcas&quot;</span><span style="white-space: pre-wrap">, but the additional contexts are really just required accompanying stuff to what is the central part here - the batch buffers. And that's how I settled on the current name.</span></p>
    <p><span style="white-space: pre-wrap">The word &quot;migration&quot;, when not accompanying directly by &quot;vf&quot;, also has a different meaning in the Xe driver; but I can't find a more unique but still true word. We have &quot;recovery&quot;, but that is only connected to &quot;restore&quot; part of the process. The words &quot;vf&quot; and &quot;sriov&quot; are still close in the name, so I consider that good enough.</span></p>
    <blockquote type="cite" cite="mid:8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ * @xe: the &amp;xe_device instance.
+ *
+ * Only selected platforms require VF KMD to maintain CCS copy BBs and linked LRCAs.
+ *
+ * Return: true if the BBs are needed, false otherwise.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
&quot;true if VF driver must participate in the CCS migration&quot;</pre>
    </blockquote>
    that's good. Ack.
    <blockquote type="cite" cite="mid:8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+ */
+bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe)
+{
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
this should be always called from VF code, so even if not strictly required:

	xe_assert(xe, IS_SRIOV(xe))</pre>
    </blockquote>
    <p>ack.</p>
    <p>-Tomasz</p>
    <blockquote type="cite" cite="mid:8f905d60-23c0-4d49-8a94-7bc800d82baa@intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+	return !IS_DGFX(xe) &amp;&amp; xe_device_has_flat_ccs(xe);
+}
+
 static void xe_sriov_vf_ccs_fini(void *arg)
 {
 	struct xe_sriov_vf_ccs_ctx *ctx = arg;
@@ -294,7 +307,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
 	xe_assert(xe, IS_SRIOV_VF(xe));
 	xe_assert(xe, xe_sriov_vf_migration_supported(xe));
 
-	if (IS_DGFX(xe) || !xe_device_has_flat_ccs(xe))
+	if (!xe_sriov_vf_ccs_migration_bb_needed(xe))
 		return 0;
 
 	for_each_ccs_rw_ctx(ctx_id) {
diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
index f8ca6efce9ee..dcba4173c712 100644
--- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
+++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
@@ -14,6 +14,8 @@ struct drm_printer;
 struct xe_device;
 struct xe_bo;
 
+bool xe_sriov_vf_ccs_migration_bb_needed(struct xe_device *xe);
+
 int xe_sriov_vf_ccs_init(struct xe_device *xe);
 int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
 int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------V40HFklYRy2znk80Dwc9CX7i--
