Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85294D2FEDE
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 19:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E5010E5BE;
	Tue, 27 Jan 2026 19:56:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIugNZWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA3E610E5BE
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Jan 2026 19:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769543807; x=1801079807;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=O9Bpn9+daw0doiIy7B1iYamHH34No42w3thTH6uLhb4=;
 b=IIugNZWQLuOsKaqwiK2TTXVQCR0sLnWhx1SSVrDGn0VfIP/voAw40Au8
 LNol4is7RZevB0jiLiGF3Syh76MkBy5hpO90KVekfgSotaeu4D3YqxP2l
 mUYna0oXoLA4YzS4FRmn+HitL7UVMuOgzONZYwDsYFd4HVhHkPXuNi/Ul
 Bnl8gAf9HVIsBijktsxXdausjeAMLBLVJgHSNofZkZUtWMOmxqtF9pYrE
 rFjwifAnnErtdTklzXj3cWybMw8DaGDgn+OP7tU5T0+li+NeYPxkDIXHa
 LHHn+QXG11mYw34dk97vf6/bx3xbSSO2yabYXDgpxnAk6sQhPK3fifu8E A==;
X-CSE-ConnectionGUID: YEy/SgaDSyiumGKthH+URw==
X-CSE-MsgGUID: ZHl+LsaZQGS1VM6YovwGWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="70916610"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="70916610"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:56:46 -0800
X-CSE-ConnectionGUID: dr7Nh5QqRYG5lvBu5Yc+Cg==
X-CSE-MsgGUID: 1K9SnErTTFu9tDVYQcunow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="208300154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 11:56:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:56:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 11:56:45 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 11:56:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Glgk3vGVXIsGSh+Qq6VovylfQJMpsi2Xp/n9yM0VWmXidWDTO7oarUl9IRRP7QLrSiNYWj+pOMesag2e8tRYLyCl6YUBGR0ReTk0BUyFXA+KltqEquiUQUjeZEPHn+2FYEhEdRq1yu8graiUuAPvc11SK0iRcCYAcz4IF/gcee2cYNV3EEBdE38R4t0MHtKarGpFXdb3AlRdp1dx4YyHoGFgsYs4jalVYV7viNPmeg+6ISlR/AtDmUhjOqg8cQZPkqXfgEOIl+9fF2HJfQN094AzGzHFYNwxcKxb2x5T29hgSuHnWWvpWoJKKdIeY9pJkJvTuoZ12ZzKg5LJVXydSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2muLb1gjLrabsLiwVGU0IX9uC+mJow1ayeJEZ7gOZKA=;
 b=nan1sVjCx7tf00qxgS4vXgIXE80l0C+5Cn7xlm5di85AdnB6wGKnrtadce/4aApfAyLzsfoBY2ApPe+rtIcRlnoPrm4jdC1NB5qfZ7nbAZ5VmsmXnouVW2HOhkDOca+MU6fj8Kz46SSCilVLPn6pvSH0DIx1oP6On6yEve5hZBhBgxuttN6myTzfpRdsFMi6UjNdnTObU+nJ4lrInDD1675ONSurXIxHhFFLX5o+ET9bzQY60HVCj4/1ntVrUsLKEy6lK7q1RXjCftPvj0Ngyvy0nr/NAlII11rjruGGTDSGR1GJUQ0Z/ZVgAREYV7FqekocU0OLHFfEMhabyTkJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7734.namprd11.prod.outlook.com (2603:10b6:8:df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Tue, 27 Jan 2026 19:56:43 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 19:56:43 +0000
Date: Tue, 27 Jan 2026 11:56:40 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/6] drm/xe/guc: Wait before retrying sending H2G
Message-ID: <aXkYeI5B4QIHXeoc@lstrano-desk.jf.intel.com>
References: <20260127193727.601-1-michal.wajdeczko@intel.com>
 <20260127193727.601-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260127193727.601-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MW4PR03CA0139.namprd03.prod.outlook.com
 (2603:10b6:303:8c::24) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7734:EE_
