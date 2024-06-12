Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317B8C27C77
	for <intel-xe@archiver.kernel.org>; Wed, 12 Jun 2024 13:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 291AE10E193;
	Wed, 12 Jun 2024 13:47:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VMSMvGE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6344A10E1E4
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Jun 2024 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718200058; x=1749736058;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b/igAV+/llKdSoRjdj10/j4yN9sPpeAx4FpWj1jc70g=;
 b=VMSMvGE0H3/YeQdPuR1CWZ5wOgKVBB9Cn7uuahomHLhoSrTNR7C5S6yb
 BVi2Jv/TLLiGHkmXBvKq9KmyHOnXnBRJs57DapDx1z5Jl9iIw2Oo+Xdc/
 jHJB3PDiSKQjDnZ5f3+W+wzMddhLUY4mlBKuOZXOkkCcAvx2RYmvL/TNU
 tioglHpr8+tNEl1zUp/03Y9XV9N/95hs2aRlyG5Z8CSjNbB61gfabwSxV
 +HviNEgS1XsY7fqFCV9+2Y+tW87iHnpbBnAa1XAchZp/4RxeAgCuF3DoV
 w8yH8JFQZLp+fRc6uIVlP20oDiXmxNoAgdLLfb55aWNYlMlMGQ/8ksEYy w==;
X-CSE-ConnectionGUID: HlOls5ApSgO/HZKLtMpcEw==
X-CSE-MsgGUID: N6/YDzT5QG6lUZ/XZ3gqZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15116323"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="15116323"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 06:47:37 -0700
X-CSE-ConnectionGUID: x3c9hykCRZKMJTQ0goyCJQ==
X-CSE-MsgGUID: kuN57jD3Sgez2l+OikcMXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="77247714"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 06:47:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 06:47:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 06:47:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 06:47:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFLBMlgMCM7zQJRZmPj5Hl1PYD7H73SQI3DqZ1thlOpIYB7/Vz5CeeiNBCeYUzWWzsmt2Tb7Lp4VdoEGcIQjV8WF6geSrTw2zALfO85M3kyG4xxqXdAQMJOFXUL7TvF4+jqHtyZk4m2Ndm+g31nQeB3m9nx6EUhrobWe2lGf+frBoMskz8iyig6nZvDTo6YdhDkRLnvkhjMDn3JZDJs/o4C8/nU/TcwhMctUKedZsZqCvizRmMRHUt3aL6GkwjAGoDpAi7kUgK5GWqysynz+cUlu0wFir51gFOwiAX2pH9N4KpOeb1GPtvPNLjGzpt1nEBeLVCYv9fi825bE0UkDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WTObkc5vRQlorxNDjeIjjHuptBIjwJqvrf+UizYwO8=;
 b=ngS8yFVEs67dfk1AP+wt7kq/VMJ2J8yroZ6fsNp7ero/WcFNbe+nYAnv7O2hOjiGAfRypU4e/e/zaDbilSMyzL1GkXrmDMsb0RCEAv3OkprS98wciIoKdcMXKNWCWf0S2cEnwDphGixvezztp5cgGvbjpjxzQXXcPX4pGVI9mAbvYMo2syOKW+8IX/QYQh4Xlza7L6L01RUpBWYVwvI6TmSvP55AKkLDU2N7UUA9ilx18PxZDuCAOWXUWYAS/5wA0A+gJjeHJ6sF8pvOJRxDFFKAySSsclTs0fdKJicmano62MNtfBqKXHzB+wH4nQzt524MhEdKOzBnPrqQzObUng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 13:47:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7633.037; Wed, 12 Jun 2024
 13:47:30 +0000
Message-ID: <d7741b98-b750-445f-9f7c-3261c051cce6@intel.com>
Date: Wed, 12 Jun 2024 19:17:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] drm/xe/pmu: Enable PMU interface
To: Matthew Auld <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@intel.com>,
 <rodrigo.vivi@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <krishnaiah.bommu@intel.com>, <ashutosh.dixit@intel.com>
