Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809A0C3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 20:06:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F12610E7F4;
	Thu,  8 Aug 2024 20:06:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQNijQtk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774AC10E7F4
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723147601; x=1754683601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+DtzwYiVL/6ZXBc9I6YhqcfD2w1R4qpVbY7bgXOjHXE=;
 b=RQNijQtkEExa8vx0zokCPNGC4e/IKM4r80RoKKkJDxRm8ACdgQKa7yTP
 5U1n7Z4/GFzA541z9nLJmvGIfPHFiOTeSGZPt5UCiueto1+Ao8woiSEMH
 HUp+CQH0dYU1wj77yQo6M6kpP3xiN71Foo78CaOnOBJ3ISiP1UX99V0EQ
 s4gf/zTSKZkbY0XNp3bCIdaHcbOC4uOOjzma+A/2u/YIuXHwauHN4Fjk5
 Lhkv9oDc5N5e7oSZXcprvLTxFpO5aNLanfU5tKD9T59IfbWG3L9W5SNdG
 WQeK2puSsrunEq/YeVsQcSUgCPneicilXW96FiZYlyMzUHKH6Sz0qNuEl w==;
X-CSE-ConnectionGUID: rozvRPJpTBC2l83V636x6g==
X-CSE-MsgGUID: UzENq+O8SdeNqI6dsDUBPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="38757054"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="38757054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2024 13:06:40 -0700
X-CSE-ConnectionGUID: FXdFyiNRQeqS7hqmVtDS1Q==
X-CSE-MsgGUID: +tRX4aS7RVq/yFvnRfxY7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; d="scan'208";a="62181129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Aug 2024 13:06:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 13:06:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 13:06:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 13:06:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq4dVfLcnZnRN8ivwkWD4MXc6lF1GkMsLk7hUxktELxtkgRULilvchJhTbwfsrhdOn7QkKW/qpyLF03LgAIo17WjWtEKmbB+HDZsCckf+P+NVu3eRQj5TeQYbXHZ4E73DuDODtunVLSzChzXpgbRnOK806S5i90TeU7uCnROdDL0yV/IaR6lmza8QjyI6qHWvPGqe6dHTJsGJVH7tfDazoqC3hc3iDoCNi9X4Q17BngSdlrApoJu9AlPXCXekCL6lSK3u16NGi9nur02KEp+XEnVUNlOs8YxBnsYYKRKDKCCZ4dV0r6cZP9iCzelXGnFYSzlj0DYfuYRIj6izT4f8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LY6seYbda4RXniUKwZa76pc8BjuBUFZ+aWflEuMjNRc=;
 b=tNwNUOF4Yl23f5DrorHDsdtRw5BkwVvnw1d3CJE75Hhhr97GoKDyOgoGihtsbKPknZBPXbJQ+jP3d3+boMCQH1YiLu2ld1KHq+m0S8teLXSSTzEYtUl/Tm30iu3ccDe4zlbA2NXwRShzJ8HIyj8QToqbQMNzlfZTofAIfv8nswmuMIvIlYq1FI09IjWJa3oEdvR3Vlqoq+XwCIGqYTRb413dKF6BM9UArZbjKiAscTnER4z0eVgPEvcxhzQ3S3UORfEzc5s7SUAnDxIWWhCCp5X8K0l7FuZjLQGf3Ex8NDyxnfyYp+iZTru6OO2xcvx2ZwbtBu4gpdwQi0/m/wtVeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 20:06:35 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 20:06:35 +0000
Date: Thu, 8 Aug 2024 15:06:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/4] drm/xe: Fix use after free when client stats are
 captured
Message-ID: <hcei7qynqzjriwo3bcmt22md3wvih4ziu52dlh5peictr7t5jd@pva37hjurlfc>
References: <20240718210548.3580382-1-umesh.nerlige.ramappa@intel.com>
 <20240718210548.3580382-5-umesh.nerlige.ramappa@intel.com>
 <Zp6sSSI-48U0k37e@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zp6sSSI-48U0k37e@intel.com>
