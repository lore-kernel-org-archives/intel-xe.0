Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A1C27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 17:09:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19C610E07A;
	Mon, 10 Jun 2024 17:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HasvOkS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2511C10E07A
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 17:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718039378; x=1749575378;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8CDCHInF5zx1N4J+o2BKGEWaZtv27wQfKWTq78tFC/k=;
 b=HasvOkS8H5AGwtw4FfLAEtv36OUEbmbyOzvItOeTeOWo+6fyynAbxLHH
 JSJP+8i3V3BBVxBaidpOBk+cv7Q4O9ceT1buUkcfg0BHD+yTp4+Ot4pT5
 0ehc0OEVyA/IgVdk3RvlmqZpsoUV4Uftuqb3N88pbA8gKIA7drXkxq2sG
 fIorjx9vXLSXC3q9Vltw0jmiLHJq5Ll0HxlP2C5IOJzHxe9y2OTHTyi3x
 yvvYTRKIg5uwUG6lrkNjaUBO6mitOPwT2bN4qpbQZXRFuLN3Wx0+zSN/M
 caQmxVrcYnls00h78RtYqouq8ir4ra0cht5F+W19hCLwbVWM6hpbaaFze g==;
X-CSE-ConnectionGUID: opL34iOQQCiGAgZKkk65Rw==
X-CSE-MsgGUID: HuDmcZdpRE60btOChLWThA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14543785"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="14543785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 10:09:36 -0700
X-CSE-ConnectionGUID: 5tv2AgvrQrCTj/fIo5oN9Q==
X-CSE-MsgGUID: QVAc8fkzSJ2btnN5EwpxzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="44080095"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 10:09:35 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:09:35 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 10:09:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 10:09:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 10:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N598XURjZY74ofIdxKlwAXtB5a2WYUiawOGVx2gnyNbEArtw1GN6gdQQFjVZfoA0FxBupKkWjUmLliDV2auEJSqCNnCKvoLCKYvwEkEYKBqpNw4gMa18SRQm8ksZNPDwtfwNfDl3boYEvsGyDSqFHzcYKSbP0YS9Xn87wA768CQVJe5eVLcDXaBzTq9n0P3VXdW/dUaUjETRzAr11SyibfC3PlDwjWK+Bksh2SYW/ZsN/q0OpOTC1pB7ZmMjGONVd3g9eUQqYulouKiOHl0r2VqYlabgSXBUoKeogzx9HeKmIJ3YLFtXagyGjRF8N+qouYlwA04OU0Todxa7EwuxEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQCo6qgrb2rACzrH7wHumm7ri6Y2qz0kL3v9ldDIVuE=;
 b=iagkZ0v+AlnkE+tb3IMzqjV9Z9XwboSXR9b11H9rity7z+iGiYV6bjTPEaYxmgEF0bx656lPNW4awqqXq+bIn2rDekmpRn69p/hO1MGHw7RkYbWQ+3OXbPQx1RHuQC1dA5gfNHFLV/7vPQ4x/6hqJjttF3PVtrmjMWQIgkCbBWinCd2mb5lbTz/xyKb338pIWVX4Y1AzKYMvb64npD6IanazuOfJ6J7k+XdcL5cTJabGkX+tKSuQoQGwgCQN5saGlCdF/Lt3FJooXi0TC6eq6xalnSAhqIdWLvOc8SS6XlGlhaAclEO/QyB4Xwn0AzoW6g/nRP2/CGBxlesBGu5JlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SA2PR11MB4971.namprd11.prod.outlook.com (2603:10b6:806:118::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 17:09:32 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Mon, 10 Jun 2024
 17:09:31 +0000
Date: Mon, 10 Jun 2024 17:09:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
Message-ID: <ZmczLiGEnTFHIyE7@DUT025-TGLU.fm.intel.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-7-matthew.brost@intel.com>
 <CH0PR11MB5444A8A9DDE4BC86ECFE91A9E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
 <1ec633a8-4a2f-435f-9159-4c8d48c1d931@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1ec633a8-4a2f-435f-9159-4c8d48c1d931@intel.com>
X-ClientProxiedBy: SJ0PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::34) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SA2PR11MB4971:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e04ab4e-ffd9-43f9-bd6c-08dc8970183c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZOwGIWurjqObTiKuv1/iE4pwZ5N55jK1tZpSaEkm9IQKvUTfmM+pX2iAwMoC?=
 =?us-ascii?Q?ZkSz+pC6AejY24HGpeDzst8kdFhNS4i0XqzoDjaflCsG0BoNEmnc+eyIr4Vz?=
 =?us-ascii?Q?0SPsqNQydt3nclub0uHADjeOKaVHL5xrzYBNyImSu1LgmPjxBiAC1RJIZvdi?=
 =?us-ascii?Q?jsgmM7ZOdX1slVGu9/dNSTUEH5uPHb6dZEM86vPtxENzt6eyrUUo1qv7yiMK?=
 =?us-ascii?Q?objvujKJyTYYhi6NOm1zwCRw2T4b4RuXpD5RObkT9ix+U1JUzpC3zCbxuMd/?=
 =?us-ascii?Q?eDTfxkOvt1vGcoRm3o2YDyMmHt3hbZc5ij8U+QR6RX3Uke+w0T0a5POEsQoq?=
 =?us-ascii?Q?a8w6/553NErvyuUesAMJ0F3bzmxwcF+Tsu47L3T9n3Onx2KTivAYN/e3bQN/?=
 =?us-ascii?Q?7MHbHfZBolSAP9H62f3t3Onhjx5x/eKuqKiPAzZedK7Q6ayA9b65gsxfzFKG?=
 =?us-ascii?Q?HAjz/U/RDzzdCEmByROqT8kH/hG+llWNsgHMWVQuXwsU85C11L28dABqRzgx?=
 =?us-ascii?Q?dINexGXf/TkFj+ATQyPEQtbFJPQa53oXc4lzeX855Btt2xdoQLXAyh62vbfl?=
 =?us-ascii?Q?khWQBgdGvLZAGhNhUJDVInRxAf3haC6FNeyoIKaMF99ZWof5oPidYELPhoGB?=
 =?us-ascii?Q?Emf3rtU6jf+5dxWaByvEXN1S4XWNR++XDR3uqp/wkJAdeEaN5Tnr00RjHP6J?=
 =?us-ascii?Q?lPLsW+6aKJlILmeJ2XDS3gfLYunO77YsZXK2P6v4spSGN4hfMHkKjxn7PXqi?=
 =?us-ascii?Q?Pwk6IHR2nW9RbLZ+dymTd3cGKdrLgfMDEcvgE4ShQVjzQesRfLAY+fZEIasr?=
 =?us-ascii?Q?var5V3pTR4isd9Xg3y7Ba5tRnBGpYEgVx2j0xsyvnXUipvNIcuieg08/MiyT?=
 =?us-ascii?Q?cgRZq8XVIe9kokH2E1iwRnD+tfZh+hMWgQecQ2l5d6ssz9jnqjAbbamvA/X9?=
 =?us-ascii?Q?P+2kXUkpFT/q/DgBoTpZ6kfrljiKCDsadYunX+UNFbmkS7FEACJlRwWnavYq?=
 =?us-ascii?Q?fdcjIf4xEp4Nc4St0NS7szL57zgHJcK1IiPylWK0T7uukJBY6wmeWm7XY1mI?=
 =?us-ascii?Q?RNo1sLshJG6Jkyhic8yj8LebqtLLB2GIouBNrSaSgkYTKaxtzemVkxMlcqfM?=
 =?us-ascii?Q?bVnmcuuTu7CW5GnsrQZ02OMlBpoSpPFxoFieGGee0HJf40R25CVi39AfwXyy?=
 =?us-ascii?Q?d7OP6jeciCiMSGcEcwmlrauPKZdKzgBiWpHfFTwlPG6zkPb3dkWLE7Mw4elk?=
 =?us-ascii?Q?X0lUPX+M+sCad9MGrYUG+C4RsJ7JbcBUNLtFE9ABsCVsR5ZSVt0mceLFC4B5?=
 =?us-ascii?Q?MhaGcxgFRnkldoOYTvO5rN0C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w3pNVLYrXAjRSfQRavh+9qpLRh+GtIqm1jUbUcQbDcV7cwp7/LVl8P6YrXTe?=
 =?us-ascii?Q?haPt5qTGTsmIQH2InnzNRgn77JH8aOsynuP1ikC5EjsKcWOsVJ1zBTVvCg9p?=
 =?us-ascii?Q?hgVULDEs+lPNf4B1QZQwR8XSNClFZ6NZgG3D7JOG3PG1jK4uf91rbqSMlDVH?=
 =?us-ascii?Q?V4Y8agcs39iu4FOV2CALc641CZrBeMoR0j23TCkAWyiMPDgb1/XTiysqYyn5?=
 =?us-ascii?Q?opNgSqgNNsb5WlG79TakLhk7RISH5d4LaHUpJeK+3PRPbsEgjmsBDeyVTKYL?=
 =?us-ascii?Q?W+WtxguMrVUgM6OCC0/6mt5wqYlTJCvYTGuyqEKvXj85h6Iv1heHREut9/NS?=
 =?us-ascii?Q?AHyzBy9HSMhaZtBOFGnGdlyg7ROHiGkt0/CT6vAGyoYBTCQNaY8RJWYM3jR6?=
 =?us-ascii?Q?3KwqCxhkidmmtJmW+K/mskHT7X8n8Dwz2c6T98q87cA+6FK2M0TE8ITQVSlh?=
 =?us-ascii?Q?iP0vTYBTWGVxunWqi34zQgzoXfyq2zULU9URPPUpqpnWLO5VB64xef+Uvra/?=
 =?us-ascii?Q?TKQbIWkvnoF1xGNhEPLVULDBzO+81WYE3vutvZO/+96VZRf+jw037aVWcuzA?=
 =?us-ascii?Q?8yppaOZEmXtBp6hYBC6cJ7kZHUwzev773tzumZAzK95QT2FFRgVimYeKw8Qa?=
 =?us-ascii?Q?YeFVWc2JVRjSEK4sQUDWOpvcxZ2+xPROzjx4kSec19RjzSWlJBN1ttL/ypV1?=
 =?us-ascii?Q?I1MfnczCYGrZpE6/zfxt6Bw8YATdfGVGdvyqpNR0DrNV3PDrDJovsvqq6o5E?=
 =?us-ascii?Q?mGfcxIU6jIm+SjRi9Y/A2aN111+PUkyM9sWayj3vTIsGliD0+ljVi1evvfqn?=
 =?us-ascii?Q?RKbf0hVBdEMm9U6DzGAB5VDZIwenUGTr4PxMQcjOeUNyAXsTnacc0ogPXbXo?=
 =?us-ascii?Q?kKAT1e3HRswjFmAhTgfp4pqWaNwRDPVhhl0xYEkLfV0alJSoIVjR6XF3Alq7?=
 =?us-ascii?Q?xm9LI0VxFngnUUUT+xSYn+1Fg6aFx7KHjbEHQVA2iTYkvFC518Kfw1YiQcoq?=
 =?us-ascii?Q?RKC9nFqihf3fUSX5SM0q0eDXhv366/mmvKZrHwMTmIPYRpin9ksN8rvOfabj?=
 =?us-ascii?Q?bkuCvMvpZ+L0pewOnEXOo1QyS3KsL+0qpH9sBoyJQltsubpSmBXpFD3EQRvf?=
 =?us-ascii?Q?VsUTO15fTSGvjAJlB5YbqbgDCij5V2DGFhkWO3ak3MTtbCCc5ArtOseTBeVi?=
 =?us-ascii?Q?8DRABXmIWa41wjJdSDu39hFNZvIXCVOBA7P1N5wEkUJbeySppUXJvwrL6wgR?=
 =?us-ascii?Q?NY7GkT1pzNoqlyqucyZhlSi3rFUqucaiyagt3yOkhUsZaQVqL1cz/G2ecIS+?=
 =?us-ascii?Q?qgZo6Z6uUHRcoQux89ZMeqxjs6exvj+rX++CqmfKb+wm0kEE9mvOZ/zww7++?=
 =?us-ascii?Q?ZeYLSX+n69tzWPPhetGtGuvPkESc3hgqbyXdi3QIT8cOP+483zJjf9Ah0tW/?=
 =?us-ascii?Q?nJEW3O1JsjLbjQUox56p9mvlCE2IRdcaFXWojIOmrBQN8W+VFcQxc/udc5xm?=
 =?us-ascii?Q?tMfa4QmsvcTJuerG2okxy3pImmwOZ3boxgqeMUvnbgywmiL21dV+MxHnmr+e?=
 =?us-ascii?Q?glxXdP7EmHpDrxsdg3zdHo4MfctDowUzKRxM+SiH7HsLYEgziDFjXpAsQ7ZC?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e04ab4e-ffd9-43f9-bd6c-08dc8970183c
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 17:09:31.6632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2i8KRqCb+UwIJXmYO8q/jlbaHFEZXujoxO1wAjCWS3N+LYHQ43mrIsExVpahYQQYxrJoPquTEGN58WpbvzFUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4971
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

