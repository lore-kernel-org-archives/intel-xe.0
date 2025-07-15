Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E007CC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:46:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513110E159;
	Tue, 15 Jul 2025 21:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbDhaMhf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590C10E159
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752616001; x=1784152001;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=rDEUGqeimeKPw22x2iqQsMoV67YVHuZ58K2gIfUORsg=;
 b=bbDhaMhfB07QFpMbAEATpoGdn41BULWjA8emsN1y83yLNNxwW+g7miMh
 TfWuoFCJ6RyjqSxAENb/ya87E6tKhDG984m920Ykwuxafjb525qFnKUMF
 uU7F3mbY2mCCWdvaXKFOGhhpTehnaZHsVCS7cbJzFhyNS9NBQFY32IRVD
 +emI3UTTckbOe0fgO4NMf7o8qCePr4yqXSMS2L7A1OeZW0LAYpMrxuE/v
 T213sDjoCfRb6UfFk6aNdTXcikXOLDYK1GUpnY9bpZLC2QPG7seCX2QBC
 dMDSPws6S3E4es4392VYiLnwX92+gqftO70IPDCWxELxfHZLQSJ10oEl4 A==;
X-CSE-ConnectionGUID: uoEHSJysQFaqcd9NfnUcsw==
X-CSE-MsgGUID: qMhj9nKCTTOgZH9dhqNzvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54788057"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54788057"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:46:40 -0700
X-CSE-ConnectionGUID: wl0VCGHyQ9S0kVJHUIQB1Q==
X-CSE-MsgGUID: Mrs7WYQ8Ro218P7RiHBpWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157424448"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:46:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:46:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:46:39 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.67)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SA7DJk14w19apL/ZuaURugaf2R34auiuVviIq2aYBYaPo2GysoWVfC4CS+Uc2mCmn3uFNbTxNAdJ6HjM+7coEY5j5MPgjKc5YYfgEcX+D1A1WyZmyIy9E2eBmclXsPVWaT+auhS0+ivLmtpRngxozgd/9r9yicunJ7S21mRWN1aj/hmkCuwelQN2m6Csu9+F370U5mvmA9Xb33meMiO5iLKtDFGpzD7kPK6qt0D7hIsM2dVHSJqxUVyaqGPab1tSMks51sXXVZSOKR/FZPpyjBXGKmy51mhh4iNAk6CdmKAuxP8cw2I1XFADyrOYMCiUsIvTA27Ly4Bq18SqIB3hBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDEUGqeimeKPw22x2iqQsMoV67YVHuZ58K2gIfUORsg=;
 b=fEW2HUv8JtRE7XzdcS32JD8MvT1P8Nzi5yiKTvFtppV/pikpg8pt5T/vQVA1wxW8EGDUMD9ZU37s2Cj6Ktx52ZH5LnVwHBvKRK9+A2m8MFhN/Ux3xR3NzusFRbvLKWRtZN6FICOLXjzXOZ8OmQikrQeeLl43dYWVmgxuO/QLVFxqqDk93AozdBA3TQSxrLiiMpyL09hSW5lLYZQ83pPL07QgW1x5aGKQ/g326XXcXuy4Uz5WDgj29e3prOfqmdYmsi7EldJeC8+3D2RlmpaJZRZvhsldcp+H7OeRgvZ4dJfeEvih6Kz3GdGT92ZbUA9iJuOPzStcVNm5MivvTYXUTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 15 Jul
 2025 21:45:55 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 21:45:55 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Thread-Topic: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Thread-Index: AQHb66rFqWVNaJhCZUCtVTNEzEJrsbQzySWAgAACsYCAAACBgA==
Date: Tue, 15 Jul 2025 21:45:55 +0000
Message-ID: <a5faff54361576d0ba2eb30001122479f91a5756.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-6-matthew.brost@intel.com>
 <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
 <aHbLpWs+xQT68C43@lstrano-desk.jf.intel.com>
