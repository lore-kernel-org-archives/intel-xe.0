Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE15CA1015
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 13:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE2910EA49;
	Thu,  4 Sep 2025 13:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q9Ys8hup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7801D10EA49
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756993518; x=1788529518;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oX7hcEoIJH989jloPC9jI4yBgj9lKa2xj7bgCQV8LRE=;
 b=Q9Ys8hupHArMvANFKkOzc5xB4plx9PpgSRXQl8dHhY5Z49sdS3CjIIfO
 zyH58iYN8ZuqrxXOwnBo3T5XkhWzKP0qMKeK/dTQ4eR0y+XcovJX5JIYR
 qrGvech0S23xj4ZveHfPjp/mPkcZipbBeA/WGtGyMWT+9uxKHkt6XNMqE
 YJn5TnN+qSzaZeEhUZhlLHYdvi6zxQnVfx8Q/ci+DgKHV2S7wjEFdbdKT
 iyc5NChig5VUr/5EO1pmcXfOttwboYmWyiZFn6jgq6+ssbaTBG0F9+C8M
 rQ0PQ4gAsao1spGpn6PxjB3rNO2atGzqQ0kVfqOPfgqakhT+qX8c6eSZX w==;
X-CSE-ConnectionGUID: mmruTzDaTX+C2hXJU5vVYQ==
X-CSE-MsgGUID: oLxR+7IDRxa31iBiyvz4dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70427281"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="70427281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:45:18 -0700
X-CSE-ConnectionGUID: vCaLTBmyQB6aZTOERU3Xug==
X-CSE-MsgGUID: upMVzpaOQey6vf+W1DJtpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="202741831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:45:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 06:45:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 06:45:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 06:45:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSjgHerfMH9ThfIE5n+an7EU5Br3E5m4Q+uwoWrl6RcPFgiUXbsseMu7i7yBAl5e3DbnjoPki9Kdsbl79/7MpYXJHezNGx5fZiUnQIL02rrZlQqcJmukvyWvXrJPN75gLAzLhSRWc85RANwdDgHhfgrZjm9FJ5xLpNI63k339lq9k1jWVVTQgzImBnxW3uXPYX22GsLGPe8LHwqa3HzNUd4uX8jbckAjrE2BlEe20qMwhwfMF12Dmqw1X6Ee5JiVOs3gPKnN0ganURSRupEF89xCWTR22kcEoEt1p8Y2daJBzab5capveAbtUAXbn7EWgo1LYo5gdSyGGb3ZKat6ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aj7FsYx7WT0L9ii+fvJmCVqfuVkae/UOgaAhNcFcRYA=;
 b=kUhWEHcGPwIjwk5gXKMZWY3cPqm7plmmZF0yJUL69/rH2Pafxo84EiinKSGiFb+Uj+XyGWlvAJ6aAXjfNkWENqa0ATx5OUmPXOtwSW12DdFkmaDt03AFI2+C+tF7rleXMFVdmuS4XQb0YWMCszix3WoKK4BM/Y2W6Quwx+cgOBMq4YLSWeXGzvF3KGXAxioA3hmhvjoTKLOv9IkowBYmqd8WoQfUl6QmJuvbp5oU3HjlvBKAtwHGwol5HVgPvoE4ZbBnVnA9Xu5G85Z4Un2kkoEjEljKWbRPVuCUaItuuzW0eIfB0Edz/X1KA1DbJIgfCsugNQv8X7opm90thHTcsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 13:45:14 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9052.027; Thu, 4 Sep 2025
 13:45:14 +0000
