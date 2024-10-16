Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A969CD1AD53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCF710E6BA;
	Wed, 16 Oct 2024 12:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FKLSLIP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C6910E6BA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082419; x=1760618419;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZQ+WJZMYlBNtYkVk9Briu57LcyWmSJZjhr+opSCoGDY=;
 b=FKLSLIP9YcX7IyZnssxnPWNZU4+J6bpvr+sH5uG2i9myAWdUh4G2BkuF
 Y2Y0f6I6h3zzQJRuoNxNLXQ4ANAz97y+aFeJF9Q6NqK2SedXSzrpUzJBa
 evMECrZKNd/u/a/87O0HJFZ4ivEiU9N+HugGyXXuWW20yOeDHOC61B+H2
 bFh+IqkACPEMBl1BmmACxEz5j2Ortx2xB6oV8JkTfpV50+4MBqJLcYVfl
 KAZ9JLStpjmJEnwa3bwCDkNvDPyOVEUcZQmTq34Aoc9ghI+b5ykdI1h6X
 woSPs8rqH4sgBd6vd3Zsa5TY2LO49VZhSBfFRGFl2D793Uq2xOF6bOwmA g==;
X-CSE-ConnectionGUID: ZaL6HC0pSVWckGPPjnkJ/A==
X-CSE-MsgGUID: cgIVvh0OTbmdU9P9RlxixQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="27998319"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="27998319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:40:19 -0700
X-CSE-ConnectionGUID: 7XnP4WVGSt+aRkdjzoDwEQ==
X-CSE-MsgGUID: 0aeuExncReejtEL2nf09tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="78101412"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 05:40:20 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:40:18 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 05:40:18 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 05:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMSrosPP3WkDrGILh6Q+UrB0nb9gpvh+6zmqh/g8pUYIQJqzKo8zo5zNSZgyRmS1IshP0hKUlnhToJcOHGaEYjZU91qAawhOvAbHFA+hSMJSJSrK/p2VAN2YIrgbFep1VPmY/zGIanaA9eB9qd1c0RFzVK2oSLW9WHzBu0KWS5ezez1oI5nVJfxvWv1lD0T1e0pTZXscLfZY1xufRYosBo59CVo2yQaPs2DPz9uSUWwlB3x5w6WovWPj+NVxj+mWFlcJNPTN3Ztj49j9eSwB554zF8yWRt5r5XDOxBpxnpAzLtpW9bzm8Z7dHagFhWoW4VYSnfBO6WnI5ptpz+bPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUGuzXtWmRDXqnjcN7gblNKcMMhiv1ZvAfvTFna+amA=;
 b=ygwpfHq/tm0gLdTtkt+zdog/y/YE+lRkdNBIzo+a0UxzlKNffle/b6FeV3g85KCM471kJ4BivOUudhBdHEih6J3xFLLanAn6XwD6b2V+1zdyXkfdK1GMUh1BBIrqOKZn1lLb0YU02flwZLFk55csCFaaH0jKJ9QDRnhIPM3Mp+XKV0K8QRXgnpPo6//bsmfWrQXQGIxLUVp1GYBisiU33OyYKWoaPoFkUBtZwIZT7B/xNTiC9DYPGUehiBl0l1iAjq2YPqtaZIx2oAUzuOkfSGsjRJzl+mcGCYJV6w3J67ItorvG/8Q8try2MZu4LwpxciaUxni2A/KdYYwyh9o0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB5890.namprd11.prod.outlook.com (2603:10b6:303:188::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 12:40:14 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 12:40:14 +0000
