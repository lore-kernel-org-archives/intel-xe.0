Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EE1CD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 09:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC19710E17F;
	Sun, 17 May 2026 09:06:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dafmUWHl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166D610E17F
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 09:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779008789; x=1810544789;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LQG3YY6C8hi2xbClrl1s2th/3bA8IQLui1LIZ/JBUTM=;
 b=dafmUWHlJqYT8McIuPv6wvcwjmUnO64UM48/VKO9BM+Y4DuvoEkAOZ+y
 QcGNszFkwQhYcwAfzeeiP/cmwl9BL9CzBJrSfoNFTo6KAZtxsUJa7xUpP
 H1WdK5bHIVRiUDnYwtiKSHSQvsVfmR+5fTe9Q2SY1cqR0GF+Yh4WaK4+A
 +C2EPlbzY0vlxfmxIRfQgylpsjXpnsgseTjiMBWxxkIlP0Cfu2Qm6jqai
 8OPV4eWCXJIQ+A4D3PIWcSULfVrOAvce2qfe8J27wyCb+R/6wiKRPBhre
 Orb0QlroA9/0UQ0SCfYVT0YZ8V9N4MQdMXN5bt1N17B/uHkdsZWh1wEB2 A==;
X-CSE-ConnectionGUID: srOwN5k9TMu8Wqo3uBxnZw==
X-CSE-MsgGUID: hkaGfQMrRdKXGQw7RKNCRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90591011"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="90591011"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:06:28 -0700
X-CSE-ConnectionGUID: oOaISktLQ0G6lXBxRzWPMw==
X-CSE-MsgGUID: 8cgqUs0CRwOWoZ++PY5m4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="234679993"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 02:06:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:06:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 02:06:28 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 02:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir5er3cSMSIfYqLJejscGOKBGyv+Q5SY2d0rOHs95H5m9OwzMAHZ5s3zx9B9ctMvbhKrMjb+ieNCyQOfx/XXrgxM2aptHE37IiTOUD3/FAPLiuFbfW6ryOM+tMfFu1FXOV555Q1YPHtcuJQrjrU8S8E+cG1sni3j+/YBwKZ6WsUXnBeqWKPLJtJd1U1ab3dhsvb0KJvVQk14ZdpJW45frwmfNzj5vlrrxorFyi0YsgPAbXcnzPxSm+O59ofrgMb531djRDtM9mpMMRXtn0dd3/2qza8LDmyUsNYigpraViXUa9TpLUTG2y/5ND1Onh+NwQM1HyMdFObQ/KovpJePMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWlLd1V4X/1VJlVivPqgsBIcvXnHCevSEUKdbc8d+hg=;
 b=K816AmSHZUY7qVfheISefCGn7jjeLgWjyqklIEgTmCNEZr7UVJpAxCMvFDXd3fybXVH/H/cJbSXcu3azRAhZSmj6lsXLA78gFDdmQYaRGxcpzhxZlAx0othJNv7jEwZhYo9oIuxZYfjx6n3qie+I53csvoxpNrhT6jiDbsm3nSF8PCHGoElOlB4UIxt1h5boFac8/UOMEPde/kapdurstZ+RBEEqPev5aUaYIsddqi5Ou9t2+sAgjrBwKY/TiM0ByhTJmwEYWiByBMaRNpz3fbCpLH4YuPlzJmwv0V/V81M9adSojDb7Mf01K0FdmxB2FkyniLyVXgsG2GbDQykrtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by CYYPR11MB8429.namprd11.prod.outlook.com (2603:10b6:930:c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Sun, 17 May
 2026 09:06:24 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 09:06:24 +0000
Message-ID: <697c0c06-e4aa-49c6-81dd-aaaa4384d1f9@intel.com>
Date: Sun, 17 May 2026 12:06:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] drm/xe: Add IRQ page to HW engine definition
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260514150010.7123-1-michal.wajdeczko@intel.com>
 <20260514150010.7123-2-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514150010.7123-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0002.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:9::8)
 To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|CYYPR11MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 26661044-6462-4875-88c4-08deb3f39238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: s4plIx37hOfQi9+zoQGxYUC6vrgGeeeHbvSdd/uhHy1IyfbCJSPZ2HTEAUEh7rVh5eqXWsL+WdOq7xu2yh1+iMj0I8UhAyKvXRnVMizUKo9nggr3ACnCLaLK2UsxOjcJE2Gz+YSaUxkfsEDmTtPVWLhFUHDkce8vFXMCvenzXpx1KGMtVFv/OfanzXjALSgoFnGJYEUDWmlNtOgaDrWB7pKEY6gTpE5u0lpk4vc7S+Z2/dmuPfED83S/KRnpIMoBETm2hxRgfhWxHl6lNVP9aqqc2KjdGnVyoiqERWdfoHEH49ZuGyhLag3un7LWMk12XTxSF6DIiqwd/SuKE7r1PV1mYFNzfB1m5OsPQcSo7+SH1nLrECYuqNZwAq/PbKlblSj9EHKbGDngdmvcJAuik/ZpL1/wmVzJkaFy1xWRJbvlILFzkcKP5iOCPnVyJYkSSxZe8hk4qAP9JqWAPw8iUO4+O+VJUAKxjXNdA7uMtFRQH14FOFQA6oKdR6QrdVubkKt4e+yNpgYvuHA3Na8+TuGPmO4eWy6RFSTDfZJgB3hs0Iai2Wpw9Hm93ClUGHVGfqMPbbkW2ivCoGKKtr6fZxccZnqur8e3hWTjZugR/rtBoqx9sQ1uZ4sbTWb/Wr7zGR1M8Pqp6fFU7k+n+Fz65GeBkqB6l64R1YCu4JTPS115OvRjLzSlrdFhw6a0HdbV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHdLUENOR0xRa1orWlJYazM1Q21ndzZCKzdUc3I5bVc2Q2dGR3lmai9xd281?=
 =?utf-8?B?RHhybWVwbXloRGVEckEyMFRPbjVyb3QxVm9obWlGRUVUQU5lZ0tvVVhFV2gw?=
 =?utf-8?B?aUZsNi9jL2ozMkZOVTlZMms5VVVNbHBlSEdwcVJhSUZnaWtHYmxqQTJMbVJU?=
 =?utf-8?B?YlVnK2d5ZHh6MGhhQUNLYWRhakhXVjRUUUwxOWNOcW1lQm5ibFZYQ25xOFYw?=
 =?utf-8?B?dExPejd0RlhiNXBHNW5YSnVEeGRWS0Q2ZWxxS3cydlNEVVhrdzZ4SmlzcHEx?=
 =?utf-8?B?czNzaGM5UU5mMXl1TUVXYlAzMm0yZVdWM0sxeCtZUEVlSU9BZTlXd0YvNnp6?=
 =?utf-8?B?MUpVWmJuQ3RBQkNYaldIR2dqWUx2S1dKWGhWVDc1eEo3dzBnZVNFdzVzc3dR?=
 =?utf-8?B?dXZwTVJpWC9CWG9WZDZpMTJKSzhPeWtwQktQbEFKSVR3Y0YwNFU3SnNTWER3?=
 =?utf-8?B?blNjY0YzVDQ1REpLRGZmVkd1dldkVWx6ak00VUx5VDdwOHcyTTYwVHdESHlu?=
 =?utf-8?B?b0ZwQ0RVb1VXRlE5cUY2RTdRbDV4NXBKY1JZVFhsd1BhZEFEWjR0cGZVdjl4?=
 =?utf-8?B?cnNYWk5PeW1lVi83ZVZOYUl4bXFDUGJ2RU55QUtLRElrRmJNTXlGY21qazlP?=
 =?utf-8?B?ZXRDZXBuVlhQaVRNTERwSTVZRkhPRTMrdFo1d09SRlFsZE9FRHRkQnNEdHVk?=
 =?utf-8?B?Ri9aUmxEVldWbldUWU1xaU81WW9MbUZManNMOHRzaklQTmRqV2UrYnliVGFo?=
 =?utf-8?B?eDhtdFNYOFg2bXMzd0l6cE5jZExPWlVrYkp1Y21DS2V0UHNaS2hPVUh0M2Nm?=
 =?utf-8?B?aHhGN01YVXc4WHZjUTdFZjQ2ZFlNTnladGRQdzVET2xNdkUwQkc4VDd4SGYv?=
 =?utf-8?B?THp5L1M1ZG5HU0tWVzJ5bXhHZkdQTFBtZDRSdXQraUVoc3BzbUMxS0hqd1pj?=
 =?utf-8?B?Z2tWRkhVc2w5UTE1SGVIMDExT0NQRjdiQ1BTajJWNEl2THdMbHIvSmV2eDJQ?=
 =?utf-8?B?ZWsvUCszc3g2ZXJvczg0MjROL1hEUHd4cjNHK1djR0wzMHcxckxlMzYzQXRT?=
 =?utf-8?B?MTVydVJCSkptVHBqOVNQL1U0a1ozN0dBVkdQRHZkSWtKZS9aN010UWZnM0Vv?=
 =?utf-8?B?b3JWRTM3WFJBbElOK0Z1TXBPVnFyU2Vnc2RRUUdaTVh0MHZWbXE1MFZkbTdz?=
 =?utf-8?B?Nm1VYUlCZzdydWhCVldJV21icTI0ZUh3N2NMRzNzdmcrbnVPdEY4Y0crSzJU?=
 =?utf-8?B?b1FiVlJucjZQQm5naVgzTzY3SEEwQ2kwdWE0Mitkb3AyUkdjNUdVbEt3ajdT?=
 =?utf-8?B?ZU4xbGRoclZZb3ZZQXVLMHlsSFNLM09tcmhOZ1ZESnhNdEplK0Jaa3ZiZ25n?=
 =?utf-8?B?dENmOC90ZnkzYzdlaW45aUpSZUJBVDlad3M2Vm9hbmErRGVwOFJYT3RpVFox?=
 =?utf-8?B?SzBUTWFTZ1ZtTS8zNno5VXpDMW14Vm1Ja2xSZDlwSmQ4bG9rWmVaWEtnNGJr?=
 =?utf-8?B?Q05XR2UwY0paMmZWK3BvOUlnNWprYmtjUFUycStNT1o5c09LeG1VM3RUbkZI?=
 =?utf-8?B?V2ZCR1pIdmJ1NlAvMExxUWhxZXB2bWVHdW85OWpqeUFMZWJ3QkVuTnZwMWNP?=
 =?utf-8?B?dFB4Y3FFNjhrMk9HSGhua3ZPTTFkZ3VwbGp4SjZVSXNmOGdxVFpWOU1sZldv?=
 =?utf-8?B?ZGxjQUdScTNKUHNHYjRxMytKcU5pd05NNHRwcG5ZRi8yai94WWVFTEhuSm0z?=
 =?utf-8?B?M1FWTDAyb3Y4b0NxK1ZVVHUxQy8rNGowUDR1Q2p3RzlXMjVQZjNVYmE0SXgr?=
 =?utf-8?B?cFVmRjM4eUhaOHNmblZSTDBEVGRqWTNldlg4VG9yV0VPUTNUbzg1aHFsRzlo?=
 =?utf-8?B?VVM4QW5IQnZqaEF2ZjQ5VFErV0JFam96cTVKc2VOK2hDWVQvdVorYlVZLzho?=
 =?utf-8?B?YllNNnJ4UjV0N1pWckkrcWNnVHdxZzNPY0ZJcERSSlZyenlIRk83ZTNGbFRF?=
 =?utf-8?B?b1pRdXZLaE1LUmZ2OFBkaGFhNmZPYUVRSEpzanBrM2VSVHlUS2hxellxT3M2?=
 =?utf-8?B?aUpobjZaMHVEek5IUEdnalo0RDhHK0RtWDJodE5SVnZ0YjJud00xS2hHd2FR?=
 =?utf-8?B?OXhFNGJacUl1UmZRMWwzRTdFbjBrbi9odlB3RCtDd0xsN0Z5KzVJa3RQNWVl?=
 =?utf-8?B?enM0a3U2d1JhUnV5YXVFeUJkakFmZ3BYWlFjbVdiYnpQbzBpRzYvNUFNQnRS?=
 =?utf-8?B?emFaNTJ5bUdRWGZIL1FtMk5mSTJtcTFaK0M5Z3pVMmhaNnVlZFE1U0hZQjJJ?=
 =?utf-8?B?dG4zKzFaWUovZkNncm50aWUrK2N6Rk9GSEdWU2dBRk5lRmROckx3Zz09?=
