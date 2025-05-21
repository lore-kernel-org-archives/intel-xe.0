Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA32FC2D0CD
	for <intel-xe@archiver.kernel.org>; Wed, 21 May 2025 09:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9102910E6D6;
	Wed, 21 May 2025 09:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KuT+YvzW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC21B10E6D6
 for <intel-xe@lists.freedesktop.org>; Wed, 21 May 2025 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747820373; x=1779356373;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lMhsj/45GgZL7LBZVmJHOxSd6yP3pyj+j8K6gotbJMU=;
 b=KuT+YvzWa/gn7vJWpbFO1jbkd709o9am2rJwfSL84ltCbbt59ELew6z0
 q6cfYXc0ilC1yNaIgdgBtqt03A63KDcHTXrJjXZOXfaw+yx9ax3sGjTLa
 ij7F+Ny0ze+5buIfTX0WBoEZVrY7e2GTSFFn470DHeORf9/h8sovn5Nc9
 Ggz0/gVFUBr3rsWZ34oNEBt7Mcf2oxcn3luG1KImjFi9GcFPQl7q9ppta
 RCe1OX54FPTH7jecU++NR/TXj7V2BQKjSUJ26ARFzKK8AoKFXYDFQAl3S
 XWonuX5YLOE3v1IyspC5mp9g1hTxdWzgLJQNcy3U+xg9L0FaaP/CJOwP+ g==;
