Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1450EC982F1
	for <intel-xe@archiver.kernel.org>; Tue, 22 Sep 2026 11:17:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C563410EC41;
	Tue, 22 Sep 2026 11:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2IVF+bp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732310E6B9
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Sep 2026 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790075855; x=1821611855;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gGbF7LPNPKp330eR/cBuW/JmGAN+R2K0lxeLKmPK/hk=;
 b=R2IVF+bpQBmkoD7JG8eH4+7vph9OC5+K9AE3WFQs8a4BV1Rs+Ph3S1/d
 Wxmg7lVG4lXfPxovSmTbM+yItNwoCON4ncd5VnBm1FXXn94m3rj90UjLk
 fQBUYBWtiXnSYAk3yzs8j5XQBgUGFAJOqWnqzJ+0Y5rVPQIgrJDlEkAQO
 TcLu0ROR15bjTCY2lG/LW++rBbA/ITki45AjcIapA95QuE4c5PLXoIjNb
 TDtn1oHd5oxWkbVLdwtDyUjWALKs1P00Z4GwM3bPMZPLhEtfSQABDaiCs
 m60TVlpeT/3TdKdMeinNHD3ScxahQ8r5le0pFjWtwGORS/vivudS/tCGg w==;
X-CSE-ConnectionGUID: JRoB3OosSSC3GIFy0c6hBQ==
X-CSE-MsgGUID: po3bgUp5Qj27IPBbHvc6Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1177471"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1177471"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:17:35 -0700
X-CSE-ConnectionGUID: TqYaJUQyRb+yPfZnSgnBzg==
X-CSE-MsgGUID: bhy/ouGGThu94JRTyhGBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="281148372"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 04:17:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:17:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 22 Sep 2026 04:17:34 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 22 Sep 2026 04:17:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PM4i16qEMiNj7MnECPikwXsoVVKAwPRKsHe9Lc6PXq+s2khoFgQTngCOFbPcdoFX0fHKWrpUzPxVDDyGPvnfgd0SbXCxJklZymS9HdNSlreMV6D0tkQluvkXrZbej09NDfO+h02m7iN/EvAMjT3aYi/GOali8UiJ31mYSqF0jKFVhFZDirO0biGUJrmEggV121iBFaT2WDrWOZ0vO/pF82Cm+9+kvJcrSzXgF5KzKcO08GiYIyAQHRAeaMUM6epeUwMNbqUhgR3YcAjuZJm777VC2TzEhk7AYKV0leDW2UzKvgbRD+fsG3sg4KPEvfXIkrNonL1qUGDGW8IVtbJB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRTFgxsdIhllTbx88ztDDTpmpYCg5iSqF7Y3cv/+cO4=;
 b=wI8oCs2IsbSnKl8Z2ip5ayFEU8YZKzFk6gPEl3chC0jaU/P/ZmeF9CK9EpaFMs48pxptRxKIa3H9JzX6X17tTscYDCxJfNVCoa9V+TFT98vm/FlZggnQijC9wlICB/T6SiGp2QbjwhBiJaMa3smGx3YAAAlSZizPldm2D6RA2CODUZVvqAGsYFRPupYbve4dTfp2iH/E52AnM1J7Cx1LxDQ9NPaRrCjXEEPq4BgCUgLfGDbcHsLQ8v33p/H0N3lZqC8PazO3IVWihXR8+7FT/P+ZYL6PcQyvL+E385QglUMbGOSxj5DiI/ZrhqzqD55dLtk/uqD0L077B3ixUCarqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7551.namprd11.prod.outlook.com (2603:10b6:510:27c::12)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 11:17:26 +0000