Message-ID: <1a2b4f6e-eeaf-4258-bf4d-75a28b7cbd59@intel.com>
Date: Wed, 16 Oct 2024 18:10:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 22/26] drm/xe/query: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-23-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-23-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::9) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB5890:EE_
X-MS-Office365-Filtering-Correlation-Id: 27368e91-f9f2-4442-d639-08dceddfae4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm96NDY1MFRyOTg2bnkrdFhSNTdqLzlvaUl6YXJ4ZHJGNThRbzFPZVlwTkl6?=
 =?utf-8?B?Y3htYXMyUGxxZUowR2hVZlpacFlSVGVxSG5sVGhNOHZmajM0dDZtOXVGSjFM?=
 =?utf-8?B?VEhkN0tsRVNoVzdDZHU5bzNjTzZpeGVUMjlzeG05SmV3Qy90TzNhSmRWaEFQ?=
 =?utf-8?B?QW9hVnRpUkxRMmtodjJkRk1SNzZkb2lFajBpY2FCN1A3OEJpUXk5R1p2MmN0?=
 =?utf-8?B?eWFGczBlUmNrRGlmNzZ0bEJ5cVNKWlVYbWM5Qm10anRja0hMSlU3ZkRyYWVs?=
 =?utf-8?B?ck12RmdEVnhRWXMvQmRvTDR1WkVnbGR4Zm9QR05POFFRdWdtQ1VxM21BZDlE?=
 =?utf-8?B?WXhyeDMxbW5ySGprRVVXUnpwZ3pBUE0yOW4vMW10U1BHdWYxYzUyYVN6cWh1?=
 =?utf-8?B?aE9lVm1jYThBbU1kN1B0RUI1K3BBQmIveHZDb1VCc1dwUDFzUXZEaTdDT2xq?=
 =?utf-8?B?UHF1Y1RRbitFODF5UTBnbzE4QXpCZkMyL2tNWElkeUpWNWtKVWhhMHdiNW11?=
 =?utf-8?B?bHpTOGNPeGxEWW9XOVRKM1JhUnY3SjVyWU9sLzE3Y0NSeEowbWtCMGxKS09y?=
 =?utf-8?B?bm5sNEE5Y04wNmF3aDg0OUgwd28vTkN3MnJtTDVZbGkzYm9pTUhLalhVSkNQ?=
 =?utf-8?B?Q3FQRUhudGdTRDdwNlRWblJHeUR0UE9sTHl6VlZQNFE3eGhvUGZhRlVvTU5Q?=
 =?utf-8?B?TkZ0S1UwbFY5dFlYTW9nb1duSmZjc0FsaWpxQkF5MFdJRGV4NVN2N3dlS05I?=
 =?utf-8?B?MTZSUCswTnhCNGV1UjRrbm9YTGxISTRyeTArZmluUjdNUXdVMUFJcjRKR3NV?=
 =?utf-8?B?ajcrczdpZTlXTmtnWHM2QVBhWTBtQUpDMzhpMEQ5b3JpeEp4dHhTNWU2R0xC?=
 =?utf-8?B?QlJpeE9sV1RkTWNYS0FYQzRpczVYZ1kxSDJxOS9yZjlvTlRSMGRqWmE1ajJr?=
 =?utf-8?B?ZUMzd2k0SSttNmpnSDBkMDl3bERkYmNSZFdXR0VJbGdvU2RZZm9DdTRzTUQ2?=
 =?utf-8?B?V1pQbXI2YkxWREFTR1ZMRUZqUnNXUlZ2ZXdHbHl3aE44T3ozbTIvZTNHak52?=
 =?utf-8?B?QjdBQ2JhSHdBZlcvSlN5cFdTbnM5VzVSQk92U21qWkprS28yRUFSc3BtVnAy?=
 =?utf-8?B?UGNhSTM5YjY4TnRFS0p2MHNZcktIR2ZORTRvYm9vWXZNR2ZNMVkzWjFILzBj?=
 =?utf-8?B?MXh3bXFURGlOVVBpTWh6a0xiK01CUVBGalIyL3lTeEZSc0tUa2xEL1FGVk5E?=
 =?utf-8?B?Tm1wd0RhYSt4YnJOb2ZnQkNJM0pIVElRWkJGWmZaYW5lY1M3ZlBadWpVbU14?=
 =?utf-8?B?bkpDSDJVKzVBOHBXcnRWbVNhV0NYd3pnTXF5ZjVoTXQ1UUZ4UE95RFRUaWps?=
 =?utf-8?B?b1kwMk1TN0lpUmFSNGtFRVRjYUZLakpUR2VSZ2dRcjRna2hFQ01sVjRXRmJa?=
 =?utf-8?B?MlVCNzNhdGpRRG5MMFA2QlFFM0FKNWtNN2FYM3NxWU1DakZQVjRPS05NaXU4?=
 =?utf-8?B?VnB3RHpiRVJqeThReHlwMzlhTG1qSzVsR1hxd2VuVzBHRXNqNFpvb2lWWmRa?=
 =?utf-8?B?VThoeWorTUR4QTNOR3dpWHRsUzdyWWh0SnBXeUdYdEo2Vm05UzBaUXBDaVFB?=
 =?utf-8?B?VnRnNjIvLzNaY2x0MUJwZ0liSUtGRm5IU1FQVHFQRDFUTmQ2L3FZcWZCSTI4?=
 =?utf-8?B?STdzOGE4NFNSdk81M1BBcUUxTHhZVDE3YndRSzFrenJMR0Z5Y3hJMTdBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGloRkJqTVNBMlNZQzRjZWJUb01vSW9XbVRqdktUVTkwWlc5cmRnR29TVC9s?=
 =?utf-8?B?LzFhYjdvaEd1eGkzanJLZ3c2eHF0S2hDRmJTOGpyUHQ2NGQ2VDByR2N2SzlI?=
 =?utf-8?B?SGRhOEY0WjlEV21rRytmTHNVMEt5ZkNvaWZ1SVNVdDNzOUFGeUhpRXFaU1Fn?=
 =?utf-8?B?MDdabjJRaWJYUHNYSHpnS2cvR3V2VVJvVFlaR1N1Vnp6NEFuNGRRMURtL0pV?=
 =?utf-8?B?TjllbExjNnMrMEVlUUxCQnhpdENCYlZZVERUNFNvUE1qOGN1RURSMTljTURk?=
 =?utf-8?B?cWZkVXA1V0hPdnJ2SEhRRUZMaE93eHdabkRKQUxqbkdYbnI1NE9oNzZkUnhD?=
 =?utf-8?B?UE5YR3Y5NlpaM3BTb1BhTkdMZFRTOTZadHQ5emhlNVgrSmZkKytJcWZkRDlP?=
 =?utf-8?B?STFEZEN2ZW5zdE9ySFlZbWFxT1kxZ0d4K3hwMmZqMjV6MUw5bXFscEJNK2la?=
 =?utf-8?B?ZzNqendQTi95c3dVd0luaDJlaUtUVTY4YmdGYThmdjVVcm8vb1EreEZhQ2xY?=
 =?utf-8?B?NWlNNmVvaWdIUCsyTnpWenJBNGRjeGVFMnc5MTVxcW9hZmxaUlhnWi9TV1BT?=
 =?utf-8?B?M3JqMXZnUENqSmxlaGFEMDNZV2I3UEh5azFLa0kxVy9FOVJUVG1ZMUo1RlVW?=
 =?utf-8?B?T2VENUt0MmxFREhDV25mMWR2VTZNR1hqS1lzbFg4OC9YQVhMTmhJYUhiLzd6?=
 =?utf-8?B?TUx5bDBzc05ZL0VQSnZKU0JsNnNnSHVKUk1ScEQwQ2thbmRoOW1oa3Vwd3Jx?=
 =?utf-8?B?cEVVRHRnbU9hV0hTblc1cEFSWjRyNjNYYWZoSFhqbXlaSXQxRUVZd1Zud05o?=
 =?utf-8?B?dVRxT1JaUkJxVi95dnJ1aSs0dUJWMDNySkJvUncyKzAwWDFNd1hPSXFJaUVC?=
 =?utf-8?B?eHQ0eDZwbGR1ajZIMlpXUUQ5OWpJTnV3WnhCTXlxNi80OWh1cGxHRlVlK3ZF?=
 =?utf-8?B?ZHkvK1B0emhNUHVkMnRXODlMb1RVc2RtZlhEZzJReks3UzdjZ1VTWHZYTGpO?=
 =?utf-8?B?ZDR4aW5LejBOU2RWZytMa1lMWHlubS9wK2lRcmlkMW1NeTk4eCt4VFI2N010?=
 =?utf-8?B?Yi9VOHZUdjJXMnFKNldJckRpWTRZdGNDWVhmbm1Tc2VDUHYwL0FrSlpmeWVL?=
 =?utf-8?B?d1BlYnZ2VWNoazJYT1EwZno1ZENkZnYxeXJmdGVDZUV1K2RQZndVU1NpZEMv?=
 =?utf-8?B?MkVzY2ZmVUpTem5wNTJwcTZFVGp0QWxRbVIzK3RFLysvOWh3ck8reGhJUXlX?=
 =?utf-8?B?NGZ0ZDVhb0NIUGRWQUtCaitndkRhdnB2NHdDZStQMzVYdWowNWlUWW12WkJL?=
 =?utf-8?B?QzlrVEdVRWczOUVSKytTZ3V4bi9ZZlhKc2ZBc1ZCTXpGcy94Y3Vza3JNcnAz?=
 =?utf-8?B?L0dGSjlTZWZmcktTTFVsdk0rSm1Hem9IbFVDU052RUIxZFdqd0J2UHNNMkI0?=
 =?utf-8?B?MWNIWTMzS3RMT3FpejJlUTBpNm1BdmI4bEIrdCtTdlhac1ZwZ3B6T3E2UHFo?=
 =?utf-8?B?b2k3VTloWkoyeWdBMVJ1YXdMQ2h2c1RaQ3UyTklaRWpWMjllSHBpcEFUbUdv?=
 =?utf-8?B?b2FkT1pNLzVTeVkxQXYvLzJ1YzFPeWtzNlhST1lzUFFCMXhUUE03UUMxNzJL?=
 =?utf-8?B?amprc1RNSk8wVDk3WmtzUVZ3WDJCTEZuWmJBQXUxS1YwaWJhYndHVUpKTExO?=
 =?utf-8?B?VHVyQ3k4b2FWekJKY0UyV3hkZFc0L2dUSC9yVnRXTk9pODNQTTl2VGIvS2hK?=
 =?utf-8?B?eUlqZXVGaW1OTXZmd3FvdU13RmM2YWc1K016QzQvWGxCbFNNNlQyNjVwd21W?=
 =?utf-8?B?c2FjWWRZR2czUDFtYVJuMGhrdERnVGwrbVM5RXNvcDJNMGdlcXBxOFh1cU9Q?=
 =?utf-8?B?d01EVlZnT0Z1Vmd4SUVOSkZvOUtRZEEwd00wQWVYZTFkMUcyZWZSMzJoWXRM?=
 =?utf-8?B?aHIvYUtFeUptMW4vTkNMMG5oR1hwcFpjZnRSRUlGNjNTQ0dVcnE4azF4WGtO?=
 =?utf-8?B?ckN3UHlJYkZWTVdLTGVuL01HVUZGRmIxUkJRVEFFUHcrVW9Tc0VGWGk5dUN1?=
 =?utf-8?B?cmpZdGJTRkR1TEV0b1kxSzFNeVVvejFWdVZGdm1BSWRzc0RpakZKYnNLM3Fj?=
 =?utf-8?B?OWl2Q01VYXhoTmRGK2tvM2ovSm12Ykx6ckUxUDdnRlBXTDVMRlMreTFoam1X?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27368e91-f9f2-4442-d639-08dceddfae4f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:40:14.0615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7IRzO9HJQdymhlJIAR2QEhy5cNvhIBQKxyXUkMKpL0UP4m6dTs0sCxRb+CC8QATXFwYL06Z80mCzkW4tXugjWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5890
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented
> domain mask, a non-zero return value in the case of XE_FORCEWAKE_ALL
> does not necessarily indicate success. Use xe_force_wake_ref_has_domain()
> to determine the status of the call.
> 
> Modify the return handling of xe_force_wake_get() accordingly and
> pass the return value to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v6
> - Use helper Use xe_force_wake_ref_has_domain()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_query.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 5093a243e9fe..dcd1291da057 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -117,6 +117,7 @@ query_engine_cycles(struct xe_device *xe,
>   	__ktime_func_t cpu_clock;
>   	struct xe_hw_engine *hwe;
>   	struct xe_gt *gt;
> +	unsigned int fw_ref;
>   
>   	if (query->size == 0) {
>   		query->size = size;
> @@ -149,13 +150,16 @@ query_engine_cycles(struct xe_device *xe,
>   	if (!hwe)
>   		return -EINVAL;
>   
> -	if (xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL))
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))  {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   		return -EIO;
> +	}
>   
>   	hwe_read_timestamp(hwe, &resp.engine_cycles, &resp.cpu_timestamp,
>   			   &resp.cpu_delta, cpu_clock);
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   
>   	if (GRAPHICS_VER(xe) >= 20)
>   		resp.width = 64;

