Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD4ECD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 17:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A1010F57A;
	Fri,  8 May 2026 17:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lbjzNanq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4C210F57A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 May 2026 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778261375; x=1809797375;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xgPo0yFX35smLCNXw17SorFXZzU8sNEx4lbYa/2fXEg=;
 b=lbjzNanq7T8fNeSzXodfDIZZn2PJGppuLXUnq4QRFcsqVuKJpXcPR1d/
 YBUn7ocWjrkPanJ3tMWyHp/UDpUBLXB7kPtUhqC25J7DJwtBXuGJ1Kpt5
 xrGzaVZY5HMXZQC0RhZJ5SusXSwFqAvzgV3E1uj3o8toHP/SFW33jpbTk
 p42u02S4RWjCliBNO4H0baa6uF3lSTdNRGQE1zDYLW928jQhpW75wgVfO
 x9MTiVzvZRgjoBv5cmMx4hmgQcRvccLwkMjow0Rgr/3MVkZr9hR6HR7YY
 dZNf5UnyvoM4Cfdkr7ZMtPVn4Hh2S6Upq6X8c0+ScJTft+Sd96jvnguA7 A==;
X-CSE-ConnectionGUID: 0Lixds7lTOSNXyTuYJhDqQ==
X-CSE-MsgGUID: 1LGFhF+FSo+fvHdhpfTXbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="82856233"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="82856233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 10:29:35 -0700
X-CSE-ConnectionGUID: O6E/IFciTWijLDpn3kvSQw==
X-CSE-MsgGUID: HA8eVRa4Rd6TXCRJVpTkuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="267199220"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 10:29:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 10:29:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 8 May 2026 10:29:34 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.25) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 8 May 2026 10:29:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUx2r+D1t9ANhhVE3GfnBllMS/vHyGFy1d6fMraem2f9Py5PZSW34TU8ucdP/Z2H3ZRO99N1+Izto5Obmihz0lowvLLhVdxhMYk8P/rhEl0Ukvs05pfEydieXb9+GNBQK0Z/5HucU3l6D0hqtHMChabZtxJelAuek88vT2brOHk8xZNZQ/mO9uOWXMXazJIbBt1b27bnPyLW3oMWFbWQLmPo9FIh0SxZ/C4567WFQH9yxbvojF3rgeNTjgG4+ulsTvLj1fmjFgEqpA9c2z8XZufD315vQ6+/7NsOs+NS4vgN25LQ9o3ARuZ2Oc6PgAfZzw5mKj5hNEtaAbMIhQQImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXlg/9qh6AAtiCBwbIXwUpHIcOdfBcuYTno1kMSzAiw=;
 b=NSgu3FH0Sysl5ggtWdf+lFZhHa0oPsO7duqFiAidaCM0SReRrZBZzc2cEGkl55sJ3HaeZzX76yifYBGA8G2YBcvGLfH9bPVbqAy19Lsxdh2Gsuvndo5zdKWH7mJHJwTxAg0v+TmwE6p0sMjMAVK4XF7/TBHn1VeaKuK/TRiZ4ytlecZTmJMwirZU27f/SA9KZc8V5USKfuecatZKgzEPdHvEuVTO7NKF2bB80lYo/cI8ChbSpYpotXC15FrX9uweVN/sxsTacQXZf623Gj8cCsyDEiTBDjhETrIhWuR0rfbPyTOo1x1p2/OnmNgD152YSg7XkNSGRR5GmbsA5jtvQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by DM4PR11MB5262.namprd11.prod.outlook.com (2603:10b6:5:389::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 17:29:31 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 17:29:31 +0000
Date: Fri, 8 May 2026 10:29:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/9] drm/xe: Add a new debug focused configfs group
Message-ID: <20260508172928.GS2131374@mdroper-desk1.amr.corp.intel.com>
References: <20260504044348.209625-1-stuart.summers@intel.com>
 <20260504044348.209625-5-stuart.summers@intel.com>
 <875x53dvvo.fsf@intel.com>
 <0579da16c8a003849b608d29ea37b3f86a9ddc17.camel@intel.com>
 <873407dqxw.fsf@intel.com>
 <dede21f05cac6e683c4f001a8cc31b883ba2810c.camel@intel.com>
 <87zf2fc7ys.fsf@intel.com>
 <20260507225845.GB3397116@mdroper-desk1.amr.corp.intel.com>
 <be2ba3a351fbbd7e8111540288bb457492c1b542.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be2ba3a351fbbd7e8111540288bb457492c1b542.camel@intel.com>
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|DM4PR11MB5262:EE_
X-MS-Office365-Filtering-Correlation-Id: 364fff9e-3952-4b17-04e1-08dead275d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18092099006|18002099003|56012099003|22082099003|3023799003|10086099003;
X-Microsoft-Antispam-Message-Info: lHoLg4Ergnn3ugqQgC5mll6M2b28JMdEGUK68LjtWK/bYVN+L52knrnKc+UY+QPxmnDLogaOYLos0etiAgK+ldIcuz1AHAyjqnYpfw413Hvf4NdpyvhkvYD1uDRMLLmE25ILnIkMV8RrxwARBWcOweCEIqYVAAeX3AQBXULVbbmevit4rLxmG6iMwiNjq5nomYL8Wc0e3cq3kCMl6pMUfeMBt/2mbRoJr5QbTBX6p6hK4eXbS1/DX1uWJUHJfLga2K4XjOfg7ksxt0nQ6bX8mBvMMWjHPH6r9kuJlR5ruvIsND8ZrMTCmnGgXgHsCTYpVZAVXvyi3Hi084qMCakW7WsdQ8V4SmcaK8EHL8rrFTh1a9EUv4rV+tp9Mdrx97ih4m69Oc/OIa2d+cCYtKK4KlRixm5z6bvHTyhvz3Fgj2104TYHHWr8updzOevuJJlUhdjRHGOkQYGcFB5FbAh2HY719oQYSEGGyL4vqR7NO9zGPBJh3HFYsQR17LNW6Ytaau/UE+B3DOMsA/KIRPRubl5V2Ri7irrWtl7vfkHDP1v8fl/nRPPkwdtb02aBtcK8fUFupAZhjWnglfNEVMCNw0ibHpvDJ19yL59ZjwrmFfjHbuIz6GBv+omgCg2qtzglPyTKGoVUl4kyW3XezvayMPtWje54460sA0TUUZZHbuF7ebq/tzI+7nFQ8A1iAF6s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18092099006)(18002099003)(56012099003)(22082099003)(3023799003)(10086099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?u3j6yddE4Uj1OwJbkSZ+6CDlZng7t17cCWCKZ9etcFdiyaFQTy6RvXuW8M?=
 =?iso-8859-1?Q?he9+xwDbM/803I0nCxrLBp2ngkbfXm+IoAq44sz3VxXkW/cijtcx8H7D0T?=
 =?iso-8859-1?Q?pZ84IllyU0xa1MmnVkZd3FE25QNawLClCYRwufbAh4GVqVj0ydZctIfUBN?=
 =?iso-8859-1?Q?9l17jUuB6e+yodnKy/cEHhjYn4eHd1Mw32qp8CbOfaOn1N6gQe2PnHlJqo?=
 =?iso-8859-1?Q?ZPjvtttcQbB8LlLqm7aDJrVXZRqg7axuv9ijcSRyNdBhSs4G8dF3f3ZcOh?=
 =?iso-8859-1?Q?X11EVxayNOgFI4f2sG+oUON7Q6sZQY4inpp2ltIamovF91jtbXakckZZw3?=
 =?iso-8859-1?Q?FB3J7E3McPsJxqSkO9cDSMF5aYpw9MHJSJLorF5Sdmmp+/hd452XtafdrN?=
 =?iso-8859-1?Q?T5U4N5KNniHvfI93GD91WGxk57/u9DZs4v0LbVJHMyGVdeFnkcrekwaoqQ?=
 =?iso-8859-1?Q?97JWAIPj5ttiB05wGnSDPXcjyVO2W2Sr8OkeRJMxD6QYyujnxHXx66p3mQ?=
 =?iso-8859-1?Q?181/Yd2XlUTClJZfcn+PH3rwbc3oCN4lqJAZuFIaby1IA06SmSr6dlbvuK?=
 =?iso-8859-1?Q?PkiepEF5sxcRx0UET1GQdqrgwyLIJiIhsPdRbgCI5HEPfZNuyxMew2viJL?=
 =?iso-8859-1?Q?IbeyGpYZSPPimuY148clmQn5pDD5WWexpT4d5DYuQnn+Jheu/XkG9i5vQ+?=
 =?iso-8859-1?Q?2ZizyKJvEdMk/75n7aFJSwaxyaIW+Nw+I7UABMMAJaDvJBdVMjgiatYXlu?=
 =?iso-8859-1?Q?lFPPHj4Gf3a55bGPGqzwBBU28OYFZ59vcmmJGfOotMNRGbPBS5q+z+JWWE?=
 =?iso-8859-1?Q?3/dM5jFwHsZtdx28O6qDNGVM+eQI3wqdnBMEaY85Q88xvzTdg5VxZlxw3B?=
 =?iso-8859-1?Q?FJQgjc6danUOJNcD6BG7wM2xd/EB97kNJuyBAuEOE2RYhBYaoPNOpnvtNN?=
 =?iso-8859-1?Q?CsNEQYcH/4l2xMictDDDgJjE+m904yHaSSJ+sOyEUjVtlFRY4cN5ymCnL5?=
 =?iso-8859-1?Q?NvfbKqLLTXvzeM5MhKHcV1BUKfttzTXFP/bt2jjTCI4yrtEP1a9mefh4Ot?=
 =?iso-8859-1?Q?g+AvRtByhC7c+n/p4zoL09ZJebZuhWhdc99gVSq2zzB80oaccG8qIsTyvS?=
 =?iso-8859-1?Q?8SRGmra5iT9t0oK+QwajUrARcLYXzu93U8PuKcNBe5ANdegxGRh5fwEYG0?=
 =?iso-8859-1?Q?1tvU0W2LI4D6d+RcPfJfLZmYs1eS75MFfQTpotu4YYO+u7MPSlXDx9nZ7W?=
 =?iso-8859-1?Q?zG4Z3MgXX6g++qO329qkejFNfJLkzuAnsGOaFw2BOFsh7aNBkGkdICXuCR?=
 =?iso-8859-1?Q?q8AQsZZ44ssJtmGje6srN8mJTAIL/lgL5tVs4XC5n8BGwG7Bz5Wsdessnh?=
 =?iso-8859-1?Q?GTlIPMo3cx/8bCV4e+zFG4cv4xD5KQM0Fd3qN2TMkRbLVgE2bHKm/TP5Bo?=
 =?iso-8859-1?Q?66ZwfcVeCbM1POBn94B/cn+1JCJ+geeB6dbVzaafYSzzX7MqUEAXserGCQ?=
 =?iso-8859-1?Q?E0MfRIXGczcoDES0WoCKFGSGNoXJZLIRD1gcDwhoBZ15eKzds3Q9ZFsICm?=
 =?iso-8859-1?Q?D4P2resuyEOm7e/Y6gK+T3Dso/WnRwCJJiIk3eMeQihSsP//CPq3KFPCcv?=
 =?iso-8859-1?Q?0LiWNIVHIeoIgxLMnq2LPqw6RgN7MDqNsZBNK8NAkQcQdbF5cPfd8G6XRR?=
 =?iso-8859-1?Q?aWi6pFxSMSeNdsPDfeJaSzU725u+8yTp5lIYxhOnLk+Luma4+MN9sTOboz?=
 =?iso-8859-1?Q?M35I3k2T6enCiYgcIlE+eNE5ZelrSHGLCZuiPgqUvjmi7PPCbh/lAc3Kum?=
 =?iso-8859-1?Q?rVWcjUgHUD5zdJiTbTDwoKtMubWUACI=3D?=
X-Exchange-RoutingPolicyChecked: gp6JjrARMiulSXu5U3m+D19/Vn0OTjzWqNRBiQKtSolbR2G4Kjgpvacd5rXaj+Ola0mzbX/+G0nBNTorlqZ3e+e9HwPC2xbL1HRviQehSrRjj0Vo/Q+8ik5TOsyCXedQIZGqamd+fZA8VGMc3VyHGSGRjWADmTjuCjF1QsAJU6o3WnvXAyNMVYTk+wUJQCchko3WOasHYQIc7NmWICTs6cAEjzMS+/LYIabfvfgqf7d3ipht0SQT8V9JInpCwmBq5FMeGtSKVBtEircU4UlN6yolxoF96MUcixa2uYkwDEFUSaZIpQ8W1LZQcQQjrwspHg30+Vx1af3TVGuFcBDitw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 364fff9e-3952-4b17-04e1-08dead275d04
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:29:31.3560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRGJmvllOIt79vZYER5RPUxsjNaxchEhCnOEV4V+J+M7gj2OwguEOgCepiJpgCMEjWXyipt15R3Z1kg9PB/qmEzmq4zYH25ilpm+hmWmVoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5262
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

On Thu, May 07, 2026 at 04:02:21PM -0700, Summers, Stuart wrote:
> On Thu, 2026-05-07 at 15:58 -0700, Matt Roper wrote:
> > On Mon, May 04, 2026 at 04:04:11PM -0300, Gustavo Sousa wrote:
> > > "Summers, Stuart" <stuart.summers@intel.com> writes:
> > > 
> > > > On Mon, 2026-05-04 at 14:28 -0300, Gustavo Sousa wrote:
> > > > > "Summers, Stuart" <stuart.summers@intel.com> writes:
> > > > > 
> > > > > > On Mon, 2026-05-04 at 12:42 -0300, Gustavo Sousa wrote:
> > > > > > > Stuart Summers <stuart.summers@intel.com> writes:
> > > > > > > 
> > > > > > > > Add the skeleton code for a new debug specific configfs
> > > > > > > > group.
> > > > > > > > 
> > > > > > > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > > > > > > Assisted-by: Copilot:claude-opus-4.7
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/xe/Makefile            |  2 ++
> > > > > > > >  drivers/gpu/drm/xe/xe_configfs.c       |  4 ++++
> > > > > > > >  drivers/gpu/drm/xe/xe_configfs_debug.c | 14
> > > > > > > > ++++++++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_configfs_debug.h |  8 ++++++++
> > > > > > > >  drivers/gpu/drm/xe/xe_configfs_types.h |  7 +++++++
> > > > > > > >  5 files changed, 35 insertions(+)
> > > > > > > >  create mode 100644
> > > > > > > > drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > > > >  create mode 100644
> > > > > > > > drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > > > > b/drivers/gpu/drm/xe/Makefile
> > > > > > > > index 09661f079d03..b58667b0b18e 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > > > @@ -161,6 +161,8 @@ xe-$(CONFIG_HWMON) += xe_hwmon.o
> > > > > > > >  
> > > > > > > >  xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
> > > > > > > >  xe-$(CONFIG_CONFIGFS_FS) += xe_configfs.o
> > > > > > > > +xe_debug_configfs_obj-$(CONFIG_DRM_XE_DEBUG) :=
> > > > > > > > xe_configfs_debug.o
> > > > > > > > +xe-$(CONFIG_CONFIGFS_FS) += $(xe_debug_configfs_obj-y)
> > > > > > > 
> > > > > > > What are the downsides of keeping this available for non-
> > > > > > > debug
> > > > > > > builds?
> > > > > > > 
> > > > > > > I imagine that the debug configfs could be useful for
> > > > > > > someone not
> > > > > > > involved in kernel development working together with the
> > > > > > > developers
> > > > > > > to
> > > > > > > debug issues without needing to rebuild their kernel.
> > > > > > 
> > > > > > So the focal parameter we had in i915 was enable_rc6.
> > > > > > Something
> > > > > > like
> > > > > > this is what we explicitly don't want to expose to a general
> > > > > > user
> > > > > > as it
> > > > > > can have unforeseen consequences (like having very high power
> > > > > > usage).
> > > > > > But, having the ability to disable rc6 for debug purposes as
> > > > > > a
> > > > > > developer is extremely useful at narrowing down certain types
> > > > > > of
> > > > > > bugs
> > > > > > at the hardware/software interface.
> > > > > 
> > > > > We could probably keep the debug stuff available but cause a
> > > > > taint if
> > > > > they ever get used?
> > > > 
> > > > So the tainting is really just for our CI I think. This won't
> > > > necessarily impact end users - at least on the client side - who
> > > > might
> > > > just ignore it (or not even notice it).
> > > 
> > > I *think* tainting is not only for CI (someone could correct me
> > > here).
> > > I see that our driver adds a taint when the user is applying some
> > > parameters (module parameters or configfs) that alters the
> > > "officially
> > > supported" behavior of the driver.
> > > 
> > > Some examples I could find are usages of
> > > module_param_named_unsafe() in
> > > the module param front, and setup_configfs_post_ctx_restore_bb(),
> > > setup_configfs_mid_ctx_restore_bb() in configfs.
> > 
> > Yeah, there are various reasons to taint the kernel (hardware,
> > software,
> > or behavioral/usage) and they indicate different things; some are
> > more
> > serious than others.  See Documentation/admin-guide/tainted-
> > kernels.rst
> > for details.  The general idea though is that you've entered a
> > dangerous/risky situation and we can no longer trust the system to
> > behave properly going forward.  I believe the kernel community will
> > often ignore or de-prioritize bug reports that arise from tainted
> > kernels because there isn't really any guarantee of proper behavior
> > or
> > support from the community at that point.
> > 
> > Some of our configfs entries in Xe are "official" and end-user
> > focused
> > (e.g., SR-IOV configuration settings and such) so those shouldn't
> > cause
> > any taint.  But others are low-level debugging knobs that are
> > effectively handing the user a loaded gun to shoot themselves in the
> > foot with.  E.g., the "workaround batchbuffer" configfs stuff is very
> > useful for hardware debugging sessions by expert driver developers,
> > but
> > if used improperly makes it it very easy to mess up both hardware and
> > software internal state in ways that make the system unstable. 
> > Tainting
> > on these developer-focused debug facilities is important because we
> > can't trust any bug reports that show up after someone has used those
> > settings.  With i915 module parameters we got into situations where a
> > bunch of websites and wikis posted horribly inaccurate suggestions
> > and
> > users would blindly copy those settings without realizing that they
> > were
> > deliberately breaking their systems, and some of the debug knobs
> > we're
> > making available in configfs are even more risky.  Honestly, it might
> > be
> > best to even stick them behind CONFIG_EXPERT and/or other build
> > settings.
> 
> So this was the reason I used CONFIG_DRM_XE_DEBUG... Should we have
> these behind multiple? Or maybe we should force build CONFIG_EXPORT if
> CONFIG_DRM_XE_DEBUG is set?

Probably best to check with the maintainers on exactly what config
options we should hide some of these behind.

> 
> I don't really think tainting the kernel adds much here IMO. Yeah it
> does tell the user they're doing something that could cause issues, but
> they're already running in a debug mode if they got to this point, so
> IMO they already know what they're doing (or should).

The taint isn't for the user running the driver in debug mode.  It's for
the people receiving bug reports and managing the bug tracking databases
so that they can adjust their expectations, possibly disregarding or
deprioritizing bug reports from users mucking around with
hardware-internal or driver-internal state in a way that isn't expected
to be safe.  And it's not just us that needs this notification (e.g.,
for gitlab issues), but also distribution maintainers and such who don't
really know much about our driver and may not otherwise realize that
that the user broke their system with something only intended for
low-level debugging.