X-Exchange-RoutingPolicyChecked: BMXybMhMvq6IdKHakLbJwhXrdCN51ojT/aumpOuxqkPKzv47TMks3iIDPJbJsQyaZiFjqx8w1Mv3w5hJ+tCIWAeqQZWttmb7/MVhMqHBxLpNh0r7g/JeS9Gx4rkqpCnQ3yI9X1kYPVnwZr8s3hCZbqbP2mr9KPTSImNuJ2+K7V6UkPeKZM6jyGVxKhHY9FPx9yLp0SltyAnLxV68TCbAAepu4cCepAhzuvM9U3GrMPYcZTU2KfmXjxtfjBuTwQk/l+RReZUQxV6ogjETtTHwOAteyrLmQtsGpsdp8/fWWlHJ0DvVu+FoHMiAgg4Z9O3APmXn2kSuPYXxhAajHutK4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26661044-6462-4875-88c4-08deb3f39238
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 09:06:24.7889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hf25CsKK5QhrWNb/9wof8OQJKVXAH1Lr4E2HiXumpeFPenET8eQFoCeAxztt+ZFT+p79Oa9Cx6/FNvF/w9FBUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8429
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

On 5/14/2026 6:00 PM, Michal Wajdeczko wrote:
> For each HW engine definition, we already make changes to the IRQ
> offset, as required when using MSI-X, but we leave actual MEMIRQ
> page selection to the MEMIRQ handler, repeated on every interrupt.
>
> As a preparation step to simplify the MEMIRQ handler, store the
> MEMIRQ page number as part of the HW engine definition.
>
> Suggested-by: Ilia Levi <ilia.levi@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>


