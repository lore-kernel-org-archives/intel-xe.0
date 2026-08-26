Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21B4C61DBE
	for <intel-xe@archiver.kernel.org>; Wed, 26 Aug 2026 19:50:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B4D10EDED;
	Wed, 26 Aug 2026 19:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2yL30Hb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E48110EDED
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Aug 2026 19:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787773826; x=1819309826;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6imhUhikX2fsh8lmpAmydnjPtR2tzXEM6iC05LBDJHw=;
 b=i2yL30Hb17zfgM+FvBikh6VSogScqIpRmywhfE6lNhyOMEMvQP540PWW
 f+aQivPfTh1qQ07VbDrW3jZuKb2XbXCLcHs9QM4k8F/8m3DfSEkor2I60
 pislqEicbJfvSUVFjagewvjxkT449B/YDy88unCWVcSZ2rh4Rnd2lvcmm
 8oiCQrX4G4fDY2oUogcRBFxmZhRUP2/b07G9r0l+ilPTyKw+jUE3ekXSp
 2sfFvDIRK5qabUehBikVK9FEUo+LOLpbYqh0oZX6d5EcmQLce6hLHvrno
 95atnGdiu+9jQdL+yNq7119pu59lkJQSwTMkZHM6Nm3faX1KCWkZZ4Uoh Q==;
X-CSE-ConnectionGUID: XhiIItPVQfOzMJjg/iDDFg==
X-CSE-MsgGUID: SYaos6X8Ql6nChQMRjpYRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88028967"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="88028967"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:50:25 -0700
X-CSE-ConnectionGUID: zC7jFCFlQkStlWgJoh4n7Q==
X-CSE-MsgGUID: QUcOHESdRRCX4B5FhgJf/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; d="scan'208";a="263373775"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 12:50:25 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 12:50:24 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 12:50:24 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.7) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 12:50:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=odl3gWv7wGjwMMlX1UFe4W3gSfFT7muQmpAcTL4ypUd7fA8i9ZFM0+ypOLLdfZdhtI+/qzvCfrTKoZOKkhBDmcv/jH4XDiIhoR+NQ7I4ATcx3ycUFE8WqhMB4vmdfDvIF24iijZEcrQLNhdsA0LvdD4S9EvktlNfkfTY5ju+6992pA5MFVwsoHT1KeIr5di4LXDWXIdVtciai4c9kpU+oJUQxtgnBabGo/obl8LRsywMpF3kiWcFXr8RZuPA9TOTJbJ+02GLmyf2vq8XFdPD/S0egyed6KCGQA24n4/a7ktuUaerBqgXbG7mpPlf2pCSclRfeekO25iyim+HQUqCsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1adXcK9Tb2sKQ/c+2PCwJMJgieIIH9eS8zyqZq2kjg=;
 b=FzyeJMgriNzyC1JxXDri9v5X+CLreRs/P5sYlb81n0AQVZ2WAVU9IQlVrb2P5QEo9JtBH6oM+x/1Z7bptS25qHOUtPPAVvSrQUKVx1FWPM6jnnSiOnbmB1/TW/MJQ7/6IK77mzhwFJdPB7SK6vcc38Trvi0yz/xvARmTq+5D7S5eck5ceTQbBsAOQIoIUcD+iHHi3NOdBMlII95QIlvRWjBNthg0XcQiIzSI1r649+8IlVKo8L7ZR/5gtrGD0Lo89+OQEriQR72xeI/gwaGbDAsvo8pJ2CqVHdiOTs5XEApQLSHuiidsv95X1+CfPsLxIvbPhF+I8e4Dmc5esyt+Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 19:50:21 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 19:50:19 +0000
Date: Wed, 26 Aug 2026 12:50:17 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Badal Nilawar <badal.nilawar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <mallesh.koujalagi@intel.com>, <aravind.iddamsetty@intel.com>,
 <michal.wajdeczko@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>
