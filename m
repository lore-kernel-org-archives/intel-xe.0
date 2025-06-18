Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E48C7115B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Jun 2025 09:11:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68C510E7B0;
	Wed, 18 Jun 2025 09:11:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VvCIqzCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ED810E7B0
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Jun 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750237881; x=1781773881;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bvO5s74oays6FrCrKwy3hIHS04w54l1XkznDCEUwRME=;
 b=VvCIqzCBfkki7wG0WodOjAuvqCKBfBOSK1f55+XfgCPR9ACnC21TxDH2
 OkVEFE+j0l7CtBcnb6iAaALMm7LQxVpwfMwcoqAx52zqQs87Hnr49CJLG
 6kERIILwtJzkf+VSbni4l/MXUQf+4lSGJ6kRcTuzs46ucBQaYf3JW6SPh
 Ilo8/YcSwPtC3QoCHtvDW7UPPNpRFu9nCvM1S2XJsKZ6zHeyVa5qrLoXJ
 TwUPP73T+zqa/KrFxBotDakaQWSxv/WZ6s/qNKQxU6163thOqq1tcRSTY
 1P4TrXPe3NkJ5pv+eez+x4Hi0v582U3POYoOeAxNlnqBT7eZB4hIAZ0lD g==;
X-CSE-ConnectionGUID: 2jRJVvbXTU2kY5wWRc4wEQ==
X-CSE-MsgGUID: bjeWwBLOTDS9ZdFrm0TV/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69889383"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="69889383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 02:11:20 -0700
X-CSE-ConnectionGUID: 3Ty323dlRcijfb94+tZF3A==
X-CSE-MsgGUID: 5+HWf3S1TMa0sZRBFnpIuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="154071813"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 02:11:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 02:11:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 02:11:17 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 02:11:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NW04YwKpquixtrmk7oee8VyDeKkNawEnLWOUo/crnb/QfUYbsjBtyyuGc0mQMtcxkhnFEWBFTfP4ne0olqCxU+8vGr6V2VRh1ZfG83FThrAj9itF6poNfmRxdLD9n2M5UcdDW2T8p3J1YOzShlJkMis8bQUZqPV1SthgyivN3LgR5EUyvg13k2vWQY71QXzznGPdMYXmgzKauCNe7c8SrGGGsIWMyJJTKoSHa/3ExM1/PLk8JHR2EwovV2GEx2GFFzGy4B9nE/Wxad+527ds94ODy/g5dBv/9QpwQaUZumop0p1uZc4ZljPtD+2eEUJiq1E8IB4EFxpNTGAutaQ20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3gW9oUl+YqNEZDqCLnFf8XWkcQGTnXdcBQQJE+E2HQ=;
 b=NX3ie2b0RhQ8q9oMg3ntkeaYsu61cBmAT03YqCCX0Gx4rwFB+FcKrXNqZ8OgOKCP/vxZZ1KWIENz3s5gI1K56u/nzNRCALUThz9YEoze8Rn/9RHbj2gxzsIkTGz4mnyc54tV+POfGNM4ApwdGALyYtn9am9AWIgPQLigwKK1u55rZ8azFHxJAyrXiPNyKyx8LTJSUoebSo+7t7DRb7ob6fvfGvrJa1T9q28kmG+vsPcvLH4ZeS3IBrhRg9dYa9qEqHkgxKpMg42EfQItr0NsnF9zT9047l+Qho1CiuTid9VxRZ2tvBrjaxro7S1ctLMVx1QUGZPNSGzsFmWbunmMkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 09:10:52 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 09:10:52 +0000
Message-ID: <7df65b42-97e9-4c1f-8ac6-c211b45b4106@intel.com>
Date: Wed, 18 Jun 2025 14:40:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>
CC: <lucas.demarchi@intel.com>, <ashutosh.dixit@intel.com>,
 <jani.nikula@intel.com>
