Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4004C5DF88
	for <intel-xe@archiver.kernel.org>; Fri, 21 Aug 2026 06:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24C310F220;
	Fri, 21 Aug 2026 06:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZxY1TU99";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E35510F220
 for <intel-xe@lists.freedesktop.org>; Fri, 21 Aug 2026 06:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787292641; x=1818828641;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tJQXyt4FtQHyi3q/6/Ssu2wVmxNwR8vnOsUbbAT7fKM=;
 b=ZxY1TU99agt294gesa8C4ZPfeg2IMuln9Pdj4aRQcrXCy1RHGCs5ujVL
 /5V4SK7cdSCpO6byUHbYqR+j60rEWQhM1bBhPX0x+su2IP14iZ/KWze33
 ws6HIODT4xNW7chGFubIDdKIkInYCz+ttdi8sxHzv6uo5nJbRiiGpyCW5
 4FNoEOGkHkAs94zEBuS60MWX24Pngyi9xzhGqnPp/fzjIkTvXMzd3ypqL
 mk958t8ymiT2mGKFihi8LT0cVDy+Uag5ccrAZIXhSXXljDBBhPpDuvXyw
 tDy33CWKNXZ6IB/R5aO0xTyBQfbdoFhqSnV0jAb/z3uRQ8CkpPRFZ8IiO Q==;
X-CSE-ConnectionGUID: zw6NzM5vSOqJeR4uV+wBWQ==
X-CSE-MsgGUID: 7ltqSkm4RoeABoj1ENorfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87693940"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="87693940"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 23:10:40 -0700
X-CSE-ConnectionGUID: Fy5HBG0sRUCSsnH/r9kQUg==
X-CSE-MsgGUID: fvXHeatcRoWo7SYWwcnubQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208";a="304440442"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 23:10:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 23:10:40 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 20 Aug 2026 23:10:40 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 20 Aug 2026 23:10:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvUaPfWa+jLpQSTuYpVA+wJr3XjGn1STCFpw5q0s2nE/nf0K7gufBF3AK0/gCemYK0pBaE9Ez/VDrNcmzpKzkymMoAHBo9fxCzdN0yOLg3KSEhsL5mPS9VSGVubsVmWoo18V+IFfLs8kNKe6sNAjtZWoktc9jmRxnS8KNd0JrXZ3obqfpO7e66vwvHPcHO+p8VkG4W+tk4VYD2D8/OpLcQkIHuUMlX73KDWFy11F1Hl3RZ2u6oNVVxuRwIXmxgBWeeTwPCFKW/apQSM9JePMoPPfbr/UaCCOgYGky+vIooyXmAOtILxWBToOon1EtOhqqtUEfijy+iR4YPK2jQ1jYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRhzt4yyxFBNhqHgm8yslt5AjzQDGl+AypfpWHWyYaM=;
 b=bnPAjOJCLm47A2EHQP/W0FXPBTSNZzZk4jcgO+xD27FwqMAfjJUO0zKuyaCy5pNhAjenTjBpFSH5YNjvFsC3GJ+j0xGWHfpxwuKVo0MgCHVTWgTurUbRmyGI17ZToO95TkDhUuv7liXFVNMo60rxnMLkTfWuu7kOS4ZItGkrIo1G3D0vOfY35utfH0kejhClR7J/QNgSitCe6X6sPbpa3AgkHEZU6QUWh92gdXpEueclTfaMCjozWgZ99gZYcLjBbWE8usSiZPYJEtpwwhr3YIFUMv/ROBJbRU8VyjqYPcsCxaflnsWo9b+BCaeLzpXj0AUdF7S/iVKyf7GWTY6dgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CO1PR11MB5076.namprd11.prod.outlook.com (2603:10b6:303:90::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 21 Aug
 2026 06:10:30 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%4]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 06:10:30 +0000
Message-ID: <d277b95e-da9a-482f-93c9-96785965def8@intel.com>
Date: Fri, 21 Aug 2026 11:40:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/xe: Report GT TDR and VM rebind faults using
 SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <rodrigo.vivi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>
