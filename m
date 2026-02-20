Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A11DC531EA
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 00:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2815C10E08F;
	Fri, 20 Feb 2026 00:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nNntHwLj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1FF10E08F
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 00:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771547633; x=1803083633;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=mRZ/lWlGdQPZprenbzo3jxGzMfkvDWhaouiivLnm1RE=;
 b=nNntHwLjBFi4FGlO6GRKblfTbQ7i0xRIamECHQL70yNx9MEGTkjlcGLM
 kRZESOnDQrZEwkchEV5rb+qxNgXfTGc4GLqBoMot8GCIUCrmHMkoEcBUa
 jBVzSTHkueuVeokFOsM1yJt7jRgQ97nf3gBclinOHGbUVbqvPkJjAJ2Wd
 dPMt16LKUFlaNtusfN3SNyrO1v0MQwXhUDKKQ02BW1Moglb98J9ULe38X
 X2NTUkFaAv2g0oB6dYLD4aI+qWfl9rQtQGYWHBrBl9j0POlctGvWQM+NT
 OZEpAdqerP6StUn8MgjPHYLC2ezre1mAu6ZPKBWWMR+IRpmq7rciXmgHJ w==;
X-CSE-ConnectionGUID: O11vMtkSTK+WUrizBgGC3A==
X-CSE-MsgGUID: K/Glyc0DRH2OpSEBkfGrow==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="84008958"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="84008958"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 16:33:32 -0800
X-CSE-ConnectionGUID: H2mJftERToCQlWU053RbPA==
X-CSE-MsgGUID: xrS9gFhrSSq9SXnWyt+1/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; d="scan'208";a="243246071"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2026 16:33:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 16:33:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 19 Feb 2026 16:33:31 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 19 Feb 2026 16:33:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJ3ZBqby5YORRoJKaRZzabdmPR7iq+sukEFyBo+0ntAQ2d3eZlhrBVZilGPFk/cRtBcOXJ88pBupPNWtu/508ZMKN5x/ophJ6muiGPZulcCeOskQaJICXqTQwJD8SnsVZg8yQXv/ehzHNXbaE621MMm/NRCHVHZ11Uky9VWTueK4Jl9eWuXcX89oAaSpJfL9xvHuFLF+ytiDd7qOMiVbOhVYRDLmOk43+lsdhT6F+FMoJJPOIMglyFJ+zz/RiaUhdRu/uiWyhVZYcPLvUiO8rwO+zwybvp3HfuhTrRwZOn1qJkCGuetW24tjjDPYL+gLaZaNzdqUkLHETlQIfZauLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RISyJYgZq1MxkZmY0U19mdGVdRK7M3T7gA/wTAZ9lvM=;
 b=KYZhvgLTdgPrXC2MOVBo9ta8Flr8IDx+ceNks+PATIJNAZw08N3uk7BVn/SDuQQfDVjMqXYH2lzQTptjSuricyt26ox0Rby8z0Mpy2GEik4jA3DLtrMFkhGQOQm80zHslcIdfc5mILc0r7gAvLcuGSo59MgDyI2R66fx75TlqkjKGt6HHgASsPw3aTKlBKx05g/C+7Lk6UjjFAnmjRVZGeBkEZkc4G8xN0nSsorA0coYOWXGrq/X0yf5mwKvqOxpRwVTdp52gXDhbTkAgbHjDste6Cr5jXt+5MzsQUJXmI5+J5oOuV2UVCXbFpmsmx7aU7KNiP6XqOsYHH0i4h/Teg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SA0PR11MB4591.namprd11.prod.outlook.com (2603:10b6:806:9c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 00:33:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::48d7:f2a6:b18:1b87%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 00:33:24 +0000
Message-ID: <8c9cbab0-2315-469a-84c0-033806ead0a2@intel.com>
Date: Thu, 19 Feb 2026 16:33:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/1] drm/xe/gsc: Fix GSC proxy cleanup on early
 initialization failure
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260219173128.2414504-1-zhanjun.dong@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260219173128.2414504-1-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SA0PR11MB4591:EE_
X-MS-Office365-Filtering-Correlation-Id: 2379d495-a870-4a9e-4b9d-08de7017a871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tk15UTdKcmRuY3NsZVFYdmpRbnl5bmwzbno1ZG51MlhMY3JNY2VEdDhMNnBR?=
 =?utf-8?B?VS9JNlhodnhBbHBENVhRbXIrRUZjTWswdFFjMXM3Q2t3cUxUS1Z3NmpDaFJY?=
 =?utf-8?B?b1JZWlNKYXBEQUVxQVlNWUI3RnoyUjRpUjhRWkc5Q2hMTWFLV1c0bG0wRTE4?=
 =?utf-8?B?ZVkwM1R3NkNDOTRLdmpKcGcwS0hxTG5FQmJYdk5uVTUxZk80UGc2MlBmVDFj?=
 =?utf-8?B?VUVrSnhQcE5MQVVQcWtPWTcydnh4NjA0ZVpIWEJuNXBYVzUvUVVwR29tSGQ1?=
 =?utf-8?B?Wm9MaFhLN3o3a1BSRDNYWlBRbmVHZDQ5bGY1aW93aEVPVjc0Qmx6aFhRd2RO?=
 =?utf-8?B?SFh1bllXODB5eUt0T081T1pndkFMMmNYTVZGZzg5TlBNODdwSEErZit0T1Ny?=
 =?utf-8?B?d1J6VitaaEpremlxRktsK1VZdnF3c2Z5RUF1M1I4MnBQd3loNnU5YTBIM0ZU?=
 =?utf-8?B?Uk9YSitmbTB0K2FJSTVjSU5COWJ5Szd0dG40My9jU2pLZzI0OGltSmMxUStr?=
 =?utf-8?B?NnRNNkNLOU5rSVMwU3dzWlRWUFByM2wvWW9KUzMxdDM4SnQyWnArZHNHZm9V?=
 =?utf-8?B?Ty9WaEVWbzNIZExNQ1JUQ0lXRTBxTWVCallWRjNSYjBhWjU3TTBiYjQ4Q3RL?=
 =?utf-8?B?WC9ndU1XQ053NEI2T2pUN1BlbnJDSlNqendhRnhzRFFPSFRYRHAzbE1DWHpt?=
 =?utf-8?B?Ly9RVVV3aGpNYjc3VFJhUnRRMnRBMGx4SnVGamVIYTlING9DTFZJR1RkTGh0?=
 =?utf-8?B?VU01VTFNTUl4bnQ2eCtTd3R6U2xCcmFWMldXbG9KdjUxU2tTdE05L3J0QzIv?=
 =?utf-8?B?SVI5ZFZvVnVhbXlRT3pBYW45R0tsRjBaMkFjRDR5MUNTK3JJWFo5ZXF5TWdG?=
 =?utf-8?B?TVVkVXB4cFBYaFgyMFZsMUpkZ2Z0RGtoRG5IRDNCa0RJL2lhVFluZWJrbzYw?=
 =?utf-8?B?ZUl6dU1yeE9qaHpIdlpMUGt0NC9NWGl4TGNjWDJPcUxCTzR3Q2dhUmVFYWJx?=
 =?utf-8?B?SEZIdEpLSzNFNGlSTU0rM0NUVnNNVk0zbm5wbnNFOERXN2p3VDVRN3VLWXVJ?=
 =?utf-8?B?bVZKR1I4SnZ4Q2d1cVdFalcrV2RzTFN0SW45cU02bC9hSHlZV3ZqMkZTWFZh?=
 =?utf-8?B?dlFMcFE4RGlzQjR3Vi9hakxUVWlFeEZncTNYK09ZMmQ2OHR3YWI2NTF4UEY0?=
 =?utf-8?B?OENpR1E2UlZ1cnB0RDFyNEJoYldrTExEaG9nM0hnVlhad1RRNmFSdmNvQXRY?=
 =?utf-8?B?YTE1dllXZkhVWmZUYjZTcys5K2VxSlRTdXRmZWJaeUlNVGw0cUlaVGV2SWF2?=
 =?utf-8?B?Y2RQNWVCR1ZiU1Z1SFFoS1Q1K3VHdzhMcTYwUURWekdBWXl1dndKVytZeW0y?=
 =?utf-8?B?M29QaWxGN2gvOThVaHdjNS9YOE1qWWYxWjh4UGR4VGh6WkQ4SUhOcUlZSGdX?=
 =?utf-8?B?NjFHcHcwSE51UGNlem1rTXVVaHVFYndmRnd5RVR6bG05TDNXM2hqcDVzelFu?=
 =?utf-8?B?OWRMTTBwdkViZjFmZDY3Z01hOW4zQktDdTBPN3M4OCtNOXowYy9xZXR6VEtk?=
 =?utf-8?B?M25NK0wvY1BtL3dKUy9ubFVBYWNTL2xvTVhsSXp6V0RiM3g5NElISlJWV2lH?=
 =?utf-8?B?VC9qaUNranc4VDMyVzZoUytseGtWaXpaSUUzcDYrbnU0S08rVVZIVEtObHVw?=
 =?utf-8?B?NVBCTXR2cm0yem1LcVZSSU9wd3FadHBVT2tzTmVTU3BENUwzRHd5alNGbUlN?=
 =?utf-8?B?QXdWTm5KajJxOXlZU3FQTUU3Uy81blhtNkZFZnRUZTAzZS9kTG4zL3VPL1Z3?=
 =?utf-8?B?VkxycC9SYWpRemNkSWdHMkdLazBGSThUUzltSnZCVlRoelVxd25ydzZoNGhD?=
 =?utf-8?B?dlh6MGRWaWZ4bmpPaDNjVFYwQ2xldnExNE9zQjIwTTZSWVRFa29HdDA2aGV5?=
 =?utf-8?B?b0x6T1hrNUJoOEtrQlRod2d2ZVRSczVLWlVXZHNJYXdua3RCQkh1cnRLT3RZ?=
 =?utf-8?B?N3NRbjROVVB3TmMvaUFzY0M4UnVqVXhCZWRnU3VEanlITmZmeVFrRk03SDFy?=
 =?utf-8?B?Nmt3L1AxTXFLUE43VkdSaU56eFJtRnVXY2VjQ1lJbVd2aEFmQzhSOTFuUk5X?=
 =?utf-8?Q?HH+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTJsd3QvVGpoRlNnckgwTjJjRzhUWWdBRU5pUlRNZ1BIL0dxckN0WTNJbXdO?=
 =?utf-8?B?SVZwcm1sTXExd09rNnF4UHoyV3djMlljT05pejc4cDd4YmhKNlBkZ1lVTVlM?=
 =?utf-8?B?VEk2dmIvV1Z3cU5yejk5Qi9WQWEvVHd4ZnE2Q2ZMQTM2VnczZVhiQVlJbTlW?=
 =?utf-8?B?L1dYNEpsQjhPMHJuU0dSYWlaRjAvZGhWUVhmQWVyNjJQZUxtYnJuY3ZnRWlH?=
 =?utf-8?B?VDVvMWYxbHVkU3Bjdjl0WXVwZFZKc3dtVWZyVkkvTUNBcmZuMG52UjduOG5n?=
 =?utf-8?B?dXVCekZUQk0zemcvWmdNODhWZ2V4QklLdTFyZ1QzWk1XM05EbUgrNnFoZW9B?=
 =?utf-8?B?Rll2V1QwbXNpbEhFOXN4NFdPeXBQRUNFMW9JcWM1SHVON2FHUG1hcFVuUU0y?=
 =?utf-8?B?Wno5bUc1YzRTNmtFSFFsb3BPMklRVkFMMUY4TlZMbWhHN2Vtc2tMNTRycnFY?=
 =?utf-8?B?elVyeFdMOGt5dVpxV1g1aDJBRGhvT0JySVVsTmZ1b2hpR2JKVEF3ZE9iTzdi?=
 =?utf-8?B?YkxvRDIrWjd6cW5YTUQycEVxVmRLRnFaNEdaMjkwRkdmQjVWWHIrRHV6S1RV?=
 =?utf-8?B?TFdtTXd4QW1ZM3pWQkVkM1IzSjFnNHZ0Uk1FanJSZ0tIZVpxSVp1RmRWc2U1?=
 =?utf-8?B?WVAwTm9wem45VEwvRGx3MmZUaEJQdng2YU1VMlZOQkgxeDNkS2k5SzBDbXJI?=
 =?utf-8?B?eGVRMVZkenowTG9JOTA5YWRhaXNPQ2Y0bzJTbzJyd0xNMTlndmFkdldIMjZi?=
 =?utf-8?B?MVVOQUFFN0ZzaDV5U0hoT3ZzUnI4endzclVtZlgxb0NJaVppaEEyUGI4VUFH?=
 =?utf-8?B?YXdReGtvT3N6YjMzY0c3RUg1bHFWRzVlZjhwRS90Y2ZCZXlPSFNqem90NHpT?=
 =?utf-8?B?ZmV5ZW1sM3BLQ2ZVdlpKdGRidXlSaUVDZTY5Ymd1dS9BSXdvS1A5RkQyNEdI?=
 =?utf-8?B?OFdIODZBVmducGVGZWl0U3IvTm03UFBqd2tBelZHU2lrSm5nZWRlbk41Q1Rz?=
 =?utf-8?B?Zi9pWlYwK3cxeUZPbTZDd2R1MHQrbWEwdWZLZjZLMmdhVDZpdFZXSXNLendh?=
 =?utf-8?B?QU9SVFhwbHp4U29SZ20xWXZlSlNCTUgrWXpobzhkTVVkZzc4TUZOWVgva0dP?=
 =?utf-8?B?TlJldXRtZm03OHVIOEVMYmdkczNIV1RhNGxGSng1K05BR0JzYks0RzRVc0lv?=
 =?utf-8?B?NE1OVmhDK1V6bG5ZYy8wVkN2K3BNL1pNNjRnemJpOFJianp6QzllSitYa2Nl?=
 =?utf-8?B?UWlMNFNYQWpObkpvaEwyOWlYMzF6bk9EdHprbHR6dTFOUXRIMW1yTGl3OG5x?=
 =?utf-8?B?RWxQK3pwOVk3bWNvdmlkUU50aFJraytjM1JFK2NXejVHWEdjY016VU5YaHpE?=
 =?utf-8?B?eWZTeExVN0NXMFI0VE5iZEc3NHRZZWJ3eVozWHFkcXFsOC9sMks5dFlZcjI0?=
 =?utf-8?B?UzNkeEdKTGpqODAvOFdKU3hMcW1GQTR0d1FET2xXeFJNRXd6T2tFZ2R6WXpL?=
 =?utf-8?B?bVEwQk5Pb2w3bFZRL1ZrSGUxd3cwZGkxMm4xWTg0K01YQ0I0K0dXemt1S2VO?=
 =?utf-8?B?VkcveERCaGNhYzdvdEkxUGt5UHVGN0RmekhmRnBTZlg1Sk1iYm1DSHRDY0hF?=
 =?utf-8?B?Yy9Nanl5MDIvRk5ZWGowTmRndk13ZktTdVdXWDZGYStHMy9wbnYwRGJic2xU?=
 =?utf-8?B?WC9HaTJRV3VicGNNZVJlVDI1c0J3cldNNXFpRmk3TDhKRWtubmF6b2taeWlK?=
 =?utf-8?B?V2hQWjRMRGgwUkgyemhDY2lIcVZtci9ubm1FUkltN21ORkJ3ZDVkRXE2eE1S?=
 =?utf-8?B?Y1pRN0x5N3pwbHBERmx4KytIM0J3UDRPYVo3QkRBUDlBMFg0YmgzMW1TM1FV?=
 =?utf-8?B?NktyZFJBUzByYk1GL1JnL25NU2MwQW1wa0pDRFltaHlueGcwelFkOEI1bytV?=
 =?utf-8?B?cTh4My9Ebm5pbXVBVnpuWENiNVh1d2FnR25ENFN3RUtxa0hZbUtUc0doY3N6?=
 =?utf-8?B?YkIwTmgrV3Jtam9zZlN3Mm9Hd2tCWU4vbTA2RXVCZzRQazhLMEI1bDBYSlhp?=
 =?utf-8?B?b1MrVnlPa1RReFJqVitIc2VaWXNUaklvcDBXVjlLSTBHR1lzMTlHc1NCa1BM?=
 =?utf-8?B?RDhwVEx3alB6V1F6QjhzN1dTa05YaDBUQ3hkVytvUlpLaVBpVlFCcW5ZemIy?=
 =?utf-8?B?QWJpeWV6SVE3OFhCMjlqdVhhcWpNa004WnRZRXlJMmY4MWVMS3MrMy9nWDZl?=
 =?utf-8?B?dGdPM1JOK0cyMFQrbkZUbDZTSkhXTm90OUJ1OTRDN3VFeUczZTNCd0w2UUtl?=
 =?utf-8?B?Z3p3K3lHMkM0QzNlSjNoTVlwOVUrcWMzRFJ0dEI1YUx0MVYxd1A4SlFzbkdR?=
 =?utf-8?Q?CFfERnO70pXFKHyI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2379d495-a870-4a9e-4b9d-08de7017a871
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 00:33:24.7782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PdFHXc0xIbH13qaIdJ8Kv5fGxrXhacwveQGF5rHJa4qC3TPt8daL/xzLDtNTF34TyCT0mAdhZLZ0g7+f/tkrjUXpK8dlJinDjlKHkhNypqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4591
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



