Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65133CEACEF
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 22:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDBD10E051;
	Mon, 17 Nov 2025 22:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRuGdpNy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F6B10E051
 for <intel-xe@lists.freedesktop.org>; Mon, 17 Nov 2025 22:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763418554; x=1794954554;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ENWJA8NxvpBTGM7NUJwvoualUx7ZbgHiZUY0C02NWgw=;
 b=GRuGdpNymTzGvhvqqJEZXmbe0txIRIUGwOd5dQfa4uv7X5Xf3spECtmh
 hhSIXg+B16g5On+4oiHazSaDbF5faCrOwywx/rgkwNo/f41YVGQxTzgdm
 k987Z6gGCWpC6wiFaWwsPegbdMPSD/EblKJxdF2qL7M6GJIQzxQHCLHsL
 V34D8dZyso/S327VrGZxXMMnmh7mqMj+wNTlZ1PnhBp3cda2z1W2ZUhwM
 oKHvO4PGVqX+7q7U+T4aVHWGmABnaaV7p14yghPrIfHoG0Eqn1/4Dm8R4
 2T+AT2sIrMvTLedQFLGG57M3srDYhRkovxPut34Oi4V7C5GNEowWWs7WB g==;
X-CSE-ConnectionGUID: xyU12dmnTk28GhVUmCjcbQ==
X-CSE-MsgGUID: 6pHIKf5MR+SGgz28jDj8zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65584992"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="65584992"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:28:54 -0800
X-CSE-ConnectionGUID: 8aV6WmoCQhyZTnVqsin1QQ==
X-CSE-MsgGUID: RxqXMZAATdWPfn7RczMJGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="191363071"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 14:28:53 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:28:52 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 14:28:52 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 14:28:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N946RVJgzBvLR5mI51SDuyM458R3x38LBub90CmP7VmDGcfW9xlRZcy4ebFBfcOjR+ElPMLaBvIPkevwNB/KkkHfIVjSLxjrsPRAVQ/D7DIMlJFRTaxGBQSngaMp0AUBGtLwBqh6a1bvbmVqgcVwkhd55EoGCdlEV7/z5B2zTnGyFIelu+VlRjjsKF5aiRTSVjTCBamMzMRu8aM+7TMJPWbQ8kbXzv291RO42V758A8Q8/Mu4znCVAbY1YC+NdlDCPO67qTth2He5VA0iLItl9WUvxkW2SnbAcgAETR/Aq6PqGuHritNQbC7dMJ7jGpfsfm0bkTukDODNVN/XiznZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCVWF68P6GeZzNFMvxjid4Ga3QdQyr/DY7yi+ntJQQ0=;
 b=Mq0Z6qy7XPOiMXx/FPWaFUCb+QoGIFzXjKYF9jWFXH0S2+aZcbF4KqYMkNj2EptuTG9J0LoYRQhL1hvHxopEqCUo/n6JTrRWlUHVTLqFU0Y9Jip5NBrgDCE5KvWRBaX8qSV71s4Tnl5HD9q7rXai9HsYE2DfkDhKnDW9iE48SR3Dic6QARy0YHneM98DwomLxn2yQXa7g/7aabJhmFUKSOErnR1MfsdukpG6VLpEg+qIDzM1BG+f26q2i9QYbKNto/ksDXhgcdVWk+gBbtTf5u0xYWnudkzI200xDbU3p+bYir/fw6Yqik8gxwYaMgZ+K90y+bjfgyh3V2n/Esiecg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 22:28:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.019; Mon, 17 Nov 2025
 22:28:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251114214335.2388972-44-matthew.d.roper@intel.com>
