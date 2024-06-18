Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1536BC27C4F
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jun 2024 23:47:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA80810E15C;
	Tue, 18 Jun 2024 23:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfyPmT81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35B410E15C
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jun 2024 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718754432; x=1750290432;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wUOnUOlktnU8dkCDZ0kH5doX1slRrwjkj9ILabHFatw=;
 b=mfyPmT81tX4S8bA2SvdL5W4BMOGnjVLYUnc4+1wInj7yvf/I6XgM7wx4
 /Q0oTTmUVLtgph7V0lfsFTWpezRM8PzEHTJ9XXdpREgKW1rV7dmBB3GTm
 NYBTnXhtRYI7i9ck5VnlLgUZDsz8EzE+UhYnLbpMOHxq/nSPI5Q9Cw2gq
 HrOZmLi4D/ZNnDaVTr+HdWDEHZPJym6VEUn2iVfhQZ7Y8o532KCBjt9vm
 C1hrwJA9l8CTG9X0KcYM4s2OyyD7KPLhuvbqG+ve/AMIV0k8im0Se6I5Y
 lh2RMLbcyQSIi7zMej8IwsQxDikeLZPxBubA1lzAOBghkfiG50Nxionuy g==;
X-CSE-ConnectionGUID: OkJX+BtIRqW2DTGRx4M2Zg==
X-CSE-MsgGUID: Gzn33qsLTXKCp9MVZaoZkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="12139615"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="12139615"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2024 16:47:11 -0700
X-CSE-ConnectionGUID: AihUuWR5QQ+RtL8tNb6vXg==
X-CSE-MsgGUID: a1KrxR8LTFaeKqLy4GgnOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41690841"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jun 2024 16:47:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 16:47:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 18 Jun 2024 16:47:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 18 Jun 2024 16:47:10 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Jun 2024 16:47:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XpAuq2KT6NveCXQLafo20ssMLQoMinKi3DUxwwsZ8NFLijHeTYnkTSE2cdd87k9BppeCw/6QEaQhWZZn1LOIZ7QCfTyCSY5bwkhEHytrlC/iH8Gr8wWzJS6B0sKqLqfsCBq+V6LvyuOb7xi7lFVf8b4WnmQ1CzkBcp1DNHm/6gpq9Fzv998ixRhaom9/vyIMI/+WpxYU4dowpSB/YtjMDRD3D08IQ3X6SAdx6Y1Ks78P+mQyczRPRxt5cFTLvsM2KuvzDjhjy9+q9S0UyD4AXf9ql8ofPjigJEiPh/XjkXfjhNoubmHNJi/GY9GWrBt9k+M0M7iqofOtny7JmE4s4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IIeKlmfQJi7cvpWZVwHZCRGbPw4P1cnS+epn82kA/Q=;
 b=RRAQJ+PS+xBoCWCV6znzKj36XwhWFLuXpRM8uW4I+shUEfeNiAZNklN/9anboHd7r7IjPuH4WXHh2KaTpNpTRGNTdEerHqvj2lkOkxZ22J3RADYmslitugh2yRqnd5AbsN+9YnAk49HOVDECNSoL7x+Iu6N6hI0IMg6J1BMxpRbvdBxDswsQJrzT5a8MJYuWXtqihVJJZeFT1qzR8zEdu1VztWUTuUfT3WWx3RLTzWs4suJNa8vDwDt4b5NhtTzcnd2w7To9RE74Goj2wRp0vsd2gEoi1rba/vviz4gGQt9MbOQ3SrgQCPvU0T79bgXvlGEZagrrEnM89nYbXVs4Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by IA1PR11MB6121.namprd11.prod.outlook.com (2603:10b6:208:3ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Tue, 18 Jun
 2024 23:47:05 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 23:47:05 +0000
Message-ID: <7f44a141-2a00-4b61-ab32-28fe5940a82b@intel.com>
Date: Tue, 18 Jun 2024 16:47:03 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/lnl: Apply Wa_22019338487
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240617081051.3340442-1-vinay.belgaumkar@intel.com>
 <20240617081051.3340442-2-vinay.belgaumkar@intel.com>
 <729c1f1e-9e4e-480c-97ac-1c686afab8bd@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <729c1f1e-9e4e-480c-97ac-1c686afab8bd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0018.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::31) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|IA1PR11MB6121:EE_
