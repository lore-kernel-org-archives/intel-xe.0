Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A06D0EE13
	for <intel-xe@archiver.kernel.org>; Tue, 25 Nov 2025 18:14:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ECAA10E411;
	Tue, 25 Nov 2025 18:14:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2GDgd8f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B70910E411
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Nov 2025 18:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764094466; x=1795630466;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xTop8MNPw1B/GQG/aat85ccus/Zd8VewJmOIpkOIq3A=;
 b=j2GDgd8faqk6qpCq3k8dR/F+egrUX7zILpy4kmacNbftocqTitK0jC9L
 dfig9jEziWqn4sD0sSbFqHMFkKJ5IINJqyZbyyl7aDQP7UgIbMEsncySY
 6eGRMiKfAX2hRr75XqLueXlnx3NB3TUmBuZpwqj+rDYExKdOfnON09clt
 WemKyE4SzWKNNA6SUs09CtOEBMv2LHmOMzMlNbv4fYPI3HoZF+bUyz8Zh
 KsTTA6kam1EdZYyv5nHDibCxCie8CxPX+0L1H9XSz+2u6DtUM8GQmh/88
 pFGEEUOOscXCN7hoLcU+V4H4JI2FQGyXOPYtFLA5tlcjiKJ7hwgXLKCdx g==;
X-CSE-ConnectionGUID: AtYJIuuTTxqMvMbpOoa5Cw==
X-CSE-MsgGUID: gMPi0OqFQVK2fddIvGwnNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66010063"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="66010063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:14:26 -0800
X-CSE-ConnectionGUID: 96YLxe7RTT6cNKuopEUEOg==
X-CSE-MsgGUID: O+h4kG7MReOF+MYtXuw33Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; d="scan'208";a="191962237"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 10:14:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:14:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 10:14:24 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.53) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 10:14:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEXVoYfoAPBs4wy6ULqsh7ZjpaDcvvPU/6ds9H7xXmdB0yAiwBXS7GT1tX2dW7k8oAsQo0MzicgD7OJ5rBaB03DpwTOzHvKILL/oYR+GJ0OHC4ZCG4GcrQFIazlYH4OWlyOY3oCworOQg8UwexZGbUvPdrTgnRuQJrCVppHpdDyAbKRklPICi6DpMpO/5qunLQsy29ZsSUQdN7sQOF+RNjoBb/GXBkXxOC++Vak7DuwRR1fDLeu7/Y0abBK5DzFrcEHXksUoXvnIWPFjia47lgl/XpEUGfvihjOAeUc0nYPwNvTa8C46CkDVKGTmui+j/q4qGPAwHAw3ddoa7H/4ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I21TLDuL2To61uq6N/uDFimgvBX/YRQ8AckzNR5Lyng=;
 b=g3QLCJvJvnB2E1AEb+qEYoTTCX1/zsAre1PcEchAz8il2pT4eci1bxlyuQsq6DWO6vKU+5kVakysz6uKFFd5q9ksjexcu4ra07nAEB6X2fZ1X01zS1OKXXoGSefgqr9KM+BQ03xOdAXYcCrHrLQSurvx2X8BFOcUzC606UmoHO1Sq7G2lMMrASspjkpLBTKeng2I8FcooQ3Ce7P9hnCThpotkxLpPT59esie2xQrUqxwc1YOjWa+Q+07t7gZ2xWMI+HSeMjY4MegIP7CeAyzPOumMIiA5LTFfi64gM1oTfO3yl3pGtns1IYtMPALIRFTWcPzlqNaZ1Lh1MBz2GsqAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7458.namprd11.prod.outlook.com (2603:10b6:8:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 18:14:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 18:14:22 +0000
Date: Tue, 25 Nov 2025 10:14:19 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?iso-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 1/5] drm/xe: Add helper to extend CPU-mirrored VMA
 range for merge
