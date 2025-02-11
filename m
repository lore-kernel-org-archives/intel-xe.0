Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B220C0219B
	for <intel-xe@archiver.kernel.org>; Tue, 11 Feb 2025 20:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D97C10E74F;
	Tue, 11 Feb 2025 20:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AOGITKDh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD0C10E74F
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Feb 2025 20:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739304110; x=1770840110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XJcqOJBVforly/lYQVZ9A8u4VLFuRW2A5NOKl/0liUQ=;
 b=AOGITKDhe0ExsjYph7JNyeOznAU6By90G96OdKqGlCdsMHjRnZLg9NYW
 Cuj0plsw4Zt+3GT0+fBTPjS5TS42OyHHbfCJBpYnL5oi9r//uY3VGiZq7
 4P+r1W1E4WgWxU1QCqgvTNj0BEB0qwCZfbFmDgnRapCSjnEwwkTjC8DtZ
 2G5YwvCI5gRIrmoZsyK3sfXAXvCPEtAguqEavm9s/Opz6CZ7Z7mIzZz1l
 0ClLLcGd34JV4wMqFrmqlmhJAhIas1RUgZKhrklZ97v5Mz13NCYRS6cVp
 s4CQgMW0R2+5PW09gszTOl3RAQLGeKQKzLKh0OQnfeuwYJhg5wE3xMJwf Q==;
X-CSE-ConnectionGUID: LkLh4lzKTXiunijQ8LmkIA==
X-CSE-MsgGUID: g+6nNiHsQO+tVUnL5TQqBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="39824226"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="39824226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 12:01:50 -0800
X-CSE-ConnectionGUID: B/YfF1wpTNKXgSUhf+lDIw==
X-CSE-MsgGUID: MnJoBl7hSqGfLWeKCwGzSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; d="scan'208";a="117686232"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 12:01:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 12:01:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 12:01:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 12:01:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sr4Fp63OGXqIWrmFDOZEcGoEnuSK8V6oUBK2BcJzIsPwq2DvRWBMRTSZpL+joAHV5TbDBNZGwCtT7s+kMd5vmC11lbVePOsEU6fN4S29nGsUaJj8WF+zVl7+iyb8We+zvgxKTl6ZzhRZpbmkfQT+FBNDx0fg7TEu+udPf4vLgesAYBiVj8Eo+JNy71I1bciUWY0bh4kkW/yIW8XFTRdOSCQdQYDnxeqanRXJis/Ir70w/GhpSzH7n3YN/KYqVz7w4ggapXALatug7sipB3ybBf/y/2f2bJ9WT2ZnrGSNLI+p57JW4RikHvlj7HB9O9QUsesYDCFzCoWDGqb/PPSddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Aa/o17fFQt+OVEYn2koPC1ZuX6cJ/njy0PIDwELqYA=;
 b=C8+PZczes+AsgpOVtv2dJXC0aHPtsum3h4d/e5f8cN01BkRggChy7roU9ShkqdPtvoquEvdmcB+oofbf8DOwT1IjWpu83w0nWuZC89cdpUIq+HAf8ZzBNQl694lf5BSogNpZzC/Cf9JVeeR9pzAQbMzXXHY6Nf0bN04EP5elbuj55zkDLONma2x6zAbcykkiDuEZu8JXAyZs/3Yv/izGxsjZfV76LN0iGctQMR/4GgpUyA6Xuuung7n/uQC8OXo+5sveGr/DbsLQ2jqIDHjv+mcT1cS1r+mj+I9mwuevSp0SPrGK924+BMtQ/PW8TOC80c4LvMTph7bfQB6c+ld01g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 20:00:38 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 20:00:38 +0000
Date: Tue, 11 Feb 2025 15:00:32 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC
 fails
