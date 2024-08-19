Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359A5C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon, 19 Aug 2024 22:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04C010E0D3;
	Mon, 19 Aug 2024 22:32:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMj1E1PI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCEEF10E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 19 Aug 2024 22:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724106774; x=1755642774;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=CBwW0yG/Q8vWluSqiEfrLu7cFqklrj4BcE4m3qon0qY=;
 b=gMj1E1PIZ7/iXupWrroXdAzP2w1bdYVfJ3/afQdR9KxJw7bwmHFJuSKp
 MYXBdXad1PFAN2wmRmcs8Cvi4z7idH+HIWPjXhXnqiJb3qN5/qyBbUbM1
 esuEHSm81PHGT/q5lHE+X+E2PaH8wm0LVWi6ru6VzYlXZrsmCMwxdRUL2
 mfsJuclQcKky6NsDtCpgz1q1f+NRNzMNApn9Bj1P1k9UPJE4NtkYex4pV
 N/VXtCMkF32TjO7oAFLPnWzIY8dL2GKy/LCt9YSFT2FKEo1HZS4v7tzmA
 /Py4yBiIx2MffGjKVQNhAFWZDQdr0o+m1Mklf9ASNJFWeWdNnr1aRypxW A==;
X-CSE-ConnectionGUID: KMElPenoTVeO8YtQKp9rwg==
X-CSE-MsgGUID: aCy33dveSiKG3OjQsCjN6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22225395"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="22225395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 15:32:53 -0700
X-CSE-ConnectionGUID: ZvfyxTY7R9a2bUtQClbx0Q==
X-CSE-MsgGUID: E+9GMhU4QGWy4N+8+8AioA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; d="scan'208";a="91254143"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 15:32:53 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 15:32:52 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 15:32:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 15:32:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8EBhGxKfbQIzjTjme91I7CVz9MOv+j3hLmafXFk7BNapgAS0/JvZqQuuqscrN/6PmIU//R1vLweCoen22UYL7mQm4bn2coVdKqUiuye0U897asM9jWlV5Zv9sGG+YUd/8UazyvUU5JMgR+Zc/LOk1oRBhGX+i+m2S6v7DCkwq4h6NpE5ZnttnMRBzQJ4e1mj3zIYtsyViy8yfaKaSucSEdkW9k79foJ+UD8gaUcCpfiWcRoaSvf1Y5biJk16wy2lsvV1CwrsFwmnkm4nkoiYhKoJ65UAzndpuIsQdNgRR2XFQ669VbABp+CURubo1+uUN7BWYE+WDXoUtn4VWREqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PZHnJOPbtjGauw4cgM8KZRnzbqBygLSvDYqMgHQuTg=;
 b=EVWMSRGrBJJE3mBUmHlyu+N8hxHltrEFVwnt2AtKVoGgthGYKtSL+0ipVeFLPL06sbNR5lP2c2lrGll0u8nskcVEbjAsxQx4QXhCF3TWCGXQOwB9zE/y+0A0Z3eVnd8ulT4UntWvvBS2oxdvThsktJ7s3Rj06DbwqKbxHBzPXCGmDWuDHiQEWFbCXnifHaPHBJYJdk3tQZBkq9lnLmNscR5cd0zUYk2TrP7kDNvjtiaUod09xAOshsD4b2aFvTSZSrMjhCOS8xAGicOhV1uRVt41kEfT1aV7xidJyorU8HRzHuZQ+46/Pu4pd8ojV/hWVnvbwi25p8V6yHRvT5JYtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB7302.namprd11.prod.outlook.com (2603:10b6:8:109::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 22:32:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.019; Mon, 19 Aug 2024
 22:32:49 +0000
Date: Mon, 19 Aug 2024 17:32:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v4] drm/xe: Add driver load error injection
Message-ID: <bz6aniivkrjofu2uaemuiovjqfjz6emg4euo7kjza3ua63wq6u@7ctci7soa7io>
References: <20240814192322.604388-1-francois.dugast@intel.com>
 <df545392-b906-41a7-bfb9-0462c72688f0@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <df545392-b906-41a7-bfb9-0462c72688f0@intel.com>
