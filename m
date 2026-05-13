Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E320CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 13:03:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2268610EE54;
	Wed, 13 May 2026 13:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TvQf2TKe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA12610E287
 for <intel-xe@lists.freedesktop.org>; Wed, 13 May 2026 13:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778677414; x=1810213414;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=YGgkrhHraKblKkZxsR2+0dRWR0Ukg8LEvA1AfdrC3SY=;
 b=TvQf2TKefR+ZHbOXk21eO/5ciNL7XBYhsMCKPrgSUO0Q3WHcCYkJSIDD
 8kJx3y/qdWLw6iCKux5MjUrsIoOGK2dD/JWZOiIUNNpnZ0p8W575sjyQ4
 o4RQ4zKJeWn4JWlpR8BaxL5sNkHeY2E8vgTixuoUUYtJaz1+F9eerpmwl
 UrtcZmQiAtCuHkHcoOXiS6kVsZFs4Ig4tvZfcQ+dlkdez7t7xUgi8sAns
 21MyxMWgz7gVCokSUl8Jzb9XeBVXR6PbRbajcAqPAtCnxK1Dis5M37vu6
 MsSq0QAhvsxfVp6cyktO09+DAkUoQNxrFqLbOy5UXIK7ACNdO0NjcYHMy A==;
X-CSE-ConnectionGUID: Nbp/mo+rTpeRseqOskyjwg==
X-CSE-MsgGUID: 0t6U244JRoS9jLwBA0yUDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="90297136"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="90297136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:03:34 -0700
X-CSE-ConnectionGUID: tdd9hzDsT6ibyizTC1eY9w==
X-CSE-MsgGUID: fpb9o1rsRWiha5jGFBmvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="233810401"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 06:03:34 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 06:03:34 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 13 May 2026 06:03:34 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 13 May 2026 06:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sp4S1uyGIYfxNzEbrUFWSNSYz5w8JC2JoZA4LWMgbjiEezQ2wbzZRdfWRlEHTX0267aZOsSDJZRmo9thc15Fw+VJaz8pPhGJmuZWc8CRw3C59IAzOCMLo4gh1hidGiIhxY27me8TmFz5KuECdJX9tAzie2gqh5qaegF5QwZNYx9ENHyKwdTOFggjRB+yxdEdUAer20t1IcwNEkQoPZYdsAP4Ft8p4Vfuh4u9jFx24tj6LWfD6PIHjilGiy4aNF9aZi5l+T05Ho6uE7BNuZ/wmxeJYaCB/JyVHZ0pGV1DkNwpqFgouj0kfyY16NmI22bWyaW1t3IqkK7OQffWKLSOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cf4VQYPqxn918Lj/eNSooCC5Xk0131bIKlwFM82Yfrc=;
 b=CWhLdjfPNfSkZbfPoa1l/6+/8moip/nx3IdrcAcQjOeXfw3wQTtE8938AyqZvvUQcnbbkTdWd8fXX9Iiy1FRqjN/jbc77yXp/b6sSe8ayT38k8l56dpRgh7BxMyFjAUIrs5nAr72kwv891RyvM526giBeYqM/TE0WngXQBs99MI88qH+X9HnhAlzQ3tnO77eP721iBpt5FMrGhwruXbGRstUsErvPyXDU3rDfvDvtDqmdTEoPzpIvWs+r7i2fS4oW4+tutKNXdKwg6HBdtVT9zR9ek3Jfs0pGXBzmX33dG9kTD2QC7t+GlQAXVtHNssds6vmNEDYIWdFg6Km1qHntA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 13:03:31 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 13:03:31 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <2360fb36-1304-4b8b-9586-df962c2de299@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <2360fb36-1304-4b8b-9586-df962c2de299@intel.com>
