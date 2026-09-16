Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107BCC982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 15:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC02910E3DA;
	Wed, 16 Sep 2026 15:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jgcH2fUj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A7910E3DA
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Sep 2026 15:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789573145; x=1821109145;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Yyka80948fM5am8iFUX6MXbLtCyaRpHew03pjx/VaWM=;
 b=jgcH2fUjt7oZ8q5hHn5ans+myP0GgxBccfSHMf+kVUixcopwviegxQGk
 3jeoBCxKsXbCfVor5oHKUoCM0GxsQaNIJWJ49S9CX4dpqxclUYOx1m8h7
 cefhGltonNAFcZTL/1CVgcglL+xLLiK9vXpKTfCH8f4187Yjd/6SFQs+y
 Y/+PQ+hmzfdJ+f0ooBoTHqYeNna0eq7rk62t5NdhAOYfHVARGpVNRcBBt
 M07bFFABupS66bF2jE+Egfy2z0dCdhVT/Y3uO/ECQHoBcwY3a3liJb1jv
 l4Yxer0/A17ahIE4nDWzvuv412iOf/TgG1vaDoxPvsvm991KufJIfdi+V A==;
X-CSE-ConnectionGUID: C5z3uCWNS/eiVU10q0sAlA==
X-CSE-MsgGUID: ltijgt3HQ8usejOiLN0oOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89709420"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89709420"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:39:05 -0700
X-CSE-ConnectionGUID: zoVwb+neRSazroSVAGN3YA==
X-CSE-MsgGUID: KWcsqy7DQK6RPNaITGDBCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271594199"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 08:39:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:39:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 08:39:03 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FESkEgCCttlAvCfhX3slsoCxVQCQcTf9JFPFjdwOl2pYmT0e2XOA+G07OyWWU/GfSkbhfHpZ14wPuk7q9xmDOHWy7kCwryYePOODwD8iSrcCWKDqvLSix6mC3N4IscEulMMWoYolc4iqySfiXoHyN5m3d8o/bwTip64zMGkZ5BKspkYToBaGoMmq2GDLqc76ZgkXicUF5JueEFOI5wg/TwLB4spasU0SZfOf8ev7ebgEtldkNL/5hRaMehgc5jA6n2Z8dqZjh0bBPVsCndOUijc1hjSX43bnsctyK8h0PRHJnc33BFTwxuCEokmNa3T6jJa8xEtIUTCQICEeG/FQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gxjQT8yviHxdDmVLMZM+/zeeHXUV2QaPLluIOALNpM=;
 b=k3xJpmlQ4tshu3X5WAQL9o33T36QDrDTLHIX8ESu+yhPp3oew/n/egb47YqonWAtgR9x+xIoQmf9zlYTCrlQe9Qj9ucv9DuI3CspwALcdUOynw4aMXNmhMZEf68PEFlPjCMPP/iWgwnRXGqBCnqMhL6QrhQdLcpHJ/SLVQnfsR/+znaPZPSxvMk7EIsIotsWqlZNiksKFmh8irxtKvHP7UAeMMsdTMFFJJHKnDh9qSY5VVXTtug1pF6JDNAPKkiagz3+hPJhO/UkVvA7spWiGUyAbeIzCCNQ3NtRu6faJ9MHxdd1w3CpNB0vkGe21UAkE0RtaEpOO57OIUp78O+BKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 15:38:51 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:38:50 +0000
Date: Wed, 16 Sep 2026 11:38:47 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <julia.filipchuk@intel.com>,
 <matthew.brost@intel.com>, Zhanjun Dong <zhanjun.dong@intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v9 2/2] drm/xe/guc: Compress GuC log and CTB dump with zstd