CC: <badal.nilawar@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260804093648.609728-1-arvind.yadav@intel.com>
 <20260804093648.609728-2-arvind.yadav@intel.com>
 <2fe86f6c-a51a-4f93-8905-82fda0fa2254@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <2fe86f6c-a51a-4f93-8905-82fda0fa2254@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0120.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::6) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CO1PR11MB5076:EE_
X-MS-Office365-Filtering-Correlation-Id: ef22504a-6313-4890-1cac-08deff4ae69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|6133799003|56012099006|10067099003|5023799004|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 0tFEdGwB4XXfLoOVMZbY7e2+kU2f51GHbZXd15DzesLNvF3LaBPZBMwrRGbzIewo3ZBtsihrKmNU0VOwzQluMGv8bmmVwwS4v+Z7026uijE6JWya1QhwlnEAhLjSb+e410Q+OKjEh0WdSb+VzrApSoxU6WUpA5bYdwWVFA7R4DkX7SWcAQCpg4O8tyhhR9Se9mD8G49SGslXOo0DLLGepTag4Thl6Oe5lVWqMiRwCaoh1mFJ8krjTSQo0sueI0nQSNt9DP4csshZVouO9E3UvxidD6DoA2z0kBN28qtBP4ntyHFc+vgQrgv5/Z4O6Cmi3vQJoXLYGvSfVyPdqDqlmq3REEvAwRt+mOxKDPHWyFojF7K+Hun4Os/QA7yGmoQECs/iz0RprCN1NMNDOpvKT+Y3HLE18DdcY0Yf9KR+mOkOnFuiFdC00CZoldDUIWsnpXFj7txWocNjjPLmX95k+J9aqQSZjfd8+EYCyLTX50cTsvcid27NaNkxZ1dx5f6VP9dwrwIxWre0OuxaTpX1VgCdbdgX8EhUCh2VIpE2khFXzv4rsYQ6ByggXM+LaEsFpQ9w/KOm2K4rsEY7xGI3oyyuWPCc1pd2mT75kQg2gJa1du7fnOP5rMvurNX3BZvsZsafS938whYFCJxvVv2pFv6t06deHBGXT8M+Vw68p6Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(5023799004)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXJYK2dETTMxVHQ5aVIxUWtJZ2pUMzFPV1pjb2tsZytyZmJwU2xDTUtrcEhF?=
 =?utf-8?B?bU4vdFA4N1hreTdENnlDWUd3Z09IeERQN0ZVM3JKYmNQOGJicXhvcis0MGRW?=
 =?utf-8?B?VmpuYS9Wdi9DTExFcWlrbmE2VjAraFZEc2tuK1g4VVNLUks0cUUwbThMNTVV?=
 =?utf-8?B?dEVaTlBpWUxNaFdVOXl2UnhITUhEYkkxa0hiN3g1dFlYWDZXOXpyZ2dsVWNF?=
 =?utf-8?B?RXJxVzIzYi9wODA1N2Ixai8ydW1QSG81RVI5VVdQallyMWROS2dacDBoeDdD?=
 =?utf-8?B?YWFjRUEwMWxQRlBwcWVHL1I0S1FVc2wweUVsTHIwSEkrZ3I2cTBjUWhCcDRi?=
 =?utf-8?B?TXEzWDUrcEowVlUwcWpOUm9HSHRRNU5zNTVtMzJPdnF2SERuQjRaV051K2Va?=
 =?utf-8?B?M1RFNnVKaUhpWGNvdk1OOEhPcGZUQnhqL1BISXZ5alJQVHhOMEsycFpCSGdj?=
 =?utf-8?B?dm5EZkNmL1JUR052ZS9NY3FlY0RIL09YWldzTXY2aU9CcHBWQng3NHlIM3dO?=
 =?utf-8?B?US9nTExpZnR1TGZRT3NUc2lyUlZ6aFE1YXdrMDgwYk1CS25WbnBZTjB6eTNL?=
 =?utf-8?B?TEd2UVhQN1pDVzJsV0lDcUJYc2JjQzdOVXN0UlQyOElqOFBNMUJnNEw1OG8y?=
 =?utf-8?B?amtoN3FBV3RKdXI2U290Zk9uK1E3UG5PSHVnNjgrU1MzMS9adTkwMGp0QmFh?=
 =?utf-8?B?YUtlTFRDME9QeUExQjNDMmVoZnZZb3dkYjFEcWxDWmNDTDV4blNJM09kUkM1?=
 =?utf-8?B?OW5Qd1Zqc0JBVnZHSW9UWXZ1Lzc1Q3VuUlVKVkpOSS9iSXpLRU5TWis4Yzkw?=
 =?utf-8?B?dVQzR3pnZ2p3YXR6V3BoekNSc1FZSWlKRVJ2cDRtdmd2SEkya3NrZ2ErM1JI?=
 =?utf-8?B?Zi9KTy8rMlpoUHlBVVFpUlVRQ0tmbWZDN2N6QlZCemFTVVdOTTBqVzhlYzdV?=
 =?utf-8?B?TTVwQW9zY3hYcmZUTnBudkFBL2lOSjM1Z0VuRHBUbmpVdUxKaEdpZW5PVzE1?=
 =?utf-8?B?MnR0Q2E5UGUzTXBLMC8zQzk5QVVRNE9UR1EyYUxSblREbzBGckV4WFpmbSt3?=
 =?utf-8?B?M2ZwREUzYjJ6eDRKbldRaVZZK2FwdTI5cERIQ3FmTjJETHRkS0lIWUZZektV?=
 =?utf-8?B?T0ZMNGtGTkdkdVpXckdmcXZkSFU5MGEzTmxHQVFaN1IyZkNoVGRuTDNIMkFS?=
 =?utf-8?B?VWdRcTc5VWx1L29LYVpEM0JCV3ZUK1JpeWVjL3gwQyt0eHRyc1gwMHl2aUNp?=
 =?utf-8?B?MGo0R0xJVnY3R1hQSjh3U3FhbkNTblZNaCtOQ0hGM1BETnpEbjdRYUhaZXg5?=
 =?utf-8?B?QVcvYzBzT3RaQmhNdHZpaXFqdTkwbXFVT2w1K28xUEpFbkI1T01xN1l1K0p1?=
 =?utf-8?B?MWlacW81cHhRNk84Skc3T0R2aXpDSHFTdUhHN2hXMjdIdTIwZUtNVXpGSjF5?=
 =?utf-8?B?c1phNU5BdEx0TURhNko3dm15aFdDa1h5VmMxOXFJblFxR3VTK2t2akJWY0Rt?=
 =?utf-8?B?b3BjTXQ4K25qbk9yL3ZXS0pka2s2SEdHNThwemlMbGdqY1p5MGFLZDJVWjVh?=
 =?utf-8?B?VlZvWk1pTlloS2htVmVUTG95M1FYOGpZcWZCNm5kYmpXS1lWRlVObVJiZWZI?=
 =?utf-8?B?ZHlKc2dIWS92eE9kZGdIVnIvYkJGNDlYL3NBVDJLdFVSRytYQWtwY3FZTWRt?=
 =?utf-8?B?OXB1aGZ4MXNzNVBESTBCb3RPbERRWE5nR3hqdmlmN0hUUDBvUGxJRFRoWG1u?=
 =?utf-8?B?d1RxT2IwTVQ1NW41VEEvYlZPWUt0M0FsTnE2RXZQanU5dzdiTmNqWjJLM2J1?=
 =?utf-8?B?cFpSYzVGdktRbG9BV2kxS2N1SFhOeExKWlNDNGhZczI1S0owVURXOGJLOFl5?=
 =?utf-8?B?RDdpeWd1ZDRLRzZtTk53cHNrK05NOVJhYjVoWDFqOWJub2JkYllqSzJTdGRx?=
 =?utf-8?B?eEVTblFNVkR3ZjBuTmdSakh3OTczVVFySWJRSUxGUkYvRjRIZ25pWXlXMDR4?=
 =?utf-8?B?TTNsTU9SL0dYdWx6cVVqTjF2NDVqUUlwSWhHdWlTMVdjNUdqRGljZllQZ2Jj?=
 =?utf-8?B?bEN0WU1adTIvUXlHby9uZTZOemt4bE1neVJnMlBWTldjc1FjSWxMSHdlVVQ2?=
 =?utf-8?B?cEcrc2FRZElRNVRFTmMvcCtyZzZlQWJlM1IxQXQ0d1ZZVmVuOEh0Z1dhNjdG?=
 =?utf-8?B?R2hCWG1qWWNpMTVhTSsxQ05aRUJ6MUFOWk90eUQrS1liSVFXU2p2YlYweWgw?=
 =?utf-8?B?WDd6ZHNGSXc1cU16R0pnVGd0NWx1Nk1iY2VIaElCVmo3K0FaSXlYOUc4dFhQ?=
 =?utf-8?B?cDBUKzMrb3h1c0VURFlVN0xkQXVURFpTRVQyYzNFb1hEZkhKemN0dz09?=
