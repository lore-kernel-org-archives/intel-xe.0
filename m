Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5438EC25B7C
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 11:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD59A10E202;
	Wed, 22 May 2024 11:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Qvk/jvVL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E16D10E2B2;
 Wed, 22 May 2024 11:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716378163; x=1747914163;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xrZLw17h28wgUpPGyn1Eev7m6mqYilGuRDOcILiBSXs=;
 b=Qvk/jvVL9xsImDB0EgNebiF0Fmkk4vFBf9C6wg1Wjo8M1RF/iAHH8yWJ
 xeD/MpTWNrDT37Usv1QudvD3iGa98WqQgdM4SyIAv4tXa6vpmDVdZmkF5
 nWJJ4zR+J+l10e147ZlCX3+z3Y9Y8DeUIUoOfqnEXQ26zM6d3zCx/6wPp
 95AgT/1jXRhbPdWrIEk3WJdi+GiUDZmxtNZExbL8mvSpfGSEOKv1GKtw3
 qAs7clMzuqFUQjDaKXJwoyh1puaDalOHojLekUIFIUBE296lYT8XkANSN
 EMfP7E6kudf8ebNH+e19fxv0MHfSULxkeUAbEhKNgCU8dVMhlXDMbYUCk w==;
X-CSE-ConnectionGUID: XBBVsSaxSBW87HHKeUp7qA==
X-CSE-MsgGUID: ARHxKvWLRF+yEHAKU6Hd/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16411796"
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="16411796"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 04:42:42 -0700
X-CSE-ConnectionGUID: ZJngNz6USrWDYugF30b9qA==
X-CSE-MsgGUID: 2OlvmZBfRFKWEPn06GdHFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,179,1712646000"; d="scan'208";a="56508386"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 04:42:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 04:42:40 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 04:42:40 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 04:42:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnSx0IOU3KFlxjh8qvCtaeAbr3fGg69NKkexqpLxca7AFTCAs+pPcf2pBrt/E5DFNfnhirt49jFB2ZrXbGvlFnpQpppfCF/Dt3jnctHI1YG85uLzlDuguTEBZxeSrs0jZPSyXVASQHHQG9C4eLiVsF/mLrugfvhWAO3YjRClKXUPqP3LxtWTEZes/ZBAKCJ643sjj5xzGP7ChTOY64/5zctc6f9/gLK6SJZGRGQu7i3mNOJl8GGDXDGfl9dxInDw3ZexVJYApxjULp9D3cXreyuf3x8XuLIkrFLUKwf24bWfKZ+jBP3ro44Xm01TL71LndXkrR38Sd76APP4jSvcZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfjHsfRh5icauo2ekXaHJEjLBtufz7iSdu8xT3x6QCY=;
 b=Nfvs2wRGl4qqkAZ+PIunU5sURWBwd/FNmtQkxMbU1A9AaE+Cuhh0qzxQxLDcX1vxy0ThqRZb+NdRtfdED9uI6snalgAT7ORqgDiA+nAb9aU+2PwGWogNFKjP9Ppju2qz86Qh1YLpnUcSYQHm8T0Y3fQX/jEsgVAyN/Z5hqDFJTS1CY1ewbnpvah/E66FyzjhEg5ZC+Fdv59ODYLCEpaghFLExdwHpyWie1icW2m3ZgfmHKZwGrM70DKNJ2djBxCZSQT6nbK67ExRWe8ap1qHB/N187Lv5eZV2jwHemois3C8OAqZeBGK16BqCFrkwqNSpzFWgZaJ/gZQVniAyzaXJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 11:42:38 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%3]) with mapi id 15.20.7587.030; Wed, 22 May 2024
 11:42:38 +0000
