Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4EAEE57DF
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 14:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B1310E012;
	Mon, 11 Sep 2023 14:01:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B618610E012
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Sep 2023 14:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694440906; x=1725976906;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GQCVLcx0+NyDHsiI+rvsOyMBKV57KuFwWBy2My7XMik=;
 b=Qd0AuxIwELXsf5kqKv4BycbX83I1NYdO2Eh1Wv0Ia4O2c6WTatWBbmo7
 i4P8oFf8wt2F2gNQZjqTmZ/jFfWwm6nHFm3MERi7fHmlCv9qkvO3RgJlJ
 zsnCSJ5NThdF5pTQyYZlFW1VgH9pDIDs0plNIdJX7eQDwRQfJNbvQ3ph7
 GHMRNi5aMcnk9uMyrFHjOYCMXn9Mi1XCm0agz5kw+DBx6NHiJP6QMqNfV
 bcGDc3RlB8YDbSzWJWoxCncKlZV6Okfgy3gn9w+5/GgNorq4aOgDg83za
 lpMYDLsT/rNmxSBFwlJqpt7BmYcfsnFOWRP+UfpVskaDnctAjGHtl/y9j Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375439850"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="375439850"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 07:01:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="1074135813"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="1074135813"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 07:01:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 07:01:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 07:01:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 07:01:44 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 07:01:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ojpu/4fF2IF/IUigiYSbs3Ld4GfC/eiQpnbkmcGVuLvZOhsyYyiH676CJprt/idsA3tg2BN44luTStCpn6c8yHZOGFT4eA8p861pZYQpc+skW+Tq+1NsL6BUHwgKSTEopVYbl8y12KtYTUFwWwm0wPh536eLQDxFwAm7CnWCjaVehfdbXpG7PvDrpN4uH+xQZWiQ/2hbhKxVD5UVE4WkMn/m0Suc7X8Pi4HnrPBFjiY5giXvV5koL0StAdT6cDTMiHKAuon1MZUVwDh4mTWjFXNHF3C5Tdn8j9FGkIzNAr+1FNgCXhOcWt8HMPd9/5mXPuy4abgibCIk+52ux0/TJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0oCKBLDo+0k6DYuLOKbdUxf+jhEXxi/UxmCKF+g6iT0=;
 b=RCI5fWW+QNjY0AlO0DCky2GqtTxyWrKUFw2eAZd+szWSWmNZ0SRFziYPMnPZ4bANIz+UXK94rIn2JvrRxogZuUI0k6XzLSaA7g1Li9FGd8nefhmzbLrHOrHbN0CCf6o2PMqgL4SjzuNfeEd68A6S7EDZBUVmT5OvHcYnbC3WfnG3X/vB8nU4WwLdyTJFbZsQssuyUvTWhba+EKNxGT9XcAELSrXnB0d7H65W3+sFS28q4vukZZH/0zLkJMns3/6YJygdl7ry9KFfmlkoQ6u1vm+K/YVM04F51byDnaBPtohrk89UHeuRMCRSJVtnLEq4Ot/91tUzNqb7q371yNwzTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7845.namprd11.prod.outlook.com (2603:10b6:930:72::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 14:01:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 14:01:42 +0000
Date: Mon, 11 Sep 2023 09:01:39 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Message-ID: <eb6q46xjir2vo745evqhy4jzj2jxpkvyipqetrygurhmg3zqcz@k7yott3gcmlj>
References: <20230911104134.431670-1-balasubramani.vivekanandan@intel.com>
 <87cyypezsx.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cyypezsx.fsf@intel.com>
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7845:EE_
X-MS-Office365-Filtering-Correlation-Id: 438adb61-49f9-4c92-0600-08dbb2cfa023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VQyzQAPfYbWTas3mJ3EEiuC6TZRGDXz7SHVgOsLdzt2fi7QJZ6oVEZvIeKLGmRIpN0Hz78AT0r5eN6CaE+sECzWMgOb/q4nR8XUInTixKkg0/ULH7RL0UEnDYkcAp87vL9sujR59DKtcP6JqSxcx2eg36LQw19d3XKFz2B4GEpUE9iqu6UPHXv6dhN23I+26eT7UHCtKC19jduB9uk1wM0Im0CyCoDPbe/YzLhfi7fDIsS8pwYLinMv/ATI2/E+iOvZOq2OM0lrBi14NIYINQhBwEybnlLck3DGj1eKE/n2Dr1avS1/FKecREvobw2oVODEwEkRrxpQSfHn/bzP8a8H4rr7WXf2/X1bajauhj4PX8gNgZSAhrFM8W1BEI4Y1d0PVGxk7UqAmWqgyzzScfzOKNUM1q729J8UbQipCOHNAS1ovzzihrM+EEQolRZX8zl8SqF1Zk0HVDzGw2ATEmdCkyO3QdRAzX7kp7E4YpzYtPmjFfPbdfFiG9YqwipI7Sh6gfpLxTbNDZlmIuZeFcbKx9Xirn+iHjSHIaJcAdULUctyIk2fKROMfIR+RppOk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(39860400002)(136003)(366004)(396003)(451199024)(186009)(1800799009)(66899024)(6666004)(6506007)(6486002)(41300700001)(86362001)(82960400001)(38100700002)(2906002)(6512007)(9686003)(83380400001)(478600001)(5660300002)(316002)(4326008)(8676002)(8936002)(33716001)(26005)(54906003)(66476007)(66556008)(6916009)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JqEqJJFzWQeToUs16NOiZI0JzQTP36Km9neV5XSkWybo3Pw+nHLDZE2wVD8l?=
 =?us-ascii?Q?WN+dl7bDZ0UbwQsmW+APWjiZJAzwQ5wf/D9tSAGZI0wjofKLNSzWgCjnsj6r?=
 =?us-ascii?Q?mGDs5elYoeypr+F14kcKkoEFfsiiRpkc9ckGbnsxjwENYr/4KmBLVeCvC987?=
 =?us-ascii?Q?JsI7VZaOlQhAd0KRzo9di30E8E0YpAHXyFAg7jDI4KpB6cB/n++yB9tYmZcf?=
 =?us-ascii?Q?/RE9nz0fu+rl/T20PCYo4Hh9t4LyVgUx4Ha7edQZfr9SOHkxnsbSwXa8GKjU?=
 =?us-ascii?Q?VrS9IFaPm2KV5TwyIsJiLgqHSRSpbI5LDePVucN76AeeKoqc01IeGN83ei1/?=
 =?us-ascii?Q?rELVy85/iqY84cYhlDNgMfoi+eeKwBdOBgzCvVGKd0n+nf7utX6fXCjRwxRI?=
 =?us-ascii?Q?8nPNX0iU5Hf/AXG/71LiUscT5NaYYhhnmtmneZrJ0txv6prmcP0bUwzjzwPX?=
 =?us-ascii?Q?fg7DkcMRiNwPU/UJJA69+AD6V27hZH2absWJJ1WMFv8g4DNXPTStWUcMo+f7?=
 =?us-ascii?Q?W3WyxzZEDsYu7LU2RFcQGXx9Fp0oW4EWjHK9fJEr3TB6iuljiUlHAWqVswb+?=
 =?us-ascii?Q?z2h4L9edPpUtJtJy+72rcG5/hu8SuDDQ61k1zOYWXR4K2J3bd5reMFII96hQ?=
 =?us-ascii?Q?I/tiHNBS7KUvtQVpK0jxDQqk4hLxAkTclffTw9u7o9CyvvwUq6SElS9q9+2c?=
 =?us-ascii?Q?RGMuurEhAWoIPD1CM9lu8Q84I3H7RI857Ev5JAhBefYABA89ZVGHowaJ7JXl?=
 =?us-ascii?Q?FXh6bDabzqEMfqCrjA0it243oP3WpKzhqjUKraYF314Kk+1xKrCWBi0gLYFj?=
 =?us-ascii?Q?XQlyGpjnBaO+wBEpRIAJMYOup5J3rIwc/Pn6DRw5AEOyCro3EbqJD+DNfRD9?=
 =?us-ascii?Q?3KDcS4jmnAzbs6sXFACxezkbb6d8kBtffhd3A3XkLpFUIeJb/TAPHJk4LZGB?=
 =?us-ascii?Q?xzhhaLwjBdNyEOCZstPBlzryVQ/m7EOX6ET58Jy8pvBSXgMi77lmQH9m7q3W?=
 =?us-ascii?Q?8mNkYMnVmH3sLR61akfaH2vSdyN78s+W4W/LA3S7K5uEf1bxdpHpcvqL1xvs?=
 =?us-ascii?Q?biZt6WTaJHt3zsGmgsgVQZCId+ZOUDVDbV7/XUGwPN+7LPdcUjAkj3ObZ2OG?=
 =?us-ascii?Q?8HyBg4sBAKqUGJ8azVu3w1vTHH0N+xPvxXpcpAznBSSIHELIhThr+LcwU3Rt?=
 =?us-ascii?Q?eaNX91SXf9823WizD6apE4s97D2qaJjDHjhJ7iCNgMHYGicl7sTVe2iGgbBe?=
 =?us-ascii?Q?x9uYP/DKExbcYgWxloYMyv4SoW8e/IvXTV1Z7wd/4eLQczD0vbAcCwgZhlLc?=
 =?us-ascii?Q?VYrKx+kC8FGyjJix2qBvcCR9mwlbq9mYoh+VWzOmhI4Cl5n2t69sghyICDhU?=
 =?us-ascii?Q?hzo3FPynIEueTZVNlL3XDSsn5KscGG/Cm2+mJhA4c2RN8qLPb3oxBGrKz8vx?=
 =?us-ascii?Q?77vdWHKMa/Rj12KKImwKOoNQvpGgKdGq47jWPzDTqhidM9ZJ4vscP0V5DMNr?=
 =?us-ascii?Q?ERSix2CNxMygWAdP8HQk9fUBTF0CkYwjoj+QWWEUZ0+bxVwHh505CMoDGoiC?=
 =?us-ascii?Q?WTIv8AyVdTKaXDXGnQzXYH4Dg9s2eK/uBmRNzB4LW/Jba7R1018K4KjpStgU?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 438adb61-49f9-4c92-0600-08dbb2cfa023
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 14:01:41.9693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +K/IIpOTaDiFE1V44/JpX8P0/7V22XEiSWRVMehZLDZFvUfAgGj7K818P9an5WdCOGx1/2B65tfBh+MI/02BdkTB59loQlcWjEDCGmn0Pl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7845
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3] drm/xe/display: Print display ip version
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 02:04:30PM +0300, Jani Nikula wrote:
>On Mon, 11 Sep 2023, Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> wrote:
>> Print display ip version and flags during module load
>>
>> v3:
>> Use the existing intel_display_device_info_print() function to print the
>> display information. (Jani)
>
>So this is an improvement in the sense that xe core doesn't poke at
>display data directly to print the info.
>
>However, I still think the interface between xe (or i915) core and
>display should be minimal. I don't see why we'd need to add a function
>at the top level probe to print display stuff... the display code should
>do it internally, in some other high level probe call, when it's done.
>
>Even having the function adds complexity, because the call site now
>needs to be aware about display probe order, and ensure it's all done
>before you can safely and accurately print display info. And that's
>display code implementation details.
>
>Superficially this is all benign, but this stuff adds up. We've been
>trying to untangle i915 core and display for a long time, and the i915
>probe is still a huge mess, with a bunch of random calls to display at
>random times, and there seems to be no end to this. It's all so
>intertwined.
>
>Perhaps in the future all of the calls need to go through a framework,
>maybe aux bus. Do we really want to put all of this to that interface?
>
>So the direction should be to reduce and minimize the interfaces between
>the high level components, not add more.

