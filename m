Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CCFC88E41
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 23:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B8D10F0E8;
	Thu, 10 Sep 2026 23:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FVa4/TwW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929810F2B8
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Sep 2026 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789081246; x=1820617246;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dw9L4uyxqI+RoLNLtXhA5rn26UWSaPZy1oY4UXpUum4=;
 b=FVa4/TwWcOTYEAZDAXC5B5CMaLzwXHEwCqaaZxQPmqF4PfqhTjh2cDpz
 2Y9pS5Syi7TQnUtUBEtO/bujQqtssN8I4VdmiSaZ9nkVxGjIPekfV1acv
 a0T1Usba5Qv83eHbtBIYempMIK6iF11rxb9QnSrIVdAdgJaF8gZ9mE2Rm
 mf0mF4Z8+VMFjB4kc1Bgz7O7o63wmkv3agweS12s+FCOTh9M/O1gRBZ4n
 wjKtkLrbVBkcEjktL3LUeZSHdPUaLwqVD3hK4yeiFEos2FZ9ywQlBkRXa
 ahU5Ht2atLAFkKb7JQVBcbgULF6mxA0cWoOPUinSXczIwPsnSaAdKg1sN A==;
X-CSE-ConnectionGUID: kp5xlpnvTiGgfavEZwxwIw==
X-CSE-MsgGUID: RLnYaKmbSQaJG6t/XXtoQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93234289"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; 
   d="scan'208";a="93234289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 16:00:45 -0700
X-CSE-ConnectionGUID: IEuJmKcSReCbD//db8W2pQ==
X-CSE-MsgGUID: 9tOtyvdqTO2iYfQ5bOkaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="270393459"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 16:00:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 16:00:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 10 Sep 2026 16:00:44 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.54) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 10 Sep 2026 16:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Slf0RbFtfjl20vovSdxbN06hodHrkvZr7NTakKcGzYyyBqcOMsur2NnKEv+BO00nMRS33UuIqaizWArCPOBlbV1RyPQ9YP32PDfNV9AcOpHqdE9htdrHvFY67Z+VkmAjZoMLN1hqQdzhuVtq0uYlE9y04Yr6f2Xx0ZbQAOopBHjhwe37kL/4IVObrePluvTjoKDg7izScmr9Qt13QbZgHAhE/suqL0O8BOOO4zf19u+zpOOHCSt2DhTrdNQR0jKRTbcZOuOxmc09e82zc5QPzsn63WuIf3XVyiIianuEXu0kmqEu/rP+npDgxLWMtHY2MhoEE5LD3PCmfgTJNUcpWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xM+0q8ZqCWMcksl/FKIa/2lUQaS2v7cVL8HlSRdNMxU=;
 b=slsM6G9xtBKjzZeKvXPEtNSMaALigyf5vz27Qv0siYWpxz9p5NelPpqDg+vIvPZxU1uZzoaxX95L3aLrOMzQMfPJ3wh2ECPunK8wxwuRy2dsSLUHUqhQnsDTX1gXfFPmdCPzTyMw5Vh4+SD1sH8h7ntNS5C8Sj2tPzRVCFoTCsI+8jjQgnZKbIq4CEN67F0CzroCSl6zSqYaisHG7uKbO1lLK0KfxJm9UusZUP9F2TNdutSI2O4UVST7cIxTLOCpJ0ljrAYrv0cbXsTMD4cHTRPvIPRmtBDGrND98zZIxE5NczO2/QUs7zfFYKkchjqCooV8Fhho9rlPiGeHJqi/3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 23:00:42 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 23:00:42 +0000
