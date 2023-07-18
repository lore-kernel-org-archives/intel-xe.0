Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAD5EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 19:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBC910E04F;
	Tue, 18 Jul 2023 19:41:11 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B209210E04F
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689709269; x=1721245269;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ceACYm/RKVSieL2LJ5wuTYjKlN6iktGKbk+X8DtLQjQ=;
 b=S8vWaLV0sX9LdD0hzN1uRpAop/yEFmqBrA3XLi76hxgwbha8l7GAAw0Q
 w1I5yxYXQUhSm1TqZ89kbN5usLkQvOd/M/O8vae81MmBiFbLfKf+K7hkt
 yx0+DiTTVMlMbZoHHH9EzSfulQ/o8TUQ8XUfWIviWw+mCrhRoo3pAO4JA
 0Qwut/j6iFJMxWZjj7A8CKPEOlPYxfbOmuAirve7jHrDaWAWb5n3OChig
 hVdex/bzHWUch1lpeWwiNSzUUuWabyd/stDV/5LlBqjaNE8mI8jzoFVqF
 hXDn1LFKlJlfTjbEt07ayVxGINYhX6GNK6DoXwAMOzHE/FfzOJ3KXTwYr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="351168276"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="351168276"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 12:41:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="1054423280"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; d="scan'208";a="1054423280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 18 Jul 2023 12:41:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:41:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 12:41:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 12:41:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 12:41:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRFyVkA3BRctPzPYD529lCgi2AEJr77SmGvosVVvU0qevIoMiRkg1EMpMUjMLffYo1nqW7nk7fNN1MnOyWa0su/pATqrgBjauL+/CZvsKnGu2hD0+r3BKEnXSuD7ewQtjKm1GxwZK9NOIv/em8gO30ca+3T8nfaXkoHcJE5edd7fSgS3pPMpw0IPKZvKOoNwRBlMBq/LGwosZ48LBqAWo5PjCb/CvNLm+uqOAE24nHKvs9pnN4JP1L/4q6aUTyvXKsfBMthXFhL+kd0894pC8jfY/Ry0X/1u25cINTvCr1t3JHZ9zR2r9vRxXoGJTQjHJyVDFP8OTrH8CcGhYmOQOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceACYm/RKVSieL2LJ5wuTYjKlN6iktGKbk+X8DtLQjQ=;
 b=ftRlx8/pUgpnOAVJGeQ61xeWcSLI24XYfi1Qce2vyGtpWcMa5RR/wKA1MumeAxppxNilcjXEalB3TyvO03nG1Md0XdNwZSolGoziEOEIzgPUTUAbrZi2dKHI8Jsa1OZWAYbDvDiK7zdE0KjnQsTRaZpyeZC1XdJjeX8FZViHpA3daHsjsOWDqXHwlcMS0oiQWzPshfdQtD7cP6IxMNGZEwigQClK+QSQbOymja9gZNe/PJ8+U/Y71U1vvNu3EjF9C1tuhLHqrglz1CeVw0QEZJ3sXhUxHF3EPsexRa1YKvE8PH23S1nq086mxL4bsBVslOiV7hffU0BfmE+sGLD16g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 19:41:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::3294:2cf2:e022:7164%7]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 19:40:59 +0000
