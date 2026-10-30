Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B1606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P39d+EOa
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62EA10E040;
	Fri, 30 Oct 2026 18:19:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB3E10E040
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 18:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793384389; x=1824920389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hwU7XeemLa3tnC/3gXEwl0Y/7ZigS3IDXxqe2OBKU6M=;
 b=P39d+EOa0tW6lhupofGHAQnaym3Qlk6KZtQ9IKbsWKVgl6R7GRmQoTkg
 EsSbbgQ4B6HDmHJqoITyub9jLz99a+tpYcV3Tz3wG0zxaYK3SEKmqK97J
 oT9rHtGrxZS8BiN8aKOUymeLdUmiWlIYz9XPoRfcmoz8qVZpNOBvt75MN
 W0nvsYAf13hAo3/S8KTsvN7XkrRzxV3mwy4wMj5AKvqvhc8da+39Q3oT7
 tUonEy/9xkkHuiBjGj8iVfqdi+zeFKsk2wGs0OcRDXcPobL0R/alOGfVd
 blnl0r2ckgtyDifyH9LfJcCYVHmQRXFNN80uw7JszJLLOWMOuwAGyhTmf A==;
X-CSE-ConnectionGUID: oyljFnkcTa+gJx/6ZWaW/g==
X-CSE-MsgGUID: IUuglJXtQzSjHBerzvoI/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2043336"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2043336"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 11:19:49 -0700
X-CSE-ConnectionGUID: Ddes/z4LS560S/UCIQ+Apw==
X-CSE-MsgGUID: BwvsKzL8R8KNBKNVFO9Q6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7323914"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 11:19:48 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 11:19:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 11:19:45 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 11:19:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=up0aK8927HxWrWgX4jaeFEVg1DHlNKVhzGAs8DH5H9f3bhNewW05icvAWT0K4df8GCD4rHhE2bgrvzhDmLmu1wq+krepZXBkDJfUplQouOoyzP4zBdLSD4VcZBM/Raw8ZgTZNrXyDMKn2fUOu6iqzHUzU3bec5Nc5hKFlqd7Uol5xjav/dxBEU3C1TteJree/BgBZg+W42N9Xtb2gdpvdIDksSzhi+xq6xZTfuNElKpWY/4uhpPa4YcnfDXCy2dpPP0A+WZDq15VMe4oEjOl9hPF+hL6JnUGskO4GbsmAzryjMUu74NVmiFnU89592MLRpHH/RtixxGFirZIuW5OUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiSHiLTdW+76aXGUc6qXpb6WUn62XdggQGfAYNo1sMc=;
 b=kpCjGWbqU0nbcwiQWspD3M2imBxV8XhvMFtt1VIeJ4AxFaPRKMYeafUet5dmwe8iw94KQO87Qaj+8MUFvWIJKlRVi1qvg/PmIZbKF/Aqq5VC98qYt1zooUdwoGcll6hHYyaiR1XQXc+WG5nI96Pl9HmEd0ypQ7G1TlTPneQ9thZ8Zc0F5IA3p+2RManD38JchoVgtTu2U4oKR6vXRNKH53pLNFjS+oNcIaX47+MFpx1VJvzEGbEEAphuGpGuvgW20BR1JzNwcHswRnqX/5lAPB7JLqdXJQT8nCRDVl69DAsvl8z9D8DFff1hk/W5oCUrefNPL/IAI+fCtu8PqJyGCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by DS3PR11MB871866.namprd11.prod.outlook.com (2603:10b6:8:43d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 18:19:43 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%7]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 18:19:43 +0000
Message-ID: <98886a84-cd09-4376-b49c-8887a2ca9022@intel.com>
Date: Fri, 30 Oct 2026 11:19:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] topic/xe-for-CI: update GuC for CRI and NVL-P to
 70.80.0
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Julia Filipchuk
 <julia.filipchuk@intel.com>