Message-ID: <8a6a5fe1-4965-478e-ab80-71a4c353ed21@intel.com>
Date: Thu, 10 Sep 2026 16:00:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe: Inspect all forcewake bits for runtime
 idleness
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20260910212823.2358362-1-vinay.belgaumkar@intel.com>
 <aqMsfvRS1Ge7Ke7u@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aqMsfvRS1Ge7Ke7u@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 589d6d51-0caa-44e3-624d-08df0f8f56ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|6133799003|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: v1m+Us+zz2LtE+KyjOdX5HsAqhOZIJpE2KvGCbf64qcL/uXli9dsFaVNysEifCPqljHGDVAb3TULXuLvia89Z5u7u3L3LyvoGZrANf07Uh9q7QuTdrEsEMjpar67oiPF7bcb3fhbccB0Ah2JHqV5KTp42yNp18XzNyNMKTaZK6uzOebyuf7H7iklTw6IHJ9DDdr/H+5Z5XpcmkBJkDzZsjSe2AIlUTDCmI/23msBvPiBXsu5v/+aeinVRkAchMUUqkspIPqAnvA6Zu1egDRFqU8C7fTZAPpRvYbbOANfSjSUfIiKfrv+xTRd8wZ9VjDoSOOabUvqMPeqcpgwNubDNoclRyfXI6K0CFbnqeYwDuv/17Hz4WCYGnQRbl19GKJQpGw25wqSTizGx86+RaRdWi2fGtpP72A8O/w8bjARxAAWFoFiKEvAmX6fpQwErSLBvB3itHpG0QUkoHLlKizBiHTXSSN6xs2QeQswOKa+8m7NsAELnYrz6Y0idzez4fVMR0VMKYUWth+qUSq3jWXdHHGq7SlJ5GgN8NHE5ayszilZB9VFjYI3Z49rPmy8++thg0pCh13b+p/BaS6/KOjS4zs/9aGmfxyRpNwMqmVNFrZ2uD4iZ5GxozKzz2SnKSeYtcXFiIKFWWc2o2nzyNA4FOARLxiLiAHw7fjc43JzwMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dm11VS93d3BtQXozS2dtay9penJUdDlZei94Wk1PYlBzNXhaVnMzWW9SMEVT?=
 =?utf-8?B?dDBSV1M0VEFIdjRsbENjOWpnajkrdFgrbW53MWkzUWlTUHBqVTVWcVNNL3V0?=
 =?utf-8?B?YThKdEE0V1YzM2JkREgxT3hPN0NuTHRMOWNwT0NjRHFEUVpJWXNPQWVhU0d4?=
 =?utf-8?B?UFhMczJlL3VBejR2a1ZmaTJGN1ZtazVKZG04dXZUcWtZNytQc0dmNFhKaHps?=
 =?utf-8?B?ak84dUdwemltOThZYUM2dFV5M0VXYkRHdmRCTU9yNG9lVHlWZ3JhaHY4dVc5?=
 =?utf-8?B?aGRJNi9MazZDa0d3ajExSld5Y0lDNFRvaUtSa3F2ZGQxQktEVVQ4Z2VJeXJ3?=
 =?utf-8?B?c3RGT1ZPeE9TdkJQcHNRQXdKSzV0RmpwTjM4Wmg1NWIxV2ROOU5qbjBFZVox?=
 =?utf-8?B?YmNaejlGeEhNcGhtRmRYWlZMMXhhRnhHa1d4NVp4akc1ajFERS8wZkdYcmNm?=
 =?utf-8?B?Unp2bHk1UXVmY1FGSmhGT3hkV3pnZ1Z5OXprRlJpWXFTc3pJWm9COUVIdDc2?=
 =?utf-8?B?Y21BMFJ2d1VYZ2N4RTNIejRjbGFrUjBvbkZ3YnFpaWNLZm1MNHRuZ29NNzgr?=
 =?utf-8?B?MUZxNGQ5eE5MUnBBVTNsT05meGJzMkd1WlBsWDF0cGk5NXZTZVY0Y28wdXZQ?=
 =?utf-8?B?ZzR2MDdac3Q1YXJLVEs0cEZIZ1NpbnBiUjFoNndKaXJkODVlWjc2bElyL3A5?=
 =?utf-8?B?Rjg4aVkrbFByNDMzZlNOM0NVNEJad0FROEl5bFBWMHdVaUdEdXNpSEJYMmZG?=
 =?utf-8?B?UmpIcytRR0Fud05LR1hUWm9kVi9BaFlFYXNCZzN3SmRHTkRBN0VpakRGU2g1?=
 =?utf-8?B?VDdOWXRKbHBlUDRxdW8rL29hQUsvQVg2ZVlMbGx6cy8zYmh4N2V4Vzl2WEZi?=
 =?utf-8?B?SU9CYzJuT2FGRVFyVEFmMUh6M3c1RHZTdW9ZdXJTZHZvSG5aaWMzdkFqZ0R1?=
 =?utf-8?B?dWdNUEFlT0ZBS3d2NG5CMGN4dGh6cTI1UVNYK1RmS3N3ejRDbVZnOGNNV2JC?=
 =?utf-8?B?QTRGbGh4MCtvblZLL0hDSlp1ZzdyRGdWeWZ0b1NybVd3OTZJWEFEQTlTSUp6?=
 =?utf-8?B?STVCNEhZZnJNUWFIQkdhV2ZicHE5SjNOTkluME81ZWRwcmk0SFFuNUp4OUZP?=
 =?utf-8?B?RTlEK2FWRUVOc0Y0MFZkNW1CVzVVZlN0QU13TUxJN2NpeDRaUU5EQ2dJS1Iv?=
 =?utf-8?B?cE9EMm4xN2cvT3pZbm9GYXdOQlZESWtjbHJiblQzTVdaZW5STTloZUVCVmRn?=
 =?utf-8?B?ZHl3bGhQdlBvWHd2WHZkYisvUjVkV0lMSktZQmZwOEh1TEdvV3FZQW9EcjU0?=
 =?utf-8?B?bTNTcW1FYnRKL0psdXAvOVFHbTFnc3VJcURkUWFseWYvTXJVV1FnNE8zaDFy?=
 =?utf-8?B?VlNBWElPVGcrQTh2bWpJdTdwaHd0NHM5eXdmNlRVWnlCZTAxMU5WbWxZTm4v?=
 =?utf-8?B?K1hOUVZhNTA2RTdKNEhkNnlWT1k5aWp4c1NTOWdFcGVKWnlKakxjUG5hM1VP?=
 =?utf-8?B?Y2M5Zi9BS2pZeDR1U2YvcCtyV3pXVG52SDhtRTEvdjdGMjVUdjJZMWFOMGJB?=
 =?utf-8?B?YURqOCt5UG04MzR0VlFGT2RBK2dveU5hSUUrSXBadDJCaDNxN1NXYXJ1Rjg2?=
 =?utf-8?B?cm9IeWNMMXo1NURJVVJGVFNuRXh3NEszS055UEJyOUtKWXpPRnV1V3pQTS9w?=
 =?utf-8?B?ZUczWWlJSmlHcmRjNC91QXRGeENpNG1GT0lxcFBIM0dqRUM4akxSWHYrRmpI?=
 =?utf-8?B?Z25ZQkNxVDdIM3dqSDhUdlA0RVFWQjREMVAyUzJ3UXZRcW5RcWlXYkpnSnBR?=
 =?utf-8?B?NWtGbXRkZnlGRDF0ZS9odjFqckN0Sml6UVhLRm95em5ob0hUaDlmVW1ZVzJi?=
 =?utf-8?B?bVZ2MlNhaFNGamp0d2Jic1dJVTFHdWo2VzFucE1zOExxVTdBdWV1M3BpK1Er?=
 =?utf-8?B?VEZBMG9iQitQL0R4VnNuTmJMV3hzNThIc3NLeEsybWlydHJFbk5VWjNwcXdO?=
 =?utf-8?B?bTdtaURETXhkUld2eGdIZ2ZwTHFwUnJXeGJQaU5rb25jQXBrZEVkakNTRGJy?=
 =?utf-8?B?ME9JRld3TnNraHlpTWE5M2dzR3pGeklOdUdrdGx0ZkNuL1pDVzBGUFNSQVpm?=
 =?utf-8?B?MjE1bVJRUWtXd1g5R1p4bFNzZytLeTAvSVBVVkxxK0dkN25ZQ2ZEck9wWWJ2?=
 =?utf-8?B?UTh5RnFreStzb1lBd2dNcG9rdU9jelZNeHR3UWJud3RpWVpFL1orSDk2aHYr?=
 =?utf-8?B?YkRUUjIzajFFcWpZbmxYSGJaSmtIeG9USGJvN0RtRkZWRGlmbUI3TndHbEdS?=
 =?utf-8?B?Z09qNVBObHZrbVRCU00zNzB5Z0JyMjdoak5icnhvaG1vRVlJS3N4d3RXYlJm?=
 =?utf-8?Q?sPBDJvCpueivKZls=3D?=
