Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C79CD5BC9
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 19:06:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4110E3C5;
	Mon, 25 May 2026 19:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SEcp0BpW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF74910E3C7
 for <intel-xe@lists.freedesktop.org>; Mon, 25 May 2026 19:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779735960; x=1811271960;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=WnnpjPH7FjZv7oAFEOz98SN7ip7jf9gcjGPzo/aj+Wo=;
 b=SEcp0BpWbZBYMrEg92hUxckGSWqQKb0HZuT/nKE6tD0qXjo3zbpX406g
 ApWjXUWP+DhIw5JcXfeF3rmmliwZeUQDfRCRvd4fNlC0j4lq88p0SkhJa
 ZVD1cQjCNl7oupZKyFbM86cgPCMqleh0pXRuAu3awab2BAfDEg0tYP3yR
 ZsvuXTnaxs+UK3sHSECiTYOYnWt9EZJ/+zdWnyvw3AU5wQS1NVetuxsQF
 whF38U3zLTdrHWnoo2KHlEBxIL66eGI8ork2y87Bx4Z0gseMRhapS9M2l
 CSHPH6kQq24fRfNO+qYxkAMrPZKxLS2SU3GG8TdTAr+19qjNbPLuvuFBf w==;
X-CSE-ConnectionGUID: kbrltsv/RdqYRVeHDxr/6g==
X-CSE-MsgGUID: RlzwfTpOSdeSQQTKdRnyuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91123278"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="91123278"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:05:59 -0700
X-CSE-ConnectionGUID: dISfxJ3QQ0e11c4/jbPaLg==
X-CSE-MsgGUID: sD85U+mLQIeyULyOk29gjQ==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 12:05:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:05:58 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 25 May 2026 12:05:58 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.6) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 25 May 2026 12:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fu2MaIcGAbmbJvixVmh5LTb5GMNPStbLmFrTg/yYGB/LjohwA54oGt9+JxwZxZ2MXJphKPrh3rnQqztrbyNEF8f8DcR1hJ9tJJx2lpoP6e8uKSvhKy1qFKVYR5ype/Y9Kv/js50g+G1PQ7jvDmmQ10RetrVSP9IZTZ3RybPP416BuddsleStX+xcjy1CnnKEKdFSg0ANzyRWMhIJuvVnY5jwVFPiUVAcCgf/OwqFSnn4VyVlquKlbwqWkja9MofSeeoZo/oed4nbd0jpy1iH7HpfI1mEdHdH8uvRTPqcTwZ/UPCe6FgUVwhRTJrUJzzljJ+OZ5wC0wNWiH9V3J0QjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eIMY9XzujPORZOSFBQXRkgnHoIAx1JtiWWUjelPwgG8=;
 b=nQ3KbmvliMT3Pk6bQFPzucYCiWKeWlB9bKaNuXgXgw5FVnCcm+r/NHzsQScFw6Km/PmUxoJvyFSphHu/90Z9FeYRil51Rrqy8Z2TDHQnn5OUdAEFXHHuu8f5h7UHIBYZ4TSho/8Qm+42SKIddM2oITaOdg4kfdvQDgOqMECgzLMy5tHiICcNCf4I3OX0bFwQ+1ZAQXocs61aALUsITm0YCaEIoPCg7S6nhl+IfF2zUGnJrPUhGh7JjkBZKYDvLK0BXJsMbOrVTG/EM4+eOznahYjUa/mEkwYl9uH2kcdsFNGlBxzvU+3ssmFd8655GYN1IGhguPbQa8NfbL4X2hLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 19:05:54 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 19:05:54 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/6] drm/xe: Separate early xe_device initialization
In-Reply-To: <cb7116e6-e713-41e6-a687-8e814ff2dcde@intel.com>
References: <20260525160529.15890-1-michal.wajdeczko@intel.com>
 <20260525160529.15890-5-michal.wajdeczko@intel.com>
 <87bje3ic4o.fsf@intel.com>
 <cb7116e6-e713-41e6-a687-8e814ff2dcde@intel.com>
