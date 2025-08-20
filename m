Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437D9CA0EE4
	for <intel-xe@archiver.kernel.org>; Wed, 20 Aug 2025 15:24:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E0A10E77F;
	Wed, 20 Aug 2025 15:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n35AjArq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE3710E77F
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Aug 2025 15:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755703487; x=1787239487;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aA5NvYfZ3AHmpD9Z/BFP5iVhFwXj977qdDEpcCxIpGc=;
 b=n35AjArqZew1QZRfi5DdlGnzVxnJVyPtSfzgmwDB1ItVbudAMn0lnhYq
 sD2yddii+OqY6NSznsuaBjzPQolUNJVlZ7T8z5rRXQBMdT9VRDHOxY6Y0
 1aiFi3N/2t93Yn67DcPTyI2DedBQ7vc0UtIfKshE9hZulfdz+83kwdTlB
 ryrjtkLps2HYsMlbgY9EIE4B0fJWqlV2urbsrOC+wAIc+LwFDzcbLWB3+
 rffpZmScCnKILLrXZhey0SgXvKHl7j/cwjGKyUpGs7BbGKWf1B0EXe7Nn
 IMLufm5nxIeNNBJkwjOcMPuQhwOq/Cm6541a7lp6GWhJEyLNlKImiUbXl A==;
