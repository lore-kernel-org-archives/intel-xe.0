Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EA6C78829
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 11:53:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7235A10E0A4;
	Fri, 20 Sep 2024 11:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DmxQUMLK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7D610E0A4
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 11:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726833224; x=1758369224;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=YR5cIvNi8RqIHD7kivAmFm0xHauqkodkeN9rby0chfs=;
 b=DmxQUMLKwABHbelmACZYmIPVXt1dP6NE8fJDQZpTQGDCc2pqHGFjl55C
 yoggGZ66SVwMY+jsFnyk5d3SgvOMB6D6haPfoRJNGWAzUaE7vvwcT03Oa
 AYyJ32EYRFtTf5sL8GsfhoHawAGMAHyUOAXuTPECYJK5X7pBEkLXqD6ii
 JMjSyVQ0F5R5fC2cYgINhIh4Erap1oOHFk5BxMtcfRIiM87s90puCxPAF
 HOx0cZ7D42PbpU74b1kLvGufiTA7Aco3OHRQRFl0wh0w2S+b/jARj4Ew3
 nUb/kfiVt2jQ1fzGh+4CC4xli01P05tjSRlhPtXPrJi9yBuhJuxAg9yq3 g==;
X-CSE-ConnectionGUID: UIfuCS6DTGicMGg7EdmBtg==
X-CSE-MsgGUID: Rdu3MWN6RNG5UvggDRfN9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43304579"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="43304579"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 04:53:44 -0700
X-CSE-ConnectionGUID: He/joeEwRgCqz609T4ft5g==
X-CSE-MsgGUID: 0QGx17gARRmMYe1PgQ8WUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="93581574"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 04:53:44 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 04:53:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 04:53:43 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 04:53:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 04:53:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbB9amRmhNP4TEU18IqyOnxxmpzhy0SAY4SU7WghGeB16WznqYiOmtgHnGkc35jjuurO93pjdwJ05IkekQIUC22qAVHtFZ3ttySsam39iLNTAH5dNQSeoyYRYdQtAfWbCytwE4xTOxGeJ4jzBsqqwT6uZAcngfOsaRDAAtyrUXU+xShzfP5P0wkFuVjPbLUCTp5L4GjcTnTWWrUOVnX2PPS5EPFALNg2lT6/0GGiITCRfL89ARwjreWs3PyMcrPBgfMFIH5jiXIiRgGdwmEV0+0NQbvRKn1diRSSfD9MZkcmBo+OgUNQOfwA0ZhCNxWW5s3TCmEKkQKzM04/XFpjjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YEPlp/OUZGONOarxSnMRJz6BtnCwdNSrGJCLcGNDm34=;
 b=q4Kqb9hRXLFyw+/TVMWFYmYMlutTxI6iTO0pZsKPG1jO+hvlZbhyI/EG9OZ4qQG86lTULG7uNOsoqrQ/zkP2cvFdatmGZArMpMmoc8FDB6nAzy1n0uJAzdAZV8ON5QVJxlnMlQxjiuqknWs7Ew5FbTIfn9l/EjSvMwyr5Z2EGHB8xHtTGWp9gvpDEpKUqY8Hw93c76sQ7767bjRZGuPZ9DoPq/mInV0726yOcffwINH9KHKOlRP8g/oFZx2ZtoGBivDsT/bRKelvQUDpCtuWD4zaaUFxcnRVRKC5jaO4Rgyry3MARiIAe865K06Hak4+ULiUrgDzyYK9u8sTQE7a6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS7PR11MB6080.namprd11.prod.outlook.com (2603:10b6:8:84::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.22; Fri, 20 Sep 2024 11:53:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Fri, 20 Sep 2024
 11:53:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SJ1PR11MB62049A21650B5A9AF1D6DC70816C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-4-gustavo.sousa@intel.com>
 <SJ1PR11MB620488E5BFA1FB516114662E81632@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <172677385930.58088.6492678739635646603@gjsousa-mobl2>
 <172677456514.58088.3176651522327124209@gjsousa-mobl2>
 <SJ1PR11MB62049A21650B5A9AF1D6DC70816C2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Subject: RE: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
 flushing
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Fri, 20 Sep 2024 08:53:33 -0300
Message-ID: <172683321384.5668.15693375970913776186@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0163.namprd03.prod.outlook.com
 (2603:10b6:303:8d::18) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS7PR11MB6080:EE_
X-MS-Office365-Filtering-Correlation-Id: 03aeaf3c-ac35-4529-60aa-08dcd96addc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eEVtUTN4N2FUVnV0RmlaMVNhZjM4Ry9BdFhBUTZjUUsvSnhXMHcyUXJjSUR4?=
 =?utf-8?B?TTgzaHEvdW44cGNXOW1SSWdXREJ2L2llUGJSUEFIUkd3UTZoUW01dElsQ3Rs?=
 =?utf-8?B?Tk9kRi9aekFBV2ZZVlhiVyt5Wk1OVFB3UWF4dWZHSjlFTFpWR2Vna2FQKzgr?=
 =?utf-8?B?a2QzL1BqQWxWNEhBeGJnUzJrNUV1SnVDbkt3YlB0OElKUjJpVUtHK1lHNUlQ?=
 =?utf-8?B?MW1hVTJyUFNUT0xSTkNXRytYNDAwNVhjb3Jhci85RTJ1ODNJYzlDenovRXM1?=
 =?utf-8?B?ZHF2UllDaXhhTGEzZ1YyVGNWRkpDMlpvODZ3Qm5NUlprVXQ1NzJXVEcxZEgr?=
 =?utf-8?B?bnJrWkhpbXpZTE5VK1N5MVM0Nmp5eFg1cjdXaFRnbWlwOEd4R3EwZkl4bnZI?=
 =?utf-8?B?c0oreHlmaWFzbnQ5R3BaVzY0YzZGaW9aRVpPb0xHYVc5ODJZeG1qSjBuaWxs?=
 =?utf-8?B?ZGhGTC9FaW5vMTRONzJkMFUzWEJhdXI5Vmp0MFN2Z0ZvT05GTlYrcWpaMWpZ?=
 =?utf-8?B?b25VR2dqRkdDaEtGMUxXTXJTNU5sNXd4Vk5Dcjh2T3BEVXlrYUtzNXMzMml2?=
 =?utf-8?B?bzBkY1hxVXE4aTJEQWUwU085TjdlMnoxbXZTQXk5U0tEMGEwYTUyR2k0TVdV?=
 =?utf-8?B?ZlFFMGVpT1NBbXpJRXI2bEtYUjVxaGl1Nmwxc3gwZC9kbXZWdGF3WG9xMjVk?=
 =?utf-8?B?OUgzaWlGUmxQWmRkbnE3ellGZklMeGp3SHQ4UG15RFpueFRta00yUnI5OFVi?=
 =?utf-8?B?Uy8xSWpUNEUvM3dWd3dtS3Y2WUlFNmpSWWhRdXI3bXBSenE0Si9hSzJMVjg3?=
 =?utf-8?B?WmdTUExYblk3UVpSR3U5QTBDYmo1NDNDTWFxcHdNWnZvaFdWK0pmb3A2OUJz?=
 =?utf-8?B?OGJrTXJrQ3E1UTg1a2hqSkdhaWtiWjBEQUJuMHp1K29CcE5PUUd5TEVjSGp1?=
 =?utf-8?B?ZllqbHhBZ1RhOHM1VFBxQTIrYWVrc0FtS0t5S1llaDhrSjQ5MWczRW1EcDdk?=
 =?utf-8?B?VFdSOVhxT0ZSYmNGZnViNjlMcGlCb2dYTStiUldKWmt2SVg1blY3MmhNU0xO?=
 =?utf-8?B?RVF6d0Yyb0Z2S1o3cC9OVXVvK1VKRklNZTdpSitZaU1zT1Bsaks1dDRmZ0Q5?=
 =?utf-8?B?UzRycFgxdEZzSksvZVZWR1NBZ2tUVEl5bS9qbGFUaURCYm1ZNWZpZFQrb01z?=
 =?utf-8?B?NmJOOHFZVmdadzhSWmpvR2YvM0U3VE1CK1hVM2NidEx6L1YrcXA0WE5uNHZF?=
 =?utf-8?B?YUFTZkpJOVMxNWFqSERyeEJ2dVo1Q3NMbGNaVTYvd1VXeXc5VTJNVUs5OGx0?=
 =?utf-8?B?YncwMGJlRmVzWTB6WXo4b01ZTFhGY3RSb3B0cmdYN3drZ3hLZExBekVob0VV?=
 =?utf-8?B?ZWhFa3pqa3lLVkdkeWhpa3M2NndiTmRmRTB0VVZabndrTDNSVXJFaHJvSkNQ?=
 =?utf-8?B?S0ZNdHdET2dOTGdUSzZrbGNIaTcvOW1VRlQ4S29uL2pMOUhSejNES1VQUTB6?=
 =?utf-8?B?QVJ5Q2ZMTGxvTEpSSGsxQlFMZU8ySWl6cW11SnRzWXArT1BjWFV2UEw4M2gz?=
 =?utf-8?B?NUM5a1ByRHJ6aGhoczkzOFpZS041RENGM05VdXRjZWVRd0dJbGlPck45NTA5?=
 =?utf-8?B?TFMwUmVhUHNLOFJLN2IvMzdJdS9GMFdWMGlCTDUwNXdrTGVBVWFKaG9SME8z?=
 =?utf-8?B?cDh4SXJDTkJqalRJMlFDbUFkZ2xIQ2V4S1FvY1FYWnlIVTBqMTE2K05QQkVT?=
 =?utf-8?B?ZVREd3FRaFY1aFZoZ2FtVUZiNU56N0xKQzVQVkY5Ulp0YmlSS202R2FFcVpV?=
 =?utf-8?B?akRwYjUzRjRRcGhmc0VQQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXczZVRHcU1uMVJlZTh4aFlBeGVNUkRXQlZUNkRQK1FQT25nREVxUUxIV1dC?=
 =?utf-8?B?S05lYi9kcXd6ejJDL0NXWWFoc0pseTc5T3NIVUk1OUtFNlhleHN0Y1RiM0M0?=
 =?utf-8?B?eEFEcXRPOTJYVlhvQXZLRUhnN01DU1QrL1NrWGtNd2RBNitjdGlnKzRMWFM2?=
 =?utf-8?B?RXF5NVc1cEtObk9UbnIxMXFsVnhtRHNQM0VTM2RGZVhGa0FjakRkRXZBSElu?=
 =?utf-8?B?YmlJZGtWV1hKeU45TmgzaVhXY2lZTGR2ZktBY2Z2SnhaWXpZbHV5Y3JxVW5N?=
 =?utf-8?B?U1pzaWpXNGpFcmppa3c0ZUZXMzFibTdGM0wwaGIxaUJGYUZMZ3FPV21JaGRo?=
 =?utf-8?B?aW15V01aRzVNM042VklsVSs5d1l2ekpKd0xaeFd6QmVwbXA4emJDaUU3eFdE?=
 =?utf-8?B?ZXAxc1dhbzQ1bkRSR3B3TG83RGE1b0JIOUVPV0pqYkFyYUJDdkVIUE5GUUVR?=
 =?utf-8?B?SkJ6OC8zekl6MnpoQTcvM1RxSnZwaEh5S1B5ajJlekRZU2dnT2tjN3dvWnpp?=
 =?utf-8?B?L01YeDRNalYxT1c1T29xRHk0KzM5U1pIZ0lDMXFUekUzMUZMT0h6Tllndmc4?=
 =?utf-8?B?WUdrZ1ZIMXpINWprS2VjTkxId1hTZDRuenpUQVg3MUorK3MrUWY4M3FLV05Q?=
 =?utf-8?B?a1FXanBhZk9MOW5HdkNyQU9haFgrUXlhN0FxNTdwZnAzL1l3YUF0K05jVC95?=
 =?utf-8?B?OGhRNm54d2hsZll3OGd0VTVmY2MzOG1Wb0lRbWtFZVNvVWNld0pueno1Z3I2?=
 =?utf-8?B?Ny9BdjhBQUxqM3pSN2FGYVZ1aE9IUzVnMlBOZUVJZGE5SmxkU1NIRDZzYTNG?=
 =?utf-8?B?QUcxTHJSSERqMzkwcko0aUcwWFEwTURkK2YxVUpORkN4K1Bad0RscVQ5bHBG?=
 =?utf-8?B?RVh5a2Myb1RkZDhLMGdwcUhLQmRnbWNyUTV0bGNzY0xCdDNIRTdEVXY2K01F?=
 =?utf-8?B?bU9qQ1lOR3pTV3ltd0tianhlRjBkdkwzc0tKalByNzFrU1NsbjhSblJpVDNH?=
 =?utf-8?B?NkFOWDRVT3A1anNHdk0zc3NvVENMcWs2YW9qNzF5YlRyMHdEa3M4cFdOVGJn?=
 =?utf-8?B?MVdFcHRraW1nL0svcUhMNml2dVVpWFpMVEIxVWlwb2FiVGFVNVJlRE9UdnFp?=
 =?utf-8?B?ZEQvMGRYYUpCMElBd1RJMGgvOXY2UnZTUGZyaUovYVg1RU9PZXZDTEdOMlJS?=
 =?utf-8?B?elFMV1hneXUrcVdKTk4vRXIwSDgzc3hNMXorclJDeXlabUg5SUl1WTBmcGh4?=
 =?utf-8?B?VkE5WVJTU3lWZ09ZN1pTS0IzcFpreGtodWRVemFiOEliM1QyMVRHK2dHcXVJ?=
 =?utf-8?B?TDRNYytMVVowVjNWQjA2VWJmWXlhNmp2S0JqbS8zUXgrUDA1TGZnaksxMS9Q?=
 =?utf-8?B?a21ZVmtEaFlWTTB1WjgvM1NDZk1JQnhaTCtZMUFDRWwwUWpwcUwxTVBvcURB?=
 =?utf-8?B?bVhIbVkxcWZ6WVNOaVFwZ1M4MmgrRWJ0Z2txL1dXR2JldjR4VVJTR0RQcUhN?=
 =?utf-8?B?YlE1dUNraXM1a1FWRngvemRXeFByQmRYN05iTWFoSWRRY0s4MVNQNmNPUmlw?=
 =?utf-8?B?WHB1dHlwOWFLZEg3clF0bHlaL08xZkRoMTB4ZjJQZytIbW0yd2xpcDJDdDNz?=
 =?utf-8?B?Ulc3ZVpMRFpxU3V1NXlIWmZVMktGWFRTbmhxbENGUDRzalRicWcxemZkV3Ux?=
 =?utf-8?B?a1lIKzRFcmZGOXVldkNwTzlOU3lWVVY3Q1ZhRXJ5MUhuVU5kWEcxV2ZWWmxV?=
 =?utf-8?B?QkNMQjdzdWFaSGdlVGxmYVRZMGdoU0tGeEI3RDhaSXY5Yys5bWpXMjJzUjhZ?=
 =?utf-8?B?RDRaQVRXUGNwNlFWck1POFVBcDNnb3RlVUJvUVAzODRYN1F0L3VoVFMvekhk?=
 =?utf-8?B?NXc0M2ZlV0V6Q2U3NG5Qd25kaThRM00yeFZrNDBoZ0tHRFlyNlBLMEhXTUZ3?=
 =?utf-8?B?emZhUlc4UVVHSWZFT2RBZEVHKy9rZWthNnNWQ3hzL0gzSldJV1dicTRYRUtI?=
 =?utf-8?B?SWVHdGcxbk4xV3EzQzdJWTZnaUlNT0ZORU0yaEZEc3I4YnlKWUdVTUxuSTVD?=
 =?utf-8?B?MlJvQXdGcWoxR3RMT2l1T05kcXptTEo4N2lWV0FvSkUraVNyVFAwY2hYTFV3?=
 =?utf-8?B?Y1lRUStBWFNvTW96SFB6aW5BZ01jekg4VVhkVGlodFkxMy84OEdZQzA5NW1G?=
 =?utf-8?B?WlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03aeaf3c-ac35-4529-60aa-08dcd96addc5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 11:53:39.3149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jn8ZJTDIbpthRRcr+AKsvmh7y2kbwe9k0ZlUP3I4KgTBG+Cp8GIV1RK8e3O8/2O9bwJAPDTnGOJ3kPr/Ff91zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6080
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

Quoting Upadhyay, Tejas (2024-09-20 02:17:44-03:00)
>
>
>> -----Original Message-----
>> From: Sousa, Gustavo <gustavo.sousa@intel.com>
>> Sent: Friday, September 20, 2024 1:06 AM
>> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: RE: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
>> flushing
>>=20
>> Quoting Gustavo Sousa (2024-09-19 16:24:19-03:00)
>> >Quoting Upadhyay, Tejas (2024-09-19 05:22:50-03:00)
>> >>
>> >>
>> >>> -----Original Message-----
>> >>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
>> >>> Gustavo Sousa
>> >>> Sent: Thursday, September 19, 2024 2:18 AM
>> >>> To: intel-xe@lists.freedesktop.org
>> >>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> >>> Subject: [PATCH 3/3] drm/xe/xe2: Add performance tuning for L3 cache
>> >>> flushing
>> >>>
>> >>> A recommended performance tuning for LNL related to L3 cache
>> >>> flushing was recently introduced in Bspec. Implement it.
>> >>>
>> >>> Bspec: 70821
>> >>
>> >>Yes bspec needs an update.
>> >
>> >Yep.
>> >
>> >>
>> >>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >>> ---
>> >>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 5 +++++
>> >>>  drivers/gpu/drm/xe/xe_tuning.c       | 8 ++++++++
>> >>>  2 files changed, 13 insertions(+)
>> >>>
>> >>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >>> index 6ec2d2c11d77..ccd18cdd5b50 100644
>> >>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> >>> @@ -389,6 +389,9 @@
>> >>>  #define L3SQCREG3                                XE_REG_MCR(0xb108)
>> >>>  #define   COMPPWOVERFETCHEN                        REG_BIT(28)
>> >>>
>> >>> +#define SCRATCH3LBCF
>> >>>         XE_REG_MCR(0xb154)
>> >>
>> >>Please name this SCRATCH3 only as bspec mentions.
>> >
>> >Looking at our register database, it looks like there are other
>> >"SCRATCH" registers from other units. So wouldn't it be better not to
>> >use plain SCRATCH3 here?
>> >
>> >Probably SCRATCH3_LBCF for more readability...
>
>In that case I don=E2=80=99t have strong resistance here, but media also h=
ave scratch reg. How about "SCRATCH3_LBCF_GFX".=20

Yes, that's why it is being defined with the XE2LPM_ prefix, just like
with the other media registers that have different offset with respect
to graphics.

As an existing example already in the code, look at the definitions for
L3SQCREG5. I'm following the same pattern there.

--
Gustavo Sousa

>
>> >
>> >>
>> >>> +#define   RWFLUSHALLEN                                REG_BIT(17)
>> >>> +
>> >>>  #define XEHP_L3SQCREG5
>> >>>         XE_REG_MCR(0xb158)
>> >>>  #define   L3_PWM_TIMER_INIT_VAL_MASK                REG_GENMASK(9, =
0)
>> >>>
>> >>> @@ -406,6 +409,8 @@
>> >>>
>> >>>  #define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>> >>>
>> >>> +#define XE2LPM_SCRATCH3LBCF
>> >>>         XE_REG_MCR(0xb654)
>> >>
>> >>Agree with other review that we should name this MEDIA_SCRATCH3 for
>> future use well. Also this does not look to be MCR reg. Please double ch=
eck.
>> >
>> >I believe the prefix XE2LPM_ is enough to differentiate this from the
>> >primary GT version of this register. It is common to prefix registers
>> >with the name of the IP that introduce the difference with respect to
>> >other versions of the register.
>> >
>> >Please note that the same pattern is used for other registers that have
>> >different offsets on the media GT.
>>=20
>> Ah... I forgot to reply also with respect to the MCR-related comment.
>> Bspec 71186 lists range [0x38B600, 0x38B8FF] as multicast.
>
>Oh I did not realise it is different range page for media, I was looking g=
fx one. Thanks for pointing out. You can retain my r-o-b with that.

