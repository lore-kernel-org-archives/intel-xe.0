Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ECFE7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 16:56:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C3410F0A3;
	Fri, 13 Dec 2024 16:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M/CeVxva";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCC610F0A3
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734109015; x=1765645015;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ND0JN3VdrK/T4wy01gT684tvXcbjlVqHkt52Ux2tnKI=;
 b=M/CeVxvawBguIdaLzSBRwShW2jRYeI5yY0nofxMc+YXX7J8RLY7g7I75
 h0QOeP6Cqo1eB2LZ9Onaw5cgJ8TGdhSLREiGoAioxPGJkwvAYlqpUgWC4
 f/8k0q32/LjBCPPdD8d61VxdMWsyBlhks68NyUjdQ9FS2YqOf05dh09FO
 i+1nGqWU93iUExrgfYH4NFJLGP5Zk6fEWu7MbR/+yB3kVxhTVYwBEDeiO
 C9WMio57Kvo+uVHgh5Ml7H9S0uJPWfz/yQIBKLlTWMdskz813+yRs/ba/
 AkdsQ7lCY2TMXxplw4xQrFCMID7G7ZAb37QX70/frHGBqgleWddT6/Ws9 A==;
X-CSE-ConnectionGUID: /OiycAYySe2r+cLDK7L9zg==
X-CSE-MsgGUID: VJnqzYmFRMiXW7d5Qsamvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34702190"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34702190"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 08:56:55 -0800
X-CSE-ConnectionGUID: 3VLFbKqQRLurhcnfYWqLbA==
X-CSE-MsgGUID: ZwaxCF3wRRGe+qXGg3LfXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="96651520"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 08:56:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 08:56:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 08:56:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 08:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKK+Rz8Pqfa+Z5IjPDi4XS6ECSi1fpa1Djt8HCHmZTDa7PJ7HbVLVctvV53OUxRKFRuYJqTHXxJIEK1k7JYcGjpG69mJPCwCITJqS7E03fpPiP1nzRmrtd3MK0U9Q++XGrSD7nswgoJ6Bj1YkN2S82Ly+M8UpnGHSc7AvWkw5cNrKe/9MrXxCNg9TYyB1ZuP7gTZcPm16jftQWArwYsUyD0yo+YpsvX22GQzQxkuJz1iN2IAqzNzTQZ0bQxeqZ/vGHOZSAF++8b8xRyoXJx1xteK9V4h/LxlPmVhhZN9954pI0N89mEshfdRuUXAbJCF4AGyKQjhoGRRoSHrvr31HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bTLtERN9oXo6k5ti2H1o8A3s03GRxYbhLeKiPaC4oaw=;
 b=YJDbw4JpwglaEzcEScKbp/1gkDMPp/dFey0epNuCNFydWFS8BpfE/7QY7xZDrXChrI+XnyUAG7JOJx5FxXB4UJXP2kq2i2NIMM1VfwiAiOi42YPaFCIavIHfGQwdEDv8Iwuy/oPNrTdoepRXXpXZaDEERbFZqJ52WuV5cIZiSiVXwlcQEwDXXir9IDMZ1qrhI+RnvWLCYnSRqZqAz5APcmcl7tsgZXFIKTRB+QFM3P5PNsfsL35kqjHHSD5xXLP30eHc7evfyHJqOfXD+Jwyrz6+OVx6FP9hYhLyk4dCvc3YKHCt9br0Y+KzIeX9V0zt+yXPepoB1D8Jk7iXNO54nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 13 Dec
 2024 16:56:38 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 16:56:38 +0000
