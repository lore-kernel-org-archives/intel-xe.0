Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB840C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 05:20:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABF710E1FC;
	Thu, 23 May 2024 05:20:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hVWCOu9m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D470B10E960
 for <intel-xe@lists.freedesktop.org>; Thu, 23 May 2024 05:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716441628; x=1747977628;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mXEHVQvu+XG9UPTP1+y18jHlFSzCtNw+/lEdiQcpXSI=;
 b=hVWCOu9mlpLx6K9GUNUa2Vuah2eHpB/CMIqS0hrVD0OBYIbRdYr2gyp/
 kOA0uQkmWhnbcia6hlpn3AVNvWiYZWZ9jslEsAtjunOXeMxgqu/4ZvU6x
 nGvp2ys5vTWPwfPcQmG1FZ3FBwdcdItAOHn4EBWxFyosaVlTNvjhfTNn4
 pw5Gc4IzUeuln9oFch4nZe+qHge9a4H8p6z2c9LLT3xoLsB/z8YX4QIUY
 Bj9U1OFfJn7J4NU8Qu+CD3mNz9ypEdMW/b3sgohEMGnUzwcQLgT6rKNnn
 zlI8ahZNhto57Ud2kJ/XfANJycwJzjfSDgEiAzG8MNnlc3vxpbE9Ek8/n A==;
X-CSE-ConnectionGUID: FdGAMIGISv+puFC+oCmYvw==
X-CSE-MsgGUID: yX63b/dkSFeTt9AVbe7tGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23346275"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23346275"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 22:20:24 -0700
X-CSE-ConnectionGUID: AvPtGcVfR426Mp4L3TDS4w==
X-CSE-MsgGUID: JBnFZM4RRu6Oxk0VDrAd9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="70942145"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 22:20:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 22:20:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 22:20:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 22:20:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZy+OThKj0EV07s3wOo6mj4+ZjEojcjEO9AtB7Shfw7uWlm+jPD1PCRDmqs8VKRUYaLlucVMbIDRv10Qqg4ItMqYkamd/uiQ0L/T0gvk34R7zN6EE+tChjyfZQpGZnzKKOAIaH3exlOvle8F84URqNHrLrTltktlp4NHcc1ujae6sCpyBp62ki165JwoQvjVl8MKw5dJR9Dwbs4ZjyD3zh3smW7sLUWR4Y9Tdiqju/qVvwCw2AygkWb0b7P4QG0AlKXfWzLTcwRVsD3QTG10UHeNOGCfNA6dz9s0po3uoeBbpHCowIUjOyyY6IvD9F/igenNzTvgDd7awV1xNyBqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANLK02zHdpR9jI9d4qSoS+BXTEEl0lbUXgydMr9VnsI=;
 b=M38+k1gB+Cz1bbw2cvcS3SRApG/ahaz7IRnlN/aBwzMqteJMwIXEhUUqBkOyM/slhxORd7dfQcxsB6Z/e8AGMZnRk/fXcm8EDfVDJeg/00sxxja1JiE23RVulqsrsGw6ndpSy/JZlg74oi800S/+aOQ9XqINN0dRKVrbmNW67Ixa2q/oARh8KUrzk0UlOFmTr0m/cxVDk9NQ0V1e35loSWHVcXxC+mZ55C42zaFR2ftpb+mFvHB8ASdCIeN7+WDb830YEtD52g6ULnR08T0I1IIoYHtT3WjK8MkYnl6tSIWn1i2d5TsjeaUc2x79mrTgM8jYQI+ijh0x9pvNcjKezA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by CY5PR11MB6091.namprd11.prod.outlook.com (2603:10b6:930:2d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.40; Thu, 23 May
 2024 05:20:21 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%6]) with mapi id 15.20.7587.030; Thu, 23 May 2024
 05:20:21 +0000
