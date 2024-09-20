Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C2EECF9C60
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 18:08:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54D4410E85C;
	Fri, 20 Sep 2024 18:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JKb/BZEM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6124210E85C
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 18:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726855680; x=1758391680;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=t5AcmgXFfJMdJsmrybfaZkaz3Tt/qIeAIlr95cNMBXo=;
 b=JKb/BZEM5TOXvSzPSo9nYjZ5dKo6aXcDaFe91e7VCoiiq33JqrHncS65
 Ugh6tdhidZPOLKvHXMmJzf4IIxZqhrs++6LlQ1Dpp/A4H/peRxmqOSwZh
 fdHPDUf8T8QD6vdqa+WzQm6Y/snOBxKkcxmj+9vcuwC+3GirhEmRZj+4o
 yYmT5fKdZGH7+wlWlqHeyJygTz8Oy3Z+qnvnveit2R83afwG9SCEX8Vce
 32K6xST8lWuj9OXMLPaGWQ78U7ikxtasXk+AhmzpqmbMHABZ0H6vGQnJy
 xDTiY9ntM7e4WbI4lzwMgSk1TinKXAshAx1slJgW+bxydftkcLi2aAnCM w==;
X-CSE-ConnectionGUID: C//t71T0SES747Yn4sWg9A==
X-CSE-MsgGUID: IKHt8FWlReGM+A0LZXoGuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="37006454"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="37006454"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 11:08:00 -0700
X-CSE-ConnectionGUID: eWFV2afITDyo9O3OXvb8Sw==
X-CSE-MsgGUID: x02YhM88RFig0bJhgMaNaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70384345"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 11:07:59 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:07:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:07:59 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 11:07:59 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 11:07:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpVKSCBdqZ8/i7Y2rUK/ttq/kcilWHHHm+EYFPTQpwDnf8hDT67aB0OycAmpJWgoBoP1YxT9X3TqdIiBz7SV6UGQPCxXObjO+0G2O7+2bTWBp5KFWUoaXE9eK7TLvV7Tn2+/zH3/Wh3OXSqzocz/zbn9cGBN8cqotjES4Dbyu6rksJFlieq6t3xPLm2KaEgbAei+TVRggQ33KiKMAc9MvVkU0Lv0knXKYH48BJ5DmZ96EyZRft5JeEoOMlES3IR2UeoCkTqaf/l97coni0/tE7Msg4xd8ZKqha11AKJAa4EQrMWGpdJfNChduFQnXPLFeYVdGs+BCcIzt1Xyn7jNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MjmVxccB5zz/B5YyCbzXoA242HQriUBD8WLk8Jo2Yk=;
 b=GQGniKzbGYu+loR1L2eQ8+z2xbFK86foY4NdquVkEXN8Qy/n0lTSUiroTnN0u/WooZr2tlnhSJ62xk9OPpbkdlxsJNwA00aeewb199QnZK/Q0pI0bJG2gv95H2AYejIWPCqAudQdA56Q5Jcw71qtdv46O6VwArKP4T3+ZyGInI0BchwPnYOQGyCpLu/bragTlTvkH8JIRwh7JO2p3CdfynNqRyVpsPYFKTSSBpxHUlTqQ8sKZwa01HNdsXksKKHgQfhI2o9e77qLvch1XxXsTbf3vDqZQbIQQPB92BhrS5G1VYfQ3nGiCxYd+MNWgP4jt+e/qrUH43I0YNV/wMrFDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6278.namprd11.prod.outlook.com (2603:10b6:208:3c2::8)
 by CH3PR11MB8341.namprd11.prod.outlook.com (2603:10b6:610:178::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 18:07:56 +0000
Received: from MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2]) by MN0PR11MB6278.namprd11.prod.outlook.com
 ([fe80::a9df:4a4d:b9e7:76e2%5]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 18:07:56 +0000
Date: Fri, 20 Sep 2024 11:07:52 -0700
From: Harish Chegondi <harish.chegondi@intel.com>
To: "Ranjan, Joshua Santhosh" <joshua.santosh.ranjan@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Ausmus, James" <james.ausmus@intel.com>,
 "Degrood, Felix J" <felix.j.degrood@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Cabral, Matias A" <matias.a.cabral@intel.com>,
 "Kumar, Shubham" <shubham.kumar@intel.com>
Subject: Re: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
Message-ID: <Zu25-P4F9bzSZo78@intel.com>
References: <cover.1725866097.git.harish.chegondi@intel.com>
 <5f7adcc0dffec68bf88b282a5d2f92a9f05834ca.1725866097.git.harish.chegondi@intel.com>
 <20240910000914.GD5774@mdroper-desk1.amr.corp.intel.com>
 <87ldzx3hg7.wl-ashutosh.dixit@intel.com>
 <ZuObKzhNGK3O5P1Q@intel.com>
 <PH0PR11MB56099277EA4382E08CF4A78EA1652@PH0PR11MB5609.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <PH0PR11MB56099277EA4382E08CF4A78EA1652@PH0PR11MB5609.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0284.namprd03.prod.outlook.com
 (2603:10b6:303:b5::19) To MN0PR11MB6278.namprd11.prod.outlook.com
 (2603:10b6:208:3c2::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6278:EE_|CH3PR11MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: e14d4f37-a6d6-4f16-1f38-08dcd99f2713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?citpOEx0bUlPMXhlWHNnTjVLMXhJWGs0UHpuamt6dEZveUNsK3hoTDIzakox?=
 =?utf-8?B?dWlITTFMalEvYUxzTHZ6SGtueDlMcWVtck9JQVVYQlRHUjhVNXl3a2g5L3hi?=
 =?utf-8?B?RFRsd05MUE5EVU1HZTk4UzloS3hiWlVSdnQ0UzRCSC9pUU14NXF1c0UvVHBP?=
 =?utf-8?B?Wk4rc280SHl6eFJtaytCOE9aSXoraUJ3OGFZTFl2VDBqZitGc2kycVdYbTJI?=
 =?utf-8?B?QkxkbXNKVEl1b0U3WVBxdzJGSm81VlR4ZnVoUUpnRHV6K2I4NjlmcXNBb1FJ?=
 =?utf-8?B?dUhrS2ZZQ2VXS1QxUW5GMzVUZWROVXF6bEZ4dTF1ZWVQemdSWkJabEFtWmJp?=
 =?utf-8?B?alFYTXJVLzB4SWFzbFlDUGRUNk5FV0s4ZmpVUk9DRWsrdTNNaXpyWFJBRUtm?=
 =?utf-8?B?QUpWTnVVYlY1bnM0SldNdUx6R3Uxak9ZZ1ZpajZjZFdid3lFREhzejFXbUVL?=
 =?utf-8?B?ZWV2STMvbnNXRWpIZ1VEYm1UMk11VlFwQnVKNUhEUUV5Y3UvdHp2dEp4dFpk?=
 =?utf-8?B?NlhmOEllYWJzYit6V0tHZHYxTEJPS29oWEt1NjJTaFNFaWVoZHJRb2RiL2ZQ?=
 =?utf-8?B?ZUpjMjhPazBxQy9yRS9mY0ZuNjk1WEpkaXVzcGJWbms2UlBUOTFxNWQvcnlm?=
 =?utf-8?B?elBMUnJrQU1vbmhPZWlnUkZ1MzEwZnEyVWZGUGhQcTQ4QXJQYmd3Y243cWVt?=
 =?utf-8?B?Z1djMDl5V0dwV2dUaFc1L1JwUHdaT2pha1ZKUHhOMHUyR2ZsMTA0YUpBYVJW?=
 =?utf-8?B?dXF2S3AwTVZ5L2Y3bTVvd01rdEJBdEhoUkdZVEZ6czVIUmZFMElrVnQrZFhk?=
 =?utf-8?B?QkNoNWJ2TEhSM2t4SlFibnRlMUZiUmMybk4rVkp4WXZqdTlDNkNPbHF0TWhh?=
 =?utf-8?B?MjQvNGlkVlhnRGFXV3F2aTZTNFRTNDVud1RTZTJ2eHdDQldyNU5BK09peGlD?=
 =?utf-8?B?cXVpZDJNczErczg1MVdlbEZoTjEzdnRPZnlOTkZFUDZDVWlyRVk1eUh6UzQ3?=
 =?utf-8?B?Y0F6YWgvcXlEUUxTOWlzaHIvdjdwUzlWSnBiTDFOZ2xhYk1tR204cjcrcTdX?=
 =?utf-8?B?MUxRZkFGRXpVeDNCTFdaWDFJYUtHeWdRTXNUaDY0RnZoWEFrNk4yMFNyc0JJ?=
 =?utf-8?B?RkdCZlJRV2M0TGNMVG5VOWp2aGY1QWljOURrMGc4N0wxVVFpU0xxei9YZnRl?=
 =?utf-8?B?dUQ1MndXMDM3a0hMbE5nQ2owNTI1eUV5aGtwcWladW9nVkQrOVJPRFVSQmIz?=
 =?utf-8?B?QlYxVDVDUjBtK3NnZURsRmxUV1ZTVVQrdUlrTVQ5M3NYMi9zanJBUGVydGdM?=
 =?utf-8?B?M1ppSmw1ZjlPcHhDbVRXdlZMZjlNUTZTSVlIbytrQitPdmZSdVExY3FMQkdp?=
 =?utf-8?B?NHBlNmJmVWZBWWRQVE9nbmxDZndCcW1lQ21VYWpXakVBWXYwUmdGSENNaXdH?=
 =?utf-8?B?V2lmT0JMSUdEY2FXVWJQcFkxS1pScFp2SU1COXM1RGNCSERrc0E0b24xLzU5?=
 =?utf-8?B?eU92Q1BVT3FFWmlhNTVjVjNXMEtScFJjcnVOTmg0UlVyeG83TjdHUG5RT3BI?=
 =?utf-8?B?VnYwTjZOVG9lMXhRMWxkVkZ3RDZvcHhITXdQQ0FwNlpnM1FnTVRYMHlPVnV0?=
 =?utf-8?B?QnVoVi9QQ1lOM3d5M2E1RDg1QTJ3dStaL05ZVXBvNDA0M2tBcDA2RDJuOHBM?=
 =?utf-8?B?TDljTWVoeURhbi9PeXp4WkxIRytBazhoa2gvNlM3ZkRkOWNLS2d5RG5nSWM5?=
 =?utf-8?B?VFZ1NmRBYWVVRnBMaERWZ0szb3NsS1NZUEhCN1lZRzAxMzlFQWtUczFjYzFG?=
 =?utf-8?B?ZTIvUU53SEx6UGhhWExYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6278.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3VwVnhLbUJyYnNnSDdZTmZOR0ZEZERZZ0xVNFp6YWtJUVFLbmZ1OHZ2d1g2?=
 =?utf-8?B?RFBRZk91dlB6M1g1TWdTWkVGMytiT3FKWGRmTDNrRFo1ck41a0I1Z1pmcEVw?=
 =?utf-8?B?TC9PQ2czT3A0MktYUHgxSUgxelRhdGNCSTRpMHovT0JyTkhleDdTeHcrRHJE?=
 =?utf-8?B?USthSW9DdExuajdSWk9DYWtFSFkxRXRzaElVSUpGd2xicm1OVi9CbmQ1UnJY?=
 =?utf-8?B?c1BPc3hUenpPQTEzV01ONVJUa1RuUGZyVk1Qd2hmRmE4eTl3TXp4bXE3bnJZ?=
 =?utf-8?B?Qk1UdzVKY0RqYjdTbDJpMUp2bGJxd3JOQ0lpMWU2MUxjNFRMMk83WHZKZUw2?=
 =?utf-8?B?OEdWL0JFRWk3MHhkUUhtNDBQcDdxMGlqWWNXTEdSZGdBMFlKU29zRk1JU0Np?=
 =?utf-8?B?SDA4dURRY091bzNFZjN2OGFDUXAyOUlUQUF6NGRJeFVsZUhvTzBYMGZKb1k0?=
 =?utf-8?B?aFk2L2FLeWFXemRhSWNpd3JjVTd4ak9Db3hZajVyN1cxcm9TVEtMdUhhSitX?=
 =?utf-8?B?Y3NRaHl5dVdKK3B4TzBVVWd5L1dtUGZ4Rm5UcDl3ZjIwQUNqQUE3bkIrMDRH?=
 =?utf-8?B?eGRlT0hLYXBWUG9ndjg5R2tNVEdEckJyVm15WUJMemVScTdNZldJWHJoRThT?=
 =?utf-8?B?WDVzMGQzSEhDSzB5RjlGS2hRUVJxY2RKc2pFNm5mQUVzSU5kMWdJRUpDRnln?=
 =?utf-8?B?S01CRitGclFVM1FMeHBFL3dzUXRrUDJyM1RQdlBoclYxTVl0LytETk1ocm9s?=
 =?utf-8?B?eitkaUtXdUtndzE4a05WMDBZOUtRTmFnMTR1eTZtdEttQW9rdk95NXVhTHRq?=
 =?utf-8?B?RXllMlFhNkFwVS9yNnp4TU8xK3Q0UE53K2NqZU1ISm5odFQxM1k5V3FsMjNx?=
 =?utf-8?B?b1lybHc3aGxuRndwNFpEYnhPeUdHUURJZHAxcmZKY3JDcngrM3NMM0JFMVM1?=
 =?utf-8?B?Y2d2bmFZdUUvWUd5TExpaER1VDQvbkJEeW4wNG9wWlE2WFY0dUJlVHNib1p6?=
 =?utf-8?B?UmNJRGxIMnpEUG5DL3d3YjNhQ1hZR0w0c2FYN3BNTVpoL0h0RS9XY3RuLzNs?=
 =?utf-8?B?RXNVb0VQVXc2QmFJNnA2ejFRMjUxeGRORHEyK21aTVhkWGlUV2YyRC9oM0tm?=
 =?utf-8?B?OWJ5VmVZUnQrcTQvNGtzbTcrd2ZiaXhubDk5YndyN0tTK2hXU0sxV3kwUFFE?=
 =?utf-8?B?OG80bmlpVFBwMnZ2V0duWktHVCtnbC93ZmRheGZmZjlkM1VnUmQxU1RXUXBS?=
 =?utf-8?B?WlNrQ1FSTjZKR2YzZkhzYXVJVWRxalV5aTVLZWJlb1hZdTJrWlVQUHlKT3FL?=
 =?utf-8?B?aGlGclNrRElxRjk5WnRkQlUzNk9mZkp1TVBXdlFGZXZvcEZsRWNBL0h1WWp3?=
 =?utf-8?B?Y3psckVHdGxvdyszLzVEWklEVTRESlNIVUZMVzNIN25KRG5PRmU5dEtPQXVp?=
 =?utf-8?B?eGtBWjcxYllvQ1UzMkdLU0lKTzF0RjJjanN2Mis5R0krWm9QQWo1V2hSRVU2?=
 =?utf-8?B?OE0xTUZkQnVjQjRGaVJ4ZnVnNlYxNjZLMTRGV3I0WHhBRnM4Tk0wUkVkVE9n?=
 =?utf-8?B?Z045MWkxUitDQzhXaXBadmpLUGF1bDNHYXMya1Q4QlM0d2FkalR3QUcwL1Rz?=
 =?utf-8?B?RkZDM09PaUtsMGx4Qjc2RC91cCtGbkhpQlF2ZjEzR3RaRFJWdEdZUnN5UnQv?=
 =?utf-8?B?SGdKSjdCelhVMVozR3VVRE9QNHJzNHM5eUo1SURZcHN0RERvbXl5dWhKN2tG?=
 =?utf-8?B?dWZwa1lXMkVJVThIVFRUWWFneE9Rd1J2cDM5OHRLdU5iU09OYkFKOWt5MkJV?=
 =?utf-8?B?STYvREhIRW9MVEJPaXJOWmF6aGpHVnE1YWNzOTk5c3pqVjk4cjhFbmI2YzRZ?=
 =?utf-8?B?Q3RIdk9XZkR4RFVKVlFiL0lNUWxpaE8vQWQ1ejRBZUt0YWcrT0xNY3AvcTJT?=
 =?utf-8?B?RXhFM1hsbW1yRG1mWm9FcWVxdzhEbUdBdEMzVEZ3QWZnSkFEZFMzcjR1Y3FJ?=
 =?utf-8?B?d1BMM2ltb3VWdjZRTVV5QXlLOWNINjl0ZXZxMWZxTHFhS2s5dmtWRVU0TjdD?=
 =?utf-8?B?aVZvYkE2ZlZJaGVDYTYxcFo4R1pjd1FPMXhHOFE3Y3YzSmU1MWQ5WnpQK1Yw?=
 =?utf-8?B?aERTSzJaZERLMk1LRkxYVW4vUWZ4dzg5Z0Vwa0RucU5FR1hEcnBUOVVHdG1w?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e14d4f37-a6d6-4f16-1f38-08dcd99f2713
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6278.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 18:07:56.0254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PkPsO6AT20HqUGs8IoWnk5IFT75mPVhpHvT13NEhJp7OfIazJRj/3jDm9zbNhEtX/xbLUJW+JSQ2FMGZBMfkGXfWXGflA5LakARHs0gAIb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8341
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

On Fri, Sep 13, 2024 at 12:35:28AM -0700, Ranjan, Joshua Santhosh wrote:
> Hi 
> 
> Please find responses ([Santhosh]) inline.
> 
> -----Original Message-----
> From: Chegondi, Harish <harish.chegondi@intel.com> 
> Sent: Friday, September 13, 2024 7:24 AM
> To: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; intel-xe@lists.freedesktop.org; Ausmus, James <james.ausmus@intel.com>; Degrood, Felix J <felix.j.degrood@intel.com>; Souza, Jose <jose.souza@intel.com>; Cabral, Matias A <matias.a.cabral@intel.com>; Ranjan, Joshua Santhosh <joshua.santosh.ranjan@intel.com>
> Subject: Re: [PATCH v3 1/1] drm/xe/eustall: Add support for EU stall sampling
> 
> On Wed, Sep 11, 2024 at 04:21:12PM -0700, Dixit, Ashutosh wrote:
> > On Mon, 09 Sep 2024 17:09:14 -0700, Matt Roper wrote:
> > >
> > 
> > Hi Matt,
> > 
> > Some comments about the uapi below.
> > 
> > > > @@ -1694,6 +1696,138 @@ struct drm_xe_oa_stream_info {
> > > >	__u64 reserved[3];
> > > >  };
> > > >
> > > > +/**
> > > > + * enum drm_xe_eu_stall_property_id - EU stall data stream property ids.
> > > > + *
> > > > + * These properties are passed to the driver as a chain of
> > > > + * @drm_xe_ext_set_property structures with @property set to 
> > > > +these
> > > > + * properties' enums and @value set to the corresponding values 
> > > > +of these
> > > > + * properties. @drm_xe_user_extension base.name should be set to
> > > > + * @DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY.
> > > > + */
> > > > +enum drm_xe_eu_stall_property_id {
> > > > +#define DRM_XE_EU_STALL_EXTENSION_SET_PROPERTY		0
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_BUF_SZ: Per DSS Memory Buffer Size.
> > > > +	 * Valid values are 128 KB, 256 KB, and 512 KB.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_BUF_SZ = 1,
> > >
> > > Does userspace really care about this being configurable?  Even if 
> > > we have a platform with XE_MAX_DSS_FUSE_BITS total XeCores, the 
> > > difference between the largest and smallest sizes here only saves 48MB of memory.
> > > The hardware makes this configurable, but is there actually an ask 
> > > to expose this through the uapi?  If not, I'd say we should just 
> > > always pick 512KB internally and keep things simple.
> > 
> > Agreed.
> > 
> > >
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_SAMPLE_RATE: Sampling rate
> > > > +	 * in multiples of 251 cycles. Valid values are 1 to 7.
> > > > +	 * If the value is 1, sampling interval is 251 cycles.
> > > > +	 * If the value is 7, sampling interval is 7 x 251 cycles.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_SAMPLE_RATE,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_POLL_PERIOD: EU stall data
> > > > +	 * poll period in nanoseconds. should be at least 100000 ns.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_POLL_PERIOD,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT: Minimum number of
> > > > +	 * EU stall data rows to be present in the kernel buffer for
> > > > +	 * poll() to set POLLIN (data present).
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_EVENT_REPORT_COUNT,
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_GT_ID: GT ID of the GT on which
> > > > +	 * EU stall data will be captured.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_GT_ID,
> > >
> > > I mentioned above, but it feels like this should be an intrinsic 
> > > part of the API, not something coming in through an optional extension...
> > 
> > Not sure what "intrinsic part of the API" should be. EU Stall, OA etc. 
> > are now types of "observation streams" and there is no other 
> > opportunity in the observation stream interface for this kind of 
> > information. Also, gt_id is EU stall specific (e.g. OA uses oa_unit_id 
> > not gt_id) so it should come in as an EU Stall property.
> > 
> > Though question for Harish: do we really need this? What if we return 
> > data from all tiles/gt's in a single read() call? Since we have 
> > already determined subslice number is not interesting to UMD's for EU 
> > Stall data, maybe gt_id is similarly not interesting?
> User space folks said that they are interested in the EU stall data at the GT level. So if we decide to return stall data from all the GTs, we may have to append the GT ID to the data. I will seek feedback from the user space folks regarding this.
> 
> [Santhosh]  Yes. L0 allows Metric collection at a tile level granularity. 
> 
> Thanks
> Harish.
> > 
> > >
> > > > +
> > > > +	/**
> > > > +	 * @DRM_XE_EU_STALL_PROP_OPEN_DISABLED: A value of 1 will open
> > > > +	 * the EU stall data stream without enabling EU stall sampling.
> > > > +	 */
> > > > +	DRM_XE_EU_STALL_PROP_OPEN_DISABLED,
> > >
> > > Is there a reason not to make this one the default behavior?  Is 
> > > there really a benefit to auto-enabling on open that makes it worth 
> > > the extra API complexity to make this configurable?
> > 
> > I agree, this would be a good idea. But unfortunately this got in for 
> > OA (if I were doing OA now I would have taken Matt's suggestion). So 
> > we either
> > (a) keep it the same as OA for uniformity, or (b) document that EU 
> > stall streams have to be explicity enabled before read()'ing data.
> > 
> > >
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_xe_eu_stall_stream_info - EU stall stream info 
> > > > +returned from
> > > > + * @DRM_XE_OBSERVATION_IOCTL_INFO observation stream fd ioctl  */ 
> > > > +struct drm_xe_eu_stall_stream_info {
> > > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > > +	__u64 extensions;
> > > > +
> > > > +	/** @record_size: size of each EU stall data record */
> > > > +	__u64 record_size;
> > > > +
> > > > +	/** @reserved: reserved for future use */
> > > > +	__u64 reserved[3];
> > > > +};
> > > > +
> > > > +/**
> > > > + * struct drm_xe_eu_stall_data_pvc - EU stall data format for PVC
> > >
> > > I thought there was an ask from one of the userspace teams that we 
> > > make the layout discoverable?  I.e., a runtime-queryable format 
> > > description that lists the counter type, size, and offset in the 
> > > record of each counter that has usable data in the records?  Did we 
> > > change directions on that?
> 
> [Santhosh] Yes. From L0, there was a request made to have a runtime-queryable format.
Yes, there was a request for a runtime-queryable format. But as per the
request, the driver would parse the data and would send only the
non-zero data to the user space. But as per the most recent discussion,
it was agreed that the driver would send all data it receives from the
HW without parsing/re-formatting the data as one bigger memcpy() would
be more performant than several smaller memcpy()s.

If the driver is sending all the HW data as-is, would it still help user
space to get runtime-queryable format from the driver ?

Thanks
Harish.

> 
> > 
> > My suggestion is to eliminate these struct's from the KMD uapi header. 
> > See my earlier response to Harish's patch.
> > 
> > Thanks.
> > --
> > Ashutosh
> > 
> > 
> > >
> > > > + *
> > > > + * Bits		Field
> > > > + * 0  to 28	IP (addr)
> > > > + * 29 to 36	active count
> > > > + * 37 to 44	other count
> > > > + * 45 to 52	control count
> > > > + * 53 to 60	pipestall count
> > > > + * 61 to 68	send count
> > > > + * 69 to 76	dist_acc count
> > > > + * 77 to 84	sbid count
> > > > + * 85 to 92	sync count
> > > > + * 93 to 100	inst_fetch count
> > > > + */
> > > > +struct drm_xe_eu_stall_data_pvc {
> > > > +	__u64 ip_addr:29;
> > > > +	__u64 active_count:8;
> > > > +	__u64 other_count:8;
> > > > +	__u64 control_count:8;
> > > > +	__u64 pipestall_count:8;
> > > > +	__u64 send_count:8;
> > > > +	__u64 dist_acc_count:8;
> > > > +	__u64 sbid_count:8;
> > > > +	__u64 sync_count:8;
> > > > +	__u64 inst_fetch_count:8;
> > > > +	__u64 unused_bits:27;
> > > > +	__u64 unused[6];
> > > > +} __attribute__((packed));
> > > > +
> > > > +/**
> > > > + * struct drm_xe_eu_stall_data_xe2 - EU stall data format for 
> > > > +LNL, BMG
> > > > + *
> > > > + * Bits		Field
> > > > + * 0  to 28	IP (addr)
> > > > + * 29 to 36	Tdr count
> > > > + * 37 to 44	other count
> > > > + * 45 to 52	control count
> > > > + * 53 to 60	pipestall count
> > > > + * 61 to 68	send count
> > > > + * 69 to 76	dist_acc count
> > > > + * 77 to 84	sbid count
> > > > + * 85 to 92	sync count
> > > > + * 93 to 100	inst_fetch count
> > > > + * 101 to 108	Active count
> > > > + * 109 to 111	Exid
> > > > + * 112		EndFlag (is always 1)
> > > > + */
> > > > +struct drm_xe_eu_stall_data_xe2 {
> > > > +	__u64 ip_addr:29;
> > > > +	__u64 tdr_count:8;
> > > > +	__u64 other_count:8;
> > > > +	__u64 control_count:8;
> > > > +	__u64 pipestall_count:8;
> > > > +	__u64 send_count:8;
> > > > +	__u64 dist_acc_count:8;
> > > > +	__u64 sbid_count:8;
> > > > +	__u64 sync_count:8;
> > > > +	__u64 inst_fetch_count:8;
> > > > +	__u64 active_count:8;
> > > > +	__u64 ex_id:3;
> > > > +	__u64 end_flag:1;
> > > > +	__u64 unused_bits:15;
> > > > +	__u64 unused[6];
> > > > +} __attribute__((packed));
> > > > +
> > > >  #if defined(__cplusplus)
> > > >  }
> > > >  #endif
> > > > --
> > > > 2.45.1
> > > >
> > >
> > > --
> > > Matt Roper
> > > Graphics Software Engineer
> > > Linux GPU Platform Enablement
> > > Intel Corporation