References: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20261027224448.1672411-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P221CA0041.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::12) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|DS3PR11MB871866:EE_
X-MS-Office365-Filtering-Correlation-Id: e5531c62-7523-4afd-689e-08df36b25eb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|261009223027099003|261021121427099003|261021123027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wbgdh/L5c8QKGhc+W/QToxaf3f+ObJHt3AKOy0YPiz5zXNaoVc5YFldOXMDpaS0Oeb2iligclUQuODxeRY42zOP+l+rF+1h1Tie1SMjSA0+28aF1gCucCC9S0kObRnjCivEmibJPLDgPUeRaPxO4y7Q2Mi0ekzFuadlYPferbl5EqXARxZylOOhD3uxvmlB3qmesi7Zypr0zfdrUggAe3iGPjaZ9eOVqIVT47UFNMmduWg4EJpt03GFq4FaJY+gqJs2h83sJfmKLmXKAr0VnG6EC6PU2Up80yOZkaI+/7mHEtm0pILbWsG8oC8s+VS+PTnutg/eeK1mgCjJEjVQ5FBCIEI7woN+XLYQl9S7m4/Bl9Xxf5ggKyXe9A2pX2SmNkDpF+2+QLgkYjO+JUOxxE9NW03zbhkdaC+esDA0FCEIojmHCN6L5kLkXXyC+FE0dRw3aqFWd0888QEjy6seiNCH+Rqlejmx/faBIA9Akuxp5aRVa4DdBm4OSRGRsc7tgAp8ACOwSkyuqR9+FunYT/ekBqleSsGr6aTDfjj3XVEQ0XkepuheSb2vYnLqEoGpwEDKm+UlEK5ss/kSHeF8SOz3Szakg4ABP7rB5tc0ZJvptWTj+lvwiZqmhDs8th2VdxLZzZgfCaAtCTl08XmDe8bYUTWnXPYqIB4uyRMyiQMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHJUbHRaUk4zMjluZ1AyZTE2ZTd4OVMyaENISFp6Yk94SVpKMlRia3hBNHhZ?=
 =?utf-8?B?TC94ekl1K3p1eXRLMDltNVhuWDB0Sk9PaDFET1NSMDJNdEx0MWJsTC8yVU56?=
 =?utf-8?B?YjlMSHZrejNvdUphZHR3YWdQbUs0TU9hT09GUnJrZEJ4SVFwbE9BKzkyV3Fv?=
 =?utf-8?B?MVVCdHZTNjAyNHNMcmZIN2lVWHB1YmZVVHNiQXNoZ0VtYVVUM0k0ZDZidmU2?=
 =?utf-8?B?SUVWS25tSmZoYVZVSEU0ZTFJNEJtU0FnMWJTRnR0ZG8rd3dydVp6bkVZSFZv?=
 =?utf-8?B?UWFRbTZWRUF4NVZLQkZMR0t2dTdRNXlZcFJUZDJ6L1JXTnFaRFB1RXRnMkJT?=
 =?utf-8?B?djJJVlhZMTRBc0M0TTBWZWlzYmtzMWpNTFk4YzZkbnNYcVhDNkFRb0NUYjRN?=
 =?utf-8?B?Nlp0blNkbHVsYStVRkJwbG5rUnZjZTlnQVpDU3lBNy9zUHlRUWg1V01KM2sx?=
 =?utf-8?B?eFZ3MVF1cG4xT1VsUW9NZ3RzYTQ1elpKNTZYSFZ6OGlMeVZSUzVmaERXTys3?=
 =?utf-8?B?ZmkxNG5aUTI1MUdxdzZDMm5xOU5BaElKYTBSU1RHem9pMkkybFpSbDF3enVa?=
 =?utf-8?B?Y1o2U3dVWjVKMEdCeHErZkFsN2tzaG4wUi94YTdSaVpuS3VDOHFuUm1jYi9v?=
 =?utf-8?B?YXZISkFMcGc4Rlh1RkhraWxobTVMVjRLRUpGcHBpQ3RqbHdxUkVRU2RqaWN0?=
 =?utf-8?B?MU9JRFc0cWhzZC9lYnhxNUlBREp6ZUZpRWZscGNMams3MkxCTGlja0gvcEtB?=
 =?utf-8?B?RTdEQUtRenV4OTJTN1U3endhZWhsNk1zNmhkQmUycC9VN0MwbXNKbWtZTGpp?=
 =?utf-8?B?NXdRMEQzeTFmdXVJM3hBUHMxWXYrb3M3cmNjTGY3dU1NYkZzU3JpcFAvY3k2?=
 =?utf-8?B?RUZIZEl0aXU3VnRVZ3VOTnNsQk9KYjhSU1YwMFBBN2U2K0pFN1ZnUnhyZ2Ez?=
 =?utf-8?B?ZWRoN25Cdm1FVU84MHJxU0JWZmRoRXk4aldKYUhxZW1Qb0wxSlNwS1RtK2kw?=
 =?utf-8?B?eGNOUFo0U05XcXQxMFMyM0I0SW5OMDR4UGtqZlRONDZmM1NpcndMd3gybWNX?=
 =?utf-8?B?cGVuNWVIcWtZRXpaUXNNWTl2YnlSNWNSeUNCL01WMWxpRnhGRFJUSUZMeE9z?=
 =?utf-8?B?eWpQWjNBOWJYYWhCblZ1MDluWkgzeVhWdXd5dHBsZklXK0JVdTBSWFkyZTlx?=
 =?utf-8?B?amZuekM2TEtyZDBpWEROQVcvSytEMlZueDVvNjEzMTFKaFRZMG5XTzhFeEtH?=
 =?utf-8?B?ZmdjYlJKakltV2NxNllXeGJaYk5RZVlZd1FCUkI3dlMvN3JoWGtMRmppSmE5?=
 =?utf-8?B?STR1dlp1U0tQd1RnbWdpcjJPOC8xbTZ4Vm1ST0wzUHh0dGw4dUlKUGRPaWFP?=
 =?utf-8?B?WlNjbUNKYXJRenBmK0RZMTVkTlZSa1orcU5NMlZmaDdyV0pET1pPQ0JUYUZk?=
 =?utf-8?B?MUlHVTRWTENjTUs5SWJjNTJ6S2U4OUpmdEJSbCtrdS9EYUVYV3NZQ1ZTNmx6?=
 =?utf-8?B?YzNBcmZjSGJ2WUdiQmhVWjJuUk50azJMTjhGeHVsQytXT2FXUStsemhjRG9X?=
 =?utf-8?B?ZFVXaHBKcnhzVHNVNWt1RERFK2dUUjc3UHU1d0JGb0txQkc4a1FvR0puT2Vk?=
 =?utf-8?B?VXBRQmJOeldZOXpuSmVvdXBMalNrTG0rQzVBWVVwN1Z0MFJaam1lWkZKaTFu?=
 =?utf-8?B?NXZuSGpnRmJJeW84T1ZCbDRpL01ScnZYK2ZCTVRVQ1VMZHZhdWFSZkdOUUJL?=
 =?utf-8?B?aXF4MzAxZnFZL3EvU2RwT0xhQnVwMUROcXFDTlRTeWJ1QkIzMThzcHB1MEJC?=
 =?utf-8?B?MGlyWEVwY2xpVVlVWHdsNkNDc3hKbjlGc1ExRzBUN0RxOGR1NmlWV2MwVnlu?=
 =?utf-8?B?V252ZzZZNTk2WnRIQ2tmTzdKejhKVzNwdElPQXB5cjlwd3hLcUxSZkZBcUM3?=
 =?utf-8?B?aldIS0E3djB2MW0rMnFZTkV4RGZEcFlqYjdtZytaWEpHZjJNMXR0VmZ1c3N2?=
 =?utf-8?B?MER0M3IzQU96K1Z5RkIvakdnUlU3SHp3cUlic2ZqaUlUNGF4M3B6Y2VkNEdM?=
 =?utf-8?B?Ti8vdUlZUWNxMDVFWTNsdVBWT21RQ1h1djUyZkpjaVBkUUJCMnVkZ3Z4WFM0?=
 =?utf-8?B?VVZlUUNLYURaWm1mZWE5WFZPNlMxV1FhVGJuWjlGeTV2K0lVRUlDMEtTSW9H?=
 =?utf-8?B?YkpMMXI1TlNIZVNQQWhhSEV2TUpyazVEbW5VaTZDVEZEcW1NQ2VBaUFmWXIv?=
 =?utf-8?B?YUJxVnJGRWVaQnE4NHdtcHQ4aUQzNk02b2VWaktPcGh1Q0dTTmZubWFoZENN?=
 =?utf-8?B?NmFkTmdXMlA1a3lDalkzSkp0c3ZLUUtmR2tTc2lJenJQMXROMzhOZjkrRlp1?=
 =?utf-8?Q?zlgz5qg7i7NySuWo=3D?=