Subject: Re: [PATCH v2 00/11] Add CPER logging support for CRI
Message-ID: <20260826195017.GJ681121@mdroper-desk1.amr.corp.intel.com>
References: <20260825175916.1103841-13-badal.nilawar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260825175916.1103841-13-badal.nilawar@intel.com>
X-ClientProxiedBy: SJ0PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::33) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d4bc93e-56b4-4712-393d-08df03ab421f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: oo+MTNV5wdJuDwxbpLv+7JgNvrFtvl0S0XNwIsfx74WAIpHDXSp4912GnRq2kjvCk3rEYUqal4X4yQMs/FQXQnfJwGN08oULPxFyXa4XP0tQAJA/EEV38PHQQB4aRU4UswkUKyDg1ZGFiS42WihzmCEF8WjAzo1pThQP3LHxo/T5Vwrnts1WHSp7X7umjLtU6Jz+E7hGYevENuyX3kJSfT4rmyBhHtsYTCoA6xjHZvW5cCjDvGP2AgwI+lS8UtkyiuDDVznj+V1xtxmAuIro/wBpZ5FnyvcZWI5tBYtOEMDVVF6IZ7RwiJSgYS4y8gEvijZQn5bld23r/iRuEwNPHMqHAygiEEhYgVlKt3fm1M3QYeXN5QIznxgz+dKEWx3v8puO42btmy7DVOupF6BRZBa282Enpz0mBFKMVc6Hk53dn5hT27DAl6kv2YsafcgQrWuUcPAFOh2yWLKu5x8cBAdD8xwmshVlb7k7iUDZvqEeElezWRwweKuT7ZDATuS53yeOTtI3KkJzKI1d0GtSQTkIW5CDtZS5/kzLPU6tVzgrskjQBktidb2Jozd4T7ARew6GsYSgfDF7NeuIEwtCAqqf8+H6VkrQccwPBx55o0RzDPukUJf7bqk8tlz+FoLWFPiM+PQXBpl3wYd7irjf6vyTEgQ+REsfVEnCwkJERKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wx7PYeVjobrhfAnSbo1aOqFIDMtaiq4JSyxkNNcdscsB8blKNhafU/+0bEY/?=
 =?us-ascii?Q?v6gm8W7JbDAqZcuUh2uYFuxyjtrDWZSwp4PrxAc3XIB+PZZg4RU1lp7nFBcB?=
 =?us-ascii?Q?kQce1kZF9tHd2KontIi5fXiZ5zFu7ISSCub9qk8uSTrppJfxUb7lOewDL2iC?=
 =?us-ascii?Q?pfy+X9Cp9VhHP2QYJBR9HrdjnGbj5kmGSF6g5iYl4FoZN9AOnG5ccGALUOxn?=
 =?us-ascii?Q?Clsmut7ZA1KfIEYoSIc8B8O4ENuAGue3HGZyMC6Jvb5ReEo1zQ6C2YHNx/S2?=
 =?us-ascii?Q?IJysaHwYZ5p194ZEULWIQftt9paZdHvO2n5wMzVGCRSyLl6sOGxgXXMrLuGf?=
 =?us-ascii?Q?msky+x7lH9EBe7OADDuGfsZrw6502QA52qTT4XQcEN4tMKcxcQgceA9/0kjH?=
 =?us-ascii?Q?nHZ9AnPLzjE//5d7Iu6blsCFxakEFTTUeaCf+28fTpQaAnQZRCcdPNM6mdZO?=
 =?us-ascii?Q?ldLp9fskiQAWhEp6mEXzcW0GSPwYZrYkkAoajvSn5yUp59Tm9DZbphIEVvis?=
 =?us-ascii?Q?kBlJGwBcxu6vZ/BeUw7F7q0S1yZ1UKQXOlnZageunBMoaf9VfxKvsWuqKQeU?=
 =?us-ascii?Q?LiQoS6jcW83x7LruTwgxgF2a2RG6QBK6qYoZDGP4bZ17TB1+8CFhH/ogciAD?=
 =?us-ascii?Q?OMkZKkzcfSGBaMHriAas+xW9bpBVg5E/TizEHEEUEL4v+3JgcjPCFBadTGuc?=
 =?us-ascii?Q?qJ4OsEJO2eylgqz/tsYC2PUfZSHQabzodkNcp19YQ7mS8VHBSiKDZn06IbV6?=
 =?us-ascii?Q?+hIu49JL3C5QRwuqbuaO7Q6BkvmpFnjAuwOpqhge/NBlGsZntcjIa6UiiiCI?=
 =?us-ascii?Q?Tiua6QeF1U7jJPFHnnVZWOi68Q9XjFxbG4AZnvYss3aO77Rig1s7gHwaxxzc?=
 =?us-ascii?Q?4pOo+/4zhqBDHUNGlcKja4ZyvBKjaVtrKHlB8AeymPBPzerUhe+XiX87W3v0?=
 =?us-ascii?Q?NW/6QDK4+KJ5xm8ZKFpjQ0aPQXLtlfvmescHGxPBzrqhuDXumpm/tsZlhS40?=
 =?us-ascii?Q?4hs60BJU+1mFj7xX9+ZOX03upeikcX1Amo28sK21uDHUP+Fm+i/wyjlHYGUM?=
 =?us-ascii?Q?SGMVUEONR4yO0+n/N0/A3VftSJ04+wLkpzXKK86VknuwMmHYFloizTgWuXGv?=
 =?us-ascii?Q?zbQKtJR53WE1x5OMmvInG8WwrnHs4YzwJnVi4wOMFXhK5BXwBCWyDWMy76jy?=
 =?us-ascii?Q?rYorwTyjN08mJOTpMJyScx94+SJYBmJ/pIIzb7yj4R831Uh4YJ6hf+gU7ghA?=
 =?us-ascii?Q?9uVHvZNR/zmbI3p2GjDh0pgBjiStRbLZ/G43UNlfR/JlfnAUWmWJIqUb064s?=
 =?us-ascii?Q?oy/As+PPZEzncf4CEhv5Y8Vabjj+iKkocou+98fomv8p2VQYkeypQ9h/5aUI?=
 =?us-ascii?Q?jNhjbGQ4M97Cp+dLkwEbuadvCQhloaJCW5xWSVrbg6bAolhsD1nzC9ihaRw/?=
 =?us-ascii?Q?OKR62PRiGYDrJ4SvyI5nc6vu/iqgDI9eZp2agTPI3mkzm3yHEZ4/GV4138zX?=
 =?us-ascii?Q?5cdZB9zRsX3OmdQpGzdNQNwGUzv3GH3whgZ4WSjJ6ZReuTGfQVM+nqGkoC0v?=
 =?us-ascii?Q?2m6wJ8AWTiBZ5BSO6jlQOP8fEMRLHxw+c+FDxcQA8Yx36rvFfb8u4YXk4lCj?=
 =?us-ascii?Q?6y8Um84oonkV6Tu5lRb+xXD33VxPi/er7vmvcY3AaeNfl6BP6WPkQVWANaf5?=
 =?us-ascii?Q?sq0ETUJ/7yauT3KmDj+4D6akrpcF9bFobA2YiKXLeDxxOPo/9fmLULujSeq5?=
 =?us-ascii?Q?7HrHewEA2h4zTu2BHGAThjq+Jzb+mzQ=3D?=
