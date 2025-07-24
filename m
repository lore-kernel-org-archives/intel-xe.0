Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A1DC83F26
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 16:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029A810E03A;
	Thu, 24 Jul 2025 16:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VipTUc3o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8887410E03A
 for <intel-xe@lists.freedesktop.org>; Thu, 24 Jul 2025 16:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753373384; x=1784909384;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QvdjudnjGsHUKme2wS5HD7Tq/SxXFSaaXtg9rHSjlto=;
 b=VipTUc3o872kwl+YTPEu+gyt1ETEsbqOdCBulM2p0tm144K+Xp4LjkPz
 8T0HKJViGWXcpNE+PMP6l57mc1TJaaq/mOoPwzHnIrNAPS5IvvVIEhGAc
 6jF82GEGjMZ+70zmDjoj8bQJAc1lsJh1Jr0IjK7C4yZUv1kf67V1+N7Na
 IirTf/wy6LpzTRRM7DJCsVHTQ95ILyG+yvVbpqikxxbqIfYMnuGsMgLRC
 CAvKZJzLDrwpMoZQtWirsySNcxQos+19ijkuHWIFRZMdX4bONQlOEIDSN
 nOXFo7YWDtnBuZIme5KiYrB1j7v5AIY/jGXSzIcuJ2xI9SDXiXycs/AIq A==;