Date: Wed, 13 May 2026 10:03:26 -0300
Message-ID: <878q9ncvhd.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: b312b6d6-d16b-4d20-af86-08deb0f0082b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: Au+GHPCJzwLaRdgQzHJJ2Sxq6UT+RGJRfG+jaiXEGWQUq++KjCpAfaNOKRTP34dud6jRuoJP719Z2rTxEBfpuI47Y2huS2TF66zUzAau6J3mXo83AgjS0y/PHcEhyrewHLsdmdNZy4mX9s7SxXaHgX7QjOwIlRtOxnCbW24EHcGgDeOic+UhUXMjKlDGArO3b23gSSqRrqA8t81+KkoRhivrEprI4wBcs1YxkFeW1C8OwaqMRRUAKNNg2t+/N9H71oXWV12hUfsTOUKe25Zx3donGFaiVhJhjnzDNk1vlYdsCO0MZGQmXun/mWKNhZLMTCppnDRV53qCbkK1gbR5YvClxjeQV8HjwsHWJLxGbN9LN9+oDihV5G3y1EBTSH2hDmz7ytaLQwdRGHmgYo0wLCJ1MNSuf7TuHef3fBMJl48SKeH7seuqw3/W4JUfSLQSYXe0f/7dNgrFaFN2P9TJAIzX4TWOjc4Dtn5a45GAv1No0c1UeWJykfrD27/obzwi90wyuF9q6fecjlHOWBGtF7G+RTQ4VJl77oYAl5YhsllUA54Hem5/oV8ARZ1WmuGndIHifk0MkVkF9nXfpTaA1RQxkHNmwyyQzMte6cup28pBaXu0he2HP2YP0P8Lp8drqm/oSnULv3bdVixkAvodk118PDYaWnlQiaUigeG10ix2bZXQTVw8A/iQeJIHPNbZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/u14YUwzhAxLheGYT1pu2PeD59Bdt0z4Eo3tJzlXtOn3wcklqm/hCIxS/oUa?=
 =?us-ascii?Q?cigdlAtg4wPxmz8OEgF3AwLNsbowha9222HUQSb/9IrOz0pdkFC5cMuox5tC?=
 =?us-ascii?Q?i/tWZHP2+bkJ45nYr47PtnZ5QCVzkouRGJHkceAzutBxPlituQP9X0F+7kEb?=
 =?us-ascii?Q?PnccheynFaAGO3VHqj4qhg5CRWGAu0aOnFp7nfKFHeY8CQy/NhesFwLXrnDt?=
 =?us-ascii?Q?WHdRhxXp7gZaSaH40Glpecf4N28CXXQ16asnZcWRrgwIiYuc2uE1k7ivp5hI?=
 =?us-ascii?Q?a2xjVI5wBZJlBd9rc6I864MVCpDk1QIsl43UDqMaDvP24uKho00tM/VjBrSv?=
 =?us-ascii?Q?npwxGRsIsJAfZSlxnB51dmdkpPxYxo28fcP+t2jGei1UGDrFKJIsMpBwuSyp?=
 =?us-ascii?Q?ki7Nc24GN59bELsxNbpYh29/+ftv5oNtae8j332Lu3jycHF/OAQTu/YFaC6t?=
 =?us-ascii?Q?h4HyuXO7u60JT9FFUwMaG6blmh5t2YvrqwcXhXUHmtf4R84fMitlC4vxLJ4j?=
 =?us-ascii?Q?XncyV/FIePRU/VpEWnFCOTp1vFnEvyT/cgEdyQO4OL9pZA+mTIuBCOjsT9vc?=
 =?us-ascii?Q?LsxNkRFOjxePZr5ZpwvsBJfAR9GdIZuTLZefsyNxb+n+O650ZpZF2QuSjBQK?=
 =?us-ascii?Q?SG49NQkDbNlBfH6APYQLqA/5fIzGmZDyy/wcWiENdqhKd0Ra1pMvx7BFw7XR?=
 =?us-ascii?Q?a2Mspj0Qkdsx5AVYAsv3J0f75dpLkqLyRQJsPVSF3hjx9NXGMPQCbv8zhFuU?=
 =?us-ascii?Q?mW7XqXcYajqzRkuayL6izKNUdIdh8613GLD/SepGk4kEwvR7FUoN0DP2iE0r?=
 =?us-ascii?Q?jk3bJ6l8qSfKSydZDebRJ6DHsqVHaMpYqZ2bawbEcJ44rQqlB0AoqpmDFVAb?=
 =?us-ascii?Q?hl28KXSQ90xxUBjbFmKMWi2yUBdAqb+6lxgDVoioJLnrIUhvwssaOrpu35/v?=
 =?us-ascii?Q?2spZiSKe9oW6z+oOZdtsgvvzvJJL7/ZB2ZvifwqbgJy+qdRQzBYOOoDFnSzc?=
 =?us-ascii?Q?c3bFHVSP2D2Ay2btwBstoSPLwggGXft4VYCWR1nVK7u7Eq9cmi7rEjcUe1VZ?=
 =?us-ascii?Q?tSDuNMOfLXjHOPBnaEI9GLM6zKTFxm/kIQ++sV+MYwC1oSs6ZybAo/IXVCsA?=
 =?us-ascii?Q?BG+v+qn17lVfYudf59eKvVGcgC3Sb+SuxdayioSAnP2AKInDWFf1aHN64Tx6?=
 =?us-ascii?Q?x6aj1c+pf3Z9SVOA7KV4wJ4eXDn3rNFXpB4oa6IhJPVb+JelIxhRqz7PibqP?=
 =?us-ascii?Q?wZElp4egXJY3elGzcmVMbpxXWjmAxj7v/iJHZGUqi2ns8rNT+ixcc4/ZVsuN?=
 =?us-ascii?Q?tukgh4Vn7fjPoN0c8WxNDVZx6rIAWr7LALPMQIZPA5H7fNme2+3m415pUpfO?=
 =?us-ascii?Q?dllE+oZXITZ3ahKBLNhnmxpEn20VaYoWgh1JtpQvcKL4R5rNx1pgrIC7WWac?=
 =?us-ascii?Q?Ei4sMX4CLTN+IEXEp6EBiR9/QKoY/U1bbZAjiR8xskQjyd/3UBoRdYLSeXtW?=
 =?us-ascii?Q?MH6pC86QSfDkoU1rMtyzuzXOTWlXc+jKkxzLknTu27P5cacgJa4uIZXnlynN?=
 =?us-ascii?Q?9n+LB7CTlU/ZaRTfoqpalJxvaVylajjoTsy6hYgQcbv2jY0HfBre+ezsLJ/7?=
 =?us-ascii?Q?w9Zbx8GG36bzj50eCFpr+u7olbaiNaDHFyo+18BTczSSVH1G1yRsscJAxmSc?=
 =?us-ascii?Q?7zq5dfm839gslCcrBAGOr0cNgKuVJiwZNLtNjReb/P97TBX/EGDVezr2atEk?=
 =?us-ascii?Q?pSg78l9eBQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: HfvSm6n+M1BMiOGMxzA0WS92WFTFUgNcPvQvYiG9ld6tXHdjgMiL1d8ZESA5eTecyksQtLXQpwps7kFk+4NmwONHmWKqBI40b4EghoKVWkgtGTfoqEf6f+UBxpixaXCnu5/IuP6OvXLSCou/p+JDqr/lWoHigXbJx1Cd50KpCxcK5DTsiMS38Ac7E0qc35Fgp93wsLj5TCSZMApGHDGAqlRdnnxlR5Fi4pVHpp8t3f8pU+1ecfG4N8rW6cmtFIo5Ltn3diWTEErrLCWRPOPmVSE/czqJFFnmsLQCQwKdxs8BaQgOBfingY/4hZo6I6h1FQ/A67BPMZXZkyat+mtoog==
