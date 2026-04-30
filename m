Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AC9CD13D2
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 21:00:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C0210F478;
	Thu, 30 Apr 2026 21:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iiPV8QDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EED10F46F
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 21:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777582832; x=1809118832;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2y0e5JXxezrmmx/FfsH+0sytFn2aGgWBD/03qNDRphY=;
 b=iiPV8QDPrGcE723ovLOgkyRWanXnf3D9jHV/hJf/r7JhpysSWK3Z4h02
 usqtRoOGYh4xppDNFZU9kskGW27h8tn2kA/sICxyTsel0h2LuHdLZFE3K
 wWQkNuYfDwxgUAmK5UJQ+OWBE/CLnp1UNwkYxjHda6WxX2xfuPrHuvH55
 jBbPjX5qvWHcJJw+QRdoclJzdnHCfwzGSqq0/3a6CvZM3ammE9ammmV8T
 5nsMnU2r99M/RPiCwAgN1046Ui/+gu3fmzHrr1RLNNjSgZlWgaQVyPfC/
 cFgwGuHiF1ZJU8wlsJMSR0gMM99vI0/dwLw/XnlvmKDGaLD4+QbYOYGyu g==;
X-CSE-ConnectionGUID: XWl9gsFmShKpIqeaYmxiRA==
X-CSE-MsgGUID: nlJmZDcoTk6eaLIJpqINaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="78743032"
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="78743032"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 14:00:31 -0700
X-CSE-ConnectionGUID: mA7j6DE6TCStP0atxgy1nQ==
X-CSE-MsgGUID: n9GZuabwTOeCsavsBb2Fvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,208,1770624000"; d="scan'208";a="233655368"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2026 14:00:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 14:00:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 30 Apr 2026 14:00:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 30 Apr 2026 14:00:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ReSQDLsk6lZXnkC5BSviuXIRnu3r7EYLm/8k5LP3TWyiQ9WIrRXq3eviP4CZeZfm74ZqMZZqL3ALN77RimcfvKWXdiMkL3MG6q15fZ9cTIG3Y9s1wxkgFIbf+WifVmJRvQ5COO3KnwtQYkv4E5RRiFoL1Lidzck24hi/z2LZBfOmjKmTfCIr0twsPQSfJolhHQJHMEUw4FOE2HjAZVYsmJ3ohr85pTxwWyL16jdcy42PCkKx7lmU4WIvmhbuBblaN0DGuDK5Oz1Xz/X7vpQx1hzb2o+Q8Wq9sBPCK3HrqpQroYBtLWbjOvHbR02iV8/HCKgg542hUjK3r311MT+peQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0zXned9SHs9Jp914+w+yjBQuUqkcqGLrOb3og4gISk=;
 b=krofkmoNZRELeteRVXpi/OHs6ihc3ka/kcBGWjcsuBo7H3DXpsVYMgXQhNAW94xE020i0Tc0hbtwtg91CLC5LpW4tgTPeKAaOhB1AGbHlwpQjMDM+2Sy6amgz6VS2L/+Ners/bVwAIJw7aSl861f33wyWvoN2690jKazCS0D4sRAJIrT+7NVKJ6R8ZlV8Q8FZKm9/02NdQc2AIS7C0By0JP2PAXmQq0ZS2/Z7JkPBTYXnFxZiH4Yyhxg5zk2Ij0gQ4wK2Uy1A0L92UynIPWZcJOMg06Ux3+5zOQucnro87WIG+c4Ic/biybwZmOmWVNwhq+ft2761Y3TwYRTcfvtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6339.namprd11.prod.outlook.com (2603:10b6:208:3b3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 20:59:57 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9870.016; Thu, 30 Apr 2026
 20:59:57 +0000
Date: Thu, 30 Apr 2026 16:59:50 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <sk.anirban@intel.com>
Subject: Re: [PATCH v2 3/3] drm/xe/gt: Drop redundant forcewake
Message-ID: <afPCxrJ41Ff0yGIU@intel.com>
References: <20260427092928.1181893-1-raag.jadav@intel.com>
 <20260427092928.1181893-4-raag.jadav@intel.com>
 <ae_fG5yyH5jyXztd@intel.com> <afH4tolqlEqO05B_@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <afH4tolqlEqO05B_@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0188.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::13) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 64c5cfc7-139d-445b-0bdc-08dea6fb6f65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: XBsor6vIRHZGYuzujVEDNRJL3bjuqzW/2EsK+7YkWGKH7U/56DuzajmwsQnrmXk2qrzRTaqhRFTgHTot+0zXcLfSOm+etCkZPiuCXlcCYThG1tnkFsLlZSGh6rflfldk97mG6iIJCzAKyLYJdAzh2Qk0cBqBmZqfpiC/G8D+nQzTYW0NgQFfMLCbC/pZJE+KsZBuBM6OWGmqbMv0Cu8zrOxNdhi50eqejUg+jkSi6n4Zvk/my3o6btAKs8B28nQXC86gywVEH2RNRhI0lFgtIILMekHe4caKozm67PNJ6HI+5oWvOsSobRRR94KzNIhC4VNm2HRMUMiyQ237yBtMfANdQmQ0Y4SIXWKISpq/iwCklt70Y9sXQmEd4qHomUWOxQC0vXp1ZqZRmYw1LTf57UHlxI8qXRqQlxh1lZvbnZGKkDT3TuwrdlLql68y4mCI58T1dzu4qJU8kUEikQRMtYaVhnacIEvzuYO2/0v2cSlChlgQXTGLLfUF6Cj5Z7Bph0J/JeyXcPeXjB68xzBElRYubwXFUrCxFDePFdGpMnFdclQjXQX6O9bpJqbNmuBt0fa6Hkt0Qrk5af5wjnotnGZzAEMjWv6WR/a+ef/V/N1gmHADxrHaIMn/ioxfShHeu8ZyqE9EjLXuTxEkZvteNA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aN46Az8IrvsQwFcHd1IzZFmk3tkDpNzuRFyl/1pHfzgiWQ6yvqYGPncHlUmp?=
 =?us-ascii?Q?TgOiczUhTFDuWtnYOqbkJTKFHmWO/4WJggNnM7GsuFSVqHOnF68SZaUiOQGc?=
 =?us-ascii?Q?9iedjUtzeVUsqPD6hI5uz38JialECBnLugjcZZUSqH+xBEe9vFI0n3zOqRg5?=
 =?us-ascii?Q?LORvPK8pM7u7yjgW8qbqGDxIkQ5CtQy1S9SlSnOv46eIXWr5lVYbxVX44cbF?=
 =?us-ascii?Q?PdJFRhDSbTgKKezB6mHTUtqhlq2GXyubDZ+YQb21ebdkaF9YkGYEzuP1JTlH?=
 =?us-ascii?Q?cohLnH4g0p3nKPr1NudZOlZVDpN9j3lrjoiOZs7T5Or8ZBbWZmiNgzm2sfog?=
 =?us-ascii?Q?X8os3YVULil318VT/NdG9J8Wc6c85QzHGEfOI37EOq5ejlV/Q75CAOJ7U2Bd?=
 =?us-ascii?Q?NAyJBo5MUn82YFdU4X2rvQybEouMGJAcBGHM2l7+qWb7IubCp+2ybgsaXM58?=
 =?us-ascii?Q?Kevr1+zozLI1We0UReeyToKkpnj4v6mp0iaHMjRSW2mX0GpEOTXCz+xx3/cB?=
 =?us-ascii?Q?e8xsqvhwF1zGjFc6zY+7q0Whwt9ymovJ0pHyu5gkwQK4D7rk2R2uCoiNcfJK?=
 =?us-ascii?Q?96rMeMpJaUObhnlrXtfyL7k/AE1G0Bt/jJOmriRPHDQR14/Yguujd5vnIygY?=
 =?us-ascii?Q?cU9uDilyLDS8Fuu8LXiYZDpNk7zWaj90pBOwrj4fs7g/mPtXWryxs6uJKgBM?=
 =?us-ascii?Q?/exr/qpxw24UObXfFJXyDTjLfeocQAKr/yU/FjE91hscizdNr5Lx9zKjaZ2h?=
 =?us-ascii?Q?vdnoB5PSJveKQ7i2SAIyH2AQr5as25ca6Ol+EtYoIlCZgPhX0b/B9tQCQLL8?=
 =?us-ascii?Q?hupB62zLkpXffNYR4Zsol26PtOVEoxY7tBGXoyJmYIOsNJKqcpp1O4x1KM4B?=
 =?us-ascii?Q?KVIObBTZJJa9C2enRwz7w1Z20zBVIjGrtRKpsE3OiUJfeMnitrk/uGa8QYN3?=
 =?us-ascii?Q?k4UiWzTD8WGPLply6EG/wqyJQydoOiYTKZuwTDwb9WBisE2XR5EMbXm61KB1?=
 =?us-ascii?Q?lSjxfeDfxRC7VxrDd6M64u3MGNs8Ocbe/yk5hcRz4F50QoI2xIczdMYSCCOn?=
 =?us-ascii?Q?gO/RTTM13tUljuHFK7QL7wj+kqnniqJkMqQBLXPwH4jPZm7M/PbYJ1SyrQDU?=
 =?us-ascii?Q?dWwo/tnpz1H7w9zTtjxRiKqQ5G3bEDU9VH5yS1UG56hqLRYkM4SKLdvYzEu+?=
 =?us-ascii?Q?51pzNs3n+gci7Y5UK6mgbKRx/9NlhknUVkOaa+jsz34+3MtYl88qe0em8OJY?=
 =?us-ascii?Q?sBzSsPkNZgPxCNpm+IWsQ8oVqRjIgCJT4aRVrwLZHrfyge9aFbKF9R4xdIYh?=
 =?us-ascii?Q?wpJrPLs64Q/Do2XLEJgXQU8rDZufuOyaq5p/jHUDFxHcpLMs4tJ/bzHa8nzz?=
 =?us-ascii?Q?ZWLypHZJcQQQTFkPBfZGNF3FL9WM1t6JXv9zXwfs9mRYyZ1ZcyaZAoK/gO3C?=
 =?us-ascii?Q?ffTCYLMk+Kv4ByXM96YnDxgNslBso1T5Cy7gRoFwgCPqq+BpPplFB/tSTA/W?=
 =?us-ascii?Q?1OeO+MCw6IUDmHuSEH9W0IRB2mK8BlzsBzr1Br7utNxJ/wW4ST2PmPKBjAoN?=
 =?us-ascii?Q?/I3DR9ZsGgzD0TwiStHDoQ6haIMUerOQ+QtMmzES43Cl1qMFK3HCxf5fTjhM?=
 =?us-ascii?Q?QPnR1o4uwjZev+/MQ9YsJ3hyW/tImTPfwLpFfyRRNXTTeU5fYU1ZfdrJ2KJd?=
 =?us-ascii?Q?IySwUo6YawAdHLR7PJ9louj21xNLO3QOe8tJwT6yPCeDr72jvnCKuKTnqo1/?=
 =?us-ascii?Q?GX9/CceYUQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: GetSMPO+5OSARAKXxcRhGlBUPjdnCA6NTlDOnfzuxh3qpEHmYTXU+fds3DehNBWAYRlFGINtJcSz2VoH47D01H+tn65UMvCCjYj8lQivgH58fRTqv4G+XbHD4//pMH5RiLjtLS3krbVYEEfpWHJU5PjCqXzMElXVvO16mphXKCZuhg6PiSna8mOVb6nnrZ0E41yJSCsWBe0AMSGixl4Dm+JKJMZSGH/UixFteLXysnG4g7y0HMrjqbMdwV17oF7/jfZv3nOk5LajbRAhD2B0rz7ZVTxbZYKcrClhArIKlblVmjYhyXx+4pd+z57ke3Bwv9BmZXoxmrhdibZFIBOPyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c5cfc7-139d-445b-0bdc-08dea6fb6f65
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 20:59:57.2403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZV2etQeE7SCyHFU6A5LZYmgT48fO/eBLQVsNxd/8mRbDk/ZzgyiBfdM7HJvuaVq19/LeKtuvtkLs09DfXQKsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6339
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

