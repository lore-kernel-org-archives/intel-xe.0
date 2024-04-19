Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CE1C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 23:51:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59D10EAD3;
	Fri, 19 Apr 2024 23:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TY2zEEIa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F400E10EAD3
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 23:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713570712; x=1745106712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=N67CUQJpzR1c8SEqpohE82uFlToLRX0/mge+5fCdkGo=;
 b=TY2zEEIas+yuZ6WhgUuBMe6oAfNQDR8+z6/7XkSHYy+fN3uS6qNpQ8iC
 28qr8cwtknjfVS6hLfvIrk6kDkZUaDaGxX0+Xw8RQ6f9fJdd2v1gTvwWu
 pLV14RBo1WbZoZE346mAr1/wzRL6WA7D3jC6cQBCoV5LboCt0ZpO+1veB
 uCNLI77rllrhKxE+0sGPtP2axxNaJTLxordXjndIcySiOp4RGCwdroAu4
 +jTpt4Oligv5ixb547eezoaZJlZRyF3cXQ4oXyMKklUmY4N8g2Q7DRWY0
 Se0jK7fTtKj/y/rUjCXjNa1ZWc0G93qMu0dC33ET27KX48ql/eXrlLdd8 A==;
X-CSE-ConnectionGUID: F9mB0ujmTk2oOZ2L9xB/Wg==
X-CSE-MsgGUID: 2zIqGQW6QSiyH7MDCxjsPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9415229"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9415229"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 16:51:51 -0700
X-CSE-ConnectionGUID: yfX7Ro93RUOLGHYTVOtToQ==
X-CSE-MsgGUID: dC4FMa4kTTyhHCfNVLualQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; d="scan'208";a="28262815"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 16:51:51 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 16:51:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 16:51:50 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 16:51:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1DfgeqN7e9xIsV0EtafVyJmStvtZ00ylmh+b9KxMTuMb8r8a6V5vMm9jHkH/zCOuAVUgaq/slmbcJOfGxURFHH09GOKskq7fcgfM3Gy8tEeYx6M/2arIB/DZlhMBEq8npq3pFF04b96R2P7wBQyfSei7WpIFRvzMTvKQn3Pn0W8MbDVQUWdG305R6Tm9V3NiC1r7AmY1w3+SBkMKiHZd9HdBH5SkO0asiwCEDX7bTpP0Gkndo0ZX4pZNzRXECIgG2VxA/Nx3jGQF9MCQyO7whlpdZzkHmkudWmq2JaCEVvKgc1J+uq4FSH/Bxo7u69Fy8K/Uyuw80nOHVcRPCs/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGz2Jn1I6s5laCRo2BfVpWiVCihLELHBdtjL/i/9yIM=;
 b=hK/QXkMIq/YwwrbthWl4g6+U6WtJEw4qQueQhy9kJBUI4BAXAGiKHuXidwPn5yO4pvPF+jLq78vQhI0AZFngqPbLBLc3QiZ160bgZfdrCLcee7bKVyXSmTnhxW68qOpeABmrU1ykvlcvOoCcSEDKeZYhkfPUhOSFD9E6qBVpVvLwwjHXFGL8VvQ9nx4Iw9XQQaNd2EWja2vqfrGxjEiBHnaADqLhTv8ZvPWoqP7hEViDHZIGHxI5B4AkkO9fylTLtJMX2EPse/7T5LCj1n9ZpI46LogBvl4njiGRfkWqzxRqA9LuiDFwFy6BsHHpZaPBFR/3tMA2EsEFKg03LgFbWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB8295.namprd11.prod.outlook.com (2603:10b6:a03:479::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.16; Fri, 19 Apr
 2024 23:51:42 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Fri, 19 Apr 2024
 23:51:42 +0000
Date: Fri, 19 Apr 2024 16:51:35 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 0/7] drm/xe: Per client usage
Message-ID: <ZiMDh2ddSsx+t+Qv@orsosgc001>
References: <f2c46934-e137-419d-ba34-cff864a988ce@ursulin.net>
 <zj3ccdsxwfv7yms67c2fycjfhevdzp3qy7yz6u6ffmv4aymo6n@5lu4otfylkbt>
 <foccqtfvgz65tg6yoar5tsqjo4bndmftgwlsm3vujjjdin2wts@7cc3m4fcapyb>
 <6490842a-65b3-4b84-9a8a-ebc9f7b9ac07@ursulin.net>
 <thplv5pk26br3tou6if2otdoq6owb5lmdhfzi3wcboni4vyeos@sqiu7zpgmgrf>
 <8e2af1d5-5d22-47d5-8cee-f8bd1e54c0ed@ursulin.net>
 <fzl42hvf67tb7373gcpovcjjcufs3ba6jajmpt676uymsat4qs@qolxcmhfh6mz>
 <ZiAyUcuQtQ25xnWw@orsosgc001>
 <6ib4borj4paiuj5l6digeoc7mgnabtji6vtvdtvcafi64y3j3n@vqid357khkai>
 <c47f5e70-e09f-41e1-bc0a-b547475e17a1@ursulin.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c47f5e70-e09f-41e1-bc0a-b547475e17a1@ursulin.net>
