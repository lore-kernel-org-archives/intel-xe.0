Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A068C02196
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 22:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC64510E6FB;
	Tue,  4 Feb 2025 22:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tp7nrD/f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF49710E6FB
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Feb 2025 22:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738709608; x=1770245608;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=P0I+EK3111sVpYtU8+JQXCin6f/r+ugyPVkisU12L6o=;
 b=Tp7nrD/f9MCxS017jaLiifnavNY75S9JjWjCeevYM8+21E8BZn4ifLkV
 GIZCjuDGQf9cCq27VGzImW6XE+tRbZpy1FFaW2rAzKctZrceqLh4xCSZZ
 OWz6cG92cD3wRLdx1+vWRvGpQWvMH2MEB6MOta+5iI3NbwMZH+K7LQe4A
 rw9+r83Tfzqk9khytD14NQerX3gOWxGxa8d6bQyIaCu5PcEaKycD8zp9T
 4HpDd7PBX0Ku2rmZ0acyY2d0XXhT1Maa0d+ClQqpt1TcHAHMK40I/FM2/
 AsIleS+RsQfcKTbs3BqlEqp+NkKNZK/NW/DMN8R+d18Cvf4g7TPLqnl8E Q==;
X-CSE-ConnectionGUID: RfqsC90WSZ6ylWurZ/5kBw==
X-CSE-MsgGUID: nc5WG7NbS7iqemHnxPdp7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39521902"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="39521902"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 14:53:27 -0800
X-CSE-ConnectionGUID: oThtFM7ETxa7u89X6t93Xg==
X-CSE-MsgGUID: VHqdWOfZSCKXIwpYcOQssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; d="scan'208";a="110574859"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Feb 2025 14:53:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 14:53:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 14:53:26 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 14:53:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDqR8VEvgcPNOsRZyiQ1EEw4T/mzrgZi0KKmevTTrPQOA8cUVnNRfjnPVlg8sNi0OCPAnA9NJ1qFB2ktx3Nh00OT5CwqHh0Ox7i1Nue2zXb7G3yuS0ryHCb8tnFtDml14w24ZMCqinJdJhengYw30sZLQsDeXfa26aUwpKjH1njixVKhg3nvftzg8wEY0Cx7vi9UjiDjaxbDHJtc/OC1ydL8l2VKdqAehxvBY5vsXO6jMNPz9FhvY1eIGR5qWEDxUW85vA9+pxPkttnigPGCPJxkkY4lqJguCVGT5gAMr/r1FBOoNmhL0ULTQOna6OK58NcjKlv66fkm4QfTfVrJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41ON4lZwDVEDs6zUccmVYiSGxLmBFuIJRpWtmYo+rlc=;
 b=oSKZcrl2taA9OhyJ9Nqx+pT1nKZDJfWinSTd6hInuNqW+hZojDzu6+NqYSAGjUeposFk+LmoSJc28ZTGGKETYObxwMJdnbFKNcfdi3nDGIAlZiiX5HHd4QC8qjAxBWqlALr0Kqr3VJ+5vVPA3rKJ+bscYNzIDNCBQJfI3x6WrUF3axilEbV7FxD0VXln0HQUOviIKFx1O/dciMjdEjY18DDm0JKuj2bWbyCLaSlGwfpIphOenBqRiYi7/hgsh09psA6Jj5/w4D9XdKtO9zzkKiI4u3y7O8u8vY90Pl24VLd9rhMYi3x/iga73JGiNwFS3Qa2g5FkL2feyUwi052DOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by PH0PR11MB4870.namprd11.prod.outlook.com (2603:10b6:510:34::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 22:52:55 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 22:52:55 +0000
Date: Tue, 4 Feb 2025 17:52:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH] drm/xe/pxp: Don't use 0 to indicate NULL
Message-ID: <Z6KaRFxc3iV9JqlN@intel.com>
References: <20250204200144.1445800-1-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250204200144.1445800-1-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|PH0PR11MB4870:EE_
X-MS-Office365-Filtering-Correlation-Id: 06639c57-54df-481d-cc80-08dd456ea9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/oYB0pQUukLokXVhvYCod81jgBFkqP5RTvO+kaesrfdXSFlEBqBmRQcKT0Mj?=
 =?us-ascii?Q?XOmHMXyDJBohyQKNts9UuhKpfzBKDaj3+TSgFv1CRRNIxAGW7DgHYPUiEOhg?=
 =?us-ascii?Q?07QFekdXuQDiVklsNyNZtaqQvaxQV745StUTnCz25saF8he/B0pKinI1MvWd?=
 =?us-ascii?Q?/S+WIG9u/dBEutPsAbRx747QB9mawK0iU7Tyt98wOLZZWI6SBsTnAeDMTfZt?=
 =?us-ascii?Q?2aDK9oPSFspM+IWQ3d0TI37WoLspaLvjej3HQiFtwcvEDSShazqgul1dBiDV?=
 =?us-ascii?Q?Fdx69xzfAFj3OHu7jTwxiFw6kCIVnPe6agD88sf70pjszPuBez1oJfmFOSe9?=
 =?us-ascii?Q?ljnTztibclC943ipNWcFZbYz1cGXj77IfyeifZ96Pn0z6AMGHk4sztc2xq1J?=
 =?us-ascii?Q?Zk/O2cVtstCVwBC9rr5YASMzKBRuODHg3Skxm+xVnxfTYFOKqgZRKLAkkNlz?=
 =?us-ascii?Q?R0hsmRkZt3B+6M2vV91rFGuVTCPLq6tq3yL0oE9AiFWMndjydoLUgx6g6YWm?=
 =?us-ascii?Q?se6KvpVuH113v5SEczeIMTzwBYtoYA1OrMz1G38n2IcaP+jHaDfZ01BdOlAL?=
 =?us-ascii?Q?p6Vrwsv/sUTG0TXF15qE8CmNwfUQ5vbK9s4JBt5e7ESk+bwNkUZuNC0po+HD?=
 =?us-ascii?Q?rvq97PE6I3Zpz9vRXe4CqgyWKCz6bJpPfqBN9TWK89KYENMH7CCnUVl3tuGc?=
 =?us-ascii?Q?sy5IjrZRWCVmVFl95cbILaJ7nPj0iegYPfzmt85q1HG5avHhu0S7FCbEbveG?=
 =?us-ascii?Q?DmkzTPS4bqAXmEKzpoEAL3Ghjfgjk/YD7QKljqLM6yx39T4/Y3MKPsK83F2t?=
 =?us-ascii?Q?sYaDK3HwCmaK9FNzQGS6Qj7+vfs/b86CjMJ/gH9RhyvKDldPdKXJ76Tn60aT?=
 =?us-ascii?Q?ROQu+bCKj3eJTXGg1E5I+NEwIRxYi/QkukVN8LrqfH3vW7uBYyQYHKnXAtXx?=
 =?us-ascii?Q?i8lFwMOr+fSMeoPbRtrU4sjPQIrsIN05C5YTqkGP0NsAu4dD8YzuZIAuZVZi?=
 =?us-ascii?Q?GM69omEJ7Nr+7eqkeqc7M7rZrDcAPJCDhtHgsS95BgVuoWGADJ2gGNYWzVbi?=
 =?us-ascii?Q?1tKgzKtIesYIAg/DUrnmg/BdAQDYpnMHfxy01AEOTsYGkf8GXPOCITc8QQt8?=
 =?us-ascii?Q?jhyydeu4Hh7T5o3xNrER2REl3dAkgKRk4c97rPCAHu0PIATTfkdtPB/X4w7p?=
 =?us-ascii?Q?hNKrg14D4br5SN5ATIwu32kp1VniRo9eNvv2y14aFknIwHJA75DgytZlkkgy?=
 =?us-ascii?Q?kxFQ0y+hClhDD61yM312lf5yFTNsN3NY84S3ZzovULg30uvLaVcxb8+gXebn?=
 =?us-ascii?Q?PYRUlz0DYdhYe2jOKssWkW4cCY2aHpMibpteMiCrU6EgIw3/c243lHiQKVQm?=
 =?us-ascii?Q?DyQUrx57wKjK2mapACyVPDevgeyC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/o8uVqiazF5KTIS1bEP7J7g/IYk+j12oGndbR3hOeFP7Eh029NSq7ANd8BZ2?=
 =?us-ascii?Q?6P79HMg9ukpI03evj0n1SVQ/QckuqZxHgvKkst2075cCnrbVuHQjJh/ZkqVj?=
 =?us-ascii?Q?BGeUs4w6SYUlMul5qoY70+XgXc3kw/hSTTuKGvwZ2oz6CnAuOFq2b5zCfZEd?=
 =?us-ascii?Q?mj2iwg4QEOkz1KEU4nboj9HVPXoYnjmwpXOsLTw4C8+bn3/E5ya7+jlECvT2?=
 =?us-ascii?Q?3uCQhQbToKtbqmQfOOQBmABu0SgkW3Ia3rAN4UtUnELEdQDhvngp3TBHMswP?=
 =?us-ascii?Q?vRwh0kNGonXk6rlVCH+hfF8QtzA5HJgCZV2Kot63dIxDE04cr2eF7Yu2vJOj?=
 =?us-ascii?Q?0cx/CB04q52oqrSmA2uljhtOtKfERte1GZhoWR6bXZ/pK2rLXHF5g+35y0e0?=
 =?us-ascii?Q?mLCScFDMxXq2U+lAHfDxho/7HFUdiy4VMIvEl1cs5HAVTi7+xiZyVtw5wt4N?=
 =?us-ascii?Q?4DMF8Mued6/CV4QtTrUTlO4C2bAdqI+MJv3EaZWsMTbFNk8ytnP5n387ETvh?=
 =?us-ascii?Q?2sXWsOiQIABLkkDK/LbF1rmOZ8sOBJpNpdgRr17L1/O0Nen1BQeaz4N8HcTg?=
 =?us-ascii?Q?dors8g3MCkGlGYAC6Yib8+etjER7ByV55yphvWHZBpFknu9z9F0Cvj3tZvXQ?=
 =?us-ascii?Q?nnwCJGJLx2/JIYm/UhNfln+8qKBWgViIMm0C7kOArLrBjj9xTiIruCcRQhvb?=
 =?us-ascii?Q?gQpakvwIZ3Jacsf/2XFHfDxaLXtmQrHXu/pjK9BVtYKKeheVb6otxYyYKqiL?=
 =?us-ascii?Q?qqOI4HSPXJMgdOvZK/ZahzSnHXTRKtD0XZZfgR9PIZM4neu14XnbKuXlO9Fx?=
 =?us-ascii?Q?VLkeNY8hHJYcCvXVwQDfGeDE/udz97j1FNUV1jb8brTKCcoI25WQFZTFP1CC?=
 =?us-ascii?Q?BFcQ7tiYy1cgMaD/Lv5YgKiGJ4xpOFEBvNQ2d3KBI87UZpNQKxyYIudv3kN/?=
 =?us-ascii?Q?I/UWd3CRzxPEnzGsGxhSh8/ZcZe3lMSCxOJ3mWj6jkWailUbJykh6zpoJgr9?=
 =?us-ascii?Q?mgTbZ4eHfrsq/60o/RnTOCscSwBCXb9vb8LExCy1sKW0rRDNssul+YyUKVUR?=
 =?us-ascii?Q?XDmRrJuuZUHv/IS+UArEApYSMH0ow7x9iRxyeNGZZECHUzUs5BPRL6z5zcUm?=
 =?us-ascii?Q?JFOy//cFn5eo6J1NdnN3n+HUxCxIAHFmyd3IBhNne5fmfAo5J1oH76P6D5vL?=
 =?us-ascii?Q?UpokxH834At+zak7CTwpS/x7BdnNmcjLHcK4JcGSfYJA9MYivK/59hQ8zRHv?=
 =?us-ascii?Q?rBr7nkgcGP5Q9mox31iSLEEjcEpeWSTW64YrOua5IRAvw62tt6nwZRQIP/Ya?=
 =?us-ascii?Q?Z8WXCmgrynDYpeFtAvBwVxS8x1d1KBlF99sEEbBIHjx0l0gsgg+BZmwJ/J4d?=
 =?us-ascii?Q?cWCZH89ZbcEGn8wxXmZB8yrgC0XWNMr4jf6zLlDXjY0Eiak9fUUinoP0mSUB?=
 =?us-ascii?Q?K5LKK382DQfIIpYUXsOtPVLbY1RjSWj1BX47t4Fg1J66WR3Tq1k9Fi4snv89?=
 =?us-ascii?Q?vm4Dg3fTYVPgzyI3nySTZ+/xpk+mX7mtD1niCpKIV8AGHFtojmHFVyzuT7jG?=
 =?us-ascii?Q?xV2cq5BADedjVvZu9w1qQNY0CM/pziNSwBclwkd4qeENec4CB0q2SxX0rXd+?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06639c57-54df-481d-cc80-08dd456ea9f4
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 22:52:55.8526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4AnNQTr6OLGgVAGLi03mtmELEqSf5fxQ4olK/YIhkv2/00V+4gJlCRDkGFOVdAne6OdrOKsxSKJng8k/ZtBnKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4870
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

