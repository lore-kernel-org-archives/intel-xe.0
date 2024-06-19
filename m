Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7FC2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 20:18:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F5010E16A;
	Wed, 19 Jun 2024 20:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uz/E5nKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2796810E16A
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 20:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718828281; x=1750364281;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B80jzzGIR3ww9VPdCcwjEi6BZt8XdsuQ6lZe86QJ4oA=;
 b=Uz/E5nKFkQQ3dKMdeO+AdY9e0kRzaJFnpRZOPo79jTl4txIijXahDvpP
 6gD0/B7Ypp504TBgab5AznBlCUdfk0jBuIvHGOBRYmcF1NusDp/j/iMeA
 unU95+x0TyVwAfsCAJslfmDDC+m+dUMo8Hoka+1+2baHKP2BwfJxbJVnC
 wum5uGoqigy3YziBFRjtAvHhyetDscsAk8ysR7Caef6C/zD4ovQb1xgGe
 wnr4EWVakIQYjxi7wK+Xk99OwB/8lVudjdMMqEw4Q6H55/DdH4kdC5Tg3
 4LjmN86NnE/NRVhGgwjaBas8hff4AtF2qiFQF/jgkj9qPaB+XqucItIrW w==;
X-CSE-ConnectionGUID: H5GDXGHCSLKwzqFJKfLj0Q==
X-CSE-MsgGUID: Ww9G1+YlQvWMYf+QBG/hXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15759643"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15759643"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 13:18:00 -0700
X-CSE-ConnectionGUID: EHB+65SNSLud0DeKyoLsQw==
X-CSE-MsgGUID: wZ73jV/hT8+76shvcwgdBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="41973968"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 13:17:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 13:17:59 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 13:17:59 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 13:17:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icS3HsNxzsa6bl12A5YQkZhvXH3it5/x1rayBGSbxQpTE3wZE4uo4boZOYVHhyu2dIk0K6lH+XN0/o5tytmmdWh1FkOfn9js+J8TYlbJ7wZqCti2EqOobYysg4+tycpqFgNmhCi7rbdpxZ5FIHtCXhb7GB0prDdzV4AFeGrXLy8mXlM9UZHdnL/AWLSQprh9g8LDtGTnPkY4Ipktqf6Om5F9U2Cei63pOD6gSl//m07pyCWo0l+sYAiBeD3ZuDk/Ndyw63xzi0LPSwwe5m207qUfNHaay5ENJNh1DJoVH4eG+w5hlUt7D6u26ZjUdzMq2gx8EvwexdMuQOulu55KGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h43G0D5d9GUYiabiNZ5gkVW97N6be3UblRdDrwOO+M=;
 b=bpO4V0JTYvKrS0BYwqCdI8UYIgE5aX3PMFtcHYEubtg+75lAWHTi3Hn7IpCuM35HkDmrMNWYOT2TZStBKLvSQnPanWSRerHxI6EECBpJnFf1D44kVylThHYbDi2px8tss5N0RCZhuwVLyXVe/UhWcV+bhdk+WOUjHLf9usa0mWzpeATEZ3/sZ3pF82+NN5KnShqfiNTfWiqt7hPxxrJdCjFCKZLL4iG9JiD8QARXOMKLpxNSjjFQK/63QxQUt6RaiUAJABW/1R5G5or7lEeoYDKqkAQN9wm9ndUMohHrG6/iH0UNg2zQ5uOphCM2VGb8EKxOU28T38bKL/D0Wygz5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 20:17:57 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 20:17:56 +0000