X-MS-Exchange-CrossTenant-Network-Message-Id: b312b6d6-d16b-4d20-af86-08deb0f0082b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 13:03:31.2523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8dI6jJ4Xjotqrze9meQ/7BVNyKE8lsPy1Dd5BLCeGk7qiCo/BKPvB9ANwDxiiDvELHy48B+O9jtt7LZZX+dAkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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

Michal Wajdeczko <michal.wajdeczko@intel.com> writes:

> On 5/8/2026 11:42 PM, Gustavo Sousa wrote:
>> In upcoming changes we will need to differentiate between regular and
>> live KUnit tests.  Add the function xe_kunit_helper_is_live_test() for
>> that purpose.
>> 
>> Note that this is implemented in a rather hackish way, by leveraging
>> KUnit's static stubbing functionality.  A better approach would be to
>> store a boolean somewhere in test->priv that would tell if a test is a
>> live one, however that's not quite feasible today given the inconsistent
>> usage of test->priv (there is not a single uniform type of data assigned
>> to it across existing test).
>> 
>> v2:
>>   - s/xe_kunit_helper_is_live_test/xe_kunit_helper_is_live_test/
>>     (Michal)
>> 
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 26 ++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  4 ++++
>>  2 files changed, 30 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> index bc5156966ce9..d2f654f53cc7 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>> @@ -16,6 +16,18 @@
>>  #include "xe_device_types.h"
>>  #include "xe_pm.h"
>>  
>> +/**
>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
>> + * @test: the &kunit test
>> + *
>> + * Return: True for a live test and false otherwise.
>> + */
>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
>> +{
>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
>> +	return false;
>> +}
>
> or maybe we only need something like this in xe_device.h:
>
> +static inline bool xe_device_is_real(const struct xe_device *xe)
> +{
> +       return xe->drm.dev->bus == &pci_bus_type;
> +}
>
> as all fake kunit xe devices will have kunit_bus_type instead

