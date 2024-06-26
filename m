Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDB6C27C4F
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jun 2024 07:15:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C91210E784;
	Wed, 26 Jun 2024 07:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HENlqZ6O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A358910E784
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jun 2024 07:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719386137; x=1750922137;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=k0dGZ1qzgCu7wwGZPtOF4QmB79Ib6q2PTaG0vG1Mbzk=;
 b=HENlqZ6O8IuP3jb56QkI9rjavvP0CwyR5lqCzYDMbw2apLztFzvwXtu2
 8PxfsEEY1sdgmHDhE0NLHyrO8OIndOz+eSEqD4nr9ztn8GYCDBwxOWzUb
 gxQUNS6KU9WcvC2tKs9KUBi+js5ze4h3w1tzo1rzRDPzLeyd/Wy2q1VNY
 PUrSE8yeWXjVHf6FRCqX8yiR4+3lsI6zyIG6LNZdHniIXQdZ0dTsobeKU
 T6Akun/3QjW3jaxX7Jg0mxjntmKrnZxVUb17lz/Hg9UuC3NH7lgwpwfYx
 dogwqferPA65G5vPpqTygubxTa1yFmQnUlRLx/dVDogX7E+m8Yrf4KR+x w==;
X-CSE-ConnectionGUID: kXA7vZ4bQWqh9B3SJyOkgA==
X-CSE-MsgGUID: FcxctsqVShagruUraMU7rA==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20321677"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208,217";a="20321677"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 00:15:37 -0700
X-CSE-ConnectionGUID: Y8nkLnFmRN2ZJ3LYglyv+w==
X-CSE-MsgGUID: HaU/SZi0QD60kNbGzNOYuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208,217";a="48885745"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 00:15:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 00:15:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 00:15:36 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 00:15:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUCwvyZrg1KwRFM9LbJTO1/yc1ZQQV7B2VjWCgO2HWvwBDMWJgRsyHJ6dA9Q758iqwjztzrmeC6vi7j6dsruI31ZOaEwk6SDNvl6s0wu3btzWeR7iWWxbbSgzetDvOi1UDRsFjIZUAigsy02E04Gvv8hxnDpqW8YeqslgOuAROsqbDPGYdzQNNbnVo2oixfsROlOLD+4NNwafJ8dog6hMHIdVr6EwhIxYuxGHPNTL1WlLoNFHIdEZ6EdJgqCN/5VmqZxXcJ0Tfz0dnMSPqzXp9m+QDSE1fwMO3sZWMybz8xeWdQjaQ3rZrhBbx0xGG5VZGggxNAxxvjSw/MB4c7FnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+kPr/lfnnFChf4XeBCt8IljvkMKmdzWTHZcGiTbTqk=;
 b=E0Ga1WyA6Pj2YiBDmBJguV6jxkaqLbw6uF0z6wDc8VSby1gO2KTcxdQoV5KNjrv+WZjj4H2ZrTdMHSaIwNduvXkoV6PBMoMC1FmwOWCudg79tOzQlAo5SWjod+qEi0jyXIW26mZEibrnn1VaM9el+DIsfhY0AeHwg/Ebphv52EvT62soWFwoMBPu4fSM7cEllXWEWwrEP9PlgxOTLTzMRCVPZ/zqGLZcwXpjxXdJo1c8VfKVe+3EHobQDZu2slzlf01e3U7M1Kh8YqUFc6Peeq3Bc5V63fk95/U7f0lk8TAxe8CxP88LTSLcUMMUSJujpVV5rTpAUisFnwfpasitew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DS0PR11MB7650.namprd11.prod.outlook.com (2603:10b6:8:151::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.32; Wed, 26 Jun 2024 07:15:34 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:15:34 +0000
Content-Type: multipart/alternative;
 boundary="------------vDwBQQba00NytKmfce08QA7o"
Message-ID: <0a51b375-e890-4cf2-b681-93721559a7d6@intel.com>
Date: Wed, 26 Jun 2024 09:15:25 +0200
User-Agent: Mozilla Thunderbird
From: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Configure TLB timeout based on CT buffer size
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
References: <20240625084947.30869-1-nirmoy.das@intel.com>
 <7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com>
Content-Language: en-US
In-Reply-To: <7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com>
X-ClientProxiedBy: MI0P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::7) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DS0PR11MB7650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3364dc67-ab00-4eb0-c1d4-08dc95afc4d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|376012|1800799022;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzNSUThBcEFhOExVeDYwWHA4Tk8rR2U5Yjh1end3S2p5WE03VmY0UFBSalc5?=
 =?utf-8?B?V2x4UUFNZ3FaRy9GczdTVGM2YnZMdkpndkdLMm5KaDh1S1F4WFZWdUVmd1U4?=
 =?utf-8?B?U0tycHlpa2FrQkdHdkh6Z2QraTdEN2xoa0xHUldEVkp5Zm5CRkROZHBHSXRD?=
 =?utf-8?B?czh5aFFvaWZzYitKQk9VSDRWZE9aMG41MTB1emUrQ1FMOUJVdEphNkY2OUQ4?=
 =?utf-8?B?TXdESGxoRERuLzd4c3ZkWlNETEJEVUo1aHIwT292UjN3WWxCcFN6aU9KY1d2?=
 =?utf-8?B?MW5uNmY0VG5JNVBOVWhLdFZiMnNwZnIrdVB5SzJwb0pTNmF2WmozNlllOFlW?=
 =?utf-8?B?TDJ5VlhwNzJhdkQyUDJZSlRBOEducmlvY0Fka2pjOTF4UDJXNmRGeENwSlhi?=
 =?utf-8?B?cjB3RGhSbWtLeTdBNXRJUDlHZ00yZlFVenIrNVFxYS9BekZkSDZzV3RiQWMx?=
 =?utf-8?B?czhvT1BLUlArZFZZZlhKM1EvNVROV1VZZU9vSFgwMEZjcWFNdDBZMlV3Z3V4?=
 =?utf-8?B?M0kxTHVkd2ZLaVZTQTFRR3k4NUJpY0dsVERacUNEK3ZHZHRaeXVEYWxhVjRL?=
 =?utf-8?B?SFcvUExBdkt0TGNaT3kvUWdXWDQ0MlBqaHF3OVNEQjRPZkFoRkNGY1dMMVhY?=
 =?utf-8?B?RWxBd0VkVjBzbHNKS2cyd2JrUUR3WDNTbzNmSjE1K3UzcmhZRDFVOHphZkRp?=
 =?utf-8?B?dXVkaDZDZHBNc0NtRkE3dlJsUUtaTUNMdUo5cUlONDkveUkxVWpjNk4ycWFo?=
 =?utf-8?B?TFBUeXJwZTB4WEJvMHpzWXgxS0R6WnJrTTl5QXhTLzhMTU5ERndPU2pzelFi?=
 =?utf-8?B?aHd1V1hqV2hnaGhnVHlOUkVDVzJ4TElPV05TWVNBQURoZjZsQk9GbFdSM3JO?=
 =?utf-8?B?TmNGeTZFMTVpMHJJdGpjT2VmS1d1ejBwOFhIQ1VDRHBqZ3BSOUNmM2FjeGNX?=
 =?utf-8?B?R01CbUVrbzdhcHdlWkt1NkdoMk51S3NXU1ZLRWZUeE82dGVZclNydks0Z2tM?=
 =?utf-8?B?dFVXKzVvQzFxSUNPVlpOajNQamVLOHhxVUgyVW00UzdWM1llU3IxNi9CaFJr?=
 =?utf-8?B?ckZtRkZiN1BCOWlqUVJkY0oydFNDb3dGSWRpdERUcmVCQldUQmprY1dqbWRV?=
 =?utf-8?B?bTduS0xhWHdURFpSSG43M1p2aUkrTGp3Sm1SOFhMOHJzeHpvekUvanFQRE5n?=
 =?utf-8?B?WnMxUDhwVW5XNFpBaTFmM2w2OGtjWkJBbGlQZjBxdjdkME11czlaTkpBeHZp?=
 =?utf-8?B?S1Y2aWRnSG9LZnRBTUF2N2I3eTIwZGcwOHNta1Y2bE1Hd1htK3F0cE5yd0V6?=
 =?utf-8?B?YVRrWWtnTVA4KzZYR2FXWUhOVnQyTE1kYUNIbmF3SHBKSkZUdWRxTUF6RWh6?=
 =?utf-8?B?cFdPOHJ1U0llbmFMMjBaSDV2cDl1NTRON3MrQk96OE52aG9kMDdFOXVHb0gr?=
 =?utf-8?B?NmVVbEUvekdBTXUySisvTmJaYjlDT0FZVEVYdUZicTNXUERPWi9xVEE1a3Bi?=
 =?utf-8?B?MXUra0ZDQmUzTzNNemxUdEY0WnNvVGtUTlB6c2ovSCszakFNVEtkaGxXUEZX?=
 =?utf-8?B?SkxYek81andkRU5vcDkxcE1iOVVFeTJWSi9jL2lkMk1CRUlYQmhrM2lJcHFp?=
 =?utf-8?B?ZXZ4ZEFxdWVwT3hzQVdWVG9yVE5qSjNZM0NLRGNoNnFQb0RIbFFxbWMyK0Fv?=
 =?utf-8?B?dU9iTDMrM3pkMGZHSitORjhpbG83R0s3OFBWV21rbnJndVVNOHBrSzk2TmVW?=
 =?utf-8?Q?jEjedoEFAmkmTaeOrw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(376012)(1800799022); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sjc2VmZvMmZqWE1LSTB3WFJsNXBVeUpSWDBPRlhQNnZNMlZaaFdaWFRLWmlD?=
 =?utf-8?B?NzNFME5WM1pwUDFUT3FuWjFaUG1sckdYYW0xRlJmNk1xVU9uZEkyVFFqZTZN?=
 =?utf-8?B?aUsrblZDQXVYRmVSTmhqSHZDRDh5cEZqWlo5dXFYcDVYWVQweGJCU2xRbWFh?=
 =?utf-8?B?Q3NGOXkvVmdRSU92Y2FsVHhZZUc3RFF4aHdkL01PWVlRZ1Y5TlpPSXFWZlB2?=
 =?utf-8?B?K2Q4cVpPR0NLNUhrcEozcmJBMUpWTE9PYkJGSDYvekdDajV5aENyblgxUG1k?=
 =?utf-8?B?bzNGV3hOSTdKZlF3WElTZTdvc25tK0JUc095Qzg2Mzl3eTNZUGVHc0RQWnNz?=
 =?utf-8?B?ck5DdDM1VWk2d0lqdFFVZjhVVGF0R0dJclF1K0oyTzh2emc4amorb2hWc0g0?=
 =?utf-8?B?RmpZY0NnaFQvQ3V4dGM5S0FjTzBiT2VOMlBNQmNiN3UyN0ZNd1N4NmNSOFdN?=
 =?utf-8?B?TzZVbHNPbHpGdmJkT0Q4NUVlckNOUDk5bEpveGNVK1hTS0N6bzJvKzlTT29P?=
 =?utf-8?B?NUxiODlBdENScXRxTnVZT1dDYnBNaEVQalBzWnVHd1g3UDVPaWVLSGVzZTc0?=
 =?utf-8?B?Tkh4cXltRXh1Uzlua0tHVTJUY3U4OXVXWjB6ancwQ2RMKzY5eHZtZHZUWnh3?=
 =?utf-8?B?Y3NUY0hQcW5mRCtjck42NDZIMHVuTjEwN2x3bHk2Wkh0MzNDM1hSbnFyMHBp?=
 =?utf-8?B?ZmFzVG1CNUFab3JMRFBFaWFGendFWDBkQkt3UFM4cXpWUnRoaURoVEdaeUl1?=
 =?utf-8?B?RXNtV0U5dnU4TFh1U1dPb2wyQjB0VUlTcXk1L01WSjBQVy96ZkozNUZVc05Z?=
 =?utf-8?B?TEFOQTRhL1Nub3NTbGhJeVNXVHliYUg1dlNCbVNMbC9LM3loWXcxcjB1Y2E0?=
 =?utf-8?B?YUJvdTBoWkVneCtVVWwzS0h0MFh1eVJMOVpydENHQUY0RmI0SjIwcmZYd2Vo?=
 =?utf-8?B?WkNVQW5NTTFSQkxlTlhWemVtbUZZMThtWmlpQmJvQlJTbDBJQWZ5aEszVzhj?=
 =?utf-8?B?WXJuOW9PQmprN005QndlV0hsS0pJc00xdXo2U0UxcVMyZ0ZtdjhTMEcwaXdE?=
 =?utf-8?B?QzQxMmtkMTN2bHE0UXg5Rjk3bVdWK3ZnUjM3Wi95cXl6MjZ3djFxZHpsSXcy?=
 =?utf-8?B?MXFsQTRweTErdnJpQ2UzeXkzWC9WVlJ5OC9sdDkzalVrSG5HMER0V0tubUo1?=
 =?utf-8?B?VHV0YUlUN05kSFpuWk9WNzZoV1J3clFObXZLSWVPR2xFMjlWd05tOUg0MlFH?=
 =?utf-8?B?bUczTGVwL1d2TXlxRnlFaU9ucm1CU1VRNnRLRDUweDNGNXlIY0RTYnloMzRT?=
 =?utf-8?B?NTVOVHErd3VWVk54Q1JlREVOQmtEcU43U0lzaUQyZlBjS05KWHl3dnhSZ2cx?=
 =?utf-8?B?bnFkaUkzN3c2cGc0STZMODdGSGdMKzk2WmtIb2ZzSlhUNFZ0aUM4ekhiRGQ5?=
 =?utf-8?B?dmpOQ2tzSWhrT1NBNkp5SURiS3NvYlEzMjJIRktTTWZ2eGhndFdTUHJVQVBr?=
 =?utf-8?B?UnIrcnhxVncyRVpxaXRZWVNZeDdLclMwc1FsZzJrTDF0MHdKZmZmSEtFZFcw?=
 =?utf-8?B?dlR1N01tNHdhU3VyYWVMeGkybkVRQzVPOWZhcStzeFR1T3J5amxuUStwdGFL?=
 =?utf-8?B?elRHK1oxU1NnSTUvdGd3MVJ3Um4yUjhjS0c5VUdoUlphQU84eFIyRTQxc3c2?=
 =?utf-8?B?QUI1WmJiWDlYRDBJU1BpT2hyM2htK0J2NTAzNm9KWjJLZVZnNm1URXNXRTBy?=
 =?utf-8?B?V29kSnFGUWs0OEdRdHFvbWh3Q29scFJORWFxaFJMcU5KNGNmTjF4RTBubGdk?=
 =?utf-8?B?N1FlTWRobmFyTTlzeWVtNHExVUZqVUM1Z1VjTCt1WFA1cms5YTlwWGdoTE4r?=
 =?utf-8?B?QzN3ZkU1Y1ZiVU54VkNnUGluSTFUb1BROXU3SDBNdTdQakVwZ29WcDRITEM0?=
 =?utf-8?B?YXZCQlRhQWFPNzRqRkRjL1AvSlpLekNVK3hqcVovd0dDN1NmQldwVkhJNDgy?=
 =?utf-8?B?NFM5MXVaQ2Ntb2JtTDRpejBqMTFDZHd4NTZZbHNYTGc1YS96RFZXRk1HOUQz?=
 =?utf-8?B?bzZwQ0tRRU9Ra0lqV2Y0VklmWlVrekhqZXU3Ums5NWRBTUVTSUVmY1kvVVRX?=
 =?utf-8?Q?LEN4RZJHfhvmpbUsoK4xnMXzZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3364dc67-ab00-4eb0-c1d4-08dc95afc4d9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:15:33.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hs+pqSC/852B/7kpUjvhr6msQtLoF0VtZPzLTj72uuuGSK/nZxp2FZnTSwkSUYQYCUPIdQfB1MkIW+A4UkBCGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7650
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

