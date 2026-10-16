Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E421CCF2C2
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 18:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E2A10E25D;
	Fri, 16 Oct 2026 18:24:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AB810E1EC
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 18:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792175039; x=1823711039;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=08K1H1ZSa9DCbY67ZDTYW5ih1btCARo9tb8qYOhIQW0=;
 b=B48U16xUY25XByeCwns+z+LeV1PCYuQShRatZ28zDCRnuuz2WQzdjBUt
 oWeU632uF6WpzGn46gmkofex9+cl0kV7Mo2s/d4q+RVO/Yr/nXB0mhi7f
 tRBFyeMq7cwxzb3pj52FCgQj1LO1UN0NkFo8HHEUxacla3o5ToprWLD1w
 eubbCc7qJ7lkvhaJr8H51FG+ktmhHmnz2XQfvhhQ1kJdOewb9U9PmTq+5
 lSBbGAyST77kmDjYqGAEeG98CDfMFTO9mxKjwU0N/x1p/Bcr4Z541OCKW
 oYu/5ZBhy3THl8ekOLOi5KT3dZ66msKB71ZjTIMhMFLaOgrIgkxEXWXUb w==;
X-CSE-ConnectionGUID: dGE2JXojR1yJkGLERQ8QxQ==
X-CSE-MsgGUID: JepZXbWbTm6vy4++gik+ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="831562"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="831562"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:23:59 -0700
X-CSE-ConnectionGUID: x4LNez1OR4uviXOAWkquhA==
X-CSE-MsgGUID: X2JD7zLmSeKZUrzp7hJoIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="1995625"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 11:23:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:23:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 11:23:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 11:23:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H1822KJQBZzFtHFmN3r5r45QltWi484gZxwKTQmYaOKAAwQ3VoXJ220Ig51dg/8PV2B0RQiDdC+lrPErBfsycjxvWTLgYVw5+iUWVho/4bzogiRBRqUZEOt1ntTuXYGA6OtjMeTfwf759q7BCUwPeMtvTfvXsRu+Yo6eFzj2tkdJMz9bOe4cBqhRl6trNDILTdK0PUMRtT4ZVx81nM6KirnJsZxIJ9+wRScHa/aCxE90pXaAGaOU1JwgEjKxuzOYvICl/rHBjCqu+tABqIMTO/MwDjAz7i7RB2EWjy9T6OT/eRj9QzuAFHhnawW/9XO9brXX7D6FTts8wN0kYUYhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q60hrwNUXQXUrS+pJmAczxENA7pDjCOOclth/3bAoAw=;
 b=UZXtYNdHWj4Ub/fUPzKl3ofSjLSMM5Y8sZ6BpcGduVllKB1IymKF/4LCVco/xN/8+sxxExFUavcydBcAvDDJ4NnAjXyfay/S0kPNfiGO+7Uxr9VUhYHIccon6DVBhFRDKLSuy5K+jhbRemOo1DIL1GWfVqCaqjPbpDG3AKmchmFvyGXWJ96jiCESUR7u5vPEK8+R2Kh6ZQkZsEia4Snwpvgg5XHbUwoDdwiWlmjPo5wKxnmmNKiD7SUyD0+CbPFzEh7GBrHsG34RsN7200LBcHFH8UaQ4REZXqCB2xGoXV2xb52zu3s0poKIML2cJxjva91tNC7ZE64h6ceLs5cbbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22) by SJ0PR11MB6792.namprd11.prod.outlook.com
 (2603:10b6:a03:485::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 18:23:55 +0000
Received: from CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7]) by CH8PR11MB852307.namprd11.prod.outlook.com
 ([fe80::5f8e:c1ed:445a:a4b7%4]) with mapi id 15.21.0522.016; Fri, 16 Oct 2026
 18:23:55 +0000
