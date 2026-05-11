Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB51CD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 12:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1F810E73E;
	Mon, 11 May 2026 12:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlCtgKTA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AD5710E74D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 May 2026 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778502660; x=1810038660;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=F+eLv/o4/ytc4tE1l9nPpRXlMt6GIVE2ZZUv2n2xISM=;
 b=jlCtgKTATpISmFBIvmCeyS3WI9n+NPnMwyu6FgEqd3JCYD+EdJEg4o1i
 0rInFA4MtMaBnDZhOHJ5MAjIuDxB7Qkm58YGcKyn2o2Oy2Zbq52JPV1GI
 +Yn7F+b1k8ofjE0dBvnz7yS9pLDMT0I8llB2UEcJ6+3elMZFRENxkk2rz
 cZ9WGAyZ0SDKgDxRebOhEH5K8y2LeThSpJgW5V6sabmbqKwXvWkB6GCwb
 kcLUU4HPKLiS2MW+F+IzWTLbVrXvhOlk9dBx4KZtlqVw2hGjNdgMh2LpU
 dqwT9ucHt32z/EJE6GGWdBPVdQs59z1rXcggqoSrAOqT7RLgTrCOV35rl w==;
X-CSE-ConnectionGUID: ufqVhpGXT1Cjrr4ZGvRURw==
X-CSE-MsgGUID: 5KFQg+zcSUC2Ze1OZ7G38A==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79371065"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="79371065"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:31:00 -0700
X-CSE-ConnectionGUID: GlE7u08VSYeDGLlt2b50mA==
X-CSE-MsgGUID: pdwoWYqOR4igXQAzMoyUMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; d="scan'208";a="234380326"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 05:30:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 05:30:59 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 05:30:59 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.17)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 05:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvah88H3TaMdB2MOXN3AY7rH0GcHIcxBQkTjsM4mRUjUxvP8u5Zu8Dx7+s28OUAgT4AT9YyGfcXhdtG/PzJ+OuC66gqLBguVIWlJcmsqqmTh/bfyGHQpdo0j1PDppLn/GVdu6tBAjxsr6V3jaeJl0Nu6tnDuqJnQpcxFThCJIshT1thh2VvBRMwqB/7Awk7+WLDgBtzrH/7dO0qcglA8vTJQlA4ssGxhxJ7qtsOMmKUMxdvk7zdnOR7801TUZNDV4mI1NohCLSPycs8H+mxhNoMDuo+jc96v9k+muIrHcqqJK3oAAA8fHL2dFns+pf9IcqvoGzfk+Kznp51ReyOT+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/cdQpchOkhLZT4OJWFds6LpswD85VgO5H4mfNmOMkmI=;
 b=BKSDq2dY4mxmZqWxSNqNNp/E3O/SD1ZEEY8ptBGnP5KRdfyl0JOjXv+JhdYyKeG2RBGterQuzfp3O98/l5ahqof/rIzK9ZJfQb22DOeYrpcPAQpro+t55Co+Qb+NuZTPeZijLKMRHvwrL92OOXjrKkQ6hmq9Wpmlf1fi4QBF3p+N+O2kP6Kfo8dLeJrbVT5+reAcdwc6cxo74pFn8GdITA3F4f2Ku/y8kVhomeB0LsWof2NakbPV17VmL19py9fHB7V0RbyTQgLzh3Gk6BWP5ji1eTgV1bm4VtUFUFjguBmFPhFpSoFQA0vWdt8VBRc9F+Auv0PVIr+9D9OjyNqAyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8071.namprd11.prod.outlook.com (2603:10b6:8:12e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 12:30:54 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.20.9891.020; Mon, 11 May 2026
 12:30:53 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 4/8] drm/xe/kunit: Add xe_kunit_helper_is_live_test()
