Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F51FF8867
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 05:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1821210E26E;
	Wed, 29 Apr 2026 05:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3DOcORx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2CC10E26E
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777440296; x=1808976296;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zp7f8EPXW+gBb1jmKmEcnTbdZL1Sv7CsZOmZCCQb0gM=;
 b=m3DOcORxLpzowH0ve/0dpdVlwaSMZDpBjZz/Fqgqq/k/EdaZEFqLjtPT
 ieHjG2D0nWsP0c+H+5867zcsrKzqRz7O+AFMVKMtXkdGdoJafYTZfwVmy
 Psj+Qe4eforD3tcJzaOFLs0O4yokfb3KdQSXjkO9NKSsYVe+m6F13YsC/
 NGYyB2e7yeM6p3iRNqfxvYSgkwvDErjU+e2KWzivxhoG5HAxSMrcFD1sh
 frRtnfZyoT+cGjiquKYmg+YI/y31/ZctA5ae1K7yh28BDGY/aph/Ti0Or
 eAZN4abe7PzGzccsT4NT2UQloYKIQ8mPlUvuFSo+hB9mK+awSQQXAd9aG A==;
X-CSE-ConnectionGUID: vlhPwJ/mRjam3oYRDpcomg==
X-CSE-MsgGUID: +TFp4eEFRLajbbPpiL9xuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="78420742"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="78420742"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:24:55 -0700
X-CSE-ConnectionGUID: MwhqkJgPQdiLh2YzxmHsUQ==
X-CSE-MsgGUID: TXFaaH51T8+9GnxKRGQDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; d="scan'208";a="238133241"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2026 22:24:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 22:24:54 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 28 Apr 2026 22:24:54 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 28 Apr 2026 22:24:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alQhds2lQuVpfZrsfnuCdmS+PQxliVoOfbaDCnLXrosW4ponL63p85Mlc+m+PaUKTTDUofqpoS4hwwDRmuMIIeufU7NJ89KNHojUu7F1m0bJI3Spz0lHh4DLv1JHGlKmKMA4l5+A6fLWRs0/WkyZKKeDSN6AXME79DQBJ3GSymshk/+wZZZOAHlnlK5k1qjzjZOSCU3+D+DxgaNdwPsbCOgSobhr/mjoGc/IF/Xc5H/xCYm1U39gxl2aGDrvU6YCazCZu0CAGhIVlPWlfASTuVEBZgXCSy7Kih5HuQPJbblLC4pAW9jgncsFdNo2zUIYyqLIIO8jEV9xm+z0uakrhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+5E07tBlGOxKNSzyxbDfpNDxcU2HRBwGukqzsKcwSfs=;
 b=hqYdmE837mxnMJ+SlcZrI/dafP743mCLc7c2z+z3PFdJOZMYp+jsx0q8ziB2hRJ4czt4tKMqHBj7rAdomE9326MBU/1f0Y6AmMySSdeIg7CuEk22ylfh0s5wQrkd1M0SvEiJWDgLJ1AepepP9XP60I0Q9Ojsxklq9DsBQF72b6neYBTLREoeI3WafcGi7V3TKLnMCU9xq6n8nXYuVI+vfohUODWDbgAMmtJSjVgyFvtrG6W7KaAmIBJNo+zy7yUkzmvtcLQqhtjHpLJkusmD2BhFIM/zkGbAPLPYIjRStjrQF13t6RSN/g48yBpZetY534Vq0B2rbOXxzmRHZydATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 05:24:46 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%6]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 05:24:46 +0000
Message-ID: <3bbb3db0-28be-49ac-a828-1167a1f2ab96@intel.com>
Date: Wed, 29 Apr 2026 10:54:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/xe/xe_ras: Add types and commands for RAS GPU
 health indicator