X-CSE-ConnectionGUID: jIBTVp6dTiyb1855G+Z5/w==
X-CSE-MsgGUID: rgrsoKuVReCYAOLOvgkJNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="37410697"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="37410697"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:39:33 -0700
X-CSE-ConnectionGUID: 8YQiyTp1TiqOk5tMfUZZRw==
X-CSE-MsgGUID: vghVDoMpR4ukwSXTdTsTKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170992389"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 02:39:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 02:39:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 02:39:32 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 02:14:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGV5sfTllL/yDL/Q1Gl6dx3cbNygcYwgIvU5ZmS2bSN4GubyNglAH8OPB4edzbnOnZ0aKjU9MnrO3f8vuwTkC8ZquLiNmZiWrKZABKa1R7BertJd0EyjY6lL3hKq1eoHb4wfHgC7iX6K8spRx5AjTcuCosx6EQH5NYXEIivxN4nMKbk4ew2oAPmRDlphEM2QeJATC/ME0lo/K0DnK0ECTTAeVJBenFd23A7+IpfAF7x0fjxfg0k6fLrT0EUdcnwSb/T/Dns4qWoDL1g3lYu9B1Li+roeGwTM8kXUTFroaE4/XbNGJZdEVozUpy0SZVpYVTKr4zytY6ZDlC6LITnnsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad3V9UyC8esdwdwUNDnv6Jju8HCubEmgaa/wxzYQodg=;
 b=QoZZLnLKDemvYsv/QGIxtRr0UjGIAnXAiTTVkkG9WKg1d9DL6nZcqakufTELjkV6XabRXbxIlKIzUmhhmgRDVD2JcEmrWsDwgrJMTm1gEIfIqNUeYn/rym7s5xeyIQ0u85rJyX6zsI6ML2wCo+JfkPstkEe1KpQBZCjQqxgu2F6mxocgvqKTzoJ1pZZ8EWzt56AQ/NlvddFO4hbOYB7bD9q9Hj2TEh0lhA9ulhtTwgcoOhEMQm6ZeoqDLPsMJBRzjL4YFgpop5l5QHudf/jj+GsEyv+05sGyPGwKC39+tpGqLdH9i/GLLVmVnKup1YTGxvtEQgfz6kMEAPpIVeHgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by MW6PR11MB8439.namprd11.prod.outlook.com (2603:10b6:303:23e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:13:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Wed, 21 May 2025
 09:13:56 +0000
Message-ID: <52ea30b5-d105-4267-b810-409c520766f0@intel.com>
Date: Wed, 21 May 2025 14:43:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 32/32] drm/xe/bo: Update atomic_access attribute on
 madvise
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-33-himal.prasad.ghimiray@intel.com>
 <aCUZqoiJ/5o8b3bN@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCUZqoiJ/5o8b3bN@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::9) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|MW6PR11MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d411ea7-9b2f-45aa-58bb-08dd9847d02e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEpETVlNbExoM3ErblJ6cWpCZE84UnNyam5hQzNJcWF3M3VtY2k1eEtNdGps?=
 =?utf-8?B?a0p3RDlHd2JNRUt1TWtjemZEbFFJeEVZZDBKMHIrQWNPSDZnYTdEL3ZjT0Zz?=
 =?utf-8?B?TW1nUDFHZURhUC9hTHArL0dlMXl2bkc0T1R5aGJYWFYzS1lDbkcyNjRYRE9v?=
 =?utf-8?B?a3E5NVZ3ODRES1RMN0Y0T2RBUzdjTFpqU3pRVWUwK05wZWZMZm40NmZUL3RM?=
 =?utf-8?B?SlVNNlZ0eGFxRkhrVGxNWXJ2WFRzNGloaGNmVHVCNHhtUGtTNjQ0NUNGRXJU?=
 =?utf-8?B?UzdJaU43UzlqcnBsOUdQanp2R1VTM1VJTEpaVC82N3NVZjVTeHBRZk1VaUJ0?=
 =?utf-8?B?dFlTVE41YjdONkUyckFWWmpRbHV6dWxBZzNSZ1RKS0Vyem51WUY5V3M3bmc1?=
 =?utf-8?B?SHdJT2RqV1Ftc2p0a2VJQ2ZZTWRMYnBuL1BReDU1SVJsR3M3NU5nbVFLV1pH?=
 =?utf-8?B?akxkdWsySnREMnJ6K3RVTXBCbjFzRW9WclFPVE9GemNDMWpPOVU0UTlVNjkz?=
 =?utf-8?B?aFRWMUNqOXhzQmlHc0krWFBqaGtuUFViYU16cHA4SG9PYlYzYzdYYmZ1UFY1?=
 =?utf-8?B?MVJsYTZsd3BGRlc3TU9xUWhrRVcrVHc5Szd1S0U0YWJqUmZteURYcFBLVmo0?=
 =?utf-8?B?VG9MK3FRWUdzYzR5V3QvcnN1QVNKMmdSV2xOU3RpcmZjQXlGTHdEZ3g2R3hn?=
 =?utf-8?B?NnRTRlo1SzErWDBxUzN5cTY1NUk2UDh3T0FodURoUTRtb1FzQU1yQWZrSVhx?=
 =?utf-8?B?aURWMmFRZ1h2V3BtZHlMc0xBV3dLREpOVXpGa0M3VEk3MlUyNGpVdWViNksz?=
 =?utf-8?B?ZUpHVE9mQVV4ZWwzT0I3d1krS0RPWllnQ2h0RU1NZld3MjhUYkt3Z1QvNVA2?=
 =?utf-8?B?Y1VxajhJUFh3RUNDV0s5VXNXZFNzcTdHdnZ5OGJnT3RJbHFaNlFuQ0I0Nzg1?=
 =?utf-8?B?TmRtb3AwNmJudUZsZTBZVVRmN2lZMjZ5RHpuenpHeDdxaDlpTm5OcWF4eDd0?=
 =?utf-8?B?QjJQT2h6eXJ6dTdnTzNxZy9BRmxtaVFNTTBkVW1tU1pkZTdFcTk5aE5OdW9X?=
 =?utf-8?B?Yyt1TFFMWGJmWTdQSmFBVkNBdTRHVnp4SnQ2dTJpSHdVUmt0UUFlNms1YlVH?=
 =?utf-8?B?ZWFzT1l4amRwQWxJYXRUK1ZDNUJpa1VCaXhDem1CSkQ4aWkzZG9LM2hpNEF0?=
 =?utf-8?B?K0k1SnFDVXNBbkJOb3d6YVh5RWNGR1F3M0ZRVXRCOFRDV0lBVW1XTHkrSTEz?=
 =?utf-8?B?MHBYYWxBdmZjSVJ4aXRIUFcrcDdvMHhxMm52QmxMK2RqaWxEUHBDQndjSzNG?=
 =?utf-8?B?ejM1K2tnN0o5Vmc3aFlQRFJpeUVYRTd3NkJNN1B1UnJ1eGNVcGhFTUc4RTE0?=
 =?utf-8?B?T3Y3bEZjVzZVTVJnbm96UkdqbXlhM0w3U3Jsc3NIZEM2aC8xZnB0RGowM2JH?=
 =?utf-8?B?S3pBMVBYdndhUEhnb3BKNE5ZeEFzR1NsZVpqeWI0bTNpOWlaTW5Fdm5qNHRi?=
 =?utf-8?B?Zk9ra05XWndtWWlESmtFZUMzcldmRDkwaGJaTGd0eUp6cGpRWFBMTnNTMXB4?=
 =?utf-8?B?N1VBV0M1QnNWWWl1cUF0T2VJU0Y2M3NFTXZNeldZSnRpREYwTzdTNC9ONVdC?=
 =?utf-8?B?QTdaTHlUZHBqeGV2WnFXSFBmYlpDdTFTWEhQaTNwTXdVUWkzTGIrY0dGSGRR?=
 =?utf-8?B?M1lYTUZ4Wm5kM3c3cHE5ZEgyVTdmamdISENIMFhpcmRnVGt4SU1vbDBjQ0d6?=
 =?utf-8?B?VU42NUUrWUNkZnVmcmVRN1JjT0V0dEdmRVdFSGNOVjk2U01WRDVoOEFTbldZ?=
 =?utf-8?B?azhQYVpDUmlzd1hGVHNtMEM3aG03WklkRWNnQW8ycWNFMExRVk0wTHdNTUFB?=
 =?utf-8?B?U3EvREhLVGI0UWdnUkdEdk1ZT3k0YjBXN000OWJBYzM1QmVJS1ZocG5SRW0x?=
 =?utf-8?Q?aD0EkuOhwmo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlN4S2l6amI0Y2NKNUtLZGdzbnEwNWd5WGoyd3F4RmdjYTVaOE1wYjAwVy9o?=
 =?utf-8?B?U3lIc3JVZzRyVUZGZlhETlZTZjMvMGRwK3NBMEN0SmFmSnJVOHlML0FwWjdy?=
 =?utf-8?B?aGsyR3ZyNnRoUXZ2QnYzdVp0eVBSZ1hJVmlpREllL2xBc2VBMXpPNG4vNmlk?=
 =?utf-8?B?dXp0RVJYaWk2K2tSdWNGWXZLRTdYLzNQVmx6TjZOdmRZN05zMWVjZlUzRjg0?=
 =?utf-8?B?dE9nV0lwallNa1l0Z0h1d2EzZzdxSkJScDNVOUhRWkRFWlZIaVluZlJhNkF5?=
 =?utf-8?B?TW1lN1RKVEl0OXZadWl0R1hSSEIyKzVFMVI3aVVQWXZJZWI3aE5FVGVYSVlx?=
 =?utf-8?B?ZmhzMVR1U2tvSlNQcW81ZTdMVVM5bUp3clBsY1I0MnZnUU10UVByZWpDdzlY?=
 =?utf-8?B?R2pvajJOOERTU0J4TEFSeVZPZE9JemFoQUE0U1JpOWZSSGxaeU1adStGR2RF?=
 =?utf-8?B?ZzNtVXRWQzlZK0pGcEpKcUhOdm9oSkNWbjJvMUt3VEJhNmpVbUVVVGNDa0Yz?=
 =?utf-8?B?c2gvTjBjc1pnRENWWlQvc04vbDBqRzRQbjNYWVVyV3dzY1d3WGlOeEdXUTFz?=
 =?utf-8?B?NjJNV2tvb21RelFnWktkNXVabjFvVWUxUXRocGwxRVRrY3FGY2hCbFVGNE5Q?=
 =?utf-8?B?L0h5TFBZS2Y1YXFKYWJhL095U2ttSzBiTUkrdU9sTXBtVTljeDVHMzZJbWV2?=
 =?utf-8?B?a25SU1NsZVlXS2dPV2VucDg0RTE5bHltVGtqTUlUak5RR09NaUp2d1ljc3gx?=
 =?utf-8?B?aDkxenJlRzRhcDk1NnlEL3kwY0RqYjZvbjQraS9PZEJpeHlhWHFIbzltaVEx?=
 =?utf-8?B?WUZkOGd4Nkw2Qm83VzE3S21Jem1aOTVWbzNkb3lFYVAySENsR2UwQnRqY3VO?=
 =?utf-8?B?emJCVm01R0crdEJkdTcvekdQMUtBazhvNm9wTDMwQWNCVmFlZ2hvK3hFdCsx?=
 =?utf-8?B?Qkc4VFd2MnRQU0JrVUUvenZZRWdXRW8zNTBFOFJ6c1dveTNvNTJSUDFtRktz?=
 =?utf-8?B?RE1PMDdPczBhQzM5NGFaeDEycHZNMGdFRDJ2Q1VFbDBYeldERWRUVlp6R0JJ?=
 =?utf-8?B?enFkSy9xaUxSd0lJc1h1bFEwK3hVeCtvbmxraDNocDlQbjNkdmVuSVNRNVBy?=
 =?utf-8?B?cUJRZ0kwaitiTmtBc1oxVlowQlpUSVJ0aC9LYjdwbzY4YUhQK2NGN3p5YUQ1?=
 =?utf-8?B?TEpHQ2JOUmpCZDdLWmVVdG9JOHVpNzVTcEdVV2RCVktOUzN4SEd2Vkp3KzNF?=
 =?utf-8?B?UlByUXdLUG0wU1RsVlRrZnQxaVF6YnFMb1dYSjhOd3oxcUYyd201dVpaVU1w?=
 =?utf-8?B?aTNHS1Npa2hmSVZiUjdobzJkNHo1Z0MzM2ZhS0R5YkxqSE9EWnJ1T3dJOHFN?=
 =?utf-8?B?WUQzSkJxMytxSkl3S1VQZ3kvREQvSVRpcVM2Y1BUMzRCMTZnK0R2UzNRa0tj?=
 =?utf-8?B?N1JMTlU4MGFteUhJL1BJZGtVNVNXQVVVRFcvWFN6WU45OXNxN3JIMWMrSDNY?=
 =?utf-8?B?ZFRDYlF3VGFZZ1Foc2psN2paM2RmMy85QTBhWEhJdzdHRHNKdERXYXU3RHNH?=
 =?utf-8?B?a1l5UEhPcThESG9uNXZXTHlIZHZxczg4S3ZmejlXc2lkaWdXQ1ZzQnhXNjFz?=
 =?utf-8?B?RkV3U2lQVWhTbGY4OEN1RDRieE80MlFJS09BS3ZzWnp6QUMyS0pFMGJMR0pD?=
 =?utf-8?B?MkhHazBWM2d4MUNBeGFtVzBuSlFXQi9TNVNRd3JyZ2xJd01OMk9tbTlDeTRP?=
 =?utf-8?B?NlhOek9jSkFIclFhc054NFcxd2xpellvaERWQ2RBeUhDQ0xVVzBQcnRlQWp3?=
 =?utf-8?B?ZUZGUGp6WHpJSkhmMllxRDh4Y1Y0S2s0OVBBK2ZPc1B2dGtvT3RyRThRcjl1?=
 =?utf-8?B?U3lXcEZxbmh1dHd4OUcrV3BaTDJ2cHdjTTlKM2oxR2xRZU02c25qbVlQdVpG?=
 =?utf-8?B?TG13cWtzY2ZFUHRnNzk5ZmVNQWlodDBCNWdDcHYxaWlpb1pjcGU5Ni9YSXp6?=
 =?utf-8?B?VTBHQ29qVllUSjRNaVFTK01FNko5YmVWaEZLNjFLWW1tVUZJb0VKbnZGTmdE?=
 =?utf-8?B?bXhCMlpNcEV0MkpCWXNudnJVdi9XSHdsbWMvU29JUW1DdmlpOXlxTDk0cERW?=
 =?utf-8?B?a0Y4cjAvSGZsVFpmVnBNRG9lK0k3bWNRREMwSktWM0phcURQQ2JYY0cvU1Vr?=
 =?utf-8?Q?9jy0AOd55wIbXi8b3EB/sPo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d411ea7-9b2f-45aa-58bb-08dd9847d02e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:13:56.2267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8TmhImh4L1VYhhHj/wbehT0jhet09VTA/LbGz9Dq3opvjhNbGKedLbciv7BRCyd/5vbbUckFup1zKo3D5KkqMvJ2s1sHRVaixt6ZZV0+6LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8439
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