X-CSE-ConnectionGUID: WmiP0MMtRjW2jHxBF/mE1A==
X-CSE-MsgGUID: 7QvutR6VRMaaNNlQiZshMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59501731"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="59501731"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:09:43 -0700
X-CSE-ConnectionGUID: 6f/aAAbHSf6zPw1fi/6IXg==
X-CSE-MsgGUID: aE8vxgC2TP2QUp/LA60V/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; d="scan'208";a="197460899"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2025 09:09:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 24 Jul 2025 09:09:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 24 Jul 2025 09:09:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 24 Jul 2025 09:09:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=adME96+1ym9JzKUyPnZ1Y0OXIRanbGtaJ9Q3UpJycHda/sL+7z0xGAJ80gwgeX63n/Ora2AJSoAf8J6t4HjP2dGb10B7p/jtyG715MZ2zUsQcDRH50VJ7Iy97AtHv8maNakxYt+5jKCW4tVuyH66tm1fxYyFXWPffPIZCPHk8vlfoZnsop8PUW2CMiQZvAAq97951qB1lqXd/ilsjBR7EnmbG2jAbEWc3HaUgIqmgtKmWgD6FGpdGfNDSuA/bzw27YuNBkXkLSdKUYJDCuX8sjddGlDqHmpR9iM7Q8deSEGJ6cTe/BshOppxR5ZhTba1mG7vNs8uBzOeFVo1p45xtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8ne07upLVtVXRSasHcGtNVSO1YcmoGj6DdVEmf/vbc=;
 b=yqeq4MEgVp9Z/58sJPr5XiT1tVu2sZ2IcdYP3coVklO19+tkWpwa11RolkJ2JsyefdLBjFj1Vc4r/pwH4WBR0qKUnh5uao+S5XpHdjEImtjdZ/Pzj8BU6Nycrj31SBoTRRF3GFHIO8WQX3Lci1D2soF6ktJlJ14YiBF/Gxwgr3Z2vqpNmknzCsyXT667RmlKq7Hmby4tRrNO+mkDfFAtG8ROyhtyseZlgJZCFAiG1FN7iKlBwHj1IBk9V9b+YvPR8eUUxMVfg0NeyAnUC2EbZUyX3sqO2Ly8Y8iQLC9QFPtQWUSZBVEjxNTg++D1/tUVi2oT0so/sQY3R9bOoTmCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH3PPF248AC5624.namprd11.prod.outlook.com (2603:10b6:518:1::d0f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.27; Thu, 24 Jul
 2025 16:09:40 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 16:09:40 +0000
Message-ID: <a5a973f0-b7fb-44e6-a745-f62c203fa27f@intel.com>
Date: Thu, 24 Jul 2025 12:09:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/uc: Add xe_uc_stop on hardware initialization
 error handling
To: <intel-xe@lists.freedesktop.org>
References: <20250724152500.110367-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250724152500.110367-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH3PPF248AC5624:EE_
X-MS-Office365-Filtering-Correlation-Id: 72106891-9a1e-4ed8-3d2c-08ddcacc7eb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aUdnYmFzY1V3Q3ROYVhZbzM5MXJWRWpKTUJwODcrL2QzNWJEKzh5Qm5Id04z?=
 =?utf-8?B?bHhpYWE4WXdhdlRneWlBT0ViSWoyTWdxdmQ5UmhlUFEwbnFEc3Rsd2JOWGZH?=
 =?utf-8?B?OWhGUENXaGw4QVppMVJUdHVCeHREK3N4eXplY3AwQi9KOC9NUDN0azVRT1p5?=
 =?utf-8?B?RGI2akVYMVc4UG9lOVlQMU50YlRYUjVXaHVpQWF6U3BqRFB0QkFLOWZLSDF6?=
 =?utf-8?B?cGc2dGhDNHV1TWdnSmJ4ditYeS90NzlKUXNXL2NCYkRSNnJVVHpMQ1ZmcnQ4?=
 =?utf-8?B?R05JcWVPdTJNS2gyalp5NjdaQVlFb0I5ejJKQUh1emtSWGcrT1o3WWh5WWJn?=
 =?utf-8?B?TTJ3ZXBHSjVmR2NDWFFmU2RIVzZTdldKdTZzMzNDRWFGQllCUnVHcTd2cXhw?=
 =?utf-8?B?NUJ6TUNHQm5CTXdHdDRvcFN1WHp5K3JyRVJheFRrTTJLTU1RVXErWmNkN1dB?=
 =?utf-8?B?RXZkZEYxYnIxcnp4SWx1dFRxWlVMUnZCNjBBM0JrVkEweHpSbWhXZzVYeXlJ?=
 =?utf-8?B?TUxZT0dUTCtMZHQ1RXcxMGdmNHp3WDlYQ1pENm9tTkVEK2tKeTFudjh4OXlw?=
 =?utf-8?B?ZTBxb2YxM2tOM1hSdVk1bzZTYThJcGV6VXUwbTRieHZ1K1pLY3ptWTc0a0k1?=
 =?utf-8?B?RG5rWVpHVnZQQU0yOEFtNmlMZVZEWHlyY1FSSU5UOEYrVlhqcmVkTEkvSlR1?=
 =?utf-8?B?SjNyRjR3ZzhOQ1VKT0RhTDZuaVA0U2tWRXJlSGZXUXBja0VnY1F0TFVjOEU2?=
 =?utf-8?B?LzRWQ1JXL0RQSU1laXJHQ2o0NnF1eWExczlyanl5K2xESTBQUURWVS9hYWtQ?=
 =?utf-8?B?dW5lMHVyVU1xdERGZmFIS2ZjN1VIVSsyd1Y5Z0RWUTlWS2dtSHZSUnFDWWMx?=
 =?utf-8?B?cCsva3lLZXZHeGxTS3JWZ0xCcFdpWGR3a2dEQlFjRHdkVnh4UzRFSnU4dXlR?=
 =?utf-8?B?MmtEMFB4Tks0RlRCdkVHZzZyQlB4SFU4S1YvTXFreitKTy84OS9EVWJSSCtr?=
 =?utf-8?B?Qy9iZHhXVXFtTzVPT1pTSFkwajhvK0ZmRG0xTnVqdU9SWFRaQTlMa3d6cEE4?=
 =?utf-8?B?VURIaXJKdkJaZFhnQzR1aXhpaDRBMnpHNzljcEhMaElLdVVqQ0krZFR6ZUJp?=
 =?utf-8?B?Yy9yYWdQMTdQb0pjTkRyRlRzQmVSVi9GZzJ2QzJvZEhEbTZqSFlDTmpySk8w?=
 =?utf-8?B?VnhneTRCOFpBSVczRGRPR3pSczdkdDRyT0JYMXh2L0RUZDVzUjRyL2xGUHRP?=
 =?utf-8?B?NWt5YjJwS3pjb3dZSWxpR0VXeUcvQ0VFdkFxNUpXQllLditscG1WdkNIeFYy?=
 =?utf-8?B?cHhqKzlZS1BHZ0FLUjkvWU9CN3M2cVFEZVF5bFVpMUhMZWt0b050V01xd0xI?=
 =?utf-8?B?UVFjd09CeTkrTG1RNnFyVk1xUWhKVDBHK1NJMHNpWFUwUkl6ekQ3QzJkOUtp?=
 =?utf-8?B?ZXA2ZHI2dG1OUml6WGhobi95MjV0TnFrMnBZRUdDWU9TL0Y2NEVFUW1SZTcy?=
 =?utf-8?B?WU1sWlQ5Vk8yT0VTSzR1a09NNkROUjFybjRpamZSMlE0cFYwUFdGcTcyL0Rm?=
 =?utf-8?B?ampZbE40bWdSN1dwQzN4bDNTMnBEVHgvLytXTXJvUnpnVk5RdXJCbWVVTmxY?=
 =?utf-8?B?Z1gyL1pxdmh2NmNySGFHbWJoMU1PdkRrenhPSkpqR01QdUdmQkg1dk8zd0py?=
 =?utf-8?B?NVU3NXUrV0RzbWNqZTYxOGRFMjVvS1N4MndlWWZlRUdyL0RZQzRFTFNCZCth?=
 =?utf-8?B?SHArTTkzbk5hM3BWcmVjNXh0ZEY0aVNvemV3dFloMGdvbmR1OTR2czRram52?=
 =?utf-8?Q?3raYCBTKmlegzo68FC3Suhjv42zcN5cOteN+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXR4bmUvbW9GYXBIZ0g4RE1SeEJ4K2RDWGRCSnZQZm1DejR6TTVya3IwY0h5?=
 =?utf-8?B?Wnk5aFZya2JUNlR1UVZXTFBtelQ4ckgwMEh0dmttVkNNY1N0TGdwYVNlZG9I?=
 =?utf-8?B?R2o5VWEwY0plTWNDdC91TlJ5dGYyQlI1Tm51YWFzRHduaUp4QUhHMktaOW5k?=
 =?utf-8?B?Ny9DTWxrdXZtcC9Ua3VhRnkrZVd1SVRZclVUK2xETm04OGM0dkozeVFZZXZn?=
 =?utf-8?B?R3BmSmdORnc5RTA0THRoNUFqYTF5d3N5UGx1S2JpYWNkYldPbDFqeGRWZUNS?=
 =?utf-8?B?cXBMbmRrVkRnM1o5SU1UZU1HQzgvOGtLUEhmYlhaUGJObTFZNGNGR25FR0Vp?=
 =?utf-8?B?dXJhNGM4ckhJYU9tMWVuSVpoaXJCZEEwaFVKdUY3eW10a2lndk1xNFlIUldi?=
 =?utf-8?B?SGk1aGlRMnJra0RVcktxKzF2RDU2QjdlS3pBOEFGMlEyUUpka0Z2UFBhc0ZW?=
 =?utf-8?B?TzhrMHY3QlhienBkK0NDcTQ0T3dUSTNiNzJNQmNsRW9relFkMDBGR1k1ZkJE?=
 =?utf-8?B?WlIwRFNHOEhjeEFhN2hCd2tUalZ0aUZYbDU5SnNEcW81dmxrRklpNE01azhD?=
 =?utf-8?B?VjBrWjczbkVCWk13NGJ4dWJOWTY4SjZBS1BpcVNCb3I4cmR3S3RrY25VckZj?=
 =?utf-8?B?TDZsM241Q1JiL1FjTXlBLzJIQTdsUUhKVDlnWFBJQ093TnVoa3VxUnNiOVds?=
 =?utf-8?B?azNYS0tySVdUckllNE1TNE42VkQvQUNSN01UL091NEV6RWRxanorUWIyT3RL?=
 =?utf-8?B?d3JLWFArNmlFdlNDVlB0NFkyUnBGQTBtaWYvb1lMNTNEZE95VFYxb3hKTUxR?=
 =?utf-8?B?UDZib2F5dGRxanNDdmxmbkwybTZoWStoN1RnRksvVG5UNmJNK0ZCMGNMclpq?=
 =?utf-8?B?SVU2NldoRWhZYWhQQnRTLzFLcUZMVmpHeWtLWUp4N0JDOTRLekY5MHdvT3RV?=
 =?utf-8?B?Q3dOVmNVdWtGNzZGZlAxLzg4RU1jamtFVzlrYWhVMjlFNVR0dUZpOWZuRnhI?=
 =?utf-8?B?UzlIYlQwNjRWeElsR0RsMUVTOVdSTjF5NUhHcjNGSnRlUk5mTE9ja2QyaDVN?=
 =?utf-8?B?cjZhMlVkWldpQ0pXQytxd1ZHQkttaXJneVN3WUU2dU1GSkR1R0cxVU5odjI2?=
 =?utf-8?B?U3RpMlVla0UxVHg1c05aNUF6TWxLQXBNaGlCQkpUOUxHQXhveGErQ2h6OUNi?=
 =?utf-8?B?T0ZpQy90U1BtaldwREtVUDlpT0xhaVdlRlpqSGxJNVZCZnhzcHIxdGFnSjlL?=
 =?utf-8?B?L0MvdXhOVlUyTTJoQ2JBQkRyZit3OUFsVm9aakJQdFJIdjFKQnpZMHkraUxS?=
 =?utf-8?B?Uk5Jcm5pVnI3QU1CaFZWcWthYnp4ODBCcm5vc1lqLzlLd2V2QlU0ejczZkRr?=
 =?utf-8?B?cWoyb2hSajRCL2RLdUFXdTF2aVFVUlNEd2F5ZnF0aVg3bXdISE1EYUhCUUdF?=
 =?utf-8?B?NkE1RWcvNVVsb0d0cTZWYlN5aWdiQ1ZkSHlHSUVJSnN5bHBFV2RqN05mdmVN?=
 =?utf-8?B?Mldhc0VtZ0lXcVk0RGNsSXdMMDhFSW82RWtqUjBhbitJeEhRZnphWTI0eHhu?=
 =?utf-8?B?akhaVjh4anZuY0EraTNVU1huNmdBTzhnc09uSTY2MTdPWHViaUVuYnQ4ZFpx?=
 =?utf-8?B?eWhQSXVKK25PSngwN1dUSGRoTXhmbVFPVG9PWDQwa1JhZEhCZ3pmYUdYVENS?=
 =?utf-8?B?ZzY0QnRjUWErU0RvREFzNDlGcE1LRTJZS05acCtlYjZQSHZYbFZ4SU5iUVRk?=
 =?utf-8?B?Tm9kZGU0VkZUUnRQdzdRM053MXE1V2VwZzhNd25xMlhWUkxGUUZlNS9MeTNj?=
 =?utf-8?B?YzAvc3VpVjByazlsVW1DNzY5MjNsUms5Ry8wdnFpbFpUK0Jvd3FFbFZ5L09w?=
 =?utf-8?B?RWdkdVpBbUhyNVBTS29qeGlQRm1aYlR1VUt5RmZaaTlqMHo1M0xOTTNWbEpD?=
 =?utf-8?B?VW1JSG9OdjJPR0xqMFBIUDg4WHBHQUR0QldlVVlMRjcrQU56c1BzbytPaEVu?=
 =?utf-8?B?MnJQQ1JENTRFWVBXd1duMHNrRmpFZXQ0VFpoazZLcmovWlU3OTlNdzFnNzEv?=
 =?utf-8?B?M2R4M3VORVd3aXF3ckt6Q2lCOHpWL2JvRFdCZUVTZjgxZ1QzSlJHMFFiVUVW?=
 =?utf-8?B?MERGVlA5L253UGM5TmJYZ29NaDNsMjdhUDRESTVtRkN1TFluWUpDNVJLZFE1?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 72106891-9a1e-4ed8-3d2c-08ddcacc7eb0
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 16:09:40.5606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I2YycJy0gewI63cQz30ed6g8OJ59a5sOBEO7w4++cf1UmPZnMMXW4aruXR4GahlLJeXLiM1KTgh7gLEoi7/vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF248AC5624
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

Please stop review this patch, issue found and new rev is in progress.

Regards,
Zhanjun Dong

On 2025-07-24 11:25 a.m., Zhanjun Dong wrote:
> During hardware initialization, GuC communication is expected, which
> will increase the outstanding counter. Non-zero counter will cause
> assertion failed during shutdown process.
> Add xe_uc_stop call to clear the counter.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5466
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5530
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_uc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 465bda355443..6c72ce305d6c 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -173,6 +173,7 @@ static int vf_uc_load_hw(struct xe_uc *uc)
>   	return 0;
>   
>   err_out:
> +	xe_uc_stop(uc);
>   	xe_guc_sanitize(&uc->guc);
>   	return err;
>   }
> @@ -228,6 +229,7 @@ int xe_uc_load_hw(struct xe_uc *uc)
>   	return 0;
>   
>   err_out:
> +	xe_uc_stop(uc);
>   	xe_guc_sanitize(&uc->guc);
>   	return ret;
>   }

