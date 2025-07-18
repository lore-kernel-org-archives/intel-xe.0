Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D74AC83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 18 Jul 2025 04:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8EB10E0F5;
	Fri, 18 Jul 2025 04:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXlEXSRA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A17710E0F5
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Jul 2025 04:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752812766; x=1784348766;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=axKy9euCzYgjfBta5x9p9KGBt1yl0klVTiUFhb+P3ZM=;
 b=lXlEXSRAUgsIbDynTjRN1e7aRYiPDUowtQqXBlk1CC8BZKNRdwmMXPVk
 sEUjOVc86+n/+nEuBlyl84b5ZBXyuiK/dPbl2fXa5hdUkgoU6BcM37ttF
 3hn+cobDWr9/Aen1Za+jAxs+m+bUb+k/7F5zE2i+dkXcgghrvH4w3Sycn
 iGSn6gtdXerTbQoi9m6PYsxIHLjHO2uiZ3GUKQepHGrAHmvcVXeMZqeWC
 MpwI49C/JY+voxCfbbhypps6xbcZcAMRMsj6CRIK4fq3InZSyl2IsEDGG
 Bnuh2Nui0TQGBAatZC+XBs/RM92YUpEelqzvlO7P6GWWiQ/fo7GONqv4C A==;
X-CSE-ConnectionGUID: kpqEMeYVRv+XPE0YPYP4aw==
X-CSE-MsgGUID: 3kHdLGEmT62wfeI3LYIBMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="72670119"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="72670119"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:26:04 -0700
X-CSE-ConnectionGUID: jku/PDd2TEWT4Ymrkcy+1A==
X-CSE-MsgGUID: R6b8QvpbRGC7ijl9Hed6dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; d="scan'208";a="188946583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2025 21:26:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:26:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 21:26:01 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 21:26:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SliTuJlCXz+jx7dB1XfltL9hHL86KZpM0Px1I+riAGP6gCMVHZ8MdIwNQeUS8zgP4cqHOaNRTRD+QMt33urf7ELDnwvZZqJ/3yCQq0lhDLqlffEI7bbVgtKcWMwir/Ie/6ydKA1YKeJ4aqYBZ2cavv7jeofMMbIOaxHXOK40ytCvyE0MDAkXO7ZmaxGcr0YpLzmSAT3vFAmglAiuj2NyCi0FHUlWTGqwGWrubDWWN2NBO/btXc7AnRzvrRXn8g6sS+9K5wcTS7D3WXko91tRoZne9rSizxiIpQl77DTbfEoDimTdrKfyD73iuWoXvWZBgpRYTBf3/wmBVXWZREVFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyBg6jJmrndgeaYj8C5P8kvjvHkZBhwL0hSPOQpx0/g=;
 b=N3jEcGyCQ3VlVvHTvNdA7o9swR9tNFipdbmzbqL6Tkn9pCM4DGX2daZX/DuLbIWrD71SmBiQ6/sDQntf/w9Tg/PLqLJKYQ2qdMeKOBMBjGIy3bfx3Nv3fTzn85ncRyQY4p+TJUUoGsfpEctl/S+YIGMVTZYyUvHHwRq7Iz2NwxhopLXVWoHDi0rcGAWQj+uIKOwGzH/JClQcpYsJScZERfToAGsrK26lQkVztkklHr15qQFPuSNT4PrNcjbQaGUAd28Ay1Y83HxZjaAbU6pL62oCdurlGUl5Si6IpShfrIvncTomkmQcRQltEoFJZ8ciaHczq9Mo+UuAjUPCdFq51Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB7462.namprd11.prod.outlook.com (2603:10b6:806:31d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Fri, 18 Jul
 2025 04:25:58 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Fri, 18 Jul 2025
 04:25:58 +0000
Date: Thu, 17 Jul 2025 21:27:44 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1 4/5] drm/xe/migrate: Use order to calculate migration
 length
Message-ID: <aHnNQG1y6xSOq6ZK@lstrano-desk.jf.intel.com>
References: <20250717133928.526111-1-francois.dugast@intel.com>
 <20250717133928.526111-5-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250717133928.526111-5-francois.dugast@intel.com>