X-MS-Office365-Filtering-Correlation-Id: f1efc587-880c-4293-99b5-08de5dde3192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DdjoVKtmSs6pvkD6dA0tAYXbAKdOQ9GELR4xhzEUM0KDJpbJ/siUr7Sp7I25?=
 =?us-ascii?Q?P4yPF4ME90aWETTI/Wajy7cEdaOzOd3+BWSMbM56mbJuaMcVmEo2qMBFedN1?=
 =?us-ascii?Q?ebNoGBDbL2g9sMUKo+iMikh3YoJY6qhCRv+9VF0VmCESEe6eP5pHwvJI5TY7?=
 =?us-ascii?Q?83e7xNsqODxV6qDyLiDhuLfWR9XbKB3Lt9/6A4Rd+pOOOiRmz6Itc1WBHHLq?=
 =?us-ascii?Q?dZ+niAAnj/jxfW4W4asL17oB3GxYnwOoECjcN/mp0CBBckYJdYvhlCGB8r0j?=
 =?us-ascii?Q?bPi0fiRod/5SJZUVerOhCD5rHoFa5MNww/TaCbv5IAJ7UJsZ0F2KSzKpgmpy?=
 =?us-ascii?Q?rje+P3oop6CsC74QCDTu2nNeHimmlBg/qP69gpIBPNxE4d0YsoCXucahukty?=
 =?us-ascii?Q?L/A6Nq5UpYJD6rL9Pq6WuklcxrrDL3Hc8+O6E2hAU/tkDwcdFBWyR0X4qCRD?=
 =?us-ascii?Q?lDtCxvV6ys1MajDf7dzVnJ8mzfOFVxGm94uV8IyM3yp8AHzH/0tpfMHg+005?=
 =?us-ascii?Q?kJfPPBmtP+GPIfrrn1wSht3mpNrZ04FX2OBTdnXh1Mjek0aJFJt96O4BIpO+?=
 =?us-ascii?Q?Sda6WelEMnt2Pmq4IEVLZwTl+xYBZQVPQOgYHIJrrzOSqhycw2TY0mORaUBl?=
 =?us-ascii?Q?UL0esL4gg3h6d176LZCAWgNqdwEW7y4snH9IbB8C+JmnSxBYVhstkomZIdRY?=
 =?us-ascii?Q?XdU8E7UgP97BaK8Hxe+CbRzUL235VoQL2ZS0CmBOC0S7fzf5DJdidOr2RmwV?=
 =?us-ascii?Q?AUwiDHa3BlqnAuD4fHLgYBxI4hDxD5Yr2KJXjN03fTC0uNsMRe95LUyQpyHt?=
 =?us-ascii?Q?zDkWwh32SWfQ1+q+DieENBFXEeKnVoTN76qZOPHUG4Kqs/Pf34bDSlrpTm7D?=
 =?us-ascii?Q?k3vLiBpUNIDZ5dXx1seU8FsjetWmn3CBNMdpMOVBw9Uz/hYvwvUsNjnOV0UO?=
 =?us-ascii?Q?pd38/HsbpfMds+1NJxhS46Qej78XY08/la20lyvCTKwrOoE/ZUjR78q1YtkO?=
 =?us-ascii?Q?/o4MxY5Lyd/t/H7y3c94L99n6QICG4Zkh/MpqwosCuHm4QCoV1Rcr3iOWD3Q?=
 =?us-ascii?Q?ns0ulbjkt287CwCSqyLj3+a5qx6WEskb1/hqJyppMCudYyqOU+CcDpYOe3LP?=
 =?us-ascii?Q?WwIwGU4k1CvyK7JPDtuRIPABgFufWizzadyWZNv9kBc4SBTakRdmPPYhXZDZ?=
 =?us-ascii?Q?91XG2EPvr9/Vl1DPOsSXRmh+emwu3zcgFaH6nDrNQMfEkVIc6RoJCA3yz4rS?=
 =?us-ascii?Q?Ply9lgTO+ezKrDxodUS5j+pEqvZWpTq/gEFd/eo/8CPCv2Mw/TQHal7+ZcxJ?=
 =?us-ascii?Q?UolnEsp5e6sx54qt5wt8H+XtR93f3Kze4GQFx5ur8WeqmbVRPJ3fBnGW6ONz?=
 =?us-ascii?Q?VXGdukvdMhtlisOkFt8F2MjCYy+EXglpiwuRCjd98C4ocGnn65bABmbK6uO9?=
 =?us-ascii?Q?zV3j+czva5LUVOI/cPdONVimiQlTOomTxAUyHqG1b0We2a0Vdy5ET/WVKiIj?=
 =?us-ascii?Q?q+oErUMiq+HOX8Wg/pXF47PRTFJY+RVK7ynE8RB/4XfpNNhkwsaYTHZeQkhY?=
 =?us-ascii?Q?8JTK9OOn1vvxcv4nLsM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SPNrka04o87PCxk1buKvbw1VS86osElpYdtFGRMkAKcMtiCyM8Qd1v5w4T+S?=
 =?us-ascii?Q?6bCsdBLQMG7Ynw9ppjEdPa6CQozgbWmAocs3W18DqVHenN2NB9vH4KHNztRq?=
 =?us-ascii?Q?PDV1cyzRiJnePSUbIxVFfWQg7snbRKIkisMQMF0o6bSDPZvBzLLcjHdbKdMa?=
 =?us-ascii?Q?46KUzB1+bXtORy0OGJQKYpVLVGnez7xdDyGeW5PwZq7i+6D31DbcxbqUMB8l?=
 =?us-ascii?Q?vsozFyIC2rQPMbKUK6e0lslMqoWmg3BxfPl4aB5unjLz0nRTtYc0F0VfBQSG?=
 =?us-ascii?Q?TWJnL+AfXo0vUn2gU+XBCTunKmFByLM/IGF9BsrEfTopVfU5TRS+vxHA3z/W?=
 =?us-ascii?Q?LxYZTef/HhZ8Zp9FTDyAOCD278vAjKADzKIua51+J47G6wURFUpG/7GftUgq?=
 =?us-ascii?Q?+IzMdQ4LykqCeRCdi3OvdphWS17M6dezntRgpbKrmQPqRVXHXEWitX/hD5Ef?=
 =?us-ascii?Q?HLzKSH29pYi2/Z0KGGOPhRIKO8d4YHYh+5b6s/FI/ylDp3X4jbM16kMFuEkh?=
 =?us-ascii?Q?kOKlXwDtc3Wjh7r2EKFMeHTdi9hWV5JRY80tNJRgWwY3Bpqxtq/ylIMvigCy?=
 =?us-ascii?Q?4FVQjlSN5N63HUa46/KTZBKX8OrtqvlLSpO3SKnWO91f0VkQT9iXR78CBp/s?=
 =?us-ascii?Q?HOUaphKGTrLYDlHaw7KoVHWRYY41ZS4Qz76ULL2lfwu8ps8rXVKWzA5jR9VL?=
 =?us-ascii?Q?UqO7mAksnYzIKVgKKDRfrWHRc9j0uJJsOqSBjzsltbygwQTgjkl9jjbjzDow?=
 =?us-ascii?Q?rleNPEi9IPPjTlDyFwQ5gNATlaPKuQahBGXqJYFWJ5R/wGtmXzi4jBQzenJD?=
 =?us-ascii?Q?O7RI1Q/b1GOAS1iHxXyfX7QorTml5EkC4EJ6Wy8f2SO9/rklD2ucGHcyteYd?=
 =?us-ascii?Q?eMIbWD0oTAhnuHVHU5JgGUzLzgup4QRi+v/KBccRUlBVKPuGE2iFlLL5Pkcc?=
 =?us-ascii?Q?TbMg85efBU0bAGaI8E7Fk5ThIUqSAEtyVgUgC988CJFKuoCgSdM9tgQ2c4v6?=
 =?us-ascii?Q?yykaK4oh4c+lwqUN/tJpYX/wRurpnVztmlOVIJJB1gQpf8IL06T06aIbPwTp?=
 =?us-ascii?Q?ENL+NQbabP2ebGLWhIQPANlzj9Wrchx9OqDtveRboRh/PFKEBUZCUs+IMLHj?=
 =?us-ascii?Q?Rhnh87KUdH2gNrzaE8mzjIsYzjjrLKXygAgMBu4qmBTC7e9zOdRySg3vXqZQ?=
 =?us-ascii?Q?KBR+Jbfhh/64KnaX/C+feXAMvdXf5arTit/2AOUyN1CLo/YCuetlY04nqCeA?=
 =?us-ascii?Q?v2IbAntRTanhuSt3+6+yk9G5Ga6YLrS6/SelLt3fsgzdq1lN7VKBfqs4N0lW?=
 =?us-ascii?Q?g+JuiWT0veKqEidlDJ/SiHLvMtPraawBDzJKd233SV4j0t99YNEYCV4g1NTY?=
 =?us-ascii?Q?qc25NQsnpkPhMnEMMDtPO/6jfWJPHA+J8IFosnXrt8XQtS7T7E3UqQkYxu3/?=
 =?us-ascii?Q?O5LdhtZr4wkDg2ComnUvlclnaNYf4r5cTla+AbUdg7hlooMo4/3c5imNVzBZ?=
 =?us-ascii?Q?ni1ppapxB26z9X3cL0SiSqqOWtvu4d20YrW5fkQcW/fcsvhrn0QY8UexRlcQ?=
 =?us-ascii?Q?dn0UYURdeaieE7gmHUBRp/5lQZYuhMcCo1Bj2fBXWn/z3yvKQTMIwIXCsFdy?=
 =?us-ascii?Q?P2kyEYrP7orEsv2Cjp4UwCfpvh9gehNoU5UJ/afvtStC2iFqZeQDumrzja43?=
 =?us-ascii?Q?VuPgCULgmohERjQJ33ktBQ93pKQNSFZXET9HsVnhAjwvJpEXnAmd0gJ2jbyt?=
 =?us-ascii?Q?t1OBz/JSdQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1efc587-880c-4293-99b5-08de5dde3192
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 19:56:43.0648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s6p1gja0HfXLHsG/GoGh/g+byuuIoXXj2FKlJyEyVlixCRnMFnCp6paVFCa/JQlxwgupJ+9ihuegc0HIVyXwvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7734
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