Message-ID: <aqq4B1mQGJxFxeJI@intel.com>
References: <20260915174840.531473-4-alan.previn.teres.alexis@intel.com>
 <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915174840.531473-6-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: SJ0PR13CA0198.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::23) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 40d211bf-9466-432e-8dba-08df14089b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|3023799007|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: FPCmuPvubhCIVFJekL79pOloM4bnAwLXnpxoQYmLEtC8Cy1bvTinkPW8eDeshgvJhYX34+Vsk9htoWtstFTcmXdcWVFn15uKLtGNKFaejIk3yIcp6NQJfpDmiG5tpsHIvd4KBZJfnqd2NsSpvpQYyiY94df4pwx+h7h3ggA+pwkP3lyzIgynsdCqRBNaNk9JHy2CB8QmObbGjmHkEDSWyUgzcgzDCMC9WHk0eXsQcBG4ZDqR2NCtpA2mAC450Y0z5QpDq/QZk7EtuvhdUMfmpJA9wyWr4guVfvRnZBIIl6EH9E1hVpXuGlyafKLbtYmkowN5fyTi0PklSuQ1y/xleBMMjshuMIsXLgMpxvt+ZFwn8A701aObkzno4PXIUWck30E7pzz883hzIti+shVzMa1iC4ZSu85rdkd/gAtI41T4oC+p5OwmFLERoK5tYvVyNuFy3PgCA7I+vlMSBL/qwN4ZS73pP8L7YJoa6pW3o5R0N4yHCdB7JL8SMxqd3oRl+oaD3t5DBePBrXljC6Rp1cqwDZ3afSdzrg52/Co5sywNH5LyOxMQU7tLb0e5Vru/cJDTkj3CMQmWMd/UImTTc/qv5i+Bc0gsTHtyRxRP4giUdzbE0MgusbTmb4DEYX9gkooONKunQ/kjpPZnd1jLQ6u0QrbNeHKS9iZud4U9phk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?OLq0mNpM/vhcE2C8eeuWghRcWznml8Bgqmj+iVVXzXha47OEyRiOjVN4Na?=
 =?iso-8859-1?Q?4UzwTsgt4Fyxf3UGCHOgrbY4GgJQy5STfpzr3ut9Uj+TRXvs3y0rfwuRS5?=
 =?iso-8859-1?Q?GNxRbBXPaOmU4vVKbickLFu/X6FIvscXz6GMy/4oLVBPa6bd+E1mJeA+q6?=
 =?iso-8859-1?Q?sx0jhl4/KDHIBNn7lMLjZaE7PEcBF2monOcQ9l0z8qEUHMB7nvRjxPx9In?=
 =?iso-8859-1?Q?SfEGMjktghjfIj/51m72RJZNS4NH6P1XwSgtsmrVQllqtIG2T7irJUWwCN?=
 =?iso-8859-1?Q?vNPwMNRnsoIYVds/IsGqlrdFBzrq40njX2XZgzlRbgqYnOUzwCTZECCGsd?=
 =?iso-8859-1?Q?um8us/AQTxGMNEWNHf2TAtmniCCnm6GBKEAQtwxPoRQqnNVz/4rh9yiQN0?=
 =?iso-8859-1?Q?X+9Fy3Y4TNEQxVxpZLTDSWil/VHextZPlDqOT+pVpljCn0Kiv/k3zO8lZN?=
 =?iso-8859-1?Q?ZOhy0wvSDdtuSzJ2oHe2KILSq7yAKFZhyc1uMiqjDb03xfMWBR0qb1Tzjy?=
 =?iso-8859-1?Q?byg6Y9BtvjY29gz9T3Xanmr99eKssP1O/Lrxkl5Smbwgn+EUt3VeAlRI8F?=
 =?iso-8859-1?Q?SfJVwMK9Kzr3Oz5Ds0wALZOBIJLs4lofX+kLdNou04/nwV3E1PJdtkrGqZ?=
 =?iso-8859-1?Q?17fPX5l7wn+fMNDToUpS0MMfGSXAXzN8HiUIruy4BEi/Ae5odJnUa8n+zW?=
 =?iso-8859-1?Q?+wfGPGs/sLZJFg5FKsCqDGlWAfxAqYyYhNqACbCZgyytGwoAvDLWeVFrQd?=
 =?iso-8859-1?Q?eXtbijQvrdq2VGedsgIdxXFFtfDWDhcpsSe1WyIXglXS0JssGiHf7uWbvN?=
 =?iso-8859-1?Q?AZVxkvfVRj5miDxAIUHbBZti1ubRtK+3RWkp4rq7IpONXDk9nc4zZTiTDB?=
 =?iso-8859-1?Q?cXldJpko1OJwoYs/tXmKqDVHTefjtqYNs4OOPf8mQn9snoyoXTVyhMKB0F?=
 =?iso-8859-1?Q?tLh2W5/0YVQOp7G23OZ3X5UzsAGb8s4Bcr7t0u2tBQ3ZAyaUGh6/yR1bq2?=
 =?iso-8859-1?Q?p3CnEgiMHzlNQ5LTeZSIPUyynZe4vVQhoGgu5RVZ7a32z37T+YsVJEJ2Ua?=
 =?iso-8859-1?Q?3zwjjSI1YvDKO8ttRnydiFs6Wydt1KwLsgXWvl+FFaPBmdCpJYLSLOYvd4?=
 =?iso-8859-1?Q?uiJ1s94745HWtjzdsUFEhi9Jc4JMwYpmo5/6P80PIJ+jFQhfe0/3v9eh/u?=
 =?iso-8859-1?Q?g8HMiaJlhBJNOPlmlVHa4l1rZt0ZpclsNI7lPDxQCqBYdHlo0yFbeyeXBM?=
 =?iso-8859-1?Q?KPLqJP0FZOzfNz/1FLGpVT41kuDTpSoi8HP6vyrGbe+BD7djrVUhFCeI/R?=
 =?iso-8859-1?Q?XETtbHqbBHOFuH+2bsnXjiofroWqYpPoQi2paZUdkuM7jpmcWwgbxVJEkl?=
 =?iso-8859-1?Q?n7nW5gQMls04uzcMX1M2+CEyxzFBsKFEWLUHbuCbtJqbnCDQ8OJQ05k3JI?=
 =?iso-8859-1?Q?NLXWc6kVmHFNl6eclCQRK37/4ePzFn3SzeBxEilkYTQgFnhWNh80MbiTC5?=
 =?iso-8859-1?Q?KYT71FXZffc/0nk3SlYZlFuBNtgtv1DjftjutDN6si4VVmaz4WNBv+NWYK?=
 =?iso-8859-1?Q?FhV2B3cW6y3KgNSR9uOvKw3xRB1M/2pG/nEwij4Hsgy+gOpYWYTEjYAy+D?=
 =?iso-8859-1?Q?SjNpFmOXbAyTxH+ZG56cUH3uzhF/4HR1pypyWX+14uSLVSBZS2Yunf3xVJ?=
 =?iso-8859-1?Q?E/e+43Y1L+HY4mfPCoYHNM3cB7ehP2VTAn1f7r0TadY3DLHLgeFbRRztSE?=
 =?iso-8859-1?Q?vUxGW9X9s7FQ/SU9AnXMwV0Ib8djBDCXvtUqleAPNSptxvsU3UxgsHDrfn?=
 =?iso-8859-1?Q?C+AHEHM7BQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: BD9aCFLL9uVqDbTSBr/fM5bHNBAK2M0lniBG/gK4tGunqr8pcOLeMw1y8A4QsiinxgyMJk7Uwz6yUpCc01kU9JcERUyNpcinvLmDP/Kwt+sh/0Nk+3S8r9HeB3sHbP5eZrpBARlcUrGCbIcJut4TQ6/s/50wIcOIOBAnEjaU4Znro88J4Lm/uXn7QTxcLWThSG+8YOu1jbLW1GhAFSGUhtcKgoRqMjDydoByWQZ4C/+7xZyf/p7rejbu+RAZ4oDvNx+yZaLD7bMFwVyLHT/WqNyCc2ALMO+8soH0PK/sUsp4xEExz4mW2QXPjXZnQ1mX+k2DtgpMlKEjqOqonjoXiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d211bf-9466-432e-8dba-08df14089b32
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:38:50.8738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsfRtty7rI2fkf2XY0czL01CM/5KDf1r+nF8tr+orfFreHXWJQ3tkb+O+byNTk4p6g67S10R4dLp2q69x/F1dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
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

