Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37541C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 17:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6AD10E726;
	Tue, 11 Feb 2025 17:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c3xTyQbC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DADE10E71E
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 17:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739293672; x=1770829672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nOGTpznbZy4am78Tonw/Fo+MG8W/gQyjV2BJ1TdiT7A=;
 b=c3xTyQbCXinY1EcG27GAFuOexFYkmxSqq8KaEsSJ8eOw3Z+r0Ip+8DV8
 ZZEfd17ipZJ3AfAZggV72YZYIjUVmYYFwWmj4DDlrUKMgizr1kiJ6UkGD
 eax1ln9l0vU3Gh09C3wuFzRmHPyxMWe0PFA9cG8dvA3iWtPSpVTFw8dp0
 wPd7vilWEpoXYZvL6yQcqs4UMnCGPgosrEGkH6L5m+X+4WkDxMj0PC3jI
 Cw2phslOMXjxt4Esf8mDxUGGdn92Gu1+VqxkbPCl+KBETJ1H5hgpprP0r
 9H32K8ClZNzIbmY6wgwIwTA4WbsCybkUoHS2TrglV9/966Nz+u7moJMtV w==;
X-CSE-ConnectionGUID: thUlKgxyQ1yg8kJKim/9Sg==
X-CSE-MsgGUID: 2b+cp6qCQJ2X8QQZyvKTnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="50559202"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="50559202"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 09:07:48 -0800
X-CSE-ConnectionGUID: SjBCmTymSRCNQXsiOj5vRA==
X-CSE-MsgGUID: h+4qFaLWTyWIfA7LkOQXKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112426107"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 09:07:48 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 09:07:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 09:07:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 09:07:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZbZImFUJ6A1GIIu6eBLqC06tp8Si3sXXoU9WEM2d288fpgA1Algu3Dm6Iva05uvVEk/u/ISeY+m/EWUQFNyhL4CGikuZHZCKCfYHzuHoWP0nPzaOa0ByXZ7ebOS1bVoKkSroXcLsWx+NQ1YnRoEU82z9CD4xQCiIA1D+iUKLZxFwAkt0mKavzEcOnWXkXvSUJtQ/Ob5eSFNwr9AXPV8eo2DGvtC56om5hacvP2IrmTDtfsMDbFtJkVCwjUS5iN8t1TAa5OllLXP1QijDjsF0mdpZ6YJ66sy7lcoJzJqYZHJGhKUxCxG0P40kZVn6J6bU9n8uRnrtlOs+j5yd6lvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJnmdAx70oKX6oCiJPSZXfsuCJH0391kZD72G3kGv+Q=;
 b=E3JQZq89lyfRD+3/0W3hfHxCydwmSnRzKMVFbYetICEx0E7qMODsUkDOEdjjh6y85Nv+rS32B6MEqoT5vgkbscvzE0D8KfeeWjKJlAvshv+kRAjZKIuKCLRMp+O4Ts+IkbH+EpuRvcHeArNzD4uOJi3ntyHRWlYO9t91EeDi50JAZBerLy6FFStv2lPEi6O7i7rsXJabxnzKGTuWqBotnBWp9RaTwE2tMxB1msuXxI7S2wiIQLxYB4ieYpTPnj1jrNLje/qDhwbAM7MXAYpzgLRSf1TdQ47lL5siG45ZR5sHDRmZqE451w+Bxy5FJhSGzrxymLOLCUPzDRHaI4LSrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 17:07:41 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.8445.008; Tue, 11 Feb 2025
 17:07:41 +0000
