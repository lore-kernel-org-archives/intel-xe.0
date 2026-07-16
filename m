Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C6BC4450E
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 12:03:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A8610F2D1;
	Thu, 16 Jul 2026 12:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYwiuqk5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2240610F2D1
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Jul 2026 12:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784203383; x=1815739383;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FjI/5wJ5r3yReqRT1PrcTrpTMolE7pwZ461jodzsAiU=;
 b=mYwiuqk52myFTdBKyJLh+oFA7yxAX24YOVC8ggQE3S1LBW1y57uRiU/R
 YzCdEe0NWVVHTuHrD02BSA7esoNSWGZpkbEDFeaI02a7AYj4fw75/lX17
 vQZlZHGTcZhTPdalH+FOuzNWZNXQipY5pgUWVGu4y8FFhPNIGSaGk/klS
 dHV4dLc2ZB9zApT+NCchLgHN7ZPnTXnlW6NM8XHc1IqL2Iuq/fWL0kyl0
 l8kjXX5JclRgFUhIE73bdV3QP3pL+SEtKLlxEp7RBnEkzY3KQZlq4sT8M
 G7xKRb0uR8p55+ZTqql7/J6AMDY3vPtsp60YmyXBj0lUWDw1lXJ1CtHmW g==;
X-CSE-ConnectionGUID: g5KwdO5USSelcvm17cEebw==
X-CSE-MsgGUID: RSlcGXo6TbyVb/ClN3iNeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="96225777"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="96225777"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:03:02 -0700
X-CSE-ConnectionGUID: H+Og5ieTStqF9erxCOfo9g==
X-CSE-MsgGUID: ojTtTtNVQ1SpviNIIkuyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252061459"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 05:03:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:03:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 05:03:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 05:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkZMacNsdbcMtBjFbGsqgl200Rgxv6TjmYm4gMFXo9F4yfx3TM4nvV7NGH5UNHiztwYQTjw3E4Cej0aiUQyzA8xCyoFKzuJ1OHqxylBd0XfEg6Pm1xOYkKzm8NYdqMGiOyseTzmAvOBd+oKL0uz8dMT16Jf9OxJWrPv7IyI7hVUbe9Tj1hGYoB4ARpaeehFPoWwZGrOa7AALoEALzqclT6yOTXGm0nLb8iqknu9bpj/en7SnDrNysELHst79XNcIT1+mSQ0ssTkDWLpfu9Gj2WPYD2XpfqyDlpwjoVca3bBkhHSzKwoYjlvU2NQfqRrFgILkTTTzlwZvlVNJigwf7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ScSZ7SUFeTWwS6v1gnywbvOk3t34/DrSQVyrfk+sS4=;
 b=PI9RYbmwTqR+M2Wk2d9XkdtgURQJ2R+0TsjAQYzqGWtUq9S39upQa67trly5BMkn+wRSkiQ1rxrZBChO2A3bHUex00OqWoGBM0+xSSFI4KwaJGeycFzXqwb50pZqRy+Nyx58K6sGzf0/HuyNZu5eB6fYOGeNWR/ig1Ymj3uWV0JGfz/O4Thjm4R0AZZju7QPf3ODyY1So36UQSJWup7GA4fSZyEI1uTjPfKHpfDXZmFmlouWrCL16TmN5XF06COMDACK2K1SLtfuFN4wdVx5vLrOhLO7LL3kDhB16BTlkFeKyAgFaB5Q+130igCa3oWQsNDAB2c67ZTn5IPNjltnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by SN7PR11MB6828.namprd11.prod.outlook.com
 (2603:10b6:806:2a3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 12:02:57 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0181.017; Thu, 16 Jul 2026
 12:02:57 +0000
Message-ID: <c277c12a-d41a-4a4a-98d0-8cc4cc7c458e@intel.com>
Date: Thu, 16 Jul 2026 17:32:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] drm/xe: apply debug page-size allocation policy to
 user BOs
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
References: <20260714105538.170849-9-himal.prasad.ghimiray@intel.com>
 <20260714105538.170849-13-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