X-ClientProxiedBy: MW4PR03CA0060.namprd03.prod.outlook.com
 (2603:10b6:303:8e::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB7302:EE_
X-MS-Office365-Filtering-Correlation-Id: 188958a1-93fc-4223-84c9-08dcc09edb28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HBrizbglohKb49hkyFluQ/Uc/oUoxvCw5VP1MfCXxho+vkYvJh3SWnVUiqUH?=
 =?us-ascii?Q?VqjMeo+d3KYRoIQpQoT0jOBjYXlGXPupUSRnIt1Ag7T2EXI2nHVlhMcBrlj8?=
 =?us-ascii?Q?RjtknSwoHH9KSz5VaPtR3VYG7R3309NB93DPjHl6VXLNjUyXo8bN4DoRcOvc?=
 =?us-ascii?Q?UqUNUMs9mV6ojohRqGA3oGezGa4weZ4P5ZRwcBoqg3qeYgfAzI6GCODUtIPs?=
 =?us-ascii?Q?nxJUSQm8VgZZmGsK8HWjRAhPeuZN58CsynEUr2V+v0fwPQDHrdl4MDb80Y+Z?=
 =?us-ascii?Q?FPABUSwQ9zqh9Pwo/ISrLIwmGdgYWLJx5dxWAfIsp9FxLwSlXXeIIQK4ECYW?=
 =?us-ascii?Q?Kc/G0n6pkt1xjjw/+qIZaqZjh9b2Fa+eYV4J+lIQ3TFwGld6bRKQi54hexIK?=
 =?us-ascii?Q?pRqMWi7K6xQ75RC8cQwg2X0I9tDQsjA7j3HnPLHTCmQ4srj5x7gt70S3s6tu?=
 =?us-ascii?Q?OUEprBXe/udQ6goEx+B+Wogf/OwKm5DDFqmKZHK7+TF4o3/rzuHRv3HGdSCx?=
 =?us-ascii?Q?nxsuxCbYZBhv/ps6ZPSZVlA3XtzJBSXZjwsPj0h5Mr7NCVvlSf6EQJbFLVo3?=
 =?us-ascii?Q?CbMqP6RNrKIdQo8AvQE/3I+1l1sPvfsezll5F5YYMNc2bMu//5jbC2RcieMv?=
 =?us-ascii?Q?Bwi3FpYlYFNOX7rhNxd/uKdnOkZllO61v3uuBk6BFPIOTGqugoReJqBmjtRF?=
 =?us-ascii?Q?p7HfPhoX4S7dZI+KOnV6F7GGa/imz/2PDooMTfmNO7k6inMeRie/+iQlduiA?=
 =?us-ascii?Q?LjYAx/myi3OPX6KIVmYhgtoqhmywBox6XUP5vIBNbhwKy7oeSxFArHV/5R8/?=
 =?us-ascii?Q?4wIrpJGfkA8bPei2aAy2A4udWnlICxxUSCOlrtQi+6IkZ59keTnRGg++qJoy?=
 =?us-ascii?Q?R5+S5dqW5aFKaCrJw2U6iXG+3/Dw9Q7QjeYMisXiAnYH/152Ro4cJG+Ecgfo?=
 =?us-ascii?Q?CSzPkLxJIn371NMp/MVrSFqSRyqQXfty0wkjOENNM907e02logcdAOARN1DT?=
 =?us-ascii?Q?3+Cnm9Z33rUAwZXd1muPQPTkhsIDhdGtQTsuh/KtEtcHmHaeKjiGVOhtmXAj?=
 =?us-ascii?Q?+Uo3l8CuZjAESNIb94/H3GmcVhoC180ZwLYCyg2uXDuZNDlSm1C9S71clntr?=
 =?us-ascii?Q?LUazPLsFnPeJgpVWMAV5LdlckFQRSsZDUtMb5lQhMidpknC2xKn8FEOpmNEO?=
 =?us-ascii?Q?Ftc5EDcR5jPx37RXDCPo2cxkicbgDvg1ylCZ6yyWq1j2KoGaZyKhe5Sj6Jls?=
 =?us-ascii?Q?8rDdA5yEo8nwFxIGJhS3jNkyY4HDg53GZ8lGu9CfVdoH9RIBhcBfTjzSyH44?=
 =?us-ascii?Q?FG7hGnPlZ941Z+26vCRQdIOrMJg7VYhxF9Xv/tYwb//jgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RTTqQy0n7y9T85Xnt+wWmnyna7HN2zo5cBHu3bY/mOhPsWMsgSMUMYhq4PUq?=
 =?us-ascii?Q?kPQ3FRUsz7/r5SOPc/d3ZTH3WU2JfnGD0IPmHnPMXMThYvcNV0d3V/RtoQxC?=
 =?us-ascii?Q?xRWYpF/6oDgNV8NjuInxxtaV4h7wdkEmHCBiQJUiDJbTyvNYf2X6S2UmYqMQ?=
 =?us-ascii?Q?q/7NkaNEcNOf/pTQ2TGmrc+wX4VhF6wmcy40IUN1chqoebHlR0D8We8vbQ4d?=
 =?us-ascii?Q?cfuch9dXA8cajm4/RTD1662mFMRsIlbESqzrblgPOtyNgs+nLcHyMjcE5dzD?=
 =?us-ascii?Q?+sOCgXyCJhjPRIjRIZV6D9bramZAIIJNtyGvoZaX7cYaRebO2ccuPdvD9de4?=
 =?us-ascii?Q?Kk9P/gqrgSeIgLnXlpHWsqRk9W+UnBeeri6k0hdka2dnmF4ptHK5jeTRdwZ8?=
 =?us-ascii?Q?usmsMTigBSrpsesL+D28owD+48T4yFD3Mn5UmPhZ7TWDb3cUiqQuVXttwGXN?=
 =?us-ascii?Q?xOHnCBsqKjFbvOta9UfBt47ok+Js8TLGGy70P9RAqa2HDHuF8tLuozLY0wGz?=
 =?us-ascii?Q?Zh4RoWcmZ//hPL8WE+I6q5U6FEY1KABiwjQ4YRn/WCB+65fordupaSMxHIPj?=
 =?us-ascii?Q?6F/ab9qExP/wLfqxAxOFBF56Qce0Mqabf1C8nbOhy8coJS059Wd2nil/BYLR?=
 =?us-ascii?Q?PdCSPciBtf+wRAURZc2W+2v0zCjIo/eygx7TpGCsnummb9fB/R2ELkRAEsGp?=
 =?us-ascii?Q?h58Q8GnErq+6jpmTKGS3LZEtO2XLeoRfRZ8XL+jOLhfxrbF2PrFc+nibzNVg?=
 =?us-ascii?Q?oJ21fvLSRjmxu+rM8wDjr/AsTK42VqUzh7cdjprQGXe281zsih1o8kIDQBFu?=
 =?us-ascii?Q?1NdNy+ieBYlO7McpxoRZcQdrSc/r8aGK18xaIyTA+BL4K0LqlCPyMnP3oq3o?=
 =?us-ascii?Q?ypKL6Adxrs87aCy4tybs5vAqtLw57EiwqN1XJhfuiaADK6F2udSGPs9Ck1zO?=
 =?us-ascii?Q?yJj42ZLb7XyoXvvlgFg5A3QqbdoOWKHmWv/V1zAzE7WbIRYTjmobqbxTYuoO?=
 =?us-ascii?Q?Tsyf2b8GS3lSMZO5V1F/8lFDFRiIE6eHeuPDf9+Q+rokf5nFkQWFnqdpdpkm?=
 =?us-ascii?Q?RG7O0ySmKyTsG+uDQdrTFLlGVlxYUjNOwLvcFmuP2DzukWQxf3/6ZGaqBGz2?=
 =?us-ascii?Q?ZTHoiH67MaHqyhpj++hIaMEQi17W/b9x4tY3hpyRj9+zEDmp8aiOTc3G4sE8?=
 =?us-ascii?Q?+7eLuubWkbCDUwybFuUzobeoRC7BZJprboFNWYhLuqXT4MBGO7q/IPQNDsST?=
 =?us-ascii?Q?gpM62nJBGVTHGMrMVXzxTKgfHaHrS2CC1poZ41PrurMyht458H6MTjIk1T6P?=
 =?us-ascii?Q?w/dZX7jiCM5DtgJwMJWAodvI4tP3hZnvN5WL+NEk1tUPagQ8JrWsPcEJ1xNi?=
 =?us-ascii?Q?QJlIifVcscIUif2TPasTsENJNlyA8hpTLeFyKiWhuZhrOH5TBlH3g76Ab/xD?=
 =?us-ascii?Q?Tx4DR7GpnZRn1pXv//BGJV6ToEYBeRJRCSi529K32uqt/qsLeYBt2agt1Nns?=
 =?us-ascii?Q?zTzMmaB5bFl/HuttKqabgxzhjjLV7Bl9ZBL8x/LoI+pQwBg1ZsDpDYJbUppn?=
 =?us-ascii?Q?ea7rH1IHiVytevMHFdkBimNTE1ep6Ojr5omJInRYj+3FQqBTtwt6prfzlFUK?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 188958a1-93fc-4223-84c9-08dcc09edb28
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 22:32:49.5921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hScDPV0D//xR4kv3xlz2qckAjOrKq7lvBqunnshFih+WNldG8ypTFsHUIHNjGncndovL/urR2q75d/AxsddzEirFDHDlQYNzEa0NxGn2q9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7302
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

On Mon, Aug 19, 2024 at 08:54:38PM GMT, Michal Wajdeczko wrote:
>
>
>On 14.08.2024 21:23, Francois Dugast wrote:
>> Those new macros inject errors by overriding return codes. They must
>> manually be called, typically by turning this pattern:
>>
>>     err = foo();
>>     if (err)
>>         return err;
>>
>> into:
>>
>>     err = foo();
>>     err = xe_device_inject_driver_probe_error(xe, err);
>>     if (err)
>>         return err;
>
>why do we want to pollute the code with such strange pattern?
>it actually may also introduce same fake errors as in example above
>foo() might expect that there is a foo_fini() which will be called on
>non-failure path...

see the xe_device_inject_driver_probe_error_override() impl as that is
handled.  Goal was not to change any code path and this is done by avoid
changing the control flow.

in this case the diff is actually a single line.

	err = foo();
+	err = xe_device_inject_driver_probe_error_override(xe, err);
	if (err)
		return err;

all the control flow was already there, it's not added.

>
>
>maybe easier/cleaner way would be to use other pattern where we inject
>an error at the start of the inner function that we expect to fail:

because we can't always do this in the inner function.

>
>int foo(xe)
>{
>	int err;
>
> 	err = xe_device_inject_driver_probe_error(xe);
>	if (err)
>		return err;

yes, when we can do it in the beginning of the function, it should be
preferred. 

>	...
>	return 0;
>}
>
>or even use some macro as a function prologue:
>
>#define XE_DEVICE_ERROR_INJECTION(xe, err) do {		\
>	if (xe_device_inject_driver_probe_error(xe))	\
>		return (err);				\
>} while(0)

