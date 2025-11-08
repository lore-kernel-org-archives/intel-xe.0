Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00156CCF9F8
	for <intel-xe@archiver.kernel.org>; Sat,  8 Nov 2025 03:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9037E10E094;
	Sat,  8 Nov 2025 03:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KLq3KJyJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B5210E094
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 03:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762572206; x=1794108206;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Kgvl459V7QS4IOkPhbKyLlr7VSjk5G4jR11rfwLlQLk=;
 b=KLq3KJyJ1h3vl3odSqrTxx31756EQT7+FD2tDZrXNy28mpbKxKHyzsXp
 HmNt5LTQ00241+spqTGs2+fxJwPa6mR/WRfW6cCkwFyf+SjOpx8zShGmy
 cJ7yqWYeXOg82OH5iRUCW4V6gSYVE3NgKU9i6Bt9m+F5P7ikNNSiTXwlg
 C1LMhuJGDaqFsP/DpRgDZF9zKl14HYvDOOWvLciKB3DZBDFbK/CCyoFi4
 TXp2pIdtQLBTR98s0Zej5I/iW3pPXawA7se8rIQ7xkHN4X9yE3xN+YA1g
 fUsCQvDJXij52mVLcSN8wGjjToJzKtjBoYn+oEae1W0K5SpckY9PUlUkg Q==;
X-CSE-ConnectionGUID: AWi3fHiMSG6FvbJKFY7b0A==
X-CSE-MsgGUID: BAarMM8dT56hzS6XzZvR+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11606"; a="87351973"
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="87351973"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 19:23:25 -0800
X-CSE-ConnectionGUID: 6MsEi7fwTJONGF2ldVsXhA==
X-CSE-MsgGUID: au8vkeOaRQ2OQL8gIB6BWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,288,1754982000"; d="scan'208";a="188366932"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 19:23:26 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 19:23:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 19:23:24 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 19:23:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZAIuqcKBQ9+ltKL3EPF6ds7IOWX+F23xQByFAKUUouj7EmPW1NNua62S2yyRxvhO2AvUDH6fA496CKYYeLzZZJNaiiKY1cCDC7DjfP91sLvKz19+7Dj7qne/5wh+t9jtguuG3d481eHLYjHrzmsIMVQqEJ2WIHsLzyMzS5H+vzD++nK+NXl1dIbXDztQS+f18nNV5V9c1vnjg2Edl07PZABwaXtRgntlqapwSmR6UQzmCQBuSpqnZaMml4dDhF/JFmotNi7FktkK2exa8ua4xofonTpDK5Oa+ej1YiB7PxzwW/xnMF8Orz8K7dabfJGqTatbUTuS6xW57XSoTclIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kj889xFGDM3ArMS0XYaIISZdSDYEWYAnFJ2yEbrIlmY=;
 b=h/nNPEMrM41DTRy4Gyyu0by5pKIhHUIXM+f0n2M73bqXdSW+OSkqGov85OR8XroIiLbFkbBzRL3myYqBS5Y+0bMNOlBh0H+dbYkeAlpH6Qu6yzbMYzpYeI3rTXetQLark7P8y2sD9kaU05fCljB8jrr8tVvJzqayoWIgrfSok2s4giWsOKVuW+1ntvIB5w2eTrjTEWzZZ0wn6i0/5CRZhc/M1s5SD5p7CHKHgly5QjTjGO0VmQWvNrecybEsUDri9v5MbiUiJCAv9n+TwT0kNqkhRi5A2BiQmVlGnqc5wEAywHE3Ih9FCBQNrR3ZFPwLcCDN0EWOafAFLcJ7Dvo0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL1PR11MB5222.namprd11.prod.outlook.com (2603:10b6:208:313::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Sat, 8 Nov
 2025 03:23:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 03:23:20 +0000
Date: Fri, 7 Nov 2025 22:23:16 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH v6 1/2] drm/xe/guc: Eliminate RPe caching for SLPC
 parameter handling
Message-ID: <aQ63pHic8tUHW13w@intel.com>
References: <20251104195735.1606126-4-sk.anirban@intel.com>
 <20251104195735.1606126-5-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251104195735.1606126-5-sk.anirban@intel.com>
