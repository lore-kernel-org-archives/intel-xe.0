Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF4C1CA0FF9
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 17:53:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47E8210EC21;
	Fri, 29 Aug 2025 17:53:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZwSVNkXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8C410EC20
 for <intel-xe@lists.freedesktop.org>; Fri, 29 Aug 2025 17:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756489987; x=1788025987;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=0/8znshDrvmoec5YVNQESb4utadqWFwtCt8tJtjm+Ak=;
 b=ZwSVNkXL5TXYF4X9pr98MkC0V7ginDPUiXDPKBhBAlen2OogdCkeWC4s
 r7zK26LfEloa4xgI8kOi2WGRwFycJ7hfMCBpysd9V3120W5MFNDkU/XQq
 aFxY/xLCeJkKNch1gEO1HCGNDf3H0KmHKIsLDdJyTJ51di87m/PRL8ILU
 1u0oTM+ahc+w9HKf+Vcw0UjtbouNwyJh1GgV/e5xXvsAnhGszxRPZvR4/
 x1F/0vd7XijifPGLPuCUvhKju1U1fEtOBVH8ZppHJyfHqgGHIiHIeGXYr
 1Ed/RmTbu5PhQ7OSvbfO9azyjq4nm87UgxupJIiBJ9E2Ba3QyCro+inpn Q==;
X-CSE-ConnectionGUID: h7UxTLptTXKRgNC1HnmUXQ==
X-CSE-MsgGUID: NfPkT6a0RvqHa8HLV9DRTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58932057"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="58932057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:53:07 -0700
X-CSE-ConnectionGUID: ALQdQgDnTCOrquxyby/ZqQ==
X-CSE-MsgGUID: 5kjT2vJoQyOaXOwzv62BPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="174804871"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:53:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 10:53:06 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 29 Aug 2025 10:53:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 29 Aug 2025 10:53:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S4mFaoD+iuRcX4qIlkVK4+tS60lD8hYKje7vdhVi44Y9tw9DntM1GFoOBujsklfeiPV3ZejDaIX4OhrNfehfgohls9TwD5uYSL8VvE4LNWH4wfJA7HYajEapckyH2kqgOP2QlbGbBOOuJhQgrsyVk04zReIHTG831Sv8busdqU61377AMoMTKfDtPuFqvxjGZrczw7Kh5bD4zDJhLxd3/7MalACoqOXKMB1MaB7MKHC/ed10UIrllCVf1vXvsAOdZQOrN/euLR5kKtMZhU2mCggTO1uZNbwFXuCGmqyvaJXgx2mYDUEoiNjKzA2+jgSqGbSt+lVsmQmfvnCnBN+Cjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcai6tt00gz/peQ3efiEu8jzpTNIrD4StW5CekjG538=;
 b=bN/wEWwe/CO+NY4M6os+g7wue+Zk7MwGwAmXBRcYYgqdw81c26m21MTL7XmXf8TR5JhaAN4/50/pDeFs4HsUh2QCqiP6meLRBB2Uw0K+rebo7hryHhsPK2BXs7G6pC8U9333V2ytClavzHJhkMHjzCJoON9VGob7JV86GGEw0NHKpt+QRvIDlrYsMC3Wpat+YWQN5bg/uQ5ULpPjj0HacLlz9oZV7hwWd6OiRJ+/CuCErihWMqKTtHedry94r7792RSkoxZzFEh2N7h9tI3dAnReXEbIUEvJOxdpCY7dtfIFDQqpfHb6GQAJlpuJ9mpfU6xC3xqEghyGbKzXOZbymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CO1PR11MB4865.namprd11.prod.outlook.com (2603:10b6:303:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Fri, 29 Aug
 2025 17:53:02 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 17:53:01 +0000
Message-ID: <0b1db42e-f33e-46bd-90ce-04a99d98fba4@intel.com>
Date: Fri, 29 Aug 2025 19:52:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/xe: Add clearing stats to GT debugfs
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250829172232.1308004-1-matthew.brost@intel.com>
 <20250829172232.1308004-2-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250829172232.1308004-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::24) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CO1PR11MB4865:EE_
