Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5708CC83F03
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 22:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E8310E08A;
	Wed,  2 Jul 2025 22:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqSz27Nx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272F710E08A
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 22:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751494997; x=1783030997;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VYobDNH9YQJtj6ZNwvDJLy/cHwSusYRGNgA5EnQdwvA=;
 b=KqSz27NxDHeWbi5eXzE9wnWWmYoXo5TdUjBO4QfPUkMOdDIpZrzML9hC
 DwXbROjL/PlIcCiG/8yurwKB+rPLzmWgZTOfuZz86AMbZ2BdVJTuGrV3a
 ugoIhkJmvVAxRrVkWGmXIgl6kw/YkWMJ7CnNgtO2nKr6OGma5/nLfTN11
 rq0ijk5KbQG5dNTlCWpKoL9uCElBiNYZbfqzMlGs6bfrXloamN5/+dLEZ
 DH8W86UG/lrq7BQx89qyhzXKIRbgk1Ia07SSyk3s4VqgXj+CT5CrJ067a
 uuf7lSjLvGKFRNphjEXpjSID1LVBMHqj6jGRCNhJWEYFeKyG3Is2QWqit g==;
X-CSE-ConnectionGUID: bgjtePHfTbWfCJyQAq7+rg==
X-CSE-MsgGUID: TugHN7B/TPeLHoADA2LNCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="65156428"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="65156428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:23:17 -0700
X-CSE-ConnectionGUID: 2GUtEbI8SWW0nR6jDEvDbg==
X-CSE-MsgGUID: 6ta7iWoYSz20qL8BSgtlFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154757988"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 15:23:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:23:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 15:23:16 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 15:23:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=An6Xx7eWfVXYZat4B5Eek0DN25lVWAns0qYtRPNpsfLH9PIsSriY1E7ldUTe8jEtXY3oNCSZmNA92m0kTaacCPlXvAy+VZARihyTcSwLaH08p07pfHkTDC4nBboFLoezftgBMreBlK8oQs9T300KxEjTGzteiUzthOnfqjdIG1xqEaC8l/9CtqJqlTEW0DSfF965fZqXbAa2fjwhTcsDaBvxFqEGlFjhmZbG+101T+BD6zDevv59SmjNS1McbVs4Sh5cKojFZlD3vKI3dD49epKoCnstuq/iUIpROn/robSC1/sSh6OmwundsZBMXFas8HiK0wvUY3Yac8Squ8Bz0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmstEH39QuXqG3UZWgQJRLl08UGgvX4Rw1/dGQj8tEY=;
 b=UaNHgp2q87qMK85g6UCQug4+VY7JQSMzDRaMl19K29euyzIZOQaA8T2dYeAY8ZrtOUEtS6iEa+a7JH4F5wq4rsQia2zkdxhRf+w6XXLJLG2GSgoGHJZcxuwbKAfEW88DBGAgOksLP9aQPHyWQUmW+8UNobsVPWA71Kpi84t2RSzYS5aV3NgONInEr2eOUCRMoVzJ3fwUjLQtRqoC+fXkEZgujUD15pTkKoDwt66xgbwZJptdclzklVlZ958eRvUYoFcGUFiJcH374WEJPPnbSsfDQJt6GkGFu2M98Z0j+OCzL5tEJo5CRcdA9Wj8mhFP8Nu/E1ev/CblorsO9T8ziQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 22:23:06 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Wed, 2 Jul 2025
 22:23:06 +0000