Message-ID: <553c4753-6c38-471b-8e3a-c6b8c4407e29@intel.com>
Date: Fri, 16 Oct 2026 23:53:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [1/3] drm/xe: Toggle the D3Cold enable flag at runtime resume
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261015165451.154495-6-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20261015165451.154495-6-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::16) To CH8PR11MB852307.namprd11.prod.outlook.com
 (2603:10b6:610:32c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR11MB852307:EE_|SJ0PR11MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f4dc78-26e5-4a75-f508-08df2bb2a332
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|22082099003|18002099003|10067099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: yKuZ29bP9jjkv468ksfEmOk56hcnNIZzQAMmmDRwuhAE/ZWkoLJPTyVK0SOrmVkgnWxLWBEmAvjJrTt6gjilQoRRqojf90HvSShUEDiLK948mtf68cObjemLB9FD5s1K3RSBYVD6VUw924HWUDkZZxqHFpJfzzxveP+QYmzECuP/WrPwpWe7z+pBXvJvlMz1s6xz4O75LrHWKQpQ0q2t190Z+AFdycUuJBACwMgcg4Ft1C8Z5nCSqlf/IxIDuXX1aymBLb06spOw2zFbipy5lWOXNhhbubUqnYyam3+SZ3sgmhl7l/n4yROiw6Y+DTRX2xg9R5SsvRgRp10xqNaOz8MgFOyoVSM3XQqWAPlmCWN3qy7LgCXmzActPLmaLV56SnYmrNWMhV2A/LDN/8WrBy8xsrKA+FjM746dbGWpKdapT9bHz9R12qfrC9g/vfXVHMcZ82nymnIz34AqMALxzFkpVc6CskHinmuvpj99jl5EL+xS7On/Osqp85len+eVf2dMOZ+DboqgH/gM7K5uHDXImDP6rHOsAczAsrhEmcqqjuKyupz7JoZ892bDLosuYcB4k2t+PFJkbQPK95WPdMZ67gdRKKV2QQwC+FhMcQorOukKZYto7HucTrU1bgHHHfr7ENd2ntjhbAVXdb5nMwrMkcBHOlL/mxJA3qNVfvs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR11MB852307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(22082099003)(18002099003)(10067099003)(261009223027099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkZndVQzL0YyWUFTclRHaldBdlNmdUMxczhsVFNLNXl3ZWRuTlN4UlZzaGlZ?=
 =?utf-8?B?a3lrOWZ4YVh4MkIxVE1MSjU2VytJdmZFR0hHdFYrUVBodVd2bmxmcWlMVWVq?=
 =?utf-8?B?MDFObHRCMHIrZHdWTHhpMDFWQ2JyUFBUUnpYMnZMVk1jclNnNUZrZXNUcjZS?=
 =?utf-8?B?QnVVRlViaWlucm9vUHhaS3ZrYlhjV1NiV0FONUFSR3dMSG1wSmNzQ1hYT1Jp?=
 =?utf-8?B?bzVjM0MrT1JEMEcyNzZ3NFhjT3JLM0tmSkF1VitzakUwTmhXSzFLK1lnSFNs?=
 =?utf-8?B?NkVPSURDOWNDRWJKQjZkYkpqK08zcFE0OXBxclJUUXgvM3Q0SDZyYWJFKzNv?=
 =?utf-8?B?WHRsc1Zka2U4RE0xaE9iTHhLOWcyZFhkdThpZnhDM2Vud3dxMzVDczA4L1J4?=
 =?utf-8?B?OVRqS0NzeGZlUXVUeEhnMnFWMEtyOS9LR1pPT0NURW8vZFR5SzZOdTFQQjFa?=
 =?utf-8?B?NUdSSDRIc1U4N3A1a3QzWUVLMUNRK0lCRUNLMXdsWW9saFl5dXNmbHpoWGFI?=
 =?utf-8?B?dTFtRU8xSnNKZjkrUXJDeWJhSWJza0ZrSDVqbkVNMko0WlNFTE9PYzVwYVlH?=
 =?utf-8?B?ZlFDVDhHZnFoY2RzcmZHcDdvcVRBaC92ZjRtc1JuN0Y3MVdUTUhsS25CdUpO?=
 =?utf-8?B?QVRPbnY2TGNsS2pKWi9OTExSQW9oOWUzNHRlNVhBYVJNTmk1cmc3MUVVZ0Fp?=
 =?utf-8?B?UUpGeWVCQXoyVXRUSDVnQ1ZlUGpscWZpdDZFbUUzWkZjK1YzZThNVFRSc0ZD?=
 =?utf-8?B?VWVIVVNGUHM2b1JqZzdDdkh5ZmwzN2VaWjUwclRwRVB5Uk9wN3Vqbk0yNStE?=
 =?utf-8?B?VGh1MDRsVGdxM3FFWGNGYTdES2pmRTVlSlc1aDVtbTVHeEdkQ3ZqQXU3MnRw?=
 =?utf-8?B?RnNRcjAzekUybUJrNUU5b3pkREk4Uy9ucnRtNkdqOHFvd0tzU0x4SnQ2WnJz?=
 =?utf-8?B?VUR0Zi93ckZyYlVkUnNOQmtPV2ljbzFKKzhaOEtnc2YyWng3cHNnVW5rb254?=
 =?utf-8?B?VkZyTmFORitMK2lrK2R5WDZqSXE0dlBZdUlSQnlrV2o0Z1hjZFZZaXV2aDRq?=
 =?utf-8?B?TGpKVmViY1NOeU5ycTgzVTV2akg1UWZnWmxCNVB6S000UnV6dFFqOWVqOU1p?=
 =?utf-8?B?Wi8xSlNkcDRDVVdwMjgyZjNjNElmbmVXNE1YaWlHeUZoVERGTDhVbjlMMldv?=
 =?utf-8?B?blovWHZObkNXRmJzemtjVEpCZVJWcDNzR2g4K1NqWCtUcTNGaGlmaStsYkJa?=
 =?utf-8?B?dVJkOCtTZloyTG0yVEdDR0hVcUVONUJvYjZzamhFSWtDams4SFExK0I4MDFr?=
 =?utf-8?B?YWJNaXh4M3lzdGdmNTN1Y2xzWE93TDFDWW5aZGJGV0gyMDF4Y0lmenQ2K2xh?=
 =?utf-8?B?cVNoY3BJMVdaN0RDSTY0REhTcG95c3U4V3g0WklNVFd6bFl4Q0VmY2ZrWmpE?=
 =?utf-8?B?c0NHWVBsTVFUVExuN0xpU2NobE5oejhWZ2ZyV0JBdUx2alp3N3FxVEQ1SGtj?=
 =?utf-8?B?ZTVqREhNcW95TkdKQ1g0UXFrd1hjOWpOdi8xUU16YXJWakdNVWwzcWdhSXB2?=
 =?utf-8?B?T0p3c2Q4Q0w3aW0wZ3NkanRPczJEajJUTTlVYVkxT1Brc1NNU2VlbC9EQ013?=
 =?utf-8?B?UnQvLzQ2YThDM204bmlrb0lzOXM5NjlOSEZialg0clk1NWhPeUJVamJpVFdB?=
 =?utf-8?B?OUd6bzRlR28waWhNV0xpQkFQR1BZOHhTMGVmcWRpYjlTZmxvaFFLTXFRdlZJ?=
 =?utf-8?B?SmgxSS8weTM1d2Q1ODV0alRlU1dxSHROOTBYd2hKOXdpM2haQTMyWFlTbk1v?=
 =?utf-8?B?MkdTUTNQcGVWNHZubjczZlF1aGJFSkFGYTE1cUd6Z3hla2F0TElsSWJsNXZT?=
 =?utf-8?B?VXV3bzRoQXRndGZhYmwyZ200VU1sNS9sdURKWEg0UzljL3F0eGdTbTR1Ym5J?=
 =?utf-8?B?S0RxcTNldnBmK09uV0lNY3JZYmpTNThYZDR5eEwwTEk2OWtCRlM0Mk1COUJK?=
 =?utf-8?B?WURKeGZBL3RPTDRDS2thNHYyNkc5NXdZbERYa0d4ZTBnL0ZkKzhnSVZIVk9m?=
 =?utf-8?B?c0R4M0xDbVpvaS9HVnFDc3pXOVNYVUJCZlgwSEE1UDBGUGx6d0lMN2p1Mk5n?=
 =?utf-8?B?K0gzeFlscU9WdXFKcEMyeFljbnJHbUtnTklmWTRwRVQwN1JyNmpEaEIrTTZy?=
 =?utf-8?B?TTZsMEVLb2FRVVYzM1FrZVl1NTBwbVJld2ZpV2I4WE9CSk9TMXIwUjBYdi9q?=
 =?utf-8?B?dGY5b2hma2s0ei9Tb29SQUQyUUQ5ZUkzYW5RUXB4SkVyb0RhaGF1YWlMWVp2?=
 =?utf-8?B?citBN1lFSEJMdFBvQ2V1d2NMM2pGM2c4bU5hbUhuUGoyb3ZzcXlLQT09?=
X-Exchange-RoutingPolicyChecked: qdzXOsY8+K5mkU7PgLMrx/iGe40/ptylv4ID8cr7Mn+e7dqBMuhfjIgfrSq8cHvDakY7NJnM/13QQPi9T7577CHxqBUEUjL3sYaw7/D1VEfjtRM1ugRXtG/1qtJ3kMNFvHrO6acASj4KIuEYJuk9zBNUVakAZFa9sZ5vhIDmgcnVIz3YAiE3rKKpTDeUVZfmt5EK7OKBG5cxQmKSRV+3muYD+oBUuQRf9YnqfsDIFBIjm+O7JB9ml7Z55aVLkyiy5P+N0pMocn8MpP0dRTzqiR75CT2MddIVAokpiA87bh4EiWUDrkxsza236ACRvFxbFCEpNPaOO9HZ1BSEbtQ1wg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f4dc78-26e5-4a75-f508-08df2bb2a332
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB852307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 18:23:55.5007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P4dzVzu6V4D8Bq2dS3WR5HfzUouANzwMRW7+Rv+I0VcCdLwNRahsPf36CDkLbnL/xQ7/0lye3I+6EHq8KR9TKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6792
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


On 15-10-2026 22:24, Vinay Belgaumkar wrote:
> We enable this flag during runtime suspend,
i think there should be Fixes tag for this.

Fixes: f026520367be ("drm/xe: Only set PCI d3cold_allowed when we are 
really allowing.")

> need to set it back to
> false early during resume to prevent any race with pci driver.
What is race that seen without this ?
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 57c6f778ca24..2269e51868c1 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1450,6 +1450,9 @@ static int xe_pci_runtime_resume(struct device *dev)
>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>   	int err;
>   
> +	if (xe->d3cold.allowed)
> +		d3cold_toggle(pdev, D3COLD_DISABLE);
> +
>   	err = pci_set_power_state(pdev, PCI_D0);
>   	if (err)
>   		return err;