--------------vDwBQQba00NytKmfce08QA7o
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 6/25/2024 9:55 PM, Michal Wajdeczko wrote:
> On 25.06.2024 10:49, Nirmoy Das wrote:
>> GuC TLB invalidation depends on GuC to process the request from the CT
>> queue and then the real time to invalidate TLB. Add a function to return
>> overestimated possible time a TLB inval H2G might take which can be used
>> as timeout value for TLB invalidation wait time.
>>
>> Closes:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Suggested-by: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
>>   drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
>>   3 files changed, 15 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> index e1f1ccb01143..fa61070d6201 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>> @@ -17,7 +17,7 @@
>>   #include "xe_trace.h"
>>   #include "regs/xe_guc_regs.h"
>>   
>> -#define TLB_TIMEOUT	(HZ / 4)
>> +#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
> if this is no longer a macro then maybe better get rid of it and use
> function call directly ?
Wanted to keep the diff to minimal.
>>   
>>   static void xe_gt_tlb_fence_timeout(struct work_struct *work)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index b4137fe195a4..e30c0da86acc 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
>>   #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
>>   #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
>>   
>> +/**
>> + * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
>> + *
>> + * This function computes the maximum time to process a tlb inval H2G commands
>> + * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
> these numbers looks like from experiment - what commands did you use?
> do we have SLA from the GuC for max processing time of any command?

This is from i915 which was added with 
https://patchwork.freedesktop.org/patch/563102/

>> + * so this time is set to 2 seconds to be safe.
> nit: missing "Return:" tag
>
>> + */
>> +long xe_guc_tlb_timeout_jiffies(void)
> this function doesn't fit into xe_guc_ct component at all
>
> if you need to reflect CTB size in TLB timeout calculation then:
>
> a) from xe_guc_ct export function that will tell you max number of
> commands it can queue (or are already in the CTB queue)
>
> b) in xe_guc_tlb import above function and apply additional timeout per
> each H2G action in flight

