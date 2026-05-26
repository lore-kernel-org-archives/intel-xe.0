Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392D6CD6E40
	for <intel-xe@archiver.kernel.org>; Tue, 26 May 2026 21:53:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F097110E275;
	Tue, 26 May 2026 21:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSzUWAIS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0044710E275
 for <intel-xe@lists.freedesktop.org>; Tue, 26 May 2026 21:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779832431; x=1811368431;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=owH8gn0pbdE4/Kz5lh2eWq5dWMvWbf/KgBYR0ZzdnMk=;
 b=GSzUWAIS9bfMRhU3+04xtt6G57xLKmmXxQ6geCPmuSxL0cFvBpbEh+LO
 hHavqYzgBjNy1/xnauxDLvzMHihmfFJo/cGv99JOmBtZr0EwaDxs58FjQ
 R5AQ2QkAbhdKwlKmhn8ebGYQdTyE3aK9nttA0dlyOtUZOxv13B3YSuyon
 EX0l/N2J96FRkmrIi05x7AWkF9aOK05S6uwrjLR5mI40oP5pDI8e1IoUu
 EYCiC8Ea4NQ0vnx8zKbEpIFpthm/Dj7PqgeKsL8O25Ct9cDagUhGNJ5T1
 rsHfx+0am+xMhGNVEEFII79DsVMM/6PBuvu6xbaYxzOKUijNBbS6AP7E0 w==;
X-CSE-ConnectionGUID: yx3X9qcbQxyJMECho/jyHw==
X-CSE-MsgGUID: JVSJAbxLSyS3nEb8UxqLBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="80691097"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="80691097"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 14:52:39 -0700
X-CSE-ConnectionGUID: JeS9/rjtSCe64bugfgLZFQ==
X-CSE-MsgGUID: Zmw4Uo8FT8mbRO/MjQre+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="241884728"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 14:52:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 14:52:37 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 26 May 2026 14:52:37 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 26 May 2026 14:52:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpZdo0dxAhUxfY3mSiUreNjKFZ7dEhHWtJfdbNcsS4UFv7t0esOKUBBZesbY7E2/++sJD+mU1Zrvk6NVln17UYTPBvb/Zo1VoaFgjtt7LhK2V5DOY6+6owUtSJePua7ZaFB6yuZapn7OlORjq5b5/Kn4tZO+eL0H3FFafQdwdS79FGniNF4tYviMmo7xxrHIKwkf6plow3N8HudtNVMe37L3vtD64PBm+hg1gqq4AQqTGYdbVIpTMC5zqTO2gxou5Ld4Nl1VUraV1mGtWTEWdHtCwetlTRQ17w4lJNvj6hSmS8QAvSV8kOr3PxTJHlinWS6jiAKG+vPr/n82HOYm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hln0FEpmOH021HLF7XCTMkljvEIU+mtdMN7tIJ/JJoE=;
 b=a0V9hTQZ+03NsEXmLz4wfZSS5igBrc5pSIat9OoXJAcXZ+iXYW/UVZyYwVyAl4FtjbyEF4OzghzV1osI3yKtFoSlhRjJX8F7B2X9mRjIaX5AYOLEOyHHTgMSNUsmyV9lGo+rw+Dm7RdpMUDUvziRxYWIe9xCEhhmALAB3e5aysesFV+ISCppNSINJB/clW8b3EJkPYl8P4ZH1NWuk5h7MGAMjitvRP0W3as0rKTXukZrpgZTBIlOw0byMvg4BQAUFka/AW/HoDOaQciI5pBwmffZUKtVGyWmwMho6/K/AJDOoJyp3v6+zKU2EgXV7s360s6xx/cCDdCSlpj56I/FRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 21:52:33 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.21.0048.019; Tue, 26 May 2026
 21:52:33 +0000
