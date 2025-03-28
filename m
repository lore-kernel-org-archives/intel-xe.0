Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1DEC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 19:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E160610E571;
	Fri, 28 Mar 2025 19:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQXmgvDV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA6E10E571
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Mar 2025 19:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743189537; x=1774725537;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v5CVoC1FuhA+zv3pxkuGt/xvDIwLcHpZG13tVz19ZJI=;
 b=lQXmgvDVWniIdgt5RjHiV2ljUctS31GzUReBlAbKuFKOXvtXjtu16ZG7
 +qhXE+/EvBNRWibgKr0f+l0v5Ouuf8aEdfEU4edl/451vKeIYC0M5ovJs
 libbTB9Hqc9BfJ4kX19GvR/+qUxWRc3sWsRLO2ypglRB8jMJ8VAt1GlCJ
 ZSyjZz6ELfehEawmmnPgOZubLBUYAa51eogDrVknhGV6DwyGw3L9IW11o
 88H3dtw7ixE0TPuW24uaEyORx08LnQEAftSdhVx5CZdGVX47V6EkQZelk
 2OyxHUKbP5EbK5NhzU2aH0hwSLqwdqsmsXzUg4FIfHSLKGBLvnPYx6DWR w==;
X-CSE-ConnectionGUID: f1kQ4wz4TpiGvXBFQ+fCfA==
X-CSE-MsgGUID: gAroi4KgRD2UIU0iZIE0Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="32169044"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="32169044"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 12:18:56 -0700
X-CSE-ConnectionGUID: roHP7zhNSCirKFQyY66vQw==
X-CSE-MsgGUID: UDo0zo74Q9+3qgG36pNpQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="125423098"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 12:18:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Mar 2025 12:18:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Mar 2025 12:18:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Mar 2025 12:18:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4m2qFWxqCp9MiItybTkSWHXTzqDLyeys/aMq10Z31/k44jrCZNa50z91gtvCnJgm+do+w4qPZ9GG47qpKMbWBBDDPb6nblfevvDrBl9VRMSdjP3soRT13HJGhEJdwm6JsOsxdr6w32nBQ+7vAC/Fk/0UZ2oHQIcIBNWdyOfR21zEHtbu47SfxJEZYhrpUn5TCwZt71XWNK8XFO3lFQ8Eu4Nmzz0XeBmhUNuyZR1BD78+ANETnsJxiiqfAXTJV4A+VbZZEb8mvh17Ma9EZRd5+DoDH7pqJjNPxBDXZYQn3SYNYmOGl3UbbVVaM87p8us+cGIjRJVQVsgPcM5f4Q5YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPlfT25q9A+IA5Oup/6JHzi+eKqCtLEkp6aa/nAlosY=;
 b=eedUNUgqQDTP16evRj5zdiq+Zx4EjBMZfmo17VIvaGRpoTdJtdE+DDEEGmh4J1uOx939I1TO9gu6CE38L85tgRuoZjOh+T8h38JNMMAM00hns0HN//yZ1xEEf0REM1TdGhLzFGqRqnN8h9xyUk+pVL6wuA7d+bU2hT1+X2o0f/K1RGlBpWCYalARTGbxo7+q6dZmiip096UqjboPsiySUN23/5JtAzUtOJuweDaRrJgjWxRweihW2c1qY33abyAyBq6GU/HQRo9/uW06aU9WLDAt9a8KfDHH7TfA3fQ5IFEPy3CjB8vTFkszTUCNFpDWQy4xrSEsxX74jTEcnUdsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH0PR11MB5220.namprd11.prod.outlook.com (2603:10b6:610:e3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.46; Fri, 28 Mar
 2025 19:18:33 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 19:18:32 +0000
Date: Fri, 28 Mar 2025 15:18:29 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Kenneth Graunke <kenneth@whitecape.org>
CC: <intel-xe@lists.freedesktop.org>, <zhanjun.dong@intel.com>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/xe: Invalidate L3 read-only cachelines for geometry
 streams too