References: <20250617171600.2905682-1-soham.purkait@intel.com>
 <20250617171600.2905682-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250617171600.2905682-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: fc7e6258-951a-44c5-e62d-08ddae4805d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVVqdWVadWQvQnc3TSs3NzRsQUhDOUdRRHgvTkNzVG5mL1dDeFFjRzFzRHph?=
 =?utf-8?B?cFhFMkxJSVZZZmR1N00vc0lHYUwwUWgyS3FueXZoeTVCZDREWmswcU9tbnEr?=
 =?utf-8?B?K1E1VWRGRlAxMmQwbmVNdTdkNDNTZEorRnhIN09zbmZPc20yUEYwMjFPcWRl?=
 =?utf-8?B?T3hNSzVRdjVPSEVIVndodjFWcGs3ZUFhaVgzNnZ2SmdvYTNaYTV0cWllanpU?=
 =?utf-8?B?ZElzbUJ4Zi9lY2FUemNtaFYrczVQbSt3blNweWZlVEpyYUtJT1dOczFqcmJJ?=
 =?utf-8?B?cWpUN3ZrVW9wUHV3ejFrTXQyRUhROEhkSjd6WjBJR0dJNmMraEhTUk53WUxP?=
 =?utf-8?B?djRuZGtiSDN2ZHdGWXBldWIwamlWcXQvUTBscHlQY29nZ0w0d0pLa0pBTEFS?=
 =?utf-8?B?bDMxRkNOSmVHY1NySXBGaitST09JVHpCZEhVMVBQakxrZGVoS2ErTDN6V2Zl?=
 =?utf-8?B?bWZQVlA5N215aGVnQVgvSXlZTk92ZU9tOFA2S3ZlOG1tRmEzQTFsMlVTT290?=
 =?utf-8?B?NVh4b0M1bEYrcmZPYXNLSnpqSGIrL0IrWlBwZkdEdFExREZ0amxhbk5PWmNC?=
 =?utf-8?B?bHFCaVk2Y0J3UGdUZHRtUVl0SzFhaXZORlBzSGNmclMxN3VyYlVLaS85bkgv?=
 =?utf-8?B?WlpVZDZ6S3lHY2dycWZFQk1sMjNUTWhwNlF5UVcxdHMvUVZOZzdOVDF3MVVr?=
 =?utf-8?B?aDdZeGxIcHRMKzJSWGJRYWpKREpZQTRwYi9ZdzhIOUVxSlFvQjA3T2Y5cHFW?=
 =?utf-8?B?bmxFRUx6V25ENENJTDc5ckpSVnhUVVpsM1Zrak5DUGRzRFpNMWRGOTkzWnBp?=
 =?utf-8?B?ZjFCdnB1MkhTdjVKZHpoek9DSURpVS9INzBNaUYzOU9jcEVFcUR2SlNGZjFT?=
 =?utf-8?B?MEpDRU5kbW9lcloxS0NjRWZpcTlaKytBOVg0OVVFMlAzb3RVTEp0UXB1K21k?=
 =?utf-8?B?OVdwdjNDZC9Ta2hvdlVHMHlMNFhNYjRNNmVmL085SEpXcUJHOE5OZnhBVjVy?=
 =?utf-8?B?VkNUOGNQaHdQNFkrMFpGTzMxd2VVQm41NkozWWp4R1FrTmJ2Zlljb2o0MmhY?=
 =?utf-8?B?cDdOdEFjVmU3dFNvLys3RzJ6ZjMrczNUMmJ0OVFaK20xVEJaQStPcGdXcFVR?=
 =?utf-8?B?YSsyQVRXRnNwZzhLcGVHRllSWkFFSEZlZVM0aUNDU3V5L09HZmxVQnZnbHl5?=
 =?utf-8?B?VDR6c3IwMnNweGswZ0FWcW5rQ21QWlQzS3l3ZHVraXFSY3htd0hQUk8wT1dT?=
 =?utf-8?B?ZnZ6alZKN1hjOTdwLzJmQ0kzOUNQc0VqSWtZMTlGWXpEbDJ0YTRRNFhaOWNz?=
 =?utf-8?B?SkxHVFErczlFQzAvUFFHdFVpZzNRRzJUL0pHNGYvWFJMdVRUWFBhRGRtQ3hz?=
 =?utf-8?B?NGM1UmZNbm5QRnIwUnRYS3dKTWpVb242bm0wc3VScGZRTG8vSGdPMVB3UE1I?=
 =?utf-8?B?WFJDbEd0SmF1U0FhSW1MbTdlK1lIcVVoYTRjYk1Ycy9vM3NNLzhlcmpqVzc2?=
 =?utf-8?B?dGdZOWxhQmFRdjZVYUpRaG5WNWJKcjZNblYveHIwRmYyaEdiTklRNlJOWkxX?=
 =?utf-8?B?eXNob05tRzc3YjRzVlNvdmp2bmtEQXNQTThXa0NkY1dvZTBPSHhTaEZkU2g5?=
 =?utf-8?B?NUFXcVFBdzRtMldBb2FFRmxTWWpqTXhZL1IvLzNxSXYzTzNZSDBqdi9JUWg2?=
 =?utf-8?B?RVNKM2VYdTVNWW16Q2pOMGZTWXFZSUdjQ2Q0L2VndHlHTDNISXNvWm85QTF3?=
 =?utf-8?B?VWdnRFgrYWNTU1h6SkpDclpIYysxOVdoRkZDby9PSE02b1dqaU9lWU1mUnhz?=
 =?utf-8?B?ZloyUGJscVFteDdyN21ueVpsQnZuZVIzWTc0dGx1TSsvOTlqYkFKcEFiMU5M?=
 =?utf-8?B?ZlhSSmlyUDYrenlqaXhaeTFHd2FwOFFmUHBwZlpEa2EzQmRsMzJrOXg2R3Zr?=
 =?utf-8?Q?AbjKPwwLHI4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2tqNm5qc3Q3anErL1loSEZjZTA0djZqbHJ0M2xVQmJyZUg4d3V1cUdvUnFk?=
 =?utf-8?B?d1NpV3puNmIrYjlmNmljWUFKY2ZUM2VXTTE2Y0FPZUdjVGF6bW1vK09KZTVx?=
 =?utf-8?B?WnlNTUNrMnlOeGNSSmN5NFNUd2F3eERnK0dzd1NWemcvS08ydGl4THhOdCtw?=
 =?utf-8?B?eThPUzU2Uy9QbjV0RG5HUWVhN0F1Q2VjK00xOVdOSVJMSVNWOEJHY3NLOFZh?=
 =?utf-8?B?V0dhWlZTQzRVTUpLOVU0TEMzNjI1VHl0bGR6bFVUMEtHM0JtNTYyQWw3R1Rp?=
 =?utf-8?B?UzRlN0RCbE9IY1c0U3p0RmI3MjY4NWtuc21wV1kyMDN4QlRoOWQrNG42SDlU?=
 =?utf-8?B?U0ZVRkM3SEhMTVp3ZUlJelRWTW1aaFZQODBUUStHbVNHRFFCYkhXL1dPWjR4?=
 =?utf-8?B?K3c2ODhHNitjNDVkUDFDcEMyVy95NG9WME44aDUzaEVMN2gxYXdXOTY3OFNo?=
 =?utf-8?B?cThtVjZzUzRrYWRBV0F6a3ZZa29rY1dmT3JZWkxiMGFQTHo2Y0NqdjZjeWRF?=
 =?utf-8?B?U3JWY2FMTzQyODRNK08zRWpLTXRPU2syNlhyN0ptRzRQbm9sd3JNclNvQStQ?=
 =?utf-8?B?T0ZQMFRsMGFZZXhOVlNwZUZLNk0zWkxFTXh5YWpLNFRNeDRxZjZFUTk0VUtB?=
 =?utf-8?B?aGl6N0Y3cHNORFBHR2JtU2c1MnZ0azBxSlgrZFQ5cWpIK3c2NFlVbGtDazJa?=
 =?utf-8?B?eXVhd1Q1aFZ0SURKaGszclRWdmZVdVFMdnNzc0N4MFN5OFo4UFdGS0kydG1U?=
 =?utf-8?B?ZmtxR2Y1dlk5Rmd6MkFkNlk4U0VHdEV4ekNabTRQNDg2STM2dWFOSThsbXpv?=
 =?utf-8?B?TDk2RGVqQmpLZ2xGa2JSditUV29yK1k1Z3JZNHZIUElOZjZLUklwRDBpU3V1?=
 =?utf-8?B?UGsyc1JZSVNTb2FyV0g1bmRMZW1DQkpVOC9CUGxHNW4wUXo0enNCM0x5UHc5?=
 =?utf-8?B?S2txcHNLaUJYcms1Nzk5UndLQzFCRkZoaThHRUZaWjRlVWd2N1RnUTlEdllt?=
 =?utf-8?B?OGZRMTlBYW9CSGR4cklhV2NUd2Z0aGtVcGJxdDhwbFk1WjdqZ0NUSThsRS9n?=
 =?utf-8?B?K2F0V2tYVmhNcWREVnBOV09IeGZERGNFU2V6WCtXNnBXSGEwVGRIT0s4WVhO?=
 =?utf-8?B?M2loZFZVUGtrdWlJQ2lJcUoxSFlFNGR1aEdhN2Y1dmY4eDlvcHVscEpKcVJN?=
 =?utf-8?B?QjFHdUZ5NStBTVp0dGhRay80NVFxT055QmMvR2gyNHNxNjgxUktkZWxtRmMx?=
 =?utf-8?B?V3IrbW1lVWtySkN0aURwTFhNZ2dsR1Bwc1NRS3hjZEh2TTl1aUQ1VWx0Vi9i?=
 =?utf-8?B?TmQ2a0FKUGZDQ0duY0hRSzBVZ2JORVZVMUZhQWl1K0tJMSsvQ1RrbzBmUzNs?=
 =?utf-8?B?YnMvY2E0VGxyVnNVMTljUkNsM3FLb3NDUW04WUpKSWpmLzNvMXAxVXRmSDBp?=
 =?utf-8?B?VkZkWmRPNEkwMDNscGkrUjI4UFdwaHhxd2ZXMG95V0lIQlMraUtpY05tNkRZ?=
 =?utf-8?B?MDBybGlLTitKMERabzIzYUIyYjlCK3BVcmNHTXdEdnYzbUpjMWJwTGpLTU1h?=
 =?utf-8?B?cFBBdGQ3M09PWVE4cExRT1ZMRmU0SzVNeHF5b0pla2Y4VncwajdDRWxyNGdz?=
 =?utf-8?B?aFZLSzdpTlJMSUNjMml0bGVnU1pIK0RXcXdXeUh3ZWhlekxqb1N3Q09IWnpZ?=
 =?utf-8?B?dFA4T0xOQVB6ZitXLzc5RVpFRThVa0VuelpPb0tlcjFlTVIxVXQydzNOdGUx?=
 =?utf-8?B?VTBTb2pUTGZpZDY4eUh4VVpieWF5c3ZFeHR4N1N1b3VLQUU3SnBuSnA0a3Zl?=
 =?utf-8?B?SnhXY3dkSnFwUDFqdTZhb2ZBOUw4S21ldjhhUTdiVjF5dXZDNnNBSE1yNm5S?=
 =?utf-8?B?Wk1RaVltemFqS1BtWDJtUkpaa3IzUWVVVW5uYVBwM01uN2JIQXJlU2VYYkNO?=
 =?utf-8?B?Z1hUY3RsallNYTAwTlpqZ1VKUHRDNmxqb2FQVEMyUVhYSzJzRmxjNm9kSVYr?=
 =?utf-8?B?Y201ZGtBbjM0MHV5aEFBR0Nsb0dwZEJTejZpUmtxSUJRVEQya3RwUmcvUTg0?=
 =?utf-8?B?UGQxelRDYm1iOVV2K0g5TUh0V21ORFZMRllhMzFVS2EyWG9JR0RrWlZzUlky?=
 =?utf-8?Q?I8UxkvH0stumRaonaWt5Kdc1D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc7e6258-951a-44c5-e62d-08ddae4805d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:10:51.9692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: otOUdInDBU0sHJR8tcZr0qbInnHJpJSozs4gEb5+vHKklouTyO5TH0LqPTR744vvtZxRLdn8BgQG8XHBzMON6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7300
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

