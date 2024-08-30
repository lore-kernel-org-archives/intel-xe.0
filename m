Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB5FCA0FF8
	for <intel-xe@archiver.kernel.org>; Fri, 30 Aug 2024 14:08:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0016510E812;
	Fri, 30 Aug 2024 14:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KrrpkvYV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2412210E812
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Aug 2024 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725026914; x=1756562914;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=PNtFHy0MJe7mph4djeFpq5BoOP7MNGPAFn3f9dHZX6o=;
 b=KrrpkvYVGJ2Q04nO7ZC7nCr5H7+HDEuPyOrwRnU4MComGS0zjkOcWcoa
 3o3MW0iUCf+XdzR6a8qinU318iojXHgkttqX3ZhXDB3jF6yDw6UkHcC4P
 r6Yi2l5z+/F4tNCTnjFvJlx0u31HxKsYfLDc9A+mgVBCIxTVFvMgAp2wy
 iDBaDNY32bD/fvpsxiAjw4RpGqVmHm1UuiUDoRhxRn8Zf28TVzmXvOYeK
 g+NV/yCkXDpgp1snBaFQuf8zxY5w7UAwjqkNyGfgOPfCG7SoN32ZZDZYI
 AQGsWWZ8icEpDISkhK0NUbetjIWbUlhF4BkmULQ2BX3GKi7WdBwwuz/nA Q==;