X-Exchange-RoutingPolicyChecked: Asn0fpdzo2DCH+m5lo2h7DqMquzx/sykGFyTkt8gTnpB0zcI4DQLqp41gTco3Ulp2cZuEkkn4uk7fsg25TffdBXY/AryVN+DhuUJLlFnHc22fVlA+X77k8TGfTeEtiDUUmPXJixkkwOPGt5WYBNfKCvAWKjLUbpcOqa7TtICNUj8Q22bDaXmfFS4xeVla/Bjs42Uzg9j+MCRULTTgIEzvMTKnpVxv9ApGt8W4MuLXZr3y6KcGNcLmKk1pnT0uHfcM41Lb2LGNzkJI01Rgqt4vEpzoK5DIE7ZCKK5ObJTz1LuM0BusOE1bC6bO8H1d7fydMfx8+uj9D9a8Jjw96Mqqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e5531c62-7523-4afd-689e-08df36b25eb7
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 18:19:43.5671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /e7bwy59oMBr4xktGINyTdZ6aKrXjdD6sqJPEVKTg90/DXfbbw9HF/xVQrV3+IhjZvtf+I3wqA5/ak6PT8l+Ld2ygS4rbmbKHtyxg3uoFRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB871866
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GuC team recommended that we move to 70.83 instead, so please ignore 
this series. New series for 70.83 coming soon

On 10/27/2026 3:44 PM, Daniele Ceraolo Spurio wrote:
> Move both CRI and NVL-P to a more recent GuC 70.80.0 .
>
> Since those definitions are in topic/xe-for-CI, the series reverts the
> older patches to mimic them being dropped from the branch and then picks
> them back up with the updated FW version.
>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Julia Filipchuk <julia.filipchuk@intel.com>
>
> Balasubramani Vivekanandan (1):
>    topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI
>
> Daniele Ceraolo Spurio (2):
>    Revert "topic/xe-for-CI: Define GuC firmware for NVL-P"
>    Revert "topic/for-xe-CI: drm/xe/cri: Define GuC firmware for CRI"
>
> John Harrison (1):
>    topic/xe-for-CI: Define GuC firmware for NVL-P
>
>   drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>