Message-ID: <850d9c71-6a96-43a4-a9a3-d49d9aadc634@intel.com>
Date: Thu, 23 May 2024 10:50:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe: Enable Coarse Power Gating
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>
References: <20240521092201.4183305-1-riana.tauro@intel.com>
 <20240521092201.4183305-3-riana.tauro@intel.com>
 <e49cf066-5ede-4699-bc80-8f3594d2191f@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <e49cf066-5ede-4699-bc80-8f3594d2191f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|CY5PR11MB6091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b77415c-0536-4b59-a9dc-08dc7ae80abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzhjSnNyKy9icy9yRlRuSmRuSWNZSGoyOU1oeWZ3YmdiZjdJYmw4NWpyU2RL?=
 =?utf-8?B?T1FwNDJWbkVIRVZLNEhKdW0vYnd1ZTU4bGtFVEZGUTAzMWkwakxVL3hzVyt0?=
 =?utf-8?B?UDNzeWZBNW5kRkhyWFp3UnoxQkl6S1ZSYW5xbGNsSDllcCtHMVR3ck5SdmIw?=
 =?utf-8?B?bmFjNzVURUx0QTg2eE9HellSQmpnNTJXQ0VuRS9OOURwYWlqbWhRanhzQ0Ra?=
 =?utf-8?B?TDFlV0NLYmMyZWw0QUZDV1prWmxKenpHYmJsM1Vqd3JxekxxVExDS1pFcjhI?=
 =?utf-8?B?d21NZ243ZE5EaVg5bEVCd2VPMkF2SU9mNjBLMXozNy90aE1MSVN5cHhDdDZ1?=
 =?utf-8?B?K2RqUUEvOXJMRWpIK0UranJqRURma0RwbHN6N3lZVEdxWVhLSE5zYTVLOVZp?=
 =?utf-8?B?cW55aFlaZThFY2k5R2lXQXhSZnJRamZXZXN5bUtDUXRrekVGaVdONUhwck53?=
 =?utf-8?B?T1pmTjdESzZtN1F6K3lnWUxjZ0V6U0R5aXFVK21rbHFIRzF3WHBkZ2xiU0dB?=
 =?utf-8?B?QzQwaXVLbStSV01iekhjQzJyajVKVXYrQmZIMlRRb09aTXNHWEsrQzNUQ3Yv?=
 =?utf-8?B?TjdKRkhmS1VMemdndTFCRHV2S0lYYXR1bkx3QThFZXBzR08rZ20zUXhEenp3?=
 =?utf-8?B?bURhNzVPUlltQmVLQU1QWXMxcU5RWDZ3YWJpSHRVdHAxUXl5c3Q1MkxIR0wr?=
 =?utf-8?B?d3pGbUR1bTNrWDRkT29YdlNMWlM2Z0l1WjhrckZDRFhQNlM2SGtuZW5WbGhC?=
 =?utf-8?B?cm9sV21FY0Y5QWsvNjJHRnlGR3NXUDdLUHMzSHNPT040VHNoSEpENnJZbTJC?=
 =?utf-8?B?a0ZwMVoyNVovUlBYTlNvUE1qeUZOT21XeTNOYjl2U0RLTGFVR2hGYjgrWGZx?=
 =?utf-8?B?aG5OYkpHRlVpOXg0MUdWcmt6WWlWSGRjdlZNMmJMWmF3MWl0WVl4WmN3czA5?=
 =?utf-8?B?U3FKSVFEZjJLczgxdmVsdndybHJ3WHljQW5mS3J1OHE3ZGtoMmVhT3pUNmhX?=
 =?utf-8?B?RGl1L0F3YmwrSEpMTnNVamRFNTB4eE9TMU4vUDk2dkdudVZmZzVjNENxTUR2?=
 =?utf-8?B?a2JhY0t4L2xDMkNpNVg4TEF5OSt3S1F6cFM4QWsreEtzS0NZTEV5d0Z6VzlP?=
 =?utf-8?B?dGFBakZTd3dZd0ZDRDNhekN2S01GcndvbjgrWTZIaDMvMjRyNHRueml3UnRj?=
 =?utf-8?B?T1BIdE11dnI0VmVEb1BDVkx6dGtTcGFWbGdGVDdNeEg0MDJ4SjFiRHgrMkNY?=
 =?utf-8?B?UzZESytzbXIvc2Q5UkdETzhtZjJMRE5peDFpTE9VNEZ1VWN4cWJYZ3hlcHlw?=
 =?utf-8?B?Qm1qOUdPdHlHNk1QbHBuMUpVMXN1UTZBNzN2cGZwQmVNNXIwaU5TN0VBbVc1?=
 =?utf-8?B?cFNBRk45T0diRkZVM3g3RXExZjZXelQwaHNyVy9PaGFaZ0paMEt2RVVCUFBk?=
 =?utf-8?B?V1RxMVFEZ29kOHFsRTBKOUM5RkhDZFZybTFkd3prV0sxMXVqTEdvNjlIWmFR?=
 =?utf-8?B?bzJLdVRDNWJoY0V1bzBJb2t1emp2ZWlkT3k0ZVNZVlR1SWxJMllHLzRmeWxB?=
 =?utf-8?B?MnZiek9UK1prTFBtZ0FwaDMvQ0taVml5RFkrRmNmQVRZbjFubnVaaEpyUmxU?=
 =?utf-8?B?SkRDQWNhN3MrQThPUkl2Q2xNSnFxTzRkKys3bGtNVHhleWlOSTdHUDBQTC9o?=
 =?utf-8?B?MVN5b3JFcHlRRFYyMWp5NGJuNzJBYlh3VkZTNTIrSHBYcHQ2dFpuS3Z3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjhzczdqNG5RM0liWGR5WkZHTE00cjB2cXZxSElzUXcyeng2WUtDamVOMFhQ?=
 =?utf-8?B?UFlHVDJybWYwVjdjRXY3LzlJQjI2Q0Mzbk5rbHhndjdGVzQ2ZyszbzZQQTN1?=
 =?utf-8?B?VkF4VzUxY2wyRUJuWXJJRVUxbE1tSTJaU2VyazRRV29WSk9IZ2E2QTBwOEw2?=
 =?utf-8?B?M282RmduWC83YVlrejVvVVI1OGZwZUVNWHErRUtxVkFtYysvQXg0U1BtbGoz?=
 =?utf-8?B?WDFoSWZ3aWNIU2RlazlkLytQay9mb1N3NVZuTEV4cWtmejg1MStyM2VUZjRZ?=
 =?utf-8?B?SDFPN1FXSFpCM25NSHZKNWZKLzBEc2x6M0dmOERYMnRrNm8yWkFDNFN3RWFR?=
 =?utf-8?B?cTV4YlJKYzdFRS9IS2l0SFR5TUVLc3pOd0FFQ0pMeUlmeVpCd05tcmFoWEZC?=
 =?utf-8?B?MnRTeWJKOVpleERyclNsRjY0T1hmWDZlRGlYSElUdEJ3YUlTMXlVbUFKdDdQ?=
 =?utf-8?B?dUpDYnNwY29yV1JuZGdCZ2VWaDJqbEViblZJUFNiaXQ0REd6aG9VZzlvZzdk?=
 =?utf-8?B?SFFIbjRZd09Rc3loeS9ZVXBQOUQ3NnJJRUJuK3YvZE4wS0MrNTJORFNFQWs4?=
 =?utf-8?B?RCt0VFF5QjRKdXJoZUUwclRMbTF1UjAxbm9GbUFha3M3d2cwQllpUU5laldJ?=
 =?utf-8?B?OEFvdEpxRDdpMkRPZjVaQitBM3FwWnMzNzBzNG1FQk1zZTl3dVlzTkx2WkM0?=
 =?utf-8?B?dEc2QzlPd2R6NEd3OTFBcnc4ZmpQQnQyYkFhaXdHLyt2RmR0Y09lSmZFQ2VW?=
 =?utf-8?B?WEdpL1F0TGczQSthTExJYi9VN1RNZzJsczI4c295MmhsdGhKOGJzazBaUmFM?=
 =?utf-8?B?M1p0TjdFcTg4UFYwY1VRcysrZEl6RGZOOGRtQnBuNG16T2FBTklJaW9VRzEr?=
 =?utf-8?B?cmtRM1d3bnlwb2pEZjhyTFlTZnAvRG0vS3NIUUNLOHloU1ZZRy9hd0xXVHpY?=
 =?utf-8?B?Y3VEdGdJc054QlpTV1ZVRnZGQm8vaUxlUndEb25aTjVVcTJvZmJINFduNExl?=
 =?utf-8?B?SnAxN2ZneEZMVGpVc0RRUjR1aE9JOEc3Z0s3c0lYSFE2cDh6TXZjSFhHVHp0?=
 =?utf-8?B?NmxEQ1ZJbmlXWXRtYmpsVmRIb2VtN2VoNnI1Z3Qrd0JOdEdRTUdVMHhnMTgx?=
 =?utf-8?B?aTc3c3RFQllnZmtuNTNoVnRFdUVLWU1Kb1FQd2gweG5oUDYvUnlaeFF6amVU?=
 =?utf-8?B?ZzFUcDRoT085WmM1M3A2ZVFZSG5HeXR2TnU3UXludCtNNi9mcGNOUmd0Nk9R?=
 =?utf-8?B?WnJKRkNiak5PNnR5QlhVc1lvWHpkUkQzTUNzcEhkOXpJZWNDZkVPaG45Tjhl?=
 =?utf-8?B?N0Z0VnJwNnFyY0Fja2ZuQWl5a0pQN2Z2dUJ3M25YaDF4ajZPQlg2V0cyTUEx?=
 =?utf-8?B?bGJYVlBzd0FNRnVHaWIyNWRzdFAwVkxBVFJON1ZxVXVvTFVXRWRSeE5DaTIz?=
 =?utf-8?B?YjJFUW95RlZUVDlKNi8xMTZMc3hLckMwWHZNRlhhYlZMUUFQaG95MWpMNURY?=
 =?utf-8?B?NlZycGN4YktGRDlTTnhabm5lRTBiMmhQS3BoSlhjUHZCanQwYmx0UjFvOHFo?=
 =?utf-8?B?WFFQdXM0ZVRQQ3F4OW1TRnlnL05FaXRaRFJmMERwYmp6RDMzbkttNll3aHIw?=
 =?utf-8?B?VWFUbnQxTEVJYU44MlVFeklIYmQrU2UzMFJhTTc3QnpieWt2TEVDamxhdDVN?=
 =?utf-8?B?QVZKT3E0MTdsa1VubVB3V1QrY1hvOG1zWVJWWjdYZExJNUFkZDFIWGRaQ3hF?=
 =?utf-8?B?dGF0RjZNQ29icENzU2k2Q3pQSjFHQVNjNnJ3aitlSFQyYy9GSUxhL3dOODhQ?=
 =?utf-8?B?c0sxUFM3WjNvL2ppRkM2T2FEMUp4OW51RjZoaGdwenVHSzFKVGY3NnpMN3FT?=
 =?utf-8?B?dGN1VWxWUUtaTE1VWk9PcW5NZTV5aGFEUWR4L2ZIOEZ2ZVVla2ZEVEVIaEFV?=
 =?utf-8?B?bk94dGRyQTdKdDQ2SDR1NFl2dmxhMFBhWUNmSVBNZXk4akI2eHByR2kwQnlT?=
 =?utf-8?B?enI4VjdvU3ZFVHYrVjRCWGEwVFpwdHBlTG9VUVBaSTJmbURwWDluSUZ0RG9Z?=
 =?utf-8?B?QitxZmp5bnlVeVpvdlQ2aDZEZ3lCZ1lIeERlWFhnejc1Rk40Y0lpYUMvZFBI?=
 =?utf-8?Q?qFT++jIEW/iYIhgbM+SvSQgtT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b77415c-0536-4b59-a9dc-08dc7ae80abb
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 05:20:21.4382 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FHot+Cw8K267nW59VOFKDKGaEcenxBH/tMLA/DfdVf7YVTlrV5V48gXnn4iVv0aYUg5cvZ3EpIG4EQQwW9GiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6091
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