On 15-05-2025 04:01, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:19PM +0530, Himal Prasad Ghimiray wrote:
>> Update the bo_atomic_access based on user-provided input and determine
>> the migration to smem during a CPU fault
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         | 21 ++++++++++++++---
>>   drivers/gpu/drm/xe/xe_vm.c         | 11 +++++++--
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 38 +++++++++++++++++++++++++++---
>>   3 files changed, 62 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index c337790c81ae..fe78f6da7054 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -1573,6 +1573,12 @@ static void xe_gem_object_close(struct drm_gem_object *obj,
>>   	}
>>   }
>>   
>> +static bool should_migrate_to_smem(struct xe_bo *bo)
>> +{
>> +	return bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL ||
>> +	       bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU;
>> +}
>> +
>>   static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   {
>>   	struct ttm_buffer_object *tbo = vmf->vma->vm_private_data;
>> @@ -1581,7 +1587,7 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   	struct xe_bo *bo = ttm_to_xe_bo(tbo);
>>   	bool needs_rpm = bo->flags & XE_BO_FLAG_VRAM_MASK;
>>   	vm_fault_t ret;
>> -	int idx;
>> +	int idx, r = 0;
>>   
>>   	if (needs_rpm)
>>   		xe_pm_runtime_get(xe);
>> @@ -1593,8 +1599,17 @@ static vm_fault_t xe_gem_fault(struct vm_fault *vmf)
>>   	if (drm_dev_enter(ddev, &idx)) {
>>   		trace_xe_bo_cpu_fault(bo);
>>   
>> -		ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
>> -					       TTM_BO_VM_NUM_PREFAULT);
>> +		if (should_migrate_to_smem(bo)) {
>> +			r = xe_bo_migrate(bo, XE_PL_TT);
>> +			if (r == -EBUSY || r == -ERESTARTSYS || r == -EINTR)
>> +				ret = VM_FAULT_NOPAGE;
>> +			else if (r)
>> +				ret = VM_FAULT_SIGBUS;
>> +		}
>> +		if (!ret)
>> +			ret = ttm_bo_vm_fault_reserved(vmf,
>> +						       vmf->vma->vm_page_prot,
>> +						       TTM_BO_VM_NUM_PREFAULT);
>>   		drm_dev_exit(idx);
>>   	} else {
>>   		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index f1d4daf90efe..189e97113dbe 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -3104,9 +3104,16 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>>   		err = vma_lock_and_validate(exec,
>>   					    gpuva_to_vma(op->base.prefetch.va),
>>   					    false);
>> -		if (!err && !xe_vma_has_no_bo(vma))
>> -			err = xe_bo_migrate(xe_vma_bo(vma),
>> +		if (!err && !xe_vma_has_no_bo(vma)) {
>> +			struct xe_bo *bo = xe_vma_bo(vma);
>> +
>> +			if (region == 0 && !vm->xe->info.has_device_atomics_on_smem &&
>> +			    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_DEVICE)
>> +				region = 1;
>> +
> 
> So here we disallowing migration to system if atomics don't work there?
> Shouldn't we just let the GPU fault and fixup on fault?

this is in prefetch, so avoiding GPU fault.
  >
>> +			err = xe_bo_migrate(bo,
>>   					    region_to_mem_type[region]);
>> +		}
>>   		break;
>>   	}
>>   	default:
>> diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> index f4e0545937b0..bbae2faee603 100644
>> --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
>> +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
>> @@ -87,16 +87,48 @@ static int madvise_atomic(struct xe_device *xe, struct xe_vm *vm,
>>   			  struct xe_vma **vmas, int num_vmas,
>>   			  struct drm_xe_madvise_ops ops)
>>   {
>> -	int i;
>> +	struct xe_bo *bo;
>> +	int err, i;
>>   
>>   	xe_assert(vm->xe, ops.type == DRM_XE_VMA_ATTR_ATOMIC);
>>   	xe_assert(vm->xe, ops.atomic.val > DRM_XE_VMA_ATOMIC_UNDEFINED &&
>>   		  ops.atomic.val <= DRM_XE_VMA_ATOMIC_CPU);
>>   	vm_dbg(&xe->drm, "attr_value = %d", ops.atomic.val);
>>   
>> -	for (i = 0; i < num_vmas; i++)
>> +	for (i = 0; i < num_vmas; i++) {
>>   		vmas[i]->attr.atomic_access = ops.atomic.val;
>> -	/*TODO: handle bo backed vmas */
>> +
>> +		bo = xe_vma_bo(vmas[i]);
>> +		if (!bo)
>> +			continue;
>> +
>> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_CPU &&
>> +				 !(bo->flags & XE_BO_FLAG_SYSTEM)))
>> +			return -EINVAL;
>> +
>> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_DEVICE &&
>> +				 !(bo->flags & XE_BO_FLAG_VRAM0) &&
>> +				     !(bo->flags & XE_BO_FLAG_VRAM1)))
>> +			return -EINVAL;
> 
> Don't device atomics work if xe->info.has_device_atomics_on_smem is set?