X-ClientProxiedBy: MW4PR04CA0130.namprd04.prod.outlook.com
 (2603:10b6:303:84::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e2aa0b6-0067-460c-441c-08dcb7e59b04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KuHlgQwWKqFXxtYAnTeJv13BsSU/1je4WARUMVvVnKwbgP7WPH+fiEmHfey/?=
 =?us-ascii?Q?wL/clrFqA3KWFyTUgM1xbZqK+HOH8qSigP1fq36I1Lx1UZdJuV9tfVoJ+GC/?=
 =?us-ascii?Q?g/K71u+SfX6GHeGH3l3Zmu6IDBlW8vZP9ROnwWv76P9pvI30HmkpMjNjNRlD?=
 =?us-ascii?Q?BhVrhBj6HEyQ6OzT81LQXYLVlQDWmCVD+z9qIQotqPsEtF3/88zvAFtZqdrw?=
 =?us-ascii?Q?Gdw4qw7FKN/xXyyNq1kBh8jrN2TPIIPG3kcMhZkYX9TlIEwtiFt3RVWJGxDJ?=
 =?us-ascii?Q?M99IbKWyMgLJk8D60qJdS6A4M5FgG2bC6DW96UVuUaAX5kM1hoDjhZbIgJ6y?=
 =?us-ascii?Q?Gy/56Gm9xEXUiTGkfCzfyGoVPnqxKPvqKVzhrLwPedqTqCX9B/Mq5RTol/gq?=
 =?us-ascii?Q?Ve3yrHxT3ISfOaEui1R5IXCQn4sIjrgf/pv0h/rwb/eQMfKXCIoO4FWyx/B6?=
 =?us-ascii?Q?18gtD0eECGX5ZOc9ly/S2lv/UWkCdxZOpw+CS5oDPWmd+fhTTxq/DfcGoCR0?=
 =?us-ascii?Q?TwQA+eUXHDmb5ueIvCpm3vmgF21shDozv49RG2i4kMhqnwdY6RgiwMKs6E9H?=
 =?us-ascii?Q?0Ziymkxzd8cqBB1FdNVzL5OOLh9r6aDPeUimOhpHQo92CZ+Jgak8QCv4/lJR?=
 =?us-ascii?Q?W8KFPc7oyKsoaFpLGoUaI8SczB+J8Urtgvzw9H9/P/csSpT/vpToPSCjvtHr?=
 =?us-ascii?Q?EbHbhDsKjRoMkORl+fEqq0iZRuasLfH1kmXd16qAJVNlBIeEb/uSc+Wr0gDe?=
 =?us-ascii?Q?iNtFuHRbHJ3aT+X8MXGIsJQqlaNtS8KLtle3HSPfB6I3fE03BZeDK8qqgRn5?=
 =?us-ascii?Q?p1ZOJNaaF+7dCVR3pths+47qum0Wxkyj0y9BLibth53JiaSV693glTDCR3Bv?=
 =?us-ascii?Q?w/pkAr1XRlt2827rYUjIvzUzUIZcT5odhcEw0g2xFAAP82E4AQF1SDQFOsZg?=
 =?us-ascii?Q?Q4eMreBlFCmflvuu68hUQcyTHUZRk/qFd+pyywrv04frVSHRhplfWZiJZet5?=
 =?us-ascii?Q?NB1iw3xarF+5n6N40JQk7xdtBzKdYDjn8ZziHK6VmE8//QpinuEuufRnOGEC?=
 =?us-ascii?Q?PTzCsLhkI7JVK9NxIr4m8ZxLaYZJKRmIoTmEAFFMWl55vuGO4Gokhx4Ns6cn?=
 =?us-ascii?Q?soD4HPQFwFvVYhN3l2KE7/XlBgT9b82RMO61uf5PPXc5d8b2HxthFtv0TMMA?=
 =?us-ascii?Q?WTKd90ysGTESEuNNCAOaXgN5w2lMibhvVA5Prd8AuAXwLDkquisfV8vp5ZJK?=
 =?us-ascii?Q?X+G0drz0TFC3oQICR6e9TnpbJYIMnQMv9cftYPRqpfSJzg08eSSgVraFSZI9?=
 =?us-ascii?Q?+GI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bqyaDLVEzwuihNMDMpefBTcrrNHAwHwAH3h5Q+0E6KCSWrwy04elTwwHWc99?=
 =?us-ascii?Q?JrOsP44XB2MgPlKYEaOByp+jZQgsNGKPqcD7zDPJhewFa0SrnjDvG/O4T2dk?=
 =?us-ascii?Q?YnCbSQNm0lLe0cEfjdL6s4nX4EJu6pp4jCVxAVvL0tPXA+Bi/21+S2OdUSja?=
 =?us-ascii?Q?SC3WfHRCx311/r/W/J0/OorItOKfqgjoAWbQD9ZA/slnXs438eu9ArGdc1Rx?=
 =?us-ascii?Q?DMw3rBfam02p5HTw7em+zb3ZoPTIMLID7K0ZeCK9sIfSuelMSSKzpRP9Vz0C?=
 =?us-ascii?Q?nSTz6bGsZpZ5JC4wmlI8xRHOvDHNxsaTRGU0bzNQjvPv8KzkpWRXgjr8nWyt?=
 =?us-ascii?Q?zxRj/OZ2dwJM5YV3B/Ktmmf22UorJnq5ArBIUCru5MGdBAmhHptxTcD8EC2y?=
 =?us-ascii?Q?HRLQx+nUBCka5OTzXx8tXMHLh4Qz2DnmXSd+Fhl5+0gEiBL98Jzjg9Nh/qYl?=
 =?us-ascii?Q?z3g+Pc05bDbrUlgmO/w0O9SyJEEOq3vb0vFtg99ALbpIfZhuQRwcVMLv9Qre?=
 =?us-ascii?Q?JLQHoiYCVzcYSKT0ZXXu7cbOaIknO0+2NcDTBT6Mwj76qK5AgEvxr2/ahfNR?=
 =?us-ascii?Q?jGXLe4p65TJLjA4iKHBvqYHwvaL841rsAlgRZ4TM8GsX6fBBzYd1SLpirodE?=
 =?us-ascii?Q?MMYplWbHcNHKDyQnPho+qFFW+2HnejW3pUrFqJj8Fwp6kmA6tn5TRjc4rbYV?=
 =?us-ascii?Q?UJZ0xfs5vkRO1gOeMg/hIE9SzD+xRjy+hvwZQAa/3WR+QB7PoscoaC2xkbmi?=
 =?us-ascii?Q?bnhqdiMt2EZ9NM7tDeHOp4FE8fAdzsPuGbJwFcFw/bh6lc5sQGB4FfhH1sGm?=
 =?us-ascii?Q?tWbMA7+YDMp6v3dwW9yD86b0Ta6cCEHMtI9TKs/02rFgFHQJG2t0EB2vET8s?=
 =?us-ascii?Q?CLoGBe6nFcugvH1AwtaZSEEK4lbMWux/BS+zJBc8JJhPzTHcMK7AJabJ1MBx?=
 =?us-ascii?Q?HCNZRw/vfSulwBXP/kT7cGSo9gvslgWqCX7k7VNPFt+eGnY9OFoDl+HyddKu?=
 =?us-ascii?Q?d/6k25cbFr9RPvX0wNrPqTzYnk6rUVvihTIrG3Ow9E8FBrE5niKm8YMTiGFK?=
 =?us-ascii?Q?iDZJLozLM/2v+FVjwDDzS0zj4+DRQbVllW9eZ1BOcwFcDiLaCGcs2aQg2Q1I?=
 =?us-ascii?Q?oQs/8VXuW/p4W2LNQhA5mcMGYlWFAc+uoyzJr4IVrcDaEGTiau80SSSI4haA?=
 =?us-ascii?Q?P2aORVu+tScdBzwQJNFjW39nIIlsIXzzhV/3FMIuA8lSkEn6OB7Fw9uAn/am?=
 =?us-ascii?Q?kzb36D5EJkKRtz5ZRivvjYGMeyWxAj7DwFadRZRyJc5U0iN3zP3qerNrHO6r?=
 =?us-ascii?Q?DiIHKpStEy5pk/t0P1ahq1rvrryYMZ8pmMa81G3BLvv5HFk+W/G+ecJkdtKZ?=
 =?us-ascii?Q?EAuyymbsQYDX/FqLRLSAPgGFoI/4V3do5ALOI4/iW3bUjleOEaMn8rbt+xSX?=
 =?us-ascii?Q?OOIpnk5LQKT9GuGlZObempVwqKocrMqhvdXI9QMjhUVq0wFUB2pSLljuRyYx?=
 =?us-ascii?Q?kCgkeOFPQWQWD6PdgcXtVkN/VP3ywgBOUXzUS0LJ4gYD1s7W69EzPMcrOUUw?=
 =?us-ascii?Q?qiAktW4jQuAGCVvulaGlEsnlaHay4Szdzx97oU3PisRfZlDQNhOXoRr+7m+C?=
 =?us-ascii?Q?+g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2aa0b6-0067-460c-441c-08dcb7e59b04
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 20:06:35.7844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWvVJp5Fn2VYpjlmw4EMYqvV2P5RNF3HSk5sjuXJg1msIef3oS5p1Y7tDeWeZNZLuSnu+OdTHHDwbxLv2wXtCfAQNghg77Z3aQhhDLxzd/Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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

On Mon, Jul 22, 2024 at 03:00:25PM GMT, Rodrigo Vivi wrote:
>On Thu, Jul 18, 2024 at 02:05:48PM -0700, Umesh Nerlige Ramappa wrote:
>> xe_file_close triggers an asynchronous queue cleanup and then frees up
>> the xef object. Since queue cleanup flushes all pending jobs and the KMD
>> stores client usage stats into the xef object after jobs are flushed, we
>> see a use-after-free for the xef object. Resolve this by taking a
>> reference to xef from xe_exec_queue.
>>
>> While at it, revert an earlier change that contained a partial work
>> around for this issue.
>>
>> v2:
>> - Take a ref to xef even for the VM bind queue (Matt)
>> - Squash patches relevant to that fix and work around (Lucas)
>>
>> v3: Fix typo (Lucas)
>>
>> Fixes: ce62827bc294 ("drm/xe: Do not access xe file when updating exec queue run_ticks")
>> Fixes: 6109f24f87d7 ("drm/xe: Add helper to accumulate exec queue runtime")
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
>
>Hi Umesh,
>
>first of all thanks for this fix.
>
>But I'd like to ask you for a next time to provide the fix in a single patch
>or have the first patch as a dirty fix and a refactor on top, so it gets
>easily backported to the fixes and stable branches.

I think the most important thing is to have them in 6.11. Worst case
scenario is to bring them to 6.10 where the bug was included, but I
don't think it's really needed: there was already a stop gap solution in
6.10.

>
>For drm-xe-next-fixes I'm now picking this entire series. But for any
>stable we will need to provide a backport that applies there.

did this pull request you mentioned fell through the cracks? I don't see
any of the commits 627a24f5f25d..drm-xe/drm-xe-next-fixes in 6.11-rc2:

$ git log --oneline v6.11-rc2..drm-xe/drm-xe-next-fixes       
0cf3f7297d01 (drm-xe/drm-xe-next-fixes, drm-xe-next-fixes) drm/xe/vf: Fix register value lookup    
5beb9a114a42 drm/xe: Fix use after free when client stats are captured                             
bf5ef88cebdb drm/xe: Take a ref to xe file when user creates a VM                                  
6896cc5479b0 drm/xe: Add ref counting for xe_file                                                  
676a56fdbcf8 drm/xe: Move part of xe_file cleanup to a helper                                      
ea0cabb53f9a drm/xe: Validate user fence during creation                                           

And I don't see them there through other branches neither.
Could you include them via drm-xe-fixes?

thanks
Lucas De Marchi

>
>Thanks,
>Rodrigo.
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_drm_client.c       |  5 +----
>>  drivers/gpu/drm/xe/xe_exec_queue.c       | 10 +++++++++-
>>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  7 +++----
>>  3 files changed, 13 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>> index 6a26923fa10e..7ddd59908334 100644
>> --- a/drivers/gpu/drm/xe/xe_drm_client.c
>> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
>> @@ -251,11 +251,8 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>
>>  	/* Accumulate all the exec queues from this client */
>>  	mutex_lock(&xef->exec_queue.lock);
>> -	xa_for_each(&xef->exec_queue.xa, i, q) {
>> +	xa_for_each(&xef->exec_queue.xa, i, q)
>>  		xe_exec_queue_update_run_ticks(q);
>> -		xef->run_ticks[q->class] += q->run_ticks - q->old_run_ticks;
>> -		q->old_run_ticks = q->run_ticks;
>> -	}
>>  	mutex_unlock(&xef->exec_queue.lock);
>>
>>  	/* Get the total GPU cycles */
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 3336a01a1006..69867a7b7c77 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -37,6 +37,10 @@ static void __xe_exec_queue_free(struct xe_exec_queue *q)
>>  {
>>  	if (q->vm)
>>  		xe_vm_put(q->vm);
>> +
>> +	if (q->xef)
>> +		xe_file_put(q->xef);
>> +
>>  	kfree(q);
>>  }
>>
>> @@ -649,6 +653,7 @@ int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>>  		goto kill_exec_queue;
>>
>>  	args->exec_queue_id = id;
>> +	q->xef = xe_file_get(xef);
>>
>>  	return 0;
>>
>> @@ -762,6 +767,7 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>   */
>>  void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  {
>> +	struct xe_file *xef;
>>  	struct xe_lrc *lrc;
>>  	u32 old_ts, new_ts;
>>
>> @@ -773,6 +779,8 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  	if (!q->vm || !q->vm->xef)
>>  		return;
>>
>> +	xef = q->vm->xef;
>> +
>>  	/*
>>  	 * Only sample the first LRC. For parallel submission, all of them are
>>  	 * scheduled together and we compensate that below by multiplying by
>> @@ -783,7 +791,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>>  	 */
>>  	lrc = q->lrc[0];
>>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>> -	q->run_ticks += (new_ts - old_ts) * q->width;
>> +	xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>>  }
>>
>>  void xe_exec_queue_kill(struct xe_exec_queue *q)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> index ded9f9396429..1408b02eea53 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
>> @@ -38,6 +38,9 @@ enum xe_exec_queue_priority {
>>   * a kernel object.
>>   */
>>  struct xe_exec_queue {
>> +	/** @xef: Back pointer to xe file if this is user created exec queue */
>> +	struct xe_file *xef;
>> +
>>  	/** @gt: graphics tile this exec queue can submit to */
>>  	struct xe_gt *gt;
>>  	/**
>> @@ -139,10 +142,6 @@ struct xe_exec_queue {
>>  	 * Protected by @vm's resv. Unused if @vm == NULL.
>>  	 */
>>  	u64 tlb_flush_seqno;
>> -	/** @old_run_ticks: prior hw engine class run time in ticks for this exec queue */
>> -	u64 old_run_ticks;
>> -	/** @run_ticks: hw engine class run time in ticks for this exec queue */
>> -	u64 run_ticks;
>>  	/** @lrc: logical ring context for this exec queue */
>>  	struct xe_lrc *lrc[];
>>  };
>> --
>> 2.38.1
>>
