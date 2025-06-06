Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2398BC5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:36:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE50810E154;
	Fri,  6 Jun 2025 17:36:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2ATE/0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD8A10E154
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749231363; x=1780767363;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=68khgDfX7Z+1Zk7asZZ/MnJ/jE3rNP4SoE5q6sijwnY=;
 b=j2ATE/0Bw2hoKr7r5dLFqMA6FmlkP9qdkCucIaZm9ASQdiiYHkCR2Rsm
 /UIICWurahyGcX2zGCDF1/kwBf/G1F80Qedn4MksCinsjM1sm49MyZP6h
 hcLP+h0hIFENo9N/PlzCOvLB/TSNAuifoxVbLLZdvoMXV7l1OhGLogVjT
 PaNppxguwy80OuPJeE6MXSCLRKXnoi+kVvUq7Tc132ehDlwdSSanqgznP
 skDo5cexkdY1l3Mppg+oHEQBwiDQ6Ters3+bFa7NII9CtL3Of5xMgceVl
 c6baBHOraQxjJ/hmVMGwm5sPX98ryn9klmU06e4HVh2yA4pQxwa7Le18m w==;
X-CSE-ConnectionGUID: agtmVQK2Smq5KesWTFjgpw==
X-CSE-MsgGUID: wFicsgJsTIaSBd2sqg244w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68831147"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="68831147"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:36:02 -0700
X-CSE-ConnectionGUID: TcCAXlufRl2i5IsOE0GZsw==
X-CSE-MsgGUID: 7hZgjE1vQX+uJ78P8iguxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="150721695"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:36:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:36:01 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 10:36:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:36:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHFemNqOqjwQRS2ziuKpp0I2zAvee0S7NlI/4eRl/ckyzlTRBHJvQAR/v0dofeQBt1b2iBCypHFBASeAFz+bhZ2je5teg/endllrkqBbaQJn6AfArLStGP2lq8IiysBMf/UW49wtOkqww06LcUE5bVQ8JfwPXYJHodWknu5CzndSYiCwPb4Lml2fwAaTO8/Xzw2quWDv7BMt0MLyFsI0YN0t1xAj53m485M44F+wHAtlkIToO7IZXkjb65zV6vy6CgMHL4b+f5VRqKIahiVdRfGZ9B694C2UdOv5N0dPKBaUzR8LJbQ/zk8eto1TmIGU0VDZqrVHOizURgCryDJVUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERc0mbcfb2YFoIeJz5OCKDi6ZD+AmVBHJ50xzFy1+c8=;
 b=cllCN8irZHWQ6PRNMParO2SxSxCcKbJ5vAodYH/QjKrpLsE8fLZzieD8wm3Kw/bcygmRmS/Ht0tvqBOvoyuxiiepsToNsMGP2OX1dlADA0f9uu8RJdiMyB3bS9bFSVNnmkq16ICbwJXBR86X2hBR7o1Q4fzb57LDQhjfLcAWjMhoTKQ0Gillkj2qoBQou5xyrbNmN73WFBQ3/opp/fkqi5FfBkjU/Vu3rY06A0IIKvptMKb8WBfQALwd4K2ouPAk5Mvw6Hoj2tGuToKO1KU5SQm4bAsPdLvbuVJbxODyxsnYu39hMIGrvCyW608v9s7sNOJILBmx9Nrtmh8Ypzujcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 6 Jun
 2025 17:35:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 17:35:59 +0000
Date: Fri, 6 Jun 2025 10:37:33 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 2/3] drm/xe/vf: Attach and detach CCS copy commands
 with BO
