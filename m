Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1036F46124
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 14:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC8410E029;
	Mon, 23 Mar 2026 14:02:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Py869iL0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB15D10E029
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774274569; x=1805810569;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u6TSbdTCqN//J1j+qFpmNHpW0Fhd/stFsSDcG2yMDsk=;
 b=Py869iL0XwDhwVT5xlA+ho1OqwzsFBnNGBWQXRl1UfI2O5NOxttVmZAS
 wfxjopkP2j+auh2Ex4tl+qgJ5dP4FS9F64NJ4UX9OSPQ4LMWzzmCRRDP5
 qJH3HkCqcLdv79yDyv76CKfyABMlryGg2xtI7GdWHuNW/l0WHDVnpafk6
 NslvjtU7kFXf49XvgPseQTGP770f7CzI8N/PxSG6gJlPy0Z58vKsWWrO3
 ox1sn+yMsb1lGmT9SzeoxTLXENdIo4oqh68qTGm/K4wQVyKspxXWuUbaF
 1B6tanVylm0BbNpdpQQt/KIQIq2WM6CGWK7RM7wzVbExqGd/UHR6Ien5i w==;
X-CSE-ConnectionGUID: /B+V+7UgRBCk+PmZLnpDUg==
X-CSE-MsgGUID: dfojMU/HQMi1zqDGCNERgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="79177699"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="79177699"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:02:49 -0700
X-CSE-ConnectionGUID: lnKIxd5PRaGSX0E1jC7EAw==
X-CSE-MsgGUID: 8/vkVLeuTj+2FzbSjWI1AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="225741172"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:02:49 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:02:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 07:02:49 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 07:02:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2vgg8yOjvBwl29THdpIG1XJG8ySCdvTYnSZe7cX4znK3rElpnv+gQOxEtycdVG8p0n/J9BR78VGIqgwLpx3Ar44RQJQKE8X3Xphl8xrM7Q+qjsigXS3UFvo+OetvsWjGh5pLVq2retAogYKqhFskGiuctzeRXxgKNh0DrfSXA86F8Ti7tAWsHNtJug6vw8Ed1cCvPyhtXrrhCz6FwYZMTA0rxVm/DzCEmeMaERFNvmzXnDZ5FsmjU7+y7IDGoCYpZwGgR4OT3HWxqYleXIEdCqiJ13T1e78PUuHWIz0lbu+7PppDNY+wcb7FOg5NBrzALT06OftnSwrGT8LuLhNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5Bul7RFREi3AO7AtYKKWaUY5Ts1Oo/w5jwXL2kRejw=;
 b=n9PgwtOzBbQxv+rzjX80O9gPUqfjm934a6AGpj1nX8tfDWZk05ZRTCaAaK/SmybirIruwawDugkYCxVKU2JeLk70zgc0Bea5SRINfu2oMg7vl/gxvQwoAPGvnt8SlrMlMZ//IvLkIEIgJSJQCe8i27xAsolbJkGqLhpYsaiDBVVJWI8SZuYdk3ubxlH5Nij/8uA0in9AnEoLFyXRebtLgiUTkUHMovitrRyBk3iGTM+jjPtbTiS1Wcx2KUHibBqGje79Z6SseiZOpT17Z2DqA/zNTxxLNblGZcHrwbPNBsEd0RMRHONlyYzpP1YbTyT6Ha6naDIMBpXW1ZVynpYXjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA1PR11MB9633.namprd11.prod.outlook.com (2603:10b6:806:4dc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:02:47 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 14:02:46 +0000
Message-ID: <d32d1ccb-8332-4680-91bd-f7216cb30b59@intel.com>
Date: Mon, 23 Mar 2026 15:02:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe: Fix confusion with locals on context creation
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
References: <20260320145733.1337682-1-tomasz.lis@intel.com>
 <acC9xK1n_2Pgl_Wh@black.igk.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <acC9xK1n_2Pgl_Wh@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0030.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::43) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA1PR11MB9633:EE_