Date: Tue, 26 May 2026 14:52:31 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe: Restore IDLEDLY regiter on engine reset
Message-ID: <20260526215231.GA6214@mdroper-desk1.amr.corp.intel.com>
References: <20260522163531.1365540-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260522163531.1365540-2-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CO1PR11MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a655e5-c862-4b6b-62ca-08debb711760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: IVG80md5D5/yB3ExVt3ug1q7a00ISOEMcT259u9Amc/GS3KjPsWhJ/Vc4cUl+VkxYqnmW4y6cN5VNuwaM+t2Bq+SaeORxqpaT0q0edTQynlG2MwHUCb8k/Y73wCfIYnmxSI198ZcpnoMrrzPntv8QImx16x1HqHKWKK4MUTOsC0rtcfYbqK/W0Tm/x6Rwf3WyQFndvAIctoaraL7IsjAXac9hpRLBzmeF5z+nBC1bBfhh7nMf3b+TicrcsTOIu/FLigimUqVsUWHV9g/7TBWVVrq23xcpm0M3MYWQeMvX8pJiWt5NT6sNQrcBD+8OYwQLd0YzkT3TwfMTYdu+CwWmIHduOrYhGcjUFzPN5Dl6UZyM4sUzIfNjPgZcVjCzs+WDQzqjW9lLa0o4x03NyQeKE0ACZvb7qMzjuE+3T7KLpOsVwDjrQ3zaAfsepPueCPnoCNiaj5l90rCKGiiv3UgnfAaUNUEkrDIvxgp7Km23wRe21PjLqM4G3QNbOCfRFYQAqVO/6KnD53MI00/E/8flPaYmrqgOWavLK52My8ehNeS7qKfMEQTObYYl3F7+RCBDhE/4eBKl/PqN5UEYTvPLNUW7FW++Z7slNzKXq5/rINGamaAX9TEb5y+uJV6C/Qd46DALYOqcM9udST84tJ/OAjMUiUz5RQ75+s0a2DItUlypKcKCyNWvaCHJKGtTNxe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f5WvtGmW6PD0cY1Uk9rR+ElVx9TMyp7HtxJxEcupimG7iiBRGEv49K+D0/at?=
 =?us-ascii?Q?YbXLHVaRVOPo2Odu5rLTuGjVooDjjW6vHXZZvUk7N/xBVfUdX+ut6BBEci48?=
 =?us-ascii?Q?Ay/PgG+9HeUlY/+dZt4fsa1+MCH6R0JugDkJ7MqkRVxJk2wgpgpvhV06evUW?=
 =?us-ascii?Q?rNBYSXlYuE7W29CmUPE1ort1im5XBIF6CcbmDWTrsZTQa3zfz9T9lzex7TFL?=
 =?us-ascii?Q?20G9bdQ4CzUSHWReYVFfAObAsl+rzPksD2rcdbRkRu/4lVRdJpcKF2cAXUcD?=
 =?us-ascii?Q?3HmRhhVEuMLZCsxxUJHrmTivA+ndoILHc9+EHMOHU4HP84BVm16cbe43Jnn1?=
 =?us-ascii?Q?0EcdUiZwW8n62FYR+n6mpTn2hB/vT09Sdk8JMwyi7cmi51vzfK5kPFlUB6LK?=
 =?us-ascii?Q?Qkq52ACXJVwLRIaUNGOzevt48cJ1F9AH1hV8UtcGdmPYsXdw+mQS9V3/3Dce?=
 =?us-ascii?Q?cR2cKcimsSO0i0jV/hs+5847jhvjuZI2VSzygZEFHgxdfnFJXs+Crvjie0/7?=
 =?us-ascii?Q?MY4G1X52HKqklRwLcdwifXiKmkaqTo37Ea3LtBEy8tUtpPanymud5+irVejA?=
 =?us-ascii?Q?ce5tycG4g6rbRjr9QQ8psKmS8t+sp3/xpCadxKskK05oDax9ZSAwvCIOIwSp?=
 =?us-ascii?Q?Oq7Nk72+RJZwqGGWbhLEmyAEwy6Wf4fNRUJwfToGXP21+F8vg07miYr4g99W?=
 =?us-ascii?Q?NACxLWOKHOFmUQ3SsPYNHr3cnRwZhPzdFQzRy5yZdM3XyOiNb/c6acM0askh?=
 =?us-ascii?Q?lVc56dsst566/pLX+pp6YBdle8eYW/HM52NfNW7wk8F2wu1bCoRiaf5Kxzw8?=
 =?us-ascii?Q?i4DVcTMOW+7VYXmgwY6x9u1bFg/zB7oK2n7P+B5fMs1Z3r8K4bkDmCe3yPZI?=
 =?us-ascii?Q?2TI/w2dCS7ktP/jsazh5Di04pHvEWThyetgZC2T97afk19swsyQUkiVL8kGo?=
 =?us-ascii?Q?bjThW25SFKocVyORLKCkojjhU+JGPkBboka9BKA0cx6o5fGQhgx/jKL+1BZ4?=
 =?us-ascii?Q?4zdmz5lXW9g69u3JLwkKd4eB6vNj43EtXmgdwdGWYoO4jdgTex4xNtosDWK8?=
 =?us-ascii?Q?i0KidIg/dhozPhkEFhDsKP8lLwqNcfSr6r9hctrsyEnZcvbqYvNEbr2vVYPf?=
 =?us-ascii?Q?serCmcj/JQq87e8fZHTz+OVDYrOuWQ0vLwX5uMEtILeQzz7a+XWnL1WFmZqn?=
 =?us-ascii?Q?ujPOquxcu3ksPKE9RUQQRua+nP0FXfvAG+HTHcwmEJIa5xu/Yf7rCQnf/XYu?=
 =?us-ascii?Q?HJzWYmEa6FSY5zYNwVGLb/yrtIZt0L5yWgjlLs3nSvpMk6kgZhyktPEhDBh9?=
 =?us-ascii?Q?KFIfA9Df7IQU9mJHF0qQmeQrgBbbOP4a3StwVBI0DmI5KZURdi9SxIn8HRp7?=
 =?us-ascii?Q?5wjO/zHk0xqv7CQFAJnGlcAQSCWcEzDUREI5h4ZgFf5dGYqq6KxxHOD4VTSw?=
 =?us-ascii?Q?XD4rwb65fjeKqohhecHvHu+6F7hzT6NPgZklq5uW3+DFoJzQ9ZcvAiyqRVTu?=
 =?us-ascii?Q?3O7M3D2MgtKlZfRZMKcmcxORASqmp6kPf5e5fJiE3oxHaXQ+Eu+fXJDLTtCW?=
 =?us-ascii?Q?7eASm+kxiABWP2lZnLVSnXOV8p1vhoLiAUo2m7AFUhaml+0d3NboTZLuOxw1?=
 =?us-ascii?Q?9eD/zQ1xZ4LPm3pdCfUXY+xuz16FDl1SDEw2JHMXDGAyWQBpxoljWdn7Xsld?=
 =?us-ascii?Q?/7FYUF5/LZdd+sDlrrDJss4a2NP3nhPwPnpzIjXdd7g1M9OIqlAhCqacxz4D?=
 =?us-ascii?Q?G6smzgwyJo3Gn1lutsnAQMP+D58WGSY=3D?=
