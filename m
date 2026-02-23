Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EB3EF5861
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 04:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CC910E217;
	Mon, 23 Feb 2026 04:34:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Svg74XmX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDE810E217
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 04:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771821290; x=1803357290;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8bLW1rV3ZXIqGDTXhO/RUGGNFAQhjQBx3d+KEzHt8pc=;
 b=Svg74XmXB2IcYrRQ0IDh0RNK5YXLVcGvloisCwosHuhS6uUl9zQ7c7T+
 9fVkIEPq7YXTjS/UMpKgZAPvCMs2F2qbDrx2ubl5GNyufzNK74qBONvLj
 y+ASJ0VdE3qZ6RD7QC9W+0yehi8Mj2gYi4EMA/NNfZYQNU2JE+n/oyu1y
 Qk0kHhd0XJ71PBAotqvuVUadLvqMzN0m1gG/dwrWBCQONI5F0iL3iTVcv
 ubncto8oiqHxuCozW9ybR+HW+6wGLwoGjCWxQKG1GZyJUSk+bBRBGny+2
 U/CN0z0bz/AIWCsVsEWKCFR0jZpK7KmmZCnApEVcvZcBehjbS3Q7TNZHc A==;
X-CSE-ConnectionGUID: wUAYOtaVQk2YTSgCZAgtfQ==
X-CSE-MsgGUID: CdkqEovORDOTM3FtAp9g3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72912397"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="72912397"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:34:50 -0800
X-CSE-ConnectionGUID: bWZaPSHeTr6VW5IAAI4adQ==
X-CSE-MsgGUID: 0LgjJSsgScan9agCcxWG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="213872011"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2026 20:34:50 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:34:49 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 22 Feb 2026 20:34:49 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 22 Feb 2026 20:34:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LypemS9kynkvian2BeiyRJodbZYTejlaGT3AzTkl7aF7qKyeprniRLI7tHI2kBdGeb8Yf0j3hohKfeYj3UYXZr3CPbDNMzT02k0+uSFv59rWl9aQD+gHX8fMmsBHDZtUAM/PUehdHM0fSybvIJZc6ntGDtafwu6K76qj6buyFal0yfeOvIFJmpJyiocBKd4DNEghDFkMIRLsr+ILGx2phNbFZzAv+8elUnA20od5g135gWbrACcHxM2WPTe8MdR+juu1GTo94ksp4szaSlNMWK4o2S+FIwD5cEXhrsl05LXs6EuXDo/PDppdn1GT2zlAbXh8pf8FPIgvfI/sHBldrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VSBLUzxl8uZqprI2W0z/gHPBc/qNLPrT9V3gc+DrnMk=;
 b=rdkxncq0GuFbRuZ+TcQ875vRAa4h4NhouCUWqOzCIBxP75rw2YMkYXxA+brBLnS71IOkZyUiEUkMaDD9XkHBxXiSjIpA/6hq4PKnFbmj3soHKHMEdQdHPw9tse4N4f4bA6ilcNv8ysYNUHp//XS9bK6fAxg4si6MNAirSS30C4gH4DwkOSH3cE5UcRUV48iQ+75CmUd9qFT7MwusSQVm9wEvFVlhoCn1JgvoKezjWTvaQBA3ZIuPnX5+7ByJrM332GOintT2yK5QQyMlz+tukeXOQXoDIDQqEOFZuTI69T4flY3G+qGL9igUZmfyWXYYnJ8YNlzWzuX6z1QAYSNgbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 04:34:48 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 04:34:48 +0000
Date: Sun, 22 Feb 2026 20:34:45 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Varun Gupta <varun.gupta@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.d.roper@intel.com>,
 <himal.prasad.ghimiray@intel.com>, <priyanka.dandamudi@intel.com>,
 <stuart.summers@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe: Add prefetch fault support for Xe3p
Message-ID: <aZvY5dty7Xk2B/mV@lstrano-desk.jf.intel.com>
References: <20260223040729.1157739-1-varun.gupta@intel.com>
 <20260223040729.1157739-3-varun.gupta@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260223040729.1157739-3-varun.gupta@intel.com>
