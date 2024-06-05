Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B6CC27C52
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 17:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B4310E37B;
	Wed,  5 Jun 2024 17:45:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYrWgCYR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D59E10E37B
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717609500; x=1749145500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=roPaW7YInGPrhNv9FIhJVPweNO/dEkK19XPqznALbRQ=;
 b=kYrWgCYRlWYKI7FCclF3QZXELLVryBkzZ6hG7EfHAlgYCz7D7APu6m8R
 O1UcUl2fcwzbo8yzNchCYmSTDXKpO5mPZlMhOmA37AxXPrHP5BzSvlZxm
 IIZrKDe1fdfzl7re2FSB7/GIy3wGsWluxA+cErEPJg5zJ2EevHn3KJU3t
 1vUUxILRTHfu1MUC9QBYHpGAgoUcjojGCTjQa+i9qMi8B6oXsjZ9vjoYV
 UvjDsJggh0eTwJHGZ9CMMHQx8IEy2jWkWSVdZBffHRfQjhBnxnOmF99ge
 vj1Ab8QiC4ixADm43pCzrvRafslekcHHC/9/e5BE+rtIdiP9yUbd2S/ns w==;
X-CSE-ConnectionGUID: gt8XzhrjRgqYOdkauxabeg==
X-CSE-MsgGUID: EUYCX25yRxiLZrUMDA62NA==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14456816"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="14456816"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 10:44:58 -0700
X-CSE-ConnectionGUID: 0HfN2ygSTHaomisj+fMuBQ==
X-CSE-MsgGUID: m8aUDXYVTHOQvZdzAdU52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="38233576"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 10:44:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 10:44:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 10:44:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 10:44:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 10:44:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3wc/zelb+IsD1xBa9z//V+0jDuTaf+Uf8If01hVPnS88UX7KlDS+NzoqFzN8Y2+jLx1CmC9At+CjLAakUY4z5lOugLMTbnqvuZT66g6tVcnQzAQlPvx7Zg5UaSEqlhnSTjAxP3omb1z1MDI8yjr99lnkECtAoYilku1Iyxo7PnVygwttKv5/AxIGeW9dI2ovNOfvvAgJrrJIUUAs9M+qEY200vBu1IQI/dpxJpLOtpFmJ2QBsri9pqLh32x0oMjb+PfcZFcLpDujAh+M8pnVdudN6Y4LSBVUgrcUR+11FQ2cIY+hUDGqJHFj+MW67ttcfLS2iKok6YL5JXsBjoLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKScpLhFuxiB1jcqhsynWnDjp92A4kLgvzLef4/3axE=;
 b=jiC5tErllpoY7ENFcUk99GHnAKjH3n86PImMZPPGqgccRAhyVIWrbmjuS9klmn7/tIKVKuFas+WwZzrAOsacYy6BTirRhey7YbSv0ubDHJjfpyl9OKKTdD3dliO9ecUT4VlNOijilqXgPk5vq5WIVoGJu6zC6rYJIse5bZ0t1kkUyA094HW9Rxo1SiXF7Isvn1Rk0LEKjWNDK7glxMdIxIztkcwbIEBoF4mKDlkrtYziVBNwXTwoZ85tQ/gCouwucn81rFC4zLKmWOqXvTxC+US3c8UH/eP8yB4v0zhGvqijAPvYuKUE4CBAWxSqSeQN7M/8z0MNeKgXOf/hzVAeHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CY8PR11MB6865.namprd11.prod.outlook.com (2603:10b6:930:5f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 5 Jun
 2024 17:44:54 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%6]) with mapi id 15.20.7611.030; Wed, 5 Jun 2024
 17:44:54 +0000
