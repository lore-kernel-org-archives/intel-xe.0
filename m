Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7622DC6FD1F
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 05:15:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EC410F99A;
	Tue,  2 Apr 2024 05:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLiuO1js";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BAF10F99A
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Apr 2024 05:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712034900; x=1743570900;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EqfV0cTOvahB9+xeZztAUElpAmbQbGsUbNCwF554IdA=;
 b=WLiuO1jsL89uoKovV8xYNWU5tlDCaSLpH+7yRYNKMPN2hNxM04zhau5O
 CM1tah76zW0ZS4FDcNH/0QusvSNWWyf8GaEm88a5fh85eTvuWuyRjFH5Q
 kcTzxbYYhmG8RcqaiFcHLVnhV3G6ZaAUEkt5A00tZBVkwPLTCtb1skxyr
 YMm8RDLt7TPgAneFW30KsoWKqzDM/+DcmnYpF8vcDfWms+3S3jiNp2t/9
 YcaqgbO5pz/vgyKW3hB/2VSFkLxi7M3QoZzJajtS9Loke+8idptwbMp7F
 UR0IZdMH7Eh1+ppv1tUg4jwj0g+xFkp3kLPg1kVFpFIAes6sNVyhZYm4o w==;
X-CSE-ConnectionGUID: YIUE3KOnSv+og/MgzQcTfw==
X-CSE-MsgGUID: D2MJF0bHQdyz7f5zxEkFlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7052381"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7052381"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 22:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17965450"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 22:15:00 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 22:14:59 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 22:14:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 22:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0wpsKQ+C51/yUaa1+AmRkhSa7n+KlMSJyDnzT/QxNEdnkmFZG8gtDMLcAnRvaXYdD7macpCgdUO5iTYSVRIEQ4bL552CCsWddL6hgvRdY0MbrS59RqzcR7pnl6nRTBFJbDfd/7+wkrg7hEo/OlK7UimPiUAyJ+70D7CysUJh3/QGQkPsaESC3HBpik8mRl0Iu+skJvJ2vmYmbx58JpYYeYvid7otywXf28XokN5uZc5nnW2txMTxFmdnLBQxi26BxlY01+2vqoiVv6H4CpY/I067GbZmyVRhGIyZOgcn6U8h+c/60xanpMBFm/Cinpk6d4+wewxfIsj9zYHJO3a7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqfV0cTOvahB9+xeZztAUElpAmbQbGsUbNCwF554IdA=;
 b=GPg+d3d9jfmUTJxEaT45aBxxA5Zs90i2I8wLvkkXT3iU3nk5TcaB31TsaBW9Q1P3yuRGM5F5/cORZOcLLe/sKb/Ok6GK4YdT/Ty46YuGPZNrlpUmezUatXsOnmedFEGBjG/OHdNYtcbNPt1PIVz310CrApKt8E+uYomUwBwkkAnVMd9CpqCRbch7gkj6yjZFa10g7OF5d7YPo1gVjCamYwGSgn8KMBxDM1y59j+MMv6BLafExnT8dU6dRWw67F1C9dDDRY8bEJnS9Jyb+pOcccKXr3iQ6sBWPkx7XPjlTss6488yguCZBR7QT9R2zx4E4Dw8Loo9Gj7cudCbRaLnQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 2 Apr
 2024 05:14:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 05:14:57 +0000
Date: Tue, 2 Apr 2024 00:14:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/3] drm/xe: Use ordered wq for preempt fence waiting
Message-ID: <nxkyv6jbed5rkgn5lwm3igcw73gqebdhwsxpqzgvgunyfj6mx4@h57khd3dee43>
References: <20240401221913.139672-1-matthew.brost@intel.com>
 <20240401221913.139672-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240401221913.139672-2-matthew.brost@intel.com>
