Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE603C5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 01:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1061A10E1CC;
	Thu, 29 May 2025 01:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j7D8QpPQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9110E1CC
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 01:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748483488; x=1780019488;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mJVV0L/DDNZ2Hu3ZKbeR1WWjSM2t3Iq6R0+AEX7+od8=;
 b=j7D8QpPQGYziKHgA1th9+9xKHx/WevfjneK2Ugd8T46kRf1aa0ivSoCN
 FOjTlLU4MeukVZq2eQM0D/M/T0r56WKs2/L/VpOC6/QbAngkkS/5F7gAp
 VvmWniG2se+E3LGkpYj+TL0X4KqIhGIrsQWsyxwE2T2l0z44zXM6vEL/z
 d/070MUfvzmPc2YoDVkS6H/jW/7Cr6aOFc5qlb/tIsRXIC+peT8EP4A95
 PjBVsWDi3obpue6ZJnpRUvwscNE1v6jIC6Ai8igiXTxW4SPDJekpQ7Pl+
 o3OBrDWOuXDHQBa5odecA2UK7t4IkQod8HeCfYkN2iGdRVOq3jMIYCmGx Q==;
X-CSE-ConnectionGUID: ms/FlggPSyCbGDPYoFSEMQ==
X-CSE-MsgGUID: aKeTmNJTQN2vgHfte4ylVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="68081062"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="68081062"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:51:25 -0700
X-CSE-ConnectionGUID: a0ZHzKv0QOSb1mozBOQxug==
X-CSE-MsgGUID: JiZLH09gQ+ekL3J7J3g1ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; d="scan'208";a="148183409"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 18:51:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 28 May 2025 18:51:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 28 May 2025 18:51:25 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.54) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 28 May 2025 18:51:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sEL/x76u5jOaiKYnklJca7//lggiloTmLhE+10QmQ+Sz3x9JZkA9gVrgfylWfSfmRBvwBODngf8Cxnum6KfGt9Ry/wSTwP037XNUQfOsz+AvRpjyJNrUKBa/p9db97lTOcXembtk7xImY078A7YZPttAJf/L0QbPcP2elNofCnCXFWoJFh5k30MqzlHS3I/fePiAdkmr7xjgNiKy+10mM1LnK809ymxcqwhFAovfVECdNI4L4A2lJQQ3el/utLILkmAeh/JrQhHn3+oyVciIVYwVvoZ845NSnp/pDgkCUm/KjP9P8m7yHCrNE2Kd4rRS54TVIKguCnb2o4ugqjdfuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awUXbfxOc6U6icssVwmH+Lx6g4/aerFuyumEbruLLiY=;
 b=eS2VPGmsZo5xoYJOMaXUHttOo1KzkO4kIOK7uk04otpo8NLNxCq5C0njFztnlnP60i7M8oQYIgbL7AdALkPEG+v/lPYFqxR/GYXgB1LaqyLVEaXEsf0x513YjOoUpInsQ215X0diNS2IszS3eNV4GpNNLQSj/FRFJ9jqD3MljtIECWXFpshVo35ieyyLRSiIGbW8RXHvnRUtEPmI9vDgPm3FANd17ATfZC8DwGvAGue0vNK+przUzKs5Syw6Srl6sE/PobIkfuvF9/nDYJv95dlbi+543f2OYNGLaZyvRtRKd32pstjR74d0Ozrgbtp9tsXE/br3bSh2Z/ibexIAoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH8PR11MB6901.namprd11.prod.outlook.com (2603:10b6:510:22a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 29 May
 2025 01:50:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 01:50:40 +0000
Date: Wed, 28 May 2025 18:50:37 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Riana Tauro <riana.tauro@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stuart Summers
 <stuart.summers@intel.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v4 2/5] drm/xe: Convert "fused off" messages to be gt-based
Message-ID: <20250529015037.GW6239@mdroper-desk1.amr.corp.intel.com>
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
 <20250528-engine-mask-v4-2-f4636d2a890a@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250528-engine-mask-v4-2-f4636d2a890a@intel.com>
