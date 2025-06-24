Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF1B3C77B7F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Jun 2025 15:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3CA10E5D4;
	Tue, 24 Jun 2025 15:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GLdpdPVu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5251410E5D4
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Jun 2025 15:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750779054; x=1782315054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Z7k5WOIjUqT2Is3E7XW03opOkDAWgxt30l6+fwOhXZQ=;
 b=GLdpdPVuITi1buWmMM3sPmC7o4Ia7DxKhB5ScQbzK/GjQPq8TpNnhT1o
 an+ZIi/5L9eEzHoU5WbUvsihAYFL/EFwJLsX5bsCsLmu/0IlrtGJrfHxe
 G9A5p6+Ayf5vhYYNazsotQiAzOADJ2wPF/eXtGUXEjyb9Ch5+XBbUnQEL
 yaD7H5a2u9Eb71YZeZIEQdRuiAiSeuthj9j+H9ye0Yh+CVK5SuvPLhVyu
 s7kUkeNFU65HmEiz+4tkjyx39wOwML1mqRqxwsNXFeZLZPdQ9zoYAPn+k
 w/iZKRdwRDbqqMzSHV0UhXGtL1AMoWPWfveMtQc52u+zPqWGSrbXZfP7D w==;
X-CSE-ConnectionGUID: bufdt1gXQ/WZGkKIdNGUJg==
X-CSE-MsgGUID: JJUa8Pt2QqapLCk8eH8zyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52748373"
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="52748373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:30:53 -0700
X-CSE-ConnectionGUID: ohOdYkHDTkSK9Ah6XtCQ9A==
X-CSE-MsgGUID: fIdzG3uyQyyC1e9Lh1z83g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,262,1744095600"; d="scan'208";a="152446679"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2025 08:30:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 08:30:52 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 08:30:52 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.64) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 08:30:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VcuWXu2H89Cmzui5Z1wq0ZCDhyaNHEIJkrMoIaFRMQvpFm4Q87Gt7XYljHQYCaHfnmEAcX6mNtBfjFDzh95xDw6CeD1AplRsuR4dC2jkyuMXlo0XwRMSOVpghVkDbOjB4zz3+OBV72Su+WnXzaxCQrLCFOo6Xj2CIqBh+3sqlEkL+s0qxfyhvLWPrICpHFP4MDWyXh3YNQak0VP6X6XBQT0PVVCi4VBzVdAiawIeaIjDkRQRLrqwPmvJvz0e4N8bbGSRriJ7l6vlgiJN+h22meCFIKJy2L/mjyPYxSrnjOFIQK1PfaJRwq7Tjngec4tiaKtQnYWen0nqrjtI/PpXkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0K1r1P56QRKNqGguJnkOpommW7A8h7n8GYax4HLAT8=;
 b=K9vHQHNrJ9uy4dz6MJHpkC2+IbkSayELrdKWCIjHORIkQq/CHYbxh8O7OY72RTw6kO/8wEr0jyMqiFcmhSZPdc8yhuTghN03CGxqwqTxPGS5P8ArnN4u2SAubOn4vRiFeuGSO12TD7w0SwOEdM+FayvYmRntT2f8WNYqEGA4Qy/N6OGqQddJL8ITacc4PLuivh7JVj0edLDnZHilvsxKr8C3+5xY6IdBwwodkY2SupGnMI8HiZ7Nqa/7JV2rR8c4JxskN45N91CeANkc9U1w/b0DlqOn5zIAS25AmiX1dlvEU8YtprZb7vNX1mpk31l3+95MMi4Dd65eBQbsnEcRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB5011.namprd11.prod.outlook.com (2603:10b6:303:6d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 15:30:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 15:30:50 +0000
Date: Tue, 24 Jun 2025 08:32:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/guc: Explicitly exit CT safe mode on unwind
Message-ID: <aFrFDV6ghPUHfWLI@lstrano-desk.jf.intel.com>
References: <20250612220937.857-1-michal.wajdeczko@intel.com>
 <20250612220937.857-3-michal.wajdeczko@intel.com>
 <aFnHMVSx8FRrT110@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aFnHMVSx8FRrT110@intel.com>
X-ClientProxiedBy: SJ0PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:a03:338::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB5011:EE_
X-MS-Office365-Filtering-Correlation-Id: 613e5739-ae5e-4697-b7ae-08ddb3341925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1vU12nDHJ1K3vUvTkUNStO0Fa9ix70WGZASBBlAanW8ZHgMkx57eQrnJcoXu?=
 =?us-ascii?Q?5d4kibo+KafDJMIe68YvBx7IvoARf+ybN4nWlX+iEIIlm77xWJKIazV728Hm?=
 =?us-ascii?Q?9Z1mitOfSbV0vj36ssDU6qPw7IcVqotx4t4+U67S3o1wrdtWTn+oFgfrqzi2?=
 =?us-ascii?Q?QwjEjIVSHcoDmqV5Yodev+sUaZjRaSyT/OBkhMntJ9H2e8Qe/28IhGve2h7R?=
 =?us-ascii?Q?iK2HWD2a/fg8GJkJEbdw3diIXVwQ+8anSZcowU844mDQE2AzCN0JaR11QDkJ?=
 =?us-ascii?Q?KvZgMiIYt0ITnvijgoNyhGeEnWym7TXAjFLL3Cz9T/MnLZv/tB/E95mJnExU?=
 =?us-ascii?Q?EuJQzvq+qQ9IN+IdjMG8VhDXH/aSVwEpvGrdlD9nsVDKQOcmKG63raxs3ELJ?=
 =?us-ascii?Q?jBJBSd5dr58DCOrxrrGeIEH/Bk1yqJwwS8B3sYGlQxAM2d1XiMcx+2j+U7qF?=
 =?us-ascii?Q?/JGEHcE4lopAWUe/CPKN3BzQx+GRVcl9nh5B24iUHIdDnMiQRFKTdgcE9Pba?=
 =?us-ascii?Q?VJbxsCsDGlRfcZ5UzIeD+wNbIeAaERpSg+RrTql9NMi78extHsemRYGmyC5q?=
 =?us-ascii?Q?q2T4R9MHLSth4mugNpIhdX3sb6utwN4f2ohhTSPnjdgxt30F5fS1yrAkwt/w?=
 =?us-ascii?Q?O8o79ZX4JRR+EjagCAMoGKepDAP5DR5SA9SxMRPG8vf1X8Oq/ZmqV73ZakCA?=
 =?us-ascii?Q?vxEFN2/fCs06YlVmWjYFS+ORelpn/cXYqdVODzf+TTmGQgiLM2oEVytqgl/m?=
 =?us-ascii?Q?CUHfkUCERIciTBstmsyjg/SxhDrJWXzSiNKJsrsRg0M0dXrtD8snB+ZG2mwb?=
 =?us-ascii?Q?zEQfoxNEHHwlwPYsPIVoBau8jkLz5miO+6MVoc7BVOwWK8wBVMDgmgw5VEmg?=
 =?us-ascii?Q?RboatJFu9/EqYyEsRBBbs5FlTN0RO7wEmia72giF/G9RDgpMETXGlCfZWfRl?=
 =?us-ascii?Q?un16OQ9aVgYBtUMiDb1OC6d+ZC6jGvDFbuPlHgBjWjGZK313ehXzYldys14x?=
 =?us-ascii?Q?AwEjjLyGHwrOcgw3h6gfqD/m/rhY778ICMglmQ2++Fcvl9OaPTLZZNDasbLA?=
 =?us-ascii?Q?wEnYsc/OxcZS1bZ0xq97KeoTQYUdWVPTLhVXSgjVs3XJaSUsTgz0n7tYxi9b?=
 =?us-ascii?Q?BeSXFOm/7ywMLCWcbZnA0vA1KLPzZVjvj3hUQk+E/eDFXWzyvgv0wIUZE3fo?=
 =?us-ascii?Q?IkpJrfOEgr1BTmMfKA4sq1oG63MZDzMe5Fw8qOvSB0UiK0dLcOvR7MKZ0wq+?=
 =?us-ascii?Q?4X5NqkxaP2YyGy5otpmBaO9neAX+tm84mX+wsy/G4VwOeYyIaP9TakEvx/+/?=
 =?us-ascii?Q?XI0qfGzjlgHex4750BeQ5YJTuDcLBrw7Xs6Au497k/VIYgygvysukLfBpKrf?=
 =?us-ascii?Q?/+3FG5Uo2p+0Toy8CEi6ktONpzzlpqRmmWzwOABAQ3P9pwuZO3o1K4W1+KiD?=
 =?us-ascii?Q?fN6PaWZSjG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PdTevPf60fsmlYmwEtd6prPknPK4++p7gYLL2j8FlDE7Tu8fJgSxMz7h2pFV?=
 =?us-ascii?Q?a7wEsuB7i7fiWbfAwu15tb7a+RBcMgOYDMZTecdH0pweVZH36yjz9schqDMn?=
 =?us-ascii?Q?CnT1PPUmMaTIAmQaVu4TsSCfpM4vz8NJQjg/w79Bb46eOzbeOLY9k1aGWkxB?=
 =?us-ascii?Q?AcSCrCmOknGmKGzT6x9RvJQIXezQhzhgbRrlF6a6G7725Aj1j5l1LVDZXW7r?=
 =?us-ascii?Q?wc4ffetWKwboLcj0q8P43YInHnR3xydrou9IKM7MKHlwfO1pDcTtjhw/RHJW?=
 =?us-ascii?Q?3PKKRNcfXGHwP+gGl7665csON+4I3MS5ZoGNTca6hBkGRYK1+gFPFuTBCHJ1?=
 =?us-ascii?Q?vpRJYyS2U6DL4HnBJMuQUxEIca35VJKsnFfuNrEXlnOGgmW80LR8HcF3Loce?=
 =?us-ascii?Q?JpsbVzF/uxfVxY8aecFj3KP0MyzdEDlHwB2l72GOSCDLtF1ETnZIt+n0UM6E?=
 =?us-ascii?Q?IctjbDD9vWl3PO5GXHJd1oWxRoZYftfwTphTg9CDia7w225C+At+gB/za7tj?=
 =?us-ascii?Q?zVkPx+fLL6E5vo+XBv/tYC25efTpBzj+UZC4J5wv6kIrp4FrifGcf9is6epn?=
 =?us-ascii?Q?MHFlnY33AS17508UW2ZA+O4zVMmam83kXk6bIPLcohQGD0V7a6cWB69NvNtm?=
 =?us-ascii?Q?hVXpdmoeoyJgqdEIMOP/mvlzkCfIf1eYcnjnIItUI9E4lDIHo2xWrUJ/LnYT?=
 =?us-ascii?Q?GqS/++EWALiMCOrtrztOduWLE/rezVF+9cke6I529D79yCUTsJk7xcU8oQ1n?=
 =?us-ascii?Q?95qc4NnCuF78sNVu+LbveZp2k8hHtq/b5n0Fl7zX05KOoN+bjGJU7AZyHyfj?=
 =?us-ascii?Q?Lz6ioLDi7hZeyiqR5QxlgJv3ziu7A+DW6f+r1MRRPAicGyF/lUn1l529qBb3?=
 =?us-ascii?Q?dQUVqECIfT9qZflwuTXes6XQm6Hy+pQL7SCQ4l5yCA6mI0Y64cgDUXdKZVtz?=
 =?us-ascii?Q?F7t0sa5mLcBGIod8Ypwg+BR+iTGKX19RF/gUe1tlLRiJdYOKtihxMSst7mlx?=
 =?us-ascii?Q?dC0v0Zd5ODJ1p/8SOVJiVN8ekF12ryk7c1NO475xHne1i3LKZ1ycjdiHhjKp?=
 =?us-ascii?Q?rsAcV45Qf3vIOjA32vgY0cyFXxvw1jSTeQ5ghFbu7LiLcnc1lJnwFAhn8czb?=
 =?us-ascii?Q?8p8x1kH727XppAF/dqqplAgNaPr1Rznl62kLyw0vd5EYBqZ3VRo+MXh+jBLt?=
 =?us-ascii?Q?pkWQzZ9+GP7MVyXl06/18onx6MSEd6dIbJytslXb3UgltNi+gw6ObkQ8HS6/?=
 =?us-ascii?Q?NxdVOfuP10VbUNPd8heRZzT2/xip6IZDiAl8vKbiKMftF0GsXHCCl5otZmsE?=
 =?us-ascii?Q?t1vOtC6r4NGea1ON8jpjtTXmvZiS5XI1NdeQjPTvpYPs+yOOAUKPumpIA4n0?=
 =?us-ascii?Q?zYLWyQ92U+2W4XK142/a9Mnm4pLxKZXBToa5UOMSiPqvSFcGqgWdL+kZlBa7?=
 =?us-ascii?Q?UqVeOUeBZLwc6oKhl06ZEVKCHX6bVqeDs9ynCbggXDsxg0jWWDjJH3Dn/JIe?=
 =?us-ascii?Q?EVUf70MVFvCKDuLgisXB7jdFi0ZEUN1phJSVEmXmiQNrI24YdjoM0rmn+5kc?=
 =?us-ascii?Q?xk7hbAKzNYWhNxH4qJow4+EuNjaw1fI17Lbj/PH2/N/fJ9kfUjtnob5JfCp+?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613e5739-ae5e-4697-b7ae-08ddb3341925
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 15:30:50.0725 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zTJnCGybyhf9pHmBSt36FYfokC9RIWHEXs0gd793ggw0lHowBg8GYsbAQBhXAkcFVxnAkg1UlNjwqkkhSlAnjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5011
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

On Mon, Jun 23, 2025 at 05:29:21PM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 13, 2025 at 12:09:37AM +0200, Michal Wajdeczko wrote:
> > During driver probe we might be briefly using CT safe mode, which
> > is based on a delayed work, but usually we are able to stop this
> > once we have IRQ fully operational.  However, if we abort the probe
> > quite early then during unwind we might try to destroy the workqueue
> > while there is still a pending delayed work that attempts to restart
> > itself which triggers a WARN.
> > 
> > This was recently observed during unsuccessful VF initialization:
> > 
> >  [ ] xe 0000:00:02.1: probe with driver xe failed with error -62
> >  [ ] ------------[ cut here ]------------
> >  [ ] workqueue: cannot queue safe_mode_worker_func [xe] on wq xe-g2h-wq
> >  [ ] WARNING: CPU: 9 PID: 0 at kernel/workqueue.c:2257 __queue_work+0x287/0x710
> >  [ ] RIP: 0010:__queue_work+0x287/0x710
> >  [ ] Call Trace:
> >  [ ]  delayed_work_timer_fn+0x19/0x30
> >  [ ]  call_timer_fn+0xa1/0x2a0
> > 
> > Exit the CT safe mode on unwind to avoid that warning.
> > 
> > Fixes: 09b286950f29 ("drm/xe/guc: Allow CTB G2H processing without G2H IRQ")
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_ct.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index 822f4c33f730..6e353757e204 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -35,6 +35,11 @@
> >  #include "xe_pm.h"
> >  #include "xe_trace_guc.h"
> >  
> > +static void receive_g2h(struct xe_guc_ct *ct);
> > +static void g2h_worker_func(struct work_struct *w);
> > +static void safe_mode_worker_func(struct work_struct *w);
> > +static void ct_exit_safe_mode(struct xe_guc_ct *ct);
> > +
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> >  enum {
> >  	/* Internal states, not error conditions */
> > @@ -189,14 +194,11 @@ static void guc_ct_fini(struct drm_device *drm, void *arg)
> >  {
> >  	struct xe_guc_ct *ct = arg;
> >  
> > +	ct_exit_safe_mode(ct);
> 
> I was going to ask if we also don't need to disable more of the ct
> at this point, but I believe it is indeed not relevant at this point
> of the code.
> 
> But it is any possibility of double call of this function in some of
> the regular removal paths?
> 

ct_exit_safe_mode is safe to be called many times - it just cancels a
delayed worker.

The code looks correct to me.
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> >  	destroy_workqueue(ct->g2h_wq);
> >  	xa_destroy(&ct->fence_lookup);
> >  }
> >  
> > -static void receive_g2h(struct xe_guc_ct *ct);
> > -static void g2h_worker_func(struct work_struct *w);
> > -static void safe_mode_worker_func(struct work_struct *w);
> > -
> >  static void primelockdep(struct xe_guc_ct *ct)
> >  {
> >  	if (!IS_ENABLED(CONFIG_LOCKDEP))
> > -- 
> > 2.47.1
> > 
