Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50051C982C1
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 17:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA8A10EB31;
	Wed, 16 Sep 2026 17:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gEuuTvYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B82210E91B
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 17:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789578378; x=1821114378;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=j8gQ0JiBFiMwbDSOBVKWqjlS7JBihOucKiFPAXZgRZQ=;
 b=gEuuTvYREsoTSxgEsnVe/Oh8L/Pge6vH+1ueDQbFsoDME+UODzoTB4oQ
 A4pgPqCuFpZ55Wlj4KQj/qZvMOA+x8IyXUyIjIbl9j4ALEv4L05apf3bQ
 zjHW4zy2epI8mnzZ58FF0mL4CIyrnFCjkq6E5OvOPZw8ME1izViuEffgq
 /EoMK/5hC6RjNAE9aapSd78INkJ2uJ+DQT7UOut7XDHk0z9XVqZieF0Lf
 hEugTwIA5FDiV0Cl+VQ9MaQa5SKJ/JDhbA5opJIdZejI+gYTPy64jOnNo
 ShYeMsQwiYikd1mURaDb8r7SisQegL/u0fKTyrSBJE2R42CE20611cbp1 g==;
X-CSE-ConnectionGUID: glLbNSQURMyUp9ocguewwQ==
X-CSE-MsgGUID: vB1PJgLfSDGkT6HnG4S2sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92468644"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92468644"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 10:06:18 -0700
X-CSE-ConnectionGUID: 0UFqhxU4QWKMDnPRfw9O8g==
X-CSE-MsgGUID: uxuGIV+YS5eqfSGjt3jv/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1794831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 10:06:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 10:06:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 10:06:16 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 10:06:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxn3sLj1eUpAhZ57PmA/ehMDc01zMnD9Izc3I+eL4cM2cimcvQXMc0W+4A2ggVtIyKbiY5dqD0ivm2rj452s/pKXvRfHqYuK2GxJhr4zkAumMR4zbpFz4DeJ/WFwrEzKtq+wItKDU42PNyjh62WaUZwIxSlH7qbWhSlYlgrGvEbwHWPK1GciEBRc7YS0RQTTTjGOZgTfZNs3htz4Uh+ViD0vyXHIq2JKMh0vka6K1ajAmtC8zh9nS0YGC6WQtgFCMH7mTqCmgGDvfXtY+vKPQvJyHsFusODAGODAmpv3pvjREdqLQzH3P1l1Pwyjb2cCOUvOXpZk/9ULASnr8cmaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oTcpslwcAdJT55SB27nLcj52HRrilKnfkBw9VqFhZQs=;
 b=aUHr31I/XUZ5ZAforeNsNHqY8aOMMqLz7e81iQZaUiiEHLAWTMD6rMO3MSr8ygnJc2XzgDkyDcjx4KGZi9CNJNXfmvWFCu16itlF2LT1OJ4BEUt9l9Zcudyh3v4ErUFngHz0Vax+KKVDQnH0SinM3bwvx4fZ1IFLmSQxxJzytFFjV05NPHtqbypZKcILLjYZnxyNfX0qnv9aSjypoHceAro2N6JiZtOCh2emkZOTv/p1Avl5Itxd7psoaJZMystgDzh2DY6OIzl6cbabnW348vuazAX8kEKIi6yPQeY5imeeEVkcz/0AF9d5SijXrZxiQhp0Xj/m+OPuGROR2g7JaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 17:06:13 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::f3ff:11d0:7a52:db0c%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 17:06:13 +0000