X-MS-Office365-Filtering-Correlation-Id: fcb77926-7af0-4074-6c2e-08de88e4dc45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: PiyBONk2lNk3Czkp6uYkMHV3/wqQ0e3rJCNRQTmS/OQjk4r/pJ2bDsyUuqcDQ6rqS+iuTLW8MQ6OojgfCCXgr/LkVR4XjqhloqUJ8FQFFGXYqf1Ss84ifE0MxUHx+UB3NbqOOAFgQZpK/xpbaVdhOK4cuhFMp0DK8gV/UdaLs2JINPzO7zGM0i02o/jAZP0XW9ONkEXLRbRX1yNKcRw89h7wvwmyY5zpwboMiYqAc9cIayRX3AIr2MASvg+uO9OdzspGnDDoFShvQKqnaOltNkWl8FEJa5EkyCdFrCgFhE3uJM6kiRKX4CLwqm88YHuIXGQmbtZjDBOGywn5kpm2bualoaofzy9TVV1QORzfucYbZkQQbxFq6AZhGkh4KYDEGTMEXJfsMbN2dHYqMEgHVi1FlPcRNZw7wiDlwPEWZb4r6go4ZhGdbYQ7cSuHaePqHq1bnG/D+B6vMHobq+RzD/aIofrH+zLEYiCqq/o9uVfpHv2NGg+PzwDHAnWFl+1yV2XXVxdvwkmLRA2tCgjPnOpG3IFM1N+pKH6CccDqBQr5lsW7tP9wEZvAhVysJWbYvG9BzwytzxC4HDzo3ai/tllqGEI+uXH55chi5siOZ2cNnSx9vbIlaiKvo5WR/+QElrdjHPdVhqSyU1R7aKy8QMDhRkHzNjg26goaOsTOIdMw+/UQ07Q7d1pykV3WwGBnWxoXqr8XWe33rRjLpW0vabVFuI4xU13lORXRGgQZCWQcqQas3dYUSoAEhM77UxF9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cERKaTFtbUFvZ1ZBV0JmT2pjcU8rKzJhbWNTcXBwTEpONXlhSU4zZW15dFQ0?=
 =?utf-8?B?Zk5YQTJ5TTVrbUFGSEJRNnBOQXAxampVZ3BkekpzOUZsc2Q3WXNISHVUZlc3?=
 =?utf-8?B?V2drTUw2WkpVb0dKa2E4QlAwVmFJKzE4ajJhV0lYZHM5MnNvUEJMdUtpd3Yx?=
 =?utf-8?B?T2dzcnYwYzhSTDRrTDFZRTlldDloQ0FpUExvbnQxS3VxdHhNdC9CQmlWemQx?=
 =?utf-8?B?VXQ0dzBWeVRER25XeS8wcDgwNitJajR6Y3ZocTk4eVFBcXZUMHN0YnZkMUJu?=
 =?utf-8?B?SnpoMnNyUVIvUndBOXd0SkxKUzl1MjU3WHM5Wko4RExIT2xtVzRoeFNoVVRI?=
 =?utf-8?B?c01ZYUtzNVBNS01iSmVXd2xJdHlPM3FzZmhyd3MxRzV3N2tEQStYNzNTdnIx?=
 =?utf-8?B?ODdYbk5JZ0VHV1ZMdy9qMy9WczF5ZU9JaldmNFhHVVBXekVyMGRROTFvUmpM?=
 =?utf-8?B?T1ZZMGZHWk5TTElEQUVIVmxLS1lGaklWQWFjNjJiYy9sYTBJQ2tKQWRRTnJn?=
 =?utf-8?B?N3pVVFpkYlpGQ2JGVnV5a2o3RUpGVVF4V0gwcnBGbHZ2SFZhNlNxTCtIQm54?=
 =?utf-8?B?cHNhUVAwWERFblR1QTNRRCsxVkdXdzZLMmk3U1RhZ1R0WTdyTWptMHp1RHlo?=
 =?utf-8?B?WENFRG5icEhQQm1Rd3MyYWMwK2FKRnB6a3U1bytoZVZLamRPL2Vsb1NRT3pN?=
 =?utf-8?B?VjdhU202VXNHTjcwZEdwRFd1MHZCdy93dDFDOW5zTjhkdHBpdnkyM3I4UjhG?=
 =?utf-8?B?VWJDYm5HdzVMSHVQazN1RHdZOVhBd1dOcmM0TEVSZnltUTB2RzN4a0NTMnhE?=
 =?utf-8?B?ZXNGSlNZSTJmZEd5cGZUelF5dm1hUzBsbEQ4WkgwVUcrMHBYczJ6NXB2cXpj?=
 =?utf-8?B?V2lXSHNoNEpDbGlDMTJTUEs0Z3ptQ1FSWHBYY08xc0VpRjVjcUJITHNobFNi?=
 =?utf-8?B?Zmd1N3Q5RGIxRzdCUEN6T1NxRkErOXhDZmVyR0VWeHBUaCtGbGZNbE1jSUs0?=
 =?utf-8?B?WXpUQTd5d0gzREE5TFdMbGtuR3pZQlArNW9JOHR3eUVMeUp4WVluVjFCZVZv?=
 =?utf-8?B?MndaeFRTZWthNytrV1JRMnlYRXo1ZzVCOUF6WkI0aVFhRzhaRCtFaHI5U2o5?=
 =?utf-8?B?RFF1NDU3ZDJxeHAwYjFDN1ZUdXo4ek5xc3ZEUlhIQi9TaEdLSG9ObGF6YVpm?=
 =?utf-8?B?UUlnMzhwZUJkcjdXc3BheHBzbDlJTS83dzNjZk9BYlAyRXVwOGJ5c1NtL2Qz?=
 =?utf-8?B?TVQ4N1Q1QThaTHJuZnRuMnlxQ0YxVndUcStGSFovK25Ncll3OG9Id3R1L29I?=
 =?utf-8?B?elFXTlZzQ2E1Vk5oWTg2KzhwUDdWRDMzb3IrVFA5UTNqT3R4UEVRdVl1QVNF?=
 =?utf-8?B?WjJpU0J6aUY5S0VPYVFMckgxRTN5eU5IUGp4V1oyVXRWTGtvUm1wYitLNE1a?=
 =?utf-8?B?bUVjZjNGOUZiZnpLVkhwV2xoaXE0aUFGSnVVUndnTU1IRVlPK000M2VXSXlJ?=
 =?utf-8?B?KzV6MGs5eUNjaklrZ1JYUDF3a1lqQWNXTGJXbC9zVjJWd1FoYjFjdHlvc2JG?=
 =?utf-8?B?dHdGelNyRFlxSXY1WVh1bmg5TlgvL3VUdlI1MTZVWkpqaVdHQy8rRVVSUTVt?=
 =?utf-8?B?UTVSc3dXNUlPdzIzREJVSG4zSkNwL2NaQXpGTDFnbGxKbjNXZHBNdlQ1MGlS?=
 =?utf-8?B?NUQwWXQxS2Q3REczZGpvK2EzcDE3dnIyRVEyck1BcWpLc0I2TXN1Qm52NS9p?=
 =?utf-8?B?N0pSNzMzaG5yVXcybmdaR3llN1d6WlNldGVZdUFyT0Fib051dmdYamREVmhD?=
 =?utf-8?B?UGs2aHhpOWRlNjNPYlBKZWF6QzBLcC9yYlgvWXJibnpLY3JQaGlOd1JBQjFS?=
 =?utf-8?B?Q1I3L1Z3eFRwMFptczNVdDdIYjFiYU90MXZiM1I5K3hsWi9nL0xocDFsK0ZG?=
 =?utf-8?B?QlhtbXlPTm5jSThwcVJiWFpTTzd0V3Mxbk9FR1RRakhTS1FpQmVwVGdrN2Zy?=
 =?utf-8?B?MHJzY3Q1ZmM5cElyaHh1RDhnRHBWTGlDb0lHRE5UZjFydUxUYStIQUhESm42?=
 =?utf-8?B?MzJDb2ZlT0p1VmpON3IwMUFScllCWFl6UER4ZzJqdkRSbXVIWndna1pJODdo?=
 =?utf-8?B?SVo1cFNCeVVxR2N2aGJJbU0vY2doR0haYS9aeDNRSFNkN3ZUZy9HS2NiR0t0?=
 =?utf-8?B?YVA5R2VkSFFySmw5QkovcVQ0S0VZMUplVFpwVHloREt4NUpmY0xsM3hOaXdn?=
 =?utf-8?B?WUtoWWJtUTRQbEtUaTh3Njl5Q0k4M2NGclJMYmVLZUs2dEx4bVBYeXdGYlZ5?=
 =?utf-8?B?bHZrUzhRaTdiK1lpRktFR1Z2eEpYcE9ERnoxdjRQQXpLNjhUY2pBUT09?=
