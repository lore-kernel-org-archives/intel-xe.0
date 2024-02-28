Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8396CC47DD9
	for <intel-xe@archiver.kernel.org>; Wed, 28 Feb 2024 18:49:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C6E10E762;
	Wed, 28 Feb 2024 18:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="icoJpi4Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893BF10E762
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Feb 2024 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709146152; x=1740682152;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FF1GpINQIJFt+DWT6Z499Tc29eAx4w4Cknz45FF9cOQ=;
 b=icoJpi4Ql7uSOWGbj03H3847PAFwY0bG4YCuOr87BYoRwNQoNinASoO8
 5FLa7FsaSsJTX0Uc2aKLiLpLVwWnQRe4CcRcYirLMX6gyCvsjdJ9MtHVk
 shqPVfHm1NXjZ5Hw1LuCmQHvI8fkfCVC0Z1+87RO7ho7jV4R4FNRBswaE
 xiQ0qFaF/J6UOS7ThSzt16o/qhPhJGYFNemcTBnomqZfVQAHZjHFQmHUC
 yNHm4fL0GoeYm4077fLE2yHi32EuqvNDfpZ95atk6oNL7gNLVojn5sDDE
 EL50qB7gewJ7lVUhGlsYFPZKuChRg5IdXIEmKwVQvVbvV9rPMFaOY+YNX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3436859"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3436859"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 10:49:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7487869"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 10:49:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 10:49:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 10:49:10 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 10:49:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6hbx0CswlIuf4CizAaRUswCVAv/dUmf2eCvY2g/qIorJDwiv7VNRPFFz7P9PoUxKzjPzEoyBvkfuXdhFlo0fbOUWVDsouEOTXjl188DjFHp0CaQl3plBrYN2U2uBWAxuV9X97oifu5dxc7C59R0vVEOMKIzA4VPmIv8+MH/C8I18oGDxz4B72cl+8cHIIk89RgID9TjdY9nWtwKI/zVQIy4f+4mKCYv/MWFpofaQZ//ZL1xOnwBy+mmUdgCJB3MuweHhqPsscC4k/6t/qZMUosT9eUjvR5PzJevOweZHO/COlzUIE9QOZ/a8DGiUxzv60fQW/xUgqtdZDdiYVxqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Sv5qfPtTHjmhnahzretQE8fDSKot0HI3xjI6j7pljI=;
 b=WqFu//lJS2Df2S1KvrKIgLuCWyIAyrnEcez+fQV4w2dQ/HGD9YIaSTO7Rl3qg9kKWCnZOCV/RqGpuRM/MmkNaXa+Vf9YqwrpRwc3dmfu8Dy84GIpzcvycPYqhPf4Ubz4POMwUFFP9v9yBpgWGQUQE+BjiwrmBtQr2N7szlSDfVP49ZgOMNbP7z06UDJOlfXNOK52mMDLzrYiPGqB62+G3IocGVpKNGDNX2QW58bcTnaXyxwlr6iFflGpU5yMCBt0yJvl01nLkUkJlgAOHolqag65HqZscC2jKWvtXIC7WVm0J8818grM8Y9QLRGxsYlJuVlyczi2sKWhRcCGjoM/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Wed, 28 Feb
 2024 18:49:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 18:49:07 +0000
