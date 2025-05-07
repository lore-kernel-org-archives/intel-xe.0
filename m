Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A534C3ABBF
	for <intel-xe@archiver.kernel.org>; Wed,  7 May 2025 23:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CCB10E1C2;
	Wed,  7 May 2025 23:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkKWwxMm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F003110E1C2
 for <intel-xe@lists.freedesktop.org>; Wed,  7 May 2025 23:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746659887; x=1778195887;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TOhE4TskWhHhPR5Bio7uQBnY48eCwsg5nHj2i3kkXY8=;
 b=RkKWwxMm1JTLHOoscKxAs+yNPcJTaSQtF1cP51riyEYtPgNa01Q8JYfO
 XPQrT2H/28ggpmt5hNAJtqf2qNQWUIJKWAhF90yowb7xKB6U+GHBx8DNl
 /cXmwqNduC+Sb4RD9jxlOH+S4FmEXtmD7fQ1wSrGL6jimM5MCpX7F2AII
 lnh/eq72X79UJvfXLcIyLY/wcnEjymRnbOER2jF2AuompvWIpAdf38+me
 WmrJd96Qu1WiH5lBUMLLqHatFz/a0al1VarqzhlWUd6igEV0Ir/ogKLrQ
 5Drxxi3jWiCtysv5DnO4bVg/QznGAaGSW4Cpz4F5zLfTYHZD/WqwRu4q5 A==;