In-Reply-To: <aHbLpWs+xQT68C43@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MW4PR11MB6887:EE_
x-ms-office365-filtering-correlation-id: 2753da32-dda8-4985-0e18-08ddc3e8fa3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UHVIam5jazYvZ1FwaDBZbytWeFJXUjJKZHYvRUpvMTFNTXg3Wi9DeTRaN3Bw?=
 =?utf-8?B?cVB3Rk40Q1BLcXFHVmlWS3JYQmlYeThMZy83TEdlMHJLSDF4aEluTVN0Vm1O?=
 =?utf-8?B?UDJMZXc1dXFkdFh0Q2oyOGFXTE5tVkRPUVVDMklZajJQOTZoZDlFYll1TnRz?=
 =?utf-8?B?aGRSK20wMHBGOTl1c0p6TkYzeWYzL1F3SndNY0paRTd5MWlaeTlMTlhHUG1N?=
 =?utf-8?B?Vlp5UzNJN0dEUG5WY041VUJpUTRWdmxmc29xM3lOeVdwbEY4YXo3NU52Z2oz?=
 =?utf-8?B?V2ZwYyt6bFFEOExJeFJMVm5VREpGUmxyb2pwaEJvQUVDaUF0dTErT0lLVytt?=
 =?utf-8?B?RFYyZTFXdVltL1E0NEtGU2M0RUJNTnlSUVlPREgvT0haQUtCeWZsbTA1eWND?=
 =?utf-8?B?czVWeXVZQ1Q1SFRFb0lYaWlnbVJRMUU4NTNROU1MVVpiYmk0V0IwTWNYSkpx?=
 =?utf-8?B?K1RhbXY4QnBsRXVTWFFSR1IvRW1kQ0VZSmcrSDhRNlE4eWVZOVcxM2hRa2Ra?=
 =?utf-8?B?dEVBSm5uZXNDMkxTWEdsbDNja3Jna1ZGd05vNThabjNtQzhUdW1vaTFhdUpI?=
 =?utf-8?B?QVkyQ3VxUXQvTEdPKzZrMDdDeWFzWlltZjJmc2VIa1BjZ1QrOFA4bXNYYlZQ?=
 =?utf-8?B?c0kzcVpISTNvMEtCdDdaOEFadG9IMjBuWjMzZ1VRVkdEZmpaOE95Wk1NOVhJ?=
 =?utf-8?B?NXpWSmZ3YW9OUGJmTHp6aURLZ3M4YWFKOENITEczbFJ0WGZQR0U3eWZnejFz?=
 =?utf-8?B?RUNuejRNK2ExU1FuM1huNkl6RUI1M2lZTUxRKzQ1SldLR2NZQVJJMUt0b2Fl?=
 =?utf-8?B?N1FOLzZsRnhrWmtkQTEvN0YyUWJDOUtHWTRRNEtreFhibjlSVzJ1N2ErYWRH?=
 =?utf-8?B?SDRzQ09RM0M3SkFGZExnZ3lFaFdrejBNS1Arb0JucnltUXArbVRrR0JWdTdQ?=
 =?utf-8?B?a0NQM1JXZVNhMFFQdWcwODlzTWNkQ0ttejlpdm5VeHc1c1U4NU1ib21CWWJK?=
 =?utf-8?B?WHU3TUpHVFI0ZWszbGJ3eU1uUSs5cWpUWkJ4ZWc1Vy8wQ3N1bVMrY3NPenBB?=
 =?utf-8?B?aTRReTh4V3BsUFFQV3h5OXBzMUNHNlBuN3BGQTlGZDhDQjAxeXFsWkMrZXJP?=
 =?utf-8?B?U3RXUHNndXoxYWV0eE1lemwxMXQzTm9hMWhDeTNoODFpTXh0c3pMUXEyVThS?=
 =?utf-8?B?TlNsY0ljeUN2SnduOHlnV2lzVUlGb0FvWC9pcjdvb01JN0pQam1WMCsvVWhJ?=
 =?utf-8?B?U1dpOFcwa0hDMktjVk92dzd2Zi9Id0cvWVpzQmFnWmhhYlNGbStVbnYyYU1E?=
 =?utf-8?B?WlNOT1ZVTmJRak5VbWQwcFZRK09KY2dZZjdsbmJXcXJqNlMvZEMrTVJ4anF0?=
 =?utf-8?B?YUg1Tm9PSUVGRzEyUzEwMHZjVVFOZGQ2ZUkvb1ZWejMyMmZaanFUYU41VlFR?=
 =?utf-8?B?UEIyM3BSSGRQQTE0a1pRclp5T2ZFRzV5OE5ibjE2VFVYN25Wc0tqL2hya3lh?=
 =?utf-8?B?RFVnWURRaS9DeDlJQ0V1a1A1Q0o3VjJpTDk1RllVY3VGYTlEWHhSMVlqTExB?=
 =?utf-8?B?a3dYVGN4OWYyRHUxNlVBdFczSGNCL2ZSdkVOaXNQNzhDbWRjTERHQWpTQ3g5?=
 =?utf-8?B?WkxJdkN1bUpZUC9oY0R1YzBsaUhtMyt4c3pkTE00UlFjQUVoOHlFNWZUNnQw?=
 =?utf-8?B?SkdtUkxEbU04ajhuNlMwK25mL0krOCs0dWNjMVMzS3owWStlVWgwY3VXb1VM?=
 =?utf-8?B?ZjB3aVkwMmMzTVRMOFlJdHhxSE9aNEJKWVFBUXl6RTRKOHNUTjNTdU5mZWNM?=
 =?utf-8?B?WkJsNzZNMWJucGNDREsya1Blbzk2R0hzVExTQkNuUEJFZlBBV1VTVkZLZnVv?=
 =?utf-8?B?NEYxU1VOQnYvNjVjNklNMmRrclJPQ09WYWhuK1lveEc0RFAxMkx2ZThFb1di?=
 =?utf-8?B?Y28yOVNIYUFvUENwVGNmUTdMcGZhKzBwUG0rOTdubVVzZWJteTNWQkFlVzB4?=
 =?utf-8?B?dGN0cjEySU1nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V21zWDRTZVFNbnFhdVQ4bGo4SnVUcGlRY1p0VlphQ3RTQmlCaUVEbFMwN0xz?=
 =?utf-8?B?eWhPc1UrdzFaSjF3b3M4ZGN6NUt4ZVBqMnU4Mnpud0JDc05qdVFKRWFEK2Ji?=
 =?utf-8?B?ajBrcFduMVNvc0lvZjBlTFFHcHUrcWx2WW1YMllJZzBBTklIM1lNdDd6SkNC?=
 =?utf-8?B?Z0lqNGdmUmcxeUlkbVJXUW1JY0NHYTd4eitvd2JJOXJrSzVLdndYTzZ1RndK?=
 =?utf-8?B?VlhBWVZlMGhPTjhXbnFnMHc3Qy9zTkp2NGI0SkREcUExSDNKdUtyLzBlS0xT?=
 =?utf-8?B?NmR0bkNtK3pPcWI1SnVBOXNlV3dubHFFNmZITUlPQTJHSjBNUnppODhHYXZJ?=
 =?utf-8?B?SUovOEEzM0Z5NEFPZldwemhwL0twdVk5SFdwR3gxV1l6OHZ4WDRKMzl6aFRY?=
 =?utf-8?B?RW01T29NcnZESVYwWk84cWhNaXk4dnhOTmdKelRmclFPVzFTMVk4LzRPeDRm?=
 =?utf-8?B?K0JaY01kMkZidjAzUFhvQkZVRjNNNVA5U0FkdUIvbzZxc2JXdXpiQ0R0cWps?=
 =?utf-8?B?d2ltQ0YxemNqSTRrNlR3anlFQ1k5T0JWS1V0Mlg1Mjl3T1J1NlJhSC91ZTFu?=
 =?utf-8?B?eVczcmdYcVBzT09rT3NWY090c2lwT01RMHZNRjY0MG9mUHUzdmJEaEZ2ZW9w?=
 =?utf-8?B?VWYySlVMeHR1WmNqeFgzUDB5bEROMHJBQ0MwRFJmNitHc2ViaXNoYUQ0NXA3?=
 =?utf-8?B?Ni9aeENoRVlIV0FYYTVqUUVJQkFyTndmeE0xQmZzblBiUW1aN3V4dm9UWlYw?=
 =?utf-8?B?cXZoVndtR3JGNUFpQkpRbzE4cUNkNjd5dHZJZjJvTmErWVNDRlhpczY4Nk5P?=
 =?utf-8?B?NWFmNVBDdjFXYldUZFU2aGppVG9ON1hYQnR1TTdSS1cyMVkwYnI0SFRDSll6?=
 =?utf-8?B?U2g4aE9WRXVycThTVWpRZ3lnYnBHNHB3K2h5RkRVL1RVYTZta3laNVhkd3du?=
 =?utf-8?B?eEZkLzlRNnZ4emZnQlJ5MWhNbDJkelpIRFdiU1EwSjVtWHJqVmNFT2laaEUz?=
 =?utf-8?B?ZmpzTzZ5MlRkclBxMVNYN1NJNmt3ZGtXMnhOendrZytpWFRJc2djalNFd3NV?=
 =?utf-8?B?Mk1DbHR6VktZMTAxKzc2UnJlR3phUkhVa0ZIalhEZXVGRTNoZld1b2Y3UDlq?=
 =?utf-8?B?RVBRSXN3RGJMOTFLTTJQQXVyNDNxbUZqNzd6Qml3eGR3cWd4R2dNenlZemZE?=
 =?utf-8?B?SzExRjVvaHJkQkVQRXR3NHJZUXdtY2pqaFhkV29CUzBBYlBBMTJ3YlBLcUxZ?=
 =?utf-8?B?Q3JoOGpOQUZvRXoyazFqSUN4UUFmeFhTY0hqdkJ5VHpyd3BIdXNVWmF3d050?=
 =?utf-8?B?N1o0bXdhSHNMVFpnUFJubjVYUGxRd2VWS0ZWMVU0QVdabERvOVFSY2E2VXNJ?=
 =?utf-8?B?VjJNZVJrYXFUYXZLemV2MjRUUnNsUng2b1p5UGZjRkxINFI3OC85S3QvSUdX?=
 =?utf-8?B?Sk5zMlh0c2R2VXQxRXF2TVhrTGVOZUpTMGJJcjZ1SW9KbE41WHBEenM4dEw3?=
 =?utf-8?B?ZWtWZVVoQXdVT3ZoeU1POFR3a3YwV1dzMGw4a0VKdDNJa1VqREJKWFZaQ0hO?=
 =?utf-8?B?cnFOdTJxTHBsZDk5Vm0zSUwwTEJnRzNsbnZXMllkeDkvdDAxK2xFWTZVNTdn?=
 =?utf-8?B?NGpxNERodEpraSt6aEx2S1I1MU5hN2lVUUJGL284dlNqTVYxUnZHUmxvU2sw?=
 =?utf-8?B?NWNKRGNETkQwT3o1QXpqWitkVmhPbGViSytwMndsU3hsZUtWcy9DRWlicWZk?=
 =?utf-8?B?bGZJY1g3OG0zdEMwVmlFeis5UWZlQWRCOFJCQno5Wnh3ZS9GcDRSZkJwK2ha?=
 =?utf-8?B?QXZuOEY3OHQxdEdESWl6TTE0RDE4UXUrbEVWdGVJNEVvY1JNN051T08zQmhI?=
 =?utf-8?B?U2txbUgrMGg4Uk1yN29jQUVpWWFiTWZROE4rWEo5SnVFWWhYSFhJRHlydzFh?=
 =?utf-8?B?S2g2VlAyeVNLRnM2QmdXNzAwSWZxNFd0T08wZ0YvbFVXZ3ZvZzVyaVhWVFlH?=
 =?utf-8?B?VXVUa0phaE93NmZ4aU1hUU12T1p4QjZRK083ZnY3bW0vYktWM0k5N2s0VUxX?=
 =?utf-8?B?V0dKU0g4NXJFSEppN3BtcXVEYmVvdzZLQndycElZSXA1clh2RHRoYUxSaXFt?=
 =?utf-8?B?bmVSbFVGQVJyQ1BaSHJTdDZUOFhEckhib1dZcUpXSFBaVk9BdGJCalFWVUN5?=
 =?utf-8?B?MVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <954B2C6AF45B174FA82DCCD5B9334FCC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2753da32-dda8-4985-0e18-08ddc3e8fa3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 21:45:55.4222 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u7lmiaEPmoYA5R6QqTsYLeuws5K9yjQifFze5kM6nowNV5d/MftV/kCBxPq4UELVdD5NOJYuj+v48buQxYu3ucbC+GVBvE+xg3wSfwlSpcE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
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