Date: Wed, 2 Jul 2025 17:23:03 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Atwood <matthew.s.atwood@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v5 1/6] drm/xe: add xe_device_wa infrastructure
Message-ID: <jivjtyt3j2mxmwvbnrdvvz4d366tqffuv2jh27wtlptfnyhopv@xbyjg2lr53xk>
References: <20250702193036.1417416-1-matthew.s.atwood@intel.com>
 <20250702193036.1417416-2-matthew.s.atwood@intel.com>
 <svdso2kdn3bgu5gu43lbwj7bnzqd6hsbqzmbxpuydvqocvwjan@pj4pyj36kir4>
 <aGWuD5F4Vqmj7MJc@msatwood-mobl>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aGWuD5F4Vqmj7MJc@msatwood-mobl>
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: fc13a27a-2cc5-488b-d4dc-08ddb9b70491
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GP3dIXEOTxOt1Ni4VLUNTkyZc713ad/1JRA6PZPDIJ/CkcOEWveiO915vUzX?=
 =?us-ascii?Q?WFlz0zYLCXPNW+iU5mEGnNvquuQMhFzJHBjJhsmfBmU+fnykbQvLdUH5S8cX?=
 =?us-ascii?Q?FgZmKbh/no+WuEHLiDkTEVQHJhPIvzdDKxIAmYqEoQojS+ILE7sXW4b2QUam?=
 =?us-ascii?Q?CNy28nCvouwg92tYXOjBF7jDPBtVvrclP18H+X2+aq+zXLaCPJKqNRqKcqab?=
 =?us-ascii?Q?ysgCiLA29elyF0Uv8TmoaLBXzAyGhq6PTzf3sf9T39hLgBl76XaxInoTLLfO?=
 =?us-ascii?Q?7Pd+d0eHTqSUnlTq97VMCY1cMIgzydBgBB1P3i5qS6vTIrku7g7HilG9KLxG?=
 =?us-ascii?Q?cZ9m2wz7ehXMZ9r51yoHFqsEvVAhohDrmnbzEVKhmouYWSZUA+1QCFAvzVAa?=
 =?us-ascii?Q?yAWcJlUZEvuLtrSbelv66svzyqGVXGTOdAX/2C2IA51/KRaczfhZMpG4Vc6b?=
 =?us-ascii?Q?hXj/cR2ReVshoe6eZjdNMlT/4Jp9u6MC3cCjP2WfybVy4gCflcq+NsQLQjbN?=
 =?us-ascii?Q?PtlXbCttD9sn4dcNlhCLKsV7Vt6/LxyinUdWJF3+/ef/byNc4nwRgTcdG+o6?=
 =?us-ascii?Q?ViGWcyBwqVr0LlgCl8+rOVeL2b00udTGD+iPhQ1eHgdKXB9QF8+eOpM0CnDA?=
 =?us-ascii?Q?tX5sk/hqCAcvrDDmh9FvZseIwEmWp7dEhdzNpw8yuDDcovi9G8FSO6sWwm5j?=
 =?us-ascii?Q?QzHWgDtmkkQbAKGTHhL3tCp5Tdnc8AxHuoE9j1W+iGTMK4ybWfkLVb8K0Hw3?=
 =?us-ascii?Q?GNtdKp0RMm0spDDcO2S8C0mROJ/IOJJ6GyKzkrOXO1ReWRLbp4Bokwv3Gcu9?=
 =?us-ascii?Q?8vLlrxYUfymNzKigxEjbi3kE0rtqTIG74oGFWpLgZK9n+elUItwO8hUlagRZ?=
 =?us-ascii?Q?hIu+5Hgb+3ct1t6g7Q0DpCYGUAHwmv5j7O+f5EOnqj3moCJItvEaESwk51LS?=
 =?us-ascii?Q?w3j4eyuhjOJKTNUGXAo+bnYrQmrJywoN/3Ehfiwo9iSBXBwZWl7lZEXJPpQ9?=
 =?us-ascii?Q?gSmyBv6oCBdTUqc/UkGWn3J/h/EF51X5wMnEmnmO/PypizOmaqAiomOg/jIP?=
 =?us-ascii?Q?r8MXEHQkx1UIKauEo4bT0DFo1N9ZCCATScSQH8S97W2f28e0TkwHGOdQtRPj?=
 =?us-ascii?Q?sN42xAz/k0dLW8jpKXApqi730xBydpiq6hy/I9odcx3W6NOtYchx7LPdqQSV?=
 =?us-ascii?Q?0X3jsQCaU73c4vUNFQuFO8lefjihG/MWiDQCv55Vfp/kAnxJFD631etJV8BN?=
 =?us-ascii?Q?Di9vV0Qc5nqCm3pU1J2jJgYbuGAbyXLgAGg8aXJ0x+g72FAfO8mi7P+tqvBH?=
 =?us-ascii?Q?ibMdgj3bDGB/8I/8zn5zHRuw/xLKi+Bf+DQsM8LxjbnepfQYWLLgyVNiBmAe?=
 =?us-ascii?Q?qGpRAi051dipt9YYSS5JZShHGnbAH7vyeOV/py/O2GW8QUn/A5GP5n7IpcIb?=
 =?us-ascii?Q?6yBeDcTRyAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7bdBYluRGLMNUWHLy7KEIgM5mvCfw/KQcel8uaMIKV4ROuxk+sWDT+mH7eQa?=
 =?us-ascii?Q?xrXEjW1F0hWwZnMrbNE0G6OVctOuswCJLNtXTWoLakilkViCMA2vRmB4WycA?=
 =?us-ascii?Q?xabMjYOfOFjb82qjPZWuJb1mXgkY27uhVN54u9Ayc0JqkRdnf6nP+qkHKUiU?=
 =?us-ascii?Q?nZldxkXRfqrIdIVg4lTG3Zt2eRRqRh0c8825C7LaOXXv+Zv7cB/chsNAOIdE?=
 =?us-ascii?Q?eOu6vWaL2uGKjLXMDfe07OZpn3Ih2k7vURmWdtHas1NqAVTOyasJDtGsqmRt?=
 =?us-ascii?Q?Wd4oRX3ol+I0zkNqI1wVDdBq7mqVoVuo/K1YRq68843io7O0L2Bpfb4m6YFr?=
 =?us-ascii?Q?Wv2DStrW2HwF23vwYElbcrr4YAbUDrwY7jnIHqE1KQNOlTC418wLmrh8WUQt?=
 =?us-ascii?Q?XltNs73bvIhrADNIXEP1AyH5gDH7ZpCs+fA7AXTGQR79JhWgK6sVoeFxmyc1?=
 =?us-ascii?Q?tc7SBTJtlo2zkrO8xe5nRjKkUQCs4Z4+HIw+q7I9mlR+vrfXLjhc7wZTdFW7?=
 =?us-ascii?Q?tqakrhU6noCF0U4NhrvV1ueunZrFCa2rZaYzJ5BERawctxiFGcDqlH9QFqbu?=
 =?us-ascii?Q?rZm+JczU0HugSGNmpMNUVxktAs2F7DvxxJpYrnU0sfLyISYJ7SLNe5yUQrRR?=
 =?us-ascii?Q?QvjSjacfH6C1UtY/DWR264FsNnK2XXwoHX5YDrQwTOdJ019F9tZuBd5y9ZC1?=
 =?us-ascii?Q?dWggxBQlevu/pPqHw8YJqGPBfu+4J4UMII0ZRRSD4eS12pZJw0zX4U6YuX/P?=
 =?us-ascii?Q?91bxGefT37Ftl98a6FX7Y20tHdscGpBNZrG3lJx7ijj3OjWxFMzizhGbgHUX?=
 =?us-ascii?Q?Xm1Z+UnIl7J/XO9jiw2dePuxxbIBNoZQlRDBWl8C2k6toUqIdoqbh5r85yKv?=
 =?us-ascii?Q?d6US8CBHDAZ45D/LEKFPBV90N9yXvBj45CfqPFTWHMNNRlVM2Vn5apvmLL+p?=
 =?us-ascii?Q?dzHPU4/9cjpfLOE/NJdb7ySYZaBrRDmrinOm5RcGXQRpyHtQ0MZqilnnU6w5?=
 =?us-ascii?Q?tJhy58FMKBCgBwXd4904a2VJPUAylAYvQYAXV/NRf9KVXr7/ibohPEh7JQbx?=
 =?us-ascii?Q?DksAVuYQy/k7/5HDOplLYfLTx1giJSiR86i3wuClm9YgPhmniRY2jZuAbx/l?=
 =?us-ascii?Q?l1pcSWk+AUiZGNO96ltjzQTNlyt6C/m7ax2omy98jOkg2eDCytI6BNnkvS40?=
 =?us-ascii?Q?TnrhNrIWQdhNoXpuDmzLf7Ra1nzc0pW3nSz9r3tuMn48qWSjeWTytTIGKAzS?=
 =?us-ascii?Q?+CTVmY4Td2zXWHQEDGR2wtMGEseTefVEK2H88XtopncmXUTsqBWDGtZdvQUF?=
 =?us-ascii?Q?1y7pzm3wkOmMxTlH4zyrzNRvTepGH6W28R/AwDYVHF61ggpWtf40rnRtyFp4?=
 =?us-ascii?Q?2fpiDDAjAkFj5TkO7Mm1/b2VuJg53VwR5WS0HDUaevfAfAPkdD9Ez+iGZ2x9?=
 =?us-ascii?Q?SOSLMbJm5CaYAXLjOPc6EwGXVLfGN5WBxssFNoBSwZWXkpniRY1TCwKkV7BI?=
 =?us-ascii?Q?jUeFJL1qtMg/q6mjd6jYO3WWSMzuH5XVW9w6IhycYWyd28tzc8bolEUfuPH/?=
 =?us-ascii?Q?mwNZwUI3pvORwNYjjI4f/nMfFkDtmhVfvvozrI2DmvqrBXJEYBWEP23KSyYW?=
 =?us-ascii?Q?1Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc13a27a-2cc5-488b-d4dc-08ddb9b70491
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 22:23:06.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lisN+IpIRvMWAUio1BmHEmrSjg4Gb81pakHFZTtddwWJLyQilLRj4Kxmy6AVfLrkzGcURTIAu9vqDG8Dw63yFP8vDx64AE2CvpBUgln/tuA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
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