Date: Wed, 22 May 2024 11:42:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <intel-xe@lists.freedesktop.org>, <oak.zeng@intel.com>
Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Message-ID: <Zk3aEQd/2n/fuBXC@DUT025-TGLU.fm.intel.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <Zk3ZKogBOM/YVWq9@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Zk3ZKogBOM/YVWq9@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::24) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MN0PR11MB6303:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d797212-5ea8-4016-f142-08dc7a544812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R1xCigFdncHXZS6HliTBZjCy4KEdvGVGWEO2AaMfFxAuSCyxSGNj65svFikJ?=
 =?us-ascii?Q?2sBL4w2rLe+lanFWENrqTxC5xLn4ZSy6o2z267b+eUYjDu5kGd3nGZECdQso?=
 =?us-ascii?Q?NfPcjXgDiAX+owcFiWgLHv5KgQ+jRbNdOdxAtOJYCBpFW9+Q3pE56Q1ZaBtC?=
 =?us-ascii?Q?pHEptiaJaomYjd8wCsZltBGWbrJleI4UXc7/Ejt3yXvTMdQ6fujmEaAhKx42?=
 =?us-ascii?Q?YI7cnF3KjBMOWuPM/mV6P6651AhgBCSaOcUNvNYhanJzHchEMOW9/OQ1LWfv?=
 =?us-ascii?Q?6FGBxMBkCfbpfSp4FxPxwRczbjPB1CD2yhprn3BOHazahXQGj6B5BEukt2Eo?=
 =?us-ascii?Q?OQEK29pIk7dYrocly9XE7ZEMy93tHeAUXhz7yZvPT6Yx7IgpkYdFH9xnqwR/?=
 =?us-ascii?Q?fF/fMp2/d7I12mcIMcNZHKa/W+WKvLHrEeFExUkWM+TapAWGisGAcq01mlm1?=
 =?us-ascii?Q?9aiuRrACNfi6k4rqBrO8Kesjo4G5CYi5j33DauwW6om+IOFftXpJKDjuw1YX?=
 =?us-ascii?Q?SgHXAeIj4OCeUUrVayd0OdpnutNXe33R39Y3VE7lW3UCBXOM4QnzfzbwI8PN?=
 =?us-ascii?Q?L8YksmnAuCGP0QzS6kJP3RQVnLlRdIBcG6ER+dIjGYFqXskgZ4+I3WFSg2c6?=
 =?us-ascii?Q?c1Vxhfh4Jvq0W55MsJdl6xPg5ZlmjBZLd7NOlQzII5zHrX99OIJUNaRI2Y3b?=
 =?us-ascii?Q?R62RQNYcH9XEkbdnd8KONST7MddbvpdA2hZwhUX3yp1lnc3P3tHCwzNJGH+X?=
 =?us-ascii?Q?l7tUzgMych4VcOaMTX3XtgDMfx8osRIWPYiQrFEkJbknJwbnZ8tWpkUDnial?=
 =?us-ascii?Q?/C0KntHhBtb8KosA4pG6fkgGaGFswOQRX4/xs19dmFEtd/gmlJYp/Wy3lRng?=
 =?us-ascii?Q?RIPfsu4uMLOIsmx4rqaKKHhRjK+i1XLcBSW7ypQNnY86rBYo2gvg8yfT7iQZ?=
 =?us-ascii?Q?SpBYgC0Cy6cEicH6uv4WjIBPn+PJUQEqmhO0+6Faem9qCeVytM14Fyu/TKoJ?=
 =?us-ascii?Q?730f3uegyBYP5Wb2mmTVGFBDSRgkZO1A5sM65MP8//pLFvgk2NXJ4vQA74L4?=
 =?us-ascii?Q?/5QOEmdoCsiYH/qxmBEr4JfZ2uNKyBLf7WzBiFrrUfW7G0ixKpSDC2z/Lxxf?=
 =?us-ascii?Q?t2OO30liPQnQyK8WG7WugqR5kfWHAnC1ha5ypH4J+zjKZ9OClCE+4hCf2Unf?=
 =?us-ascii?Q?BdDXEdRghdey9KH+o8DXXh32IOQF+Q1kdE7BZ/4iPDCR7zlinjLBbr34AuE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jWBKNkIRqiyFEoL8aycabvk7f6Yg1aMQ8DnqK8TQ66zn/MUo8LUI2WNW/u6o?=
 =?us-ascii?Q?l2JqedPVf0wIydf17HQzxu9/ogYMz3c+ozQz/ax5uISmhwLAnw0EkKGbKEQE?=
 =?us-ascii?Q?b7skHa11jLjcux307UYA4s503LP0aurXvD2imzvgNcdgjeOKIQHQgfIAxY6g?=
 =?us-ascii?Q?WOzjl1xWvvQExzLv971fxemU5CUhohzLojLaEuBUqcQbmM3NoABw3SbJyMVQ?=
 =?us-ascii?Q?uWVOfKuHhSxkgG5WQR/wCViS98pDfWAjJgzt1WNAXP/xPOlfu6olkJtHsA2z?=
 =?us-ascii?Q?lAM0EZDVbUqG3iYUmcSep/SUHbMGxSxH3wki+U5n6xYOKteWKtKc88K4gSvw?=
 =?us-ascii?Q?cVKwz8cGFl9TpoouZ/NprUseOos9bx/ySE69I1U19BeA1VmZW8MXm4dkG5Gf?=
 =?us-ascii?Q?ATdFTWlfvXfNlGC2cceswvUmXrnGh3D1cKulL1F8P4ltJU+Wrm6ZcocKu9wt?=
 =?us-ascii?Q?AMMQWRKnQrc6aMj6PSeeCOwnlU8Q/JceQREtFxNVTNqYOB8dlRzEXGF4dScF?=
 =?us-ascii?Q?MWAC6kEs746D7d5dHaPp5BOJtERlhJYCckNT0vtPeNfh0LFK7R+sRekNpfW7?=
 =?us-ascii?Q?tGi4LiPgXixvdoeiNowyn/uDEbWYgYX+1IPujom/f23cRrdg3rRhbDOPyaxM?=
 =?us-ascii?Q?BHoOfpIfJguJj62Yo7/UaIbNSnGNVRG2HpNkHxEV2z2WTMEvq1ma8eiDR0UG?=
 =?us-ascii?Q?FDnolHuLZiXYdiAkpC8qLX98XBt84LlW+6+G3Qc/uUuKvtZjL0Q8TDFInCm/?=
 =?us-ascii?Q?S8udRP1auJondT25jEOQ6L5+A0Q5hqmZ8jYH/9G+MMFxvILNaPG/CnYIVAaa?=
 =?us-ascii?Q?gs7tV285tw/PEYCv7TNbZJb5aMEg4lEY76vi+U+bL+C8DzZCmkD+sWdhVw+q?=
 =?us-ascii?Q?0TXxCl5Fb+ksvqoYRolWFIXAkeGIdUjbX4LhwYVMe4kgApS1wGq3KCbmZp8O?=
 =?us-ascii?Q?YdHsHBfzuC6qBPmbmslkSitLYAj84RiOQVBM2QEWfuFHnjMXPSraGakU7KYQ?=
 =?us-ascii?Q?ciBp6MlxwGO0UosY2d4A2lSZcNWIBAtoHv687AuR1rsYMc4rHKSKuEy0DgjW?=
 =?us-ascii?Q?d97fuH3MdfLaJtjF9A/sz0mTG0zhOtqEC2HSweC8da5fnkttG6u0wg4PSiuY?=
 =?us-ascii?Q?Fhst477/FKljM3/78nA/0iIZaw0TNP8zy9e5qmCFJ/gdlPVpSLf8iBlgdKPA?=
 =?us-ascii?Q?OYNtLhlDAH0ZamnzOkZ+iQnXbeRh2wxV/KuNXSt1KbvdPXuYa8GhfH2TJ4Ke?=
 =?us-ascii?Q?JJwgVCmSogb4C//eoG7bvzavPGGdPFJsKF+loeBV0nUJz2hNs6L56BJ+49+I?=
 =?us-ascii?Q?Yrn2JO31sZZRYCjED1Pp1Ym+/wfmSI3ENaDD2DdBa8Q9Me09wLjZEmVhb+5v?=
 =?us-ascii?Q?3mVlQImq0PNePO04HlvThsONWY15QCfLO/mgzj3ipZuaPopQFmy5X+Zak9ml?=
 =?us-ascii?Q?I4yzdRNfi0cpjbgm7aplm2gJMbWDD8FKEGTFSBQt9iOcE4oS0q2uE1eitwvk?=
 =?us-ascii?Q?Aw6If32R71NPl3Fdcpg73xqJ/tp6kvXN7mnqUJjbPq5taTQSE0I9BeIqgLkA?=
 =?us-ascii?Q?uuHuoa1mePwMw5oltFXk6I/XpEmlPTMkwRADI6slz6PZ1wYNoouMQ+tGqwjV?=
 =?us-ascii?Q?pw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d797212-5ea8-4016-f142-08dc7a544812
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 11:42:38.5683 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6d9uXtGotIMmMlG4PtkDOHz7NWMkPSMnE2/V3LScZ+dgIwhofUghETp+MxjJc7FvOQL3pbk/DouZEqEA0bhaYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