X-ClientProxiedBy: SJ0PR05CA0195.namprd05.prod.outlook.com
 (2603:10b6:a03:330::20) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB8295:EE_
X-MS-Office365-Filtering-Correlation-Id: a92c7764-9367-4765-0f33-08dc60cba9d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: 0+JCdTOf+46OPJXDI3NN1M+oGRrDe0J4u7etVHwn4nyuMOBl4dElTnFQVaER37YLNkBUG+CR0HugVxRPJyIvTz8osHPlxD/IssEPRCcLoV4vXY9S4VnhqA+7G/CM5QvwPZoLlftVCiJySb6pqRK/t0uCJQ+to5tHr3J4KycU482sWRKq1B8jAoiqw+jvAM1qHBA5ZzYhFofEqaZm+hb1mg0xJzrbd/Wn2T6KyYK6ueTt4T0Nx64Ul2Hw7hBh1guVbzxjvXBqUQy/HuDekcLsZwipqZrrEE3MdzzjVknlo2TZGmVlsBn6AGkcvpItrdqbZut/F22PT510qirqcT3wQrEC3yYOSZms8WQkDRj24WnKWwIZbw7WFLsVRUJGi/On4mtSe5PzJ97wGtDArp0kJVvAZzZHjnaeeqjiSuGL6elK7pPzNLsQHtGpBVJdHosumhpzd0LGyjDpgZ6POf65I2ia4wI99c+9F4QHgT7/0DCsx3BOey/BCjk6o9w+XYLJjF4FGR0IsjuQqbKLtaTclLKfDHI2+a/9hKtmd+DUVvTa1opiU+LAG+XL4Efb3PlZ6Yf09mI8iIGA3ZjVHGSxMBBRwaG8g7cfga8WWXtWSdR5lsFGQtu6madKxr3IagnEZKZ3GPRcEX3JaPHoSWEYMhifMV/scBz6bzA8h3ag/lA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdJVmdnSVpaRlkyZlMybmVaL0hzQ0luNVpRa1BpRGRMSzlZUGkwV1dTN3Nz?=
 =?utf-8?B?K2d1T1p4R1ZYc0lydXdFQlZyMitxUTUrK0E4ZzdTejB6SnJSWWpGRFhSWVhi?=
 =?utf-8?B?U3pSWk13S0gwY3JQZUErTHl6d2hvRmlpYlhMNkV5N0pnNkdYbVh4YTArM1ZI?=
 =?utf-8?B?R2VZMVFxdm0xbEVMdjZFYlN0RWQ2Q2tKUkkyelNqUkswRmZrVHEzT1VTR2Ft?=
 =?utf-8?B?V3VUWEpWcmdqdE5PU0RjRjBRcGF3SC84QldyMXJCOWFJdlRWb2E4WnQyeTZM?=
 =?utf-8?B?YWR5cnMzV0gvaWEraDExbGtHY1p6OUU2UzNQQ1lpTUtEL1JVQVRtVW9jY0ZS?=
 =?utf-8?B?aGM1U2VzWTZFeXpYVUtTenJNb3ozd2FEUmdUcWlmeDFkNmdvSWthaERmdUYv?=
 =?utf-8?B?T3NaR1d1RUliY2ZpK0grRytCWUIzbGx1WmFQVWZEdmwyMGx0elFUT1ZJQUpS?=
 =?utf-8?B?dmVUVXM0VTA0OFVVVWVGZnFCbXh5bENnbTc0WjBTZ2RwdUJGRHN4dno0YXhF?=
 =?utf-8?B?WHV3dzB4L0x0d2NOOHMyNXZmNm50KzBxSjRIMHl5TXppSjdjRWNnb3IwZVlR?=
 =?utf-8?B?KzNnZUo2TEhhQkpIczMxK2gycVZjTDExU3VBV2hLVmg2b0FQbTg1c2lORjlE?=
 =?utf-8?B?eWlpU2NBbDg1NHpUT0NBeCtCMTBSSzJ4eEh2UGpuMElXKzcyTnF2YnJxcElu?=
 =?utf-8?B?NGdrSUdqR05EZUhpV3ZnSU9zRFp0cS9MZFZ3S2M5L2lybkNuNTlLSzNWOFhB?=
 =?utf-8?B?b3ZUTW9VR2NLM04zVlZWcXEvQUt5ODEvUnpKOW5QenBYa29XL0RyWDdSNlVF?=
 =?utf-8?B?dkg1bER6dHJkTGFYWDZ2RmZGWGs1YjRoYmFFdi96NTd1NDlIdTZ5UlB0LzhS?=
 =?utf-8?B?OE5WQ2cyVXhqY3kwMk9UaUlkYjhONTNtSnRBbmZiN09zSEh2SDV1VTVXcEtU?=
 =?utf-8?B?K1JITzRsbGVQZXlnakIyNjBVWWNMZ3dncWduaUN6Q0s5K0cydEZFeG1TWXhN?=
 =?utf-8?B?VUllVGwzMkZLZ0h5bURldk41dlVKeW84eXRFM1ZMOHVqUUE0OUVhMkxaVEZ5?=
 =?utf-8?B?RS9LUU1ISFVNOE1rWWR0Q1kreXI0RWpmT1QyaHlhUyttVk9oT0VWMU1GZEJo?=
 =?utf-8?B?Y2ZpZTRBNWV3MjVUOUJET1BrZ1lvYWRFZ2YrWlkxd1VhVjh1WGhhZUJYY2Q5?=
 =?utf-8?B?cDEvQXk0Ni8wYU13QXMzdFlSQkJ3Y3FadWkvQjZxVGhHUWt6VnhJL296dUtQ?=
 =?utf-8?B?bnhRVHluL25VNnlBV0pGYlczcGhtQmxEdTlsblBSMDZXeWx6ZloxNVNSendi?=
 =?utf-8?B?enRwVWVVVTlUUyt0Szg2dEl3SU94VHZsWUZ1VXYxdGViZFJIc1BXZU5UUEVi?=
 =?utf-8?B?MnFnNjkxRDE4QVpMTjFVc21oSFJLOXhZRHNxcXFPYisybDMzMnRUaWZha251?=
 =?utf-8?B?eTJVUVJTbTNuWmhScDhEYTg3S0FGTEZtS1lkSXZJYnZiandNRFFmdmpFa0lQ?=
 =?utf-8?B?SjZqSU1FOUx0dENJVXMzOC9EVDJYKzVheTVMbFh6eHpzYktZOWJsaGlUM2Zn?=
 =?utf-8?B?TGxKTndLdHBvRFRqeFdtTVI0b1o0UWtEUHRtRU9jVmJ1QzV6Vkh2alZiRWxU?=
 =?utf-8?B?Lzd0Zmp4R0ErYkJ0Yi9HaVo1clBIa205dldJWGVlTmZwYWc3aGNSOVdsYlVF?=
 =?utf-8?B?UTZPcUk1b2pYU3hocEhRYTM3elZjTG01dU83Q0dqQmUrQkRXY0lnZGF4bmVY?=
 =?utf-8?B?NUVtNEdWVERTVXJNbGd5YXU0NnlOaGw5eVUrbll1RHBpaXc5b3VFbDU1MWZS?=
 =?utf-8?B?RWlHQ3BEdzZQY2syNk90ZEFJckVxTS9WSWNhL2JZVFlIa3dZaTVEQWxSY1M4?=
 =?utf-8?B?SWV1M0x5TVRIUDhKa2VtclM2dTdxVDNRZzFtQkRTL3piL1FweXJlMFhkdTNS?=
 =?utf-8?B?akRqOWFpVVcwbGVFUDJxL0s3N3NNbnFDdlNESUtjd3hLeFlraFQ5WGtXdEVG?=
 =?utf-8?B?bm1WcmFRMDcrWnI0VFJyUkNwbG01aG9tVmYrU1QxUEx0cmtpSG9DTWg0SUgz?=
 =?utf-8?B?QnJ3blczcnd6VHk3ZUtvS3U4NU1yUGFDNHQzWDl4dFlQTTJsOFcrV0NiWW1w?=
 =?utf-8?B?QWhsMzNoTFZHNXpCdmpHSUZOL3NMbll4UHZFZXArQzhSbktGUm5NQytVTHZQ?=
 =?utf-8?Q?VfF3PlTt1K1VIzRTiNXkpRU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a92c7764-9367-4765-0f33-08dc60cba9d5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 23:51:42.5582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9D/XqVylau3W7n31IyFCar6ZwgFGXwmKxw4s8W179R2phVLzUb5a6RjwCaU4WqU8A9n7Wy5ofaz9a/Y9zifuYnY9Sd2kqk02AGKEdqRjDRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8295
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

