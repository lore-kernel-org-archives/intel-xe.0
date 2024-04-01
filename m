Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 475F7CD1288
	for <intel-xe@archiver.kernel.org>; Mon,  1 Apr 2024 12:54:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B3A10ED4C;
	Mon,  1 Apr 2024 12:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDha0ci+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1387B10E6F8
 for <intel-xe@lists.freedesktop.org>; Mon,  1 Apr 2024 12:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711976072; x=1743512072;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0rLRGjccPmhAlpPFnNTwok16iL7dq7ooWpB4MMBRNmE=;
 b=GDha0ci+Et2hEJge2qKJesjEtx6XEO40x/kFU4DVwFqnma2DoxsLY7C0
 koFRWEAHsH+c03Z4hF7aNMxIoUW2RQOHOOcaFauybg9RyGiXNwZoCVwh8
 SpJu5Xi7KbZXzs2cD6fU7yYdZQf/InPKrOQ6reW3cCaXTF8NZCwJo5tXp
 47x17ydr4lFnxMndnevIPbpwCsCbT37WDQr5eljapuO550yxoPtIhoslH
 ZswpzOiGt52vepZ0wRVie7Lj8LtGuUJQFC0MtwVzO2V9ZAfOvDh3cXMCl
 P6pBP1SUOPJqHPgMA8pCmoaDH68t0KzCRGTnQQGMeOi4Pxqe0Xu9iTN/U A==;