On Wed, May 22, 2024 at 11:38:18AM +0000, Matthew Brost wrote:
> On Fri, May 17, 2024 at 05:16:48PM +0530, Bommu Krishnaiah wrote:
> > Introduce helper functions for object creation, binding, submission,
> > and destruction, applicable for SVM and other tests
> > 
> > xe-basic test is validating the helper function introduced in 'lib/xe/xe_util: helper function'
> > 
> > svm test cases:
> > svm-basic-malloc
> > svm-basic-mmap
> > svm-random-access
> > svm-huge-page
> > svm-atomic-access
> > svm-atomic-access
> > svm_invalid_va
> > svm-mprotect
> > svm-benchmark
> > svm-sparse-access
> > 
> 
> There's a lot here I dislike. Let me be direct.
> 
> Firstly, this isn't an SVM test; it explicitly binds userptrs and BOs. So using
> SVM prefixes in the test names doesn't make sense. And having RBs with those
> names makes even less sense. With that; This email is directed at EVERYONE
> replying to this series.
> 

Didn't send everyone, CCing interested parties.

> At a high level, I've expressed my views on generic helpers hindering the
> ability to create truly powerful tests that provide the necessary coverage for a
> complex driver. See my thoughts here [1] [2]. I don't see anything here that
> comes close to addressing my concerns. These tests are so simple they won't find
> any bugs in the KMD beyond the implementation being completely broken.
> 
> This is what I think an SVM test should look like [3] (for the record, I have
> shared an eariler baseline of this code too). While it has some complex coding
> patterns, once understood by a developer, it's quite easy to extend for a new
> test case. Let me give an example...
> 
> Take a look at this diff [4]. It's a few lines of code that add HUGE_TLB
> testing. This simple change spawns over 100 tests of various varieties (e.g., a
> single exec with HUGE_TLB, two execs, many execs, multi-threaded versions,
> multi-process versions, etc...).
> 
> Before change:
> ./build/tests/xe_exec_system_allocator --l | wc
>     938     938   32872
> 
> After change:
> ./build/tests/xe_exec_system_allocator --l | wc
>    1070    1070   37852
> 
> Being extendable like this ultimately reduces maintenance costs over time.
> 
> The test I've shared creates true coverage and is just a starting point. It will
> need to become more complex over time as the SVM uAPI grows.
> 
> I suggest investing the time to learn how the code I've shared works and develop
> within that framework. If the same level of coverage/extendability can be
> achieved with helpers, great. Anything less, in either area, I don't think is
> acceptable.
> 
> Matt
> 
> I can't find PW links for [1][2] so instead have shared the email thread subject
> lines. Everyone on this email was on those chains as well.
> 
> [1] [PATCH RFC i-g-t 0/2] helper function
> [2] [PATCH] lib/xe/xe_util: Creating the helper functions
> [3] https://patchwork.freedesktop.org/patch/594807/?series=133846&rev=1
> [4] https://pastebin.com/jUN5BwUy
>  
> > svm kernel implimentation:
> > https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
> > branch: origin/drm-xe-next-svm-unify-userptr
> > 
> > v2 igt patch: https://patchwork.freedesktop.org/series/133096/
> > 
> > Note: xe-basic test is validated without SVM. Remaining tests are not validated because the SVM driver code is still under development
> > 
> > Bommu Krishnaiah (10):
> >   lib/xe/xe_util: Introduce helper functions for buffer creation and
> >     command submission etc
> >   tests/intel/xe_svm: basic xe-basic test
> >   tests/intel/xe_svm: Add SVM basic tests using malloc and mmap
> >   tests/intel/xe_svm: add random access test for SVM
> >   tests/intel/xe_svm: add huge page access test for SVM
> >   tests/intel/xe_svm: Add support for GPU atomic access test for svm
> >   tests/intel/xe_svm: Add svm-invalid-va test to verify SVM
> >     functionality with invalid address access
> >   tests/intel/xe_svm: Add svm-benchmark test to measure SVM performance
> >     with a simple benchmark
> >   tests/intel/xe_svm: Add svm-mprotect test to verify SVM functionality
> >     with read-only memory access
> >   tests/intel/xe_svm: Add svm-sparse-access test to verify sparsely
> >     accessing two memory locations with SVM
> > 
> >  include/drm-uapi/xe_drm.h |   1 +
> >  lib/xe/xe_util.c          | 214 +++++++++++++++++
> >  lib/xe/xe_util.h          |  40 ++++
> >  tests/intel/xe_svm.c      | 476 ++++++++++++++++++++++++++++++++++++++
> >  tests/meson.build         |   1 +
> >  5 files changed, 732 insertions(+)
> >  create mode 100644 tests/intel/xe_svm.c
> > 
> > -- 
> > 2.25.1
> > 
