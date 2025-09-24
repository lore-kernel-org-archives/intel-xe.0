Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E9ACAC5A5
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 11:50:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B158C10E07A;
	Wed, 24 Sep 2025 11:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCiOLG2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6879D10E07A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 Sep 2025 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758714616; x=1790250616;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6QOBwe/Grylw9WkoSXwnhWHPe5mHNvZMGV2U9YiMHLM=;
 b=cCiOLG2J4H4HwOMBAjoTHpNJiynPyTsQK1wiHA3thUF/9VbfbjJWPxKu
 6VvPGakuS0NrDMAZHPaBHtYArjYAwm50xetnIm9VxRxAahw1ifSjm1MKQ
 RLc08xEFiTkMTAVF6JgYQACyIqsGgsWtzBeKOLnY/D4DYGZsZft6i4hp2
 Lw2gVvB5ImxqPn6Z0eNZw4JLzyilB3dzG4KghA813fablw1FKAebeuxQL
 k2kW17qs9wSEg+d00g+UDzeVXWgyXlHOmnBd8GMy09Jo6hk2L+9uH4DOd
 QxXETSa23ajSlt8VVKftDzKT9NUmV3yBd8jCkRhTIQNFdslGJpknm4/4v g==;
X-CSE-ConnectionGUID: VXmTbJCpQ1ONhZKokotx/w==
X-CSE-MsgGUID: GbEVRy0STCOZ9jpTy52rIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78643177"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="78643177"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:50:15 -0700
X-CSE-ConnectionGUID: pqGf/pziQIOr22QLLg9Bnw==
X-CSE-MsgGUID: zZVCMnWxS9irpWaWj0Au9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176310552"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 04:50:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 04:50:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 04:50:13 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 04:50:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iot7h0XiOACcgt0Ddy936a8OCtKQbZ5IjPl4d/jZZ3Nqt8GEpOwmt5JozilwH0Vjcs+hx12+zb8ETcdSCnqkIbh/dutktjSWfng0D+EzAX52BvKYWMQmhcyGQxmvPzE6eM/4+vZuKtR+YnSHaN1eGhzkLU7hFFPxwygQz7vP2lWPx8Ac1GXPhPEcAZ5CCJ5PiVbNdJfdsZ5MD5MMBK+ZXySaP8H6TbFzr2MpCjwbFrg9FCpL6NFV2VAKi/dUxQ+jh2UEq58xivAxVK+7JCamSnxDzrLHEegB3EeQT5EKEaUt1X25VBdzCJVKr/l5qOc22Cfhj30mEH87I3Vi0uMdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fjoEa2M8tnsUM90WEcbXHfin/gy07zZ6l2GeAN3Hqvc=;
 b=kTaQwd6TrYJAzHL4g1QCjasveeNI1GHyXLAXp35uTSejNC5no8fvfXgvyzbh0WYH8p4rPZ8XZWfYsSXzr+AN02GMi7uZrKlpjpeH2nguAe7q7H5G45npRYHc4NrBsY2/ZIdzaO/cjw2rKIS4tS0UvWtBJjEAuRJPj3hJhvd099poibN5110vRkS7O4iVJU1mGwcJjqy20rla1RLFg68ci6xr/74oUqB7Hm1XTAmMhaKj5gQw1t/VWT6UUWvNiZX7RIDj+XtbDtlb5IK1Cb/8Uz+Id8Mv6d29hWSVOIzH+dZnsM9Vs0GeJ0eHjQNHM1mVcxJKsMhS00KXgm1lIk75Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 11:50:11 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 11:50:11 +0000
