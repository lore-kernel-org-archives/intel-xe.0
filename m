Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9551BCD37AC
	for <intel-xe@archiver.kernel.org>; Sun, 17 May 2026 10:48:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8E10E202;
	Sun, 17 May 2026 10:48:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dnrsDNyG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E8210E202
 for <intel-xe@lists.freedesktop.org>; Sun, 17 May 2026 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779014881; x=1810550881;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xw2sYYPfiGslntAY3yJdl8690sxXj3h+96lmVQ2z4sM=;
 b=dnrsDNyGN3F6GqLNlPlJtLiEpZcSnzT1UPybgp2V2BVBGuh9T45RUppw
 baVE3AfsiCCtMKawyc5FpFgyGn+gQNiK7IkQYRcUATxLwcU+eYW74ZI0L
 G/SaRWMplvLEcpW7HnC/NPDrJnUtz5+fA2g50G5NCRhtoQLv7FCjt1Q2R
 Fv3Gcg4V7VsRf51EnnPMQAx3SORqXTN7akREhj5iUiptPgXflq9k/LBhK
 baVfjKqJbpMcRuKkKPbgcrxSYX05q7sf3lW6BbVS8zygqCzHkWzzOuU6S
 yce8pJ25Fotasrky6rdD+3Xsw+29nMjDfwK3rZcZQngyHrWUjeG3UGn3L g==;
X-CSE-ConnectionGUID: iPfYSRvKR065gBkmnMuqEQ==
X-CSE-MsgGUID: JqENVHAoT4qTF13oeH6dsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="83765715"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="83765715"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 03:48:00 -0700
X-CSE-ConnectionGUID: 2OWV8zleQfC8cJUJLYu6wQ==
X-CSE-MsgGUID: 35okL1fMSluH4AnXMe/WSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; d="scan'208";a="234693932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2026 03:47:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 03:47:59 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 17 May 2026 03:47:59 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 17 May 2026 03:47:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CKOQgEqh5ReLrYtgYQa0MihH+w7uYwA3HNw6n+9nGD9wuBEqItJvXbACeFpvWsZbQTaBPctEVNTOED15l6x0rbVnLcdQ0DYXXKxFo8WgBgMrzpkOcRukfvEx5kecG21NgcmSe71B7Z2ND6gkKhQ7yj5+BAkAj4z/se20ziOTPvYi9M236UVFEeeWNIVIpYSsWD/7mZCkRKNARobDwGGNMLrfJ5ZLbzNlvq0urMpR64Zr3Xvwc4k2QWcowpvvQTMxsCl7LOvxK7333glPONb2KWT7++txeKMVNXCmxPaoOHX3SDfBra7n9DUI94DdyqPu2L1hgSAQTS6BTM+TD0d33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whzmNsrSJqoL6RqVMU2l68A10lOf9OjnyIeDeQaLH/s=;
 b=SfS/Bub3dNP8CGFXAcOyqgQxIBFDW4JHV2Nqa1PjLDRRePzS+F/CTEDySEpkGU/wp1UHxhXyF5izQMTIg4VujarWAMoR0gQLZ6Ja3fL/Py+zi36f+pAXTK5c2YpdD5MoIJ7d7SLdkkElaAN0OTiXbCpTQNj4Ti+8M9TS7GAbXqc7Qh1S8w/IzCfQsMMdgzYYMWoT4tVlgOelz9UwB5cPpYUrpU2QdWh8jnIKAcMWOE4Vi91m2Vb6Ww483ElBXYWQYtXRB9KOYqY3FSTdmz0TcxL1156afw5viq0L7JLaDzd9/rbAfN2F0btigFfKDlCHDPZsferq45FYcSumgdEogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15)
 by PH0PR11MB5078.namprd11.prod.outlook.com (2603:10b6:510:3e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Sun, 17 May
 2026 10:47:56 +0000
Received: from SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563]) by SA1PR11MB7014.namprd11.prod.outlook.com
 ([fe80::9636:7375:2667:d563%3]) with mapi id 15.21.0025.020; Sun, 17 May 2026
 10:47:55 +0000