Hi Soham

On 6/17/2025 10:45 PM, Soham Purkait wrote:
> Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_residencys
> in order to obtain the G-State residency counter values for G2, G6, G8, G10 &
> ModS and the pcie link state residency counter values for L0, L1 & L1.2
> respectively.
> 
> V1 : Expose all G-State residency counter values under dgfx_pkg_residencies. (Anshuman)
>       Included runtime_get/put and removed drm_warn. (Riana)
> 
> v2 : Moved dgfx_pkg_residencies from "/sys/kernel/debug/gtidle/" to "/sys/kernel/debug/".
>       Included dgfx_link_state_residencys for dgfx_link_state_residencys.       (Anshuman)
> 
> v3 : Included check for BMG and dgfx and helper function for repetitive code.  (Riana)
>       Used drm_info_list to create the debugfs. (Karthik)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>   1 file changed, 71 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d83cd6ed3fa8..39c5fce3e4fd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
>   
>   #include <drm/drm_debugfs.h>
>   
> +#include "regs/xe_pmt.h"
>   #include "xe_bo.h"
>   #include "xe_device.h"
>   #include "xe_force_wake.h"
>   #include "xe_gt_debugfs.h"
>   #include "xe_gt_printk.h"
>   #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>   #include "xe_pm.h"
>   #include "xe_pxp_debugfs.h"
>   #include "xe_sriov.h"
>   #include "xe_step.h"
> +#include "xe_vsec.h"
>   
>   #ifdef CONFIG_DRM_XE_DEBUG
>   #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
>   
>   DECLARE_FAULT_ATTR(gt_reset_failure);
>   
> +static int read_residency_counter(struct xe_device *xe, struct xe_mmio *mmio,
> +				  u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency = 0;
> +	int ret;
> +
> +	ret = xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +
> +	if (ret != sizeof(residency))
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);

