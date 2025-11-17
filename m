Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7AACEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 17:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE5110E37A;
	Mon, 17 Nov 2025 17:11:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CVlp9NZI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374D910E37A
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763399469; x=1794935469;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=pysfBlE4qXQ6Oq/kIShxuxO7JjHbpG3fDk3PDXLMFXE=;
 b=CVlp9NZIScebQGlBimUQDDPh+BK7IvESMLm1WEdFvMlT49dnlWdVWb2g
 wO9oQZm/ljxufkDAlSwi9gz7EqBvEN32FdYSxxpdk1MPmJxE9jg01I4+X
 U9hjYVvm1BbPNquJCQ+CGmsAqtbzUsagA4QBK6gFx032D7OFxl6xE86d7
 iYzeWKCZzscZyQI3nXJqh1zGAL90Y6oXTtqek9SaeZQbR9AbQDIA1Sg2Z
 BwFsfkWsoHdLy3TVEJCYdvbStlWjVFjzW4M8RbtmAbGyvKX9JsNob9meO
 xJ6oYBMkCRhS2k+/ohN/xdm4SIYuWomZvOwW9gpIYrWgSqKXpfFOrZ6yZ w==;
X-CSE-ConnectionGUID: zqFckw5rTGaB4RQ77RmdVA==
X-CSE-MsgGUID: EP37XfdDSIOVGpOrD3P14g==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="83031806"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="83031806"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 09:11:09 -0800
X-CSE-ConnectionGUID: bZciUpd9T2mwDxb+EpyozQ==
X-CSE-MsgGUID: FVUz/9KCTIC++MtPmnNugQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; d="scan'208";a="227836808"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 09:11:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 09:11:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 09:11:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 09:11:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dh/Dk+VENz/FBBLlK8z+0Sxuzn3+QIC42Y4EgicTCQrKDJeiqEGXUXDmro/HPUkzxLsxvyAwtBGwAcCdl1/kGElRlOSBKz2RYGYtwCbXK23R4XwAVgeonOIF7dngC6uYv/7dr0S1QLyPJC60okKNXGtO060JE2f507i/wPHXKE4TrZepy6gxNGAZ+Ci5BHlp7zCm0cJJr/uvG6DiVJX59/uZYEj2WKdcmTn9FUqAE63t81MmKLvTmYRo/lrp7WrkTneENY11oslwAm/+zkOKJ3SJZIG+XNIxsoHQT5An98yEAonKO0RfjpKd5OUz8YTZZO8UiKTUnLdmEVW4OMTRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KeHGJdF8kgBY2hJbmIf+pqW9uBCt4g6DCUS2SZ/jqpo=;
 b=DOVevSCOifchGHTT+rV2apP/qebSETntLl3FEmUqgxDPKqEeQnjT8EmAQraWLCEoLk4ETlNU1LiBb3WQA51JI7YBxNU601foo+sV0gevRIeg+6qutC03T6sbWu4Dk2udVuujrlNucuo2aI8hEGMk2VtKvlVNMGjXkbQhtxADlXhe48w+AyQd/Tu7vxB7H8ZyygteDVUU/RosKpcl8qKIxDui/ycjXNrc5RThscAARCT+e6ueZJvWvE85jiLC4kd2Tq4VYzvo97DVQzIDMCOV0XfOkVOK160fWvYws4Xvoc0h3NpGfhifyy5Fa8VSaHsp1ZwQvzRbQz6TzXKt963vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Mon, 17 Nov
 2025 17:11:05 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 17:11:05 +0000
