Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6215C25B75
	for <intel-xe@archiver.kernel.org>; Thu, 23 May 2024 17:28:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1CD10E13C;
	Thu, 23 May 2024 17:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cWD+RJI7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF38210E13C;
 Thu, 23 May 2024 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716485283; x=1748021283;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UQd5zwV/yJdYnhrXrvJGdGE46OwWU90dLDbMGUbSIKE=;
 b=cWD+RJI7QqyX+6p2VdXS5xLu+wPYsebaif2JKp70Bity0Ad+BPauY2i6
 cnQcpmGKb4Hx/uw4VxSf5w19G7aO/Ov/O3p2Z9Cy6ZYRM9tHa7TVo5p8k
 4jnbAmVU7xDai18DhmdberMP3EeXQTi/lYLs+rNYNBXtWBiyBP9Qyg1tx
 jkFybo2sPhZwJSnaH6c9kZlvhlRwEPeuHjG/XdLyqgUyKhoYcxJwdmMDo
 kbnkTy+9v3nYspJErid6pA3/3W3AAEDzdDzebTRp9eAoIWa1qfjrrfEU2
 qaCMQUeHS/Rd1eGsRtYFNazpdDbvgLTsNiQ4UVZmex4irfHWbjRhMTXa4 A==;
X-CSE-ConnectionGUID: NVHttmThR/Oog1cBC+a9vA==
X-CSE-MsgGUID: F7Lu9+f3TyqgkaYOxq5jIg==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12697884"
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="12697884"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 10:27:28 -0700
X-CSE-ConnectionGUID: phJ04gB3SpunEe9qpqSdBg==
X-CSE-MsgGUID: SaTMVdCTTJ22FpnKRqfkCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,183,1712646000"; d="scan'208";a="33804266"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 10:27:28 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 10:27:27 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 10:27:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 10:27:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j97XZCsj4S9c0KPBQEKwXj5JrU0gyhh5vPLwqm0qG/EBULqMYvJprF8OQiNz0F6TojMPRKuk0PaAPt07fyhV7YACEX0KCHHxKCBy8pReVqMn+fHMthSnm9NgY0lW4vlzhVHdnv9d1LdOEj+BkBr4S9uYwWom6X6ugV0VCGs/HUVRYZ+QNpUPO9JU7mF5YM91lQC12MSweKQN19XcLXIB5eznmQ5z9Ni2FKWCz9NBYUADhMI95od420/wLTKHitZs22lEzOKuP6rJvsl0AA7bIEU1Cgf5TQY241i8+0ndoTbLaQFZsEOz0Pw2pEBgzB3ZbyK4LxYBpNQSOshVPocY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DvkumoAvQ0V22FgLSpmltlgn0zuKCK1hxFS+t87CuLg=;
 b=PzreHxPb+bn1OoiS70JHAvHOQ09OJqxD2dGTt4XNiQ1/DBsNB9Q37J4Ygm+QAFfweLl6lycbsQXCvKamOEKpkMLZbbgi2CZ3cOHkT3xcXj6miqaL5+BpOnTl+P67a56/XhGLlFuUEBbnuVCBqW421K1gFGyIEsPthyV2JgkVSJ6JQOXMl44d6G8+mwVDklo6N6SsCTPy4ysyFBOtdGN/FEUwth6M65+1vPlCBouFcOSDcDptu1RV1nizWc00xZJugqznxELOdzSLITnxMny+rpvx1Y2Bm5os0dVtXfbm8cF2EIPcOeu5VChb4RP9G/b4WO3+D4tkxoljMZeie8vDyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA1PR11MB6734.namprd11.prod.outlook.com (2603:10b6:806:25d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Thu, 23 May
 2024 17:27:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Thu, 23 May 2024
 17:27:22 +0000
Date: Thu, 23 May 2024 17:26:59 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Message-ID: <Zk98Y11X/vDAzvH1@DUT025-TGLU.fm.intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <Zk3ZKogBOM/YVWq9@DUT025-TGLU.fm.intel.com>
 <Zk3aEQd/2n/fuBXC@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991921B29B701D3E9E0AE3592EB2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SA1PR11MB6991921B29B701D3E9E0AE3592EB2@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA1PR11MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: db88d4a9-4018-4961-dbd8-08dc7b4d9b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X0UEdiQ17a0ZGpVKykXSvu+Jr0HgR6aYTk20vGjMWJXd6BpB9oo66iuuyhoo?=
 =?us-ascii?Q?tYpQmKbX5l108anQ/KKzWspdT9DbVJttFdW7qyWAY4kPDJOp0gOCLhQzCa63?=
 =?us-ascii?Q?gp7OgrPV1HRqowbrFAv/LeHjdjxoA/jle1jwZK8uVIoWb7WamacgIcdyCOW9?=
 =?us-ascii?Q?dUflXFPE5W783DOUkJJmISQLBJeLI9x2nCdeMpx/z/bIPSIrl7pVHW8ulXRI?=
 =?us-ascii?Q?A+gJIb9p6qElW3e8lOQ3CGW5v8j2svETOJNNlkdfg3eAS44aewyb4EffDkOu?=
 =?us-ascii?Q?z/8Vif1pWRtzAqidvKTQj0xAuLjJBoxHxRMIs7+nL+i8aMFTXnl+w6DMTyql?=
 =?us-ascii?Q?TEsjwEBuMn+rROfZBbqVNUN6fjvL/EFZU7BM6pgSVQlDei28sRhm2i30u3ci?=
 =?us-ascii?Q?6DqZzkI0AcSJofA+wx8PXG+8QxtWIgemjv3SP/JXXkfmexUtZpJB+5b/Dj7q?=
 =?us-ascii?Q?d8qFuK9apcSOOhJw3BS3et9sp6Y/Cq6czSeEQLWR7R0mlDFz//tP9XlvTZhQ?=
 =?us-ascii?Q?oMsq8WHQR4sGVqWahqbAONS9q9iZpZsE7PfhR+SAnLfZAzxtpOl10rIppT72?=
 =?us-ascii?Q?9SKI/tt0htTDV1oU+HBhhWJMcp24msIbgOIn4G0b9vELMCkupBI0dFlDC5F2?=
 =?us-ascii?Q?3oNqzbQkOOXv37rx3fmmr/CVwVdTlaGDfzN92+DUuNyTrjgiSJpKtQ1sM0cY?=
 =?us-ascii?Q?qFY1ZoUQn6jLjxguSdQZFIf2PX+mUj5PiQOTooDCfyMD0iPMlvD9lI/PlSOt?=
 =?us-ascii?Q?Ltj6j5LkwFRjD8C7q3RsRkNVJNAyKxMbwsExX0eFfgK6PbYAknzQoIehDqX1?=
 =?us-ascii?Q?RbvPN5uRc29T2t1/9CzSnr3oyeQnKLrLULW6C5XFnWhZZgCImHLMFYJ+SeAk?=
 =?us-ascii?Q?N9buze0sOnsXe0T/MDE8uLIWT6832ckeOpaz+IkImEg/Vo3N5krYxGyGiB0+?=
 =?us-ascii?Q?FSrVqvlUdv8Q/Fz7re5y/8GmL6SAgAO1Oyb2+yu9d2E2kEbGz9QFLUE5U/qr?=
 =?us-ascii?Q?gi9cYsvVdqmUOlM426GWLcTOOVoWobule0ID5vn+uCJuPzOXWYYBFps/pIwX?=
 =?us-ascii?Q?XN9ThsdgX+jSjfo52tKS+QrcVp+PgjGsRFyWiSdcSsEJ9G3+kOd8iO5nbpXc?=
 =?us-ascii?Q?ybTxDYswXv9Z2D4UQzbkbXNaLYamh2OjOz64T/4z8SA1mzK3ywbNc+LXfkef?=
 =?us-ascii?Q?A8ggsOozH4njznPDliMIVIHq+bYB7C6tWKUKnag/NdmJivjguz6QkbpVucs?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IplrD6VjhRJLfBXqcCXOoHfvM7EWcQSVSbEvvm/EgV2hIJ1ZwDQdXUs6vB5Y?=
 =?us-ascii?Q?UUQvQ2t3XR9jOE7/ODfZkroaEyIwUxMzSIBVGzItunBjwQRRsBGLnZk3jEnZ?=
 =?us-ascii?Q?s7k2ASd/RNqMuDcucS4lNUm7nchg4P1GW8ZnUXGa+rs/46ekrgVW4q0k1dUB?=
 =?us-ascii?Q?nFQwAbY73xM09+KlcoZ9E7BqNgxCyuKitermMLJMG6lSQ1OFj0nhzQucaopX?=
 =?us-ascii?Q?G4Yq9f29HJ3sZyCdzHZOJKeYJaBuK3SXLvrodmg1rDQwN5RybFqI/WUPAe59?=
 =?us-ascii?Q?X7YZKANRYxbJ6EZp03qUn8ehNDZfrEsT64+1Qv4OU7J664XnzsHmR51xNHyM?=
 =?us-ascii?Q?CxkvOWys8GjSuyVZNwZEF5HMSKmIlNtSvC0Zpex1Vb3cAfpbYTXZTxmpuCjd?=
 =?us-ascii?Q?qtQhfiZ0GLLW+ul33kz/o1ZVMwds37f0UIHAF9Dev3utoWbM6XjVhf4a2F/D?=
 =?us-ascii?Q?PCu4X22RlplUqB0YQRBiwQD/RqbZLXHUi/hC2Cac+iqDwrIF4MKrFIRlGyVI?=
 =?us-ascii?Q?61Xm/QGuxCRxciY9KdDjmnnPDSDkEqFFKNn4LvBkTlz5w8kJoCVaXP2es55B?=
 =?us-ascii?Q?rHTOuepnD6Q6UdyoX7EM+X/s0cfUZ0hnlPfu99r+lWP1YbuBYNNbmi9mQ3TU?=
 =?us-ascii?Q?v83dtnx3/APzqCocHf4RgFwxJTxYGoXYR9kPJEu97DvaGEPy14qz8Bh5mjKG?=
 =?us-ascii?Q?AcWQ3i2oAJruNvkWvqpeipmYkteXMr3K7NkCM/keYTvgfg9VE+Z2FjrczqtZ?=
 =?us-ascii?Q?hJicJ/7Lfs1HQQkgWwFIFexfVlWktQPrXUCv8EqxyH/GaQqNSdB1kn8aPbmw?=
 =?us-ascii?Q?uL5kFzKAFZirN4JH2BKg2gj8W2nClFnYEb4ravLaqF6HaC/JepWENWIZtmcF?=
 =?us-ascii?Q?xSFpuSNgqKnn3uCWTwQAOxTCXCuy6NxvJWST/cmte9cjZWG0NAbqdkxHoRWR?=
 =?us-ascii?Q?YisWkfXBHz38lAilrToQ7++GEPip6bqZmqeYo6p4zxUJ1LIsw2XzYJLbLbUf?=
 =?us-ascii?Q?eB+jZIz73lYW/6XLUcK9RaGIC+2p7yCajVGmR3VBRgV9nwrRA8ZqB/1QZIB8?=
 =?us-ascii?Q?eu1VMBVn8X74WHNfISv83yyxa4npZP+sqUcOxZXzvDM+hPanezSqlTUUmdLN?=
 =?us-ascii?Q?boZMqrGYo8VdU/5vqa+EfEZA/MOK2ld+FihFaUPPSf9G71wBDJ3GbUnJ6/RI?=
 =?us-ascii?Q?ezsu6P7K5wUWlcJuNJf8okzE1qPOS9at4jKtppi7Ytg3NvDEE5aZdeqxc34k?=
 =?us-ascii?Q?S7kkksH8XaIhfmF37BXCiofaG2uc2ogtdZ5nLJxOB44/CHyNfRZCr3aPsqB1?=
 =?us-ascii?Q?suYULRUV5YlwctB6wXPAxGYPyjF1L3a39Pt6QSZ9z0m6x/EE4RQPoDdtM1RN?=
 =?us-ascii?Q?TnQBVmnQN3AE3Xhtnjx/CAACQs/0XYEZ9VUhgNRG7DNt6CAog3U1XAcYbWvj?=
 =?us-ascii?Q?LtQkxwr7N9dqgAd5Z5SGbDbRFPoP4a2V9dm0baM0Lp+ednVIWzCvsZ9Hqnqa?=
 =?us-ascii?Q?zkCzzkMlMDUOD0wPJz007P+KhHYjkEF70bv7n54pzO/OMir40oAAFARvrPss?=
 =?us-ascii?Q?8SxalHjSHDe6Pbrk+cYBt522IiP8d1ikIkWwIBZ2Bda/cqBmdlAuOTvxhkTm?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db88d4a9-4018-4961-dbd8-08dc7b4d9b06
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 17:27:22.5278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jf06WGihtzERa9NFe3XaSinb+eL8SU3UG+HqhVgjxsgTDMaFmVcEdcDT4buQXyQkxON0Sl5i0pRcwn5nd82bQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6734
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

On Wed, May 22, 2024 at 10:53:05AM -0600, Zeng, Oak wrote:
> Hi Matt,
> 
> We will investigate your tests and see whether we can achieve the same coverage with our approach.
> 
> See also comments inline.
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, May 22, 2024 7:42 AM
> > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Brost, Matthew
> > <matthew.brost@intel.com>; intel-xe@lists.freedesktop.org; Zeng, Oak
> > <oak.zeng@intel.com>
> > Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
> > Virtual Memory (SVM)
> > 
> > On Wed, May 22, 2024 at 11:38:18AM +0000, Matthew Brost wrote:
> > > On Fri, May 17, 2024 at 05:16:48PM +0530, Bommu Krishnaiah wrote:
> > > > Introduce helper functions for object creation, binding, submission,
> > > > and destruction, applicable for SVM and other tests
> > > >
> > > > xe-basic test is validating the helper function introduced in 'lib/xe/xe_util:
> > helper function'
> > > >
> > > > svm test cases:
> > > > svm-basic-malloc
> > > > svm-basic-mmap
> > > > svm-random-access
> > > > svm-huge-page
> > > > svm-atomic-access
> > > > svm-atomic-access
> > > > svm_invalid_va
> > > > svm-mprotect
> > > > svm-benchmark
> > > > svm-sparse-access
> > > >
> > >
> > > There's a lot here I dislike. Let me be direct.
> > >
> > > Firstly, this isn't an SVM test; it explicitly binds userptrs and BOs. So using
> > > SVM prefixes in the test names doesn't make sense. 
> 
> It is SVM test. Those test use BO for command (batch) buffer. But the buffer GPU read/write is malloc'ed or mmap'ed. So it does test SVM/system allocator functionality.
> 

I did miss that read/write addresses are malloc'd or mmap'd.

However, I don't see a huge bind anywhere in the series. Buffer Objects
(BOs) are only unmapped, not returned to the system allocator bindings,
creating holes in the system allocator space. Additionally, BO addresses
are statically assigned, which does not align with the system allocator
design of calling malloc to reserve address space. This was the source
of my confusion.

> Malloc'ed and mmap'ed memory can also be used for command buffer. We can add a test case. 
> 
> 
> And having RBs with
> > those
> > > names makes even less sense. With that; This email is directed at
> > EVERYONE
> > > replying to this series.
> > >
> > 
> > Didn't send everyone, CCing interested parties.
> > 
> > > At a high level, I've expressed my views on generic helpers hindering the
> > > ability to create truly powerful tests that provide the necessary coverage
> > for a
> > > complex driver. See my thoughts here [1] [2]. I don't see anything here
> > that
> > > comes close to addressing my concerns. 
> 
> I replied again to [1] with more details. Please take a look.
> 
> 
> These tests are so simple they
> > won't find
> > > any bugs in the KMD beyond the implementation being completely broken.
> > >
> 
> Agree those tests in this series are simple. But this is just a start. We plan to do more complex tests which are documented in https://jira.devtools.intel.com/browse/VLK-59767
> 

So we agree that my concerns raised in [1] [2] about only being able to
build simple tests with this design were not addressed.

Having plans is not the same as addressing concerns. If you believe you
can build complex tests achieving good coverage using this design,
great. Please post that. Until then, I remain unconvinced.

I briefly read the Jira; a lot of it is covered by the code shared. What
is not can likely be added in a similar way to the HUGE_TLB example I
shared in the previous email.

One thing I noticed in Jira is that it's written basically as unit tests
(e.g., test feature A, test feature B). Unit tests are okay, but truly
powerful tests do a lot of things all at the same time, in parallel.
This is the advantage of the style of tests I write. Six lines of code
in my example (data path code, that is; tables and documents added more)
spawned over 100 tests doing this in the aforementioned way.

> We will also look at your series to see whether we can have the same coverage.
>
> 
> > > This is what I think an SVM test should look like [3] (for the record, I have
> > > shared an eariler baseline of this code too). While it has some complex
> > coding
> > > patterns, once understood by a developer, it's quite easy to extend for a
> > new
> > > test case. Let me give an example...
> > >
> > > Take a look at this diff [4]. It's a few lines of code that add HUGE_TLB
> > > testing. This simple change spawns over 100 tests of various varieties (e.g.,
> > a
> > > single exec with HUGE_TLB, two execs, many execs, multi-threaded
> > versions,
> > > multi-process versions, etc...).
> > >
> > > Before change:
> > > ./build/tests/xe_exec_system_allocator --l | wc
> > >     938     938   32872
> > >
> > > After change:
> > > ./build/tests/xe_exec_system_allocator --l | wc
> > >    1070    1070   37852
> > >
> > > Being extendable like this ultimately reduces maintenance costs over time.
> > >
> > > The test I've shared creates true coverage and is just a starting point. It will
> > > need to become more complex over time as the SVM uAPI grows.
> > >
> > > I suggest investing the time to learn how the code I've shared works and
> > develop
> > > within that framework. If the same level of coverage/extendability can be
> > > achieved with helpers, great. Anything less, in either area, I don't think is
> > > acceptable.
> 
> There are two fundamental design difference b/t your approach and the approach we applied here:
> 
> 1) Whether to create/use helper functions:
> 
> Our helper functions created concept of xe-buffer, xe-command-buffer. I still think with helper functions, we can simply test writing.
> 
> 2) use one big test to test many functionalities vs many small tests, each test one functionality
> 
> It is obvious, our approach is much easier to maintain and understand.
>