Message-ID: <ddb44b97-fdf8-4947-8dfa-d4ac1b705442@intel.com>
Date: Thu, 4 Sep 2025 19:15:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/xe: Ensure GT is in C0 during resumes
To: Xin Wang <x.wang@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <james.xiong@intel.com>,
 <stuart.summers@intel.com>, <shuicheng.lin@intel.com>,
 <vinay.belgaumkar@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20250827000633.1369890-1-x.wang@intel.com>
 <20250827000633.1369890-3-x.wang@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20250827000633.1369890-3-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0016.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:179::6) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 6076682f-5164-41c6-d5af-08ddebb94666
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVBtR2lrVGhwWmhQeVZERkJxNTZkTEZ4Y2lRbnBmTWQwN0l0RXByZTY3QUNs?=
 =?utf-8?B?em1rNFNoMXJDSDkyQ1N5WG9kOTRSMm0xdXIvMmhCNEJ1M1owajdHMFpSeldq?=
 =?utf-8?B?VXNOSXd6b2Q4MUhXeVRFODZ4eWNwZktDMkVXeFNyekJETnpaTWtKOUk0SEps?=
 =?utf-8?B?NVJMem9QWDVINnBVYkFhWGZwZ2QyaXJlNVFzZXF6RlQ2MzJhQ1ArRmN5ek1Z?=
 =?utf-8?B?ckU4MDd2WnZLdGt0MUppdDhsazNXS01hR3Fwb1ZxRGtEQU1rMjI1UHhIbHg3?=
 =?utf-8?B?R1RyZ3poUG5ucHdVNWxrR2pzRXhJZ1FBd0I3b002RlhOYWpIZ0ZZOGFEQmNn?=
 =?utf-8?B?WE5ubHlCZnVtS1JBa2RSZzBZbCt0VDZwT1QvZExNVFlKWjJMN1hsemY5WEVz?=
 =?utf-8?B?Rko0NnNOVFl4dzBBMXpNSmRJTnQzMjJEMmdqUWJwM0syUXlCZVJITk9xMHdD?=
 =?utf-8?B?OHVRQjFZOVpERGFnSkZvNXY3b1hnaVRoa3JVQ2V4WUtPUTE0Q0RRN01GbTJ1?=
 =?utf-8?B?SnNCeXo0L0JaKzdjVmlOYWl4b1I3VkVVUDlEQjRyQVBJVmJkWURwT2VrTVpW?=
 =?utf-8?B?emQvcjBkTEhhV2Z1R3hybzBBRnU1RXl0NlpmUmZBQTdSMW04VnlWNHpMZVl1?=
 =?utf-8?B?aG5vM09Ta1E3c1cvRmFVQjRPdHEwbHBoaUdZdjV0elYzanN2OUJ2R1ZEWE1a?=
 =?utf-8?B?L1NXYjM0d2I0T25HT3dJQUFFbzQ1aWRVd1BLNGh2MkkxeDdQZGNqL2F5SUdX?=
 =?utf-8?B?bnVpS2xTdVhWb3Q5YUZUb2JtOU4xODFkK1lMdmo5c3Z0Umx4V2tIdnVIZWxM?=
 =?utf-8?B?QWJzRnRUelVsWVRObUtMQ2krcmYyd3NjYjJKSkNnS1U1NWgvUjhpN1QvWDQr?=
 =?utf-8?B?anJyY3FITXQ5RXBXVU5COGFQeGJnbFVnNjRlb1BRU3p4VzFETitMaFpEemdt?=
 =?utf-8?B?SFhhMzdLckowQVZTMlFHaGJYdU90c0ZsQXNsVnRMMGd3WUw0SVkrV2ZvckF6?=
 =?utf-8?B?UFE1T0tNQnh0THpPMnlaTFowZ1V2Rys0T0xGUFNUaEx0QWZ6N1BuQmdnWmxh?=
 =?utf-8?B?azRhOU04OFdUNzFMUGo4TDJYZ2ZHSWdFNWUxa0tzVXEyZTdlVWZhaGxYbEU5?=
 =?utf-8?B?L1RVMHpnZ3BnTE56VC8wY0dpTzZBUUtjd2hiai9JOVQ5Z1JNeDlLSUg4REpX?=
 =?utf-8?B?V2dWNmJpOVN0RDgxc21GNEVSb25EZ2FZYStzdy9MbFdjOHpFZWx1SDBKWW9n?=
 =?utf-8?B?MmJhaVVjdjZNT1RJaGdNQmxoU09TNCtYK1o0ZGNMejN4bXh2N0hqSGFYcUNX?=
 =?utf-8?B?M0U1bGVvSzFFK253aWJkVXZoL3VwcVAzTi9Hc1Y2WHNuSFpRZXBoSDdoMFNt?=
 =?utf-8?B?bEhiR3lqbXhROHo2aGZnbVpNb0pMRFRNUVYweE40RWVmZ1picTBxRzJvQlZo?=
 =?utf-8?B?NStsMTIvdEMyWUtLcDUwZVk3Wm9qWWdjaHJYbkZhcDRWSUtjWUg4VFJac3ZC?=
 =?utf-8?B?aVBZRmRkYWxwUFhJMTFlZkxIZTBMa2hpMWtEcTQzSytoWktGamJTc1FwK1VC?=
 =?utf-8?B?N3lzbHhIeG9TajJFd3JVVi8raVZPRVUzcVk2bEJWZkw1OWRXQkVpR3dKcGI1?=
 =?utf-8?B?WDNDMnhPaXQ1RjYvR0J6TU5aQ01SUXdTNzNUcU42UzBzSUVnVWhNMmJXdytJ?=
 =?utf-8?B?RkxyUE1oaWhmQ2xzVE1QTkRLQmdEYnVBaHdjaGs5ZkgwK2lseklDMElVNUZP?=
 =?utf-8?B?c0FEbWNnY3NJYlpuT1dQdWJMQU4xbXMwY2phSFk0cVRFVU9yWFBPYjd1aDcz?=
 =?utf-8?Q?2xZrlBo3G4tbdoFqO3qSxgLE/dQuyoCr+KMU0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkFlRHhKNG5SNm1jOTVteG9nTFhHZHVPc09NaTJZMkF2dkhnY0ZYYXVmWS9m?=
 =?utf-8?B?ZERlNE9OVkJJYWpNYUQwNmNNeGtENi9EUzBOYWRkdHhqQnR3cFdSLytRdUZp?=
 =?utf-8?B?UEtUSXRueGg5aDFpaWs4Vk5qVVZ6Vm9ta0JoSXhKV0pRbktEWTBVL0NPTTNs?=
 =?utf-8?B?WWZ6NGVTcTh2Wm9HczA4dko3bkpUNnVLbXQzbkpGTExaRUlrblQwYVBFQ3Ny?=
 =?utf-8?B?M1l0Y0xLMHI0UlFaTDJLSGtvRkUvOGZ4NTh6RytVbE9hMjQrWlRxSU5KL3Z0?=
 =?utf-8?B?Ti9ueDJjU2N3ejBJL2xFcVdRNXUwNFRJSDl1aEVoV2N2RUV6Y3oxTzRTZXRW?=
 =?utf-8?B?eHUvYitzZGlJeG1UeTZuY2h6MHAzTlAxdzJ2a0VZT2pQUUUrTm9HMWcvUzJ5?=
 =?utf-8?B?c1NLTFVzMG9RTWV6YjJqbFlxektRL1ZVbFAwUW03UGFjOFFVbEZvMGw4ejk1?=
 =?utf-8?B?dFpXaEhXMlJUV0o5TDZJOWN5aE8wMElNeFV6WFhIMEtlV3Jva0IyUUtkSENH?=
 =?utf-8?B?bmF2bXZYaEMxaFNqRXVWK1lzUEhHNlRoUVc4cjRwcml0ZTJqVm5rckVBL2RG?=
 =?utf-8?B?RmRaZWppUUNLT3ZhcUNiWS95NW9DYTRNaDJXTENZY3FOL0pzRGh3NklXWW9a?=
 =?utf-8?B?SFRLS1N6VU1NWnArV1FXcUEwVmczT3hJd0RRWnlkamZyemlkekR5dDlsaGZk?=
 =?utf-8?B?YVhnN2cxZm10RndJYk9tLzU5L3BlOERCVmVnVVhjNnZPN1BtakZ2R0taaE1o?=
 =?utf-8?B?eDJxQk5xN3lOTWIwMTJMNDZyTk4raHM1WldKTEF1WVVTNGpUTVZOcEc3ZFZr?=
 =?utf-8?B?U0IzdDgyVkJHcURhR2g1SGdTYm9xT1JsN0JhWlllUmNweURpUFNHTnFLenVB?=
 =?utf-8?B?VS9JbU5hT0NJSVRvalFEdlA0eHBMUXhJbGI2VjhlRUZINzBLV083QXZJRVli?=
 =?utf-8?B?V3dsdXAxZmdZTDdTK1hRY3dXckFNK2piWUg2NjJXa3JUaSsrVlFGcGI1TExC?=
 =?utf-8?B?V3dXWUdaYTJhUEcrdTRYN2k3bzk3OWdBY3hzQzNCd3JtS3E3WE85aWdNZFBl?=
 =?utf-8?B?bTFkMFJSQmxsTFRhV1RGclIvNDNCQnFaelhwK0NOaWdHYmMwZTdhQ0JQQ2I5?=
 =?utf-8?B?SXBKYnVlRUIyVzZwcHBCR1pTZXZlUTlOc0F3ODArcWJMeS9iOFF3QWxHTXYx?=
 =?utf-8?B?TGRpNlk5WmM4NlE4QVk1THJ2Qng4TE04YzU0UmY2dXdUUEJ5U290YWpoL0hX?=
 =?utf-8?B?Q20raTZZL0pUdjNHRzQ1RnM0WEV3akpWWXMxT3l0WFpEeTg4M2xlRXVHdC80?=
 =?utf-8?B?L2NYMStaZzVuVWNJNTVCMlN5SjJndmh1SU03U0VxSzF4MjVHbml3eldsUmZX?=
 =?utf-8?B?SVZSb2tmUEdHQ3JtNjM2c05oWUxnanV4Qm5TMnh0YU93bGxPTG5Hd0ZaZTR5?=
 =?utf-8?B?OHlSekJJWk1McDBsV1d0S29DUjVJdjdKakFXVExKSGFZaWpQSUhuQWpMQzgw?=
 =?utf-8?B?cnJCNGZpeUZnUjVaZDhSUi81K2J6Q2lsbTQybHJvclhzOEtMSklUaEpnWVU1?=
 =?utf-8?B?TEtoVG1VOUpraVY1Y0hXS1A4TXhrNEs2eTBSSW8vblFHRHd3TUE0VFpocFVD?=
 =?utf-8?B?bTR2aTlmTFBUR01GU2g2QVZ2dFRYSytNZnJaV09jclFLMDFPNWhTRURsRFNu?=
 =?utf-8?B?QkJYNE1yYnRYTmg1djVPY1R4VEt1Z3g5QXFkSjVvbmdwbmRFOVZhREluMVV0?=
 =?utf-8?B?SWM5OWh1WVBLbDFWRktrRzFqVVN5dThKTzBYcTRmUGt4QzU4R1RSU2JPZXZi?=
 =?utf-8?B?K1JQMzl1NWFFRUtnWlVSNWdlemw3SXloNkVtUVlydzJLYmcxb09uUmVMNmg0?=
 =?utf-8?B?UVZ2MzI1NWZockNhQlpJWkoyV0x3ZVlRUzZXVXJuZ0NNYVJLejV5aDltRDdH?=
 =?utf-8?B?VDBpWW1BZWpqK2xhaGthb2NPRjhzYk5zMDE3UkMzR2xLQTBhWU1ITWdYVjRQ?=
 =?utf-8?B?ZzBlRStocEtORXNLL2FhNXN2Nmt5MHpYTjQ0NyszVDhCTzloZTB0T1phWEZz?=
 =?utf-8?B?SUF0eCtTRjlJdlY1djZpcVYrY1djNk5MS3krLzRlK1VoWlBDSUtkMnlJZll6?=
 =?utf-8?B?cFQ0VnVsdjhmRldvR1hvODFvc3FXYXBiTGpEcFhUOU5MVzUvYzFXL20yQThv?=
 =?utf-8?B?bkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6076682f-5164-41c6-d5af-08ddebb94666
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 13:45:14.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zuv5pgWP3vgDqIR37105FjCnBSvtUNUkwNxCXGIvkoiyaf9WIQ4jb2cDQ8makrOqPZ0gdFawPfNZtQqFu1bwlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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


