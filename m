Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A7CD116E2
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 21:01:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1C910E053;
	Fri, 28 Nov 2025 21:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Az5cMaxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9B1810E053
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Nov 2025 21:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764363676; x=1795899676;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RO1hpu+/csS+q8O1reWvIoUOIm1gX51LhP4GwozTG2I=;
 b=Az5cMaxsjqaEwfohj9f++ugT+3SMI+hbfK6i2xjEUy+z7yrQx4lVT1Z5
 yMNVNvk25BIz1yx6S2VE1MonR6ovq6yY+wV6rIYUWfiOJVe2WplrNdF7I
 ag1/5xMDvuwwN5eaie/1MakCNpbT8wjVpPw6+IEwjdKwJJ1ibP6DYRJVL
 79/hI6MJNoU653fPjBSZtSg4OEL0Rzmlwu7/4r0cyXLJVNOBaPiwpyoxr
 IHA/MEPetVOhUmnlnEsvvXQQxHiJ3QYQhJCBU9o9BzvU+3/NDq9suVsVb
 T8C/kXM8TO85OtgyTDG7dS5r/tNyaHStHynqRWeZLch/D3ta65U6RRG6W A==;
X-CSE-ConnectionGUID: bWG83p0vRiqe4EX/toqghg==
X-CSE-MsgGUID: RIYRRqdjQMyO+57AQryuMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77079497"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="77079497"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 13:01:15 -0800
X-CSE-ConnectionGUID: jyc+7dZaSf25atGJmRwCPQ==
X-CSE-MsgGUID: wUi8s3fXRaeDD8yTVKyixQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; d="scan'208";a="193647063"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 13:01:15 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 13:01:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 28 Nov 2025 13:01:14 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 28 Nov 2025 13:01:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSrFdiml9RFjOi5Lu0dqc9RFNdVJZIn2w5NnCyqicmA5dWxAaNVPDUFZchdHUFZDdfWaRTUiYKeGzZBWsrl9rsLMt6c/kRxxoK7Cs2mADnsBpJotKq2o9+/DJoSvFichQX4VXDXMAxex/th+q18oxR/sDhKicRr13XOAYAKNCw3m6mzFN1Cf3fxn/6dEpM9b2rJgDpNIXVvubLdfFnqS16U7MgtQRXCJ/uVDDrqfoipkLuD5tzMltQtw8CDp9LRfoxA/hESGdZznlvLb2I7YxvYKyz1NDVrh5jPYK7Vjif28unwg+kFpRPAqQRe3NAgapG4MGT9aXy4h0VYtyhnCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u8OYVGe0nnuUWN52gQWWRShMS45cKFHJHsMQnjArO2Y=;
 b=GdghnI8PjS0XDG1n2nUJw0mG1qNsq07soROdXJX+hf2pZxApA7VFkgHeKYZukwhDZtCjvIJdmydul0ZQn37kh8afVMmM+uCW5ev1uU+xQSMKVrY1Z4ftU++ff/kKsaB3FrOOFrSAePYEqWB0wYBcScr6pt3Vk8ZqYZxzPDRy7nmgWhefF1+vENuO+9kYIgK3H8iUNOD72aDFoKhHlf2pvmtkCmvNRr0pp5o7u1Ppq5oMjTz5JOBeJ17wBe9aYGtf15CyoWXGb2f84kYfpY/TCDiZRye3mqyCZwkdiIoFsOUQ3EbuiSyCF/aMVjOcfcjellY1proAhIy4dbS6ewnCuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Fri, 28 Nov
 2025 21:01:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 21:01:07 +0000
Date: Fri, 28 Nov 2025 13:01:04 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [RFC PATCH] drm/xe/bo: Honor madvise(2) advices
Message-ID: <aSoNkE3dldrSbbF9@lstrano-desk.jf.intel.com>
References: <20251128104623.32742-1-thomas.hellstrom@linux.intel.com>
 <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd0ef25a-1fc1-4f7e-8363-74d4c660f71d@intel.com>