Message-ID: <aEMnXaHtgEUBolM+@lstrano-desk.jf.intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606124558.30966-3-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 2372af20-2376-4857-80db-08dda520998c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzhJV0pOZXdrWHZxUW4yNldHWGI3Z05hWk1qM09PMktqU21qaU9xWTNhNlBW?=
 =?utf-8?B?WVpyNHhFK1owUEN2dmtMOXdBMGJsUTBtYWYxOGtGZHlzV09qcGtKQVZuaVZL?=
 =?utf-8?B?WDhrZFgrS3JZUVV6ak4wcmVxeFpvdHpuS2Y0U2k2bDRtOHYrR012SzBsK0JS?=
 =?utf-8?B?TnFvMG42RncvcVNldG16VzZEQ1doS1Z0dExvYjhFTTM5U2dReTUyVFZWL2xB?=
 =?utf-8?B?MEl6R1dTcVg1cU4vREt5U05qeGd5M2tSbHM0SjM2L0dQOUJZUkxpdUx4OUpG?=
 =?utf-8?B?QzZKKzlnT3ZtbEl6UDNNbzRMSjJsR0JTVjcwQnB6R3J4RnRZQVJEZFhjSDND?=
 =?utf-8?B?SzZlc0Y3Y0VEa2hMU1FTSEdKSVdvcTRPZG4xdWxEV0ZkUGgzTjNpRytwOUNE?=
 =?utf-8?B?aGZwa2h5VUNyZS91S3Fkd2wwdktBUUVrZCtUKzl6VGxGdzkvQjdjcGJqVDBO?=
 =?utf-8?B?S3VWYnM5V3NRRzBKQ0E5WlYvVmp5UFUyTGdGQ21NSzl5MFl2TjE1TVp3MEhI?=
 =?utf-8?B?MzJZZUVqcE85ZThHL2ZOYkNHNE1jTUlXS0ZBdUttdjdBZ3dUQmE2dmZQSFZu?=
 =?utf-8?B?djhST1hkTjdVNjMxeXNWQzBrZlhIQW5jVFo0M2dXdnBvcFppRUlMTU1ONFpV?=
 =?utf-8?B?ai8yNDBWK21tSTd3REdOQkx0SzJJQXFyUDk5azBVKzJuN3AycjdjRWdBRWZR?=
 =?utf-8?B?aGRpQnF2UmFpU2RWZnpDTXA0eUR3TVZqODdDODJEVDl5Q21tTkhFNU9PSkl1?=
 =?utf-8?B?UjF0T05vRnlLMzI4SXNyRmMzYkgvbW95TThOTG43dnVrWG1pZXBTMGZ5U21j?=
 =?utf-8?B?NktLQWZrNWh1ZE1oZytBb2x1RXQwaWY1YmFjVVV4RENiTXk2VTg5dE1kb3lm?=
 =?utf-8?B?aHVRb1BaWlBuL28yY1QyR2w5SVZEaXhpM0JnNXRyZnhDRlFFZFNYUnlISEEr?=
 =?utf-8?B?TUlTZHlnRmt4WFNmZy84WjcrV1BMY1Z0ZXMrNm54WWxJMCtWTkgxVldVSERW?=
 =?utf-8?B?UXNUeVFsOHczYVlTVzcrVVJYaG8yc0tZbG5hL0UvMCtZb1ZaWVNPOEF6MTdN?=
 =?utf-8?B?RTFvOXpVdHBFTFkrcFhjRFpXWkN4WnhYc0pmbTBRcitKcXJmWWtVaWJ1YzVk?=
 =?utf-8?B?Z00vSzVFZEdqYkk5aXQ3WGxybTNoWmJYeTVYNmRjcWM5TUt6eGFEZm9QcGY0?=
 =?utf-8?B?QnhvektiZGRGQVpqK2JIbEhCZmdKSHJEZmtuQndUSHFNeW44c3NRY005VjVP?=
 =?utf-8?B?cUkxdlNvWk05bGpxQnVhd3A5ZExQZWN2bVpwZGFaZWRtbE9OdUdGYWZEaHlk?=
 =?utf-8?B?ZWJVZjJxQ1JYRkt3K2hXZllrZmdlOVpOenBPL0UraVBKWng2NzBnMklFQWdU?=
 =?utf-8?B?MENPNHo0UHhCazVkR0NLa091d3BrR0ZFKzZJWS9sZVdpdWR2aG56eDFvOGoz?=
 =?utf-8?B?emFXZEVDNWdhK0taWVJtRG9nNHJXTlJHcTRkdFVmRUJnc3ZXZnZNakhMU2hj?=
 =?utf-8?B?NnovVXpGbytpMVR2TlFpSWV2S0hkSC8xSXlFZ09oNkFsTWlnR0d5RkxBaExC?=
 =?utf-8?B?aEVEWFFYbTdtZTVETUVZRHY3UWxrYkJXcGpBOUxocEtxNmdzNGt6Skt6MlpX?=
 =?utf-8?B?K0tmQ0Q2Q3ZaNHZzWG54R3Nod1VhcjM5MDBWS2ZheStFZVJaR2VGWU1wdHZs?=
 =?utf-8?B?RkxVUVRsWlhucFBDQWU1S3A0TFVjR3JYbktmMmdvTFI1YkFLNWQyaUIwT2NO?=
 =?utf-8?B?SGNocy8xT3ZWWFN2SkZuZFl6VWFmUjk1S3JvZ09TeDB2eDg0aTd1eitwSy9n?=
 =?utf-8?B?OElEVnlEaSttVmVwLzZ6YVNDUm1KOFRkZzBOOXhBUmU3MUxWS0w5OStoR0d0?=
 =?utf-8?B?ejM2VGlxdmNieVI0R2thS1lVenZlVXV5SmJaVksyTG5rdy9pRThyemdselVs?=
 =?utf-8?Q?lo0TX2Kk2Qw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWk2TUdGbkhHNEpUUlRuVE1NUlB5MEdiaVpmR1RMNlNITDJEYVdTSjlLNmw2?=
 =?utf-8?B?SUY0R3Z1Vkl4c2srbW42enlkb3R4RHhoeTk3Ylo3aTdYQkMrNkt1Y3l3UlM3?=
 =?utf-8?B?a2RobXd4SElGVHV0aDlPN0thTWRoVWgxa282ajdqOUxiZkZtRVVOa09BbzBV?=
 =?utf-8?B?QURVUFZPeXhKRnk2Z2NWR01mRmx3eUJpVWx1bjQzVEFEMWlxdDRRY0NyU2Nr?=
 =?utf-8?B?bFc2ZTR5WXV3RU5PYm9UWjkyeExCS0I5NDFtMVdTbmxnRWFEdFNaOHRzZ3VB?=
 =?utf-8?B?K1FJbU5IYW9WdW1RN3pqeVowSHhESkFsMTBsYWRFVldrV1BzQXJtTVgrc3BP?=
 =?utf-8?B?QVJrNngzS2IwdmFPdzQydmdRdnptTDZuaklTb0srSDVWSHU2aDFKdERoUCs1?=
 =?utf-8?B?bG1BRzdNL255LzhGUGtkSkhFRUR4QmZMNnZ6ZFo3d0VoM2ljVzI2bW1xZjY0?=
 =?utf-8?B?eVV6R2tEcVVhTEFZTG5GeWYyaEUxeTBQelFhSDgwa2xPTE1YVm10TVpQR2Ew?=
 =?utf-8?B?ajFGdDRWbkIxWHVmalJlR1ZFeTVnUWgvSVlHa0M3ZzJmWUg4cmw3MHRqdUw5?=
 =?utf-8?B?YlZ4enZyOC9vVVpQN0FNMlVJZnpsS1NadEVPZ05tdXQxc3hCSVBNYzlNSmU5?=
 =?utf-8?B?TnA5T2NFamhUVXFSMnJxMDA1N0QzVjNZakN0aDA3WlJDalA1Um9jVEJyVmZu?=
 =?utf-8?B?SnlGcUl1RW5ONHdENUxzTjkzZTFBclZNcEVmSkQxNlNWYmpFTXUxWkZqRWF6?=
 =?utf-8?B?aUs1WEhLQzZNOG5NUm9EUk1WZWhMMWkzNVVaNHRhSXNEY3FlZG5BdlJueURM?=
 =?utf-8?B?UXZlL2JVOEFBb3BNMllZelAzbVc5MHJiU0ZQaVU1aUVmS1l3S3hFbkRMS0l3?=
 =?utf-8?B?UUdTYlZJcmlpbVNZMm54eHJYYklKZ2V5VkZIeXdqeVRDNTBLZk1WUTNLOHlF?=
 =?utf-8?B?S3NBUzdtUkI5MmVTV3AxY1hkOWkvSzhkWlBqdTkxbElrNnRNdjR5ZEF1YUYr?=
 =?utf-8?B?WWp4VU8yVFFVQnI5elBnNlFlRndlNVRwWitLN0lsSkZZR1R3KzF4c2J3U21z?=
 =?utf-8?B?a2NRSTBYMGw2VlE2QndGV0luV1V0c0tXSDZMMTUyOXg1bmd3a0dvQkJYUEFo?=
 =?utf-8?B?aUJEYSswL0lXd1k5OUZtTWFqenpnMm5XOEdXK2FTN0g2aVl3RDFFRWxWMHVH?=
 =?utf-8?B?TGkxRmZodjZ3N3NtRGZkdlRKc2lVNGFyN3JweHdLQzU2UjBWVnpFZ0pzY085?=
 =?utf-8?B?S0pOVXRVVkk4akV6OGtGU2lLNlRzVTNjaC90TGF4NlVIcVhKUldTazJYN1lM?=
 =?utf-8?B?VmdFTURGamw2cDE0ZXdDaWFXZDBWZHIyQ1VNa1JHU1VmYWlrQkNSOXJzb21K?=
 =?utf-8?B?cVlYcmcxd2RGVXAxZVJlN1AvdEdYR1hpcWZsVnpZa3hVZllpTDFja2NOZzVM?=
 =?utf-8?B?MndCYWJGT2s1ZEpSL3lTV1F5RTZBZXRxSWVJcmF0QWV6M3dJNllxZVd3TTh1?=
 =?utf-8?B?Rm9KeXU0SUJrZTJ0LzRYUjl1dTI5V1U2OFRWeXRnd0RLdW83cFNldE51RUt2?=
 =?utf-8?B?OU1HTXVOUUczRFhhMEorUmZISWVzTFhISlZnVFVCSEdwMDJzdWVvZzY4bzBw?=
 =?utf-8?B?VFBGZUxKbHp4MEtjY0lRbTI2MVlwSDNIWE44MFdYRDNNOUlUK1JnL3ptN2hY?=
 =?utf-8?B?RC9xZkZ3cjM0WGpZbkZWaVVIVU12U29ER1d6dU8wMzdrR2N0d2pKcTdFUkJn?=
 =?utf-8?B?bXdobnNRVytZSFlyTjJaUWpIcFBsM2l4MGFNM0VUL1BmMEI2ZmFXeGRUQWJ1?=
 =?utf-8?B?VFBsWnJVTHFaU25FZ0RnU1JNaFhpanhaQVVXdm5mRkZDUzAzTTg4eVJFeWhl?=
 =?utf-8?B?SEVDQldPUXBPOElnczRwMXVXOGFsdGJxVWYrOWU5NFc2LzFhK2ZDamk0eDJJ?=
 =?utf-8?B?ci9FOWZIQnZiczdnVlFmUDg5L1VyVXVJR2QwREo5dnRMQWFOcCtxVGIxRFRB?=
 =?utf-8?B?V3pvcm83SURuZER5cnRadGcrSWd1MENpYTZmL2FTWlMxemFsTjd4Y0pnTU9r?=
 =?utf-8?B?cW9jdTYvN1daeXVlWmF6TWI4TExjVURmL2ZnRHJBdWJsOGZlMnhUWTBMSS9X?=
 =?utf-8?B?T2cweHBuWFM5RW9reGxrc1JhSXFYbXJGZWRmOTMzeXVDeXZJUUdJWkdmaEhx?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2372af20-2376-4857-80db-08dda520998c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:35:59.2490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KeuEGRn9VY2UZo6MdLe0fxDHTNOitrDhCnE26mr1K5zxG7bXTedvCjo2AkpJcLt8sBB4kw3YiS+4TiMBBVFJjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Fri, Jun 06, 2025 at 06:15:57PM +0530, Satyanarayana K V P wrote:
