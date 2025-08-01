Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F935C87FCA
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 20:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6151810E065;
	Fri,  1 Aug 2025 20:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbBC+oEd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9FED10E065
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Aug 2025 20:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754081341; x=1785617341;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cLzaezTqZLv+oQO95/P7npGYcfJV5rXTyTZ9Rs9tTnA=;
 b=QbBC+oEdSk3dc6iL7SnVPdN/s9mI0qqo35ol2+caaFpqMO90LlB/k70y
 jKZ4L3C1GAR/jwSvgTdEbqgS/lXFu59q0eJV6OorKgXxpotzQd/IB6YNh
 59QTf1gHLcs8thjZv8opj+U0h3QEE6qcuExXDQDbk3R3bIOqVrdxVFyQV
 YmLHe0iGMtZ4oFaXVbNcFnrr4d+mJpTAkO8AibUX7VG1f5Q3Kths6na2V
 +o1edS1HeU4vTXoLgtf/76dEy/BC7wmVdVtS/HRAR22Z+fey3VbpoJ2Sr
 tpPH4zwEt+cL0uyr9p4KzX8W3Vkr3it4jGbSZOmW7tknw2HqbMKBU+erk A==;
X-CSE-ConnectionGUID: MvT5zKALQQSqJ0sLmA8/bQ==
X-CSE-MsgGUID: owI4nmq6TeaHg7WwmBufWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="44030765"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="44030765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:49:01 -0700
X-CSE-ConnectionGUID: 38SO2+t/QmyZgIj5fFNzUQ==
X-CSE-MsgGUID: svYFwIzPQ2qDE60+e22pJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="162919361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 13:49:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:49:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 13:49:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 13:49:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGpuxvdQvwrzDpUgC+zVfEGNVRzzsa7k43+voNgk4Bd2HKnpGSPM7GFuphQD7s8R4JlNo7kFDtGMuyffPzwQyJarPC1Q51D6QCCHB2BONgt1syRAIfTzcYXKrVCQDbuiVkT0fpbIT4azUhcFjdSOcYrSrn23rfPaUnAHIU9lut2SxfJOQKTNuUuVhI3K9F5EwS6THpVGVYNnOu8othZxIRnnHH5T7PExrQ3YlsxnatLb37ZjiflPdTCSRJ2nxecEr8ooml0HvsIHcD6eTs8DIATlhHvG6zHabzUfz1AbiVmFbKdE8xtoD3aQgpIu6puHE8w/uq5k3YSYB8b4R6PhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLA8OaW8oBG/jC6HZaHLkMqmXbK1awL/5IDBsvJALF8=;
 b=GJ+X1Mvz4FlMducg2G5hdFJZTSWiY5ogmkjiCLgL0ae9QyoUzhIDcWODvCm1xCSCrVY1uytafHLuIW6Mcl+7X0Ceq7h2zXTDshLW3WlxTqizNOMp7BazUzDWvSNjcqIvZRfu8AVGmkBjgdB1taG9+wDUcm4fVAJT9LvOXVZSoSg9kZC6/UV4tcj2gd19CKGejRQAVnHUK8feYdeNV5GxxD95Cmv47TZzpQPT3zZmIqkASFsLGs5EkgiU4GciFGro4h7JPD531ng2VGxksnCWb4b+XzhS/+cZu3Fyf5r79wkpKVzaExG9DLXqi7tFVn++6iXYEiFGPEPQG4oWbSXqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8989.14; Fri, 1 Aug 2025 20:48:58 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 20:48:58 +0000
