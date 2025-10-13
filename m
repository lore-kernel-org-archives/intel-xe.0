Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B661CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 22:33:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8EC10E0D3;
	Mon, 13 Oct 2025 22:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JOCJgQTU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF9410E0D3
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760394780; x=1791930780;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=H2aGVY5ArXVmNkqI026mQULoQlrgU4CORTuhc0sNlt8=;
 b=JOCJgQTUvDriafQ8gd6FliH/U4WkAwVvYazQQ1USAVfoK2TydhXhAH8k
 jw7N1KnmT7YTQ9uCguRoe2an9KYacXJdGcqFmfZdvr7OlpdbkLp8nM+LO
 BGhj1lkS0NklEMHTe0ZS6Li+pe8kygqJmY3zAlt0KMn8m42vuPYkT76yC
 7OFgDoDqD+ALTXYnbZB0BlhLCado0GEv3IqOZsCcO5Rb2bHlaqH3URM8u
 PyP72fTYNIId0FksYCiT+YRRkYP/lb7dSsuN9+gj+FDDG3imhSZoxyzaZ
 IHpBII8du/f2V9/3mm7qFzUjFUNRYr26Y8nQmQRyonRzkBhDuHNBX0OHn A==;
X-CSE-ConnectionGUID: no9dAm0oT8OeaVUl+TeMEg==
X-CSE-MsgGUID: ZpfBmbmtQ2eHmmYtxYPJvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73890096"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73890096"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:33:00 -0700
X-CSE-ConnectionGUID: jY9FCYQ4S1iVIcwD15Tccg==
X-CSE-MsgGUID: cSDt6xLuTcSd3HJAlfdeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180943836"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 15:33:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 15:32:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 15:32:58 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 15:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fdvUokMghCSoI0NbFmQ91+lhvSlKCfosSWPy+YHiIsuBFsyu9qob5BoITWVoxuxut/1CQ2BMV6RRudQeFihu/qaRE4A6R/rYCUI0IVmoZjDd+nd/EwXc3sSOU3GFNW6AUgk+1rrvWpXGX1TpsP2HR7HYmjhDhFt7XdB3+AesdLWhOra5MqVne2FUdkWdnkhiXTz9uTiqpYixs7eauX2VXa7suerTHDA9Q3Ejo8U3xzGVgIOaqRDuT2GBFzrn89n2WrCjfmH9/NMxaKVJkP8LhQC8McDl2KHD8p7/R/GLJsRNxQtU7PtU6s9IVeWwCJUQfjj3tAIju0TnNNpZrHwq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H2aGVY5ArXVmNkqI026mQULoQlrgU4CORTuhc0sNlt8=;
 b=gr9nzXszhdMTJk4flDHsv13RZUATuYj80rKZGc9NpV1TTkQ0wfAI0gHtIlE/istlZe7DuPLkbyLyaOQBJe01s1VsGQb3tAsceEIwmAjrgDvVBHVDXYKEFu8I0ZPchJDmkU75hB9tZvclR4FKh+HUgxhXvltZ43yndrIOLCyqMi8j7Cm2t2ENDsh6xhYRh52E4RrycgfhdfY6nfTnrKvlWn9CzyitGXcuvgAMNOUclvL07nflDBSh8Zkckj5aME7pLPPAiLH2Z86tmqhtDKoV4zBMVLiHOlhFlqusbD0ibSPkQ1bL2MtPwPhMvzjpQIqLGyNJ2t6nuZG94UD5mGz++Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 IA1PR11MB9493.namprd11.prod.outlook.com (2603:10b6:208:5af::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 22:32:57 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 22:32:57 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: Re: [PATCH 6/7] drm/xe: Kick start GPU scheduler on teardown
Thread-Topic: [PATCH 6/7] drm/xe: Kick start GPU scheduler on teardown
Thread-Index: AQHcPJEo3aY4/4bZQEmojbd6e9Phz7TAqYCA
Date: Mon, 13 Oct 2025 22:32:57 +0000
Message-ID: <a20a8b50c04ee8fd531dfe1a416a34785321618c.camel@intel.com>
References: <20251013223135.189357-1-stuart.summers@intel.com>
 <20251013223135.189357-7-stuart.summers@intel.com>
In-Reply-To: <20251013223135.189357-7-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|IA1PR11MB9493:EE_
x-ms-office365-filtering-correlation-id: d8cafe60-8909-44cb-44b8-08de0aa87546
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d0JHL0R5Z1ZWYmtvTjl4N3A1ekRSVE0raG5yLzllZnR4VmNPNUQ1LzRObHNG?=
 =?utf-8?B?dW4vNEk5dHNES1ZQNE5hcnBvSjZmRVBoUjIwTkFGQld4VDFPSkgzZnlWS3Za?=
 =?utf-8?B?MTRaUzdETlArZFZIR1hkL1FFZUxWSlZ5VCtSMkhvVU5rUy9BZWJFZXpidXNr?=
 =?utf-8?B?TEY1dSs0MmFnVlAvMGh0QUpMNWR0TlVSNFE5UXpVNE1VbjdCVUtJU0ZHL3ow?=
 =?utf-8?B?WGZyTlpUWkJaYVQ3Zmk3K2lGSTlRSmZlQTVKRGdaSVRuQmhEOHBuQ0E1YzRO?=
 =?utf-8?B?MjB5RDhCSTdkckFTVnJDbktiZWdtbjQ0SGtPMHFWMVVPSGZ4dXJVd2ZWU2Yz?=
 =?utf-8?B?cDBHc3lFUURKMGkxdG8rVm15Z3NCSmJkUnNodVdxck9FeVd3ekJpV0lrbUtD?=
 =?utf-8?B?R1RkVURGL3BxQ0hPRm1heVNhTWVDVTBmam1hOEFaRVpaVVJPcU5zVFR3cC8y?=
 =?utf-8?B?bkw5c1d4ZkhDMlRRa0kxeW1xRVg2eDlxNjBFc2dDSks0amxUWmNILzUwb281?=
 =?utf-8?B?SUkwQ2VUS2N2QVg2clFnWWZXeUw5ZXBEbm1HSGVzdVJTVUVWVEpzN04rY0x0?=
 =?utf-8?B?YTQxamxiRWduR3dRK1BpMFBWYlFXZGozMHM2VEJBY3NITkZzeW5Uc0g2dFZU?=
 =?utf-8?B?clRGQk5uUlltSUgwQnp6TWpreWRXQWdIdHRDaDdncVJtaUJvbGVLeTJxODVa?=
 =?utf-8?B?MytYK2ZhcEdZaHZPNE1teVMxZDhidXJwN2Q3SmpnYmkzMGpMV3E5a05JaTlQ?=
 =?utf-8?B?M1hSTUNhVGpKYmk5aWZCSjNGSlk1eGZGV1BDZDZZVUFBdC9yWkJMZ1FSd2o4?=
 =?utf-8?B?WDRpb01YNXRCa1BOYm5SNExTSCtWTDZZSjFTR2c3ZGlPdUtwMVRublRidkY4?=
 =?utf-8?B?WnBqZm85V2tNMWFaVFFuQTJyMmJXeWR0dzRUa2lLRjhaY2k3Q2pJRXV6ZHJp?=
 =?utf-8?B?c2tLcTUxRFlmL3llTER4cHZZNG1hYUN1VVp5VU5yVnk3UEFkODlnZ21vY2Rl?=
 =?utf-8?B?OHA4MXZDWDBuRXRDT3Zrd3dmaXc2YXRZK3JSd0YzbmJGempRbi9SREdBU3RI?=
 =?utf-8?B?bHZYNzZ2Z1BERmUrZUM5ZG03TzFlQkFBL0JKZWQycjYrRjBkVm0zc0U5YU5V?=
 =?utf-8?B?aWFHWXVnY2gzaE1QL090ZEV1L0NZa2lRcGRYRTZNdThkejNxV09lMkkxQ0Rx?=
 =?utf-8?B?c1EvUVpDMXVmWU9jZnlydmxOZ0s4MXpYa245eWxTcUdSUHUvZHpUK05BUEdR?=
 =?utf-8?B?MWNxOERKTlNDYlpBc05GeHUzeThYZzBBZld2M3V4aG5OU3NIRHBlMTkxaGJn?=
 =?utf-8?B?TWJvK1FZU056U0FuUksrUm1OekpCVjhTQmFvMy9PblNpckpvN2dJZThnVWxF?=
 =?utf-8?B?RUphekZLdmdUdWxseXZneEl3RnovT2Q2T24vTE5Nc1orcUNnbU4rYkFKVi92?=
 =?utf-8?B?b0ZUb1pGZ0JWU3Y0MFEraW9aOGJCQ3FtbWI3OW1yNTMrUG9TRFM1cnNGeDZX?=
 =?utf-8?B?T0piSFk1Nzdsc2lkRzZVZkt2SVphQkp6OWw1VndjQlM2N0lSOVBBM25ucUhE?=
 =?utf-8?B?MlRtZzdwaWJ3Uk93Sy9jSWpRYlF0NjBKV0lMdnY3QXI1eEFZczdaVlJOWTJj?=
 =?utf-8?B?NERUaHUxWkhucXJPRE41MnNteTFGcnpDWkZLT0M3OGJHSkp6L3N5dktDbE0z?=
 =?utf-8?B?aDdleWJjekJYOGhVQXNkWXpOTjcweEYvT0xJbk5CREdWU2lOMEFvcUxWeHp0?=
 =?utf-8?B?MnlMeFhDUnF3OW1mcGtxTkJSMmVndDhLV2NBaVo3ODBHbFlIK2N6eVFXQis4?=
 =?utf-8?B?MWxRS0loVTdXSVJpREU2dDA1c1dCNjNTWDRIOHdjMDltWFpIQi8wOTZTZmgr?=
 =?utf-8?B?YzdmS1VLalgvNm5ucEZYUzZRRWo1Q01leFBKcDlONStZQ3BMdzNTRTdMZ2dy?=
 =?utf-8?B?VXR4K2VRM2pWeFlvcS96WlpnUkY3a3JqTFoxUk83Ym05KzRpU3poRU5XU1N6?=
 =?utf-8?B?Q0N6RTdwZmMvOGc4U2tUVEswYnFiZElzOEtvdWVyeEFDdjFzeDhOSGFkakNZ?=
 =?utf-8?Q?l4NVU+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T1BnQnJnclg3MHlpdUxxSmNQNW84VS9xRUI0VUZXMEpaVVhWcEhXc3BzNm5k?=
 =?utf-8?B?NWtrL1VGMjhSVXV6ZldKTVJreVVOZXowbE1KRGwxekQxYTdPQ1EzR0V6aFNE?=
 =?utf-8?B?cE1vNE05TW5pangxWUI2SVNWR2tZWExIOTBtaHloRlVoRVpObUdYaGxKMzZO?=
 =?utf-8?B?U0tSRFI4NFErMno4Z2NOaFlGRnY0ekt6Y2FQaE9xaEt4OXJkN3NTc1BtbS9D?=
 =?utf-8?B?akxaaGNzRHRDem81eGFyK3YwRWluNHV4SHd6K2g4UGd5dXY3Y3FXU0NHbGtF?=
 =?utf-8?B?K0RhZUtEVE5nc3N4Qm1GeS9oQ1VqdXczTEY4MHF1ZmlxcHBkMVB2aUpGNXU5?=
 =?utf-8?B?ejM4S3czcXJrTnlUUUtnV0pzZlBNVExrZEw3Sm4vaHRMWFE1VXlzaGRYaVc0?=
 =?utf-8?B?UXZ6TWgzL2hjWERGTGU0NFlSeXUreWVROHozUGNxaWhQTEd0UnllVmVDT21S?=
 =?utf-8?B?ME5tM3hhSjE0VHIzd0cydFlxV1V2TGY0b2VwVkRvdm43ZTNvWS9ZMXRtMjZh?=
 =?utf-8?B?UlVQcXREdjlFUzZIdnZpbmtvcERWTTBDbkFUR0V6aGt1SW9IcmFEY0FFYkQ2?=
 =?utf-8?B?MHdXZHI0S2pMZGxqdDdGVVMyRDJ6ayt3b1kxOHZFTmE1bk1pQ2tYV295WlRF?=
 =?utf-8?B?VzNlQ0U5LzloYlJVbDBsMjRuQnVVb1AzL2JpVVRlWFlvdVpNOExHQ1RCa1NX?=
 =?utf-8?B?anJDNmZDaE5VZWRkSlJFNzV4OWNMUzdRVThHWDBqeDB0M0pKU2FIeERqd3FS?=
 =?utf-8?B?V3BYcjRQQUdIVkloWEJqclpiOVlTK0ZMYmYzRm02ZGs1bU53SXZDQjIwYktR?=
 =?utf-8?B?WW1pQ3NuR1Y5QklZMzV5MklJVVBqc0luWWlIMTJLV3FlTFpJc290N3Z3cTh6?=
 =?utf-8?B?aWx3WDN3ZEx6eFF2TXFrNlJaTk5CeVpPdWJtdVdlcUVJQXNubUxISzRWY2o5?=
 =?utf-8?B?aWtzRk16SkdPanpSeWUzZEZWcFpxSXVtM0VYUXl0QThkRUxWUUYvM2NzMjN3?=
 =?utf-8?B?YkREMWF3c0lNZG1yNndIS0o0WVlMWmduUVgyVUg1aGdvY0FVM0pDT1RVd295?=
 =?utf-8?B?YWY2KzdwY1JEWmJZYjZ0dVZNdXJ2MjZhNVR2RU0vWDFIaVlKWWdUbEd0aGpa?=
 =?utf-8?B?ZGpOUE5SQ1pkSng5SDNjTmdZbHRySGEzTU8ybXFJMFE5a2pKTTZsSGNMdDBK?=
 =?utf-8?B?c3ZvSGs0QnJVL0ZoR015cVc4K2xJUk1adWFWbmJseElxbU9SeTB6Q2Vubkg5?=
 =?utf-8?B?dnNZUm9BdlNoOVBieC9PNTZIYjRYZUR1OFFleTJHME9EMnkrQURxSmlnbkNG?=
 =?utf-8?B?eFdEZ01BQlF0VHNiOVZNSXZRVTZXNGVLOFlmaWVKVHBjdkM3dXY0akRJRSsx?=
 =?utf-8?B?QnM2TEMzOUxLeFBSR3ZzVlExQXh3Rjg4VUYvY0FzWnZNeXd4b1hQN1FIUS9S?=
 =?utf-8?B?MjM5R0k5ZUNNa0hrVk1paVdYWFBld0RpemhBUFhrNXo1NVFRd3JIUmo2QmhE?=
 =?utf-8?B?YXBBY3BrcVdqNXdJL0tmUzlKclRaUE9BYUVJTGFlc2s3ZmdoR3JGckhMQWkw?=
 =?utf-8?B?SENuckl0T09pNHVKZUJmMS8vZ1pGNEliSXdTQ0FnZngxVmdqaUFZMFdIdlRs?=
 =?utf-8?B?Q0U2c2VxNFBzUkJXWnVOWUdoc2lweG9qc0VKME5EZkFYUHlwQXlMNk81Rnpa?=
 =?utf-8?B?cFlSNDFNYUM5Q2hnVXVQbmprUW5WcG1Bc285T1diOVY0R2NJa1NuSGxZV09p?=
 =?utf-8?B?R3lkcEh0WlFPYmdsWEQ0OUdBTExZZEhvVlFDYkZsdUd5d1BTakxNcGFiTXVE?=
 =?utf-8?B?cjdSeUxKYWQ0QlhZc2h4UmVQWjBaOXFsK3cwQ1Y4K0xUN0l1ODk5NEpHcjFw?=
 =?utf-8?B?bktvOXMreVIwM3A5OWUxTk1vQ0pVYTNFWDlVd3hqZzVacmhjbmlMcDdjc2Q1?=
 =?utf-8?B?UFBPd0g4aXdiMmhndEdZVWxmSWxLK2VaQWNuNXFWSXNEdkZUdzZLS1JHZ1V3?=
 =?utf-8?B?UGQ2a2NqYzcwT1AwYjFwYzRWQXNMRXhocUx2c2tidUdNV0Z0SjFjQThuZjJX?=
 =?utf-8?B?RGtyNk9wWDd6Ly9TYzdyS2c4QWpySkxaU3A2YVlVeE1uMnNISndCTmo0cVNL?=
 =?utf-8?B?cWU5TmV0QmZ3YXFNRUZBNEZmRFBOQWk0K3VNbGw2Q3RrUzh1OFJnZDM1d1Qz?=
 =?utf-8?B?VlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0A6F349FBF6FE4E85E904888C39461A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8cafe60-8909-44cb-44b8-08de0aa87546
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2025 22:32:57.1417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LUiAqjm+G5lPw1ZCxFk3TL0YbUF9j7GeBkGi2FOO1Q4UscSsh60YK6YxGm35io2j2ly+uHYfiSLV3u2VjfqxYeZHKYWy+8dnAipfwIkFtOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB9493
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDIyOjMxICswMDAwLCBTdHVhcnQgU3VtbWVycyB3cm90ZToK
PiBFbnN1cmUgYWxsIHJlbWFpbmluZyBHUFUgc2NoZWR1bGVyIG1lc3NhZ2VzIGFyZSBwcm9jZXNz
ZWQKPiBvbiB0ZWFyZG93bi4gV2UgYWxyZWFkeSBoYXZlIGEgd2FpdCBoZXJlLCBidXQgaWYgdGhl
Cj4gc2NoZWR1bGVyIHdhcyBzdG9wcGVkIHdoaWxlIHdlIGhhdmUgb3V0c3RhbmRpbmcgdHJhbnNh
Y3Rpb25zLAo+IHRob3NlIHF1ZXVlcyB3aWxsIG5ldmVyIGJlIGZ1bGx5IGRyYWluZWQuCj4gCj4g
U2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4K
PiAtLS0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMgfCA2ICsrKysrKwo+
IMKgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZ3VjX3N1Ym1pdC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVf
Z3VjX3N1Ym1pdC5jCj4gaW5kZXggNWVjMWU0YTgzZDY4Li5jOTIzZjEzYTEzZWYgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19zdWJtaXQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWNfc3VibWl0LmMKPiBAQCAtMjc2LDYgKzI3NiwxMiBAQCBzdGF0aWMg
dm9pZCBndWNfc3VibWl0X2Zpbmkoc3RydWN0IGRybV9kZXZpY2UKPiAqZHJtLCB2b2lkICphcmcp
Cj4gwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV9ndCAqZ3QgPSBndWNfdG9fZ3QoZ3VjKTsKPiDC
oMKgwqDCoMKgwqDCoMKgaW50IHJldDsKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoC8qCj4gK8KgwqDC
oMKgwqDCoMKgICogS2ljayBzdGFydCB0aGUgc2NoZWR1bGVyIGhlcmUgdG8gZW5zdXJlIGFueSBy
ZW1haW5pbmcKPiArwqDCoMKgwqDCoMKgwqAgKiBtZXNzYWdlcyBhcmUgcHJvY2Vzc2VkCj4gK8Kg
wqDCoMKgwqDCoMKgICovCj4gK8KgwqDCoMKgwqDCoMKgeGVfZ3VjX3N1Ym1pdF9zdGFydChndWMp
OwoKTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsgaGVyZSBNYXR0LiBXZSBjYW4gYWxzbyBleHRl
bmQgdGhlIGJlbG93CnRpbWVvdXQuIEknbSBob3BpbmcgdGhpcyBjb3ZlcnMgYm90aCB0aGUgY2Fz
ZSBJIGhhdmUgYW5kIHlvdXIgVkYKc3VibWlzc2lvbiBkcmFpbiBjYXNlLgoKVGhhbmtzLApTdHVh
cnQKCj4gKwo+IMKgwqDCoMKgwqDCoMKgwqByZXQgPSB3YWl0X2V2ZW50X3RpbWVvdXQoZ3VjLT5z
dWJtaXNzaW9uX3N0YXRlLmZpbmlfd3EsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4YV9lbXB0eSgmZ3VjLQo+ID5zdWJt
aXNzaW9uX3N0YXRlLmV4ZWNfcXVldWVfbG9va3VwKSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEhaICogNSk7Cgo=