X-Exchange-RoutingPolicyChecked: Qd1jf8jMO0ZCZTyURlPXBtZOzLANFuCvdInRw5xs9XJGTyD3SKEyPnT2/y6lo8e62o4HZrXklYa/aSn0HVCQpJFtWPttSqyOcLMNBA+Z9SUk/ZWSU9srlCeOExyK5mzQ64gxD4XSag3jmacBUnE2z8l70giPqYYS/JCP5twW6NL9tFz6k06N4zsq3zALKXpCgIGL05Qh6Ba+wPiqB6j9XvxySocJXYoP+nVpny70F1EY+qTOglUtcCCmfnYt2iLR4s87Rf5KjKe2S1hp0BqwtXH5cAQV+eNZvRcDN8paHnaJXh7Wujs/pt/qsIY0Of4RnVtHIC0rf4SuQgxIFKsHCA==
X-MS-Exchange-CrossTenant-Network-Message-Id: ef22504a-6313-4890-1cac-08deff4ae69e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 06:10:29.8967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89AJfOrNvtsYx84Robn6Dntr7a4U63nhGffn6o1mxB9Mzw/b5koyojkpnVvfGE4qXW8ArYBfV32TwMZKKz1iwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5076
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


On 17-08-2026 15:50, Michal Wajdeczko wrote:
>
> On 8/4/2026 11:36 AM, Arvind Yadav wrote:
>> Route a few existing GT TDR and VM rebind failure logs through the
>> structured SIGID logging helpers.
> above is a good candidate for the cover-letter
> then IMO there should be separate patches per each new SIGID usage (see
> examples in SIGID introduction series)