X-ClientProxiedBy: MW4PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:303:16d::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: b8f70ff0-1b96-40a1-f2b9-08de2ec14017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?NLmb56iNeaTv6irS1oGS/pZRVlNeZJDveN+zcHvKtEMq3exwRbf3W2hOPi?=
 =?iso-8859-1?Q?OwCQHqgEzpQNKO6Qy7fWtG0LDTniZqeGB9sNUGfpRD2oCEegC/jfiszBoE?=
 =?iso-8859-1?Q?Hco6v53NJUKvr1LpsFAc35dWrosrxH4CXc2ZoPyMSx9QzfobHcgc2ehx2Q?=
 =?iso-8859-1?Q?JUkOvYJWr9AmWnXQrwkVYAQSIB1H0iYbK7DmQCXTCdW8mOPv0D0CmZPbVn?=
 =?iso-8859-1?Q?SfUS4pwpp1GQ7BrKXrr3hEFW+ZpaYit9AmfeJKVgJ8zXwLlnYvkSlXEAE7?=
 =?iso-8859-1?Q?b6Mtuf/blGv3eQVz7fT4kVSXmN2FHEL+r0Md9YaAq3xaNuseIu/YKRxhXi?=
 =?iso-8859-1?Q?m17ok3l96YdfF7hS5ka2BEWArPi30xmo/XsSDcw+fpwwB6Nnp9xntRNJTk?=
 =?iso-8859-1?Q?SxTyglkacLrsBkM8yXyyiEr2uQv+QHWuS6ox1EtoR6A9ZpyAkZ6lladAMd?=
 =?iso-8859-1?Q?lfQssZ3zrrEuKOYJzrTaMkOC+h11cri5DxyePqd2RQH3NpVBMdRM0B+JVk?=
 =?iso-8859-1?Q?Nf4JjuEAN+ETtLHedQE42N04fb+AQRqsxUB9UpH6anRRVWoIsYuefEflh0?=
 =?iso-8859-1?Q?vUbX+es5NaYebUJ08bXPdCe10iXqokD36XGrEqQEqLnpk4I8JNJgNhhaaf?=
 =?iso-8859-1?Q?eJ318RPn309I6b91JwD6gZhqusx2ObO640B48j1YZqzck7ZTmxDZ9BYbx4?=
 =?iso-8859-1?Q?qvnCfgwu8vneIa5A44UsBG52/d+hHCMnqv1MCDtJLAoEoRHh8SEK8F+3lN?=
 =?iso-8859-1?Q?sxw9X8ohI3RYQMNcawZhMhDP2AcHWZjlzJP9+Cp8P762ntxNH1vpRf0SPZ?=
 =?iso-8859-1?Q?TCYJ8sEjIMc1HHUI+M3mzr/7HzYHoedPKSBlJG1mdOOIgNY2K/GHuR2zMf?=
 =?iso-8859-1?Q?EaKUObSNWQLxXuVOWPN0HYiZIzVzkamEtI9aFcQed101d4kMNWxSRUTLzd?=
 =?iso-8859-1?Q?GauHxuhUAcRrXHtUGfYKqxtvC82J96/DSoZtKMWs+fvOvMAqgdEzDynUSD?=
 =?iso-8859-1?Q?RDVKuk01lr2kCC3R5oyZSHb8604oktGpn9HYHaymZLSbZRskHvYKDACYZ+?=
 =?iso-8859-1?Q?bcDQaIUK62ZepZhXLkRGHXKjuAFhnqYYjJfEQ469u3rhMckhoI1QpSN/E9?=
 =?iso-8859-1?Q?JhokohaXYqVKeDTPCiFD8YHfs4B06/dSeo3OCYPkbtCtMW9Ax+O9uUbO26?=
 =?iso-8859-1?Q?XzeLkYACDu/C49Je6CYAIpb7/fXIEReaZlIO+kWK9KSdcBwHn5acrdzbIl?=
 =?iso-8859-1?Q?ApT10c64OYGeNjJ/qKFClQEUunQNYPugbvKFOGC1Kw8iZu1Ha62Q6mZ1Qc?=
 =?iso-8859-1?Q?i5XvYO1KRQCBy2GR5rphy1IXOf1vCuESofzZ23UYD0fHlMctYEVlgLJlHN?=
 =?iso-8859-1?Q?0SThavgJWoHbjtXLpC7D/5/w0QuiYc+8Il4Gmd6HJpDH0exthnkF4HZiua?=
 =?iso-8859-1?Q?uTa6Zop2zfOYqmcxtspPZJYBVKGxQpyefwF+0WfA3yIG/ZFICCrPm3tbz7?=
 =?iso-8859-1?Q?5aX80jUU7Ytb6LO+5kvdwz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?WIxMp+4WzPtqqNcW5t3gvSxgeFra1tHdcJxFY8pXacYhtLzbrKnafuWVz7?=
 =?iso-8859-1?Q?EnkGsqoWdqL59lz8BMNLbS0QBVQxQXtq564hkI8DxfyoeyEQUehenYbcTh?=
 =?iso-8859-1?Q?u63SErA/2L9BY2ygEw7e7ZbQdd9CoQHuzSr+s9y2ayrQdbMZNLeIk1JzeK?=
 =?iso-8859-1?Q?q1puIrI9x61mKLGucBwBVqZnZj4AnsOyExtqI/KbI03UhxnaKTlplx1sns?=
 =?iso-8859-1?Q?nw49SSgq0LhtYS2x5mMSXYwh9Wz1u73Ad+0f51ieIYaA4g5B33kDlILOi8?=
 =?iso-8859-1?Q?FqD87SC24l4nG3oZrjzJwGIHwFDbTj12CVZgRW6IlonFbWVdufmbj42GyQ?=
 =?iso-8859-1?Q?G5lBZxIuVYEmQF7Pho/Kxmk+KHRaewNkP4QDvoOaBVQzago6KwCm/+i9gc?=
 =?iso-8859-1?Q?Hc573HGxtOjl1RfbeWZU4Tm+81xwlXkzzgBn+EnKreNn6LZFbuoyzakr5c?=
 =?iso-8859-1?Q?RTpntvrcwq8BC31XNThz2lffbEM0Z/ORogxO4ok2ftd472oNi37SV4ELe9?=
 =?iso-8859-1?Q?EcjbJyKLGl5GyK6NLHq5BPDZ4FZkS+l/F3t39NIaYhEQZHxD8j5X5lb4sJ?=
 =?iso-8859-1?Q?dheYc9IDhXwnkXOJSNwdkgokjjx3KigZbkwU9c3T8Fg9agsIJpIPOPi/KM?=
 =?iso-8859-1?Q?rT9fwnOw9iprhdjOrS29ZgFtYyxbv+5w/H5IxvvMKqUUBCr2uctqXyldWC?=
 =?iso-8859-1?Q?VoF5pwPWKZtMO6mVuIi+LLEhmmBJ6M7llTBlwnmEiMlfovkfpKcvXG5pLh?=
 =?iso-8859-1?Q?ZASiPumZcvcoAKKfU/9YXRf4Aar01Bq6rPlFN5/zWm+h66kDODmRhrbSZ0?=
 =?iso-8859-1?Q?qnVcbU2sZsIkPUodYzfdTunOa3HKfoq3BRrCi2RtbxwmgtE4gQQYBPLzSQ?=
 =?iso-8859-1?Q?pRUKTVVF6uEqgYo3qUnrGfv201fqxd5+jHnjoHECH7P4fdJ/anZ11vzdkK?=
 =?iso-8859-1?Q?t7S+136a7QqVuf5iuZ+vgryxQ2245cpraHh+VmwZFGptrCPiAGEV+lkjW8?=
 =?iso-8859-1?Q?VRNW3kOoUBGAZv9d3oeZb3UK5BDv0AL5pcwtEXofF1Kwq/kOUuT6s5rknW?=
 =?iso-8859-1?Q?geAHosfEoeU1UUbpfmnapvJdji0tpo/91lGstNITWXVazYEFR1Tnfjjb5L?=
 =?iso-8859-1?Q?oIm9v04sp5h5YrrspzqiDysvXnHgl8RzvTCRjLJl+4/CYcOCWrFeJrjuL1?=
 =?iso-8859-1?Q?6pqPKHPSB40v708LEUg19L15FYDRP28BnoJYc/I6Mq3xTjDfbQcHjRp1Tr?=
 =?iso-8859-1?Q?6qHx6vvZlmyxxdD74kfzrqSxUaYXLkzXrDbHxzRaFHCUD8Mp5hCrzulfE0?=
 =?iso-8859-1?Q?BYXdzQq14vQNKHnpjxXM7qZYYRUsNqw4FW5CGnq/N8wtQ8KdWev8u6T9oD?=
 =?iso-8859-1?Q?QJjCCL9rFtCRFToSN2oVWP6up4w3/jur2zGNLvqqnih0TYtfkTMmNY6wcw?=
 =?iso-8859-1?Q?2OXUl3BMa3v506JYAJOFDv2xtlApWVjcuEKbUiEH4KbG6TUmgNta5Fb0Tf?=
 =?iso-8859-1?Q?+HDgju2yIExh/K2bPazOI/sy1QsMHbBFUSUG7/+bTkBaN9KB7943K7Bl5G?=
 =?iso-8859-1?Q?9DHQsA0MotJqnJDzmjetzkc4Gz5L7A305TI7WJiR5rZK/M73q8rFrLAvNt?=
 =?iso-8859-1?Q?w3/9O3X6XbPqH58htl/93cOMo0ecJTkhe+IFidN8U1I9WbRskANsVo9Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b8f70ff0-1b96-40a1-f2b9-08de2ec14017
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 21:01:07.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voqOz5gPxKl0kL69oQVFdSNm9koHOTOmM50kubTNq52S1JV+ef5uhc4XFTahX3mVdBZuyY4/P9Gr7Q8HG0zeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
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