On Tue, Sep 15, 2026 at 10:48:40AM -0700, Alan Previn wrote:
> From: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> With default settings, GuC log is 8MB in size and
> dumping the log is time-consuming. In debugging scenarios,
> dump-to-dmesg suffers truncation loss because CI's size limit is 2MB.
> Additionally, if also forwarded to serial console, it takes several
> minutes. In use-case of continuous error+log collection over extended
> period, we pressure CI's allocated storage. Thus, compress the
> GuC log data dump to address these issues and multiply any benefits
> from a future upgrade in CI's size limits.
> 
> Replace the raw ascii85 dumps of GuC log snapshots with a
> zstd-compressed ascii85 stream and reuse the same helper for CTB
> snapshot output.
> 
> Use zstd streaming with the default compression level of 3 and an
> estimated source size of 0 so the compression workspace stays bounded
> even for multi-megabyte logs.
> 
> Add a new Kconfig option DRM_XE_COMPRESS_DUMP to control whether
> GuC log and CTB dumps are compressed with ZSTD. This allows users to
> choose between reduced dump sizes and lower memory usage.
> 
> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Since no one had the willigness to actually review this yet, I asked AI some help

> ---
>  drivers/gpu/drm/xe/Kconfig          |  15 +++
>  drivers/gpu/drm/xe/xe_devcoredump.c |   4 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c      |  19 ++--
>  drivers/gpu/drm/xe/xe_guc_ct.h      |   4 +-
>  drivers/gpu/drm/xe/xe_guc_log.c     | 161 +++++++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_guc_log.h     |   9 +-
>  6 files changed, 183 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b91..18a682a44b31 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -33,6 +33,7 @@ config DRM_XE
>  	select ACPI_WMI if X86 && ACPI
>  	select SYNC_FILE
>  	select CRC32
> +	select ZSTD_COMPRESS if DRM_XE_COMPRESS_DUMP

