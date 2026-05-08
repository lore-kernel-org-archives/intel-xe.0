Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C79BCD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 20:31:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DA310F5D8;
	Fri,  8 May 2026 20:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jps8o9zy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2496910F5D8
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 20:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778272265; x=1809808265;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=FfIUBSL3yLqgJA4BTjaBALIRBlO6uIrbkZh5S7wc+1Y=;
 b=jps8o9zyrFipkw2n2LlOpO8tFrJ1uE0+0I5ERA+BdBa+OCuGHVGGMIr2
 ha01gPpLZ3uv5+dvc0+7+czY7UBFg5kAsNl0NjrkUGvllMYRAgf2zP5DA
 ElTp9QtKlMuUx6WfHtnloZtdLezQ5diMp8pOEMM0VqtsfsXB4BEyS0NOo
 ccSinowoBKFyD0Ze+XvC/+ial5rrWDi4tYDC8AFLAwcbW+qa1CtoQZSEK
 IfhUPiXmgo9llACMKKpWbkQzZPAu/CqKivDUiQGGA4wYYqaaBvCGvk3xF
 NhpeglEXhd9+FKEMIHcrZt1lNBt1AoTseYLtvGrURxPbdyN1Afu17Umly A==;
X-CSE-ConnectionGUID: z05+1ql+Q1KlQYL4zX3AJA==
X-CSE-MsgGUID: DH9XFH7TQuiZ8AxgP3+x3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="79107396"
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="79107396"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 13:31:04 -0700
X-CSE-ConnectionGUID: Zv5qiI/yRRSfirN+wIBSqg==
X-CSE-MsgGUID: e9woaqp0Sz+tuUmDQQaFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,224,1770624000"; d="scan'208";a="232355201"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 13:31:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 13:31:04 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 13:31:04 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 13:31:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D+5dLbze5vriCJSziGsndfzLFQeQiQnNw9NWFbt+602IakRfc9KiDXjhlHdom/wDGwZbo2jm+2IQcJ1ski5xlw2h7QPJyNciZXmcJcSP6nuBtN1qVpifSY3Rt03LlcqRlpO7U4AM/lT4vESanYZiEgDbzJcygY5tqY9wTZd6HP+vxYjLukHTkjWsi6XWFMzwihDzxZiRKMdP3zHj4Kgy+73sjILZLFNCbnMuWurqND9Oq8NtTjEEOwCBUmQjDD//EXrmyFpZo+p02JpVEeBdP5eYimb1BUjAfpEMNTZbZFnoNJ3FQd7zU/RVV4DvcWc0dfRRw3hUkPXgx4+KxBC66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/gnN35mImB8bFXXIXuIdcl+BeDclaoU6pEOYGOfFAT4=;
 b=cKgRAqMOPyFyi5JuCPiQYfqNXxZRUqC3+uHcBMrEFdxJr0m+jUXxLzkSAGa9BQ0osOnJ6OJMrDH6ss1LPtqk3JZXHP1gfs1dt1BI3zA9gMn1vrzfTRdmla3op5gCWCQiOfEbWpZXuLNtwq0LR1TnHI8Lq6DUuOqVtht1dE8OBF7CC/G12UCsSfWtOwufiWFV4085Hk4qyO8wP0qedFrMbzXQeOoulbSzpRO8HQsAjK5aJBpfytazVtugxNWtkeBJUZMdZeLqM0VOgjjekOrheFPjIRvtk4BFPDgwtDc991t8MqyG4KVvfFe3qY4G6W/pt+kN2PtoK5LYcPwbYiVTCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 20:30:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%4]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 20:30:57 +0000
Date: Fri, 8 May 2026 13:30:55 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1?= =?utf-8?Q?re?= for
 Support run ticks for multi-queue use case (rev5)
Message-ID: <af5H/xUDNxXML8+s@soc-5CG1426VCC.clients.intel.com>
References: <20260507162016.3888309-13-umesh.nerlige.ramappa@intel.com>
 <177820923342.50384.9295520146602172162@5ab824fced77>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <177820923342.50384.9295520146602172162@5ab824fced77>
