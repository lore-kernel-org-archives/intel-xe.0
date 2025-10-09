Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33C5CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:15:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B96D710EA6D;
	Thu,  9 Oct 2025 14:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AKNpn4Va";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F64610EA6D
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Oct 2025 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760019345; x=1791555345;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZGnWuEeHsonLPlVHyrtt/JZhICZEcq1zTcBlxUfyLnE=;
 b=AKNpn4VaBxCZe5lhnqnZDVf3C3wEgymINd2STzMn7FeyuyRnhGQmisyN
 31qoT8BjOMaMSXOxm+tRbS2jtRhbCdHhc83QGJeNe//nGBluFLNts9L0f
 Ec5q68Yr+sw2g2GZLKRw7J6ebtHEBuzhRCSi4wK2ND8/9sjzFMvwtDYJe
 2lXbKEsqAgUchmyKsU63e6cncaB6zoLTFCx7mtJbFPjPLC5cKJJXnms+6
 +Bu8tKV5l7TzVdLyd4DAMt9Q6MM8i78GbqaCqdmanJesFPmSL8iKDjjc4
 xuYARqVOjUNJux6fR6YEad7yX9dppfii2rztqbx1GWKu6yZ+m+yWTUQZ1 g==;
X-CSE-ConnectionGUID: zhf+9ou9Q2akXFDyZ6/FcA==
X-CSE-MsgGUID: l1/qfQgMRdaHcsBShL7h+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="65877434"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="65877434"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:15:45 -0700
X-CSE-ConnectionGUID: Sz/JvaW6S+i0P4rK4yYFXg==
X-CSE-MsgGUID: bOUduRwAT1GK7p7sNyd69g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="179836952"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 07:15:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:15:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 07:15:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.51) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 07:15:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNCiQAUgCdrOqt757vKcqD2ToAD+B19IV2vW4NpwxVsDC+c8MdtTw92iFCwhNJhhtJoDUCQQuAbIlby7HL+twACrPRdNb4hTzBAYkeGy9SgqdLTyt7+/ijkozTRV0Y6x1WlHOCCWNZUI/vfJWLdaeUZXldgwfqmdyQbTAsNYfIZii9moXz+CDOplzm4SFQNSK4IWnL5wkRKoV/k5gPRlnto42kBp59hd8lpieCby/IVVAN4EyMngKVs91SxjHyZRF82Rr/7YXJWq4/Zv/iPp348eSqei+csIH6TudPmWBG6etPqR3UTvfHKYL9OS9w1/R3dvvXV99HJBs4ikNtkGzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CNWBoUwsmg1bDMfoHE+p9pG1nV5OHpcp4lQ2m7Yqig=;
 b=CErGun/Pof7TnqSRXyAnaE6Lfec0tWH8dOIZghxj2B9hsWZ988swnjtfDcZLnpKMjoXD35sx3RAJzj/NOZZ30O0GgLalFLI+rx+QFU7HwvSNxlXtWCJVuKu24sCi/ovXRcaLgzleiWaJwFShX7ape83xxS4OPp8ce6aB8GxNefJ60LKkyVaIlxRZLvQMrNz1U396kzFPS9FiNGrBkhdd2F/s6XlhtPseQ7QDGUhGq4FImQ8E/kVXRVsqoPE7htAWIEeSrG6ssCLI8UjaAtuEGkAYfZZ334MAi4qAT3BTeLDSluXvzs5FnPEKafG4r9rp9chAtwVfxbT1ZZwT9HlH4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA4PR11MB9059.namprd11.prod.outlook.com (2603:10b6:208:560::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Thu, 9 Oct
 2025 14:15:42 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9203.007; Thu, 9 Oct 2025
 14:15:41 +0000
Date: Thu, 9 Oct 2025 09:15:37 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <heikki.krogerus@linux.intel.com>,
 <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v2 0/2] Wire up reset/postinstall for I2C IRQ
Message-ID: <bkkwks7j546u7qskxobxdd6xjohupriruopviuxog4hig37a7t@g7otn7xly3yw>
References: <20251009070304.3210101-1-raag.jadav@intel.com>
 <aOe71Yj-o6QFFXaU@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aOe71Yj-o6QFFXaU@black.igk.intel.com>