References: <20240612054033.1384369-1-riana.tauro@intel.com>
 <20240612054033.1384369-3-riana.tauro@intel.com>
 <ffc10aa6-97be-4da0-aaf0-630d9e2745a3@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ffc10aa6-97be-4da0-aaf0-630d9e2745a3@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d7c46d-e504-40f8-1d29-08dc8ae63433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230032|376006|366008|1800799016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDR2cXA3dEw1U3NhQ2lCREFsaHNoTVgvNVdsZjhWTFQ3RDNIWEpaSWZCWGNK?=
 =?utf-8?B?MnNDMTg5cHJoNVZBUXkxRTNWTXVsbnN4NjVNWXZROElnSTNDV0VXTUorbGk0?=
 =?utf-8?B?Q0lwVEdhbVd0RGdXT3hXOGh6SXFpZlhYNjdTNVM3bWhMbDFyRnpmQzRINVo4?=
 =?utf-8?B?TzI4Y1NpcmNZZGxVY2I1MGxTTEs2S2dSZkN6NU5MdDFPQWZDdGJiMm0rMzRL?=
 =?utf-8?B?anhIUVhmeFQ0RFpxODdHdXplQWYyS2JGekUwcDhmM25jdWRDd0Jqek5ZNnBv?=
 =?utf-8?B?RkZzRVQ4bjBPektGNFlaOURIVnFoVWdCWTkxdjgyaHY5TU1HcWhmN0s4clZM?=
 =?utf-8?B?T3RYazdmbU5iZSswcWlKUUJtL21GdmhjNVpoT2kvU1hwSWExcnBHSGNZZTJp?=
 =?utf-8?B?OVVZSDAzdWJJOG9CNUFZTGxRa0xnUzVZMzJvdDU0M3VONGs5RjhrNGJMSkhR?=
 =?utf-8?B?cFlvSGx6aWdNM3hMc0JZU0pkNVJTNHhlZ3YyTFhtdFdLL2dSN09xU3RQUXE4?=
 =?utf-8?B?RlEvTkR0VXFXY0lOWTI3SFh3dTFCZ1E1RzJpYjNzZjIyZDFaVjNhWEpqZm9F?=
 =?utf-8?B?U0hoRDAxY1paVjYvbE1SNzg0Uk05UmRleUYvNWs1M1YydytwMnRtSi94cERw?=
 =?utf-8?B?QlMxZXlQa290b3ZTam4rZDRJM3VycmlNbGlGSk9aR0F0alN3VWlsWVM3QUIy?=
 =?utf-8?B?VlUranFRSml4TzkzZWxKR1NZdjNxbWFTenlPY3pmakhlZUNPOXl4TGk0S09x?=
 =?utf-8?B?VUFoaDJnb2w1V3JqMFgzSG1ySFJuR1pHcUdSZlcrRERsc05LUDhKYnZSSHM1?=
 =?utf-8?B?YjB2ZXZyTHM5b201STRtVjV0L0Vhb3hqOTJXeXRINVUyQzgwMGdqWDZyR3FY?=
 =?utf-8?B?TlYrMmhiVTRpMi9GNmRadXJ5UnBmQUlmSGw1TlNSdTJkeVNUNUtLMndwUjlk?=
 =?utf-8?B?ZC9XRktsNEdCaEltZWtyZ0hGS3VKalhUUkdualY5Q3p6aHdZV2lrYkFGaHRZ?=
 =?utf-8?B?amJvYlJIQ0YzNTh5elJJMnRBWndLbUh3bkdPYlNJc0UxUVBraExadEIzNnFY?=
 =?utf-8?B?NDU0WkpBTGczS0plSndVNU4vR3J4Yk92UERrdjdTZ3A4aW9lbmdTZHJVVVRE?=
 =?utf-8?B?WFdFMWViTEQxVjZ5Rk53UjZhN1kwRFYxTHBvVTM5SWd2NmRSL25iNlB4OVIz?=
 =?utf-8?B?dlBwdmR1STZ4WFE5dVpZbzNDK0xJYy9nQkhpWm1ydGMrTWFlK0k1YXlJbyti?=
 =?utf-8?B?MHA3dTRQR3pubVkzZlZ3d2p1R3o3NkFUWjI2M2pzZFF5WVdWZ01hMmZNYVpz?=
 =?utf-8?B?SVBBUjVSVW1TYnBMdnhYby85cGRGZFN4U3BPWXgvd01TcGNRRjNheDFXZ1Nz?=
 =?utf-8?B?QUN1ZlRMNkhvTjk4MEkxNGNzN0FCQzMvVDZscVFwRnBJNGlkWGVSalpRaFg1?=
 =?utf-8?B?REpYeWs3d3RaK2xBZVhRSlhoQW5Ed1VOL0tIR01CWGpvNS94Vmd2L1pTRnpj?=
 =?utf-8?B?NitLL3FyRDk4WVkxcWYrOVhJaFNCMW5oNU0yR3l6SU0wSUhWVmdUNERZK2da?=
 =?utf-8?B?OWw0VDVka2QyL29CTldrTUJlRXVpOWNDTC9CbW9oV3A5a3dTTDQva0cwNVIw?=
 =?utf-8?B?SXdNNjE5UkltSlMwcW1MRE5yZFB5Mk03bGtxSEdKVW5iQ1VwdjhNQU84Sjhv?=
 =?utf-8?B?Q2UxVm9OM3dQN1hUVEdjZ2hkeEE4T3o1UWpQaUozd2wyYkF0anowU21SU2pF?=
 =?utf-8?Q?QO56HXqeY5PnJupmPF4PQNG76sp6SIbs1RWReEN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(376006)(366008)(1800799016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eEtHbHRIeVdwa3hLQVZHd1FidXZNQXI4blhEaVhmUVR6ejkyMExIM1VXU2xk?=
 =?utf-8?B?Q3NnMFk3ckZDVUpZQmVMRUVsVzN4WCtQeWtacmRST3dKUElYYURPeGZxKytM?=
 =?utf-8?B?NnNhdEdlY0RkdFdFYnhwSlM2cTJWc3N4bmUwOW9ZV3dUWS9Kais4UlB3VERh?=
 =?utf-8?B?Z0hmZnlsQ1VFMVlKWE9YNzY4TEFiVzEzZUpYeDBzNWxFa3NqdU4wdXVBSDBL?=
 =?utf-8?B?Sm1XMkpXdGRwV0xsdTM5VE93RVhHekE5RjhNTDd3cHFnTzZKSHQ0anNQY095?=
 =?utf-8?B?ZnhUOHZ4cGVIYTd1NlE1b1pQZVFtZ0MyYnpvQ3lvOGhZM2RnM0FkcmNJMnBx?=
 =?utf-8?B?STUzYm9TSWdvS1ZmK0hYMzQzUzhpdTFpNzJyNUVDcnVJN3cxUmtoeFV6SThH?=
 =?utf-8?B?WWRuVDRRQUNScjN1RXQvQmlQdWp5OWMyVjVaaUVuaGpSWi9IRHorTkxOZjQx?=
 =?utf-8?B?ZUwxUW1NN2JYRWZZQ2d4aWpjc3N2UGhhRGp5UzFQbS9MQVhCRkoxVzlaUHhj?=
 =?utf-8?B?L3ZRWWVIMXkyZ0dkbURpL3RPazNySFBWSlVKZ2pHYVBJeHk2ZTEwMVVXSk5o?=
 =?utf-8?B?aEZhR2N1dENkOCtsdk9kWHNLdVh3bFB2VWFUaHd6THAxZkQ1V3hmTER4TzNq?=
 =?utf-8?B?cUVZV2Jpak5Mdm54d2lmN0EwYnFzcTgwN1NIVzhYUUEzUTBXVXVySXVENExE?=
 =?utf-8?B?aVJCcThMZjZRaXM0eHFuTTl4ei9PZkVpMEpqSThiTDJxT2llalRIa2EyejAx?=
 =?utf-8?B?ZzUra3lxWTViSlN6bS9Hb0E2M3Z0NTV4UWYxZDZWb1RZaElJdGJhYVJiVWxD?=
 =?utf-8?B?UmlESWZ6TjljWkFrRTNza0NvVVdQQ2FKTFl6V2hPK20rbnlGRVZRY0pZZWYv?=
 =?utf-8?B?T05hamVDNTZTSDZEYWdyY3JEZ0JwWTdsYjQzaEw0bGxscUkrckIrUVpoYmFL?=
 =?utf-8?B?SDR3cjJ2U1pkd1FNVHJzNVhJeHVrQWV4L01iNmJ5SFVIMUg4alpjNllPUE95?=
 =?utf-8?B?UitUY3c1NEl1SndsVExLSU5vL1k1cjVrY2VMUEl2NERoMkVObWtJN2s0bGZa?=
 =?utf-8?B?OW5MK3E3UWRicVhzbzZTd0ozOHRSc2x2STFKOXpSbkpqZUVDMDBqcFAvcVZh?=
 =?utf-8?B?Z2c3aXMrMnNnd2JDNk1McGxSS0oyUFVGMFdCL09JQlVxOVVwc0xvdWkyUGty?=
 =?utf-8?B?dFlpeG9ZM1UzTmRkazA5LzhrZmpXVnY1WUQ2d29iRE44b2d4L3JhU1VWZDJo?=
 =?utf-8?B?a3BSNDUrMEo1NTZ2a0ZuR2dyRkFTdEhqRXV1Q1k5TFBCQ3FOZm5SbUtQMzV1?=
 =?utf-8?B?RzhIcEt2ZlJRT3RNVjk5aURVeUp5M1p6NzJXQ2U5K3NJVHdid0NGcWxxVFNn?=
 =?utf-8?B?bFlDWERiZEdGUWxJcG5NZ0xHdElCZWhrMlVDQ1lsUVFJMkUwTEtaaW82ZVhw?=
 =?utf-8?B?eURlVVlnL3hFMGNwN1M0YkV1M081S1dzVzluc0FnYkN1QVhTM0tDVW1DZmU0?=
 =?utf-8?B?WEhqNWptZyt4SGxNQ0E0L0dtOHpiZkswYzJveVdHRnlJWElVWWlrVTFyOVlD?=
 =?utf-8?B?NXZvTXJIRW42Y0tvaXdscVFSRW9lWUxBU0c1RjA4SHBlQzlteTh4Q0FYeXRB?=
 =?utf-8?B?VnlnU2tST2F2bGxjSDFXTVpRZ3FFVmFHZVZrV1JCaUxuNGUrYnBTVlhkNHBE?=
 =?utf-8?B?VmFWUWI3QUZFdGZSQ0puSjVYU3ArK0NpYklPVzVCY2FaVUdGaXBlM2FzbnRD?=
 =?utf-8?B?cU53RWF1UGV2eDhUcjVEOWFDNm5zOFlBSzR5VzFjS0Z4dmhDWkZWTG9uUlhD?=
 =?utf-8?B?RnNYTGQ1MDFlMXAvcS9ERE92TUVrZnUvcXpLQVJqaWkzSUkzUUFBZWZvaXNG?=
 =?utf-8?B?QmpQTmF4WGxBeWU5WFZiNkZYbkNOa0ptZHNPY0FyazRMSlhxOGltaEV1QnU5?=
 =?utf-8?B?REZXVmVNMHJCZWdON2RhTmRwaC9BUHgzREY1cWtZbGhaTDZyQVMzb1JTVUNC?=
 =?utf-8?B?bHBEbWtpTXhhUFlYMDJNYkV6MXhiSmxlT21Lenp2OVh5UFl6MkxGV3hmSEdR?=
 =?utf-8?B?S1NBem4zNmV6K2tQRWFiZHk2UHJWSWhaY2lHaUdxY0xEUkl5ckE2SjRxWDgv?=
 =?utf-8?Q?oiJYvz15giRQ+VeqUdnOoxW1x?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d7c46d-e504-40f8-1d29-08dc8ae63433
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 13:47:30.7552 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QGRur+RLMc29h79BL0DgCtCxXYQnyPorPyEInNjmj/iEBSc3DodRUyN5uJktcz2VqSCk/nYCAyuUk6FhclgUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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



On 6/12/2024 2:37 PM, Matthew Auld wrote:
> On 12/06/2024 06:40, Riana Tauro wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> There are a set of engine group busyness counters provided by HW which 
>> are
>> perfect fit to be exposed via PMU perf events.
>>
>> BSPEC: 46559, 46560, 46722, 46729, 52071, 71028
>>
>> events can be listed using:
>> perf list
>>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>    xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>
>> and can be read using:
>>
>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>             time        counts unit events
>>       1.001139062            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       2.003294678            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       3.005199582            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       4.007076497            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       5.008553068            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       6.010531563        43520 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       7.012468029        44800 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       8.013463515            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>       9.015300183            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      10.017233010            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>      10.971934120            0 ns  xe_0000_8c_00.0/render-group-busy-gt0/
>>
>> The pmu base implementation is taken from i915.
>>
>> v2:
>> Store last known value when device is awake return that while the GT is
>> suspended and then update the driver copy when read during awake.
>>
>> v3:
>> 1. drop init_samples, as storing counters before going to suspend should
>> be sufficient.
>> 2. ported the "drm/i915/pmu: Make PMU sample array two-dimensional" and
>> dropped helpers to store and read samples.
>> 3. use xe_device_mem_access_get_if_ongoing to check if device is active
>> before reading the OA registers.
>> 4. dropped format attr as no longer needed
>> 5. introduce xe_pmu_suspend to call engine_group_busyness_store
>> 6. few other nits.
>>
>> v4: minor nits.
>>
>> v5: take forcewake when accessing the OAG registers
>>
>> v6:
>> 1. drop engine_busyness_sample_type
>> 2. update UAPI documentation
>>
>> v7:
>> 1. update UAPI documentation
>> 2. drop MEDIA_GT specific change for media busyness counter.
>>
>> v8:
>> 1. rebase
>> 2. replace mem_access_if_ongoing with xe_pm_runtime_get_if_active
>> 3. remove interrupts pmu event
>>
>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>>   drivers/gpu/drm/xe/xe_pmu.c          | 631 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  67 +++
>>   include/uapi/drm/xe_drm.h            |  39 ++
>>   10 files changed, 783 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 0c3e3adabb27..ce4efd9ae8b3 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -276,6 +276,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>       i915-display/skl_universal_plane.o \
>>       i915-display/skl_watermark.o
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>   ifeq ($(CONFIG_ACPI),y)
>>       xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>           i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 47c26c37608d..22821dcd4e1b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -390,6 +390,11 @@
>>   #define   INVALIDATION_BROADCAST_MODE_DIS    REG_BIT(12)
>>   #define   GLOBAL_INVALIDATION_MODE        REG_BIT(2)
>> +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE        XE_REG(0xdb80)
>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE        XE_REG(0xdba0)
>> +#define XE_OAG_BLT_BUSY_FREE            XE_REG(0xdbbc)
>> +#define XE_OAG_RENDER_BUSY_FREE            XE_REG(0xdbdc)
>> +
>>   #define HALF_SLICE_CHICKEN5            XE_REG_MCR(0xe188, 
>> XE_REG_OPTION_MASKED)
>>   #define   DISABLE_SAMPLE_G_PERFORMANCE        REG_BIT(0)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 0ff95a0ea5ea..88a90143eac1 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -667,6 +667,8 @@ int xe_device_probe(struct xe_device *xe)
>>       xe_hwmon_register(xe);
>> +    xe_pmu_register(&xe->pmu);
>> +
>>       return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, 
>> xe);
>>   err_fini_display:
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 52bc461171d5..a5dba7325cf1 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>>   #include "xe_lmtt_types.h"
>>   #include "xe_memirq_types.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> @@ -473,6 +474,9 @@ struct xe_device {
>>           int mode;
>>       } wedged;
>> +    /** @pmu: performance monitoring unit */
>> +    struct xe_pmu pmu;
>> +
>>       /* private: */
>>   #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 57d84751e160..477d0ae5f230 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -782,6 +782,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>       if (err)
>>           goto err_msg;
>> +    xe_pmu_suspend(gt);
>> +
>>       err = xe_uc_suspend(&gt->uc);
>>       if (err)
>>           goto err_force_wake;
>> diff --git a/drivers/gpu/drm/xe/xe_module.c 
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 3edeb30d5ccb..26f814f97fc2 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -11,6 +11,7 @@
>>   #include "xe_drv.h"
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>> +#include "xe_pmu.h"
>>   #include "xe_sched_job.h"
>>   struct xe_modparam xe_modparam = {
>> @@ -74,6 +75,10 @@ static const struct init_funcs init_funcs[] = {
>>           .init = xe_sched_job_module_init,
>>           .exit = xe_sched_job_module_exit,
>>       },
>> +    {
>> +        .init = xe_pmu_init,
>> +        .exit = xe_pmu_exit,
>> +    },
>>       {
>>           .init = xe_register_pci_driver,
>>           .exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..472f63e76c62
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,631 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +    return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +    drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +    drm_dev_put(&xe->drm);
>> +}
>> +
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, int 
>> sample_type)
>> +{
>> +    u64 val;
>> +
>> +    switch (sample_type) {
>> +    case __XE_SAMPLE_RENDER_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +        break;
>> +    case __XE_SAMPLE_COPY_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +        break;
>> +    case __XE_SAMPLE_MEDIA_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +        break;
>> +    case __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY:
>> +        val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +        break;
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return xe_gt_clock_cycles_to_ns(gt, val * 16);
>> +}
>> +
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +    int sample_type = config_counter(config);
>> +    const unsigned int gt_id = gt->info.id;
>> +    struct xe_device *xe = gt->tile->xe;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    unsigned long flags;
>> +    bool device_awake;
>> +    u64 val;
>> +
>> +    device_awake = xe_pm_runtime_get_if_active(xe);
>> +    if (device_awake) {
>> +        XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>> +        val = __engine_group_busyness_read(gt, sample_type);
>> +        XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +        xe_pm_runtime_put(xe);
>> +    }
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (device_awake)
>> +        pmu->sample[gt_id][sample_type] = val;
>> +    else
>> +        val = pmu->sample[gt_id][sample_type];
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +static void engine_group_busyness_store(struct xe_gt *gt)
>> +{
>> +    struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +    unsigned int gt_id = gt->info.id;
>> +    unsigned long flags;
>> +    int i;
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    for (i = __XE_SAMPLE_RENDER_GROUP_BUSY; i <= 
>> __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY; i++)
>> +        pmu->sample[gt_id][i] = __engine_group_busyness_read(gt, i);
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +    unsigned int gt_id = config_gt_id(config);
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +    if (gt_id >= XE_PMU_MAX_GT)
>> +        return -ENOENT;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +        if (gt->info.type == XE_GT_TYPE_MEDIA)
>> +            return -ENOENT;
>> +        break;
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        if (!(gt->info.engine_mask & (BIT(XE_HW_ENGINE_VCS0) | 
>> BIT(XE_HW_ENGINE_VECS0))))
>> +            return -ENOENT;
>> +        break;
>> +    default:
>> +        return -ENOENT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    int ret;
>> +
>> +    if (pmu->closed)
>> +        return -ENODEV;
>> +
>> +    if (event->attr.type != event->pmu->type)
>> +        return -ENOENT;
>> +
>> +    /* unsupported modes and filters */
>> +    if (event->attr.sample_period) /* no sampling */
>> +        return -EINVAL;
>> +
>> +    if (has_branch_stack(event))
>> +        return -EOPNOTSUPP;
>> +
>> +    if (event->cpu < 0)
>> +        return -EINVAL;
>> +
>> +    /* only allow running on one cpu at a time */
>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +        return -EINVAL;
>> +
>> +    ret = config_status(xe, event->attr.config);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!event->parent) {
>> +        drm_dev_get(&xe->drm);
>> +        event->destroy = xe_pmu_event_destroy;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>> +    const u64 config = event->attr.config;
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    u64 val;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        val = engine_group_busyness_read(gt, config);
>> +        break;
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct hw_perf_event *hwc = &event->hw;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 prev, new;
>> +
>> +    if (pmu->closed) {
>> +        event->hw.state = PERF_HES_STOPPED;
>> +        return;
>> +    }
>> +again:
>> +    prev = local64_read(&hwc->prev_count);
>> +    new = __xe_pmu_event_read(event);
>> +
>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +        goto again;
>> +
>> +    local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +    /*
>> +     * Store the current counter value so we can report the correct 
>> delta
>> +     * for all listeners. Even when the event was already enabled and 
>> has
>> +     * an existing non-zero value.
>> +     */
>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (pmu->closed)
>> +        return;
>> +
>> +    xe_pmu_enable(event);
>> +    event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +    if (flags & PERF_EF_UPDATE)
>> +        xe_pmu_event_read(event);
>> +
>> +    event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (pmu->closed)
>> +        return -ENODEV;
>> +
>> +    if (flags & PERF_EF_START)
>> +        xe_pmu_event_start(event, flags);
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +    xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +    return 0;
>> +}
>> +
>> +struct xe_ext_attribute {
>> +    struct device_attribute attr;
>> +    unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +                 struct device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ext_attribute *eattr;
>> +
>> +    eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +    return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +    &dev_attr_cpumask.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +    .attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +    .counter = (__counter), \
>> +    .name = (__name), \
>> +    .unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = xe_pmu_event_show;
>> +    attr->val = config;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +         const char *str)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = perf_event_sysfs_show;
>> +    attr->event_str = str;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    static const struct {
>> +        unsigned int counter;
>> +        const char *name;
>> +        const char *unit;
>> +    } events[] = {
>> +        __event(0, "render-group-busy", "ns"),
>> +        __event(1, "copy-group-busy", "ns"),
>> +        __event(2, "media-group-busy", "ns"),
>> +        __event(3, "any-engine-group-busy", "ns"),
>> +    };
>> +
>> +    struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +    struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +    struct attribute **attr = NULL, **attr_iter;
>> +    unsigned int count = 0;
>> +    unsigned int i, j;
>> +    struct xe_gt *gt;
>> +
>> +    /* Count how many counters we will be exposing. */
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +
>> +            if (!config_status(xe, config))
>> +                count++;
>> +        }
>> +    }
>> +
>> +    /* Allocate attribute objects and table. */
>> +    xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +    if (!xe_attr)
>> +        goto err_alloc;
>> +
>> +    pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +    if (!pmu_attr)
>> +        goto err_alloc;
>> +
>> +    /* Max one pointer of each attribute type plus a termination 
>> entry. */
>> +    attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +    if (!attr)
>> +        goto err_alloc;
>> +
>> +    xe_iter = xe_attr;
>> +    pmu_iter = pmu_attr;
>> +    attr_iter = attr;
>> +
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +            char *str;
>> +
>> +            if (config_status(xe, config))
>> +                continue;
>> +
>> +            str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +                    events[i].name, j);
>> +            if (!str)
>> +                goto err;
>> +
>> +            *attr_iter++ = &xe_iter->attr.attr;
>> +            xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +            if (events[i].unit) {
>> +                str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +                        events[i].name, j);
>> +                if (!str)
>> +                    goto err;
>> +
>> +                *attr_iter++ = &pmu_iter->attr.attr;
>> +                pmu_iter = add_pmu_attr(pmu_iter, str,
>> +                            events[i].unit);
>> +            }
>> +        }
>> +    }
>> +
>> +    pmu->xe_attr = xe_attr;
>> +    pmu->pmu_attr = pmu_attr;
>> +
>> +    return attr;
>> +
>> +err:
>> +    for (attr_iter = attr; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +    kfree(attr);
>> +    kfree(xe_attr);
>> +    kfree(pmu_attr);
>> +
>> +    return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +    for (; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +    kfree(pmu->events_attr_group.attrs);
>> +    kfree(pmu->xe_attr);
>> +    kfree(pmu->pmu_attr);
>> +
>> +    pmu->events_attr_group.attrs = NULL;
>> +    pmu->xe_attr = NULL;
>> +    pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>> cpuhp.node);
>> +
>> +    /* Select the first online CPU as a designated reader. */
>> +    if (cpumask_empty(&xe_pmu_cpumask))
>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), 
>> cpuhp.node);
>> +    unsigned int target = xe_pmu_target_cpu;
>> +
>> +    /*
>> +     * Unregistering an instance generates a CPU offline event which 
>> we must
>> +     * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +     */
>> +    if (pmu->closed)
>> +        return 0;
>> +
>> +    if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +        target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +        /* Migrate events if there is a valid target */
>> +        if (target < nr_cpu_ids) {
>> +            cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +            xe_pmu_target_cpu = target;
>> +        }
>> +    }
>> +
>> +    if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +        perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +        pmu->cpuhp.cpu = target;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
>> +int xe_pmu_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +                      "perf/x86/intel/xe:online",
>> +                      xe_pmu_cpu_online,
>> +                      xe_pmu_cpu_offline);
>> +    if (ret < 0)
>> +        pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +              ret);
>> +    else
>> +        cpuhp_slot = ret;
>> +
>> +    return 0;
>> +}
>> +
>> +void xe_pmu_exit(void)
>> +{
>> +    if (cpuhp_slot != CPUHP_INVALID)
>> +        cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    if (cpuhp_slot == CPUHP_INVALID)
>> +        return -EINVAL;
>> +
>> +    return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +void xe_pmu_suspend(struct xe_gt *gt)
>> +{
>> +    engine_group_busyness_store(gt);
>> +}
>> +
>> +static void xe_pmu_unregister(struct drm_device *device, void *arg)
>> +{
>> +    struct xe_pmu *pmu = arg;
>> +
>> +    if (!pmu->base.event_init)
>> +        return;
>> +
>> +    /*
>> +     * "Disconnect" the PMU callbacks - since all are atomic 
>> synchronize_rcu
>> +     * ensures all currently executing ones will have exited before we
>> +     * proceed with unregistration.
>> +     */
>> +    pmu->closed = true;
>> +    synchronize_rcu();
>> +
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +    perf_pmu_unregister(&pmu->base);
>> +    pmu->base.event_init = NULL;
>> +    kfree(pmu->base.attr_groups);
>> +    kfree(pmu->name);
>> +    free_event_attributes(pmu);
>> +}
>> +
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    const struct attribute_group *attr_groups[] = {
>> +        &pmu->events_attr_group,
>> +        &xe_pmu_cpumask_attr_group,
>> +        NULL
>> +    };
>> +
>> +    int ret = -ENOMEM;
>> +
>> +    spin_lock_init(&pmu->lock);
>> +    pmu->cpuhp.cpu = -1;
>> +
>> +    pmu->name = kasprintf(GFP_KERNEL,
>> +                  "xe_%s",
>> +                  dev_name(xe->drm.dev));
>> +    if (pmu->name)
>> +        /* tools/perf reserves colons as special. */
>> +        strreplace((char *)pmu->name, ':', '_');
>> +
>> +    if (!pmu->name)
>> +        goto err;
>> +
>> +    pmu->events_attr_group.name = "events";
>> +    pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +    if (!pmu->events_attr_group.attrs)
>> +        goto err_name;
>> +
>> +    pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +                    GFP_KERNEL);
>> +    if (!pmu->base.attr_groups)
>> +        goto err_attr;
>> +
>> +    pmu->base.module    = THIS_MODULE;
>> +    pmu->base.task_ctx_nr    = perf_invalid_context;
>> +    pmu->base.event_init    = xe_pmu_event_init;
>> +    pmu->base.add        = xe_pmu_event_add;
>> +    pmu->base.del        = xe_pmu_event_del;
>> +    pmu->base.start        = xe_pmu_event_start;
>> +    pmu->base.stop        = xe_pmu_event_stop;
>> +    pmu->base.read        = xe_pmu_event_read;
>> +    pmu->base.event_idx    = xe_pmu_event_event_idx;
>> +
>> +    ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +    if (ret)
>> +        goto err_groups;
>> +
>> +    ret = xe_pmu_register_cpuhp_state(pmu);
>> +    if (ret)
>> +        goto err_unreg;
>> +
>> +    ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
>> +    if (ret)
>> +        goto err_cpuhp;
> 
> This triggers a warning during core_hotunplug. AFAIK this should use 
> devm and not drmm.

