Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B512FC2BB85
	for <intel-xe@archiver.kernel.org>; Mon, 17 Jun 2024 20:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D70310E4DF;
	Mon, 17 Jun 2024 20:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWcVCY0N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A3410E4DF
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Jun 2024 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718654988; x=1750190988;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=U0vGecDcYwzOtW/hWQq53s9dM0PLmljQxcFDvzs5i9s=;
 b=mWcVCY0NaKTlPMSMh364NQMs4bSi7e2v1BSwksMJLuN/b6SPrWOV0ZHw
 6btfDkYPEkPD+RVIbba3107usbbEs0t3R3Yc6cY0dvYzooHwHDoI1IlAM
 mespUUdcW6dwQh9ODyDJB7X9useqRWJUqxKSoBj+xBGKPYnafxQr6luKz
 0Cdo/x0Lque7WilWda9gY4E6jocPmfdiigw0DbcV+/ylVegsIjnjHB3sO
 SFkqgi6gAeDNT5K1mxrFmTxv6sXgljhVYfokGBTYTq/4QKfkDwZbLJ1lW
 K/PGCfehcufBxVPtHE+oni/pA3vk6qChPHSbhK91UW7n8tlrPHgwdVVn+ w==;
X-CSE-ConnectionGUID: 65fwO33OT4GUWfx3OJFalQ==
X-CSE-MsgGUID: 8UBKvmUTStiX4YbPOeCsFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33038668"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="33038668"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 13:09:48 -0700
X-CSE-ConnectionGUID: 22MaOUIVTVazqzpQs5CSVQ==
X-CSE-MsgGUID: rF40Rb9qQOOpf+ZToiBKCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; d="scan'208";a="41167946"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jun 2024 13:09:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 13:09:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 17 Jun 2024 13:09:46 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 17 Jun 2024 13:09:46 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 17 Jun 2024 13:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SDYLEialSNfwl0Mz8d3bs440ZSrXAFH8ZMQiUaPoCZQ0aVVzqUDXgm1GYRknq9CvPpd1WS1a/yBX61k3hCPvyYknHSWpHJHkpJDCGCqzlGmlZZ+iJIPFgkdDCxCOK8N2r/ar+CH08EtzPOfzAYFo7Oy5oB/WiAlCFh27c0XSExGkhvjI4ppuL31NO8jiVE8G5XQaKGQXgLf/OLOsg6KyWAu0rl6ln6OEvifPK//xQAR8+oqPUEQ17MUo0jM+qt85Bweu7RON6Icn+sVym8XK0QfuqIYjTaGZwlv6tfpV5qLZc8leeaBJVGVc4GUg/uz4ie+/OHlLde/o2P7QRuqxmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG/u5FIrXU4/RRIL9CMZdNrN0rhd9PVOe5Y+srZr0aw=;
 b=AuoSXF3+RSRYhmoa5aqsjIfLlj84eZjrbKquoVmnv2SKAdLkqOHwhifXhR3U6AkEGTXLgs1WVfNVHyzkMl6GBCWVS8MT0WUYcWjICOIQsYWpSO9evOSZTEZwYKqbkU8pPvkkPlJPfkr4Kz1DxoKDVQrVC58NzYj/dh8SeObFEQDlfRfk4kK2y7gTVEPzXIW4h68NEeCKhAghNntegV28ABnZSgk4pgFKrqTdlqiur2+3CziX87lYcX2C1GWRzOD09E2ndExMDQS9XQ8FYxwSv86VqPTxciA/8XNgeBWwsdwcmz9RoS4gWX7so58yPIaFq6kgXN502JrdKvQT2qtUcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 20:09:44 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 20:09:44 +0000
Date: Mon, 17 Jun 2024 15:09:40 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tejas Upadhyay
 <tejas.upadhyay@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 2/5] drm/xe/rtp: Allow to OR rules
