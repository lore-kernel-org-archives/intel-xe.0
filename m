Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD5E6F095
	for <intel-xe@archiver.kernel.org>; Tue, 23 Dec 2025 15:08:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCA510E15A;
	Tue, 23 Dec 2025 15:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAWPly9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E4210E15A
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Dec 2025 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766502483; x=1798038483;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bf0KkJkxbthbZUIQDSWXHRhG+YRp5yYVqgAwoGCRtsg=;
 b=DAWPly9oh765+vK2TQaNrAoTwfohOZh5YCIeTjaB4bN9FbMEX7Ca4xqG
 uDm3wAj81vLKSx923nXe6cWBRtjJdjr2nT6XI0PdJacCmLmRnXpYLdIl2
 QO/Dbe67GGsOUjQdiyV02kiUKKHe2nnYAa4J28GTLLBV1kJzMJsOCtWtO
 v9C2kzdfarK4c1c42vkt60i1kV959LcBgFYvbqv7i0xCWAnlvkwM8k24I
 NjRDYN1dIzJUEuLIhoBW7JEXFTbegrkUEB32tD5MHW+Dov0+6iWJ/yCyv
 P+a4hbCbnwiovnXpLiIyZIYMRAaV+ArizoxDcwwA7oEi8XD/Gt3tAMQ9c Q==;
X-CSE-ConnectionGUID: O0RBMp1fREKxNrIrRQubPg==
X-CSE-MsgGUID: 9QGTuQdeTPGOPhlTFFKhWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="78984640"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="78984640"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 07:08:03 -0800
X-CSE-ConnectionGUID: xGXi6VaeRcC4l0bu/WRSRw==
X-CSE-MsgGUID: +Uq39iY/Q8eCrtaViBXrEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="204868286"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 07:08:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 07:08:02 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 07:08:02 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 07:08:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYZCv/MyZx7Ejs9i2pHw+0h2Ks0a3onFBOYFrBtn+55F8hLr0BC4xySAfSYmMRRVDO6YREyuoB3lgjIeqXQ91whnj/SWElL3LsK3PIohZwG5f/p6mzeADJCTaO1q6Dw6yT5M6PgZsZf62i8IghBg+gmavLFadyl3rVklZ1qDzKlKPEYeYhuSm+xNwWZf6kzO4DyZxnm8GiepBvaibkd0OToF/8UnLBOiDVlHR9XmC+7ltPQJTb3FP1U52nB8Z0rQMO3hdOQJs0qnIfvk8SK/Bji3uq02XqBVGl3QUL4Xj2RcbytzwUDk5/P8mEUn1HMhSBnkiGog6lkRTo3ey6HLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WCs5E7YuNghe5pts249mzR7CgJGKQc4RNJouT1G5FZg=;
 b=tg0eu2oIZJZ/+Y+wFC82z12QPN4AuIyHEMY7Irecj9KtPnxzKGyS9chc3UE5D/uoSmuR1HWFCvENktqH7Vbzkd84E3DaACasWYj4AaE9c8JwtjZEyCN9uGZkCN22qv40tAQeGZs2dZGszJja30eCgW7Kg6VQdS7A20Tn7HSuGPjx+zv88QKCeGDKcdTfe0CESawnsyA2tgSfO8JpZ4N4xf9K5DJ8/ggEcB6SQv6lWLKHKAmsMBuHHDuYsgwjXKkNuL3DJcAJdYCFY21UNhDn9S6dxb9haVImeisbo47rH7lUVSAzOuqQe2Zy5tGpj7oPtiWS13YB4bubw3yjwR3KAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 15:07:59 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 15:07:59 +0000
