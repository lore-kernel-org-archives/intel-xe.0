Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65476C5B572
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 10:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F8910E0F4;
	Fri, 14 Aug 2026 10:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m6/LTWIB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD1010E0F4
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786704421; x=1818240421;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7RZExp+l6I4hTHxKreZhi7QyZz3EM//brN2uUBA4xHg=;
 b=m6/LTWIB09NQbSXTcX7FgFOJfFvKw/ZFhw9mwKyZZa+eQtlwAXYmTGWS
 HskOyrZoVGx7ZyG2d7wBMUAC6QNnRYGbjNUpZvDt6MOJnhmpiHA5o3zXz
 07D8E+851LBv+BM6Sszt9zCkuczm7RutfNgUhb+Uj3NRIYupx+dbhjFOI
 1ekSO5VP/ec7KSK/Sbuz/ATL50wgvlvngvXgGmIKThh581sUHuD83On/B
 G7A407r/q02TjfR8VaWN72Ohkvk5L8urPUXJxsuxKAs2J/YTmiV5Zgrqt
 DoBx9X0LvKPgkFSPCragVUNEn49G9LERWn6nlChHQkAWTp+zxmDe2JFBD Q==;
X-CSE-ConnectionGUID: jY0nlZuURKywiLe71N8HPA==
X-CSE-MsgGUID: 4270870qR/aVYTzsBwl1OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="98438519"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="98438519"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:47:00 -0700
X-CSE-ConnectionGUID: E++6f1Z5RY6rvmJ5QTEYcA==
X-CSE-MsgGUID: farBayJLQEiC6RTcRyucSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="261546971"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 03:46:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:46:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 03:46:59 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.14) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 03:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZRzsonRV+BuTLjOm5xRvAJh5Up1NKTl4Za+elk918wjFMEEBYe6pn7U/Z6GA0vDdyo0o7kukPqT6nfzISWzXk7EFyqEKMKluhzv3qtufqWg/Zojkxl/rh1BgZP4NtxlBhFBeW0V7frNJiKFTOR93qRORXFzgNEx+ghu98G+tI1x37DC9xvWje9HMt9ZTz26lh15Ga0eWubUvmj9nYRlJfVl4E4N3E0SyrdhS9MXMSF/WTE7b0MkaXUlsndeYpoef6CC0c/nmSPur2m6Fz81N1gvNwstAYL9lzClTQHqmGwDP78Zss+buqCQRIZ4ieQGcih6g0iHcfUat8AHRnXlg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLjB5JQxO4p2ACu4/fsSWlAWLL1uA0HEZ8Y2nDUQKgE=;
 b=W4O8W23wmW6domyjciERXij82Oy2RuhP4DwGsg01+E6FtSUfVrLod2rT3V2ECvwy9Dv/kKa3gFcIac6KkHcmhcHS3Pa/rLLJN/ADCPJVMVBvUZgB9x9bdOdQHdFApz8TmQOipBXtuaX8zPn/87bks1ZcDDDdDvu+JDImrsPVeSbYlCUZ/h+TJhAkoshLsz0u6kVQiRurU0syEYRH2fR6uszoP0I27pVh4oinvFdlxLie+oa10FOzCJN997cHfcTfb8886tVK1YAf0XPnTyfMOxUyyWh3xXm46IU2ThQolTacc8x1q4F9EvTj7Ow8D66Tg8oddYhXCLKtK5Z9JmcrmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Fri, 14 Aug
 2026 10:46:49 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 10:46:49 +0000