There's a circular/reverse dependency here.

Please move the select ZSTD_COMPRESS into DRM_XE_COMPRESS_DUMP
like DRM_XE_GPUSVM selects DRM_GPUSVM...

>  	select SND_HDA_I915 if SND_HDA_CORE
>  	select CEC_CORE if CEC_NOTIFIER
>  	select VMAP_PFN
> @@ -101,6 +102,20 @@ config DRM_XE_PAGEMAP
>  
>  	  If in doubt say "Y".
>  
> +config DRM_XE_COMPRESS_DUMP
> +	bool "Enable ZSTD compression for error dumps"
> +	depends on DRM_XE
> +	default y
> +	help
> +	  Enable this option to compress GuC log and CTB dumps with ZSTD
> +	  compression. This can significantly reduce the size of error dumps
> +	  but requires additional memory for compression workspace.
> +
> +	  Disable this option if you want to save memory or prefer uncompressed
> +	  error dumps for debugging.
> +
> +	  If in doubt say "Y".
> +
>  config DRM_XE_FORCE_PROBE
>  	string "Force probe xe for selected Intel hardware IDs"
>  	depends on DRM_XE
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 5f2b90b18f97..27473c25aad2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -115,9 +115,9 @@ static ssize_t __xe_devcoredump_read(char *buffer, ssize_t count,
>  	drm_printf(&p, "\tTile: %d\n", ss->gt->tile->id);
>  
>  	drm_puts(&p, "\n**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(ss->guc.log, &p);
> +	xe_guc_log_snapshot_print(ss->guc.log, &p, ss->gt);
>  	drm_puts(&p, "\n**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(ss->guc.ct, &p);
> +	xe_guc_ct_snapshot_print(ss->guc.ct, &p, ss->gt);
>  
>  	drm_puts(&p, "\n**** Contexts ****\n");
>  	xe_guc_exec_queue_snapshot_print(ss->ge, &p);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 5c4733da385c..10a8cf327036 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -2186,11 +2186,12 @@ struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct)
>   * xe_guc_ct_snapshot_print - Print out a given GuC CT snapshot.
>   * @snapshot: GuC CT snapshot object.
>   * @p: drm_printer where it will be printed out.
> + * @gt: GT structure for error reporting
>   *
>   * This function prints out a given GuC CT snapshot object.
>   */
>  void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
> -			      struct drm_printer *p)
> +			      struct drm_printer *p, struct xe_gt *gt)
>  {
>  	if (!snapshot)
>  		return;
> @@ -2204,11 +2205,10 @@ void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot,
>  		drm_printf(p, "\tg2h outstanding: %d\n",
>  			   snapshot->g2h_outstanding);
>  
> -		if (snapshot->ctb) {
> -			drm_printf(p, "[CTB].length: 0x%zx\n", snapshot->ctb_size);
> -			xe_print_blob_ascii85(p, "[CTB].data", '\n',
> -					      snapshot->ctb, 0, snapshot->ctb_size);
> -		}
> +		if (snapshot->ctb)
> +			xe_guc_print_blob(gt, p, "[CTB]", "[CTB].data",
> +					  &snapshot->ctb, 1,
> +					  snapshot->ctb_size, snapshot->ctb_size);
>  	} else {
>  		drm_puts(p, "CT disabled\n");
>  	}
> @@ -2242,9 +2242,10 @@ void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot)
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb)
>  {
>  	struct xe_guc_ct_snapshot *snapshot;
> +	struct xe_gt *gt = ct_to_gt(ct);
>  
>  	snapshot = guc_ct_snapshot_capture(ct, false, want_ctb);
> -	xe_guc_ct_snapshot_print(snapshot, p);
> +	xe_guc_ct_snapshot_print(snapshot, p, gt);
>  	xe_guc_ct_snapshot_free(snapshot);
>  }
>  
> @@ -2342,10 +2343,10 @@ static void ct_dead_print(struct xe_dead_ct *dead)
>  	drm_printf(&lp, "\tTile: %d\n", gt->tile->id);
>  
>  	drm_puts(&lp, "**** GuC Log ****\n");
> -	xe_guc_log_snapshot_print(dead->snapshot_log, &lp);
> +	xe_guc_log_snapshot_print(dead->snapshot_log, &lp, gt);
>  
>  	drm_puts(&lp, "**** GuC CT ****\n");
> -	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp);
> +	xe_guc_ct_snapshot_print(dead->snapshot_ct, &lp, gt);
>  
>  	drm_puts(&lp, "Done.\n");
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index 3ddc665ab84a..f950d68a060a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -12,6 +12,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct);
>  int xe_guc_ct_init(struct xe_guc_ct *ct);
> @@ -26,7 +27,8 @@ void xe_guc_ct_flush_and_stop(struct xe_guc_ct *ct);
>  void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>  
>  struct xe_guc_ct_snapshot *xe_guc_ct_snapshot_capture(struct xe_guc_ct *ct);
> -void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p);
> +void xe_guc_ct_snapshot_print(struct xe_guc_ct_snapshot *snapshot, struct drm_printer *p,
> +			      struct xe_gt *gt);
>  void xe_guc_ct_snapshot_free(struct xe_guc_ct_snapshot *snapshot);
>  void xe_guc_ct_print(struct xe_guc_ct *ct, struct drm_printer *p, bool want_ctb);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index 538d4df0f7aa..aaeb0f76af30 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -6,6 +6,9 @@
>  #include "xe_guc_log.h"
>  
>  #include <linux/fault-inject.h>
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +#include <linux/zstd.h>
> +#endif
>  
>  #include <linux/utsname.h>
>  #include <drm/drm_managed.h>
> @@ -225,16 +228,148 @@ struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log,
>  	return snapshot;
>  }
>  
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +static void xe_guc_print_blob_compressed(struct xe_gt *gt, struct drm_printer *p,
> +					 const char *length_label, const char *data_label,
> +					 void **chunks, int num_chunks,
> +					 size_t chunk_size, size_t total_size)
> +{
> +	zstd_parameters params;
> +	zstd_cstream *cstream;
> +	zstd_out_buffer outbuf;
> +	size_t wksp_size, dst_size;
> +	size_t remain, ret;
> +	void *wksp = NULL;
> +	char *dst = NULL;
> +	int i;
> +
> +	/*
> +	 * Pass 0 as estimated_src_size to use zstd level-3 defaults
> +	 * (windowLog=18, 256KB window). Passing the full total_size would
> +	 * cause zstd to inflate windowLog proportionally (e.g. windowLog=24
> +	 * for a 19MB log), making the workspace tens of MB.  With 0, the
> +	 * workspace stays ~1.5MB, well within kmalloc limits.
> +	 */
> +	params = zstd_get_params(3, 0);
> +
> +	wksp_size = zstd_cstream_workspace_bound(&params.cParams);
> +	wksp = kvzalloc(wksp_size, GFP_KERNEL);
> +	if (!wksp)
> +		goto err;
> +
> +	dst_size = zstd_compress_bound(total_size);
> +	dst = kvzalloc(dst_size, GFP_KERNEL);
> +	if (!dst)
> +		goto err;
> +
> +	cstream = zstd_init_cstream(&params, 0, wksp, wksp_size);
> +	if (!cstream) {
> +		xe_gt_err(gt, "failed to init zstd cstream\n");
> +		goto err;
> +	}
> +
> +	outbuf.dst = dst;
> +	outbuf.size = dst_size;
> +	outbuf.pos = 0;
> +
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		zstd_in_buffer inbuf = { .src = chunks[i], .size = size, .pos = 0 };
> +
> +		while (inbuf.pos < inbuf.size) {

LLM:
unbounded loop - the Sashiko finding is real
"
include/linux/zstd.h:504 - "Guaranteed to make some forward progress if `input`
and `output` are not empty." Once outbuf.pos == outbuf.size, forward progress is
explicitly NOT guaranteed and this spins forever. zstd_compress_bound() should
prevent output exhaustion here (single frame, no intermediate flushes), so it is
unreachable in practice - but a hard lockup in an error-dump path is bad enough
that a `if (outbuf.pos == outbuf.size) goto err;` guard is worth the one line.
"

> +			ret = zstd_compress_stream(cstream, &outbuf, &inbuf);
> +			if (ZSTD_isError(ret)) {
> +				xe_gt_err(gt, "zstd_compress_stream failed: %s\n",
> +					  ZSTD_getErrorName(ret));
> +				goto err;
> +			}
> +		}
> +		remain -= size;
> +	}
> +
> +	do {
> +		ret = zstd_end_stream(cstream, &outbuf);
> +		if (ZSTD_isError(ret)) {
> +			xe_gt_err(gt, "zstd_end_stream failed: %s\n",
> +				  ZSTD_getErrorName(ret));
> +			goto err;
> +		}
> +	} while (ret > 0 && outbuf.pos < outbuf.size);