Message-ID: <348bcc7d-7c9b-42fd-b8f3-ef9309a1ac23@intel.com>
Date: Wed, 19 Jun 2024 16:17:53 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] drm/xe/guc: Extract GuC capture lists to register
 snapshot
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20240607000719.1012422-1-zhanjun.dong@intel.com>
 <20240607000719.1012422-5-zhanjun.dong@intel.com>
 <42eec22527828fe82a5edf60ed02ba7a5e85b6d8.camel@intel.com>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <42eec22527828fe82a5edf60ed02ba7a5e85b6d8.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0147.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::32) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV8PR11MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f489ba-56b7-4a8c-4866-08dc909ce855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFlDTyt1S1diaTIvQStWbzJ4QWFzbGRKUERJOFk5a1Y2NEJMRk53aTNPSkpT?=
 =?utf-8?B?ZkkwakVGcFo1N3M0VjcrU3hNd0RVdVJ0TVpOeGExY0wvYzNFUExzcmJucURX?=
 =?utf-8?B?d0NSR2h0ZHZEcnNTaFJ2MWdYeFRQb2UxT3BJbzA1L2pQMDlBb0xSZ003NDlo?=
 =?utf-8?B?bWJKcTVibDJMa0VIY1pmSkRxTExZR3hna3NncWJTN1ViU2twdUtHSXN4cytQ?=
 =?utf-8?B?SExuNXNnT3hQb043YXJwUGp3NjNkR0N5azkxWmQxdThqeFFMbnBWc1Q2bHcy?=
 =?utf-8?B?ZlRObFZQUndOZDhEemM5ZC9uSXpYZFRHTWI5eUYwTTVrVkhESHdQdEVjdmdC?=
 =?utf-8?B?b00xcUE4dnIvdkpVTGxiMGVHdXAwdENtazc4QytrSER6Q0FidEhmbWhNUVhZ?=
 =?utf-8?B?SnA3bWZTUG1RdjdQM1l0TVlabTRoY0JIVTRPUWN3L3IvVzFaM1pDU0JteUkx?=
 =?utf-8?B?ZmgyblhxTllya3puaFJXbW1KNkFkVWZiN3lkUzVUcGJMUzdwSmNvQlhVVVNB?=
 =?utf-8?B?RFVLMS93a0VPN1QrR0tpQUlsRWhKdXBQYk9HUFV0b0RDNUNVeGx1dVNXU1FR?=
 =?utf-8?B?L1BjTXBiZmdBMkg3cG5Hb243eStLaFZBa2lTckdZWHR2UWthK2Vhc0l2V1ZD?=
 =?utf-8?B?dFUyZ1FLRHBFV3pkVlg5ZE1CT0RqNjNPd3ZENkxmZldOTTErbkVHRkk5SHJ5?=
 =?utf-8?B?R0FDZGFkNlphU3lhODBRR2EzcGxzUWtGU0txZ3Y2UFhLSDYxM3o5eW56Q2tW?=
 =?utf-8?B?czFyQXFsQ1dGNTBSd2lZeFFVWmZnM1hDWnYvczF1TzA4dHVaSmwwOG5RTThh?=
 =?utf-8?B?dGI0T2EyZzl2WHg4blRZeG41aXgyVFA1TFBEV0QycHdpT1ZkTmpEZU0vSDhK?=
 =?utf-8?B?amthT084Szd4RnNSSno2R21mWnB3V0hLZ3pHcHZING9KbzZSWTdKbGMxNk0r?=
 =?utf-8?B?Y0xjL2JUZU9nbkFDV3UyRFJMN1VXeVVydFJaYjd5WnZtcStmNkwybnBBQzRC?=
 =?utf-8?B?cktJU282UzFJVi9wY0t0N3JERS93VHFaWmNCUWZ3dXlPSkNkV3k1VzFybGdD?=
 =?utf-8?B?RHNuK29CdWlQaVI5QmV6RTRobENOdXN5VGg5VXlkM1A0SGNXaEtpbnI2b0VU?=
 =?utf-8?B?MXpmZ1I5WGpXaUlxUkRzUzd5aEJoYU40c3poQjBJQTMwemVQNytEK255b1BR?=
 =?utf-8?B?dVozQUJHclNNaVVEU0hYRmVqMTg3ekkzWjRHN2VvVHFPUFVoR2FlSGtiaDVC?=
 =?utf-8?B?N0lxWXFuY1hGZ3BrWjBjb2lQWGJCZEhaeCt2S2huVWxFUUNUMnlSSkNpb1FJ?=
 =?utf-8?B?cTlwd2RmZTNBL3BiMmVzUkNhMmpPcEVWdDNPNmJaN2lidzlTR09Yc1lpRDlP?=
 =?utf-8?B?elo4WGFJcXpZUjZrWnNGQTVJSlMyOW1IaE1vdHREaUhoWmZrWTBGTWpUUUhi?=
 =?utf-8?B?NituTDRhR1NwZjNFSHY2clZpdnpXVyt3MnJwK2pwdTFnR2o4MmFkd2RkUDlY?=
 =?utf-8?B?UkN3aXBtcUwvSHpTSEJTOHdXb00xenZNNkRTR1dkVmNScWVheVo0VHlweUZZ?=
 =?utf-8?B?UnJXZjljdnI4bk5VTHB2K1NlV2paaTRtTzd1U3J1SW1HcFRWWDVPdE05R0pv?=
 =?utf-8?B?VlhocTFBVjduRWF3SEF1V3MyQmhCdFhoTzlpV3RDZWlYL2M4ZG5sYmhzbVVx?=
 =?utf-8?B?eU5BNXFyZVZZc0VSRkVhb0dXNlhNS3hRK1poVDJIcTB6blFaaWJZZTlPV3Nx?=
 =?utf-8?Q?Yrq6Vm9K6StW5Sg3WdoPagNZttzdIIgNSLGw01N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHpSTWM2MGNHWFIrckpDeDZXU2FsdWZsam1LKytNalNkWEFEaVNmQk5nalJE?=
 =?utf-8?B?TmVVbU0wb3NKMjVoVXNndHN0LzRteE5BcDJwQUNCbWdHbWJRWWI2ZVZyT0pk?=
 =?utf-8?B?QzdWNW05TG1mVFZ3OE5HWnE4WmVYUXlGdlhSZ3VjUWxNVklQTDZHMlVKSDh1?=
 =?utf-8?B?OVBNTjNhQUtGWnJpckNoaS9OckxwcTYyVk5Jb2hhQmZEZzlzTFZmRHVHRm4w?=
 =?utf-8?B?NkZldFN4a3RFbitxamdLcVRMTzU1SElDMU5PaTBxalE3ODd0VzZGWVBxeDEz?=
 =?utf-8?B?ZzNLUTBkZEhFVnZodGZabmxmaDViMDZ2S2l6S24zV0hqeEdFR0JWK1A5WmRX?=
 =?utf-8?B?OG90bWpWSnIzRlRrbGh4TW5wZ0dNL09PT3hMblFLS2MzQ2E2R2JtQkcyU0dU?=
 =?utf-8?B?Rk13alVUbkM4YUVRNXY2cGlxUGlxajJRRFYvbWl2OGQwTUs5QU5UWXpPdUFm?=
 =?utf-8?B?ZHBoRy9oWjZFZEZuRzBoNDQwM25ZR0E3bTdwSGlWakdTcDRMWUt6UWFaYnF3?=
 =?utf-8?B?ak5JS0ZjZXBSNVhvK3VNRkxVZWMwRzFMd0lUeDVkWGJDQllTUTdJWkJUNklo?=
 =?utf-8?B?NGU1VE82MndFTDcxQUhNbnBkeDBYRzJkZ2J3VFJDNkFYcTRoaEErZHhlNS93?=
 =?utf-8?B?VG1jQTdNWi9hdytIVVRkVkx5czRvL2hVQnV2U1BoWTJnNXFBSHpSdTlnQjc0?=
 =?utf-8?B?UnhoMkZmaHhXVXIxQnVJOHVTTGtvYmFaOGZRbGYxV1EvL2JweEZSaTgzNXBE?=
 =?utf-8?B?MXMvOWthc3JTMFhwNXBxcEVvR2dTdGkzbm1ybCt3NlE0VjZLT1p2L2lFZG1q?=
 =?utf-8?B?bk0xdk1nR2V6MVJHZ0ViWlVuRndZaTg1RlNxRVJ6YWdQdS8xK1JaWHpCRHNj?=
 =?utf-8?B?ZVRGclYwV0tkTjhySGVNdyt0WlpvMkxRajdvbGhkbkhUTnBCaFQxTVVmbVJO?=
 =?utf-8?B?QVhGZHlWdHFYbUZwOTZiL2w2N1BCczZHbHNoTlJ0Ui96YmRIVkhobTJlRWJo?=
 =?utf-8?B?bjFoQndrMktwREozU1JncDRqOTFRVkJ6dkFWOU5veGl1dDRoY1pGOG5QeThm?=
 =?utf-8?B?VG9CczJxbFB1UW9QcDNxbjVCcnQydkRQS0tnRFg3MUhOSStvUndKcENLNUZw?=
 =?utf-8?B?K24zYTNiZUJmR3VMU2RNSlRLQm9FR1ZGdHdCMzY1UGpuUDVJUlIva0lWdm1z?=
 =?utf-8?B?WkdnU3hsVEpHbjVISkhSM2drRVZVdnJTTXkwYTRRSWFrUUp0ODFGRy9jbVlw?=
 =?utf-8?B?aU9WeFRBdTFoblc1R3BNTXpwKzNtbVpvR3ZFRmhrYXM2R1kxMWVxOW85engy?=
 =?utf-8?B?MXJZZHRRcGRDVGQ1ay80OC84ZzBzVDRVT1hUdTBDS1h2cG1hbDFoTTlNZEFo?=
 =?utf-8?B?MXRRK1VSc24wN3RMNERCd1JYaVY2cmFPS1FsWkREVEVhK2VZaklTK3hEY0Vr?=
 =?utf-8?B?MW9mK28rcFQzUGp6VUN5bGJKdjBWTGErbm16RTM4SEp6bnZ1S2g3MnlXRzls?=
 =?utf-8?B?a1V2bXZ4ZTZhcWw2ZEFROWNVSnJhY29tQnZKZnRFUktMR0NVbzlkRGwraW1D?=
 =?utf-8?B?VmVvNnppcjlSM3k0d0N6RCtJb0tMb2JiK3ZqSTc4RllMUFl3T0kvc1lVdzFi?=
 =?utf-8?B?WSszNTRxYkR4RnlTUlJZRFA3TjF6YWtwOS9uemNFV2d3YVpRbFF5YVpwZTNo?=
 =?utf-8?B?Um1YTDhQUk1kaGVscHdHZGNuV1V3NnEwTUFoN2N1bG5idFBzcitBeTVNTFVE?=
 =?utf-8?B?LzlVS1orRnpFZUszV2FqTlhML0ZWayt3TFg2ZFgwZ28wVlQ3cXFCOVJGTTMy?=
 =?utf-8?B?OGVEWmlzOUVVVTk3QUZUZlU4cTRiQk53WTNLYkNQT1Rhd1dLZDkzMlBjR1Ra?=
 =?utf-8?B?MXhTRDVaY3JnNnU1aTRQZzhpRTFETkUrQ0hhV3MzRnZrTmcrMnVmUGJDemw4?=
 =?utf-8?B?Q3hMV01wV2hjOWw2dzBIU2VxeDlXcTMrWlVyZXFvS3pqSFY0K3ZUTjc2d01V?=
 =?utf-8?B?enB6cW9TQ2hNTnk3M3JuVThlMzVZUDNCNkdVcDgrZmZoZHQ2ZEdaOEl2VWx1?=
 =?utf-8?B?NXlYOHFLem94bWRRNURueWhaWXRkVWRqeFRYcmhFLytPVVVUOWxOS2JGWjZp?=
 =?utf-8?B?VDd3ZUwxd1BjVmc4d3B2TEhSWmNXamUvMC9YNUFqVGpEa2FLclozeEVCek9U?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f489ba-56b7-4a8c-4866-08dc909ce855
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 20:17:56.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2QPNtucARchZKZ4+FNpKpLRAdBIb2NlbVNbwQDtvKm7UituXcIIcKJ5QFV7joH0IwJP2Bdo4xwhoUfGUh5EDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
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

