Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9E5CA5FAC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 11:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89DC10F347;
	Wed, 30 Sep 2026 11:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dSOyKPzr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D67B10F336
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 11:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790769200; x=1822305200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aaJiZzjXA3dw5GXtjpx9FIIQNANZtUu8q/YvZLx7GP0=;
 b=dSOyKPzrCQk0C6846kXYypGxYB5IEl+YYJd0jOaTgTwjEnHdLkhWkNbj
 eb9fS3q8DRhCOaSW1Eonq2AS+g07UAISauAEWj0uQnIo00iAk2pGJ29M2
 ma+xifTAtPfYHIMnGYo0cOg4HUpVlWkq+NamMB0T8Hkwca18P658+aOsJ
 ck/0ZTiRriROfvJgR0l/BbPQdoOKh6JJorlb+mhLh6oI/MxRFQh4Y0sGW
 G4YEGmPXE7yIULs4YhJviQ9JRIxN0ilRo1LQ0PPuxAJoxfMxeQjR95T3G
 /XeQ4mTpgAYqCKC5ZIgwdJCfIyvYQnMHjXNVqGmD1e1ATww1YvOd3tULb A==;
X-CSE-ConnectionGUID: prb8NNZHRR+DQG3tvrPT0w==
X-CSE-MsgGUID: D3Hq4aE7ReeQGolFJzJu/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="93989584"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="93989584"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:19 -0700
X-CSE-ConnectionGUID: lbJ78HG+QzuVBZue8cYBCQ==
X-CSE-MsgGUID: vnXR807tTlK4Lrz7eD2+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="303605299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2026 04:53:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 04:53:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 04:53:18 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 04:53:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJpyAogG+kvW1pgaQ1ANADqlJzKyJUGMhX/x2g7bpiMYmAMqQ7yEj1VNuZcBfTkCo+IOzZWYsU8YMPeyR1w4ayZaaaeo+3TsqFjXCpcUX8NgtL146AHNC2qD2YrMTZh8DDEEYPi5wBjxgO6PnR+vrih0tQ2GlUeCj1O4t6N84KL7XiNLVx+tcL9qc0/6h4UGDSHpDSC8chsrx2wU05gX2gfjNhChLBr5qD2Y5HltgpcLcq84LrxiVWdGZoY6rzkj+3yJDnPfXmrG5WfzB1GfxP8yCPNLaUdSDR98mtunqrKAiO5oWJF1DS8dNeSvlBraysJ9SnF8wmncMpmfbOwFaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VuF8jWojbUy5M0AqMRyAn7+ooKPs3R5wdGl9AU6BcFE=;
 b=YMiVvm/SB52MdbmUfNUtH2ddnMTLJy+Hoexx2m1Vv8xt6uRzLAxjjIYGNlVtpJJW6KoYKJ/plUuX4rOHgtxgB6FEJuf4yYCbTXJPHp58rq8R/xgaDQdA2DTSELmqGxlbdpghuqREkOr8a6IfOWapqUGU/+gHtwf31prRkaxtg2rmpH8to/uh+9yNevPwa+LneDYaA6bZhK8NGd1xIOpUffUW94GACdH9VICvhqc/qNQpJ5ud0By1ZfvfFjkDMO1DARwRWa+YS3neJZwY56LKpfjyA+KG0Y5IbkbrxtuEnA1/35P7N4Gm6oZyKdLreIa59ig2SX4XViUc5y/5CSg0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by SA2PR11MB4844.namprd11.prod.outlook.com (2603:10b6:806:f9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 11:53:16 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 11:53:16 +0000
Message-ID: <56bce828-8f56-43b2-92a5-1081ce18c595@intel.com>
Date: Wed, 30 Sep 2026 17:23:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/cri: Expose device UID through sysfs
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <michal.wajdeczko@intel.com>
References: <20260929171823.3811737-2-badal.nilawar@intel.com>
 <4bda9ba4395d2578abf71eb44ddd5a49d261208c@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <4bda9ba4395d2578abf71eb44ddd5a49d261208c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::14) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|SA2PR11MB4844:EE_