X-ClientProxiedBy: BYAPR21CA0003.namprd21.prod.outlook.com
 (2603:10b6:a03:114::13) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: c7415634-238b-429d-74f9-08ddc5b331e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlNFM213NlZHOUpjV1FJTHIzM2ZzWU9SZFlaWHV1ZnBaa0V0RHJzVVhQTDVY?=
 =?utf-8?B?OWdSd056Z21wRWlSZ0EraWVSanoveWYwK0FEVm1SUVhjT2t6UnZMcnR2Tkc3?=
 =?utf-8?B?VnhZOUVGeUgyNVdvV1AycjdhQ25pZUVaUFJYYzhsTHRDck0vM1Y2OEs5bmNI?=
 =?utf-8?B?Qld3bjVoRWl3SE9tUW1nQlJDU0paREUrUHZzMmVkdE5WbkYvZU16a1JQazhH?=
 =?utf-8?B?RlY3d2ZlNVBNU2h0WWZDNEFWdHhTMXVIQlFLdDFOY1RKTzNWUUdxemR1djIz?=
 =?utf-8?B?SGpXZi9YWDUveGRaRVhZMzVNaEJCUkJaR2xEblRXU2xYNytQZUlPVUVCd09u?=
 =?utf-8?B?U2tQUDliM202eGw1MUVrZGNSTGJJcklUb2F5T2ZML1ZTSzFBSDBtSkpjT2hh?=
 =?utf-8?B?SFFPWHA3T080ck9GTnBONi9XNzR4WFZrZDN5T0hSSVlYeWNELy8wZjN5eHZh?=
 =?utf-8?B?eGxVYmp3Q3ZPZ0s1UWY3UjlwbE9NNGhVVHdzQVpEVXFJS0Q4TmQ5ODNMWVln?=
 =?utf-8?B?VEpCaFFtNVVKV2trSXlKanVrcFp1YTgzdG8yVitmVUt6VUh5Q1AyUGFvbUYv?=
 =?utf-8?B?NWxtT3N6OEVWVU9ldEdBZy9CMUg5V3R5UmJlcWdwM3lwcnhrdXBwM3FQOHRp?=
 =?utf-8?B?MnRyaXNmUEMyQnB2a2FXMkhHNGE1RjFKRFNYNEdpVGsvWFFkV1I4ZjB5Rjc0?=
 =?utf-8?B?Y21WMnJyL3BKakFiTElPTE9VR1Q2MkRGcXZuYytQaTRQa2JkZTM3Si9sRkZk?=
 =?utf-8?B?YnA1THY2VnkvT0Q3b2ZZaFlXTGk3ZHRtVnBsdUxSbUtqamR3Z0tHUVhudDBz?=
 =?utf-8?B?UjJobndVSlBTNVlPTU1vVzQ5c21sM3YzbDNHYUMxV0ZNMURlcnFVbVhvU3dJ?=
 =?utf-8?B?dXFBdEtYN1RLQ2lab1ZsOE9WcUtLT0E0UmFIaS9LaVBHUVluZHp5M2w2TFRa?=
 =?utf-8?B?bGRmSy9xZTFEeWMyd0VUaGx3RU90V081RTZHTVBaT095UXUwWFVzR0ZkNC9Z?=
 =?utf-8?B?ZWl4UmR1cTFreEJtK3pRK3VNUzlEaWNaNGtxaDU4MDA4T0ZEcXphS1Y0RVBh?=
 =?utf-8?B?TWRVNWUxMHdBNmtzNU9yRHZEcVJmaTI2QzJiaEpyNlRCNitUeEw4Y2VpNXI5?=
 =?utf-8?B?Smk5bVVhb0hleERrVnAzTTJVUVdJTWQ3UllBa1FCbUVwYXV3Zi9vQ3Uya1BX?=
 =?utf-8?B?akpOMy95OElmRi9jR2ZIR1l5MG9mQUZ0d25XRXRHcFM4MytGNUhsQTBFRzRK?=
 =?utf-8?B?aDBsaHhkWHpvYXpuVEt6c2lzTThvakVnZ2R3WkhIRDVneGZKTnNMQjlQamZF?=
 =?utf-8?B?WDl1emxrVGJoVUd6alJHbUpYRmgyMHFRblVHWHBBN2d3ZTlRaEs2dDNSWWFw?=
 =?utf-8?B?U3FnUGVpQWJyU0xXQThmRlZTQ0xyRWgyZlN2THV5TnhuekpoVVpQRjRxdUp4?=
 =?utf-8?B?OEdZSXNiMU9GNWNBMlc1eEJlVE5JTHdXQVo5ZjN6ckpKeUtad2M5b29mcUVC?=
 =?utf-8?B?NmJrUVdrbWVtS3BCdnpiS3N6MmlBVjhkZ0V1Z0E0M3RWc2k2MFFoR0p0WnhC?=
 =?utf-8?B?dkg5dmhwUVczVnpVZEhoeERHZjlBSjEyQnIva2NkRTlVNU1xWXlHOWlQSXNN?=
 =?utf-8?B?ZlNCZndWNHl0VUNVNWR5TExhRHh2ZDJrSHpYc1pvdFdpYlVHbGxSSmtDQ1o0?=
 =?utf-8?B?eDRpUDlBK2lzbVZSd3dYa1V3M2IxY3p4elg4a2psbFhoYytWT0pyV3hyRlpR?=
 =?utf-8?B?ejk0YVV2WVRDanJoc2dmeS85NDQ3d1BuZmt3UmlRdXVVdmIzLzlPNW0rUDNy?=
 =?utf-8?B?YzEzWmlKNDMwaTJRNGh1eW5kZXd3RmtJT2FkWUkvcVFkRFI2RGFPcXVaT24y?=
 =?utf-8?B?QWJkSXE3bFVSNVI2M3JTRHNYZ2hKdU5DeUc0aEpOTU5KSWN3WUFoSi9uMEFs?=
 =?utf-8?Q?aavSlcHWLRo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U09BUU5uRm1nTWk5K0Jhck1HVk1idmw5WDU3WWVPSVVYM3hkNWx4ZWkxajBq?=
 =?utf-8?B?TUQxWlRJVWYrTVUyeEhlVWxGb05pd3BNN05ORWQrb1lwN0hTTmcyakJmN0d5?=
 =?utf-8?B?dUp4NzhCNlBVZUhKczljUzRyZFZiVVk1UUNack1PQXJPTUtvN1BhN1lJVWhY?=
 =?utf-8?B?a0dlNHUzYTdtTlVLT1VOcVNOQUxrS3pNT3lEYjh4bFpUeHZKeEFMTEpSZjNp?=
 =?utf-8?B?QjBBa1NpaFdKaFI5ZFgxUzM0d3pKOVpDNWJVMExWVEprdUNocUdET2RteVNR?=
 =?utf-8?B?Y3d1MGR5YURHclJYOUYvc0JLSEdaUnlPYjllaEEvVVpjdGNXTjczK3JmeVlL?=
 =?utf-8?B?ODZVUTNVbW12V3FJem5OR1Z3c1Y4aVlMS1p5WExMNnUyQVloeTU1MldPbWhT?=
 =?utf-8?B?OHorSVNRT1h1QjhEK3E5TmN4ajMvdHBMTnhEbXpYU2g4Slh6M3dhRmV4c1Bp?=
 =?utf-8?B?cVpJMnpzU1p2WVhYZGpuVGFKcnJPUEVVRitQZWRHcGJrT0Z0RFF6SHJreTF4?=
 =?utf-8?B?ZE5qbU0yL2xxK3hLbCtXZStQWkMrRXpjMndpanFuYnlPd1piVTdrcUJOTmVF?=
 =?utf-8?B?S0VGSFU3UzAxNGJFVVZKY1NRR0hJbTE4d0RRL3lTejE1R3hETUJNMEZqelJ5?=
 =?utf-8?B?MWw0c0tNQVFZN1F6VmVVRkVIdWUwazFTNTFNZXpKWmFkUUFSRlNodzdOMUds?=
 =?utf-8?B?TlpENGQ4SEpvOHROOWpXOXQrbzVpK2V3bE9sZHIySlR3RmxnZEMycGIxb3Vq?=
 =?utf-8?B?VHMwRnZOdmdMeEN4c2pwYThUTi9KUXQwZ2NDaXoyMy9Gay9UcXN2MDhWVnlu?=
 =?utf-8?B?UU9oRkFYVEtVQ3hWMGJjU1BhQ1F1bjIvMFpZTjJJSlJVaWxiS3ByUGp3YWVK?=
 =?utf-8?B?aWl2VlJPcnV0NjQ3VkVuZ3d0QnFTdmJGdSt0T3FIQlpOclNzcWpZN0tnVkU3?=
 =?utf-8?B?SGtQbTZKZkc1czhvRlhoRVZUUE44WjBENjBYR0RlSWN1bVNNN291NmFzVWVZ?=
 =?utf-8?B?NWg5Q2h6QWhFTytTYjRBN0o5Q2xVRHgrWEZwWE5JeW9Xd2lxLzVSYUdON1dz?=
 =?utf-8?B?UWpVc2NXYUdyWHVrTDgvYTZBaWN2K29YcGREbDFnaFlxOXdPeFdtaDdUa2FG?=
 =?utf-8?B?VEdzUTVJS04zVWRFYnJYdi92c2NaSjBnM1hhdVZpMXJ5MzhwTXphT0Y5Risy?=
 =?utf-8?B?SlltQjByTFk1MnZSdjFjbHhjejc0NDMrTnFjWTU3bXdOeW1LZDRBYWV6RVRM?=
 =?utf-8?B?Yk81bXNiYzU1ZVRpVXlHUHIyS0tlVlZ3VGhrNVgrZnJ3ODZqejFSdy9uUm5C?=
 =?utf-8?B?MlAvRUtUSjFncEJVbWgrTmdOYkhzYVlueHBvT29hWTZ3bGhacmNwaFB2YndP?=
 =?utf-8?B?eXVQN0NvZnk3bHFDOWN5VGZYK2xPc1RyVEhQMVJLVXNGVVFJa3ZZQmlaWTlu?=
 =?utf-8?B?MDlaQkNBYjk1TVNZOGZCUXlqWHZESjlNRUFxT3NSOStuZHFndUpFa3kwTkNK?=
 =?utf-8?B?a1lxYlcySDc5Uy9sb0pFZExTVVZtYlpvNUlzNSt6c0doMEZrR1ora1hCSWpH?=
 =?utf-8?B?aFYwTHJDYUs0UEg0RVZsbW9BN0UyR3BISGFBcGdoZ1ZJOXZHVERsWWkyTWJk?=
 =?utf-8?B?WUdFWCs1SjBPOENJTUZyUFA2SURxOXJnVGRWQStaYzIwUHl6aDVjSkhaTGFr?=
 =?utf-8?B?RnhQZ20vR09jYlhLZCthQ0RRQmZLZjRkVTQ1ZW1xaVJDQmNrYWlDcEIyZnFK?=
 =?utf-8?B?ancwNkZFbFhwNHFFVE1IU0x5NkJjdjl4ZHR0NVQ3T2RVTmN3ZHBqMlIrMm9E?=
 =?utf-8?B?NHhZcE5nK0g1K1FIRnBkb3RzVXlyWFhyQ2l4VlB6K2F1V255Wm9XZmxCdHRB?=
 =?utf-8?B?TkNud3pSbURpc1RxdlRaME5uTCtEdXlJKy9tUVROZlNnRXRTaEhiaDRVeWt3?=
 =?utf-8?B?ajB1MHdvcHRabGl5dUx3ZkgvUDZZSVAzbDJzTUVWYlRmV3k5cnhwY0p4SVdR?=
 =?utf-8?B?RlZraWZCZXVoTnNPUkxIdHJzTlV6RHZLWXMxalJOM2R3UUhWTVJZN0VkMXF4?=
 =?utf-8?B?QWpCRlI2WnR4R0ZnaFNoNmNKQjNDYkQ0aCs2Znd1aFhjMTVLV29URUJaaWVj?=
 =?utf-8?B?TVc5QXpmYmhoTDlvMHo2WXBseXVJeTY1YWlkVldmMlo4ZHd1UzNpLzhIYTFx?=
 =?utf-8?B?dEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7415634-238b-429d-74f9-08ddc5b331e5
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 04:25:58.6004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wWzmr2MvRhLjVL1lPe3QgVrmW8XJThs6+bMCnDnxYSByJkZyKzjhN995lisB6JNNoiL8/I/A0uc1H17efJ4oMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7462
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