Date: Wed, 28 Feb 2024 12:49:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
CC: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>, 
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Fix build error in xe_ggtt.c
Message-ID: <zsa63c56nccbw4hwbq4refcbpnfrxamxgqo4wjukykvu6o4cvs@cykqrhdxiuld>
References: <20240225001448.81513-1-matthew.brost@intel.com>
 <98e9c8ea0f51cb308f02a1cf2ce61d06fd5bbc0a.camel@linux.intel.com>
 <Zdyw6OT/SDir+3Op@DUT025-TGLU.fm.intel.com>
 <2552f1145d30d79669cfae860abbeb361ce723c4.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2552f1145d30d79669cfae860abbeb361ce723c4.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH0PR11MB5234:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5095c8-0f9a-4e5c-ca19-08dc388df18c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xGqh3G2mUYIVx6+AQ3oTXGRSiQX/+Lsmr8jTPOGr1OwGg9XQhwaYlXZyyS2/giFUXzH7cRXlkAwN5//FlLFWdeEPm1uglTQAI+yZEEDLwrZAUDpPw/ZwMjWDoeAHV/jJxB424ycMYbib647cka8CcVHe+HFXb/rsW9Z0wsOoY8XSKH4DQIoVDRCwGNTXI3/mWZ8e7e3mI6CtB3DXvwBXUW5CjqjGqLtJVBFITzlciiFlmP/W0u871qxfxt/0wYik/JyBGbmrxDZHxKw3Mvsqmu4DhtkIO71yeFpSmQ+AtQw1yt8lEuGEHpSHUTcoYOC2EPfngiqcTxhpQoATmuA3yUopQKZiILJDfhKft9qvfvtSJw18C3J8K4DzJw0VjLD1RmVpFE9mdb4CDn3v6vpiO9Sp5xl/lRqCOMFkst0pmClwGhho9HZhwNursr2mFNMgIxpUp2cLDx3A1/cIMnZvxU2m9JlndOXSzvla9Oqm8XOQVeXl3pst1yN1SRQdvmTS/m5W32FBhaLaBQ06Xsxx5j6unTd4NnrUkk7gaz+kTN4m7JCbNDfLqk9EeK52n+P/qS7axTniQ+RFxq/STNTFqCyU6rivNRY9jTFtCwEoaAwQF/oUz/LraH3C+BSF57csh/CwKMhnk6f+aTjAGddurlp03EU1scvfsEm6UVACYBmjMLG4egJD/Gwn6OcPdzkJOK1XdaRphgTllRSsugIrQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(27256008); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HmP46bNBwt1TiGcF5QcVkdBsCb9Kkq0nopGSvmtm+N9uKueQ5EayMISpA7?=
 =?iso-8859-1?Q?n581lKVnnlNBpWCj3fjIkxKXRN/s4FrnPMhhpPKfkpGiefjeLGgnqbYVH7?=
 =?iso-8859-1?Q?LL2zUCYm07Umcf8Z7764qNe0xxAYMsfoMFIyFjnDEvBZ8q0LavgHG9KF+/?=
 =?iso-8859-1?Q?Ro3+eGvxJCdv6B9gR6XbR9Nulqn4kr1j/PrBgU2S7BTX70Sb9BlBg70per?=
 =?iso-8859-1?Q?yNdLHQX66DfQVkGLeaWOJm50c5VLgl1kUxN7RRzmZPyxDKznI2Ylvyt/6C?=
 =?iso-8859-1?Q?QvAw0VmW6PyByR0g2Y4UKvCdUT5ui0hDrxcbe78b/v9w6tjE7z2miarENX?=
 =?iso-8859-1?Q?QhIWT3OPQ5R6mVvknuClqqRyH6ac9Vf94weCvCHCTPb7qc8/VN6g+9gpZU?=
 =?iso-8859-1?Q?5CyOPktJ8DMNnrLQ/pRimjgR1BT2btXSdCU2o7l93w4NwBcCHEHBdp5xsE?=
 =?iso-8859-1?Q?v1W4ZKv14EPjNR3Vwy9mOuYANrIUKLPrYLTn+DBBr72cfA6lDbli4yDSda?=
 =?iso-8859-1?Q?Yo32noNUpqm89ACpgvpsArUHNyT/N/lNqsr3t7VLeC4+edMRi7rzualC4U?=
 =?iso-8859-1?Q?eCcjqjHN/+G7Bfq37vm9vo9GpZQoYOYnQsTiSeHQS9NC0IV08wnFRUM4IU?=
 =?iso-8859-1?Q?WVe19yD2cz9VyLYEBHL5g+9nJHZOaBPUG0rLiIfPuO5gWpfcd/1swnU5Gj?=
 =?iso-8859-1?Q?F2YU/S8Z3BT+zB/o0RhxWCzT2QIi7Af3w5HwLWVJwETIsIzuHO0GBfvAzp?=
 =?iso-8859-1?Q?+GSp/CviD9OfNeSYgX93HrQpvt7AB1LZd9330/YiE8aZu4u754by0LR91L?=
 =?iso-8859-1?Q?Ar7S6mjStnsgZjF2f6+PW9poDX1VSWHWDg5yvOeum+aOhTv4w9BuiwZBWH?=
 =?iso-8859-1?Q?rZ9ffc165SAre6+d1Br1TPHOV4ZE/lPoUHM0xEeWnzo7loHbj9M05Pns0p?=
 =?iso-8859-1?Q?ncJKJg2t7rUP1HBQA03jXiwnQqHYoNqp29AnKu2UyudngMgxjdEfGv8SWf?=
 =?iso-8859-1?Q?6UNRH7UD3FXd4JK/mJbNKHtzRH7of3H++5Was+IgqDhD2sJrBDwcK54Ida?=
 =?iso-8859-1?Q?sNh1WRk7CIJzdQU+Nz7l+vKNUm+OwGX/uN1NqxmieUFjr+8gIPyAsYmN4i?=
 =?iso-8859-1?Q?5q1CpyLcVGnnIcMz7ST/VIXzy4U+JTU3Ez3AbnWxKoARKzE70IsLpJ4AF9?=
 =?iso-8859-1?Q?NjvPjXjTCZBWmp7V8N8U9DBpfpZtGFRykjGa7WKLiNB03SNNdKxnFeayB5?=
 =?iso-8859-1?Q?psQ3Zs8rti7lUroRRGwzmQD7ZxXT/OxpjOEuhl4yAk5N3RzQIcqlG3QKS/?=
 =?iso-8859-1?Q?a1KOBogASSxghDotrF51ndvoTZ2Q0+RSu3HKETl9gD26quwwrF+thkh5Qx?=
 =?iso-8859-1?Q?mcnBkxEhvsftGXkN3Cq6bVJvAvPvO+o3GTCKXZT8KTVRQRLEgdsAoHcmkq?=
 =?iso-8859-1?Q?2DcZ4bcFa9klrh96lxLhZ58DNFTjByP63ciJJoLDSyIDLOcPhmC6moQSLE?=
 =?iso-8859-1?Q?RGpQDK0nVle6mxhwxQKAjL7JH5NZbDgxKUMaZRsvRMbmTCn1mhB+blTrT7?=
 =?iso-8859-1?Q?QnEWPXvgNmOw8uEnRlSEHXyuWoyRAkR70bK+UP/KNdXVEc1xdPl151fWC4?=
 =?iso-8859-1?Q?AYSYJoDiIODlKS4koc58aG4fXpSsBSzdDf59MHtQ74LoMASFdaWVrQcQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5095c8-0f9a-4e5c-ca19-08dc388df18c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 18:49:07.5788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N5oT5Zoh3tC3/LKp95kubKZBEghbmM9Sbm5g/p5KbiiuXguIuPkcnnw15GcOJ90DyjXoH/Dd6TCZoGmCPRQVTgO5We8DtCHgrQLTXmwTZsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