Message-ID: <0da533c4-2aee-4942-8f57-07b843a0deb6@intel.com>
Date: Wed, 16 Sep 2026 10:06:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/xe: Poll GT for C6 before D3
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20260915210113.2915363-1-vinay.belgaumkar@intel.com>
 <aqqJXsFuaAo0rGq5@intel.com> <b324f768-478e-40dc-b752-e0db1fca2e8b@intel.com>
 <aqq5X5O_OXqN-TXC@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <aqq5X5O_OXqN-TXC@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:303:2b::18) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CH3PR11MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: e58b63be-f3fa-4575-7c7e-08df1414cfeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 49dmC1XePMOHnJMt0ilqAKhoE54szacTCkZqXnoe9VgHyJ2OYGMcZ/5hk6uhvqPLxyJfe8UVOmKFbp8ufHXnDArLcPkS2wRFNrX+G3jZsF5YdxHbHC16fiTfduBjvEKmytCEYeezq+DbsAggFHjbCIkyYqZLhQ+L/yaDHpocD7kD8CmQBp96jZIf+XNaadrdIe4mOpjTNUYOP5tlFg0/lNXt6nENUqn+Kz1rl9mgoDJ683si6mpP9h6avr7JZXm6S2o0tqnbhASj8wniMv3pvQ3T01Ev0eHeh+Wub8SMxG9OL6UQT2tqNmkEC1sYmZEFbh4m7Jje3hkMniThA+IdJJtK+pTWraAi0kDYWfB0mH9JBCLkImarV6lpwsvBcleG5R3gH3fch3eyRIypKuYgXMN6iL/oh5/z1OYGkpkbVt1ULhCo+lOz6cM8CoIRcpx7gRDvwOzxiTxskEuTjAQIKg6SbteA1weFfvQqlJPdFMnJsWYwLghqssVnmfeEX+N2a5aZuD0XV6Y/8DHSS/VyuiGA+9GWAIc+SvtUppnHyIp4t3qucrTOLtpR8VD/38e+c4ocRmoeCkiIFqc/gNQ8onmD2dDXoVfTI7db5oXCzRc4yN9pOoJiBfn/KcLnuwONVLJzi5z/e1M+Ym0uus4IGEli09PpJPgdJD7mzQrvmnM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEdqcnB2M0RvMHlEQ1FMdGdrS1NuVytUUG85cEg2RDFyNzNzd2pKOFBiTVdy?=
 =?utf-8?B?Wk5kRmtXTEtZWGZkSWJkYlA3TERmMEE2dmF0a05CSGp2MnRqZWdvRGFPVmUz?=
 =?utf-8?B?TEQ1N0JjSFI0Sk1FUGhwSGZUSTRFYzVHbmZSYkZNYUl6MnIvcHRLUmlnUmt1?=
 =?utf-8?B?NUdyR1FtaDl5NHBocjRveGpuNEZNREZoVGk5Q1NCWGZIek92M3JZeWU2RjNT?=
 =?utf-8?B?VUU5UXJFSjMwdG55RVBCcUdPc2JWaW1mMDk5bkt5Qm1IQnQxUE1uQkVJQkZo?=
 =?utf-8?B?SlRITkdTbnpuTElnUFE0UjBHMTdDREhQWU1IcmhWVWFVenc2eDdsWDdhYUFl?=
 =?utf-8?B?YWw0V2E5Z1dRbUxHL0ozMmIxMFlXcEJaL05abWlLa0dyVGZpVHBEU3kyamdE?=
 =?utf-8?B?em5iQkJKQ0VsQjZkbFRXcmt4RU5OREVNS0xEWk1WdlVLUXVGOGFxdmw3dlcv?=
 =?utf-8?B?QytSVUp6OHFqTkJ2djZFaHovVTUrV0xLOTJCMFhabkl2d2txV1FrU3NDcm9G?=
 =?utf-8?B?RnViSG16Ky84S0ZDazBQOFczd2wwK2VacnUrdDJQZVlkMzZxZ3JrU0xVQkY0?=
 =?utf-8?B?VytRRWk5RUdxSTIvOG8wc2RsU2JHM0trR2xjWk1nbXRWS2VKMTdnd1RJNC9O?=
 =?utf-8?B?MllFWXBYUnVlclBqQmNuclJ0cFJhdXVPK2R5UVVjN0xvSFZFU0ZFOVVpQVE3?=
 =?utf-8?B?Mm91RzlSditSUnA2SzRBNk5OUGlRaEVSOVRVbHpmMnZVNFFra1NndGV3SEo3?=
 =?utf-8?B?cW9QdzlrZjFvdUV5UzAyMWVhSU9zSHE5SVZ0SEo3Y0QyTUlPVzFuSGt6NGJE?=
 =?utf-8?B?bkduNVJiVXVlenFyQVB4ZzhuWG8wVE1xazQrOGlFZlB1ZFNWNHkrTlFvZnVN?=
 =?utf-8?B?RVlJeDFpZ2QwM2t1U3FIK1pESGxUVEcxMkRVZzRyQmVpcjR3Nm1qNVpkVEF2?=
 =?utf-8?B?MVM5aWxUbmdrOTA4RVo1dWt4NUg5VGlGWDlGR2Jvb0Vuc1owbFQvcXdITXBV?=
 =?utf-8?B?WXFRSk1EdXJkY1RKQ2FhZGtWSlRYTXZqMlVORUdjN2xDU3plWUdHTEppeWIw?=
 =?utf-8?B?U09aWGtodmtPTXQ2am1uRHVxK1QxUUZNM093ZjN3aDhrWXhjTkdqTVFnaFFX?=
 =?utf-8?B?YWd4d1Z1bFhYZkQ5T1hQY0ozMDlGajRzTHdlUnJFeDJHejZ1S1lndTRWcU9T?=
 =?utf-8?B?V1Z4aE1Qa04rU1JIZklJMVBzeFh3ZHY4RXZ6MVQraWhiTzZ2UUlZUXFNVFlF?=
 =?utf-8?B?Z2V1SHlpYk50b3pFNGs0WEtlY0VrNUxOK1BjbE92Y0JCY0tLd2NzdjBQamlq?=
 =?utf-8?B?V2VLYlVUd3JPVnRJcGVvRGdBVVJ1N0tjWGdaN3NFRTdJeHdlNEc1R0JxcmNq?=
 =?utf-8?B?RmFmZU43emdwWTFQZWV2REFqWUF3RzdxYTVnS2NvNEJkdjFIVE1Hd1cvM0pJ?=
 =?utf-8?B?dFNxdlRBSEF1a0Y4S3g2WVVQamVOaERCOGlTU1VJc2lEQXlCallLU3BrRzZX?=
 =?utf-8?B?SjFuZ2tRT3lwakI4UTRYRWdnZ1FSVFdEUFdKMzNNMEhnd25vcEdjQUpVYXln?=
 =?utf-8?B?dWx0L1RVZDJ1b2lDTGJCSlV2VllnUW54WkhMMVR6QjdxMEhPcVZvSE1FVEpE?=
 =?utf-8?B?WFM3TWtabnZPV1VXd2lOc0E5aEhrRThKbEU3KzlpMUpuMkRSYzBZa2tIUWNj?=
 =?utf-8?B?czVvYkNhRnllcDd6R3B0OXpId2szL3YvN21tQlA2cHFzb1ViMWkwNUUxeUFt?=
 =?utf-8?B?ZnR0QzVkVG5URW53dGtMY0lIRmtmSXZoOXRnVFJmYmVRam0vbXdUbVpJNHpk?=
 =?utf-8?B?aEoyZWFINWYrLzRib0dTeTVNRVRWRElhQXg0clg4MlVjbzhuVkxEMWxvczVU?=
 =?utf-8?B?Wi9zK0lPTk5xQm9rdTc4QXBkSWFyL0FxWUVnRHdYZ1E2ZndjR3M3b2RJNVUz?=
 =?utf-8?B?VG9aV1djcHhEeHIrUVQ4dThneXhjM3Z6Ui9UcWp1ZnkxamcxNzQxK3ZJN0RE?=
 =?utf-8?B?QXhPZC9MekxLenIwRk9jd0ZCc1NLY0pVN2JCWGxiamhUQkhOeCtyTjErZE9w?=
 =?utf-8?B?ZmthRlZUMURWZUEvRW9sVXUrUmxkdGpveEhxK2RDUU11UVZFaThEOUVqNjRG?=
 =?utf-8?B?UjFJWTN2a3FGMWdNYkU1ckRxRCtKbzVGcTk4cjk2Wk9XNzVHVC8xd1hENmxC?=
 =?utf-8?B?N2tMREYwTy9zdDZBVHpIcnJOT29ZaFI4cG5ob05YUXZ4TTBnaUU3OFRkWXJL?=
 =?utf-8?B?V0VZVGJPaG9oVS9nS0ZBRVVxWGprUkFOaG1lVUJpaTZPcDh4Tnd0YkFyZjN1?=
 =?utf-8?B?QUVhMWFVSUxMZnU4c1daelVFUUxibTJJU0N1TTVGbTZ6eFZPNzlKVElVRXJj?=
 =?utf-8?Q?drJ8+rS4dWsK93uA=3D?=