X-Exchange-RoutingPolicyChecked: YIkPVUCKqoGMLWVuAHBb0enT4o48t115bZBIXOeT+xEalkDlkZxrTsdarfKsTLX4Ryh6DI293JuX76LhjuZ0ncDXCKC36TgySwDjiJgvTrBtdYrhNkQLt1ZOu6VQbqxbF3k1Gvw3MKZrnzPH9yEQqjuo7y1JzbyKLjtik1easmQuFB0mCCrqF4V0EiAxRxqB6nLfVZcUpdPey/uTik7pbRrZ591VzIB9NcrFe8gFjODyi/anfyPsINc/uZQHtFTFaa/HWsLadlm3n+PgAAAEEUJO0A96TswhTjjgLFv546gJcQrvRJ+lLxPHK92wjIT2HOYX1w4De29rvE7VhMiVUw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4bc93e-56b4-4712-393d-08df03ab421f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 19:50:19.6580 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10YGyhM63ofT75YDKB1wQFnLg0Wn3Gwty3iOAwO+c5k9SXe9BXQQGZCGXP4Gvmi5JnhU0xk9KI6cCiVKCW3Qdwb7b+UT6BZAzRkrv0+pWds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
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

On Tue, Aug 25, 2026 at 11:29:17PM +0530, Badal Nilawar wrote:
> This patch series adds CPER (Common Platform Error Record) logging support
> for Correctable errors reported by Intel Xe GPUs. CPER logging is done
> through trace event.