Agreed. I think what is missing here is: what would be a good point
inside display to call this on. Is it ok in the end of
intel_display_driver_probe()? Are we ok with display info now showing
up before than the rest for i915 or should we also move
i915_welcome_messages() to be before intel_display_driver_probe()?

Lucas De Marchi

>
>
>BR,
>Jani.
>
>
>>
>> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_display.c | 9 +++++++++
>>  drivers/gpu/drm/xe/xe_display.h | 4 ++++
>>  drivers/gpu/drm/xe/xe_pci.c     | 2 ++
>>  3 files changed, 15 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>> index a453946ad108..45ffc418e636 100644
>> --- a/drivers/gpu/drm/xe/xe_display.c
>> +++ b/drivers/gpu/drm/xe/xe_display.c
>> @@ -417,6 +417,15 @@ void xe_display_pm_resume(struct xe_device *xe)
>>  	intel_power_domains_enable(xe);
>>  }
>>
>> +void xe_display_info_print(struct xe_device *xe)
>> +{
>> +	struct drm_printer p = drm_info_printer(xe->drm.dev);
>> +
>> +	if (xe->info.enable_display)
>> +		intel_display_device_info_print(xe->info.display,
>> +						&xe->info.display_runtime, &p);
>> +}
>> +
>>  /* Display info initialization */
>>  __diag_push();
>>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
>> diff --git a/drivers/gpu/drm/xe/xe_display.h b/drivers/gpu/drm/xe/xe_display.h
>> index 9e29de012df7..b18bf5583229 100644
>> --- a/drivers/gpu/drm/xe/xe_display.h
>> +++ b/drivers/gpu/drm/xe/xe_display.h
>> @@ -19,6 +19,8 @@ int xe_display_create(struct xe_device *xe);
>>
>>  void xe_display_info_init(struct xe_device *xe);
>>
>> +void xe_display_info_print(struct xe_device *xe);
>> +
>>  int xe_display_init_nommio(struct xe_device *xe);
>>  void xe_display_fini_nommio(struct drm_device *dev, void *dummy);
>>
>> @@ -57,6 +59,8 @@ xe_display_create(struct xe_device *xe) { return 0; }
>>
>>  static inline void xe_display_info_init(struct xe_device *xe) { }
>>
>> +static inline void xe_display_info_print(struct xe_device *xe) { }
>> +
>>  static inline int
>>  xe_display_enable(struct pci_dev *pdev, struct drm_driver *driver) { return 0; }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 24b16863bf3d..a4886ea8794f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -724,6 +724,8 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  		xe_step_name(xe->info.step.display),
>>  		xe_step_name(xe->info.step.basedie));
>>
>> +	xe_display_info_print(xe);
>> +
>>  	err = xe_device_probe(xe);
>>  	if (err)
>>  		goto err_pci_disable;
>
>-- 
>Jani Nikula, Intel Open Source Graphics Center