no, let's not go there as everything here should go away in favor of
proper error injection from core kernel. Not our own subsystem inside
xe.

also a macro that returns the current function is not better than the
pattern above.

>
>#define XE_DEVICE_ERROR_INJECTION_SIMPLE(xe) \
>	XE_DEVICE_ERROR_INJECTION((xe), -ENODEV)
>
>int foo(xe, params)
>{
>	int vars;
>
> 	XE_DEVICE_ERROR_INJECTION_SIMPLE(xe);
>	...
>	return err;
>}
>
>xe_ptr *bar(gt, params)
>{
>	int vars;
>
> 	XE_DEVICE_ERROR_INJECTION(gt_to_xe(gt), ERR_PTR(-ENOMEM));
>	...
>	return ptr;
>}
>
>then we don't mess with any error handling code that should be clean

instead of foo and bar, try to do this in the real functions in this
patch. I'd rather spend time converting this to use proper error
injection, writting the appropriate igt, etc.

right now it's a hack that allows us to find the issues with error-paths
during probe.

>
>>
>> When CONFIG_DRM_XE_DEBUG is not set, this has no effect.
>>
>> When CONFIG_DRM_XE_DEBUG is set, the error code at checkpoint X will
>> be overridden when the module argument inject_driver_load_error is
>> set to value X. By doing so, it is possible to test proper error
>> handling and improve robustness for current and future code. A few
>> injection points are added in this patch but more need to be added.
>> One way to use this error injection at driver probe is:
>>
>>     for i in {1..200}; do echo "Run $i"; modprobe xe inject_driver_probe_error=$i; rmmod xe; done
>>
>> In the future this is expected to be replaced by the infrastructure
>> provided by fault-inject.h
>
>+1
>
>>
>> v2: Fix style and build errors, modparam to 0 after probe, rename to
>>     xe_device_inject_driver_probe_error, check type when compiled out,
>>     add _return macro, move some uses to the beginning of the function
>> v3: Rebase
>> v4: Improve commit message and comments, keep if/return rather than
>>     change the flow inside the macro (Lucas De Marchi)
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       | 41 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device.h       | 23 ++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device_types.h |  5 ++++
>>  drivers/gpu/drm/xe/xe_gt.c           |  2 ++
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c  |  2 ++
>>  drivers/gpu/drm/xe/xe_guc.c          |  2 ++
>>  drivers/gpu/drm/xe/xe_guc_ct.c       |  1 +
>>  drivers/gpu/drm/xe/xe_mmio.c         |  5 ++++
>>  drivers/gpu/drm/xe/xe_module.c       |  5 ++++
>>  drivers/gpu/drm/xe/xe_module.h       |  3 ++
>>  drivers/gpu/drm/xe/xe_pci.c          |  6 ++++
>>  drivers/gpu/drm/xe/xe_pm.c           |  5 ++++
>>  drivers/gpu/drm/xe/xe_sriov.c        |  6 ++++
>>  drivers/gpu/drm/xe/xe_tile.c         |  4 +++
>>  drivers/gpu/drm/xe/xe_uc.c           |  1 +
>>  drivers/gpu/drm/xe/xe_wa.c           |  5 ++++
>>  drivers/gpu/drm/xe/xe_wopcm.c        |  4 +++
>>  17 files changed, 120 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 206328387150..a2ccdc4115ac 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -316,6 +316,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>  			      xe->drm.anon_inode->i_mapping,
>>  			      xe->drm.vma_offset_manager, false, false);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (WARN_ON(err))
>>  		goto err;
>>
>> @@ -474,6 +475,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>>  		goto mask_err;
>>
>>  	err = dma_set_coherent_mask(xe->drm.dev, DMA_BIT_MASK(mask_size));
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		goto mask_err;
>>
>> @@ -577,6 +579,7 @@ int xe_device_probe_early(struct xe_device *xe)
>>  		return err;
>>
>>  	err = wait_for_lmem_ready(xe);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		return err;
>>
>> @@ -745,6 +748,11 @@ int xe_device_probe(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_sanitize_freq(gt);
>>
>> +#ifdef CONFIG_DRM_XE_DEBUG
>> +	/* After probe finishes, stop checking for error injection */
>> +	xe_modparam.inject_driver_probe_error = 0;
>> +#endif
>
>this should be wrapped in some kind of
>
>xe_device_inject_driver_probe_error_finish()
>
>to avoid #ifdef in the code

agreed

>
>> +
>>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>
>>  err_fini_display:
>> @@ -995,3 +1003,36 @@ void xe_device_declare_wedged(struct xe_device *xe)
>>  	for_each_gt(gt, xe, id)
>>  		xe_gt_declare_wedged(gt);
>>  }
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +/**
>> + * __xe_device_inject_driver_probe_error - Inject an error during device probe
>> + * @xe: xe device instance
>> + * @err_injected: the error to inject
>> + * @err_real: the error returned by the actual function
>> + * @func: the name of the function where this is called from
>> + * @line: the line where this is called from
>> + *
>> + * This is not meant to be called directly, only through xe_device_inject_driver_probe_error.
>> + *
>> + * Return: err_real if != 0, err_injected otherwise
>> + */
>> +int __xe_device_inject_driver_probe_error(struct xe_device *xe, int err_injected, int err_real,
>> +					  const char *func, int line)
>> +{
>> +	if (err_real != 0)
>> +		return err_real;
>> +
>> +	if (xe->inject_driver_probe_error >= xe_modparam.inject_driver_probe_error)
>> +		return 0;
>> +
>> +	if (++xe->inject_driver_probe_error < xe_modparam.inject_driver_probe_error)
>> +		return 0;
>> +
>> +	drm_info(&xe->drm, "Injecting failure %d at checkpoint %u [%s:%d]\n",
>> +		 err_injected, xe->inject_driver_probe_error, func, line);
>
>after error injection, some caller code could still report this as real
>*ERROR*, so maybe, if this solution will be for a while, it's worth to
>consider adding set of xe_err(xe, ...) macros where we could potentially
>hide fake errors to make CI happy
>
>> +
>> +	xe_modparam.inject_driver_probe_error = 0;
>> +	return err_injected;
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 2c96f1b2aafd..0d0187819e92 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -184,4 +184,27 @@ void xe_device_declare_wedged(struct xe_device *xe);
>>  struct xe_file *xe_file_get(struct xe_file *xef);
>>  void xe_file_put(struct xe_file *xef);
>>
>> +#define XE_DEVICE_INJECTED_ERR -ENODEV
>> +#define xe_device_inject_driver_probe_error(__xe) \
>> +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, 0, __func__, __LINE__)
>> +#define xe_device_inject_driver_probe_error_override(__xe, __err_real) \
>> +	__xe_device_inject_driver_probe_error(__xe, XE_DEVICE_INJECTED_ERR, __err_real, __func__, \
>> +					      __LINE__)
>
>all above should be under CONFIG_DRM_XE_DEBUG, no?