Date: Tue, 23 Dec 2025 10:07:56 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/migrate: Configure migration queue as low latency
Message-ID: <aUqwTJaZfR5ly2CU@intel.com>
References: <20251223115327.49555-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223115327.49555-1-francois.dugast@intel.com>
X-ClientProxiedBy: BY5PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:180::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 61db8c04-7623-4b3d-0f3e-08de42350f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzhPTUJwRXljVzgyU1lwWU5iN1ZGSGM5bXV2aFVmUVpQV1IwNmRaNFVvOWpo?=
 =?utf-8?B?OGhscWxWWmxmUlp2dDBNdEZhbkN1bWdkeG0yS0xEQU5jZXR4ZjJ5NDlNMTdI?=
 =?utf-8?B?Qy9xc0E0ZHdrMkFaaEkrVVNZdkYrMlJPU0lBZmhpN2t6WHU5em1ZWElTbGFR?=
 =?utf-8?B?NXhpUy9JYTlJSi9OSzhTRlk3Qk14UXpTajNtSTIrcGJFcGppelIxUnhYVXZt?=
 =?utf-8?B?RGRmMTc1ckw1ZTdsdGtNV280Z2puZVMyZEM1RW5VdDh0eFlWazJ6MndwWC9O?=
 =?utf-8?B?ei9BR0YvTGZYYmRGRE9NZ2o0NlFoQ2RXQ0lJcnRlOERhc0lLNm4xMW5HQ2dH?=
 =?utf-8?B?MVJzQlFBL01ETjlxd0o4MEM1OWxWRXM3NWFEU240UHgwbXNpL1dQVGJTMVNy?=
 =?utf-8?B?WEVlUCtLRUNTYURHS01mRVBMWExtb3duZFdoUk1OcjhKTEZodE1ISUxIazd4?=
 =?utf-8?B?cG1lbWR1VFo5QWN4TjVpQVZ4UlJhVGZ2cEN4Uk1lbDhwVVRjejZiVW9JZStO?=
 =?utf-8?B?MlkreUZ4a3dvaStaK3VzdnF5eXFSVlFVWEFkM0FGMkwwcTlXcERZaVBYVGdS?=
 =?utf-8?B?alZFQTRoYVNwZnJpaHRnN0dmNlJ5T2JXbW1sbmttb1hhalNpaXAzUFcyWko5?=
 =?utf-8?B?S1N4eHhkWWVoVm1NQmRjOGs0NzE1R2VvR08vZDRtcmhGM3lXOFIxcHM4Uld3?=
 =?utf-8?B?RGticnBRNkw4Um91R0w4dzBwVERRSEtxclowUFE1UHd0cWNPbHExQjQwUXdQ?=
 =?utf-8?B?UzdaaHJVM1I2K0tpL3l4SERjdXdZZ1U0a3h3ZmUxaS9iZ202d25UaTMvRHp5?=
 =?utf-8?B?anREdWk5dWlSS0JmdlpWRExwSWtlTXhLOUEzY09rUnRqelgrNzVQanVMUzVn?=
 =?utf-8?B?b0xhaTAxRFVIYW5ydU0rTURueUtCSFBLOGliOHdBYVFqeGhtYUExaHRBMTBD?=
 =?utf-8?B?RXNFWUlxb2VaU0Z3SHRWSUMzbmtyaFlpL09PQ3lWL3hOYXI1RDVIb3hwbnZW?=
 =?utf-8?B?V1FXZVdidTlreWtOSWgwZzlBN3EvRXZodWZrS1pPUXRXMmN2RW5UUVZhWVJm?=
 =?utf-8?B?aXR0QUJ3azhGUThOVytMbXRlYXVTSS8zRmMxbDhTNHZ6cVdrdXZXSDd3YXVE?=
 =?utf-8?B?djJmeG5mcXVwWWxpSXhFTUFUU3lpd3VPazIvT1FSdHhIRGZwSnFwVGYzMFhy?=
 =?utf-8?B?MTlrbFBuQ3AxSTJCd3dBSk01c0VCMDIrV2luWjNQU2JaL25iSmMwWXZScTNk?=
 =?utf-8?B?N2k4WDlNenY5ZnZpZTBLM3F5dHg0NmxONlJMVnpjR25GU3h4T3JFVktIekxr?=
 =?utf-8?B?K3lhaWRwZzkwZnJQa1o4TjQxbEk1SnNZeHR0VkdxRDZ6V3B5UlZ0ZDlmZi9Q?=
 =?utf-8?B?OEk5c3hYVUtRZWFtazJYdkdsSExQM01JcGhnMDZuL0pvWFdvNW9wRG44S21q?=
 =?utf-8?B?bXJKMDJGODhmbTRLbGdYWm05d0dnRjlBWkc5UW8yYkZGeGZISmRCR29SVzZq?=
 =?utf-8?B?dDIxdlNlVEFwNXlsTktKVTZLajR2NWtYSHNXaWNVMVJkVGlwUGJGRnM3OThI?=
 =?utf-8?B?VE5mTklkWEJ3NDNqQk9TL1l0TUFRb2FPQ2Vveks3ZkJ4MDI5dTZTdzFVOXd6?=
 =?utf-8?B?cUxCMDBuUG5nN1hJUlBsRVNBQ3B5V0RJb3BiY2lPTUdTLzFuMnFlWnQ3Y0tZ?=
 =?utf-8?B?cGFwU3NEcUh3bG45YXBBQk90amJkVHdJN1JxWUJoRmRFRWZhVC9Pb01oSTRO?=
 =?utf-8?B?WU5kNUNEYllQNDdQenU5WnhVaVo0UDZ4Z1FSME5PVVVPQXVyQW9QNktQQmZr?=
 =?utf-8?B?MGhFMyt4TzBWYkVuZm1UZWk3WGV4T21rVzhxb2RnTEhnaU14WEdzY2tlQmd6?=
 =?utf-8?B?RklaOHNacytWWW5kZXV1QzFEV0VHZ0xIaS90OE5YOHZMVDVQcW4wbGplWHBo?=
 =?utf-8?Q?dYJqA5ScLub25GehEzLTbgfT7iUA+ogm?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2EvNEFGU3VLTEpqYXk1Zi84UVF6M1hsM05QTHE4SjB0MU9RWjA0blV0ajBr?=
 =?utf-8?B?ekExOFVkUm5lVTRyelErSHAzM2NEU05kclVNUzhUb2craGRRM2xCeWE4YkJ6?=
 =?utf-8?B?ZGFLdVZsVXZ4bGZQUTdieWErOFgvZTh4Yi9nZG9yUUdXZklLUzk4YUd5cDhz?=
 =?utf-8?B?N0M4UWNvUE1iUll4eFZkcjk2eUJuaGJIY2FsU2NFWXRJaklTQ3JZbVgrOEZs?=
 =?utf-8?B?ZmgvTXFXUGFvaDlNUzJuMTZFWElRTUJVOXYxeFJ1NWxVQnB3QVRmK25pZFFr?=
 =?utf-8?B?T3pqakgxV3pZTFNRUmtRMnpTOTdFWHVLZkQxUFJPblBxUzdITFFJc0QzSmNW?=
 =?utf-8?B?QzlCSHdRL2Y0L3BraUM0TmVtZHVFUWFQQlU1azQ1YnJRRmtqbW1kMVFTMHda?=
 =?utf-8?B?UWhaNnlVRVJwaG55OGJ4amZGclNDalUzS08wbU5KOFNjd1ZyWUI0dWtQSENn?=
 =?utf-8?B?WkdUUXZ1ekdISE1qRlp2ZmpOWThZbUllSHQ3ZWFhZTVGQTVlT3lPaXljNy9o?=
 =?utf-8?B?QWtjVXdsenRUakQxeW5OdlA5STgyeW5xdVIwS2hzYzFiU2FPRXZVZXNYeDl5?=
 =?utf-8?B?ZzNKU2JuMHdJRzllTnFIazFYUmZkajhnRzhkQ29TaC9aNnBXT294anlyK0tz?=
 =?utf-8?B?WkE1OUw5RDBBQjBLOXE3c0NoZWdQWnpKM2MrbmhEb1pTRWU0ZGZoVlJ1cDl1?=
 =?utf-8?B?b2k5OTVNWFh6WWx1cGZNN3gxdmZqdVVyODhHc3dpcjhhSitzSmREZmRMRTU1?=
 =?utf-8?B?RDg1VnZETVQ2eHh3RndXMWRFVmhPc1JkZEdqSmkrMVU5Y3I5emd0M3owK0Vv?=
 =?utf-8?B?b3RrNnhiZEt2SDl2aThkTGZPU3RRRnNMenJ5WmdpQTZLbzlpUDNGWUViWDVw?=
 =?utf-8?B?N2pDU2FJMmF0T05sVm91NEtCZzFDeXZTUzEzVlA0V0FyWWtxN1JzZTdYUDlh?=
 =?utf-8?B?REd3WGZtWTUvbkFyZ0hCV3krMWI5TnRoZnhSR2NDblFTRVVoQzJVNTI4c2d4?=
 =?utf-8?B?cEM3ZlNIUGdrd3RlYUp2WFgxRkowd3NyTGo0Rk9wOU9HNjVwT1lVMnFQUXc2?=
 =?utf-8?B?WGpQODg4dE5HNUJhRzlMYllFQ3QvRkhWMzFFUkY1ZUJlczREbkw3QTNoS2pU?=
 =?utf-8?B?Wi9RWi9uemJvcmoxWk8xRVJ1eUpYODJxendxcGx1b05KSzVoSSsybnhrK0Vy?=
 =?utf-8?B?WitSUS9TaG5ydVdCYmY3eUxzQkJYY0JNNXRDR3FUbzFzLy8zYTRRWXB1MkdZ?=
 =?utf-8?B?bnB0Vzg3SlorZG1kTkRBd2tPdE1QOE1La2h5ZEVOU1VuL21mclVTYVdUWVk1?=
 =?utf-8?B?VFFvNHp1Wi80T1pUdW5LQ2RKZUNxcTFiTG1FS28yRnpBT0pzNjZ0MDZqSnB5?=
 =?utf-8?B?ZWYzVmR1WkYrcHlsV1FFY3BoYnU1bE9OUkRWN1RXOHA0a2YvL2RnVFpQZms1?=
 =?utf-8?B?MExENDRLSklOaDJkaFpkaHFiWGZlcTdIa2lURmlhMlFFQzhqa0dpanRkNmFR?=
 =?utf-8?B?RnR3NC96QzJSSlFkbVhjODVRaFcrbVU1aFBXMGdpQWxqSWY5VW9jL3oyWEJW?=
 =?utf-8?B?NUZsd05TMzlGRzlqTFFDS3AyQjNLa29RUzVYdml1V09Cd2NkRjhNTlByK0tm?=
 =?utf-8?B?enZFdnRHcmptYVRScmRXWllrdDh4aGMrOGVySkRMOUZEeWxzeVM3TWwrMmJN?=
 =?utf-8?B?Q1BpQ3Qxb2RxRE5VZlIyYU1xRGV0eDRsT3pEbFplaHJJMWFCN3dvVURZTnFq?=
 =?utf-8?B?WmM0Y2lvSDNSMzZ5WVd2a2ZsZ1g1Z0pKMFpRMzZRUUJRMnprZGRuWTNEVGRF?=
 =?utf-8?B?UDRrbkZ4Z1hwZWVOQUFNbndhRFkreUczVEFEZUdZZnFEZVkvQmlxY2pQWFVD?=
 =?utf-8?B?emdETDlrYmNzbjZ0UEppR2VPRGZxL01CWURUYVNoN0cwenEvcUNIREl2NTZG?=
 =?utf-8?B?SU8zWTdPSTc5bVYzS3hyRFVxWU1DLzhtcGdndklKSnpDNDZBNXFaRWhZK0ox?=
 =?utf-8?B?Vzdia3E0TlVwNHdoODFYamF5N2UyY0FOeEZlR3pjdWVINW1zQ0VkbEZsL092?=
 =?utf-8?B?Zm1DNXZhRURwZ3c1anJ0MEVqZWlCQVNrR2ZzajdNbkFrbk9Gc2t2MWJrdjNL?=
 =?utf-8?B?ZmZWQnQ2eWY0TnZGSUdTYmJHSXdzUTNPYzhOMjEvcnoxUUdDS2lacHF5a3JX?=
 =?utf-8?B?R3J3NnZPaWFGRjQ3RHZHbUNiMWpTNUVIWW16SUNiaGw0RzJtZEZBSVJyc1dp?=
 =?utf-8?B?YXBNa2xtV21pTUZ2QStjMkt1ekZSS1VyS1RPTDlCZ1RHbHA3d2xpeDZzMEF6?=
 =?utf-8?B?VTd6TVNoVWJIRjZ4ZzBzTEI4QWUrSTBFVjNMN20xd2dKUjZmUWVDdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61db8c04-7623-4b3d-0f3e-08de42350f60
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 15:07:59.4191 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lvqj4CZQ4sL8eZNXdCuXXh16aL6tAFI1c5jSvs1S+YlbGVU18qjfvU8zZPPJ3a9dADKk04xMk+qCfTfphM4J/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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