See my comments below.

Regards,
Zhanjun

On 2024-06-13 7:26 p.m., Teres Alexis, Alan Previn wrote:
> alan: Hi there Zhanjun, as per offline conversation, i was surprised to
> see you squash the "Guc-error-capture-extraction" together with the
> "Plumb GuC-capture into dev coredump" patch but now realize i made a
> regrettable typo in my rev8 review comments - when i mentioned about
> posisbly squashing pre-allocate-nodes with node-extraction i said
> "patch 4 and patch 6" but what i meant was "patch 4 and patch 5".
> I'm terribly sorry about this mistake. Since we know that you
> have to redo this patch anyways based on offline conversation to
> resolve race between drm-tdr vs guc-context-reset, thanks for agreeing
> to keep extraction separate again. And ofc we don't need pre-allocating
> of nodes now.
will put patch 4 back
> 
> On Thu, 2024-06-06 at 17:07 -0700, Zhanjun Dong wrote:
>> Upon the G2H Notify-Err-Capture event, parse through the
>> GuC Log Buffer (error-capture-subregion) and generate one or
>> more capture-nodes. A single node represents a single "engine-
>> instance-capture-dump" and contains at least 3 register lists:
>> global, engine-class and engine-instance. An internal link
>> list is maintained to store one or more nodes.
>> Because the link-list node generation happen before the call
>> to devcoredump, duplicate global and engine-class register
>> lists for each engine-instance register dump if we find
>> dependent-engine resets in a engine-capture-group.
>> When xe_devcoredump calls into snapshot_from_capture_engine,

