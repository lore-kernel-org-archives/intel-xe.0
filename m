Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B88EE71060
	for <intel-xe@archiver.kernel.org>; Thu, 21 Sep 2023 12:27:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F31010E0C1;
	Thu, 21 Sep 2023 12:27:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A18210E0C1
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Sep 2023 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695299269; x=1726835269;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=+XtBEPou65yzFKKV9CLYpD2bF9xIX3ogzSQ1BRPI/H8=;
 b=nogzreJtDOIz2NzSsNtNxDxSs6oouxiHkVIZguqF3khSH5/yH4g+E+l/
 ExUjuz7AHt7yGA5No0LJUAcC/qQIqclHMYy8rL461VRmzp8LuVVRROW7y
 /e4xbYExkJfvT8gBSHvg5+ChRxZg2bpF4NQxiqsFo/NbPw2BJJYb4F0NT
 7+6wl+vyyCT+QaO6yjLZOmxREgILXndANr8YYzS9gJacfRnQidAzg48dK
 2o3fRUzLB0gVrn7tliG1e/9uNHH09SbqxNOpKyBSEvxZz1SMkKvzw2s26
 V4dy+jQXxXYoyfLQMc+Z/mkHMJOJnCAONrB/i7BoYD9Fnx3pZfadAVntR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384345586"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="384345586"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 05:27:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="747075291"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="747075291"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Sep 2023 05:27:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 05:27:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 21 Sep 2023 05:27:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 05:27:47 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 21 Sep 2023 05:27:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwlhAKg3oKq7c069Y27TijJRusq+ZKJ7ql0iWTP3NO7P/N5+P0ikreUXyeS+erF6+wdq2uOpw1Cvd8fMUiOJ7dbH6NMPF3Xp79Z5r8aS6KcjEoiUxS4Ku8D9XwUyH6YeO25qHJqLJrff5Otot/NFirvV12hpuedzSEXNng+s8DlZdb0jUqVE5W2twiIKexVCijTE9omxmLA+2OOvQu9ZNm4Jj9D3aKMYN49M07jHxtaRtOr/dNOPU5cTFvhBlX3Ct34k+apmabGUdIrx1SC833HVykrirrBBYjzEmms/b3Q5ALj+slNNrQQJvc4KFgdfcKAxxVW/kFFeCGlid8htWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0+gUi3bhWCen0V8ficZ170A3fro2SjgwrMNvDykZXQk=;
 b=gSj5Fd015xe8tkKQJDqpM8ghLKZY+sieJ2GwVdIBCrm7dpRfzhkYIPpbLFptfEOWN0aoxkR38emOi8hKXUvI9jHTwGSxn9zCMy36We1LX/rwe2oekXTt85tw8fQ68ICoViNcXjxqZTZxmO5YzV7l6ACRqoFHIg4uetLua1tDXr3rJ8506Qg50kA4pCp6+sqUC6BFVKEra5pvYwcHqkVlAQZOCdeObS2mLpsYM+JQJxFeTouers15cGuL+mgt6JF1AZhxmAANX10wFkQoukf288o4Y30BTwobyFXY9aQe8go73Ly/weux/TZ5q6xf0kVIY7Ezk0Tot1xdr7qZaEXmxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB7880.namprd11.prod.outlook.com (2603:10b6:8:f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 12:27:46 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6813.018; Thu, 21 Sep 2023
 12:27:46 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230921113637.386651-1-aravind.iddamsetty@linux.intel.com>
References: <20230921113637.386651-1-aravind.iddamsetty@linux.intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 21 Sep 2023 09:27:40 -0300
Message-ID: <169529926029.1903.4293936753216987484@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::24) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 86f311bb-66b3-460f-aa94-08dbba9e2924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HEWx4GaDIZ4NNm/zqfs8D+PJoi0MgenQlQuyD4/1RX9EDLP46Cnkqncuz18xoG8No9KeU9U07nMng5oXKMMItFX3U/d9aqphR47wdsEqrWuLAIw06CAV0aDzr0nehLJQ6T3Al5v2M3ppbSj464+fIhvO8mM2t2MD77oZY/rvfRi4MS8n5z0sE2CON+1bbBbW9vzlDggoUdmYoPKEAeYnV8Es7H13JNKfIaMAv4N4T3TdWHuDDZP+ALHZV3ZqS7bxXyk5RloLl4/PJAdb6JLdQwJp+ZeMOaLHgkcVi5Ue9p8Er+y2JDtq1SmnH/jzSnOeRXsvYoCIZytnssNtgae71ELvkHV2Iwer6FkwjwrW8yyVwLd+Im6yQoRea+Ob6PC+2fkcBX6x3y97/JIW5SHStoJzlua8kArft/d53Du/LeZHJ3PNt2dpNeXJ6f+sQRIMfDmiXaXJS5yWWwfhA972BeIkfy3TG3GnIUF+3U7O7F7s7C4ytBF3UeUL/KCMvyKd/Rb5knVjmkXfksmoANHvRAe0VsAYQxom/4zg7pjJ9pvpnbYsGheUge7rlLAlCVWN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(346002)(376002)(366004)(136003)(39860400002)(186009)(1800799009)(451199024)(5660300002)(26005)(41300700001)(2906002)(33716001)(86362001)(38100700002)(82960400001)(44832011)(8936002)(83380400001)(478600001)(9686003)(8676002)(6512007)(6666004)(6506007)(6486002)(316002)(66556008)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTkvSWplcmRGdGdtZVFYR2xacEF2c0p0ME0zYittU0dERFZCMmQ1ai81R2Z2?=
 =?utf-8?B?V2tkWmFVanBYY0wvN1M5SG9KallYeDAvcFdMYUwxTDg1ZG9XeHhzVTEzT05m?=
 =?utf-8?B?RWpSU3JxSE5mdGlxRnRPbHlSTGVQMWNQU1MzcVZyVHdxdDZ2eWJpRS9oKzZT?=
 =?utf-8?B?eVRiRGZWNGxJRnlsZkRkblZjaGRkQXNCM2dhZURua0pqQzJQQmxtT2xacHZP?=
 =?utf-8?B?Y1BQR1dzZUw4WTd0cjRnNTU5SzF5YnZJRWVibjU3MnZ1ZWRUNjQyOTBHMEl0?=
 =?utf-8?B?OW1pb3FUT1BnSlZjYVgvYnpGeUZxazB6RWF1VUcxdzB6SXovaUpvRjkya1BF?=
 =?utf-8?B?bVhDeXRtRXJxanF1TllIQWoyUGM2dUQvTG1HSFJSWlhDQi9aRHlmRGlCRllz?=
 =?utf-8?B?L1pGMFg1UEdiSTVPV0hWUGhtYzFicTNpYVB4dE81UmlRUkpUZW5zcGF5bThU?=
 =?utf-8?B?OEJZR0d6ZHlDbG1YUDE5QnRuMitMN3IzWGY4SzRiU0l0V2Y1VGNXcXRadG5L?=
 =?utf-8?B?dU5UZjRsT0dBQU5oTStGL3pGZzdVdGN5MDN6cGxJNlBzOVFwR0IrT3dmU3Mz?=
 =?utf-8?B?ZTEvQ2toYW9Tc0h0dzRRc084ZnVnVHF4RWJHMnZXNGlab3VjaGwvNjdlWi9j?=
 =?utf-8?B?M2pvNkdZWVVPdm40TGxwL2tnVXdId0pJUGFmQVNkVGtjWmpxa01QWklOaFlI?=
 =?utf-8?B?eUQ3a0JHUmdrN242Qmc4dUpBNE40OW9QMm5HdmV4OHpuMHZ5dGE2NnltbXRp?=
 =?utf-8?B?aXhCMUNpNnAzbUhHL2lhcURsbC96Mm1yb0pJMlVnMmlpK3BhUDlXN1Q0SVFG?=
 =?utf-8?B?dmhDUldvTEpNRWVyVTFHRlpickh4OEk1Y0xENy9nOGVTblNiVnNYN0lwdEFt?=
 =?utf-8?B?UXdpWTk1TWY1OThpQjlnUXBWYXE0SnRGd24vWjlKYTZtVnNpcytxRnVscDJF?=
 =?utf-8?B?NVFXTmh0VG5yNHIyTFRPNXNaMWFXV0pyODdsbHJQY09NL2s0YkdPOG84RmU2?=
 =?utf-8?B?bVZHaEtNWGVybE01V3ZRNi9lU25CR1pQMVRTZkV3SHVnYUxuVXdXSWx4QkV5?=
 =?utf-8?B?dHQ4dkdUUThTL0NiVkpGWlEyTkt5TGRFRXZ6NjhaanR6U2tUaGdjUHJXQnNQ?=
 =?utf-8?B?YXBGaGVjQXZqMHpTYkZaYm95RmRIR2QxalJYWlVZTTdjd3FlQzdoVjNabWpC?=
 =?utf-8?B?bzNXU0JBcjU3d0NST1RpNUZIWUNyQWxuMjAzVjY4QTJaOWJlNGZNU3FRM1FY?=
 =?utf-8?B?dnlxN0lidlNVT1BPeGh4ZHFGZkw1aGpKRENJVnQ2MzFtMVptWEdQd2ppZU5J?=
 =?utf-8?B?a3J6WFRselZZT0pSNFJxRENJSDd1RTZIanRpaU13WUsxV2RKZW5GRC9rc0c2?=
 =?utf-8?B?dFNyaWZaUGE3WGFjRkpGMmNzSTJ3MytEWG1GRXdHUnpLSG8wK05uYk45ZzZW?=
 =?utf-8?B?VUVpaFNqelZva2t5K05aSDZrUWY2NTdTZHVRbUhjS3ZDSldLUmlORUpZQzJT?=
 =?utf-8?B?eXdpalBHZnY1RkQ0N1pLMThyZDFtT01nNUdLcTlGV3JqWFhXUktFdjR2WjFR?=
 =?utf-8?B?YWRRQjJBU2VuTSt1S1AxeWlocmpWYWh0T0NOTDNDaVEvTXdkM2tDeWdFNGhK?=
 =?utf-8?B?Sytyb1piVkxTdGh4OTVudTZNUGt1Z2FIc2lEUlJYRE95WjRUU3AwWU55Q0Zs?=
 =?utf-8?B?cXdVd1g0ZVUvMWhURVM4WUc3RXFneGhCTUNhYlRmRFFNTjJHMFBZNXg1VXJm?=
 =?utf-8?B?R0IvaHcwcUNCUmtzR1A5R3lpMTZ0VUlXaVVwdDNKdzJ1VytyTXQ2QlpERm5l?=
 =?utf-8?B?Z0Z1eGZzUnhObHEwdVA2cW1UQnRrVGNiOTM4K2ZFQk1hOE5aZFZER09yNk9D?=
 =?utf-8?B?OEdOYnZMM0QvRHVIQTNRZ0dLTGF5NGMvRDZ1YWZHWXBIY2U4Z01xQUVPQ1JI?=
 =?utf-8?B?cTIrSFpnRXIzcEdva3lDZ0tJaDJmTEhxRU9Gd0tyY3loUkVvRTVFaW1kK3I3?=
 =?utf-8?B?YzI4MitGOE1KblF3T2haKytGeE9pY2hSdnpFQXpWQTE5ZkMvOTE1UkVGb203?=
 =?utf-8?B?dDgzQ1lzMFRvSVcyK0grOXJQNE11UUZveVM1eFpacExNTDNXNW1MME9LVXhq?=
 =?utf-8?B?YzI2TGMrdFpObE1GaUE2dUdJSUszVDNFSndiazBEQWszT2swSVFJb0dGV0hJ?=
 =?utf-8?B?OXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86f311bb-66b3-460f-aa94-08dbba9e2924
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 12:27:46.2617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eo3LQW8H/jNBQlIvAGc+jCL1IcJFScwBKUTem6BxhQ8uCuka+Muae7pt9LMyL2v4ww7KnzxpyDR1EinFAvSoeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7880
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! fixup! drm/xe/pmu: Enable PMU
 interface
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

Quoting Aravind Iddamsetty (2023-09-21 08:36:37-03:00)
>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> include/uapi/drm/xe_drm.h | 6 ++++--
> 1 file changed, 4 insertions(+), 2 deletions(-)
>
>diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>index 6ab85c7fed36..d48d8e3c898c 100644
>--- a/include/uapi/drm/xe_drm.h
>+++ b/include/uapi/drm/xe_drm.h
>@@ -1056,12 +1056,14 @@ struct drm_xe_vm_madvise {
> /**
>  * DOC: XE PMU event config IDs
>  *
>- * Check 'man perf_event_open' to use these ID's in 'struct perf_event_at=
tr'
>- * as part of perf_event_open syscall to read a particular event.
>+ * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in xe_d=
rm.h
>+ * in 'struct perf_event_attr' as part of perf_event_open syscall to read=
 a
>+ * particular event.
>  *
>  * For example to open the XE_PMU_INTERRUPTS(0):
>  *
>  * .. code-block:: C
>+ *
>  *        struct perf_event_attr attr;
>  *        long long count;
>  *        int cpu =3D 0;
>--=20
>2.25.1
>