T24gVHVlLCAyMDI1LTA3LTE1IGF0IDE0OjQ0IC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIFR1ZSwgSnVsIDE1LCAyMDI1IGF0IDAzOjM0OjI5UE0gLTA2MDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFdlZCwgMjAyNS0wNy0wMiBhdCAxNjo0MiAtMDcwMCwgTWF0dGhldyBC
cm9zdCB3cm90ZToKPiA+ID4gQWRkIGEgZ2VuZXJpYyBkZXBlbmRlbmN5IHNjaGVkdWxlciBmb3Ig
R1QgVExCIGludmFsaWRhdGlvbnMsIHVzZWQKPiA+ID4gdG8KPiA+ID4gc2NoZWR1bGUgam9icyB0
aGF0IGlzc3VlIEdUIFRMQiBpbnZhbGlkYXRpb25zIHRvIGJpbmQgcXVldWVzLgo+ID4gPiAKPiA+
ID4gdjI6Cj4gPiA+IMKgLSBVc2Ugc2hhcmVkIEdUIFRMQiBpbnZhbGlkYXRpb24gcXVldWUgZm9y
IGRlcCBzY2hlZHVsZXIKPiA+ID4gwqAtIEJyZWFrIGFsbG9jYXRpb24gb2YgZGVwIHNjaGVkdWxl
ciBpbnRvIGl0cyBvd24gZnVuY3Rpb24KPiA+ID4gwqAtIEFkZCBkZWZpbmUgZm9yIG1heCBudW1i
ZXIgdGxiIGludmFsaWRhdGlvbnMKPiA+ID4gwqAtIFNraXAgbWVkaWEgaWYgbm90IHByZXNlbnQK
PiA+ID4gCj4gPiA+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxs
c3Ryb21AbGludXguaW50ZWwuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4KPiA+ID4gLS0tCj4gPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2V4ZWNfcXVldWUuY8KgwqDCoMKgwqDCoCB8IDQ4Cj4gPiA+ICsrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5
cGVzLmggfCAxMyArKysrKysrCj4gPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25z
KCspCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWUuYwo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMKPiA+ID4g
aW5kZXggZmVlMjIzNThjYzA5Li43YWFmNjY5Y2Y1ZmMgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2V4ZWNfcXVldWUuYwo+ID4gPiBAQCAtMTIsNiArMTIsNyBAQAo+ID4gPiDCoCNpbmNs
dWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiA+ID4gwqAjaW5jbHVkZSA8dWFwaS9kcm0veGVfZHJtLmg+
Cj4gPiA+IMKgCj4gPiA+ICsjaW5jbHVkZSAieGVfZGVwX3NjaGVkdWxlci5oIgo+ID4gPiDCoCNp
bmNsdWRlICJ4ZV9kZXZpY2UuaCIKPiA+ID4gwqAjaW5jbHVkZSAieGVfZ3QuaCIKPiA+ID4gwqAj
aW5jbHVkZSAieGVfaHdfZW5naW5lX2NsYXNzX3N5c2ZzLmgiCj4gPiA+IEBAIC0zOSw2ICs0MCwx
MiBAQCBzdGF0aWMgaW50IGV4ZWNfcXVldWVfdXNlcl9leHRlbnNpb25zKHN0cnVjdAo+ID4gPiB4
ZV9kZXZpY2UgKnhlLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQo+ID4gPiDCoAo+ID4gPiDCoHN0YXRp
YyB2b2lkIF9feGVfZXhlY19xdWV1ZV9mcmVlKHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxKQo+ID4g
PiDCoHsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgaW50IGk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgZm9yIChpID0gMDsgaSA8IFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX0NPVU5UOyArK2kp
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAocS0+dGxiX2ludmFsW2ld
LmRlcF9zY2hlZHVsZXIpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgeGVfZGVwX3NjaGVkdWxlcl9maW5pKHEtCj4gPiA+ID4gdGxiX2ludmFsW2ld
LmRlcF9zY2hlZHVsZXIpOwo+ID4gPiArCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBpZiAoeGVfZXhl
Y19xdWV1ZV91c2VzX3B4cChxKSkKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqB4ZV9weHBfZXhlY19xdWV1ZV9yZW1vdmUoZ3RfdG9feGUocS0+Z3QpLT5weHAsCj4gPiA+IHEp
Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHEtPnZtKQo+ID4gPiBAQCAtNTAsNiArNTcsMzkg
QEAgc3RhdGljIHZvaWQgX194ZV9leGVjX3F1ZXVlX2ZyZWUoc3RydWN0Cj4gPiA+IHhlX2V4ZWNf
cXVldWUgKnEpCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqBrZnJlZShxKTsKPiA+ID4gwqB9Cj4gPiA+
IMKgCj4gPiA+ICtzdGF0aWMgaW50IGFsbG9jX2RlcF9zY2hlZHVsZXJzKHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLCBzdHJ1Y3QKPiA+ID4geGVfZXhlY19xdWV1ZSAqcSkKPiA+ID4gK3sKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgc3RydWN0IHhlX3RpbGUgKnRpbGUgPSBndF90b190aWxlKHEtPmd0KTsKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgaW50IGk7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgZm9y
IChpID0gMDsgaSA8IFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX0NPVU5UOyArK2kpIHsKPiA+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9kZXBfc2NoZWR1bGVyICpk
ZXBfc2NoZWR1bGVyOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IHhlX2d0ICpndDsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB3
b3JrcXVldWVfc3RydWN0ICp3cTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgaWYgKGkgPT0gWEVfRVhFQ19RVUVVRV9UTEJfSU5WQUxfUFJJTUFSWV9HVCkKPiA+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBndCA9IHRp
bGUtPnByaW1hcnlfZ3Q7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlbHNl
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3Qg
PSB0aWxlLT5tZWRpYV9ndDsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaWYgKCFndCkKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjb250aW51ZTsKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgd3EgPSBndC0+dGxiX2ludmFsaWRhdGlvbi5qb2Jfd3E7Cj4gPiA+ICsKPiA+ID4g
KyNkZWZpbmUgTUFYX1RMQl9JTlZBTF9KT0JTwqDCoMKgwqDCoDE2wqDCoMKgwqDCoMKgLyogUGlj
a2luZyBhIHJlYXNvbmFibGUKPiA+ID4gdmFsdWUKPiA+ID4gKi8KPiA+IAo+ID4gU28gaWYgd2Ug
ZXhjZWVkIHRpaHMgbnVtYmVyLCB0aGF0IG1lYW5zIHdlIHdvbid0IGdldCBhbgo+ID4gaW52YWxp
ZGF0aW9uIG9mCj4gPiB0aGF0IHJhbmdlIGJlZm9yZSBhIGNvbnRleHQgc3dpdGNoIHRvIGEgbmV3
IHF1ZXVlPwo+ID4gCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBkZXBfc2No
ZWR1bGVyID0geGVfZGVwX3NjaGVkdWxlcl9jcmVhdGUoeGUsIHdxLAo+ID4gPiBxLQo+ID4gPiA+
IG5hbWUsCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoE1BWF9UTEJfSQo+ID4gPiBOVkFMCj4gPiA+IF9KT0JTKTsKPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChJU19FUlIoZGVwX3NjaGVkdWxlcikpCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIFBU
Ul9FUlIoZGVwX3NjaGVkdWxlcik7Cj4gPiA+ICsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHEtPnRsYl9pbnZhbFtpXS5kZXBfc2NoZWR1bGVyID0gZGVwX3NjaGVkdWxlcjsK
PiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiArI3VuZGVmIE1BWF9UTEJfSU5WQUxfSk9CUwo+
ID4gPiArCj4gPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiAwOwo+ID4gPiArfQo+ID4gPiArCj4g
PiA+IMKgc3RhdGljIHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpfX3hlX2V4ZWNfcXVldWVfYWxsb2Mo
c3RydWN0Cj4gPiA+IHhlX2RldmljZQo+ID4gPiAqeGUsCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3ZtCj4gPiA+ICp2bSwKPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1MzIKPiA+ID4gbG9n
aWNhbF9tYXNrLAo+ID4gPiBAQCAtOTQsNiArMTM0LDE0IEBAIHN0YXRpYyBzdHJ1Y3QgeGVfZXhl
Y19xdWV1ZQo+ID4gPiAqX194ZV9leGVjX3F1ZXVlX2FsbG9jKHN0cnVjdCB4ZV9kZXZpY2UgKnhl
LAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgZWxzZQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoHEtPnNjaGVkX3Byb3BzLnByaW9yaXR5ID0KPiA+ID4gWEVfRVhFQ19RVUVVRV9Q
UklPUklUWV9OT1JNQUw7Cj4gPiAKPiA+IFdlIHdhbnQgdGhlc2UgdG8gYmUgaGlnaCBwcmlvcml0
eSByaWdodD8gSS5lLiBpZiBhbm90aGVyIHVzZXIKPiA+IGNyZWF0ZXMgYQo+ID4gcXVldWUgYW5k
IHN1Ym1pdHMgYXQgaGlnaCBwcmlvcml0eSBjYW4gd2UgZ2V0IHN0YWxlIGRhdGEgb24gdGhvc2UK
PiA+IGV4ZWN1dGlvbnMgaWYgdGhpcyBvbmUgaXMgYmxvY2tlZCBiZWhpbmQgdGhhdCBoaWdoIHBy
aW9yaXR5IG9uZT8KPiAKPiBJJ20gc3RydWdnbGluZyB3aXRoIGV4YWN0bHkgd2hhdCB5b3UgYXJl
IGFza2luZyBoZXJlLgo+IAo+IFRoZSBxLT5zY2hlZF9wcm9wcy5wcmlvcml0eSBpcyBwcmlvcml0
eSBvZiBleGVjIHF1ZXVlIGJlaW5nIGNyZWF0ZWQKPiBhbmQgaXMgZXhpc3RpbmcgY29kZS4gSW4g
dGhlIGNhc2Ugb2YgYmluZCBxdWV1ZXMgKGkuZS4sIG9uZXMgdGhhdAo+IGNhbGwgYWxsb2NfZGVw
X3NjaGVkdWxlcnMpIHRoaXMgbWFwcyB0byBwcmlvcml0eSBvZiB0aGUgR3VDIGNvbnRleHQKPiB3
aGljaCBydW5zIGJpbmQgam9icyBvbiBhIGhhcmR3YXJlIGNvcHkgZW5naW5lLiAKPiAKPiBkZXBf
c2NoZWR1bGVycyBkbyBub3QgaGF2ZSBwcmlvcml0eSwgYXQgbGVhc3QgdGhhdCBpcyB1c2VkIGlu
IGFueQo+IHdheS4KPiBUaGlzIGlzIGp1c3Qgc29mdHdhcmUgcXVldWUgd2hpY2ggcnVucyBUTEIg
aW52YWxpZGF0aW9ucyBvbmNlIHRoZQo+IGJpbmQKPiBqb2JzIGNvbXBsZXRlLgo+IAo+IHdydCBo
aWdoIHByaW9yaXR5IHBhc3NpbmcgbG93ZXIgcHJpb3JpdHkgb25lcywgdGhhdCBpc24ndCBwb3Nz
aWJsZSBpZgo+IHRoZXJlIGlzIGEgZGVwZW5kZW5jeSBjaGFpbi4gVGhlIGRyaXZlciBob2xkcyBh
bnkgam9icyBpbiB0aGUgS01ECj4gdW50aWwKPiBhbGwgZGVwZW5kZWNpZXMgYXJlIHJlc29sdmVk
IC0gaGlnaCBwcmlvcml0eSBxdWV1ZXMganVzdCBnZXQgc2VydmljZWQKPiBieQo+IHRoZSBHdUMg
b3ZlciBsb3cgcHJpb3JpdHkgcXVldWVzIGlmIGJvdGggcXVldWVzIGhhdmUgcnVubmFibGUgam9i
cy4KPiAKPiBUTDtEUiBub3RoaW5nIGlzIHBhdGNoIGNoYW5nZXMgYW55dGhpbmcgd3J0IHRvIHBy
aW9yaXRpZXMuCgpZb3UncmUgcmlnaHQgSSB0aGluayBJIHJlYWQgdGhpcyB3cm9uZyBzb21laG93
IDooLCBpZ25vcmUgbXkgY29tbWVudCEKClN0aWxsIHRoZSBtaW5vciBxdWVzdGlvbiBhYm92ZSBh
Ym91dCB0aGUgbWF4IG51bWJlciBvZiBkZXBlbmRlbmN5IGpvYnMKd2hlbiB5b3UgaGF2ZSB0aW1l
LgoKVGhhbmtzLApTdHVhcnQKCj4gCj4gTWF0dAo+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBTdHVh
cnQKPiA+IAo+ID4gPiDCoAo+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAocS0+ZmxhZ3MgJiAoRVhF
Q19RVUVVRV9GTEFHX01JR1JBVEUgfAo+ID4gPiBFWEVDX1FVRVVFX0ZMQUdfVk0pKSB7Cj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBlcnIgPSBhbGxvY19kZXBfc2NoZWR1bGVy
cyh4ZSwgcSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoZXJyKSB7
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX194
ZV9leGVjX3F1ZXVlX2ZyZWUocSk7Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIEVSUl9QVFIoZXJyKTsKPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gPiArCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqBpZiAodm0pCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcS0+dm0gPSB4ZV92bV9nZXQodm0pOwo+ID4gPiDCoAo+ID4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaAo+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9leGVjX3F1ZXVlX3R5cGVzLmgKPiA+ID4gaW5kZXggYWJkZjRhNTdlNmUy
Li5iYTQ0M2E0OTdiMzggMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjX3F1ZXVlX3R5cGVzLmgKPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNf
cXVldWVfdHlwZXMuaAo+ID4gPiBAQCAtMTM0LDYgKzEzNCwxOSBAQCBzdHJ1Y3QgeGVfZXhlY19x
dWV1ZSB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGxpc3Rf
aGVhZCBsaW5rOwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgfSBscjsKPiA+ID4gwqAKPiA+ID4gKyNk
ZWZpbmUgWEVfRVhFQ19RVUVVRV9UTEJfSU5WQUxfUFJJTUFSWV9HVMKgwqDCoMKgwqAwCj4gPiA+
ICsjZGVmaW5lIFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX01FRElBX0dUwqDCoMKgwqDCoMKgwqAx
Cj4gPiA+ICsjZGVmaW5lCj4gPiA+IFhFX0VYRUNfUVVFVUVfVExCX0lOVkFMX0NPVU5UwqDCoMKg
wqDCoMKgwqDCoMKgwqAoWEVfRVhFQ19RVUVVRV9UTEJfSU5WQUxfTQo+ID4gPiBFRElBCj4gPiA+
IF9HVMKgICsgMSkKPiA+ID4gKwo+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiogQHRsYl9pbnZhbDog
VExCIGludmFsaWRhdGlvbnMgZXhlYyBxdWV1ZSBzdGF0ZSAqLwo+ID4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3Qgewo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoqCj4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBAdGxiX2ludmFsLmRlcF9zY2hlZHVs
ZXI6IFRoZSBUTEIgaW52YWxpZGF0aW9uCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKiBkZXBlbmRlbmN5IHNjaGVkdWxlcgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICovCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBzdHJ1Y3Qg
eGVfZGVwX3NjaGVkdWxlciAqZGVwX3NjaGVkdWxlcjsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgfSB0
bGJfaW52YWxbWEVfRVhFQ19RVUVVRV9UTEJfSU5WQUxfQ09VTlRdOwo+ID4gPiArCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqAvKiogQHB4cDogUFhQIGluZm8gdHJhY2tpbmcgKi8KPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHN0cnVjdCB7Cj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
LyoqIEBweHAudHlwZTogUFhQIHNlc3Npb24gdHlwZSB1c2VkIGJ5IHRoaXMKPiA+ID4gcXVldWUg
Ki8KPiA+IAoK