X-ClientProxiedBy: BYAPR11CA0097.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::38) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA4PR11MB9059:EE_
X-MS-Office365-Filtering-Correlation-Id: 605ccc53-eabf-4f4b-508f-08de073e5455
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iXz+jzwlLSUd1D4p/hUV46XQjlREq4MLdq+NhOuaDcL954TdeiiHV3+H57rA?=
 =?us-ascii?Q?Bpz8bBG71c8Sjmmwfmsgwh6poQomZZP+tlOHmSvcYTMw3zoh3CSeb7VdXfM0?=
 =?us-ascii?Q?bY61h5EfT18WY0Ag3gFLCoM8YHtKfX7cGyqMqvSJHDT7UnOvD/FDW3B03rPi?=
 =?us-ascii?Q?SHA0ExQY2USm6negUCK3iz7QwVdfvJBti8gasgkTvW0HEq9xV0Frfdo6pMwG?=
 =?us-ascii?Q?aBCTQFAEOgJEC8zJxhKvKA9lAFvampJJS457FCBPBqH2rfnswd6ShI2NDABP?=
 =?us-ascii?Q?Hif7r/wfObuT44pFZpnTFOmdQtS8xfb1DMoltsb7IC9NnbxsprfM1QcaKOZO?=
 =?us-ascii?Q?+iUL2bhbXucQAd6tCQ0k9Fc0B8xszJODoR5mPVEJPkbQ2TuiKfZ7qeXWQIPH?=
 =?us-ascii?Q?0oSRe8HQRROaStRu7TaZm55J8KiTEGLvatIPMt2MWRWU7uv3DO3hKFmO84h2?=
 =?us-ascii?Q?wLEXg5N/mQL9npYf3m0IY2LVir7SEV+LFQ785gWm/KerMSMCMwXFd8z0ME5d?=
 =?us-ascii?Q?iYdLPzUf/CPKrbX6+B07p8b6lJ72HdTtRRTPRlnJlpXT+Xif3saoPsu66qCd?=
 =?us-ascii?Q?HKaKRor0TWOrHyImp+BMzNgM1F2JUi5/NEr7PaLTRAnnIgi0lcgo+0BBD+0k?=
 =?us-ascii?Q?IfHEdaWK5nqz7/knhQocVv6SfCi42mm4BQwC6HSAJFjPuTPpQfOWGAGJaS3P?=
 =?us-ascii?Q?8Qo+0fnGrRjRtm1uZunt9KhgYM2ytiMqMgdX5hRhGYiGpuGxhUKlM8MjUBBX?=
 =?us-ascii?Q?Vqf8JTETCUmdSnF7BQqZORFj5nNd/QNMHcDLAYa1tJm5ELl++s950Y7cw0E8?=
 =?us-ascii?Q?XVUHaNhE1jYkvlwsSP7YNgamQnlXWWoeDmx8q9cT9GUN4yVA6wp62I4iYerW?=
 =?us-ascii?Q?5hSFpVv45V6DGB6Gl77QHZoNWP2eGWy6tZaEDKzrCN/+oqvM+ufIBPc/haeZ?=
 =?us-ascii?Q?+yZln79yNQbNd+/7citS57dwuYUBPE+9RznM48vSjZWIdHKGYqr1HWWt8I6W?=
 =?us-ascii?Q?zjwCruPkW2WSAKT895QjCk4RP6NRPiiLOjFrRFZsj8ZqdQfcpRBN7bkaU8SB?=
 =?us-ascii?Q?niYgUv8IeeBVlz8c+ffc/K0GRO636Pp1nxPdEO1+KvIvoD82sTxcAMvEzW+F?=
 =?us-ascii?Q?IEIYHnxIYItrZl69xWD47nfwPu0s56g+/jnstuSqlV1BEx/VgPQ5iyiELhND?=
 =?us-ascii?Q?ZqFWWvD46IpKF95AMI5Zf/OxzkYIVahUE4v7UZQOqpvfKgcnZbtIzHwBRMzy?=
 =?us-ascii?Q?Y8LaxKsu7Qcx1HiRfZkVdMoiCVjyr3vNyX3uNeP5t3xJQRgQkgb9tU+gK532?=
 =?us-ascii?Q?9Qet98puJn86xn+f4F5jAOhwohNXhople7csMDH1Y8pGuFsipGlqq7Dsd5Gd?=
 =?us-ascii?Q?O4/JpvpaaQJ+wf8XRbn9mkUFxpiapTuSxCFoyBxddQwzsYXfcur/IwztDD2O?=
 =?us-ascii?Q?rK0WUdgn4kgoBmzQxkznkBf2uELVu8zH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i5hAY8dq5Boaw3UFEL12EDrABwk1Kof6p2iePOufHP5Gypf1lEjX/n2zWd7y?=
 =?us-ascii?Q?8H/Ii5sHg+CJL22xJce6hZrknV0OKB77FxmbQ5nT/51NYvxJhv3v4H3ezqVt?=
 =?us-ascii?Q?/g+57i5Lr1t+FTyUmbT7u2T4RHp4dJW4mCES0Y2aAnpokFv2Ia7IWtYiYQ27?=
 =?us-ascii?Q?iw+s+Go3prkeRIaKLAbP3XsOQYCh/OO3Rl5C7A20ADrXaYEmGWhG7/J5KicY?=
 =?us-ascii?Q?d6UVso77FqZc6oiMDW7dFAqphkUIjlQ4KcCgNiZ/KQyDUiPaX9xRLG9M1TKc?=
 =?us-ascii?Q?lZBgvRLwcSi7fUjDTzDCfT45eXerGv64JZ0RiL2ejCDZ10urg7xwWGLAe/Zn?=
 =?us-ascii?Q?wrfNJUilxM7gzxaUu3OE7kXSs6ObpuJ402bc4YU+JZh3oi/4DCnvruqwR4dh?=
 =?us-ascii?Q?/dmxzHIBvYUTKbQkGmoUovPKFhe/BmtvYXNPLrmX6MKYNocxdMD6x7rb/Q3O?=
 =?us-ascii?Q?gvZcTAdcZNMvyJ/N28grsyCvgEZBJ7gFQF6HMk0cFDYGxKaghZqfjKZgpAWe?=
 =?us-ascii?Q?hMRhOc9Y9RphxnjEeBcvtjwnfEueTDigBujgoQcthABS32kdEiyriIov9NOG?=
 =?us-ascii?Q?jiCgLl4nn3emlZxUbj+rGnTql9+8eNXmW4IfGg2vX/nyiZnuI5ZZbTKnoRRE?=
 =?us-ascii?Q?i+pxQUHKjAIPM+dLvsHh0xivkippe4QrKwb8sidTUFHZrA9kw79vqGCn/91d?=
 =?us-ascii?Q?DwPKlYqw0m+trXWghfZPXZVfdP+zIuS5AVWekUdUeLRgVNGhBJW/u/rmLgH8?=
 =?us-ascii?Q?2RuLYzGLLvi6XusXeW643rJTDGxdVL/JuS5PgZzEZcpnDhzkOujItWMZ1JGe?=
 =?us-ascii?Q?CfyQW4cfH2slPExSWQ2GVlpX/na64K/lomYuq2t2+KwW+Tem6HJxkc6PFpeN?=
 =?us-ascii?Q?3lrqMCNZFsELI+mXPKQToXL8D6ztcAkWqI/tGrgrQLtk7LsLJuUVWcP5KHch?=
 =?us-ascii?Q?sZdCtpxcJDUkbKjdHY0RWBCajmgz5hVe1jzUsxzoXj9MRGX+28hLiar4U/+a?=
 =?us-ascii?Q?XonZk5HLKduA7hFPyhXjSDHkg01jYeMODWFiCmGen2HRk9gLpKdni4ql97tC?=
 =?us-ascii?Q?28ubvixp0bA6yNHIb17/lW/atEjTlA+UAyNSjk/RH2WfvvvFnJm3nVTpP+ov?=
 =?us-ascii?Q?sf4KGCbSaPGYwgvOG/S7Z0w9ue18MGTN7+82GwhpRMImdOXKTy93UQftHALA?=
 =?us-ascii?Q?GkrJNZBeH63NxORpxVyndXYo7yduzN7rXm8+8NLqKuhYbkS7IjPEpjTn+MEK?=
 =?us-ascii?Q?s3INH+/61dBG7pkrsu50FHJPwEEu88F0VsqBETBBM8D5K2rsTMJw//JeqZf+?=
 =?us-ascii?Q?c1hMrD9lGZzHpotRoxJpzV8jJy6HX1tDKXvTRByN4K5d/ltUmDJfJu470nXA?=
 =?us-ascii?Q?X1zpSQ+0mBZ9vHApii372PqVcMFYqV/c2Fk6Ttb7MdRZNVJBcnps+pm6v10k?=
 =?us-ascii?Q?2h1CYEuxRNXI+1+B9TNx5LdqeEcvxFPU8CZM7Ftdnxg6tL7J6469ckVay96Q?=
 =?us-ascii?Q?9vuhdxGo142x69uRTINxTAsco6d03cdzRk0XVp35MUMToYPtl9UZF73mtBd7?=
 =?us-ascii?Q?lk63PSScL5yWos/GPTsZ7Ib42ltFpoCyiyXkKqImPFSeFsijvFLNR8xyqC/P?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 605ccc53-eabf-4f4b-508f-08de073e5455
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 14:15:41.9304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PNfUPXFP0ju8wVT2AySa04bcpVGhUjtqx4I4Z3CXBeNmf1TRlDh7s3KtoHoo8X0wshFwfFkUmjZD6zGEgXehpCeEGK6YrRSpnYsh9An1gBY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9059
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