On Tue, Dec 23, 2025 at 12:53:27PM +0100, Francois Dugast wrote:
> Commit 5488bec96bcc ("drm/xe/uapi: Use hint for guc to set GT frequency")
> introduced low latency hint for use by user space when creating an exec
> queue. This instructs SLPC to ramp the GT frequency aggressively.
> 
> SVM relies on an internal exec queue to migrate memory upon page faults.
> This change creates this exec queue with the low latency hint to speed up
> migration.
> 
> This should not impact systems where GT frequency is set over sysfs, or
> with long running workloads which give enough time for the frequency to
> ramp up. An example of memory access pattern that shows an improvement of
> SVM performance is running hundreds of times IGT eu-fault-2m-once-device
> in xe_exec_system_allocator. The copy duration provided by GT stats in
> svm_2M_device_copy_us shows per GPU page fault:
>     ~ 165 μs without low latency hint
>     ~ 130 μs with low latency hint
> 
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

pushed to drm-xe-next.

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3de8ce2516e2..00eef41a9e36 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -472,7 +472,8 @@ int xe_migrate_init(struct xe_migrate *m)
>  					    EXEC_QUEUE_FLAG_KERNEL |
>  					    EXEC_QUEUE_FLAG_PERMANENT |
>  					    EXEC_QUEUE_FLAG_HIGH_PRIORITY |
> -					    EXEC_QUEUE_FLAG_MIGRATE, 0);
> +					    EXEC_QUEUE_FLAG_MIGRATE |
> +					    EXEC_QUEUE_FLAG_LOW_LATENCY, 0);
>  	} else {
>  		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
>  						  XE_ENGINE_CLASS_COPY,
> -- 
> 2.43.0
> 