Message-ID: <768e2497-cad8-4b90-9c95-969071f35236@intel.com>
Date: Wed, 24 Sep 2025 13:50:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/34] drm/xe/vf: Start CTs before resfix VF post
 migration recovery
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250924011601.888293-1-matthew.brost@intel.com>
 <20250924011601.888293-25-matthew.brost@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20250924011601.888293-25-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0902CA0036.eurprd09.prod.outlook.com
 (2603:10a6:802:1::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MN2PR11MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: e97bea96-74d1-4b7e-59a4-08ddfb608462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlRKL1ROTE5rTytZQmxIMktXV3p5bjIrVDVWQkU0YkcrL1BITkczTWR0Qzgy?=
 =?utf-8?B?N1pOSXJGS1BabDRzelM5SU15eVN4TlNOTnlGZnAycmJLK0tZUE1uQk04MWs3?=
 =?utf-8?B?cU94d3ZaV25WdjMyaWF2OGthMlZEYjlEMksxSjN0SmdUd29YNjVTR0x1dE5q?=
 =?utf-8?B?cnFmR0V6RmpyS1lVTk9LQ0cvTUdFQ0RrUkE4M3dWZnBheThhZjcyUG91QTVC?=
 =?utf-8?B?ZVhTeXRxK0tkVE1NdDBjQ0YxRkV2b1ZmbWZvVC85SzhKbmdKVDdkL1FWNVhU?=
 =?utf-8?B?WWlpcUNoeUJMcE54ZFVKd29pZTlLV2JxU0RzSnNkVW92dXNWMWFRSVpyQTNI?=
 =?utf-8?B?WG1nRFNqcTI0RnYrN1JVRUU1SFRuL2hXMHdoY2N2TGEwOFVnTEFHT3pmWFI0?=
 =?utf-8?B?b3I3WWpUMUJHYmxIR1VqRzNwL0NuemhROFBZbUg1YkY1d0Nrd01qWUdndmxQ?=
 =?utf-8?B?ZlIvWUFZR0drV0Z4ZzV1ZVBSQkxMeXY1bTFyOTVDUnc1MDQyTlNtRm1aNUNU?=
 =?utf-8?B?L1U1aG02YWtoeWRSNCtMVXF0ZEhYUWV4VWxFWmtNanZhVk1HSTZaTUhNM1pV?=
 =?utf-8?B?RmZObGZLcURxUXVpNUlCZVlJV2dweVp2MFJLNXcvdkRRdVdVYWNVeTZ0NDJq?=
 =?utf-8?B?R1VzcjhVMDFlVGhsSzY0SjEvQmorYXFmeWtqMmZ0ME9CMUFBN3RCTUJMSTNo?=
 =?utf-8?B?MzhVVHZXaFZvV01KUVM2cEhNS01CVjlqUDNPOFF0WUlRS1NlVzBxWTV2WDR3?=
 =?utf-8?B?MUZGcmh1WHhRbkc1b1NyYXowODZhNHNxeE9qVkRkdXJJenB2R3NZd1hvc05j?=
 =?utf-8?B?RGNOcFB6aEhTK2NBOGVFNzhzMGU4cGpKL05SZks4UnNmUXJtRGpaNmdQQkFs?=
 =?utf-8?B?eVJweDV3UXNYb3U5MGZKMlZ2bnZOZkE4UTZ3ZElqdmZXRUovbHBYWVJDRnl3?=
 =?utf-8?B?VXlFaG5kTUphNmUxaTBxMktTMEcyd0sybnp4d2kyTHVIdElSdm5KbS85aGpT?=
 =?utf-8?B?WHZMQnE4bjNXWEQ4N2V2Y0UyZmdMRCswQkN5emR2UGxhUDFhNWRLdEtIY0tC?=
 =?utf-8?B?N052SUVRUHlTRnErV2lSek0ydWt6UndjZXBYQnBVTWNvYm00NWtVbnNqRTVo?=
 =?utf-8?B?S0hrSVh6REM0RC9zK0E2WjRzcVZENk5OMnFlQjhwSldhQy9iajZyTE5sVDZu?=
 =?utf-8?B?dStJUnpKSStqSXJyQUQ3YkFCS2o0VVR5dXNOMThYT1hwSklvWWtFeURnTEQv?=
 =?utf-8?B?OExzSW01TlUrc2RpVVplajl0MzhPK1hlRm1pSDgwQ2dsajhYWnkyd3Ixb29U?=
 =?utf-8?B?bWZRUHF0ai9oSzRvdVYyNXdiZ0xqV01LQXg0WTBSYzRhUjNHbHNFRUpUMVlQ?=
 =?utf-8?B?V3FkaGRVVE1razVEY29BY2h3eXFyQ0lQTGtWYU5HKytnb0l4aXMyYi85eFZw?=
 =?utf-8?B?TjB4OGt0T0dEVHB2eStvMlA2K1ZHTjBnUFNrWmVsK1R5cEE3OFhGTkdBU1J5?=
 =?utf-8?B?MTB0YU4rTTRnQ0wzQk0yTmtWY3F6a1VyTGRMVk43SjlwUXdWdU85MEhRQ1d4?=
 =?utf-8?B?UmhlV1FFa1lJbDJhZmpkaVZHQW9jTVJ1elpKMitWNzAycURhNTM5NlBlcjFM?=
 =?utf-8?B?WWgyamRSSzdLcm1jZ2ozdlB5Y3dsOU1HLzhJMlFzNUhQYVd4WnM0VHZNQ2xk?=
 =?utf-8?B?Z2t2Wm4yYzNMd2FyZmVyeEtUaUZxb1NlUngrZlprUzV2Nm9FSVllMFpya1dt?=
 =?utf-8?B?QThsclc1VEs1dGRmMTE3L3hudnlsbXcrSE9BVVVoaDdKcnVUV2dGNFBHMmg3?=
 =?utf-8?B?QXdhcVRIQTFWWlBoZzNhdmg3RWJ3SVcwNk0vNjhMaWp6c2hLamFpUEZldng3?=
 =?utf-8?B?ZkFXazVLamtsYWNXV1RuQlBvdHplVWRSeStpOGVkSEpmVi9ES0kybTAyZ3JW?=
 =?utf-8?Q?IGwUnlD4Zxc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bXRkV051MTlNWjZBRHZKQkJlTy9qSlhKNVNZY1ZLNXJFb2l3UW1JcGQ2cnp2?=
 =?utf-8?B?ZWpFNXkwZG54aksvN1dQN1dsVlZSenkydXl3WUNqR1pKTzhIZVRNOVJkLzU3?=
 =?utf-8?B?eUU1ZHVxT1U0aERPVkVHQUhRYkNqQzFsajZrblFHTXh2T2JPc2dramt1cGdT?=
 =?utf-8?B?UkRxazBaRDZXWlhWSFI2UjhZTzVYYlpWUkVNWWxkczY1eG1la1dURHdTeG1p?=
 =?utf-8?B?SjZhNytRN2VadXVVaS8wcXVzVmtBNHdOV2I2VFJ4blFDMVRLc2ZXbzd5RGh5?=
 =?utf-8?B?QWt1WUl0L2ZYTTdqQU80Vi84UU5tNWhuS0g1NWdvWnQzb1RkTkF0Rnpqd1U0?=
 =?utf-8?B?MGpGNmhrcGxNeDlDcXlTL2prcURZTUpMUEtHbDY0ejN4QlBEa2hLL1J2Q3dR?=
 =?utf-8?B?eTFZUFdSeVhGWTk5Y0tXdTFnMmlyTlBEdUY3WjVRQkRwQTJiRlorU3JMQXJG?=
 =?utf-8?B?TklZVCtPTENSQVcxVUxHNDBOTWgzY29CMGtKT0l3WC9ZUnJYOEsrQ2lJM2Rz?=
 =?utf-8?B?NXR6STNVMEhQNGZVNHAyWDYvcmxXV2U4d2h1eUNuanUvTjJuaVZpQlA0VHp1?=
 =?utf-8?B?RVJJb2tvVDBzWUlBYXAxSjNxR2ErWmJVREhBaFQ4QndwcVJBcktTSDAybm0v?=
 =?utf-8?B?cnJnYTkybFl1NXN2L2NjWEJ2WDdxUE1MK0VuSmt2SHd0NWxqeHRwUXh3OUk0?=
 =?utf-8?B?TzN6aWxhNUQzTU1FaFh1cWJBeGQ4TlNnNk5WV0c5ZDRtUlZJVUlEcTF1dEow?=
 =?utf-8?B?TTlnV0RBSDl4NFEvRTNUL0dpNE5VcUpwS0ZlQUYrWTJkNy9GaThPVGJiRDNn?=
 =?utf-8?B?cWl2Y09IUnUrNkxwQU5NUzc2TlJjOGxpbWVQNkFJeUFHbThzcjYrR1FCTjNP?=
 =?utf-8?B?NTQ2MGp1TXVVb3lwb1lZTXEvODVDRWY1VHpBSDF5MGtYdDVaRW5QakVzUEha?=
 =?utf-8?B?NkViSTNwb1l1b3BBbS9iQmttL0VKY2ZwRExoSWE1S0hpamd3VE84SGlYS2w0?=
 =?utf-8?B?Wktnb1hJSm41YjlkbUZOOVRVSERVRHRBckRBbHd1UUg0R3IrKyttb1dmNlpy?=
 =?utf-8?B?dWZudFYxZDdSUmNGZUg2T2tIRSt1dlJNMldPdHZxbmloSDduYUFBU0VWZTVa?=
 =?utf-8?B?cHl3RFF4OFNSSFM4WWNVTFBJVERNckRrVXhkcW1SdTJlUk9abHpFRWc2aXBX?=
 =?utf-8?B?dnVrMmdtU0JIdy9EbnJ3N2tQMlI5Ulg5OFpQcjNLeUlDQ0NmNFF3bzNkSTF6?=
 =?utf-8?B?SWQ4S0h6eGcrSnYrbC83MW9BWUdHYWxzNWFibUlQTlFNc0c5b3BaQllOK3Vn?=
 =?utf-8?B?cXhVbmVXaFZPcG1ISElWYW5BNXBxZ1J6UXZRTVVQZDBLbXViRWY3V3dRei9M?=
 =?utf-8?B?dHNtbXJJRDhNMlkyRFBtYzhjYk1nTTRpai93R2xGZ0V5dmkrZ1U5MVEvWFda?=
 =?utf-8?B?eEZnZFRQcnoydXJSaHJiVmVnTkhFTTlkdHUzQkRzdWQvaWYrNldaaWVkSG9R?=
 =?utf-8?B?SEJrOVA5MS9NUmxQY3puQjgxb1REVDA1cTByYzJ2ZnJPZ3lYODMwNkxyVU9x?=
 =?utf-8?B?a1EzN2lkSmd2NzFkUmhib0grMFdnUkFJNjdIR3V3SlE1MmFzRktaU0lNYytk?=
 =?utf-8?B?YSttWVBHQ1E5WmoxZHF3UWVCOGdQRmYyWEo3TXBnaXRVUEp3UDJnNW4rRTFS?=
 =?utf-8?B?OUdlNTh1WjdJd21kOFlqQkNxc09jRXQ4NC9FYXdkUTZnTFJLNS93V2gydDd6?=
 =?utf-8?B?Y1gzSjlKRTMwZnBhU0FTN3Zlcnhiakc1bkV5U3lOUlMwNVR3YkVhOHYxVDN3?=
 =?utf-8?B?a1dBS2JNNlVzcThOSHUyakZVeDVxY08zUng2WVVVdHZqK0tUa2tmUll6Z0dw?=
 =?utf-8?B?RE5ZVGQyWUFRVGJoYURwVmU1OGU1UE9JWVg4SG9RV256bmJtOXZFY3B2aytv?=
 =?utf-8?B?bm5haHZGeHBrV2hyU29YSXgvZkUyS1dVYU5qa2w2NDZyMkVhN3pJWWVBMVEw?=
 =?utf-8?B?TGtUcGJkTXEvNHlmWlJpTDBhUFJZc2g4eHVQdWFUYVpoWUtDYWlkL3ZIbVNO?=
 =?utf-8?B?SFVvWitrUStuTXI2ZTVEaC9iNVJaMUpQbGVlN3p4N2M1b0xHSHpQd0U3c1JG?=
 =?utf-8?B?cXplTkxXSnZmMDNXMldpVmtyUkFZK0JEcWR3bFFzOHEyQ1c5WFhocnZBWVVU?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e97bea96-74d1-4b7e-59a4-08ddfb608462
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 11:50:11.5875 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kOj66zmuaZQxVlXPWcnJFQv35yp1ItvC7iyFH/m8Y6i1ivB1jXVzdlYnVmSkV8+Mlsz3DVwEuxgZY1NJ20ftMfALsYtvA6hz7ghFgM029Uk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519
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



On 9/24/2025 3:15 AM, Matthew Brost wrote:
> Before `resfix`, all CTs stuck in the H2G queue need to be squashed, as
> they may contain stale or invalid data.
> 
> Starting the CTs clears all H2Gs in the queue. Any lost H2Gs are
> resubmitted by the GuC submission state machine.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c |  7 +++++
>  drivers/gpu/drm/xe/xe_guc_ct.c      | 48 +++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_ct.h      |  1 +
>  3 files changed, 46 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 2a077a98e92e..34e57f44fbf4 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -1214,6 +1214,11 @@ static int vf_post_migration_fixups(struct xe_gt *gt)
>  	return 0;
>  }
>  
> +static void vf_post_migration_rearm(struct xe_gt *gt)
> +{
> +	xe_guc_ct_restart(&gt->uc.guc.ct);
> +}
> +
>  static void vf_post_migration_kickstart(struct xe_gt *gt)
>  {
>  	xe_guc_submit_unpause(&gt->uc.guc);
> @@ -1263,6 +1268,8 @@ static void vf_post_migration_recovery(struct xe_gt *gt)
>  	if (err)
>  		goto fail;
>  
> +	vf_post_migration_rearm(gt);
> +
>  	err = vf_post_migration_notify_resfix_done(gt);
>  	if (err && err != -EAGAIN)
>  		goto fail;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index d4a132b81b86..fa55e9c9de3a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -501,7 +501,7 @@ static void ct_exit_safe_mode(struct xe_guc_ct *ct)
>  		xe_gt_dbg(ct_to_gt(ct), "GuC CT safe-mode disabled\n");
>  }
>  
> -int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +static int __xe_guc_ct_start(struct xe_guc_ct *ct, bool needs_register)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
>  	struct xe_gt *gt = ct_to_gt(ct);
> @@ -513,17 +513,19 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	guc_ct_ctb_h2g_init(xe, &ct->ctbs.h2g, &ct->bo->vmap);
>  	guc_ct_ctb_g2h_init(xe, &ct->ctbs.g2h, &ct->bo->vmap);