Hi Vinay

Thanks for the review.

On 5/22/2024 1:59 AM, Belgaumkar, Vinay wrote:
> 
> On 5/21/2024 2:22 AM, Riana Tauro wrote:
>> Enable power gating for all units and sub-pipes that
>> are disabled by default.
>>
>> v2: change the init function name
>>      use symmetric calls for enable/disable pg
>>      re-pharase commit message (Rodrigo)
>>      modify the sub-pipe power gating condition
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  2 ++
>>   drivers/gpu/drm/xe/xe_gt.c           | 12 +++++---
>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 43 +++++++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  4 ++-
>>   4 files changed, 52 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 7c173db7d585..1cb0343ab581 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -317,6 +317,8 @@
>>   #define FORCEWAKE_GT                XE_REG(0xa188)
>>   #define POWERGATE_ENABLE            XE_REG(0xa210)
>> +#define   RENDER_POWERGATE_ENABLE        REG_BIT(0)
>> +#define   MEDIA_POWERGATE_ENABLE        REG_BIT(1)
>>   #define   VDN_HCP_POWERGATE_ENABLE(n)        REG_BIT(3 + 2 * (n))
>>   #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)    REG_BIT(4 + 2 * (n))
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index e69a03ddd255..1ed6309270cb 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -362,10 +362,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
>>               xe_lmtt_init(&gt_to_tile(gt)->sriov.pf.lmtt);
>>       }
>> -    err = xe_gt_idle_sysfs_init(&gt->gtidle);
>> -    if (err)
>> -        goto err_force_wake;
>> -
>>       /* Enable per hw engine IRQs */
>>       xe_irq_enable_hwe(gt);
>> @@ -550,6 +546,10 @@ int xe_gt_init(struct xe_gt *gt)
>>       if (err)
>>           return err;
>> +    err = xe_gt_idle_init(&gt->gtidle);
>> +    if (err)
>> +        return err;
>> +
>>       err = xe_gt_freq_init(gt);
>>       if (err)
>>           return err;
>> @@ -733,6 +733,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>       if (err)
>>           goto err_force_wake;
>> +    xe_gt_idle_disable_pg(gt);
>> +
>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>       xe_gt_dbg(gt, "suspended\n");
>> @@ -759,6 +761,8 @@ int xe_gt_resume(struct xe_gt *gt)
>>       if (err)
>>           goto err_force_wake;
>> +    xe_gt_idle_enable_pg(gt);
>> +
>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
>>       xe_gt_dbg(gt, "resumed\n");
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 4384f7e80258..a056e00b4ab9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_gt_sysfs.h"
>>   #include "xe_guc_pc.h"
>>   #include "regs/xe_gt_regs.h"
>> +#include "xe_macros.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>> @@ -93,6 +94,36 @@ static u64 get_residency_ms(struct xe_gt_idle 
>> *gtidle, u64 cur_residency)
>>       return cur_residency;
>>   }
>> +void xe_gt_idle_enable_pg(struct xe_gt *gt)
>> +{
>> +    int i, j;
>> +    u32 pg_enable;
>> +
>> +    xe_device_assert_mem_access(gt_to_xe(gt));
>> +
>> +    pg_enable = RENDER_POWERGATE_ENABLE | MEDIA_POWERGATE_ENABLE;
>> +
>> +    for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, 
>> ++j) {
>> +        if ((gt->info.engine_mask & BIT(i)))
>> +            pg_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
>> +                      VDN_MFXVDENC_POWERGATE_ENABLE(j));
>> +    }
>> +
>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +    xe_mmio_write32(gt, POWERGATE_ENABLE, pg_enable);
>> +    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
> 
> One other thing we typically setup here is the media/render hysteresis 
> (0xa0c4, 0xa0c8). When SLPC is enabled, GuC will set this up. However, 
> if skip_guc_pc is set, we will need to set these.
Sure will add this.
> 
> Also, we need to ensure CPG is not enabled for PVC as we do not setup c6 
> either -
>          if (xe->info.platform == XE_PVC) {
>                  xe_guc_pc_gucrc_disable(pc);
>                  ret = 0;
>                  goto out;
>          }
> 
Will skip it for PVC
> It will also be good to have a patch that adds a sysfs that can display 
> CPG enable and status bits. This can be a separate series.