X-CSE-ConnectionGUID: CkPBBuwZSyCUBk/SQJgn3Q==
X-CSE-MsgGUID: hIbQNE0UR2yW/HSOKrQ8qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58045443"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58045443"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 08:24:40 -0700
X-CSE-ConnectionGUID: JMOb+/JmQWCRkPMLQ6MsNg==
X-CSE-MsgGUID: V8A4dNzfSemY9BANm2DM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167769046"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2025 08:24:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 08:24:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 20 Aug 2025 08:24:36 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 20 Aug 2025 08:24:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEV0T+oMd7gQp0LYOOJvVehHXLGC9XnPfjEVq6qQAsqyAzlgEzV4tDjk9nXxdNx5RB3+cFzfpm90Non0Zp4elBWlxgacebgk35hesCjkddYODiyhnIzZlhTF+YMmjPUIbNYq8hky72s4w0CzDOn9UnHJV/Dwmyb2Dc4qvublqsqJZg88/mUSSuPiz5LUAWL2LK4qIXcLsW4tdojq414NzmP8X5+SkjVh8pPv7K2XpiJssuOR/c19coJ19LGKoTKeLYBFaj1h+IseGSXIGMTTR921M6+O3l1QRQGyGRP1ZvV61lT0bzzvg1mjK+BzuJyp8PQEO+ruhK+AZEGQ6kQgJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=40BtMHHZJV8faa66g8//+b/hmAv2518ZwSvDAK8dH/E=;
 b=Ttbl2Gnh5Mhxh7LlO/n8fjaMAJYH/yzNJW0EYrgghRhH7+2LvXex2xXkEwiiTXjAIYlEhDWnDDfzEqKE9IjT+OgcuVlpCBl7oq31U2MuX1V5H7AUihnnkZ4SQud+oKW8GmqSx+pSVU6mGPBT6rpTUqzxRIawFrbEPbo+AfpApsOA0nFJ303B+d6iuSfdwf5UfHLH/ODE8XHLdk2zie4UrO/0QiszlwQMsbK8DZc+4zr+COqk8BvuBTL9Wqz6LGWmtnhBuuLEtQenavHUVWZhN2jQ0UHfJxyUU8DlftKusJxsn6Ll3t1XO7VssVoLfeYaT+wuZWnkPekrOAy/YCnLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8313.namprd11.prod.outlook.com (2603:10b6:610:17c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.25; Wed, 20 Aug
 2025 15:24:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9031.024; Wed, 20 Aug 2025
 15:24:34 +0000
Date: Wed, 20 Aug 2025 10:24:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <tapani.palli@intel.com>
Subject: Re: [PATCH] drm/xe/tuning: Apply "Disable NULL query for Anyhit
 Shader" to Xe2
Message-ID: <d3jrljf5t4ah2mgixc3qflzwav2krqnrlyj52vpgyz32ucvyxv@ddzuhlwp3n76>
References: <20250819061151.1272622-1-nitin.r.gote@intel.com>
 <3nkoieccnnovh4lbcwu4g3lmce4hbdnhiwe3m6pwk3ztrmmm3t@7whopshriaj7>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3nkoieccnnovh4lbcwu4g3lmce4hbdnhiwe3m6pwk3ztrmmm3t@7whopshriaj7>
X-ClientProxiedBy: SJ0PR13CA0161.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::16) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b878b1d-0821-48dd-c4b8-08dddffdaab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sAOmrTAAFMydgU5p826WuJx77kzTVb8dg2YPRMT0Gv3iWVCteSJWI2FI35md?=
 =?us-ascii?Q?MSBJ4RSTfR0KBkJvEbMU8alY2dteWk+1Jt9OK9nOQpzAvtCcnxXRd7hRcRXK?=
 =?us-ascii?Q?ouDWrW5XzT7etlfeUr7vQ8u16+iNHR52uUN6g/YakZ3Kq2Ga3iiwzhxafQLS?=
 =?us-ascii?Q?hfZ4tW9YS+Vw/BJzQBMtX91+x1gYbr87oL72zOY2Qx0TdFnL6+l9vDDBNaDA?=
 =?us-ascii?Q?H9j5MjUuG/2cStypSdPVHdaqO/13xezwegCSR7nE5jAmg3chjw2L/1sMbZKa?=
 =?us-ascii?Q?dWIq9hd/QzFAFgzMwbrRU3feRafXSQWSDFbn1WVdq+RNTzoy3Cw2f1+Y0Nep?=
 =?us-ascii?Q?Kn8nRItaBj7+rkQwyZEu+WQXN21Io7wF+kvGu8/Fi6h4DhGBW6rngJECG7BN?=
 =?us-ascii?Q?DCjKosjEWXwrKpTfCfW5mYN3sNL+KOcgJAABIa78NMKhWyIhEs5ixij7jwrH?=
 =?us-ascii?Q?swa4HoPh8+3+XmraD5msP1GrvIT2Y1AeDiuiZvBBYtgsICf+y6BvWU/ToezR?=
 =?us-ascii?Q?B5MzeDEerDnMS/eKTBVwO6MB/nKmmgUy1npYoTBlnupZS+30x3jpzJ/MK5/G?=
 =?us-ascii?Q?U5YQEMODIklyQU9i7viIlVF0f1fhhbN435maTTMPW4ARze1A2VoSp6vjiBVU?=
 =?us-ascii?Q?1fy+jAaHDCtwSygZSbphnSAMRtkucfgwXIW5O1NxUOy5nv2JNjgtGRU89yds?=
 =?us-ascii?Q?Av9aaX5DOzwo7K2aOjak4AKeMAdO76I1sr+6P95GwV0abx1+rrnQ6qVG24T6?=
 =?us-ascii?Q?3BepcUgh6pAcJsi6n732E26NrJlXL7WJn3UxYJqJQT8hTBZWgn88d5tJlvfo?=
 =?us-ascii?Q?eUbd6MJV5mq1a66v2S2SMUWEzgtsldM1KKaDj+4A3qscxqjW4uAu/LaCyQyM?=
 =?us-ascii?Q?b7OCJGud9uaDyrnYprM+cnD/hK/cYY7AxPNiYcaWCUXoI61N9BFLz432OJRt?=
 =?us-ascii?Q?7hkqpQEPfk/76AGYx65E23Q5wWe35vehUAEy++a+8wrU3PPp1h2/JGMkXJz6?=
 =?us-ascii?Q?W2LBBT8YPGlJTYczUhOsHpwAIvfV1QaREn6lB/FGKDnNqsvUunzVVCA2PuKg?=
 =?us-ascii?Q?mqz2eVY7dlyMp6PqXj4XbGHUdOMbIEtyQFzbBIXIMhZ2pwac67Zsvti6Pd3u?=
 =?us-ascii?Q?6g6CAX4UcsAHcQGCyR3G47hBh1swwnmm5opwcBdaqNhIalXykQ5kU0PAJeFA?=
 =?us-ascii?Q?QMx3OdsjWTJ4qZRT7JTAnSQMKIlyMOIB1bhh2T/igRmbzzNuZK2VdLQkzyWK?=
 =?us-ascii?Q?UijFE7pw3f4A+P02fxnGJTAhrwGpx5UPi25fOtxafa+wf2fc6UMlPOI4fuhr?=
 =?us-ascii?Q?2WUGE53MnOD/9rJ1KUDSDYzbsTazKru7Y6TtM/WiVQchzOW5+SnhzJvZPcZx?=
 =?us-ascii?Q?uVis2qU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V6NnOELC/O0f3LtfTZooXbBCtzENBiwIZFcwZ99KyJsr2SdTBDw4e2BPvFkJ?=
 =?us-ascii?Q?o+wvOSPMLEo8AHmXDN11mjzopBf9jcShMhYhiVhC16G9+zxT8LoJRnf6nJfm?=
 =?us-ascii?Q?0tGwd+z/wJt/SsfXYm7EC/Spt5CZTu+WN0XmPtH+9TZsEu3CVeLAxXkT1Aus?=
 =?us-ascii?Q?nyWgOXlvOvRKpl6ExaBqz3fHReCkhXqdR4uJ2i2CTfX9NViFYlFJ038BfglK?=
 =?us-ascii?Q?gi+F42tk27ipk5D2rSzhEErAo4j/25wZ7O1N1c4iz3F01L7eIxr7cVU5WuwG?=
 =?us-ascii?Q?ri1TB1xxQ0rQc+NtSv+beDtp809lL49IAeHcVWXY02jIXCefSOXdDtjr8jZ9?=
 =?us-ascii?Q?eDS21RdqmDfJ6oNp1q8f8yEggIBP5oSF8y7tMZv4p5OeDbZCYOoQIfj0EMu8?=
 =?us-ascii?Q?CnTeTtRruI1OhExwpH8w6dcpxfIqTJF1O9tGKbagjxs8vS+IsAclf71oRB53?=
 =?us-ascii?Q?4AGye0X4nmTwP4r26MKQarOSlcRZClKZWGkNjA5xk/ZjSfH4HLjaoM3xYHkz?=
 =?us-ascii?Q?z9/ycSoJSfK9+0SLvGcdcQcIsiiArZkBHahBxWRJ0cQY34Ab7/OCfdXWrU1Q?=
 =?us-ascii?Q?1BHLXlux2gCT2w/vpF9GMES7f1E38LGrPLuhrLA841VuGGQuztrqvwLCWsNi?=
 =?us-ascii?Q?Ow1f6/6ccF+Rti8S6tICQ10BqEdQb+i4+TukngiwdXg/OEVZzsUsz4OLMPIO?=
 =?us-ascii?Q?SMERzuKLKtEWYUXjwmKMBcKlVoJ2fDp8/LDD0T5XXu6U8BbkvcX3QcblGUIC?=
 =?us-ascii?Q?xzT/A+AlRayhg3gTTzKY0cFJ6ALsA3qMxnLcgu9M54iH+pepLfJaEy8lftQn?=
 =?us-ascii?Q?ZQwZEJorOEVyITiDDzk9ne/09Jv9pwHoXEaK63lzEYAx12zabWPrIlUDs+3J?=
 =?us-ascii?Q?sYiNwGKOlB+tlMoocVEFsVzAsIlYUolbXLIlNeykaaEkGjPLVwsf2GUv05Ke?=
 =?us-ascii?Q?blzBx7SVvyZIE6mDIX5ioLvp6etxcFhSKuxfHKPhDHAdEVCJOVIIA5T8daAp?=
 =?us-ascii?Q?NWsVLHBM7ddrP4WUcBqDsPYA1hVkGpz38JIQ5dvOKvOqKNfIbf+XPM17YodA?=
 =?us-ascii?Q?94yC6pzVYeRMXFuXxxDsPfU+sHTWS0MF6Qn9ln6RNLV4SQX/SIWCmvwv/66d?=
 =?us-ascii?Q?Ct0/0dpUTzeUB5xKQTMBtUhdmq1SE7/AdB8RnzMT15jpYaCDT933nRQFRbfM?=
 =?us-ascii?Q?rR4Lvqjxznx0UhItH7JwSjM8f3sAXw6/stXLDs7NZ4JZ8wpzGJ/6mLIA+BW5?=
 =?us-ascii?Q?W7blxuHXn8ot5dLU0yuTtqdupbaCQE6RwC5sy8HfY3+deiXcRPxC8DpnlFx/?=
 =?us-ascii?Q?YPm96lGl3uGZ00/2kMEueebs7d2dOZKjuBRWxWiO9LUtQUkjeYxJ4Iyfzfte?=
 =?us-ascii?Q?oK+in0gtAePxRsaq219ehBQvYfXKu1kMGSvIGXnZx6g5YO1frFkHTo+UoUGs?=
 =?us-ascii?Q?5XkmiYIHr9N95YhyeTHxNNbqvPoWFujenChb5RU5ZvskWfT90+ZZ6ULTRNX7?=
 =?us-ascii?Q?fOkjPyQ7916ZX2lmWVYnDqwh2t0D9fIXEi7cQWttjkwJnaiyBe54kCstyBWB?=
 =?us-ascii?Q?bwn4Ge/JkEyFeLjz3Z7mBWfAtVKxSae+6qY+XjfbLCwjDijo9NaD17QLCdJd?=
 =?us-ascii?Q?Lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b878b1d-0821-48dd-c4b8-08dddffdaab6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 15:24:34.1913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Zz8PnAauPxv149LkOPIx8/Ax3jWM4r7Dd+VKf1SqbQsYPBLH2id7TM7m2QNZhLPKWvJYSzzs+ocBGQKrNkARpbMeTNNm52lL3vCKFybJ1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8313
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

On Tue, Aug 19, 2025 at 09:08:00AM -0500, Lucas De Marchi wrote:
>On Tue, Aug 19, 2025 at 11:41:51AM +0530, Nitin Gote wrote:
>>Extend the "Disable NULL query for Anyhit Shader" tuning to Xe2
>>(graphics version 2000+) platforms, in addition to Xe3.
>>
>>This sets the DIS_NULL_QUERY bit in RT_CTRL to disable null query
>>for Anyhit shaders on both Xe2 and Xe3.
>
>This needs a few more details to help anyone using this commit. I can
>add this paragraph while applying:
>
>	This is a change in behavior that can regress a userspace not
>	prepared for it. However it's not feasible to change dynamically
>	the option per client or per exec queue via an opt-in flag. Mesa
>	is already prepared for that and it got propagated to their
>	stable versions. Even if it was possible, at this point adding a
>	flag would mean mesa would also need to propagate such a flag to
>	their stable versions, otherwise the previous fix would not be
>	used.
>
>	Link: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35044
>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

and applied to drm-xe-next, thanks.

Lucas De Marchi
