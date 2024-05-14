Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B9BC25B75
	for <intel-xe@archiver.kernel.org>; Tue, 14 May 2024 10:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2D010E22A;
	Tue, 14 May 2024 10:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jf80A/3N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A1310E22A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 May 2024 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715683806; x=1747219806;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9ePlZ1U7h2mQNVgimtAdaxLexMKG9PwfGw/2Okv4TTA=;
 b=Jf80A/3Nug5hHPPkOmWD11XkJeWSuNZJ3ylA1EkbSPqO0OUXDw3pSXdi
 pDBfOXFsu9eNx1WInnjXsaG4hxI0+zW00KhFEp1VEdInhcsBWInw39CWq
 YzBB3H/tsRBMzjlB5OKX+Ok2vISuh0JezYPTijwonIixciesexia7DZFc
 hd5CShrvj6hIh7443arNneOvDtjT/eL3pkLdSowYxEGYf8R1tafje5LKO
 IZqOTpCbLBUbeujFAIqesJoG51uUJWnc4XRt6U+HYpau3LPR/E6//UZCu
 grjwpydIf6vtvhhjO7L03/NriGA/r1FXGUEm8beGnu1FSTbZVuBWz9ULD g==;
X-CSE-ConnectionGUID: djBIuq2HR+mPk6PLp7EaJw==
X-CSE-MsgGUID: g4ZHd9bLSyi2iBHKnJ34Ag==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="14601895"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="14601895"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 03:50:06 -0700
X-CSE-ConnectionGUID: Ko3/VyR2SBS8mQvXlZsHSw==
X-CSE-MsgGUID: UU11Xdm1QN6S8jD1wAahiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30481633"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 May 2024 03:50:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 03:50:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 03:50:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 03:50:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAW2N2P9m452PF8Q9SvfYtLxwBJFz123wzkm+jx2vYyqJ6mFaqO9jR092r8pgDIvkHByWHGZsluoBrWxL4cu9+XZYdXNQwhpxSYguBvUQ930+7nAEYwbXrZcIbRMDAOCqs0O/hwW0y2Huv4A2TKssVVnG+WAfv7GvR4BaZJswzOmR2Z5ZGEdKNzhPp/a8aSXAOhrNbBaqBbhSH8m2WDTxwEKrnPOHLZTWCq/9mEpkqkEJ6PLpMR8Qd0hGfWxax8TTebEEA13Qypq7vN5d2h9fjX8LdUJ6wfSIlYhQs+rP3lxmU/8jAmU1i+TXjt7K74nBT0Z8kFoori1lXUFJoMBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HuwFqW4tG/RLA9fCSgD4c4l1bSzNytJYhfKg14wmhTs=;
 b=U2zHYf4cMK4p/qT+HDLynYtmMtbA+xTcXxYrkiUGyGGOa6+GVyFBX/+vSJP2DkVvECoa+gIbkl6+nojJ2XEFlaY3c0hMXG6QjJO6/P9b8KcDqMrImyRWo0ypV/6LVuifq0ykNeX6z/jkM+cfGDZ8TvSHV5IqB8Q5EvoEPbzyZPMagXw5N9ON0Ro85/MASDWG6Kh48oNDDHWfiQPI2zfBeSCsjtTDA41F41brBho+HTlQUGsMw2R753aFJfUr2BQs9YamT/N1JqzQfePwcL6jJtpRzE5HwluBG8qDLQlHoh3UPO33fadZXLG8fXzykqiLB6jDj+gpBoPWOpyip8VJKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 10:50:03 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%5]) with mapi id 15.20.7544.052; Tue, 14 May 2024
 10:50:03 +0000
Date: Tue, 14 May 2024 12:50:00 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Don't advertise support to enable VFs if not
 ready