I'm not sure that this is aligned with the spec that after CTB
being registered (here needs_register==false) we will modify the
shared CTB descriptor, where GuC owns its head/tail data.

maybe on the restart() case we should just erase what was left
unprocessed by the GuC from our tail to GuC's head in H2G CTB?

as extra bonus we can then look what will be exactly "lost"

>  
> -	err = guc_ct_ctb_h2g_register(ct);
> -	if (err)
> -		goto err_out;
> +	if (needs_register) {
> +		err = guc_ct_ctb_h2g_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_ctb_g2h_register(ct);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_ctb_g2h_register(ct);
> +		if (err)
> +			goto err_out;
>  
> -	err = guc_ct_control_toggle(ct, true);
> -	if (err)
> -		goto err_out;
> +		err = guc_ct_control_toggle(ct, true);
> +		if (err)
> +			goto err_out;
> +	}
>  
>  	guc_ct_change_state(ct, XE_GUC_CT_STATE_ENABLED);
>  
> @@ -555,6 +557,32 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>  	return err;
>  }
>  
> +/**
> + * xe_guc_ct_restart() - Restart GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Restart GuC CT to an empty state without issuing a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_restart(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, false);
> +}
> +
> +/**
> + * xe_guc_ct_enable() - Enable GuC CT
> + * @ct: the &xe_guc_ct
> + *
> + * Enable GuC CT to an empty state and issue a CT register MMIO command.
> + *
> + * Return: 0 on success, or a negative errno on failure.
> + */
> +int xe_guc_ct_enable(struct xe_guc_ct *ct)
> +{
> +	return __xe_guc_ct_start(ct, true);
> +}
> +
>  static void stop_g2h_handler(struct xe_guc_ct *ct)
>  {
>  	cancel_work_sync(&ct->g2h_worker);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 1e32a59817cc..506616ec1db0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -15,6 +15,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
>  int xe_guc_ct_init_post_hwconfig(struct xe_guc_ct *ct);
>  int xe_guc_ct_enable(struct xe_guc_ct *ct);
> +int xe_guc_ct_restart(struct xe_guc_ct *ct);
>  void xe_guc_ct_disable(struct xe_guc_ct *ct);
>  void xe_guc_ct_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_flush(struct xe_guc_ct *ct);

