Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6D3C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 06:03:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F9A10E31C;
	Wed,  1 Jul 2026 06:03:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBbzpsRd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69AC910E31C
 for <intel-xe@lists.freedesktop.org>; Wed,  1 Jul 2026 06:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782885805; x=1814421805;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xycOMaKBXvf13WOgEEdgiAhcqb1+WGGep2FwAUkthPg=;
 b=PBbzpsRdH5S6XZxhrvAhF3EUfsQMf/KSbb8+eRo9LgOupiErX+OAodxO
 IfOOeYXCTSr17Y4VWlyBZn7/Cvp6c8SOoVfcMJH15+qBnU5rec4W5ESxB
 hwMxTT/YtjCatKc5kLhrvS8ZyqaKB4br8oKHiWA9R4lMXqaisZrusZQTW
 LLvKmCn7tMNlCwrMu6mUHlOZFZRr8gHFD87DO4CthCHD4tPvF7AT/lhaN
 j2GYwpJYiXSH0yiX88jwhWm5nxDRFmrFzf1CQ4zDoFwED13LCCFKf7X5u
 m11CjPtlw1V07C9UGC83+bLwOm6ia9ELxguzTkfFsYGU7/gqQ2wnGhXEe g==;
X-CSE-ConnectionGUID: S8R8kfEmQH6rbxmAnUE2pQ==
X-CSE-MsgGUID: POjiElezSSqH6yy9rPtKEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="82595661"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="82595661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 23:03:25 -0700
X-CSE-ConnectionGUID: ur4VPU9BRPaNCnbqBHdD2g==
X-CSE-MsgGUID: QlEjmZtjQOC5Nvc17J4/vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; d="scan'208";a="257373259"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2026 23:03:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 23:03:24 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 30 Jun 2026 23:03:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 30 Jun 2026 23:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZrl8YK21gxS3PK+H6Oyagazg5dO1Xc5IjJQZh/FbqMNoWe4euprofCoovde8Dwq5XPeB/frulLDWFdM18Y+F/VfE4ro3d5ExDbQVpj2DdhfdwyawGE1CU3uXBcXhEo6kvj0G8Cdfp2CsM8fXoyiohd4+o0XAAoLM1ahJGueUGpiO1tG9jq8Oc4nI4OtjcXOw5mJUvbTOLRHd9TNfO8PFawKNuY344ciUIM6zAmBYvf83MTikUNHYGomC5KcFgg7Hh1JQskFUsuu551bZrN0UCAAYhTuSriUB7ZvmL7G543B/Wq2P4Mh85OXhxs4VkR6GmyvDzlFtCyzsFFYrU+Qwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmqdUKcOJRtQxLcb+3ry7RrzSy7bCursg3OGFMzy6Ak=;
 b=M78VPUqQd0fjLgCc9IUphSfhn7WZNRMZQ+kgGAxjZK7W4tNkVrY1A3pLee7DaDYJvw7lKNKrH7dUPtgAY9qQtqb/9dk13Q6xKyoHRWjLKz8N/1Eo0DLbtns3KWj4bx+i6oawGSKiBGWzhQAZpmGUsZEDLFd8sjuKRK2SO+V3YHNyZ0G/nD0F+fNcSD016rDHBRRoSIyFIsfoIDSqSulPLpKpKtI/5606C3WAtUetIOgK5EmIPbtZh6qvOWPdKw1tJt2dmZ2HzR3PDrkEXBvIXnJgUtjz4asNW1bE+5KgHRakRAkmdrhcNN7SO4twfiw8wuRljvC101Y+Mi9alFekoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CH3PR11MB8137.namprd11.prod.outlook.com (2603:10b6:610:15c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 06:03:22 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%5]) with mapi id 15.21.0139.018; Wed, 1 Jul 2026
 06:03:22 +0000
Message-ID: <49757b4e-f16f-45a3-9506-6223bb057ada@intel.com>
Date: Wed, 1 Jul 2026 11:33:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/xe/pcode: Add support to get pcode version
 from PMT
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <michael.j.ruhl@intel.com>,
 <matthew.d.roper@intel.com>, <soham.purkait@intel.com>