Received: from PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0]) by PH7PR11MB7551.namprd11.prod.outlook.com
 ([fe80::5cbf:6b33:5f0c:88a0%4]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 11:17:24 +0000
Message-ID: <6911aced-7d9b-4ff1-adf2-a5d9b62f92af@intel.com>
Date: Tue, 22 Sep 2026 13:17:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/10] drm/xe/sysctrl: simplify mailbox header handling
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
 <20260921133927.128281-18-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260921133927.128281-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000512.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::666) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7551:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 95e538d6-34ea-4923-b5d7-08df189b141a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 34ecLyW6YOqXqruGEVjzngtHRryzKvarvo7L357Y7UK1GcL6/uEjGmTpGJXQOo3o1t8C76aKI5M5LhuJujPiVHH1s71EHuv1Vw3CSZzwgtFaBZ/VbpVKRbLfy2WtY3A3n2LnhEQPdujwVSGCP33sdnLQoPcw+Vgy85WN9zvi077TVXWbo7jQ2XB2IPhBJY7v3lbMqCVC8nk02mLLzNUXfrtp9sGtofC+20CFk+Ooey4US1wR7auhrKMlhlimAmKeKu0wgBTEUMWEIIHQTFkM+SWKaXj6EX5p/pjNuIQiSXjqASQQClExa4j3LPCCGnClAqgFcq6rnztr6j4xuAcJsia7NQ8TYbnOIdEu8t0iVtmYq5JkVq9WiAzr6KC8xQOqQ6qUqCB/zqPwZ36SqxONx3ySaDH5l+Tp3J9YRLUfdT2aQK6oxPZbuwTvrNEQ8HbOzyK0WmhOTD5WOWWuMxu6Aajp8/OM64kV4DeZPE97SDrVB8OBoKkKPRZDjFlrV+v33EDVra+lIoCL30iO7cVcvACnnUb5+n5Nmai7J4UfOBiNhJwwB7nyayKROBSkYxrNXTdNGvmBDbGE40YYc0x5Y+EoY6mgKI/Gui87CC9rtSo01WNN+d/NOK78rmp/bDIwrRL8a94htxEmlpC3NRpELVUeBzIuLxfwVue4niwspPs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7551.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1Fuc0l4WXNRQStyWmRySXg2M2p2c2xMSkVDbXpobUFxd1dzYzI5MU9XNW1a?=
 =?utf-8?B?Y21ibzBubjZENFpxWEovcklackk2NGp5WnExSnVsUGJ6RjVUbTVpeStKYVBu?=
 =?utf-8?B?Yy9kZkpPT1hJOUJrdzEwaENjZFByL2RFMUpCOW8rZnZZWG4xdm1CMXVweldw?=
 =?utf-8?B?NGhuenNJdVJrNi9wVnlodFB0N2p1RnBUL1FaZmlaSmhKVk00Mkhydk9WY21E?=
 =?utf-8?B?UnNXTzBPbnpRYkN1V3QySUpRMTZjTmk0eDhrSmZNaStrUmZtb1k1K0JVZE9B?=
 =?utf-8?B?TlQrSzYwaXhCdnBxOVRSbnBTbW91WHBEb2cra2dkeUN3YVYvVzRpOTZXUGUv?=
 =?utf-8?B?V3NXWU45d1NqUFFzOTY5c2l3bnFRVDBQSDJzakVrbThydGZtZUpMR3h5K1pw?=
 =?utf-8?B?b1ZKNXcvMGM0OS9XejNPaE9EdmZzcEkrTGRkWkppem9DbzdkRHRBUm15RE1O?=
 =?utf-8?B?WGo2KzcxL0ZTVTBqUFY1eDFCMXIrcU9yWVNGVXNHR2U5VDY2VncwOXluN2NT?=
 =?utf-8?B?YkRUWlJCa01KZ3lwcXRsUGNlblNLWlRiZUVDdHhIS29FZXd3c091Z0pwM0tY?=
 =?utf-8?B?UllBTXFRRE1lOEZqZFd1MlNVa2dQRU83NDFXT0RLVXE1aGpBOVc4VDlnLzhE?=
 =?utf-8?B?a3Q2VzlCODFrMUhjbSsyQlNpR1BTNDFNb3k3eUE3VkpxendaUG93REt4N2dr?=
 =?utf-8?B?VTRLbThEK3NnV1VVaWY2YjFkM0VOMEI2RTFIYzB4akxKUlFLdk5yU0tzclZF?=
 =?utf-8?B?a1oxVFRFWlZ1WTNCbUY1NldYUHVwMlU5QXNnU1lRVS9SL1hWUEhIMk84Uktu?=
 =?utf-8?B?SWt6NHQreWJhSCtRMXhRSUNaZUdlWUZPYjExYWtmY0I5U3Q2RjlZTm5xREt4?=
 =?utf-8?B?QXAvRlVjVzhLaG44eGdOVlorVWsrTDM4M1VBUVV3RkRqNm9HQzhyZnpGTFJn?=
 =?utf-8?B?TmRyN0tUQTBJUHpydFB5TnZkcHdkTWZpSG96d3V5WUpSbjQ1Z2ZKNlJnTjZ3?=
 =?utf-8?B?d2hvUUpkMGgyMzNLQ3NJK2RXV2wxMC9LTi94TjBRU3M3Z0pseGdmMEt0YjdX?=
 =?utf-8?B?YmRZSkNhcG9OQUFLODFLdWc4U1B6Y2tTVzErdDFCNklkbWxlb3QwcXp6NGFm?=
 =?utf-8?B?RnRoMWl5My9KRjNmNEJYU3Qyb0tYVSt1NnRKNHBRb1h2UDdXQmlxU3JUeVc3?=
 =?utf-8?B?WXBvNDR6UmFGWjgzVDdoT0pXbnJQc3ZGVXpyRnRLa1FWWnQ3QXpoOXpJNXB0?=
 =?utf-8?B?NHNnNXV2dnY1NHFrUGs2VFZ3QUpNZkxqSXhITGp6UHZhaDNhQUVFZlJlMDFn?=
 =?utf-8?B?azcxckZZbFp3ZHN6d1kzSUYxTHc5dExTbzJkbnF3YzlRdVNuQjVZeTA4bk8r?=
 =?utf-8?B?T2MxNVBKblVoL1doM1RldkgxeVpkVGVmcVhBTmN3eVF2dEorcjhLRzNiMjg5?=
 =?utf-8?B?RktYRC9qREhHQWNaVW5lS2pGRGpUVC8zeHNXTnFqNXNvNG5RSTloSXdTVU5u?=
 =?utf-8?B?SS9IMmpWeC9yeW85WFZCUG9MRU9OY3dzdFN6RHRzK01FWHB6K1dxRjRZbFFD?=
 =?utf-8?B?RTl0bG9DTGtjajlhY1dNM1IvR1FYY29LVTI3M2xSQXAwelJBUmVzSjYrOGR3?=
 =?utf-8?B?MEZCa2NLTFNteTg3b0gwdTRISHdHQW5oU0tQY2VCbHFEdUFzTUU2NEtMTng1?=
 =?utf-8?B?dnNlU2x5UE5iTzBybDNpWHo4d1JkNkc4WldKMlh6bGdUUUJ6UGpza3VhT0xi?=
 =?utf-8?B?OGpJV3o2SzA0R29MYmpPWnNScE1vai9sNStwK20yUklNVVBTMHZDaENpYlI0?=
 =?utf-8?B?WldaNmg4enM4T3VYWEd2YWhaQ3dNRUQ2VXhqSzJoNUFlZmJ1anpEZDlKUDVW?=
 =?utf-8?B?RzlPRTZEdkxKekRkdmhpWG9SZk1vVi9uYnNTOXpjTTNYa2hRcFZ2M0VmbXVW?=
 =?utf-8?B?emRib2l3cmFXQWpid1lsTVRlVWJnUkNycGNoVDNhQk12eVF1UEhsZlpGc3dY?=
 =?utf-8?B?Y05EWVZrUFJmL0cyRjFPUTZ6YXFIY04xN3JFbmFhT2FiTms5WmV6b25zVXNy?=
 =?utf-8?B?bXN5SG1rQ2NQbEZGMEptQUZJSTAveFlmTEEvRkdHbmdObjYwcUtwdWNNN1p4?=
 =?utf-8?B?bnVCK3ErNHhtQWZ2Z255WTEyVDhIREhBdmlYamplRnl3c1pzM0xla0ZNMDdL?=
 =?utf-8?B?RHBpd0FDclBQVFlVQ2pPUnhuQmVTbkN5a0FkUXIrVno3QVVyMGR3L0twVm5t?=
 =?utf-8?B?MlQ5VTN2ZXNYYWU0a05mU1VJaS82NnE4OVQ5WkpJR2Q0SG9kQm5MYXNQc2pR?=
 =?utf-8?B?c250TW9KdDk2eGgvVUZQbmRoYVFPbXJHRk9rOVRuWTFMN2NXdFlmK1pvdy9n?=
 =?utf-8?Q?gwigTCdpNfqD0OKA=3D?=