Date: Tue, 18 Jul 2023 16:40:54 -0300
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Message-ID: <th3wumia6vpg65ptceih63reniz34o5daelzpspa2hm2cd6kso@mztfwqjozeci>
References: <20230718193118.8-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230718193118.8-1-francois.dugast@intel.com>
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: 5847e76f-0843-4c55-5df8-08db87c6e980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NlsVHDvOE+zPkMk5CfX/IPmJ3SfT/cn3TW6DHfrjovyCBtZRe5YkmIJpaMG3d4LU4fB+aJitdrAB1SBDQ/hCZ71S6LGeeXykK0INuXgJ8imQf+umsahF2RDy3okh6yyqLVSisaKyKUELXB63cxdQ7Arg1ZZyvOrFOrGJKfSX7PvxISi0PPmrEoaMa8e3Qi1NV+sJY6pXOlhMveL5eaQ61ibsHngJGEQ4z2srE+3YTw2lWDJ9ssa1SpoAbPaBPGHR7T+G6WspI/abr7cEhZvLlE/UX4fbGCCx9vzLQYtz9ucTODjHMUhXLsn6+8JGMcX5nZxmdhPXJqgbDloBANpjsSnUW/cW24xwCjd7OQcuJZ6o6VYGcScQfdooM9NaZQboIfF6+3k1qxmXHniVH/w4i/eefaqtIJoZhKhC4Jxn+zAK2viA6mKqXY/wEf/hEYYooaq4fPSdkyJ8JBqtKLFD74oYH6F6ZlOPLnjZNfmd6JDAcU2lJZN8W5v0tVK8CVqbI5ajvqXXuFGW14gVX4Mon9al/M2KzTckp1wzQ5673JpISdMnrlslJ9P6byAASECJG0fo7S8sWnqmo/3roPd3h72BAZqcqepoomjyBLjuOQs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199021)(558084003)(2906002)(33716001)(6512007)(9686003)(38100700002)(82960400001)(8936002)(86362001)(26005)(186003)(6506007)(5660300002)(6862004)(6636002)(478600001)(6486002)(6666004)(66946007)(41300700001)(66476007)(4326008)(66556008)(316002)(8676002)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vihn11yec1FEFeyaAGFEr+2h4w2YHy3coYcojwaU7DI7C9FCTpVent03XIU5?=
 =?us-ascii?Q?4srzIHsWG5eObAPD1fvtGtGoBWhEtxF+s8FmbqPeIOMd5LIq/3fu6auVUw8z?=
 =?us-ascii?Q?EYMc1/JyU9Y8h5ADTkRYC31kCJtNiBuVVFVUmJPsKEYGWJb328mwGHARwYhJ?=
 =?us-ascii?Q?kJ8ZuVUo8vvQSmGEJehAlc4K4NZIyRSv6qpWS6rbqkNBVIHVSA1OWonXHm19?=
 =?us-ascii?Q?6o0whsueA540q+aIHDKUflAZimUIRPtbCSw6CyqRHfpZokDHh5DBEWGIDL4K?=
 =?us-ascii?Q?hPWyrSt2WAs4H8SlZduMhtGECnyhkgg0GzmyEmU7gUndeO4j/xxUrM2VZ6Sv?=
 =?us-ascii?Q?XIMSvh/NUFhmndo0Bz+Gf8ZV35G+L44S1eG92Ryt8Hcwgsk2ojLEVtJY5Ifj?=
 =?us-ascii?Q?OlnljRbT9AVtmAUx5I0heVPJ11jeEKfcycOtQ0QQc715BzO69C7PxgyLTIjc?=
 =?us-ascii?Q?mNKqTzslgRdBS8SGrAZFc7vX8cYeGUalLunVa/lKf36jGN91+Em8+bA4srZ6?=
 =?us-ascii?Q?W0P6718iPnWrf5bNKCpy0dyXw4wTdOg+/W/nFAbVuEh096aiFnjMC3z47qIF?=
 =?us-ascii?Q?2z50nyEYubSpcs9I99DP/oiJN17aKOqwuirgXcqGjWMgLNUG9obTsUsgHTjO?=
 =?us-ascii?Q?B6wRizXJlmrlveo2xJBRrNS9MHblQQPfNH/ZRXkGUwY4c/TBaUiUUYE8LWx3?=
 =?us-ascii?Q?aPs+AhmQP5ZhuZDCEkNNECDcXf5GiqTJBeLEw3t1B+lYekAovGutLkHDAO7X?=
 =?us-ascii?Q?kQtGa0v/EBq68KpqCqYHq085UrMfX6WP1dVg1Fkx7cYkUf1A3IVQSqQZIopc?=
 =?us-ascii?Q?Qv2z9aJxa/aqAOWgYxm+5AziBrDG5kPMYFMKsYzw1STmp5ztFpea5oQePhJe?=
 =?us-ascii?Q?NWFQE4s5P97gJiQ+0BtirQtnMyIj9iG3ey413QAIk/yKfbEBUms5sNZtUfBT?=
 =?us-ascii?Q?OeTZDQwuyoJhbiNk9g2s0dSJNKqrOrjgYYsAdYBCmadKGUmfXXltlu3DZZ6R?=
 =?us-ascii?Q?MkwF9Ektf8fRI7ghtjMiSZRpepiXW2M7rL58q5CZHcQwKx7P22bWHroFpWu1?=
 =?us-ascii?Q?M35NGUJce/PAiIJQ02ATn/hlyfeiIZ9MdkgSLShIoJ9suO9ljXRY3JjBcbav?=
 =?us-ascii?Q?ixWWLvcfPLBVuZYeevxjZ8fELpqZ3z0wwdxZ2yiLtUsgkKN0HtzhpWy0i35G?=
 =?us-ascii?Q?X28rJjnFuQ6bRzaSDCEsrB3kLym+MYR0DA+wW5kk1UnhLXr+6PlVFQxPjXgc?=
 =?us-ascii?Q?RZid6RFu4xA4jwEpBWmglLT4Xn/acGA/KEj8ezzza3IyYEPVRsVCPP7xrDhq?=
 =?us-ascii?Q?rrZ/R4MpBNUVIEW7ufxF4oDYW7OXVJf3fudwI+f4laMHHl1Dj6QY+ECNTAng?=
 =?us-ascii?Q?qlQk8ELlri/bc5Tr+v6PlBIGPMDC91jVkL77amm8fQD8NI8onwgfyoofnj+q?=
 =?us-ascii?Q?v3x1TVSKcs2rCylr+KkdvuBRQ6Vs2yPLjNh7Exufm32pS8I6rpQ13nr1IYD8?=
 =?us-ascii?Q?DHSupE98Qtm5+ojHM0xX/5EMhfKKBGFXBWFHDmhzNlSo7a5JTTi7PLXw+TlD?=
 =?us-ascii?Q?IWbdoZwp+W1/D6TSZr47fLpUiJ9MCyHUTGepH2iKLHii8iesuVRqRFM6HZOW?=
 =?us-ascii?Q?ug=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5847e76f-0843-4c55-5df8-08db87c6e980
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 19:40:59.6541 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FOQiDkIFY1pbKeTVIgo/tp/q5JMqiQWcrMIzibrE8ClVCiLe00WNYGKMBqe8+i6o2cGk9AwN4Hi7yhV+SWneIqsY5wW+xk3fE7XA1dmwu/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] fixup! drm/xe: Cleanup style warnings
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 07:31:18PM +0000, Francois Dugast wrote:
>Bring the comments to their usual places to make code more
>readable. (Lucas De Marchi)
>
>Signed-off-by: Francois Dugast <francois.dugast@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