References: <20260619114018.667995-1-karthik.poosa@intel.com>
 <20260619114018.667995-2-karthik.poosa@intel.com>
 <ea2f8233-c39f-4242-b38d-7f64ea3211e5@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ea2f8233-c39f-4242-b38d-7f64ea3211e5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a8::12) To CH0PR11MB5249.namprd11.prod.outlook.com
 (2603:10b6:610:e0::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CH3PR11MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7f8f2a-01d4-4065-f120-08ded7367447
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: gftSFq+FtyHT1Q+rK9Yveu2S+p1iGYfcptvnx14+6qgGL0Nfl8ZCjZ6o5v6ZyO9ejDYiVOxT0fgZXdqIWBDdaEIVfps+QRpaQK9/2JkEG+b+60Ozd6ja1IfYXg/nMDkg3RZouddwRgPggHVpVeyQanWG8g8GLXYgmsAqY38+e6GE5QjT43zWVnrolavU45HdN8LxlmUAj9pggfelXJ88gkTWPsWdh+XS94yeZz5+EMgnJWmF08Jgjl57EDq9mdteCsWhnfgBZRFgpyQfND6phDdpmMTZDJRwbTvgIT24lCLeTyX5OdG4FbsMi0v+0F4TeVPo3M/GcGYU9XVVv/fM3FpcPSRnC68cif0J1n8SkEwmcmPNaDS/azWJ4abjtR+Z7JJ1065p8KM0YtQ5poLeteaWuOJ463+dcKc2jI+ZBzEXTqpv62tIZtlSdDz0gBcAWlHbQxNSWnqx+5tu4Jox6c3HUEKiy2mrgUA0dMmTuKfCUCsvtjJ3yYxtOyJozyS6wiHrlr9SEc0W99qKQ7SCAdXFt57DD2DJ2Tl88tLY0BNn1Uu1aX4ueY79H/qKbIHSfNDdVtFQwoXrbY0X37GwCiKqFTbfoJeaf+3r2HxKTS/0MUAtHoBE4arsP/XuqDe0fk6XEAnmuacJZ7XUzS62gzbxQC5H8WufKUk3bcBe1pk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhZYWhwSWpVRzhHV3hWaHNLdUljblJybDE3Q0dleDYraGRpOU5iNWZ6OWdm?=
 =?utf-8?B?amF5TmdPMkFZT2JmWjZnZkNvSE9VdXdRK0EvR3lpa0VBcTZjUmIrRHhzN2t0?=
 =?utf-8?B?czgwKzYwVDhGYjI0K21lcmxDdnVWbERWQ3R1c1pDMGlteXhLb1RyRWdMajEz?=
 =?utf-8?B?WDNObFF2L2UxZ1M4WFlvN2g4ZUdwd1hWSjU5VDJFaURiKzBQR0QwdWM5bnM2?=
 =?utf-8?B?eVdVT0JtK2krbzArc0FUUlljVG1KTkF2SnRzSXpqWkx1YXlwZ01vd1U5WjRM?=
 =?utf-8?B?ZHRNZ2VoTkVLOHcyTm91OHY2VnAzK1g4K3hFWkY2Tys2ek9FME1tbGwxVGQy?=
 =?utf-8?B?YmlTNzBCSGxTTnYvdmFmeHZ5a2k3a0JzTUprcnppQnZLdkFQZVh5Z20yT0RN?=
 =?utf-8?B?YW0vNDl5b1VQNHZpM2I1VmlXUlpZL3JXb2FHNk9RWXcrZDZzZVBRTERXcnRi?=
 =?utf-8?B?N05BZHZQUzFxMFR5cHJlR3UrMWp4ZzVDYXZsTXpYV1I3dmhsOUdzRFVqUEhL?=
 =?utf-8?B?dW13TytNenUvZlc5N3kxejFGYlN2ZWhsMVFjQkozcUx2ejN1MWRBb29FTUN5?=
 =?utf-8?B?MityTG1WTVkxSnZ0LytTR2hKOTMwN1YzVS9aNXZpd3hLdHpzL29ZUWp2MHNI?=
 =?utf-8?B?UHNISEFGa1NTL01TTm9nSVJwVjZpOXFneXVrR1kvTWJVZTV3U3BPd3BuRlZ3?=
 =?utf-8?B?UmZkekxHWXRJMVF3L3poQ2NxNHZrR3djdkFXWitXeVIrcHFkREJSS3FHTG5s?=
 =?utf-8?B?UVRWTnNNZFFnd00wSGNGU2dTSUlZdFNQeW5VVzZQYlc0VWJtNldwRnl3UVBq?=
 =?utf-8?B?RHN6Qmppc2NMWjdGTDJWWXlEVUF1MFdQWnBmSXBWOEdsRm43Rks4MkkySGxv?=
 =?utf-8?B?bWtiNFp4TDBYOUgzSHgvWlV5S1VnR2xvWUZuN2JBVXlHRmNMRnFMS0IwUE5v?=
 =?utf-8?B?Nk9qaSszYmh0Qkt0WjBpUmpmVGorckYxQkViN241cVpiTnNNUTVLRkVaZHJ0?=
 =?utf-8?B?Vkg1ejlUQUVEZnExNnRYSFAxY1NacDRBeDVwdmttdE1ZWmpReFRTUmRjZXlJ?=
 =?utf-8?B?cGliTFZCQjUyWHRWbERibmhmVlIvOXJvRzhBOXdtaXRyT1dsblIwcmtzQVd1?=
 =?utf-8?B?OFVQUzhMVENXTTlxOGdnY2FSZWhwZ0pMZVFadWZ2QndWcFNlSXJacjdEejNj?=
 =?utf-8?B?c1JWaHdOd3dtWDlkajR3dVVtQklBTDJzVkFrVmZoSEFra0w0bFZkbnE4eGJB?=
 =?utf-8?B?dzliSnY4TWxGbVpXWE9DZk9rRk44c0NwRWRwdzl5Tk13eEpNNWtldU84blVP?=
 =?utf-8?B?bzRBMlpGK2h3RFc5OUw5OWlkZEE0UXlUelh1RTc4b2g0aXZhR09oSWJ1b0F2?=
 =?utf-8?B?MEpBZmgxN3FFb3pvenRzengwTUFBVkxaaDVnNlFPYVBTR1NheVJwQ1FBSkl1?=
 =?utf-8?B?Vy9GTm04cXVIU1ZiSDVXQzJhaVhmUVk5emdqaGg1b05xVjFZYzIvd2t1aWFs?=
 =?utf-8?B?ZXpBNXpHdjFIU3RFMGV1S2N2bE5DRWk3OWZHdTZYTU0wMTJ6djJoaDNGbGNY?=
 =?utf-8?B?ME9MUWR6VmczV1Mwd083VkxCZ2xBY092TVVPbTZhaEtMRGIzSTRrSXB2ZStp?=
 =?utf-8?B?SjZrVEN5TG00R3Zkek1OclhtWWZiK01jaUFZL0FEaGlJTG5wc2lGTEZ6THJY?=
 =?utf-8?B?aUpQbmt0TEhmZU1xeHVWZjlHbHJkMVhHOXJLNjNwcTI2dXpEV1VxRHVIMHRY?=
 =?utf-8?B?d1pFV2JFQ2FKajU1R01SUEdkZHM2emlaTGdGUmpEV3NZTjNJQzgvd2t1ZU9G?=
 =?utf-8?B?alFvWUJlK3dMWlE4K3Rxd0ppbzlGNlhrUHZPL2NmaWV1Q3NIMVhnUy9aQU5R?=
 =?utf-8?B?YUtBWmtjUHduNk85NVRDWUFNWUhPd2JYUWVCY3VwaHkxbEJEOEFUL3hBZ1FR?=
 =?utf-8?B?RlBsTG1Mdkc4N00vL1A1NXlYaE9taW1VOWdlOXVibEFsSEdjY1k0eXVPRnFl?=
 =?utf-8?B?VEpGYjJGR1c4YjdFcWxXanRzcEFvdFFXRlZtb0hCMXVJaE91aWI1OXBwY29h?=
 =?utf-8?B?TDd6Ylg5LzVJSUtkRUhqYWlDT0VqKzMzczBaSzVNNy9NUFJ6ZjR1ZzN6NzlQ?=
 =?utf-8?B?MjhaVFIvM3MxeFZjTTRZdDdXd0FKOWlBU3VwSytFbVhlQ0tpZFAvMXFoMG5O?=
 =?utf-8?B?andMS1JoRGppQit3dXhjVS9DSCtFUFRxZk5CYmpBU2VuQ3ZQaytuSDhoM2lL?=
 =?utf-8?B?clZ3VVdoZ2ZneVUwdFo1bmUrSE5ITjdQYS9Ja3d1bDVRNGpYREZBRkdBQkp1?=
 =?utf-8?B?akpTMTRYUGtEWXdTYi9rVjFFYkUxZ0lDb3NObEZDeXRYOGhYem5jZz09?=
X-Exchange-RoutingPolicyChecked: iJQ9kYg/IrjYS37lcI7dY1kdsKFw1MHn2GsMKs1H1ILjfS2pZthMElgJCLKDSXlu3E5SbrPq4A53yGx5s2y+dWHh68/cA45eYRq09SDo5SKKODrv8QnlyAroJ9uNb3U8ZarmNQQpLzmO0+IRx81bdXxu2XY3Q+Z/s0+0lnkDwTeRtCsCNzTmNyHBwZbl8OpZ5PuVoYvoeQfqKKTYEATNt39RkYpn2WPe5iTVqu/MQH5cr4+SV8lk7zONSjzU3ZXtBVh0ar+LwuFaTe9at81CQj+0ahuZ9Uy+2b3wo5Et5RtUGDUAOB1q1GKdzQ/3MzfPYumJ7hPqV2FrW1XnptF8vQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7f8f2a-01d4-4065-f120-08ded7367447
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5249.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 06:03:21.5803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dtaumfQUo4zZGqUrahq9CAwZbcgrKfToqwuWqA6iT0GUVwjxgSbtkv8Hix4fLRcMWy2+YoicZ4EBG1oAHBkLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8137
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


On 19-06-2026 19:23, Michal Wajdeczko wrote:
>
> On 6/19/2026 1:40 PM, Karthik Poosa wrote:
>> Add api get_pcode_version() to read pcode version from PMT telemetry.
>> Add PUNIT_VERSION telemetry offset in xe_pmt.h.
>>
>> v2:
>>   - Pass struct device* instead of struct pci_dev* as xe_pmt_telem_read()
>>     got updated.
>>   - Support pcode version read from PMT only on BMG and CRI platform as
>>     PUNIT_VERSION_OFFSET is currently fixed for these platforms. (Micheal)
>>   - Use scope based runtime PM to wakeup device before PMT read.
>>   - Update commit message.
>>
>> v3:
>>   - Move the platform check to xe_debugfs.c where the debugfs entries are
>>     created.
> nit: we can keep a change log under the --- line
ok
>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_pmt.h |  2 ++
>>   drivers/gpu/drm/xe/xe_pcode.c    | 21 +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h    |  7 +++++++
>>   3 files changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> index 240d57993ea6..8a70e17912f3 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
>> @@ -15,6 +15,8 @@
>>   #define	ENERGY_PKG			REG_GENMASK64(31, 0)
>>   #define	ENERGY_CARD			REG_GENMASK64(63, 32)
>>   
>> +#define PUNIT_VERSION_OFFSET		(0xA0)
> no need to wrap number in ( )
ok
>
>> +
>>   #define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>>   #define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 866986694d9c..185d242b642e 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -15,6 +15,9 @@
>>   #include "xe_device.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pcode_api.h"
> btw, shouldn't this be in abi/ folder ?
this is internal header, so I think it need not be in abi
>
>> +#include "xe_vsec.h"
>> +#include "regs/xe_pmt.h"
>> +#include "xe_pm.h"
> please sort includes in alphabetical order
ok
>
>>   
>>   /**
>>    * DOC: PCODE
>> @@ -350,3 +353,21 @@ int xe_pcode_probe_early(struct xe_device *xe)
>>   	return xe_pcode_ready(xe, false);
>>   }
>>   ALLOW_ERROR_INJECTION(xe_pcode_probe_early, ERRNO); /* See xe_pci_probe */
>> +
> public functions shall have a kernel-doc
ok
>
>> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version)
> missing the xe_pcode_ prefix
>
> 	xe_pcode_get_version(xe, version)
Good point, I'll add it
>
>> +{
>> +	int ret = 0;
>> +
>> +	guard(xe_pm_runtime)(xe);
>> +
>> +	ret = xe_pmt_telem_read(xe->drm.dev,
>> +				xe_mmio_read32(xe_root_tile_mmio(xe), PUNIT_TELEMETRY_GUID),
>> +				(u64 *)version, PUNIT_VERSION_OFFSET, sizeof(*version));
>> +	if (ret != sizeof(*version)) {
>> +		drm_warn(&xe->drm, "pcode version read from PMT failed, ret %d\n", ret);
> we can use xe_warn(xe, ...) here
>
> nit: and we can use %pe to print user friendly error code
>
> 	"pcode: version read from PMT failed (%pe)\n"
ok, will do this in next revision
>
>> +		return ret;
>> +	}
>> +	drm_dbg(&xe->drm, "pcode version major %d minor %d engg %d\n", version->major,
>> +		version->minor, version->engg);
> we can use xe_dbg(xe, ...) here
> and we should use %u for unsigned fields
>
> 	"pcode: version %u.%u.%u\n"
ok, will do this in next revision
>
>> +	return 0;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 18260c29e620..e496135b8fa2 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -12,6 +12,12 @@ struct drm_device;
>>   struct xe_device;
>>   struct xe_tile;
>>   
>> +struct pcode_version {
> what about the xe_ prefix? xe_pcode_version?
yup I'll add it
>
>> +	u16 minor;
>> +	u16 major;
>> +	u32 engg;
>> +};
>> +
>>   int xe_pcode_init_early(struct xe_tile *tile);
>>   int xe_pcode_probe_early(struct xe_device *xe);
>>   int xe_pcode_ready(struct xe_device *xe, bool locked);
>> @@ -22,6 +28,7 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>>   			   int timeout_ms);
>>   int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>>   			     u32 data1, int timeout);
>> +int get_pcode_version(struct xe_device *xe, struct pcode_version *version);
>>   
>>   #define xe_pcode_write(tile, mbox, val) \
>>   	xe_pcode_write_timeout(tile, mbox, val, 1)