X-ClientProxiedBy: SJ0PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::12) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL1PR11MB5222:EE_
X-MS-Office365-Filtering-Correlation-Id: fed85c91-538e-42df-61d2-08de1e762a9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GhCFHh1M8SOjphBK6tDv7mv6sQkr0Mo2OYHZdXAUEs3WEUR9LmtG9pKSt5RM?=
 =?us-ascii?Q?BdmGnXefp+nHM5OKC/lneOsE9T/7IuPRgaUDcsF5vWZKehePhdtzVU0Ro+Nw?=
 =?us-ascii?Q?owkjtJGCl1jHhWtWs7iwfxsM9lnsdu6MNGw7YvSHVzYgvd1/WPFjnC9I///r?=
 =?us-ascii?Q?aMyLQCQqajEkjGQO0RDPlUPpirfC6n4sRPepYMhShjNKHQo8+n6ucL8/VQit?=
 =?us-ascii?Q?B3Wgw+CVpfcYLKwnsIEqFoVGdKCz3iyV70XPgef5nSZrxU3MmxVqdNAWL4Aj?=
 =?us-ascii?Q?gjHW+fqLQrMoK+BV6rUw5/qF3gNOKe7sywGAESElHn29WDTXYNlMSyZeC/nL?=
 =?us-ascii?Q?X41FV1kJolXAo7eOrhb11VNSDB5ZLmE6MQO7f4ZjMFZmccAkVlhRQuu3xS21?=
 =?us-ascii?Q?BKwxdUeIylhp7EJHuhlIV37veXKvVWqn/pG4Bq4y5FTkI9eZ8C3Ybukw5POv?=
 =?us-ascii?Q?QJAsIntucxwLcZEK1xUXwPbJqf5X/YwQ5FLweLrvB0E5enLAI1+H8+olq9K+?=
 =?us-ascii?Q?NRmA3NE+EcZNRkUrFumeA4cQkzYR6uMro2VOBTnXm64CUaBkCf+mbhydtc3h?=
 =?us-ascii?Q?RwRSP6MX/qe8RBAAEvnhbfLMOgFlGO3WQDtGieNQ8TkTaKpdBNIMBLh5vW0M?=
 =?us-ascii?Q?jW5vbzfcmUruah6aOe1kAUFhByf2teP0MUBCSSVPnizzaYj85/DpxPB5tsg3?=
 =?us-ascii?Q?oU/UqJdW0z0JHV9KsrJCR0U9Gdtb2tioAJHX4R91oitxv4nUp7hV0GHuad8e?=
 =?us-ascii?Q?nDHuRgbXill7gkoaszq+OVXCG5LVi1v1Ym748BifJe0p3w4ZQYsSBRKx9/D1?=
 =?us-ascii?Q?+qMpI1/rjOpT37xnRjnVpqzCVoaqXS2xCOZMflLOkbj4j1aIseXn2ApYvOzZ?=
 =?us-ascii?Q?aFFWtLcJqfVK9vtCTVveDCDdmchtNDmoD2JKY9md34sgul5JR8nJZq+GxnXd?=
 =?us-ascii?Q?1I8vAGY9ezln8FWcZTGQYk5503SiT3QyneP5tyJNWjgHKW4te7IltxUhYG+w?=
 =?us-ascii?Q?JH6nBtph3uFma/tH0OTlRZ8FgziZlEW540ONhgTwXJWz8c4db701oMcDcmxz?=
 =?us-ascii?Q?g0nIw8nodRpHceoZFpMj75hAYLigSh4epOCy746XqgI/okPllmFbCnMhPnpV?=
 =?us-ascii?Q?5upl25/EyRKCyj3NK7dhoLJJ9Uno8zhBdSZ2XLqieazCfgisSY/srUriSbjY?=
 =?us-ascii?Q?aOgqIn9xuZwEmoxzIMPxtHbEk1CMLShhZM3cEAskO7+ZpdCL2kStN5YxCzER?=
 =?us-ascii?Q?/2O/qP897oA7MeFBOFMTvkrtWRdCp7FxLRy/RopONe7oNlCdelWJCVXgN4Sz?=
 =?us-ascii?Q?d4KbUwIDMyayWt0AMe/6bcyKhU8cZcZnNAtEfEj3MzbiyEKvYdwlTKZBsBE9?=
 =?us-ascii?Q?XzkFKOxWBqSKfHYQ4FI/tXrsI26RjdSP5IY1dTDW/MCrzt6cIg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kp7dsnxkOtCX4kqkkWf/pTz01bERG34E40FYgDhJ+MO81gAi2PvmeYGMqKSB?=
 =?us-ascii?Q?wnwFh89e3MLCKbycGHfCmS97kgOEZgGgCorkAQfTXIF8xJKz/nY9ozz1gUea?=
 =?us-ascii?Q?GZ1+oeuZpbCIJ+GEF8VVljpyTl16j3oN+hpUI1Lp78nLZRWPjjD6aQ7uUOmn?=
 =?us-ascii?Q?fA88K8ie4fZfe8d77RaC4FDAO9InqqILG2BZmxC11CHOmXndCPU6vpg+KN6t?=
 =?us-ascii?Q?A08nxmyJGe+eAUfO/An+7YwXLjJu2EeK6o6dmtUGaLP0NteIoGJRwl5cPu1I?=
 =?us-ascii?Q?OdkAIo60gk9k8urs71INo43Cj9Oqc0sH4mSCiRECbkSsJgwV6e9ThbxuCj25?=
 =?us-ascii?Q?DwXgYcDbXXDBYHuy57BQtZ8w2RWwTwQXDKUNkKZ+txH3vBd6Nmsj6bVulNo2?=
 =?us-ascii?Q?CZWE+XmNe7WrA9hR8cY0A7H2Fl4aw27Cbf2oxpOmceFEf044tqzv8oox1JnZ?=
 =?us-ascii?Q?CCG2ootPgMPOXykOh+TItmMYtLJZ+AA396Bw7p9JZ1qeAzfXychmDssXijpG?=
 =?us-ascii?Q?c8AlrLmeZf7w/iqXl3RyeHPRO3Bxc/qud2/gutqH4PM6GTTZO9RkBasebhIy?=
 =?us-ascii?Q?1CF3thKuBUVTlltFsv0zn9GsIVHR9I7rlci6wAdMz4RJ9QiWyGnIh6DMuIO+?=
 =?us-ascii?Q?4xJduGGr9/hmf85bxKio6lnDW2VraDYRsoUXltdKVHO/S2Kk+t5ZreXznsac?=
 =?us-ascii?Q?Sbxh9uLHumRgBxVM7oOqAd05E59ZZmXCxNmycbnrJUveewG8DY8VRkeGpa1o?=
 =?us-ascii?Q?7RCdEtXUNbEuU+MRwRyVQq6ls9vyQ6FslWfSLZGz9LTQsOEB0beSjSzkcr/y?=
 =?us-ascii?Q?mJdROKsxLNp+aUU6p+u7B91UR273IJ3nIhxkC4Y6Y6dzD0DiEdVJVfgX+svO?=
 =?us-ascii?Q?EQUXIUhJsPjKsfUG8BWmQt45pCGkqrlDDhpSVJwCxmOOKz2hfiWEhCrhSrO+?=
 =?us-ascii?Q?KjlpvZ8izXyE1pxX8iDU9IjUYxuFGq3xdUWllQYvgq4QhFeE2ERdcICAx5pR?=
 =?us-ascii?Q?3/DlmTlL1inSAjY2zplrz5HJyWnQCwSzO2hpLISD/vHx4/Hm+UtCljBvVG7k?=
 =?us-ascii?Q?yB1pq4UE9Y2lIvVGeUdNFCP9GACun4d4IEVol4SyIwAvexuD7VJoPyInpJzk?=
 =?us-ascii?Q?XCdscrNNEbGfhD9VYLbsLPFFEwLVqMX9Ps+WpNlV1glrGr82gk/ofthiQ0uI?=
 =?us-ascii?Q?BBmu7IhaapqDlFa4qJ6fzbiOFQf7O0zubB6UFi47EWlDEoQKfbkgc/lYkGRn?=
 =?us-ascii?Q?nvVeFjnS2VKpV3sNpymM4S81kzI+lGkCNGhgs6wg/hNGgWYqhIy34lehDsnz?=
 =?us-ascii?Q?IpIoKpVIuWhdTFw/1VzpCzofFdrpbbNuprcuwziz9w2pqPqwJ/1KG5LHVDkz?=
 =?us-ascii?Q?sDfNbUhh+YAWNLAh5HqdmOTy8kadFTKvbTBtoDBS90ZVpuk39PQAqXmJQQjZ?=
 =?us-ascii?Q?dtgQbinm/GvPcsQV2RjM8EsCF5cgi+t5InbgEzu2vepwkau4ytU4u0kh63Ps?=
 =?us-ascii?Q?PNBcGvjLn27EhdkBnqPlGGY/+8z1FBGBVvTLzTysgl0f9IEP3dzZT2hnskXB?=
 =?us-ascii?Q?gRetrU3FQPgCqBIgKYceeVAKv2qoGphDtvHvGp6CKrRK3FfTA6LhhwmREaYe?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fed85c91-538e-42df-61d2-08de1e762a9e
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 03:23:20.5437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PS3NS5nLUZMAJwQBiOxPS1rhcJCeD3kVgtImhiSVa8rv7h3dOpPBog94Hlw9J87OSy3s3lOW8geQF36FTfsJ3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5222
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