X-ClientProxiedBy: MW4PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:303:6b::35) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c1caf1-a704-4051-d469-08dead40b59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: in/KbdDzhzkApSd6izinGHXRObQVHqOl9aUuwZXsk3GuHx8KGo/SvJtRv9IqdUTCslzGuIU906XC5G2gXTmi2LufZcpld3NGMdrerS8N2UHSlw0/vzpoy7DNTLxsdDvQHYXlF6qPv5FHm5TjbATzDkEabnLQZMlX3iZlpoN53GdI4fQkcS53xBDEtnTYOVeibxiC6hZZlEx20JVK5LjdPOCCBOqQzLvmLWr0uLmiF+Dnj0lhGkCxKX1Xss8sWqARj5tOofuGmtROi9nWe1XEy6tOU1AtzcNTyPh0lKwiuBCiVM6dbkyZVl4SKxVweWEkslvLmpxLxgKANRzBtFqY0BNBs/2toivqPfMPfxKVIPpbFIYY+Y41TNXkCPWXFt2ICNLwASlBFZn9TGFymO7nhRAyuPVlCFS811ZIAdEDrFcva1ln5jDATFvWj9cDnxS8ZE4Ia96woH4d3GIrcwGvw3VBib3REf1aN7PrjDW8hoWP5Lho/Kcu15I3826oiKji+pmHue09t3L3kctasPsCCDh8rQ7UVer/qYYcpixDtPFy1O+cR4lAoTmpPmHeBWayxDkmj8kMts3tYWz9FxU3uBA2Gq0FTjcPlvYnrQ9jGSqpblpCgvkURnnVzLmz6E37Jzu1kdc7HpNqXNe6JncV7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVMyaitIVzBiOS9ITC9HaFR6Y3RFZkxDekpneWI3dUV3aDFXUkFycWIvTlVQ?=
 =?utf-8?B?N3VrMTZ1NDRtWHM3c1plNnFwcnFmWms0N29rdW5wd1ZYMEN2WHhJN2dvUzY0?=
 =?utf-8?B?MTVWUmdQTUgrdWFzR1h3NlZGNFRZM0pjTmR5QW5Hd2sxUGxmaEdXaHFOZjl5?=
 =?utf-8?B?cm15L3d2ckxTNUFIK21SL2ZVYWxzR01EMXZNMjV5bkNqYnVmbTg1cWlkdWVU?=
 =?utf-8?B?VDREa1VialU0VGplUllLbGdoYW1XcHY1cVUvbE9WNkY1bVNHbTgvNzJjckR2?=
 =?utf-8?B?T1A2NkZLRnFILzNEYzJmMDY0TjMxTDMwZlRwR3EwVEx1azBEVE1iKzFOL2RC?=
 =?utf-8?B?RHplOG1hbzE2dXl6TjdzVnBaSTB1aVZqRVVZUjY1Y2hMSXpvYk1VTDh6L2hi?=
 =?utf-8?B?TER1cUxWVE1hZ0IzZkluVXZZS29VUmdnWUdTbDFEVjloSUlXOFEzdmRuTURv?=
 =?utf-8?B?cTBVSUdtdTZmRFVKRjJBV1RZa082Y0hWM3dkbUt3QjNTT3V1SVpDeVZJS05s?=
 =?utf-8?B?RXErSWpwZmoyK2hmOUt1MTVnMkdjUWVHajVHSUNmMTl0YVdGUjRVWXdSSjI5?=
 =?utf-8?B?dk9QMHNMQ2VsU08vMlN4aTNqSFVzNno4akEzOEZxRXZJUnExNks4SVZZTHl0?=
 =?utf-8?B?VVRpZXJQb0tjZ25KZGpPWXJYMG00WWZFaU8vMTRUaHd6L0lEV1lPVnd3Ulhv?=
 =?utf-8?B?UiswaWo3M2owNGlsQ1BaeTJNMzdQUFVGeDk0Um5oZ0EwSmEvbnVnRGdzR0FU?=
 =?utf-8?B?WS9aSEpOaTIwOUswSVgvY2VwYzQ2SDVCUlpJRE5mUUd4cFR4UlNFR3psQkUz?=
 =?utf-8?B?ZFJRa1R4blBBbnF3VWs3M3dBR004NnFzYkFXMTRzaW95U1FxK3A3dXJ3TVVJ?=
 =?utf-8?B?ZFJ3SkpUZnREYlkvbWpnOFliMkZoSCtoWXBLUitqZ1JVK3RtOU14QnYxcXgw?=
 =?utf-8?B?Tk1PUWpnb0prVWVEUFJhaEhIOFhBY0R3aUFIcHZxcGtUNDdiQTNEam1ZQUk1?=
 =?utf-8?B?MWFZVnAxZDdrSnNVM2NZbXZwUVZvWW1icm9QS2lWbkNmZUEyR0d3VjhqckNV?=
 =?utf-8?B?TUlvUEg3YU1EYm81RDhYZlU2K2FQUlZEZkJxVWJyOG8xbWMxN243SU03V3N1?=
 =?utf-8?B?RytoSEZYSFRyd2Fob1VBOTBEQXI1bWV2cVd1TTJ5bitFbnNkTlNFc1llaWdz?=
 =?utf-8?B?NFo1MUxzNWNuVDgzYkFtTk5JVzlPbkhuQjRSOE82c2R4ZzNqWHhzTmk0U0lB?=
 =?utf-8?B?Rk5GVmduTkFWbTZ1VS9LTlU4REluWDVHVWZWVHpyTXY1WjJudUxqaG1PT1g2?=
 =?utf-8?B?enc5YlRwV09PTkg3ak56cDhDVG9BM2hLQzU1YitQSWN0SWxacDNhSDU2ZGp4?=
 =?utf-8?B?T1ZWQmJ5TDBMMzhTcCtUTXJEQUhpZEs0UENqbDVBYnIrUWJzY1FQc1lIb3Nk?=
 =?utf-8?B?WjQwUkxnS3c4bGlPT255MFVZY0o5VnIwdlVobGEvcjFsMCtDcVY0YlRjTmEx?=
 =?utf-8?B?b1doYzhEeTRlWk82WFlNT1NTL0JoS2dxUVc1MUFtUUlmOTlKdjRUMGdxOVlT?=
 =?utf-8?B?Y3hMODN0U082K0xXbm82ZWEzTmhibktWa0wxc2VtWkREZEovczhJcjVsL3ly?=
 =?utf-8?B?aTA2MGl2cm0xVEpVYXRVTElLd2RiK2NIUXRaSUpnTnFmRDZBc0kyQWN4dWdP?=
 =?utf-8?B?TXVubUhKRVhJOWJ4TVdnL1lnWlJ0aGxEMFU0OVlKaHBvWW1KOTJNWU0wRWxG?=
 =?utf-8?B?eDBhbTdEVkJwdXJaYnVHZW82L2w2WEZZWHJiREVSOEFyZzFoQnhaSXpjWHlR?=
 =?utf-8?B?L09ibWVSL2cwaFBOT05yam5iYStYanpQSnlKME9QYzA5Z0pPQVdzMnViaFJx?=
 =?utf-8?B?RzNJQzVLSzI4ZTZ2bGdDdFV1dDB5Nm8zQi9weU5oanYwVThrSE1zQWFheitw?=
 =?utf-8?B?bkJpYm1JMStWMEwvYy93Mkh4Z29LTEN0M1FvYmZKWFk4NkhMSWVoeUJubURz?=
 =?utf-8?B?UHlVcFJQT1J1bnNBbys2bnBVakZZRCtkZDdCUEVJSUpzYWtCNWVjTUZBNWI1?=
 =?utf-8?B?UWJwckpON1BrUFhib1hoV2RCeHVjd0hLbXE2SnU2L0luaVBNNy94YzlQOHI4?=
 =?utf-8?B?TzloUzZXWkV4Y04rS0NaTWo1TFJQZUJscWM0YWVXTld6ZkdQSlhjWlhsTEwy?=
 =?utf-8?B?bHdHRnRwWG5JcDVRcm9iNHJDaW4rWVVVSDF5VDFtVzZSMkJrNHVzZUFUVUdo?=
 =?utf-8?B?bW9US0VUMGMyS2htdlM5aHFvTnIzaE5BNDN6d2oxVnVpaVo1MnFidUtxL1lK?=
 =?utf-8?B?UDkxRjJzblJRNVFVNldRQjFpMHUwM09wLzB3UGxvd0t0eENiVUNmREZYRjM0?=
 =?utf-8?Q?iq/hHw7OwAdE4xWo=3D?=