Thank you for pointing this. Will change this to devm.

Thank you,
Riana
> 
>> +
>> +    return;
>> +
>> +err_cpuhp:
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +    perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +    kfree(pmu->base.attr_groups);
>> +err_attr:
>> +    pmu->base.event_init = NULL;
>> +    free_event_attributes(pmu);
>> +err_name:
>> +    kfree(pmu->name);
>> +err:
>> +    drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..8afa256f9dac
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_suspend(struct xe_gt *gt);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_suspend(struct xe_gt *gt) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h 
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..e86e8d7e0356
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,67 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +    __XE_SAMPLE_RENDER_GROUP_BUSY,
>> +    __XE_SAMPLE_COPY_GROUP_BUSY,
>> +    __XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +    __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +    __XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
>> +
>> +struct xe_pmu {
>> +    /**
>> +     * @cpuhp: Struct used for CPU hotplug handling.
>> +     */
>> +    struct {
>> +        struct hlist_node node;
>> +        unsigned int cpu;
>> +    } cpuhp;
>> +    /**
>> +     * @base: PMU base.
>> +     */
>> +    struct pmu base;
>> +    /**
>> +     * @closed: xe is unregistering.
>> +     */
>> +    bool closed;
>> +    /**
>> +     * @name: Name as registered with perf core.
>> +     */
>> +    const char *name;
>> +    /**
>> +     * @lock: Lock protecting enable mask and ref count handling.
>> +     */
>> +    spinlock_t lock;
>> +    /**
>> +     * @sample: Current and previous (raw) counters.
>> +     *
>> +     * These counters are updated when the device is awake.
>> +     */
>> +    u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @events_attr_group: Device events attribute group.
>> +     */
>> +    struct attribute_group events_attr_group;
>> +    /**
>> +     * @xe_attr: Memory block holding device attributes.
>> +     */
>> +    void *xe_attr;
>> +    /**
>> +     * @pmu_attr: Memory block holding device attributes.
>> +     */
>> +    void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index d7b0903c22b2..07ca545354f7 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1370,6 +1370,45 @@ struct drm_xe_wait_user_fence {
>>       __u64 reserved[2];
>>   };
>> +/**
>> + * DOC: XE PMU event config IDs
>> + *
>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in 
>> xe_drm.h
>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to 
>> read a
>> + * particular event.
>> + *
>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>> + *
>> + * .. code-block:: C
>> + *
>> + *    struct perf_event_attr attr;
>> + *    long long count;
>> + *    int cpu = 0;
>> + *    int fd;
>> + *
>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>> + *    attr.type = type; // eg: 
>> /sys/bus/event_source/devices/xe_0000_56_00.0/type
>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>> + *    attr.use_clockid = 1;
>> + *    attr.clockid = CLOCK_MONOTONIC;
>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>> + *
>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>> + */
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 0)
>> +#define XE_PMU_COPY_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 1)
>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 2)
>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)    ___XE_PMU_OTHER(gt, 3)
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
