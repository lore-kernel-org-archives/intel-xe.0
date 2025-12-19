Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02882D78783
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 14:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9010EF6F;
	Fri, 19 Dec 2025 14:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FdLmqE1h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99010EF6F
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 14:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766155111; x=1797691111;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=2cJftTc3bWyojCYzWxoRyGsxIZ0ndg882Un4ayLWmCs=;
 b=FdLmqE1hIT9lLEtkrU9qkB9+TOq9rl1ijbGlKxNjDzFuMCaGRUbajf4s
 ysB9Fq8V2SIR/eat8QGdFXRmSEDgHtszKwva9nQlxb/RiODJi5/9UlIWL
 h/+Cn3FgZwO6I8akYJhuq8OSGiz0cBrsMnQhl80OtFk7j81gfBxFnzg4y
 2aB+5evgNcBsr4eRdoPhoGJnUlDPgFXc7kHbmUlhiS0vqUKR0ZOUItcjf
 85ecX9nFxunooqhH7c3l4jT1HcL+c30OI8jbSb95LFU32SjbGw5TJ2syZ
 lOxbXKwkkY5QEFvdS9sxeKkqMXHnEYFAw9/yjwzUDgbB0bxc3YsIegHsI g==;
X-CSE-ConnectionGUID: 7xkI79+JTP+cV0GO1VefGA==
X-CSE-MsgGUID: bS1pymFITK2MvT83vIKJcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79571244"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79571244"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:38:30 -0800
X-CSE-ConnectionGUID: 364neYxUR3KRCkLQJuxMkQ==
X-CSE-MsgGUID: 57hD2AZWQS6ZVP+Qhxlldw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="198779473"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 06:38:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 06:38:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 06:38:29 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 06:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6DB1M+1mbUBYfhlSGQB7bzDEstu8xkHkFxpZNKgTNqjlVGzrzJEv1O7JFg1b3n6eHSRz2gkle9qJt7QRjxaaTxDSttS5RdypGXNo9jlrLVqOzkYAIuClyS9WAOf/C1Ds6q8wQC1OXV4RTGSh1uNXRWHguQ0wyIfqVCUR6a/pG6tPVqtMdeyOADkrekdI4JdGCfniM9rIm4ongO3/mwCC8hu3aZ/iAh81ODqholDAISuJAe83lPHpLVHipKvr+larIbFfv3xjZ4U/2ZkiL/DoGoY0p7aJdhOZPvuwlyPjySREmJCILaRbAGFVkUizfm52qxpgXUjnXleFs2YqpA+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ncbcw/qSKFQXCwjEfNrjMJNh67mV0VAQCzJPzFQ+IA=;
 b=kjGhG8mb5YGIVvjaF1zY8NRDPl/Govs8AcHx/Wrsy0f6+ewnRV3g6CrIcN72Zkt7rGy2VRDMiXFfU+QFGNdWUC/zB0JklyE2DzMyLn2NM+3DCtX1VJ3/XKL2BGiV1LASJwomLRdRX1ff0H4EgwWkT7A6WS5CQHkKdpUVu4w57cJfhCPxdGyV245Cs7RISZfu5fNB+lTnyPexUrlZxdqNEtJ9MkCYnbZnvPOpKX8XtcffN7d1kUG2IUmtfGEyHpsV+WwOWaUw5iZDNKHN7jpc3/2kWrqy8EZl6OitY5CDv46xuwP8O0G1g51IiY4eqgDJ2wHjQa3lIRzoqJD1WOx5ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW5PR11MB5932.namprd11.prod.outlook.com (2603:10b6:303:1a2::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 14:38:19 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 14:38:19 +0000
Date: Fri, 19 Dec 2025 20:08:12 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/device: Discard check for lmem_init
Message-ID: <aUVjVCN_U4dYBjkt@bvivekan-mobl1>
References: <20251217125143.2430557-2-balasubramani.vivekanandan@intel.com>
 <20251217231229.GC1180203@mdroper-desk1.amr.corp.intel.com>
 <aUQkaeP3aMEcCZNL@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUQkaeP3aMEcCZNL@intel.com>
X-ClientProxiedBy: MA5PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::11) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW5PR11MB5932:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d65f42-fab6-4d76-b1cf-08de3f0c4088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWxTVTEwZ0pjQVo5NHQ1Z25DbEF2d05Wbnk1UmNCZHRXZUY1Vk11K2xtc05Z?=
 =?utf-8?B?S3dVbmNTeW9hOFZVSDBuK2ZSZDJJeUo0NS8wYjZzWmR0aURjRCtOdExJc2dk?=
 =?utf-8?B?SlVtbmpVV3dlR1FHZnQ4azhIb3JncGJ0czN1MjZlY1FaS0RLdkFTQjJpMXlu?=
 =?utf-8?B?L29CbjVBeW5nL1VKM3JPdlBMM05lU3JWa3N4clk4QUFSY3RkcStIR0FPbE84?=
 =?utf-8?B?QWsweXExVzlTUUNHY0lkU0F6MkI5dHhkcmhmdVFxZUhxVUJnTTZTZy91MzhS?=
 =?utf-8?B?R09MdVlqV0hLV1I4NEVxSGpOdk9XY1JacytmZkZwZE5zNEF4M3ZEbzc2Wnk3?=
 =?utf-8?B?N045R1V5eU05SDRaRUFDcy9IMVpZNGhaczBNVnE3RGR2bXh3YXU4NzhTbGlJ?=
 =?utf-8?B?RStCSW0wUXJtZFVESE5jRjlYYlJ3N3NkWGZUS0VXb1N4S1d5KzdXN0dJRjRz?=
 =?utf-8?B?cFRiWll6eXdHUmt5OWg0ZWNac2JWaE53VkR3NGYrWG85QUMzcTlQbUdxUkkx?=
 =?utf-8?B?VG9KRE1vS1dSM0NVNUN5Q0RBNGdNa2xyYzVidFFTeGNpdE9MUjhoakE1Y213?=
 =?utf-8?B?NXhwbjlyS29ueUlUZ0E1SEFBTnhMU2g2c2FkaWk1Y1psamN6RloxOFEzQjdu?=
 =?utf-8?B?MGlkWEdpaEdzTHZRcytTUWw4emc2T25uQjNiTVZFbG9KT3FXYWdqNFhBSVh1?=
 =?utf-8?B?Wmo1bk94Z3ZPakpVamN2QjA4bldrM2pIQjBUSVplM25NTVhXeCs0R2k3ZnVG?=
 =?utf-8?B?NHR6RGtaazNxL1Bhb3Z1ZWE5WndOc1NaeDZXZythUEhxTExaZkhOamlDVGVM?=
 =?utf-8?B?ZVFaUldPNkxNSVRRNXNJNmY4MEhpK3V3ZTc0cSt5dE03bjg5MEtOZkZEUEl2?=
 =?utf-8?B?NFNVd2ZjYmUvSTZTL0FqZjZjWVN5bFZHaUNvTXJLclhXMlZ2VWtYYmkwMjlY?=
 =?utf-8?B?dTF1S0xyRXVPQTBXd0hPNnNmcFRLblJNZ28xNmlOLzJJMU84L3J3VVQ3d1Uy?=
 =?utf-8?B?d2tRSzRwamE0N3ZtTmluazRzOHV1QU5sT1h2bUJDN3h0aGJtU0dEcVlaZDBP?=
 =?utf-8?B?VEJ2V21udms5OTBjKzBnS3ZrTlZPRVAvbmt2OHkzYkUySFlxZ3cvVFUxNDhO?=
 =?utf-8?B?blJWNkQ4bkhIbW9sL1VSb0pZWkRTN215eWVHTGRoUld2SzVOL2tPdk40U2wr?=
 =?utf-8?B?SHRpcUlJc25qZzBzMjg3WGhPYWRnR0l2Y2pML3Z5bTV2L2FTVE5paXhCbXB3?=
 =?utf-8?B?QW51dVBjY2xjRU13bkRnaHVIa3hpTExWeVk3K2szM1VMOXZJb3llc0hjNk9r?=
 =?utf-8?B?bDVjR1VDdC9qWUdmbG9Ba0hXNmtJeTJWa0tISEJsbDdvU3QxU2V6SU1OdC9k?=
 =?utf-8?B?WkNpYjdaRkhQdEhGM2VWNE9VMHBrN05Lb3pWbU9yamloVlNIZHdMK2pqV0I4?=
 =?utf-8?B?ak1yWjZ6UXlKSVEwdERDNjEzdzlLYjcybU9QQUIrc3hPMVBmRWtjd2tVdlZs?=
 =?utf-8?B?NFFNNm1YV2owMkMzSktEOWNnd2dyY0cxd0FDYk5YTHVCTE40cTFtaThzVFlT?=
 =?utf-8?B?ZVNvalJJMUpRN3Nock1MWlBqS05JeHByMlZ5SVdvMHlXL3IxL3daeEtPcEdG?=
 =?utf-8?B?NGh0TlN0a0MxY1NqaU5qS1ZORzdBMHE4OStXNEc1ejNhT1JxMk9BOVZHUU9O?=
 =?utf-8?B?amdIaksrYkFYczVTTzJqZXpwVTM3ZUkwSVdUUXkyTTNzZWNNUDVqVzNFZXhu?=
 =?utf-8?B?MGp0VEtYZ2VGU29HQnBsQlIvRlo2MkZzRjE4OWVIMFFTUHpQL3RLL2R4a0Vk?=
 =?utf-8?B?L0R4TXgvcHc1VjR6eFdGNEJmRVJweCsrZTFhMGdrdDc0VGRjK2R1Ylc1U1or?=
 =?utf-8?B?bXc5UDBvSjB0cWx2cTBpWllEZEt3ZHBNakxXWE9oTXRQRUk2V2RocTI3TjJq?=
 =?utf-8?Q?zCGLz9o6YYnPHAM5phRSGuEFOhulJAYC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUlJL3Mzb09pMVNBR2s5bE1ub0VzM1lsY2tLN2xiU25uM0VDMnlxbTdZaFcz?=
 =?utf-8?B?NlUxOW5zbnBCRTFBcmt4aHJ6Zi9CTmhNWXl1VnJyejYvSXJWUndPWkdObU9h?=
 =?utf-8?B?LzRxMmQrSzNzUnNYeE1ybG9Zdk0zNG44aGdCL2k3UG56VVN4TkN5ZlYweURC?=
 =?utf-8?B?Uk9QMElSS3FsYjNQcHR3Ym9iWmF4bFduOHRjbVdLODhHSDhNMmVkMGFWbEE5?=
 =?utf-8?B?VmpiZkpaTGx2azhpUWNnYmdkQ2pCUWF5RkNEVW4zaDZsSTJDaS9yYlp6QUp6?=
 =?utf-8?B?aGg0L1Q4ZjZseEwyL0JGRlFsdTB1aTY4eDJtVnN0Q0xNd3dTMDVtUTM0ancx?=
 =?utf-8?B?dEZmUy95NjFSdk5vamxOMEVTUzBhcDRtZWlTZjFFUUdkQXhBMG5kekpoVFpD?=
 =?utf-8?B?TjdhZGh1a25nRGtHN0tyL05la0V5NDNYcThrS1htdlhiYlBRcFRkZWdzRlAw?=
 =?utf-8?B?NVViY2NDVTY2RkNzOHZmWWtkbG1Gc1VuWWVTbHIvbXZIVGNCc1lKOVl5M0p1?=
 =?utf-8?B?L3RXUzJsbjBBLzMvbnlKdTlFcmxDL3FTeHVxc3lVMTlFcktJdGc4cFFLb0tI?=
 =?utf-8?B?UCtCR09YY2diNWhhdTBGSlNOZUpoRGRnNnpab2NvTTlvTHIzR0ZvOHl0SFZZ?=
 =?utf-8?B?M0x6TXczYUowMzZzcHBNOEowMlBOcmxBQ1I5eEIwS1ZYc2d6KzVaYW5yUEt5?=
 =?utf-8?B?alhLbE1YY2xXSTNGR1haejhJaFZTT0lsTy8rbHprQmRiYmRwMHRveXZXRUpX?=
 =?utf-8?B?WHFmaUhwbGF4T3I4cHdVZW9XYzBGRE0zR3A2ajV1Q2hzOTc3TUdoQklwVWZ0?=
 =?utf-8?B?Z1Y2TGFueUZmUzZycEY2S1NmNFBtR2tpRzY5S1pXR080WUdoY0QxclNncWhm?=
 =?utf-8?B?bkdiVHgySkdPOGtpcHR6dGZqbUN5UnhPdXNlUDM2ZkdHc1hkM2k4YWhwWFVD?=
 =?utf-8?B?c2VMbVNGYS9xdmRkZkZaTHc1THl5UVpRK2FoY1IwbnhrQnhld0RaTEhhbmdQ?=
 =?utf-8?B?V0YvUHVNdkJEZmpZYTlOOUdOMDNGMXU2bzdCVTFtOEsrbUhYa2ZFeWNSN2hp?=
 =?utf-8?B?K3FCS3dXNTZyWEdSTXAzTVpEeXFQU2hpSGNUSisxa0IvZjZuMXFvZjJkckd6?=
 =?utf-8?B?bDUxNzZ0TGZLckdUakU5cFNOWXpRZ25wU0NaNFZHNmtzLzAzcHdEUXhxZi9I?=
 =?utf-8?B?Y2d2Vk50OVUrSVlCVVNhWGNnZm1Vd3lML3JicU4vYXo4aE84bzNOaGpWaEsy?=
 =?utf-8?B?YmhVMWRSeUMwZnRkeFd6dlZEbERJaitIeGhoSDhGYzByVG8rTytQcVE0Wi9w?=
 =?utf-8?B?R0FOSFhmWWwvQi9Yc2RSR1M3SlBNcTBlOEhCbmt3S08rdmtrYVRXeWt5UVh3?=
 =?utf-8?B?UHFPVXp4Vjhvb3o5SUZDSG9TRTNrUzZodHNMZ1I4M2k3VFkxb05XWTBuaE5F?=
 =?utf-8?B?LzFIMDhEMlVjNExqbmQraS9RUGVHY0I3V3FQVE5UVW5hVVFzVlNLS3d6NHQ1?=
 =?utf-8?B?dkI4N1JuRFh4azBvZ1V0WGs2REVDckozV0dzUnlUQ1daZFh1SUh3d0ZGekVJ?=
 =?utf-8?B?blRFak44MzRhZ3lRL2oxcEpOT045TndSN3RVaTZMdTRFWTROWGt6d0Q4ZWNh?=
 =?utf-8?B?UW4xc1A0bnhGc3FYNnZLZ01rYU1MNHFqbEFPWFFuVWxsM0Z5U2dsU2dmZkE2?=
 =?utf-8?B?RXNQMk5tcTJ1cEV5MnJxakRGRno2R0lmUU90R2xvVnp0REVLRjZNQU4zbzh5?=
 =?utf-8?B?eURZOEVMQTBVN21yVFJOZWxyYzhTcTdFUUpzVExIMk11blpaYXBVQWlTTGVK?=
 =?utf-8?B?cXJySUFRL29qUHRXcXJUN2JLNFN6L240QjIyK09zVHhhWFJGVS85MUcyaEN2?=
 =?utf-8?B?RWxHbVRSYTVzYU92M3Z5Yjh4MWlMWWJZaGdESTNIOUFiRFc0K09hZjQ2elhH?=
 =?utf-8?B?OHh4a1dxOEozSFM4dW1Bc2wrR29ERUgzMjZZOTVCTmRLd2lQY2ZMMHYwaWd2?=
 =?utf-8?B?QVhUYVFLMWQ1VFBBcXdWd1RwTGJZRXVZNzdEdkE3eGpESTVhK2pjR1IyRDdy?=
 =?utf-8?B?M2ZEWXNLWGpkN3pFQUFyZ2hQZ0crZ3FGUTRhQmZ5S3gyYTMxQ0dzZml6TWkr?=
 =?utf-8?B?OHBXeTArazF1VGxOMjJZNi9VSFZCbDgwREx6bW5jV3gvbEJDb0VieFAxc2pz?=
 =?utf-8?Q?EtqZxW7yASRiCt+Qb0Iivho=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d65f42-fab6-4d76-b1cf-08de3f0c4088
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:38:19.1016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pBlMRClu/j37D5HRqpmck58kj+3X+RuJmPZ2Ki5MjZ9zYKNXV+5Gpc4GxTfFUBQUh0bq3QBr7SALwLo53NPD0C5UD16Cc/4AIezlrwQSauRgFLqy00ACCEHSvbyXShaX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5932
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