Message-ID: <aom2dr5qj3idnjx3nb45fdqp74rp6dywbzkxy6cxvknhpacu5j@djgwp77ugbmj>
References: <20240617182518.280975-1-lucas.demarchi@intel.com>
 <20240617182518.280975-3-lucas.demarchi@intel.com>
 <20240617190926.GG2905419@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240617190926.GG2905419@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0036.namprd04.prod.outlook.com
 (2603:10b6:303:6a::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1822cc-2965-42bc-6c54-08dc8f096dfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ndE2YXXSQELB74tKgJ322j45fsuUCS8+EgsiFBNRUZooKjwMsPaXrGcg/BbC?=
 =?us-ascii?Q?L63pRPR+SoLS6CBuy3a7YQBklYECmHAWPT3aWMh4ofXYgSmv3/QDZK1XxdZC?=
 =?us-ascii?Q?CJVaZhEoIQSqwwkEpxEpLr+tz6AR00Yait2cipLUTbklvmjXYdlv2MIqkPI2?=
 =?us-ascii?Q?TOH+cp+B+qWXXw71AmMhqVmpjAR/pye6wYx2meUzSwK0X1qHXs/0ayNPaLFS?=
 =?us-ascii?Q?mrBDkPwnhys1pFnvELWJePmu1AzX+AgJrc/AbJKQW8/czRw92dxuGbf8jCFR?=
 =?us-ascii?Q?7fKwB4MfeCmBE8yfEzwS2NvG9AHjKMfAaPHUgyrXN7iDggyva77JrArTrPIZ?=
 =?us-ascii?Q?vFdZOfFp/2sX5vjJpuLIfeNGTToCT2Krd0gJC60zRepISRVHAq0OPYQUKkR8?=
 =?us-ascii?Q?0LA1YPLnhGSL1YeX6pcZpnFk3eXTMGFypHm2X7INRt0exMW3Sw3nHz+IHMma?=
 =?us-ascii?Q?YtkwGipeMPTtUQezCCUUrbdnsmbyo9r0gesmNI/ITqPj3P8EBNkSshEec+jH?=
 =?us-ascii?Q?IoZVifb5iEd7h0Bnz3/pr5Z7/0G12EQDJRyExXIvk6oMg06lwzR4VLwt9WvA?=
 =?us-ascii?Q?frVVQADkUr1+2gSEoX4vphKFIXIinAzYq8PXbuWEtHfXro5UrAGzGszdnXtR?=
 =?us-ascii?Q?idnXVYipcmqifB8x84/RmCSpBzkXcD4uFvgyFE8+0NU75U2CGRuwhXVTBANA?=
 =?us-ascii?Q?Z0SZHHaNbwIgoymlwpJP70tcEbUaFP/CFNM+ZyxFI0WO9NCL8NkKMtSgsHct?=
 =?us-ascii?Q?wlscwatRiD6JfH5ndOZgVpU3X9DxvDVRAiGIT8e9Jw4Q9NV6c4vzBpPdjVpI?=
 =?us-ascii?Q?nIQ/XdZYfPto6NZtxk3mp6WQ6LKYk/gw8M4zPLaODTb1RGIjZhuXxSgneHZP?=
 =?us-ascii?Q?lG204xrXGK3XnnXQkw0+zJOSLV1t4l/85LfC9OpJuScaJd7nuPJxi6jhw6Sd?=
 =?us-ascii?Q?ppcfb1g9hkwoY/wRBI91n8khyXV5yN0xB+cPZM0gwa9MDUJ0qOYQVO6dHHhY?=
 =?us-ascii?Q?c+tEZ4VJ9iyhGFrybXzB+voNx0eixEXFg08VJXpC6ZooOj9IKut858KyqOt1?=
 =?us-ascii?Q?QCYYIOXp6Bg8IiX5/Hmeps8hHA/Bxdu6Pt+d996iON4+1O6vIEyS+meLJG3W?=
 =?us-ascii?Q?rV8p452ExJDA099fDnZNwtyipqAxh2gWL9InzXqzSStL0lCoWFoW9nqnv5wO?=
 =?us-ascii?Q?+LP3UkRF5nnnEiVYOI/mBWiR+5SVFIy2lw12DCstr1RX/VvHKUbAc6fzRrfx?=
 =?us-ascii?Q?wfSToPUFqsAoPY6PWrAekUhfB03R2ixG4uZI6+zyiNNvOb3R6NPueukOEZMA?=
 =?us-ascii?Q?jv5PLNJnKWmsbW9aff5bFSpZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nH9BmmcjsLIWjw7rZvQcf5q3DJxWWV7lQ2dGUk0+6Wkx2vIgsyo3eG8RRrH/?=
 =?us-ascii?Q?2E4/bPiaFGmVy12jlYILQ4Snw1Ec56cbiV+Wu1PQc/Oec69QvnWZ1Mj9+dJp?=
 =?us-ascii?Q?0BSZ9BHZqmetkI0dhMj5Wgb7K3su/fUxfBwbmBiTqd8XzId+cILWirmrIFvx?=
 =?us-ascii?Q?vhspGLDqAh4k0ovuq3Var8NynX5f3HC5SBu2/q0Zx0v9GA+YAevwsq85d4U6?=
 =?us-ascii?Q?SclAZ/zs4Td3cR4ePHSEzw3104qObkcG+f9YG00ox9EkRSmR4Zg/cV1Dhenb?=
 =?us-ascii?Q?HS87rgN6KdbPp3+YiXE+Ob2pG26tXEEQKTYR7fWFZ/sSBshTQzbUc4lpElpO?=
 =?us-ascii?Q?bZCEwY13cOVujJVdTIzucpn3NCkFKhF8Iy2V/YxNvVjZf8txCKTFJl1MPQfz?=
 =?us-ascii?Q?2rFyO/mogyZORlHxiiHA2F+LmHrhNWAkz71y8NJ5fRmfnJXnNfig1rfVFGzo?=
 =?us-ascii?Q?BdqdGkv2Or4zXImYRb4y9occM88W1snZ3nYJiVABzyXbSc60JdmZ0ihPdTzm?=
 =?us-ascii?Q?Nw91R2i9ERQUqzn3Ta1B+togFgWy3hGx2NOldytSrhrK1gpP+PJuuinINpto?=
 =?us-ascii?Q?NaH1DF7WP3YaDdPFG6A59HedwIPspbUdAY8T3uVMlE21C9KdJRwO0M85+iE1?=
 =?us-ascii?Q?OlL2aGfRmII3lnptwy8OQbGOp/5/wpuXA9cbwOvVOvoKy5IOe9gezoADmqX2?=
 =?us-ascii?Q?A6cTmWmdQSlGDMikDA6m+9fHY1GrB/mn8QDIcFFAgBBl1NGzrtNyd793eECA?=
 =?us-ascii?Q?tnXWz4+YgYn6MzjTFlEa4/haxsf8SZOaxPcbMn+z40pgy8oi1yiSSW2oECmC?=
 =?us-ascii?Q?/Aw56Pp1K0QWlpGHY4xNIk9AyT1Vw2Me50d6NnooJx3fCDdh5FV4FMvrkTZw?=
 =?us-ascii?Q?m5ox2/bZ/CK4DfprZzcMukCPbk/YTFI89JZxDaLxUzPZC/O2ifdkKmvqXoIT?=
 =?us-ascii?Q?ikI4yBvl1DPVwL8fu2X4ewoifr7oUvCXO9qWPq8F+ytEgk1Ql4sgpBz676rB?=
 =?us-ascii?Q?i050bO4jAlwsrRPLUN6QnxJLWXXNjgWy0OFxG9MNOyfqPO5kb+ztn6nCFgT6?=
 =?us-ascii?Q?Aw+y4bqg5oK5RKZK+EEb+Wai0vd+847/2hEEHIFd/SQoglatyM4Xg+un0Tx6?=
 =?us-ascii?Q?rnfpYrXZ8P1CEBCSLSDYLqxaIvTv+olp46fPXV1Zu00gXpvkopPO4siCulrB?=
 =?us-ascii?Q?WBpDSGBEpx2Y7C1e/1fkfdr4ZMA7E9pn/eyaBmFOGWRQfsWMm1YTkzxg2PFx?=
 =?us-ascii?Q?HCBIk+pyuVfAD6WxuU6GYUo2tMNH8glnBSChCgjM65nMMfSMx8Ceeebtsj48?=
 =?us-ascii?Q?e9k+c4fpXJwsFt2OFFGFEcNbzOjvvl3QtgAkD6kfPbCZrCVwgQFjk8UhPtjx?=
 =?us-ascii?Q?HjZtGGEzKzSvDytPK26NDg5MAWrRq75koYRghyX//SyOX210K2AEZhB/c6KJ?=
 =?us-ascii?Q?ieazUClGo1o9j5MhMAxG7ohPvCa9CdU99HB37NaOsroc/JVeRjC+lU+w3uNy?=
 =?us-ascii?Q?H47/PldO9o9CcoAjlAiZVY3A7WTaEOw0AijdmZL/BOtIle9zYpHPZVLF5D+2?=
 =?us-ascii?Q?kIyLnE3/2ThtTKEoxCSBdtjPw/HgEEfp2zqOZUs2vmDfrHcNLe51NvqLv3zo?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1822cc-2965-42bc-6c54-08dc8f096dfd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 20:09:44.4800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyp/MlV991nfjn9vCqvm1KxCDei+KlX9tG6Wu2X7oK6bWH5K8OXSLJj15zU66cFs3tcFD3swSzgh80w3CrYHUcIhwKRqUmh3S0gzP1+alMo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

On Mon, Jun 17, 2024 at 12:09:26PM GMT, Matt Roper wrote:
>On Mon, Jun 17, 2024 at 11:25:15AM -0700, Lucas De Marchi wrote:
>> Some workarounds started to depend in different set of conditions where
>> the action should be applied if any of them match. See e.g.
>> commit 24d0d98af1c3 ("drm/xe/xe2lpm: Fixup Wa_14020756599"). Add
>> XE_RTP_MATCH_OR that allows to implement a logical OR for the rules.
>> Normal precedence applies:
>>
>> 	r1, r2, OR, r3
>>
>> means
>>
>> 	(r1 AND r2) OR r3
>>
>> The check is shortcut as soon as a set of conditions match.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_rtp_test.c | 54 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_rtp.c            | 20 +++++++++-
>>  drivers/gpu/drm/xe/xe_rtp.h            | 21 ++++++++++
>>  drivers/gpu/drm/xe/xe_rtp_types.h      |  1 +
>>  4 files changed, 94 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_test.c b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> index 474a0b222ce1..bf7fee9b20cc 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_test.c
>> @@ -90,6 +90,60 @@ static const struct rtp_test_case cases[] = {
>>  			{}
>>  		},
>>  	},
>> +	{
>> +		.name = "match-or-first",
>> +		.expected_reg = REGULAR_REG1,
>> +		.expected_set_bits = REG_BIT(0),
>> +		.expected_clr_bits = REG_BIT(0),
>> +		.expected_count = 1,
>> +		.entries = (const struct xe_rtp_entry_sr[]) {
>> +			{ XE_RTP_NAME("first"),
>> +			  XE_RTP_RULES(FUNC(match_yes), OR, FUNC(match_no)),
>> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +			},
>> +			{}
>> +		},
>> +	},
>> +	{
>> +		.name = "match-or-last",
>> +		.expected_reg = REGULAR_REG1,
>> +		.expected_set_bits = REG_BIT(0),
>> +		.expected_clr_bits = REG_BIT(0),
>> +		.expected_count = 1,
>> +		.entries = (const struct xe_rtp_entry_sr[]) {
>> +			{ XE_RTP_NAME("last"),
>> +			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_yes)),
>> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +			},
>> +			{}
>> +		},
>> +	},
>> +	{
>> +		.name = "match-or-empty",
>> +		.expected_reg = REGULAR_REG1,
>> +		.expected_set_bits = REG_BIT(0),
>> +		.expected_clr_bits = REG_BIT(0),
>> +		.expected_count = 1,
>> +		.entries = (const struct xe_rtp_entry_sr[]) {
>> +			{ XE_RTP_NAME("empty-matches-ok"),
>> +			  XE_RTP_RULES(OR, FUNC(match_no)),
>> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +			},
>> +			{}
>> +		},
>> +	},
>
>Is this a case we actually want to support?  See note farther down.

