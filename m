Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0D0CD5BB0
	for <intel-xe@archiver.kernel.org>; Fri, 22 May 2026 19:26:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFED910F74A;
	Fri, 22 May 2026 19:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wq6oPMPx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705A010F74A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 May 2026 19:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779477960; x=1811013960;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2DaWOrz8twR8XrfT5ANZRYtH8AeWYuB1HtkKRJj1HI8=;
 b=Wq6oPMPxAAZ8IKFJTfBseBjpV/c/ye3GCyprnAiA2/d42T3YBVVNLgnu
 BTi49x++jXeyemst0ho4CaaiZVQIoK7QrMs0mHRFDdldUJAMGHQR1TGHs
 HapOmAFB4cNBnbHCFuZfVSFuukUJy5zfI9O+6zCykw7Qv5XZQWyuyct53
 CdDPjiuqNkSOBfqGLMD02ox8PPOeDaDa2QI1dDn+vsDRSPYedl03Is2vq
 76VENPcccijTkJFvgqDe8Qhbrjp7simsUyb+nQtWwGkjvUcbUxpsA2b6m
 z2WhI20MLMxaa08CVlQVmaklkQVYYgUD5u+T0JdFt5qvAHmWexwU6CBbn A==;
X-CSE-ConnectionGUID: myELHpglQhWSYfSSgz4m2w==
X-CSE-MsgGUID: ZH2nzb+YTeeyfo1MllOyXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="103089019"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="103089019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 12:26:00 -0700
X-CSE-ConnectionGUID: AWp2zCPwT1+K2FqUxG6TOg==
X-CSE-MsgGUID: b+9xSxwcQbKs1KS3xC7PVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; d="scan'208";a="234641744"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2026 12:26:00 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 12:25:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 22 May 2026 12:25:59 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 22 May 2026 12:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=au4d2ouelPlxkcn07qRj8LjxkaN0EivJlkafWt2jl2yd539hSIheROlh7kLikoeIa8PctBAATUUAuL2gFkhMg9jFCp5EDQQYKCPn7tY53r/pqAdbIMHxptXio+3t+bqk+x/G4M4YM2Gi9fTQ0Urd9+MncZ7FZEIT+5iJf8HukcQ74SFNJqLHdHOdMuj+DavKjCj/c9cShFx6/kWP0XKW6zuc87oNumSVFaJk1hd8WydlrLJn01GrY7K/Jc48B2D85tAfQobOXZFvSDvqiJCo9P370sw7TuA8dh127s9zpZq3Br1X0A4/F6FhdP2ENJbYMkDrpfFTlXEeX2qyWbj+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXslM5PeSKTmSc7beg6hfKXTWW5tD4t4HPNv8vwQRM0=;
 b=JyyHafA54Qk6DCycYunCX+SfwRyauar3dT/WnstcFhX3wMz9w1Cps+1HwQlYHJTo1VC1Ue+lGiufZoXhgIHlxSWn3FFNLhf/5M576pV3hIo97Rk6ktBtmnsEFeFZm5h6kNFb20F9+R52yUhUfA1RwuwT/640U6ONzx9whewaeaqGEa/Y2oPl55+1Mq0M42Z+dH3nLHd0I6W2qLT1RR63m8z7sLf4sXBw8MKcAHR+PpJGzdS1LUXIRoGPYd2sJqcIiX2V/N4pXlED00abqCy5X0grHxQeQUtbM3Xz5MqPqeJ3FUdR4qdLLTJQOsGxQF8ndAOm6nN0TuWiyvzW18E3yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH3PPFD6B8A798D.namprd11.prod.outlook.com (2603:10b6:518:1::d51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 22 May
 2026 19:25:53 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0048.013; Fri, 22 May 2026
 19:25:53 +0000
Message-ID: <d469f6a3-ccea-4232-a75c-d4d2172bc090@intel.com>
Date: Fri, 22 May 2026 21:25:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/mmio: Map MMIO BAR using managed version of
 pci_iomap
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260522143112.10643-1-michal.wajdeczko@intel.com>
 <20260522143112.10643-2-michal.wajdeczko@intel.com>
 <3c622ff9-565b-4b99-ada5-23306d4733e1@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3c622ff9-565b-4b99-ada5-23306d4733e1@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0112.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::41) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH3PPFD6B8A798D:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed23f7c-5908-40f8-9155-08deb837f074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|11063799006|18002099003|22082099003|6133799003|56012099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info: EU2pk4X1LpsBXGG9eCM2P7jsLCbxDMqhHIJvy5iTt1lJAJTKGsuRdii1i1KX9Po6j6vABPsfP6MV9Ggr4bEu4PMzb5WHEpUskKOTKNMMy0ytJwot1xaPFnvkMaHBttZ15yPhg7H1mHAU+WhTB+c8W/laT3zq+VxqqvLz2gVM1/DbULtLzlRhiEpvdAHykQ2d3a71A7r0EFhvMkVuptwXSaoW51v6BPxHlIVRhnOsJlSWrMdN7msbK3qcYaX5+2ZruQAAcd3viCo9oeNmSIf9FtKdMfMfgP+iNZ24KHiSo7YuqpWyTp2ud8ZrTlp4+HEA/4CXYalO9KgEhI075Dbkw5+lWhM/YxT32PrKe8RFdiIMKdmaJzhKMRkaaBbU8suZtYeNVjgfHnEUDxsR6cotG8TEfbJav4si+PTv9Q6Ik8T7dXG4gV0WhW+2WmnPQ6oH34kpX/riOwn8d8WbJzEnb+KStFUKCOWo2DI7Ztk+uS4RlqmIKu2b8pNAJJP+UXAqq9PSRgwB/bHOPn4nEiHHXwccCQ/mv+oHSIHOS/1/9G2PNGse2R5Pa+lxplBl1nKJ5NbLd+q1JXgxZ1f5cuF+h65KbxCD1GloABikYvXz4Ay0Z0suq7TixOsaVOH//AjDC64SNA9uiij5Rp4WZI0OsiBMNNlQb4m6b6ZArXNR6EbCDoeHnDn23eBxO88+AwH/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(11063799006)(18002099003)(22082099003)(6133799003)(56012099003)(3023799007)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nk9NVkFxbUJkcmNHTkhEanlRbVlmdEJkRzZ5VkQ5dXZNYkJ2SldqRmRGc2hs?=
 =?utf-8?B?RkRoK0psZmpndXNLZEhmUFJKU1IyNmxHcjd6VkNUM09uSnNZN1hIYWl2VWMy?=
 =?utf-8?B?eC9aMmFuSFpFL0R3SmFYNWJJdXBVK01OL0hCemlpU0JjK3pqL1NDOS9ZdVNl?=
 =?utf-8?B?UTk3MWEyWjRYUmNGd05sS1JSeVlKT3J6aHBDc0lHMENQT0l3MjZzS01zRWxJ?=
 =?utf-8?B?THJmQWZwaC83SkpHcTdOK0VOcXlxdjhlSkN4UzhkRmFYVHpKTk5MZjZ6STlU?=
 =?utf-8?B?QXBCWlliNys3NjUwdDN1SmlZOVpHVHZ3REFYdzRPQUhvQTVYUFAyT3N3cGE4?=
 =?utf-8?B?YnduOE1mKytaS0JzMHB0TUNFRVg3UXg0YTJsNW44OVAvZFBHMTlPNi9SdnlV?=
 =?utf-8?B?QkVrMWVpdFg3azlua1dDZGFvS1ZUSVNLdjVQZCtQdGRDS2haeHJoR0ZEY0pR?=
 =?utf-8?B?L0d5NWEvZEJNeVUyRWJMZ255NFNxcW0xM2ZheXg4d2p6ZWVWbG1LeHV0SHpx?=
 =?utf-8?B?S0xKVy92dm1LWWF5Y25la0FYUi9KcjliNDh1T3FUVmlaSTNMUjJwWlg2SmdQ?=
 =?utf-8?B?RU9YdTBNN0JKSEpNc0NOVzkwNzZFNk4xV3lJMlRqMEVCbG96cTE1TFhhT21s?=
 =?utf-8?B?eHduUmVnc1dXTCtPWEZXaFI1dDNIdU9DRXF6MERGcTFQWU00anBFaWIydzlo?=
 =?utf-8?B?QVA5NjRyM0Q1R2tZK1N6aHlzb29pNkgxelIzeVYvU3JVUVdORHJBTzBtZzFp?=
 =?utf-8?B?bWZYV1dZZEh2M1dqRFJqOGRaVGNJamh4bUZxcnhiY0VKS0tTZHM0bHlWbGgr?=
 =?utf-8?B?SmE0NmxaMGdqRHRtSkNnRVJoOW5aWWVRNXNGcTFreDJuYndKMnIzOFhpU0Fq?=
 =?utf-8?B?R3NSZ0xVTFFSRWdSMzV5T3AwcTBiRnpXNHRGZFpDaStFaUw4bFhZLzEzOUJH?=
 =?utf-8?B?OTRyVkd2Zk9OQ24rRERBS3ZRNE5iU1BUT0c2bC9YOERYUjlwRE5VWjl1ZENn?=
 =?utf-8?B?cmRoYmtMSHdhTlArK3FDMUNiald3TThOVzYwN1lBYjIrWDNkTDMrTTAzZUhN?=
 =?utf-8?B?Z3NRYlAzc2dIbHl5YVpEbjZWTFVaZUJSOU1oWWc5WE5SSW5RbjB1d3k5V1NE?=
 =?utf-8?B?VnJaWDlXei9QL0FjV1daMkRqRG1nejZRS1NSUGFQZVkrSFhlT0V4dEJlUGhB?=
 =?utf-8?B?ekhLaGxqTkZyUGxqSmJXaEZKMC90K24ybDZlNDlWNWY5VVQyaGJXcmZEa0Qy?=
 =?utf-8?B?TzNRZzh6VE9FUG0vaTJTWGgzK1ZjcGcwOGExQmM4K3kvb0VNTkdxWWRhL2VQ?=
 =?utf-8?B?eGwrdkhWdWV3VEZ5UG80S0FnK29yejFOZ04rUHRxRmtCN3dCSktDN0RtNWh3?=
 =?utf-8?B?S0ZKMzRsVmZRR1JBUjM2RHc1TCtUbEtLRDZiZGJXc28zZTBDM1N1djdXUzU1?=
 =?utf-8?B?ak9CVy9STHlnVEpUUk1qSG41b2RLTHVuNE5PNW9CQXlMSGZaT1FwUUMwU0s4?=
 =?utf-8?B?R3hmb1hMZmF1b3R6KzU2RmJBYmRsRmYvWTRDWXdrRzFLSVlnWS9ud0l1ZUZ0?=
 =?utf-8?B?dzFzYUVxanRtWi85NTFLeUpVbzdjclhSQ0U0c3RFNWUrOHp2MTJpYm40Q25s?=
 =?utf-8?B?eUNkL0NYVHhEUWJJRjUzV1Q2Vjc2QUZPU0J1TndQZUFEamtXRTZ6WDVUMjhj?=
 =?utf-8?B?RzdQOHB6dERqMHYvdExjQmNVS3JKbTdzbXVNM2lOdzdWekFzUklvMlBZYi9N?=
 =?utf-8?B?UjdhTXlaRExuQ1AzUE9UZmdHNCtBYWdSRXRKYjdSb1ZhaE4vZTBld25mNzMw?=
 =?utf-8?B?N2dFOGNxRWl6SnhiT1hrYlNzanhUU0Z5UjlRbkg2UHdVUHVvKytKclgrUEpG?=
 =?utf-8?B?NkgxeXdZQUVNcHBQeEpSL25OSEdsTHRWVHR6Sms2dnBzUDBlV1FGM2lMOHB0?=
 =?utf-8?B?Rnl4SUZtd1NKWDZ3Sk9yQm9nSi80SitBTmxydEdnZlJyN2MybWpjaVRWZkdD?=
 =?utf-8?B?Nmc4SUdBYmd3WWFJRWk5QktlaGtZcWxDK3o3VzFBM3NQNGJBd0VFcFFBMnNP?=
 =?utf-8?B?SHBwSVZrOU5aWDh3TFQ3ZTF3ZkVZbHdnZWNlK3dTK084RlJ3dk12aGFEWGZH?=
 =?utf-8?B?eEF5ay92WE1uSnZGYStQekdXM25hR0xJc0xiYXpiNWJSd1Y2RENzOFhtbFkr?=
 =?utf-8?B?Wkx2T2NrWmJRYXRNdVB1N1FCSnJMQXJRUG1jaUlpWDdCMlUxcFJURnFSaVJU?=
 =?utf-8?B?VXczK29NTmpaYWtuOVdyL0dxS0ljZ2JpeGJLSVljTDVLRS9qRVZ0cGZ6NE50?=
 =?utf-8?B?aDRoV2Y1Z09ZRE9JczNZM1luNHRDbHNBZlplU01PdXc3WDkydytkbHo4Sm1W?=
 =?utf-8?Q?QT7yhT2SGXbfNz8g=3D?=