On Fri, Apr 19, 2024 at 11:44:46AM +0100, Tvrtko Ursulin wrote:
>
>On 18/04/2024 00:19, Lucas De Marchi wrote:
>>On Wed, Apr 17, 2024 at 01:35:29PM GMT, Umesh Nerlige Ramappa wrote:
>>>On Wed, Apr 17, 2024 at 02:05:40PM -0500, Lucas De Marchi wrote:
>>>>On Wed, Apr 17, 2024 at 09:51:42AM GMT, Tvrtko Ursulin wrote:
>>>>>
>>>>>On 16/04/2024 19:29, Lucas De Marchi wrote:
>>>>>>On Tue, Apr 16, 2024 at 03:22:21PM +0100, Tvrtko Ursulin wrote:
>>>>>>>
>>>>>>>On 16/04/2024 14:51, Lucas De Marchi wrote:
>>>>>>>>Forgot to Cc Michal, doing now.
>>>>>>>>
>>>>>>>>Lucas De Marchi
>>>>>>>>
>>>>>>>>On Tue, Apr 16, 2024 at 08:30:33AM -0500, Lucas De Marchi wrote:
>>>>>>>>>On Tue, Apr 16, 2024 at 09:37:44AM +0100, Tvrtko Ursulin wrote:
>>>>>>>>>>
>>>>>>>>>>On 16/04/2024 04:04, Lucas De Marchi wrote:
>>>>>>>>>>>Add per-client usage statistics to xe. This ports 
>>>>>>>>>>>xe to use the common
>>>>>>>>>>>method in drm to export the usage to userspace per 
>>>>>>>>>>>client (where 1
>>>>>>>>>>>client == 1 drm fd open).
>>>>>>>>>>>
>>>>>>>>>>>However insted of using the current format, this 
>>>>>>>>>>>creates a new one with
>>>>>>>>>>>the unit "ticks". The intention here is not to mix 
>>>>>>>>>>>the GPU clock domain
>>>>>>>>>>>with the CPU clock. It allows to cover a few more 
>>>>>>>>>>>use cases without
>>>>>>>>>>>extra complications.
>>>>>>>>>>>
>>>>>>>>>>>Last patch was a quick implemenation of a 
>>>>>>>>>>>gputop-like tool in python.
>>>>>>>>>>>I ended doing it to cross check the gputop 
>>>>>>>>>>>implementation. I's not
>>>>>>>>>>>really meant to be applied here.
>>>>>>>>>>>
>>>>>>>>>>>I tested this on DG2 and TGL with kmscube 
>>>>>>>>>>>(console-only) and vkcube
>>>>>>>>>>>(in a gnome session), but it would be good to soak 
>>>>>>>>>>>this under more
>>>>>>>>>>>tests. The biggest goal for this patch series right now is to get
>>>>>>>>>>>consensus on the new UAPI.
>>>>>>>>>>>
>>>>>>>>>>>TODO: Add documentation on top with the new interface.
>>>>>>>>>>
>>>>>>>>>>Yeah a drm-usage-stats.rst patch would be nice to 
>>>>>>>>>>have in the RFC so one does not have to look into 
>>>>>>>>>>the driver implementation to discuss the proposed 
>>>>>>>>>>uapi.
>>>>>>>>>>
>>>>>>>>>>Nevertheless I understand the proposal is to add this:
>>>>>>>>>>
>>>>>>>>>>drm-engine-<class>: <GPU_TIMESTAMP> <RUNTIME> ticks
>>>>>>>>>
>>>>>>>>>yes, the gputop patch was more explicit about this. 
>>>>>>>>>Should had added in
>>>>>>>>>the kernel patch series too.
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>That's two values per key. I guess "one key value 
>>>>>>>>>>pair for per one line of text" does not get strictly 
>>>>>>>>>>broken and that you propose a heuristics in parsing 
>>>>>>>>>>to detect that the <RUNTIME> cannot be 
>>>>>>>>>>mis-interpreted as the unit?
>>>>>>>>>
>>>>>>>>>the current format is
>>>>>>>>>
>>>>>>>>>    drm-engine-<class>: <RUNTIME> ns
>>>>>>>>>
>>>>>>>>>the "ns" in the end should be parsed by userspace to know
>>>>>>>>>what it is about.
>>>>>>>
>>>>>>>Right.
>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>Not sure it is a good idea though. If you instead 
>>>>>>>>>>added a new key for the gpu time what would be the 
>>>>>>>>>>downside in your view? Like:
>>>>>>>>>>
>>>>>>>>>>drm-engine-<class>: <uint> ticks
>>>>>>>>>>drm-ticks-<class>: <uint>
>>>>>>>>>>
>>>>>>>>>>Or maybe even obsfuscate/generalise as:
>>>>>>>>>>
>>>>>>>>>>drm-engine-<class>: <uint> gpu-time
>>>>>>>>>>drm-gpu-time-<class>: <uint>
>>>>>>>>>
>>>>>>>>>I think both work, but I fail to see the advantage. 
>>>>>>>>>This alternative is
>>>>>>>>>slightly heavier on the parsing side since you have to 
>>>>>>>>>correlate the
>>>>>>>>>values from 2 keys, possibly dealing with them 
>>>>>>>>>appearing in different
>>>>>>>>>order. The only possible breakage remains with this alternative: if
>>>>>>>>>userspace didn't parse the unit before. I checked 
>>>>>>>>>nvtop and htop and
>>>>>>>>>they were doing the right thing. I sent a fix to igt a 
>>>>>>>>>few weeks back
>>>>>>>>>for it to consider the unit:
>>>>>>>>>https://lore.kernel.org/igt-dev/20240405060056.59379-8-lucas.demarchi@intel.com/
>>>>>>>
>>>>>>>Advantages are that "drm-engine-something: 1234 5678 
>>>>>>>ticks" isn't self-explanatory (intuitively humanly 
>>>>>>>readable) and that it doesn't
>>>>>>
>>>>>>maybe I have a different expectation from procfs. When I do e.g.
>>>>>>
>>>>>># cat /proc/self/stat
>>>>>>3861283 (cat) R 3861233 3861283 3861231 34816 3861283 
>>>>>>4194304 90 0 0 0 0 0 0 0 20 0 1 0 1321348797 8560640 384 
>>>>>>18446744073709551615 93979016876032 93979016892449 
>>>>>>140720658378704 0 0 0 0 0 0 0 0 0 17 51 0 0 0 0 0 
>>>>>>93979016907440 93979016908904 93979037196288 140720658380605 
>>>>>>140720658380625 140720658380625 140720658382827 0
>>>>>>
>>>>>>it doesn't seem to me "intuitively humanly readable" was the first
>>>>>>concern for people adding files in procfs :)... I'd rather 
>>>>>>think "machine
>>>>>>readable" was more important.
>>>>>
>>>>>I think you are pushing the argument a bit now :) since IMO we 
>>>>>should evaluate drm-usage-stats.rst proposal more in the 
>>>>>context of drm-usage-stats and other fdinfo files, rather than 
>>>>>the whole of procfs. In other words if there isn't a strong 
>>>>>reason to regress this particular file lets not do it.
>>>>
>>>>:) I like pushing arguments if it helps revisit decisions (human vs
>>>>machine readable for things in procfs). I'm not
>>>>trying to push the 2 counter approaches though. I think other reasons
>>>>like discussed below are enough to consider the other keys.
>>>>
>>>>TBH I was reluctant at first to add a separate uapi rather than re-using
>>>>drm-engine- without realizing there was already a second one (not
>>>>implemented in gputop).
>>>>
>>>>So AFAICS i915 and amdgpu use drm-engine-. msm and panfrost use
>>>>drm-cycles + drm-maxfreq.  And none of them seem suitable to xe.
>>>>
>>>>>
>>>>>>>diverge from the one value per key plus unit format. 
>>>>>>>Latter we would then document clearly.
>>>>>>>
>>>>>>>Different keys potentially appearing in different order 
>>>>>>>does not matter since userspace already has to handle 
>>>>>>>that.
>>>>>>>
>>>>>>>>>>Potentially could also add a key saying how much 
>>>>>>>>>>wall time is one unit of GPU time.
>>>>>>>>>
>>>>>>>>>I wouldn't add it really as it may not make sense depending on the
>>>>>>>>>vendor and or usage. Examples: the gpu time may be different for
>>>>>>>>>different engines depending on where they are located 
>>>>>>>>>(tile/gt). The
>>>>>>>>>correlation with CPU time is different when running in 
>>>>>>>>>VF mode, and may
>>>>>>>>>change in runtime depending on the number of VFs. +Michal.
>>>>>>>
>>>>>>>Yes, that's why I said "potentially", which was supposed 
>>>>>>>to mean if and where it makes sense and perhaps adds 
>>>>>>>value.
>>>>>>>
>>>>>>>>>Also, if the userspace side really wants to know (why would it?)
>>>>>>>>>it could be just calculate from 2 samples (possibly repeated a few
>>>>>>>>>times as it updates the output).
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>Or.. would even the existing drm-cycles, plus abuse 
>>>>>>>>>>of drm-maxfreq, work? Ticks == cycles, maxfreq == 
>>>>>>>>>>ticks per wall second.
>>>>>>>>>
>>>>>>>>>I think it'd be up to gpu vendor what clock backs this 
>>>>>>>>>time. For the
>>>>>>>>>current Intel cards, it's the refclock and it doesn't vary the
>>>>>>>>>frequency.
>>>>>>>
>>>>>>>Right, but that doesn't matter. What I was saying is that 
>>>>>>>if you exposed ticks in drm-cycles and tick frequency in 
>>>>>>>drm-maxfreq it would even work, no? (Assuming support for 
>>>>>>>those two was actually in igt_drm_fdinfo/clients/gputop 
>>>>>>>and could be used as fallback to time based stats.)
>>>>>>
>>>>>>oh... I was looking at the output for i915 and missed that we had
>>>>>>drm-cycles as currently i915 doesn't use it. It seems to be a similar
>>>>>>thing. I agree the drm-maxfreq- is unfortunate and that we don't
>>>>>>actually have support for that in gputop.
>>>>>>
>>>>>>So, instead of the 2 numbers + different unit, I can adapt this to
>>>>>>rather use drm-cycles. However for maxfreq, it doesn't seem to be
>>>>>>what we need since it doesn't scale for VF. It brings back 
>>>>>>the cpu clock
>>>>>>domain this series is trying to avoid. The difference is that using
>>>>>>drm-cycles- and drm-maxfreq- you are expecting the userspace to do
>>>>>>(let me know if I interpreted the docs wrong):
>>>>>>
>>>>>>    s1 = sample()
>>>>>>    sleep(period)
>>>>>>    s2 = sample()
>>>>>>    engine_utilization = ((s2.drm_cycles * s2.drm_max_freq) 
>>>>>>- (s1.drm_cycles * s1.drm_max_freq)) / period
>>>>>>
>>>>>>... considering the drm_max_freq may change from one call to 
>>>>>>the other.
>>>>>>if we simplify it and assume it doesn't change:
>>>>>>
>>>>>>    engine_utilization = ((s2.drm_cycles - s1.drm_cycles) * 
>>>>>>drm_max_freq) / period
>>>>>>
>>>>>>we'd need different drm_max_freq reported on VF driver that would need
>>>>>>to know the number of VFs enabled to scaled it correctly. 
>>>>>>Maybe this is
>>>>>>abusing the "drm-maxfreq" a little bit?
>>>>>
>>>>>Yes it would be bad if the observed VF GPU clock will be 
>>>>>variable since maxfreq is supposed to be static.
>>>>>
>>>>>So on VFs would reported GPU clock moves by the VF "used" quanta?
>>>>
>>>>s/used/available/. That's my understanding, yes. Each VF has a quanta
>>>>and the gpu clock moves according to that quanta.  Note that as I said,
>>>>this is not the case right now (we are just reading RING_TIMESTAMP), but
>>>>the intention is to have the UAPI side ready so it's already prepared
>>>>for that.
>>>>
>>>>>Where "used" is defined as time given by the GuC, not necessarily used
>>>>
>>>>s/used/available/ as above
>>>>
>>>>>GPU time. For instance 16ms quanta, VF GPU clock would move by 
>>>>>16ms if the GuC decides not to switch out the idle VF? Or it 
>>>>>could move by less than 16ms if it switched it out earlier.
>>>>
>>>>no, afaiu it's 16ms, not less. But the quanta depends on the number of
>>>>VFs enabled, which may change in runtime.
>>>>
>>>>I'm not 100% certain and people in Cc may correct me.
>>>>
>>>>>
>>>>>>What if we had
>>>>>>
>>>>>>drm-cycles-<keystr>: <uint>
>>>>>>drm-total-cycles-<keystr>: <uint>
>>>>>>
>>>>>>Then the utilization can be done:
>>>>>>
>>>>>>    s1 = sample()
>>>>>>    sleep(period)
>>>>>>    s2 = sample()
>>>>>>    engine_utilization = (s2.cycles - s1.cycles) / \
>>>>>>                 (s2.total_cycles - s1.total_cycles + 1);
>>>>>>
>>>>>>Capacity still to be added above, but we'd need to clarify if
>>>>>>drm-total-cycles-<keystr> already accounts for it.
>>>>>>
>>>>>>Here instead of the conversion to cpu clock, I'm expecting to read
>>>>>>"total_cycles" from HW and that being different (slower) for VF.
>>>>>>AFAICS this is not the case with this current polling implementation
>>>>>>since we are simply reading the RING_TIMESTAMP, but there are planned
>>>>>>changes to get it from GuC. Umesh/Michal Cc'ed may know better.
>>>>>
>>>>>I think this works and is clean.
>>>>>
>>>>>Although I have some doubts about the usefulness on VFs, if 
>>>>>the clock movements are at the mercy of the GuC scheduler. 
>>>>>Like what does 100% mean for a VF? Maybe it was full quanta, 
>>>>>or maybe it was half a quanta if GuC decided to switch it out 
>>>>>early, either due going idle or due some other scheduling 
>>>>>decision.
>>>>
>>>>in the scenario you described above the quanta could change according to
>>>>the scheduler and 100% wouldn't mean much. That's not my understanding.
>>>>100% always mean the VF used all the allocated time. I see this line
>>>>potentially getting blurred a little bit if the scheduler tries to
>>>>maximize the HW usage and distribute quanta unevenly, but I think the
>>>>interface already contemplates that.
>>>>
>>>>Another case is the VF not being able to reach 100% because the PF is
>>>>submitting high prio work. But I still think the current interface is
>>>>sufficient and it's the implementation by GuC/HW that could be improved
>>>>(e.g. adapting the gpu time reported).
>>>>
>>>>Michal / Umesh, please chime in if that is not accurate.
>>>>
>>>
>>>Irrespective of how much quanta a VF used, all calculations will 
>>>be based on the quanta that it was allocated. That way the VF 
>>>would know that it could have better utilized the allotted time if 
>>>busyness is less than 100. This does result in more than 100% 
>>>usage for a VF that was resource hungry and scheduling policies 
>>>allowed it to run more than the allotted quanta, but this is a 
>>>known limitation of the solution provided by GuC. When looking at 
>>>the overall system (say from a PF), the usage should still add up 
>>>to 100%.
>>>
>>>>
>>>>Thinking out loud: IFF the execution quanta is available for VF to query
>>>
>>>For the VF, GuC intends to provide a factor that can be used to 
>>>scale the wall time and deduce the VF quanta. This scaled value is 
>>>used as the second counter in a VF.
>>>>and we are ok with just scaling drm-maxfreq, then maybe we could even
>>>>just use the current interface instead of adding a third one. Although
>>>>it could be confusing to have a that freq changing.
>>>
>>>Assuming you are talking about using the drm-cycles and 
>>>drm-max-freq. One of the concerns when supporting VFs was that we 
>>>cannot actually export busyness in absolute time units to the user 
>>>because the GPU is shared across VFs. If we scale the busyness 
>>>such that it is stretched across CPU time, then it helps get the 
>>>right busyness % relative to CPU time, but the value of busyness 
>>>in time units itself is false. This was the primary reason to use 
>>>2 "unitless" counters.
>>>
>>>fwiu, I think by using the drm-maxfreq, you are going to bring the 
>>>same concept back in the discussion - exporting busyness in time 
>>>units. Not sure if that's a good idea. Let me know if I got that 
>>>wrong.
>>
>>no, but I think it would still work if we can scale the freq according to
>>the quanta.  But that's probably abusing the interface.
>>
>>Anyway I think we are settling on
>>
>>     drm-cycles-<engineclass>
>>     drm-total-cycles-<engineclass>
>>
>>so I will start changing the patches and igt while checking this for
>>more feedback if any.
>Another option came to mind - expose a quanta ratio as a new key. 
>Given it has no security implications and is to be used only for 
>calculating real VFs GPU utilisation. Like:
>
>drm-engine-*: <uint> ns
>drm-engine-time-ratio-*: <float>
>
>Unit would be a ratio of time over quanta, for instance 1000ms / 100ms 
>= 10. Which would mean scale down reported time by 10 when comparing 
>against wall time.
>
>New key would only appear on VFs. Otherwise assumed 1.
>
>Or could be avoided per engine and just have single global:
>
>drm-gpu-time-ratio: <float>
>
>Am I missing something or that could work? It would have the same 
>problem as above mentioned "could go over 100%" is one. I mean this 
>comment:

I am hesitant to expose the quanta ratio at this level. We get that from 
GuC and that interface could potentially change. If that happens, I'd 
prefer that the uApi is unaffected.

>
>"""
>Irrespective of how much quanta a VF used, all calculations will be
>based on the quanta that it was allocated.
>...
>This does result in more than 100% usage for a VF that
>was resource hungry and scheduling policies allowed it to run more
>than the allotted quanta,
>"""
>
>I read that as total-ticks would never be reported as above the 
>configure quanta - always equal.

Correct

>Maybe I misunderstood?
>
>Second topic - are there any plans to allow the PF to monitor VF GPU 
>utilisation? That wouldn't work via fdinfo aggregation since VF 
>clients will not be visibible in a PF. But it sounds like a basic and 
>important use case.

wip. Engine utilization will be available per-VF from PF.

Regards,
Umesh
>
>Regards,
>
>Tvrtko
