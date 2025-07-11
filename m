Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00121C83F1B
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 16:24:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09910E0A1;
	Fri, 11 Jul 2025 16:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzBVjMxs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB2210E0A1
 for <intel-xe@lists.freedesktop.org>; Fri, 11 Jul 2025 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752251062; x=1783787062;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=54SdMGUn3j7MxnLu74Q0N6n/8bujkdpLH3NrJQ0ah/I=;
 b=JzBVjMxsBRFOwrV99UsDakmbTVfCRSEMCXPigw77sOGKtR3eGiGbMjJS
 qsAeE07DdULAomx6wdzve/q3uugwueK4lQZ6fsgwyNyfEgow3E5aRhpK1
 c182xP3T3Wgz9dJ2f8YTJUEMILTw1Dmfazqu++Lm04HvDoMfCjvYXyWM9
 bM/Nu/7kt7+LbTULgHSwNjWEb4ZKiI6+/ySMfZE2++cU7cN/z1GCqmCYc
 /OuIg+gX9Kmi3WlZOs0rPLNkZF+02VufErRlpxAHJLlfst7fQunkJlhnm
 OBFtNKlLFBswoAdLQHSPShTyRfyDmzKSVwZVt+dYRvC1QLvB+pVkdTuFU g==;
X-CSE-ConnectionGUID: yBlYf2tbQLi2YIe9CqpdjQ==
X-CSE-MsgGUID: TV8Ld/GLTqmpgpamgZfoDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65903261"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="65903261"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:24:10 -0700
X-CSE-ConnectionGUID: K6IUDCLbSsKXZ4bdfkQKnQ==
X-CSE-MsgGUID: r4mIDfxcSrqll/UdfY3vow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="162086699"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 09:24:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:24:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 09:24:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.44)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 09:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNTJ++mh0kdLFx24Q2vaUq0zR2i0O6y8PU2FgkYJsg/pceWzRPYY2633sk7iJ+3DHVp5rn4fjZgRoNOWmAyyB/DW/vK++JwHq5XZP+oJ7p1zmv0ZC108gf21aB/VFQmNHwijblvWmm3nOOIU1vkBcDgQvOB807G2msYoXs/SM318VSQhLkyqbNMJwJ9CVd2/DqUyfrgRTnTZmwB01/D4v234MF6AzaHN7g2PYScxq1QPFmEHQB1SN8j19GUetVnAGpTwVZfYz2GwMMCOeuvTXBlxeLE2rqaRQkLYEPtiSL1Xi19BiwxwtDM57VlmX7oV5jMnUFZZdy/F+l5CZd1ccw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJwH0JhYiKNuEGbL20CYytxYRaDtKO0fDLqrTZA1LbQ=;
 b=H/sVA4zpkk95khpoIh5CjyLClAsFGSKgvnyD19rFMYGtwNuDQPL9YwYZUuDhXCLU3ESrX0LoeI7KYm0YrP+f1dgwaEfxwQoYGN65rI45SkjEube4xPWx9TH4DZCGCh+evJUxwY6FialkXVSiLIyisr4qLcuoz19pKCffMaeMm8n2aV3WacFZVPEq/8yOgzxEh62Yaos8Cp9AHf2yHw/KaQ/ELCF9htuoI6rMFzA4GmG0D+0B4TDAhdHvCQFaxfWS8iRZmJnHA3W47wbh9X78S+Lw0rc4VO72iAtbOI1GIdJzidUqRQ6mjzrfpQER6GuQJjyvEBg2Cxan3QbpEqbeqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4893.namprd11.prod.outlook.com (2603:10b6:a03:2ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Fri, 11 Jul
 2025 16:23:55 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 16:23:55 +0000
Date: Fri, 11 Jul 2025 09:25:40 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Move page fault init after topology init
Message-ID: <aHE7BHmgZSRpcxr+@lstrano-desk.jf.intel.com>
References: <20250710191208.1040215-1-matthew.brost@intel.com>
 <25add0bffd0a1a561aef4e32074c93b73ef6fd01.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25add0bffd0a1a561aef4e32074c93b73ef6fd01.camel@intel.com>
X-ClientProxiedBy: SJ0P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4893:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7c4ad5-c3be-448c-608a-08ddc09754dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?S7mKxxTQ6XSF+KPkzhH4yMsyppy1ZbVBbGEKc9u+eLGmsJY9QdEBIu60sm?=
 =?iso-8859-1?Q?TLueGuAv2mDRmhCWzPFK+Z22WCNDXFgUkllKb1V5x1ulJnJq40N24KOX/E?=
 =?iso-8859-1?Q?Rcw37BoG9awcJT51+Sx8eE/eEracxM2WZM86A6ucoqT/J6H1HWbVcxqQhF?=
 =?iso-8859-1?Q?R+C9jWjZeHRy4h78TP0/n+80hDllsJmGQrZyhWzBsI5n9/LDFCi7lBW/Z3?=
 =?iso-8859-1?Q?peQ7NUBrJiGjveKzSk1xy2UTtoMOagHVW+YiCI2/iyC5YN9x6Qgqy9TD1R?=
 =?iso-8859-1?Q?FhqDDUprKccDwJfNa/CzBsSHbCw8tNVFbizJEviqhhROevfKF6XA5XOvW5?=
 =?iso-8859-1?Q?kPOZLXWQJTf0WMG3Chsc6mEk4f3Km3cgOefkxpiu2n+4ZBui8Be6vX5pkV?=
 =?iso-8859-1?Q?RBZeALGakjIU6tgIQBi96irvxnXyZp6yVVNZa2wlTzc9CnKx6oa/HIPfst?=
 =?iso-8859-1?Q?guXVn3tkgV+X6FMcy6SetXXxIGVFcnyKfvu5sgqricS3cQjIOmU74G4DXV?=
 =?iso-8859-1?Q?NazXnn1IBQFwx+imq1HTo7cbUmWtIFUsbGbqE2zFJQYd55kbkfWpPYAnvq?=
 =?iso-8859-1?Q?RpstVTi7UwDR549bgGGSoyVJ2rXJaIKsHjc5iUFmuSCR9qf2EiNac5AJb9?=
 =?iso-8859-1?Q?W19LP2VX1gcjvSXSbsJ3b1TbXP/H1wFvRJQRdf3iI3hGKVmvSw8pSkrVSf?=
 =?iso-8859-1?Q?qOJ9R5ymIBAy8O/m+9wrn2FLhZDcxjaQUQ0EVy5EOwgIPPMfCBx3+7d/VV?=
 =?iso-8859-1?Q?plcqs8qX/DFtGbUg+T08v7GsSXT9VDwkNDvGn0aAQa0eEO4Go9IXKUHRSR?=
 =?iso-8859-1?Q?1rMN3dISG6nZ49Xn5KY+8kMvqi6h111YJT/Z8XnJms4JUmJL5tLDyAXqrk?=
 =?iso-8859-1?Q?wIC7gkWTHA50VttJZCuE0hraUvT7xEcA5Hn1NTSg1EsiX6EVMXv+3sv9o5?=
 =?iso-8859-1?Q?wwycG63YSzChvyqaLwGsHwEBzk3pI1l7Dg3sCF2jXVtOv8X4epeAQeAliw?=
 =?iso-8859-1?Q?/eoHuo+3RhjKGZ4XUsvVidLNSQbP+uKVQl4tb1IFmLwLRejQzjIjyMc3MT?=
 =?iso-8859-1?Q?neiPwq52YKMPrqF9oAMWRufXtDxkrw6rEMMnRb47vyfXQl8xOEgfBRV5XD?=
 =?iso-8859-1?Q?oPjbJTRIlg8R1kFlbJqbEuGrhpkNC5FpMK3QOx0JahERC2IA84fdk83HPW?=
 =?iso-8859-1?Q?0AFq8C7C4W9bBM+4fP2GPkaeylU09XbAb4agdGU2LF9uV1zJ1wtOd1uYml?=
 =?iso-8859-1?Q?XLLh/HiG5yBL9yA6W0qo5nwn9j0hnSl5aFvqFwfTc7yCJiqJD6Ar2EfFYw?=
 =?iso-8859-1?Q?ww9zRZYuj8yutIwNulsKMwRHXt3yOl+lYlLXIUMDf5MWTS3J0IFcg6sTyt?=
 =?iso-8859-1?Q?9KUmzfFROkc2YUeDb4YWD9KKVTGPB6DrQfPcjK/xtvxZkBJHPiK1b8cYT5?=
 =?iso-8859-1?Q?uqCL18JgOmeqFK476CdCAHo0aLZZTK+c8PYKEATSAC9qjpzIQRJmcn4XVs?=
 =?iso-8859-1?Q?M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?XBVcDixScW342FG7O56m7UcRhXym273THntJWCPwx73jzrjhmODjd8bJmp?=
 =?iso-8859-1?Q?9gW/TOwUx+u/uzcNtT7wOllf+R9SFK+jr/Sk5eVFsEWacIUoa20by4RM/5?=
 =?iso-8859-1?Q?sR32zhIMDERlFj4FR4T0OhrCkH0mZbYkpIVe/LrMNpO4X0ieHodolpn31o?=
 =?iso-8859-1?Q?YvnqFwiTKCO1gct9d05O4xd6blpQlBEMjDzxoElKkF/Gq6ScfkyikpV7ds?=
 =?iso-8859-1?Q?UnDnuL5STkjqAgptbx+xmOpup3WGOq+IQbjlGhM/0s03r3hdHu3VZ2hlv+?=
 =?iso-8859-1?Q?JoxDsJ8mkZznS8CHtgN+yuj5bQxui9G5oWcAz2mCr5/9sDedbi7kFYKeVO?=
 =?iso-8859-1?Q?J7nGjYsmb/mQKNcY0DnpobrH7U7fo4D/quyDpYjs+ca3tHP3xWByzeJSNy?=
 =?iso-8859-1?Q?VP79fbUJntZA7un7mJKocqNe4CMAlrt5xMBwwDLQi+iEbMa7prRz3YhJva?=
 =?iso-8859-1?Q?Y1CET3Djgsoh7Cfh+adl7SWmc38Uz8kfy+cKl5bQweIdQxantcS7MLmaZm?=
 =?iso-8859-1?Q?AX8n+24HugqY8BqQXl4cY/Rh+kgoq2N9DhWv8TFJGM2POnu+1u7VZ/aeU2?=
 =?iso-8859-1?Q?GcIPE79iNy8B+hXYgh/3BSRbFNtetmfKVYxQCKNg8qoBtgg+g+HATfy1pP?=
 =?iso-8859-1?Q?HqQhiQO5OHYKPCdsMv8ow3dlA9l64nLQLdHa6dESyNSbq+4zqJPJ2T/4jA?=
 =?iso-8859-1?Q?A291eEKPK63KPALPBnSJ7xh7mghu3+uPLwvDUD2MrrJdOauCglR/o7TyKW?=
 =?iso-8859-1?Q?3OkN3Ohgx+Cm2EBo8pkz5qbU56+TvtKila2zba9UiVLY89/4CObzHzzsRF?=
 =?iso-8859-1?Q?D+nwS61Swu34dj1ubIWd87C+PUL66/fVqsWyTyQ5gtCEPfZJiRAFPFaiet?=
 =?iso-8859-1?Q?3ar2u5vm9Y5SpZFaAN/DiPXwTBJOu3yHM6smy8Exkm5spAR26evvI1TAR1?=
 =?iso-8859-1?Q?TEOkQqPuoL+5aLH4hgy5Ev6vvi6mDlKG46heoR/BXNVxptKH9MKSiJobT5?=
 =?iso-8859-1?Q?vdAuSw7BHT4Jo/yG46/5kV9LlwxZqRvNw34CZYcLmQhmvSjNkisVr64lzE?=
 =?iso-8859-1?Q?FNMLetjne6A86wiLW/aLTE23G+8AL/KmcNEXYBKOGx7omLxuW+g56hU9E2?=
 =?iso-8859-1?Q?ZRelQ63+2xi1t/4wzDpXgsQuHKG8fA1h6eRoO3XGnwSsMsoQl949B6DW4A?=
 =?iso-8859-1?Q?odWlw1lEcUYpICvV7ChMc+hGz6w81tB9pcIlW9rSbYShEL4fEfd/WAWhMS?=
 =?iso-8859-1?Q?dutFP39r0kECkdTTVpDs4MBTXWoqAeHhkoowEBr3u0TJuWeNlwhc5zJT1Z?=
 =?iso-8859-1?Q?KKvkjvM2oUHKuOE0SCm2YEYOKznV4lb6xWkO2WIoQEsjL1CPlHk9+Xy408?=
 =?iso-8859-1?Q?AwamerV5n61HhtDyhN1SkQQ5/nJFzwnvvLFS6M/1kgQekT5KQR4edyE3yx?=
 =?iso-8859-1?Q?3ONNxZ+B4RSvwINT5+H3uOI9dm+EmUtIxZl8mj55/7IUkbGp7gxXSCna7K?=
 =?iso-8859-1?Q?u7+fDPc/8UhWwzl57mvhGl/i2xVy0jUnmxFrIbrVztoaPdJ0TuxcqVQ489?=
 =?iso-8859-1?Q?/f/bqGSwY0+IqSG3LRdYkwxiifcRya1k2xkezRYpUEbJQALtJmMHxHAZel?=
 =?iso-8859-1?Q?RTVJ1eibS7gJO3PsD3rQQW6bt2P/WpJjSleVwz7AdBXG4IJGbm+3EsGA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7c4ad5-c3be-448c-608a-08ddc09754dc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 16:23:55.4972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKobBSg9rLvHOu2xxBnAFmpYdx7IMvurXFmETlsL1E0aXjnO0GYzrSGd6+XuB5ftmd7LBwGwa/zNSyzmV9RqPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4893
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

On Fri, Jul 11, 2025 at 09:08:55AM -0600, Summers, Stuart wrote:
> On Thu, 2025-07-10 at 12:12 -0700, Matthew Brost wrote:
> > We need the topology to determine GT page fault queue size, move page
> > fault init after topology init.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 3338e4f90c14 ("drm/xe: Use topology to determine page fault
> > queue size")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> Yep, good catch and thanks!
> 

Thanks, I feel like this worked at one point in time though. Maybe
something in xe_gt_init got re-ordered recently. Will check on that
ahead of merging to make I have the fixes tag correct.

Matt

> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index d397df056e4c..af03e19ef9be 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -628,15 +628,15 @@ int xe_gt_init(struct xe_gt *gt)
> >         if (err)
> >                 return err;
> >  
> > -       err = xe_gt_pagefault_init(gt);
> > +       err = xe_gt_sysfs_init(gt);
> >         if (err)
> >                 return err;
> >  
> > -       err = xe_gt_sysfs_init(gt);
> > +       err = gt_init_with_gt_forcewake(gt);
> >         if (err)
> >                 return err;
> >  
> > -       err = gt_init_with_gt_forcewake(gt);
> > +       err = xe_gt_pagefault_init(gt);
> >         if (err)
> >                 return err;
> >  
> 