Message-ID: <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
Date: Fri, 13 Dec 2024 08:56:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: d642ea25-93a3-406e-295c-08dd1b971bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVlzTFlVV1ZKODQ4ZW5WaVpJNXIxaWUzNDMxWnRTNTl6K0YvWnRkQW45dHJw?=
 =?utf-8?B?YWhxYzk5ViswY0JHTXJ1NFF3ZlNqTzNMTW5JUjZzdDF3MFN1aW1Kd0s3ZVA5?=
 =?utf-8?B?ZTBFcHJPQVZqUU00dUM4Z3NzajVwWHFnOUFyaldhaDVXZEw5MUgxNkxlMmtH?=
 =?utf-8?B?NUVPRjdCQTlpSEVqLzZMNytqSjVLVlhURnJFeitNcW8vV2dyVXJLNkx0ZkJi?=
 =?utf-8?B?YjkzaGN2eUtWVm05SFZKWGVPcWZ1SS9YUUZOTUYyRXhrTWtUWE5zL1U0dFJo?=
 =?utf-8?B?RnRYZlVCTExCVnJNc3hTZGFJTFRvTWk1VktNd1JObC95K2pWUUtwK1hWQkFZ?=
 =?utf-8?B?OVZEaGJEVkNGZEhXeFRONzNodVdDOTZCbHJOUDRmRDkzZzZxa2ZuaTBMVExz?=
 =?utf-8?B?VjFUUzdBUDdWNVZLVUZZM3hoeTkxQUJnYUJzbFZlR2lKOEdhWUp2RFlheWw0?=
 =?utf-8?B?YXRCRG0vVzBHUDhZOVhUMDdOdkhtc09xRFlOWFNDVFJOL3FzN3dLZU1YVHpM?=
 =?utf-8?B?Q2d3ZXk5bFpWZ0tKbHJvaTY5bURaYjNGWHpGNnBtd2dKbmtLbnVvdXltcEZM?=
 =?utf-8?B?OHBuOXY2Wm5WWjVGMG12Zy9RZkhVQkdzTVd3elBEMm9RZnRtUjJKVWpXTXVm?=
 =?utf-8?B?UmFrcW43UnFtUUJ1SEw4aVl0RXkrYlphaVdaWStTaVJNUEQ5WFZ4ZXlacjhK?=
 =?utf-8?B?UXBpcW1jR0RUMDJwRDdLa1VaM1ZuRHRmTXJKUHRFZmFmajh3cFA0V0UrRUpE?=
 =?utf-8?B?bjV5cmJkWTN5eVRuS2IyWHBMRTF2Z256bjRVSEp2alA0WEhYc2dXR2hKVzho?=
 =?utf-8?B?SlVjUDVrbGo4bjFYWWx5YVZpT296TXlFWnY1Y3doMnpLSTZRRVFLT1A4Nk90?=
 =?utf-8?B?L25zQ0wybDlkVUVMZndWUXpJbTB5anNudUx3TmZINEpiTlVteEM1R2s4Z1ZO?=
 =?utf-8?B?VU9IZnByemR1K1BaWU0zbVlpalVrN0wwUWRmak83SER1cHBEc3hiMFVxOXQ5?=
 =?utf-8?B?c281QUYxS0djRFBVQnhXaUg5a3dCRjRZNE5SZFFJdHppc1BSNjF1RkZZRGg1?=
 =?utf-8?B?WnVWWm1PemtRb3R6eUdxWDhjQlJ6SEx2Zzl3Q3hMTnlVV2doa3BjTWNQZ2dp?=
 =?utf-8?B?WStwTVBYazNWbmZ0Y3hFZDNIaC9yR1VUbXNlQk5OTWpzOTd6QzMyMGFkbTNZ?=
 =?utf-8?B?OE12cVlJeWlpQ2RVZGVqcm1pL1BlMnF6UUpKSnVTSXZEZ0dFeFlRU0VJUit5?=
 =?utf-8?B?ckthOC96MTNpaVpsV3A4S05mS0V0ejlaU2NOVTlxR3Jrb3YyekVITGpkODE0?=
 =?utf-8?B?cWxuUnhXTkFaanpLWi9Kd3RkSjdLWTR5M0xUOEV2UVRmdlF2MENrSXc3UU41?=
 =?utf-8?B?bnh4eElSMUhnTHdNWmNHRVoyQTNOVmN5RkhGWlZBNXN0UFd5VkluaE90bVB2?=
 =?utf-8?B?SkEwTDVnZnNuVmV6YVhRY1VKalJlSVhMOERxb0sxNWpIbmZkZHdnS2VCZ3JB?=
 =?utf-8?B?dTRpKzdNZUI4U3JvZEkzclF0VmJmSk1WOEh4ZExuSEdtOUJCaG1CclZKOWRm?=
 =?utf-8?B?bzcwVFovTXlodVg4U01jTDQyemZxdzQ2cUtFeFo3RUpJWDIzYURjQWpSQWMw?=
 =?utf-8?B?ZTQzRjUxbUFTS1FwMEltTTVXYXV6ekxhY2dxOXRqUmtQZ25WVzdWVDVEWkxR?=
 =?utf-8?B?NlFpNWZlQ1I2UjNhbXFoVVZnNjgzTXZVMENnamcrVEYwRkVXL1FOWkRxcnpk?=
 =?utf-8?B?RnNjU1lVYWxjRlAwM0Vrb1RLdVcxbUNCYXUxVVQvRGk4L01sUDZtODdLT2dG?=
 =?utf-8?B?Q0hTMEMwUDRrdW5JS3J6Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHc2U0F6UldzdWkrZmVPY3Zsbjh5S21OazBGVmVReEhNVVIzcGtLWFdnZkpy?=
 =?utf-8?B?Z3NZR2lJZmIrc0VCM0xmUXpBK2ZPb0pTYWI0d0E3aWRSalhxdHdOQUNIRnpJ?=
 =?utf-8?B?RFFKeVVDb0VjVUszb2N5b0RuNmkyemUwVzlFUEJ3MVpoTWsxVm9LcEloeWph?=
 =?utf-8?B?NGZYaXBlS1NoUjZleElUZ25ZaTEwb2pMNytMTzlRcTJOTXFaY2YvQmxRamVV?=
 =?utf-8?B?WDVzTi9CRnErSmZHeUFiRkpnWDJZYThYbnVDWlIxajdtNHB4SUtqTGtJeVlP?=
 =?utf-8?B?TFAyZ2FJQnRBWU5MbERIM3pPV1lDWC9qZkp6SU1YRFF2aGxLWEhGT01OYUJ2?=
 =?utf-8?B?ZTJLUmVaeWw3V2xVRGtNR3k4SUljQ2FjR3BRSHBabnkyY2luT2cxSlJ3S0da?=
 =?utf-8?B?bnc5VlAyT1FzRkw0MCtpWWZJdk53ckRLUHZRWUpsc3g3K05PU2k1dlZjODdG?=
 =?utf-8?B?cUhBU3pwWG81cldETnJOLzZvK09oOVMzWHBUa1RoZjVuRXpYYndSTUJ4MXEz?=
 =?utf-8?B?MTlHYlBqZGtRVkQ4TEdVWVdLdE1PTUtxYklGZVE1Z2J1dVZ6c3EwTVdWelBV?=
 =?utf-8?B?VG4vMXdJRk1hait0ZXZhUG1GeDV1cUxtVnR0N0I1MVVwUy9mM1Z0SGh4MDBF?=
 =?utf-8?B?WDFtUmhsZ3NHT1Zka21rSVN6Qk9Hb3ZWdjgrcVZGZDNWWkhrdnoxeERMQU93?=
 =?utf-8?B?bnBHb1FRYnhoMU4wZTJVbVZiZHJWOHh4alhZS2cyZWwwZTdSWDFFckNjbkFm?=
 =?utf-8?B?MU94UWJ4NzBXMVJVR0N0NDhKOFFIalZYU3VTd3hPZjQ4NlQ4RmJQNUM0czRQ?=
 =?utf-8?B?ZS9LOG41MEFMRW55SS9XQzRtbmhMYlRqYWozUWxRMXIvUS9jNHRHcmVyRTE2?=
 =?utf-8?B?U1lDSWJuSU90T2JUaGcvMFpFVlBva1dVWUpjUXI0SkxpR1R1aDhLN2kxQk15?=
 =?utf-8?B?ZEQ0YW42U3gwbXUyOFRLYU1YS0pMZGhaZlJFT1dZSy9tdlRaaEVXUUN4Z0xx?=
 =?utf-8?B?cW43RlN2VFk3YzBkc0hKZ0Q0Vk1KdmNaU3cwTW9ObmI1NXh6WDdqYzJDUm55?=
 =?utf-8?B?U28xVWtFOWgzbDNmWlFJUU5DSXNYRGFSSTV1SndnUytkekVMV2NPMHRZZ1V4?=
 =?utf-8?B?dEE1SFhJWjV3SjJhS2JJTDF4b0R5S3RQc0lOZGxXbGloVU1EOUwxWURJVjkw?=
 =?utf-8?B?QUFyMjNVRUhCZHpKdXhRQ0RVWHdHSDJ6Y3l0YURxamw1ZWh1LzArdDIvL000?=
 =?utf-8?B?Vk5mbVFKOVM1Y0Yyc3crbmV3d3J1QTVoSFNtVFlhSCtaNGU2OEk1ZFB6VU02?=
 =?utf-8?B?d1BicU5xVDdwSjA0dXhFaExWMWR6Vk15ZGdVbytVNURzTk84Y3FicXF0ay8r?=
 =?utf-8?B?MHNteEhkc1A5UjVRc2hBcnE5VDQrbEdIK0lCeEpzSXJYTFZwNklSbnhTU0I1?=
 =?utf-8?B?V0tzQk44VmN4eTdZV2ZGY0FNOHdGQzYzWVpZSENTRlJ2MzFRY0xMSUJ2UFVo?=
 =?utf-8?B?aGM1RFRtZ09NMWwyWFJJRmM4RWFxWkpZbXBhSk1LVS85YW5GNDU0cW16TFdS?=
 =?utf-8?B?a2hSUm5oQWwyZFQvS2VuaU9EZ3ppcE1RTUJ3YXA1RjFsa1RpcCtvbXAwUHpE?=
 =?utf-8?B?M29jUGVEdWZtTTh5Y1ROYmQxSER4Z2p5L3VzVWpCZFMrVmFES056QUZOaXht?=
 =?utf-8?B?LzZQcy9nbzdYOUdDOE0xOHArb25RT01RQ1pVM3R1V040ekM3Mys2TnVmRHFz?=
 =?utf-8?B?MWEzMzBDMHczWms2Q2VFQkw0VGJ4eVNrTCtVUXRuOUxSSWdERG1XbkZ6TmVi?=
 =?utf-8?B?VHlaTHVnaWJzQ2FlQ0wzMWRTSndWZ1JzcUE4SGVPbi9RSlhlSUI1V3lBOEJG?=
 =?utf-8?B?U01JME9GbktwUWFqWnRtWGVCR0pTUmhnZzM3VENDaHZUdzBNM08vTjl2QW96?=
 =?utf-8?B?WEJHSGN3LzJYbGFOM0NGU2pqNzFpZlBiYXhOZ2JnalJDSWZvcHdEczZnejhv?=
 =?utf-8?B?K1pPak5mNW1GOHV0LzVVaUFBTm1oMzQwU0JJTFdNSlpaZDZ3SWd3UWl4THNL?=
 =?utf-8?B?dlpZbG5GVzB5UzhHMXF6RUJVN3puQ0ZOT2R3cWx2ZHpkMTdNdFNMbnJiSWJV?=
 =?utf-8?B?WnprS3IzbFhONTdTNlRIZ2lBbllOU1pnV0NLS2R5TEw3MEVJT1VqTkp5V1Np?=
 =?utf-8?B?ZkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d642ea25-93a3-406e-295c-08dd1b971bdb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:56:37.9820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OQto3PSRmGuE6r2pVnFmwflzggj0XYvwBzDmcr1CezfM9eeLv2b0U0n1e3AD2QSaRo5Pq1fti3O6ZFebtLj+RtTfwuLn+KykcWf4v8i6bvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
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