Reviewed-by: Ilia Levi <ilia.levi@intel.com>


> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 11 ++++++++---
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  2 ++
>  2 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0f0e08bcc182..3c3b6bcc4b53 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -503,9 +503,14 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	hwe->class = info->class;
>  	hwe->instance = info->instance;
>  	hwe->mmio_base = info->mmio_base;
> -	hwe->irq_offset = xe_device_has_msix(gt_to_xe(gt)) ?
> -		get_msix_irq_offset(gt, info->class) :
> -		info->irq_offset;
> +	if (xe_device_has_msix(gt_to_xe(gt))) {
> +		hwe->irq_offset = get_msix_irq_offset(gt, info->class);
> +		hwe->irq_page = info->instance;
> +
> +	} else {
> +		hwe->irq_offset = info->irq_offset;
> +		hwe->irq_page = 0;
> +	}
>  	hwe->domain = info->domain;
>  	hwe->name = info->name;
>  	hwe->fence_irq = &gt->fence_irq[info->class];
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 0f87128c6529..2cf898e682f5 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -118,6 +118,8 @@ struct xe_hw_engine {
>  	u16 logical_instance;
>  	/** @irq_offset: IRQ offset of this hw engine */
>  	u16 irq_offset;
> +	/** @irq_page: MEMIRQ page used by this HW engine */
> +	u16 irq_page;
>  	/** @mmio_base: MMIO base address of this hw engine*/
>  	u32 mmio_base;
>  	/**


