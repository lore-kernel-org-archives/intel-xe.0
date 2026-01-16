Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EC7C982FE
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 21:05:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4224E10E0F4;
	Fri, 16 Jan 2026 21:05:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMQB/z+O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FA810E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768597509; x=1800133509;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jgkVU/Lp9qIPC5bk4tfUpdwRKd9Q+6ufSoi/65dgw1g=;
 b=KMQB/z+Of0fgiw3wnzFpLB3TbVMsUyMMeJxOhQJBti6wkxP9Kqfzc+Jl
 AWYfTcr95k0pXxCdWuoVXEKyX7Ag6PkUEixErLY1H50eR2iJ5Lea8i0LD
 mJfoNU3bTkq5n5lP0XhosElODoEl7jApmXZF0mdvm2YErasUP0oa7KVB/
 hvADckDpo/USXn3Zo6Ef2g2mqRezR0xwlIiA6G4sM8Jzp84buvob2A89Q
 tlb+B1kamWnZTiy4aeHZf+exKCi1sH+06OV81P9ncFr6lCchg/CmtQSIS
 12lX7gcYZv8FSUoAsG3jccWRxQ5hmQ+E9Uatmyv7C+eXHtp0KX9TXnI39 A==;
X-CSE-ConnectionGUID: a8DSCzUxQ2CtsjvkpU5B4g==
X-CSE-MsgGUID: n3eNrDP4ROW0N/D0MKJSsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="80638220"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="80638220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:05:09 -0800
X-CSE-ConnectionGUID: g1HIJSpzRMSbal4OFniX5A==
X-CSE-MsgGUID: xrpEmWV/TpaQ7vqWF73MNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="209470093"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 13:05:07 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:05:07 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 13:05:07 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 13:05:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAORckAWRd67De7o20SJP/UM+g/rnReoD+aVOfgs7x/qp91OGm33btTvcLZxoGHLPAyJdrykf5T+htKIpYUCvpG7vxvFN2KlLvSLff6zbBDAfXDkVwUodppAzs3U4/6RHkFKQCUVwZS92QJZfNIdhz4S6icazBrM8ErGedZrIemrSvzBkAOfcRr5mTWyB7IYc+xs/PzR+/zBHV/p9RnW5wFl9b27XxQI76dBqoCbm6rc4yG8oJZ4LP0Bq8zp1w+36v6qM/JRPDyx0PKTgPB8xR1dM/YDE8ngLOSXrYO1Aa/mvJgfiOapuydtOs5TFqDcGP/9a1yeOgrCVSZvfEzvkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWR0urrPa1fjdVdv4nIGo5lwNJV4tfNwp/lzBrY8E9E=;
 b=ucbzFMNTpVidV9ABzFnp9XyWbcTG2zogstKgaUppl5cG6Wv1k6s1Eofupak0IJg0xAPoMBdsqVKkraA+c5RJNN534zE4NST72EFtJ8YAfoOqyBxKdcERg50/LVGu9jWtYaMZiOjQ++0uusOBDPLmBpYpzGKrVmsKuW/XQSo3lfYOoCUGOgRWy3kz6CHCCzV9S5txKf+ghagGwlGhITwHoVF751Te4ORLIR20eachywf5l7TRxg6HxE+b7wCzbViW9tprub01NUJXSIJtZNrb6d5sbSzd5GPaNlUvPjoG8ieYa5kvlnCUpsUNxnAQEJbkoOc/pMZrrSm4xWxYy6I+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4956.namprd11.prod.outlook.com (2603:10b6:806:112::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 21:05:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 21:05:04 +0000
Date: Fri, 16 Jan 2026 13:05:01 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Carlos Santa <carlos.santa@intel.com>
Subject: Re: [PATCH] drm/xe: Do not preempt fence signaling CS instructions
Message-ID: <aWqn/eXaw2t9j4fY@lstrano-desk.jf.intel.com>
References: <20260115004546.58060-1-matthew.brost@intel.com>
 <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q4f6zwko4q6337m3ap244j6q3lfqqrkmlxq2l5ojgcbensliaf@yj7ndeqnrvuz>
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4956:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd91b34-f3d5-48cc-d4d6-08de5542ebe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UTU4bThYejEzR3g5TlRvL1lsVHpQaUh0WEJrOW4xWllpUVlka1NEUXA3UDZn?=
 =?utf-8?B?ZzRrOXJmLy9zcXd5b2tqeGcxMkpReGFtYUlMTWRvRkZDdEJ3c3pnQUdkdEtY?=
 =?utf-8?B?eDh4bGg4VW05VVdPdG9nYTAxYitvb0JnQnJOZ2dMUXdkZ0NCNWdpeDM0b3I0?=
 =?utf-8?B?VzBQZ1dpVk4zOE14WVZuQzJrZVorQmxzOWllSWFGZ1dqdDZGNFBqUzF0QTUv?=
 =?utf-8?B?ZjdMaTIzaWtaSVRjN3hQMEwxY1pYU2tDaUp6Zm5VT1NKRzd3d3QwclYwaEFi?=
 =?utf-8?B?ODNLc2w0QWxBVlRrQzE5VGMxV0E1ZzhFclpBbmc5aUpNZmp0MmlZZUc2VUgw?=
 =?utf-8?B?ZDVwcUxEb01QakVkbURBQnMxc1VlREswRWdJSU5KOEpsODRkQVJ1b2dKbSs3?=
 =?utf-8?B?eEhRMnA3MjdRd01QNHI0d096N0l6STFLZ3Y2WnZIZVJLUHlpVWtJTkVKd2ox?=
 =?utf-8?B?dTY4UWxVWmdxUi9YaE5ocUxxZFpDKzJLNHhkempneGhXME5iNlJlNXZ6K2tM?=
 =?utf-8?B?ci84YUxNMWZOZVd6dWIvb1NITGlPYVNyN0k2TDRDWFk3Q0NpYzlxdDlPeU9P?=
 =?utf-8?B?S3pWcnZVYXFQT0pEQjdBZlp0S1NvbnM0SkRiZE0zeldWOVoyS3ptbG50UWth?=
 =?utf-8?B?ZGt4VFI2UFl3QXc5dW9SOHp2MkxLZTlSMU9MSVdwMzdkNXJONVlLZHo4dE5y?=
 =?utf-8?B?Um51Y2dCdVlzMk9jVC9CL1EzUXZQd05pbkR6NEs5Z0toNWtLa001bXhVRXAy?=
 =?utf-8?B?MHpLblNnU0x6SjNza1R4OXhvNXpsKytkMnV4YzlvekJnZlE5K2xZMGhKNTRE?=
 =?utf-8?B?SjIrZUtlTHVRZllBU3RoK3RPbjhJVDkrcVErT1NmZVVLMHNKR2t6a1l6WjJo?=
 =?utf-8?B?Ynh1cnRIcnkxVzBwVWFNK2xWN2U4cm1ielVYNU5reWRxUUFuemdCVVdaWng3?=
 =?utf-8?B?WFdIZW9ld3I3UGdyUWNkRjVUTUFXN3o3eHQ0S21EeC9EVHE5eE5oL051UDBY?=
 =?utf-8?B?S2JXZ0FqQTZ4VnNESFkxNnlNcm52MVNZMG9kKyt0bFZlTVJOT0ozRFJjcXVv?=
 =?utf-8?B?cU45OEFQL3FJck1kTVd6ZUFDVSsvWFZwdmx3Y010VE1FOHY4ZGIyNzBYRVVR?=
 =?utf-8?B?ejN5ckhFMGphUzRPOVRqd2o5ZHpFaGVLeTV6aFZvWEdPSml3aElFMGs2SEdu?=
 =?utf-8?B?clZyZXZHckEweVhnRW90RC9acGEwdUo0UE55VWd6eHNMUlpUS3VJTWJ2OHhr?=
 =?utf-8?B?cXR3VHZrbTNkdC9wNTBkbllkdXg5amFnVzd5SkNia2pUNmd4L1RzV2hpVUg4?=
 =?utf-8?B?V2daNnpPTnM4TXRrUGJsK0NldVlUM3l0RkJaYUxObFVudlZzV0VSZWo3VGhU?=
 =?utf-8?B?clQ1ZGNZWnlhWHJqMmhpblN4RWZVS01rdHpyQUp5NWF3MWozQThiQUpUNHU2?=
 =?utf-8?B?QlJDamNUMWZHbWlHckw5WkI5TkdwenlYc0tScjNmeUlBeG9GQUZzSmFKS0Jj?=
 =?utf-8?B?a2VQa0FYM05HU0VEQVRGdGFvN2tZeXVSV0FPVEJEd2E0d3V3NTdvaWR3TEF5?=
 =?utf-8?B?OTZEc2lsUHI4Ykh0VUtnakI5Tm8wOGdyVytPZU5nVm43MFhLMDFGcHpWbGI1?=
 =?utf-8?B?QmdxYXBsckt4M1Y3U1ZIVzVWdzNVeUpjUU5xRC9PaGthbllLdmJTQlQzcFRk?=
 =?utf-8?B?SHJCL3pkL2RzWEhSR2xVNkx3K3hQbXRFRlBoTGNWejBQclhobFVQcEYzcHZR?=
 =?utf-8?B?Z0ZjbndkWWI3KzV4TnJGeVF0c3B5QTVaNG14aUJnMjhVZVM4UXltKzNxVVBt?=
 =?utf-8?B?MmZOVUIzMmlabVVGa3dWSjBCOVgxeVlmV2VzMnJXMHdSTzh1UDRXbmk4UjM3?=
 =?utf-8?B?bzd5Njc4ekVpRG1hTkdDYkVWRGFDVlExeHJGMWsyaS9XN2RELy9nOFVHL2JH?=
 =?utf-8?B?TVR3SkdmWjRlYWpWRGdUMitvWDFWUmE4bldQaUVHUGlZcEMrbDFLdkg3eEw3?=
 =?utf-8?B?OTIyS2o4L3hTZWF4MnFVRDdBUXBMcXVkQzBkekI3RmQ0NlFGRnlHdUFhUzJh?=
 =?utf-8?B?YnBmVjA3dzBucUJCcFNjR1ZIcWdMV3lpRXJDYk9QY0hQOW9PMEw2YXlHck14?=
 =?utf-8?Q?pLGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blROL3lmM0dRZTBieUpDZXhZMWoxS0U1VUlJVG13cytVZXNiaWtWbUJrblBx?=
 =?utf-8?B?Szd3d3I5S0M3b2pSTGFVWWZKWEVLWGJRRnl0K216cjFJSkVXV1BkL3N5TkQ3?=
 =?utf-8?B?OG1JL0FqVVpVdkp2TUFLQ0NUU2p5MnRqb2E1NEpYeVZqN2UvdUNHc0VLY3pl?=
 =?utf-8?B?eTk2aXRVK3hvVlBWa1BwTFR4NHkwSFFuSUtsS1FmTTg2cmx4NWU3ZldpVG9I?=
 =?utf-8?B?dWdyYmdGdEMxcXFXOGo0WFUwc0xvNUt6dG1HeTE0WVlpQWhLZWVYVTdLa0JO?=
 =?utf-8?B?L25KNkNwNkxDUEFxMEJmQWJsaTJuTVd2M09IWk9TZVRpbThRblBzSWVNamZY?=
 =?utf-8?B?My9rbE11dE1qN3IvNXhRQnhCVnhRYlRoM2c2eEgrMnNmYjlXSnlFOWtIYU5Z?=
 =?utf-8?B?ZWl0blpoMjRuSHdQRmo4MW5ZUGRwS2FCd2hVLyt1SHI1OUFCQzJidFdzczBF?=
 =?utf-8?B?RXhCLzNYSDhLNCtxbkdaRVhSQmhhekl0S0N2T3U5T1dMT1BHK3N2eFZNb2tU?=
 =?utf-8?B?OGZ0bC9yOTNCdWZNWG1FRVhFa2hucmhNMURpY1lTblI5VUI1eXhmMjRVZmZW?=
 =?utf-8?B?QnQ4cGZsdzVObWZvdDZWd3N2TU9USXErVk1JdUVLNFExK0RIbTByU29iZ2Nw?=
 =?utf-8?B?SDh0RnFKcFBsbkVtckdzRnJ0Vlh2Y0pXRkIybGxTTUxpeTE5NmwxZXZFMzFv?=
 =?utf-8?B?OUdnZUpmTlNCMit4WnBSREEyM2pHVEU5TkhDTUMyc2c1SThUdXhGQWlrZVdG?=
 =?utf-8?B?eHp6L2xocEY1Y2ZRRkl5UFYrRVB5Y083RXE3NDFsYnBBWnErQk5sS0t5VHZC?=
 =?utf-8?B?b21XbjVGMmgxc1ltRjBDRDRGMlJPOUxDL21YQzVtVTM1dExIVFBqV3pORWdF?=
 =?utf-8?B?eUlqOFdTT1QyKzVKTmxYSmkxZTJoUU1DQlRVZXErbU1HOEE0d3ZCVnRockNF?=
 =?utf-8?B?RGJMVnprYVc1MktwallGTGlKdmduTExoSUpDVVZhUXhyaHFWcFBNU2d3L084?=
 =?utf-8?B?L2RuQ1JsZ29JMTlITmRiM0MvdVBodStQcmJqWEFOajhMWm44YXJEYnF2TWkr?=
 =?utf-8?B?RmovNy8zV1pXVFNPdkZmMHh0dEpxL0ZrMTNCUDFYbE94MGQ3Sy8zZnYyWm9J?=
 =?utf-8?B?dmtsK01NOUd5NzNSSTllQUd0YVlSZE9HblhxUHZ2NW9hcUlURlBPeVMzTUpz?=
 =?utf-8?B?TUNsQys2a3VMdFNrOXg5SXlDUXZJNCs2NTZHa1p3WGVDRy9TbzA3QzR5MXBV?=
 =?utf-8?B?eDJQWG9VQ0FrakpXenlzcFZjd0NuWDMvM3pDeHZnaDhyUlhkQVRIVnY0UlFq?=
 =?utf-8?B?RDZ3SkJhaW5LT0VaaEFVRE1ncU1LdFJ1ZFVQcGhMUFZqb080U2FubkZnQThy?=
 =?utf-8?B?ekNvUEhKQ1RxbXFlRytIaTgya1RoT3V0bHJTV3BqeHdVaklyOEtsYkd1ZjdC?=
 =?utf-8?B?NXlJaDlaU0txQUZicUowcEVvSXk5M1VKUnhjN0tjUTRPNnVnUVl4bCs1YzRj?=
 =?utf-8?B?OEVYKzJPWkNqTDM5ODBqZjAyN3d1QnpHT3VqdnBXek9nbE5iU0o2SW5hZ09B?=
 =?utf-8?B?N3RSOHJ5Z3U2Zm0rWGVtL3dRdUxEZjJVZHIxQnh1M3FEcUJiMGJTWHFaRVhq?=
 =?utf-8?B?NlBpdXIzT0pJK1h5QW56Nis5dEw2WDVNK215L1hzNkgzWVRxY2pIZk1JZXFh?=
 =?utf-8?B?bEN0M0IyRWJkb2FCOFJTTWpjNEUxeTlRTVZHNERhQkpjbENmUlE2MXdxbzhs?=
 =?utf-8?B?RDFTZ2NTTENMNlZveGdYbTMybWFzOUZmYWIwRndSU0dWQ0VqSTl3emJGaTcy?=
 =?utf-8?B?cWJoemxyM1pXTUtLN2RrMnlwanNMNDg0UlVNc1g5NDJpRVlSdHZRcXdGVDRH?=
 =?utf-8?B?S0tUeGdla2Z1UW5wVGE0WURJR0NhSHIvMUxkbGtZOUE0NHpibjMwc2ZiekhY?=
 =?utf-8?B?Rjd5Q1lRRFlQTk16czBTcW42KzAyaHh4ZlhvUzh0dVdoQUZUTXdwSkJad0ZM?=
 =?utf-8?B?ckhhK0Z4ZTBJejVpbVVtRmxpVXd6UkdTYjJyM2lDNDFrMy9obGF3UVZmaXFB?=
 =?utf-8?B?UThHckJ5RDFyMVM2eTNxcXduL08zK2duak5GRlpwcTJ1THRkKzVoQmZqRS95?=
 =?utf-8?B?MVpzOHRQeXJabitkSkdxSXdoM0hzWWsvb0ZYdWFYcFNGRjBLdTk0dW5MRlhu?=
 =?utf-8?B?UlpCa21JMFY1TGwwTkpwZ1hqTFAwdVpIWnMvTEk0eWl6YnR4MTF2ODJnczdH?=
 =?utf-8?B?WlJ2ZTR4QkxpZkZ6U0N4ZzdFeFp1REpaa2VVc0ZnVnFpK3NzK1NoSHE0M0xm?=
 =?utf-8?B?VGdNelNwdmd3bithY24yaGJ1bUNYYmZGVFJDSzdRYlZwSldyYVdqN0h5QTZ5?=
 =?utf-8?Q?J/47MWwFItzBGHRs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd91b34-f3d5-48cc-d4d6-08de5542ebe3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 21:05:04.8551 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U56iZn9fFUo2JX/QH6v7o6hQ1Vp4QHjyHbW7uwW0JOJPX7Q2Iz9+l0pJ/9faRhdUioLU957mI5HFoL3CZlXN6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4956
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

On Fri, Jan 16, 2026 at 10:45:39AM +0100, Zbigniew Kempczyński wrote:
> On Wed, Jan 14, 2026 at 04:45:46PM -0800, Matthew Brost wrote:
> > If a batch buffer is complete, it makes little sense to preempt the
> > fence signaling instructions in the ring, as the largest portion of the
> > work (the batch buffer) is already done and fence signaling consists of
> > only a few instructions. If these instructions are preempted, the GuC
> > would need to perform a context switch just to signal the fence, which
> > is costly and delays fence signaling. Avoid this scenario by disabling
> > preemption immediately after the BB start instruction and re-enabling it
> > after executing the fence signaling instructions.
> > 
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> > Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: Carlos Santa <carlos.santa@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index a1fd99f2d539..cd645ee400b9 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -282,6 +282,9 @@ static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	/* Don't preempt fence signaling */
> > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> >  	if (job->user_fence.used) {
> >  		i = emit_flush_dw(dw, i);
> >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > @@ -347,6 +350,9 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	/* Don't preempt fence signaling */
> > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> >  	if (job->user_fence.used) {
> >  		i = emit_flush_dw(dw, i);
> >  		i = emit_store_imm_ppgtt_posted(job->user_fence.addr,
> > @@ -399,6 +405,9 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	/* Don't preempt fence signaling */
> > +	dw[i++] = MI_ARB_ON_OFF | MI_ARB_DISABLE;
> > +
> 
> IGT tests which calls compute-walker, then bbe are asynchronous (don't
> wait for completion, pipe-control is necessary to wait on
> compute-walker).
> 

This asynchronous behavior may explain things. Is this a common use
case?

Also do you know if render engines have similar asynchronous behaviors
or is this specific to compute engines?

Lastly, the i915 disables preemption on both render / compute engines
immediately after the BB before emitting the pipe control. Is this async
behavior a new few feature in Xe2 parts which only the Xe driver
supports? This might explain why the i915 works and Xe does not.

Matt

> May you try to put arb disable after emit_render_cache_flush?
> 
> --
> Zbigniew
> 
> >  	i = emit_render_cache_flush(job, dw, i);
> >  
> >  	if (job->user_fence.used)
> > -- 
> > 2.34.1
> > 