On Tue, Feb 04, 2025 at 12:01:44PM -0800, Daniele Ceraolo Spurio wrote:
> Explicitly using NULL is the correct approach.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502050322.VUBMyUHc-lkp@intel.com/
> Fixes: dcdd6b84d9ac ("drm/xe/pxp: Allocate PXP execution resources")
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pxp_submit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pxp_submit.c b/drivers/gpu/drm/xe/xe_pxp_submit.c
> index b50fe037c74b..d92ec0f515b0 100644
> --- a/drivers/gpu/drm/xe/xe_pxp_submit.c
> +++ b/drivers/gpu/drm/xe/xe_pxp_submit.c
> @@ -54,7 +54,7 @@ static int allocate_vcs_execution_resources(struct xe_pxp *pxp)
>  	 * Each termination is 16 DWORDS, so 4K is enough to contain a
>  	 * termination for each sessions.
>  	 */
> -	bo = xe_bo_create_pin_map(xe, tile, 0, SZ_4K, ttm_bo_type_kernel,
> +	bo = xe_bo_create_pin_map(xe, tile, NULL, SZ_4K, ttm_bo_type_kernel,
>  				  XE_BO_FLAG_SYSTEM | XE_BO_FLAG_PINNED | XE_BO_FLAG_GGTT);

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  	if (IS_ERR(bo)) {
>  		err = PTR_ERR(bo);
> -- 
> 2.43.0
> 