For example, if someone uses 'ctx_restore_post_bb' to have the driver
poke arbitrary chicken bits in the hardware on every context switch that
really aren't supposed to be touched, that might be harmless for a while
and then suddenly break when something else in the driver changes.  We
might get bug reports incorrectly indicating that a perfectly good patch
is causing a driver regression, and then spend tons of time
trying to reproduce and debug if we don't have the taint notification to
let us know that the user was doing something unsupported and unsafe.


Matt

> 
> Thanks,
> Stuart
> 
> > 
> > 
> > Matt
> > 
> > > 
> > > > 
> > > > > 
> > > > > The scenario I had in mind is someone who is not familiar with
> > > > > building
> > > > > their own kernel working together with the development
> > > > > community on a
> > > > > hard-to-reproduce issue and some of the debug configfs
> > > > > attributes
> > > > > being
> > > > > useful to gather more relevant data.
> > > > 
> > > > Yeah but IMO we really should be able to instruct such a user how
> > > > to do
> > > > that - the steps there aren't too difficult if they're already
> > > > installing kernels etc.
> > > > 
> > > > A lot of our debug hooks are already held under various Kconfig
> > > > options
> > > > anyway like DRM_XE_DEBUG, DRM_XE_DEBUG_GUC, DRM_XE_DEBUG_VM, etc.
> > > > And a
> > > > lot of the information under those Kconfigs are also critical for
> > > > different debugs.
> > > 
> > > Are those due to performance or resource usage implications if they
> > > are
> > > kept enabled?  If so, is this the same case here?
> > > 
> > > > 
> > > > I'd really prefer to keep these under DRM_XE_DEBUG (or some other
> > > > Kconfig) if possible so we can maximize the ease of adding new
> > > > parameters as specific debugs come up.
> > > 
> > > But why would keeping them under a build flag make it easier to add
> > > new
> > > parameters as opposed to always keeping the knobs available for
> > > use?
> > > 
> > > --
> > > Gustavo Sousa
> > > 
> > > > 
> > > > Thanks,
> > > > Stuart
> > > > 
> > > > > 
> > > > > --
> > > > > Gustavo Sousa
> > > > > 
> > > > > > 
> > > > > > That's just one example, but there are a bunch of things that
> > > > > > could
> > > > > > fit
> > > > > > this category and I expect we'll have even more use cases
> > > > > > over
> > > > > > time. 
> > > > > > 
> > > > > > Right now we have to hold these types of changes in a side
> > > > > > branch
> > > > > > not
> > > > > > exposed externally and I really want to converge our
> > > > > > processes so
> > > > > > we
> > > > > > can more easily make these kinds of changes and let us debug
> > > > > > directly
> > > > > > out of drm-tip.
> > > > > > 
> > > > > > > 
> > > > > > > >  
> > > > > > > >  # graphics virtualization (SR-IOV) support
> > > > > > > >  xe-y += \
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > index 12b7fe65446d..85df8ce5cf2a 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs.c
> > > > > > > > @@ -1006,6 +1006,10 @@ static struct config_group
> > > > > > > > *xe_config_make_device_group(struct config_group *gro
> > > > > > > >                 config_group_init_type_name(&dev->sriov,
> > > > > > > > "sriov",
> > > > > > > > &xe_config_sriov_type);
> > > > > > > >                 configfs_add_default_group(&dev->sriov,
> > > > > > > > &dev-
> > > > > > > > > group);
> > > > > > > >         }
> > > > > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > > > > +       config_group_init_type_name(&dev->debug, "debug",
> > > > > > > > &xe_configfs_debug_type);
> > > > > > > > +       configfs_add_default_group(&dev->debug, &dev-
> > > > > > > > >group);
> > > > > > > > +#endif
> > > > > > > 
> > > > > > > I guess there isn't much we can do about it today, but,
> > > > > > > based on
> > > > > > > what
> > > > > > > I
> > > > > > > read in configfs documentation a while ago, I suspect it
> > > > > > > wasn't
> > > > > > > really
> > > > > > > designed with arbitrary hierarchies of config items in
> > > > > > > mind.  It
> > > > > > > would
> > > > > > > be nice if there was an API for that though.
> > > > > > > 
> > > > > > > Basically, a config group is expected to be a directory to
> > > > > > > contain a
> > > > > > > set
> > > > > > > of config items of the same type, which is not the case on
> > > > > > > our
> > > > > > > current
> > > > > > > usage (i.e. the "sriov" and now the "debug" group).
> > > > > > > 
> > > > > > > I guess we are able to get our desired behavior (basically
> > > > > > > just a
> > > > > > > subdirectory behaving as a config item) by not implementing
> > > > > > > the
> > > > > > > "make_item" hook.  Not sure if that's an expected use of
> > > > > > > the API
> > > > > > > or
> > > > > > > if
> > > > > > > that's more of a hack on our side and could come back to
> > > > > > > bite us
> > > > > > > in
> > > > > > > the
> > > > > > > future.
> > > > > > 
> > > > > > Hm.. ok that's good feedback. I do like bucketing these in
> > > > > > groups
> > > > > > and
> > > > > > subdirectories. It also makes it easy to show or not show
> > > > > > based on
> > > > > > the
> > > > > > Kconfig. But let me go through and make sure there isn't
> > > > > > something
> > > > > > more
> > > > > > suited here. Happy to hear any other feedback as well here.
> > > > > > 
> > > > > > Thanks,
> > > > > > Stuart
> > > > > > 
> > > > > > > 
> > > > > > > --
> > > > > > > Gustavo Sousa
> > > > > > > 
> > > > > > > >  
> > > > > > > >         mutex_init(&dev->lock);
> > > > > > > >  
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > > > > b/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..45617282cec5
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.c
> > > > > > > > @@ -0,0 +1,14 @@
> > > > > > > > +// SPDX-License-Identifier: MIT
> > > > > > > > +/*
> > > > > > > > + * Copyright © 2026 Intel Corporation
> > > > > > > > + */
> > > > > > > > +
> > > > > > > > +#include <linux/configfs.h>
> > > > > > > > +#include <linux/module.h>
> > > > > > > > +
> > > > > > > > +#include "xe_configfs_debug.h"
> > > > > > > > +#include "xe_configfs_types.h"
> > > > > > > > +
> > > > > > > > +const struct config_item_type xe_configfs_debug_type = {
> > > > > > > > +       .ct_owner       = THIS_MODULE,
> > > > > > > > +};
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > > > > b/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > > > > new file mode 100644
> > > > > > > > index 000000000000..01170dc2f97e
> > > > > > > > --- /dev/null
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs_debug.h
> > > > > > > > @@ -0,0 +1,8 @@
> > > > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > > > +/*
> > > > > > > > + * Copyright © 2026 Intel Corporation
> > > > > > > > + */
> > > > > > > > +#ifndef _XE_CONFIGFS_DEBUG_H_
> > > > > > > > +#define _XE_CONFIGFS_DEBUG_H_
> > > > > > > > +
> > > > > > > > +#endif /* _XE_CONFIGFS_DEBUG_H_ */
> > > > > > > > diff --git a/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > > > > b/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > > > > index 935097aafa96..c9d94a3c26a7 100644
> > > > > > > > --- a/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > > > > +++ b/drivers/gpu/drm/xe/xe_configfs_types.h
> > > > > > > > @@ -24,6 +24,9 @@ struct wa_bb {
> > > > > > > >  struct xe_config_group_device {
> > > > > > > >         struct config_group group;
> > > > > > > >         struct config_group sriov;
> > > > > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > > > > +       struct config_group debug;
> > > > > > > > +#endif
> > > > > > > >  
> > > > > > > >         struct xe_config_device {
> > > > > > > >                 struct wa_bb
> > > > > > > > ctx_restore_mid_bb[XE_ENGINE_CLASS_MAX];
> > > > > > > > @@ -56,4 +59,8 @@ static inline struct xe_config_device
> > > > > > > > *xe_configfs_to_device(struct config_item
> > > > > > > >         return &xe_configfs_to_group_device(item)-
> > > > > > > > >config;
> > > > > > > >  }
> > > > > > > >  
> > > > > > > > +#if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > > > > > > > +extern const struct config_item_type
> > > > > > > > xe_configfs_debug_type;
> > > > > > > > +#endif
> > > > > > > > +
> > > > > > > >  #endif /* _XE_CONFIGFS_TYPES_H_ */
> > > > > > > > -- 
> > > > > > > > 2.43.0
> > 
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