Thanks!

Please, let me know if the r-b also stands with SCRATCH3_LBCF without
the _GFX suffix.

--
Gustavo Sousa

>
>Tejas
>>=20
>> --
>> Gustavo Sousa
>>=20
>> >
>> >--
>> >Gustavo Sousa
>> >
>> >>
>> >>With that addressed,
>> >>Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> >>
>> >>> +
>> >>>  #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>> >>>
>> >>>  #define XE2_TDF_CTRL                                XE_REG(0xb418)
>> >>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c
>> >>> b/drivers/gpu/drm/xe/xe_tuning.c index f62622f0be85..4dd77b44ac82
>> >>> 100644
>> >>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> >>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> >>> @@ -80,6 +80,14 @@ static const struct xe_rtp_entry_sr gt_tunings[]
>> >>> =3D {
>> >>>
>> >>> XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL,
>> >>> UNIFIED_COMPRESSION_FORMAT,
>> >>>
>> >>> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>> >>>          },
>> >>> +        { XE_RTP_NAME("Tuning: L3 RW flush all Cache"),
>> >>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2004,
>> >>> XE_RTP_END_VERSION_UNDEFINED)),
>> >>> +          XE_RTP_ACTIONS(SET(SCRATCH3, RWFLUSHALLEN))
>> >>> +        },
>> >>> +        { XE_RTP_NAME("Tuning: L3 RW flush all cache - media"),
>> >>> +          XE_RTP_RULES(MEDIA_VERSION_RANGE(2000,
>> >>> XE_RTP_END_VERSION_UNDEFINED)),
>> >>> +          XE_RTP_ACTIONS(SET(XE2LPM_SCRATCH3LBCF, RWFLUSHALLEN))
>> >>> +        },
>> >>>          {}
>> >>>  };
>> >>>
>> >>> --
>> >>> 2.46.1
>> >>