On Wed, Apr 29, 2026 at 02:25:26PM +0200, Raag Jadav wrote:
> On Mon, Apr 27, 2026 at 06:11:39PM -0400, Rodrigo Vivi wrote:
> > On Mon, Apr 27, 2026 at 02:59:28PM +0530, Raag Jadav wrote:
> > > xe_gt_suspend_prepare() doesn't perform any MMIO operation that requires
> > > forcewake in it's code path. Drop it.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > it makes sense... for a moment I thought that the gsc work would require it,
> > but it has its own forcewake if needed...
> > 
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>$
> 
> b4 usually ignores the tags with artifacts, but I'm not familiar with dim
> and I hope it's not a problem.

Duh! Sorry.
dim uses b4 on the back and that got merged like this :/

commit e70d1c5fedfac919278a96aae0984f1927a55137
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Mon Apr 27 14:59:28 2026 +0530

    drm/xe/gt: Drop redundant forcewake
    
    xe_gt_suspend_prepare() doesn't perform any MMIO operation that requires
    forcewake in it's code path. Drop it.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>$
    Link: https://patch.msgid.link/20260427092928.1181893-4-raag.jadav@intel.com
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


> 
> Raag
> 
> > > ---
> > > v2: Expand commit message (Rodrigo)
> > > ---
> > >  drivers/gpu/drm/xe/xe_gt.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > > index 3c031175f737..e5065f46c748 100644
> > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > @@ -1027,7 +1027,6 @@ void xe_gt_reset_async(struct xe_gt *gt)
> > >  
> > >  void xe_gt_suspend_prepare(struct xe_gt *gt)
> > >  {
> > > -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> > >  	xe_uc_suspend_prepare(&gt->uc);
> > >  }
> > >  
> > > -- 
> > > 2.43.0
> > > 
