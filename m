Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8663C4452B
	for <intel-xe@archiver.kernel.org>; Tue, 21 Jul 2026 22:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E3F10EBAC;
	Tue, 21 Jul 2026 22:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HvjpJsvB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1634510EBAA
 for <intel-xe@lists.freedesktop.org>; Tue, 21 Jul 2026 22:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784673791; x=1816209791;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eOiYDs4igX7mpnGTKj3RV+QvrnhhuKhZY8yis0hCuME=;
 b=HvjpJsvBYqVILSKbjhPXmwzcpSOSkb3g3mHpjv6lLx4aVOQQz+pgqKwl
 49SQe7QRQucmi5NAHqWuQ1olSrOdV5zy+aQcHNQ26XTpBE6pgKRC1azeh
 2ffGzoW0eo5DyKUSpYEtuddO1oqfMbROkcKuPtQmZezCvT7ourkpiDamF
 fANb+gmaUvwPLFtgxeSp+DotMMi4YtZhAaPqgfbyeGRw6ZWrzFsApV/la
 HyXJBcgQA6Od7El+5a4XyI8Pul5dRMiJiAciz8hAuZHDZ/9rc31rhLGqP
 K3H8aJkbPA5EAV+pUdp5vFWw7NUE4lAomyGhQKp4PJRXDrrpRtoOps0iG w==;