Is the expectation that real-world applications are going to pick up
these logs via tracefs rather than some other kind of dedicated uapi?
That worries me a bit...

I think tracepoints have been a bit of a gray area in the past with some
people feeling that they're formal interfaces with all the ABI
requirements of traditional uapi, and other people feeling that they're
just debugging aids for driver developers that don't need to provide
stable ABI guarantees.  If we're saying this will be the official
interface that userspace software should use to obtain these CPER logs,
then it sounds like we're taking a firm stance that yes, these are now
formal uapi with hard ABI requirements.  In that case it means that this
work now needs to satisfy the DRM subsystem's ABI rules --- we need a
real-world opensource userspace consumer, acks from the userspace teams
on the interface, etc.  And we can never change/break the interface here
after it lands.

This may also have implications for other tracepoints, current or
future, so we should make sure we've thought through this carefully.
Please make sure you discuss this with the maintainers and ensure
they're aligned on the direction here.


Matt

> 
> v2:
>    - Extended CPER logging to Uncorrectable errors and xe_ras_get_counter
>      request
>    - Log CPER records via xe_log SIGID infra 
> 
> Badal Nilawar (11):
>   drm/xe/xe_ras: Add support to retrieve info queue data for CRI
>   drm/xe/xe_ras: Refactor get_counter() to return response structure
>   drm/xe/cper: Add CPER structures and trace event
>   drm/xe/cper: APIs to prepare and log CPER record
>   drm/xe/cper: Prepare Intel CPER error info from info queue
>   drm/xe/cper: Log CPER records for aggregate counter retrival
>   drm/xe/cper: Allow hardware error CPER reporting from xe_log
>   drm/xe/ras: Report device memory errors using SIGID
>   drm/xe/ras: Report core compute errors using SIGID
>   drm/xe/ras: Report soc internal errors using SIGID
>   drm/xe/ras: Report correctable errors using SIGID
> 
>  drivers/gpu/drm/xe/Makefile                   |   4 +
>  drivers/gpu/drm/xe/regs/xe_regs.h             |   2 +
>  drivers/gpu/drm/xe/xe_cper.c                  | 184 +++++++
>  drivers/gpu/drm/xe/xe_cper.h                  |  34 ++
>  drivers/gpu/drm/xe/xe_cper_types.h            | 186 +++++++
>  drivers/gpu/drm/xe/xe_log.c                   |  17 +-
>  drivers/gpu/drm/xe/xe_ras.c                   | 506 ++++++++++++++++--
>  drivers/gpu/drm/xe/xe_ras.h                   |   4 +
>  drivers/gpu/drm/xe/xe_ras_types.h             | 118 +++-
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>  drivers/gpu/drm/xe/xe_trace_cper.c            |   9 +
>  drivers/gpu/drm/xe/xe_trace_cper.h            |  66 +++
>  12 files changed, 1093 insertions(+), 39 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_cper.h
>  create mode 100644 drivers/gpu/drm/xe/xe_cper_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.c
>  create mode 100644 drivers/gpu/drm/xe/xe_trace_cper.h
> 
> -- 
> 2.54.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