In-Reply-To: <20260714105538.170849-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0102.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::6) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d0d856-64d5-4584-f949-08dee3322cf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10086099003|56012099006|11063799006|4143699003|10067099003|18002099003|18092099006|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Tp73Smh/VHlebvP5BaNc3fY6FJ7wZoVLQ+/5SURtltEjBMNDNrWK4inR9lhfigoRx6hSyyftJVjIJGEdXj9r6Ysm3l1OdDTI8kZLD2pjIzSnHvkl3jdvpvML6wkpDiq4nXrM3A+ODRVmr5X+361Vd1yLMmbqzvTltyxbfNqANoC7npBkTGXo4FHSIgOWYrO6jCnry+M8LAgJCrP1qxEhmrE6ov/YnGbNn/LtQWQl2Lgia7Yjccjc+Lzs5I964Ul3O5KW+kVFkgnVJ9spBlK4y/Nm+c9WfnUZMLqIvSQH6bI0A5CO91M4YTxV2VQDj7HQ59m0+bam+0N3XBEdAv9g5TmReee6eQb9c03gRU3AxUra/dXzLHT4jQyG1M4bbtsOA19MMtGp9iRu+YqY0lI70BY9/KmQUDQh3/m00DZHy7aFaLqb1sIYrXgx5JjfHA6GQ8gKCer1EAULgmu7umttNiqpZLCl1xFlvBj32i65MJn0Vc650rfDCGlXXdCHsQYgrQhi4uRD7vZUXBE0c0b4Vz0Y00T27/Mo3Fb/Rlu8J7vSPz8cMF9sviEcu2n6CHoH/DeS0zJ3oK/tBjXivQwrkuRVO6pL0/WHzKt3hjabIIMLhC/4HCFEcisvFFz9khQs3BGdJx4U9hxV2Z/3kz6a9oe/PcDgIqTn/cgKU7Zl0xI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10086099003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(18092099006)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnh5ejdKVFdRVzYxaHp3cEFEeFZieEVrd24wV3d6R3FlL3FNR2lPM2tJNFlZ?=
 =?utf-8?B?bytZWGFrcTE5ZVUzTmF6WTBtVHFaNTQvcEhzVVBGNVZXNzArdXJrM3dESHFL?=
 =?utf-8?B?QWZzZ0Jaby9HMUZvZmFZbGdOZjhXSjRRVzl1WlRQSnVQRnJtbjVnRERLbGJE?=
 =?utf-8?B?S1FpOXlxdDhmVFpUc2h0SmpDY3BnYnNFUkw1WWtDZGRGK2ZFZmpySHFvVUhx?=
 =?utf-8?B?M3ZHd1d4UDN4MG4vWlFubWdzT0hHUnBvWmRYak5HRjJ4UG95WmJldHNxRkNp?=
 =?utf-8?B?cm5pYzd6Y1lYajRzaGNOK0I2VGIzL0RiU1N4RWt2UTZCV2xHVnhCeloyaUh1?=
 =?utf-8?B?VjdFdDZra1M3Wmo0MHpER2VFaDlObDlsYjR3cnliTE1hOGIrVWMxOGxBM3Ur?=
 =?utf-8?B?bUpaWGsrV291eVIxa0JId2h5dGtkN2VtTXdyMW92Tkc3emVVSnk0dXlBMkIv?=
 =?utf-8?B?TWFFVFJob2hpdE5pSHUybTNXRU9SeEJnVVZVL3NqdG5lb2lQSkpKdUVGdkJq?=
 =?utf-8?B?Zk5GdFRRdW9OaklLbCs5TG8vSXNnVmtMNEdUTVpGRjlFcThUQVFXK1J1ZWVy?=
 =?utf-8?B?eXVtY01ZNFJXZndHYXhuUkp5VGo5alViM3kybnFJL3E3dUhmbEF6T3k4MEta?=
 =?utf-8?B?UVNQRDFsdENWMnF2cjZKc0hXWnFldUZIRHluSFQ3Mnk5U0pWK1RjcTAzRkdS?=
 =?utf-8?B?dHRhUnYvTzBSZDVVMGtrQWE0czM4ZE5rMmFiVE16OW1VdzFyM2w1bGJCblBK?=
 =?utf-8?B?R0FzUUZjalhVQ0VNNWkwZEJoWTFJTWhmQ0M5OVVIMVZTR0ZIRGtNRk4yelIz?=
 =?utf-8?B?RmhPMkY1MVAyVDZSdHNPZXVDYlhReS9PWVJXRmtSY3c3RU5rZnBXVGFmRmZ1?=
 =?utf-8?B?RmM0dTZ2VzhzTVpGbitWQmxRK0tlckxSS29qVVhLS3FkbUZDaHZwRS9QYU16?=
 =?utf-8?B?akpEb1o2MC80ZWdYYUtmVUYrWEF4Z0k5L2MyaXp2Tk1yQ2diZEVNb3ZGNXd4?=
 =?utf-8?B?aVduTk16cittdGZKamdvL2hob2RnMTlFLzgrbmgxRlV0Vi8wZEM2VGxhOUV0?=
 =?utf-8?B?dFJJb0F5TFI2WEQzWmNRSFgzTVJMQmR6N3ZMUmx6bkFHcHg4VjZQVlZZdjd2?=
 =?utf-8?B?bjdXRkpyQUtMbUI5cHZPYmhibGhoRkl3Z1lRUEd6aTY5bXVaanBBY2VmSDFH?=
 =?utf-8?B?S2FjZm10UmNFZVdINC8zSlppYUQvYnZ6RXFLdEhpT1FsMFZ0ejlNRlNLZGhL?=
 =?utf-8?B?MlJwdEoxS0I5ODl5L09qVWRtTVdEd0dhTFNyTWo2UksvRHFhYW9Qd2VhUnFy?=
 =?utf-8?B?ZWRpNXRrbmM4eEpBcTBXOVVwYXdmcXJpSTdTL1BUK0tXMEIyb1JYaU5VM2g1?=
 =?utf-8?B?Nkpkc01PUFpmcnNEV2Q0VytqNzhkUWFPZXlCcVZFTiswazhyN2hwL0JyZ21q?=
 =?utf-8?B?bXNQRFg1YXhNa01KMm1KOUtxekw5MjQzMHBRd1BLaXlDb0RxbFFFS2hPVDgv?=
 =?utf-8?B?YUkwaGdrYXAyTkliOTl4TkVZMVhJTkIrUWprN3czOUg5QWtoSHV3VnUzbysx?=
 =?utf-8?B?QzNtVWt1OGlTYXd4ZGpvZnFpODUxOFpTSGpuTWIzNzBsWkV3NW5ZOWthRG5s?=
 =?utf-8?B?dDIvTUF3ZG5vRFZvWThXUHlqOWoxN2ErWHlpYnRvUWpIc25tMS9ZTHM1ZW10?=
 =?utf-8?B?ZHowVkl3c1ZTZjhQL0t4Q0JaZ1RualhCNUs0QWRYd1Y1ektab0JVTUMxZklr?=
 =?utf-8?B?VUs1ZVUvWkdXbG9aMmpzcVJ5Nnc4Q0k4dWtIUU9XQno4OThKWDc2SUVsSG56?=
 =?utf-8?B?elBPbHFmdmtBVGxldEdLSEFNME5DWGJ1dmV5Q01UemZoY2tmVFRocFVYbU5s?=
 =?utf-8?B?UUErMU44czFjL0E0ZWVuM3VEYUtndTVVeWF1YUprYjVVSStHTUR5WVVCY1l3?=
 =?utf-8?B?aFB5alYxd2kvL3hoR2NxK2VYTFZRZGRCTmdyVGw3QWZwQUlKK2NVb3RXV3VD?=
 =?utf-8?B?eVl4WCtlWmRuL3hpdTRnckVKNVgvL1hyT25pQ09STDBmanVGa1dDZlFHMkFa?=
 =?utf-8?B?eHlTUHBDWW5wRVdrdHF4SVJuZmZDR1hVZk5PT3hZOEVrd1UvTTJCSXh0OGky?=
 =?utf-8?B?TXJQL1JZYUVjTXJ5UytFOGhwb1F3Ykt1cTJ1YmZlRnlzMHdsd1RSb2JFVm9R?=
 =?utf-8?B?NXovYS9xRU5MTTUrU3k3dXpheHdrZFRVSW9ubXhYZlU4aDMwNk14OVFXUml2?=
 =?utf-8?B?OW1pbTh4VHhLQzBVV09LSU9JVDREbkZ5NXl6eEVDMG9KYlZubFcwY3hqRWVs?=
 =?utf-8?B?Nm8xd1g1WFJrcHNwaHdJL1JwM3BBZ2Q4MTVqYzdNMnRvY05zT2p3bU0xTkpB?=
 =?utf-8?Q?MmH5Yp+gwi4URRf8=3D?=