X-CSE-ConnectionGUID: cQc61IvvTg2V/TjlwoMkFQ==
X-CSE-MsgGUID: s5aMGd34QKu75AklR0MJaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23834497"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="23834497"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 07:08:34 -0700
X-CSE-ConnectionGUID: qOIQV204RmO2GJnECBoBRA==
X-CSE-MsgGUID: V8ljrcFYQvCmqdOC/32HPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; d="scan'208";a="63918504"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Aug 2024 07:08:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 30 Aug 2024 07:08:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 30 Aug 2024 07:08:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 30 Aug 2024 07:08:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYIdYiDxqyDaS6QvUVa457ab5pORIK7e7/EyzJBTbabklEkROGEEiQCP3DgrZVRdjtEqJpinhTXqOxI6IgsbG60C5tpUlod43lo51QyziZVMuUcLrww5LmiKeoNzAhudtTJgWlwi1hPV64S4DfJqsupsvdyhGWyLuAOo+EdtoKMoCmk+ZNiM59T0Uvr9k7So9Gdm/kjYHk/MVXk+I3wc5agSivn6BGDjcHUY2AwSKYXf/L6pqCXdh9EeBqEf1VmDpLlJpukVrl9Espec449d6q/5ghBE9d4nVoS3gh1OFcjFJtW27XEPNFerf2+fQ6pXorOQREztBILgUMrkwlyIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL8ORCM7PFIBnnJ35bvhFRlbuWHKsT4cj2VfrNmDdiQ=;
 b=mvbXLd8E78Utp/x+UHSs4SFLRu4hjLhx0G2Vqfx4YjXMt4OO4KpPW3rGFpRK+MJk3nea9oysshrSX4sY5zdHWEHiKgEZpmz35haA0zgRUsrDNi3GBPAqbWYluNEQk0xWpn7T83h730omtjyBzrymbTfsL95D1+OHgoi9Ly+mBKhaXhpQ7kO6MWhNHTVnIboLxt2qxzyPvm3sdWcUuyn28ceJMy+naPfE3wqOuiPVNuWyHBju36E13bKynXx0ffb7Wl3VoY7vubmtDdpznC+f2U7b6wdXZG0Wxpyo+ulbNgtoyZaPxJnb6E4vlEsRetSSyZQAqQD5l3/QOB1aDlXKeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6286.namprd11.prod.outlook.com (2603:10b6:8:a7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.20; Fri, 30 Aug 2024 14:08:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7918.019; Fri, 30 Aug 2024
 14:08:28 +0000
Date: Fri, 30 Aug 2024 09:08:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe/pcode: Treat pcode as per-tile rather than
 per-GT
Message-ID: <kbyrw57dvl3jofxfopwjpw4t7k7wv2i4r5xrshnlucmemascnt@vg2aqypmlzki>
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
 <20240829220619.789159-5-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240829220619.789159-5-matthew.d.roper@intel.com>
X-ClientProxiedBy: MW4PR04CA0226.namprd04.prod.outlook.com
 (2603:10b6:303:87::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6286:EE_
X-MS-Office365-Filtering-Correlation-Id: 795c9493-ce7c-48f2-12c6-08dcc8fd386a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?crIrnhea5YzNwNwcHr/ndhWwTcbUxp4nRbrL4Yatoq1tmhP6tjz2ejbfqwXM?=
 =?us-ascii?Q?/5V7UZPmUEzrcJLgq3VTwDd8QMFfLSohvnmuVxZrV17sE4/aMpaUvnzZoBx4?=
 =?us-ascii?Q?xs8mrDocdbvyFjBvfV5/yTWGxK4tV57yGMVgeZUe5DYgAzdhofGc2/mSaX3s?=
 =?us-ascii?Q?78ITKjKYCK2vM7PPH3ZQ0ysfjvWzjy3YZuEqpQN0qAZcAyF7k3QiwsIE4I0R?=
 =?us-ascii?Q?uLMcfmCMjbrXDrJds4NlXlrbRzhqnjxjEE9/c6pgSbk1hBwCfeGvo2JZC8Wb?=
 =?us-ascii?Q?bzgt6Khx90gqQffsNx4cWJRJBcVs27bu05LCn14YecuGp2Ji3ANO25/Qt4zi?=
 =?us-ascii?Q?RzQRNxLVC7B+VJ42hJHdrgaKtxBXWILAHFPhkpXASHQJcSTIQJPMazRw1eQb?=
 =?us-ascii?Q?xAQTjLwZ1GMMXcyGdMCwoEz2udYvgGDuD3u/tgWdzGj6dfpQgP/FCK4dEPUx?=
 =?us-ascii?Q?Xvim1oBz+nMzabh7BjzUbdoPXzsIP3+ZcJllFRf4afgcv0kFILs9XIkAHoa6?=
 =?us-ascii?Q?FRBBp2v9e6ETPb0Fq0zuH8QQ2i7Zse9azOkhU5dlbFOZo8BkMwz3mPy1T/l/?=
 =?us-ascii?Q?K1xx3g7aMnb5G4AytNrbBMyqkhIMbixEZNyI/GfaVNfWIVnBADN536V0TSjS?=
 =?us-ascii?Q?rUzViRHmBBlUkCsVjRhkCjGyoJcKCmlLXqpEXq6cQSoom24xR3lk1iXK6/BN?=
 =?us-ascii?Q?Plnw+GMMawoGVCC46GrAJmD4CKV5JZPS1QwQB/eXnY/XPV46aVDg/eZyvFIV?=
 =?us-ascii?Q?dR2G/DXxhaDX+hBxI1VZ8TEV11QlbU8VddGNuBO3XWX9PzFPiKN/m+5ZKxTe?=
 =?us-ascii?Q?uqNXZOqlWUPNmcVdIZhiWqUAkuKs9qwI90Ync5Tnp/SAAgjTkDp8KH/ZvKpJ?=
 =?us-ascii?Q?fpc9pnjkxcDt3Xo6BZbQNVtJNWIlagDJ/FQ6PWPVAGtexml3KxFxdRkDw7fM?=
 =?us-ascii?Q?ffu8Uzk5X2FuA7arzShX6TjJ+6qenakSJmnOa4GSWAAnIbRwgsFaF6GgmDYC?=
 =?us-ascii?Q?2RPd+Wi35lYX5/6D543etk46YitNpE2y9+VWPSqxuLqPqxERg16lLmCtjVtR?=
 =?us-ascii?Q?RZpBbhySEmJr3mvPZNedMunzAjaUFsmTziYHp8CVENJLQHdALrx7llWYCoJ7?=
 =?us-ascii?Q?fHBQIwlncSh7f+/Uj5GpbQnZ7Z9jPdonKjESNHEiCrRT7AbYWo/cg+/MAlt5?=
 =?us-ascii?Q?0GjV4wUPxPekdHLSaUliTsJXPCxtWAKSGLu+YS0DJGwRlKyeQsWMbWQrDJAi?=
 =?us-ascii?Q?gZI4pAy7C6StkSLDcXk66iAljtZt0U86O1FWmWp2d2ExdbfVY6JpCG+faCcW?=
 =?us-ascii?Q?ghkqt5xTuuBZs8oZXocntuUTqY/x9NfjKleUc2KDFNlUZw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VekCrFh5zjvLpKPd4clCd+NyWLbGs9Pq6LQq+sy/a4kHEq41U6dpWBcc/h1l?=
 =?us-ascii?Q?sxqgv5ST4ICHAe7SUPgbB4qlTfyW0oj+cH3zsuH/oA2Gtgl9h8rBeEVzrQ50?=
 =?us-ascii?Q?+XbQ2kNI55wzjRc2Hxnh86JQ6+B/AIJ0BWcfrmsn/Jfo/nBripWgOC+Qw9GJ?=
 =?us-ascii?Q?0ZGgs9IkI+ipiqZmwQHUk8aBkA39PsPRGdLHIVlG+C2FZp5Sw/15XhXtroRd?=
 =?us-ascii?Q?tQPLB1x7MAmhpIken/itqPR4GOtIwsVSDmJg9vfdt33sWNbgNpYq8oL9jF2Q?=
 =?us-ascii?Q?1zbkMUSr1vuUWtm2I9EEzCrn1988xjVQqn/4c3V932aEmdgUZ3O0GykkEkU2?=
 =?us-ascii?Q?AY7AYPZcOT+QQw3JJqBSVriGNyAuTg2W/kKdIWHEPJUF3++9KEUxakFzDm1v?=
 =?us-ascii?Q?iycG+M/Ool5xUJqdrdGf/MkS9jCQoqcU3WIM3g42BpfvJpUYT9wuQTj5zYff?=
 =?us-ascii?Q?dn7vKf/1p91x4eLCw5AQWHxf8Gpgr0aX8BB5i5TvpzReYSzX6ORS9vdk0XMF?=
 =?us-ascii?Q?iXVJKV5rM6Ya/PRRpwkofE+hVbk0NEppKawWPuISxs6p/JzVko3bzsWtkZvs?=
 =?us-ascii?Q?rpCB25GviX1nHgDMwoecJ5RMKtLLVwMZWWLeQcFmq8LaSmKtO/t8VAFyGaCl?=
 =?us-ascii?Q?zPIYITzcKZ2+zqKV9KdIjXH/smtkbVNE5RuGQ4+6ps5+zLJH9iFX52ah0BmD?=
 =?us-ascii?Q?0oRdsZqiG9J376imWbrKAI8An5KPe6bE8SGZrKyPOD0sj+peB/ZoN/ikeUlq?=
 =?us-ascii?Q?HPbTRrWCFE3T0wOnJzoW7gOElSU4bIz+/sDf5ceRtaguPDw7+wUN6T27Fupi?=
 =?us-ascii?Q?teAR2dlJk3B2TGIFJhrAIWKZIxiBHqedObtvcyAtbxRPQeVo/rzXl06pmYQE?=
 =?us-ascii?Q?bKzSvmBmHj2XXCOP0xeew96Xe1RiU3Pv2iVybMMjUpnHCMCpku3N4nhSDmd3?=
 =?us-ascii?Q?wYhR/XaR4k5/9PDtxCfyM+B1QUc/4kFLx+K90g9iAm8KTTQQq1ozG2tFT8lP?=
 =?us-ascii?Q?Zm7HdhLrn7KIOm37aRgFcW2IAnQHZKdE2mudwCBS5c5g4PZtuJUo5EKj3Y23?=
 =?us-ascii?Q?3Zkpjg2PdNUvgCUep1XyHlEIeehWThiyEZ9p56247E7yCOU6JAQOAFKcyWHm?=
 =?us-ascii?Q?sROyc/YjjZ2OFhShOORzLMcJ8QXkvMyGGWGRAHbwdctomaIv8Mw9NVl9Tycx?=
 =?us-ascii?Q?l33KA0TOCbxFFCKFf2y/OZHkUu1kqEV0kK2dbYp5OTa1ArFATkB9OPcjKPqV?=
 =?us-ascii?Q?icC3VCdfoJW/r3WXfwWFptFKMa5ytM1jI4/7YwZGee2b4GP/66id9+7q81P7?=
 =?us-ascii?Q?h98+c+PCemDcZSKau7ctfqUCuXM4+PA0OCTtcy/pxwcT5xL0SC4OxnyN0+it?=
 =?us-ascii?Q?tACZ/NZu//cxSsDPKNBiKXAHeOGrooh/aYBfkIFNRNi6Svvy0kruVM0xOQUQ?=
 =?us-ascii?Q?myBv+jmNfCROLAf591rmizmZJO11wGNij2aAz+HquhxmlrpJ+/xv2peGR2Yo?=
 =?us-ascii?Q?3eKDSoIH+RZow8E+IWBy0VR3mVJMYWBEH2A8FVUtFk8Dz+Dp6pv3G50dDe8h?=
 =?us-ascii?Q?WR7xzhuZIlSByC6Z44ax16K58sGIcs94tGnyb3Uv2O0iFXiVPwHF9SVnUWTy?=
 =?us-ascii?Q?/g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 795c9493-ce7c-48f2-12c6-08dcc8fd386a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 14:08:27.9913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1ydVQX2AGJgPXDrG8SM5LvSf0ooBO8woTrVgOfLoikc3PdUkc6lPmxqjKrnyn6hmgKjREqcNBiuJqR3dCVh2/ZOOxwWeHqCtdBoI+5TXx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6286
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

On Thu, Aug 29, 2024 at 03:06:21PM GMT, Matt Roper wrote:
>There's only one instance of the pcode per tile, and for GT-related
>accesses both the primary and media GT share the same register
>interface.  Since Xe was using per-GT locking, the pcode mutex wasn't
>actually protecting everything that it should since concurrent accesses
>related to a tile's primary GT and media GT were possible.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

>---
>One somewhat worrying design that this highlights is that
>xe_pcode_init_min_freq_table is getting called from each GT's SLPC
>initialization with different frequency values.  But since there's
>really only a single shared pcode interface to the hardware, this
>effectively means the media GT values seem to be clobbering the values
>previously set by the primary GT.  We'll need to look closer at that as
>a followup; this patch doesn't attempt to change that (mis?)behavior.

and with a single pcode interface, would it need to do a min
and max for all GTs rather than simply considering pc->rp{0,n}_freq?

Lucas De Marchi