Message-ID: <988cf01d-fca8-4151-82a8-36f6ea1698c8@intel.com>
Date: Tue, 11 Feb 2025 09:07:39 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
References: <20250211004702.1872837-1-daniele.ceraolospurio@intel.com>
 <SJ1PR11MB6204F3EF51FC309DADA9782B81FD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SJ1PR11MB6204F3EF51FC309DADA9782B81FD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0191.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::16) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: bf27e67b-2410-4552-a267-08dd4abe9841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUZReW9HSU9BSStsczFXbzJQeTltWlVIK0dONTk0UjJPaE4xZ0s4Nmc2eG5P?=
 =?utf-8?B?WlBOYldQbUt1OWVTcDBOU1FCdjNqb3J3eWJZYzNKTkRucmdkUnYxN2FFYjVk?=
 =?utf-8?B?bGhwNTRyeitCeEFBTHJjczcvMkxnc01vaDNCK2VkQ21PNXpQNVRpeFp0RzFJ?=
 =?utf-8?B?MStkYjYyRm9ZdEg1b04yYm8wOFV4L09JdGZ0T09kdmtZR3FsMjNWWGFwbkxJ?=
 =?utf-8?B?anIzS0MyTy8rR1podk5xc2ppcUw5UHArTjNBTW9ldWJmZVRRYlFWQnF0YVFW?=
 =?utf-8?B?Um9oTytzNFBwamZaZWhoSytOTGJVOGFIdU5DYjJuRG1DK0FQRGR6TSsyT3RO?=
 =?utf-8?B?Qk5wcDl2b3FhTGZMZ3NUdlVLVWEzZmZSRjBVK0h4U3JxTmdNdEJhTXdESHIr?=
 =?utf-8?B?N0hmT2xEVVJYSDUyY2cwQlg1SzhkaUM1RGs4MXNvQXVRUkJZVk5vbkFrMTNP?=
 =?utf-8?B?SDdiMTNHeW8veUFVUDRFSUxYUjgzS1IrdExrZCtjS0xzaUpyeDU3VjdXbmJR?=
 =?utf-8?B?ZWVYSmxsVm9PTjBQZGxWMDB6RFRaRzRJazBsejV0NVdKazc4WjArQ2dzY1Bw?=
 =?utf-8?B?SDdIMkVQclVUb0g5cVdINUhITHhHMy9zWFdndHl0dTlOU0s1V3dKUHpPSnd4?=
 =?utf-8?B?RXRqd2gxTW1GRmNRd3VOTWN3aFdVaGxrYUpZVkduZU1OOFNEdlorcnRVdGxN?=
 =?utf-8?B?V1pSY3BLSTN2enVsUTR3QldJdnlGS3VaamxwT0R4QnM4MmhpUzFBeThSVmJM?=
 =?utf-8?B?bUJuMDZQaDlhc2dVd2hTNTlZUEJNOUV3ZlRJSTRabFRwY1FpbVRid01Yd1Z2?=
 =?utf-8?B?TVZjeTBPYjJ1K2JwNlc5YkE4VTFiM2ZQZWFRZ3hyZjdmVGlOV2x1N2JpR2or?=
 =?utf-8?B?bTJiOEVjbitFUGloYUd0eXBkZGhLWVExbTUwZGtPcXZ4R1Z1ZFZzbjBEY1JE?=
 =?utf-8?B?RURyU2VCbXpOUzJxU0F3R1kxZnVxbUtTY1R2RUVYMjNuMmoxNmE3MUNoMnF5?=
 =?utf-8?B?RHppOUIzbTAvakU1aGNXSUdzZ1drWEM1Rlo5dGdVMmlHbTEvZHhpZUxlNDJ0?=
 =?utf-8?B?eDl6WVpxSFF2bUkvaFhIN0krd1F3RlpOenJZQVc3aDNLT0doc2lNdTE2L1pw?=
 =?utf-8?B?em92U2IwN3VpZk1lai9tRnh2cE9rMlR2Vk9rL0hrSkIyMnBoRW1ScjhlTTda?=
 =?utf-8?B?Q1d5d2N3MWllM1J0QjBCRG5KQ01ZMUZJdmwyUWRGQWk1S25UWjVnVUdhS0JX?=
 =?utf-8?B?enRqK0ZlMEtmY3lTZkUvSXVaczZ4NytLRklJTytlWm9ZenExR0tkSnhOcGo4?=
 =?utf-8?B?REYyRWpEWjREMnVIZW9sMzhOQnJaVUlKejh5KzRUUnJxenRQWE1iVmJlZEtC?=
 =?utf-8?B?c3VxdC96d05reDB6YkFMaEhUM3J6c1MxbnFkMFRGU2FiWitYWUtkMG0va3NM?=
 =?utf-8?B?eUl3KzBZNE8wZXN6dldDOVZ3MkJaMmtiZlJuZmZKMjQ2YXkzK3pBaGxuUEpr?=
 =?utf-8?B?TS9qUHMxS0RtckM0TmYrWjdLOXdEbDVtUXZqdnJSUThOZW5ZUFR1V0lLZFpw?=
 =?utf-8?B?WEpMVFI3WWxBczV3RjdldC8vUkJnR0dWMmdUVGZ2bmk4b1JnNmJLcUlTc0JB?=
 =?utf-8?B?V3lvSHgvclF1S09NcnN5TS9Wd1BEbTRPSHl3QXA0SWRmeCtXK3U1dUQvNmRj?=
 =?utf-8?B?R3l6Z0JYbEc4b1FnRUFWa1BGalpNQzREb0lsbEhuaUZGd1NBTzVVc05jUU53?=
 =?utf-8?B?cVp4aGRNUElRMmVOWVRLSk1hQW5TTmlKVWdWUXRpdVVoZUVoZU9QQUdWVFFW?=
 =?utf-8?B?a05hNDNHRFE4UFVkeHU4MWpicHByOE9vZlNnZ3Uyemw4bCtSS3dPaXVZRXVK?=
 =?utf-8?Q?jjwEcuNS7Jx7+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXF0cDhnOUdZTDFidFNDbXlDSDBvK2xzSGxtWThLRFRNU0ExU1FlY1dOcTRL?=
 =?utf-8?B?WUUwc0d0UTRzdFBkaElYSXFzdTFZOFhpdk1DVzZiUUVOT3hoeU9yNytRZXht?=
 =?utf-8?B?NlBsYmQySHRjdXpodHFPS0VWZnZNRHJkUk16VGRBRGUvam1PWWNjY0tYZHJC?=
 =?utf-8?B?cndmOFRaR1llZWEvTlhCdUg5dmJrMC9zWVI4ZmJwYTNxZW9uSGxQWS96RXIv?=
 =?utf-8?B?RnlyZzJNWWlzYW5HdXlQeXhwbDZQcUppYzlKZGYrcTh4UFBpa05PVTl4Y1Vx?=
 =?utf-8?B?NitFaDgwRWFkdi92OWRQQUUxVGxobXBBOGtyMDA4ai9tMkV0YW5GREZ6alpV?=
 =?utf-8?B?U1JvTlY0VUNZN282Q1VBVHZIN2NnWjlJcWg0RnRkWFRCaEtBR1hrNFdKd2l0?=
 =?utf-8?B?VnBEY01sQXYvR2pxTmFvYmsybHRFVkhEbVQ0Qmg0RnI4NGF5Q0FjRElIOENo?=
 =?utf-8?B?bUlkeXJFMzhyNkYyQThZazNyR0JSY0R3N0diaXlHL1VtdnEwMnpoVmZZbDZI?=
 =?utf-8?B?NXcyTXE0Q3p1SDlNWHhZLzF5NGFoOXJWejEzc3lIUm1yYWNpREZuVWxXWGYw?=
 =?utf-8?B?eDRMQndYNk02Q20rdGVuUXFKRjlSanFLOXNkREc1SDJGclBOZnpZKzhFamVE?=
 =?utf-8?B?MGRXZmQxWnpLSEdpRVlrQ00yaTRiVW56WEkvRnZHZGFidFo1VDhlNDRWZ3VS?=
 =?utf-8?B?ZTMzTitZMnBWM1RlU0FsRXdROUI0TU5lcXpFc25ROW8yUlN4c2tlMXRCUllr?=
 =?utf-8?B?STJwWEV1UUVOQjNiOWNBYXZOQ3ZGZ0ZVYXNHQzBsMEx3TVhTT3dTTkp5ZmVP?=
 =?utf-8?B?VDE4WEFwcjF2czBXZGNjbVRkRnkwMGg4cmdMM29ZSHFWblplVlNrN0Jtd0N3?=
 =?utf-8?B?NlFoWG1GeVcwUlN4bGxTdllMNU9GWEN0U3JuSndhVXZWUGQ1UkpjN3MyK1du?=
 =?utf-8?B?N2FzUVJlUWNENEFtYk1WT21iMDU4V3NlU0FEL3crMzRaVVRqN3lOM2dwTzJa?=
 =?utf-8?B?S2g0UXNoTDJpTjJlVFZVTmJ3b1ZPSzF5c21mVnpDVG5BS0hCTDR3Rk9OZWtE?=
 =?utf-8?B?NnZWeUhJY3lrb1ZzOHlNUE4raUFxcUg2azJvK3d4bzdyUEJnemdXbXpGb00z?=
 =?utf-8?B?SzYxdUNVeGV2OWpDYit6MGFxNXU2akwwZkhoYVJQQ25kTkhwUGNmNWc5eWN4?=
 =?utf-8?B?bW96Nk1ZREZSaEFvQzc3ZTNEUmtIUjJPdnlLRktwYlZBUmZSQ2lVdnpQa1Bh?=
 =?utf-8?B?Ukd3Nm0rTVE0TC9pd01teTFWbm5LdkNza2hDYzI4bHI3clRXRGJzZFpTdXpU?=
 =?utf-8?B?c3FVSmtZTGFzYzJQYXYwcUlZd1pVK0NKREMxOG1oZU5zT1ZEUGpCcVlZVnZ1?=
 =?utf-8?B?NUFJYjJhVjBhVHVQTmJLMDBzMmhabW1aa2t4SWtWU3hOQVVkUEw5K2NzQ0dU?=
 =?utf-8?B?MDdteVJEMklCUDdmdEJtWTh6QW1XK2pQbEd2elhyTnFlQnBDaTN1ZVhLYVZ1?=
 =?utf-8?B?M0ZTNlJqWGlyLzMybXR4amYzOFNkV0ZFZ1pEODJUSU8xbTdDVFZ3TkJqM29l?=
 =?utf-8?B?ejJGRXJ1OEJrSzQxRmN2R0dZUXgwekhDVlFxOVZyMi9CUElGcDRZbkFEQzNm?=
 =?utf-8?B?UnFFbCtsc0F5RnNXTmJmMklUcWd1ZzAvcnRkWG52dEw5TGFOU1d3NGlBWlVu?=
 =?utf-8?B?ZDBLWHJUeWEvaDdZVFNFcDNHS0pUVEpjUFZ1eVEzZERjdmN2K2tidmc4QU80?=
 =?utf-8?B?SmppcndzRklpK3NqeVJTL3c4RFFtcllpMkxjNDltS1l1akZ5cFJibUdON1pk?=
 =?utf-8?B?K2QvOWxWOFBHdkNxZ1ErZG82WVMxU2piT2lvaVVmTHE3ajlwVVduRmF6TXhj?=
 =?utf-8?B?WWwyek41YnYzR2o3NjFFbFFLQjU5dkNIY21aOGk0amN5eXdBZXVLbUIvQTVU?=
 =?utf-8?B?MndVQlkyV0h6V2ZDMnV3dnc2Y2NFcmVUNmhTNkpVZnExTkdiT25PdVI2bFNp?=
 =?utf-8?B?L1BrRnJicEpkMWdBa25sdFkrbXVWWFpIb0EwZEkvaTQ3VjRMdnpKbDJUMlBn?=
 =?utf-8?B?VzhwT1oxMDFHVmJFQVh5em5lM3F4NU9qZWtQYTBSbDUzQWQ0cXVDeVJxcGRn?=
 =?utf-8?B?MmdlSXJKRU1KZjhKeTVlTkJiaTlPN2x5bXFiejg5Z0dVd2hVRU4vVTQ0cjdO?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf27e67b-2410-4552-a267-08dd4abe9841
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 17:07:41.6968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4Q/Ia7tJaUeYxbCiGX9YGDhQkm9dEzW8XDD8aZxt/or7v2f9UM9EV7B4y7lZVyrYEdYJgNz3grwzDpqpdPg6s3I5BXyHmxaBhm7+wuGHr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
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