On Wed, Feb 28, 2024 at 03:47:13PM +0100, Thomas Hellström wrote:
>On Mon, 2024-02-26 at 15:40 +0000, Matthew Brost wrote:
>> On Mon, Feb 26, 2024 at 10:05:58AM +0100, Thomas Hellström wrote:
>> > On Sat, 2024-02-24 at 16:14 -0800, Matthew Brost wrote:
>> > > Need to include io-64-nonatomic-lo-hi.h for writeq function.
>> >
>> > As I understand it, the choice of header here determines the dword
>> > write order on 32-bit systems that don't have an atomic writeq(),
>> >
>> > So is writing the low dword first the correct order in this case?
>> > Perhaps add a motivation in the commit message?
>> >
>>
>> "Cleanup some layering in GGTT" removed xe_mmio.h from xe_gt.c and
>> that
>> file includes linux/io-64-nonatomic-lo-hi.h. Perhaps it is better
>> just
>> to include xe_mmio.h again in xe_gt.c?
>
>I think it then makes sense to use your original patch, so that it's
>easier to follow for each subsystem what ordering is used.

what original patch, I only find this one in the mailing list.
and it seems correct to me, following the "include what you use"
approach.

Also see some more details in commit 9a6e6c14bfde ("drm/xe/mmio: Use
non-atomic writeq/readq variant for 32b"):

	writeq() and readq() and other functions working on 64 bit variables
	are not provided by 32b arch. For that it's needed to choose between
	linux/io-64-nonatomic-hi-lo.h and linux/io-64-nonatomic-lo-hi.h,
	spliting the read/write in 2 accesses. For xe driver, it doesn't matter
	much, so just choose one and include in xe_mmio.h.

Aside from the "Fixes:" trailer, Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>Also note Jani's comment. We should use "dim fixes <hash>" to get the
>fixes tag correct.
>
>Thanks,
>Thomas
>
>
>>
>> Matt
>>
>> > /Thomas
>> >
>> >
>> > >
>> > > Fixes: 3121fed0c51b drm/xe: ("Cleanup some layering in GGTT")
>> > > Reported-by: kernel test robot <lkp@intel.com>
>> > > Closes:
>> > > https://lore.kernel.org/oe-kbuild-all/202402241903.R5J8hKVI-lkp@intel.com/
>> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_ggtt.c | 1 +
>> > >  1 file changed, 1 insertion(+)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c
>> > > b/drivers/gpu/drm/xe/xe_ggtt.c
>> > > index 5d46958e3144..717d0e76277a 100644
>> > > --- a/drivers/gpu/drm/xe/xe_ggtt.c
>> > > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
>> > > @@ -5,6 +5,7 @@
>> > >  
>> > >  #include "xe_ggtt.h"
>> > >  
>> > > +#include <linux/io-64-nonatomic-lo-hi.h>
>> > >  #include <linux/sizes.h>
>> > >  
>> > >  #include <drm/drm_managed.h>
>> >
>