Currently only information we have which is also validated /r-b-ed by 
GuC team is the above calculation.

I can export xe_guc_ct_max_queue_time_jiffies and use that in xe_guc_tlb 
so the function fits their component.

Regards,

Nirmoy

>> +{
>> +	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
>> +}
>> +
>>   static size_t guc_ct_size(void)
>>   {
>>   	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 105bb8e99a8d..a9755574d6c9 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
>>   	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
>>   }
>>   
>> +long xe_guc_tlb_timeout_jiffies(void);
>> +
>>   #endif
--------------vDwBQQba00NytKmfce08QA7o
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Michal, <br>
    </p>
    <div class="moz-cite-prefix">On 6/25/2024 9:55 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com">
      <pre class="moz-quote-pre" wrap="">On 25.06.2024 10:49, Nirmoy Das wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">GuC TLB invalidation depends on GuC to process the request from the CT
queue and then the real time to invalidate TLB. Add a function to return
overestimated possible time a TLB inval H2G might take which can be used
as timeout value for TLB invalidation wait time.

Closes: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1622</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Suggested-by: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c              | 12 ++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h              |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index e1f1ccb01143..fa61070d6201 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -17,7 +17,7 @@
 #include &quot;xe_trace.h&quot;
 #include &quot;regs/xe_guc_regs.h&quot;
 