X-Exchange-RoutingPolicyChecked: u+9A1pCefMRIRKz40z40uECnYiJKV+ZirullBp6euPI4An16hMPfFEBen62pJPkbFRJ3DTnUChrAHwEsSQO8i2whtPqw7B4saZ0pAexnWk4sQlia1QXgmzrddaE6bKIOtyfoT3y4ZV2QvFzOX/dVDSFVw9OG15rwo+4gGToMJv2MGlaNbg5eENRAoJxdkmWQ2KlN3TapMyD0JqvDhl0+TKSLBliDrkemK1WkkBQywWALzhClvi6x8EgOaixmsQkJdqQYtn7ZsI2xg3RZq7CbBlDNkgzohM5btqLCjMF3L6wQoDH4P/Y1BapTbKGw/J399Z919GyEg3xVNNZQysT0IQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb77926-7af0-4074-6c2e-08de88e4dc45
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:02:46.7676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/pO07EU6Dhib/fK2FVMAlbZDz+ILG2hG3UxKoWW74JLELG6sE/WbwkRJyCnbIpAVKpmUFOMTPoexJwpznKDlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB9633
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

Thanks Raag.

As of now this fix is not yet in drm-tip.

Not a problem, as long as we will get it eventually.

-Tomasz

On 3/23/2026 5:12 AM, Raag Jadav wrote:
> On Fri, Mar 20, 2026 at 03:57:33PM +0100, Tomasz Lis wrote:
>> After setting a local variable, check that local value rather that
>> checking destination at which the value will be stored later.
>>
>> This fixes the obvious mistake in error path; without it,
>> allocation fail would lead to NULL dereference during context
>> creation.
>>
>> Fixes: 89340099c6a4 ("drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()")
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> Already fixed[1], but not sure if it's landed yet.
>
> [1] https://lore.kernel.org/intel-xe/20260305184519.155060-1-shuicheng.lin@intel.com/
>
> Raag
>
>> ---
>>   drivers/gpu/drm/xe/xe_lrc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> index c5cfd8f75a94..77cd57788837 100644
>> --- a/drivers/gpu/drm/xe/xe_lrc.c
>> +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> @@ -1607,8 +1607,8 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe, struct xe_v
>>   	bo = xe_bo_create_pin_map_novm(xe, tile, bo_size,
>>   				       ttm_bo_type_kernel,
>>   				       bo_flags, false);
>> -	if (IS_ERR(lrc->bo))
>> -		return PTR_ERR(lrc->bo);
>> +	if (IS_ERR(bo))
>> +		return PTR_ERR(bo);
>>   
>>   	lrc->bo = bo;
>>   
>> -- 
>> 2.25.1
>>