X-MS-Office365-Filtering-Correlation-Id: a5fe55b3-653f-45b7-6c3f-08dc8ff0f58b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dENaZlBLb1h3TFBrb2tsTmpzU2R6MnhrMXhsaHgzdEhJMHg4dnh3RXFDK2NL?=
 =?utf-8?B?WmVjNXBrNC9pTzJKdkxLU2hYOHI1WWZscEtYYncrMWxiS3c1NG1iZEhHUU9J?=
 =?utf-8?B?M0h3a2tsMmZKQitxdnVNc0lsNXRtOXZFZ2ZHWDlWT29hakI1UXVYVERwaFUx?=
 =?utf-8?B?RlBJam1ZSnY0amFMeWRCbUdrd0Evbkt6K2tGQ3RJeVBxTnJhb2FncG5JQTFi?=
 =?utf-8?B?WE5JckF1MkJlb1JMaEQ4NXo3Y0lVbXRlL2pPMER5eUNydTg1VzZqRnphWk1P?=
 =?utf-8?B?Z0Zid1pDQ1VOK3NsVEhUZDZVN1o0dS9oclE5VVZabzNzdnFXTnBHTkJ2V0gv?=
 =?utf-8?B?TE12cDlpT1pvZEEzV3d3cVdZUjhuMDFBdmxhaWZneFE1UGNhY0JERlJ3d0Vo?=
 =?utf-8?B?TzV6eHlBZ0JmUGVJeGVoVXZqSnlMaDNDZHQ0clRaOWdHeFZwOUdNa0VIYUdy?=
 =?utf-8?B?OEgrbXVUK1hZcXZzWk5YdnBCeU1BVGh3cVBlQms5YWdBWlZDbExkMGpDZDR4?=
 =?utf-8?B?aW1STTNwazM1NjlwYlBZZXRLNVhhVDU3Szk2NzVVL0FIcHhXcW42TDdQNElB?=
 =?utf-8?B?TnAvR3ZFQ1lERFIvZ2gyU0VETkkyWEs1MDZnNDAySkkwbXZIaXZqYVBmQXlB?=
 =?utf-8?B?ekQrVGUxTVFTMzBQUXZwK1B3THVhT3pVSXRxTWtXV25iK3JmSW5oa05hVnpW?=
 =?utf-8?B?MTFVaDRlNm1HSDFVbjlJNGc3ZzlBdERGWTBhY01wcWtad2x2VzJ2ejQxN0w5?=
 =?utf-8?B?NnVQNE5iRXFEQVU5bEFwOWVWUnErWU41cUdqTi9KS2NNbG5zc2FKVk54enlv?=
 =?utf-8?B?SFZBVVZGZ3B2aHlydXFzbkVRNmpDSnJUb0JMb1NQUVdUaGFIZnZ3NDNBdlN6?=
 =?utf-8?B?VGVOcXJaR3krZUxlOW11RGpHVDRHcHNnc3YvbExOSFd6SVdvZHU2WWNVZDd3?=
 =?utf-8?B?Umh5aXMzQU5SR3JyNHZia1lSOStGRkhXbDduNmJmUlB0elc2OEF6Ly9MSlkw?=
 =?utf-8?B?clJRdkREcFJld0lCSjlZd3VhQjRnN0pHQVFGc1BUejF3aU43V2hhcEhIZUNO?=
 =?utf-8?B?Zm5nTHpVMHArQXRzb3hnM3c3d1ZxV1RqUzlYSkFZVVV3MTN0QTRjTDZxVHBw?=
 =?utf-8?B?QXIvUG1KdmE5S0dWQ0tNM2hUMmlSWnVDUWRWVk8zQzhRQkZjVXRLdlVCcXJT?=
 =?utf-8?B?RmRoY2g1Nk41Vk9vczMwT09HUURaTXhuZm1ZNzJmcW9WTWVnS05qbXFXT0da?=
 =?utf-8?B?b2t4L3QvL1Q2OXV0U3pIMjZZUDU5ckRjWkYvNnBraSt4K3ZPRUJXQUFTeUxL?=
 =?utf-8?B?dFB1OUxxd1ZmWjAxTDVwMzI3bXdaL0VUR2xQS21YMFkyMFA3WDZ3MnBjWC9C?=
 =?utf-8?B?RFozM3I5K09WUXFrWktSd0tyM292eTU5K0Y3NFFoditRMmdJN0RaRUF4OFFm?=
 =?utf-8?B?QnhEek5PUVlUaE1kamxQai83V1VlUE1yOWxxMXRKWVZVZU5udUdwY3MyazY3?=
 =?utf-8?B?MXNXS0hnb2Y3bWNpZ3phZXdMeE9sYU5DcG9QWFhDcWNyNGNZUC9qbWgyWXh3?=
 =?utf-8?B?RDVOWkVDN2NvRlJhaENzMTNFbkZqNjNSbkxlMHZRVmxhOHRkcC84U2kzZXVa?=
 =?utf-8?B?NGphKzltOG5zTUVPc1A2aHBwa014ckNBdmYvWWI4Y3RkZUZBeGNNYmlSY1FE?=
 =?utf-8?B?eG83TGZGL2t5N2V1MjhUSlowMUFZRkZMdHZhZnM4YXBsS0grcEtidjdsQjIw?=
 =?utf-8?Q?4+EYj+M4zbrboveRZU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SitWOFJ1MmgvclZSV2xkQi83Ym05dUFqNHlEaDY1dTFNbityTkJkVEVFUk04?=
 =?utf-8?B?SkxiV091Sk9YNGV6NE16ak11VFdVVk0xNzNGZHBvbkw1Z0RhQkRvUWxPa3F4?=
 =?utf-8?B?RzY4eUF5QkVLL1gzZmlaS3Z0aytleEhhaWhBRm1ZdTA3WFRDekZuSFI0VTFv?=
 =?utf-8?B?dU90YkdMYUxWNFM3aitoRWZSSVhPNzBFdjhpWjJ1YVdOM3A4SFpkc01Wbm5I?=
 =?utf-8?B?SnFHd0VmZWVSMVZpTHVwTDExaDkrUVJvNy80UWlHSFljZDRBcmVCUnU5QzlH?=
 =?utf-8?B?Ymd5LzdBTXRYVXZURnFqL3BVcHhISFVXSDVqSWh6TzU4S0dYWWpVb2FwQjl2?=
 =?utf-8?B?VGJvcnNmL2dKb0lIY293QlVuUndRa2xuUGFkWlNrSVBwWFlRWHIrNjZ4OS9T?=
 =?utf-8?B?ZWtaR2tnU1Q5ZEZYTTFOU0x5ejYyeGZsUm5iUjZkZ0RFMzVGZ0pxL1ZyU3ZJ?=
 =?utf-8?B?MzlHZXJwalpXTlVKZ0tjMGxXSURIallIOU0yTm9ZcVBJQTdJNlNJbi9xcC9Y?=
 =?utf-8?B?RTJyS1ZpRjVFZmQ4ejFtK2hYSm9UNStjV1psUER5ZkYvYXFJV2N1NDgyZDlW?=
 =?utf-8?B?b1hEdU9EdmkzOGhaaEo4NW9jTFhnUlJYVnNnak9Na2llTU40VnhpMkphOVRv?=
 =?utf-8?B?eXUrOHBBVXFIT24rbkJZRXA0cXhKZU10d1lHMnVPVEFvaERTZERBa2lZblFr?=
 =?utf-8?B?L3BvOXlTWHZvUDR6M1VVTVpKQ3AzOFN2UTRqSmlIdzd3M0V3b3Q2eEZDM3JQ?=
 =?utf-8?B?UzN4Z0M3MXY2aHdGQjh0M1JNaEZpdVZoY0NNSEZaZHByRDAzbEtQaWdySCts?=
 =?utf-8?B?WnRtSWxtUmtmemV1YzFNUkpuK1kweVB3WkYxV3ZTdVFOcUh1ZGxHYTNNcWdH?=
 =?utf-8?B?VzZhZVFiTFVKMUpkOXlVVlAxYVh6VENLeEpoUWJzd0puVVh2bFl4UjBGYVNs?=
 =?utf-8?B?TzJMVGhkSmVKb3RGVHlRNzBRNEpCTTl3Y3E1Sy9vRy81dGwrTGgrUG1qRyth?=
 =?utf-8?B?TU9QR1JlOEVaWkJIY01pNzlZWE9Ec0NvVXlsSnFtaVBsZGxId2N3dGgyRXpj?=
 =?utf-8?B?Mk9ndHl6YzZsT3NJY2MxNFN6N3FLK20rL1p3a21sRkx4RGpkLytPd1RhcGJR?=
 =?utf-8?B?NDNkM21qaWxsTHlrbnBwdnYrY1RvM1pqdFhtWFZWSFc5VXl5THRqM3lMcDF1?=
 =?utf-8?B?WXJLalNlZ2tsdVJYR3FWMlEvY1VVd2JYNWJoRXQzTzF6WWptb1p5VWJTckFW?=
 =?utf-8?B?U1BTUGZONzl2UjcrSjJTSHhDMGNIK0hEbmNpUkVxNHNoN1ZLYzY0dTRvdUFE?=
 =?utf-8?B?dVBrWFBwai8vOVNnMEtPTEJQTXF2YndTc1diaFhpSDlrNllIbmdiLzB1TkR3?=
 =?utf-8?B?U1BkcHJ4RGRTWVpNUmY0ZUM2Tm1ma0s2ejBRUkFRSXpnZkRWY0tWQTJYNjhJ?=
 =?utf-8?B?NEpWczBBWkhCbnlzVHQvbUpmcWliVmpUbStMS0ZWZHlGeVFQVUVNYzdpbjZI?=
 =?utf-8?B?clNtcGtaelN3WURmQWwxWWFyZHdLeStNSy9SeS9GM0tSNEs5YnNuVjJMWVlu?=
 =?utf-8?B?QnhuZ2x1N2ZreVA1SktpMWZJTHNBVGJTcEwwZldhRms2VlJYdlhJU3pXWUZH?=
 =?utf-8?B?dXN2RC9SWDJxZGpvTndPQnQ2Vk1Pd0IwMUVLN29sZFR0VHFjQ0pXTjNOKzJj?=
 =?utf-8?B?Zzc3TWUzZ1FLSUdqUHBlRWMwL25nSmc3OURPbElOQytHcHM5THVZSkdrZTBP?=
 =?utf-8?B?K3U5cUgxa3d1YTJvVHVUZmpESFJGU1hQWG94bUdPRGM1Uy9PYTFuNzZrWW1O?=
 =?utf-8?B?eGRkWUF4UnJGZFJ2enJwUUVtZjNZZkNBelA3YllwcCtCZFRETE90dmJnMm55?=
 =?utf-8?B?OGI0OUxvaXE4Z21HcTdkZG9KY29tT0JMWVJyNk45N2pOSFhrTEt1bnkwckds?=
 =?utf-8?B?WXpYay9hNFBOVWVtc0NZcEZYUVlaSmJZL2duK2FLcGtoQjNVa2hTckJDREtN?=
 =?utf-8?B?NHpHbzh6UUpKQmRVLzY4dVZhd0gyQkd4Uld3c1RXdEhlNmtQV2VPMGFhR2VY?=
 =?utf-8?B?ei9DKzlSakprU0swMHNFZkpyMU5qQXJXdWVSejZHakZJaTJ5ckdodEZIQWVX?=
 =?utf-8?B?eXd5VG5WNDhMVTdtK3pxOTZXQkptTkZsVWFneWR4NnBjaHVNZjNhQWhJZ3FT?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5fe55b3-653f-45b7-6c3f-08dc8ff0f58b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 23:47:05.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IV1Pln/RPG6uxOUp0bJfMXXnQpPKtlllpeVFmpUOWcVEFR04tSQ3ceVFZooioA98Yv+M+up0BScozV4p8xrv7e57hzmCtZPb+gB096iHMsc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6121
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