-#define TLB_TIMEOUT	(HZ / 4)
+#define TLB_TIMEOUT	xe_guc_tlb_timeout_jiffies()
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">if this is no longer a macro then maybe better get rid of it and use
function call directly ?</pre>
    </blockquote>
    Wanted to keep the diff to minimal.<br>
    <blockquote type="cite" cite="mid:7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
 static void xe_gt_tlb_fence_timeout(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
index b4137fe195a4..e30c0da86acc 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.c
+++ b/drivers/gpu/drm/xe/xe_guc_ct.c
@@ -112,6 +112,18 @@ ct_to_xe(struct xe_guc_ct *ct)
 #define CTB_G2H_BUFFER_SIZE	(4 * CTB_H2G_BUFFER_SIZE)
 #define G2H_ROOM_BUFFER_SIZE	(CTB_G2H_BUFFER_SIZE / 4)
 
+/**
+ * xe_guc_tlb_timeout_jiffies - Calculate the maximum time to process a tlb inval command
+ *
+ * This function computes the maximum time to process a tlb inval H2G commands
+ * in jiffies. A 4KB buffer full of commands takes a little over a second to process,
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">these numbers looks like from experiment - what commands did you use?
do we have SLA from the GuC for max processing time of any command?</pre>
    </blockquote>
    <p>This is from i915 which was added with
      <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/patch/563102/">https://patchwork.freedesktop.org/patch/563102/</a></p>
    <blockquote type="cite" cite="mid:7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ * so this time is set to 2 seconds to be safe.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">nit: missing &quot;Return:&quot; tag

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+ */
+long xe_guc_tlb_timeout_jiffies(void)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">this function doesn't fit into xe_guc_ct component at all

if you need to reflect CTB size in TLB timeout calculation then:

a) from xe_guc_ct export function that will tell you max number of
commands it can queue (or are already in the CTB queue)