X-Exchange-RoutingPolicyChecked: F1o1ACp3DxUCKxrUFkUY2iVMR2nTQt/1HEj3X2jy05D+SHnhamK+D8/XRNMNs2AylP5nB4XNiV2OF/B9hJX5f+zlgHlXRD5bnoFelnEevmZGFcW7VdQ0FhdKJrrtaejdk87LrMPlp45BhuM8H7OLKPPtifnAxp0HVpsW4Gwbm61Ek8HcvdLao5+AWAHUKVCuBRBzfVYUOZbYsCWS0cLJ2fUn+cy2ANxlUJEhOyipITcqpues0kHQR2HlPYVS9NrkmIxgziBmp1LcGGJtp5UykLYNis2HkyM5hKlzroUdDiB+gaq35iGxGaGW/b7ibjxAc50MAC6mGS7QTmDKGGJKEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a655e5-c862-4b6b-62ca-08debb711760
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 21:52:33.3236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eGC4glajZG9NeLlG17iDUt3w7DvcUV/m8D4d6yOQRG27YM6VPZwXmnM2iXK4c5Ce/MQczz5IODrKVKAl02x/2oS7+yBrc9+KDyUTTYsbbk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4979
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

On Fri, May 22, 2026 at 10:05:32PM +0530, Balasubramani Vivekanandan wrote:
> Wa_16023105232 programs the register IDLEDLY. The register is reset
> whenever the engine is reset. Therefore it should be added to the GuC
> save-restore register list for it to be restored after reset.
> 
> Fixes: 7c53ff050ba8 ("drm/xe: Apply Wa_16023105232")
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Good catch.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> ---
> 
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index d15a17db3299..e9ceae17c794 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -787,6 +787,11 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		}
>  	}
>  
> +	if (XE_GT_WA(hwe->gt, 16023105232))
> +		guc_mmio_regset_write_one(ads, regset_map,
> +					  RING_IDLEDLY(hwe->mmio_base),
> +					  count++);
> +
>  	return count;
>  }
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