X-ClientProxiedBy: SJ0PR03CA0366.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::11) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH8PR11MB6901:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f82a50-e0ca-4dcf-5bd7-08dd9e533724
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8NHK7mUfGsLHc9Dg2Ns8NPtqUSGhvhJdtbcyHEbq2qqgdGDQi6pCRbyhhKX1?=
 =?us-ascii?Q?tudsPhxn31lUjauyZSvy504pMaZ3wXrL6Hr3vRa9TiPcQtDt9qdEi/yhrBnY?=
 =?us-ascii?Q?8IkS2nsYPoD3qHQwXtpg8SNHCyr4BaJniGwyEjfyLBJlf+DiHb2QZ0ah85G1?=
 =?us-ascii?Q?J0W0Dsc4o/TU/Nf4b7pe/6RJGOkDCLS/BmHOk7Yfr8gd0yF/5lrrecQUoZGV?=
 =?us-ascii?Q?PS5BoTmHKWsOT/saNfoKgd4ik/ETm2Rjt2N8OaIlLvpAyl+WtwZg9a1YXr3W?=
 =?us-ascii?Q?CbLKrsWA3TBaosMA37KsfBvFTv8SCx1dbYsmdJnuLb2nJs2Tnm5sUYk8HmnU?=
 =?us-ascii?Q?2D7ewEEeYmIptSWFmtVzfFcq3C0TUKPiBbCKhMGtYsr2U7HYYPkW4KKQzprh?=
 =?us-ascii?Q?XX070ancXMWBNOB30w3YWtZYvKATU30QynP3AQcDYBNSDqwnVd7eTzq32b8i?=
 =?us-ascii?Q?VTnjszO0vYW+sc/kd0Ci7R3ZlTAt9LdbQaRg1YLoxfe8B9LUwhf0DY4GvyaJ?=
 =?us-ascii?Q?iKfAsflvbuTg+K/wUKPcfay6I6RYaclj+bxY4sfzRTVSIBrk7m2ihgoAmjJB?=
 =?us-ascii?Q?enE5uiaASggaN+s1ZO4dGN17zGcQAVzC6RYCK55o74dqDhQQes8uISwK60aS?=
 =?us-ascii?Q?+AWhBaSCp8LhRnAWG8Gj0j+aeRh8bJY7+UFXr42dxQX4eEmzoGHUovK2rPMS?=
 =?us-ascii?Q?3yMH4GyRiZ1zGD6QVCSih8SIiMPEEYOlGn7PBWDN2ng9IchIpOhrRBfeulFe?=
 =?us-ascii?Q?XQ0dnUPwxsGwgt3nB0I7jBkJqsis0l27NjLUS1Ecc4N1oMPGFON0dAPG3xER?=
 =?us-ascii?Q?ynuz+hpYQYjAGs27VdFxEejD8o/UWy3zQj1FBBX+7fh6sxZsS8n6g2MKEUT/?=
 =?us-ascii?Q?BP7LjauUO64Cm+QCYX8Xv79wTr52YVvaaZUPe56RRQO2fPCxasX6airIKBgB?=
 =?us-ascii?Q?PoF+l5CG38ZZpNCY7lMj/Oqi4Cv/NoPTj93OIsM+YtKh7Em3mWJIMSyDSFmv?=
 =?us-ascii?Q?J+V0LrQJaHj5q8HxdM5hI6/cyAoCBJJwnf30a8l9Lbxi36YUwQraKk+C6mBB?=
 =?us-ascii?Q?VsIgc184WY3i8a8/YB+FF5cCZyD5b/VrS3JBKtClnUQNMLfrzX1DLAEAa/AC?=
 =?us-ascii?Q?CpodCIr6pVVXD5z+3xaqMShD6/DzxDaCbHTOykdtMgXy6nT4w197CRcLECFn?=
 =?us-ascii?Q?G0cTEYFLJVXrcJdipx3cjGVvIhvwpbiCCIU66ZIDbHm8K6BeAtykZzhkMAUF?=
 =?us-ascii?Q?f7BZKIFfZfYqnnRLp9kWZQByLRIe1Ed90OLxst1sc1pwpfxSaGDYs5MufcVF?=
 =?us-ascii?Q?EmZBqOyvHoGhI0GO2ubhhElXSCzE5DHE31tLQJKtx6y+Bolexsyj3Qe+QvCU?=
 =?us-ascii?Q?Ix2cp5lGxA8iCJycNp2hK6rlPLP7LdzqVnrpBt4UkBF8+akoKEo8QwW2Tsq1?=
 =?us-ascii?Q?qStV1zzGQ98=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?THnTKisfCx7mbtZzSIE7irL47G+hC/qh46QJj7Znp+1LGoCzq6H+gU+KC5jo?=
 =?us-ascii?Q?S8hnNmOrwMRqX6jvHDQeqpeEInUyhdt75AryYv0FWWelj9JvsP0S1sSHVRW1?=
 =?us-ascii?Q?iHBVZIzVgwu3+1/UXGxf8sTKMNeL4sbiAosQdVc8Cg87vv+UC5dbRmfp3lMl?=
 =?us-ascii?Q?IUAC/aaMw9NFZ/FCgb5LFpfClq0Exj8rnPijf7AWQd2+Hvyu772ZL2/Ku/WY?=
 =?us-ascii?Q?7120udlDhDcOwju2b4o76Me0GRpdPAUZKtmFbNsNugYOJB4iZlp0I5iaO1PZ?=
 =?us-ascii?Q?QO6QiQem428DWTm5VASgseJZ4FjZ8quHwLwlTwBCfRYQ8Y0ewrVOzrbczBva?=
 =?us-ascii?Q?FSq7BKV9Hdg5ZsvYEKejg7e0j8Rb5V3cCi7Ml/ACNA74k6y1nVqw5J4wSW+A?=
 =?us-ascii?Q?OLKgNy7BQsjyLubzWwGsO5kip0ZtECI1WpNrMcDT+CUeCO0IRibGOlsTxnJi?=
 =?us-ascii?Q?CLvYOHNrHSpPAatgL5wf2Sb6H3NL0EeMIQvhlQ08jXf4KktTKfW5pCeR5BoJ?=
 =?us-ascii?Q?CFlxhgbzTaudcDlBLbYK2NldF8xJT0qj/BrFfEoXOz+D0QcqxY4gDPEHlpkJ?=
 =?us-ascii?Q?3BqcdEvcd2e9NHjKL8DDMRNqP1p52v9ZrzZ8N/QhCfk1SgjC1DyIxlixPQ9h?=
 =?us-ascii?Q?Z8KtTrQeJHsMlconFRyuJvFS07cGZ1mT0Pcm/kY2fafC4PtV9LjBsqpWbV4v?=
 =?us-ascii?Q?qLzV8uq1GZELvrJufoOF5jSKMpBZs8xmdC/C8TnxvpKSabiPajhn8gMNfbv6?=
 =?us-ascii?Q?A+n9kwM4XzyEVZLe8swJAAKPCcZ84ZmlinoHbDP2BhlNfusm7CRwv3s08THa?=
 =?us-ascii?Q?/aGHQHa7lSIYZTsHYwuBa8yFhLA+Ws02lLgIvtlMAbNXumY/RiXOj2ndKSdK?=
 =?us-ascii?Q?OHK9H27mhBj9mRj3EvDDyndPiVwRCwmiympvvq0LtBA8tw6qt7QwDWQh29ls?=
 =?us-ascii?Q?0Uool+e2DSkoQB2IZ710Fsti+tn80phst/cSDnlTzT+SXN1ZBes3jcakoPDC?=
 =?us-ascii?Q?y90LAZM98VowHm/M90EM48cpaTunChd6cDkYu9T/hkmG6OKNvPzeabeORqCY?=
 =?us-ascii?Q?m0+jojCiPVx3AJhG8ygQmKD+TXAEhsc05CI2PMgBqoAh1t4lu7zcXsJLb4yy?=
 =?us-ascii?Q?lGxLMhuz7omtLa8vrM4G07vuXf3uTNJz7OaXKE/9TFaR+hBolWuBvjRPN1KK?=
 =?us-ascii?Q?qa8556KUt25UrSAR0dG7HdNDRI3QIMIy8bK3F+4J7w1dSRi0yUiyrBHNlAZG?=
 =?us-ascii?Q?55jZGsmpOdd3c7SwlAg7wTlbW5xkrx4hNj6I6nE+oH70s2G8boCM+s3HZ9j0?=
 =?us-ascii?Q?Bhq4TSlXRWQk2qZM8ac1617ZRbnP060eroohWvNtRJfI0uoao/PQMT9SmNil?=
 =?us-ascii?Q?Sl2pcHFztV7/wpMudJJ71NchS/l9Kq+fIUMr6vuM+hlnyhDXhYOoYPHaxJz/?=
 =?us-ascii?Q?f2AzGkNtyMb8dPn3AG1kqUns0jkZBuAawl4XN8oy6Jlwe5Aj8zIIvLJ+hMBa?=
 =?us-ascii?Q?AbUUHxpSCuhgVKdc6fRW/IGY0V2Gan9h5phVtODXY3mZpblkEJjrD021KU57?=
 =?us-ascii?Q?DQqIGKGxzi4E8QzjcLYRiMxbmuH5HBw2IX6Uyfquq7gUuu6NpTp9Jme+1drM?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f82a50-e0ca-4dcf-5bd7-08dd9e533724
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 01:50:40.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDUvqUGD0uq9NPD79P/lyOetCWx12Ylejv9pAmofpBPUjXlCaV89VSASL7cFTr1VmO5eSWam56bajvGVv1t4FLu13HJInAoOD5T8pCdQ2kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6901
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