Date: Fri, 1 Aug 2025 16:48:55 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
Message-ID: <aI0oN49hRUsRTyDd@intel.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-2-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B1CE4DD9227B04115BDCE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ba302e3a-50e1-430f-b38d-651e588f2787@intel.com>
 <CH0PR11MB54447679A02AE8747853C484E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB54447679A02AE8747853C484E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR17CA0049.namprd17.prod.outlook.com
 (2603:10b6:a03:167::26) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 1197fa8b-4ba3-4bd4-a1ab-08ddd13cd659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yIJVEd2E6fT+R+ehnCJWd/9usJM16qzfErumc0lgD0Jme0hJNKko5lsd6a19?=
 =?us-ascii?Q?DbXRu27aea4uNawSrVgQfoQbLHFS3fHdNKwxrjQbOEYc438b7sAdVCMarUtP?=
 =?us-ascii?Q?goBmXJPdGhheGs7ib5xwLAOE+HkAQdP9rySBz1X9LKtWSst8Zx+og4Ogp7bJ?=
 =?us-ascii?Q?9hVn95Wkb06lPXDq0Gl1QerAAg20Wl5cQMzK7QpKI+89qanXJapEJHQF2r5N?=
 =?us-ascii?Q?GyDWw9MunQ+jdAcYGbzRRaYEsObxJq9oL+V19cfulpjfZ9v21dz5TlFmesMd?=
 =?us-ascii?Q?J/bNBChvu46XF7pILELRMs8am8/iK7JlvgtyBm1oLTbAlQz3FfCbAUDs8ioC?=
 =?us-ascii?Q?X/H0xLDEqEfYSFQ89hCFZMF0KoZVjEKbXWStCgSmRUSsCXUjjPysOwGOsLZH?=
 =?us-ascii?Q?rS4m4l+Pfn8BR5AQhwfywX9MP2tDHRZDJb/npOfTIoAh00rXMTucatEhyTjH?=
 =?us-ascii?Q?7x1MwxyvOXe0xkMWSk6oiEMULjOekidB110hfnH7l2HNY71+w4xBqWvBEE85?=
 =?us-ascii?Q?WJeWb3zvp6tO/mfyj1LyGgBSNyMZOe2iehA5+sdD59HuEQRy8f9hdZxE/jrR?=
 =?us-ascii?Q?YSYVL+ugqqujNBBqbnqr55nuGePQB76CQ38A7Dd4ZismKFLwwwfRiBSve1rp?=
 =?us-ascii?Q?kbGtIFUq0KZoafXPM0cUbxM7v4kVWZhlXUk+r6Rm3CDgKhwWVLD0LTyW4NN3?=
 =?us-ascii?Q?jbNEeqapdhVr5oNT4CZr5g6phk9eHsh633m6XdCS7wDdemjND82SuzytKgqa?=
 =?us-ascii?Q?mprktAFc+YTTcoEml6REBVBs8TRkkHasxSHGsKjZQKvqSxDmp/LC+SufJVnp?=
 =?us-ascii?Q?1a50HqYdRGcddypyakVbosc1dONVXd40yCD2cR6tZqbGnqG8S/vQzEuHGHsM?=
 =?us-ascii?Q?mCMpYzKoNhhJjkjqHEQyc4YIqZT7KDdwtw/5es8Nt1yNRC4pO4xc0WZ7QZP0?=
 =?us-ascii?Q?FDFqFd3YO/5zisbPoLekZB1gQvVDi5PB2P9DuLWTIEQs9wl5nxa+/IxNS4+X?=
 =?us-ascii?Q?5erxAQYyxvj+SEJ+SDyEN1DwYVcb3i78f6L0u/hn9mg8RmUG+0fKG0sNhRVn?=
 =?us-ascii?Q?4sUXFwL+NuxiOufE2PjglTs/QDijghQ8hhOxXQB+0VNa63NvV2fMG8adYC8G?=
 =?us-ascii?Q?BLc+lZPhO7Wwu0qy5DD9zZWOcPBIZMu1y0SS0T6wi/BxCp9a2mFS4jO8b8xp?=
 =?us-ascii?Q?25rwbfuiLBP6B3QtWfRdFOoonjVBzoHZGYFfBr/NKuF93//bpei20CwtN8Sj?=
 =?us-ascii?Q?zetqgQSNQt8mphCjoVR0lAtW6j20E6ZY9TJrsPmIS79sTE8my6yMkm2vLWyV?=
 =?us-ascii?Q?SuyTnD882OqiBr2ZpLjZkoN5HjFOZQqCCGabECD8W9hhVywe2pcQDLaQgUQx?=
 =?us-ascii?Q?aMtwXaDu/VJsekJw3H+iatiFNZISYycV1mFT4nmWkbS49fB8FusBum4pxVrv?=
 =?us-ascii?Q?TTKVgBYtDXA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c6OW9f/aKdVT61D7HL21VFnUUvSAtX7jDkG767XsJ4s/n+QkZBAVrqpk65rg?=
 =?us-ascii?Q?24nOD0o0nsWGWeDBsd52DJKQNm4Dcw/UWV3iV6IqHdV9ZF43DYFc3tBAwY/+?=
 =?us-ascii?Q?Hydr0vkFvD6qAgjxhNLEXeb/NYQaVo+dzIJF6hnRZvCj495x0Eb1TTLA7/Sp?=
 =?us-ascii?Q?egvWNorbmjK3QXMNxidJKhIFe7fTJH11I6oiScJbgjWdZgObn/pg3+K2BUk/?=
 =?us-ascii?Q?nQ7PU3luJ0z3DARoGgg6Zxreg34x06+Uo75RnN8qcu6BkaaiO1kDFsqNyqaK?=
 =?us-ascii?Q?Mf69j5IkVCgdOLTpppRG9iXrO3vrtgqAeOliw0TWnQ5w8oJFczrw1A7jRwya?=
 =?us-ascii?Q?FV8jt/m0wF30TH4v4AdBYK89eOEH0zr3ECEcfdKCjmhO7/TQFGUfOILJJGfQ?=
 =?us-ascii?Q?oMS9hA9yOMZWbhT+qJd0RX1lH6yEM5qUKuF8eZVADZltB77jgjojXQ7z+qnS?=
 =?us-ascii?Q?tgPpF6B+16lOOKLFonEyvvBXJNYbadA8fVELiw+B5Vh04VulOqIFSJcuJb+L?=
 =?us-ascii?Q?2aYrYLa2K7zmV/B+ORq546vgMAKkV1PMGnUGqYZbfXKYFV3BGGuBEvUA2GkZ?=
 =?us-ascii?Q?Yqnt8IFtVmBGhD+ccoeKpRGZMf/viyuAiYHNjhP0inhVr4AQWyUEO7/PYBSr?=
 =?us-ascii?Q?KZdYcJcfZfm06isz7jLPSkIbWhN10r+MiXWcI385L/uWGbsIA08GIWHO6YI7?=
 =?us-ascii?Q?a2Ws4AwPCc9sQ4Yd/+DNdvq59//t18Z/z+gW3YqRhgWCeIxNyM5TULzdUVS6?=
 =?us-ascii?Q?0/cDNZv2h6SM3DwVPKVTl7AvRvHljO6+5nw091iw0wPQFB2/L9YvUrFE2E6O?=
 =?us-ascii?Q?Qff6j9KSFM162WnOUoq1w4SVZj0iRW5FuSqpelxW6mOJavDVOZ5abiJnT+bi?=
 =?us-ascii?Q?aU34iCZ1ZjeyvV4fxTNuhsFwLtyA4ds12536aQgZ+nd8VUDHMYWSuGWPeEtz?=
 =?us-ascii?Q?2eq3D/9oa8eWG8kVO5EkIRECqeH7OQYEV20XotjZ2QAUPl901RnP9xxW/bgf?=
 =?us-ascii?Q?IYzbvj0KN8i+8m/TaxhJGgrYSKQdOBuG/Ve+3OOkniOf5Jmv48bqTeb9qIGp?=
 =?us-ascii?Q?VtDjUgdCzLwCQ95s7GnBHJKh8BafNAT4zg9Uel+Wj8hvSeHSt8SxGTbDSUPk?=
 =?us-ascii?Q?5l1DSbDA+BKaJl92I8YF6HJzNg5dYk2XfxORnlHxnvgwCQI1+6q/IKqGaP+K?=
 =?us-ascii?Q?d0Lm2VUueeiAddsADAYbAJ2YahCYs+3JBUQ2RAQQwqeY9FGWnKgnPjRTk0zh?=
 =?us-ascii?Q?Ixl5F+iHV71Iph8pAlibeQOyeWkvTL44PdyaVi2VOn/QO6En1pBOtShEES6Y?=
 =?us-ascii?Q?XZXSatpn80TM3jL8ntQKFq7rnqhJZb0GHsdO2ZOivXLyxTT5TswmTPpGNd1R?=
 =?us-ascii?Q?9kG+4vlEGD/NmItdEEFlOidxfs8Qt6kXVAWayCoP1sklTU+IXu/jJeAlYhFh?=
 =?us-ascii?Q?pby/bUc9VubYTv0BwuzovvD9JfDlwaJnlUPgbvsrL5h8wC0WeJSnKVblMeY+?=
 =?us-ascii?Q?UZvrkV6Skhp+2/A+fWUmwo1Z/+2T/+owKggbedRkWBnA0+orGQG47Feae5P+?=
 =?us-ascii?Q?U5kCZBYBicSKBr9CQIBFipHy296tx9roFJxYfWMuCATheHE/glkWXDuxdhuq?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1197fa8b-4ba3-4bd4-a1ab-08ddd13cd659
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 20:48:58.2906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5beieevGgaNtbNXrttHnkIbHzxGTDrZMl1i0XKsYxEaCRSY8tiyNy8wmhJ1aV4zrbTMRJGZiJ5F8YHKdVSwNJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
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