Message-ID: <Z6usYPd1o2l6S8cU@intel.com>
References: <20250210210719.477386-1-rodrigo.vivi@intel.com>
 <CH0PR11MB5444C8CA507F0ED75E8BD033E5F22@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5444C8CA507F0ED75E8BD033E5F22@CH0PR11MB5444.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR04CA0121.namprd04.prod.outlook.com
 (2603:10b6:303:84::6) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: a0921406-7fc9-43b7-bf42-08dd4ad6c076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TUeVVkbLW/W68VOhlpu75KgkG99Fq5YwOXelMIevDsPXAhQ9yUbKs6Y6NkNT?=
 =?us-ascii?Q?+SC2M0xTXbCuaMWrpYt842P3VffbrwmS8s5W+IhRPWk2g5IMR9fHymxhmKop?=
 =?us-ascii?Q?wauQ0G3MbyVnRuXpD4XqUJiuZDZzo7nB/1VCROlAK6Ucsa3VBcxRqvtB6IU8?=
 =?us-ascii?Q?+RjRcVPBniGGkjp0NR5iAsydwKF4vhhWt7uqJ8gIeRDAKsgFf5Z0sZwKThEv?=
 =?us-ascii?Q?Gxnre5gLvw16h2h3Evg/fu/c3Ce/s6ba8OsgCTvNa7eKazlUvGzncYZ1Ih+D?=
 =?us-ascii?Q?g1wipVfSjbYc78j7A3v0JZZhDUl6gqXWMxXjwikKD1p3Ti8pHchjTbbfd1PU?=
 =?us-ascii?Q?53JhkZrFwwSWvbPqeLYGG5IelBy8BC8CNKFIDo1M9bzc8uXUSkEaPy/pCzHV?=
 =?us-ascii?Q?vHh2EQe3lU4bVmJcUE47GKqCgFvVIyJlAHPUeTHO1mCQad5Lp2gpmDKjP/p5?=
 =?us-ascii?Q?f3dIwQiJaE+otjJatthZqFBI1gtGxVlzt6gpvThWM7+BrgazpPtzLfD52uvh?=
 =?us-ascii?Q?NSA4cnPfoyID6AXg9Jzw62+4o9Tl4iQeR6x26g1/kFpmyai5MJg/yL2E6GDY?=
 =?us-ascii?Q?D/e7wzC57KkYvuZj4iRea53sl5O/auzHbNE/HoLM2eQ6dLpPpHgHdrNL1QMm?=
 =?us-ascii?Q?KK3bDOAmHyshuJeiWuz1MY/hS4ikngdTm0BN3kZaKbTHbO+XgqEvjGYVkv73?=
 =?us-ascii?Q?tiBIna/6SRFtA9Bti7wCNXDXbfg4PLuvpPPwBux/D/0cIlHber+e9Ehh2Dbs?=
 =?us-ascii?Q?/6pPQ74Gv/YeFy6VvEE+JKNY1xFEreIEpHCUvkTqDMhu8b8hJY6mV/HqLbsO?=
 =?us-ascii?Q?mSmEVhm7B/9ZfP5ysNevVlDxrGHm1VB96rq56D5qsFSgXZnHyjIPuqt6Eod1?=
 =?us-ascii?Q?i0aRe5hHC/4YaRc1dvU4HM2WXfZ7fv8DE5RUAEyKGu4YQpJdk2dhcpwZ51MQ?=
 =?us-ascii?Q?Cqexlm23gqg4rLXTpc+EemQnRmutQT5bN+bDQDTKuOcYsL3seWKEz4ICbvlW?=
 =?us-ascii?Q?2lmfJvtL6E2pDrIQJoXKiEdN6DIEt5h6qi+b/AQvntepb9iMx8j8r9HIQId3?=
 =?us-ascii?Q?+vcTTSQ3LnlyNVMiZpAalMD5BuvaZIhccOGp1jmwr9knfJh6JM5NsIVvdGN/?=
 =?us-ascii?Q?0zDdku5JICwn1tSc3OCDfsb2pn0QmBs/jnag+smjwrAIuzQmDGfmXKtNd8C3?=
 =?us-ascii?Q?WqjlqNk4EFZC8V1P3+iim6eQI/GiJsvDLBw1P3IWT7HQ8/zGbkKFl+6uQpcl?=
 =?us-ascii?Q?b4GuQpgO3G5DdooJcOS2TAQszDKSmSPhcqX/0HBK6AElzt849w7Pi8KKJ/To?=
 =?us-ascii?Q?yJHF5UuHwOQJk5tLc6FKXW5+lRjCyACiJUkLpr5WtbJoyqjmFQTzqBzLgPlA?=
 =?us-ascii?Q?9+jpoXfKhbXBLXWWtC6PoGJGasau?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YYozxLf46DHClwNuXS3LlLgUQ3N/FchuAnMTFDADQED9+9z0QCC3JzcvJrg4?=
 =?us-ascii?Q?mYGa5u8JWLiFSZRqMr1KFzTFZwuomF87/JjKDsl3zzAsy02QC81XampQbvMf?=
 =?us-ascii?Q?UjBWx0J7yS0HBTEGTeCmYjaf34UEHNYaUm3/nc1kpqbGWc3EgMzsubb01PM3?=
 =?us-ascii?Q?XdKUoa8QkQF5LyfC94DV56wo6gn894aF1yRKNBbX9qlsS2MPMAnMxftZM48u?=
 =?us-ascii?Q?oSZtNjznQoNLjgSlEWwtAP2w5BorienscI8JzyVowAnJjvyotHKiKh8Ow0q8?=
 =?us-ascii?Q?ivUAwTjcCB/fa6nyk5oO2EWy4KMVgzUC/EI5VyF/npbtQNanzpgqj+JHJG/4?=
 =?us-ascii?Q?8DnukFqctHlDwaQmak0Rkai30IWLjsTJ0sC6ih8rqbSa7Ir9i7WPkFOa20Dz?=
 =?us-ascii?Q?ps7JcOY2ckQptAqZ8yu3otyPmIMXhy/Ub9Wd4KG2EHaiTk+68HxsIh3aKFEf?=
 =?us-ascii?Q?ir8OwMCmETsYp8FRDVDzimSpVvywhiOQvU3Pq/WnRc0enSKibmKAAEaDS1oJ?=
 =?us-ascii?Q?id7abvm2JahaYTSCH0gpw23tO0ebNG6sfmd1Cg8vSbKBfQwNwfv6rudCp7zh?=
 =?us-ascii?Q?caeX9yMnCagvpCl9xnJYBca4wYESjpkdP6vzU7LunrTTkzTyCMNQLPRiivly?=
 =?us-ascii?Q?BwdhXBWUc0eT55pzPNxSIKm9tFYTFeDIXGUVzmIipOKs459kF6xclJ6mgUuE?=
 =?us-ascii?Q?zPee7BD+yOxXh8ExXt3Dm644jwjT9uPuApQ0cRxGuAwxbn5tCeM6subRRlxA?=
 =?us-ascii?Q?i5BwzuDhe7f6eo3RRF+2Hkds8KZeDGEMVkLaieWP1Ly6jdTQ7emtIMVV125E?=
 =?us-ascii?Q?Bs7ItoVGkvYrAdZAJ/sNhNOvuHCWP2DIL92tUxP1/1KQJbn7+P5ARPsYXLwv?=
 =?us-ascii?Q?IoRcoQQkvdEUVSX+pBt5Wmd2MQVNw/OzQtd0JZW9FsIqRwiWm589XrrU/ZYK?=
 =?us-ascii?Q?UN7FYGcyga6H9XCWP0dILq0dJtmPfGqT42SNn5sxO/q/8TPEHYMxYjahD9o5?=
 =?us-ascii?Q?S98dWFa28SIww7V/c2SBHmOwi9nwJwTtmHldfNxWGMiHjKhRdX0b/QIEO8A8?=
 =?us-ascii?Q?Tbwcr8Iw6P96U8u2Yu9shAcXGDzFqNov7792E5KxAhy2jspRBAHXM0DVssW8?=
 =?us-ascii?Q?7YUO4VDaeOLFhRaTgaA/OZv5d5az5DxXgfXLybcid/oBNTckLAK3/6FbBPA0?=
 =?us-ascii?Q?OsnFlq/LWoM3xkqqmvE6iKF7E5Dn1+FRX+oIGJlj5Zqp2myxu3il63m+liai?=
 =?us-ascii?Q?h0tMcBAMapI85MVv9gV5DSY0FXMI4ArWyf8Sy7nHy7FxhZu6tyesQ1Oo9tg6?=
 =?us-ascii?Q?+W5fXK4b0i5MaPmcK6WGCxqXB8B0fBLohAik3ZzFhd6kK6Vk2RApqOmJ8bBJ?=
 =?us-ascii?Q?TWExtD9cwiuU7Ug4bIJHaPkZJwnG440ofz5cSAsB7qy1xle1MvrlmC831z9L?=
 =?us-ascii?Q?VMpJ4xlAdsAB/tih3IwLzXknrWzTimlbe5cwelAHI2DLHpAVACOInwETlvoD?=
 =?us-ascii?Q?xo9dHGdgOxoTLHB24Dqp/Pi+Q7w/blDjzEK6fO/wxWvOkS2CkV+wtOzzvrbz?=
 =?us-ascii?Q?aXkGDvDgcx3mw16TJzh7lBgLdBWML7qOTG/2g3UMjEuYPJqUB7ytqqGPw1sy?=
 =?us-ascii?Q?0g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0921406-7fc9-43b7-bf42-08dd4ad6c076
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 20:00:37.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T7F8z3g3+LcONl5HpCG2GrACvwTBfvPbhLP/sAk2DCnZOTsRIpojXJsOjwj6/YkRBMZlJlFWVdWqn80Us7L6eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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