To: "Tauro, Riana" <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <andi.shyti@intel.com>, <rodrigo.vivi@intel.com>
CC: <anoop.c.vijay@intel.com>
References: <20260423173925.699486-1-soham.purkait@intel.com>
 <20260423173925.699486-2-soham.purkait@intel.com>
 <b77fd9ee-0450-46d3-a038-df0c26a44608@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <b77fd9ee-0450-46d3-a038-df0c26a44608@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|CO1PR11MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c8ae0d4-350a-40b0-5574-08dea5afa060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info: yPPiM6YgtctJMEv0XpdIpFR1xjBjLXI4PJ5YhofUYscugIrNQDAqbf/0lw6PrPmPK3hqD/iFTL99cT5W3K2zAW1byf0IlfHNRVF/92hh9rQAYkR+3DhXNDqXCoxHnDHA9QRy33J6y7HddmEsvAP+JsG7ymNLxwIHHDTQb7jVEdYOfKEzbxSkniwVSV4gzfNV4GaEC5EkqekutKH+R/hlUMuv5nyk8/3Ll4dm4evrl0QI7xdqk2IvAaXJsNh2tsB5M80oZSWkLG8nWt+BefzDp9/3MNJpwS12BATUgOC7AU43uFd+xTGaaFeJUUXk4VbC6kDeHsml1Cpw5IsG0CqzcR+uQXkwNDVlWx8cJIHeySbYLVqPHow016FK25o7ZldpIUdE51b52dVezXZ1f/lcbp+PYPV31FraHW/z+0+Hb4N4H70q36aELzaIBUE4JwDEsgqN50u4UbtZCT+S+ry05kk4kZhf0up8RyFFiEu+QXuTrRGBEmAEjNFW09cd+0pImLU237PhnnHJ+TiT9OAp7JPt4K61+I1ShLAyuM+eznGmNR+atG+QmfYAc5XbiqB6iRXSkUbGlm2GPbsl2+QfXcxIJWbPIgSz/aWG7LYtHvLp0kDpeaF+5hox3G/mQ203gi8LoXIZv6E6T342hOPP3sn9OIFghUSnr0gEKl4B9ICMavfOvTXms/eM0BA2LI/9MnQ9vYIKOVu3aokyrRVjKtH2Tpq7TjDPuZvwXKD4lWIQuahhOx/K3qKNx2KZcoNvakfgf228L1rS640UBpgrPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWtMY0FvSDVkZFhuNk1Bb29EdmNneURJbmpaSGh4UEFYOUt6MjFya1dTRzFT?=
 =?utf-8?B?YzNoNzBPTWoyL1dkVHpNcEMvUGVaTDcxS0tuYnFKMmtJVmlsTzQ1em50eWVY?=
 =?utf-8?B?QVRrYVZXQUphZVlXRTlaZGd3Q21VQ1RWQUdHNkNOdk81UEQvQVEreFBSK1dk?=
 =?utf-8?B?dytsajVhRWJNTWZDNzdTY2pNcVJiTy9yaUdFRGhJaWorWlYxM2p3WjdwUlA0?=
 =?utf-8?B?cEM2YS9iN3hSUlhnRVhwRm8vU1d5dDNzUkhTOHp0VVZqT3BraVBZWXZyV1Ny?=
 =?utf-8?B?c2lSZ0oyOVBUdUgrM3RqQkdlbFpGbGlUTTZUcWYrYkRtemQrR2pmK0NmeU5T?=
 =?utf-8?B?VnloQTczamNHNlAwQUladjNSWHJ6WldtV3JPT3hKU1NaQ1BRQlBoMCtxZmJ5?=
 =?utf-8?B?VzRNQytpOXVSRTJyOWwvZGUrZmRYTWIzYVQvNEd3Ukg2Q2E5eHI4cHR1MFUv?=
 =?utf-8?B?dXVjMmxBcXR4d2Fhc1VuUk56NVJtZ3J4M1NXOHBqalYzeWFVdE95TXh3bVZm?=
 =?utf-8?B?TTFQMjRSanQxeTNmSjRJWC9XWW9ZY1d0Y3VxM1VCYVM2aHRvc0pYTnEvUDYy?=
 =?utf-8?B?a00vRXhWR2I1blFBKzFnRExFaC9kVVdtQ3k4S09OVCtZNmh3VnphOEtRbkRE?=
 =?utf-8?B?YnZjVGUzcUpacWF1NjM0OVhWeTMzeDhPKzIxYXVDZXFqbEl1RVNWZnZxa000?=
 =?utf-8?B?OThWT3BnKzN3WVIzeXQ4REJpRlkySVQ0aWo5V0IrQThxV0JJT0Eva3NNZzFW?=
 =?utf-8?B?cDBhTGFXUFM2VnNlTmY4L0lDN0FVNUlsbStQMWFFcG45NG11ZjdmZ0IwZVdt?=
 =?utf-8?B?OHYyekVGT2NqRnoxOGtGUy9iMWFnb1haSTY2TmthbXdNQ1RiWTR5MGlmV0l1?=
 =?utf-8?B?aGlkOVJKbm55VDIyeGpwZHdnWjZJQXJZWm5TbmZnZ0lqSlZTM1hPbjhMK05V?=
 =?utf-8?B?TzBqWXE4ME1kcnplU3FHVG5jWnVCSnpGVHp5bmNGcEE2eVJBSkpWSGVTQXpp?=
 =?utf-8?B?MDcxcitXSGxYRndZVmR6RmNHeC9zMGtCbk5zd3FkaTIxUjFlOWhCM1BlcHRp?=
 =?utf-8?B?SjEwTnQ4c2NRcFo1T3ZzSXl2TGMrRmdrSHg2ZEJwOTN5QlAxViszM2F3b2Fx?=
 =?utf-8?B?N3daRU5nWGNjQ1pqQzJJUlRkZHVvMUphbC90Skc1UUtuUUZUTVliZjlQTVVF?=
 =?utf-8?B?TVdUTmk5T1pmWldFUHZsdDR0cmVuZDRrd0Y2L2RVN3JNY0h2YjFha1BpYjVa?=
 =?utf-8?B?bm9UUGdWNllHVFFtanNaTVJMTXFaaC9DNTVkQ25OcU53V2t0dUxmSVJQbGx3?=
 =?utf-8?B?K29PNFR4ZEx5VHZPMytHKzQ1TEp4dUFYd3hRSExWWjBNNGdGVEJ1bUV3cHQy?=
 =?utf-8?B?L1lIWisyUXdkMjFnNnNFLzhSd1RidWUzZU1lejM5dlh4Z0NpSXNyTDRnYjBQ?=
 =?utf-8?B?eFpjTTBYSi9rTzJSaGMzdVdpK0JBOXJmYVAxbjJPUmlxUUNRUFl5VllLSkdB?=
 =?utf-8?B?K3RwQnVRQ1o4SUtLbW1iN25hb05XdE9ZMXhKdERyTVV0UlN2VEs0NWVEcDhi?=
 =?utf-8?B?Z0N0aEFvN2ZWQ3dDMnYrK01kYXAxUHBDa3U4UnA3dVVqb3NpcUEwY3FMY1RF?=
 =?utf-8?B?TUgweDhxQVppbWl3bloyRVhQMXJwWitiRVFrNitNd2xlS1pBT3VrK0N3a2xi?=
 =?utf-8?B?SGo5dWZJSTBiektteHdWeHY1SVUzbTFWaE1pOTRUM2tFKzJsNnNhbkJacXRv?=
 =?utf-8?B?SkJsSkRGd0Y4b1plcUxzR1VsM3FXa2Z2NXVCdkRqMTNWRVBSMDZvdnpwUGEz?=
 =?utf-8?B?VVVrUGpGajMxSlZPcm9wM3JBNGU5K01UQ2xtdUppRDJhci9ZMTVUY0Q0VVlV?=
 =?utf-8?B?N0dlbHZhZ0ZXV0Npd3h0MUFCYXdkNFVpdTRPVTdiOUNoa0lEMjdjVTgxV1pK?=
 =?utf-8?B?YWJ6T0lIVk9zaXh3dlQ1RHpOa3JuRUYzeGl2b1NydjQ2MUZSelRLTmhDanY3?=
 =?utf-8?B?eWE2Sy8rMWdxWFduZ01rVi9MZmhBY1UrblgyRUpORVBwaDZVSUZQU05pcWRM?=
 =?utf-8?B?MHA5bnVYQ3pyYzNud1pxMUpvb1F6Y3ltMS9RbndtNkJNVStKclZkY0VVd2JY?=
 =?utf-8?B?a29sYktiUUNSWE0xYlV0SnUwRUd6S3VZTkh3R29DQ0FaaVY4VDlIUGJQZXF0?=
 =?utf-8?B?RXVBdFBNMk9YOHZONFBzNmdLNXdhZlhJQWV1NnFaQi95a2c1K0EyTnV4K2Ux?=
 =?utf-8?B?Kys2RkdQSmRjYkVUYThUODNtMkR6ait5YUJTS3IwRUFJcCtpYVZBeld6ZVhp?=
 =?utf-8?B?SmRhK1N5d3BMOHA3d3dEQkViVEJRaVpwMEdML2d2TlhUSVNzbnhGQT09?=