X-CSE-ConnectionGUID: hI6E/PlwTkWxGPUmOhsCjw==
X-CSE-MsgGUID: GZn+RnRCQs6Vked79A+o0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108083167"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; d="scan'208";a="108083167"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 15:43:11 -0700
X-CSE-ConnectionGUID: 3uJpZkc4Sv60Q7qhmwQTdw==
X-CSE-MsgGUID: hcRdg0/QR+C74dCRgNb9pA==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 15:43:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 15:43:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 21 Jul 2026 15:43:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.60) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 21 Jul 2026 15:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EikvzjUC9XTTEFBwerfd3sec4aTTLKnsPTSdAb0MrSz14VeZi4tzdDh/v+Kj0KpqsDa+Wp1n+1oRfGvz7eOGEaK7tcTnZznoWPjmIn3gFFXQMnLERYvh3eW0q+ZjjrlZdwLoQdbwPMeFolBbLQ1c+a1MHBhIOROzJbVl5q1aHEKaK0ALQ5EuAtkukfj5RasZ8ZWAX7A1MIO4M+UFCy5Zdwtl47CVQ6TyJMVZrL2Gnv2Kvo/HsZsutsvQWWhUFLwq+LYaTZ/QQlXjaZQVU/4GBmh0CFu3UNjcsfhFAV1hofmiBmSmMd8RyoH6bP2sMRWBVsPoZBb/7P2NqgpPnDLtmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5worPPFu3kVWccBsEqG5GHHKnHaYw/ORy9SJz0f4PLQ=;
 b=pg3NIXLu5WZZajVYsR5rUFuWv5bDxY7UGUMkr26nKBC7WcP7UZ6sb27JDDKGw+lJmbmvtPOm3y9+AlV1PdW0+nXUOWsw/3KgyxX9lRHilQKRBFT5T48UqTacdFlN/6pZ/nu8PVyb+n5A1sm5pUwQ4yPJiUxfOTXo1tF+fOMYnoHL+6gKn83/EUYYYfgKbesbHm+ZDJq9rnnFW01v7/FUGLZBRZWTfLtMDuO6scx/Ts0SsP1E2IVmFQT/WM6No16jVZMwPxh3I9j32jCqu/W2Uhj7BgSqMJeLzahVQ16psdqdSrLoDOJ6CoXTHzbnrIz2inRdEg9FFHcphPC3Pj2N8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA0PR11MB4541.namprd11.prod.outlook.com (2603:10b6:806:94::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 22:43:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 22:43:07 +0000
Date: Tue, 21 Jul 2026 15:43:03 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Zongyao Bai <zongyao.bai@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jia.yao@intel.com>
Subject: Re: [PATCH v4] drm/xe/forcewake: add delayed-release optimization
Message-ID: <al/198TzwXjbYB9d@gsse-cloud1.jf.intel.com>
References: <20260601213804.707256-1-zongyao.bai@intel.com>
 <20260720221306.1173028-1-zongyao.bai@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260720221306.1173028-1-zongyao.bai@intel.com>
X-ClientProxiedBy: MW4PR04CA0062.namprd04.prod.outlook.com
 (2603:10b6:303:6b::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA0PR11MB4541:EE_
X-MS-Office365-Filtering-Correlation-Id: db38af8b-cc88-4bb4-1eca-08dee7796e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: iz+n1LiIKUJKPGrol4ARrt08YB1m4nBP04f+Su3qxEj9Px5X2666oinaAue+S+9jshPv5HOHLTskJZwX0Dnsmi1kz0c5/awjlis+VLk0+RaUqbJOWqysie3PlWEOEQKrhZCXmSZwq8NT1XT7C2vPn3XsBpej7ykUPI+HtN/dNfk8huNpTDIsqsqAho+XR1af/QwsWOQT4isx9LdWga2sswXdh8ezkU71ubVMkrTZiLU4M1Vai3p8IEb7aG1NUff+r5vVlzguycHz3V+o2c/7qKevPByGk8ozhf4EuK0Q7l4MieCDwCNk85l73XfitVzwmP6qAosd1NlqOBe+74UaPIO8UquyYhDOuVBlU7UyQcfqI/t4kTZf7ymS+aS0+5hcXY5xhbW1vlN8g3ykt1X2vNKMIDb3pr6qJs5vXmRQ66Pq1RJvyKPgKUmhkWwLYSD3x7IA0Sz+n6HpBKZyye0NKAu5qXwrYRP20Ek1ppuf+hrRF88QNHNuDsjMChLWl/XyEWkqmtrA2tB7TIgU6oDelzB3xpI7i+iorG3jZVOus/d2An8V4UjYDca7j5I0zl3rT8b9OOWXtRv5gJ5ijxbeW4LAB9GwBJJe/E2KQINR9fA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FbmAydUZhUQOl8wr+N0siAv6wd3fSX6xYAGIP0iesWvT2PyBuVqL0wYhFoey?=
 =?us-ascii?Q?vGXRo3KVYCbYRKOnez0Rq8Gu9kykqZqrNIRk5eE/8TL5OXSt4lrPowDTklyk?=
 =?us-ascii?Q?0W4S8Yam9+34dYGSUD+CLd14E+ok5stg0KGsoEEEfCT/7H7wU0PQd/cANqIZ?=
 =?us-ascii?Q?scrrkakJpdsf8BKRv5ZuoKdZSbKcANCK/NNKCSMzRxho3Q0Zj7aaD8VGcGZB?=
 =?us-ascii?Q?82AUjOshcEyowdV8PHACydxbBJtUZQoA1J60zgvkSegmRHX4eXA/qZdIgUv8?=
 =?us-ascii?Q?3SA687ep2HbCPJiNB30hsCa+MfpM+EBSirGDOKUESSi05+XNIXJPXnc04NJH?=
 =?us-ascii?Q?4/dWhtOuQomRdTfT65DbOLpynNWgY3/rt0clN3QwS0yX5LfRTguZyl14CSdg?=
 =?us-ascii?Q?sQVNqwr9GfslZqMg4JiWatLujfpWWcEqY9eeVFnmx0GVc4Uv1l0s/TOkBq0r?=
 =?us-ascii?Q?iyQRXX3SrtGXF++pqezeejQBfhYWzfYjQcRLHuTt7WiFUwhbdrLEGZGNhzXD?=
 =?us-ascii?Q?ApkxgHI4/17+CGjm+aOoeckoPmLXcTBWamWflM4o3CK7mTa2hi5TCCtMBO2u?=
 =?us-ascii?Q?6QfBIkzap5BfqSYcQlGkjhHoS3VitmyKHuTji643DMiBLjVknZmtkoL1U8zR?=
 =?us-ascii?Q?PVvDo6/kZ+RILVRgDtQ6cLS9XNO8hBAU9QvzsP37nUJfUAhRqS3sgU83rBKB?=
 =?us-ascii?Q?wgtPH1WtRy7NnlzJ0wGq3g36jcUbHhYVsYSW8hf+vG2jnubsK057Obt//yFf?=
 =?us-ascii?Q?IWG30e+EHWxxU+THCohL8GQhIGbh3K0QVcNblumqwiu7rUe2mHcd+c9Am6BS?=
 =?us-ascii?Q?wLp7GJSXcDbbePDjjFD1DYkn8aq7ALxPiZR4Lys1Uo7oO4OpcmwMLH0BV33y?=
 =?us-ascii?Q?jvLVn+x0ZrkOnXKofB6Rfkmmspob6tS2UrTEB0gCrpIvIEgbr3uya99aPmKq?=
 =?us-ascii?Q?6XMaUJR2qhXpGqfyJ6vrmHGvUMgJWttEEg3DbFKwkognu1P5Bq6YS4iph9b+?=
 =?us-ascii?Q?e8KbyTY6mnlWyDoLrupIPCy8hAsBTShleJJbMRZZtdUq7lBeoJF1RM6ORNaP?=
 =?us-ascii?Q?UzJFaaFK4+MgFyC721CZP5zh9QVmXStYIwx/10LBTJC19WF5w/fq7+lO5Wmy?=
 =?us-ascii?Q?G7fUNhFwnl9GmERU9B/NxN5Je/nQDcJMd4LGadsCTNq5zlGLeKJtUaMRZwmV?=
 =?us-ascii?Q?uILebznlxlhKm7g981XKNeaVaIcjzTazWC3/1528oFoIY8z/gUlbnFUdqAfj?=
 =?us-ascii?Q?dDdlBgjsZogV7DeVlopMD+sp/HwqbZkRdVXpbSkKV+7QJEKUF6NMgZoNw+M2?=
 =?us-ascii?Q?x3koBJ5APnqDJUjvVcRW5u5ZaCuJU+CHUzwONla7u8YM1zDmp8hYQyNWuabn?=
 =?us-ascii?Q?dTDYqlaY10RWJSLmDNrJRynsx60k9zHuXSYumwy1MK80wDyCxDYA4l/8yBE1?=
 =?us-ascii?Q?LwLTlomq8N9eKlLcSTZX7SG4M6kZNHaiYxy+CIuXIhJRZY34zIYlt0lPdrFQ?=
 =?us-ascii?Q?smxkDVNGtMDvWexmXuf8Kcn2h8mwp/5BTCgvNzPAlI1cBjApbDih59cuUK/Z?=
 =?us-ascii?Q?y6E3V53rtrU/Bj9GlJMoRPmjtVow5UzDJafiaMbcSFpkt9GzzLswfto8w6Xz?=
 =?us-ascii?Q?HCj2P7Koen2+vQbZcxRamuC4wNArSwyavHvvmoRSFzrVioQHYW6BUWGOG++4?=
 =?us-ascii?Q?CfOssMUx+G8PoSM1uXQ1bmNmr/NqgKlmTwi/1J6JyKubKqCct6Uh5YALUKUy?=
 =?us-ascii?Q?6c1Gv8K3Ybd1RVzxd0rHxJXJNmKWFn8=3D?=
X-Exchange-RoutingPolicyChecked: GtX01WZQ/kWGaKcFnM0vPDiVSW0ku2NKmk3ssb42ML04E4SOnx9NHGtgPSTXB3u4eulKZFuaEkw10EsVnKpl37WG3LEt8i3pFR198zHR2SatV7dbghSpagn5EiEqfaflkbmC1VzX4N0NAt06dKLQPjxuCnW6ridbejAW20sBic0pxp+gPHUCCLxFf6FdjerkrtG7qa7bCEM4EWRYEZ9U7uawIEjrBY0XadDgYOPyVl9Hr5qh64nqCeoDL34qcM+3ygUmOFLToEJTIv5/FrfYR8ttacjPWEbXoyPzvxMGdl6ItvEE3rLuqBkpr1LTEgCrUUID3sQD698nJzSgfnw40A==
X-MS-Exchange-CrossTenant-Network-Message-Id: db38af8b-cc88-4bb4-1eca-08dee7796e87
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 22:43:07.1831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OITkrJxFqmgg2hapocMrC27w1WXBA1ziQT2E3x4J/HoGOLISooS+VihoQHkDmCawtCsIlydiZqnWr+ovA/Kjtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4541
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

On Mon, Jul 20, 2026 at 10:13:05PM +0000, Zongyao Bai wrote:
> Add delayed-release optimization:
>  - Add domain sleep XE_FORCE_WAKE_HOLD_DELAY_US after xe_force_wake_put()
>  - Skip MMIO wake in xe_force_wake_get() if domain still awake.
> Reduces frequent wake/sleep cycles for back-to-back operations.
> Examples of scenarios: zeDeviceGetGlobalTimestamps read by VTune, PTI
> 
> v2:
>  - Add xe_force_wake_flush() and call it on the runtime/system
>    suspend paths to ensure no deferred-sleep runs after GT power-off.
>    (Sashiko)
> 
> v3:
>  - Add configfs for XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US. (Matt)
>  - Modify the default value of forcewake_hold_delay_us to 100. (Maarten)
>  - Use guard(spinlock_irqsave) in the delayed-sleep timer callback. (Matt)
>  - Drop the redundant refcount WARN in xe_force_wake_fini(). (Matt)
>  - Document the spinlock protection of the timer_rearm / timer_domains
>    fields, and reorder struct xe_force_wake_domain by member type. (Matt)
> 
> v4:
>  - Make delayed release opt-in via a new xe_force_wake_put_delay(),
>    used only by xe_query.c:query_engine_cycles(); xe_force_wake_put()
>    restores immediate sleep-and-ack-wait behavior for all other callers.
>    (Matt)
>  - Track a pending delayed-release request per domain so the final
>    reference drop honors it, regardless of whether that drop happens via
>    xe_force_wake_put() or xe_force_wake_put_delay(). (Matt)
> 

Sashiko flagged 3 issues and all of these look valid:

https://sashiko.dev/#/patchset/20260720221306.1173028-1-zongyao.bai%40intel.com

Matt

> Assisted-by: GitHub-Copilot:claude-opus-4.8
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_configfs.c         |  65 +++++++++
>  drivers/gpu/drm/xe/xe_configfs.h         |   5 +
>  drivers/gpu/drm/xe/xe_defaults.h         |   1 +
>  drivers/gpu/drm/xe/xe_device.c           |   2 +
>  drivers/gpu/drm/xe/xe_device_types.h     |   3 +
>  drivers/gpu/drm/xe/xe_force_wake.c       | 173 ++++++++++++++++++++---
>  drivers/gpu/drm/xe/xe_force_wake.h       |  42 +++++-
>  drivers/gpu/drm/xe/xe_force_wake_types.h |  25 ++++
>  drivers/gpu/drm/xe/xe_gt.c               |  27 +++-
>  drivers/gpu/drm/xe/xe_query.c            |   2 +-
>  10 files changed, 319 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_configfs.c b/drivers/gpu/drm/xe/xe_configfs.c
> index 052cce962161..e371ac190c2d 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.c
> +++ b/drivers/gpu/drm/xe/xe_configfs.c
> @@ -247,6 +247,16 @@
>   *
>   *	# echo 0 > /sys/kernel/config/xe/0000:03:00.0/enable_multi_queue
>   *
> + * Force wake hold delay:
> + * ----------------------
> + *
> + * Delay in microseconds before an idle forcewake domain is put to sleep after
> + * the last reference is dropped.  Keeping the domain awake for this short
> + * window lets rapid back-to-back accesses reuse a still-awake domain without
> + * paying the cost of a full wake + ACK cycle each time.  Example::
> + *
> + *	# echo 100 > /sys/kernel/config/xe/0000:03:00.0/forcewake_hold_delay_us
> + *
>   * This attribute can only be set before binding to the device.
>   *
>   * Remove devices
> @@ -275,6 +285,7 @@ struct xe_config_group_device {
>  		bool survivability_mode;
>  		bool enable_psmi;
>  		bool enable_multi_queue;
> +		u32 forcewake_hold_delay_us;
>  		struct {
>  			unsigned int max_vfs;
>  			bool admin_only_pf;
> @@ -295,6 +306,7 @@ static const struct xe_config_device device_defaults = {
>  	.survivability_mode = false,
>  	.enable_psmi = false,
>  	.enable_multi_queue = true,
> +	.forcewake_hold_delay_us = XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US,
>  	.sriov = {
>  		.max_vfs = XE_DEFAULT_MAX_VFS,
>  		.admin_only_pf = XE_DEFAULT_ADMIN_ONLY_PF,
> @@ -616,6 +628,36 @@ static ssize_t enable_multi_queue_store(struct config_item *item, const char *pa
>  	return len;
>  }
>  
> +static ssize_t forcewake_hold_delay_us_show(struct config_item *item, char *page)
> +{
> +	struct xe_config_device *dev = to_xe_config_device(item);
> +
> +	return sprintf(page, "%u\n", dev->forcewake_hold_delay_us);
> +}
> +
> +static ssize_t forcewake_hold_delay_us_store(struct config_item *item,
> +					     const char *page, size_t len)
> +{
> +	struct xe_config_group_device *dev = to_xe_config_group_device(item);
> +	u32 val;
> +	int ret;
> +
> +	ret = kstrtouint(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (!val)
> +		return -EINVAL;
> +
> +	guard(mutex)(&dev->lock);
> +	if (is_bound(dev))
> +		return -EBUSY;
> +
> +	dev->config.forcewake_hold_delay_us = val;
> +
> +	return len;
> +}
> +
>  static bool wa_bb_read_advance(bool dereference, char **p,
>  			       const char *append, size_t len,
>  			       size_t *max_size)
> @@ -856,6 +898,7 @@ CONFIGFS_ATTR(, ctx_restore_post_bb);
>  CONFIGFS_ATTR(, enable_multi_queue);
>  CONFIGFS_ATTR(, enable_psmi);
>  CONFIGFS_ATTR(, engines_allowed);
> +CONFIGFS_ATTR(, forcewake_hold_delay_us);
>  CONFIGFS_ATTR(, gt_types_allowed);
>  CONFIGFS_ATTR(, survivability_mode);
>  
> @@ -865,6 +908,7 @@ static struct configfs_attribute *xe_config_device_attrs[] = {
>  	&attr_enable_multi_queue,
>  	&attr_enable_psmi,
>  	&attr_engines_allowed,
> +	&attr_forcewake_hold_delay_us,
>  	&attr_gt_types_allowed,
>  	&attr_survivability_mode,
>  	NULL,
> @@ -1143,6 +1187,7 @@ static void dump_custom_dev_config(struct pci_dev *pdev,
>  	PRI_CUSTOM_ATTR("%d", enable_multi_queue);
>  	PRI_CUSTOM_ATTR("%d", enable_psmi);
>  	PRI_CUSTOM_ATTR("%d", survivability_mode);
> +	PRI_CUSTOM_ATTR("%u", forcewake_hold_delay_us);
>  	PRI_CUSTOM_ATTR("%u", sriov.admin_only_pf);
>  
>  #undef PRI_CUSTOM_ATTR
> @@ -1290,6 +1335,26 @@ bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> +/**
> + * xe_configfs_get_forcewake_hold_delay_us - get configfs forcewake_hold_delay_us setting
> + * @pdev: pci device
> + *
> + * Return: forcewake_hold_delay_us setting in configfs
> + */
> +u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
> +{
> +	struct xe_config_group_device *dev = find_xe_config_group_device(pdev);
> +	u32 ret;
> +
> +	if (!dev)
> +		return device_defaults.forcewake_hold_delay_us;
> +
> +	ret = dev->config.forcewake_hold_delay_us;
> +	config_group_put(&dev->group);
> +
> +	return ret;
> +}
> +
>  /**
>   * xe_configfs_get_ctx_restore_mid_bb - get configfs ctx_restore_mid_bb setting
>   * @pdev: pci device
> diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
> index 4fbbeafba473..77abc83a6f70 100644
> --- a/drivers/gpu/drm/xe/xe_configfs.h
> +++ b/drivers/gpu/drm/xe/xe_configfs.h
> @@ -24,6 +24,7 @@ bool xe_configfs_media_gt_allowed(struct pci_dev *pdev);
>  u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev);
>  bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev);
>  bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev);
> +u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev);
>  u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  				       enum xe_engine_class class,
>  				       const u32 **cs);
> @@ -44,6 +45,10 @@ static inline bool xe_configfs_media_gt_allowed(struct pci_dev *pdev) { return t
>  static inline u64 xe_configfs_get_engines_allowed(struct pci_dev *pdev) { return U64_MAX; }
>  static inline bool xe_configfs_get_psmi_enabled(struct pci_dev *pdev) { return false; }
>  static inline bool xe_configfs_get_enable_multi_queue(struct pci_dev *pdev) { return true; }
> +static inline u32 xe_configfs_get_forcewake_hold_delay_us(struct pci_dev *pdev)
> +{
> +	return XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US;
> +}
>  static inline u32 xe_configfs_get_ctx_restore_mid_bb(struct pci_dev *pdev,
>  						     enum xe_engine_class class,
>  						     const u32 **cs) { return 0; }
> diff --git a/drivers/gpu/drm/xe/xe_defaults.h b/drivers/gpu/drm/xe/xe_defaults.h
> index c8ae1d5f3d60..3d8f57a54547 100644
> --- a/drivers/gpu/drm/xe/xe_defaults.h
> +++ b/drivers/gpu/drm/xe/xe_defaults.h
> @@ -22,5 +22,6 @@
>  #define XE_DEFAULT_WEDGED_MODE			XE_WEDGED_MODE_UPON_CRITICAL_ERROR
>  #define XE_DEFAULT_WEDGED_MODE_STR		"upon-critical-error"
>  #define XE_DEFAULT_SVM_NOTIFIER_SIZE		512
> +#define XE_DEFAULT_FORCE_WAKE_HOLD_DELAY_US	100
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 4eed9a251e65..88ba267c9303 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -541,6 +541,8 @@ int xe_device_init_early(struct xe_device *xe)
>  
>  	xe->atomic_svm_timeslice_ms = 5;
>  	xe->min_run_period_lr_ms = 5;
> +	xe->forcewake_hold_delay_us =
> +		xe_configfs_get_forcewake_hold_delay_us(to_pci_dev(xe->drm.dev));
>  
>  	err = xe_irq_init(xe);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 56c17cca79c0..35aac1ef6454 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -530,6 +530,9 @@ struct xe_device {
>  	/** @min_run_period_pf_ms: LR VM (page fault mode) timeslice */
>  	u32 min_run_period_pf_ms;
>  
> +	/** @forcewake_hold_delay_us: Delayed forcewake release window in microseconds. */
> +	u32 forcewake_hold_delay_us;
> +
>  #ifdef TEST_VM_OPS_ERROR
>  	/**
>  	 * @vm_inject_error_position: inject errors at different places in VM
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index 197e2197bd0a..34c3c23f79ca 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -6,12 +6,17 @@
>  #include "xe_force_wake.h"
>  
>  #include <drm/drm_util.h>
> +#include <linux/cleanup.h>
> +#include <linux/device.h>
> +#include <linux/hrtimer.h>
>  
>  #include "regs/xe_gt_regs.h"
>  #include "regs/xe_reg_defs.h"
> +#include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
>  #include "xe_mmio.h"
> +#include "xe_pm.h"
>  #include "xe_sriov.h"
>  
>  #define XE_FORCE_WAKE_ACK_TIMEOUT_MS	50
> @@ -27,6 +32,8 @@ static void mark_domain_initialized(struct xe_force_wake *fw,
>  	fw->initialized_domains |= BIT(id);
>  }
>  
> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer);
> +
>  static void init_domain(struct xe_force_wake *fw,
>  			enum xe_force_wake_domain_id id,
>  			struct xe_reg reg, struct xe_reg ack)
> @@ -38,11 +45,24 @@ static void init_domain(struct xe_force_wake *fw,
>  	domain->reg_ack = ack;
>  	domain->val = FORCEWAKE_MT(FORCEWAKE_KERNEL);
>  	domain->mask = FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL);
> +	domain->fw_back = fw;
> +	hrtimer_setup(&domain->timer, xe_force_wake_domain_timer,
> +		      CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  
>  	mark_domain_initialized(fw, id);
>  }
>  
> -void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
> +static void xe_force_wake_fini(void *arg)
> +{
> +	struct xe_force_wake *fw = arg;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp;
> +
> +	for_each_fw_domain(domain, fw, tmp)
> +		hrtimer_cancel(&domain->timer);
> +}
> +
> +int xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  {
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> @@ -58,6 +78,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>  			    FORCEWAKE_GT,
>  			    FORCEWAKE_ACK_GT);
>  	}
> +
> +	return devm_add_action_or_reset(xe->drm.dev, xe_force_wake_fini, fw);
>  }
>  
>  void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
> @@ -148,6 +170,36 @@ static int domain_sleep_wait(struct xe_gt *gt,
>  	return __domain_wait(gt, domain, false);
>  }
>  
> +static enum hrtimer_restart xe_force_wake_domain_timer(struct hrtimer *timer)
> +{
> +	struct xe_force_wake_domain *domain =
> +		container_of(timer, struct xe_force_wake_domain, timer);
> +	struct xe_force_wake *fw = domain->fw_back;
> +	struct xe_gt *gt = fw->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(gt_to_xe(gt)));
> +
> +	guard(spinlock_irqsave)(&fw->lock);
> +
> +	if (!(fw->timer_domains & BIT(domain->id)) || domain->ref)
> +		return HRTIMER_NORESTART;
> +
> +	if (domain->timer_rearm) {
> +		domain->timer_rearm = false;
> +		hrtimer_forward_now(timer,
> +				    ns_to_ktime(xe->forcewake_hold_delay_us *
> +						NSEC_PER_USEC));
> +		return HRTIMER_RESTART;
> +	}
> +
> +	fw->timer_domains &= ~BIT(domain->id);
> +	domain_sleep(gt, domain);
> +	fw->awake_domains &= ~BIT(domain->id);
> +
> +	return HRTIMER_NORESTART;
> +}
> +
>  /**
>   * xe_force_wake_get() : Increase the domain refcount
>   * @fw: struct xe_force_wake
> @@ -187,8 +239,13 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	spin_lock_irqsave(&fw->lock, flags);
>  	for_each_fw_domain_masked(domain, ref_rqst, fw, tmp) {
>  		if (!domain->ref++) {
> -			awake_rqst |= BIT(domain->id);
> -			domain_wake(gt, domain);
> +			if (fw->awake_domains & BIT(domain->id)) {
> +				fw->timer_domains &= ~BIT(domain->id);
> +				hrtimer_try_to_cancel(&domain->timer);
> +			} else {
> +				awake_rqst |= BIT(domain->id);
> +				domain_wake(gt, domain);
> +			}
>  		}
>  		ref_incr |= BIT(domain->id);
>  	}
> @@ -212,19 +269,11 @@ unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  	return ref_incr;
>  }
>  
> -/**
> - * xe_force_wake_put - Decrement the refcount and put domain to sleep if refcount becomes 0
> - * @fw: Pointer to the force wake structure
> - * @fw_ref: return of xe_force_wake_get()
> - *
> - * This function reduces the reference counts for domains in fw_ref. If
> - * refcount for any of the specified domain reaches 0, it puts the domain to sleep
> - * and waits for acknowledgment for domain to sleep within 50 milisec timeout.
> - * Warns in case of timeout of ack from domain.
> - */
> -void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> +static void __xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref,
> +				bool delayed_release)
>  {
>  	struct xe_gt *gt = fw->gt;
> +	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_force_wake_domain *domain;
>  	unsigned int tmp, sleep = 0;
>  	unsigned long flags;
> @@ -245,8 +294,24 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>  		xe_gt_assert(gt, domain->ref);
>  
>  		if (!--domain->ref) {
> -			sleep |= BIT(domain->id);
> -			domain_sleep(gt, domain);
> +			if (delayed_release || domain->delay_requested) {
> +				domain->delay_requested = false;
> +				fw->timer_domains |= BIT(domain->id);
> +				if (hrtimer_callback_running(&domain->timer)) {
> +					domain->timer_rearm = true;
> +				} else {
> +					domain->timer_rearm = false;
> +					hrtimer_start(&domain->timer,
> +						      ns_to_ktime(xe->forcewake_hold_delay_us *
> +								  NSEC_PER_USEC),
> +						      HRTIMER_MODE_REL);
> +				}
> +			} else {
> +				sleep |= BIT(domain->id);
> +				domain_sleep(gt, domain);
> +			}
> +		} else if (delayed_release) {
> +			domain->delay_requested = true;
>  		}
>  	}
>  	for_each_fw_domain_masked(domain, sleep, fw, tmp) {
> @@ -261,6 +326,82 @@ void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
>  		   str_plural(hweight_long(ack_fail)), ack_fail);
>  }
>  
> +/**
> + * xe_force_wake_put - Decrement the refcount and release the domain
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * This function reduces the reference counts for domains in fw_ref. If the
> + * refcount for a domain reaches 0, it puts the domain to sleep and waits for
> + * acknowledgment of the sleep request, warning if the domain fails to
> + * acknowledge.
> + */
> +void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref)
> +{
> +	__xe_force_wake_put(fw, fw_ref, false);
> +}
> +
> +/**
> + * xe_force_wake_put_delay - Decrement the refcount and defer the sleep request
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * Same as xe_force_wake_put(), except that when a domain's refcount reaches 0
> + * the sleep request is not issued immediately.  Instead a hrtimer is armed
> + * for xe->forcewake_hold_delay_us, so a rapid subsequent xe_force_wake_get()
> + * can reuse the still-awake domain at zero MMIO cost.  If the domain is
> + * still idle when the timer fires, the sleep request is issued then.
> + *
> + * If the domain still has other references held when this is called, the
> + * request is recorded and honored later, whether the last reference is
> + * eventually dropped by this function or by xe_force_wake_put().
> + */
> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref)
> +{
> +	__xe_force_wake_put(fw, fw_ref, true);
> +}
> +
> +/**
> + * xe_force_wake_flush - Cancel pending delayed-sleep timers and settle domains
> + * @fw: Pointer to the force wake structure
> + *
> + * xe_force_wake_put_delay() arms a short hrtimer instead of putting an idle
> + * domain to sleep immediately.  That deferred sleep performs MMIO and must
> + * not be allowed to run after the device has been powered down.  Callers on
> + * the runtime/system suspend path must therefore flush any outstanding
> + * timers once forcewake has been fully released, before the hardware is
> + * powered off.
> + *
> + * For every domain this cancels the pending timer (synchronously waiting for an
> + * in-flight callback to finish) and, if the domain is still idle with an
> + * outstanding deferred sleep, performs the sleep request right away so the
> + * domain is left in a consistent, fully-asleep state.  hrtimer_cancel() must be
> + * called without holding fw->lock, since the timer callback takes that same
> + * lock.
> + */
> +void xe_force_wake_flush(struct xe_force_wake *fw)
> +{
> +	struct xe_gt *gt = fw->gt;
> +	struct xe_force_wake_domain *domain;
> +	unsigned int tmp;
> +	unsigned long flags;
> +
> +	for_each_fw_domain(domain, fw, tmp)
> +		hrtimer_cancel(&domain->timer);
> +
> +	spin_lock_irqsave(&fw->lock, flags);
> +	for_each_fw_domain(domain, fw, tmp) {
> +		domain->timer_rearm = false;
> +		domain->delay_requested = false;
> +		if ((fw->timer_domains & BIT(domain->id)) && !domain->ref) {
> +			fw->timer_domains &= ~BIT(domain->id);
> +			domain_sleep(gt, domain);
> +			fw->awake_domains &= ~BIT(domain->id);
> +		}
> +	}
> +	spin_unlock_irqrestore(&fw->lock, flags);
> +}
> +
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id)
>  {
>  	switch (id) {
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index e2721f205d6c..232aaa3ba621 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -11,13 +11,33 @@
>  
>  struct xe_gt;
>  
> -void xe_force_wake_init_gt(struct xe_gt *gt,
> -			   struct xe_force_wake *fw);
> +int xe_force_wake_init_gt(struct xe_gt *gt,
> +			  struct xe_force_wake *fw);
>  void xe_force_wake_init_engines(struct xe_gt *gt,
>  				struct xe_force_wake *fw);
>  unsigned int __must_check xe_force_wake_get(struct xe_force_wake *fw,
>  					    enum xe_force_wake_domains domains);
>  void xe_force_wake_put(struct xe_force_wake *fw, unsigned int fw_ref);
> +void xe_force_wake_put_delay(struct xe_force_wake *fw, unsigned int fw_ref);
> +void xe_force_wake_flush(struct xe_force_wake *fw);
> +
> +/**
> + * xe_force_wake_put_and_flush - Release forcewake and settle any deferred sleep
> + * @fw: Pointer to the force wake structure
> + * @fw_ref: return of xe_force_wake_get()
> + *
> + * Convenience helper for paths that must guarantee the domain is fully asleep
> + * before returning (typically right before the GT is powered off on
> + * runtime/system suspend). Because the flush has to run after the final put
> + * but before HW power-off, scope-based cleanup via CLASS(xe_force_wake, ...)
> + * cannot be used here.
> + */
> +static inline void
> +xe_force_wake_put_and_flush(struct xe_force_wake *fw, unsigned int fw_ref)
> +{
> +	xe_force_wake_put(fw, fw_ref);
> +	xe_force_wake_flush(fw);
> +}
>  
>  const char *xe_force_wake_domain_to_str(enum xe_force_wake_domain_id id);
>  
> @@ -103,6 +123,24 @@ DEFINE_CLASS(xe_force_wake, struct xe_force_wake_ref,
>  #define xe_with_force_wake(ref, fw, domains) \
>  	__xe_with_force_wake(ref, fw, domains, __UNIQUE_ID(done))
>  
> +/*
> + * Same as xe_with_force_wake(), but releases forcewake via
> + * xe_force_wake_put_delay() instead of xe_force_wake_put() on scope exit.
> + * Only use this for hot paths where the caller expects forcewake to be
> + * re-acquired again shortly.
> + */
> +DEFINE_CLASS(xe_force_wake_delay, struct xe_force_wake_ref,
> +	     xe_force_wake_put_delay(_T.fw, _T.domains),
> +	     xe_force_wake_constructor(fw, domains),
> +	     struct xe_force_wake *fw, unsigned int domains);
> +
> +#define __xe_with_force_wake_delay(ref, fw, domains, done) \
> +	for (CLASS(xe_force_wake_delay, ref)(fw, domains), *(done) = NULL; \
> +	     !(done); (done) = (void *)1)
> +
> +#define xe_with_force_wake_delay(ref, fw, domains) \
> +	__xe_with_force_wake_delay(ref, fw, domains, __UNIQUE_ID(done))
> +
>  /*
>   * Used when xe_force_wake_constructor() has already been called by another
>   * function and the current function is responsible for releasing the forcewake
> diff --git a/drivers/gpu/drm/xe/xe_force_wake_types.h b/drivers/gpu/drm/xe/xe_force_wake_types.h
> index 14b7b86e801b..5b3d2b6873ed 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake_types.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake_types.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_FORCE_WAKE_TYPES_H_
>  #define _XE_FORCE_WAKE_TYPES_H_
>  
> +#include <linux/hrtimer.h>
>  #include <linux/mutex.h>
>  #include <linux/types.h>
>  
> @@ -51,6 +52,8 @@ enum xe_force_wake_domains {
>  	XE_FORCEWAKE_ALL	= BIT(XE_FW_DOMAIN_ID_COUNT)
>  };
>  
> +struct xe_force_wake;
> +
>  /**
>   * struct xe_force_wake_domain - Xe force wake power domain
>   *
> @@ -76,12 +79,29 @@ struct xe_force_wake_domain {
>  	struct xe_reg reg_ctl;
>  	/** @reg_ack: domain ack register address */
>  	struct xe_reg reg_ack;
> +	/** @timer: hrtimer for delayed sleep request */
> +	struct hrtimer timer;
> +	/** @fw_back: back pointer to parent xe_force_wake */
> +	struct xe_force_wake *fw_back;
>  	/** @val: domain wake write value */
>  	u32 val;
>  	/** @mask: domain mask */
>  	u32 mask;
>  	/** @ref: domain reference */
>  	u32 ref;
> +	/**
> +	 * @timer_rearm: put() ran while callback was in-flight; callback must
> +	 * restart timer. Protected by @fw_back->lock.
> +	 */
> +	bool timer_rearm;
> +	/**
> +	 * @delay_requested: xe_force_wake_put_delay() was called while the
> +	 * domain still had other references held; whichever call
> +	 * (xe_force_wake_put() or xe_force_wake_put_delay()) ends up dropping
> +	 * the last reference must honor the deferred-release request.
> +	 * Protected by @fw_back->lock.
> +	 */
> +	bool delay_requested;
>  };
>  
>  /**
> @@ -101,6 +121,11 @@ struct xe_force_wake {
>  	spinlock_t lock;
>  	/** @awake_domains: mask of all domains awake */
>  	unsigned int awake_domains;
> +	/**
> +	 * @timer_domains: mask of domains with an outstanding delayed-sleep
> +	 * timer. Protected by @lock.
> +	 */
> +	unsigned int timer_domains;
>  	/** @initialized_domains: mask of all initialized domains */
>  	unsigned int initialized_domains;
>  	/** @domains: force wake domains */
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index dfdacc0f6de9..9c4980b81a8e 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -512,7 +512,10 @@ int xe_gt_init_early(struct xe_gt *gt)
>  
>  	xe_wa_process_gt_oob(gt);
>  
> -	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	err = xe_force_wake_init_gt(gt, gt_to_fw(gt));
> +	if (err)
> +		return err;
> +
>  	spin_lock_init(&gt->global_invl_lock);
>  
>  	err = xe_gt_tlb_inval_init_early(gt);
> @@ -1005,13 +1008,15 @@ void xe_gt_suspend_prepare(struct xe_gt *gt)
>  
>  int xe_gt_suspend(struct xe_gt *gt)
>  {
> +	unsigned int fw_ref;
>  	int err;
>  
>  	xe_gt_dbg(gt, "suspending\n");
>  	xe_gt_sanitize(gt);
>  
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>  		return -ETIMEDOUT;
>  	}
> @@ -1019,7 +1024,7 @@ int xe_gt_suspend(struct xe_gt *gt)
>  	err = xe_uc_suspend(&gt->uc);
>  	if (err) {
>  		xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
> -		return err;
> +		goto err_force_wake;
>  	}
>  
>  	xe_gt_idle_disable_pg(gt);
> @@ -1028,7 +1033,10 @@ int xe_gt_suspend(struct xe_gt *gt)
>  
>  	xe_gt_dbg(gt, "suspended\n");
>  
> -	return 0;
> +err_force_wake:
> +	xe_force_wake_put_and_flush(gt_to_fw(gt), fw_ref);
> +
> +	return err;
>  }
>  
>  void xe_gt_shutdown(struct xe_gt *gt)
> @@ -1087,10 +1095,13 @@ int xe_gt_resume(struct xe_gt *gt)
>   */
>  int xe_gt_runtime_suspend(struct xe_gt *gt)
>  {
> +	unsigned int fw_ref;
> +
>  	xe_gt_dbg(gt, "runtime suspending\n");
>  
> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>  		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>  		return -ETIMEDOUT;
>  	}
> @@ -1100,6 +1111,8 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>  
>  	xe_gt_dbg(gt, "runtime suspended\n");
>  
> +	xe_force_wake_put_and_flush(gt_to_fw(gt), fw_ref);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index dc975f595368..86c4e1dfc101 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -157,7 +157,7 @@ query_engine_cycles(struct xe_device *xe,
>  
>  	fw_domain = xe_hw_engine_to_fw_domain(hwe);
>  
> -	xe_with_force_wake(fw_ref, gt_to_fw(gt), fw_domain) {
> +	xe_with_force_wake_delay(fw_ref, gt_to_fw(gt), fw_domain) {
>  		if (!xe_force_wake_ref_has_domain(fw_ref.domains, fw_domain))
>  			return -EIO;
>  
> -- 
> 2.43.0
> 