On 27-08-2025 05:36, Xin Wang wrote:
> This patch ensures the gt will be awake for the entire duration
> of the resume sequences until GuCRC takes over and GT-C6 gets
> re-enabled.
>
> Before suspending GT-C6 is kept enabled, but upon resume, GuCRC
> is not yet alive to properly control the exits and some cases of
> instability and corruption related to GT-C6 can be observed.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4037
>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pm.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 51934d5dc44f..a2e85030b7f4 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -18,7 +18,7 @@
>   #include "xe_device.h"
>   #include "xe_ggtt.h"
>   #include "xe_gt.h"
> -#include "xe_guc.h"
> +#include "xe_gt_idle.h"
>   #include "xe_i2c.h"
>   #include "xe_irq.h"
>   #include "xe_pcode.h"
> @@ -177,6 +177,9 @@ int xe_pm_resume(struct xe_device *xe)
>   	drm_dbg(&xe->drm, "Resuming device\n");
>   	trace_xe_pm_resume(xe, __builtin_return_address(0));
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
Shouldn't this be needed only during D3cold exit ?
> +
>   	for_each_tile(tile, xe, id)
>   		xe_wa_apply_tile_workarounds(tile);
>   
> @@ -533,6 +536,9 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>   
>   	xe_rpm_lockmap_acquire(xe);
>   
> +	for_each_gt(gt, xe, id)
> +		xe_gt_idle_disable_c6(gt);
same as above.
> +
>   	if (xe->d3cold.allowed) {
>   		err = xe_pcode_ready(xe, true);
>   		if (err)