On Thu, Jul 17, 2025 at 03:38:26PM +0200, Francois Dugast wrote:
> Since GPU SVM can DMA map folios, it can no longer be assumed that the
> order is always 0 and that the mapping size is always PAGE_SIZE. Instead,
> to determinate the migration length, use the order associated with each
> DMA mapping, provided by drm_pagemap_device_addr.
> 

Hmm, I think the interface should still define npages as the total
number of pages mapped, even if drm_pagemap_addr contains entries of
higher order. In the case of higher-order mappings, I’d expect
unpopulated entries based on the order of each individual entry.

So, I think we can drop this patch, but update kernel doc in similar way
I mentioned in the previous patches.

Matt

> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 33d67993f1f6..efbf8c0f41dc 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1724,7 +1724,12 @@ struct dma_fence *xe_migrate_to_vram(struct xe_migrate *m,
>  				     struct drm_pagemap_device_addr *src_addr,
>  				     u64 dst_addr)
>  {
> -	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, src_addr, dst_addr,
> +	unsigned long i, len = 0;
> +
> +	for (i = 0; i < npages; i++)
> +		len += PAGE_SIZE << src_addr[i].order;
> +
> +	return xe_migrate_vram(m, len, 0, src_addr, dst_addr,
>  			       XE_MIGRATE_COPY_TO_VRAM);
>  }
>  
> @@ -1745,7 +1750,12 @@ struct dma_fence *xe_migrate_from_vram(struct xe_migrate *m,
>  				       u64 src_addr,
>  				       struct drm_pagemap_device_addr *dst_addr)
>  {
> -	return xe_migrate_vram(m, npages * PAGE_SIZE, 0, dst_addr, src_addr,
> +	unsigned long i, len = 0;
> +
> +	for (i = 0; i < npages; i++)
> +		len += PAGE_SIZE << dst_addr[i].order;
> +
> +	return xe_migrate_vram(m, len, 0, dst_addr, src_addr,
>  			       XE_MIGRATE_COPY_TO_SRAM);
>  }
>  
> -- 
> 2.43.0
> 