X-Exchange-RoutingPolicyChecked: DbNCVRglOu0m+GPXRyOkUUktanxGngfj/t59tWQa7h5z3WKl27Qz1hl5h9LxVgBh/kizh1aNx4Zzdav+m/PPnQs1uFXo4/+sPKWqrmsm9qv7b1xitI7Tkimalx2mExCRzG52Q/cdbE9/uEaV5NYYmNr/ToGUnWYmI6c08ZKn+GfDl9jMycqhzy/wV60tjTvbX+sYdaAWgVKfSS4fB66X+cQu/n2zksEHsOvzwKNX/HSjqRp73tYvYykSG2cOkore3tDjP2tb+PsdNh5BPECkZS2UBQYhd63vzcx6tDhHxR92fMVRHLvtwnpCQcRffYmm/8/K94uf+szzlwwVICBXIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e538d6-34ea-4923-b5d7-08df189b141a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 11:17:24.7601 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EukLeTOJbFOLLt5szuoFNVbPwj/WDUlVQ1/4XERGGGs3HFQLUwUoOMtwm5mZHUMSLuLGfvbM/mfa6sNoZrt3rhOP7dTZff0nbdYPLAqHrrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
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



On 9/21/2026 3:39 PM, Mallesh Koujalagi wrote:
> Use u32 for the mailbox header data field and remove unnecessary
> cpu_to_le32()/le32_to_cpu() conversions when encoding and decoding
> header bitfields.

you still need to add the "why" parts:
why it is safe to remove those conversions now, or
why it was wrong/redundant in the past

> 
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 50bbdab072de..750178a0974b 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -20,20 +20,20 @@
>  #include "xe_sysctrl_mailbox_types.h"
>  
>  struct xe_sysctrl_mailbox_msg_hdr {
> -	__le32 data;
> +	u32 data;
>  } __packed;
>  
>  #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_HDR_COMMAND(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
>  
>  #define XE_SYSCTRL_HDR_RESULT(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>  
>  static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>  				  unsigned int timeout_ms)
> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>  		return -ENOMEM;
>  
>  	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
> -	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> -				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
> +	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> +		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>  
>  	if (data_in && data_in_len)
>  		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);