why? simply providing the stub below makes it go away when !CONFIG_DRM_XE_DEBUG
and still provides type checking to avoid breaking the build without it
(and without resorting to typecheck.h)


Lucas De Marchi

>
>> +
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +
>> +int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>> +					  int err_injected, int err_real,
>> +					  const char *func, int line);
>> +#else
>> +
>> +static inline int __xe_device_inject_driver_probe_error(struct xe_device *xe,
>> +							int err_injected, int err_real,
>> +							const char *func, int line)
>> +{
>> +	return 0;
>> +}
>> +
>> +#endif
>
>and maybe it should be in xe_debug.h ?
>
>> +
>>  #endif
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 16a24eadd94b..5097376aec28 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -491,6 +491,11 @@ struct xe_device {
>>  		int mode;
>>  	} wedged;
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	/** @inject_driver_probe_error: Counter used for error injection during probe */
>> +	int inject_driver_probe_error;
>> +#endif
>> +
>>  #ifdef TEST_VM_OPS_ERROR
>>  	/**
>>  	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 58895ed22f6e..b90acc7eedba 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -378,6 +378,7 @@ int xe_gt_init_early(struct xe_gt *gt)
>>  	xe_reg_sr_init(&gt->reg_sr, "GT", gt_to_xe(gt));
>>
>>  	err = xe_wa_init(gt);
>> +	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
>>  	if (err)
>>  		return err;
>>
>> @@ -564,6 +565,7 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
>>  		goto out_fw;
>>
>>  	err = xe_uc_init_hwconfig(&gt->uc);
>> +	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
>>  	if (err)
>>  		goto out_fw;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index ef239440963c..09e1fe745ada 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -7,6 +7,7 @@
>>
>>  #include "regs/xe_regs.h"
>>
>> +#include "xe_device.h"
>>  #include "xe_gt_sriov_pf.h"
>>  #include "xe_gt_sriov_pf_config.h"
>>  #include "xe_gt_sriov_pf_helpers.h"
>> @@ -54,6 +55,7 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
>>  		return err;
>>
>>  	err = xe_gt_sriov_pf_service_init(gt);
>> +	err = xe_device_inject_driver_probe_error_override(gt_to_xe(gt), err);
>>  	if (err)
>>  		return err;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>> index de0fe9e65746..74e598294f90 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -351,6 +351,7 @@ int xe_guc_init(struct xe_guc *guc)
>>  		goto out;
>>
>>  	ret = devm_add_action_or_reset(xe->drm.dev, guc_fini_hw, guc);
>> +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
>>  	if (ret)
>>  		goto out;
>>
>> @@ -408,6 +409,7 @@ int xe_guc_init_post_hwconfig(struct xe_guc *guc)
>>  		return ret;
>>
>>  	ret = xe_guc_pc_init(&guc->pc);
>> +	ret = xe_device_inject_driver_probe_error_override(guc_to_xe(guc), ret);
>>  	if (ret)
>>  		return ret;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index beeeb120d1fc..ed715a252f6a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -194,6 +194,7 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>>  	ct->bo = bo;
>>
>>  	err = drmm_add_action_or_reset(&xe->drm, guc_ct_fini, ct);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		return err;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index bdcc7282385c..af322f5c8159 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -136,6 +136,11 @@ int xe_mmio_probe_tiles(struct xe_device *xe)
>>  {
>>  	size_t tile_mmio_size = SZ_16M;
>>  	size_t tile_mmio_ext_size = xe->info.tile_mmio_ext_size;
>> +	int err;
>> +
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>>
>>  	mmio_multi_tile_setup(xe, tile_mmio_size);
>>  	mmio_extension_setup(xe, tile_mmio_size, tile_mmio_ext_size);
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 923460119cec..806b6c1f8a7f 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -53,6 +53,11 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
>>  MODULE_PARM_DESC(force_probe,
>>  		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
>>
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +module_param_named_unsafe(inject_driver_probe_error, xe_modparam.inject_driver_probe_error, int, 0600);
>> +MODULE_PARM_DESC(inject_driver_probe_error, "Inject driver probe error");
>> +#endif
>> +
>>  #ifdef CONFIG_PCI_IOV
>>  module_param_named(max_vfs, xe_modparam.max_vfs, uint, 0400);
>>  MODULE_PARM_DESC(max_vfs,
>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>> index 161a5e6f717f..47cefaf8d79b 100644
>> --- a/drivers/gpu/drm/xe/xe_module.h
>> +++ b/drivers/gpu/drm/xe/xe_module.h
>> @@ -20,6 +20,9 @@ struct xe_modparam {
>>  	char *force_probe;
>>  #ifdef CONFIG_PCI_IOV
>>  	unsigned int max_vfs;
>> +#endif
>> +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>> +	int inject_driver_probe_error;
>>  #endif
>>  	int wedged_mode;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 3c34b032ebf4..bac07779d353 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -626,6 +626,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>  				 desc->has_display;
>>
>>  	err = xe_tile_init_early(xe_device_get_root_tile(xe), xe, 0);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		return err;
>>
>> @@ -645,8 +646,13 @@ static int xe_info_init(struct xe_device *xe,
>>  	u32 graphics_gmdid_revid = 0, media_gmdid_revid = 0;
>>  	struct xe_tile *tile;
>>  	struct xe_gt *gt;
>> +	int err;
>>  	u8 id;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	/*
>>  	 * If this platform supports GMD_ID, we'll detect the proper IP
>>  	 * descriptor to use from hardware registers. desc->graphics will only
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index 9f3c14fd9f33..2de8383b745d 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -228,6 +228,7 @@ int xe_pm_init_early(struct xe_device *xe)
>>  		return err;
>>
>>  	err = drmm_mutex_init(&xe->drm, &xe->d3cold.lock);
>> +	err = xe_device_inject_driver_probe_error_override(xe, err);
>>  	if (err)
>>  		return err;
>>
>> @@ -246,6 +247,10 @@ int xe_pm_init(struct xe_device *xe)
>>  {
>>  	int err;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	/* For now suspend/resume is only allowed with GuC */
>>  	if (!xe_device_uc_enabled(xe))
>>  		return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
>> index 5a1d65e4f19f..b19b06c72870 100644
>> --- a/drivers/gpu/drm/xe/xe_sriov.c
>> +++ b/drivers/gpu/drm/xe/xe_sriov.c
>> @@ -102,9 +102,15 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>>   */
>>  int xe_sriov_init(struct xe_device *xe)
>>  {
>> +	int err;
>> +
>>  	if (!IS_SRIOV(xe))
>>  		return 0;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	if (IS_SRIOV_PF(xe)) {
>>  		int err = xe_sriov_pf_init_early(xe);
>>
>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> index 15ea0a942f67..d70f1f61c096 100644
>> --- a/drivers/gpu/drm/xe/xe_tile.c
>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>> @@ -124,6 +124,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>>  	if (IS_ERR(tile->primary_gt))
>>  		return PTR_ERR(tile->primary_gt);
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	return 0;
>>  }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>> index 0d073a9987c2..0c40fbdf21ee 100644
>> --- a/drivers/gpu/drm/xe/xe_uc.c
>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>> @@ -59,6 +59,7 @@ int xe_uc_init(struct xe_uc *uc)
>>  		return 0;
>>
>>  	ret = xe_wopcm_init(&uc->wopcm);
>> +	ret = xe_device_inject_driver_probe_error_override(uc_to_xe(uc), ret);
>>  	if (ret)
>>  		goto err;
>>
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 28b7f95b6c2f..156a77b27593 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -825,6 +825,7 @@ int xe_wa_init(struct xe_gt *gt)
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
>>  	unsigned long *p;
>> +	int err;
>>
>>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
>> @@ -836,6 +837,10 @@ int xe_wa_init(struct xe_gt *gt)
>>  	if (!p)
>>  		return -ENOMEM;
>>
>> +	err = xe_device_inject_driver_probe_error(xe);
>> +	if (err)
>> +		return err;
>> +
>>  	gt->wa_active.gt = p;
>>  	p += n_gt;
>>  	gt->wa_active.engine = p;
>> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
>> index d3a99157e523..c9be9d31d3ae 100644
>> --- a/drivers/gpu/drm/xe/xe_wopcm.c
>> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
>> @@ -263,6 +263,10 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>>  		return -E2BIG;
>>  	}
>>
>> +	ret = xe_device_inject_driver_probe_error(xe);
>> +	if (ret)
>> +		return ret;
>> +
>>  	if (!locked)
>>  		ret = __wopcm_init_regs(xe, gt, wopcm);
>>
