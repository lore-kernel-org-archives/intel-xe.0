Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A241CD5BB1
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 19:00:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B81C310E1EA;
	Mon, 25 May 2026 19:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuXsTwau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4238D10E1EA
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779735643; x=1811271643;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=M94Ul7xVX7Cm2aCThrLPK82qWodfpGcayv4YdZaFfKI=;
 b=CuXsTwauiX/IQGvoN3ANhOHgXwFBBQkL21RA/0Frwx6De/frIX5Vf/HX
 zSsOL9VUGwkGYKa7lGI4RlO60nFiaTNQK5Rm5PyuLF4umv2ZROcd3K2XT
 glkrE1nUBUW5g1M00rdEXP4XHWt7PMTUp7k3u+I7bmq/Kxz/J/VUTu4yR
 csBvOOJ72ANyao6q2OYmyK7SSQKPnQ83/MUyOz/nUsmdJGv4IEBUDekOV
 gIrNoQ6Uu+OuuQ0jNgCTPukN6zjcEsWlwKp1owtP3WShILRwp3vY4RXaM
 z7yHqk+vXUXoL+rIA62/8nOyGwiB8g4YW4isO9F2yVDXGQkMgqC3mU5Iu A==;
X-CSE-ConnectionGUID: 0hQzWW27QkeDBOcNfDwMYQ==
X-CSE-MsgGUID: C9A0QumpSDSmdtiF5FbT0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="80527265"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="80527265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:00:42 -0700
X-CSE-ConnectionGUID: FSTvztsURSimNZlrVvseIQ==
X-CSE-MsgGUID: qbAvUtJIR1Wvc3FPck98uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="240842513"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:00:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:00:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 12:00:41 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:00:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QH5huqrMe8fuoTxt2lDaAmSUZN75fn/tjgRubOkAzAZj3nJGzfj/cwRa64hrPr8TGkMALcuwRReQPilfAdGJeD5cCgpaIB69aM8s9+N7bAfcg4/PHipZa8erZeC4baq8YTeJapnFiA3yzfvljyYmS7scyTtCr0YYLRbU4zQbn6TDMilaDclRJ9rUIiYoc+fRyF4NVRfx/N7CsXsRttL1b6RgfnYhd/32A6wCrFTflG8+q8Ed4Z73NX56jNddgBTNa9hGa6cph/EgFbArWaTDXtZgcFwNRxtbVp+65+kNE1eUM55U9yjR9FAJ2l/k3L5zRgXBdAvk6wXJZgnkXnsHoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suPWUroXcZWIC7u100pe6tjXA+EFSA4bXkpw1JgqKfM=;
 b=Nqy19F2wSZ4I1D5qydP8oqQ1ntBpSqU5qrzYGtCX04eII/znZtEn0ei6Dyf/HV0k9+hhK8KSw20LiSEggDjbB+6t4Uw6dVifDiUKKUasK+E1C0NG4KGPE84AUIahgwv8DsmcLYdpv9stFrz0I2d86uLrBmeq3VUJHrsv/m440z6CoT7DDphvrB7Pprmb9X95/Q0UrIvQf5Vq+XR+vDBUHtrtXutU2RuT7PsnA8ZCrPPMV4z0Cb6cDByrfvmR8C3XmMyLS+AGD0qra7u7kk7ICq75tJvKJ3t4VwXsmRRZ8iUGyWlVhffcUsqIKFj/i9WxzHGls7s43Rpe/AfAUMa2tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ5PPF183C9380E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::815) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 19:00:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 19:00:38 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 4/6] drm/xe: Separate early xe_device initialization
In-Reply-To: <87bje3ic4o.fsf@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-5-michal.wajdeczko@intel.com>
 <87bje3ic4o.fsf@intel.com>