Message-ID: <1eedcedf-5585-4358-98c8-d6b79fb32e5a@intel.com>
Date: Fri, 14 Aug 2026 16:16:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/32] drm/xe/survivability: Report 'boot status' using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-21-michal.wajdeczko@intel.com>
 <d587a47d-003b-4d20-9412-0ca47c8ce5b3@intel.com>
 <9658c1e5-03ed-4521-94c8-c8bd23e65c99@intel.com>
 <b0d83bf9-a060-4593-b040-7988b91bef79@intel.com>
 <2662b52e-6fbc-4fbf-8528-e55656c387c2@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <2662b52e-6fbc-4fbf-8528-e55656c387c2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0363.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: b4782c74-8b9b-4a33-12fa-08def9f157d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|56012099006|11063799006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: 8Q6FusKTOFeixyT1zVLqaj609YpKkEj1ltO7scfCtNDRQZ2oWc8xf4vaiXqPA0lV1E8++K8bTQGJGHkMSupYipQ+UTfdapdss9UV8h49nZXtMTyKu/C4I7nTn0/9VfS8+lMGetyCWnBhlyB6o4qv6RVTeo8EFYpaOx/FKCyZi7mKEmnn/YYkwBimM0EE8IMreANgF7DUaKp+JzKiGF+Qndo7NEUNtxWBmFXu33etctVlLrfYf9HEtpDSBWMipV4HaZCkWGHAXXLC7csJL15+WC03FB3mCCECTUhAmnoPQs5H4OdOJtgVmqgRT3P329/cmRDwmXpWgoZyPMdb79zL0ztoM9r+PpA23geMYhsIK5cRgZrYtrBikvJi3Avv8++r3gHKe2aPPPk3QxVsfv4A5iIr34l4hJfU9tvUMyqhmPONgx6PR8TscG68crtpxZKjoIqrKm1zPrfu9U4mUtOeuu/S4XsQOY2Er2bCLNpvF+yJ/tc8Jvh0rhIlrh1qgZfReCD7PdluDzu6rJ6fgPmc3awHkvqPGMITHtwWvZO3zioNSGX7v8ismAdP+eNxk3LbzqV/AZbIhUhXEMHwleG0mrGh8DCI/mKorC7xExKzjkRsFvAkLCAFX7qn3v/Fg2LXLF+bFU+Uf1Nb7ztomvFQ340rBjDPuJuLjNcc1h9Aa+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWpUSG85STUwMXlPeUt6dUg0aDBMejM5OUh2aC9jcEI1a2NzRVRDdStkemJT?=
 =?utf-8?B?QWVsY1I5bWJaVjdmS0VEZjVuYmh1eERCaUZocFJKZnlJcUI5SHpwWlVQZ2lm?=
 =?utf-8?B?WlIzUkVqVzZDeklIVHhMU09LaDVqOFN6RXZFZXo0cmsrb0xndW04Yit3NzdU?=
 =?utf-8?B?L2NkcjdiZ01uamFLR1ZqWkhiOVlGVnIwMFdjVi9GSUhWRU1vdno3TkNUTkNN?=
 =?utf-8?B?SmlXbjRNMVVuWVhUaTlyeWtYK0dGVU81dUhmS0RVTXJ0WWNQWUJKWHFDaC90?=
 =?utf-8?B?czRUOS9ha0F5RVFWeVdQTmE0VTdoOVZRVERlL1Zja2EyWk9xSE0yWHJpUmtt?=
 =?utf-8?B?OUZtbkZjM2thbnp0YnlWbUMxdDFDWTYyOUlJKytGSzJJRVZydUtXNllZSWRO?=
 =?utf-8?B?WTJYcGxkRStQb05JRzgybTh5YWJUaTdXYTA1UmU3UlhHSW1sa05tcHhOalpa?=
 =?utf-8?B?cFRXVDM0YmxOOUJOUDRtMUY0YmswUEh0M0FxMzlEQmhObURPWnZodDFwN1pj?=
 =?utf-8?B?aDRuVzJDa1VINTRIVzVkaUlBUFJFTHhlV2lNT0lqUGN3UDBwclVtWUpsYzFx?=
 =?utf-8?B?QjdRQXNET2VUTS9WWDd4akR6NjQ4U2tMN3c1aFBWNVRiTkFNa2EzTzVyRVBY?=
 =?utf-8?B?VVZJNW1jSTBnYkFjenhETmtod0JVOHYrK3pEUkk3NkVBNUJlQlcrWm81OWVN?=
 =?utf-8?B?ZVZMTjFvcTA3QVpyc0cyR1l3YVdyeEVMRnVwVXdwclpNK1lXV0FkbnhuUHRG?=
 =?utf-8?B?ZmdtbWtGdUt3SEViVXRuM0x1TUdmVWdVb3pIeEhMVHJreXo1ekVoYmVab0t2?=
 =?utf-8?B?YWdsZUFFNmZmeXUydDJ2WTVaR05YYWMwV2hETXRueHFIbDBmcU9GOTBqZ2tR?=
 =?utf-8?B?VThPMDhqREhwZzF2M0hXc3pGUVVwYVRBdm14RDRvRXFqVXI2RTE1YXd5U25x?=
 =?utf-8?B?RWJjQlF2eEg1aS9CTVBORDdqaTJ5WVUyZFgxZlRpdDFXVU5GanpNNXRadHdh?=
 =?utf-8?B?Z21MaGpYRnROSHg0azZqdkxXQ0pnUDN6RmpLbWF0Z2YwdEdFZk1VRVpGb01T?=
 =?utf-8?B?QVFGL24zOUp2Y2VtdC9lc3BHcjhIWDBOK0NKOGNadkJEazd6NzE0RHV2NXpj?=
 =?utf-8?B?SkxXQjFmSXJaSnlwaWVEYVB6bE9JZVJSVXhtb1pEUmpvaTBQb21LVE1WUE5M?=
 =?utf-8?B?RWxIOWpoWUR4WC83OUlXTVhJWTJFNzdOenR6QnV4SHhxSXJSQzh1ckV3WDBP?=
 =?utf-8?B?NHFveGFwMXZtR2RKd0g3dG5WeWtsMnBiMFcrblpEUUQ2ZTl5azcrdUtJUU1D?=
 =?utf-8?B?Z0ZPeEFza1ErQ1dZZElTems5d0twQ21nRFZIQzkzM3ozUW1rQy9RcHVGTFFn?=
 =?utf-8?B?UGFlRHRoRjhpcFZRaG9wUzdLOHNPbVNMQTBmci9CSHNMeUl1QWMvcjFNYitt?=
 =?utf-8?B?Ymxvd2l3SDJ1WjNZS0RDbUNuZDE0RklKTU9WeEsyVkJMeVRCQzArc09IWGZJ?=
 =?utf-8?B?L3NyVmpNSTRIM29OcWl4ZzRDbWxCOWdYTXJPbXFMNHJpWUpuRmFBUzVGNHBW?=
 =?utf-8?B?di9qdFU0KzdZampvSHlqMVE3dytrWXBXVUNqNFdMSnUvSGNWbXNUQnZyczVK?=
 =?utf-8?B?NmRWclZFSWRGbkhSR0JieUJrSXJZOTBYb2g1SU9SRHRqV0NyNDFaNWo1cmdp?=
 =?utf-8?B?RXBCRzBsWTJtMWU2UlkrMlEzRVVXSHdGcVoxK1RNOXpDZStIVDBubkV3R0Zr?=
 =?utf-8?B?dy8rSk82Q3JHRHRyUmtVb3h2Q3U1eUptdmhBdVZ4emRTc3FGU29CRlN3L1Z6?=
 =?utf-8?B?VUNva0hoYmRwVmRjL1VzV1NHaXE5Z1R1a3FkQUl1cWlxVGNKZGl4M0xxbHZu?=
 =?utf-8?B?b2JkRkdSaWVybkVQL2JGSUsvZWxKRHRpZm41QllPWUdIUXhNRTM2NVZnemdH?=
 =?utf-8?B?Q2tpVkdLUFhXWUpDQjZkcXh0ZHQ5THBvMDFjRGtuTERLQXBQbVREbTRwTDhP?=
 =?utf-8?B?Q1JIMm04MytXSjFGK1B2MjA1a204TGdZYWRIU3lUcCtsSkRXT2ZCN3lLUlhm?=
 =?utf-8?B?SGhKUHo0eE1xL0RDQ0ZVQUZ2RlJhN0VadlJMVU9NamFmemNjcXhkQ2d6ckhB?=
 =?utf-8?B?K3BmYXBRaWd1dXIyOHNJdnBjMGQyamxnTXViMkl0ZmZsSXgxUlRFdlh2S0ZD?=
 =?utf-8?B?NzhGZzBrSmJ0eU5Jcng2NC9lTE9zQ2NnWmtPa1dPcVM3ZnlEbXl2Zmd6ZE9h?=
 =?utf-8?B?bWhSczZqbHFlMmZWK0Fsck9zWHUwMUpzU2p6V3J3UjRjcVEwQ1BIb0RFaGdw?=
 =?utf-8?B?TmNrSWI1WDdZOTNBcHo5RmJxczhjYUgyMVRTUnQ4T3Z5TFp2UXFFQT09?=