Message-ID: <e8f27a5c-f2ee-43cc-accc-4a5b375bcb81@intel.com>
Date: Wed, 5 Jun 2024 23:14:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/xe: Cleanup force wake registers bit
 definitions
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Badal Nilawar <badal.nilawar@intel.com>
References: <20240605095005.1261268-1-himal.prasad.ghimiray@intel.com>
 <ZmCgJoLGcLLUqInY@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZmCgJoLGcLLUqInY@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0159.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::29) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CY8PR11MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: fe81a0b6-7efe-4388-bddd-08dc85873535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TDZzYVpLUm1idXgzM3FpUnJ2aHo2OVpqdmZxOGhnREY2MHByN0hJOC8wb3hR?=
 =?utf-8?B?VFR3cFFLMDZ2d1FLSnp3cFVjUUNYWWhIaTkxYXFvOTVWbklUQVRDeUxuNGNH?=
 =?utf-8?B?VGFxbm9CdCsvNStlbGMvL1Z2bGJKRnJycGk2SlVEMXd1UkdjRU56Y0MwakJ4?=
 =?utf-8?B?WlRZQXFiWFkydlJ4U080YVFTSGgzSy9GaXZxcFpCdXVSNG9aMGgrQk12dmZa?=
 =?utf-8?B?ZE5XbC9SSU9SS2NlbjV5cW9lcFc0UEcvQWNlZy9WUW05azE4UkhxYVBCSmZW?=
 =?utf-8?B?MVcrZXBkTUVMLy9hSGN1RjFJR0YvVjRiVkNGVy9vcE1OcDRMWUIycStyWkZt?=
 =?utf-8?B?SGo0Wm8zNllyYXBQc2dSM1hiZmZkZldwZU5qdGlvK1oxVUc3Q3VnU2pycWs5?=
 =?utf-8?B?Q0tYbU5ONmNOKyszWlZwd2hxT0hZRDRnZDU3a2RTNml4dThwYzRneTlSK1U4?=
 =?utf-8?B?UENhZW1hTUlzYUNaNlRlTFZRVjVXcTBhaTNYSlRKS3dxWG1xSXJ1QjkwcG1k?=
 =?utf-8?B?Wnk5MnZuN1lUanE1Mi9sNHJSK2p5VU5XMmpXcU10RnJHTnI5eDNIL2JDdXF1?=
 =?utf-8?B?bi9xeDFKT1VnQzNWc2RLQnZwUngxU0RyYVpaYVBjN2liY3lwdEJHQUNqcXVX?=
 =?utf-8?B?Q3VSV0QzQzIwVk5IUFBJL3dwcW54ekpac2t4R29wWnpIWWUwVTdZVjd4MUdy?=
 =?utf-8?B?dmZhSmI0Nno0R0pma2t3VVYvZmdqT0ExZEhoUG1nMWJ6YmNMZUpTZDkrcWc3?=
 =?utf-8?B?VmNydUNQK3N2WTdUUWFpMWJQdW90WVBUSWhFNXV1c3JmVms2RE5JZDAxanVE?=
 =?utf-8?B?SVNaNnZPMU1ZZkNlZnRERG5LSnEybmRXQWVZYzRwVHZndFNPcWl3S1hwTkI5?=
 =?utf-8?B?VTk0NzF3d1g1bWQ1Mng0UFBHYXk2N1ZLZ0xwUmRIMjdIRGlnSnVjR1Z2Y0Zz?=
 =?utf-8?B?OFZpZmZrb0RXc1NzdXBNcThZRkZZK3dXcGp0QmpQZExRYnQxd2RyQy9QSGp2?=
 =?utf-8?B?aS9GS3p6NHZUNmExTktQQnRrVGtRTTRvVjI4dXUwWXBHc1hlVkk1NUdyT2k2?=
 =?utf-8?B?T24rU2NiSDUvQ3R2dGVRZythYTZTTHUrTHBIaG9ld05pTHNQWGZQcTNrRmsy?=
 =?utf-8?B?cWxmd1FLL0hsaEsyMVQ5K3l3aXluL2l3Y0VXTFgyM0tYcHQySjR6eWI2VnlH?=
 =?utf-8?B?M3k5bW9mS20wUWplU3JZVFVpbUx0YzFkY01EbFRuQjI4cEdtSWQyOHRUTGRi?=
 =?utf-8?B?aXRzRERpMGw5dXZ6WVFsNXZWRldBemJqbm9tdVljYnVyR1BNTmhMd1FsL0NZ?=
 =?utf-8?B?Tkk0R2UzME5QbjdHalNwYWxFUEtqREdxWmpuUG9xaGxTOGNuMHV3WjA1Q3hG?=
 =?utf-8?B?T0VOei9pM0c0T1IxbzNuNzNzTDBoZGdSdW5RSWlmUm5pSWZiREFmS3NCZVpr?=
 =?utf-8?B?Q0Fpcm5EVkhES3VwUklMY3gveldPTkMzSUVocGpPWnRBdUQybGx0cHJqRkhW?=
 =?utf-8?B?NTNlK1VWSVpmWFF2RTFCeUYwOUNocHZYWjRUWlJsL0oxSXBpSTRSNWxiVDRn?=
 =?utf-8?B?N2JCV2ltUWpINmJtb2wzdGVaSEJiOU9mRi9NM0FETjF5VzFGeU0rZmlsRWdp?=
 =?utf-8?B?VHptdnM0TXV5UEh6bG8xVm8yNExhTkJydDB0Vmljcm14bFcxQWE1S2VSZkhw?=
 =?utf-8?B?d2w4K1N1dkpsVEFpRnl6TzZKRGdvMWEyZHMybll1V3VTdG9JWVV1M0pRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFRrcm1oeHFYSjM0S21RckJJUEhoc0dNWE4zRnFya2hPaWY1VjRPaHo4MStG?=
 =?utf-8?B?SHFocERUTVhobUdlS3d2WitRaysrdmJxcmpwUDZENjRyQzhIUGtackZUWldQ?=
 =?utf-8?B?ZVc2bDlobE10WG9GcG5zVSt0V0ZkL1A5WmROMGlVaDNsbjBVTkJ0MXg2RHZC?=
 =?utf-8?B?NldTcWdwQ3RRMXg2MHF4ekRQTnJDb1Naem40ejVWOXFmQ1NuZmR3c2dnRXB2?=
 =?utf-8?B?MGZCWUZxUGhicEZTNTVOYUNyQVB5dnBPZnpOMks2LzNGQWR2QzdtR2V6S3g0?=
 =?utf-8?B?dVpkRTYwdzNpcEEzclJmVUcvZEpVcDc1ZzhGNDVFLzI1KzBnWk5VQjUzbEJi?=
 =?utf-8?B?cHIyb09tRUpGTitvSUdWQTFFc0hZNTR3SVNxTGRHTnJocTNDdjJ6RGpiNVFF?=
 =?utf-8?B?OUFzRXgyUGZTUXRsRHlBblV1d01paktOeFdJNENOdXMzMm1hSG5oMVNzOWlI?=
 =?utf-8?B?U1hYc3VYM3pLOTkzSnVKalJrOVZSOWNkcldxTmdHVEtFQUNUL05PbGkrVXY2?=
 =?utf-8?B?R0k5eWd3VXBHVExyYUlpTkZjM2g4WlgzSWhXZkJTMHhZaDdsQ1RkaXRHelpq?=
 =?utf-8?B?RTllMStzZy9oaGZtY09tRkhkQm5KMWtXZXVId3FkVGFKNTFlNjcrTm01ZDBO?=
 =?utf-8?B?RzJrckZWREVFa0NMZWNTUnlaVWtyWFFuTkVOdld0cVRzK0lsLzVaRFhrcGY2?=
 =?utf-8?B?QUh5UEV1SGUvL0Y4a08xd3RJWVRsU0lSbXUxMGVRWTdDSThUOVFTQkNXK1pU?=
 =?utf-8?B?NHFPMkEvQVN1SlN1UUJkU25MS2J1MEZhOG80TVNZYytwcmdKZm1zVFk3RTBo?=
 =?utf-8?B?cUhHMFErSjdZeFlSWTQ3aytmUDYrcndSeE5xTHA4WUVQMW0ydyt4WHlDaGtu?=
 =?utf-8?B?d1JnMithbzhTL0l0RkYxaXZ4TGpSK0JUamZQUG9YNEpFMHdwQjBwcURrdCtI?=
 =?utf-8?B?MGFTNWltMnZTRzBsZ2xweXpmbW1leVVHK0gvOFlka0tmN215U3lWMEV0MHJr?=
 =?utf-8?B?eW5LTnlmRVp6eWw5L1h5NVhDek5HVU5DWThZOFZDRVRwNWxOZjFSS01paEFp?=
 =?utf-8?B?YXJVSytVd0hCTU9Kc2xhT2V6dUpWWjNEZWFKNytTVGhRRkRDbkwwSGdwVktY?=
 =?utf-8?B?NERldURCTytOZk9JTmtWVXVxY1VYTE12TkpyN1lxWjRmNmtLTG1mUG50SXh3?=
 =?utf-8?B?TkpuN3dyWGd2d0Z6Rm9lSkQ3YXFJbTVIMVYxTUkycmpiSlJBditTZmNiS2FQ?=
 =?utf-8?B?ZjREZmluVlFFQ3M0NFNBZGt4aW5nUGtJRVJ1QXpzTVRtWm12L2ZMVnluYmZC?=
 =?utf-8?B?OGRzVjJIS3doMGV2UW0wRmdHUTBPdVMzckw2NlM5NVZOazFaQ1JFZS84UzhJ?=
 =?utf-8?B?cDZ1YTREV1hwRFZKbG1yOExIdkluL0oweTk4TWVwQzd2eXRoZWI3TUYwU3Er?=
 =?utf-8?B?RmNoVUgxYjhVd29RdGRtRi9nSVZjNWJaZUVSdG5RSWpYNm9mZVBKeDlnMy9D?=
 =?utf-8?B?SGRIb1NrQnJPOVdha3V6dTQ4d1FsNUJqRVM4UmhMRnNIQWJ6d0JNYmxIRjhx?=
 =?utf-8?B?R21LalZQNlNYUGlIZ2tMeWR4NGUyNTFaY1RYNkwwYU13UllEZUhZclM1Si9P?=
 =?utf-8?B?NVpqWXhOWG9SMWprRlZkSTQ2RnNIMXJQVkR5T055enpDVFkvZEdNVjJtZUdI?=
 =?utf-8?B?N3I1aitSVWxBWTVpcnFWZXhYbGZwQVhhVVEzYnEyeXNVdEtkZ3RKdU9SZExp?=
 =?utf-8?B?amRVR0sxbndIRU56Y09na2ljVnhlNXRJNFBVT2ZYRzU5R1J0ODFnTmg2UDhu?=
 =?utf-8?B?b00yMnF5R1h3aUhpV01seGJmWE4rRWZUaEVWU2FYeVExaGI1Rm9JcDg0ZU1p?=
 =?utf-8?B?QTl1V3M1OFVTc0xhZGdFV2cxR0hBY3NCb2FpY0s3dVJNUG1Ma1BvUHJWT2NC?=
 =?utf-8?B?Tk50MzBmMndSMUpVRmgzNmRpNERaMGE0L0tTVkFLL0JkNjdqN1c2eHpMRTUy?=
 =?utf-8?B?TWRocUtta3dmR29WamlTTDNxcmdYNFlSS3AvTVIyWTJ0bGNwcEZweXFUaHRj?=
 =?utf-8?B?bW4xSzFVbmhXR1RRRXBGbkhjQm15dWpBWEFzNWFDMjJtb014dFBEaTV6Qnll?=
 =?utf-8?B?eGE4MDZqQ2RCSG5Xb1R2UUZsQkxGMXpZU1hqT3FnQmE0TGdVbFAxS2tqMjVH?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe81a0b6-7efe-4388-bddd-08dc85873535
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 17:44:54.3001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83V5B6nF9gqHbElHuppWMtrXWFKi/5QYh0YTg5u4b51sRdNJU5QbTivXt/pUzqkZywdLkBgctMo676S1FsyibowBvqOh792W0W22Jc8NcA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6865
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