X-MS-Office365-Filtering-Correlation-Id: e15e1a73-1615-4598-1c84-08dde724e5ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVRuaVRaa2ZoL0FBK0h2RVdGY1pocC9nTVJxN0dxSWVpb2ErOXBVa01GTjl3?=
 =?utf-8?B?OGJ5WVVFRytpY1dYaWdmc1AveW8yK3BuLzhoQzRkQWhWekU0aHVRTnpyZ09B?=
 =?utf-8?B?M1NJdWRqQW44YnIzenlHZEtPNkZiSU93UlFEYk5nNGdzRmxweENNQWxVMHo2?=
 =?utf-8?B?MjdXMEtGSFFjc1RzMEJsQjlLZi9Idlg4ckJUaDJ6Mkt0cERqUzZpMHRoRVBH?=
 =?utf-8?B?a281dXRUZVlKRWJ2R1lranJPL0UvR0pDc2JwbFRLMmJmeTVLemtSSWlaRlAr?=
 =?utf-8?B?RlVqWlZRNGYwS1hqK1Z4T3hGWVZNN2NaQTEwNVRCOFUyZTFZS1cxdmo4Uk9Y?=
 =?utf-8?B?ajdrbnhvajlnMXNNbGtVY2JoTTFFUThQVTVUKzNVZmNJaGo5c3ZUYTVCRVdM?=
 =?utf-8?B?WlVJTTRvbStBaysvTWZFemJ3clNML0orRmtJM0s0dWhybXhBY1VHOVhwR0Vj?=
 =?utf-8?B?RnJpZHdSYUc1WGk4UTV6WnJNQ1VqWnVZdkIwYmNaUCtDaytQUVo4elIzNEc1?=
 =?utf-8?B?Vm9qbHczMDY4aWVaa3Y1UHJlRGtuYXNWY3VyNU5pdTNaWjkveXQ2Ly9WaVpV?=
 =?utf-8?B?dkRKdVJlbmVPUDFyT09BWEJ1M0lHQTI2Q29CWXY4RDBTbld0aTlBSjR4RkQw?=
 =?utf-8?B?cDNlNnNZcUFpd2FVTGNxUUJNdEc4bFU4SVh5cEJnK3ZnMldNdXhzNmppSVlQ?=
 =?utf-8?B?b080YnZ0MmFOdTRoZkg3elBocGxTc1o3d2lFMHdhYkRKRVpVQlN6eVl5bWxJ?=
 =?utf-8?B?aDNVZTRKa2ZuT2Rva2orWVNpRkc2V1pjSGJjL0JzWHJ6bThBWGkrMEJRK2Rw?=
 =?utf-8?B?TDlnaVBBMjJOS0N1ek5MRWFHTmF6emwwNmsyNHNMRWRMZTFtd2pBdzAzVDZp?=
 =?utf-8?B?MlZtVldXN1hQRGNSMjZIdm1uU1RPUHFqRG1uNjJDeWw1SkRueHdNMEdHYkFF?=
 =?utf-8?B?V0gwQXFjZzZPdG8xTDFyVDkwMFhYWXJjazhlLzYxN0U0QlMrdjlXdTkwSjBC?=
 =?utf-8?B?NHU5VElubmZ5aUJubUlNdXNLNE1NakVtUHVUdGJTSmZzamxTY0pEdG13anNo?=
 =?utf-8?B?UDRXbGtIeW0xVGpSQm5HQy80aExuVm1HRDkxUFFFU2NWUGJ1b3Jwc0VMWk02?=
 =?utf-8?B?UHdhQzlaTXBsL0FuYitaWkRYSUZydmtKdmlVRzdYOFBDQWZGNU52UmFHSVFx?=
 =?utf-8?B?cnd1OVBReU5mRWVObFBmVHJITkJzalVtbzcxelBoaFBPMFJkOGdVTTk5VkM4?=
 =?utf-8?B?ZW5GVnc0LzlrTzBzcE1CekVYbXNaNDNtSXIyZ1hWaCtvN1FQVGNia1VvSStM?=
 =?utf-8?B?NGQxM0t6QzFGbFBzQkNVQitscmVwakVUc2Y4MmZvYlhLeGVpK1c0STBxM2hl?=
 =?utf-8?B?NEFCRkNBNTc3YmtJSkVnakg1QlBUZDEzOElpbVhxTlZaN0o5djloY21WZlhq?=
 =?utf-8?B?SG5tNHpIc0xoOHhTUS9Pc3ZUZzllSStRVFM2UXVab1pmNmh3Y3ZlWkp6NUtN?=
 =?utf-8?B?VE04VitoakE4cFdhNGx3WmcvU3JZeWw3NDhPVXVFVnBlbjIxeE0rNVhKSUVR?=
 =?utf-8?B?TjNCOUJZWGVvckpKQWF2NkxHYUt0bmJtQVZIQ1ZGRnVQMENUa2hzSFZSYmd2?=
 =?utf-8?B?SkVwc09iOCtnZmlLZnpidFl4MDFaK0xGUEV3ZWQzS1dycmhKRUlPOWNRWWs2?=
 =?utf-8?B?RXBSZGxtRlNHZ2djSlhqN0NvN0tiaHhDc00vaXhHeGNVdnQxYVJGN0ZRekxO?=
 =?utf-8?B?RnZWZEE4RjRGayt2Qll1ZWhCelBHVlVHd0VjQ1lVSGdMSStIa2JQd0hwS1BN?=
 =?utf-8?B?emJZYUNqYWlRZUFsTUdxZmJvS2pLZVEyYXFET0tWZjFka3VsTXd5d0t0OEFF?=
 =?utf-8?B?VWRsSisyRnFSR1FwLzJUMlNaWUdnRG1yRHRnS2RMUUttclpJYldVU2Y0THRL?=
 =?utf-8?Q?z/jKzXVrdfg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmpUVUNCckhWZDRlM2lmVy9HYnJGa2JZVzVBNzJkY0xrT0x6OWpYN2o3eFpH?=
 =?utf-8?B?YllWdGsrcHVCeXZlelRmelJSdUxZRlN5Z3ZodiszRE5GZ2NTN0xFOW44Tm50?=
 =?utf-8?B?K0lhZERXazVPbmt6eC9uMjMxeFdkR291ZFBKNEZDTXN2TFNqS3BEOUYrMUtr?=
 =?utf-8?B?SHprTzhsd0xSaTlHZlAxbEEyM3I2QlhTc0NmYmQvRG53dFFuNFZERmpZVEFE?=
 =?utf-8?B?VU5WRmU4Q3RvU1o5WC82QkxRSGxCYkhxclk3THVRdlM2MzNnUmowbERZSlkr?=
 =?utf-8?B?S1hKSzRlOTJOcXV3T3AydldqMkhGOXNOdmhSUXlLVXJycVJGWDRhb1Qyc2Ur?=
 =?utf-8?B?UkdmWTBhaUk2SjIweVduQU8ycm90Q1R6V0FHS0RhYVV3akZNQkhOeTRkZmtp?=
 =?utf-8?B?V0VTL0RBb0ZnQ2hLNE1pY1JkYkptZXlSN2hsVlNpeDdzc05JTmdtQUVERTZG?=
 =?utf-8?B?YVFtczViVkViTWhnZm1UdjdPQWVET1JCL1Q4UlNxOHBBSEV5TE80YW1mZkVj?=
 =?utf-8?B?ajFhR3R1NzFONzR2L1MvT25WUTVkd3NkaHZqSG5LYTdxSWt6RHNSaTU3SGxO?=
 =?utf-8?B?WkkwUUNTNTRnbW5SVWhpbWx5UXo5NkpHT2o3Tlc5bk1JNnlZb3VTMVJnT3VV?=
 =?utf-8?B?eFlieU1FemU1YW1RSFhZUTZOQTFpY2NPT0NtbjZ1dnBRQzJaOGxoenc5U2c4?=
 =?utf-8?B?QkptOXNnbWlFdlYzdisrMTBNbHdPMW0rS040bWFTc1A0THBYcCtlMTdUTjl5?=
 =?utf-8?B?ZnNVSG5rUnNYZVJjSVgwdC9vWlkwOUZvSjVtT243WFhPRDdUUXlydStvc1Vv?=
 =?utf-8?B?bk9LakRybDQyREU5YnpYMnVHUTV1TlJldkdzWC9SM25RK1UzTnM5eStoUURm?=
 =?utf-8?B?ODVvUHZYa0dKd0ZCUStLMmlJanhub096cThNeXVFREY0dVRZcSt2WDlOZENo?=
 =?utf-8?B?VVlOVnZoNVhFdzVUaUZzZWtBY2ZlV29rVkQ1Z2dlK01ld1FreS9ydnFZUXA1?=
 =?utf-8?B?WHZ0cHg2WHYxM1FlbVlJZ0JMZHRMdXYyZHRIR3NCZEVZL01EK3VMc094T1hk?=
 =?utf-8?B?UENubzRkZ2plNEdEUGdqWnd5alVYVFp3M0toQUI0eHVPek9NVlU3TUp3UXV3?=
 =?utf-8?B?TWNxckc4NVBrMkgrR0s3d25oWnVWUUR5SnRSSDZTK1ZHMWY2TVhzZWU2V3gz?=
 =?utf-8?B?Wk1BNncyS2tLTHpxNXgwankyalVHNEtGTE1CKzhOd3hRcUdqQVZMSzFHcDNa?=
 =?utf-8?B?Sk0wMnFNYkViN1YxR2VyL2pCZkVJNnpob3NKWWtkT3FMR3J6bUxQLy9YVmMv?=
 =?utf-8?B?Q3hISU5GY0FGcmkyYlEvS3ZOVXVLY0lZbUdxWlZYelNHQjIzeUM5d0hGRERq?=
 =?utf-8?B?cWZJbVBpTjF6NVJrYUp0NVNQMHVBNDVFRkpBMlp0NStVWEdQdmsramIxcjRJ?=
 =?utf-8?B?WXVFT05JOVM0ekVOTnoyM3o3ei82dDVObVpOZE1UVlBUbFBXTS8rR2V3blQr?=
 =?utf-8?B?c2VQdXJwcTk1cmlTWmlGS3ZtYmloRDdTWWxMT0tVVzNtdnViN0xjMUlObzQ1?=
 =?utf-8?B?WEloRW8rdVVqVW1ZVEZacnhqa2ljZ0lLQVlIbkNhNlFJVEhBUXl1NVhJbERi?=
 =?utf-8?B?dFJFKzYyQ0ZOVVpHV2tVYW10QTcxUHljK1dNL045amUrVmpvZ3FWWVozN2Uv?=
 =?utf-8?B?cUZoWlNzMlYzS25NTmlSaVh4MyswY1lJMGJtZjJqT1RnL0ZlNllYcU1OTmRT?=
 =?utf-8?B?MkduNnVOdGIrdG4zWmpQdTB2dVl1TFZNdTJHa0VXcWdnMFg4a1dJRTJGNEZ5?=
 =?utf-8?B?dHFxSEEya2VHT3NjenhjMTJ4K3BXcVVyWjlaVy8zZ1JGVDJpRXlFazNYZlpO?=
 =?utf-8?B?MEJzZ1dnTkgrVEhZemh1emY4dEJ6UHVMamR2eHdBL2NhUkdnaGFoU0Y4QXpl?=
 =?utf-8?B?R3ptSi85QU1ialhIR0ZadVljR1V0ZWUrQVkrWlIxZUc1MEkweTRzeUZFRitj?=
 =?utf-8?B?TTJldW1KbVJHMlQxVTdhMGl5QitRazZaVmtUUmZsSjlxajdLVGZoMERpQUpR?=
 =?utf-8?B?WWVmTmFQb2dNRno1NFZXWXhlM2dyTUVUZ01XVk9JcVFzZVFld0l2QXNNRGd2?=
 =?utf-8?B?WFFnMkttaHV4Mkx5T3JsSlEvM3U2b01MUlplSWxHYzJSMXN3cS9adk5aTjhk?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e15e1a73-1615-4598-1c84-08dde724e5ca
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:53:01.9313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: plCEMGUBwSazCdx6Se4ozN9pm/VSK5CG/p8TLpguNaANCpui1ljtr5UjqcvF+crkxFOuxlt/pC5KTqrWf2gWWuryu85rGxWQ4ZtKmsHCs/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4865
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



On 8/29/2025 7:22 PM, Matthew Brost wrote:
> It helpful to clear GT stats, run a test cases which is being profiled,
> and look at the results of the stats from the individual test case. Make
> stats entry writable and upon write clear the stats.
> 
> v5:
>  - Drop clear_stats debugfs entry (Lucas)
> v6:
>  - Use xe_gt_stats_clear rather than helper (Michal)
>  - Rework loop in xe_gt_stats_clear (Michal)
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