On Thu, Oct 09, 2025 at 03:42:45PM +0200, Raag Jadav wrote:
>On Thu, Oct 09, 2025 at 12:33:02PM +0530, Raag Jadav wrote:
>> This series wires up reset/postinstall handles for I2C IRQ so that it
>> can be routed to SGunit or PUnit when needed.
>
>Please hold on to this series while I resolve a few queries with the
>architecture.

you caught me between applying and pushing :-o. I will wait further
updates here for the push.

Lucas De Marchi

>
>Raag
>
>> v2: Integrate DISABLE_MSI_CAP changes (Heikki)
>>
>> Raag Jadav (2):
>>   drm/xe/i2c: Introduce xe_i2c_irq_present()
>>   drm/xe/i2c: Wire up reset/postinstall for I2C IRQ
>>
>>  drivers/gpu/drm/xe/regs/xe_i2c_regs.h |  4 ++++
>>  drivers/gpu/drm/xe/xe_i2c.c           | 28 ++++++++++++++++++++++++++-
>>  drivers/gpu/drm/xe/xe_i2c.h           |  4 ++++
>>  drivers/gpu/drm/xe/xe_irq.c           |  2 ++
>>  4 files changed, 37 insertions(+), 1 deletion(-)
>>
>> --
>> 2.34.1
>>