On 05-06-2024 22:58, Rodrigo Vivi wrote:
> On Wed, Jun 05, 2024 at 03:20:03PM +0530, Himal Prasad Ghimiray wrote:
>> - Remove unused bit definitions.
>> - Driver uses BIT(0) for waking/sleeping the domain and since the
>> registers are masked respective mask bit BIT(16) needs to be set. Use
>> defines for these bits and use them in domain initialization.
>>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++++---
>>   drivers/gpu/drm/xe/xe_force_wake.c   | 18 ++++++++++++------
>>   2 files changed, 17 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index d09b2473259f..47c26c37608d 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -487,9 +487,11 @@
>>   	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>   
>>   #define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>> -#define   FORCEWAKE_KERNEL			BIT(0)
>> -#define   FORCEWAKE_USER			BIT(1)
>> -#define   FORCEWAKE_KERNEL_FALLBACK		BIT(15)
>> +
>> +/* Applicable for all FORCEWAKE_DOMAIN and FORCEWAKE_ACK_DOMAIN regs */
>> +#define   FORCEWAKE_KERNEL			0
>> +#define   FORCEWAKE_MT(bit)			BIT(bit)
>> +#define   FORCEWAKE_MT_MASK(bit)		BIT((bit) + 16)
>>   
>>   #define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
>>   #define MTL_MEDIA_MC6				XE_REG(0x138048)
>> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
>> index 9bbe8a5040da..54279c3814af 100644
>> --- a/drivers/gpu/drm/xe/xe_force_wake.c
>> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
>> @@ -52,13 +52,15 @@ void xe_force_wake_init_gt(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_GT,
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT_MTL,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
>> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
> 
> hmm.... looking at this now I believe it would be better to just pass the FORCEWAKE_KERNEL bit
> number as param and then use the MT and MT_MASK inside the domain_init function...

Hmm makes sense. Do we expect to use any other bit apart from 
FORCEWAKE_KERNEL? If not, how about not passing FORCEWAKE_KERNEL at all 
and instead directly using MT and MT_MASK inside the domain_init function?

> 
> but up you... my rv-b remains whatever you decide.
> 
>>   	} else {
>>   		domain_init(&fw->domains[XE_FW_DOMAIN_ID_GT],
>>   			    XE_FW_DOMAIN_ID_GT,
>>   			    FORCEWAKE_GT,
>>   			    FORCEWAKE_ACK_GT,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
>> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>>   	}
>>   }
>>   
>> @@ -74,7 +76,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_RENDER,
>>   			    FORCEWAKE_RENDER,
>>   			    FORCEWAKE_ACK_RENDER,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
>> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>>   
>>   	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
>>   		if (!(gt->info.engine_mask & BIT(i)))
>> @@ -84,7 +87,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_MEDIA_VDBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VDBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VDBOX(j),
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
>> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>>   	}
>>   
>>   	for (i = XE_HW_ENGINE_VECS0, j = 0; i <= XE_HW_ENGINE_VECS3; ++i, ++j) {
>> @@ -95,7 +99,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_MEDIA_VEBOX0 + j,
>>   			    FORCEWAKE_MEDIA_VEBOX(j),
>>   			    FORCEWAKE_ACK_MEDIA_VEBOX(j),
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
>> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>>   	}
>>   
>>   	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0))
>> @@ -103,7 +108,8 @@ void xe_force_wake_init_engines(struct xe_gt *gt, struct xe_force_wake *fw)
>>   			    XE_FW_DOMAIN_ID_GSC,
>>   			    FORCEWAKE_GSC,
>>   			    FORCEWAKE_ACK_GSC,
>> -			    BIT(0), BIT(16));
>> +			    FORCEWAKE_MT(FORCEWAKE_KERNEL),
>> +			    FORCEWAKE_MT_MASK(FORCEWAKE_KERNEL));
>>   }
>>   
>>   static void domain_wake(struct xe_gt *gt, struct xe_force_wake_domain *domain)
>> -- 
>> 2.25.1
>>