...

>> +
>> +static inline u16 xe_engine_class_to_guc_capture_class(enum
>> xe_engine_class class)
>> +{
>> +       return
>> xe_guc_class_to_capture_class(xe_guc_class_to_capture_class(class));
>> +}
>> +
>>   static inline struct xe_gt *guc_to_gt(struct xe_guc *guc)
>>   {
>>          return container_of(guc, struct xe_gt, uc.guc);
>>
> 
> alan:snip.
> 
>> +static void
>> +__guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>> +{
>> +       struct __guc_capture_parsed_output *node = NULL;
>> +       int i;
>> +
>> +       for (i = 0; i < PREALLOC_NODES_MAX_COUNT; ++i) {
>> +               node = guc_capture_alloc_one_node(guc);
>> +               if (!node) {
>> +                       xe_gt_warn(guc_to_gt(guc), "Register capture
>> pre-alloc-cache failure\n");
>> +                       /* dont free the priors, use what we got and
>> cleanup at shutdown */
>> +                       return;
>> +               }
>> +               guc_capture_add_node_to_cachelist(guc->capture,
>> node);
>> +       }
>> +}
>> +
> btw, why are we still using this pre-allocated-nodes framework and
> functions? i thought we decided we didn't need it for the case of Xe?
> (since we'll serialize the extraction-flow vs any reset-flow vs the
> devcoredump-printing  by putting them on the same workqueue). In that
> case we can remove the prealocated nodes' cachelist extraction code
> requiring new ndes can dynamically by calling
> guc_capture_alloc_one_node directly
Current code is still using the pre-alloced node, I will try dynamic 
alloc later. Another concern is the GFP_ATOMIC may alloc from emergency 
pools, it might not be the better choice for debug purposed feature like 
this.

> 
> alan:snip. same comment above for below hnk.
>> +static void
>> +guc_capture_create_prealloc_nodes(struct xe_guc *guc)
>> +{
>> +       /* skip if we've already done the pre-alloc */
>

...

>>   /**
>>    * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW
>> Engine.
>>    * @hwe: Xe HW Engine.
>> @@ -839,8 +899,12 @@ struct xe_hw_engine_snapshot *
>>   xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>>   {
>>          struct xe_hw_engine_snapshot *snapshot;
>> +       struct xe_gt *gt = hwe->gt;
>> +       struct xe_device *xe = gt_to_xe(gt);
>> +       struct xe_guc *guc = &gt->uc.guc;
>>
> alan:snip
> 
>> +       /* Check GuC settings, job is set and capture outlist not
>> empty,
>> +        * otherwise take it from engine
>> +        */
>> +       if (xe_device_uc_enabled(xe) && xe->wedged.mode >= 1 &&
>> +           !list_empty(&guc->capture->outlist) && xe-
>>> devcoredump.job)
>> +               xe_hw_engine_find_and_copy_guc_capture_snapshot(hwe,
>> snapshot);
>> +       else
>> +               xe_hw_engine_snapshot_from_hw(hwe, snapshot);
> 
> alan: in the above if-else check, we are assuming that guc's capture
> list not being empty means we have the captured node for this
> devcoredump triger... however, in larger scale platforms we could have
> multiple captured nodes from multiple engines so we should not
> be relying on just whether its empty or not, rather the check should
> call guc capture to find matching node based on lrc, guc-id, engnine
> etc (i.e. basically call
> xe_hw_engine_find_and_copy_guc_capture_snapshot directly to see if we
> have a dump.)
Good point, I will add the capture ready for job functions in next rev.

> 
> alan:snip.
> 
> I'll review the rest of this patch after rev9 is out since there are
> other changes incoming as per my first review comments on top.