Date: Mon, 17 Nov 2025 18:11:02 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Fix .bulk_profile/sched_priority description
Message-ID: <20251117171102.mrj76rvjjnpj44uh@intel.com>
References: <20251115152659.10853-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251115152659.10853-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BE1P281CA0228.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8c::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: f040b380-d269-4e49-518e-08de25fc4ae7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N3FoUktpRks1dXRnT2VYWUd6cEJudVdvTEhRd0dRNXp1YnQyVlJRL2tBUEJr?=
 =?utf-8?B?NnZHTEI5czdRNzYzWUZJaWdwOVphRDdydnhHK3ExZ3NnOXBPWEhGZDNyV1Jz?=
 =?utf-8?B?cm9hczg4YVR5MjExWTBmam1VSTd5bU1CZkxYdm42Y1cxODhUYWJrUWJrQlk2?=
 =?utf-8?B?WGpFbmwzSmZoN3pzWENWMEwyZWJ0bDNYZjlMbUpwYzZHVlNxSFBxMzBiQVhF?=
 =?utf-8?B?eVpZZnR5ZGp1WlgwSXZvZjdwZUhncWl5ZzduLzZjbFRRZDNMaUtYY1JWY0cz?=
 =?utf-8?B?bDlwUy84YzE2U0tDd3cxaUdsQytDRXhsUSs4ZGNvZnFvbnVVV1VqNGpwYW9B?=
 =?utf-8?B?N1lvdHRQSWZqaHg0YVR4aFFMNjlvZ3pqMXVISTZIUW9GZlkrNmR3TTdaZm1T?=
 =?utf-8?B?Q3R2aTdpMlhrTkExTk5GKzNWOXJrTnA5RVJ6ZzhhbjJLLzM0UmRwV01JYkpS?=
 =?utf-8?B?c0dWWVVUL3RlVjFwRUFPVFRzTWtuNkdLOUFmaERMK1ZJTWdPNmM5OG80L2J0?=
 =?utf-8?B?UU14ODhsQVRZdWZuSVJodkNubDNraWdRUzZvVklvZjNETXZkQjhyc3hmMHRp?=
 =?utf-8?B?aFc3UjRIOWNhd1pxaVBMWFd2ZEduVFNZRnk5K05uWTU5UE15bGN0ZDhoRnRN?=
 =?utf-8?B?cjRGamhVSG1NSUtwK2lZeEV3eHphcGlRZTVJTGJpQ2w0VnBxUExzYThTS3Q4?=
 =?utf-8?B?eDZBUW5Pbk1rY0RvTjIyQ3k0cEdQNGZKbWNKZmoxQy9WN1I3Yml6VnlLRG82?=
 =?utf-8?B?UTdwQ0IyLzZWbWZtbTFJNXRjeTJtUmYrQTVpYVFwalgvNHIva1FrYk1zZHhl?=
 =?utf-8?B?QTVSWjBhMWxSd0hsQVJlNjNmSVpGZUF0MVRJNjNmREdlUHp0THdPNk5QYjBn?=
 =?utf-8?B?ZmxRRkY3VzhRODZEZXpsajMwUmFkZ25odWVnS3hCajdTRCtYSHBYSjNUam1q?=
 =?utf-8?B?NVRuUmhwdWRaS3BzY3pHcHI2THFmYXhVQ3BYOTlacnJ1TStwakpSditQR2pP?=
 =?utf-8?B?Y3VxVTZKRHpLRnlSM250QUVpclRXNGVQNDJwL3NhS010MHM4T296Ty93bTk0?=
 =?utf-8?B?LzlJS3MxaGFkWG50d2lRL0pKY1VGUllJUURlZ2c3aEs3Z1ZSbjBKajBVWXhs?=
 =?utf-8?B?NVdiRXpOQlpzYU94ZVZ1cWRmdndIUEE4MWZ1RnNiYUcwQTI2WFUvcXF4Z3BZ?=
 =?utf-8?B?d3drc1EvdVpSbC8zKzFRR29vMmplS2dxczZHdk9zYXMzM0c3djRZbU9weUVi?=
 =?utf-8?B?WFcxSHZCbmhvRXdKS0xrazBlelM1Z2xZVlZHblEwUmlkMS9DeG8vRVhWVU9C?=
 =?utf-8?B?Q2hxZmxid3FLUnVyVjR1VDdZSlhHS0w1L0V2Snd3cUliTURmRjM1ZkJYMEhp?=
 =?utf-8?B?dXRjMGdBY05YclpleCtmSzA1dnlMejMrMHdodXhPdnBrVUhjS1ozdVl0UURm?=
 =?utf-8?B?NXJHd0ZoZWk5aU51SVZ1MkFnMGFOb1poK1h1cVRaclNIaFFXbTI1eFFnZ2RN?=
 =?utf-8?B?Z1pwR1F6WXBMYy83bkg1SGQ3STFqUG5RMTlBRGh2SC9jWC9maEdCWmtLRFY0?=
 =?utf-8?B?VGN2cVcxTU1KVzYwQWliUWdnajZJOWR4a2txVkxGcDdEYnRuT0o3THdpaUFH?=
 =?utf-8?B?ZXNwZ1FralZvUnV5RUtKZW5BcWk5MkNlcUsxQ1ZzbDhCWVllV3UzZjhzUjRo?=
 =?utf-8?B?RUsramw5ZDErTFFGN1VBanFoSU9aMHlYT1Q0cUtRYkQ0UG5oRzU2Y2NVdUpy?=
 =?utf-8?B?SjVySTc2dk5iZlNoOVJuQzFmS3ZmTXdrZ2QrbUVoOS9wTG9UNDg4WndMdEFF?=
 =?utf-8?B?MGZyZkNlT0dFWkZJaE1WWjVCOHV4ZXZsRmRFZnh4TzNQVlVab2YxS2JIaENB?=
 =?utf-8?B?M2NPeTZMZGFGdmJGeTFrZEE3SERwc2FVWm8zRXdDRHkxd0JJK3lxOWl5TUI3?=
 =?utf-8?Q?gUGM2CqmzT1LRtV7JVsFRIIsspMWEccl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmtVQ1VFajYyY0MrM09aeHJTWS90ZWowM1hXS2V2T0RaQkcyNHZrWUE4U1h3?=
 =?utf-8?B?SkJ6MEdOc2NmR3gxaVNNcU9Oa0tsNk1Ib29MdkJkL3JsbFV6NlVuZlFEenhx?=
 =?utf-8?B?Z0xxdXM3VGVtQllnTXFNaVpEZTB0VFo1NnJ3WlJtYnJtSXRJN2pQUDdQb0pN?=
 =?utf-8?B?RndSSUhPUWI0dGtRUFNyOHRydlBWVmFDUGxWOGRkcTFUMHdxMG9QZW9JeDhM?=
 =?utf-8?B?Y29zVDRwRk5Pc1J6ei9mOWUvNElTaTFVcEx5MWtWVUxGZ3hJWmVYdk1NS1o4?=
 =?utf-8?B?SE9Wc2N6QXhxME5acDZuaFVralpDRkFKT1VKelhTR2hZZkpXRGQ4ay9TVjBH?=
 =?utf-8?B?RC9KQVRhZW9WT00wOUlBc013d29oQ1kxWlB6cDhORkVyQTlYMjBuT1o5cm5B?=
 =?utf-8?B?WGZEUnVMTUQ1cWc1eHpBMVpqenV1WVdJWG8rVWlNZkl4ZUp2WHlQa094M3hB?=
 =?utf-8?B?bVloTmRFc2JMNmZadUxKdWx3QlZtdGhqQnYvbkNlSU9rS1k1SEJJRGlaZHgy?=
 =?utf-8?B?NDAvU0R4YWJvYnQ1VTYySkFlMHdxbmo1MHBIakIwSEdGaXN5ajFDbE1tRjdF?=
 =?utf-8?B?Z2VZaHViMDRYWjFpMC8wUWJ3Z25MMUVtQi9hVkNlQnY2WjRZZVgzTjZFcXZV?=
 =?utf-8?B?dFA1YStac2ZQVWJBbG05b3hhVi9ZK1NPcUJ2aGhUaEtQbUdpYTNWMzhqMG1t?=
 =?utf-8?B?Ti82RGFieC9xRUFEODRkRnFBSEVmZFlLTWIwOGs0UFVxUjN1MG5SUHIzOEQ0?=
 =?utf-8?B?b0E3djBGR1oxWWpRZHcvQVBsQmFhUEd1ZG9PRVViWEJVYnFzcXhtUFd0SjMw?=
 =?utf-8?B?QlMxOEdjOWIrUWdPSnhwT3AxQ3NOMk5uK2twYWV2c0JUWUtxeCtCMHdwYzdv?=
 =?utf-8?B?OWg4cVNPYTArMytCOGFtWTAyNGtScStWOTJRcE5FQ0lkSUpuUFVkL0lid3lj?=
 =?utf-8?B?dEFGYXpMZXQ1M2tUQTBROXRiZmFHanNBZ2xHejN3SG5XaGsvWXZHK3hhQWhz?=
 =?utf-8?B?b3BuS0tVS3d3OGVtT3c2eU44ZThOSVNXMCtnc24yWUowOEZxQTcwQmlGVk9z?=
 =?utf-8?B?Q1VOeFBaUHlXTnpKUlppMzRlNy84a3BRbm1zRlI1S3NxZy9hQXpDdDRKM1Jy?=
 =?utf-8?B?Q1M1N1VXRm5aUFY3TWxQVU1xK3ZQQW9RSlh1SXVJV3BZU2ZGR2hSQjFZZDJi?=
 =?utf-8?B?VENza1YxelJ0RWhsOWMycHZQVnlkblQzN2l6SU13K2xBVnZEVDV2cXR2cndC?=
 =?utf-8?B?UGt1NjRLa0g5cWE4d2dIdzZrYTFNU3ZqMnpNeXhjSjZKb20wd1BZZFRwY1Jn?=
 =?utf-8?B?VFo1b1ZveFozcjZ4SFF0a205elhSMVhIRHlKZVNWaHpnTEVEVmpnOHVMd25U?=
 =?utf-8?B?SllTL3NOb05iUGhnYmlJVE01T2JMdDJ1Qm1BazVGamcwTEJaOVAwRlIwdDRQ?=
 =?utf-8?B?cGV0U1hRcVpvcmdJWmdPTmk1UCtucGVBY2tVUXFsT1FOb1FDN3p3cXVETDBi?=
 =?utf-8?B?U3VOK25xczB1ZUdiQ21GTFY1bXRGR1prQ2hLK0x0UDhMT1RtV2lmMFd0VUVt?=
 =?utf-8?B?WklvMWYyNk9zekVTdVVPdzVrcGY2enMzZlpIRnJGMHh4V3prcW1vOVVCcmR4?=
 =?utf-8?B?TXFnQ0NyblhvZWJMSW81d1E5aFV5Y0V3d0N5R0U5SlpuYnFuZ0ZLMUJ1ZVZh?=
 =?utf-8?B?RGQyTi9XbmFqdU16RU01dDJoTHU4b1VwYWJhR2dySVcwQ29IWVBPRUxJZEM1?=
 =?utf-8?B?N0wyUzdwc1g4SzFKY1U4eGdsU3oyR2I4UUIrdDVHd3djRjhFYzFsZ0xyVExy?=
 =?utf-8?B?NnVkTjJuL0lFcklEc0daTlRTeENBcFhsQ08vNjl4NDMzTGtXeHlKMnh3MWxK?=
 =?utf-8?B?Z0hzb21OYk01ZTZnWEgrbFZDc1BMRGx2SzJWMFQyTnBCeUh0Q3BPd2Rzc0RF?=
 =?utf-8?B?NDNKVDI3aFphWXppWmF6a2p6V1NvdzUrZG92UVZiK1FQVy9xd0dKa2pmZGpW?=
 =?utf-8?B?b0t4Qnk2dFVEV2hReWxSQXNHRldvSEFBZXUxVHM0ckFNSGk5NXhsQnhmSjNa?=
 =?utf-8?B?T0I5clQ3eGFTcnM3Mkh2aDZmM085QlgxNzl1QVBhbGdjNmk1STlOTW1maEcw?=
 =?utf-8?B?dHZPTkFBZDRaeVh4a3B0Qm9McG94UzdPcjBNNUlyOTIrUk1WbjJVN2FCVEcv?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f040b380-d269-4e49-518e-08de25fc4ae7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 17:11:05.3367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yu6YVc8UHrPrk8oj5SaBPdfcOk6DdrbSwnSmE18vGHCU3CQF1C2iuBzfkbtL1Cz0R6MqcWEioGKDYj7FJL+KpfSBysh7dZtJx9kfJP4qHzY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2025-lis-15 16:26:58 +0100]:
> The .bulk_profile/sched_priority file is always write-only, unlike
> the profile/sched_priority files which can be either read-write or
> read-only (in case of PF or VFs respectively).
> 
> Fixes: 6b514ed2d9a7 ("drm/xe/pf: Add documentation for sriov_admin attributes")
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  Documentation/ABI/testing/sysfs-driver-intel-xe-sriov | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> index 2fd7e9b7bacc..7f5ef9eada53 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-sriov
> @@ -119,7 +119,7 @@ Description:
>  			The GT preemption timeout (PT) in [us] to be applied to all functions.
>  			See sriov_admin/{pf,vf<N>}/profile/preempt_timeout_us for more details.
>  
> -		sched_priority: (RW/RO) string
> +		sched_priority: (WO) string
>  			The GT scheduling priority to be applied for all functions.
>  			See sriov_admin/{pf,vf<N>}/profile/sched_priority for more details.
>  


Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

> -- 
> 2.47.1
> 

-- 