LLM:
"
include/linux/zstd.h:535 - "zstd_end_stream() must be called until it returns
0, meaning all the data has been flushed and the frame epilogue has been
written." The outbuf.pos < outbuf.size term lets the loop exit with ret > 0,
emitting a frame with no epilogue, and the code then prints "Algo: ZSTD" as if
it succeeded. Either loop until 0, or treat "output full before 0" as an error.
"

> +
> +	drm_printf(p, "%s.length: 0x%zx -> 0x%zx Algo: ZSTD\n",
> +		   length_label, total_size, outbuf.pos);
> +	xe_print_blob_ascii85(p, data_label, '\n', dst, 0,
> +			      DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32));

LLM:
"DIV_ROUND_UP(outbuf.pos, sizeof(u32)) * sizeof(u32) can read up to 3 bytes past
dst if outbuf.pos == dst_size and dst_size is not 4-aligned. In practice it is
unreachable: snapshot->size is xe_bo_size() (page-aligned) and ctb_size is a sum
of bo sizes, so compress_bound(size) = size + size/256 stays 4-aligned. But
don't rely on that - kvzalloc(round_up(dst_size, sizeof(u32))) settles it
permanently."

> +	goto out;
> +
> +err:
> +	drm_printf(p, "%s.length: 0x%zx Algo: ERROR (compression failed)\n",
> +		   length_label, total_size);