Date: Mon, 25 May 2026 16:00:34 -0300
Message-ID: <87wlwrgvql.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ5PPF183C9380E:EE_
X-MS-Office365-Filtering-Correlation-Id: c2b332a7-13fc-450a-9691-08deba8fe8ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|6133799003|22082099003|56012099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: bIUQ2auwZ/L01a7Vr9mmkw/VwiqKkYXAQXyjXLRwF23mmcFjy7k6pwOc8bVJPL/bpfTuGeGa5A5HbUEUbeB38HhuLTO+zZfN/Arh7rf8Z9qdZ636UWxAfmO4+cmR+iSX0h3dfz8SpBBI2VSKzD97scssOsoWoqrKJDE1qUuIReyos6LdvCEnVPk3kG+MVeiJmX+t9kyztbsyA21ANtHAklZqgwd22+7EwEH054WlhMhXsABQk9XzQCw9g8k7irssQXapdzqOwsxop0m4ifLGiDxvcwKwli3xZukHMqXrfV5ZfFhFOZEoq3h+IVlu0yV0txW2U2PPsXKrkd56JRYrKRG0l3L/yu+tR4GGZaRkNDvSBB4xJv3qLXnPO7RyyBxcGBw64pIsUwfAbYdR1UKaENyutHau6l51tuDYpFmhVRlZZGcyRbF6576Y+3hlFk6zyJxH5tuB+uU0kVut/pFtbQ85VazX9s/zlpNl/FeHujGRQx+U0nd74C+fpryxqYVMhFBv/vwnrKlg3lrhrajfaGCWNGF/7TJ4Ks1k3/wffjb2gtk1VkwQtEkrH96wkKv4whshzHNoB+4sry1jTrX2OazzRwQsyaL8P0LKI3DNy9mttzwy6t5wJpS2J814Md38IFFA99RDZI/fDmnWjlIBNe03HiSpy751vBr4j//GokHxbZ89MXGTUTkqxkXq9ULS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(6133799003)(22082099003)(56012099003)(18002099003)(11063799006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nTR/8a20jHd9HyRCfts4GIOAYdcTh9DiN+CuvQxdNepoHYy0c5cPzipLS4PD?=
 =?us-ascii?Q?qDMTmjgFF50uz+uKkGBEWKgj51OUMwq6l7g2Sd7n5qYzgsAuCLm10CbctKKj?=
 =?us-ascii?Q?8dmNoUq+p7UyeeiFlfZ1sjjNC9sZRsPh2slQ4m8wNtwlkdwIVgX/Fi4U7LBo?=
 =?us-ascii?Q?ubCmWJaCfnFXDagUyC7al6GfA1+D/hMDn+KM/S88JM/JxQ9z5/YoNXqHitbd?=
 =?us-ascii?Q?qo2I+HIn9xLd0Yd2bqaxY/nsa5Upq4DNaAIF81SZ5llUF8KfUsgpTNyAQVVh?=
 =?us-ascii?Q?uKYWALKm18sZAL6o6QiXHizaLW+QwZuTJeRExGqfv4pcfSo6k+R7XzT/wNi1?=
 =?us-ascii?Q?ShdEN1XJfExGzAIQIxpZwxKm2Q4EeKU8H54bF/w1eKTJW6OKX1mUU7OGzcK9?=
 =?us-ascii?Q?yVEfWEw5vUjKdOmzJPqGp8gQjpEvWr/6rpHANeM/VCvvxNiEege2fDvmg6yv?=
 =?us-ascii?Q?l0q8CEQrXU3R2F49d++TEIpAbt6nnvRMdjIW/njc0VtrFq9ovmiaQplglOzX?=
 =?us-ascii?Q?uiM3i2rS+9ipiRbCGXurS4+gFCZDCeDv2j3GC4GmNTdyJt/oTAeZs+r6UxXN?=
 =?us-ascii?Q?ALbh4W4UplMDyS402DDHLibbtcnt7S0QDs7fLTdx3bKat8FeAhhWDCoVAlFS?=
 =?us-ascii?Q?X1vwAujd/6UmXDfJvvl5QMzSbykzSW3OBvjLLa6YznjAKdHjfcK7J6btxmdV?=
 =?us-ascii?Q?yUpg59MbbzZShPrqiBPi/VlVu/lzP7oI9S2S1/ntUabL/pH6yKkDsuKuCNbT?=
 =?us-ascii?Q?TjdoahX+F354GSTCEtAxYz5I9XEm7JCX3XvKsGxC3Dl75ZFGoCEVNtM/GeHr?=
 =?us-ascii?Q?zI1RHwdkmN03kWprrdsmQcaPaluljcyZUMoJabQiyI4P0DUPBRWlPxY+X4/w?=
 =?us-ascii?Q?g4u9s2AHxwuTYDOKaAgtYpVwmv7aK86gjFUb+RYEcv21lh3mmtkUntR85pJq?=
 =?us-ascii?Q?7MZDTLPcILD8fy8WMVJaw7qrkdtbpK5rzobXQedSZ6S2wTJ4p7c+jEFImtHU?=
 =?us-ascii?Q?SAxHfEd/JeSli/f/l6uC0WtJJLamMrIIie0CExUBKA4RbtMfT9W6v1KNZ7Mi?=
 =?us-ascii?Q?+5Scfc0zeVAhe861iAEOw+L8JWVthUBYasdJgpSzHXi/YSAua4yojJK2I2OS?=
 =?us-ascii?Q?6IAMF7QVMVU4YtHyqBI24bvAd9XC3WEhOPyIJgGP0v6JKfXCgzLmkTx9CmYd?=
 =?us-ascii?Q?gbmOUSSiZ2A4vc0jT6vFG6PbEk3WxWK//YnCtvLxEv6cNnUvlAvD2OMWOqt6?=
 =?us-ascii?Q?cnoLmReVjhKv08Kh0NDuA4AikqHJueitANy1MQ9LAMEw0Of4CoGvBnuAw8G4?=
 =?us-ascii?Q?fjnmEOyIlWiXILS0RduHGJ9lgtXbFOsjSjaa/vvwdmtiqYOzAvaXs25zHt5d?=
 =?us-ascii?Q?GM5PdytbsT/F7p02J7C2BhZBqovbE9uHeC2S7kd7cu8D9gqBPzV7KELMlaCJ?=
 =?us-ascii?Q?oF9Le8w+GyyeSdU7qg8X/zxJaBzN9aySiTUUHI2m++ZSSAKWQcF8geBhzaxE?=
 =?us-ascii?Q?qKipkrCltJo2XzMJpbfbZlnjdj3XeC5OGLL8mn6h/gH8mcE6K8FDUIBV0nxv?=
 =?us-ascii?Q?+aV9/8qTWR0cnbpWlTm2st9m9gRLvSsy6HGMigy6FDoiCWE9afqnQtsmkNka?=
 =?us-ascii?Q?FkZIpooAMmi8f4Q7wlkY0o9fbcTJrD+hlypytbU8rQc0ikRxC637/SXxmzS7?=
 =?us-ascii?Q?jlRSBFSKGFXJjW3cvaw58jRELRsKP5WpJZhJt2+Mo5YoHdlz0zoX4IUcPuyc?=
 =?us-ascii?Q?uOka5qG4KA=3D=3D?=