On Wed, Jul 30, 2025 at 09:40:14PM +0000, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com> 
> Sent: Wednesday, July 30, 2025 2:34 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
> > 
> > On 7/30/2025 11:08 PM, Cavitt, Jonathan wrote:
> > > -----Original Message-----
> > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> > > Sent: Wednesday, July 30, 2025 10:49 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> > > Subject: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
> > >>
> > >> We can't let restart worker run once device is removed, since other
> > >> data that it might want to access could be already released.
> > >> Explicitly disable worker as part of device cleanup action.
> > >>
> > >> Fixes: a4d1c5d0b99b ("drm/xe/pf: Move VFs reprovisioning to worker")
> > >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > >> ---
> > >>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 30 ++++++++++++++++++++++++++++-
> > >>  1 file changed, 29 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > >> index 35489fa81825..2761319fdc26 100644
> > >> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > >> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
> > >> @@ -50,6 +50,11 @@ static void pf_init_workers(struct xe_gt *gt)
> > >>  	INIT_WORK(&gt->sriov.pf.workers.restart, pf_worker_restart_func);
> > >>  }
> > >>  
> > >> +static void pf_fini_workers(struct xe_gt *gt)
> > >> +{
> > >> +	disable_work_sync(&gt->sriov.pf.workers.restart);
> > >> +}
> > >> +
> > >>  /**
> > >>   * xe_gt_sriov_pf_init_early - Prepare SR-IOV PF data structures on PF.
> > >>   * @gt: the &xe_gt to initialize
> > >> @@ -79,6 +84,21 @@ int xe_gt_sriov_pf_init_early(struct xe_gt *gt)
> > >>  	return 0;
> > >>  }
> > >>  
> > >> +static void pf_fini_action(void *arg)
> > >> +{
> > >> +	struct xe_gt *gt = arg;
> > >> +
> > >> +	pf_fini_workers(gt);
> > >> +}
> > >> +
> > >> +static int pf_init_late(struct xe_gt *gt)
> > >> +{
> > >> +	struct xe_device *xe = gt_to_xe(gt);
> > >> +
> > >> +	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> > >> +	return devm_add_action_or_reset(xe->drm.dev, pf_fini_action, gt);
> > >> +}
> > >> +
> > >>  /**
> > >>   * xe_gt_sriov_pf_init - Prepare SR-IOV PF data structures on PF.
> > >>   * @gt: the &xe_gt to initialize
> > >> @@ -95,7 +115,15 @@ int xe_gt_sriov_pf_init(struct xe_gt *gt)
> > >>  	if (err)
> > >>  		return err;
> > >>  
> > 
> > [1]
> > 
> > >> -	return xe_gt_sriov_pf_migration_init(gt);
> > >> +	err = xe_gt_sriov_pf_migration_init(gt);
> > >> +	if (err)
> > >> +		return err;
> > 
> > [2]
> > 
> > >> +
> > >> +	err = pf_init_late(gt);
> > >> +	if (err)
> > >> +		return err;
> > > 
> > > Everything else looks okay, but I don't think this conditional branch is necessary.
> > > I think we can just return err here unconditionally, as if we fail this branch, err
> > > would equal zero anyway, which is what we'd want to return.
> > 
> > this was done on purpose
> > 
> > I'm pretty sure modern compilers can optimize that and
> > IMO it is clearer to leave success path fully visible
> > 
> > especially that in the future we might want to add more steps
> > to this init() function, so we could have smaller diff and
> > avoid diffs like [1-2] above
> 
> *shrugs*
> 
> I don't entirely agree, but I'm not going to cause a problem about it,
> so you can take the Reviewed-by without any changes.

Next time please wait for the answer before stating your reviewed-by
so it comes with more confidence or there are still room for discussions.

Thanks,
Rodrigo.

> 
> -Jonathan Cavitt
> > 
> > > 
> > > With that change:
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > -Jonathan Cavitt
> > > 
> > >> +
> > >> +	return 0;
> > >>  }
> > >>  
> > >>  static bool pf_needs_enable_ggtt_guest_update(struct xe_device *xe)
> > >> -- 
> > >> 2.47.1
> > >>
> > >>
> > 
> > 
