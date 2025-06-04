Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DCFC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 14:25:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC17910E02C;
	Wed,  4 Jun 2025 14:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CSk9HvF7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED1010E02C
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 14:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749047132; x=1780583132;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kyahtZU/C6Pb1ZNacWQSNLMg1DGhYKZfM8LFbE9qfw0=;
 b=CSk9HvF77n4CueKlqTcfltYRA2KszIXJ+kJFFR9OI8FKD9mKQhi4I5CG
 Z2V1RF2Us4C8HTW6mgktlXtjmR/JDoRLGHndYa8zlMb+PM3wcYZ/IWYRP
 cBVDkJKE7cSBjqtWhFgVlCtZvP/Dl3ZKy9uOQOV8yiZMX76HIdH+idtId
 9JQZ8+bjXhSDdoCr4Wn4jxYGFzAjdonlbglutLU3recY1ThUC+3VdZVQ5
 PBMVhKBMDn0dyqRdq+3agvQQ+7f9YrehLCb0FbGWWaVJP917FxXUrKyUN
 fPC1UMe+CwWQ5PWyqBzKRYA9cC3uvOjCH2R4M+ZgJ7FkQ059o35BqUv8k A==;
X-CSE-ConnectionGUID: COuD41CESsyb6EAX6AcPXg==
X-CSE-MsgGUID: tfYiSvC8QKC5kS7aA7wbhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="50373215"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="50373215"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:25:31 -0700
X-CSE-ConnectionGUID: N3CYYECsRqmIL7i2UL75FA==
X-CSE-MsgGUID: ZWzTl57rRXqQMTltGqTNgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; d="scan'208";a="176168139"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 07:25:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 07:25:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 07:25:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 07:25:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/SAv5wZ2IVQSerRqA7HkGelKdYDYRZmPezjFR0+XH7cZBg0vXFde/514jOwrmJF8LuI1PAZW87CkIktNo3XL457hkJsQY7EbE+d0UZWa46IQ8uLgNsr/y9YBueMD/ItQQqQXILRJypcKOrEaboCh9KwSiubKTGGj6fWiBFGfMtH+CLKeg/h63g1+Jb2C1MaqT+RaCzS3wvkuJAKP0fVxDw9lW/n0qSDUDe5ChCO/2wg39POyWsGETlv2oUXukETyQchzXYhwoZEPxlB6VO5KJw8eIn8idW+/m8N8ZoOJ5EdPFe4Ar1nbf4pupxT8lsfxogOmeASgU8ULSdAl3tl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKOXz9pr6A8eMHpKnFKoBcYklHNeTmO8+ri6TO03k1o=;
 b=UcV5uJqAsbfqeFr8aEkRw2Vc1RwTNYFFUKyKOXIV42axALbnHjtV6hlVj3CmipRSO+dq3xbDmdNVtKjAWnv4Jky6wWFuiabiMiXMtNvCEY2XjnaWo0rszvbgWCMAmjQ9hJ+LL2jPBbBqNJcs7hMGnzt2NLALrXGWv0s7B/vLvM9rOhvoOHulubcYLXlVcILZ0MKl7wr/VuDYT2+y6b/TR8V4JSvWCqW2m3FaTuVKGAdX9ZbCUpQf1LuhbGgnGCaXTavOcTGXgvonz8DUESlbT0jWayDBIKZtWJaMMw2m/7QhGkQKXVa4VES40NMSn2azFjBBuXmYmjFYrXcOIYM3jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6665.namprd11.prod.outlook.com (2603:10b6:303:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 14:25:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8769.029; Wed, 4 Jun 2025
 14:25:00 +0000
Date: Wed, 4 Jun 2025 07:26:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: VM madvise semantics
Message-ID: <aEBXmoUTWK0XNTCj@lstrano-desk.jf.intel.com>
References: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e5a09490934b1332e13829c705af98026372300.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ae853c-cf18-4f3f-7ca4-08dda37396a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RJL95/stT7DnfuO6l3GOT4XlOxBAhFC1//xEhTmNV4uTAiOX++E6oqK6Fj?=
 =?iso-8859-1?Q?O8HjJdDmi9fr7CpaMuy5c8zvsEXZeCVa+y8N/EUWvmMQ0ifPa4V5Xz3MHe?=
 =?iso-8859-1?Q?8Mupw3HZY/bBcjvLSpH89dNoPquz90nSPoiiT4n7YLbcn+wH4yeYkBbtmb?=
 =?iso-8859-1?Q?KwymYwtBTBCpmcuPJbbC1L0B131wMt7vPlS7kgkiYVShAcZAlXciJNEvZN?=
 =?iso-8859-1?Q?u/L88wqgbccpQIdPzzUyOIbSBDVqY5EUtbRsFbaY7g/tTXCRfSmIACFA7L?=
 =?iso-8859-1?Q?/2cL+OMCk9NPElDKhWFp3t0ZYf8Q5+068TFKggsu202cSJ/lALHc3dwOfd?=
 =?iso-8859-1?Q?sruQs8SM5axLNaMNBofmqheAQwarKTbELgGofPLLJLNhFucTDIEmKU3O2X?=
 =?iso-8859-1?Q?WY84L7fc5RSRLMLXHjblyv+UOu6Uy/hJxkLeXjmjDyrPb1rOtvReBqpEQp?=
 =?iso-8859-1?Q?TFiSqgUS+4ivOqNGDC9ZtY72JQutSl+M8LG+A5/izyV9LXZ7lUqZClDcjQ?=
 =?iso-8859-1?Q?Bg5wJ4dlK3dDZHuJEX+LuvUhlzGrh1N4EbMukTf6ucvx9AasJl6uh8YHhj?=
 =?iso-8859-1?Q?hhv//QKM0jG8kAGlMeLjBUiqjvmsR5uJPQwhuTfUppIw0Sy1WdqpJC8j+N?=
 =?iso-8859-1?Q?pV3ZYthW1zODWWqnf0K8FPA0d1K5b0hG2VSX/zj7jIyUdhSVx2FPZ4mPrV?=
 =?iso-8859-1?Q?Tc+7+WdTMTNsGgLHVc9h9C70ZYVwNq/7v/dlu3Zuyqi/2FRdjxWEclHVvj?=
 =?iso-8859-1?Q?HCNDZKt3mKlJ3ursAcYHtzzyccpLCCeS3CCtAi0Wre+mPUu1GgkPs4zlxo?=
 =?iso-8859-1?Q?oqgtDUSh9jI2TeZSm4MO1Y+qmj5sofpkdUVwOMZEsCpV4MGVAZ9HkcEoMR?=
 =?iso-8859-1?Q?yfEMEl8cgd/ErnI6+rxVrKzc9/TT/aJR2PWYx/qMDCG6AYghjQkNYG31VF?=
 =?iso-8859-1?Q?CexyLuFuT5/UkGGraJ3/WcdegsgyY5t/V51eOV5IuWt2uXPDUjXhKx6u9c?=
 =?iso-8859-1?Q?ygAsgc3xDFSJ2XAf2t9eTDK0mMuOVm5AyBa51SHrq715mCnxQwDuYgd5xT?=
 =?iso-8859-1?Q?QcaAF9o+tzy5l91jk6tGCScurKgFdzeSfFE+aiTlty9+CA5dexq9qzD3pL?=
 =?iso-8859-1?Q?AT1z0eNMMMcuLfGgDGlds7w0fD+X1y1trupjZe+BX/aRiIRzTtnwzvp3j9?=
 =?iso-8859-1?Q?HojGHcPihjo1gJH0kMjsy1tWiLeWNNmMbVtO2NhQ0cDBxKSYk2dmOA+ZrJ?=
 =?iso-8859-1?Q?3hGBkQkgYs4V/STjwI9Yg7z3POOTuN0tA4cMRJ2NdKhzW73/aRDCd8qzD9?=
 =?iso-8859-1?Q?YwqAjsfIB8euVf3da6zAPBtmDhELx9kGF3jJj7XgVij8NdhAZYgZzeHZyZ?=
 =?iso-8859-1?Q?6+OX3ASzkbqmdZOz7AVVJghwopQL3LAIr6rof8NPyUdoB7BRA2nT7BFtlX?=
 =?iso-8859-1?Q?v0w+fjRa0rv2C/rJD1Rf2b3DfeW0BZN6KLgnqKn3v4J5nPwyzyKqXWOAOH?=
 =?iso-8859-1?Q?Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Z1UhQKxJ1wfB8EN6+mt1PeuqkB9xjo/58KmdoYeuNSox8rytYDF75Ad+ZP?=
 =?iso-8859-1?Q?quxMBSO6ElxLlaQVlmp+22kUye79fiJsY6Kc1Xav3BlCftqo5JGlcDaeWD?=
 =?iso-8859-1?Q?IjC04v9AQ/GmHiVCd1Regpp/Fpo/FfN79jEj/TN4I4TnFnsrFhdf4xzyfJ?=
 =?iso-8859-1?Q?x2rTDW0k6hnxhfDZpx+jKRtkcYtxBD131HQN9NpLi+46j44KRbY+oi0eyc?=
 =?iso-8859-1?Q?h42fGV+yOwSuVgHxCQZI472Wc0b1kZSuGcVcMzwlKduJaonKo4IQkwkRUb?=
 =?iso-8859-1?Q?4L2Z0SaIeoaOrj7FlQV7vW/yCyADo56+gAqTzbvM7lpuSHAeWsr5mmqP/U?=
 =?iso-8859-1?Q?QuCF4b7d9kAM6UOWucnZFL4WnorepMda3vjHcvNNFGlORMQATNkNSVn1wF?=
 =?iso-8859-1?Q?K/v/wbzFpGO9iRP5YyGjshFFwx47+GsHWwZ/gNg3NfuYzs3pgNEHfmhTBE?=
 =?iso-8859-1?Q?h3iM4RVVFoFyteLIV1abhU3jFKYkevgyevOJ4f5xtfRwiceVhd00mGlsFW?=
 =?iso-8859-1?Q?POslS8RWP43sVMwF/w0k9uTF7HNuNdhTofBjgSoNAsCf9/V6Eqyof3lIjV?=
 =?iso-8859-1?Q?4nbiz/yhnIqzM8SWTvtyK7/2qtnwTYIQf1it3Y4Bcq7O3eSu7n9Sbw1g7F?=
 =?iso-8859-1?Q?B5KeW8cCEHpb7SYJlukt0VttcCTsgo6yu+1ai7Nr45+7PVoFp10uSdBQ9N?=
 =?iso-8859-1?Q?6RTTbrrk1vESMGwI9NSEAB7gzCpxrByYwFEGLNJa5xo+o8z2sB11BK6+J4?=
 =?iso-8859-1?Q?1gEoiLUg2Na8Cah8pAGsCkozKC/HwbKtu7Cs94nkEgoFrzjqaEVKRqhgKE?=
 =?iso-8859-1?Q?NfzW4O7asegCWtAzCOghUafhmI2V4JLQ977P9ZlFR5LgoAL8pvCliklfZA?=
 =?iso-8859-1?Q?dhC5A9gAYXOCdzl5tLSNFV+TUb0GYJsNehzuFYVEsKhBaEuuKbZhWxNxa6?=
 =?iso-8859-1?Q?5ltqOOrXItsUP9OaK25WCN5eofNhdpbvTXIptlcMMT4n6SfcCBkjM3tga5?=
 =?iso-8859-1?Q?GeB0jVcwmiyEeO2+qO6DRdIZktg/v9ub+ipYUfkXfF/BxykmaUi/UDeutO?=
 =?iso-8859-1?Q?BERtW4OEGw9uLlvSHj7nXIQT01/+h7LXKMc4H/oIVkEYqPs0zoYvdvmHR6?=
 =?iso-8859-1?Q?Qe7vSf41ct5RHBbxA4T5KqMYIXU0Dc3LDshAo2dcKh4vBhbTTkX3QBHUkS?=
 =?iso-8859-1?Q?I+tydBBQQ1KJnoBKvOHeLi9OLpFHLs191N6ZVaPogxQDIktp1dDbHw3FG2?=
 =?iso-8859-1?Q?ltrLaMJ3ju+CO8vqb9Mn7XRJkkqSUoZwT+FUQvaioIAgLkHnR8IhMUod3j?=
 =?iso-8859-1?Q?eO62SnvSOCKmf3JC0ZpxOc9fNBOaPzOGSDmdF3A+veyqm16lzX3ULlAdJH?=
 =?iso-8859-1?Q?wjd2zPOih8AQQVvqxk9YXzX3CZU+zLQ6SJWkKQij6aHRmaOiZ6/V838F5K?=
 =?iso-8859-1?Q?M8CwRyx/mQz5poAiUyr+pWvs1aEZVtYxoq7gbNNcVxZ7NE8SUL8M+YpfsW?=
 =?iso-8859-1?Q?4qEOO7TtI5A3/kL5E6zQ1qj2yqVANhQJHDjvJeO+mLVCA1IqiYHtWt0EXU?=
 =?iso-8859-1?Q?Zo7iDOH8adR3HHf5I4eezPYE+2gfw1zbS78HmVRedqEuvU10UHP/ExlNFg?=
 =?iso-8859-1?Q?Q8pgMlMSY65oZ9QE6jvxgibYEC63mtqDYGciRfbcGabkcLpZXVZTR9Eg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ae853c-cf18-4f3f-7ca4-08dda37396a6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:25:00.1854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3zLIn7RIEoDvoMJqpEOAiLc6dJ7vUWNbJNbYozXgoInegfPxFqjGMWgjmwz2jC6L7D8LP/2pUgIjckN41zNSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6665
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

On Wed, Jun 04, 2025 at 02:57:50PM +0200, Thomas Hellström wrote:
> Hi!
> 
> I'm starting an email thread to move forward the questions Himal had on
> the madvise semantics:
> 
> 1) Whether to support an array of ops? 
> 
> IMO the VM_BIND implementation got very complicated due to this and the
> needed rollback support. Perhaps due to single op splitting turning to
> multiple ops it would've been hard to avoid that. Can we avoid
> supporting an array of ops for madvise? If so I'd vote for single op.
> 

I don't think rollback is strickly required as madvise failing mid-array
is not fatal compared to a VM bind failing mid-array not rolling back
is. At worst some VMAs/ranges/BOs might have had their attributes
changed and may have not. That said, not opposed to for single op if
that is what you prefer.

> 2) Purgeability. If it's not implemented yet we shouldn't merge an uapi
> for it, but ensure that it would at least be possible moving forward. 
> 

I agree, I think I mentioned that in my reviews too - pull this out of
the uAPI before the final merge.

> 3) Multi-device. In the spirit of the above I guess it makes sense if
> UMD wants to select between VRAM and SRAM now to merge an interface
> that supports *only* that. When we add multi-device support we could
> perhaps add another op, or an extension to support agreed multi-device
> semantics. Even if this means rolling back to Himal's original
> suggestion of a preferred placement UAPI.
> 

I think the way Himal as this coded works for both multi-device and
choose between SRAM / VRAM. 

The devmem_fd field means:

-1 == SRAM
0 == VRAM
0 > Multi-device devmem FD handle (NIY)

I think this is a solid enough interface we are good? Am I missing
something?

Matt

> Thoughts?
> 
> Thomas
> 
