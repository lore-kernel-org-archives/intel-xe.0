Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8736C54E5D
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 20:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8963B10FD52;
	Thu, 14 Mar 2024 20:07:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SuGZoFOq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 862E710FD52
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Mar 2024 20:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710446855; x=1741982855;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=h+WzIOyXx/6cMfjOo3LfNm1jodQuNdMFlKAPPirWleI=;
 b=SuGZoFOqtgMkrJMKHB6PA7ocxL6obtsprSwWPb7xkyim3CfcZIMmwbxx
 2vGctE6yrbzoqI8wZO7weO/zYxXPVaB6HYZISiVhvX76yZyoPKSjpZCMs
 tXiwUKV9Vv22dz6QdtEL9AazS8VO9Pl14yIJGl8jgFNvpn84m3EZw9Fzd
 sqbnfVc6roImey72SqKI5a7o9nzrR1hfOugO4iV8f8O5T5W/f263ATv34
 o0wyu6t7IHPQuyjhddf1wy8Za/zB+hR0JfjHxHkuC3Mx0sZKWZik5eMXf
 aJ+rjZeEMY9xQsRYR64w4n2ckwY4sHtf+QzH3GkM0zCCGX7ivdb86DosL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5139485"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5139485"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 13:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="35543376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2024 13:07:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Mar 2024 13:07:32 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Mar 2024 13:07:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Mar 2024 13:07:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TALvrCUD/37G8Mzp2+DYqep2nxqqFUP0Y4dCMk/ha3j9DOjTkfBOO7yrjC4MNuGjrNqWn+fMoP4px54ngOG1AcpIt//t9u1KMsY5ezQiZ+8+nIOOS7NwI38lXt1eIYK04ynkizmBQEr4f+h2GoKalb98vPAcM9lewFtkwRQrg49R29P/xlKkVsKEAqoeA5jtMmM1nyxEo+SFnWs2sAIadZcigV1yI+cu+RtCS6JHDJ2P4O4NWcPs4ziL4rUszyFT05Hd8ReYQPpCo+CIPo4IkxherVWcc5/NQgoBKzy2aH9aUvdnPi1KiDptHHPGTfLmTP6aP8O+kvEAvGc130SJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIAqBR7ZsQEDsfWWBHYQsV1RnUNAzd8qc5IMJH1yRyY=;
 b=gIhK+kSGPwIuiV3sG6TGrm+nOsH1UrKIc5b1mL5w5EmIhHjo3fjRNIPr9wgMc7Zy8jo0Qsvclhx5dN4nIOBfM1N5BOh0LWeCC15SSXEm2HDoEf7EPnvUQm2dpYCzdmBfr1QSlLD+KzuzeIiMXEtPQDiVqMbCTPdWZCMpDnYfMyyKO+h29XABQpSCtJWZ94od0epIOeINxbndRYEBUe93Mjin/vu+hnAxD5TIE7lZYY4tKoKbjC/ekVP0oAzz8xNgfqgPe/RQPtVtjgjSwVJJ3zkmM9bkUyI0b0RdV9yju8PpFAWiqCtf+VCUwQhBrc/FYG3hxf6KFHLUqRUq/ghEgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.20; Thu, 14 Mar
 2024 20:07:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Thu, 14 Mar 2024
 20:07:30 +0000
Date: Thu, 14 Mar 2024 15:07:28 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/mocs: Determine MCR separately for
 primary/media GT in kunit test