On Tue, Jan 27, 2026 at 08:37:25PM +0100, Michal Wajdeczko wrote:
> We shall resend H2G message after receiving NO_RESPONSE_RETRY reply,
> but since GuC dropped that H2G due to some interim state, we should
> give it a little time to stabilize. Wait before sending the same H2G
> again, start with 1ms delay, then increase exponentially to 256ms.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
> v2: use xe_sleep_exponential_ms helper (Michal)
>     don't wait full 1s (Matt)
> ---
>  drivers/gpu/drm/xe/xe_guc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2a3b057fc828..231844bce1e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -40,6 +40,7 @@
>  #include "xe_memirq.h"
>  #include "xe_mmio.h"
>  #include "xe_platform_types.h"
> +#include "xe_sleep.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf_migration.h"
>  #include "xe_uc.h"
> @@ -1397,6 +1398,7 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  	struct xe_reg reply_reg = xe_gt_is_media_type(gt) ?
>  		MED_VF_SW_FLAG(0) : VF_SW_FLAG(0);
>  	const u32 LAST_INDEX = VF_SW_FLAG_COUNT - 1;
> +	unsigned int sleep_period_ms = 1;
>  	bool lost = false;
>  	u32 header;
>  	int ret;
> @@ -1479,6 +1481,8 @@ int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
>  
>  		xe_gt_dbg(gt, "GuC mmio request %#x: retrying, reason %#x\n",
>  			  request[0], reason);
> +
> +		xe_sleep_exponential_ms(&sleep_period_ms, 256);
>  		goto retry;
>  	}
>  
> -- 
> 2.47.1
> 