X-MS-Office365-Filtering-Correlation-Id: 74367ae6-fd71-4a58-f459-08df1ee969f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|11063799006|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: MB8VilaimS/+i3UQQFXBXCilI8ywR7JcS6wqGwgvBfEmFVuEy+W1lbshlDMO0x5QWEGUAIkqpF9GiSjaMcu7H/G/ZuIpNuzskR+7rz4WN3ksBJQ21meY2z11+RuhUKahtWqIE+ohRF8RhzHfFezvmmwjEuJ5QKSyBznVzJxUv3cYUFBNPK/I18wKOj1/79VS3oJcll/vsB/TZ2UlfWM+7WUzMYaHKhVw139QnCxMYhgieIh0EvBe+7vwyrEoIbY3j+irOnbD/jzfyQLtYDVGWwDfBQIRTot27GTCM+u5ViBA5eEcJ6HmF8rx7oMC+4273EjGN7KCEkhi56oHBIKVSTZ3jWecnsR6O3FRBLSEjJCbe/2nVs5L6w6LSv+6KfFbjCQoZ2foHu57p3+ZTFn3oAgkGQN0Ywr/A4hyMCASZejrkD59bF/qigwDq3H1CSOvZOKsx9UNUDpOWnw7xmyE3Bhm9drdk0qM9PRL3OfWdMo8mQk+QkCIVtuOajGgVUZr7SWFVwIWBeRRnTjNWYpL8My0um44xpProY/ju7qM0qGIR+FnutWjtqkR93p9cDdb/JVZaxbg3RrfLYfmi801hBNLXSg9+TXe19GKSqJThcSsRwRU77dd1r4RDfoX3YXDq4rDhtlkineEGxkiDUSsMwBSttYjJTAV8D/No8VZluU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hZOEIzVFlOeG9BSUxKODlibzUvUnhxNWdyV1ZZaHQvV09ZdzBxV2JsWVp2?=
 =?utf-8?B?Q0JrT1lKelNVa3NRUmtmNU5ueXBoRm9jWkZlT2o2UFFMS1lCSDQwYk82OU9l?=
 =?utf-8?B?amFhM1A5dWlzakNwQ3BEc3ZiUG04SWlZeE9KamI1bkhoejFSU0pqVGZJdUpm?=
 =?utf-8?B?TTJXME55K0llVllYenZNRmh2NWl4V3JVZEhVeGFtQ2xNYlYrWlBTaGNxSlVj?=
 =?utf-8?B?Z0ZRNndQMHZKaDlpbHFtRmo2NGl6elNkUFo2YnNud3lWWnV0NmxvVmx0aXhy?=
 =?utf-8?B?bTlnUFpFR05iVXViUXpzc2VyZncxTzZUVkVwbG1KMjlIb1Nqc1NkTFVXdFRF?=
 =?utf-8?B?N25iQVlaZEtjY21EMTh6RnZ2ajAvakJqK0xXZEVqSWt0NXpuY05YR2ZxNmZZ?=
 =?utf-8?B?bmFYSVN0RTBwRjlPZTM1d04wUmhNbXR3UW5scmU3bkRDcHdoaXZOMzBhV2d4?=
 =?utf-8?B?R2EvRnV5Vng5eExGVDB3b29GWEdKNXVaTnk0bEh6dzY5N0pWb0ZuRUFTQ0FM?=
 =?utf-8?B?VUJ0UTJ3WFduUTdIVm5GbUk0TUFCSm1Bc1JWTUFIWG5ZR3NhTTdHZjVDR2tN?=
 =?utf-8?B?YjIwejZqVXlnZFVIT1MxSmwwbDNOYWlvTzNPWFR6eVA0ZlhMY1p2NUxKaGVK?=
 =?utf-8?B?cnRtcUt0Q1dsWktML1J0eUx5NGJKa2g2OHdwajhndkcwUFlpZER4bzRsT21W?=
 =?utf-8?B?dHE5TUExeFNJelVYOVRsNDMyUzZpYnZKQjNGZDBSMEhMRUErOTYxcnBKRUs4?=
 =?utf-8?B?UHJBRklpL1FzZUw4OHF3QngrUWhwdUZPM0RwU2dtcGpRdmdJQ0ZHaHVwZ0c3?=
 =?utf-8?B?ek4weU9BYW5mU3Z6aVFuRXlzcVlFVVpMUjRQMEtqY2hjdkdxMjN4K3JsZEpV?=
 =?utf-8?B?NndDaGpUOE9LRnlHeVp6dFlwbTc3dmdlTHRsamk3QUdDMmVJYjBFRjQzbG5x?=
 =?utf-8?B?QkNKYVhuSG1kS0J1UXZmNUgyNTc5ZDZYUHlLeExyYktCUEVaUE9WcnNvNUdP?=
 =?utf-8?B?KzNabzZvZFlsNGVGWmRsTW5xTGViSDJISFFkT2FYNG5RN043UHNwQTZSWFkv?=
 =?utf-8?B?emlkR2hScU54WncyYUcrVHFxL1FJa1VPakR4ckcrYjRrYzZ1Z2RhNE5Ga3BJ?=
 =?utf-8?B?NEpRT1BhMDk5TlZKbjk5N09xNFV6M1I4L082TTBnR1E0V3EwTW1ySnN6R1Vq?=
 =?utf-8?B?SWQ5cHhSeHU0dW85V2JMTGVuZjduRTE3R3FaNHFMZjVoVXpjTjUvVDNlOUFT?=
 =?utf-8?B?NVVjcVp4R2laMjV0aE5XT3BxMmVhYjlYaVNwUm54YmQ2eHFVaC9qMjV1UnJY?=
 =?utf-8?B?Qnl2OWtVSGd6YzYrbWtuN1pFWmhMQ0JPZnp6WW9tTGNiVzJ3L1pCMDdqLzBY?=
 =?utf-8?B?MXFFYlpKd3Nzc1lVSUREb3JMSTM2M3dEV3ZNakpBb21QY296Y09sckdRRWxa?=
 =?utf-8?B?cTlhSXpxMUgzRmJENDBUWkt1cXJ3VzFEWDdYeDhUd2ptN2MzV29HUjJVclpB?=
 =?utf-8?B?QXpERGhVSWswazhyTFlhWXdFRWNLc0NYcVNGTnI3T0l3L3FRL29McHFQNVBx?=
 =?utf-8?B?UWVTMWhKNnJSV0gvZjZxNVk3TCt0WWF4TURpUXMzRlBIR3lRZE9qeU8yU29z?=
 =?utf-8?B?Nk1DaGdXeDlaWkR5dTB6RVZxT0ZRU3ZwNnR5SjhTeVlOVzlpc24rdkczVUQx?=
 =?utf-8?B?NzJjNjZ4VXJicEFXdk52ZnpsdGJmRlpzdXRDSURQT2tEUFBybmJiclhIZVpz?=
 =?utf-8?B?VTlMMWlCem01UlI4OTUvQlk5NER2Y092ai9DNGdQL2k4K09yTjdpUlFwWnli?=
 =?utf-8?B?YjBBbjhtbTVtSTRJSzhHUlpsbGhVYXdENitmZzl6eVZkVTRoVlVxQVBTdlpH?=
 =?utf-8?B?YTR4Z3lSbkZDdlF5ZktMdWhBR2pRbXVyTFFrbmprOUkxb25BRDNnM1U4ZlNM?=
 =?utf-8?B?OG56OHJ3aTZtczAxOVJyRW9SeHJ5YTlNSW00ZU5DaVVadHM2U0xhQjRZMnhz?=
 =?utf-8?B?UGhYUkNnbnZ0UUxzL25QcStCTll6MGdXdVFKYlZQT3VtczBlMkordk44M3RK?=
 =?utf-8?B?QzBSRi9hQWRzOVNHTno0dTJSMjhIMGhibVhaSEw3VFR1SHp6QTZValFjbVhN?=
 =?utf-8?B?eWthZ0daL1N6TjUxaWlwcGlsS0QwaWx2cWdtSXFheXgrTWxWZkJ1RFhzNk5L?=
 =?utf-8?B?b2tUNFhhMkIrMVltOGR0RWpKRUxYN1o0ZyszOVBrQm5INUlYYUdaM1I2amJ1?=
 =?utf-8?B?aGgrOC9RS1pzZDZWOXowTzdEWDVzeWZYZWEvTlZsUHloNE5hbHlLVGZ4bkl2?=
 =?utf-8?B?SVlEZ2Z2emg2WUg3bzBsRFFkVUxzVEpXRlpqL21OZEM1WG1OYU9Jdz09?=