On 6/17/2024 12:48 PM, Michal Wajdeczko wrote:
>
> On 17.06.2024 10:10, Vinay Belgaumkar wrote:
>> This WA requires us to limit media GT frequency requests to a certain
>> cap value during driver load. Freq limits are restored after load
>> completes, so perf will not be affected during normal operations.
>>
>> During normal driver operation, this WA requires dummy writes to media
>> offset 0x380D8C after every ~63 GGTT writes. This will ensure completion
>> of the LMEM writes originating from Gunit.
>>
>> During driver unload(before FLR), the WA requires that we set requested
>> frequency to the cap value again.
>>
>> v3: Do not use WA number in function name. Call WA wrapper from xe_device.
>> Rename some variables, check for locks in the correct function (Rodrigo).
>> Ensure reset path is also covered for this WA.
>>
>> v4: Fix BAT failure
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |  2 +
>>   drivers/gpu/drm/xe/xe_device.c       |  3 ++
>>   drivers/gpu/drm/xe/xe_ggtt.c         | 22 +++++++++
>>   drivers/gpu/drm/xe/xe_ggtt_types.h   |  2 +
>>   drivers/gpu/drm/xe/xe_gsc.c          |  5 ++
>>   drivers/gpu/drm/xe/xe_gt.c           | 24 ++++++++++
>>   drivers/gpu/drm/xe/xe_gt.h           |  1 +
>>   drivers/gpu/drm/xe/xe_guc_pc.c       | 71 +++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_guc_pc.h       |  2 +
>>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  4 ++
>>   drivers/gpu/drm/xe/xe_wa_oob.rules   |  1 +
>>   11 files changed, 136 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 1905a80e61e3..8c72fe38edfd 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -24,9 +24,11 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>>   	$(call cmd,wa_oob)
>>   
>>   uses_generated_oob := \
>> +	$(obj)/xe_ggtt.o \
>>   	$(obj)/xe_gsc.o \
>>   	$(obj)/xe_guc.o \
>>   	$(obj)/xe_guc_ads.o \
>> +	$(obj)/xe_guc_pc.o \
>>   	$(obj)/xe_migrate.o \
>>   	$(obj)/xe_ring_ops.o \
>>   	$(obj)/xe_vm.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 94dbfe5cf19c..fee90f66246f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -668,6 +668,9 @@ int xe_device_probe(struct xe_device *xe)
>>   
>>   	xe_hwmon_register(xe);
>>   
>> +	for_each_gt(gt, xe, id)
>> +		xe_gt_sanitize_freq(gt);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>> index 8ff91fd1b7c8..e3fddd59fd9f 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> @@ -11,6 +11,7 @@
>>   #include <drm/drm_drv.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "regs/xe_gt_regs.h"
>>   #include "regs/xe_gtt_defs.h"
>> @@ -23,8 +24,10 @@
>>   #include "xe_gt_sriov_vf.h"
>>   #include "xe_gt_tlb_invalidation.h"
>>   #include "xe_map.h"
>> +#include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_sriov.h"
>> +#include "xe_wa.h"
>>   #include "xe_wopcm.h"
>>   
>>   static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>> @@ -69,12 +72,31 @@ static unsigned int probe_gsm_size(struct pci_dev *pdev)
>>   	return ggms ? SZ_1M << ggms : 0;
>>   }
>>   
>> +static void ggtt_update_access_counter(struct xe_ggtt *ggtt)
>> +{
>> +	/*
>> +	 * 22019338487: GMD_ID is a RO register, a dummy write forces gunit
>> +	 * to wait for completion of prior GTT writes before letting this through.
>> +	 */
>> +	lockdep_assert_held(&ggtt->lock);
>> +
>> +	++ggtt->access_count;
>> +
>> +	if (ggtt->tile->media_gt && XE_WA(ggtt->tile->media_gt, 22019338487)) {
>> +		if ((ggtt->access_count % 63) == 0) {
>> +			xe_mmio_write32(ggtt->tile->media_gt, GMD_ID, 0x0);
>> +			ggtt->access_count = 0;
>> +		}
>> +	}
>> +}
>> +
>>   void xe_ggtt_set_pte(struct xe_ggtt *ggtt, u64 addr, u64 pte)
>>   {
>>   	xe_tile_assert(ggtt->tile, !(addr & XE_PTE_MASK));
>>   	xe_tile_assert(ggtt->tile, addr < ggtt->size);
>>   
>>   	writeq(pte, &ggtt->gsm[addr >> XE_PTE_SHIFT]);
>> +	ggtt_update_access_counter(ggtt);
> this doesn't seem a perfect solution as now it augments the generic
> function used by all platforms with unnecessary logic (that triggers
> extra step just for specific WA)
>
> maybe it's time to extend struct xe_ggtt_pt_ops with:
>
> 	void (*pte_write)(struct xe_ggtt *, u64, u64);
>
> and setup that ops only where applicable:
>
> static const struct xe_ggtt_pt_ops ops_wa = {
> 	.pte_encode_bo = ...,
> 	.pte_write = set_and_track_pte,
> };
>
> 	if (XE_WA(gt, 22019338487))
> 		ggtt->ops = ops_wa;
> 	else
> 		ggtt->ops = ...;
> 	
ok.
>
>>   }
>>   
>>   static void xe_ggtt_clear(struct xe_ggtt *ggtt, u64 start, u64 size)
>> diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> index d8c584d9a8c3..73fe6837b9cd 100644
>> --- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>> @@ -34,6 +34,8 @@ struct xe_ggtt {
>>   	const struct xe_ggtt_pt_ops *pt_ops;
>>   
>>   	struct drm_mm mm;
>> +
>> +	unsigned int access_count;
> missing kernel-doc
ok. None of the fields seem to have it, for another day, I guess.
>
>>   };
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>> index 80a61934decc..f8239a13fa2b 100644
>> --- a/drivers/gpu/drm/xe/xe_gsc.c
>> +++ b/drivers/gpu/drm/xe/xe_gsc.c
>> @@ -22,6 +22,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>>   #include "xe_gt_printk.h"
>> +#include "xe_guc_pc.h"
>>   #include "xe_huc.h"
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>> @@ -284,6 +285,10 @@ static int gsc_upload_and_init(struct xe_gsc *gsc)
>>   		return ret;
>>   
>>   	xe_uc_fw_change_status(&gsc->fw, XE_UC_FIRMWARE_TRANSFERRED);
>> +
>> +	/* GSC load is done, restore expected GT frequencies */
>> +	xe_gt_sanitize_freq(gt);
>> +
>>   	xe_gt_dbg(gt, "GSC FW async load completed\n");
>>   
>>   	/* HuC auth failure is not fatal */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 57d84751e160..301594d1e7a4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -9,6 +9,7 @@
>>   
>>   #include <drm/drm_managed.h>
>>   #include <drm/xe_drm.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "instructions/xe_gfxpipe_commands.h"
>>   #include "instructions/xe_mi_commands.h"
>> @@ -54,6 +55,7 @@
>>   #include "xe_sriov.h"
>>   #include "xe_tuning.h"
>>   #include "xe_uc.h"
>> +#include "xe_uc_fw.h"
>>   #include "xe_vm.h"
>>   #include "xe_wa.h"
>>   #include "xe_wopcm.h"
>> @@ -678,6 +680,9 @@ static int do_gt_restart(struct xe_gt *gt)
>>   	/* Get CCS mode in sync between sw/hw */
>>   	xe_gt_apply_ccs_mode(gt);
>>   
>> +	/* Restore GT freq to expected values */
>> +	xe_gt_sanitize_freq(gt);
>> +
>>   	return 0;
>>   }
>>   
>> @@ -801,6 +806,25 @@ int xe_gt_suspend(struct xe_gt *gt)
>>   	return err;
>>   }
>>   
>> +/**
>> + * xe_gt_sanitize_freq() - Restore saved freuencies if necessary.
> typo
ok.
>
>> + * @gt: the GT object
>> + *
>> + * Called after driver init/GSC load completes to restore GT frequencies if we
>> + * limited them for any WAs.
>> + */
>> +int xe_gt_sanitize_freq(struct xe_gt *gt)
>> +{
>> +	int ret = 0;
>> +
>> +	if ((!xe_uc_fw_is_available(&gt->uc.gsc.fw) ||
>> +	    xe_uc_fw_is_loaded(&gt->uc.gsc.fw)) &&
>> +	    XE_WA(gt, 22019338487))
>> +		ret = xe_guc_pc_restore_stashed_freq(&gt->uc.guc.pc);
>> +
>> +	return ret;
>> +}
>> +
>>   int xe_gt_resume(struct xe_gt *gt)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> index 9073ac68a777..1123fdfc4ebc 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.h
>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>> @@ -56,6 +56,7 @@ int xe_gt_suspend(struct xe_gt *gt);
>>   int xe_gt_resume(struct xe_gt *gt);
>>   void xe_gt_reset_async(struct xe_gt *gt);
>>   void xe_gt_sanitize(struct xe_gt *gt);
>> +int xe_gt_sanitize_freq(struct xe_gt *gt);
>>   void xe_gt_remove(struct xe_gt *gt);
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index 666a37106bc5..d9194328b495 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/delay.h>
>>   
>>   #include <drm/drm_managed.h>
>> +#include <generated/xe_wa_oob.h>
>>   
>>   #include "abi/guc_actions_slpc_abi.h"
>>   #include "regs/xe_gt_regs.h"
>> @@ -24,6 +25,7 @@
>>   #include "xe_map.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode.h"
>> +#include "xe_wa.h"
>>   
>>   #define MCHBAR_MIRROR_BASE_SNB	0x140000
>>   
>> @@ -41,6 +43,8 @@
>>   #define GT_FREQUENCY_MULTIPLIER	50
>>   #define GT_FREQUENCY_SCALER	3
>>   
>> +#define LNL_MERT_FREQ_CAP	800
>> +
>>   /**
>>    * DOC: GuC Power Conservation (PC)
>>    *
>> @@ -673,6 +677,16 @@ static void pc_init_fused_rp_values(struct xe_guc_pc *pc)
>>   		tgl_init_fused_rp_values(pc);
>>   }
>>   
>> +static u32 pc_max_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	if (XE_WA(gt, 22019338487))
>> +		return min(LNL_MERT_FREQ_CAP, pc->rp0_freq);
>> +	else
>> +		return pc->rp0_freq;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_init_early - Initialize RPx values and request a higher GT
>>    * frequency to allow faster GuC load times
>> @@ -684,7 +698,7 @@ void xe_guc_pc_init_early(struct xe_guc_pc *pc)
>>   
>>   	xe_force_wake_assert_held(gt_to_fw(gt), XE_FW_GT);
>>   	pc_init_fused_rp_values(pc);
>> -	pc_set_cur_freq(pc, pc->rp0_freq);
>> +	pc_set_cur_freq(pc, pc_max_freq_cap(pc));
>>   }
>>   
>>   static int pc_adjust_freq_bounds(struct xe_guc_pc *pc)
>> @@ -740,6 +754,53 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>   	return ret;
>>   }
>>   
>> +static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
>> +		/*
>> +		 * Get updated min/max and stash them.
>> +		 */
>> +		ret = xe_guc_pc_get_min_freq(pc, &pc->stashed_min_freq);
>> +		if (!ret)
>> +			ret = xe_guc_pc_get_max_freq(pc, &pc->stashed_max_freq);
>> +		if (ret)
>> +			return ret;
>> +
>> +		/*
>> +		 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>> +		 */
>> +		mutex_lock(&pc->freq_lock);
>> +		ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
>> +		if (!ret)
>> +			ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>> +		mutex_unlock(&pc->freq_lock);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_guc_pc_restore_stashed_freq - Set min/max back to stashed values
>> + * @pc: The GuC PC
>> + *
>> + * Returns: 0 on success,
>> + *          error code on failure
>> + */
>> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>> +{
>> +	int ret = 0;
>> +
>> +	mutex_lock(&pc->freq_lock);
>> +	ret = pc_set_max_freq(pc, pc->stashed_max_freq);
>> +	if (!ret)
>> +		ret = pc_set_min_freq(pc, pc->stashed_min_freq);
>> +	mutex_unlock(&pc->freq_lock);
>> +
>> +	return ret;
>> +}
>> +
>>   /**
>>    * xe_guc_pc_gucrc_disable - Disable GuC RC
>>    * @pc: Xe_GuC_PC instance
>> @@ -854,6 +915,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>>   	if (ret)
>>   		goto out;
>>   
>> +	ret = pc_set_mert_freq_cap(pc);
>> +	if (ret)
>> +		goto out;
>> +
>>   	if (xe->info.platform == XE_PVC) {
>>   		xe_guc_pc_gucrc_disable(pc);
>>   		ret = 0;
>> @@ -902,6 +967,10 @@ static void xe_guc_pc_fini_hw(void *arg)
>>   	XE_WARN_ON(xe_force_wake_get(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL));
>>   	XE_WARN_ON(xe_guc_pc_gucrc_disable(pc));
>>   	XE_WARN_ON(xe_guc_pc_stop(pc));
>> +
>> +	/* Bind requested freq to mert_freq_cap before unload */
>> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
>> +
>>   	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), XE_FORCEWAKE_ALL);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 532cac985a6d..7ba875c3613b 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include <linux/types.h>
>>   
>> +struct xe_device;
> why this ?