On Wed, Jul 02, 2025 at 03:09:19PM -0700, Matt Atwood wrote:
>On Wed, Jul 02, 2025 at 04:57:34PM -0500, Lucas De Marchi wrote:
>> On Wed, Jul 02, 2025 at 12:30:31PM -0700, Matt Atwood wrote:
>> > There are some workarounds that must be applied before gt init,
>> > wa_150154044425 for example. Instead of sprinkling them conditionally
>> > throughout the driver as we did for i915 generate an oob.rules file
>> > reusing the RTP infrastructure to make these easier to track.
>> >
>> > v2: rename xe_soc_wa to xe_device_wa
>> > v5: derive prefix from argument rather then hard coding the values.
>> >
>> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/Makefile               | 11 ++++++-
>> > drivers/gpu/drm/xe/xe_device_wa_oob.rules |  0
>> > drivers/gpu/drm/xe/xe_gen_wa_oob.c        | 38 ++++++++++++++++++-----
>> > 3 files changed, 41 insertions(+), 8 deletions(-)
>> > create mode 100644 drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> >
>> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> > index 1d97e5b63f4e..48d4aa9d4ecc 100644
>> > --- a/drivers/gpu/drm/xe/Makefile
>> > +++ b/drivers/gpu/drm/xe/Makefile
>> > @@ -21,6 +21,15 @@ $(obj)/generated/%_wa_oob.c $(obj)/generated/%_wa_oob.h: $(obj)/xe_gen_wa_oob \
>> > 		 $(src)/xe_wa_oob.rules
>> > 	$(call cmd,wa_oob)
>> >
>> > +generated_device_oob := $(obj)/generated/xe_device_wa_oob.c $(obj)/generated/xe_device_wa_oob.h
>> > +quiet_cmd_device_wa_oob = GEN     $(notdir $(generated_device_oob))
>> > +      cmd_device_wa_oob = mkdir -p $(@D); $^ $(generated_device_oob)
>> > +$(obj)/generated/%_device_wa_oob.c $(obj)/generated/%_device_wa_oob.h: $(obj)/xe_gen_wa_oob \
>> > +		 $(src)/xe_device_wa_oob.rules
>> > +	$(call cmd,device_wa_oob)
>> > +
>> > +
>> > +
>>
>> drop these several newlines.
>Ack
>>
>> > # Please keep these build lists sorted!
>> >
>> > # core driver code
>> > @@ -340,4 +349,4 @@ $(obj)/%.hdrtest: $(src)/%.h FORCE
>> > 	$(call if_changed_dep,hdrtest)
>> >
>> > uses_generated_oob := $(addprefix $(obj)/, $(xe-y))
>> > -$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h
>> > +$(uses_generated_oob): $(obj)/generated/xe_wa_oob.h $(obj)/generated/xe_device_wa_oob.h
>> > diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>> > new file mode 100644
>> > index 000000000000..e69de29bb2d1
>> > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > index ed9183599e31..341840926f60 100644
>> > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>> > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
>>
>> All the changes in this files should be a prep commit: they can be done
>> regardless of having device_wa_oob
>So split out the make file change in addition? or move the makefile
>changes to the following commit?

the change in the Makefile is only for adding the device_wa, so should
be in the second commit.

>> did you find any issue with strlcpy? I think it's available on all
>> toolchains, but maybe we need the workaround by including tools/include/linux/string.h
>> I tried the diff above locally and it worked for me though.
>strlcpy isnt currently supported in the distribution recommended for

did you check tools/include/linux/string.h I mentioned? How does perf
use it since forever and it moved to a common location in 2015? yes, it
may be that we will need to link string.o to get the weak symbol it
defines.

commit ce99091730c92bf560712baa0696ea5a461b1fe8
Refs: v4.4-rc5-165-gce99091730c92
Author:     Josh Poimboeuf <jpoimboe@kernel.org>
AuthorDate: Tue Dec 15 09:39:33 2015 -0600
Commit:     Arnaldo Carvalho de Melo <acme@redhat.com>
CommitDate: Wed Dec 16 16:09:39 2015 -0300

     perf tools: Move strlcpy() from perf to tools/lib/string.c

Lucas De Marchi