X-Exchange-RoutingPolicyChecked: 14XAEUf1ziwYP1kGuz7QAd+QR81tP27Cj4VZfUaYcU1bzG2P8bMeAhVcA2BEckfbXpF6Nv2oC7oXVf/RoGdmmbVCY2yT+eActPhWrp1oMofS6ADpbGZjknH9tqg8LGwAwZ8/cGja0mvS2COjlNsi6RsxF/igmSrbyeZjW06xByPwWUfsAPj+d8NsLHa593ag5JcZNFhy8w+TRTwiLbyeYv4goVF78HgOKcW8XyoTejCT/CuB4s2fnjUF6aOEhxNkSS2HQ9v88c3EKV3B9ATnWS7J5Vwe1DxoeNbW6fjx3pjfQRXI7GyB1mYRPkxhB+A7wsN8VrSci21PQ27amRtmWQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 74367ae6-fd71-4a58-f459-08df1ee969f6
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 11:53:16.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m1dmqtl9fPW69qAa29CCMHmsAjYHZ8aXE75emiRGGi3NFVuqnXbOKgRkf0AHeAxyF97XvR3LFU+z+9B9yxR16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4844
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


On 30-09-2026 12:56, Jani Nikula wrote:
> On Tue, 29 Sep 2026, Badal Nilawar <badal.nilawar@intel.com> wrote:
>> Expose a read-only sysfs attribute, device_uid, that reports the
>> GPU SoC's unique identifier.
> The commit message does not answer the question *why*.