Will send a separate series for this.

Thanks,
Riana
> 
> Thanks,
> 
> Vinay.
> 
>> +}
>> +
>> +void xe_gt_idle_disable_pg(struct xe_gt *gt)
>> +{
>> +    xe_device_assert_mem_access(gt_to_xe(gt));
>> +    XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +
>> +    xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>> +
>> +    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +}
>> +
>>   static ssize_t name_show(struct device *dev,
>>                struct device_attribute *attr, char *buff)
>>   {
>> @@ -145,15 +176,18 @@ static const struct attribute *gt_idle_attrs[] = {
>>       NULL,
>>   };
>> -static void gt_idle_sysfs_fini(struct drm_device *drm, void *arg)
>> +static void gt_idle_fini(struct drm_device *drm, void *arg)
>>   {
>>       struct kobject *kobj = arg;
>> +    struct xe_gt *gt = kobj_to_gt(kobj->parent);
>> +
>> +    xe_gt_idle_disable_pg(gt);
>>       sysfs_remove_files(kobj, gt_idle_attrs);
>>       kobject_put(kobj);
>>   }
>> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle)
>>   {
>>       struct xe_gt *gt = gtidle_to_gt(gtidle);
>>       struct xe_device *xe = gt_to_xe(gt);
>> @@ -182,7 +216,9 @@ int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle)
>>           return err;
>>       }
>> -    return drmm_add_action_or_reset(&xe->drm, gt_idle_sysfs_fini, kobj);
>> +    xe_gt_idle_enable_pg(gt);
>> +
>> +    return drmm_add_action_or_reset(&xe->drm, gt_idle_fini, kobj);
>>   }
>>   void xe_gt_idle_enable_c6(struct xe_gt *gt)
>> @@ -202,7 +238,6 @@ void xe_gt_idle_disable_c6(struct xe_gt *gt)
>>       xe_device_assert_mem_access(gt_to_xe(gt));
>>       xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> -    xe_mmio_write32(gt, POWERGATE_ENABLE, 0);
>>       xe_mmio_write32(gt, RC_CONTROL, 0);
>>       xe_mmio_write32(gt, RC_STATE, 0);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 75bd99659b1b..554447b5d46d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -10,8 +10,10 @@
>>   struct xe_gt;
>> -int xe_gt_idle_sysfs_init(struct xe_gt_idle *gtidle);
>> +int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>>   void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>> +void xe_gt_idle_enable_pg(struct xe_gt *gt);
>> +void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>   #endif /* _XE_GT_IDLE_H_ */