References: <20251114214335.2388972-29-matthew.d.roper@intel.com>
 <20251114214335.2388972-44-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 15/27] drm/xe/drm_client: Use scope-based cleanup
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 17 Nov 2025 19:28:45 -0300
Message-ID: <176341852588.5989.6309500353447632577@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::13) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ac1a0c6-6463-4e60-d4da-08de2628ae77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEdhNkU0NnZNMm95Zlk1OXhWTWFvdHlHaWl2VG1PUnNPb2wyblAzams3OExE?=
 =?utf-8?B?MHdCWUF6OVVMcXIybXlpVGxVZ1E0eVhQUC9uWDc5QitaUzg0SVJxUEtJcjZ4?=
 =?utf-8?B?aCs3R2tHNk1tamJRa21QS0JzdWFSNVFRa1FDSE9oMC9jdzVSZUJSZWRqeDdm?=
 =?utf-8?B?QWZ1SHR3MGx5TUtlSjBHK21RV1FySzVFOTlwSUdOTHZQTi83R0FMQlJROWJt?=
 =?utf-8?B?S1J6eW9zSmJWSTJscTNEOWpqNEI1dm0reEkvWDhRb25xMjB5QjdFY1RHWXZs?=
 =?utf-8?B?dmkrMEx5a0ZDbC80eU44enhmTWlkT1VFdE5ZNExBMHdRMkpKelRJaDFyeEJu?=
 =?utf-8?B?OGxIZ2lqb2txMjMzTjVtTFpYdTVvRVd2VTVnTXJ5N21CdjQydkI1Ylo2QnA0?=
 =?utf-8?B?RStLV0srRlo4enZ4S0Q2RDVxZjFhTUVSc0IyYUp5OVpjT3VWemc5SmdQUjVE?=
 =?utf-8?B?OWwwdUdVaXE0WWxROFZCR1RCYllqTGFWOTVKQkpzKzEzYTJUN2RLaEdPTU1I?=
 =?utf-8?B?RDdvclB3L0FUU0M5ZWI5a2xOUjllRVZVNERtVG9YcTJSTXBwYTF1YzR6cUFX?=
 =?utf-8?B?dHVnU2lsZWg2Y2FDQW9kODNaeGlhdVVpNmZ4RXJvYm1Pa2JNSENUMnduTUps?=
 =?utf-8?B?YkdOa2ZhaVpwbXloRlIvT0g1OVA3dE1mM0pvVW8zZ2hQUXppWHRQTmNkNG9P?=
 =?utf-8?B?Vjd4Y1d5TW5DZUV5ZmMvN0pzZlpReVFYVHhkQTAwZU5WWW9VOUpVYWErelda?=
 =?utf-8?B?QjVKbVMrR3IvZlpKUzVtNzQwVFlIcHVqZmVPN0w5WHo4VEF0N1gzU20rOEVH?=
 =?utf-8?B?MzlKY0lnK0N0UUhWMjBJMVNWNmRPTkdvTEt4bFRwd3FRRzdCSVBRT3YrM3Q2?=
 =?utf-8?B?V25zZFNjYzUxRG5GL1lFcHdZeklzaGhRaEFnVmNDVWVTblhNNUVqQzYxWExn?=
 =?utf-8?B?UndBNmx6T2d3bi9IOGp4OVpRMzNoUkRtYTZQK3dxaEdUNnFRVnBtT09kRjFz?=
 =?utf-8?B?clZKeWZ4cHJIblFGWU5mbmxEUzFWbUg3QnZZUVU1U3RPTWdZd0p2SlFQNnNr?=
 =?utf-8?B?dStUQWFwWFNXcWpJRmN1SngyaW1HQXFqU3Y0bkpacFk1VC8xM2R2eG96WFpQ?=
 =?utf-8?B?b2FDSW1iWU5zSTA0K0QvUmxjTU5sS2ZQTHNxbHZQTTQ1bzVUUk9lSU55WjVS?=
 =?utf-8?B?UUE3QytBWWtqOENMNFB6bmh4bGFTZE9jakl0QUZ2L0dtY010bnRDaGdqaFJ6?=
 =?utf-8?B?cTVEYWpISUJhUWJSUjdqZi9hM0liS2J5YkdnVW1yWTI4cWkvb1IzaDI0cHFo?=
 =?utf-8?B?alRCeXZWUjNndjBRRURoMkpCVCtXSHVlRFpmRDkraUUzcmw1TWJFY2Eyc3Iv?=
 =?utf-8?B?em5ielhlT2xBYzFGWVVWTW85aDVCeTVVbUY2bEhEc0kxV1JFTnZJZ2NXZFNz?=
 =?utf-8?B?SnNXdEw0WklWRkprVytaUG13QXM2aW9BZ2xKL1VFRjBzNUpvNXU0Y3QvNzB3?=
 =?utf-8?B?UWFUemJvTjc4R0d0V00zZG5GZFJ0S2J2cjJmeTZ0Z1VTM2w4R2dadjZrUVRN?=
 =?utf-8?B?bmZ1SnVZd3FmdElkNTNZTmtmSkxwRnp2dEduK0FMNzNGTnozdDBuNEZzbEVL?=
 =?utf-8?B?amlXK3NLb3RnRi80eFZhT01UbEQyeUJzYktyQ3o1SGd0UDZZeWd3RWlaS2lD?=
 =?utf-8?B?ZlVCTFJkcHNNMysxdDFpRUhycnA4MDF1Tm5JVFQ1aXdpbHRiSHpOYlhUSzFB?=
 =?utf-8?B?cEpRWjBOaFVOeHBad1dacGtJNDB3Y2RBVlF0QkNOUVpXWmovczJ1cFN2Q2wy?=
 =?utf-8?B?dE9GSVZDelZwNjJVUmhxbjdyazQwTko2RlZoSzRLcEdSZWp4ZUFoTXd1T004?=
 =?utf-8?B?aERqZlRrNmlyS0xlVzE4V25Sem5ieEY5ZE96anpOcUNnZjRSY0hFWlNoZ1NI?=
 =?utf-8?Q?k3Gx97d21qB15I5sT7eb2o/MDVo9zNDi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpOZk83L3NVWTRJTXNuNnlJSW1YS1RMTVkxZ1RmZTAxUWNJUnhsTTBMVlFB?=
 =?utf-8?B?dlBXM25aejZaQUM3SXNKSCtrcVdEc3poWGZPdHNBK1dNem41TWxSQkIxL1FW?=
 =?utf-8?B?R2JzUE9JQ3M4NWxIMHNscngyWEtLRGp1dWp4amc4SytFWDVUTStmRGkxU1hm?=
 =?utf-8?B?MmkvcmNqUUpKSFh3OTczNmxaY2RQd1BCdFlid3gvdzEyT0ZydldqOUh1YVBy?=
 =?utf-8?B?V0VNYitvNWVXQjRxRkVjUTFrcVRqYzcwdWoyYWFNTEllRFBZd1U2MWpmUkFK?=
 =?utf-8?B?QnpuNXBIVWNmM3BvZkNNZzAxQllNeWtabWo0L3p0eERqZXhyUUlQYnNCeVFn?=
 =?utf-8?B?ZE9kYkhlSXh1ZXJDKzVVY2lFeXRUbUxENUJSS1hiS0pIMnJjRmhGUVpSNFBo?=
 =?utf-8?B?T21pNGp1UWdTaEZSUm50bTlBVDBBd3dlSGhWSEcwQ3kwNkl3b29hNVI3cllY?=
 =?utf-8?B?R2ZOWEJsOXdCTnZCSzhXSHV6RmJSOGl2ek1VRTh5STRJcXVTVE9BWXlQSkY1?=
 =?utf-8?B?S05IejlEUDdjUk9PTTJ0ODlpWnJHL0JTRnU4OEdwSmU1RkxsQ1NaQ25nRTdK?=
 =?utf-8?B?S0c4UFN4dHpZZmIvVU9ZK1NHYU8xNFM0Mk5GcEwwdzdFTVoxWHNVYU5CK3hz?=
 =?utf-8?B?dmdCeEw5eE5tN1VmRFUvampuc0xCdDgzaGRCN1FMN0FTbWFKMUQ0bTNsUnpq?=
 =?utf-8?B?RlNlNzNiN1ZtbElaalJqbTZXSUVUOVpSYjl4ZXNlWGpqSWgrVGE5Nlk1c3Jt?=
 =?utf-8?B?U25wbTArZU1pWGZZOW1VTWx6UDA2dVVPUE9NU1ZOV2FJamlGQmEyY1AwQWk1?=
 =?utf-8?B?ck9mbzR2NnJpUmRFRzFDMExKSEtXUDdkenRpNkRvN3I0aHhyRzhJZ2thN0da?=
 =?utf-8?B?N1VpUkpwNFhVL0hHaGI4bEtuK1JGQUdBdVRDZHB6RWhmRE51R1pyRm5pcnZY?=
 =?utf-8?B?bFVubkFKd2dBdUNNMEx1TGkxN3NlSjZQVkhHQ0VVTWlqSkwrQ0lWZGxNZmE0?=
 =?utf-8?B?a1ZtU295T3UzaEF0bmw5R1JxbFdrMjMyWVUwZzMwdDhYVStCK2syVnV6MjB3?=
 =?utf-8?B?KzFaM2d3em1EVTY0bjNyZ2FVWlljbk51R3g5dGNQSUZMRU5EV2NGckR5bkwz?=
 =?utf-8?B?MUNKWXp4amZBTmJtcFBUclJVOGRQQ1lCc1hEaEYzdFdXL2d4aXFYQWtRRmdD?=
 =?utf-8?B?SG1CcGZtOTdORVhNRDh1dlNkSWZlRjBiM0FFMENXVFRMUUQ2S1dPR0F0NFpT?=
 =?utf-8?B?eUNXc3VEK0QreS9pTm5nZnhqMlFzbkhwZjk5Z1hTN01TOHJ2dFU0Ti9XdTM4?=
 =?utf-8?B?SDNrbU5vQ0Y1Zm1vRzdVZVlBOWU2VEVxbHI1TlBDclNKUC9GYmgrTDRVWmJp?=
 =?utf-8?B?ZTlHajA1V2Z2OWtvSThYRTJVd3QzZTVxdWhoTU80UFlQcXRKVlBTZmdmY2VT?=
 =?utf-8?B?d1NRbXRQVEZsdjllOWhKREhhV2FjMzhremdzNjVyNTNvUmxPS0pNMi9oZlQ0?=
 =?utf-8?B?SmcxdGdmcVJDRlZRODBNYjVKYmRjNndSZThIZVFkeHI4WFVPUER3Zkt0eU5n?=
 =?utf-8?B?WFpjRU9NMjJERmJIOHhnUmFOanhTUFd6MWFlUnB4S3JLaDQ3YVh5S3JNMUFv?=
 =?utf-8?B?ZWl6SG85K2JuV0NDZjM3RFJGNjA1bTJONzYzbDB6WmtWVXg3NmNCNm13Z09S?=
 =?utf-8?B?bDJQYzhuVWVSSFpkTEVPYmZXeVhpTEttNSs2V2lOc2tuamNBcGk2WTNmeC83?=
 =?utf-8?B?eUxLcFhqR1RLMUtMUnZnUHJnZTQ5bmdCd2pCQnFlZFpiS0pMM0FHaWhzZy8y?=
 =?utf-8?B?NnVSVzNYRy83Sm4vdlJ4Y2IzV04xQlh2N2l6QlBUQ21XT1lpUzd3cjFnSEVo?=
 =?utf-8?B?ZmM0TmZlSnF0K1JrZUNlNjdxQitjaHBla3kyUkVJSjF1cHZHaUxLdGNlc0Qv?=
 =?utf-8?B?cCsrN2w0Z1c0RWs1NFNFMHU5eXFOYW5CNm5KSnJhOFZ2VS90ek8wandDYTFR?=
 =?utf-8?B?NTBxQ2RrSFIydkovM096ckdDaHphdEk4ek4wY2x1cmVSZXhhdC9KM0Ywekl5?=
 =?utf-8?B?ckxUMWdEdHVFS0FTMUw2VGh5ZTZBQXIyQlBqQlcxODlXS1VhbEhCMi82Wk9s?=
 =?utf-8?B?YzY3ejJFU3ZNSXdFUTE4OURnT0pVR1o5bnVtd05XK2VlSk5ZbXJvOUtvOVEr?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac1a0c6-6463-4e60-d4da-08de2628ae77
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 22:28:50.2465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OZE+4tNnukoDUy7m0EzLBXgQIIiYFzyjHqHe/ZRdagnL5n4l4mRFIVV/3Y268P1r9pqjVsl1QH8No5i8zaMnoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7754
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