X-ClientProxiedBy: MW4PR03CA0195.namprd03.prod.outlook.com
 (2603:10b6:303:b8::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: 88f135ca-7b44-46c0-f876-08de7294e057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eZCWYKJRtSWkCdq5Dtzw044A0XPlAgTXsTu1PAOrOnPi48+yqv7VmdQvUwQs?=
 =?us-ascii?Q?1QWD5zdE8MeWp+HNHa8WIw1z7VZwbLYo3hFkZLQWBAs3qa7G5geIZimDVhYJ?=
 =?us-ascii?Q?4OeR/N/yF9UTxDBp9lNAP1D33NHkW6ac8zPGkPKf2TCRsDMw5tNSaF6wmop8?=
 =?us-ascii?Q?6SRlp6BcmJP5jnA5ajXj9J677O3MVz+On24C1OFy+Uf9tj3r5YzFJtMfDzrk?=
 =?us-ascii?Q?j2DYJNGKlS0iy+ZzdpGHCDewBdziWmKJxYuugyY2Scdrep5kTUrvyxKVunHf?=
 =?us-ascii?Q?uyjRC/bBTgr1JZjMM6T2se5xASLbUxBIk2c6XGAyx6+jz/ckhH5yUyeJrPTl?=
 =?us-ascii?Q?qjUMMVoHYa81+Sv0NM/NPMh8c+dD0AS4T4fWTjhC4C58TRFnCHLk6mc7zHpF?=
 =?us-ascii?Q?d/r46h6/F1efv0/XXpmyE4/Hd1fZLhxHJ6wSeqtbEVuhJd9mQGKoLteAm2K6?=
 =?us-ascii?Q?pr9obwhpTiS7sV7DyAcwnLwmTywpAFFGSAjKodqVEYLyZqYiVkMohasfiZeJ?=
 =?us-ascii?Q?JrA7zL+2PzLUFFd+/i0A+mR/Ezg+8bQ0C52XlIt6CZY467NlJ4OaUk5lYtDJ?=
 =?us-ascii?Q?75JUt8pzisWPDbUvTOwcyCtlYgoyYQQxgIvKaFNWxvNAXcd4YnI4hm7Jo9GX?=
 =?us-ascii?Q?SDuJ0bDu0hbi2IGkknnkU1Y1P2q0hVciPYg0XnthLy285E5mx6YZEvPQlb/6?=
 =?us-ascii?Q?h5Kwahovmqj9RzhBFVr5cxBxy2JY6nG7qViEqGegqK/NIS1mJpJj5y0mJPBA?=
 =?us-ascii?Q?g9/04qBoL5kI2kG5vh0wK8XWX0kihtFlqC1fthTb4eiWu4+uRWo+/e801nYZ?=
 =?us-ascii?Q?qyOOlyUeSdXZswcsFqeIbnI9n0OKbozComWHGaJDDxz4X3xj8vd/CTU4p3dA?=
 =?us-ascii?Q?FqCj9zWCCncoZA2wMjKAjjMLPxgIE9KDltMqPs3urGcHfgIHtW9yPCwLQRbY?=
 =?us-ascii?Q?z+EhnG95xBTab63Kw8MyY2OwWweXqap++ib5WVa2WikwQu/vXk1JI85o3Q12?=
 =?us-ascii?Q?sk0biM8r2tRHWxftg5WmMuz4PFrtFmRhbAUJRhubLJDk2aI8rWPakKNIuKgk?=
 =?us-ascii?Q?L9ZbT2rAseIONjJ+j/AEEZKsfLYCbDrMxlLxl6ZXzPWSUoobfy+7cf1W8glG?=
 =?us-ascii?Q?3FT5S6ZgPFq5pb/hIhQV0XrV0mNe1MYbJ34FlrYoS5bifVSP+umLhtELoHFP?=
 =?us-ascii?Q?xfKsZQ3R5ApI035dvB/IJdBmcijW2WAdTuHzyrD+9EdSudo4C0MMlf96XBYg?=
 =?us-ascii?Q?0uFHPyFmYraoadPY6u9O4uJCiotFRkhEN3RpR8IxR9S4r4KUwCYwnexZYpfm?=
 =?us-ascii?Q?SwlfXkYZmbt63kvEvux7Uzm+A1gAWknBMkZAJO9xRS1Cl6BdvVrPux0p3yzK?=
 =?us-ascii?Q?cglp61Ed7HA/sQjI9WkP7lD2+sVsYjy0spGd04OfXgAb8RfHZ4q9G19lbO28?=
 =?us-ascii?Q?bT5YwrndiiWBfeqR3Wpjy6GEaccuaD+OqYf78eqAvZNCv6Y2F9Wkm5va4ktU?=
 =?us-ascii?Q?L0H7GYvypyrdLqcR1yBWGINfCEz+vCefzmGE5VXwZqYu1K52REN/nQ+Zrkj7?=
 =?us-ascii?Q?cv/EeXMA1wbN/ubKUSI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MOR8JiODViEJ5SHxox6MlPa8erQth4ECRYH1xFNiAp5yVSkhdvzCeRXbpi0E?=
 =?us-ascii?Q?g7WQjZ0BcoMPFmtJqGsL4k5AWKjMRhaVLcnXYqhSSWvvnH/YYr5ohulaJk34?=
 =?us-ascii?Q?mNRGl1Xb0g1o2Z1m4wR3ZADLzlHJ91Z7IUxxP1VlAoD8762HdMQDVs3FPn+U?=
 =?us-ascii?Q?OLSuXnrl0JcBJ6HgiRhnB5f6uDZhw+pmteOr5voH0EE2inKvK5y74Jt0GvdB?=
 =?us-ascii?Q?+a8zwbtL9sbUjUxyb0JpLeQPDl/9IxK7C5DkFEA+GdiPRY7SlFTyVvfliL87?=
 =?us-ascii?Q?VttZmT+B7hyrHCAL6k3/EDJGTtGRmwHccksQnHEGa0xZETGVdf2r9hSmIIPL?=
 =?us-ascii?Q?AvkyeOuFELqNqgYpeq1D64uL4Y7BOT6BDX8Mpxjt/ceyr/PR4chzWLsXJfO3?=
 =?us-ascii?Q?szx2zA6foN/hQOMnK8bNyJ/ypXoMxPOQm9/X2X9UQNXA3C1il/MbsF7nmpDe?=
 =?us-ascii?Q?z6IPJh+1Tb38oX1ehHmQn3LWUSy0dTTowi/3CLNY07/dm4f8f1Uzre94fJ1v?=
 =?us-ascii?Q?5Q5vK5ZwEO3F1I6o74jTdeW8UXvasUgrCUv8VWMI38uFZedCni4m0fQi4nf2?=
 =?us-ascii?Q?+W4h3O2D7XQy/46XWREpk70cWJWvc1WZ72Ne3DFEXP209fGi8mefG+OOn4YY?=
 =?us-ascii?Q?3GU5CX+8G1HSMR68+MJbZxSKyi5WMUl1sneQsphTlMbgaVou2qQZHYGVSAQ4?=
 =?us-ascii?Q?DbKJzUb1XuCJBSEhqce8RpEM1S/g8UgLX6wq3rMGh3EPooUI10L6h8ydpqmO?=
 =?us-ascii?Q?pd1PBxBoC2rA2zdERJZI3u+LsKfvoKq3DV8oOV4PSSop7fDdCwn6BBwqh2iM?=
 =?us-ascii?Q?ZXZx+HfbVwWeyCHA9Kz9HxEcwXS+N58k5ilythp3+DvttGszWuuGhFOrrT/K?=
 =?us-ascii?Q?PHp6SGpUCxkDBuBI+KtvHXwSYK2nFvQW+FGa+A8icELYGtLw3+MgFntWO2F9?=
 =?us-ascii?Q?zaNSQS+0nAV0uxwU+8l39tpWCi3d40fgpvJ8dx/28XviRhje9NesRfqtw/nL?=
 =?us-ascii?Q?8fQYzTAcc2hfbS9sKjnFUL1wTDl6lDbPEmyV4eqmfFQbQKYOiD+nOVP0QnwL?=
 =?us-ascii?Q?+8+pH0MwJYNbGxtFbq3E/6QaslvXy3t1IBg6urOosJH1dg7NcyjpZqMR5bRm?=
 =?us-ascii?Q?V+/WcWfb5mVAtc7Z9YSr8m7NbptaJ8jNxl2Di7OsHD7UYFx2dFHAXV8FfNwi?=
 =?us-ascii?Q?4lyRh09d9H8aH28deiyQeaH4OWD8pm6+eRU71XPWDgGYgChjgW6yVcRBcf4F?=
 =?us-ascii?Q?Bgw3vrbvq3/mVxUp72fvqeZaj6axbZ+kHacpRuQ10HRki1K4t4Wd362tv9T4?=
 =?us-ascii?Q?spHmMRv1J/mAcRgwNmCMKVX5QxNz/aymgry42bWmD7RGLNA38YPbnxdtR9u4?=
 =?us-ascii?Q?ZoebLJF1sVZ/7nvHzSbEjykLn/vw/mdJswcVcvvicTmYsdv0ZqQ5ZMR931YN?=
 =?us-ascii?Q?g0QOQ5JNo4lo/7jqqZHOY3Pn8ieSBVnZmaEbH4gdMq++1KPaGKv2g9eLAqvC?=
 =?us-ascii?Q?eV1l7nSZuBzA2xZrlVImMZ7shnpW4WEmGTGob29mmKHjJFYkhx5iu+A589UV?=
 =?us-ascii?Q?YpL6acAyMzXZ7gX5OBVcW7y3+5YJTqykknf2koCwh7aKcNewEZYbRtVYBPrY?=
 =?us-ascii?Q?MN8mPFx4d7cSnZfLzzBA7axrfVu00POqgLAu3M5ZSgH/VTBfxEo2/Einieg8?=
 =?us-ascii?Q?VVfihUCYCGI0cBaeSLpKCjtmwkee5jk+sQ9njkTXa7HSy2qqcj+W11Lr+Yo4?=
 =?us-ascii?Q?8/N5ZKywwg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88f135ca-7b44-46c0-f876-08de7294e057
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 04:34:47.9490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B3uK6WuHgspt4cd0hJLZDTt/7Xv1FqW4WkV71KMR3FhcFIeYaa0nBl1B64nCbOqpujd2wDtPZXOquMcDsW/1eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
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

On Mon, Feb 23, 2026 at 09:37:29AM +0530, Varun Gupta wrote:
> Xe3p hardware prefetches memory ranges and notifies software via an
> additional bit (bit 11) in the page fault descriptor that the fault
> was caused by prefetch.
> 
> Extract the prefetch bit from the fault descriptor and echo it in the
> response (bit 6) only when the page fault handling fails. This allows
> the HW to suppress CAT errors for unsuccessful prefetch faults.
> 
> For prefetch faults that fail, increment stats counter without verbose
> logging to avoid spamming the log. The prefetch flag is packed into
> BIT(7) of the access_type field to avoid growing the consumer struct.
> 
> Based on original patches by Brian Welty <brian.welty@intel.com> and
> Priyanka Dandamudi <priyanka.dandamudi@intel.com>.
> 
> Bspec: 59311
> Originally-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> 
> ---
> v5:
>  - Read prefetch from producer msg in guc_ack_fault, not consumer field (Matt Brost)
>  - Pack prefetch flag into BIT(7) of access_type instead of separate u8 field (Matt Brost)
> 
> v4:
>  - Downgrade prefetch error log to xe_gt_dbg to avoid spam (Matt Brost/ Stuart)
> 
> v3:
>  - Drop the rename patch, keep xe_pagefault_print() unchanged (Matt Brost)
>  - Move prefetch check to caller instead of inside print function (Matt Brost)
>  - Remove XE3P_ prefix from prefetch bit defines and add platform comment (Matt Brost)
>  - Show prefetch bit in error messages for debugging (Matt Brost)
>  - Split stats counter into separate patch (Matt Brost)
> 
> v2:
>  - Changed comment wording from "repairs" to "handling" for clarity (Matt Roper)
> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h        |  5 +++--
>  drivers/gpu/drm/xe/xe_guc_pagefault.c   |  6 +++++-
>  drivers/gpu/drm/xe/xe_pagefault.c       | 16 +++++++++++-----
>  drivers/gpu/drm/xe/xe_pagefault_types.h |  6 ++++--
>  4 files changed, 23 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index a33ea288b907..bb8f71d38611 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -261,7 +261,8 @@ struct xe_guc_pagefault_desc {
>  #define PFD_ACCESS_TYPE		GENMASK(1, 0)
>  #define PFD_FAULT_TYPE		GENMASK(3, 2)
>  #define PFD_VFID		GENMASK(9, 4)
> -#define PFD_RSVD_1		GENMASK(11, 10)
> +#define PFD_RSVD_1		BIT(10)
> +#define PFD_PREFETCH		BIT(11) /* Only valid on Xe3+, reserved on prior platforms */
>  #define PFD_VIRTUAL_ADDR_LO	GENMASK(31, 12)
>  #define PFD_VIRTUAL_ADDR_LO_SHIFT 12
>  
> @@ -281,7 +282,7 @@ struct xe_guc_pagefault_reply {
>  
>  	u32 dw1;
>  #define PFR_VFID		GENMASK(5, 0)
> -#define PFR_RSVD_1		BIT(6)
> +#define PFR_PREFETCH		BIT(6)  /* Only valid on Xe3+, reserved on prior platforms */
>  #define PFR_ENG_INSTANCE	GENMASK(12, 7)
>  #define PFR_ENG_CLASS		GENMASK(15, 13)
>  #define PFR_PDATA		GENMASK(31, 16)
> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> index d48f6ed103bb..607e32392f46 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> @@ -8,10 +8,12 @@
>  #include "xe_guc_ct.h"
>  #include "xe_guc_pagefault.h"
>  #include "xe_pagefault.h"
> +#include "xe_pagefault_types.h"
>  
>  static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  {
>  	u32 vfid = FIELD_GET(PFD_VFID, pf->producer.msg[2]);
> +	u32 prefetch = FIELD_GET(PFD_PREFETCH, pf->producer.msg[2]);
>  	u32 engine_instance = FIELD_GET(PFD_ENG_INSTANCE, pf->producer.msg[0]);
>  	u32 engine_class = FIELD_GET(PFD_ENG_CLASS, pf->producer.msg[0]);
>  	u32 pdata = FIELD_GET(PFD_PDATA_LO, pf->producer.msg[0]) |
> @@ -28,6 +30,7 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>  		FIELD_PREP(PFR_ASID, asid),
>  
>  		FIELD_PREP(PFR_VFID, vfid) |
> +		FIELD_PREP(PFR_PREFETCH, err ? prefetch : 0) |
>  		FIELD_PREP(PFR_ENG_INSTANCE, engine_instance) |
>  		FIELD_PREP(PFR_ENG_CLASS, engine_class) |
>  		FIELD_PREP(PFR_PDATA, pdata),
> @@ -76,7 +79,8 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 *msg, u32 len)
>  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
>  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
>  	pf.consumer.asid = FIELD_GET(PFD_ASID, msg[1]);
> -	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> +	pf.consumer.access_type = FIELD_GET(PFD_ACCESS_TYPE, msg[2]) |
> +		(FIELD_GET(PFD_PREFETCH, msg[2]) ? XE_PAGEFAULT_ACCESS_PREFETCH : 0);
>  	if (FIELD_GET(XE2_PFD_TRVA_FAULT, msg[0]))
>  		pf.consumer.fault_type_level = XE_PAGEFAULT_TYPE_LEVEL_NACK;
>  	else
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index 72f589fd2b64..a9a20c4a6b2b 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -136,7 +136,7 @@ static int xe_pagefault_handle_vma(struct xe_gt *gt, struct xe_vma *vma,
>  static bool
>  xe_pagefault_access_is_atomic(enum xe_pagefault_access_type access_type)
>  {
> -	return access_type == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
> +	return (access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK) == XE_PAGEFAULT_ACCESS_TYPE_ATOMIC;
>  }
>  
>  static struct xe_vm *xe_pagefault_asid_to_vm(struct xe_device *xe, u32 asid)
> @@ -235,7 +235,7 @@ static void xe_pagefault_print(struct xe_pagefault *pf)
>  		   lower_32_bits(pf->consumer.page_addr),
>  		   FIELD_GET(XE_PAGEFAULT_TYPE_MASK,
>  			     pf->consumer.fault_type_level),
> -		   pf->consumer.access_type,
> +		   pf->consumer.access_type & XE_PAGEFAULT_ACCESS_TYPE_MASK,
>  		   FIELD_GET(XE_PAGEFAULT_LEVEL_MASK,
>  			     pf->consumer.fault_type_level),
>  		   pf->consumer.engine_class,
> @@ -261,9 +261,15 @@ static void xe_pagefault_queue_work(struct work_struct *w)
>  
>  		err = xe_pagefault_service(&pf);
>  		if (err) {
> -			xe_pagefault_print(&pf);
> -			xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> -				   ERR_PTR(err));
> +			if (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) {
> +				xe_pagefault_print(&pf);
> +				xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> +					   ERR_PTR(err));
> +			} else {
> +				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
> +				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
> +					  ERR_PTR(err));
> +			}
>  		}
>  
>  		pf.producer.ops->ack_fault(&pf, err);
> diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/xe/xe_pagefault_types.h
> index 0e378f41ede6..b3289219b1be 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> @@ -68,10 +68,12 @@ struct xe_pagefault {
>  		/** @consumer.asid: address space ID */
>  		u32 asid;
>  		/**
> -		 * @consumer.access_type: access type, u8 rather than enum to
> -		 * keep size compact
> +		 * @consumer.access_type: access type and prefetch flag packed
> +		 * into a u8.
>  		 */
>  		u8 access_type;
> +#define XE_PAGEFAULT_ACCESS_TYPE_MASK	GENMASK(1, 0)
> +#define XE_PAGEFAULT_ACCESS_PREFETCH	BIT(7)
>  		/**
>  		 * @consumer.fault_type_level: fault type and level, u8 rather
>  		 * than enum to keep size compact
> -- 
> 2.43.0
> 