On 18.12.2025 17:57, Ville Syrjälä wrote:
> On Wed, Dec 17, 2025 at 03:12:29PM -0800, Matt Roper wrote:
> > On Wed, Dec 17, 2025 at 06:21:43PM +0530, Balasubramani Vivekanandan wrote:
> > > Prior to lmem init check, driver is waiting for the pcode uncore_init
> > > status. uncore_init status will be asserted after the complete boot and
> > > initialization of the SoC by the pcode. uncore_init confirms that lmem
> > > init and mmio unblock has been already completed.
> > > It makes no sense to check for lmem init after the pcode uncore_init
> > > check. So it can be removed.
> > 
> > While I think this should be fine on our current platforms, one thing
> > that worries me is that we'll bypass xe_pcode_ready() if we ever have a
> > device that sets skip_pcode in xe_pci.c.  No such device exists today,
> > but if one shows up in the future it may not be obvious when enabling
> > the platform that we'd need to add back the GU_CNTL check (or something
> > equivalent).
> > 
> > A couple thoughts:
> > 
> >  - Maybe we should have an initial patch that drops 'skip_pcode' from
> >    xe_device_desc since it's not being used today.  If it becomes
> >    necessary in the future, then we can easily re-add it, and the
> >    process of doing so may help remind us that we also need to do other
> >    checks to make sure the device/lmem is fully initialized and ready to
> >    use.
> > 
> >  - Maybe we should replace wait_for_lmem_ready() with an
> >    "assert_lmem_ready()" function that will just do a quick sanity check
> >    on debug builds.
> > 
> >         static void assert_lmem_ready(struct xe_device *xe) {
> >                 if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> >                         return;
> > 
> >                 xe_assert(xe, xe_mmio_read32(xe_root_tile_mmio(xe), GU_CNTL) & LMEM_INIT);
> >         }
> > 
> >    That eliminates all the looping/polling logic, but still helps make
> >    sure we don't miss anything if we ever need to skip the pcode step on
> >    a future platform (or if the init flows change and our ordering
> >    assumptions are no longer true).  And since it's an xe_assert() it's
> >    only active on debug/CI builds and will be compiled out on release
> >    builds.
> 
> This stuff doesn't look performance critical in any way,
> so there is no good reason to compile it out from release
> builds.

In the upcoming platforms, there are changes in the register bits driver
has to check to sync with the fw initialization. For that I had to
modify the lmem init check function and it was getting complex.
That is when I figured out there is no need for this lmem init check
after xe_pcode_ready() and so decided to discard it.
After review, it looks like I have to change it into an assert.

Regards,
Bala

> 
> -- 
> Ville Syrjälä
> Intel