X-Exchange-RoutingPolicyChecked: H/oJPxUmL6S9ShGBTnIpUg9GKYfWq3iiTrLjb85Zjpjd6QalLD0s5/3gcO1CG9k/6LXMVugME3FassJyZeTqKcucMM3/QrdGYnfRG1jcmw/PH8yq4btMDz+IaS1Zc/1GxBpXfdlY/ljNyUvszANhAw8NiRxkVVIVZl0WeulZfytvfbfjfJ+xyMNI7d0u9zt1wvXjnOWo59hIfBj56Fi2hNc/kX6/4Vr5gx+n/yCTxYDFrw1fXY6pJfqWqLtANfbSqLYWxvisfoc8IbkwtrRomYrTW1WMwoeoXb5cRM9TEQTDNO34s58S3vxxsy4PuEqZlzYPbRJ7cUspNRPcU6mnqA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d0d856-64d5-4584-f949-08dee3322cf8
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 12:02:57.6723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htirnzGoDg2ete1kk3awKhYXSAjdEoRQcVqd4KHRju+X8WpWSnwZutkJ3HMYYv0LMP4P5TGj2Dmz1AEXtdH6Glf36oDMogJh+OqCCYN42yc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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



On 14-07-2026 16:25, Himal Prasad Ghimiray wrote:
> From: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> 
> Apply the debug page-size allocation policy during user BO creation.
> 
> When page-size allocation control is enabled, override the user BO
> page-size selection flags based on the selected debug mode and round the
> requested size up to the corresponding granularity:
>    - 2M mode selects 2M handling
>    - 1G mode selects 1G handling
>    - mixed mode selects the page size from the current mixed-mode index
> 
> This is intended for internal debug and validation flows. When the
> control mode is left at the default setting, the normal user BO creation
> path is unchanged.
> 
> v2
> - ensure debug page-size allocation does not
>    affect the default path (sashiko)
> - rework synchronization for concurrent access (sashiko)
> - refactor commit message for readability
> 
> v3
> - update user BO size alignment based on debug policy mode
> - reword commit message
> - ensure normal user flow is unchanged when debug policy is disabled
> 
> v4(sashiko)
> - limit debug page-size policy application to VRAM BOs
> - do not override preexisting page-size requirement flags
> - advance mixed-mode index only after successful
>    BO create ioctl completion
> - add overflow checks before ALIGN() in debug page-size handling
> - ensure CONFIG_DRM_XE_DEBUG_PAGE_SIZE enabled and it is dgfx
> 
> v5(Himal)
> v5:
> - Guard debug page-size policy paths with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> - Leave the normal BO creation path unchanged
>    when no debug mode is selected
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_bo.c | 154 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 154 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 9dbf59fad421..bccc3611dca3 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -2612,6 +2612,148 @@ static struct xe_bo *xe_bo_create_novm(struct xe_device *xe, struct xe_tile *til
>   	return ret ? ERR_PTR(ret) : bo;
>   }
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +static void xe_bo_debug_mixed_mode_cur_index_advance(struct xe_device *xe)
> +{
> +	if (!IS_DGFX(xe) ||
> +	    READ_ONCE(xe->page_size_alloc_ctrl.mode) !=
> +	    XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +		return;
> +

wont we need bo->flags for vram check here like in 
xe_bo_apply_debug_page_size_policy ? I dont think we want to update 
curr_indx for system bo's.

> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +	if (xe->page_size_alloc_ctrl.mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +		xe->page_size_alloc_ctrl.cur_index++;
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +}
> +
> +static bool xe_size_align_overflows(size_t size, size_t align)
> +{
> +	return size > SIZE_MAX - (align - 1);
> +}
> +
> +static u32 get_flag_from_cur_index_in_mixed_mode(struct xe_device *xe, size_t *align_size,
> +						 int *err)
> +{
> +	static const u32 map[4] = {
> +		0, /* default mode 4K */
> +		XE_BO_FLAG_NEEDS_64K,
> +		XE_BO_FLAG_NEEDS_2M,
> +		XE_BO_FLAG_NEEDS_1G,
> +	};
> +	u32 idx;
static const struct {
         u32    flag;
         size_t align;
     } map[] = {
         { 0,                     SZ_4K  }, /* default: 4K, no flag */
         { XE_BO_FLAG_NEEDS_64K,  SZ_64K },
         { XE_BO_FLAG_NEEDS_2M,   SZ_2M  },
         { XE_BO_FLAG_NEEDS_1G,   SZ_1G  },
     };

will make below repetitive logic leaner.

> +
> +	lockdep_assert_held(&xe->page_size_alloc_ctrl.lock);
> +
> +	*err = 0;
> +	idx = xe->page_size_alloc_ctrl.cur_index % ARRAY_SIZE(map);
> +
> +	if (!map[idx])
> +		return 0;
> +
> +	if (map[idx] == XE_BO_FLAG_NEEDS_64K) {
> +		if (xe_size_align_overflows(*align_size, SZ_64K)) {
> +			*err = -EINVAL;
> +			return 0;
> +		}
> +		*align_size = ALIGN(*align_size, SZ_64K);
> +		return map[idx];
> +	}
> +
> +	if (map[idx] == XE_BO_FLAG_NEEDS_2M) {
> +		if (xe_size_align_overflows(*align_size, SZ_2M)) {
> +			*err = -EINVAL;
> +			return 0;
> +		}
> +		*align_size = ALIGN(*align_size, SZ_2M);
> +		return map[idx];
> +	}
> +
> +	if (map[idx] == XE_BO_FLAG_NEEDS_1G) {
> +		if (xe_size_align_overflows(*align_size, SZ_1G)) {
> +			*err = -EINVAL;
> +			return 0;
> +		}
> +		*align_size = ALIGN(*align_size, SZ_1G);
> +		return map[idx];
> +	}
> +
> +	return 0;
> +}


> +
> +static int xe_bo_apply_debug_page_size_policy(struct xe_device *xe,
> +					      u32 *bo_flags,
> +					      size_t *size)
> +{
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +	u32 want = 0;
> +	size_t align_size = *size;
> +	int err = 0;
> +
> +	if (!IS_DGFX(xe))
> +		return 0;
> +	/*
> +	 * The debug page-size policy is only meaningful for BOs placed in
> +	 * VRAM, where the downstream BO init path can
> +	 * actually honor the corresponding minimum page-size requirement.
> +	 */
> +	if (!(*bo_flags & XE_BO_FLAG_VRAM_MASK))
> +		return 0;
> +
> +	/*
> +	 * Do not override existing page-size requirement flags, since they
> +	 * may reflect functional requirements for specific BO types.
> +	 */
> +	if (*bo_flags & (XE_BO_FLAG_NEEDS_64K |
> +			 XE_BO_FLAG_NEEDS_2M |
> +			 XE_BO_FLAG_NEEDS_1G))
> +		return 0;
> +
> +	if (!READ_ONCE(xe->page_size_alloc_ctrl.mode))
> +		return 0;
> +
> +	mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +
> +	mode = xe->page_size_alloc_ctrl.mode;
> +	if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE) {
> +		goto out_unlock;
> +	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M) {
> +		if (xe_size_align_overflows(align_size, SZ_2M)) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}
> +		want = XE_BO_FLAG_NEEDS_2M;
> +		align_size = ALIGN(align_size, SZ_2M);
> +	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G) {
> +		if (xe_size_align_overflows(align_size, SZ_1G)) {
> +			err = -EINVAL;
> +			goto out_unlock;
> +		}
> +		want = XE_BO_FLAG_NEEDS_1G;
> +		align_size = ALIGN(align_size, SZ_1G);
> +	} else if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED) {
> +		want = get_flag_from_cur_index_in_mixed_mode(xe, &align_size, &err);
> +		if (err)
> +			goto out_unlock;
> +	} else {
> +		goto out_unlock;
> +	}
> +
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +
> +	*bo_flags |= want;
> +	/*
> +	 * Apply the debug page-size policy by rounding the user BO size up to
> +	 * the selected granularity.
> +	 */
> +	*size = align_size;
> +	return err;
> +
> +out_unlock:
> +	mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +	return err;
> +}
> +#endif
> +
>   /**
>    * xe_bo_create_user() - Create a user BO
>    * @xe: The xe device.
> @@ -2632,9 +2774,18 @@ struct xe_bo *xe_bo_create_user(struct xe_device *xe,
>   				u32 flags, struct drm_exec *exec)
>   {
>   	struct xe_bo *bo;
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	int err;
> +#endif

int err = 0;


>   
>   	flags |= XE_BO_FLAG_USER;
>   

> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +
> +	err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
> +	if (err)
> +		return ERR_PTR(err);
> +#endif

Rename xe_debug_exact_page_size_mode as 
xe_debug_apply_page_size_mode_not_none in patch [1].

if (xe_debug_apply_page_size_mode_not_none) {
	err = xe_bo_apply_debug_page_size_policy(xe, &flags, &size);
         err check
}

>   	if (vm || exec) {
>   		xe_assert(xe, exec);
>   		bo = __xe_bo_create_locked(xe, NULL, vm, size, 0, ~0ULL,
> @@ -3449,6 +3600,9 @@ int xe_gem_create_ioctl(struct drm_device *dev, void *data,
>   	if (err)
>   		goto out_bulk;
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	xe_bo_debug_mixed_mode_cur_index_advance(xe);
> +#endif

lets have no-op stub if config not enabled. no config check in code 
please.>   	args->handle = handle;
>   	goto out_put;
>   