X-Exchange-RoutingPolicyChecked: VDtAj+s1Uo85R69RWIJyOwUDvoqePvv7jd+Olk8qVq2mQ/ALbADxfKCkxEYD777ptBbEmjJmnyhkiJtjaWh5B+D0jOLVrQSO+AIXxwBGjojyGWcvK+drr6qGzewCy3a+Cro5UfkQSE0nOcp+Tm7KqVMfQgzcgiGV4oocFT/HKMruYvpyxq5qc88CiIdcimpbdmBnrsbIS5CuIny3JBBFXPbHu1HzuFfjFqssOdH7RxBLAU6HL745B8h1uGhEq/UvjXoQ4nt7iYbzB4g8rYVp9SmrbQcRTp1E/8Us6jnJSB9M+QFLaYwDa4Np58QJJe+m3StH8XU6VYDleSNjuBsngw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2b332a7-13fc-450a-9691-08deba8fe8ae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 19:00:38.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KaEkbwYfhT4kOvS+o4+/J+zOOqljhjuughDKz6VAIsmEJDYq+A8wokuWzS+dImmJJueRTD/bkL51qrWUG9JK0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF183C9380E
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
>
>> We would like to initialize more of the xe_device struct also from
>> the kunit code, as it should be safe to use most of the generic drm
>> or xe components without doing any additional tweaks. Separate early
>> xe initialization code to a new function, so it can be reused.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c | 39 ++++++++++++++++++++++++----------
>>  drivers/gpu/drm/xe/xe_device.h |  1 +
>>  2 files changed, 29 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index b498147dcf61..7ba407f73a02 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -506,27 +506,45 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  	if (IS_ERR(xe))
>>  		return xe;
>>  
>> +	err = xe_device_init_early(xe);
>> +	if (err)
>> +		return ERR_PTR(err);
>> +
>> +	return xe;
>> +}
>> +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>> +
>> +/**
>> + * xe_device_init_early() - Initialize a new &xe_device instance
>> + * @xe: the &xe_device to initialize
>> + *
>> + * Return: 0 on success or a negative error code on failure.
>> + */
>> +int xe_device_init_early(struct xe_device *xe)
>> +{
>> +	int err;
>> +
>>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>  			      xe->drm.anon_inode->i_mapping,
>>  			      xe->drm.vma_offset_manager, 0);
>> -	if (WARN_ON(err))
>> -		return ERR_PTR(err);
>> +	if (err)
>> +		return err;
>>  
>>  	xe_bo_dev_init(&xe->bo_device);
>>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>
> Curious: are the drmm_* calls going to work fine for the automated
> teardown when they are called from a kunit context?
>
> What about devm_* calls? From a quick look, I know that at least
> xe_bo_pinned_init() will make one of those.
>
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	err = xe_shrinker_create(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xe->atomic_svm_timeslice_ms = 5;
>>  	xe->min_run_period_lr_ms = 5;
>>  
>>  	err = xe_irq_init(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xe_validation_device_init(&xe->val);
>>  
>> @@ -536,7 +554,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  
>>  	err = xe_pagemap_shrinker_create(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>>  
>> @@ -555,7 +573,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  
>>  	err = xe_bo_pinned_init(xe);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>>  						       WQ_MEM_RECLAIM);
>> @@ -569,16 +587,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>  		 * drmm_add_action_or_reset register above
>>  		 */
>>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>> -		return ERR_PTR(-ENOMEM);
>> +		return -ENOMEM;
>>  	}
>>  
>>  	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>>  	if (err)
>> -		return ERR_PTR(err);
>> +		return err;
>>  
>> -	return xe;
>> +	return 0;
>>  }
>> -ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>
> So, there are things allocated/initialized in xe_device_create() that
> get deallocated/finalized in xe_device_destroy().  With this change, we
> now have things extracted out of xe_device_create() into
> xe_device_init_early(), and it appears that xe_device_destroy() is now
> really the counterpart of the latter than the former.
>
> I think we should just call the function xe_device_init() and then