Message-ID: <Z-b2BYJkz5laBbew@intel.com>
References: <20250320101212.7624-1-kenneth@whitecape.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250320101212.7624-1-kenneth@whitecape.org>
X-ClientProxiedBy: MW4PR04CA0277.namprd04.prod.outlook.com
 (2603:10b6:303:89::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH0PR11MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: dcee0fd8-536e-4098-1fec-08dd6e2d5473
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kViDSVh8Aww7IRP6hIEv4iW7yhz//gcpTo/ZtJu/cutv6PyoLYOzD/fbSfpi?=
 =?us-ascii?Q?jjf0uwWCjtyuUGsxbXZPN6inBej3pHoHYi9g+USz4H6WZ5ZJhLnU1VhlT1IG?=
 =?us-ascii?Q?kKHE0NVTR0zxeobH9YbOWpiJMMYem0GpO42wrqrLQG9fgIwxqqMMOAyRHuCe?=
 =?us-ascii?Q?f7dK8uFIkI6FG8AYXCYDEPsxKs1hluwbd0Hb1ucOuDSwEUJSOmaUVzWBdNG0?=
 =?us-ascii?Q?0H77ePf6WI7/SnyY4QUBeiFIsN2131b45T83cYbq2csVFvTuL3QFZWXPn0QR?=
 =?us-ascii?Q?YpNYFb6ueGt+IaZNx5K52m+TiXgmSbQwjC/BCj+Oka4MtHyraJFfa9yMZ2OG?=
 =?us-ascii?Q?2CUcvBqFeyC8+D4ebNp/x/Zt2tyWx8SRTh+KzJYZfi7wrcswdbtC3D7dAs6z?=
 =?us-ascii?Q?YbiZGlghmGkWiGK61HuJPGXhHJEaV322jmcPs5akj4hDC7Ex9+GsQD8UdyET?=
 =?us-ascii?Q?lnvwwwiTpB24qFZsuuq6Io7Eg2xLzyAl4oVtEqcvv71eQTdMAh0w5rvevoTm?=
 =?us-ascii?Q?u0X1wjrJC1vKYMetDrvS3dYwaZeaZ1EHUkXabT9kGTGaS5wELeipIBiaEgkq?=
 =?us-ascii?Q?YC2IqSH+/F9cHswvLLOwNrQhxcv2yG8PuK7aDLG34GofNS2lbiWL/13V5OvW?=
 =?us-ascii?Q?OYzfqaaziZ7A5nHPre2DBECCwN64DvoBuo/pj8r3lA6fiQjaLAE4JQ8VsC70?=
 =?us-ascii?Q?D7FEljXWrMuGvSA19TB0gjvYdDFZG3GaUcTGGzkQzaMJ49X+/UrP9597j3PZ?=
 =?us-ascii?Q?NNGyTXca6ArkX4LbqhjShRO40iQyOb5AK9hiokqj8rsgmNMWUNznNmwp7b4A?=
 =?us-ascii?Q?ZuTwysa12QBjyJaSpnc/YniJ62K8GDYP4Q0CISjx0KP1QwgQiqqQIRhryaVZ?=
 =?us-ascii?Q?bBZpnMwXMmAAwRD7asQm5db/zhyqZrLRcjH75WR76uZns9qRLpc6hbSts5wZ?=
 =?us-ascii?Q?7Tk9bELaeVsZOCyf7ss1xRalaoML9KJn6KIy+fKdLwu/F++IAJOs9lWylAMX?=
 =?us-ascii?Q?1jV2PLeRvMClFA+TTokcDIkdKMkL5JlOqhihFO6TRp95adQRj0YtUS/yh7J8?=
 =?us-ascii?Q?YGFQlQYvF067edY3y1mv/pE2zkf0kN7byqn4P/U0iGOKtcIa2ZvOnbnU6TsI?=
 =?us-ascii?Q?ObvitncGZBCTt0hWWzoJZECANCGGLdJLCCkIlWSXfivGL5Z4axRQn24Q+MoA?=
 =?us-ascii?Q?9Ui+OkJnFd6VbC2E0GJNaggsiZwAkTvclBlYwkGf2iVlfq+4Vm/0HkWW77BI?=
 =?us-ascii?Q?g9eDxLEFjNqotpmqbJMc0ujzBEjufgGb05aHOoLfYe5w4BMF/8O2JXdZPlAo?=
 =?us-ascii?Q?rv4kD7NBRFVAQFGNSfT4oWjFiSgNx/2r0R9mISBpr2XmKIHs5zdCYRDVpPig?=
 =?us-ascii?Q?tCiv7Fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oaywTV4vH3sM9z/c9QS9VRn9EdeYT2KT6mS144NOH87CA2ErdFm/Ad1nIzri?=
 =?us-ascii?Q?rGMBeZO3v68sehnNE1FRnbIuZneOb5G6e5KeZSzOk0J03oCpRMyZesoOdyGq?=
 =?us-ascii?Q?wcPpYY2I6rFyfppQXj4TjotUVg6VNunKtnzeDONNviouJWJBEtw4sv28VKCW?=
 =?us-ascii?Q?wTd8G0CvjY/kHTnunkK3xF2zUl0Vq/C4mzjFIm/GWeiUDPWQsn18bTo1F0qv?=
 =?us-ascii?Q?C92gbox+YcyeGCKtqA0zWRF9rKLApG4jKVddXER/+enC5nuYCEAl1NgnJm3e?=
 =?us-ascii?Q?/JgiOkKpwwNvjdyPIs5HiyBcD+uSIecSg2n0qY+87RHk19IRXaODuwEV+NcS?=
 =?us-ascii?Q?JZbuvir43xvKIQM2mRvKAp8p3GVcIm/Ap6ZCSIpfnw9Bbs4ixS6Q3EdW/JPF?=
 =?us-ascii?Q?GGXvhgpMMeN/hsAUP5Hx0+75zqt7yR8cdWJp7HnC3bKPbdmDljRon7Ch5F6a?=
 =?us-ascii?Q?Zryu/UE6CwBoV+wqj2D0qw0JAocaOB+0lX97FE+ppnkG+HXF/UU21a8R4ROc?=
 =?us-ascii?Q?oxCqD3kyi1IeD1ljmpsA5LkSLN48MNweQkWH+I9t4OltmIXN3ICMgYZnYk8T?=
 =?us-ascii?Q?dhSCyQOmI8arN2hv2Oqvlv495NQ7KmkJveYRyrvc/gkr2zeRro+6oRCDFZUb?=
 =?us-ascii?Q?k+aSQgAGvnCQaN1pzvhrjN4HaRNfm6C/mhnMJXtyD7I3vDpSw+ixJNgeC89p?=
 =?us-ascii?Q?7cnGKwx/7IEBSUQ8YPphDjyiOhBz0W0S+dZ4x5WKrDqp7hhdKaOvpE1fgvP0?=
 =?us-ascii?Q?/MRvIVZrfvKLzrD7hnWMMRjMAPEDxzBvHKCsX+UJaUniy2JXSC0A9UbpGN9a?=
 =?us-ascii?Q?QyfUTz/sHM026NzI/FpaBdzat5HTXnuznIM4DuL/gMhem17Kjsz/VCOPSc57?=
 =?us-ascii?Q?5lD/2R0bpwksDSby9Hpat2YX2g6aObvAkfeI2jTYcAnkwLWSMYOfXDVyXAGl?=
 =?us-ascii?Q?zNlNdtKv85Pb+ep0PW5D5xDQjiJfYE5iWnmu4QP831XtMffcFbqRaqxICl7K?=
 =?us-ascii?Q?CZIl8dhbwVJ7TVsV65EbV87esqjMNzZH0HSSzvio+jLQMxsfCY6qa6ZY/FeO?=
 =?us-ascii?Q?FVEyHLhkGC2JQYISpo5PslE/dCrlOPa6GKDzQY4vTMOMThE3YdkmafwvJM0m?=
 =?us-ascii?Q?DGf/N3h5+OUt0oqGguN/2xl3y/WMkauEpDdNqinDOB4+GByCbt6+0Gy2pRJQ?=
 =?us-ascii?Q?yti0Pwv3N7yYCmHOEdOUGAZekIUKTuLh9XptgoYJomIWguec+LE7R1J+moql?=
 =?us-ascii?Q?KEQnm2+labpTheT/q70Sa2MDdFjaYeVILpMHfmAU6LiSCjULL4Z4CHvrfx7p?=
 =?us-ascii?Q?JvqjEoJAU5MlvaeO5xlyyboQ2Iwl8PJ4qq4YqxzLA2efeNRT13YlW2AMtfgw?=
 =?us-ascii?Q?CrnERRxtQqkENsXYa0gJJP316lv2mB/ZgTjBlluP97dHjkukHgDUASSuU6B+?=
 =?us-ascii?Q?1GsYRrnnnJ1XERSFi9hJ+jxY3Mp/gcvlcZ9035OaH3Z5tch3zQ+8WZStn9Db?=
 =?us-ascii?Q?XLkGNy7tXSmOSpI8mo72TsciMdjtAO1fPbKb8o51k4tZfRVPoo+wHKMTJ8/H?=
 =?us-ascii?Q?vRmgx7eXhv19BlcgBHQ7FFTORcBQdueeAFEKNRDOdZ/8tTFRhaZroR43TxDn?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dcee0fd8-536e-4098-1fec-08dd6e2d5473
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 19:18:32.8318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2dy9YuZOgBAbRJAQjfswY/dWmf6I7Z27+rUSAKyj/djcagYvX3A7lCM+6c8PDKVri3V8sNzzWGQ+ebZeEQJcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5220
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

On Thu, Mar 20, 2025 at 03:11:55AM -0700, Kenneth Graunke wrote:
> Historically, the Vertex Fetcher unit has not been an L3 client.  That
> meant that, when a buffer containing vertex data was written to, it was
> necessary to issue a PIPE_CONTROL::VF Cache Invalidate to invalidate any
> VF L2 cachelines associated with that buffer, so the new value would be
> properly read from memory.
> 
> Since Tigerlake and later, VERTEX_BUFFER_STATE and 3DSTATE_INDEX_BUFFER
> have included an "L3 Bypass Enable" bit which userspace drivers can set
> to request that the vertex fetcher unit snoop L3.  However, unlike most
> true L3 clients, the "VF Cache Invalidate" bit continues to only
> invalidate the VF L2 cache - and not any associated L3 lines.
> 
> To handle that, PIPE_CONTROL has a new "L3 Read Only Cache Invalidation
> Bit", which according to the docs, "controls the invalidation of the
> Geometry streams cached in L3 cache at the top of the pipe."  In other
> words, the vertex and index buffer data that gets cached in L3 when
> "L3 Bypass Disable" is set.
> 
> Mesa always sets L3 Bypass Disable so that the VF unit snoops L3, and
> whenever it issues a VF Cache Invalidate, it also issues a L3 Read Only
> Cache Invalidate so that both L2 and L3 vertex data is invalidated.
> 
> xe is issuing VF cache invalidates too (which handles cases like CPU
> writes to a buffer between GPU batches).  Because userspace may enable
> L3 snooping, it needs to issue an L3 Read Only Cache Invalidate as well.
> 
> Fixes significant flickering in Firefox on Meteorlake, which was writing
> to vertex buffers via the CPU between batches; the missing L3 Read Only
> invalidates were causing the vertex fetcher to read stale data from L3.
> 
> References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4460
> Cc: stable@vger.kernel.org # v6.13+
> ---
>  drivers/gpu/drm/xe/instructions/xe_gpu_commands.h |  1 +
>  drivers/gpu/drm/xe/xe_ring_ops.c                  | 13 +++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> index a255946b6f77e..8cfcd3360896c 100644
> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
> @@ -41,6 +41,7 @@
>  
>  #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
>  
> +#define	  PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE	BIT(10)	/* gen12 */

this definitely matches the spec on the bitgroup0, but Mesa
code got me a bit confused:
PIPE_CONTROL_L3_READ_ONLY_CACHE_INVALIDATE   = (1 << 28),

>  #define	  PIPE_CONTROL0_HDC_PIPELINE_FLUSH		BIT(9)	/* gen12 */
>  
>  #define   PIPE_CONTROL_COMMAND_CACHE_INVALIDATE		(1<<29)
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 0c230ee53bba5..9d8901a33205a 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -141,7 +141,8 @@ emit_pipe_control(u32 *dw, int i, u32 bit_group_0, u32 bit_group_1, u32 offset,
>  static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  				int i)
>  {
> -	u32 flags = PIPE_CONTROL_CS_STALL |
> +	u32 flags0 = 0;
> +	u32 flags1 = PIPE_CONTROL_CS_STALL |
>  		PIPE_CONTROL_COMMAND_CACHE_INVALIDATE |
>  		PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE |
>  		PIPE_CONTROL_TEXTURE_CACHE_INVALIDATE |
> @@ -152,11 +153,15 @@ static int emit_pipe_invalidate(u32 mask_flags, bool invalidate_tlb, u32 *dw,
>  		PIPE_CONTROL_STORE_DATA_INDEX;
>  
>  	if (invalidate_tlb)
> -		flags |= PIPE_CONTROL_TLB_INVALIDATE;
> +		flags1 |= PIPE_CONTROL_TLB_INVALIDATE;
>  
> -	flags &= ~mask_flags;
> +	flags1 &= ~mask_flags;
>  
> -	return emit_pipe_control(dw, i, 0, flags, LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);
> +	if (flags1 & PIPE_CONTROL_VF_CACHE_INVALIDATE)
> +		flags0 |= PIPE_CONTROL0_L3_READ_ONLY_CACHE_INVALIDATE;
> +
> +	return emit_pipe_control(dw, i, flags0, flags1,
> +				 LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR, 0);

Well, it respects the spec and if it is solving the issue let's go with it.

But last question, should we expect some performance change with this
extra invalidation in the Geometry streams caches?

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

(I tried to trigger the CI manually, please confirm it is okay to
add your signed-off-by so we can get this merged soon)

Thanks a lot for finding and fixing this.


>  }
>  
>  static int emit_store_imm_ppgtt_posted(u64 addr, u64 value,
> -- 
> 2.48.1
> 