X-Exchange-RoutingPolicyChecked: LRuYHqNJMuycnKG4C4IjMQ3Yy7E7DjVe0dJ077Q8vfAceRVMQKMwwh8fR4153zirdW5MYaeF7KlNSwFee//l/BIRLXN9Ur0Dk+qZOSGAmIm86clANdp8nQonxKktlYrF3D50l96nmixX/Oc0UGxQHnj9AsvsS88wHFoJRlLIXPeTPGttP1xItFGaHJYEHA0SQqXn0rIrq4Mo2EnIk149MshDSPkFrENKSgKjiK6mJEyHP1s5wn2aI7KoE6SlxU3U4qEOwbZLLOl9pWHht9IQJRRCKRFCzolmogkhUGMJAFUE3J/tNFK1i7nfjKuAJnoXycR+ejzuUEkQBL2gol4GhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8ae0d4-350a-40b0-5574-08dea5afa060
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 05:24:46.5647 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSPV7XrDVrNr5v01uCHSVZzXeOK7toeypJYPCKT3mA1ZpWpWww9YMs9PU74AsulK1N/u9uYs34NsomCHBY7iVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
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

Hi Riana,

On 28-04-2026 14:26, Tauro, Riana wrote:
>
> On 4/23/2026 11:09 PM, Soham Purkait wrote:
>> Add System Controller GPU health status values, RAS response codes
>> and mailbox payload types for querying and updating GPU health.
>>
>> GPU health states are encoded as numeric values defined by
>> enum xe_ras_health_status for use in System Controller commands.
>> The GET_HEALTH command fetches the current health state, while
>> the SET_HEALTH command updates it through the System Controller
>> mailbox.
>>
>> struct xe_ras_health_get_input and struct xe_ras_health_get_response
>> describe the GET_HEALTH request and response payloads, respectively,
>> while struct xe_ras_health_set_input and
>> struct xe_ras_health_set_response describe the SET_HEALTH request
>> and response payloads, including the operation status and current
>> health state in the response.
>
> This is extremely detailed commit message. Avoid using structs in 
> commit message
>
> My suggestion is to split patches into get/set health and add 
> structures in the patch they
> are being used. But upto you.