X-CSE-ConnectionGUID: fNuBd059RYCFMeSCuvrWeQ==
X-CSE-MsgGUID: MuxGWqRLSpyQTZ51ePqbSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6964315"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="6964315"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 05:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; d="scan'208";a="17529112"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 05:54:32 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 05:54:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 05:54:30 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 05:54:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 05:54:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2BDO2ySW//Ya6z7GSzePKZgWtI+NKlHPySJO/54ijALXZKcVB9b5d+2jWSU/zIbdqT/PxQmF+N7PaL+SPhDnn4tR5WKCyMg3MEzbuwQpg13wXDJ4gl7KsQfO0qKrue3Ubcx+jfDqDqPEq1nvXW/eSPnXSvre391Rexoew4MBMviXa/8BJlFzAV5Bn+Q9T40V6TwLO9JNIHR1viCVL13Kq+yHmsX7dl187QBEJ+S/hKK8V2fkPNXTMmKHxEGUsor6hhuuOss4DbP5cg6QX2Uw6TvlTeri3DaMlUR76V9bfytfYISseuOQ1yOKyyzxuVLHLb3dzhX0Gvdu/xOmkHX1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rLRGjccPmhAlpPFnNTwok16iL7dq7ooWpB4MMBRNmE=;
 b=EGSffRhourJcqs5MWqjHgpf3x+Rk3sIpXXtTdY1G5hV7RgsRcoIsoxdmb4XeRDdRFr6h5xlvuj9s8azkPcd/W1BH3vcHIWctKHMVE0/Xb2O1Mv5ovHLhT11fxMBSxmKl64SBUSsbGJUuMaVrg8eiPwP1OOUK7vTdOnikKjsVnPThaXEtCfTgJ3v2annLJt8lq45AgIUXTnxcZXybB1wn49GxTy4h0Xh4ioSyWoMdXBongR+2G5oorW0jOTRwwZbh+mL5cB2UJy5lY0+8oPIQtwLIuEuLMuNNoxhWoCWCxQ0Bb28juEF4DBLo26Gf7rGfFrViSl25i8ETg74K2zX9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6082.namprd11.prod.outlook.com (2603:10b6:a03:48b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.23; Mon, 1 Apr
 2024 12:54:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Mon, 1 Apr 2024
 12:54:27 +0000
Date: Mon, 1 Apr 2024 07:54:21 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Update GuC ABI definitions
Message-ID: <fwbgnwpthgurnrnbofm3wmeviqh6laehk4ulf2e3hxinphnzyj@fdaweorbztji>
References: <20240328183147.495-1-michal.wajdeczko@intel.com>
 <xxpank76lzfhakpmqa5srfqzq3fnpxlklttseyczfrajemvjzz@iqxhplnfmpcc>
 <92f47e87-a638-44c3-94a8-34f901a92eb5@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <92f47e87-a638-44c3-94a8-34f901a92eb5@intel.com>
X-ClientProxiedBy: SJ0P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6082:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tt8g4Kwx5236Lf0hW1ta32iRlhJATEMl+64nAl9c70Fq9JieTBvvINJStjLjmy3gRjzIrJAKdvICHbjRXNx//s5fnsMnS122PkLjvZGJFG7H2/R4Te5E+AEiHp1FTLbXxj5VAgDhFPItkp1n/U8BFDMKv5bu1WKT+jnUBaWzvLM12gJDSWK3ODHZSfAEAPC3HiDvLw7hoxE6uDjMI7o9KisJDsicfaLhQRcjXf5UGmnKmzyVwwpW0PQxQBLMk/Mm7EEliJI45U/ERL+/8jcT9wqAcv7aDNQq5hjflcDkD4X8YHJT6azKvvvQq+kBX1BEhSv/k/21fTl+855EHKutgI2A5OWcZNsNqelrlGsssQhjfAsHNM4oPkLo/OS2xcC+rsyJy92uGnO17Qh4UegCdKsEZqNUAjz0H11eadHI3kPrql6oFHncTf4ktTQxXlLCjsQhddwowj6FwtvKcHPQnOBF8jhESX6VrVFMM6mBYOhoxxWThexYx3Dw/oI/Ok5S5yeg0t9hp89cS9SIMMhR6xPP8bc8bRKHzrfulR+0bqxsXH4oXyxhUqpP1TAkTN2LJRvZQ5zHuI5EMLo7HjqKtajAYo+vRWfII1PCb+oOz7Brh2ZyrTu7IXlOzuwg7e60Ond9rH4MXs0GnWnApBDqAiSLarEwPS0ZoUHgiWVF3Fk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(27256008); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B9PHWgJLK6zIqtTucB/qO13KHAW90wiuNxSImdtQEzK10TriLFghh7SSPxIg?=
 =?us-ascii?Q?5Wmjm/6FJfSDNblCrNGKtj3H+zRQ210EkUW+Nz5h/qBvv5LoIaTHWfHzIlfO?=
 =?us-ascii?Q?wkWZFITFVzWKc2SLyVsgkktMRJS4W/LS7nxexTQZSiynE+wq51pY0mT1Wgui?=
 =?us-ascii?Q?ajjMEt8INlkSA4l0BsAYjFMmxUTqK0g+EKQ+88IAprZUFMj4kiER10udcxFR?=
 =?us-ascii?Q?q9ff1+awyavo/FD7M15XovRt/rkpPx+m+T325Ww37DmhO9WNYZLnBVOJ529M?=
 =?us-ascii?Q?2YTGoLYJZqlT/MbhK1qH5aZluUGOhEzKyuG7Q/WhzS9upnHC1NVBJEtHs6R1?=
 =?us-ascii?Q?3ZZu8eF78ZH5dm/y/XoqDbvXn8IDNpOo5NVV0+fBhndlX0p9gbc30a9UFrtJ?=
 =?us-ascii?Q?dFBKy8hw4+NPlB2haPacI+LToJQOVwTTlGCnu6sT9IDgxJDVhM6qqV72HZLA?=
 =?us-ascii?Q?bhmZ/uKU5oLK9kvdq2a8QbsBpFSSH0JgvzB+Pbz19B4mhPuDLZe1UYEcyWQb?=
 =?us-ascii?Q?T+/sDkdKhpenlV+YMfIoXhD8RsJGaoHYJbTFqA+7aOSjDvIycc4KDkCIPu7c?=
 =?us-ascii?Q?iBfCGg5mfuW0GCiujgOSDXf4HbWWEYuepney/b+I0NdBq9pvKTtNCLiRUHfS?=
 =?us-ascii?Q?iWfTf6h5DOUg4bU0XG18rpMWzL9j88g2qXsGOgQkKcoZrN2tIv5LroxqGe46?=
 =?us-ascii?Q?xJpS7Hc0SCVWHPTlbe4ySu8MntTyZNXy4MDlEiFaHZpCSbCskS0p4Og7S10s?=
 =?us-ascii?Q?+EW5MtG+SKAPLGf5qMEaImrNmI8/ffItMLXn7+GGsZiUR6Op5Vop6JgXtYIB?=
 =?us-ascii?Q?br20OqyX/Pz/xLJbDaKPPIT2K5HR/xC4vmOaXzSGMvYlsj+GQfLJxvsyKrPE?=
 =?us-ascii?Q?9iE/cn/lvDdehz4gSJ9dA8iwmSTCo/dOKW3WvBd9sbuPCfSGSDZht6Rc5NmY?=
 =?us-ascii?Q?I4S6A3IzJBp/d647VXzH5uHPDSe9ex7oJ57CsJAHTS4qcgO/QurY5cP3bIkP?=
 =?us-ascii?Q?5ozK60VoKLo7L3QXLK+Rr9ZJlMUp4jCdpLzs8EhE1ozt7c1t4Kx8156lNpXu?=
 =?us-ascii?Q?shXq4uerRnUPgVSkSIWfeOKn5u9Q3NHBU7JJDPymWmYNS+W6z9jcs9V6kziu?=
 =?us-ascii?Q?F0FWhBpFiA2K8RlFVNmzsdYZXr0d8+nAO3N2+Oj1NaVKIiYG4HXwqQRKe3cW?=
 =?us-ascii?Q?4z1PMbUCVW6MTGyYqZPMb38aevzQ91DqKwvpHhGZFuoCD6IjxdnsEhPwL9y4?=
 =?us-ascii?Q?3cFKdmX33T8XxlYs5nr2hvb8ZlSt337gIUBjEQnLrLzdNDU7KWtR/23bCsjR?=
 =?us-ascii?Q?igb3pTJO6+7Elx2H+92V5I2FV26OT7S9+iUqAxZqldgdyDIWL6l0w9tbx9l/?=
 =?us-ascii?Q?BlQiru3jkAp7VNThv1v1b+93GyJrt5rlxpm9Qxy5MnY3B4Y38bnH7PeQ/kiC?=
 =?us-ascii?Q?Kp5MSpNgsrIfbSnQrJN+lhbScFPhz+b3tqGGc2smRBDuWGOlOOR8nIygApma?=
 =?us-ascii?Q?HCNUmvQ4gc+yb2rOuweeiFELofL1jlfEixwXDVKnoz8McGTmzEBogfxwvBRo?=
 =?us-ascii?Q?VvJzg2FAPB5ycVBG/WvC0KY2JSO6hre6nUJKdigsuPRAFZ4Yr3FDqYnwwXsQ?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd494ad8-a1a4-417c-1fd1-08dc524add09
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 12:54:27.0840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3HLg4wJ/M+xtN7XWlp08Ju66o7z7MYGZOFx+mIGceGflRqX2ozXXEYNHhxYYFMOI+MIPbPGU+KKuPvSlJAF9p04WzoAcUNM1N+LgH+8XrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6082
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

On Fri, Mar 29, 2024 at 05:50:32PM +0100, Michal Wajdeczko wrote:
>
>
>On 29.03.2024 17:14, Lucas De Marchi wrote:
>> On Thu, Mar 28, 2024 at 07:31:40PM +0100, Michal Wajdeczko wrote:
>>> In upcoming patches we will use additional messages in communication
>>> with the GuC firmware. Add necessary definitions to our ABI header.
>>
>> but it would be better if these additions were done when they are
>> needed. We don't want to keep updating this with things that may not be
>> needed at all (plans always change, ABI may change to fix bugs, etc)
>
>fully understand that, but...
>
>this ABI definitions reflects what current firmware already supports
>and it is just complementary to what was already pushed in initial
>driver drop without supporting code:
> - [1] GuC VGT Policy KLVs
> - [2] GuC VF Configuration KLVs
>
>[1]
>https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L114
>
>[2]
>https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/xe/abi/guc_klvs_abi.h#L154
>
>it will also help me lower my pile of pending patches, so maybe there is
>a chance for a small exception ?

I don't see how it really helps with reviewing your pending changes.
IMO it will make it harder. When you need these defines, just squash
them in the commit you are making use of them.

I'm looking at this the same way we handle new registers... we don't
just dump all the registers the hw knows about into regs/*.h

Lucas De Marchi