I just didn't want to add the check in the code as I thought it was not
worth it. So I decided to "document" the corner case as intended.

>
>> +	{
>> +		.name = "match-or-none",
>> +		.expected_reg = REGULAR_REG1,
>> +		.expected_count = 0,
>> +		.entries = (const struct xe_rtp_entry_sr[]) {
>> +			{ XE_RTP_NAME("none"),
>> +			  XE_RTP_RULES(FUNC(match_no), OR, FUNC(match_no)),
>> +			  XE_RTP_ACTIONS(SET(REGULAR_REG1, REG_BIT(0)))
>> +			},
>> +			{}
>> +		},
>> +	},
>>  	{
>>  		.name = "no-match-no-add-multiple-rules",
>>  		.expected_reg = REGULAR_REG1,
>> diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>> index eff1c9c2f5cc..66ca58fa5739 100644
>> --- a/drivers/gpu/drm/xe/xe_rtp.c
>> +++ b/drivers/gpu/drm/xe/xe_rtp.c
>> @@ -40,6 +40,13 @@ static bool rule_matches(const struct xe_device *xe,
>>
>>  	for (r = rules, i = 0; i < n_rules; r = &rules[++i]) {
>>  		switch (r->match_type) {
>> +		case XE_RTP_MATCH_OR:
>> +			/*
>> +			 * This is only reached if a complete set of required
>> +			 * rules passed, so return success: the remaining rules
>> +			 * do not matter
>> +			 */
>> +			return true;
>
>Would it be worth adding an xe_assert here to make sure OR isn't the
>first/last rule in the list?  I can see someone deleting a workaround
>condition that's no longer relevant and accidentally leaving a dangling
>OR, leading to an unintentional "always pass" condition.

yeah... it doesn't seems good and I can't see why it would ever be
correct to have and empty side. There is at least 1 more corner case:

	FUNC(foo), OR, OR, FUNC(bar)

maybe instead of checking first/last, check a counter with the number of
rules processed != OR.

>
>Up to you whether this is something we want to deal with or not.  Either
>way,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


I will think about it and respin if needed. Thanks

Lucas De Marchi
