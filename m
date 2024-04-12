Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2B4C4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 17:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5444810F230;
	Fri, 12 Apr 2024 17:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MJkYW9jt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D23510F20D
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712941706; x=1744477706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HSBjMIT3uI2rM6ExBXsralWnWKC6KAhcl87G05Ak4JA=;
 b=MJkYW9jtbKPtvcQouCydvlxZ5ZvCnDBQyUt2fz+cPafHV25dCE8J2Otk
 ECeXsbVOaVhrk7q3OCLG+G7MwjsPOUDPOFBSgOCplwmt7/swS8AlDAbGi
 9MHsIPyHr+JY11Vit2QnBTEEgUqt0FVwIRAKUw9kLC8HIVI8khIEpdrMt
 NSRVgnvT8+cW5FFyQU0PUcxNZ4hBb1Ws/jWwOQy3jTUuZb+feHjYANCcq
 ktdib4O2Hm6pvsJKo4xan2yunomCtvBzzPUGht6uQ1u26cWnewlGLBJRJ
 BIqwcNGR8QYfXLy10DDDpJJwCAvyv6+e4X0Fh1AK4XvjRPRjrh0CVc2TZ g==;
X-CSE-ConnectionGUID: iRfBRSOzSfS7f30ujPX36Q==
X-CSE-MsgGUID: Hn0qSGtiTfCxaZpujXbVxA==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25863312"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25863312"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 10:08:25 -0700
X-CSE-ConnectionGUID: ZSaoA8MmSViJI6nytvRylA==
X-CSE-MsgGUID: 6yXePitoT3egpSZ8sHM4zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="58707180"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 10:08:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 10:08:24 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 10:08:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 10:08:24 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 10:08:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JbafVPBaOkJobJGoDezHBGnpvb56WOD1c+8ukz/0AQZfKI4K3rOYYqpGCXyBrC2310dTR3P8hEyyOKmyDVQi1PruevV0bf77xKvjivAW7rMiNje1WWlbno8qcrd1/4gSLUxknxPNFLbC9eP/oSFahCZDWC1Lg1U0ugW1rpvyPJYJclbRbSBhEqzPf5GRDedWOSX2Uo1/kqTJSg8teAXo8QubxuJ3ECqv9deZFRLSchHnNPClyGO67iRRZUSKoHFGgxebiXSTgcQgjaIkZ5jBsxKE3gnyHUfA/ptj+i47dLHxL+NlhL4OR8lwjAI6T2TByL/ozJ/AFW1Exgr3HEWwcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNVOHaC257CEwQP1b+EplCS6Z5lopGzZelzR644fWUw=;
 b=TzsEo8P5HXcIUC/maTFskxKQdSR/QZKW4clZviWAzYuhztf54ctYk53j4lIW62pXBt86iPVkqkLFgnfSDIeSLRWwfErULN8D5ql3z8PUrn/CGwoimlo/sF7xR63NirYWEulBgIzspofTpmLn7cJHkEVZKzgOZU43PPH3ZSIdDohxNrAmjQilGAn1Icyrvg8s5f8wdxD7P8rBM8GG549rQ3VJM0hlkiQPvunkpkxS0lKkCZD1bY38wb+sHqgvcCJxRsPPFeSKF71kO/VvupWhYhDZ4MVDiKFWAMq0pbBHqNElSQwebahohIWWOmcLTV5ScN7DfEJKb0gMs5tLw1Tttg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB7905.namprd11.prod.outlook.com (2603:10b6:8:ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7430.46; Fri, 12 Apr
 2024 17:08:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 17:08:07 +0000
Date: Fri, 12 Apr 2024 12:08:05 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, Matt Roper <matthew.d.roper@intel.com>, "Niranjana
 Vishwanathapura" <niranjana.vishwanathapura@intel.com>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Generate oob before compiling anything
Message-ID: <ur5inqtubwpf5knacd5krfx3ozqzv5k6e3jygfmjwoh5zrgsw2@ggytf4g5cb5u>
References: <20240411210703.3296782-1-lucas.demarchi@intel.com>
 <87v84n3w8q.fsf@intel.com>
 <2vhlfwcxjtpjjlj6ddpfuunkqanfrvbdzw76mfsoa4rtjmm2gl@aaqz5bxidaa6>
 <87h6g64pd3.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87h6g64pd3.fsf@intel.com>
X-ClientProxiedBy: BYAPR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 32d98b45-ae1f-4153-2689-08dc5b131fc7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ly33k1cBeS8SCk1Uej/UuEA1ftiu/o9CCnpPjwNEoaqsF83mE44W+yAlS5YeGggEe3U/g9Gt0PQXKo8XtSGTEGixbFlgYHZXaU/gEgXuxvYFYA6I6m1UDNGA+mfXylVuQvlIsp/gbULxfJKBwvivKptNk82rIgPZu2skvSYLxHoCRY5Q08eA9f+n7O238lD8Dskm88lqwSJio4MvWFqlUse8C+uc4sMWBLS6R4k75nVpLUwslsObYxOS8T6Bcx1mIpWTX2REN3s+MWAReb6NEWCFAsn3J+OA/YsybZB+LD3wx41rHp8I6pX8TQEIqJbYYpUrx/pUDHEDF7AwFF7D5QcM0+TYTRg5wKMXvEzUrigliye1KSjpyzDG3saU1ivhHaRoUi1I2o/cTjTF778c622SIiL7QxO79ZhB5aTm1YpkwrLgbTezcXfOLTeji6aEA5IN9QFlXoFuOLPJT1gNqnde+ujOzlNKo1k4EjUoTkLezTH3EFX5KYtx2B0s5HE3EKwHZ//ZI4iKaTzywMjnzq5SuG6ZsyD8LxJck+bcmQzpvwnsVZwt8mbiTYBQ+jexB34ktDTkTHrlGwl8cjM+x2VJkqmfKsS1Wxdf2osFbTCCbtQpROXT84s98wGlImYFZegnb1+ocwRf0UAEqX2NzDP+neyormSRp3iYHdheX7c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3F0cqrmHy7cZ2p2l/w3kRq1imaQLoGx+PWrbpNNe4BGzM+1ooTwTfqd3HBC8?=
 =?us-ascii?Q?5hLDDbT7dc0zazQVxYsuOwSlA86fFrGfNliNwOx8XVw9FDF67f5YDllKaENU?=
 =?us-ascii?Q?Baz4gmkHyVyHYjp7I+fAlb8kZFSXic9NmxbzU9xlgT8uQhwJdJpK3osVz8T6?=
 =?us-ascii?Q?JuOWLCdOPmpBaQf69WBbQGqCOXfFWcAEcnaT4e8WrlA96jYuEEj1jwfn+wuh?=
 =?us-ascii?Q?DwKnU97mIPtKBc2IjNbpvYjHHliCDaHe5MXYr0cp0a39bcZIXX9JysfxKuQe?=
 =?us-ascii?Q?0DUfZSaFYBevnpR1649KlQvO9huE7bxQtpudhX2NAXw6w7NKne6nzUbTCCD3?=
 =?us-ascii?Q?fYJ9iwhofpfQBG+aTYk9a9vu+RpThH1CGRWZj/EIJBSroEwJrPAWZFFBk1O+?=
 =?us-ascii?Q?4QIzTOk+vjEKJkvZLKJbscg79CAaiM84S9p0RH56BVYVxP5G7RYmPzmnF51b?=
 =?us-ascii?Q?amakPUdwNXJC1VEWfF6iI6QJ7h1F5jpFPurJ6RH5VPnthnqOeKdvbZuk4ju4?=
 =?us-ascii?Q?nrqaqxamyPrKp7FlMkDZtagJ+lr4o23XQugZYENLqyoOMtVr0fYXKGiw+sE6?=
 =?us-ascii?Q?aUy+5K1MAOVhS16883jT4sVF2ef/mT/iQSofRYziFoaN169lvP62TJkYHzFa?=
 =?us-ascii?Q?Er9gCC7l4nrs/8WD6vEj9Em3lzVqjqd5jRWLDq+c4EeMePnwdGgvBbyQG3fS?=
 =?us-ascii?Q?cjb57pzI4tOdAkRGGQLBYWviSuEc7b+5AcxKNSBXxYJDtn02+KoN0U1cgqDJ?=
 =?us-ascii?Q?mG4DwEhsIovsRTJVFjnx+g4Lp581pOxP4F1JGWEFk7E+3s6uDk9CyZDZ/yuA?=
 =?us-ascii?Q?UMpJTB6caQ2gLJTMnCkcXGCcIZNhnBRG/V8s27wRCWn4sYR39C3OahEy6LXb?=
 =?us-ascii?Q?4oogZL9znO/c9tUzaCOJlcH/mQd2Y9qJuLEWiDcvwbLInyT8i27Kwk5meV+a?=
 =?us-ascii?Q?UnpqHQqAl2pg2/w4je3RMSXnqMk9k1XCGuS+f+eoblzKKAMZZmLrEs7lyAJQ?=
 =?us-ascii?Q?41OWm3L44SmeRpzXQhxFV+w2JbzKD24GmUk48wZXw7SSrBjdaAgXpEdvjk4i?=
 =?us-ascii?Q?Hsrru50uc2t8REeqxfw58qEOL0UnQG3s7E+qVASc1bz0I/HkMo26dVm5uwCD?=
 =?us-ascii?Q?/CEM3LNitWUhkQoSzXKhRZNMdTOClu6Sk0RnMCE5UdCCvwEuwflOC0x6Wccd?=
 =?us-ascii?Q?cu/CKyGJzG/l4CagrKwTo8iKIJteVwYP5+doJkF0Wi6qeHrpNMCRNwkpMhTF?=
 =?us-ascii?Q?iKS2Rfiv58zro/y2j63D4s+IagVJm1++G9yWUZb9/n5ohGuTso7u2KX+3urW?=
 =?us-ascii?Q?lzmlAWhdSoXGDtQ/R5M4qPt7ijLPZDdT/pVH0x/urKziXVdfADQUud4zJ1LH?=
 =?us-ascii?Q?n/KNOA8hgPtoNHJUuWji9qBh62LC/dUaxbKLzO2LE2k6mQRFuUXf9rj7OmFq?=
 =?us-ascii?Q?X859ihMVHAsiXvNmBglzBF7W+7V3cUasj5wvRviPid8nnZiZVfVGH810oRCp?=
 =?us-ascii?Q?M/UCV8A/MVoVsvTpMLnCyncmeL9/529a+yRFIaO5D5SogrgmdCOGflblhgQo?=
 =?us-ascii?Q?z+z0tPnZ5mmJVfQZHhYyKaGSvlOQ4SkicKMEYi210Rq3/f4acsIpLShZ9MIp?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d98b45-ae1f-4153-2689-08dc5b131fc7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 17:08:07.7042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbAZDWP0D90omZwfhO7NGwD3L420K7NcxPhOlr4gVumecxuVpF2VnmB+DinaxBqwBzBdAYxfRkWNKjnWhS53mCD04Mzi7PUlwe5LEmf02Ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7905
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

On Fri, Apr 12, 2024 at 05:39:20PM +0300, Jani Nikula wrote:
>On Fri, 12 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Fri, Apr 12, 2024 at 09:56:05AM +0300, Jani Nikula wrote:
>>>On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> Instead of keep adding more dependencies as WAs are needed in different
>>>> places of the driver, just add a rule with all the objects so the code
>>>> generation happens before anything else.
>>>
>>>What's "oob" and why is it used unexplained everywhere?
>>
>> from xe_wa.c kernel-doc:
>>
>>   * platform. There are some basic categories of workarounds, depending on
>>   * how/when they are applied:
>>
>>    ( ... )
>>   * - Other/OOB:  There are WAs that, due to their nature, cannot be applied from
>>   *   a central place. Those are peppered around the rest of the code, as needed.
>>   *   Workarounds related to the display IP are the main example.
>>
>> This can certainly be improved and the link to wa_oob.c made. But it's
>> not that it was not explained anywhere :)
>
>Yeah, but... what does OOB mean? Out-of-band?

yes, that's correct :)

Lucas De Marchi

>
>BR,
>Jani.
>
>-- 
>Jani Nikula, Intel