On 2/19/2026 9:31 AM, Zhanjun Dong wrote:
> xe_gsc_proxy_remove undoes what is done in both xe_gsc_proxy_init and
> xe_gsc_proxy_start; however, if we fail between those 2 calls, it is
> possible that the HW forcewake access hasn't been initialized yet and so
> we hit errors when the cleanup code tries to write GSC register. To
> avoid that, split the cleanup in 2 functions so that the HW cleanup is
> only called if the HW setup was completed successfully.
>
> Since the HW cleanup (interrupt disabling) is now removed from
> xe_gsc_proxy_remove, the cleanup on error paths in xe_gsc_proxy_start
> must be updated to disable interrupts before returning.
>
> Fixes: ff6cd29b690b ("drm/xe: Cleanup unwind of gt initialization")
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
> v4:
> - Replace devm-managed cleanup action for xe_gsc_proxy_stop() with a
>    manual flag-based approach using a 'started' flag. This avoids a race
>    condition where module unload could start while the async GSC proxy
>    initialization is still in progress, potentially causing the devm
>    cleanup to be called at the wrong time.
> - Set gsc->proxy.started = true at the end of xe_gsc_proxy_start() when
>    initialization completes successfully.
> - Check gsc->proxy.started in xe_gsc_proxy_remove() to conditionally
>    call xe_gsc_proxy_stop() only if the proxy was actually started.
>
> v3:
> - Move xe_gsc_wait_for_worker_completion() to xe_gsc_proxy_stop() after
>    disabling interrupts, since the worker shouldn't be queued anymore
>    after interrupts are disabled.
> - Update commit message to clarify that the error handling changes in
>    xe_gsc_proxy_start() are necessary due to the cleanup refactoring,
>    not a separate fix.
>
> v2:
> - Split cleanup into two functions: xe_gsc_proxy_remove() for SW cleanup
>    and xe_gsc_proxy_stop() for HW cleanup that requires forcewake access.
> - Add error handling in xe_gsc_proxy_start to disable interrupts on
>    early error exits.
> ---
>   drivers/gpu/drm/xe/xe_gsc_proxy.c | 42 +++++++++++++++++++++++++------
>   drivers/gpu/drm/xe/xe_gsc_types.h |  2 ++
>   2 files changed, 36 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gsc_proxy.c b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> index 42438b21f235..afafe8b41e65 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_proxy.c
> +++ b/drivers/gpu/drm/xe/xe_gsc_proxy.c
> @@ -435,15 +435,11 @@ static int proxy_channel_alloc(struct xe_gsc *gsc)
>   	return 0;
>   }
>   
> -static void xe_gsc_proxy_remove(void *arg)
> +static void xe_gsc_proxy_stop(struct xe_gsc *gsc)
>   {
> -	struct xe_gsc *gsc = arg;
>   	struct xe_gt *gt = gsc_to_gt(gsc);
>   	struct xe_device *xe = gt_to_xe(gt);
>   
> -	if (!gsc->proxy.component_added)
> -		return;
> -
>   	/* disable HECI2 IRQs */
>   	scoped_guard(xe_pm_runtime, xe) {
>   		CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GSC);
> @@ -455,6 +451,29 @@ static void xe_gsc_proxy_remove(void *arg)
>   	}
>   
>   	xe_gsc_wait_for_worker_completion(gsc);
> +	gsc->proxy.started = false;
> +}
> +
> +static void xe_gsc_proxy_remove(void *arg)
> +{
> +	struct xe_gsc *gsc = arg;
> +	struct xe_gt *gt = gsc_to_gt(gsc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	if (!gsc->proxy.component_added)
> +		return;
> +
> +	/*
> +	 * GSC proxy init is an async process that can be ongoing during

"proxy init" is ambiguous here, because the xe_gsc_proxy_init() function 
is called synchronously. Maybe use "proxy start", because that is the 
part that is called asynchronously.

> +	 * Xe module load/unload. Using devm managed action to register
> +	 * xe_gsc_proxy_stop could cause issues if Xe module unload has
> +	 * already started when the action is registered, potentially leading
> +	 * to the cleanup being called at the wrong time. The 'started' flag
> +	 * is used to avoid this race condition by ensuring we only stop the
> +	 * proxy if it was actually started.

This last sentence about the "started" flag is a bit confusing, because 
it doesn't directly avoid a race condition. I'd replace it with 
something like:
"Therefore, instead of registering a separate devm action to undo what 
is done in proxy start, we call it from here, but only if the start has 
completed successfully (tracked with the 'started' flag)."

with those changes:

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> +	 */
> +	if (gsc->proxy.started)
> +		xe_gsc_proxy_stop(gsc);
>   
>   	component_del(xe->drm.dev, &xe_gsc_proxy_component_ops);
>   	gsc->proxy.component_added = false;
> @@ -510,6 +529,7 @@ int xe_gsc_proxy_init(struct xe_gsc *gsc)
>    */
>   int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   {
> +	struct xe_gt *gt = gsc_to_gt(gsc);
>   	int err;
>   
>   	/* enable the proxy interrupt in the GSC shim layer */
> @@ -521,12 +541,18 @@ int xe_gsc_proxy_start(struct xe_gsc *gsc)
>   	 */
>   	err = xe_gsc_proxy_request_handler(gsc);
>   	if (err)
> -		return err;
> +		goto err_irq_disable;
>   
>   	if (!xe_gsc_proxy_init_done(gsc)) {
> -		xe_gt_err(gsc_to_gt(gsc), "GSC FW reports proxy init not completed\n");
> -		return -EIO;
> +		xe_gt_err(gt, "GSC FW reports proxy init not completed\n");
> +		err = -EIO;
> +		goto err_irq_disable;
>   	}
>   
> +	gsc->proxy.started = true;
>   	return 0;
> +
> +err_irq_disable:
> +	gsc_proxy_irq_toggle(gsc, false);
> +	return err;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_gsc_types.h b/drivers/gpu/drm/xe/xe_gsc_types.h
> index 97c056656df0..5aaa2a75861f 100644
> --- a/drivers/gpu/drm/xe/xe_gsc_types.h
> +++ b/drivers/gpu/drm/xe/xe_gsc_types.h
> @@ -58,6 +58,8 @@ struct xe_gsc {
>   		struct mutex mutex;
>   		/** @proxy.component_added: whether the component has been added */
>   		bool component_added;
> +		/** @proxy.started: whether the proxy has been started */
> +		bool started;
>   		/** @proxy.bo: object to store message to and from the GSC */
>   		struct xe_bo *bo;
>   		/** @proxy.to_gsc: map of the memory used to send messages to the GSC */