Message-ID: <aSXx+6SmsF2/elKa@lstrano-desk.jf.intel.com>
References: <20251125075628.1182481-1-himal.prasad.ghimiray@intel.com>
 <20251125075628.1182481-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125075628.1182481-2-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR03CA0121.namprd03.prod.outlook.com
 (2603:10b6:303:8c::6) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: e5466264-2b08-4268-987c-08de2c4e7534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?mvPlCoAlg82Tt9kTIkMCcAG8696AHHPHQ6ll6SYrqwrAzoVsKgttIdCB9l?=
 =?iso-8859-1?Q?MKScdy8RtowGAOJcWJY/Qoj/IN2ABp7XWTBWdX5/aG4/kbU6q62RE+YFdq?=
 =?iso-8859-1?Q?QBHNFFiS7IMDn0G7RT37QZlPRAr8Us1xbl5cmClYoFgabxuSOLhSxCRCwe?=
 =?iso-8859-1?Q?JnsR+7MKhKMXwokIHsFhewGZ8lcu/wCUKczhSYEtyAXfkhHJu8WchypoQU?=
 =?iso-8859-1?Q?dUFad7UDDDYnhAD67u1isDbkJQBJiiE8v6wqZSo2lPRz+SFdAH6UUv3eBS?=
 =?iso-8859-1?Q?w8F//45Qyp4CVFVOyQvqrRLl/gLbkS8rxnMp4y/mLbrdp92uBlZdaL5AQZ?=
 =?iso-8859-1?Q?6KpZHh8MhS2be73ww1sxV7+hhDhhZ2z67ycLPAKOix1lFRkXtsjyNtiFGV?=
 =?iso-8859-1?Q?CvNGMzzAaVR7Z0azjw4n5bhy1Qz5H/gEow25PgmJREbULJOEbmtSSGhoh/?=
 =?iso-8859-1?Q?1docUpXnNI5b2WBz8eIzAplACQex513HfAyHfEgzoEw3UJWDlNo0jA2DVX?=
 =?iso-8859-1?Q?P862KtBxTPocPqdwUivZfwXydsMrtPQYnXQZMl5BDOOyn9Js0ibjCGmARZ?=
 =?iso-8859-1?Q?Svf5Rwe/Jwg33SP06gC48/s0Exl3jMdl9XergaPBsHqFMoDOIH4ryxAa7L?=
 =?iso-8859-1?Q?eA6abbSNDQ/7HAV7art9cVQoVxUGMvkCrwWfUxUhLjxiyelL+K1ybCDKf5?=
 =?iso-8859-1?Q?lxYX4SPpRcpI1qo9SS4tWmFP7rfzgxugsMF3MjOk37nsJchPzEJBqFwNQN?=
 =?iso-8859-1?Q?0xIzvmpnBUic1ca/sRq02XXSZTdkWLdESbeqkoQu5WFteLYQgQo3KZatul?=
 =?iso-8859-1?Q?za4H7WRPGM1mJv2np525t6+2AYy+n9U3eJKAJev71CydPvaK5wh9Clh4BL?=
 =?iso-8859-1?Q?EzJAcaH7netEmqFps0KfZxuPjvRfa+kl6xeZVOgz1w992CBx2zJuQE/9Mo?=
 =?iso-8859-1?Q?5E7WxOclPUQbyXf3iAuDW1Pe29eWD9sBSf8XYdEIJV75h08rLgo10RlkYh?=
 =?iso-8859-1?Q?ovYH44rzGMPv2eHyRGUOQYVIl4WYsuq8i6LZ3WTvg8p+bGzjgR3aml+NNL?=
 =?iso-8859-1?Q?cBJqqYPsuE18zX6VoO10AIeAgMyRHvnwnW/z6Fr0BIU2yvFAk2nCZMQqoI?=
 =?iso-8859-1?Q?Tn4tPT9JAGDuYXdovMUOwh4HTNR3sSWHWT2yMITgZVGYf6n9YYFof1u4lQ?=
 =?iso-8859-1?Q?WIzoh4732jkmmhj+pkEZPi3d+Wub0ln7nYHrhbM8iYIn56EcNwWygPUE/1?=
 =?iso-8859-1?Q?3oOXtQ1j+pWlUXrmXOKRb5wPy2S4Ll00vpLXZJLZK/VwNqpEX7vKNEQg0j?=
 =?iso-8859-1?Q?Vj91+7dF5TXkH/bJoZZ3vbP701NZi503RsIzTXxG7xvQMqEOkeHurhn5dB?=
 =?iso-8859-1?Q?m8rZn+gGmYHe4GLoYV4rPXbc+Ne0nHuyPn0tPOwr303h1iv5m6grZmkakH?=
 =?iso-8859-1?Q?+kuT0ekQiDm9x0em98mQaKZlEjmdPEiumPRV0oWyJhs26t8V2P0TC2I37q?=
 =?iso-8859-1?Q?iUilSocWyFhsQCDcRzE0UX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?I31w/4GIcT+PHko5o+PVJ9korKdFRyYr2oEmLuAG0ZjWicl8YlEnRPDnDz?=
 =?iso-8859-1?Q?RkGWRxY6zrxCncAAbxPvdB/mcRTvxaq6Lkni41CRBTDucdVaiE9RFXOJRg?=
 =?iso-8859-1?Q?jopdTZMt/yafyPjqP22i6MND5KiD4R0JR8KxoO9QzxulD2pt95yP4sfCEk?=
 =?iso-8859-1?Q?25Au3yUvEQIrbhKjv6qO9vyYps4krxeLd+FTK10OWR/9JD6iFi1tQwJwuX?=
 =?iso-8859-1?Q?qN8jYDPp4icmZqNYpO1E2+XdfFRtM5rl+ioiBA3Zc253GBd3YRFLV9/+oI?=
 =?iso-8859-1?Q?sThodIfjMfUHkyFHcYtp4CIK12M+pMosH3iXdPdTrStByHPfDozdCKuYTQ?=
 =?iso-8859-1?Q?MNk0F3K8tjMSytwyslcu5ILNQWzcWjiE3HEzjAA8VD8/OOQSBTuG3hfmY8?=
 =?iso-8859-1?Q?iR/Q2jfmYlxUtIPTp3aMultk6cB8fI+lvB5J0YeoWsDcHvNrIT/dkPcbTA?=
 =?iso-8859-1?Q?o6VWhMc+9rReYa5ZOJOpUaGVwNbuthVCG2evezrv3yFPz+l5gliKr9RpHh?=
 =?iso-8859-1?Q?VCFioyGpy+qU/7cAbFZ5UpO55O+LG1ULxa8JzFvjAN3Prjpa81Dq916qmc?=
 =?iso-8859-1?Q?6lOxYjX0sQokQbmq9ARh+TeG2caEDADxwOrNIJlBvTAYUBIzb3jBdv5Brb?=
 =?iso-8859-1?Q?Y0pnn+wDgRp4qtLXoMOKfvTrJzvlc4mzKoyHMClwmcCwdz2LitpINdhe9C?=
 =?iso-8859-1?Q?bsrxN/XaGtXSEHM5Q9J2UoOt7WGvhd5XEt2HXnuYUi2FoJixxBm2DhSUQJ?=
 =?iso-8859-1?Q?W+UyfkSSO6Ln2aktl2lYWZmgDQxmYNTrTvtHtNI7pxFLeBlA8UmF1do0rw?=
 =?iso-8859-1?Q?K7DeImFv2YlsTSbagY4dObLRCCPjQAV0rcZc61OfUBS7AOnAvvHF/cV1wR?=
 =?iso-8859-1?Q?MX+RwvTC512JLDcedJAP3ZgeeQiP3a7X4aq0hfVzXS86oWr9luoTAz+a+a?=
 =?iso-8859-1?Q?y/KbiN69UawLlbq1yzcVc2tSFT5xJuQ6al082hcfuFDkPsY+oJcP1lUYgw?=
 =?iso-8859-1?Q?pS/NTzbg84fTr7OpwqUBIAziaIcolOB+dso8QLE2T1Y0mLqxnqQk6qIL/A?=
 =?iso-8859-1?Q?J3NeyEwN6wyLtgqN6CpmPNG1M445sWJjW6lqVB1hCE717ZZX28YhKKoRZ/?=
 =?iso-8859-1?Q?ECjCetdrCqeRo7hwoaKJh8Mv/q22GV5iZdwGeH1ePhDd4WNMvCWEexpikY?=
 =?iso-8859-1?Q?26wdY22P3+phYKoeM+S/R8Oqx5Mj+22Wlm54MaC+vGUJ/OjOfShHJ8IS8B?=
 =?iso-8859-1?Q?wsMreGvEnp5Y5PWg/XDec/Q/7x9jWKU1fn20c0+4LocyRcqHRBsBUNrDtK?=
 =?iso-8859-1?Q?k/dQJzGAsVY0ye1IQLZhqmTLjkOn6TAmdcS0Mffa2dt/p+y2TZlVonDv8e?=
 =?iso-8859-1?Q?4AlH+pYTOQgfuEcqvOMqnmjOxL0hXsfTtWZT1rL5p0T7tyWZNCC4lwX12P?=
 =?iso-8859-1?Q?JC0dxV3ZSYFJoGdYpSooaDG9cfP6BTQwGSgxN9UTv521Tr4myAAyrRGttK?=
 =?iso-8859-1?Q?bimohuymNCWBwbjuMNAFaMfw7BmttmZ1J1PJRmQL//Gbc3D++rhLNohhIW?=
 =?iso-8859-1?Q?gjQDnsCrcZhtyO4FGh9yaD+BPzmRILf0rImI+pK52Po6ENkcnHsIlm1Toe?=
 =?iso-8859-1?Q?OYM3IXHEc6P7Z7qpy8brhWoryzyN1zhz1S1ZVs9dLINlnr2fRhJPwYLQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5466264-2b08-4268-987c-08de2c4e7534
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 18:14:22.0495 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: re59qKJ4bW+u83DEzqqIuTYGbDD5KUDdD8Cr20j29CcneZ+sVtilBEWFH3wm87FKp69eQcoKK75iaThgFdTXvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7458
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