This is an opinion, disrespectful, and rude.

I've provided a concrete example of how the style of tests I've written
in Xe are quite powerful in this email thread. In my opinion, it has
been responded to with speculative arguments and opinions rather than
code.

I have very, very valid reasons for being concerned about testing. This
series [5] was posted in a completely non-functional, untested state. As
reminding and to record this publicly, this was developed off a basline
which was tested with userptr SVM faulting working. I provided the
working baseline and a flavor of the test I have shared.

Going from a tested working KMD with an IGT to untested broken KMD
plus a promise of 'obvious, our approach is much easier to maintain and
understand', well I'll let everyone decide how that looks.

[5] https://patchwork.freedesktop.org/series/132229/

> So the key is, whether we can achieve the same coverage as your series. As said, we will take a closer look of your series and give it a try.
>

I highly suggest you study the code that I shared.

Matt

> Oak
> 
> > >
> > > Matt
> > >
> > > I can't find PW links for [1][2] so instead have shared the email thread
> > subject
> > > lines. Everyone on this email was on those chains as well.
> > >
> > > [1] [PATCH RFC i-g-t 0/2] helper function
> > > [2] [PATCH] lib/xe/xe_util: Creating the helper functions
> > > [3]
> > https://patchwork.freedesktop.org/patch/594807/?series=133846&rev=1
> > > [4] https://pastebin.com/jUN5BwUy
> > >
> > > > svm kernel implimentation:
> > > > https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
> > > > branch: origin/drm-xe-next-svm-unify-userptr
> > > >
> > > > v2 igt patch: https://patchwork.freedesktop.org/series/133096/
> > > >
> > > > Note: xe-basic test is validated without SVM. Remaining tests are not
> > validated because the SVM driver code is still under development
> > > >
> > > > Bommu Krishnaiah (10):
> > > >   lib/xe/xe_util: Introduce helper functions for buffer creation and
> > > >     command submission etc
> > > >   tests/intel/xe_svm: basic xe-basic test
> > > >   tests/intel/xe_svm: Add SVM basic tests using malloc and mmap
> > > >   tests/intel/xe_svm: add random access test for SVM
> > > >   tests/intel/xe_svm: add huge page access test for SVM
> > > >   tests/intel/xe_svm: Add support for GPU atomic access test for svm
> > > >   tests/intel/xe_svm: Add svm-invalid-va test to verify SVM
> > > >     functionality with invalid address access
> > > >   tests/intel/xe_svm: Add svm-benchmark test to measure SVM
> > performance
> > > >     with a simple benchmark
> > > >   tests/intel/xe_svm: Add svm-mprotect test to verify SVM functionality
> > > >     with read-only memory access
> > > >   tests/intel/xe_svm: Add svm-sparse-access test to verify sparsely
> > > >     accessing two memory locations with SVM
> > > >
> > > >  include/drm-uapi/xe_drm.h |   1 +
> > > >  lib/xe/xe_util.c          | 214 +++++++++++++++++
> > > >  lib/xe/xe_util.h          |  40 ++++
> > > >  tests/intel/xe_svm.c      | 476
> > ++++++++++++++++++++++++++++++++++++++
> > > >  tests/meson.build         |   1 +
> > > >  5 files changed, 732 insertions(+)
> > > >  create mode 100644 tests/intel/xe_svm.c
> > > >
> > > > --
> > > > 2.25.1
> > > >