Yep.  This is much cleaner.  Thanks!

Even though I realized after the fact that this
xe_kunit_helper_is_live_test() is not necessary anymore in this series,
the asserts you included in [1] seem useful, so I provided my r-b there.

[1] https://lore.kernel.org/intel-xe/20260512194514.3414-1-michal.wajdeczko@intel.com/

--
Gustavo Sousa

>
> already tested ;)
>
>> +
>>  /**
>>   * xe_kunit_helper_alloc_xe_device - Allocate a &xe_device for a KUnit test.
>>   * @test: the &kunit where this &xe_device will be used
>> @@ -93,6 +105,11 @@ EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_test_init);
>>  
>>  KUNIT_DEFINE_ACTION_WRAPPER(put_xe_pm_runtime, xe_pm_runtime_put, struct xe_device *);
>>  
>> +static bool xe_kunit_is_live_test_indeed(struct kunit *test)
>> +{
>> +	return true;
>> +}
>> +
>>  /**
>>   * xe_kunit_helper_xe_device_live_test_init - Prepare a &xe_device for
>>   *                                            use in a live KUnit test.
>> @@ -116,6 +133,15 @@ int xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>>  {
>>  	struct xe_device *xe = xe_device_const_cast(test->param_value);
>>  
>> +	/*
>> +	 * FIXME: This is a hack and a better solution is to have the "priv"
>> +	 * member of tests have a boolean to tell if a test is a live one.
>> +	 * Unfortunately that can't be done today because "priv" does not point
>> +	 * to a single unified type across existing tests.
>> +	 */
>> +	kunit_activate_static_stub(test, xe_kunit_helper_is_live_test,
>> +				   xe_kunit_is_live_test_indeed);
>> +
>>  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xe);
>>  	kunit_info(test, "running on %s device\n", xe->info.platform_name);
>>  
>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> index 83665f7b1254..71cfeb2d4efb 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>> @@ -6,10 +6,14 @@
>>  #ifndef _XE_KUNIT_HELPERS_H_
>>  #define _XE_KUNIT_HELPERS_H_
>>  
>> +#include <linux/types.h>
>> +
>>  struct device;
>>  struct kunit;
>>  struct xe_device;
>>  
>> +bool xe_kunit_helper_is_live_test(struct kunit *test);
>> +
>>  struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>  						  struct device *dev);
>>  int xe_kunit_helper_xe_device_test_init(struct kunit *test);
>> 