Agree. I will move the high-level text to the cover letter and and split 
this into smaller patches.

>> Use the GT component for GuC job-timeout checks and engine reset-request
>> failure, which reports them with XE_SIGID_GT_TDR. Use XE_SIGID_MEM_FAULT
>> for the terminal preempt rebind worker failure, since the VM is killed
>> immediately afterwards.
>>
>> v2:
>>   - Rebased on the latest structured SIGID logging series.
>>   - Switched from the old xe_ras_log_() helpers to the new xe_log_()
>>     helpers.
>>   - Dropped paths already covered by the base SIGID series.
> you can keep change log under ---


Noted,

>
>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_submit.c | 12 ++++++++----
>>   drivers/gpu/drm/xe/xe_vm.c         |  5 ++++-
>>   2 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index 8aaed4fd13ea..79bd0e46640f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -34,6 +34,7 @@
>>   #include "xe_guc_klv_helpers.h"
>>   #include "xe_guc_submit_types.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_log.h"
>>   #include "xe_lrc.h"
>>   #include "xe_macros.h"
>>   #include "xe_map.h"
>> @@ -1375,7 +1376,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>>   	u64 running_time_ms;
>>   
>>   	if (!xe_sched_job_started(job)) {
>> -		xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started",
>> +		xe_log_err(gt, GT, -ETIMEDOUT,
>> +			   "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, not started\n",
>>   			   xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>>   			   q->guc->id);
>>   
>> @@ -1390,7 +1392,8 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>>   				     xe_sched_job_seqno(job),
>>   				     xe_sched_job_lrc_seqno(job), q->guc->id);
>>   		else
>> -			xe_gt_warn(gt, "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck",
>> +			xe_log_err(gt, GT, -ETIMEDOUT,
>> +				   "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, timestamp stuck\n",
>>   				   xe_sched_job_seqno(job),
>>   				   xe_sched_job_lrc_seqno(job), q->guc->id);
> in both above cases you are promoting from warn to err level
> is this expected/required ?
>
> if we want to log them with SIGID but not with an error level,
> we can use xe_log_err_info() instead
>
> @Matthew, @Rodrigo ?


Good point. I did not intend to silently change the log level. Since 
these two paths were xe_gt_warn(), I will drop these conversions from 
the next revision.

>
> also, early documentation was suggesting that each SIGID should
> be selected based on the source file; now since we have components
> are are more relaxed, but still we have to follow some guidelines
>
> @Aravind, @Rodrigo :
>
> is it ok to use GT in the GuC file?
> or maybe we should introduce GUCSUBMIT/SUBMISSION component with
> associated GT_TDR instead of RUNTIME_FW ?


My intent was to classify the fault, not just the source file. Since 
these are timeout and reset recovery paths, GT_TDR seemed more suitable.
I agree we should follow the existing guidelines, so I will avoid adding 
a new component in this patch.

>>   
>> @@ -3354,8 +3357,9 @@ int xe_guc_exec_queue_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 le
>>   	reason = msg[2];
>>   
>>   	/* Unexpected failure of a hardware feature, log an actual error */
>> -	xe_gt_err(gt, "GuC engine reset request failed on %d:%d because 0x%08X",
>> -		  guc_class, instance, reason);
>> +	xe_log_err(gt, GT, -EIO,
>> +		   "GuC engine reset request failed on %d:%d because 0x%08X\n",
>> +		   guc_class, instance, reason);
> separate patch ?


Noted,

>>   
>>   	xe_gt_reset_async(gt);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 9e0176861cb6..7c70ea23045a 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -28,6 +28,7 @@
>>   #include "xe_drm_client.h"
>>   #include "xe_exec_queue.h"
>>   #include "xe_gt.h"
>> +#include "xe_log.h"
>>   #include "xe_migrate.h"
>>   #include "xe_pat.h"
>>   #include "xe_pm.h"
>> @@ -591,7 +592,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>>   	}
>>   
>>   	if (err) {
>> -		drm_warn(&vm->xe->drm, "VM worker error: %d\n", err);
>> +		xe_log_from_recoverable(vm->xe, XE_SIGID_MEM_FAULT,
>> +					XE_LOG_COMPONENT_NONE, ERR_PTR(err), 0,
>> +					"Preempt rebind worker failed\n");
> separate patch ?
>
> maybe we should just introduce new Xe component named VM *)
> and assign it the SIGID MEM_FAULT ?


Agree. I will split the preempt rebind worker conversion into a 
separate patch.
A VM/VMA component mapped to MEM_FAULT would be cleaner than using 
XE_LOG_COMPONENT_NONE, but that looks like an infrastructure change.
I will do the changes accordingly.

>
> *) or maybe better VMA to avoid clash with Virtual Machine?
>
> btw, there is also other existing warn that we may want
> promote to SIGID:


Yes, that looks like a good follow-up candidate. But I will follow the 
current guideline.

>
> 	"Could not allocate memory for fault!\n"
>
>>   		xe_vm_kill(vm, true);
>>   	}
>>   	up_write(&vm->lock);