On 12/13/2024 08:48, Lucas De Marchi wrote:
> On Fri, Dec 13, 2024 at 04:28:58PM +0000, Jose Souza wrote:
>> On Fri, 2024-12-13 at 09:50 -0600, Lucas De Marchi wrote:
>>> On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>>> > On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>>> > > On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>>> > > > On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>>> > > > > We do not break userspace.
>>> > >
>>> > > There is other patch that also breaks Mesa parser:
>>> > >
>>> > > drm/xe/devcoredump: Improve section headings and add tile info
>>> > >
>>> > > > >
>>> > > > > This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>>> > > >
>>> > > > But we have users calling this function.... the revert is not 
>>> so simple.
>>> > > > I think we need to revert the functionality rather than 
>>> reverting all
>>> > > > the patches, otherwise it will cause a lot of headaches.
>>> > > >
>>> > > > I propose we go with:
>>> > > >
>>> > > > a) drop the \n that broke mesa and merge that with cc stable.
>>> > > >
>>> > > > b) move back the entry to the previous section that broke mesa 
>>> and cc
>>> > > >     stable.
>>> > > >
>>> > > >     José, would it be ok to merge a patch in mesa and port that
>>> > > >     to mesa stable that simply looks at 2 possible sections? 
>>> Or even
>>> > > >     drop the section checks... ?
>>> >
>>> > But if Xe KMD is reverting the patch that changed the hwctx 
>>> section why would Mesa need to also parse the new(future to be 
>>> reverted) section?
>>>
>>> first is to undo the damage, with 0 changes in mesa. We do that 
>>> first and
>>> *then* we agree on what's possible to do to accomodate the 2 parsers we
>>> have.
>>>
>>> If we can get something in mesa to work that is backward compatible 
>>> (i.e. the
>>> changed parser is able to parse both before and after the kernel 
>>> change),
>>> then it could be considered to a mesa stable and the kernel side
>>> changed.
>>
>> Okay, reasonable plan. But the ascii85 encoder with \n will not be 
>> brought back right?
>
> maybe let's agree on how to possibly bring it back? I suggested using a
> space as continuation line char. This way you can just check the last 
> char
> returned by getline() you are calling and see if you can go ahead and
> proceed or if you still need to get more data. Neither space nor newline
> are part of the ascii85 character set, so it's safe and you can handle
> continuation in one place in your loop.
>
> if you are just ignoring any ascii85, then I believe it's even simpler:
> you check sections and keys with a space since both keys and section
> titles contain space, which is not part of the ascii85 char set.
>
> Lucas De Marchi
Yes, I would strongly prefer to use line wrapped ASCII85 data for all 
blobs in the devcoredump. Including things like batch buffers and other 
VM entries that the mesa tool is presumably wanting to decode.

If adding a <space> character to the end of each line is an acceptable 
fix then I have no problems with that. But not line wrapping at all 
means having to carry that change as a non-upstream patch in either the 
internal tree or in individual developer's local trees. Either that or 
we just cannot debug a lot of hard to repro problems.

John.