Message-ID: <20240514105000.ge5oyg74a56eodcw@intel.com>
References: <20240507165757.2835-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240507165757.2835-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7P191CA0016.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:54e::26) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 1697a120-390d-4d43-4a84-08dc74039c49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zmc5K3QrVHJJU0gvcmF4UGoyKzV2ejVuOGRuS3B6R2d5QjQyekYwcnNGVEdZ?=
 =?utf-8?B?TTJYNTZqTUdKMFh4cVJ0ZzZ3TyttN1hFbmc0aks5TTU1U1M4VzFWZzh3eEI0?=
 =?utf-8?B?TGlwZXptVitNOEx3K1dLNkNxeGRZWEJMVFMxam84dXZwY0JjR1pTb3RLbGlQ?=
 =?utf-8?B?c0JBajZxUVZGMVhsRjc2WVRlMzNHNjRrVmFDVVlhUVBMUitCU3cxTVpZa05Y?=
 =?utf-8?B?bHl3WmczblJjN1ExcmxjMWtxd3RiYnFiaUEzUlRxb2s0bUt3SnM5U1JkeGlk?=
 =?utf-8?B?MkNPVFRMOU5yTS9YWTRUL2k0TDdXRmlNV1V2NGlDVGdpa1hPUnVUR0loamty?=
 =?utf-8?B?UXprRlI1dWZLV0JVYmFqR1hQY25Ha3NKTDYxZVB3THB0ZUJCazRmOWw4cm41?=
 =?utf-8?B?Q3BlcWdJVU16S2pIOXU4ZGRTVlBXVmxrSWlzT0x5QWJROGcycWVsR1hTQTZW?=
 =?utf-8?B?OGhQcEpwbDJxMDY2d3dzN2djaFVxMFZEdWI2Nm9uQzBnWTYvN2cwaDlzcmpn?=
 =?utf-8?B?cXRIbyt3SkxLZWMrdzhFbXVHRHpodjFTbHo1TnB1OXhhTFdJZ1BCSEJmaFVs?=
 =?utf-8?B?MlRZOWdwc2NCQmIzS3JhZGdLMUZQbENFTzFtT0FENnhQRzI2L0tQL1dPemdE?=
 =?utf-8?B?R3JPb1lNWjdlK0pHN3hxTmwxWUpjOHdnMUJSd2VFdXlvR0VSK29nUW5Ga3lE?=
 =?utf-8?B?cFBqcFBZMzE3cDU5eStZby9GbGhxUzRuUEN6Y0s1ZHpaamZWUGhTbkQrL1Fk?=
 =?utf-8?B?NzEvd3lxTUQ3YzlZSW15N056L0dMWEt1ZFpMUGFzUjFVb3ZIYlNlL3dldEc2?=
 =?utf-8?B?UnI2akpCazJuMHFNSEw3MXBTK3FVYlBUdlM4eWIzMnoxc2FjVlBzQTA5eGZw?=
 =?utf-8?B?V1U1S1I5S2tDbGlGb1ZOM04wa3NneXJBZFhyWjV0Y29xU3Z5bHN4VXZ1cWJi?=
 =?utf-8?B?RFQvamVmY3ExL1hUckV4bjlpWlo4WTBoZ3ZIT1FzTVAwdXllTVM2V0lJQjNR?=
 =?utf-8?B?aDlUSHRPTFNMYWM0NVhsQUlvQ1lZYWdCdExJdmFYWGhyNmRxVitYSzVPV1dk?=
 =?utf-8?B?RnZMRnpMNWc0aGJWV3dVSzZQNWt0N0RZNkhDYWFJbENtajRjczFJRWp3RDhW?=
 =?utf-8?B?L2FJMWdXWHIrblpnSjFPWUdnZUR1c2tXR0NVdlNaY2VxcDFEeDQ1UDE5Z2xw?=
 =?utf-8?B?ZFRwd0V5ZTBRNGZxQzh6a2NPVzcvNi9pdUUzNTk4VmJiWHpvN0hybVZ3VUhp?=
 =?utf-8?B?akJwOHFSWitMY091TnVubnlJUWY4OWc1eDdPb0hUQ25HaEthMjFzaWFCYVhW?=
 =?utf-8?B?dnZMTDlJWWVzZkVOaS9nVjNGRkNIK0hoZ3A4WlMvTFNTbDdmTlNBS0pEaUdI?=
 =?utf-8?B?bWNCeGg3TFh6OVNhdTlKSS9OdkN2dE1TaDBwaEJxTnN0UGJXL2dKZG9rd2dx?=
 =?utf-8?B?OGdtaSt6QU9OMllSQy9tQjlmSWRlWEVJQ3dHeEJvcWl5aU9zMi9jRG83c0Vw?=
 =?utf-8?B?bUJZYnRvcHVxRjB0SkZwQlJwTFN3VjJjZENFRkE0RldHRGFKVVVBSksyNnJT?=
 =?utf-8?B?VHJVd2lwVElNb1VoSVZNTE1hbWkxbUt2UThoaEViY1RxN0hqUEo3Nm8wS0lD?=
 =?utf-8?B?cmJrTmJ5Y2RqN29GOHFyV1NseGpWenFnSjJhcmZ5ejZrQUNqMDNzWG9nRm1L?=
 =?utf-8?B?cng3SmcyeDdFY0Ftczh2SHozK3gzWkxDeWExYVpVWDEyWEtub2JLUWtRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDM2SGYxWWUwYitBYTdJdndyazhWdFdGdnhweEJudnZNSlM4cC9PZFZGWFNH?=
 =?utf-8?B?bEpWeVFMWUN3ell5MEVsNVNRSlJISDEvWXhUazhWcHQrZU8zUEJjeXZwRGQx?=
 =?utf-8?B?b0p3dm9LUXBFK1U2UWNISXVNc1BHdHRBUmQ1NmhDMlVNMEtMYkpheDVRRUU0?=
 =?utf-8?B?WVF4dnVrWm80enEreXdhcXhWM1RLWW5FOW1NNGZnTktMRnhUcUt1QmdkOUg5?=
 =?utf-8?B?b1h2aXdQOFBoWnZrdUpXUnJqMDdlL0w4Um1hWTZPYmJ4U1Z1enI1VFVaR1pV?=
 =?utf-8?B?Q20wYkM0QXBGOFVtcjV2REFTSTJTVlJYUmJVL09JdDVGNXpTcE1saWRFUE9F?=
 =?utf-8?B?QmVsRW03Vm1ZcGNWOVdXNWxGQnhFWjI5SXNUMVRkcGJpQjJjdnRGbmFTSXNv?=
 =?utf-8?B?dm9kWEpXTnlCYW15VlkvNHNxQWR5a0tYVFlpSVoyWnV1ZlhOM0ZDNGRvOWU3?=
 =?utf-8?B?eWJYd3JxV2dSdnMrYlQ1QnZuK2wyNlRnaG8rTG9Va3VCbmM2ZTJLdjhqTlpj?=
 =?utf-8?B?NXpSQkxETDFwdVdmbkRYVDdCZkV5c01wSDl2dmJZcE1wd3Bid09rV2V4Sll4?=
 =?utf-8?B?WE5wUEcxWkI0SXlPMHE1L1AvckU0N09QZ3FENWsrMmZGbjhuZ3Q5MTdRM0hw?=
 =?utf-8?B?ZXViZzlxSnRiUWhtbFl1SHp2azdtSUJxdUtCMk0zQ2x5MzNoU09taDZQUlFP?=
 =?utf-8?B?aVpwT1pKREFMdzlLa2lJUm1MRjZaOTJRWVppWnNHQXNuQlluOFlkOXFJTG1l?=
 =?utf-8?B?MTVwUk1keDRyQTJaVzUvVGtXZkVIUnhhaFZEc3JSVHFrcS93bWRkWlB6TXZt?=
 =?utf-8?B?ZWRFR2tVeEREUU5yczVIaGhwZXRueUQ5WGl6eS9udW1najZaaGxQckVjcnY0?=
 =?utf-8?B?TjdsM0FlOFhEME50a1I1Z3lVTXNVVDl1b2QwWEowTWM1QlBNbnFtYVpTL1F4?=
 =?utf-8?B?bE52ZmZNUkhTNEZhb2EzQjJJV3ByenJnVDk3VE5lbGM2RnRways0OGRDdHds?=
 =?utf-8?B?dVZkeE84U2VlbzRHUGJtUElQWlhITkdNTE05U0VwQTd5ZlYrS2hkdnBNVjFu?=
 =?utf-8?B?UzhqVHVVb0Evc2FvVGhaTlZiczJhdTBwT0JFQjBUVjNwWGtNL3A4Y2xXekwy?=
 =?utf-8?B?YW9tUktTTHNtWVg2N2JZeWZVVlVzdnlXelljaVJkeGsyNUgxVkdLaWFuZ2h0?=
 =?utf-8?B?WitGczV0VDQzWWhiL1hHYlpwUGxxdmZpdlhtUTQ4cGR2Z1Z6YmVib1VyeW9V?=
 =?utf-8?B?eWtpTmJRTGh3d2FGVWhZUmlEV3FnKzg3Z0hLcS8wMEkraytlcmZFUnpVQUxx?=
 =?utf-8?B?Zy9kTUdFMmVPS2FSbVRWUkxYV2U0c3VxKzE0aXlmQVI2eDNBVlVSWDZ1aGJS?=
 =?utf-8?B?Tll0TWxCdDF1S2tZbmpKa3Bxc2JuYU03dkE4OE1QNjNiMTk2OFpiOElYK1Q0?=
 =?utf-8?B?SmFzUEpQNXN2MlNrNDh3SmxRYWIzOHFJQUUyK1J6MFJPV3RDR29QdWt5eGJk?=
 =?utf-8?B?d3lRblRJOG1KbFFZbDNvREJRTkZOSlpqYU55aUt2VDloNHJPc1p4TjhXeDYr?=
 =?utf-8?B?bDB3a25oSG1IczV0czU3WUNaVXEyMks5Kzg1RmR6dStCZHhBYWxjSmF1WEZI?=
 =?utf-8?B?NEFiNEl6SnJZcFdDVDVZcURzd1p5Yzl0TXVzZzF1WXRLWUpmZHBJVU1Wbk1u?=
 =?utf-8?B?TjV0MXNpYlVZMnRUQ1ZEandwSXdOMFdlcTFDb0gxalJGWjVLTFRianJDZXBi?=
 =?utf-8?B?OVBGeDFqV04rYTlvWGVhb29LSlFORkxuVzZOQVZKUTdFb0d1SmlEWUNQQXpo?=
 =?utf-8?B?eFo4U1BSekJqUjZyVXk3dkdCbnNCWDhta2hUdVJKYUlYbWo2djdXNHJBUklv?=
 =?utf-8?B?VENBUlFWRUQwNGVsNXY0S2x5NTRVY3NzSzU3cFlpMXhUcEIrSVdFRExlb0V6?=
 =?utf-8?B?WE5BT3BPdjVwQlc3enNMdk4wNEVDYTZxbjQ2V3M2RXNHbVBOTTczcmpBOVd2?=
 =?utf-8?B?NjJiZ01UL1lMdzlTYkFqeDRtYVpQUUFGVm0rRk1aRWJGcnpnMWxOOWdyb3NC?=
 =?utf-8?B?ZWlPcmthY3ExOHJNTkRRZkpmU3Q3eGdaV0F0a2Zpa1VrdjNYbHd1ek83RU92?=
 =?utf-8?B?ckEyaE9EQ2NjNk16YjZ5QzlyMVpHOUVidktDWTlweHBZTkFqbjM3WVhDQ0Vh?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1697a120-390d-4d43-4a84-08dc74039c49
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 10:50:03.6802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8sUWnyfK6IzObuy5OABi5EPSuIBgslXOEvBzhqxA8Nj4Xab3G7PZige3VQWzjhzAs1rkYn/PFsPlRkgB84/6n0yZo9jMkusJrnaml2+IsdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2024-maj-07 18:57:57 +0200]:
> Even if we have not enabled SR-IOV support using the platform
> specific has_sriov flag, the hardware may still report SR-IOV
> capability and the PCI layer may wrongly advertise driver support
> to enable VFs.  Explicitly reset the number of supported VFs to
> zero to avoid confusion.
> 
> Applications may read the /sys/bus/pci/devices/.../sriov_totalvfs
> prior to enabling VFs using the sriov_numvfs to check if such an
> operation is possible.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 1c3fa84b6adb..a274a5fb1401 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -53,6 +53,7 @@ static bool test_is_vf(struct xe_device *xe)
>   */
>  void xe_sriov_probe_early(struct xe_device *xe)
>  {
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	enum xe_sriov_mode mode = XE_SRIOV_MODE_NONE;
>  	bool has_sriov = xe->info.has_sriov;
>  
> @@ -61,6 +62,16 @@ void xe_sriov_probe_early(struct xe_device *xe)
>  			mode = XE_SRIOV_MODE_VF;
>  		else if (xe_sriov_pf_readiness(xe))
>  			mode = XE_SRIOV_MODE_PF;
> +	} else if (pci_sriov_get_totalvfs(pdev)) {
> +		/*
> +		 * Even if we have not enabled SR-IOV support using the
> +		 * platform specific has_sriov flag, the hardware may still
> +		 * report SR-IOV capability and the PCI layer may wrongly
> +		 * advertise driver support to enable VFs. Explicitly reset
> +		 * the number of supported VFs to zero to avoid confusion.
> +		 */
> +		drm_info(&xe->drm, "Support for SR-IOV is not available\n");
> +		pci_sriov_set_totalvfs(pdev, 0);
>  	}
LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  	xe_assert(xe, !xe->sriov.__mode);
> -- 
> 2.43.0
> 

-- 