b) in xe_guc_tlb import above function and apply additional timeout per
each H2G action in flight</pre>
    </blockquote>
    <p>Currently only information we have which is also validated
      /r-b-ed by GuC team is the above calculation.</p>
    <p>I can export xe_guc_ct_max_queue_time_jiffies and use that in <span style="white-space: pre-wrap">xe_guc_tlb so the function fits their component.</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">Regards,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy </span></p>
    <blockquote type="cite" cite="mid:7c2a77ab-64ab-4244-b533-cdbe0a51bcc7@intel.com">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+{
+	return (CTB_H2G_BUFFER_SIZE * HZ) / SZ_2K;
+}
+
 static size_t guc_ct_size(void)
 {
 	return 2 * CTB_DESC_SIZE + CTB_H2G_BUFFER_SIZE +
diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
index 105bb8e99a8d..a9755574d6c9 100644
--- a/drivers/gpu/drm/xe/xe_guc_ct.h
+++ b/drivers/gpu/drm/xe/xe_guc_ct.h
@@ -64,4 +64,6 @@ xe_guc_ct_send_block_no_fail(struct xe_guc_ct *ct, const u32 *action, u32 len)
 	return xe_guc_ct_send_recv_no_fail(ct, action, len, NULL);
 }
 
+long xe_guc_tlb_timeout_jiffies(void);
+
 #endif
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------vDwBQQba00NytKmfce08QA7o--