On Wed, May 28, 2025 at 02:54:05PM -0700, Lucas De Marchi wrote:
> It's useful to see in the log message what GT was being checked for
> disabled/fused-off engines. Especially on multi-tile platforms the
> different tiles may be fused differently making it harder to parse
> the information.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 17 ++++++-----------
>  1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 93241fd0a4ba3..33681169b8570 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -693,7 +693,7 @@ static void read_media_fuses(struct xe_gt *gt)
>  
>  		if (!(BIT(j) & vdbox_mask)) {
>  			gt->info.engine_mask &= ~BIT(i);
> -			drm_info(&xe->drm, "vcs%u fused off\n", j);
> +			xe_gt_info(gt, "vcs%u fused off\n", j);
>  		}
>  	}
>  
> @@ -703,7 +703,7 @@ static void read_media_fuses(struct xe_gt *gt)
>  
>  		if (!(BIT(j) & vebox_mask)) {
>  			gt->info.engine_mask &= ~BIT(i);
> -			drm_info(&xe->drm, "vecs%u fused off\n", j);
> +			xe_gt_info(gt, "vecs%u fused off\n", j);
>  		}
>  	}
>  }
> @@ -728,15 +728,13 @@ static void read_copy_fuses(struct xe_gt *gt)
>  
>  		if (!(BIT(j / 2) & bcs_mask)) {
>  			gt->info.engine_mask &= ~BIT(i);
> -			drm_info(&xe->drm, "bcs%u fused off\n", j);
> +			xe_gt_info(gt, "bcs%u fused off\n", j);
>  		}
>  	}
>  }
>  
>  static void read_compute_fuses_from_dss(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
>  	/*
>  	 * CCS fusing based on DSS masks only applies to platforms that can
>  	 * have more than one CCS.
> @@ -755,14 +753,13 @@ static void read_compute_fuses_from_dss(struct xe_gt *gt)
>  
>  		if (!xe_gt_topology_has_dss_in_quadrant(gt, j)) {
>  			gt->info.engine_mask &= ~BIT(i);
> -			drm_info(&xe->drm, "ccs%u fused off\n", j);
> +			xe_gt_info(gt, "ccs%u fused off\n", j);
>  		}
>  	}
>  }
>  
>  static void read_compute_fuses_from_reg(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
>  	u32 ccs_mask;
>  
>  	ccs_mask = xe_mmio_read32(&gt->mmio, XEHP_FUSE4);
> @@ -774,7 +771,7 @@ static void read_compute_fuses_from_reg(struct xe_gt *gt)
>  
>  		if ((ccs_mask & BIT(j)) == 0) {
>  			gt->info.engine_mask &= ~BIT(i);
> -			drm_info(&xe->drm, "ccs%u fused off\n", j);
> +			xe_gt_info(gt, "ccs%u fused off\n", j);
>  		}
>  	}
>  }
> @@ -789,8 +786,6 @@ static void read_compute_fuses(struct xe_gt *gt)
>  
>  static void check_gsc_availability(struct xe_gt *gt)
>  {
> -	struct xe_device *xe = gt_to_xe(gt);
> -
>  	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
>  		return;
>  
> @@ -806,7 +801,7 @@ static void check_gsc_availability(struct xe_gt *gt)
>  		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_ENABLE, 0);
>  		xe_mmio_write32(&gt->mmio, GUNIT_GSC_INTR_MASK, ~0);
>  
> -		drm_dbg(&xe->drm, "GSC FW not used, disabling gsccs\n");
> +		xe_gt_dbg(gt, "GSC FW not used, disabling gsccs\n");
>  	}
>  }
>  
> 
> -- 
> 2.49.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