X-Exchange-RoutingPolicyChecked: M6k/Nmp3DXj85szdljbbZuyfuysraB174u0sBr5ldK1LxZsEAK6Q/nv9VSZ+L/fV8uxIJ4bI8i09iUOyRXftyHQWnv93wiEGZP3IARvpbO9fXUaZihQkRFQ1lrt+EXv+LaZJfZxaF2XLYH3Kk/KFapnHcA8nQJJNIVcwZ5RqoVRqPSqdbPR8iKxEiLijn6qg0uLzbbGVan4jPISORUAdhPswmI92AmGST2B05jXcc1XwuWTUDXB5iD6lJn3l8BwY6ePKIupv8Elhuz0Gjrp37LUYKMZNQcMg4dJhJaXjOdgMdr0PdIqZ7gIHjGdDKJnsktKhzdVQtDwkElhkKxf1tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e58b63be-f3fa-4575-7c7e-08df1414cfeb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 17:06:13.4662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0RzMRRfCOGRERxfPqEHKiFOa4CgcgatX4YQozG4Ew9y/4KitvWg+gRCKEAxV0JglDNGSHueZY7rNuZ1BhTnHusc/o84cOzXvQ4JFkm5TW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
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


On 9/16/2026 8:44 AM, Rodrigo Vivi wrote:
> On Wed, Sep 16, 2026 at 08:05:56AM -0700, Belgaumkar, Vinay wrote:
>> On 9/16/2026 5:19 AM, Rodrigo Vivi wrote:
>>> On Tue, Sep 15, 2026 at 02:01:13PM -0700, Vinay Belgaumkar wrote:
>>>> Ensure GT C6 state before D3 transition in runtime suspend flow.
>>>> This avoids the scenario where GT is being accessed after D3 state
>>>> is programmed. If the check for C6 fails, resume the device so it is
>>>> not stuck in an intermediate state.
>>>>
>>>> v2: Force resume when we cancel suspend due to C6 check (Sashiko)
>>>> v3: Abort the suspend properly when idle check fails (Sashiko)
>>>> v4: Only check for C6 during suspend (Rodrigo). Have check in
>>>> xe_pci_runtime_suspend() instead of xe_pci_suspend().
>>>> v5: Don't checkfor PVC (Sashiko), rename function from_device_c6
>>>> to _device_idle
>>>>
>>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt_idle.c | 36 +++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt_idle.h |  1 +
>>>>    drivers/gpu/drm/xe/xe_pci.c     | 13 +++++++++++-
>>>>    drivers/gpu/drm/xe/xe_pm.c      | 24 ++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_pm.h      |  1 +
>>>>    5 files changed, 74 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> index c208d7563e36..8242feede1dd 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>>>> @@ -8,10 +8,12 @@
>>>>    #include <drm/drm_managed.h>
>>>>    #include <generated/xe_wa_oob.h>
>>>> +#include <linux/iopoll.h>
>>>>    #include "xe_force_wake.h"
>>>>    #include "xe_device.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_gt_idle.h"
>>>> +#include "xe_gt_printk.h"
>>>>    #include "xe_gt_sysfs.h"
>>>>    #include "xe_guc_pc.h"
>>>>    #include "regs/xe_gt_regs.h"
>>>> @@ -451,3 +453,37 @@ int xe_gt_idle_disable_c6(struct xe_gt *gt)
>>>>    	return 0;
>>>>    }
>>>> +
>>>> +static int wait_for_gt_c6_state(struct xe_gt *gt, u32 timeout_ms)
>>>> +{
>>>> +	struct xe_guc_pc *pc = &gt->uc.guc.pc;
>>>> +	enum xe_gt_idle_state state;
>>>> +
>>>> +	return poll_timeout_us(state = gt->gtidle.idle_status(pc),
>>>> +			       state == GT_IDLE_C6,
>>>> +			       20,
>>>> +			       timeout_ms * USEC_PER_MSEC,
>>>> +			       false);
>>>> +}
>>>> +
>>>> +/**
>>>> + * xe_gt_idle_wait_for_c6 - Poll for GT C6
>>>> + * @gt: GT object
>>>> + * @timeout_ms: wait time in ms
>>>> + *
>>>> + * This function waits for GT to enter C6.
>>>> + *
>>>> + * Return: 0 on success, -EAGAIN otherwise
>>>> + */
>>>> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms)
>>>> +{
>>>> +	if (IS_SRIOV_VF(gt_to_xe(gt)))
>>>> +		return 0;
>>> Why?
>> We skip GuC RC init for VFs, so cannot check for it.
> Fair enough. To keep consistency.
> In my view you wouldn't get here on rpm flow, but you are right,
> since it is a different scope on this component itself, let's keep it.
>
>>> And why not the PVC check right in here?
>>>
>>>> +
>>>> +	if (wait_for_gt_c6_state(gt, timeout_ms)) {
>>>> +		xe_gt_dbg(gt, "GT is not in C6\n");
>>>> +		return -EAGAIN;
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> index 9c34a155e102..2c8e9adf4a68 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>>>> @@ -18,5 +18,6 @@ void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>>>    void xe_gt_idle_disable_pg(struct xe_gt *gt);
>>>>    int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p);
>>>>    u64 xe_gt_idle_residency_msec(struct xe_gt_idle *gtidle);
>>>> +int xe_gt_idle_wait_for_c6(struct xe_gt *gt, u32 timeout_ms);
>>>>    #endif /* _XE_GT_IDLE_H_ */
>>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>>> index ab4da1d9a9f1..379795ac5e7b 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>>> @@ -1381,7 +1381,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>>>    {
>>>>    	struct pci_dev *pdev = to_pci_dev(dev);
>>>>    	struct xe_device *xe = pdev_to_xe_device(pdev);
>>>> -	int err;
>>>> +	int err, ret;
>>>>    	/*
>>>>    	 * We hold an additional reference to the runtime PM to keep PF in D0
>>>> @@ -1396,6 +1396,17 @@ static int xe_pci_runtime_suspend(struct device *dev)
>>>>    	if (err)
>>>>    		return err;
>>>> +	err = xe_pm_check_device_idle(xe);
>>> I still don't like _idle prefix in here...
>> I initially had it as _check_device_c6, then realized it is a misleading
>> term.
> I know the pain... I'm bad with naming myself.
> But idleness is not what we are actually checking and _idle is already
> a rpm sufix that has a different meaning in the flow and might be confusing...
>
>>>> +	if (err) {
>>>> +		drm_dbg(&xe->drm, "Resuming - Device idle check failed!");
>>>> +		ret = xe_pm_runtime_resume(xe);
>>>> +		if (ret) {
>>>> +			drm_err(&xe->drm, "Resume failed after suspend was canceled");
>>>> +			return ret;
>>>> +		}
>>>> +		return err;
>>>> +	}
>>>> +
>>>>    	pci_save_state(pdev);
>>>>    	if (xe->d3cold.allowed) {
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index f517bf453b54..f03a463d2a05 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -1030,6 +1030,30 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
>>>>    	mutex_unlock(&xe->d3cold.lock);
>>>>    }
>>>> +/**
>>>> + * xe_pm_check_device_idle() - Check if all GTs are idle.
>>>> + * @xe: xe device instance
>>>> + *
>>>> + * One of the ways to do this is to check for GT C6 state. This check
>>>> + * will fail if some component is holding a forcewake, for example.
>>>> + *
>>>> + * Return: 0 on success, -EAGAIN on failure
>>>> + */
>>>> +int xe_pm_check_device_idle(struct xe_device *xe)
>>>> +{
>>>> +	struct xe_gt *gt;
>>>> +	u8 id;
>>>> +
>>>> +	if (xe->info.platform == XE_PVC)
>>>> +		return 0;
>>> PVC check belongs inside the gt_idle component,
>>> where the RC xe decisions are made
>> Sure, I added it there since it is a device level flag.
>>>> +
>>>> +	for_each_gt(gt, xe, id)
>>>> +		if (xe_gt_idle_wait_for_c6(gt, 200))
>>>> +			return -EAGAIN;
>>>> +
>>>> +	return 0;
>>>> +}
>>> But anyway, why this indirection through xe_pm? Why can't the xe_pci call
>>> directly the gt_idle waiting for c6 inside the runtime_suspend function?
>> The only reason was that all gt_idle functions take GT as param, not Xe. In
>> that case, I would have had the for_all_gts loop in xe_pci, which I was
>> trying to avoid.
> it makes sense. Just rename to xe_pm_wait_all_c6 or something like that...

Yes, that seems better.

Thanks,

Vinay.

>
>> Thanks,
>>
>> Vinay.
>>
>>>> +
>>>>    /**
>>>>     * xe_pm_module_init() - Perform xe_pm specific module initialization.
>>>>     *
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>>>> index 6d5ab09cb769..a4fdc9c5cb10 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>>> @@ -36,6 +36,7 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe);
>>>>    bool xe_rpm_reclaim_safe(const struct xe_device *xe);
>>>>    struct task_struct *xe_pm_read_callback_task(struct xe_device *xe);
>>>>    int xe_pm_block_on_suspend(struct xe_device *xe);
>>>> +int xe_pm_check_device_idle(struct xe_device *xe);
>>>>    void xe_pm_might_block_on_suspend(void);
>>>>    int xe_pm_module_init(void);
>>>> -- 
>>>> 2.38.1
>>>>