X-CSE-ConnectionGUID: IDYJO0EmS4GmUHR1itW4kw==
X-CSE-MsgGUID: 9ND/a+UVRDiVX4xHuIu3Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47677449"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="47677449"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 16:18:01 -0700
X-CSE-ConnectionGUID: Qh3cL9baRDOHxcDwFG8ZLw==
X-CSE-MsgGUID: pqe4M1TpT1+33KPC/pHxxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="135816032"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 16:18:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 7 May 2025 16:18:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 7 May 2025 16:18:00 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 7 May 2025 16:17:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ0pOzXeJSt/Yjm/7O6BIWFETX97xrx8VrxYng5vXK+FhvvdSyeQS5gr4io3B0cxF9gICA3buUYmbP643aSdwhKbu2hR+lb7IUzGvsQvQ2IyPufi6DtIdgEFtSPjyZelEvNsz8naKW3DGOA3kLvQvggkkTf6DJgEmJHXERV2cxf1RQNZoPaQN2Osv2ss3GrQrk8FFFfXW5I3M5eVSWG9UWdK2BXLrWLSvWFnhvs5Yfqmdhyax9i7Kl8g9yXJ6FJsu9Z1tdOEAr9yM4LHj25QdTOyW1OsHtLSBTv3TcEehxUE3kkGvmRt0v8CIKvXPO97BZHA5WA9NYOJlJeOGHtXCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8uJsdjccnPUYS3Pa7qhmkukHYiNJsqMM4x/xS+xTTK0=;
 b=mKERpwPmg19a8wm/ZRIGVxC9Bqs1Y2J/jknf20X4zTU9eNvv2c9YPeQScwKY/gH9sxzE6Jx5Vm2+9Hw8Q1QBe32uSbDTyISXpARotFC5vGd9BUvcwIUxSrcz0CL4+faIOuNGAYCTG3HdHYF5VJaDszjZ5RhHcXsRqo3jnykXlDMNsHoTuLwwjpiHwiKjMare0pyyOgU7t/1OXaX0QZ1h/wflfxGYdz4GzmWkMdenHhc+TjjMJrXanIxprrT06YpiGo5x2AJzneQPi9677RCTtFHB1fubyi4BKi8ERkhsx0xBZZ8HISsIQwxXSNrgfAYh4saQ2vyy6WYoXcFhnHD/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB6777.namprd11.prod.outlook.com (2603:10b6:510:1c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 23:17:52 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8699.022; Wed, 7 May 2025
 23:17:52 +0000
Date: Wed, 7 May 2025 16:17:43 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Message-ID: <aBvqFxhkzyPfu5d2@unerlige-desk.amr.corp.intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-9-umesh.nerlige.ramappa@intel.com>
 <njcubtyaqbejliohfpklue6b3zxbxat2ly6bz4imivaxoh37vu@wi3pickrjp36>
 <aBvPBb5lzKRLlmyF@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aBvPBb5lzKRLlmyF@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB6777:EE_
X-MS-Office365-Filtering-Correlation-Id: e647eb34-244d-4675-4311-08dd8dbd63f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2srM1NDcTZpbTNoV2FTcEVldUlUL25TTk8yanRMNVFyK2dEU1NORXRxREhz?=
 =?utf-8?B?bjc0UlZock81SHpPbmp4bVJtTHlPNnlYWmNNRnROK2VWQ2NPQitTMlhsZkQ2?=
 =?utf-8?B?OVVvK1FCbTJpekJ4U1paTlJTeUdvV1FFTlhka3ZyUFdXQXRPN0hsdzcrMkZO?=
 =?utf-8?B?bVQwbVBHVUI0UjR2ZjdjaWVFOVRnMzVFYWJ4TGQvTCtpbXFpUEVZMUs4VThW?=
 =?utf-8?B?NDlrdGQvcW5USXI4NjZrcXhmSExNb1pROEsya1p6SnpJTHNWanlFazd3NHZI?=
 =?utf-8?B?VEJaZkV5ZEw0aXNheFVXVVIwRSsvbjlQT09ZUys1WVJ2bVBZaVE5djh2NnJX?=
 =?utf-8?B?bVFzZThOWHJNQTlDWFZrb3ozTmtITisvREZOanpGazcrMEc4QzlXZzhKVzlN?=
 =?utf-8?B?TERJM3RPUUVjQ2Qrby9wT1czQWVveXNERFcyM3QzcnhJdGI5NkxQREtGa1V6?=
 =?utf-8?B?cE5RRWxsbHB6K2ZPSnUxdVJXOUhaYVhTQnZ0TDlwemNnS3lDL0F2QUlvZnBD?=
 =?utf-8?B?VmpxdW1ITiszZ24rcm1rcjNybk5yR0IxWlo3N0JkSE8yT0c0akxGOGxqUHpT?=
 =?utf-8?B?TktKRy81SHgraURDeFlxTDhQejdTeXFmWDhQUXhsQzdHYkdqRDdubEpvZkNq?=
 =?utf-8?B?cyswM1EzN1JsajcvdkpBNS9CWWZRSTUwTStaMWtmayt5aXJDRU12QmZVQ05N?=
 =?utf-8?B?dzRGaityQmNoUFNheXZlSHJmOFBnaThoa0lyK280TXd3NDZFRjVVa2VnK3dw?=
 =?utf-8?B?eUdDaDlHU0hHTDBJbHdWdTlRRmN2YVV0R01lUStuRWR4ekIwdTRaZWE2VnpF?=
 =?utf-8?B?UERJeVBQcE9OclFLcU9TRExHYnc1UkhvYk5rc2l4WVcyNlVQVVMvWnJqeitB?=
 =?utf-8?B?Z1FDanlqbFlIWEFRY1hMbUhVMFRIUVFITkFUbktIL3lHaHBWK2l4QWt1OExj?=
 =?utf-8?B?a2JtZGNaNVRGMGVrTTdjT1NUSEpJeEhNQjV4MWpGbkdJdmZWbm9YYk81aUJV?=
 =?utf-8?B?YTd6b1pMbUtCVkFvQWkyZWtmQXNRVklqZFFPVDh4dmE1WEFwLzdhV0xzRTBF?=
 =?utf-8?B?OS9hd3NBeThBK3EzelFQR3pIWTVlUEdMQWZIUHdNTEsrSzd5RlN3eUQ4N0J4?=
 =?utf-8?B?bnlOUVpQN2k2bktzbHpRZCtuUEpqdVhrUFhFL3pSSXR4RGI0ZmVXUHhsZzBB?=
 =?utf-8?B?RHBOczFqK01tQzIrYXFFUzBzY3V6OGRpZHRBNjZad3BaYmlwU21ZN1FlcVJr?=
 =?utf-8?B?WklLR1FVQXhGaW94a0hQQ1NLcWVjU21DT2NkMUV1L3E4VWJVZHZVSUMzaHFv?=
 =?utf-8?B?OGdZbVNKQzF3amtjbXkzSUJiOGs0LzFEdkVOWmQ4TWFNbUJsWE41RGZjMSsz?=
 =?utf-8?B?MFBIemkwNi8wbDZ4aHZleVAxUExBVHJZakU1OVdrV1B3STJKQnNkbkNQd28w?=
 =?utf-8?B?TEVrTlZuMS82UHhEV0M3b04rSUY2L2oxOFNkWVpKMUJSRXZxMW9yUWViZWp3?=
 =?utf-8?B?MHcwSHduZG1LTXBYUTdudFNlMERoOHpUTU9UOWZVYm01UUtYZG9vVENrdXg2?=
 =?utf-8?B?L2pUdFUyWWE4QWsrcEU3blBEYkVPYWJNMlFQZDNseS96WUxSeCt5aUdONllO?=
 =?utf-8?B?YVBadVJWMVZjdTRFWEhWM2d5S2xpZlcyQ3BMVks3R3FVVlJiTEhiL2Y4aWg2?=
 =?utf-8?B?NlhxZGZBK2hBNFBXQ05hWEsraW0vN2RYaUM2K2orOG04Z2lUUTZnQXVIa00r?=
 =?utf-8?B?QklBV01uZi9qQUxMRFBlbUNkeU9nMm5RajdOWk5ncmVPbmRETGZTZWlMVnBy?=
 =?utf-8?B?VXQrOHg5VE1JekRYYklvVFM3U2pqdVh0eENIdlBkc0dLMDQwaWNNNkRmZ2hI?=
 =?utf-8?B?L2t3RFdnbkZPNHpKZXd2ekpzaTI2Rk5VSXl0M2h4YzkrRkFkcUlTdk9DWU9X?=
 =?utf-8?Q?ca7RrHVCLcQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjFUUjU5VVFSa0tFRHBpUkdzcXNSekkzRXcrT1F0ZVZ1N0FNMjlBcTdQUlVV?=
 =?utf-8?B?UjBaenJMQnh3N2FYVDVNMUV2cTNKVzBrVWhNM2JQdVpmMzRyd204cUpoeTcw?=
 =?utf-8?B?M1ZaVTR3aGpMYjVYR3VpWVFtY2UycnhIUzFUNlBXQ2ZJdW91MU5GL0ZJODJZ?=
 =?utf-8?B?ZjM0SUxVTEZ5M2ppVVF5OU5JYlFYZnJjSWR2OUVIekJjd1FhRmZ6aThUaVhH?=
 =?utf-8?B?di8wUmlZcjJMbzRNR3Fpd0d6Nm8yU3hlTHUwNExLMmY5WGhyNjhvS2JPQnhw?=
 =?utf-8?B?NndTeGVPa1dhR1BUYnhkYWVqbGpYUk9VSmdGUkRXR0czWDJIcnZHbVgrUkIv?=
 =?utf-8?B?TDM5blBNVzFSVzhVZll6ak90M2Rpclp0TGtPY2JOTnBOWThuM2xKMmVHUFRD?=
 =?utf-8?B?TWwrTUM2V0FoazArc0k5SklERUVlc3M3MFRsUUN4YmVZUm9ETVdJdDNWenBx?=
 =?utf-8?B?RXI0YytSOE1FTDIvb3lJUmVhNmdsTzl6K1V4d0RSQVBYbi9pYmpZNHg3U3FC?=
 =?utf-8?B?Tlp4V3JNLzB4V3FNUW9jVlJrSlkxQkpPRzZ1ZmdaQ2UvKzNuR1dqdlk5UUQ5?=
 =?utf-8?B?d21HYmh6MlN2dzZrN0xvckVsUlJiV3JjUytvZnh0Z21xMUZMcEY3R3RXRnBK?=
 =?utf-8?B?a3JxeXVJZUJtbC9FcmtqcDJSeXlEYm1LWUJsNDMySVhCby9qRFhQTi9ua3J5?=
 =?utf-8?B?cmxoQ3BBWUJpa2w1M1dTaHQ1TUJJZTZ6aXJHRklCd2FuZGxpaEV2NWxkbEpq?=
 =?utf-8?B?OHhmNEZ2YU05SWVxNzhCSElBdkdpM3FQeFFmSTRmdVVTbWdIRTFBNXk3aHov?=
 =?utf-8?B?ZVBQQWMydzRON0FVT1U4TzhrK3NlaHpVa09yN2E1b1dXZDdkWFVGeEdhQXJQ?=
 =?utf-8?B?c3Y3d1FoNXh3d0xzd1VoL3BaM0R4V3dsNVlvUEQ2RDV4NzRVYW80UzB0NEZU?=
 =?utf-8?B?T083THIwME5XSlVnbUZUTllMaTk4V2Fub25rSUE2Q1ZWTEZESnlRNVl5TmQy?=
 =?utf-8?B?ejZqR255Ukc5eWVDNytoN2lrb2ZGaVVkMGhJZnhMenVxbmhKSUx6VW5BSHJ5?=
 =?utf-8?B?dlhDN3VjLysrYmpKWXlFRUg5RDl4eENhOHBnU2lyK2lZV1lUcUIydktDZXY4?=
 =?utf-8?B?cC96NklEdUV6YnRKcVUrYUZwc1dPU05IV2RGcS9rR3Rwa1FXcUszTmJMdFVi?=
 =?utf-8?B?ZnU0UG1CTkhEMHJtLzJUZTA3VngwRWVVeTdNRDJlWDF5SktiT0JaaVR1NVVx?=
 =?utf-8?B?WEZmN2xsWHl6NjJmaTgwbmR4SlgyYlFhSXlXWkhlU2FCRW8wcEN1TWZ5R2hP?=
 =?utf-8?B?VE9KTkI1ZjMwQnptamdYT1p3R0hhbjJTVkl0WG5lWExwU3ArWFhSSW8zL09z?=
 =?utf-8?B?LzZvaVZiRW9vdldiRDZGVkhKdnlHUzN4OUxnbjlaUVBoM0xpZ1lCSzdoSU1P?=
 =?utf-8?B?MVFteVNIM2tRNmtBd3lWNy9ldlRmaEQxTmswL2N3cFZiQTBZQnZ3MHZXRVlz?=
 =?utf-8?B?MkZJcWIybHRFUk1lcFFJYkw0a2tUYzM4OFNrOXRXaWJxMjdjVVZaZzN4andk?=
 =?utf-8?B?K05tQVErdmljRnpRY0R0MGwySXBKM3lOeGpaQ3hud2dneVpJMEM0ZGgzY1dw?=
 =?utf-8?B?MjdnM09IMk1xYlhZYnNqUE1Qc2NhU3NUL0VSSitOSWdxZWUyck9wQUVNL2Jz?=
 =?utf-8?B?a1JiMEtZUGQ0WEQ2Tnd6dTJzaHNidFRjVFNRN3JUNVBNcE9WZ0RKd1VoUlVC?=
 =?utf-8?B?SlRuTGdheVFVMGNOa2Q1bE5Pcm5wdVl5ZzVCZnpEY2hsaVBZZXV2UUh0YVhN?=
 =?utf-8?B?elRBbllzNmk0cjJmUWZtRld3L1Q2UHcwRkg3UEszbUwwR2dMVWR1cVRnSmFH?=
 =?utf-8?B?SWNQeFpLM0dyN0U5c0RkYnBlVHkyWVFlL1Z6eWxRbkVTbXFLZXl1THNZRTRr?=
 =?utf-8?B?VzkySU5NZk84T0VreFRXa2R1aURmTzBvRjE3c0E2VzdlcE9iRkhkU29YdjQv?=
 =?utf-8?B?WDREK2hUd1ZDNU9SbFAxZEdBVTk4U0JOUkFIVk9RSmkrSUlEVU5BQkdEUkk3?=
 =?utf-8?B?azhKclJHV1IwWUlYa2xjTS9PMEVvZFBHM0ZaaW9jNFR2YlN0ZkRVejg0VkY2?=
 =?utf-8?B?STFpYlZoVW02Q1hlSkZJWTRLWkVZMklCYUhsRVVXa1IxTEN0TUQ1RkxacEs3?=
 =?utf-8?Q?mxz/TRsRv8bHcyxUYhGGBIA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e647eb34-244d-4675-4311-08dd8dbd63f8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 23:17:52.4525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLwU8C2zVi2j6Z1kiWcLYrDeAZQGUE5z8KDjyWvZpLo7Kz7I2ZOZFpzlODjDeEDgMIbzkGQEBi+k1PjHCQDpIxTKgP5iLS+nMFgHWml4eM0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6777
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

On Wed, May 07, 2025 at 02:22:13PM -0700, Matthew Brost wrote:
>On Wed, May 07, 2025 at 04:14:22PM -0500, Lucas De Marchi wrote:
>> On Tue, May 06, 2025 at 06:30:42PM -0700, Umesh Nerlige Ramappa wrote:
>> > Where available, add support for 64-bit CTX timestamp when calculating
>> > job run time.
>> >
>> > v2: (Matt)
>> > - Use xe->info.has_64bit_timestamp instead of version check
>> > - Allow timeout > 100sec on platforms with 64-bit timestampt
>> >
>> > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>> > drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
>> > drivers/gpu/drm/xe/xe_device_types.h     |  2 +
>> > drivers/gpu/drm/xe/xe_guc_submit.c       | 18 ++++---
>> > drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
>> > drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
>> > drivers/gpu/drm/xe/xe_pci.c              |  2 +
>> > drivers/gpu/drm/xe/xe_pci_types.h        |  1 +
>> > drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
>> > 9 files changed, 90 insertions(+), 17 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > index da713634d6a0..52f4c96c01dc 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > @@ -154,6 +154,7 @@
>> > #define   STOP_RING				REG_BIT(8)
>> >
>> > #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>> > +#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
>> > #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>> >
>> > #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>> > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> > index 57944f90bbf6..8619244b7c7b 100644
>> > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> > @@ -12,6 +12,7 @@
>> > #define CTX_RING_START			(0x08 + 1)
>> > #define CTX_RING_CTL			(0x0a + 1)
>> > #define CTX_TIMESTAMP			(0x22 + 1)
>> > +#define CTX_TIMESTAMP_UDW		(0x24 + 1)
>> > #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>> > #define CTX_PDP0_UDW			(0x30 + 1)
>> > #define CTX_PDP0_LDW			(0x32 + 1)
>> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > index 495bc00ebed4..9446a739948c 100644
>> > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > @@ -334,6 +334,8 @@ struct xe_device {
>> > 		u8 has_sriov:1;
>> > 		/** @info.has_usm: Device has unified shared memory support */
>> > 		u8 has_usm:1;
>> > +		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>> > +		u8 has_64bit_timestamp:1;
>> > 		/** @info.is_dgfx: is discrete device */
>> > 		u8 is_dgfx:1;
>> > 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
>> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > index 813c3c0bb250..bef32f2b0081 100644
>> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > @@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>> >
>> > static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > {
>> > -	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
>> > -	u32 ctx_timestamp, ctx_job_timestamp;
>> > -	u32 timeout_ms = q->sched_props.job_timeout_ms;
>> > -	u32 diff;
>> > +	struct xe_guc *guc = exec_queue_to_guc(q);
>> > +	struct xe_device *xe = guc_to_xe(guc);
>> > +	struct xe_gt *gt = guc_to_gt(guc);
>> > +	u64 ctx_timestamp, ctx_job_timestamp;
>> > +	u64 timeout_ms = q->sched_props.job_timeout_ms;
>> > +	u64 diff, max = U32_MAX;
>> > 	u64 running_time_ms;
>> >
>> > 	if (!xe_sched_job_started(job)) {
>> > @@ -952,15 +954,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> >
>> > 	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
>> > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>> > +	if (xe->info.has_64bit_timestamp)
>> > +		max = U64_MAX;
>> >
>> > 	/*
>> > 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
>> > 	 * possible overflows with a high timeout.
>>
>> this would not be true anymore with a 64b counter. Anyway, why would we
>> need to be soooo paranoid to increase this and consider a diff >=
>> 223sec? For the timeout check we can leave with the counter wrapping at
>> 32b afaics and not change anything here.
>>
>
>Why? If the counter is 64 bits I don't see why you'd wouldn't use all the bits.
>
>> > 	 */
>> > -	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>> > +	xe_gt_assert(gt, xe->info.has_64bit_timestamp || timeout_ms < 100 * MSEC_PER_SEC);
>>
>> the assert is on the value of q->sched_props.job_timeout_ms.
>> Why are you removing it? Or even why is the assert in this function
>> rather than on init?
>>
>
>Admittedly a bit of an odd choice to have an assert here rather than on
>init. Also in practice the highest value I think timeout can be is 10s
>without a special build of the kernel to allow crazy high values.
>
>>
>> >
>> > 	if (ctx_timestamp < ctx_job_timestamp)
>> > -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
>> > +		diff = ctx_timestamp + max - ctx_job_timestamp;
>> > 	else
>> > 		diff = ctx_timestamp - ctx_job_timestamp;
>> >
>> > @@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
>> >
>> > 	xe_gt_dbg(gt,
>> > -		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
>> > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
>> > 		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>> > 		  q->guc->id, running_time_ms, timeout_ms, diff);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> > index 9d9be9383207..b5f5547c7c4f 100644
>> > --- a/drivers/gpu/drm/xe/xe_lrc.c
>> > +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> > @@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>> > #define LRC_SEQNO_PPHWSP_OFFSET 512
>> > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>> > #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>> > +#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
>> > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>> >
>> > u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>> > @@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
>> > 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
>> > }
>> >
>> > +static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
>> > +{
>> > +	/* This is stored in the driver-defined portion of PPHWSP */
>> > +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
>> > +}
>> > +
>> > static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>> > {
>> > 	/* The parallel is stored in the driver-defined portion of PPHWSP */
>> > @@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>> > 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>> > }
>> >
>> > +static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>> > +{
>> > +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>> > +}
>> > +
>> > static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>> > {
>> > 	/* Indirect ring state page is at the very end of LRC */
>> > @@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
>> > DECL_MAP_ADDR_HELPERS(regs)
>> > DECL_MAP_ADDR_HELPERS(start_seqno)
>> > DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>> > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
>> > DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>> > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
>> > DECL_MAP_ADDR_HELPERS(parallel)
>> > DECL_MAP_ADDR_HELPERS(indirect_ring)
>> >
>> > @@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
>> > 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>> > }
>> >
>> > +/**
>> > + * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
>> > + * @lrc: Pointer to the lrc.
>> > + *
>> > + * Returns: ctx timestamp udw GGTT address
>> > + */
>> > +u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>> > +{
>> > +	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>> > +}
>> > +
>> > /**
>> >  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
>> >  * @lrc: Pointer to the lrc.
>> >  *
>> >  * Returns: ctx timestamp value
>> >  */
>> > -u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>> > +u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>> > {
>> > 	struct xe_device *xe = lrc_to_xe(lrc);
>> > 	struct iosys_map map;
>> > +	u32 ldw, udw = 0;
>> >
>> > 	map = __xe_lrc_ctx_timestamp_map(lrc);
>> > -	return xe_map_read32(xe, &map);
>> > +	ldw = xe_map_read32(xe, &map);
>> > +
>> > +	if (xe->info.has_64bit_timestamp) {
>> > +		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>> > +		udw = xe_map_read32(xe, &map);
>> > +	}
>> > +
>> > +	return (u64)udw << 32 | ldw;
>>
>> I understand doing this for the next patch, but for this timeout I think
>> we could just discard the upper part and let the 32b wrap.
>>
>
>Again why? Seems odd to not use all 64 bits if available.

I would use all the 64 bits. The only problem with 32 bits is it appears 
to be small, maybe if you run a job for something like 500s, then the 
wrap may have happened twice and we won't know.

Is the LR (long running mode) not subject to drm job timeouts? If yes, 
and if there is no practical need for 64 bits for regular mode, I can 
revert those parts.

Please advise.

Thanks,
Umesh
>
>Matt
>
>> Lucas De Marchi