Date: Mon, 25 May 2026 16:05:50 -0300
Message-ID: <87tsrvgvht.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 446ecf0d-708a-43bd-9372-08deba90a531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|4143699003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: RbY+/Uw4L2vTt9aY5yAmvcfYxtFmbloTTHJFOIYS8AFop1cDLd6yeooEDlSvoviWgR0Aln+UMb9yzeG8pmNc8wgMvS7Mj5FkVqZgOqp9eIpz4fOXk6amNQJbNTUfNn+JJmChFGmPcAg+2bFjdQyslQekEx7+jdFLXP7lmOKHDMzFMFG9hgtgGL7LkL0eghbbRGcXqIEopPX4xXwYqajQ6txtMXLj7eNrltgMjKcwAhuQy/PRsHed+kZEwj/Bd9+T9f+yceJ3DoM1cyRz5hEdC3LDKrTlcbSn0iugzQHj6D1daQr/NH9a6d8B+xuCrw7ZfVaw6Jsb95ZFzd3fzqeIJu8Nu+YQNEcv6hgSyxTLaSP5yhso260CPjwD8vItVg9OkD3haq3fL0u5U0hs+mSWxsv5m5gjJLRxsM+QUrktPK0Ijw0U856HhtNMLfUpv36ugE2pehDZbUV34tqTKyGztZp8Sp4sJ10w1dFzT6I62PvYEHTquZObX3uYgtx2WZeMU/WJVuPkKo7bnePWwlIf2qrJfZUhFs4YHLtRrfPLG4WG6va1P9MlE+dUX+4Bn8WmIwhWjZJ+12gicqB4R9gKfZyN4GuNG8Nm5nEUwlBrwqWHTo5YCMQ6wuNP2LWdU8EwHDnlreENtxJqHdZ9A7YvaMq3VgyQaMd4o+cDc+VvnCVx5CWlSZt/nFcEZgqe9Hzx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(4143699003)(6133799003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rhrCDfJIUYQKTO8lq2krpQNeGcbmib5sI17YwwNsqD0Htk+AmIcCqi87Akk9?=
 =?us-ascii?Q?IZsro/oz3f7YdDboX3WA1Ly5atVlX5A8fjirMj+cySvaY9II6E1y5MUgyIQa?=
 =?us-ascii?Q?t22DtWq9g3b0rxBAcHtXDm1reE/1dsQDrlmNNc7CHLXdz+r29RxMFyyoTtrq?=
 =?us-ascii?Q?I32bIokTCtCP61UaWsnh47Rzcm+gZQ28mlGHiQa2eW1ZqW3bbK6HqPtb1JwY?=
 =?us-ascii?Q?vImkrQNTmFPMrS+314CXCvV+P5r1tKXO2Ibg7Hdt3FsZyJTHCAqTCMaWhaNb?=
 =?us-ascii?Q?vTKF2ezBDaLM2jAkic3sOb2g2F8IoY+x6ilHdFtJj+FmGmTpx2/RZYwBpWNo?=
 =?us-ascii?Q?AsSDkUsN+uOhX3kHRdzAkUdj4EMQsmFxFTJiGcA+ZJq0Et6drLhekAsH/Vqr?=
 =?us-ascii?Q?vB2mWo/BhTzFoqrnRF4WkRZc5UgEhtP/S9Oc4Ipbui+P0+PaRRFozY7CAFlf?=
 =?us-ascii?Q?wV/ktBbKrcHflLpQ9M6n84X4H/PxCuJ2O1VxR8i47jrqPMJuBRZ9ODLHTONt?=
 =?us-ascii?Q?ec8PU7wNpLVagyWeW8Sc7d3iXKspPQoV8Et5+IzVcdvWBDFfBaeVQf8sr8ZE?=
 =?us-ascii?Q?efzdTIgu8Wd4/Q7BK3nDkGiQHa3ymvHu3NpPJzif3qlw+OPUpgPJ26ZWH+1Z?=
 =?us-ascii?Q?zb+2x1XLSdWoPPAAVYTY48enrQ4xYAN4LQV5czZUZeq8PuqiDkJn3XNGPpvb?=
 =?us-ascii?Q?I13VhO2u5gEiX+V93RVK1J8Sa1GHqMhRTwxWCeeGoWICeflWuUE/v+lNNKU+?=
 =?us-ascii?Q?CvFyuuyEACWlZtLdxgW1KlLLZhR/SlqKuKg8H5YspaqDR6t0rKYS3Kdrzszv?=
 =?us-ascii?Q?yk4K9Gdmr8LALCl3QJlcL+LuYlWJ9A51ub1Nki4iy/PuTqq4zkALnJ1vvFus?=
 =?us-ascii?Q?U2nfkTl7U8UJN7jN2uHryUjQGYNJkSMEfNNhnyKAjY1V3vWSrW7lUGHYPPy3?=
 =?us-ascii?Q?J0fa5cpx+FcfdsNmVvzn9zqfsxBc63thaIJcfsqGSPCmJlnCQX6a9/rR0Gqj?=
 =?us-ascii?Q?zAp4uEvdGzxEFk4WvE4J2Cxv8Nx/JjjGXPIZ9VDIPgbafRush3PQqR+rlpnT?=
 =?us-ascii?Q?IU6dbTxTjh1yhhwBm34ka24cO1w/hrFxrF5eKg5nOgO9UBw3CGlbypfMP+GT?=
 =?us-ascii?Q?97U+ObwNqtuBPEhmbnGRJ7y5jW3Y2yjNgIOSu0R1f0lVbSKkCEj9CyPEgTTL?=
 =?us-ascii?Q?EtP1X1E7g9kyZo+qCaF7Vs7cN6PHj+7pCYjmEV3TsyEmf6dBjnh1nTm9nhkM?=
 =?us-ascii?Q?pke0z9c6zRE7c6pcBIvQFvpTqKCfDtdrHV4/OdcO1nLaYAapKYPtzNVUteXD?=
 =?us-ascii?Q?4lVlmOrIBWypk5ekpPbqd4Gf3JCHd/eHX6qXG1whgljOTPFBqLvajJtbldDf?=
 =?us-ascii?Q?BcChEqWpD6tRFIDimiqK8mHnSfp57aFgrVrJBkw1oTqPyW5aia++U4y/Qhfh?=
 =?us-ascii?Q?95k1YJvnuLEDfovG4KrvjZrJ4GYwcW1s0zYylUzJOMvDUg/SeXz/hAGc3BOG?=
 =?us-ascii?Q?QzVRwgkrn+FxzNoZtB4CqDxtgdogf9B1yga8hRl2qQ5jwe1a4yvjFsJZPvhf?=
 =?us-ascii?Q?Z4LJBbSzCG3o29O+qMqAzgpIwkvBdrnRxNM7cuEWIGUDQSCtwwAMDJCJY6F4?=
 =?us-ascii?Q?b80RmCVj05kkZBd3aoWQ3QTii7dXaJnnx85nkyalugikUMhzeq0HSEb8Bp8v?=
 =?us-ascii?Q?VuRMuFl6K+wJ51b1sIICoWEIDEznfADsD2CaHWNIu4R2Z5RYHvp4ef67Gune?=
 =?us-ascii?Q?Fu4ou+sKmw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Fn0k9qZhmaiXvYCXirfKrTK88VFwJf4ce953l7QPwhpCmXciUPHhjjAyF1M9HboLqXEf1i07R+M63a1Pn/cxZK+bwMawgqI3XBseMR8nuTz0y2Qi488WcpI7i6lu7U0zIZRm0o7fF7o3+7Dy+YPnbKHaGxDUPjrZRlAndmAvpxrdxzzExlqR8QrndA1rFlqdnNRAqIqOySbZfxOloTFSbdk9hr948B0PqwiPWCsxy+WwirZyObNdZwY/PpFMjM5LmbquZC49dDtoZRyFImdMwyPY9oKXzv1zGwPk7Ui2abpmzNtiaDAgasP+JUJDs5015zv9IX6Nymqha6DA/OlXwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 446ecf0d-708a-43bd-9372-08deba90a531
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 19:05:54.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFLNl9vvSxdfzY2pkkxgfD1eIHSF9hiD2hVrK4YKdFhu55HlV1JKve7ufTT3W0dcGCHaJKuH992dhwIefz2hig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
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

> On 5/25/2026 8:21 PM, Gustavo Sousa wrote:
>> Michal Wajdeczko <michal.wajdeczko@intel.com> writes:
>> 
>>> We would like to initialize more of the xe_device struct also from
>>> the kunit code, as it should be safe to use most of the generic drm
>>> or xe components without doing any additional tweaks. Separate early
>>> xe initialization code to a new function, so it can be reused.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device.c | 39 ++++++++++++++++++++++++----------
>>>  drivers/gpu/drm/xe/xe_device.h |  1 +
>>>  2 files changed, 29 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>>> index b498147dcf61..7ba407f73a02 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -506,27 +506,45 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  	if (IS_ERR(xe))
>>>  		return xe;
>>>  
>>> +	err = xe_device_init_early(xe);
>>> +	if (err)
>>> +		return ERR_PTR(err);
>>> +
>>> +	return xe;
>>> +}
>>> +ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>>> +
>>> +/**
>>> + * xe_device_init_early() - Initialize a new &xe_device instance
>>> + * @xe: the &xe_device to initialize
>>> + *
>>> + * Return: 0 on success or a negative error code on failure.
>>> + */
>>> +int xe_device_init_early(struct xe_device *xe)
>>> +{
>>> +	int err;
>>> +
>>>  	err = ttm_device_init(&xe->ttm, &xe_ttm_funcs, xe->drm.dev,
>>>  			      xe->drm.anon_inode->i_mapping,
>>>  			      xe->drm.vma_offset_manager, 0);
>>> -	if (WARN_ON(err))
>>> -		return ERR_PTR(err);
>>> +	if (err)
>>> +		return err;
>>>  
>>>  	xe_bo_dev_init(&xe->bo_device);
>>>  	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
>> 
>> Curious: are the drmm_* calls going to work fine for the automated
>> teardown when they are called from a kunit context?
>
> that's correct, see:
>
> WARNING: drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:67 at my_drm_fini+0x72/0x80, CPU#0: kunit_try_catch/20
> drm-kunit-mock-device test_data.drm-kunit-mock-device: [drm] WARN_ON(true)
> CPU: 0 UID: 0 PID: 20 Comm: kunit_try_catch Tainted: G        W        N  7.1.0-rc5-g547691814d7b-dirty #1020 VOLUNTARY
> Tainted: [W]=WARN, [N]=TEST
> Stack:
>  607ffcd5 00000000 00000000 00000001
>  ffffff00 607ffcd5 00000009 60029a90
>  6086f348 60064b86 605cf832 a088bcb0
> Call Trace:
>  [<60029a90>] ? _printk+0x0/0x65
>  [<60064b86>] ? dump_stack_lvl+0x6f/0xb8
>  [<605cf832>] ? my_drm_fini+0x72/0x80
>  [<600231a3>] ? __warn.cold+0x82/0x1cf
>  [<601aacb0>] ? kfree_const+0x0/0x40
>  [<60023384>] ? warn_slowpath_fmt+0x94/0xa1
>  [<60409500>] ? __drm_dev_dbg+0x0/0xb0
>  [<605cf832>] ? my_drm_fini+0x72/0x80
>  [<603fb4a7>] ? drm_managed_release+0xa7/0x190
>  [<605ec9a0>] ? devres_log+0x0/0xc0
>  [<603e6590>] ? devm_drm_dev_init_release+0x60/0x90
>  [<605ecb75>] ? release_nodes+0x55/0x80
>  [<6069ae80>] ? mutex_lock_nested+0x0/0x20
>  [<605ee3f7>] ? devres_release_all+0x97/0xf0
>  [<605e68c0>] ? bus_notify+0x0/0x60
>  [<60695df0>] ? mutex_unlock+0x0/0x20
>  [<605e6f54>] ? device_unbind_cleanup+0x14/0xb0
>  [<605e88e6>] ? device_release_driver_internal+0x266/0x2c0
>  [<60669f50>] ? kobject_put+0x0/0x150
>  [<602ef010>] ? sysfs_remove_file_ns+0x0/0x20
>  [<605e64fd>] ? bus_remove_device+0x11d/0x1b0
>  [<6069ae80>] ? mutex_lock_nested+0x0/0x20
>  [<605dfc1f>] ? device_del+0x1bf/0x5f0
>  [<60075330>] ? um_set_signals+0x0/0x60
>  [<60075320>] ? um_get_signals+0x0/0x10
>  [<606a2160>] ? _raw_spin_lock_irqsave+0x0/0xa0
>  [<605e0064>] ? device_unregister+0x14/0x40
>  [<60375cde>] ? kunit_remove_resource+0x8e/0xd0
>  [<606a24d0>] ? _raw_spin_unlock_irqrestore+0x0/0xb0
>  [<60375323>] ? kunit_cleanup+0x63/0xb0
>  [<60377a70>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
>  [<60377a86>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
>
>
>
>> 
>> What about devm_* calls? From a quick look, I know that at least
>> xe_bo_pinned_init() will make one of those.
>
> kunit device follows device model, it is just created on a dummy bus,
> but everything else works fine, see:
>
> WARNING: drivers/gpu/drm/xe/tests/xe_kunit_helpers.c:60 at my_dev_fini+0x6f/0x80, CPU#0: kunit_try_catch/20
> drm-kunit-mock-device test_data.drm-kunit-mock-device: [drm] WARN_ON(true)
> CPU: 0 UID: 0 PID: 20 Comm: kunit_try_catch Tainted: G                 N  7.1.0-rc5-g547691814d7b-dirty #1020 VOLUNTARY
> Tainted: [N]=TEST
> Stack:
>  607ffcd5 00000000 00000000 00000001
>  ffffff00 607ffcd5 00000009 60029a90
>  6086f348 60064b86 605cf7af a088bd00
> Call Trace:
>  [<60029a90>] ? _printk+0x0/0x65
>  [<60064b86>] ? dump_stack_lvl+0x6f/0xb8
>  [<605cf7af>] ? my_dev_fini+0x6f/0x80
>  [<600231a3>] ? __warn.cold+0x82/0x1cf
>  [<605ee3b5>] ? devres_release_all+0x55/0xf0
>  [<60023384>] ? warn_slowpath_fmt+0x94/0xa1
>  [<605ec9a0>] ? devres_log+0x0/0xc0
>  [<605cf7af>] ? my_dev_fini+0x6f/0x80
>  [<605ecb75>] ? release_nodes+0x55/0x80
>  [<6069ae80>] ? mutex_lock_nested+0x0/0x20
>  [<605ee3f7>] ? devres_release_all+0x97/0xf0
>  [<605e68c0>] ? bus_notify+0x0/0x60
>  [<60695df0>] ? mutex_unlock+0x0/0x20
>  [<605e6f54>] ? device_unbind_cleanup+0x14/0xb0
>  [<605e88e6>] ? device_release_driver_internal+0x266/0x2c0
>  [<60669f50>] ? kobject_put+0x0/0x150
>  [<602ef010>] ? sysfs_remove_file_ns+0x0/0x20
>  [<605e64fd>] ? bus_remove_device+0x11d/0x1b0
>  [<6069ae80>] ? mutex_lock_nested+0x0/0x20
>  [<605dfc1f>] ? device_del+0x1bf/0x5f0
>  [<60075330>] ? um_set_signals+0x0/0x60
>  [<60075320>] ? um_get_signals+0x0/0x10
>  [<606a2160>] ? _raw_spin_lock_irqsave+0x0/0xa0
>  [<605e0064>] ? device_unregister+0x14/0x40
>  [<60375cde>] ? kunit_remove_resource+0x8e/0xd0
>  [<606a24d0>] ? _raw_spin_unlock_irqrestore+0x0/0xb0
>  [<60375323>] ? kunit_cleanup+0x63/0xb0
>  [<60377a70>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
>  [<60377a86>] ? kunit_generic_run_threadfn_adapter+0x16/0x30
>
>> 
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	err = xe_shrinker_create(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xe->atomic_svm_timeslice_ms = 5;
>>>  	xe->min_run_period_lr_ms = 5;
>>>  
>>>  	err = xe_irq_init(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xe_validation_device_init(&xe->val);
>>>  
>>> @@ -536,7 +554,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  
>>>  	err = xe_pagemap_shrinker_create(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>>>  
>>> @@ -555,7 +573,7 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  
>>>  	err = xe_bo_pinned_init(xe);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>>>  						       WQ_MEM_RECLAIM);
>>> @@ -569,16 +587,15 @@ struct xe_device *xe_device_create(struct pci_dev *pdev)
>>>  		 * drmm_add_action_or_reset register above
>>>  		 */
>>>  		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
>>> -		return ERR_PTR(-ENOMEM);
>>> +		return -ENOMEM;
>>>  	}
>>>  
>>>  	err = drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>>>  	if (err)
>>> -		return ERR_PTR(err);
>>> +		return err;
>>>  
>>> -	return xe;
>>> +	return 0;
>>>  }
>>> -ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
>> 
>> So, there are things allocated/initialized in xe_device_create() that
>> get deallocated/finalized in xe_device_destroy().  With this change, we
>> now have things extracted out of xe_device_create() into
>> xe_device_init_early(), and it appears that xe_device_destroy() is now
>> really the counterpart of the latter than the former.
>> 
>> I think we should just call the function xe_device_init() and then
>> rename xe_device_destroy() to xe_device_fini().
>
> there is yet another small pending series that introduces drmm_alloc_workqueue
> and after that converts all WQ initializations into self-contained statements
>
> didn't include here, as it touches include/drm so can be done in its own pace
>
> but with that xe_device_destroy (which should never be called that way)
> will be greatly reduced, and even possibly completely removed after moving
> registration of some cleanup steps to xe_bo_dev_init and/or ttm_init
>
>> 
>>>  
>>>  static bool xe_driver_flr_disabled(struct xe_device *xe)
>>>  {
>>> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
>>> index 27cd2329b99f..975768a6a9c8 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.h
>>> +++ b/drivers/gpu/drm/xe/xe_device.h
>>> @@ -44,6 +44,7 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>>>  }
>>>  
>>>  struct xe_device *xe_device_create(struct pci_dev *pdev);
>>> +int xe_device_init_early(struct xe_device *xe);
>> 
>> Right now we do not have any external users for this function.  We could
>> keep it static until we get to use them in kunit.
>
> my kunit series just got too big so I've started posting smaller chunks
> don't really want to go into static/public noise just for few days delay
> between series
>
>> 
>> That said, I think it would also make sense to separate it completely
>> from xe_device_create(), i.e., have xe_pci.c call the two functions
>> instead of xe_device_init_early() being implicitly called by
>> xe_device_create().  I think that would be more alligned with the
>> function names.
>
> hmm, maybe
>
> but that would likely require also extracting call to
>
> 	aperture_remove_conflicting_pci_devices
>
> and I'm not ready for that
>
> so IMO it's better to keep "xe_device_create()" as "Allocate and initialize"
> as we have now in the kernel-doc ;)

Fair.

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>
>> 
>> --
>> Gustavo Sousa
>> 
>>>  int xe_device_probe_early(struct xe_device *xe);
>>>  int xe_device_probe(struct xe_device *xe);
>>>  void xe_device_remove(struct xe_device *xe);
>>> -- 
>>> 2.47.1