X-Exchange-RoutingPolicyChecked: Q+oFDmuA8vDhv/zYbH1pWPQoEO+82XUfQwB4r9z6Qe1WxihOxzaaG8FTNoxDE08PAvPjL7KQ469jssBQbuis2drp6/Ehet3juD8II8H70ujnGnW71qCAGLlFAPr+GSzl6/aGzsSsY6tqXQ78zhFlnO6nFFmpjD+iL6l0hjDyOi5EJDeGPOHM90qgU7SIzkO8nqjDf/SPBvmzMFzspl8Vq8j7yVDyrPHm1wmq4+ueixkBPCA0K/VVs9kLRFyhPDGQfyyWu8E7VaackuPL0gmjD5JS3Hv0/GJ6vTtkt02Xx8tx9BSyVsvSBuz/5SF6f9VW1BjQ1xDtpIvZNpWGR8OHAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4782c74-8b9b-4a33-12fa-08def9f157d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 10:46:49.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9fAe8MX//YbHaJqD4mPPE7X47byqwjjR6NJIz2pWlup9KK+Ivb8qiqw/SSG4k6UBkfuTMlsRQPYa1byGv6Genw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
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


On 13-08-2026 15:48, Michal Wajdeczko wrote:
>
> On 8/13/2026 12:07 PM, Mallesh, Koujalagi wrote:
>> On 13-08-2026 02:58 pm, Michal Wajdeczko wrote:
>>> On 8/13/2026 10:38 AM, Mallesh, Koujalagi wrote:
>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>> Report 'boot status' details using xe_log_err_fatal/info() macros.
>>>>> While around, move static helper code closer to the caller and let
>>>>> it take xe instead of pdev.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 35 ++++++++++++----------
>>>>>    1 file changed, 19 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> index 4c506027fa94..85b4c125a217 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> @@ -14,6 +14,7 @@
>>>>>    #include "xe_device.h"
>>>>>    #include "xe_heci_gsc.h"
>>>>>    #include "xe_i2c.h"
>>>>> +#include "xe_log.h"
>>>>>    #include "xe_mmio.h"
>>>>>    #include "xe_nvm.h"
>>>>>    #include "xe_pcode_api.h"
>>>>> @@ -172,21 +173,6 @@ static void populate_survivability_info(struct xe_device *xe)
>>>>>        }
>>>>>    }
>>>>>    -static void log_survivability_info(struct pci_dev *pdev)
>>>>> -{
>>>>> -    struct xe_device *xe = pdev_to_xe_device(pdev);
>>>>> -    struct xe_survivability *survivability = &xe->survivability;
>>>>> -    u32 *info = survivability->info;
>>>>> -    int id;
>>>>> -
>>>>> -    dev_info(&pdev->dev, "Survivability Boot Status : Critical Failure (%d)\n",
>>>>> -         survivability->boot_status);
>>>>> -    for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>>> -        if (info[id])
>>>>> -            dev_info(&pdev->dev, "%s: 0x%x\n", reg_map[id], info[id]);
>>>>> -    }
>>>>> -}
>>>>> -
>>>>>    static int check_boot_failure(struct xe_device *xe)
>>>>>    {
>>>>>        struct xe_survivability *survivability = &xe->survivability;
>>>>> @@ -429,6 +415,23 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>        dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>>>    }
>>>>>    +static void log_survivability_info(struct xe_device *xe)
>>>>> +{
>>>>> +    struct xe_survivability *survivability = &xe->survivability;
>>>>> +    u32 *info = survivability->info;
>>>>> +    int id;
>>>>> +
>>>>> +    xe_log_err_fatal(xe, SURVIVABILITY, -ENXIO, "Boot Status: %s (%u)\n",
>>>>> +             survivability->boot_status == CRITICAL_FAILURE ?
>>>>> +             "Critical Failure" : "Other", survivability->boot_status);
>>>> Since log_survivability_info is called when survivability->boot_status == CRITICAL_FAILURE true, so please use "Critical Failure"  string directly.
>>> well, that's the current usage and function name didn't strictly say "log critical failure" only
>>>
>>> btw, printing fixed "Critical Failure" string followed by flexible %d also doesn't make sense IMO
>>>
>>> that's why I decided to make this function more flexible and reusable if needed
>> Totally agreed, u made it generic one, however current usage, we never going to hit "Other" case, which is dead here.
>>
>> btw, "Other" is "Non Critical Failure" right?
> only if boot_status == 7
>
> but since BOOT_STATUS is REG_GENMASK(3, 1) I assume that there
> might be other values, beyond currently documented 4 & 7


Yeah there are other values apart from 4 and 7. When this patch was 
initially added,
it was suggested not to log the duplicate information as part of dmesg 
as it is already part of sysfs.
That is the reason we print this only in version 1 of survivability for 
critical errors.

In v1, we do not enter survivability mode for critical errors and only 
log additional information
in dmesg to aid with debug.

So generic is not necessary based on previous review decisions. But will 
leave it upto you.

Thanks
Riana


>
> so even if we print "Other" there will be still numerical
> value "(7)" or "(1)" that could be used for debug/triage
>
> but I can add helper
>
> 	static const char *boot_status_str(u8 boot_status)
>
> to return friendly name for all currently known codes
> (and "Other" or NULL for unknown codes)
>>
>> Thanks,
>>
>> -/Mallesh
>>
>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>
>>>>> +
>>>>> +    for (id = 0; id < MAX_SCRATCH_REG; id++) {
>>>>> +        if (!info[id])
>>>>> +            continue;
>>>>> +        xe_log_info(xe, SURVIVABILITY, "%s: %#x\n", reg_map[id], info[id]);
>>>>> +    }
>>>>> +}
>>>>> +
>>>>>    /**
>>>>>     * xe_survivability_mode_boot_enable - Initialize and enable boot survivability mode
>>>>>     * @xe: xe device instance
>>>>> @@ -452,7 +455,7 @@ int xe_survivability_mode_boot_enable(struct xe_device *xe)
>>>>>         * v2 supports survivability mode for critical errors
>>>>>         */
>>>>>        if (survivability->version < 2  && survivability->boot_status == CRITICAL_FAILURE) {
>>>>> -        log_survivability_info(pdev);
>>>>> +        log_survivability_info(xe);
>>>>>            return -ENXIO;
>>>>>        }
>>>>>    