Need to fix this. Thanks

> 
>> +
>> +		if (XE_IOCTL_DBG(xe, ops.atomic.val == DRM_XE_VMA_ATOMIC_GLOBAL &&
>> +				 (!(bo->flags & XE_BO_FLAG_SYSTEM) ||
>> +				      (!(bo->flags & XE_BO_FLAG_VRAM0) &&
>> +				      !(bo->flags & XE_BO_FLAG_VRAM1)))))
>> +			return -EINVAL;
> 
> One concern is all of the above are platform specific checks - e.g. if
> we had a device with CXL atomics just work everywhere. I'd at least add
> a comment indicating these are platform specific checks.

Agreed.

> 
>> +
>> +		err = xe_bo_lock(bo, true);
>> +		if (err)
>> +			return err;
>> +		bo->attr.atomic_access = ops.atomic.val;
>> +
>> +		/* Invalidate cpu page table, so bo can migrate to smem in next access */
>> +		if (bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_CPU ||
>> +		    bo->attr.atomic_access == DRM_XE_VMA_ATOMIC_GLOBAL)
>> +			ttm_bo_unmap_virtual(&bo->ttm);
> 
> If alreday in SMEM, you don't need to unmap do you?

correct not required if bo is already in smem.

> 
> Matt
> 
>> +
>> +		xe_bo_unlock(bo);
>> +	}
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.34.1
>>