__xe_devcoredump_read() is called twice, once to get the size and the second time
to print the output in a given buffer.
If the compression fails in the first pass, the size will be different and not
enough.

And worse part it seems that in this case of failure we now lose the guc log.
So in the actual/real second pass we will not get the right log anyway.

The AI suggestion is to cache the compressed guc log. But of course, if we
cache we need to be careful to ensure it is accurate/valid.

> +out:
> +	kvfree(dst);
> +	kvfree(wksp);
> +}
> +#endif
> +
>  /**
> - * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> - * @snapshot: a snapshot of the GuC log
> - * @p: the printer object to output to
> + * xe_guc_print_blob - Print binary data (compressed or uncompressed) as ascii85
> + * @gt: GT structure for error reporting
> + * @p: drm_printer for output
> + * @length_label: label prefix for the length/metadata line (e.g. "[LOG]" or "[CTB]")
> + * @data_label: label for the ascii85 blob (e.g. "[LOG].data" or "[CTB].data")
> + * @chunks: array of pointers to source data chunks
> + * @num_chunks: number of elements in @chunks
> + * @chunk_size: nominal size of each chunk; the last chunk may hold fewer valid bytes
> + * @total_size: total uncompressed byte count across all chunks
> + *
> + * If CONFIG_DRM_XE_COMPRESS_DUMP is enabled, compresses @total_size bytes using
> + * zstd level-3 streaming compression and prints the result via @p using ascii85
> + * encoding. Otherwise, directly prints the uncompressed data.
> + * On failure the function returns without printing the data blob.
>   */
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p)
> +void xe_guc_print_blob(struct xe_gt *gt __maybe_unused, struct drm_printer *p,
> +		       const char *length_label, const char *data_label,
> +		       void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size)
>  {
> +#if IS_ENABLED(CONFIG_DRM_XE_COMPRESS_DUMP)
> +	xe_guc_print_blob_compressed(gt, p, length_label, data_label,
> +				     chunks, num_chunks, chunk_size, total_size);
> +#else
>  	size_t remain;
>  	int i;
>  
> +	drm_printf(p, "%s.length: 0x%zx Algo: RAW\n", length_label, total_size);
> +
> +	/*
> +	 * Print each chunk directly without merging into a single buffer.
> +	 * xe_print_blob_ascii85() supports multiple calls - use suffix=0
> +	 * for all but the last chunk to omit the newline between chunks.
> +	 */
> +	remain = total_size;
> +	for (i = 0; i < num_chunks && remain; i++) {
> +		size_t size = min(chunk_size, remain);
> +		const char *prefix = i ? NULL : data_label;
> +		/* Add suffix only on the last chunk */
> +		char suffix = (remain == size) ? '\n' : 0;
> +
> +		xe_print_blob_ascii85(p, prefix, suffix, chunks[i], 0,
> +				      DIV_ROUND_UP(size, sizeof(u32)) * sizeof(u32));
> +		remain -= size;
> +	}
> +#endif
> +}
> +
> +/**
> + * xe_guc_log_snapshot_print - dump a previously saved copy of the GuC log to some useful location
> + * @snapshot: a snapshot of the GuC log
> + * @p: the printer object to output to
> + * @gt: GT structure of the GuC log
> + */
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt)
> +{
>  	if (!snapshot) {
>  		drm_printf(p, "GuC log snapshot not allocated!\n");
>  		return;
> @@ -248,16 +383,9 @@ void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_
>  	drm_printf(p, "GuC timestamp: 0x%08llX [%llu]\n", snapshot->stamp, snapshot->stamp);
>  	drm_printf(p, "Log level: %u\n", snapshot->level);
>  
> -	drm_printf(p, "[LOG].length: 0x%zx\n", snapshot->size);
> -	remain = snapshot->size;
> -	for (i = 0; i < snapshot->num_chunks; i++) {
> -		size_t size = min(GUC_LOG_CHUNK_SIZE, remain);
> -		const char *prefix = i ? NULL : "[LOG].data";
> -		char suffix = i == snapshot->num_chunks - 1 ? '\n' : 0;
> -
> -		xe_print_blob_ascii85(p, prefix, suffix, snapshot->copy[i], 0, size);
> -		remain -= size;
> -	}
> +	xe_guc_print_blob(gt, p, "[LOG]", "[LOG].data",
> +			  snapshot->copy, snapshot->num_chunks,
> +			  GUC_LOG_CHUNK_SIZE, snapshot->size);
>  }
>  
>  static inline void lfd_output_binary(struct drm_printer *p, char *buf, int buf_size)
> @@ -598,12 +726,13 @@ void xe_guc_log_print_dmesg(struct xe_guc_log *log)
>  void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  {
>  	struct xe_guc_log_snapshot *snapshot;
> +	struct xe_gt *gt = log_to_gt(log);
>  
>  	drm_printf(p, "**** GuC Log ****\n");
>  
>  	snapshot = xe_guc_log_snapshot_capture(log, false);
> -	drm_printf(p, "CS reference clock: %u\n", log_to_gt(log)->info.reference_clock);
> -	xe_guc_log_snapshot_print(snapshot, p);
> +	drm_printf(p, "CS reference clock: %u\n", gt->info.reference_clock);
> +	xe_guc_log_snapshot_print(snapshot, p, gt);
>  	xe_guc_log_snapshot_free(snapshot);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.h b/drivers/gpu/drm/xe/xe_guc_log.h
> index 4649a260755e..3e97647ee8b5 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.h
> +++ b/drivers/gpu/drm/xe/xe_guc_log.h
> @@ -11,6 +11,7 @@
>  
>  struct drm_printer;
>  struct xe_device;
> +struct xe_gt;
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG_GUC)
>  #define XE_GUC_LOG_EVENT_DATA_BUFFER_SIZE	SZ_16M
> @@ -59,7 +60,13 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_lfd(struct xe_guc_log *log, struct drm_printer *p);
>  void xe_guc_log_print_dmesg(struct xe_guc_log *log);
>  struct xe_guc_log_snapshot *xe_guc_log_snapshot_capture(struct xe_guc_log *log, bool atomic);
> -void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p);
> +
> +void xe_guc_print_blob(struct xe_gt *gt, struct drm_printer *p, const char *length_label,
> +		       const char *data_label, void **chunks, int num_chunks,
> +		       size_t chunk_size, size_t total_size);
> +
> +void xe_guc_log_snapshot_print(struct xe_guc_log_snapshot *snapshot, struct drm_printer *p,
> +			       struct xe_gt *gt);
>  void xe_guc_log_snapshot_free(struct xe_guc_log_snapshot *snapshot);
>  
>  static inline u32
> -- 
> 2.43.0
> 
