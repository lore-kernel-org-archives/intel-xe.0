Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB34ACCD195
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 18:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7710E150;
	Wed, 15 Oct 2025 18:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QzmrC1+B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC34810E150
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Oct 2025 18:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760553755; x=1792089755;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4jtNbPxuDZjx/lqso5DtZ1o1j9TTt7pvZ9Wn+vCpGq0=;
 b=QzmrC1+BlSRU5Z0BzzQ1czXVeNdx3e+91zxj2lkvDcQRBYsIOJyCu51d
 5difMH40PUZ+XybY+6QJ+rUzsrsJNkSdijRnAffRo/Hz0x4QG4MEQBsVh
 6v67tI0+GUpXLmz4ZxD/2nI1EyzeuR4NBrHYxXCdsRR6sCLAE+TI8Ue6t
 gYeC9/pX3vCjGcvq4Lsck2kn5a1jhlYwm/S5SZW/0er+g4rI15JTTpWwn
 8RuWSjVDT72ub5z7MlK8zz/67mmCTwCR1M2XTn22jZ+gpHNA4bg293/dJ
 UUMbe+s+jl2YPfgsQUlYeQs8hqwZIWHDaw4DIrfE4j3TaVNXuoxCDg5/E Q==;
X-CSE-ConnectionGUID: SMuFEAtTSjSYwytt2G7pLQ==
X-CSE-MsgGUID: b3glZxO9RaKvykmo2GKH/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="88208136"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="88208136"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:42:34 -0700
X-CSE-ConnectionGUID: LSiaM4vZSCmifLf9wOMJpw==
X-CSE-MsgGUID: qUotCpLNTxa2hVrsRul5ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; d="scan'208";a="182035536"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 11:42:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:42:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 11:42:33 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 11:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/inwbnt+xirItRJM/hu9oSeyvgq2Qk4kzE+8j7ohchvfFxjrVzqzwEddwJTHEawAGDgn9qhcb4bRqqF1Wm6cCROtI7CKQxjTRCRKtgC07dmuhvmwqzee0CAw2L0+0ZiGSLwn26/OnW2c4Zxv3uFqJcKZOckZDA3d4UpqoJejTphdOuAME04g1bBn0Sy7RjthdHkYQP3v/KNZpgON16vVDrYIfG5vmwrlLgSh1ArDIDK6X1F1q1YtKVoHEjcLyV/TIWJ016YytxyaDlh1Pe7Ttpl6cQsNA/ZD4ZE3OTnwOGus4/gNH1XHNxjUBH0+A/diORLH0z3cAcPDhFQfIc/qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btF8x9eqZsUA48kSMuErsr0VTzbh6QArx0TNSBXo5zU=;
 b=HNGZ55LTHC9+992QBXi4HY6iolV1oA2Av67RTrKpDzhCl9vjnYR90FtiuwpdgdAWjQl+CP7npkY5qizQea1OKEd15dpJt6k6p9x2b2tUJrY8Yc7wHc2AD9DAJ2CqYky5sN53RB/vHqAjtKjFZ/hX/5pMTP16eeAnWlkiO8SDD0mGVgd30rImPhGopD7adMmOn4IZC5b1cKlnniLtIB4J1HPU3MyC6TL+y19K5PCHap/vdlLg53/ziJMZv2ul9kxt4nleGuUFV/lakeS1/WCwBUJ7a4e3QdeGMsYWAYtbuIgyQ+dog5KW9+FV6jl4A9PH0IusfNhyIENeKDUFOAnlZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA3PR11MB9461.namprd11.prod.outlook.com (2603:10b6:806:47f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Wed, 15 Oct
 2025 18:42:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9228.012; Wed, 15 Oct 2025
 18:42:27 +0000
Date: Wed, 15 Oct 2025 13:42:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>, Balasubramani Vivekanandan
 <balasubramani.vivekanandan@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: Re: [PATCH 12/23] drm/xe/xe3p: Flush userptr/shrinker bo cachelines
 manually
Message-ID: <6zhgw7afvficwjamso5pji6fvqeboo5s2zc4hdfswlmn3jikko@5q3hp3vq5eu6>
References: <20251013-xe3p-v1-0-bfb74f038215@intel.com>
 <20251013-xe3p-v1-12-bfb74f038215@intel.com>
 <d2517d66f571e11a760cb143981b7ca238f5cd58.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2517d66f571e11a760cb143981b7ca238f5cd58.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR21CA0029.namprd21.prod.outlook.com
 (2603:10b6:a03:114::39) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA3PR11MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e9b17f-2289-417f-5eb6-08de0c1a9681
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?rfq09GOBP00eN13O/GB1+MAfwUAmZWDyPgOw8bxlxlFh/H/DGBaNMurTIL?=
 =?iso-8859-1?Q?XEnFTrpCMqx93jSZdv9cXaw+k4MYrcgsG5uWVBAZwgKEphqf+8YYciwLYp?=
 =?iso-8859-1?Q?Ppso8aoNxHEkYB4lpzIxCLZFMys7EZ/KJdDIixgJd6s+FexcwfFKyCJUYA?=
 =?iso-8859-1?Q?C9SJwAEnPy43/8jTxnpspzFfUQICr3m+kP4Jre4MG1Y58XvXrhn1FovzZV?=
 =?iso-8859-1?Q?jgHCFCXjMvlo6quU/Ftx4pq1p8Ll3UhrxDFOfZUOlO5+bY7BmvZUn+486Q?=
 =?iso-8859-1?Q?Wi9y4AQzeqftJ0AhK8DU9jT8SN+xuf6pWJkJTBvyxMNk10zXJ/TbjdzPBG?=
 =?iso-8859-1?Q?Ipzyh4kg/Ba4hAyUwQ+vWPKR4hV5ugWcwU8n/mDPrtfpv1cRskT1ceMDYy?=
 =?iso-8859-1?Q?BUi145rFtEDiHwtEEHDWSbQ7K81dd4zS+EBmGabSp5HQExFO2xJTKwWtc9?=
 =?iso-8859-1?Q?qND02FlkU8GP2JBulGuLIqaQCbuiyu/Scx7W5bc9xx0yKYnt26NBTeTEF6?=
 =?iso-8859-1?Q?t6Egit4c/uAiCbNT4VuvSZVMXA712FnG8c4SGqEnqm1n3cEQtxScjjtjGa?=
 =?iso-8859-1?Q?gWhBqy3lndAbx4Y+qvkYTQy6cGEYVCmRyXf5BhXOIeoB8RrB2heenF+4zd?=
 =?iso-8859-1?Q?iK54rXntASmxv60+PnwAaYz6x0DKW7IWmYcnbAGpX/kxvWVMc0aOkDngRf?=
 =?iso-8859-1?Q?bSRyHsU4p1uQY5gltrE6Mc/7qVgnK4o5yUO97Kda3zX5GyhXPrZ5aidgfa?=
 =?iso-8859-1?Q?BiIuVX7iclqKn6pRFtFN6xYO1zsdp8hSdcjUpG2V5GUYvlM7KcAbyhRPT8?=
 =?iso-8859-1?Q?0SAJ9+FNyb4E0p4Wu8oPmfnGLBdHWPP7gm4eOd8CUmPJbyUm6aI0q58XRc?=
 =?iso-8859-1?Q?5H1ySrez43ZXvffG1UrBKtSeoOltn7YO+eLxcGbwVIaAWK+RRG23bW4pPI?=
 =?iso-8859-1?Q?pQ1b//+bHYm0T8X21HIqleY/cs2jB2pWsWjVvUNLHPniw7/amqcD/T5rjB?=
 =?iso-8859-1?Q?Bh8Qgh6Il+vAW7fsEG5YDSvdjxPi93dDFmx0jza1/6Sw9pbpsK+zAFLDhw?=
 =?iso-8859-1?Q?um3JbnB84F6TBljgKWkoYYJ5cW+N0b5qBa3kBONDQ/Noj6qFJZmp4xtEvI?=
 =?iso-8859-1?Q?qQoY4nhq8+5F7QsYFIUnjFWkhDUK+fJ+adGVlHcP0bjrgcJwn5SleIgQJD?=
 =?iso-8859-1?Q?6C48W6sDgnWacHxmqvs+9zVFWbUYUXQkvIFiqHS1aRcbFJlSXpvLiigllV?=
 =?iso-8859-1?Q?W/IBJ//nUlp8sKp6CZj2S0zhfCezm1tAYNeyMLNXvRmGEHTvqPvTfUV39z?=
 =?iso-8859-1?Q?ea7V5XpsegM5AXkbyVm2Uoztau8BFjfaXTDZ4swAID6yZ/CKbEvOZ6BqNB?=
 =?iso-8859-1?Q?6UGeb/+IkzWLSQCJl0PNgjHPM/3Oo0a1d6Uyh660iSvBKvHMY1HYSBdHxN?=
 =?iso-8859-1?Q?AfRQnmi4CrY16jVNWTMOqDCvgZxUyrrv7/qSM+vfTthpWuIMQCnw6kfHhX?=
 =?iso-8859-1?Q?reMHuCWC8ki+hlBqZccAJO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vHPJstLUcEsjN//JtEkkKgUQQoVdqd5NjEg7cEXQD0pixXK+XENaPSJONt?=
 =?iso-8859-1?Q?3gIuM5zsl+LfTYHOrBLkXQVOqza+2Xy49m6watDTSmTp3MIMEZoUlip5xz?=
 =?iso-8859-1?Q?9uNxkQInOfQ1nFs1OtX2RYKRLX1YC41PcKFPjliD1HR74Vf33cCygNI98h?=
 =?iso-8859-1?Q?vIDW2+1s9BhBiJfSjVKOXISG5+k6eCoSUZnrIE8Vi8BxObjlQI7tCRZQpr?=
 =?iso-8859-1?Q?+9FRGgMMkuAL+kvxmeG+CkLc5RvJSOHiM5ZhqVl0vnSNbXfgjWsVTNVwDi?=
 =?iso-8859-1?Q?D1IX7IhwjBDXNdVCN0hDdQArgivpkuFDKKe6WVVMUz8VlPi+RkhnCS9JE6?=
 =?iso-8859-1?Q?iCuhbS1rroncDkMD58786YQcCXuGiGJ9GPbRQXRLVVJCX+zF7+wMFDsBYO?=
 =?iso-8859-1?Q?EwPFGag/n7sXJCSmKuwxChiGz4XMZqFNw50+NBCnT9faOws4SH0dIdR07V?=
 =?iso-8859-1?Q?PEQBqFgia6KxgVARJp+SMsQtapOFbySiGkRfdPX5hWneB0Kbzw0hHXGUag?=
 =?iso-8859-1?Q?9QVl2aPLDj0yoM2624dzQYNrCDh9yJQVpjweOzPh0WzRkkg7vbMxeOwCEK?=
 =?iso-8859-1?Q?/5uwtEGzsmUUr9HF5l9bTPcztzbPvEl5jKhQwVOzsp/42GwFHVC05XOcic?=
 =?iso-8859-1?Q?3M9mhPL5ytH+u5jOjp2ZoRVOOcPQRBalDJ33BswXIzCv7LsIKKrEC49Tsf?=
 =?iso-8859-1?Q?c7AK1q2z00VkPkrM/2OfSN6iB2LYrDLFBd1IuI+R2A+24/8tgwazO2zTjr?=
 =?iso-8859-1?Q?xmOFRj4bzSWDR1+RpMI0ENp53fZ1/CkSVvw9ug0LXOrLZ3cRQbswEjwMoS?=
 =?iso-8859-1?Q?TYbOxRF0m/ZwxV2yWwlFlraJo4GVjeF1qDkhUgsQX0+E+Xm7Iq0R7ao8zs?=
 =?iso-8859-1?Q?Dnm5edguO7Q89Q1o/qGQ/ED3iJRv1vOua3KGjFRvkwIYt7H1o/YRG3aF+v?=
 =?iso-8859-1?Q?eMcfD324Zk6DK38PFoPudX/37gzSegnFYZrcLq3xJNqj48CrjclLfMXOot?=
 =?iso-8859-1?Q?UaV5TPCs6eQ+TN3nDRwHAVeuAD7C3bkQcC6lFvc4rQorjNUUOMXr3PXWR7?=
 =?iso-8859-1?Q?cdbS+KX6B063EWGdEss9mI1l7INLQ6HoSFmAUhL1WPrQHlXibnSlmLUIv3?=
 =?iso-8859-1?Q?ECNAIxVFHZKGqjxImWdkF1gbxbfVDTQvApfzUtyzHtDzyKQ78CdrCwwN9t?=
 =?iso-8859-1?Q?VNLb2YOkcJKBmZSnUMgOsZvr59+ZvmrsAA4i67qyGQq0EhMFrY1IsrUUbd?=
 =?iso-8859-1?Q?OHHnzV2ak7PP/y0VdQZQx1a1P+5tjhuc3jv0VzCzRuv8QD1yhSUosfAJGQ?=
 =?iso-8859-1?Q?iLPng2KjowXd6aOXboqCWjGADVr+qipFevM9Ary8nBOddDRljLp68QPhF1?=
 =?iso-8859-1?Q?r2sypIHjOGxYP7KkIK7HHs+nVAIHxBhJKGmxFbamEVp9JRXzihYYunneRQ?=
 =?iso-8859-1?Q?ZjvHoB7VLgfbapr+1itJ0ddPq8ZG9zbUK4EVbzDOX6T2LUXMbS5itgU24P?=
 =?iso-8859-1?Q?umfwtiF0Fjin2qPEvarWe5R90HiDIonpeJvOLF1s/Yp4ww71dkBAKl4mu4?=
 =?iso-8859-1?Q?mcXfaiaN1fv7xYTVEVWmsrfEjitjESpIKoLb7zI9WKxlMar2WIIaijgIzi?=
 =?iso-8859-1?Q?FnY6zoiQncIDWrfWPtRXVi6D1iIaY5nKRqtyxF0ehvF2XBTf9T/B6PEQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e9b17f-2289-417f-5eb6-08de0c1a9681
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 18:42:26.8636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8rcnbda6H1DgM3XE1O3kHKytHTS4AMVaiwqk6aCvUmKM3inq+/ipOYNJy944kS/pmvPvLLEXbpw3OnQ27BcWd16AO4QTJdO9L08e80xC8Ag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9461
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

On Tue, Oct 14, 2025 at 02:58:55PM +0200, Thomas Hellström wrote:
>Hi,
>
>On Mon, 2025-10-13 at 20:24 -0700, Lucas De Marchi wrote:
>> From: Tejas Upadhyay <tejas.upadhyay@intel.com>
>>
>> Starting with Xe3p, HW will flush cachelines marked with XA only when
>> media is off. We have few cases where kernel will have non-XA
>> cachelines
>> which needs manual flush as we postpone the invalidation.
>
>is XA- and non-XA cachelines described somewhere in the code?

no, not yet. See reply from Matt to "[PATCH 10/23] drm/xe/xe3p: Skip TD
flush".

I will drop this patch and the 2 before this one on next version.

Lucas De Marchi

>
>>
>> Flush asap from correctness POV to ensure non accelerated CPU copy to
>> swap/shmem file will see coherent view of memory, but also from
>> security
>> POV where later flush can't corrupt the next user of those pages.
>>
>> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> [ TODO: xe_device_needs_cache_flush() seems a bad name that doesn't
>>   really review the context - it may need to be renamed/localized ]
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>This worries me. Any dma-fence *must*, when signaled, have flushed all
>caches from data resulting from the operation it marks the completion
>of. The code below indicates that's not the case?
>
>Note also that the wait for idle in xe_bo_trigger_rebind does not
>guarantee that the bo is idle, just that there are no pending bind
>operations.
>
>In fault mode we have a slightly different approach to ensure data is
>flushed before pages are released.
>
>Could you elaborate a bit on how this is intendend to work.
>
>Thanks,
>Thomas
>
>
>> ---
>>  drivers/gpu/drm/xe/xe_bo.c      |  3 ++-
>>  drivers/gpu/drm/xe/xe_device.c  | 20 ++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_device.h  |  1 +
>>  drivers/gpu/drm/xe/xe_userptr.c |  3 ++-
>>  4 files changed, 25 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 7b65020818738..05bc61d9e37cf 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -673,7 +673,8 @@ static int xe_bo_trigger_rebind(struct xe_device
>> *xe, struct xe_bo *bo,
>>  
>>  		if (!xe_vm_in_fault_mode(vm)) {
>>  			drm_gpuvm_bo_evict(vm_bo, true);
>> -			continue;
>> +			if (!xe_device_needs_cache_flush(xe))
>> +				continue;
>>  		}
>>  
>>  		if (!idle) {
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 7efa8da9e1069..168a45fe36838 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -1081,6 +1081,26 @@ void xe_device_l2_flush(struct xe_device *xe)
>>  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>  }
>>  
>> +/**
>> + * xe_device_needs_cache_flush - Whether the cache needs to be
>> flushed
>> + * @xe: The device to check.
>> + *
>> + * Return: true if the device needs cache flush, false otherwise.
>> + */
>> +bool xe_device_needs_cache_flush(struct xe_device *xe)
>> +{
>> +	/*
>> +	 * Xe3p will flush cachelines marked with XA only when media
>> is off. We
>> +	 * have few cases where kernel will have non-XA cachelines
>> which needs
>> +	 * manual flush and this is one of them as we postpone the
>> +	 * invalidation. Flush asap from correctness POV to ensure
>> non
>> +	 * accelerated CPU copy to swap/shmem file will see coherent
>> view of
>> +	 * memory, but also from security POV where later flush
>> can't corrupt
>> +	 * the next user of those pages.
>> +	 */
>> +	return GRAPHICS_VER(xe) >= 35 && !IS_DGFX(xe);
>> +}
>> +
>>  /**
>>   * xe_device_td_flush() - Flush transient L3 cache entries
>>   * @xe: The device
>> diff --git a/drivers/gpu/drm/xe/xe_device.h
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 32cc6323b7f64..15e67db44b56c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -179,6 +179,7 @@ void xe_device_snapshot_print(struct xe_device
>> *xe, struct drm_printer *p);
>>  u64 xe_device_canonicalize_addr(struct xe_device *xe, u64 address);
>>  u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64
>> address);
>>  
>> +bool xe_device_needs_cache_flush(struct xe_device *xe);
>>  void xe_device_td_flush(struct xe_device *xe);
>>  void xe_device_l2_flush(struct xe_device *xe);
>>  
>> diff --git a/drivers/gpu/drm/xe/xe_userptr.c
>> b/drivers/gpu/drm/xe/xe_userptr.c
>> index f16e92cd80904..86ce1c3ef41aa 100644
>> --- a/drivers/gpu/drm/xe/xe_userptr.c
>> +++ b/drivers/gpu/drm/xe/xe_userptr.c
>> @@ -112,7 +112,8 @@ static void __vma_userptr_invalidate(struct xe_vm
>> *vm, struct xe_userptr_vma *uv
>>  				    false, MAX_SCHEDULE_TIMEOUT);
>>  	XE_WARN_ON(err <= 0);
>>  
>> -	if (xe_vm_in_fault_mode(vm) && userptr->initial_bind) {
>> +	if ((xe_vm_in_fault_mode(vm) ||
>> xe_device_needs_cache_flush(vm->xe)) &&
>> +	    userptr->initial_bind) {
>>  		err = xe_vm_invalidate_vma(vma);
>>  		XE_WARN_ON(err);
>>  	}
>>
>