On Mon, Jun 10, 2024 at 06:45:12PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10.06.2024 18:36, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthew Brost
> > Sent: Monday, June 10, 2024 7:18 AM
> > To: intel-xe@lists.freedesktop.org
> > Subject: [PATCH v5 06/10] drm/xe: Improve unexpected state error messages
> >>
> >> Include G2H handler name when an unexpected error state messages.
> >>
> >> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > 
> > Having a separation for these two error messages is a good idea.
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > -Jonathan Cavitt
> > 
> >> ---
> >>  drivers/gpu/drm/xe/xe_guc_submit.c | 8 ++++----
> >>  1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> index 4464ba337d12..766ff8e48dde 100644
> >> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> >> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> >> @@ -1632,8 +1632,8 @@ int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >>  
> >>  	if (unlikely(!exec_queue_pending_enable(q) &&
> >>  		     !exec_queue_pending_disable(q))) {
> >> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> >> -			atomic_read(&q->guc->state));
> >> +		drm_err(&xe->drm, "SCHED_DONE: Unexpected engine state 0x%04x, guc_id=%d",
> >> +			atomic_read(&q->guc->state), q->guc->id);
> 
> but please at least use xe_gt_err()
> 

I think I'll just switch to xe_gt_err in next rev or at merge time.

Matt

> other option would be to use xe_gt_err_printer() and dump engine state
> in more friendly/detailed way
> 
> >>  		return -EPROTO;
> >>  	}
> >>  
> >> @@ -1671,8 +1671,8 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
> >>  
> >>  	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> >>  	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> >> -		drm_err(&xe->drm, "Unexpected engine state 0x%04x",
> >> -			atomic_read(&q->guc->state));
> >> +		drm_err(&xe->drm, "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
> >> +			atomic_read(&q->guc->state), q->guc->id);
> 
> ditto
> 
> >>  		return -EPROTO;
> >>  	}
> >>  
> >> -- 
> >> 2.34.1
> >>
> >>