> Attach CCS read/write copy commands to BO for old and new mem types as
> NULL -> tt or system -> tt.
> Detach the CCS read/write copy commands from BO while deleting ttm bo
> from xe_ttm_bo_delete_mem_notify().
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V5 -> V6:
> - Removed dead code from xe_migrate_ccs_rw_copy() function. (Matthew Brost)
> 
> V4 -> V5:
> - Create a list of BBs for the given BO and fixed memory leak while
>   detaching BOs. (Matthew Brost).

I'd still personally prefer a single BB per BO rather than having a
list. Unless I'm missing something, I think that would work and would be
cleaner. Any particular reason you went with a list of BB over a single
BB?

> - Fixed review comments (Matthew Brost & Matthew Auld).
> - Yet to cleanup xe_migrate_ccs_rw_copy() function.
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Attach and detach functions check for IS_VF_CCS_READY().
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/xe_bb.c                 | 34 ++++++++
>  drivers/gpu/drm/xe/xe_bb.h                 |  3 +
>  drivers/gpu/drm/xe/xe_bb_types.h           |  1 +
>  drivers/gpu/drm/xe/xe_bo.c                 | 23 +++++
>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +
>  drivers/gpu/drm/xe/xe_migrate.c            | 98 ++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_migrate.h            |  4 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 77 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  3 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  8 ++
>  10 files changed, 254 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
> index 9570672fce33..ee31556e00bc 100644
> --- a/drivers/gpu/drm/xe/xe_bb.c
> +++ b/drivers/gpu/drm/xe/xe_bb.c
> @@ -60,6 +60,40 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
>  	return ERR_PTR(err);
>  }
>  
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +{
> +	struct xe_bb *bb = kmalloc(sizeof(*bb), GFP_KERNEL);
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int err;
> +
> +	if (!bb)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * We need to allocate space for the requested number of dwords,
> +	 * one additional MI_BATCH_BUFFER_END dword, and additional buffer
> +	 * space to accommodate the platform-specific hardware prefetch
> +	 * requirements.
> +	 */
> +	bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +	bb->bo = xe_sa_bo_new(bb_pool, 4 * (dwords + 1) + bb_prefetch(gt));
> +
> +	if (IS_ERR(bb->bo)) {
> +		err = PTR_ERR(bb->bo);
> +		goto err;
> +	}
> +
> +	bb->cs = xe_sa_bo_cpu_addr(bb->bo);
> +	bb->len = 0;
> +
> +	return bb;
> +err:
> +	kfree(bb);
> +	return ERR_PTR(err);
> +}
> +
>  static struct xe_sched_job *
>  __xe_bb_create_job(struct xe_exec_queue *q, struct xe_bb *bb, u64 *addr)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_bb.h b/drivers/gpu/drm/xe/xe_bb.h
> index fafacd73dcc3..32c9c4c5d2be 100644
> --- a/drivers/gpu/drm/xe/xe_bb.h
> +++ b/drivers/gpu/drm/xe/xe_bb.h
> @@ -13,8 +13,11 @@ struct dma_fence;
>  struct xe_gt;
>  struct xe_exec_queue;
>  struct xe_sched_job;
> +enum xe_sriov_vf_ccs_rw_ctxs;
>  
>  struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 size, bool usm);
> +struct xe_bb *xe_bb_ccs_new(struct xe_gt *gt, u32 dwords,
> +			    enum xe_sriov_vf_ccs_rw_ctxs ctx_id);
>  struct xe_sched_job *xe_bb_create_job(struct xe_exec_queue *q,
>  				      struct xe_bb *bb);
>  struct xe_sched_job *xe_bb_create_migration_job(struct xe_exec_queue *q,
> diff --git a/drivers/gpu/drm/xe/xe_bb_types.h b/drivers/gpu/drm/xe/xe_bb_types.h
> index b7d30308cf90..b2358cc051ff 100644
> --- a/drivers/gpu/drm/xe/xe_bb_types.h
> +++ b/drivers/gpu/drm/xe/xe_bb_types.h
> @@ -12,6 +12,7 @@ struct drm_suballoc;
>  
>  struct xe_bb {
>  	struct drm_suballoc *bo;
> +	struct list_head list;
>  
>  	u32 *cs;
>  	u32 len; /* in dwords */
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 61d208c85281..b2ed5a36ab3d 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -31,6 +31,7 @@
>  #include "xe_pxp.h"
>  #include "xe_res_cursor.h"
>  #include "xe_shrinker.h"
> +#include "xe_sriov_vf_ccs.h"
>  #include "xe_trace_bo.h"
>  #include "xe_ttm_stolen_mgr.h"
>  #include "xe_vm.h"
> @@ -948,6 +949,20 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  	dma_fence_put(fence);
>  	xe_pm_runtime_put(xe);
>  
> +	/*
> +	 * CCS meta data is migrated from TT -> SMEM. So, let us detach the
> +	 * BBs from BO as it is no longer needed.
> +	 */
> +	if (IS_VF_CCS_BB_VALID(xe, bo) && old_mem_type == XE_PL_TT &&
> +	    new_mem->mem_type == XE_PL_SYSTEM)
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
> +	if (IS_SRIOV_VF(xe) &&
> +	    ((move_lacks_source && new_mem->mem_type == XE_PL_TT) ||
> +	     (old_mem_type == XE_PL_SYSTEM && new_mem->mem_type == XE_PL_TT)) &&
> +	    handle_system_ccs)
> +		ret = xe_sriov_vf_ccs_attach_bo(bo);
> +
>  out:
>  	if ((!ttm_bo->resource || ttm_bo->resource->mem_type == XE_PL_SYSTEM) &&
>  	    ttm_bo->ttm) {
> @@ -958,6 +973,9 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
>  		if (timeout < 0)
>  			ret = timeout;
>  
> +		if (IS_VF_CCS_BB_VALID(xe, bo))
> +			xe_sriov_vf_ccs_detach_bo(bo);
> +
>  		xe_tt_unmap_sg(ttm_bo->ttm);
>  	}
>  
> @@ -1482,9 +1500,14 @@ static void xe_ttm_bo_release_notify(struct ttm_buffer_object *ttm_bo)
>  
>  static void xe_ttm_bo_delete_mem_notify(struct ttm_buffer_object *ttm_bo)
>  {
> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
> +
>  	if (!xe_bo_is_xe_bo(ttm_bo))
>  		return;
>  
> +	if (IS_VF_CCS_BB_VALID(ttm_to_xe_device(ttm_bo->bdev), bo))
> +		xe_sriov_vf_ccs_detach_bo(bo);
> +
>  	/*
>  	 * Object is idle and about to be destroyed. Release the
>  	 * dma-buf attachment.
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index eb5e83c5f233..481b8e0d8ab1 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -78,6 +78,9 @@ struct xe_bo {
>  	/** @ccs_cleared */
>  	bool ccs_cleared;
>  
> +	/** @bb_ccs_rw: BB instructions of CCS read/write. Valid only for VF */
> +	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
> +
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
>  	 * objects. Exceptions are system memory on DGFX, which is always
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 8f8e9fdfb2a8..d7f3009260ee 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -940,6 +940,104 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  	return fence;
>  }
>  
> +/**
> + * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> + * @m: The migration context.
> + * @src_bo: The buffer object @src is currently bound to.
> + * @read_write : Creates BB commands for CCS read/write.
> + *
> + * Creates batch buffer instructions to copy CCS metadata from CCS pool to
> + * memory and vice versa.
> + *
> + * This function should only be called for IGPU.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   int read_write)

s/int read_write/enum xe_sriov_vf_ccs_rw_ctxs

> +
> +{
> +	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
> +	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
> +	struct ttm_resource *src = src_bo->ttm.resource;
> +	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct xe_res_cursor src_it, ccs_it;
> +	u64 size = src_bo->size;
> +	u64 src_L0, src_L0_ofs;
> +	u32 src_L0_pt;
> +	int err;
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), 0, size, &src_it);
> +
> +	xe_res_first_sg(xe_bo_sg(src_bo), xe_bo_ccs_pages_start(src_bo),
> +			PAGE_ALIGN(xe_device_ccs_bytes(xe, size)),
> +			&ccs_it);
> +
> +	while (size) {
> +		u32 batch_size = 8; /* arb_clear() + MI_BATCH_BUFFER_END + Flush + NOP */
> +		struct xe_bb *bb;
> +		u32 flush_flags = 0;
> +		u64 ccs_ofs, ccs_size;
> +		u32 ccs_pt;
> +
> +		u32 avail_pts = max_mem_transfer_per_pass(xe) / LEVEL0_PAGE_TABLE_ENCODE_SIZE;
> +
> +		src_L0 = xe_migrate_res_sizes(m, &src_it);
> +
> +		batch_size += pte_update_size(m, false, src, &src_it, &src_L0,
> +					      &src_L0_ofs, &src_L0_pt, 0, 0,
> +					      avail_pts);
> +
> +		ccs_size = xe_device_ccs_bytes(xe, src_L0);
> +		batch_size += pte_update_size(m, 0, NULL, &ccs_it, &ccs_size, &ccs_ofs,
> +					      &ccs_pt, 0, avail_pts, avail_pts);
> +		xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
> +
> +		/* Add copy commands size here */
> +		batch_size += EMIT_COPY_CCS_DW;
> +
> +		bb = xe_bb_ccs_new(gt, batch_size, read_write);
> +		if (IS_ERR(bb)) {
> +			drm_dbg(&xe->drm, "BB allocation failed.\n");

s/drm_dbg/xe_sriov_err - I think.

> +			err = PTR_ERR(bb);
> +			goto err_ret;
> +		}
> +
> +		emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +
> +		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +						  src_L0_ofs, dst_is_pltt,
> +						  src_L0, ccs_ofs, true);
> +
> +		bb->cs[bb->len++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
> +					MI_FLUSH_IMM_DW | flush_flags;
> +		bb->cs[bb->len++] = MI_NOOP;
> +		bb->cs[bb->len++] = MI_NOOP;
> +
> +		if (size == src_bo->size) {
> +			src_bo->bb_ccs[read_write] = bb;
> +			INIT_LIST_HEAD(&src_bo->bb_ccs[read_write]->list);
> +		} else {
> +			list_add(&bb->list, &src_bo->bb_ccs[read_write]->list);
> +		}
> +
> +		size -= src_L0;
> +	}
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> +
>  static void emit_clear_link_copy(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
>  				 u32 size, u32 pitch)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index fb9839c1bae0..ab5ebb44d2c9 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -112,6 +112,10 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> +int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +			   struct xe_bo *src_bo,
> +			   int read_write);
> +
>  int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
>  			     unsigned long offset, void *buf, int len,
>  			     int write);
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index 41fe1f59e0e9..4b5cfc0d421b 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -5,6 +5,7 @@
>  
>  #include "instructions/xe_mi_commands.h"
>  #include "instructions/xe_gpu_commands.h"
> +#include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_migrate.h"
> @@ -184,3 +185,79 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  err_ret:
>  	return err;
>  }
> +
> +/**
> + * xe_sriov_vf_ccs_attach_bo - Insert CCS read write commands in the BO.
> + * @bo: the &buffer object to which batch buffer commands will be added.
> + *
> + * This function shall be called only by VF. It inserts the PTEs and copy
> + * command instructions in the BO by calling xe_migrate_ccs_rw_copy()
> + * function.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_migrate *migrate;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;

ctx_id can be enum xe_sriov_vf_ccs_rw_ctxs

> +	struct xe_bb *bb;
> +	int err = 0;
> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (bb)
> +				xe_sriov_err(xe, "Probable memory leak\n");
> +
> +			migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> +			err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> +		}
> +	}
> +	return err;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_detach_bo - Remove CCS read write commands from the BO.
> + * @bo: the &buffer object from which batch buffer commands will be removed.
> + *
> + * This function shall be called only by VF. It removes the PTEs and copy
> + * command instructions from the BO. Make sure to update the BB with MI_NOOP
> + * before freeing.
> + *
> + * Returns: 0 if successful, negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
> +{
> +	struct xe_device *xe = xe_bo_device(bo);
> +	struct xe_bb *bb, *pos, *temp;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;

ctx_id can be enum xe_sriov_vf_ccs_rw_ctxs

Matt

> +
> +	if (!IS_VF_CCS_READY(xe))
> +		return 0;
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			bb = bo->bb_ccs[ctx_id];
> +			if (!bb)
> +				continue;
> +
> +			list_for_each_entry_safe(pos, temp, &bb->list, list) {
> +				list_del(&pos->list);
> +				memset(pos->cs, MI_NOOP, pos->len * sizeof(u32));
> +				xe_bb_free(pos, NULL);
> +			}
> +
> +			/* Free-up head BB */
> +			memset(bb->cs, MI_NOOP, bb->len * sizeof(u32));
> +			xe_bb_free(bb, NULL);
> +			bo->bb_ccs[ctx_id] = NULL;
> +		}
> +	}
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> index 5df9ba028d14..5d5e4bd25904 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -7,7 +7,10 @@
>  #define _XE_SRIOV_VF_CCS_H_
>  
>  struct xe_device;
> +struct xe_bo;
>  
>  int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo);
> +int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index f67f002c7a96..9545c5cfc2b1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -28,6 +28,14 @@ enum xe_sriov_vf_ccs_rw_ctxs {
>  	XE_SRIOV_VF_CCS_RW_MAX_CTXS
>  };
>  
> +#define IS_VF_CCS_BB_VALID(xe, bo) ({ \
> +		struct xe_device *___xe = (xe); \
> +		struct xe_bo *___bo = (bo); \
> +		IS_SRIOV_VF(___xe) && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_READ_CTX] && \
> +		___bo->bb_ccs[XE_SRIOV_VF_CCS_WRITE_CTX]; \
> +		})
> +
>  struct xe_migrate;
>  struct xe_sa_manager;
>  
> -- 
> 2.43.0
> 