On Mon, Feb 10, 2025 at 05:04:17PM -0500, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Rodrigo Vivi
> Sent: Monday, February 10, 2025 1:07 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Subject: [PATCH 1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
> > 
> > In a rare situation of thermal limit during resume, GuC can
> > be slow and run into delays like this:
> > 
> > xe 0000:00:02.0: [drm] GT1: excessive init time: 667ms! \
> >    		 [status = 0x8002F034, timeouts = 0]
> > xe 0000:00:02.0: [drm] GT1: excessive init time: \
> >    		 [freq = 100MHz (req = 800MHz), before = 100MHz, \
> >    		 perf_limit_reasons = 0x1C001000]
> > xe 0000:00:02.0: [drm] *ERROR* GT1: GuC PC Start failed
> > ------------[ cut here ]------------
> > xe 0000:00:02.0: [drm] GT1: Failed to start GuC PC: -EIO
> > 
> > If this happens, this can block entirely the GPU to be used.
> > However, GPU can still be used, although the GT frequencies might be
> > messed up.
> > 
> > Let's report the error, but not block the flow.
> > But, instead of just giving up and moving on, let's re-attempt a wait
> > with a very long second timeout.
> > 
> > Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Minor nit below, but you can safely ignore it:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> > ---
> >  drivers/gpu/drm/xe/xe_guc_pc.c | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> > index 02409eedb914..aa58f9ddbf84 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> > @@ -114,9 +114,10 @@ static struct iosys_map *pc_to_maps(struct xe_guc_pc *pc)
> >  	 FIELD_PREP(HOST2GUC_PC_SLPC_REQUEST_MSG_1_EVENT_ARGC, count))
> >  
> >  static int wait_for_pc_state(struct xe_guc_pc *pc,
> > -			     enum slpc_global_state state)
> > +			     enum slpc_global_state state,
> > +			     int timeout_ms)
> >  {
> > -	int timeout_us = 5000; /* rought 5ms, but no need for precision */
> > +	int timeout_us = 1000 * timeout_ms;
> 
> NIT:
> AFAICT from the comment above, this wait lacks some form of precision.  It might be worth while
> to keep the comment here remarking on the lack of precision (or how the precision is unimportant
> in this instance), but I won't block on it because it's not important.

yeap, I honestly don't know where that comment originally came from...

on i915 the same code is in a define:
#define SLPC_RESET_TIMEOUT_MS 5

which seems like a cleaner approach then all these hardcoded '5'
spread over.... 

sending a v2...

> -Jonathan Cavitt
> 
> >  	int slept, wait = 10;
> >  
> >  	xe_device_assert_mem_access(pc_to_xe(pc));
> > @@ -165,7 +166,7 @@ static int pc_action_query_task_state(struct xe_guc_pc *pc)
> >  	};
> >  	int ret;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
> >  		return -EAGAIN;
> >  
> >  	/* Blocking here to ensure the results are ready before reading them */
> > @@ -188,7 +189,7 @@ static int pc_action_set_param(struct xe_guc_pc *pc, u8 id, u32 value)
> >  	};
> >  	int ret;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
> >  		return -EAGAIN;
> >  
> >  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -209,7 +210,7 @@ static int pc_action_unset_param(struct xe_guc_pc *pc, u8 id)
> >  	struct xe_guc_ct *ct = &pc_to_guc(pc)->ct;
> >  	int ret;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING))
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5))
> >  		return -EAGAIN;
> >  
> >  	ret = xe_guc_ct_send(ct, action, ARRAY_SIZE(action), 0, 0);
> > @@ -1033,9 +1034,12 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
> >  	if (ret)
> >  		goto out;
> >  
> > -	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
> > -		xe_gt_err(gt, "GuC PC Start failed\n");
> > -		ret = -EIO;
> > +	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 5)) {
> > +		xe_gt_warn(gt, "GuC PC Start taking longer than expected\n");
> > +		if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING, 1000))
> > +			xe_gt_err(gt, "GuC PC Start failed\n");
> > +		/* Although GuC PC failed, do not block the usage of GPU */
> > +		ret = 0;
> >  		goto out;
> >  	}
> >  
> > -- 
> > 2.48.1
> > 
> > 