On Wed, Nov 05, 2025 at 01:27:37AM +0530, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
> 
> v2: Remove cached RPe frequency field (Rodrigo)
> v3: Remove extra variable (Vinay)
>     Modify function name (Vinay)
> v4: Maintain a separate function for PVC (Rodrigo)
> v5: Avoid RPn update while fetching RPe frequency (Rodrigo)

dang, now I regret on having asked that... I'm not trusting on the
CI results any longer.

Did you run this full xe_gt_freq tests in your machine?
I forgot the machine that made us to introduce this rpn hack...

> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 68 ++++++++++++++--------------
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 -
>  2 files changed, 35 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index ff22235857f8..efa9318c4587 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -331,7 +331,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  	 * Our goal is to have the admin choices respected.
>  	 */
>  	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>  
>  	return pc_action_set_param(pc,
>  				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -376,7 +376,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>  	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>  }
>  
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
> @@ -386,7 +386,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>  
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
>  
>  static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -409,24 +409,22 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>  	}
>  }
>  
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 pvc_get_rpe_freq(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
> -	struct xe_device *xe = gt_to_xe(gt);
>  	u32 reg;
>  
> -	/*
> -	 * For PVC we still need to use fused RP1 as the approximation for RPe
> -	 * For other platforms than PVC we get the resolved RPe directly from
> -	 * PCODE at a different register
> -	 */
> -	if (xe->info.platform == XE_PVC) {
> -		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	} else {
> -		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> -	}
> +	reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> +	return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +}
> +
> +static u32 tgl_get_rpe_freq(struct xe_guc_pc *pc)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	u32 reg;
> +
> +	reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> +	return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  }
>  
>  static void pc_update_rp_values(struct xe_guc_pc *pc)
> @@ -434,20 +432,10 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>  		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>  		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}
> -
> -	/*
> -	 * RPe is decided at runtime by PCODE. In the rare case where that's
> -	 * smaller than the fused min, we will trust the PCODE and use that
> -	 * as our minimum one.
> -	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
>  }
>  
>  /**
> @@ -561,9 +549,23 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>   */
>  u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>  {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 freq;
>  
> -	return pc->rpe_freq;
> +	/*
> +	 * For PVC we still need to use fused RP1 as the approximation for RPe
> +	 * For other platforms than PVC we get the resolved RPe directly from
> +	 * PCODE at a different register
> +	 */
> +	if (GRAPHICS_VERx100(xe) == 1260)
> +		freq = pvc_get_rpe_freq(pc);
> +	else if (GRAPHICS_VERx100(xe) >= 1270)
> +		freq = mtl_get_rpe_freq(pc);
> +	else
> +		freq = tgl_get_rpe_freq(pc);
> +
> +	return freq;
>  }
>  
>  /**
> @@ -1022,7 +1024,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  	/*
>  	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>  	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>  	if (!ret)
>  		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>  
> @@ -1340,7 +1342,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>  
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>  	u32 rp0_freq;
>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
>  	u32 rpa_freq;
> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>  	/** @rpn_freq: HW RPN frequency - The Minimum one */
>  	u32 rpn_freq;
>  	/** @user_requested_min: Stash the minimum requested freq by user */
> -- 
> 2.43.0
> 