Unfortunately this patch is merged. Use case is to provide alternative 
to PCIe DSN (Device serial number) Capability, which is currently not 
supported by Xe platforms.

In scenarios like hotplug or recovery from wedge, PCIe bdf may change 
after rescan. With device_uid will help userspace app identify recovered 
device is expected device.

Thanks,
Badal

>
> BR,
> Jani.
>
>> Bspec: 53048, 53049
>> Assisted-by: Claude:claude-opus-4.8
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>> v2:
>>    - add has flag instead of platform check to determin uid support (Anshuman)
>>    - Fix the DOC: section (Michal)
>>    - %s/_uuid/uid (Joonas)
>> v3:
>>    - Restrict device_uid to admin users (Sashiko/Joonas)
>>    - Address review comments (Michal)
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-gpu     | 10 ++++++
>>   drivers/gpu/drm/xe/regs/xe_regs.h             |  2 ++
>>   drivers/gpu/drm/xe/xe_device.c                |  9 +++++
>>   drivers/gpu/drm/xe/xe_device_sysfs.c          | 36 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h          |  5 +++
>>   drivers/gpu/drm/xe/xe_pci.c                   |  2 ++
>>   drivers/gpu/drm/xe/xe_pci_types.h             |  1 +
>>   7 files changed, 65 insertions(+)
>>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> new file mode 100644
>> index 000000000000..4dc4afc3961d
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-gpu
>> @@ -0,0 +1,10 @@
>> +What:		/sys/bus/pci/drivers/xe/.../device_uid
>> +Date:		October 2026
>> +KernelVersion:	7.4
>> +Contact:	intel-xe@lists.freedesktop.org
>> +Description:
>> +		RO. Unique 64-bit identifier of the GPU SoC device, exposed as
>> +		hexadecimal value.
>> +
>> +		This sysfs file is present only on supported Intel Xe platforms.
>> +		Accessible only to users with administrative privileges.
>> diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
>> index ef4746b7b5d3..437485b5a0af 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_regs.h
>> @@ -30,6 +30,8 @@
>>   #define XEHP_MTCFG_ADDR				XE_REG(0x101800)
>>   #define   TILE_COUNT				REG_GENMASK(15, 8)
>>   
>> +#define CRI_DEVICE_UID				XE_REG(0x102008)
>> +
>>   #define GGC					XE_REG(0x108040)
>>   #define   GMS_MASK				REG_GENMASK(15, 8)
>>   #define   GGMS_MASK				REG_GENMASK(7, 6)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 44975e7823be..e1979bbcf7bc 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -672,6 +672,7 @@ static void vf_update_device_info(struct xe_device *xe)
>>   	xe->info.skip_guc_pc = 1;
>>   	xe->info.skip_pcode = 1;
>>   	xe->info.has_drm_ras = false;
>> +	xe->info.has_device_uid = false;
>>   }
>>   
>>   static int xe_device_vram_alloc(struct xe_device *xe)
>> @@ -872,6 +873,12 @@ static int xe_debug_page_size_alloc_ctrl_init(struct xe_device *xe)
>>   }
>>   #endif
>>   
>> +static void xe_uid_probe(struct xe_device *xe)
>> +{
>> +	if (xe->info.has_device_uid)
>> +		xe->device_uid = xe_mmio_read64_2x32(xe_root_tile_mmio(xe), CRI_DEVICE_UID);
>> +}
>> +
>>   int xe_device_probe(struct xe_device *xe)
>>   {
>>   	struct xe_tile *tile;
>> @@ -879,6 +886,8 @@ int xe_device_probe(struct xe_device *xe)
>>   	int err;
>>   	u8 id;
>>   
>> +	xe_uid_probe(xe);
>> +
>>   	xe_pat_init_early(xe);
>>   
>>   	err = xe_sriov_init(xe);
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index a73e0e957cb0..18783a286a83 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/sysfs.h>
>>   
>> +#include "regs/xe_regs.h"
>>   #include "xe_device.h"
>>   #include "xe_device_sysfs.h"
>>   #include "xe_mmio.h"
>> @@ -264,6 +265,35 @@ static const struct attribute_group auto_link_downgrade_attr_group = {
>>   	.attrs = auto_link_downgrade_attrs,
>>   };
>>   
>> +/**
>> + * DOC: Device Unique ID
>> + *
>> + * On supported platforms, Xe driver exposes a unique 64-bit GPU SOC
>> + * device identifier through the 'device_uid' sysfs entry.
>> + *
>> + * See Documentation/ABI/testing/sysfs-driver-intel-xe-gpu for the ABI
>> + * specification.
>> + */
>> +
>> +static ssize_t
>> +device_uid_show(struct device *dev, struct device_attribute *attr, char *buf)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +
>> +	return sysfs_emit(buf, "0x%016llx\n", xe->device_uid);
>> +}
>> +static DEVICE_ATTR_ADMIN_RO(device_uid);
>> +
>> +static struct attribute *device_uid_attrs[] = {
>> +	&dev_attr_device_uid.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group device_uid_attr_group = {
>> +	.attrs = device_uid_attrs,
>> +};
>> +
>>   int xe_device_sysfs_init(struct xe_device *xe)
>>   {
>>   	struct device *dev = xe->drm.dev;
>> @@ -285,5 +315,11 @@ int xe_device_sysfs_init(struct xe_device *xe)
>>   			return ret;
>>   	}
>>   
>> +	if (xe->info.has_device_uid) {
>> +		ret = devm_device_add_group(dev, &device_uid_attr_group);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	return 0;
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index cd9ed8ff2940..41f703a87916 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -179,6 +179,8 @@ struct xe_device {
>>   		u8 has_cached_pt:1;
>>   		/** @info.has_device_atomics_on_smem: Supports device atomics on SMEM */
>>   		u8 has_device_atomics_on_smem:1;
>> +		/** @info.has_device_uid: Device supports unique 64-bit GPU SOC ID */
>> +		u8 has_device_uid:1;
>>   		/** @info.has_drm_ras: Device supports drm_ras (Reliability, Availability, Serviceability) */
>>   		u8 has_drm_ras:1;
>>   		/** @info.has_fan_control: Device supports fan control */
>> @@ -265,6 +267,9 @@ struct xe_device {
>>   		bool oob_initialized;
>>   	} wa_active;
>>   
>> +	/** @device_uid: unique 64-bit GPU SOC identifier */
>> +	u64 device_uid;
>> +
>>   	/** @survivability: survivability information for device */
>>   	struct xe_survivability survivability;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 28f37e034e02..032a08fe41e6 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -472,6 +472,7 @@ static const struct xe_device_desc cri_desc = {
>>   	PLATFORM(CRESCENTISLAND),
>>   	.dma_mask_size = 52,
>>   	.has_display = false,
>> +	.has_device_uid = true,
>>   	.has_drm_ras = true,
>>   	.has_flat_ccs = false,
>>   	.has_gsc_nvm = 1,
>> @@ -793,6 +794,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   
>>   	xe->info.is_dgfx = desc->is_dgfx;
>>   	xe->info.has_cached_pt = desc->has_cached_pt;
>> +	xe->info.has_device_uid = desc->has_device_uid;
>>   	xe->info.has_drm_ras = desc->has_drm_ras;
>>   	xe->info.has_fan_control = desc->has_fan_control;
>>   	/* runtime fusing may force flat_ccs to disabled later */
>> diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> index 71068cdb3558..448bbe5ba1d7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> @@ -40,6 +40,7 @@ struct xe_device_desc {
>>   
>>   	u8 has_cached_pt:1;
>>   	u8 has_display:1;
>> +	u8 has_device_uid:1;
>>   	u8 has_drm_ras:1;
>>   	u8 has_fan_control:1;
>>   	u8 has_flat_ccs:1;