X-Exchange-RoutingPolicyChecked: fmPOsn+VtW6oiAVWvb2VuXWcoBNAEG9Gal3Mzi3aLb8ILil6iapv35FaEgWEz/we1oYWmbdQPOa9GOs70MX7+fxu/5efa4Zr/JLPLGtb4Kve63nTWPULYu2s53h3664fFNAy1MNOzL4bR0sDpUNM64cSpH8wn78ZrjpYxBnhkFisz1S1udAyNYQpE6YGhNXxVANJA/2iReWlmYoi8n6gSXQFs4jfb/9rJHUY/wnpPtjAun6pL/amzqVs8/cVBrp6/gZJAvJBs/KmSz/pDPO8QeeOtIr6/2IXJK9qd3yAI6PAI/PKsVQuqfvctdu2b9i7c3I9NQJbusJKl1LhPnZGPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 589d6d51-0caa-44e3-624d-08df0f8f56ee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 23:00:42.5258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHDjQTNnvvl8/AO/RtWfBkctOlTMD01HpJ6Jd+1SfVqZ8ByT9ixfZ9FgumF6SXYJKVbVPqwcqvyqyyPgFvLholF/e+LpT6IYn71cOBTnmW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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


On 9/10/2026 3:17 PM, Rodrigo Vivi wrote:
> On Thu, Sep 10, 2026 at 02:28:22PM -0700, Vinay Belgaumkar wrote:
>> Inspect all GT force wake bits in the idle check for runtime suspend.
>> This includes the ones not typically used by Xe KMD as well. Skip suspend
>> when any of these bits are set, since it could mean someone is trying to
>> keep the GT awake.
>>
>> Also add a call to pm_runtime_autosuspend() inside the idle check. This
>> ensures a PM subsystem retry at a later time.
>>
>> v2: Only check the GT domain FW register. Other domains require a GT force
>> wake applied before we can read their registers. Retry if idleness check
>> fails (Sashiko)
>>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Assisted-by: Claude:Claude-Sonnet-5
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_force_wake.c | 25 +++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_force_wake.h |  1 +
>>   drivers/gpu/drm/xe/xe_pci.c        |  6 +++++-
>>   drivers/gpu/drm/xe/xe_pm.c         | 19 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pm.h         |  1 +
>>   5 files changed, 51 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 197e2197bd0a..0acb796c756c 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -148,6 +148,31 @@ static int domain_sleep_wait(struct xe_gt *gt,
>>   	return __domain_wait(gt, domain, false);
>>   }
>>   
>> +/**
>> + * xe_force_wake_any_bit_set - Return true if any force wake bit is set
>> + * @fw: struct xe_force_wake
>> + * @id: Force wake domain id
>> + *
>> + * Check if any multithread force wake bit is set for a given domain ID.
>> + *
>> + * Return: true if any bit in the force wake reg is set
>> + */
>> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id)
>> +{
>> +	struct xe_gt *gt = fw->gt;
>> +	struct xe_force_wake_domain *domain = &fw->domains[id];
>> +	u32 val;
>> +
>> +	val = xe_mmio_read32(&gt->mmio, domain->reg_ctl);
>> +	if (val & 0xFFFF) {
>> +		xe_gt_dbg(gt, "FW bit set in domain: %d, reg: 0x%x, val: 0x%x",
>> +			  domain->id, domain->reg_ctl.addr, val);
>> +		return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   /**
>>    * xe_force_wake_get() : Increase the domain refcount
>>    * @fw: struct xe_force_wake
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
>> index e2721f205d6c..53941e5a0fbe 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.h
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
>> @@ -18,6 +18,7 @@ void xe_force_wake_init_engines(struct xe_gt *gt,
>>   unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>>   					    enum xe_force_wake_domains domains);
>>   void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
>> +bool xe_force_wake_any_bit_set(struct xe_force_wake *fw, enum xe_force_wake_domain_id id);
>>   
>>   const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index ab4da1d9a9f1..a79d928ad75a 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -1438,10 +1438,14 @@ static int xe_pci_runtime_idle(struct device *dev)
>>   {
>>   	struct pci_dev *pdev = to_pci_dev(dev);
>>   	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	int ret;
>>   
>>   	xe_pm_d3cold_allowed_toggle(xe);
>>   
>> -	return 0;
>> +	ret = xe_pm_check_runtime_idle(xe);
>> +	pm_runtime_autosuspend(dev);
> do we really need this autosuspend here?
> I believe this is what may have confused Sashiko.
> And if needed it probably worth a separate patch with explanation.

It was Sashiko's suggestion :). If we fail runtime_idle check due to 
someone holding a forcewake, there is no mechanism to re-trigger the 
autosuspend when they release the forcewake. I believe it is only 
retriggered on a pm_ref put(). So, system will be stuck in D0 state even 
after the forcewake has been released (until some execution happens and 
a pm_ref count goes to zero again). We only need the autosuspend when 
the check fails, so should be part of the same patch? I added it to both 
paths since it is a noop in the case where we succeed in the idle check 
(as it returns 0 to the PM subsystem).

Thanks,

Vinay.

>
>> +
>> +	return ret;
>>   }
>>   
>>   static const struct dev_pm_ops xe_pm_ops = {
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index f517bf453b54..e8d4cdbaef88 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -17,6 +17,8 @@
>>   #include "xe_bo.h"
>>   #include "xe_bo_evict.h"
>>   #include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_force_wake_types.h"
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_idle.h"
>> @@ -1030,6 +1032,23 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>>   	mutex_unlock(&xe->d3cold.lock);
>>   }
>>   
>> +/**
>> + * xe_pm_check_runtime_idle() - Perform checks before signaling runtime idle.
>> + *
>> + * Return: 0 on success, non-zero on finding device not idle
>> + */
>> +int xe_pm_check_runtime_idle(struct xe_device *xe)
>> +{
>> +	struct xe_gt *gt;
>> +	u8 id;
>> +
>> +	for_each_gt(gt, xe, id)
>> +		if (xe_force_wake_any_bit_set(gt_to_fw(gt), XE_FW_DOMAIN_ID_GT))
>> +			return -EBUSY;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * xe_pm_module_init() - Perform xe_pm specific module initialization.
>>    *
>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>> index 6d5ab09cb769..d1f6a694b7c4 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.h
>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>> @@ -38,6 +38,7 @@ struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>   int xe_pm_block_on_suspend(struct xe_device *xe);
>>   void xe_pm_might_block_on_suspend(void);
>>   int xe_pm_module_init(void);
>> +int xe_pm_check_runtime_idle(struct xe_device *xe);
>>   
>>   static inline void __xe_pm_runtime_noop(struct xe_device *xe) {}
>>   
>> -- 
>> 2.38.1
>>