I guess it could still be called xe_device_init_early() for consistenty
with the naming for the other components of the driver, but I would
still rename xe_device_destroy() to xe_device_fini() to avoid people
mistakenly pairing it with xe_device_create().

Honestly, I think I prefer much more a _init_nohw() suffix than
_init_early(); that way we can pair with _fini_nohw() (as _fini_early()
would be a bit innacurate or ambiguous IMO).  But that's a bit
off-topic...

--
Gustavo Sousa

> rename xe_device_destroy() to xe_device_fini().
>
>>  
>>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>>  {
>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>> index 27cd2329b99f..975768a6a9c8 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -44,6 +44,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>  }
>>  
>>  struct xe_device *xe_device_create(struct pci_dev *pdev);
>> +int xe_device_init_early(struct xe_device *xe);
>
> Right now we do not have any external users for this function.  We could
> keep it static until we get to use them in kunit.
>
> That said, I think it would also make sense to separate it completely
> from xe_device_create(), i.e., have xe_pci.c call the two functions
> instead of xe_device_init_early() being implicitly called by
> xe_device_create().  I think that would be more alligned with the
> function names.
>
> --
> Gustavo Sousa
>
>>  int xe_device_probe_early(struct xe_device *xe);
>>  int xe_device_probe(struct xe_device *xe);
>>  void xe_device_remove(struct xe_device *xe);
>> -- 
>> 2.47.1