On Fri, Nov 28, 2025 at 12:57:15PM +0000, Matthew Auld wrote:
> On 28/11/2025 10:46, Thomas Hellström wrote:
> > The user can give advices as to how the CPU will access an
> > address range. Use those advices to determine the number of
> > bo pages to prefault on a page-fault.
> > 
> > Do this regardless of whether we can find a way to avoid the
> > fairly slow vm_insert_pfn_prot() to populate buffer
> > object maps.
> > 
> > Initially, fault up to 512 pages on sequential access and
> > a single page on random access.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo.c | 18 +++++++++++++++++-
> >   1 file changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6fd6ce6c6586..07d0d954f826 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1821,15 +1821,31 @@ static int xe_bo_fault_migrate(struct xe_bo *bo, struct ttm_operation_ctx *ctx,
> >   	return err;
> >   }
> > +/*
> > + * Number of prefaulted pages for the MADV_SEQUENTIAL and
> > + * MADV_RANDOM madvise() advices.
> > + */
> > +#define XE_BO_VM_NUM_PREFAULT_SEQ  512
> > +#define XE_BO_VM_NUM_PREFAULT_RAND 1
> > +
> >   /* Call into TTM to populate PTEs, and register bo for PTE removal on runtime suspend. */
> >   static vm_fault_t __xe_bo_cpu_fault(struct vm_fault *vmf, struct xe_device *xe, struct xe_bo *bo)
> >   {
> > +	const struct vm_area_struct *vma = vmf->vma;
> > +	pgoff_t num_prefault;
> >   	vm_fault_t ret;
> >   	trace_xe_bo_cpu_fault(bo);
> > +	if (vma->vm_flags & VM_SEQ_READ)
> > +		num_prefault = XE_BO_VM_NUM_PREFAULT_SEQ;
> > +	else if (vma->vm_flags & VM_RAND_READ)
> > +		num_prefault = XE_BO_VM_NUM_PREFAULT_RAND;
> > +	else
> > +		num_prefault = TTM_BO_VM_NUM_PREFAULT;
> 
> Ah, interesting. Do we know if any UMD is making use of these special flags
> today? Just wondering if this might be a visible change or not? Also would
> it make sense to document/advertise this somewhere for UMD folks, in case
> this has an immediate benefit for them?
> 

I also have a question here - does Xe / TTM support faulting in THP on
the CPU side? Is that something we should also look at doing based on
madvise / global THP settings? Would that help mitigate the slow
vm_insert_pfn_prot too?

Matt

> I guess would be good to add an IGT which uses both flags, if we don't
> already?
> 
> Anyway, I think change makes sense,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > +
> >   	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> > -				       TTM_BO_VM_NUM_PREFAULT);
> > +				       num_prefault);
> >   	/*
> >   	 * When TTM is actually called to insert PTEs, ensure no blocking conditions
> >   	 * remain, in which case TTM may drop locks and return VM_FAULT_RETRY.
> 