On Tue, Nov 25, 2025 at 01:26:24PM +0530, Himal Prasad Ghimiray wrote:
> Introduce xe_vm_find_cpu_addr_mirror_vma_range(), which computes an
> extended range around a given range by including adjacent VMAs that are
> CPU-address-mirrored and have default memory attributes. This helper is
> useful for determining mergeable range without performing the actual merge.
> 
> v2
> - Add assert
> - Move unmap check to this patch
> 
> v3
> - Decrease offset to check by SZ_4K to avoid wrong vma return in fast
>   lookup path
> 
> v4
> - *start should be >= SZ_4K (Matt)
> 
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 41 ++++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h |  3 +++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f9989a7a710c..fc11a1a6f979 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -4383,6 +4383,47 @@ int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>  	return xe_vm_alloc_vma(vm, &map_req, true);
>  }
>  
> +static bool is_cpu_addr_vma_with_default_attr(struct xe_vma *vma)
> +{
> +	return vma && xe_vma_is_cpu_addr_mirror(vma) &&
> +	       !xe_svm_has_mapping(xe_vma_vm(vma), xe_vma_start(vma), xe_vma_end(vma)) &&
> +	       xe_vma_has_default_mem_attrs(vma);
> +}
> +
> +/**
> + * xe_vm_find_cpu_addr_mirror_vma_range - Extend a VMA range to include adjacent CPU-mirrored VMAs
> + * @vm: VM to search within
> + * @start: Input/output pointer to the starting address of the range
> + * @end: Input/output pointer to the end address of the range
> + *
> + * Given a range defined by @start and @range, this function checks the VMAs
> + * immediately before and after the range. If those neighboring VMAs are
> + * CPU-address-mirrored and have default memory attributes, the function
> + * updates @start and @range to include them. This extended range can then
> + * be used for merging or other operations that require a unified VMA.
> + *
> + * The function does not perform the merge itself; it only computes the
> + * mergeable boundaries.
> + */
> +void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm, u64 *start, u64 *end)
> +{
> +	struct xe_vma *prev, *next;
> +
> +	lockdep_assert_held(&vm->lock);
> +
> +	if (*start >= SZ_4K) {
> +		prev = xe_vm_find_vma_by_addr(vm, *start - SZ_4K);
> +		if (is_cpu_addr_vma_with_default_attr(prev))
> +			*start = xe_vma_start(prev);
> +	}
> +
> +	if (*end < vm->size) {
> +		next = xe_vm_find_vma_by_addr(vm, *end + 1);
> +		if (is_cpu_addr_vma_with_default_attr(next))
> +			*end = xe_vma_end(next);
> +	}
> +}
> +
>  /**
>   * xe_vm_alloc_cpu_addr_mirror_vma - Allocate CPU addr mirror vma
>   * @vm: Pointer to the xe_vm structure
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index ef8a5019574e..361f10b3c453 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -68,6 +68,9 @@ xe_vm_find_overlapping_vma(struct xe_vm *vm, u64 start, u64 range);
>  
>  bool xe_vma_has_default_mem_attrs(struct xe_vma *vma);
>  
> +void xe_vm_find_cpu_addr_mirror_vma_range(struct xe_vm *vm,
> +					  u64 *start,
> +					  u64 *end);
>  /**
>   * xe_vm_has_scratch() - Whether the vm is configured for scratch PTEs
>   * @vm: The vm
> -- 
> 2.34.1
> 