X-Exchange-RoutingPolicyChecked: QlrEKvIDCKQSMVQC5Y4fWPk3mIDmgPPichwAyUXeLvQsawPYxi0JZt5HDx2kE+Otd2cj/p2aQdj2zkn6UxSgzzbn9r0NrfvEHoZMh7ibbjAtLiBFRY80kUigrm0fKh5OXfUQK2CNrjDVqkbsW5+/dDKCykdw4TfYpZu3Zz6kvXXQ3x0DIlxPXm3Owmc5rfzDSvhJZO0+wAAH+hRIAeSH2RaTJ/p4lyRYncrUqPQs9hIK/9SMlS/HDO21fcrhA3OqH03THPDq7ab6uRqunTyRW7p5B/BQLEOi7AYufkFQs/R0x154sHVRiS5Wzf+mEs2Mzqn18EPmqiQ8AXZ/w/jslQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed23f7c-5908-40f8-9155-08deb837f074
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 19:25:53.2057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9WWL16QjfPPqf61KmT2FzXOP+ffLlJSh39kGb+U6ZtSNQskGggPPK8XKqvaFeKWqIx9kNKFV3aG+N469A2yL+ZUTwAl2ONNIboVe0fP96c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD6B8A798D
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



On 5/22/2026 4:58 PM, Matthew Auld wrote:
> On 22/05/2026 15:31, Michal Wajdeczko wrote:
>> This will allow us to drop our custom release action. Note that
>> pointer zeroing is not required, as there should be no active
>> code running during a driver unwind. While around, add missing
>> kernel-doc for the function and update error message.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_mmio.c | 33 +++++++++++++++------------------
>>   1 file changed, 15 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index 78adb303b663..f4086b9ae38f 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -16,6 +16,7 @@
>>   #include "regs/xe_bars.h"
>>   #include "xe_device.h"
>>   #include "xe_gt_sriov_vf.h"
>> +#include "xe_printk.h"
>>   #include "xe_sriov.h"
>>   #include "xe_trace.h"
>>   #include "xe_wa.h"
>> @@ -76,37 +77,33 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>       return devm_add_action_or_reset(xe->drm.dev, tiles_fini, xe);
>>   }
>>   -static void mmio_fini(void *arg)
>> -{
>> -    struct xe_device *xe = arg;
>> -    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> -
>> -    pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>> -    xe->mmio.regs = NULL;
>> -    root_tile->mmio.regs = NULL;
> 
> This was intentional, since on pci unplug this get nuked, but driver instance is still alive. So, by setting to NULL, we can more easily catch misbehaving code, still trying to touch the hw post unplug. Any chance we can keep the NULL part?

but any access to the unmapped BAR should still end with some splash, similar to NPD one

this is what I got after doing immediate pci_unmap without zeroing the xe->mmio.regs pointer:

[ 1111.155480] BUG: unable to handle page fault for address: ffffc90006130030
[ 1111.155492] #PF: supervisor write access in kernel mode
[ 1111.155500] #PF: error_code(0x0002) - not-present page
[ 1111.155509] PGD 102400067 P4D 102400067 PUD 102c4f067 PMD 0
[ 1111.155533] Oops: Oops: 0002 [#1] SMP NOPTI
[ 1111.155558] CPU: 1 UID: 0 PID: 2853 Comm: insmod Kdump: loaded Not tainted 7.1.0-rc4-xe-sriov+ #618 PREEMPT(full)
[ 1111.155595] Hardware name: Intel Corporation Panther Lake Client Platform/PTL-UH LP5 T3 RVP1, BIOS PTLPFWI1.R00.3332.D05.2509011438 09/01/2025
[ 1111.155624] RIP: 0010:mmio_flush_pending_writes+0x28/0x50 [xe]
[ 1111.156004] Code: 90 90 0f 1f 44 00 00 48 8b 07 55 48 8b 00 48 89 e5 48 8b 80 d8 0f 00 00 48 8b 00 a8 02 74 16 ba 04 00 00 00 31 c9 48 8b 47 08 <89> 88 30 00 13 00 83 ea 01 75 f1 5d 31 c0 31 d2 31 c9 31 ff c3 cc
[ 1111.156025] RSP: 0018:ffffc90003ec36b0 EFLAGS: 00010246
[ 1111.156035] RAX: ffffc90006000000 RBX: ffff88810c7bace8 RCX: 0000000000000000
[ 1111.156045] RDX: 0000000000000004 RSI: 00000000011901f8 RDI: ffff88810c7bace8
[ 1111.156054] RBP: ffffc90003ec36b0 R08: 0000000000000000 R09: 0000000000000000
[ 1111.156063] R10: 0000000000000000 R11: 0000000000000000 R12: 00000000011901f8
[ 1111.156072] R13: 00000000001901f8 R14: 0000000000000000 R15: 0000000000000000
[ 1111.156081] FS:  00007136102acc40(0000) GS:ffff8884eb10b000(0000) knlGS:0000000000000000
[ 1111.156092] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1111.156101] CR2: ffffc90006130030 CR3: 000000010ec70005 CR4: 0000000108f72ef0
[ 1111.156110] PKRU: 55555554
[ 1111.156116] Call Trace:
[ 1111.156121]  <TASK>
[ 1111.156130]  xe_mmio_read32+0x32/0x150 [xe]
[ 1111.156392]  xe_sriov_probe_early+0x2d/0xf0 [xe]
[ 1111.156672]  xe_device_probe_early+0x4d/0x1a0 [xe]
[ 1111.157057]  xe_pci_probe+0x13e/0x530 [xe]
[ 1111.157374]  local_pci_probe+0x47/0xb0
[ 1111.157393]  pci_call_probe+0x6c/0x360
[ 1111.157413]  ? _raw_spin_unlock+0x22/0x50
[ 1111.157430]  ? pci_match_device+0x16d/0x1a0
[ 1111.157447]  pci_device_probe+0xa9/0x140

> 
>> -}
>> -
>> +/**
>> + * xe_mmio_probe_early() - Probe and initialize device's MMIO
>> + * @xe: the &xe_device
>> + *
>> + * Map the entire GTTMMADR_BAR and initialize the first tile's MMIO instance.
>> + *
>> + * The first 16MB of the GTTMMADR_BAR always belongs to the root tile, and
>> + * includes: registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>>   int xe_mmio_probe_early(struct xe_device *xe)
>>   {
>>       struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>   -    /*
>> -     * Map the entire BAR.
>> -     * The first 16MB of the BAR, belong to the root tile, and include:
>> -     * registers (0-4MB), reserved space (4MB-8MB) and GGTT (8MB-16MB).
>> -     */
>>       xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>> -    xe->mmio.regs = pci_iomap(pdev, GTTMMADR_BAR, 0);
>> +    xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>>       if (!xe->mmio.regs) {
>> -        drm_err(&xe->drm, "failed to map registers\n");
>> +        xe_err(xe, "Failed to map GTTMMADR_BAR\n");
>>           return -EIO;
>>       }
>>         /* Setup first tile; other tiles (if present) will be setup later. */
>>       xe_mmio_init(&root_tile->mmio, root_tile, xe->mmio.regs, SZ_4M);
>>   -    return devm_add_action_or_reset(xe->drm.dev, mmio_fini, xe);
>> +    return 0;
>>   }
>>   ALLOW_ERROR_INJECTION(xe_mmio_probe_early, ERRNO); /* See xe_pci_probe() */
>>   
> 