X-ClientProxiedBy: SJ0PR03CA0142.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN2PR11MB4631:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PBRMHw2VW9YY9oy9JpHeGsSo4gZcvBrYHkUCM0FFpD0lUUtPMpl9jwxlZZ6YYhT+EvJi3mt+YI/71h4SolcEORZ4kRQW4TMWkUEBY6Vkf6pkbuFgbllO6JUqDm2ZVfRnftOzxMdj3RWNCWzXcwABWJfHeYCrEJnYYGnVjU0iATlUvP6EVtknMjD/6Sg+M6DOKuFkJUGraEz//cYMac55ogaw8REPK8AURG1BmTmxpWEVncb2G3GtksL4mjnJgZc8DckcBBeqxIcZUzcIkLf3JwyWL4Ir7TA0LP1wnjUmItvK9L4Dtiew/YfmEG0DYC0eS1fCtYLjNBI1xAZ5WHINDkMv4DBz9i3y0ALTA3hHn07UUGBDCx+zFORpb7L0BLKPj+yQyTxSOeOQwvvKdhpcjaq7lzas5vt25ixazXkjeyyg0PUyaZ42OoI47QKis+H/OjzeqXk/lhIYZCWZ5MdujrjgfGBTt2h9JwORlurhKVgokk/8C6Si88pt0i5c+D5jWr8ZtZ0BATMHlSyF/KEEwwCJW99eIdTOiMRN2dVNhlMh6Wn8J/CtM80l544CbPRBHRkH6Phq6+4Fe9nTNP6w09XDt2RUIcyYHTaopQmHmNjRGVZKeMpg6owoTRVn1Gp/RtbmhfG8I6jkclDf+7RAh16Y4z09HQiBLPp8YTXCPSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zngDR6O4eyodB2MsXhLagoD+1DKqP7SCEij7/FWOHxXn8YBT2MTs89a1DUb4?=
 =?us-ascii?Q?A61B2g8+5nCVCnWbsrG1b/G9F0D2n/UIhsw/AJmeUY842yrXZWNf7fIkHBnR?=
 =?us-ascii?Q?pom1eg0+UEAgEubKmdyqNxD7VsY3d9+vxtb4iMVm8PyQZ/1lUgubDsMVOGl5?=
 =?us-ascii?Q?d3d5++AkYe7VoNp5pm/VJZYxt4ZLGch7ddAzNNpIRXkCXvizJXB2NV/flzFg?=
 =?us-ascii?Q?MRpSF+/CWonJL39ghlTvO26ytd6a9CfKZZNws6Qkkg3KjZJwr4veyEQXnMoq?=
 =?us-ascii?Q?LbqE4wLrO+rhenG9GX/FxcnXz7XzBSOPaL0Sq8imUmv4akApzn/iOh4AamKT?=
 =?us-ascii?Q?z65K7WSxEiK4MDyqW7Yt5/0LYbkv0F7SDMu/EN6x1tzD/Cq+yD6pDAJZoFf8?=
 =?us-ascii?Q?ksjdZqi93NtHBdCfSiFX6/K/+oiuxmK1u9dgqe4A4U/erMsCMLdPVu384mtG?=
 =?us-ascii?Q?ph5+fLCnJVHl92KjawSwNBYm7cGIifxYJSfnxVhaPRRW08atB9rXnm8P3tO0?=
 =?us-ascii?Q?vRErlcN+wmFiB/YIZdjGf1lZAFNzyepQmgrtSUp3m846R4ZVSwGkOLrBWjLP?=
 =?us-ascii?Q?ycwzO9sN42AucO1tMjF40PypakwcBDmmheioObij5PSnvqiCsQHXdudjhaEH?=
 =?us-ascii?Q?pNUb92T8giNrTIFhlXytlpLZwBqzF/ADFBuoP7DU4Nqzdx4GGc8XYgOQaYtm?=
 =?us-ascii?Q?dpEBoawDnBuZXTw/X1711JcCLpBDKonxZjdFDW9iDBtAz7YfnaiZc4WxKAOc?=
 =?us-ascii?Q?L3sjRpNVxOI/2bmfYK7Qi3OFMzFXg4GMDiAxtDbHahGTt1dAWfDLf2w0Y4In?=
 =?us-ascii?Q?XJoVxmdRXMvj4ff4WZ1KrhaAtbQ8MBesV4uTo1GTpsLdPaiMdDyT5vPpC7kU?=
 =?us-ascii?Q?IyJKzVwa4h6vZWCinMCs/G2FlBndQcBOLyy0GgboUg8wBpWcErTZ0B8BXdcR?=
 =?us-ascii?Q?NNa+l7R/3TuBlgsIkJtjPT8lb4odLeb0hASyt6nR8UdsrVz5DDK7GIHtpISa?=
 =?us-ascii?Q?uIIShcjeCRhb0Rx7apPj9skbejSdz0NtbygmyUj0v18oDRiTyp1aibRr30/7?=
 =?us-ascii?Q?WAZAgVSyKTx/KTEnwthHYUeY9pa3RwzP+6hGjXlKks2pX+LcJddhCpLSNT+G?=
 =?us-ascii?Q?VPJBHr6KCb+XcRMFtIX/Z8tWy+Xs2fgGy3pWzrMon3rRNvnltqvuCM+ajycN?=
 =?us-ascii?Q?b+fAFJDzXHpY1h+Xa1dXCc9NMAralsZSWFp5HdVpnGuqjwhgECiUQJ5+p8s2?=
 =?us-ascii?Q?fQq0L4SJOFwM5w8FbU1w0nUPO1g/aBB5pgFsP1/wqvvJb9EHH4UCgxq01dHC?=
 =?us-ascii?Q?gjYO7qS1rr9lLFQ85Ngy5CVJlBbUPKpEpRH5TR1WP1DwDz3ZeBAlEfErWm5R?=
 =?us-ascii?Q?tWkTK5bNMu8JmXikskIKk+9E++2e1j40ZS8cH/UJzzbzvncEkw9yOYjsM6qP?=
 =?us-ascii?Q?aHy/mfcfonCqkXWVEZae4MmY6A+7V/e7Ac6IatTVKd2PdIvxq2buGjhe5+xo?=
 =?us-ascii?Q?yToGelKUgMZikocFbi2NE5QS/BpEj7DXUZTUEA/xOnr1FvSqfNUUJWZg83iE?=
 =?us-ascii?Q?IfVT6j0OrK9t3HmzC+SSWR76z7odxmhjClLd8f/r80gNod8cqIaF2N18vhXM?=
 =?us-ascii?Q?/w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1bf65d-6b28-45b8-d3b5-08dc52d3d67b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 05:14:57.1654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQDvjff+ldJyYs1XXuNjst3UuoisPVPGtC7wzis4hYwXhf8Yx5m6dKDVtTki6Yn+0+1Q0rQdTlUpWdb38gVmZ3brnepTaOwSqzgU0sBOBSo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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

On Mon, Apr 01, 2024 at 03:19:11PM -0700, Matthew Brost wrote:
>Preempt fences can sleep waiting for an exec queue suspend operation to
>complete. If the system_unbound_wq is used for waiting and the number of
>waiters exceeds max_active this will result in other users of the
>system_unbound_wq getting starved. Use a device private work queue for
>preempt fences to avoid starvation of the system_unbound_wq.
>
>Even though suspend operations can complete out-of-order, all suspend
>operations within a VM need to complete before the preempt rebind worker
>can start. With that, use a device private ordered wq for preempt fence
>waiting.
>
>v2:
> - Add comment about cleanup on failure (Matt R)
> - Update commit message (Lucas)
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