X-Exchange-RoutingPolicyChecked: ikFYrO/6JB8SQs0nbUNI4zJAC5++vWFARaTbSK6zr7UoPYZoRejYGymeoMbRB4PG6/fR4U4nw+P7nvKT5zxW4cgL5wYPhB4AfOBqf0mSyASZ0zoD5Mpa7rhNfjh5SdU+8AB6btGX1h4FWMrjNPLOuDaaOzgYlBb/YQUp2RzEPN9rBzJvIgqBeYDcDQfj+fv+iXU8UtKcmX0wXmBQPzbZSZJUlJVEC1qor72Epw0uHmZ/nZoq8J6R24J1bTAWt6dot/kBxS55JzCygwi35cfCeBo8U6XcclkWDIJO3TIM+bNFikVQ1x/aVNfGPnTTF2vjA8w/EOCRXavjlx0padr1Vg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c1caf1-a704-4051-d469-08dead40b59f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 20:30:57.1383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1MdQcPyk1IeAaaCuMCkqv5yKWH80Mf6DE9Og1L3Toi7Wu8l+NjaWpGC+YCEwpviskIsDzE/QM8P314bQPTdCIJe1Px1KJqx0pR+zjG1adE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
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

On Fri, May 08, 2026 at 03:00:33AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  Support run ticks for multi-queue use case (rev5)                   
>   URL:     https://patchwork.freedesktop.org/series/164654/                    
>   State:   failure                                                             
>   Details: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164654v5/index.html 
>
>CI Bug Log - changes from xe-5014-7b68adb8e6366263ebebbc100fc0828a163e4005_FULL
>                             -> xe-pw-164654v5_FULL
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with xe-pw-164654v5_FULL absolutely need to
>   be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in xe-pw-164654v5_FULL, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>Participating hosts (2 -> 2)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   xe-pw-164654v5_FULL:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@kms_fbcon_fbt@psr-suspend:
>
>          * shard-lnl: PASS -> FAIL

Failure is similar to this instance, so not something new but fails 
randomly even without this series
https://intel-gfx-ci.01.org/tree/intel-xe/xe-5018-36eddf6e5c9411ad95c4939b092ed1ea77f13d61/shard-lnl-4/igt@kms_fbcon_fbt@psr-suspend.html


>     * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
>
>          * shard-bmg: PASS -> FAIL

This test ran fine on v4 series of this patch, so it's not related to 
this series. Also below tests exercise the TDR path and pass locally on 
my setup:

xe_exec_reset@cancel-timeslice-preempt (takes 10 seconds to pass)
xe_exec_reset@cancel-timeslice-many-preempt (takes 20 seconds to pass)

>     * igt@xe_exec_system_allocator@process-many-large-execqueues-new:
>
>          * shard-bmg: NOTRUN -> ABORT
>          * shard-lnl: PASS -> ABORT

This one is failing in other instances of CI runs as well, so not 
related to this series

Umesh
>
>Known issues
>