Quoting Matt Roper (2025-11-14 18:43:51-03:00)
>Use scope-based cleanup for forcewake and runtime PM.
>
>v2:
> - Use xe_force_wake_release_only rather than a custom one-off class for
>   "any engine" forcewake.  (Gustavo)
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_drm_client.c | 39 +++++++++++++-----------------
> 1 file changed, 17 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_dr=
m_client.c
>index 78551832723b..2787bbb36141 100644
>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>@@ -321,7 +321,6 @@ static void show_run_ticks(struct drm_printer *p, stru=
ct drm_file *file)
>         struct xe_hw_engine *hwe;
>         struct xe_exec_queue *q;
>         u64 gpu_timestamp;
>-        struct xe_force_wake_ref fw_ref;
>=20
>         /*
>          * RING_TIMESTAMP registers are inaccessible in VF mode.
>@@ -338,30 +337,26 @@ static void show_run_ticks(struct drm_printer *p, st=
ruct drm_file *file)
>         wait_var_event(&xef->exec_queue.pending_removal,
>                        !atomic_read(&xef->exec_queue.pending_removal));
>=20
>-        xe_pm_runtime_get(xe);
>-        fw_ref =3D force_wake_get_any_engine(xe, &hwe);
>-        if (!hwe) {
>-                xe_pm_runtime_put(xe);
>-                return;
>-        }
>-
>-        /* Accumulate all the exec queues from this client */
>-        mutex_lock(&xef->exec_queue.lock);
>-        xa_for_each(&xef->exec_queue.xa, i, q) {
>-                xe_exec_queue_get(q);
>-                mutex_unlock(&xef->exec_queue.lock);
>-
>-                xe_exec_queue_update_run_ticks(q);
>+        scoped_guard(xe_pm_runtime, xe) {
>+                CLASS(xe_force_wake_release_only, fw_ref)(force_wake_get_=
any_engine(xe, &hwe));
>+                if (!hwe)
>+                        return;
>=20
>+                /* Accumulate all the exec queues from this client */
>                 mutex_lock(&xef->exec_queue.lock);
>-                xe_exec_queue_put(q);
>+                xa_for_each(&xef->exec_queue.xa, i, q) {
>+                        xe_exec_queue_get(q);
>+                        mutex_unlock(&xef->exec_queue.lock);
>+
>+                        xe_exec_queue_update_run_ticks(q);
>+
>+                        mutex_lock(&xef->exec_queue.lock);
>+                        xe_exec_queue_put(q);
>+                }
>+                mutex_unlock(&xef->exec_queue.lock);
>+
>+                gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
>         }
>-        mutex_unlock(&xef->exec_queue.lock);
>-
>-        gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
>-
>-        xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref.domains);
>-        xe_pm_runtime_put(xe);
>=20
>         for (class =3D 0; class < XE_ENGINE_CLASS_MAX; class++) {
>                 const char *class_name;
>--=20
>2.51.1
>