This looks wrong. you are logging error after printing it . should be 
before and there should be a return if there is an error

> +
> +	return 0;
> +}
> +
>   static struct xe_device *node_to_xe(struct drm_info_node *node)
>   {
>   	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data)
>   	return 0;
>   }
>   
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2", &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6", &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8", &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package ModS", &p);

Also i think the previous rev had the same question, are these offsets 
only applicable for BMG? What about dg2?


> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_link_state_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe = node_to_xe(m->private);
> +	p = drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio = xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
L1?

Also make sure each patch compiles successfully, the second patch has 
macro definitions

Thanks
Riana> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1.2 RESIDENCY", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>   static const struct drm_info_list debugfs_list[] = {
>   	{"info", info, 0},
>   	{ .name = "sriov_info", .show = sriov_info, },
>   };
>   
> +static const struct drm_info_list debugfs_residencies[] = {
> +	{ .name = "dgfx_pkg_residencies", .show = dgfx_pkg_residencies_show, },
> +	{ .name = "dgfx_link_state_residencies", .show = dgfx_link_state_residencies_show, },
> +};
> +
>   static int forcewake_open(struct inode *inode, struct file *file)
>   {
>   	struct xe_device *xe = inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>   				 ARRAY_SIZE(debugfs_list),
>   				 root, minor);
>   
> +	if (IS_DGFX(xe) && xe->info.platform == XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>   	debugfs_create_file("forcewake_all", 0400, root, xe,
>   			    &forcewake_all_fops);
>   