Message-ID: <n4a5pv5vugf5lac7sviifftdqsyothn6sr542ybprz3errwonw@d5wuogudoikp>
References: <20240314195825.3226856-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240314195825.3226856-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB5016:EE_
X-MS-Office365-Filtering-Correlation-Id: 7747ba75-1ed3-49e5-734b-08dc446260e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aD9Zn+ZvifSeP0KZZY9wxKHhdV7ketKOsedrqM6div3XWwmA4DjDXbbHQgw+dCt4clxa5CsN9cZi7AZBpfelSh0+yV7CtMhufsD2D9Ux0mkL/pQesxPPpmlwm3wOt9ijJ9+rkkdkGHg+Uwn/tDqCByj8C/e+dHnX989z4GyBP2WlX7xHxv3XA30o5s3njA9h78j6yjnsWG+sdca2oAH/7kxFedAnBh9wFEpg2mEyXFHUv3DK9plAehLydc+skIR+QeEOc9Pq6VqjXCGpEslwjv1O1q/TGX7cBisPF3XNz/sSajuXwd76A42aohEr40T3Zu/V7R1SBjhKvPsA3/zAFImC9Ck37vxlI9GZOU3fb6LXjhctHSDKSdt7eAUeGKg0pOV9ark7jdPLTFy1p21iIDl4lD9r+p+yE0PnHlxBeXW3bV7CdDcSPVf0HyRBhjsqviyHQ5sSw+4d0hx7dIQh2tqgnMcgO71x06eL4tuFTjUJvN4rnLhAYSE3YCIJ+u9xfoh/rY0cLs9Fgj+hnebYhjwN5lEZdKRKTu6Ewgux8OwsjmM3x3T6Fu1ZVayRag9JnECa+Wi3AhXXP4ri3F9oRccv49e9iYEKeWuNYpvBo/o9An5Iv3z8B6TkSNZPDpKX+JSSl2r1s0oUEMHhlC72Lzfx29y468vXcYtCZzkguDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7RBymt7LiDCTP8fFHyC81VOu+K01qnB4vlwHVFO0YgUgPD8M8hY5xAgpD/io?=
 =?us-ascii?Q?3jeTcyhRJVDG/3og5HGsNrcNjp2gXB0c8gpsLU6rc9tZyS7o2TsF/Ca15GgZ?=
 =?us-ascii?Q?TOCPwuUQv310Z9UCLn5+atBZBqc9REBZL8Sd+Ou18A9/zGeLwszJYjUkPF49?=
 =?us-ascii?Q?afsIEZ0yfjXT37pR13ToVWalTZkDQ7AgZV6YlwsbL6IHuIJogycaTtImxFxp?=
 =?us-ascii?Q?UwFc6dlri6VtyVIa49woNf/iYge4ybcvwepgM4pELVi+5pCP/62HU8y81jLA?=
 =?us-ascii?Q?ERJP9aC++ycTXCi3Dp8EH2L1Px9wBzP/xSDilDohplcWkMQynlbfjY7FOh+J?=
 =?us-ascii?Q?ZEQYXIPr/arzida7x5QSasMD3btYb3/RYuqYJpXqXX6T1OmvaR8WM281vY0F?=
 =?us-ascii?Q?ODecIiVYK+FV/L4oN2J/uovQoDBpmJaRYBULZUV9vewrN55aSbQJImiqEeK+?=
 =?us-ascii?Q?fBSGNEisrcP+th05Vbdl3ixs9q/ibFzRnUtWRUI/uO6Z6jDz6AjapD9CeXJk?=
 =?us-ascii?Q?okVtSl/3lb0puNgb9Xlpi5viig6b2ajZzFg8l4YuYU3FoSZTzsCN6l7KV1/z?=
 =?us-ascii?Q?DmdtJRDs4hFmFccmW2XGwT8Cpxy/XI9Pf/ZrtecBL+23I2pC+Sa9QVyPMMSs?=
 =?us-ascii?Q?773eVp4sSIcSZ8Fh8vHcYUKhsL5nF3FvYjfOP6bGjZiSjwb/s2/Z1zZQVcBJ?=
 =?us-ascii?Q?vBLoAnBBi5IuLWeLI+YeKRMmlOySqKkSvKNYsgso2xGk61g5LnbX/8P2ESgc?=
 =?us-ascii?Q?0F2c6cL5XFJ17xLQNI9tb3MPOW8WnyY2hZG64BdqzL2KYZRW3/7RgBbCt2bq?=
 =?us-ascii?Q?jAOWeAPw7jvw2ywS07F1eDSj4LSboOeDBJm5AkLOmv9FtUr+i4+vCqHy6ka/?=
 =?us-ascii?Q?wLLSdu8IBfZKQQ5wWxuGgNJpmiRW9jo5Y9eHE4vHvM2oiEQJfoy/f4G0jOnt?=
 =?us-ascii?Q?eJmX+CYSYxXN3aGcnXpk+zPzaHukeVarCLUW3zKA9XCKGbhwY/zCTg+E/bwp?=
 =?us-ascii?Q?Udo9dYeA22zVJGH5ZsA/YqH87MopVOWGYiu100Pgc4qWnCGtlxSq8HH0SrkJ?=
 =?us-ascii?Q?74baeZRrhyRxut7hqtLacowzoUwfD5aDvGt0rgzSDbZ4iyPTj2FSLSSkbs2O?=
 =?us-ascii?Q?QwlXri8hi7tjxKXe7XcnhPV9dNqWo/PLRuuigi5JWK9YSTjxPuxXh6wpjNhh?=
 =?us-ascii?Q?/kv0Jv8b8ev3ucRsl6LE/xWp0ELUduFFGcMg2lp5h6hQzCej9f1bUMJou1lH?=
 =?us-ascii?Q?kCxJD+J5155i/eSL6gXVa9l6wGw5d0YfvOFINzgiVL5u5i6Rh3fooNU68YW5?=
 =?us-ascii?Q?oGGsF75Tsz384I3PTeVyx2EFC17581sSieGOmzQAIBkvHrxNfOr9iWbUaw3p?=
 =?us-ascii?Q?1bA92ZUqBmQIdG8NvtVNvXiKC4vchvLxgh1SQSKWcFTsJZG+WWe/2Y2Wq/mk?=
 =?us-ascii?Q?kk9h/UJEy8lkKy5P2JA0f5QMPcLpOaxYPH8G4F/oAZ1rSMjr714e8PD6X+6t?=
 =?us-ascii?Q?3yuNANTlCZhqPwQNRps4d7/Insi8bYJQRZ25q8J5Hh5/H+EjT9ZKbSqMaFPG?=
 =?us-ascii?Q?XjBHUBOzN2eg6xhKWuZkiIFWByV/23AMqMG1/ckfy2/z1nJ5HvmECPI4nt7L?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7747ba75-1ed3-49e5-734b-08dc446260e7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 20:07:30.4301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qFdzH+rYub3iE2LhGoMcxlWk4IP1L5RLvdaJaOJh4X1qo5wTj0sjU6Ns076eo86srZoVh4/NHqubY8FYkUIcstdotOnrTMSKox09HQd8hI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5016
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

On Thu, Mar 14, 2024 at 12:58:26PM -0700, Matt Roper wrote:
>Although MOCS registers became multicast in graphics version 12.50 on
>the primary GT, this transition did not happen until version 20 on the
>media GT.  Considering each GT independently is mostly important for
>MTL/ARL where the Xe_LPM+ IP has non-MCR MOCS registers, even though
>Xe_LPG IP has MCR registers.
>
>Bspec: 67789, 71186
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