On 2/11/2025 1:53 AM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Daniele
>> Ceraolo Spurio
>> Sent: Tuesday, February 11, 2025 6:17 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; Brost,
>> Matthew <matthew.brost@intel.com>; Harrison, John C
>> <john.c.harrison@intel.com>
>> Subject: [PATCH] drm/xe/guc: Escalate GuC load failure immediately
>>
>> When the Xe was first introduced, we intentionally avoided escalating GuC
>> load failures, to not abort mid-probe. Xe is now mature enough and we
>> gracefully handle probe failures, so we can start escalating immediately.
>>
>> Note that even without this patch the probe is still aborted because the
>> attempt to enable CTs after GuC load will fail and that failure is already
>> escalated.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c index
>> 1619c0a52db9..13c3084c42c2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>> @@ -938,7 +938,7 @@ static s32 guc_pc_get_cur_freq(struct xe_guc_pc
>> *guc_pc)  #endif
>>   #define GUC_LOAD_TIME_WARN_MS      200
>>
>> -static void guc_wait_ucode(struct xe_guc *guc)
>> +static int guc_wait_ucode(struct xe_guc *guc)
>>   {
>>   	struct xe_gt *gt = guc_to_gt(guc);
>>   	struct xe_mmio *mmio = &gt->mmio;
>> @@ -1045,6 +1045,8 @@ static void guc_wait_ucode(struct xe_guc *guc)
>>   			  delta_ms, xe_guc_pc_get_act_freq(guc_pc),
>> guc_pc_get_cur_freq(guc_pc),
>>   			  before_freq, status, count);
>>   	}
>> +
>> +	return load_done ? 0 : -EIO;
> Do you see possibility of load_done to be -1 and you will return success here?

You're right, I'll change this to load_done == 1.

Daniele

>
> Tejas
>>   }
>>
>>   static int __xe_guc_upload(struct xe_guc *guc) @@ -1077,14 +1079,16 @@
>> static int __xe_guc_upload(struct xe_guc *guc)
>>   		goto out;
>>
>>   	/* Wait for authentication */
>> -	guc_wait_ucode(guc);
>> +	ret = guc_wait_ucode(guc);
>> +	if (ret)
>> +		goto out;
>>
>>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
>>   	return 0;
>>
>>   out:
>>   	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
>> -	return 0	/* FIXME: ret, don't want to stop load currently */;
>> +	return ret;
>>   }
>>
>>   static int vf_guc_min_load_for_hwconfig(struct xe_guc *guc)
>> --
>> 2.43.0