In-Reply-To: <619ba2cfdac33128f92c4f83b8573770146cead8@intel.com>
References: <20260508-rtp-mcr-check-v2-0-9897b147a5d2@intel.com>
 <20260508-rtp-mcr-check-v2-4-9897b147a5d2@intel.com>
 <c4e5c9ed6e931ef2d5ba5b87b7be549c8615f7c0@intel.com>
 <871pfirwy7.fsf@intel.com>
 <619ba2cfdac33128f92c4f83b8573770146cead8@intel.com>
Date: Mon, 11 May 2026 09:30:49 -0300
Message-ID: <87qzniqgau.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0088.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2e2aac-ae92-44ec-262f-08deaf59244b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 5CG7f6Z9lgO0T809oyk4MSBnnFkJfe6kGdeQ2nidj/8b2SqkJACd+ENzs0+zZyPrlNRMaL42vcKfNuZg1PYDJ5nz4JfiChvdApHqWqMIhoGUFhy0p/vKTpGOMM+npydW7KRCpW7Fp7OP8OKZYwZ/fMpxvfv6PP5TU44zlfz5mqLhk3H0lU3xwNjMdNN83DYHSvfha9UrpWIFzVP8D0ksAZq84b1dwhBz0f2bH45AUIgjc0JGdIitKT9Oq+slLVoT8jXlq5PVIx2iWrgajNN5furG/PDJNE19YGpf3iC28KqMBJ1feOnDxFY1W4Y/UGabHve7sDFkaZ+eCp1dwR2hpqXA3li7RewlTSczstFUk1XqSwX6SASfxLpI1Xf7PJYCD4Pmrtf7ud3CMYAuKmFxg6aqh7Uw1Z+l7sCETLhTQszNHViyVii2exE/evbkZ5ZykqMxN1IdFqep4/NPuzoVoTloGdcWzkw/HdnPQEh0V7hTp1+EYlU/vkKwCLcF7M0sXL0Ad6natZu38PvdPjyqHKLRUVNrTzp3PPC+AAAgiRFhVQL4yiqztBspFe0oVdoSySsMPEeXyDa5Dvr9xujaB1hQF/sTfZm6LFYexPkHF8BiMrN5J3jEHnk8iS4jNwHV+U0OYox3ejmK8qJ6uVEHh8MC8QTLsqf3o0M19Y34dFqw+LuG+H/GPns+DICnguxu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(18002099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8omoeWic5DxWzSwS1lZmmOkiDKy/OQhrbjKqpiVI6u3xYrH9gz7IZ6vszy35?=
 =?us-ascii?Q?CvwSlzppQIEeJa/JB3zjY9QKMPfSwTI0ExIFumXbbaeEPLoNdykP+84TUL7J?=
 =?us-ascii?Q?J8eXL97x/wt4tORTA1lAYtxeub5so8nRnzRxgBJMFPXypyUQ0/p98LT2RG+D?=
 =?us-ascii?Q?Ww2iwC67I7qpa2pnA17PjWiNwBBqIwFQ2yh4imN7UeMXF8/yuCyy4rjkzxFJ?=
 =?us-ascii?Q?tSAxevs5agxUywqVWXsc8MYc7pFe2PC5Xfq00kK29HJi9gkdK8PH4/CsEVnF?=
 =?us-ascii?Q?ZgsiQ3AjCo0I5Jjwq2k5XYYfV5pDEorgHNV0H9Qo/vuFAb1xVmmJVODbWCGC?=
 =?us-ascii?Q?j2MlrXVFEzDl9kzjbzmkcoiy7Ti82b6hQBFI6FW+/Mxa2o0UAOS3DtveVq+a?=
 =?us-ascii?Q?BdVgTThL6i8SUCMaZ4SQYJKvxhur65InZg+AuxDbfrPPKdIZDuIvJwVfZE9D?=
 =?us-ascii?Q?mICK/j26QpX5pfxyRuiVEmiUnMlS8IyjDSAUyLdBzmzZYUmx6OmKqkZu3j9M?=
 =?us-ascii?Q?gYnSvLmHbY6b8liFFf4DWsXuj45/ZibbBgZxMe1muMrJqFPfK54o/EOt3t1R?=
 =?us-ascii?Q?M7NO+jdbBZPpKV1JeKD/gO3QWXF5am7juB+N/Wj6uok4v+CgTNi6eGW3Hs5N?=
 =?us-ascii?Q?IxzsL4gIIB8VLqlLTIyIK1Pan+RKa7emLIdXjvcimZd61y2aKxwj2CgWOZhP?=
 =?us-ascii?Q?pDqUC936S8dnvpysU7jbdUQdte29BieDjp/AHE9m2TxUBdCqniVQefdwqueo?=
 =?us-ascii?Q?z0eikL+99+WLo4LYdW8GgK8pnmtnKYej6Xq9+zes7bq+LtTF4u5tB183na8B?=
 =?us-ascii?Q?jvgv4RoT19/VpKwv1+UrsmgBmlPJtmpAOdcSJ20rBwa9rYeXue5ogubYB6p0?=
 =?us-ascii?Q?uoWVGfzg1HTnPPWD5s7SpcHJPZI/Wo9ll9gnyTNhYVk0lJrMO0lvSqqD/WZ6?=
 =?us-ascii?Q?NDCob5m6dNchQG8a5lXunEYuhYa+/Vyhf1IO9S8/mxPC+ZzJFGoiO2WQOyc7?=
 =?us-ascii?Q?1CmV+gn43aDni4kBZD2NIF7IuqYwfJ0zx8DIY5doSf0lYfTY+uoXEElt2fW1?=
 =?us-ascii?Q?/a34vStnPbPQ2CSv49QyFQJZ5FFtA65mZsFEwB2wWJ7cSQ0sLKnSaMamH5dX?=
 =?us-ascii?Q?RxoVECxwewD7WYCSTj4EwvkKUjIDQqBqOa07hfZXCDTz8G06a5Y6PCuzcGR2?=
 =?us-ascii?Q?wL38FOX+ljGGnvB7uxrYH4YxjQsYHJfoQWoZBmipoxZ9YdiCfsne3vLM7A93?=
 =?us-ascii?Q?VmS/Yp55FZurV3MzC2c8yhs8kOFURA6Pjy2V0zv4A+59/SGklIfNwSlbFNck?=
 =?us-ascii?Q?E6KGFiM3A/f2cDbENLR7Z5IXJ7B8QmIh3TcdWvkLa7l3Czz64XGgEZp2be8g?=
 =?us-ascii?Q?tdBgz0JMwAOV/DRRMyOVrQwF3yJ5ErbhOJ6ykrCBduRX0DHhpw7N40NeVKbD?=
 =?us-ascii?Q?32PuRSrUqMx1VzRrwKF4lVvm6AZCePwHrE6A5sriC5EAJsWyqlhEQhVhiyJe?=
 =?us-ascii?Q?vd8VQBZRyYmoGOXQNqUSDkVklLdgW1Jhc9U484wwBVi1GJYbyHr9Qb3EoUuP?=
 =?us-ascii?Q?wVfIG5HIZjELgLSIBO8+msuozDQWaKg/GTCIke+ktXq5yD03SZflvkSW5/pI?=
 =?us-ascii?Q?cvg91CYFEQRds7vbH6ht64oGhjkjQ0PplOgwKvtL8uMwto/3ALG7UKBr6Nsa?=
 =?us-ascii?Q?cZKVu9b7mPFrMLiE5jvBtzbnad+Bv38Hh7lcVp3xTjsQJ+50yBLaGV/fA4xQ?=
 =?us-ascii?Q?0UOP0cNNWQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: aVxulm7yKdnTwH/+Ut6pGF32RTQbg5y3zQe2MRW6KP6aL/SC+MB/g45UQMsd02PdoKthhEaHwoYe5Bl9YpiEc2R+6boK5qpi6X3xxZB2o/V8Wq96S85KnMXmxAjuE0vtGgGEf5PX+ABRFpk+PuBiKkiAIDDbHXwsp1jlhgSb9kJ5/mOHjOIITQ8m3/Z1pwdw3+U/vFtSVLAKHv/4acr5ywifgBNPH5WT4UK0JSUblTPlo3qqB2Sqgaone40s+AKWlqzNS4qU8twgV7trt7Eq+ljcmzQZ4eHJkztVMQU2C0k2vw1jN4fCQiGi276/jbyXOPEmcyZEDHAE/zVWJF06Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2e2aac-ae92-44ec-262f-08deaf59244b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 12:30:53.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sxChoQxk9Dt0SCRz2jkKv67hRK6PzAeJG7MI9plxeznP3Ph26KF3z2bzQm6nspKD6BqY7Ic1Bj77e1zTRTIJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8071
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

Jani Nikula <jani.nikula@linux.intel.com> writes:

> On Mon, 11 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Jani Nikula <jani.nikula@linux.intel.com> writes:
>>
>>> On Fri, 08 May 2026, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>>> +/**
>>>> + * xe_kunit_helper_is_live_test - Return true if @test is a live test.
>>>> + * @test: the &kunit test
>>>> + *
>>>> + * Return: True for a live test and false otherwise.
>>>> + */
>>>
>>> Pardon me for being blunt, but I think this is the worst kind of
>>> kernel-doc comment.
>>
>> I appreciate the bluntness! :-)
>>
>>>
>>> It doesn't provide any additional information to what the function name
>>> and signature already convey (which is to say excellent job on naming
>>> the function), but it fails to explain what "live test" means.
>>
>> I kind of just added this kernel-doc to fill a hole for "consistency",
>> but, yeah, it does not provide any new info.
>>
>>>
>>> The extra bits of useful information people might need after seeing the
>>> function xe_kunit_helper_is_live_test() in code are: What is a live
>>> test, and what is it if it's not live? Dead?
>>
>> Zombie? ;-)
>>
>> Joking apart, I personally tend to use "regular" to refer to non-live
>> tests. I do agree we are missing some documentation on the subject.  I'm
>> not sure though this function should be the place to do it.  I think we
>> would be better off with a "DOC:" section for that (and also explain
>> other bits in there).  I think it would be sensible to rename
>> xe_kunit_helpers.c to simply xe_kunit.c and add such a section.
>>
>> With that in place, this function would be kind of self-explanatory,
>> right? Is this a case we just drop the kernel-doc?
>>
>> Or should we try to be consistent on "every public function should have
>> a kernel-doc"?  Is that even a rule or am I imagining things? :-)
>
> I believe xe maintainership leans more towards requiring kernel-doc
> comments than we do with i915 or display. I think the hard requirement
> leads to a lot of unnecessary boilerplate, more geared towards filling
> the requirement than being informative and helpful.
>
> Personally, I value overview DOC: comments much more than kernel-doc
> comments. If I were to add any hard requirement for documentation, it
> would be for DOC: comments for each .c file.
>
> Bottom line, for xe, ask for xe maintainer opinion.

Cc:Xe maintainers, in case they want to chime in.

--
Gustavo Sousa

>
>
> BR,
> Jani.
>
>>
>> --
>> Gustavo Sousa
>>
>>>
>>>
>>> BR,
>>> Jani.
>>>
>>>> +bool xe_kunit_helper_is_live_test(struct kunit *test)
>>>> +{
>>>> +	KUNIT_STATIC_STUB_REDIRECT(xe_kunit_helper_is_live_test, test);
>>>> +	return false;
>>>> +}
>>>
>>> -- 
>>> Jani Nikula, Intel
>
> -- 
> Jani Nikula, Intel