Message-ID: <ba5b737e-0200-4912-b839-39fe4ec6aaeb@intel.com>
Date: Sun, 17 May 2026 13:47:51 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Revoke drm_vma_node on xe_mmio_gem free
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260514191649.592407-1-shuicheng.lin@intel.com>
Content-Language: en-US
From: "Levi, Ilia" <ilia.levi@intel.com>
In-Reply-To: <20260514191649.592407-1-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0004.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::15) To SA1PR11MB7014.namprd11.prod.outlook.com
 (2603:10b6:806:2b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB7014:EE_|PH0PR11MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: 829fea4a-5a82-4455-d88e-08deb401c0b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: fmAC+z/L5gRR0Zn4L8JR1c0sUBcNShpQpVBuhV6qzkQR7gBoljHnj1sg+QMQ4IT4SiPWYlXa3Cu2PQF4ozqWEmmM+LUYrPrwzzQTbkSQojT5yUmydNG6eX6d0uhwE1l95BS9TXc8GNuFtf5M1k4/JIeDDd4HbGWZ8m3prQw4S5Xwz5je14jRjsxXuRXTFsQN7sEB3B3EKC7bwA/KgKAsqpGa6nhlikoX+dfIL25snI1tzBM2vgG0LEaJmsrgIj2ND1aY1eQGijAOhwcF7eeVO9Qi517hbY/TYqZGCdjE7J6qevQ92uDHpXesKFLLhoe5kYSF/xnvtq6OW8H1SeLmFNRqFvZsFDJhawHHKEj3WScudkj0GCTMvUraEWp8ERhrU/5/uI5K0OX5XNDsr4f5nnUvP+M5nZqvBmjUZMrgoL23gT5PNNjFvdGcQPWRnMhffMiaw3Wqg+vEWyEB3QGL47z+v2ugHbiwWrqBHEdqrJa4NoAtl6u7/zZq3k2lQbKB/R64KPjIbDneIIICUgyi/hToUVaIxDCsEpny2jO24bkEn0aJSTZB1oNpA0CEYXM2YBFp8/T+wIhWNHVm/RfuJteeodXJBLaa50x+OlJdaym5VvUOn6BnGm7oR83aOWGm+qsjb6pV5OWUfMjfLad58jCq+xXaxuSrkjop1AK0tE6XzV3AhYttswy8cTGjT/z9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB7014.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHVpNi9DcVJJd1VYUjJsRDNJVTdqMUJrTGdlVUx2Vzg1cEtUUVoxVWsvUkwr?=
 =?utf-8?B?NGZzc1I4L0pML0VydnBGbnZubklwbGhNaFBkdUxLSlJtWmE0Y2xHZG83Rm4x?=
 =?utf-8?B?NFlUY1dSN2UvMS9kTW9EVnMrbCtRWGdBQ0llV293OEFMWmZpTEw5R1g4M1ls?=
 =?utf-8?B?ekUxTDhxYS9RS0NKbm00SlZqMEY0Z28yOWM3V2UrV3hzVXNhSlczQzYycGs0?=
 =?utf-8?B?MUNDUS92MVhWK2wxajg2T29DRklzNlNkQ04wMU5melNYZWswSjJaQlhwY0xB?=
 =?utf-8?B?RDFCc2hRdkdsUkgwQWJFSzJJWVNBZlI3bnIrU05PQTlCMXgwbnN0dnRDR1dw?=
 =?utf-8?B?WXVhcDhRVURLYlo1MTdTdG5qdXlpNVI4YmFWdmI5eXFRTGhjSzN4VHh3YWhB?=
 =?utf-8?B?d2Rjd1V2a0JWOCtIUUt0bDNrelJrOG0yTGNONHRPbjZOeEUwSVNSNksyNTlh?=
 =?utf-8?B?bVFtamZpdkU1MDhDSXEvOGM4LytRbVFLVjl2MWRZSDQzWTRBMDlFZGNUOXBO?=
 =?utf-8?B?RlJUNFcvSS9DL3FOcnVoUTFTZFBLUzNwdVcrRlM1d3p1ODJmQVVjeEVRWG5O?=
 =?utf-8?B?cTNrMURQYlhrOS9NZ2NEeVlaTjJmQllxUlgrS3YxeGtxZGtQV3VEV01uRUYv?=
 =?utf-8?B?bHF2QUorWGU1UitIeDJIZkJuNVl1eUxyTWdudUJaNmxTWEFDREc2elVnT2dm?=
 =?utf-8?B?ZlltbXZ6VzNQVkR3T1pOU1VaWldrK2NHaGtSUHFWV2VKUUQraGZsL3ZvZU44?=
 =?utf-8?B?dERuaUpnaS9nbDBGZFAya1VacStMV0JsZ0gxdGZvU0RINUE2dmRSeHN1TFJq?=
 =?utf-8?B?WUdHRDgzVmhJeGg4NWx1bmY1dlZqSjdHYjNoZU9Od3Z3RTh3bUVtTEZoOVpM?=
 =?utf-8?B?ZXEwbmFTYWtJUWl2V2l3MktObzNpZnExYThNZjZtaEV2OEVzL3VBaUJDdVFZ?=
 =?utf-8?B?NUxxL1BOTm4vYkxZbUVKRkd6TU5DUnZNNWxQME9adTI0Tmp2MDJPc0xLd2Rp?=
 =?utf-8?B?TExTQ3o2ZFhOdjV1dUJKNmZsRDBlOFQvZmppaElDNmRQdjI4bHlHOE0wVmJi?=
 =?utf-8?B?elVkbEErSFp6b1A0cHphY0xtdUk5blFEYWZHeDdaSVNUUWdnQVZpaitucVhM?=
 =?utf-8?B?YmRUVENzdTV0Rlc5VTlkdWgzdEtweFRSMUZ6NFd4TThDQmt1dzNNeHVzQW81?=
 =?utf-8?B?OEdvQVM3OXJrWkhEN3VwL015anAvNEtyWnBMakNsYjgyQ0VWcmFWNHhiaFB2?=
 =?utf-8?B?M3RqZkZXdGVWWGN6OWpqZ0puZUIxc2pEUHBVdExORFBISk9WWHk0YWJXUUpi?=
 =?utf-8?B?VGJkRnpXTVZRSUhtMklCOTBWb3E2SUhtR0QrZ2dQVmwzMjFwTXQ4cWxWM1FT?=
 =?utf-8?B?MHpUQmZKODBZM2NxdHpQNWh3UnRXazlYbGRFRS9yeGlQVmVVSVNzeThyaE5E?=
 =?utf-8?B?c09IRE9tQ3E5enFaR1UwRitMUjh2bkRncXYyREgxZlJ4Ly9rUE1paFhjZGc4?=
 =?utf-8?B?TnpEUEN1WEhwb1RGdzVLVXN1YncvL1I2bGpkSjFWRXBVYU1VZmI2R2JweEM5?=
 =?utf-8?B?eTlqUzdYdXA4V3VTd2N3ZEFUczJuVmJCamg4bmhEMldWbmc1cFIvb2FFSTQz?=
 =?utf-8?B?bHdwcXdHTWJsR3NNWXFhMjVIZDhSdy9uaHRIU1JzbjJ6N25PMG4wekZmdUpW?=
 =?utf-8?B?QmtadVF2U21XY1MrRzBFZU52czZHMEUxUWl3US9jUlAvUXNqZDREL0JKcDlB?=
 =?utf-8?B?WEx6aUg4Z2pVYzEvRjhlU3BXVktFZVE2ZCs0K0RVYW5LQlV5L0NiV2hoRTVn?=
 =?utf-8?B?ZnN1RkYxZHdFTVRGUm9GaHluNDd2aUhwQ2psWWlkQitCTjdmYkZ6SEwvbm5T?=
 =?utf-8?B?M2ZhM0liMlJUaDBlV0Q1QzJEamZXQzNoTUh0QitFOU91Y3U5VERFWUFwMzUw?=
 =?utf-8?B?eXpiQTJ5MzVXcnluMXlFVlk5Q0hmSm43SHNXeGE1VUE2VlFjZ0U3VEkxMmxK?=
 =?utf-8?B?ZWJnNEZ1Z2RDSzRaOUxiOC9nZ25NZ25jdXNiQ1EvdlJzb0NPZGVnL3c5WktV?=
 =?utf-8?B?bnZNdTFCWGpHQmxOWjBwRklpMi9hUkZPM2NRSWtibjNMQTQ1Znl4MDlOcHpM?=
 =?utf-8?B?SU03TzZJeU9lSnJSWGEzU2E5UCtQbjRGVFVtTk9nZW5aNWo2eTM4dHdrcWZI?=
 =?utf-8?B?dExJZFlScmRmOGh0SlJkSm9TMG5aMXFBcTJyR0dlSzNjMWk0VXh0SXlwYkRZ?=
 =?utf-8?B?K2hKRnE4bWpyemo5NHdGQ0FwKzJyL1J6YStlZG5CYnJ5THExUnlTaGY1Qzl2?=
 =?utf-8?B?NW1YV2tIY3AwaDFFQkZFcnB0NUNjdnBjenBTMXAwWjJyMHpuNSt2Zz09?=
X-Exchange-RoutingPolicyChecked: sPo3jsp7XNoh+U5F6SP5ncNM96KcF0toobXr79SIfnLqLeBl1Nj/8jiG06owMu068gTpgt5xvObDm/PB7dVLkCbnSEyH0iyN5asDtnueUGP6Fc8eT2hibkzuujIASDtQq9WKUib78f2VObzq8bUmgCLxKXLPfECeCD+4VyPjpwHRzP+pSdQgYFJYsMfTdaKWraW0vBA00+swHBhqHI2OKxGSqiJunF1UYOxKPJdJx7EUwPtdmtE6OrhyhWcxGKyLxQpxafukXTzYCoi1EPXkD9GCgl7dPq2JSIA92DdKbLoJonKWCQJOKsbjD3uUNqNhxY8S36OiK8PVu122vULujA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 829fea4a-5a82-4455-d88e-08deb401c0b0
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB7014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2026 10:47:55.6214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0F5RaNxMpT+zNHs5GVfgqloe+fil37VvTDAX3Hs7RdN9DQUUI6cDhufm3rbsvJXAHlhckE0WrDpaZ3PxBkQtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5078
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

On 5/14/2026 10:16 PM, Shuicheng Lin wrote:
> xe_mmio_gem_create() calls drm_vma_node_allow() but nothing ever calls
> drm_vma_node_revoke(). The drm_vma_offset_file rb-tree entry allocated
> by drm_vma_node_allow() is not freed by drm_gem_object_release(), so
> it is leaked on every create/destroy cycle.
>
> Store the owning drm_file in struct xe_mmio_gem and call
> drm_vma_node_revoke() from xe_mmio_gem_free().


Good catch, but I don't think it makes sense to cache the drm_file.
Consider adding it as a parameter to xe_mmio_gem_destroy and
call drm_vma_node_revoke from there.

- Ilia


>
> The xe_mmio_gem helpers currently have no in-tree users; this prevents
> a latent leak once they are used.
>
> Fixes: 1ffcf8b8ae8a ("drm/xe: Support for mmap-ing mmio regions")
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
> Cc: Ilia Levi <ilia.levi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_mmio_gem.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_mmio_gem.c b/drivers/gpu/drm/xe/xe_mmio_gem.c
> index 8c803ef233cc..78f6cc6fe9a1 100644
> --- a/drivers/gpu/drm/xe/xe_mmio_gem.c
> +++ b/drivers/gpu/drm/xe/xe_mmio_gem.c
> @@ -36,6 +36,7 @@ static vm_fault_t xe_mmio_gem_vm_fault(struct vm_fault *);
>  
>  struct xe_mmio_gem {
>  	struct drm_gem_object base;
> +	struct drm_file *file;
>  	phys_addr_t phys_addr;
>  };
>  
> @@ -96,6 +97,8 @@ struct xe_mmio_gem *xe_mmio_gem_create(struct xe_device *xe, struct drm_file *fi
>  	if (err)
>  		goto free_gem;
>  
> +	obj->file = file;
> +
>  	return obj;
>  
>  free_gem:
> @@ -121,6 +124,8 @@ static void xe_mmio_gem_free(struct drm_gem_object *base)
>  {
>  	struct xe_mmio_gem *obj = to_xe_mmio_gem(base);
>  
> +	if (obj->file)
> +		drm_vma_node_revoke(&base->vma_node, obj->file);
>  	drm_gem_object_release(base);
>  	kfree(obj);
>  }


