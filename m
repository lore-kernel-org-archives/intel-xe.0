Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A41A4CD042D
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 02:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2FA10E050;
	Tue,  6 Jan 2026 02:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AeMkNsSe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EF010E050
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 02:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767665748; x=1799201748;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/RlKJASe6bIFcuwgR/gP42+oi61Os+zxpphFEd5moa4=;
 b=AeMkNsSepFB14jcIQ1uq+Ei9LpW18C+pp23p2YBoeqPtThXdypvxJG40
 zp/7JN1IU/MUI4NYK/nx02KWak79gb072AZQTxBgyzULshPqVwwmiVz4V
 J/U40UMXcR4yUzwUBSNi0dhsl9u83CEh69CdFnAH9qHSmu7vS+iU4tFwZ
 Rm2qa+HAo3ImZxBD9TNAe3T7wgOwZMVHPFri7W2qQ2/wB30QbFHrkNibg
 A4bsQVidIZWW1zNYqJ9GR6XY2mqFM+0fEDUQYxJ2wW5O3J0IyjKeDH2Jk
 o7wjisN1zeiVGqrFAuC/A5e8qY8b5Hds8eqIV1cdBMWMhDWPbBsrfjrla g==;
X-CSE-ConnectionGUID: O1jz19rmQfmeVMLshn+Bkw==
X-CSE-MsgGUID: WFwIopfeSzSRJEgjgTsAeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69193257"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69193257"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:15:48 -0800
X-CSE-ConnectionGUID: TzxKSVjxS5i/geHzqIKI6Q==
X-CSE-MsgGUID: zm57HgSESL+BM0jwHgBH+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202591265"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 18:15:48 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:15:48 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 18:15:47 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.25) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 18:15:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G/ZLfgnXgHUqW88hBu7ZI8YOLpNtu4yHIrfvlcu9Vu/IIxOktzK3Twe6qiszgK6WCUtjOWRUCOORFtrhcT4cYXqlzAvKVweV3mCpfiw5Es31H725DTrA2/Z81m51TE2+NUcjBmoQN38CE79f7qq9lI5aZ1btCCRKvjk7gjmhTbHLAMLRw2S5gJm8xDGi/78sDIpr85Ts8tFGdzXtJt+hd15HCRBpsxB2QgMo/dcXYFSeLISZi/oPlAavAiqPJqB1ulnKK4x1eWWlyqJI5tkvx9KzMzlN79oUiVamDiF27USXLz4VU6tagEzqWZtqcZzdpk+92I2YHeV0xQ7Im472UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvPg86pF4jyCWCEHDV7fljzxa3jUsMZ7Wvk/R7i4O2w=;
 b=piI1v+WITHlkk83WJRn+tqRIAUEA1EXT+QRkNOF5dNdlFrP30aUtm4yH4yumlBVdvLpl6KxBk+WjDOPHmcmNKfopamGfEVyeFjEUZtANq0PV5Bhb1AqOz9MVwVK13MnItb1sLzqH+ihuH5l0c+ae0l7u1UBYTLn+2acKsnCAc5KZaH5p2BFYx71Q3h7Ooom1JUJflgzjcTy/RUEMDMZlAx7tD+1nh7BiIsDP1wgsbK/MEgjEbky/lSIARe7xVXb/sJhFE1Y0uvEeo225WV5I6VbNIpic8ltHE2zLkXbp++YebU/UV9MtRfxi4OGXBiC0DB6rO8UwpEvmPBytFjNdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 02:15:45 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 6 Jan 2026
 02:15:45 +0000
Date: Mon, 5 Jan 2026 18:15:43 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Brian Nguyen <brian3.nguyen@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/4] drm/xe: Remove debug comment in page reclaim
Message-ID: <aVxwT7AKUsmfp65M@lstrano-desk.jf.intel.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
 <20260105233351.3753716-7-brian3.nguyen@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260105233351.3753716-7-brian3.nguyen@intel.com>