In my opinion its best to keep this intact in Instead of splitting in 
multiple patches as functionality wise it represent a single feature.

Thanks,
Soham.

>
>>
>> v2:
>>   - Add enum for health status instead of xe_ras_health_status_t.
>> (Andi), (Rodrigo)
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras_types.h             | 83 +++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h | 15 ++++
>>   2 files changed, 98 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h 
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> new file mode 100644
>> index 000000000000..5f884d6e24de
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -0,0 +1,83 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_TYPES_H_
>> +#define _XE_RAS_TYPES_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/* RAS response status codes */
>> +enum xe_ras_response_status {
>> +    XE_RAS_STATUS_SUCCESS = 0,
>> +    XE_RAS_STATUS_INVALID_PARAM,
>> +    XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +    XE_RAS_STATUS_TIMEOUT,
>> +    XE_RAS_STATUS_HARDWARE_FAILURE,
>> +    XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +    XE_RAS_STATUS_UNKNOWN_ERROR,
>> +};
>> +
>> +/**
>> + * enum xe_ras_health_status - Device health status values
>> + *
>> + * Health indicator status denoted by numeric values to be used in 
>> system
>> + * controller mailbox commands.
>> + *
>> + * @XE_RAS_HEALTH_STATUS_OK: The device is healthy and operating 
>> within normal
>> + * parameters.
>> + * @XE_RAS_HEALTH_STATUS_WARNING: The device is experiencing minor 
>> issues but is
>> + * still operational.
>> + * @XE_RAS_HEALTH_STATUS_CRITICAL: The device is in a critical state 
>> and may not
>> + * be operational.
>> + */
>> +enum xe_ras_health_status {
>> +    XE_RAS_HEALTH_STATUS_OK = 0,
>> +    XE_RAS_HEALTH_STATUS_WARNING,
>> +    XE_RAS_HEALTH_STATUS_CRITICAL,
>> +};
>> +
>> +/**
>> + * struct xe_ras_health_get_input - Input for XE_SYSCTRL_CMD_GET_HEALTH
>> + */
>> +struct xe_ras_health_get_input {
>> +    /** @reserved: Reserved for future use, must be 0 */
>> +    u32 reserved[2];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_health_get_response - Response for 
>> XE_SYSCTRL_CMD_GET_HEALTH
>> + */
>> +struct xe_ras_health_get_response {
>> +    /** @current_health: Current health status (OK/WARNING/CRITICAL) */
>> +    u8 current_health;
>> +    /** @reserved: Reserved for alignment */
> Future use in case any other fields are added
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_health_set_input - Input for XE_SYSCTRL_CMD_SET_HEALTH
>> + */
>> +struct xe_ras_health_set_input {
>> +    /** @new_health: New health status to set */
>> +    u8 new_health;
>> +    /** @reserved: Reserved for alignment */
>> +    u8 reserved[3];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_health_set_response - Response for 
>> XE_SYSCTRL_CMD_SET_HEALTH
>> + */
>> +struct xe_ras_health_set_response {
>> +    /** @operation_status: Status of set operation (RAS_STATUS) */
> use enum or XE_RAS_STATUS
>> +    u32 operation_status;
>> +    /** @current_health: Health status after this change */
>> +    u8 current_health;
>> +    /** @reserved: Reserved for alignment */
>> +    u8 reserved[3];
>> +    /** @reserved_2: Reserved for future expansion */
>> +    u32 reserved_2[2];
>
> Nit: reserved1
>
>> +} __packed;
>> +
>> +#endif /* _XE_RAS_TYPES_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h 
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index 89456aec6097..fc73e02c3202 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -10,6 +10,21 @@
>>     #include "abi/xe_sysctrl_abi.h"
>>   +/**
>> + * enum xe_sysctrl_mailbox_command_id - RAS Command ID's for GFSP group
>> + *
>> + * @XE_SYSCTRL_CMD_GET_HEALTH: Get current health status
>> + * @XE_SYSCTRL_CMD_SET_HEALTH: Set new health status
>> + */
>> +enum xe_sysctrl_mailbox_command_id {
>> +    XE_SYSCTRL_CMD_GET_HEALTH = 0x0B,
>> +    XE_SYSCTRL_CMD_SET_HEALTH = 0x0C
>
> Add comma so that following patches do not have to add.
>
>> +};
>> +
>> +enum xe_sysctrl_group {
>> +    XE_SYSCTRL_GROUP_GFSP = 1
>
> Use 0x01. Also make this consistent with the correctable series by Raag.
>
> Thanks
> Riana
>
>> +};
>> +
>>   /**
>>    * struct xe_sysctrl_mailbox_command - System Controller mailbox 
>> command
>>    */