removed.

Thanks,

Vinay.

>
>>   struct xe_guc_pc;
>>   
>>   int xe_guc_pc_init(struct xe_guc_pc *pc);
>> @@ -29,5 +30,6 @@ enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
>>   u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>   void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>> +int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>>   
>>   #endif /* _XE_GUC_PC_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 2afd0dbc3542..13810be015db 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -25,6 +25,10 @@ struct xe_guc_pc {
>>   	u32 user_requested_min;
>>   	/** @user_requested_max: Stash the maximum requested freq by user */
>>   	u32 user_requested_max;
>> +	/** @stashed_min_freq: Stash the current minimum freq */
>> +	u32 stashed_min_freq;
>> +	/** @stashed_max_freq: Stash the current maximum freq */
>> +	u32 stashed_max_freq;
>>   	/** @freq_lock: Let's protect the frequencies */
>>   	struct mutex freq_lock;
>>   	/** @freq_ready: Only handle freq changes, if they are really ready */
>> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> index 12fe88796a49..a6b897030fde 100644
>> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>> @@ -27,3 +27,4 @@
>>   16022287689	GRAPHICS_VERSION(2001)
>>   		GRAPHICS_VERSION(2004)
>>   13011645652	GRAPHICS_VERSION(2004)
>> +22019338487	MEDIA_VERSION(2000)