X-ClientProxiedBy: BY1P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA3PR11MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: f2624c04-f661-460f-16e3-08de4cc9800e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0FP1RqwbmHFaCLZ9ZzdDLmAUbehIZ2efVHPKTwSh16cnvjmWR41df99S/PJQ?=
 =?us-ascii?Q?cr25dZeroTvga2yBp3sfhe6YRZTcw2Iz776AXFLPty5J1DpmFklCdJU3XMUh?=
 =?us-ascii?Q?Y3YMTDmS9J0ufbGMz7LU2qz65YMjbV9LHEHI8MecOHa7A4sh5qn0FvJNs107?=
 =?us-ascii?Q?eIBltjAtcJM0bjp5lGvBnV/rPpQM9DfHCt9fkKz5PjTUCP3aFUBcKyrzpzjv?=
 =?us-ascii?Q?dH5eSYhityEHWAgHr1I2fXtNY+Xo0w0fedv279xdfmHor5OMkuKRBFLEECL5?=
 =?us-ascii?Q?NNuwaIpO9rqgi91Anhfs3Hcs+xrgXEgP1zlmqWsINa+Fdp5aHRZkqs2gxO64?=
 =?us-ascii?Q?2Qw/KVQzmGTaZq/ALr73EuUQ0yV8BT5gi43hQT3gAEqkY8muj5w3ZDXfP9y8?=
 =?us-ascii?Q?ZycxczE0tAwAdpSB5U00TBuNXRwk5vr97XHBa+sD0oBiEw+/NlFJyjIKrA9d?=
 =?us-ascii?Q?JSi0ubGLO58u3VrMSGMxernEnSfFPubm6Xfm4/GOdWeNGA6hxmAOiq/hqRPf?=
 =?us-ascii?Q?XVTsiVLRDTHmDGTa/GCCg4if0Nq5DgEc9MZjBh205t5dmGe5XC/wzo1xr28m?=
 =?us-ascii?Q?f5u6RNG09cbaAdnlU+wiGUg4C0hi/9LlsVX5vpe1WQlti0TgMMuvsMQsc93b?=
 =?us-ascii?Q?03LZP9F2LzaGY41Ej7ydaDdhDaqwSkUCtjvp+JNf8+kVFmmbt7X5L8YppKWe?=
 =?us-ascii?Q?DlxmzFh1FP7yrwY3lgi0CRxTfahDh6CkWKjunfDE/tzP7PdkdpKaxVDnT3+q?=
 =?us-ascii?Q?IWCz4yOMSS/kAEE+fHJoIlNCdO2iX9jJQ332LDvWuFdpuTZgjJRLBdjifVBy?=
 =?us-ascii?Q?VcEGhpNHs1WIpKPQEeA1j/sb1PbP1MQRRMQt5sv72fpGFRFJsy8dAdggN9L2?=
 =?us-ascii?Q?C+gt64PKLxqgbxGj/Q01qHYzjBNF7NzObrfk+BcOgB+UAbwzVPLmv02/ga5W?=
 =?us-ascii?Q?HSoXpiLzrRnwHNKG4zEzs9i1hI6bueOpZ6ipI5giYpzgYCJvkSWm28zh4QM7?=
 =?us-ascii?Q?t+qSvtU5PIdH5BlFgeLqRRldYqoCPsPalwzhnUhda+C10ex6hso+nCY1Xi5J?=
 =?us-ascii?Q?d8/bMuS1qm5xzREeCl+Wu61nmXCf2wlh9doOzzUoFScppNYRMGvb17+evkb1?=
 =?us-ascii?Q?BKFz9MiO0AtQ4P7eBKjW3OczQfLAbjw/0Uf3Dck+qMdSs43bp0PjQvkbtXtf?=
 =?us-ascii?Q?ph06Hm7HGAiJGDSdQFiNNexNGPbSSPK1eEdjVAGuJVrXa1cJJCCanxO1VNC1?=
 =?us-ascii?Q?dHXvn161Q39WfA0hhy0GT6o39qzc8xlDv9ksDMMQPUtObGZ5NSPTkvuHnXdr?=
 =?us-ascii?Q?TxGGaiAlcwNiakU+VZpnrYx8XMFHwa5bex7ddXT5aBkhtIds2PwZ5vRUKL3s?=
 =?us-ascii?Q?+yixEXs0v4ZLONk/MGa7hrZAQvY+43KNUqYuiuOts+NFKyi9xa9fegbAD/mV?=
 =?us-ascii?Q?Tc1xPtXbfukbj5RxlDK0CqBz4RIFiLNz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEOhWg2B98GElW9ipcuvC4LNzUG4ytgsdXbCgP7bE6wgTCJYqyyLo6LfO6PI?=
 =?us-ascii?Q?T+CPsE+IM8CJXncu0GGATy+b7JVvbP6nx+lTDdsy3hEc5/kH3TM6xVODDjrN?=
 =?us-ascii?Q?4swEyzG7Ybne2d70CZBr39RuZvhhTR7p3gtT9mHoVjwbQxjKjLTugNXRzBb7?=
 =?us-ascii?Q?XJp/IvUQXCRBnosfzMxcNfWoFyPLznj2JdXOiYGxWXYX0DmqWfXx07F3lxjO?=
 =?us-ascii?Q?+cYxHmw6ePBOKjTfEiH2O4Oqne8EoJNkVp2OhlJBuMRd2JpnRpEi2fbGa2oI?=
 =?us-ascii?Q?hnNYJPDUHmyExjVuAjCh5Wv/Y1FJPjHvsV9ME+c3CpwYSu9NjjRQI5PjsHsK?=
 =?us-ascii?Q?U1FhD54eLNZwWq7qe1vLzxsZZ4qcKBrmpzt32+3gyFSTNEUkkip0BFOAFTw4?=
 =?us-ascii?Q?bvfhR9LLy5T1cSpRZjPQUuYxvB2sqi2zLc4p27vHHD0fh9p4hY3eNhTJJMWV?=
 =?us-ascii?Q?r1yMl0r6iGRCBfpewM+HLHSjuxWrCDIxIERI25U9TUyOu8YDCjyKGOTXnvbX?=
 =?us-ascii?Q?B8NU6kNC/P26sqAKh493TPSQbuTs2NTbf+ygnrpZBLpJrnjWuoYkYSoKQNbQ?=
 =?us-ascii?Q?uBlfjZbV78n+oNCanqlDheZdTjuNb4uHY9cYtwNAsyntDhJmMHKFDA0EIdkf?=
 =?us-ascii?Q?ABuiK+aSjAbDMY13Qb8M26J5jymBBilRhigJ/D2D5Bhe9T8c9ZzKqfD4tsxG?=
 =?us-ascii?Q?Vbm+Z0ubW6KPteOM9y3RQAfv5ZOyB5Dj3hxyy3ySuVsn8xyrLpxFanMba8My?=
 =?us-ascii?Q?dXovkZ3wewTmak7Un9KRIN6qMNdCGI9lKED4m+14cPHCUgUfP3AK02+KbSkY?=
 =?us-ascii?Q?/oEFAxJNgsgCrjdqTVBuNbyNz5wCVkxnjNaAp5F3oqT9itleFNLNnnBvHMWR?=
 =?us-ascii?Q?fFMH64IkH/fdMBoFBb3M6QOZBaB3iV3XQUEnaezxKZXN+5r7I0ri9RSNfnfx?=
 =?us-ascii?Q?MafWmdtSJPkBkaRPYbRS6Nxe6P697zuB6Jghum0lEsHi76KkVmdxQYLlUw+9?=
 =?us-ascii?Q?85nor8QqeM9VOJhMmVBHsgLcFb5UhsBadJ0SI0VwImADjaY7unCnVPZkmF8X?=
 =?us-ascii?Q?aZt+N0ER8rh9jn/AwjnoA40iKM8Pb8hfStf/9QGxelE0bia3ar4l4+eQftl0?=
 =?us-ascii?Q?NyzXUl5T5ofZ5AlTEsSED1xSILfycbUHvPMg16+U2yH8o4yhdeQ9tLjypji2?=
 =?us-ascii?Q?GvGdID7/CQ/Epa0LLoehirdtGChZ4lNwGhxmAPU33oX4ASfqWDHZY1u5KCyn?=
 =?us-ascii?Q?IsdZ5deaBjL8+gSa1n6wBp+PF+xZ10r+ZHmAeQkIo6otfQEM3X90bWXOhC1p?=
 =?us-ascii?Q?BbrT+Fga5wF/ION7IFWNVWI131Y/cTI+cfMdQwwXokZX0emUoJQubReb/pfD?=
 =?us-ascii?Q?SbcaQvK2GmcG+6hn8md35w436sWDRxO8mDFO5YtVNBn0YOzNyPDLCmVc0oIV?=
 =?us-ascii?Q?qLbiLLxjqc+YSUkU9QbPWThssdZmEKzvcvEzMdAzFVD6jb1Kt/oorOdRdwjp?=
 =?us-ascii?Q?f5mvNYrkfUasfbSo7omURkait5HU5GPeZubaeIrHPGI1nSvgzvuB5ufyTDb3?=
 =?us-ascii?Q?NvcV8XPn7dB7X7xhSH3LuKUoHqvB7NEB/PBSzfiE8s+WM/btR7Q1EszSm1DH?=
 =?us-ascii?Q?wSVsQuSSBIuOGbETme6Wsfac6q23vVLST3SXDRG7H5uJIdFuqV1VX/dKBhiO?=
 =?us-ascii?Q?SegxIxRcIinOlZeu3H86Ig2smR8lrZeP9jOwD4UK1wI6gvdObsc607uuroFu?=
 =?us-ascii?Q?IxnEQbJSexMysNzc9SaOWtvHnXb9LuU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2624c04-f661-460f-16e3-08de4cc9800e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 02:15:45.5060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6nmp5UfpQCT3QfsvBLb5BIrXqWFHoDNyObGq4Cv7sTKaglnmjxhHHIlx6VKtRSTgOWmYL8abraJTFL1M1JYhyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
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

On Tue, Jan 06, 2026 at 07:33:53AM +0800, Brian Nguyen wrote:
> Drop debug comment erronenously added in patch commit.
> 
> Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_page_reclaim.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c b/drivers/gpu/drm/xe/xe_page_reclaim.c
> index fd8c33761127..94d4608ebd74 100644
> --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> @@ -108,7 +108,6 @@ void xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl)
>   */
>  void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl)
>  {
> -	// xe_page_reclaim_list_invalidate(prl);
>  	prl->entries = NULL;
>  	prl->num_entries = 0;
>  }
> -- 
> 2.52.0
> 
