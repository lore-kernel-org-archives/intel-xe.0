Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB3EC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF8D10E81C;
	Thu,  7 Aug 2025 11:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvfBhiUV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86D710E81C
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Aug 2025 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754567470; x=1786103470;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=0s/a3Lq2gEaZDFaUKexCwKy0RQZqscfMRbvyH76fGgk=;
 b=UvfBhiUVPnaJBB5JlNVPQ966EcOh8xHQb/warysHgGmOS5f1HN/ctLB7
 dHm54DgItKI93Ncms+XoJkd3errOC0WpbtM3nh/2E5lXIPHdAfNpWoJD7
 tJmImU8iLx9NP6thvE+FDXpfQERV4MM8SlJA9rkMGJenLwytWIBC+lTqd
 7AhPez/RR52wqfb5o6P5AAechsNyQhlFxybbZv3GlgcLyRG72ibCGogVf
 rxwvLaWDE1Rd+xPHhdTmDQuEJEcuwn8AOGnhN/eU2Ngx4DPLKZk2Fki65
 MqI4D4xxhPmAkkG1SO+KjKTFX8yw5O6lMSooOFjqf3ei98ISyEFeGEvwx A==;
X-CSE-ConnectionGUID: DtU2bQO5RqyJm4ZNs4UrHQ==
X-CSE-MsgGUID: 2dTt9B0WRQq8nE0ic/FEIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56612705"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; d="scan'208,217";a="56612705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:51:10 -0700
X-CSE-ConnectionGUID: AS1PpypITtSOm03/AvFmNw==
X-CSE-MsgGUID: jB7gyjGqTZaxq2xcOvj6Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
 d="scan'208,217";a="196036766"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2025 04:51:09 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:51:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 7 Aug 2025 04:51:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.43)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 7 Aug 2025 04:51:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Db7DZqGB0IWWQMYzeYLjFAO/xca7UaMi1q8ETDIeXYNcHt87igdXfU1a41kEnzquNH0MDiKCFvoiXW1DaGF17AiIC3j+ku/abGB0LWhNp4WvKdGdoWZLnUZdcSHocwDUCOEFO521eK6caEg6rw+/Mh1M2h7WDoF+07hkmBsypEvP7L5g/5w2iJSOwa1qzWW9dybBvLb69DkgKjNz572axldQlW+cDmP+uOSaetDdcbqFTw86qPed3Narr77H5EledQfEMGWMO7cpBQnGa78IJUvXZaGZZd36LZ/VHtIDoKmrCV69LYxgQGu69CFgNrloMHUct6CVpqHHtWw83QInPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVqGW7F6Vpw3BFB46Y9tPrQg7bYLhsXtaFryd3nA0QQ=;
 b=FYtY+MmAX9ZiUD4cZxSqLLsnXPiMb/Vk6LU9y8dtEanQqOJ/Avacf3Oz4aWARiG/nvVA9N0+D0iooDQAVQrL03jfIfdDfc61NDnfHUrymZpNmHr8AKOqgVAd5QxgSVyIZ5vBWW2D0hYQgMnLkk9aQcCgraINxFEl3QVE152qY2/+kekLO6sDa8F6xx6ljy05OUcHhgDfKVKSsXNNYrGsx3jPnoAQuRNu1OgeMTqpbZbPhjNmZcaOaHAI8+l1/2a9mu+hPsNqWau4STzCXwn88GS15dV2SBePb1N8GI79qJGe+VVOvZdNtI8vdSzKtCTPiZkPi8/HRO6oSuY3waQ9/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5249.namprd11.prod.outlook.com (2603:10b6:610:e0::17)
 by CY8PR11MB7945.namprd11.prod.outlook.com (2603:10b6:930:7b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 11:51:02 +0000
Received: from CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3]) by CH0PR11MB5249.namprd11.prod.outlook.com
 ([fe80::a665:5444:d558:23c3%3]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 11:51:01 +0000
Content-Type: multipart/alternative;
 boundary="------------kAx6BLlO3QKsJBtwKuIogLtD"
Message-ID: <0e2bc35d-34a8-46fb-bf59-e8b32412b35d@intel.com>
Date: Thu, 7 Aug 2025 17:20:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/hwmon: Add SW clamp for power limits writes
Content-Language: en-GB
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250806172626.3226676-1-karthik.poosa@intel.com>
 <1d47f02d-2824-485a-ab4d-002cbfb06f1d@intel.com>
 <12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com>
 <bbbc9ff9-3547-4e5c-a491-3768cbbdb820@intel.com>
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <bbbc9ff9-3547-4e5c-a491-3768cbbdb820@intel.com>
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To BL1PR11MB5254.namprd11.prod.outlook.com
 (2603:10b6:208:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5249:EE_|CY8PR11MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f6f38e-559f-43bd-be61-08ddd5a8ae15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SFNJRlZtUFNVN3lpRSt6d0xtMTZnSHF5OHBpSUNoc29ya0ZXR1dEYWF0ZnBE?=
 =?utf-8?B?K3hlWS9UL0dOQW5WdlVYbVVzcDdBZVRReVJoUS9meVJrZE5XenUvVXIveWZ6?=
 =?utf-8?B?cFo0TnZVOHJtQlR1cWpVMnV2NzIyaGIxeHcrZ1VDS1VxaHVFZ1pScUkvaHlN?=
 =?utf-8?B?bnZyYmZOUStBRWJuUCtwaVl3QUZkUVV4M0xPMy9ROGdKUEhlUTgvdVRIOWJJ?=
 =?utf-8?B?eTB3STU1OGtJUHh6U3F4aG5WSXN1OHZQdHV5MmdmOXNiVVV3b21TY0NMcHlY?=
 =?utf-8?B?WFFsVGhlV25sRklpVkhVSUVZaWRsRGZRWUVVUmViOVpNaWlQTlpMYUhZMEQ1?=
 =?utf-8?B?MzJ5T0VVVWNkV1VEWG1wY3FMejZrb1Q3b3N1TVh6bkxxWVNLaDRNZ09uYjlp?=
 =?utf-8?B?RnJORGlKYUszVDc5N1hwRmFnSUNxOUkya2gzWGx4NEM1WmVvSnk1dWQxdit3?=
 =?utf-8?B?WlNELzkvVHI2VFlEYkpPN0V0K3FsY2diSlRULzV2d2R4dkFXUTZGYjJjOU01?=
 =?utf-8?B?SytTR1paSC9IaVVpRGJUcnBycnE3N0diTVR5RGNUbDkxaGcvRWN1UnNJZW80?=
 =?utf-8?B?cEo0Y3I2TlBvaGhBWTVxS0pLQTNWK2ZSU1RqVE11RWVoWG5ZSWFPWDNmcFcy?=
 =?utf-8?B?cFJOQ2svRUIwejg2YVNNRFlQSW9rQzN0ZXJBTU1xRlpHMU44VWlVL2ZRMGZX?=
 =?utf-8?B?NHBKSjVlazk1cHh5encwQjNISUpyd01KN1pOWEVZSXBWZVh6enlZeXVITk1u?=
 =?utf-8?B?NmNwOHZxQUJENXlnTk1LQmRRTUQ0L1BPTTNNQ3VZbitUc1A3WDhBUC9ER2V4?=
 =?utf-8?B?N0EwZit6cFhCUlJtR3RDYmJMbFJ2dDNUNXliRkk1OWlIWHBNMGJ6MGoyS0tY?=
 =?utf-8?B?cy9mbytIc2lmZTZlUVJXZmpCRHlma3pRS0R6MHZwKzB5OVZlZjc5MzI3RFdx?=
 =?utf-8?B?a0twSUZ1TUVGenJ2QXBSTGJBcks1SjJLWm5POE1DZXQ2VVR5MW9TOHFSY0kw?=
 =?utf-8?B?b0JrdnBkMzZ3c0xVczlWdjR4dGRSS3VrWmV5dHovcGpNNXlEdE9DVElEaW1O?=
 =?utf-8?B?YWVzRThSazJ0c24yN1ZnMkQ3UTMrWUplUkovNWtrRlhHZS92b0szbmc2bkVt?=
 =?utf-8?B?R2NLUG1ralNXV2RSV1hKYkh4K0VEWXByL0tBUlErZnJPd0FUMmErZE4xVXZa?=
 =?utf-8?B?YWZYSXVlanFQcXNDZnMrRjR2ek1ZMkR1NDFVK3FRNFdzS3p2bTdXUmxzRk82?=
 =?utf-8?B?NnB4VFpXVzZQSVoxR2dxNy9xMHpGR092SjdVL0VSM2JIQ3hqQW9uQlozS0s2?=
 =?utf-8?B?Si8vcVN5eDBJbWdXYmpoK0dmdkxZMENCYmh6NlVRVnNqdWRPRkN0QTg3VHFa?=
 =?utf-8?B?ZlkxSFVZRkgwRE9WU2hBSCszVVJmbC9yMExwUW9rc210OVZLOHhmaU96SlZJ?=
 =?utf-8?B?cnpmRGZJTnRCL0RUUHo1YmJYRVB4Z295TE40UnY1S1RIOHQzbzBsRmtjM1do?=
 =?utf-8?B?K1lFc09lREVMR3ZpS21HY2J6d2RsQk5UTUpRcDFkdUxhZ2hNempST0VoRFNH?=
 =?utf-8?B?bnBYQng1T09ESUxrbkliWXVyZnlCVTRZTjdhMjc3MXJwSzlwWHEvNC9UVWRB?=
 =?utf-8?B?SWh1RmZGNWR2UW1EYjg2VExrbFAvTlAwcDE1THJnc0l0dWJBSDhNbzd1Y0F2?=
 =?utf-8?B?SEZ2Y3djazFLZkdoSE91dFo1UjNWWVl2Wlk5Q3liNldwRCtRaElxMUJIK1R1?=
 =?utf-8?B?ako0UGtQOTVvTmRDNjlrWDlseGwvbWhFRVJkak40Q0cxZ3ZSYjFCK0d0VWww?=
 =?utf-8?B?QlVGRndobmRQa0xLU2QwbEUxb1hVaW1IY1N0N213ejBuYVFiRUFHZFo5RUFI?=
 =?utf-8?B?VHlLU2RaTG5hU1RNOS90NFpmeUQ1T0tYcmZhU3dDMkNoeUtudkFtc0VZS0F2?=
 =?utf-8?Q?OjxMeJ13ccY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5249.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1E0SHlKRkxjeHBVbEg5TGxiVUpPd0FpbnQ5YW5RSTRSYlJocktFMFpsd2dE?=
 =?utf-8?B?L2xMTmpJaXVmVFBsMVA0S1A4Zk8yZ3hGUy9qMHBxQTdCNVZacDVYeWxiWlZF?=
 =?utf-8?B?MEo3UlpJaFN6dkdXRjF6MTVSWjNoWU5XTk0xd0U5aXY1TDZXSzBRNURxQ1lv?=
 =?utf-8?B?aDliRnprWHFzN3ZWY3J6Z09naUFMZnY5WVpWT1dOWGtQRUxhckJrYVlGdy8y?=
 =?utf-8?B?cWlqbTQwVTFxOXU0RHgxai8yVnZ2emYydXp1QUNKY3VvK0wxNEFyOW9BdlN3?=
 =?utf-8?B?TmwzRWN0R0pvbkZXd3ZVYWs1YTYwVEU2RzF4MzRpcVhZa2J4L2k4dlY4MnMv?=
 =?utf-8?B?eWNyN1FHMzJOVDVZVlI4MHdmcjdJZVEwMHkyRmhCWmpvcFhHK3Y2YXFCWGI4?=
 =?utf-8?B?eTRlVXMrVkU0ejRQaDc5a0syQ1B5Y0VKMnhxclBPNUprazhDeG9IWHFucWhl?=
 =?utf-8?B?VmRDR2JYL1BNNkFGb1NSRjF2S0FsVHZKU0p6SVhLekxiMXlqdlBwMVI4bS9u?=
 =?utf-8?B?TWxWQzBrM2pSbGFEN3V2SmV0RE0zdHhpRE5VV05nbDFzc0MwK3lYRkFhZC9l?=
 =?utf-8?B?UEx2eHFFQklwdGRyWHpTTDI5Zm9zaGl5VFN2Nk85NUY5WWFaZkpLUnFLMkhO?=
 =?utf-8?B?RlRqb2ovOUJEOHVZZlR6TXhNa1I4MC84M3QrWGt1SnpmMlRPLzczNHduYXQ1?=
 =?utf-8?B?ZGJFam13UlJrVktGSlR2UmR0YzV5RU8veFVFMTd0c3poQys3Um1nWWFES2RI?=
 =?utf-8?B?WE5jc2RKSlNyTVZRMzNTNlNRNjhwZGdUTmowOWZCNnlJd09EVS9aUFVpbUZF?=
 =?utf-8?B?a2UyWkRjeE5NajY0TVNHMHY3VVV4RTk3NmRkUVhZTmN1SVF6MlVrR2FsU2VD?=
 =?utf-8?B?bjZXcURsa1poRUE0V1JVcFJCNzZKNENCd0ptZmE0VVpRSmNYMlFaR2I0R1NM?=
 =?utf-8?B?bXpyOHBhMElIZ2x6TXc4Nll6alprVGNvWVVBdEMwR1BsUUZlK2FhSHJRNU10?=
 =?utf-8?B?QkxtVlU5TUt4U3pYTGFnWjlibTVLL3dITEJoVGhBazFHVlU1MTZtbHVFTVp6?=
 =?utf-8?B?T3RlUTVlUVd5dnE1K2t6SjhJUlZNNE1wYUlEa0NlOTZPUzRjVktjekRrbE85?=
 =?utf-8?B?RU9MMGpvZUhGOGM3NnFNaitoK1NhVzdReGdhdFYxQStMcHNaRVAvbzFUWEU4?=
 =?utf-8?B?OERFcFg5WmdSS1FhY2JPM01hYnRRTXF5TlhSSFdOWTZ4dHdMYXpZNUhrdy9D?=
 =?utf-8?B?WDhwYkQ0M3J1dkhaUjR2R0NOeUtsRWJQc0g3MWJkVDc3SkxPSlJhV2VGRExs?=
 =?utf-8?B?eVlPOVdTUGxsVytTRU9IRWVQaDg5LzFSZjNjRGZzTEdQb1FZZjh0eXZrSHU4?=
 =?utf-8?B?ZkUrL0k5Yk4rbkU5cEFoMlJkSG5HMlNpc0IvbmhwUi9jMlVEaExtQ0prTGZa?=
 =?utf-8?B?c0w4SVBxazdDUW1ORVlwRkNXWU94eWw1K3JFVXJSZ1hZSW5JNEdJZ1NjZWpB?=
 =?utf-8?B?aVhtd3I4MmdFQXdCWEFVY1RyanhEbXFrL2dGZGtIZi93UjFoK0xkSUtGbWxY?=
 =?utf-8?B?WE9hNXYvWUt3TGNqaW4yQzJ2eldhdWFkbDFGckg0b0tIL21KeDE2eFNuaGll?=
 =?utf-8?B?RXZqRGJ3OXNUc25rQW1RSm4vRkV0THJsdzQrektzanNGRjE4ZzlKNnpCeXIz?=
 =?utf-8?B?LzdVWUNhUU95c0FkRGY3MWlqTW01YjBCbnlWV0pLa1g0Rk5iTGc3RUNqbmJk?=
 =?utf-8?B?V1hpeG9GYXFIa0EydVNvYTcvdUlKT1FwWWhOZ2FQZWlHNTBCbDFmYVp0cTZq?=
 =?utf-8?B?SEVYakhLQ0tTQW1qUk5yYTl6TkpDd1QvVFplR2M0NTRBSUNxU2FBSFZyQjZB?=
 =?utf-8?B?WDdVTFN2WHloUkVOa2h2SitnU3ZXeE1nZlVzRUJxMEgvb3dqUy9jRTF6VlM2?=
 =?utf-8?B?WUdkVUp1VEd1TXEvdmF3QnhWc1ZzVEwyV2xnVi9Sd0svWGxTMUFETHBTNVBv?=
 =?utf-8?B?eWl4dXI0cEE1WEdMYW9aem9jcDNrZ1d3cE0xeXJ3V2NMUk9PdFFsYXVEOW1J?=
 =?utf-8?B?ekpKR0FGSzRmWUNSUFhYelp4cGsyY2YrSk5iNVJsaWFTT1ZRMmY1bDZ0RnVJ?=
 =?utf-8?B?dVFLMmRCLzVOd3M5cEh6WFgweHRPYmI5eUh1N2NQaFlYdmVlb1U1dWFNVmVs?=
 =?utf-8?B?eHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f6f38e-559f-43bd-be61-08ddd5a8ae15
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5254.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 11:51:01.6151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yp9yX4FtbPzFrqn7XRRMHOKJE4KtEsK28yioD08zNEXVHpru2xMUNZieFzMbSGYKLVnKlK1F1iFTIzGXS7zJ/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7945
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

--------------kAx6BLlO3QKsJBtwKuIogLtD
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 07-08-2025 16:52, Nilawar, Badal wrote:
>
>
> On 07-08-2025 16:39, Poosa, Karthik wrote:
>>
>> On 07-08-2025 16:03, Nilawar, Badal wrote:
>>>
>>> On 06-08-2025 22:56, Karthik Poosa wrote:
>>>> Clamp writes to power limits powerX_crit/currX_crit, powerX_cap,
>>>> powerX_max, to the maximum supported by the pcode mailbox
>>>> when sysfs-provided values exceed this limit.
>>>> Although the pcode already performs clamping, values beyond the pcode
>>>> mailbox's supported range get truncated, leading to incorrect
>>>> critical power settings.
>>>> This patch ensures proper clamping to prevent such truncation.
>>>>
>>>> v2:
>>>>   - Address below review comments. (Riana)
>>>>   - Split comments into multiple sentences.
>>>>   - Use local variables for readability.
>>>>   - Add a debug log.
>>>>   - Use u64 instead of unsigned long.
>>>>
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> Fixes: 92d44a422d0d ("drm/xe/hwmon: Expose card reactive critical 
>>>> power")
>>>> Fixes: fb1b70607f73 ("drm/xe/hwmon: Expose power attributes")
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_hwmon.c | 29 +++++++++++++++++++++++++++++
>>>>   1 file changed, 29 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index f08fc4377d25..768a942ab0e7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -332,6 +332,7 @@ static int xe_hwmon_power_max_write(struct 
>>>> xe_hwmon *hwmon, u32 attr, int channe
>>>>       int ret = 0;
>>>>       u32 reg_val, max;
>>>>       struct xe_reg rapl_limit;
>>>> +    u64 max_mbx_power_limit = 0;
>>>>         mutex_lock(&hwmon->hwmon_lock);
>>>>   @@ -356,6 +357,20 @@ static int xe_hwmon_power_max_write(struct 
>>>> xe_hwmon *hwmon, u32 attr, int channe
>>>>           goto unlock;
>>>>       }
>>>>   +    /*
>>>> +     * If the sysfs value exceeds the pcode mailbox cmd 
>>>> WRITE_PSYSGPU/PACKAGE_POWER_LIMIT
>>>> +     * max supported value, clamp it to the command's max (U12.3 
>>>> format).
>>>> +     * This is to avoid truncation during reg_val calculation 
>>>> below and ensure the valid
>>>> +     * power limit is sent for pcode which would clamp it to 
>>>> card-supported value.
>>>> +     */
>>>> +    max_mbx_power_limit = ((PWR_LIM_VAL) >> 
>>>> hwmon->scl_shift_power) * SF_POWER;
>>>> +    if (value > max_mbx_power_limit) {
>>>> +        value = max_mbx_power_limit;
>>>> +        drm_dbg(&hwmon->xe->drm,
>>>> +            "Sysfs value for ch %d %s exceeds limit; clamped to 
>>>> supported maximum\n",
>>>> +            channel, PWR_ATTR_TO_STR(attr));
>>> Is this debug message still needed?
>>
>> Having this debug message helps to identify clamping from driver due 
>> to oversized sysfs input. I think we can keep it.
>
> If the intention is to surface clamping behavior to users or 
> developers, then this message seems more appropriate as a 
> |drm_info|rather than |drm_dbg|.
>
okay, I shall change to drm_info.
>
> Regards,
> Badal
>
>>
>>>> +    }
>>>> +
>>>>       /* Computation in 64-bits to avoid overflow. Round to 
>>>> nearest. */
>>>>       reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << 
>>>> hwmon->scl_shift_power, SF_POWER);
>>>>   @@ -739,9 +754,23 @@ static int 
>>>> xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int channel,
>>>>   {
>>>>       int ret;
>>>>       u32 uval;
>>>> +    u64 max_crit_power_curr = 0;
>>>>         mutex_lock(&hwmon->hwmon_lock);
>>>>   +    /*
>>>> +     * If the sysfs value exceeds the pcode mailbox cmd 
>>>> POWER_SETUP_SUBCOMMAND_WRITE_I1
>>>> +     * max supported value, clamp it to the command's max (U10.6 
>>>> format).
>>>> +     * This is to avoid truncation during uval calculation below 
>>>> and ensure the valid power
>>>> +     * limit is sent for pcode which would clamp it to 
>>>> card-supported value.
>>>> +     */
>>>> +    max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK >> 
>>>> POWER_SETUP_I1_SHIFT) * scale_factor;
>>>> +    if (value > max_crit_power_curr) {
>>>> +        value = max_crit_power_curr;
>>>> +        drm_dbg(&hwmon->xe->drm,
>>>> +            "Sysfs value for ch %d exceeds limit; clamped to 
>>>> supported maximum\n",
>>>> +            channel);
>>>
>>> Same question here?
>> same reply as above
>>>
>>> Regards,
>>> Badal
>>>
>>>> +    }
>>>>       uval = DIV_ROUND_CLOSEST_ULL(value << POWER_SETUP_I1_SHIFT, 
>>>> scale_factor);
>>>>       ret = xe_hwmon_pcode_write_i1(hwmon, uval);
--------------kAx6BLlO3QKsJBtwKuIogLtD
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07-08-2025 16:52, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:bbbc9ff9-3547-4e5c-a491-3768cbbdb820@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 07-08-2025 16:39, Poosa, Karthik
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com"> <br>
        On 07-08-2025 16:03, Nilawar, Badal wrote: <br>
        <blockquote type="cite"> <br>
          On 06-08-2025 22:56, Karthik Poosa wrote: <br>
          <blockquote type="cite">Clamp writes to power limits
            powerX_crit/currX_crit, powerX_cap, <br>
            powerX_max, to the maximum supported by the pcode mailbox <br>
            when sysfs-provided values exceed this limit. <br>
            Although the pcode already performs clamping, values beyond
            the pcode <br>
            mailbox's supported range get truncated, leading to
            incorrect <br>
            critical power settings. <br>
            This patch ensures proper clamping to prevent such
            truncation. <br>
            <br>
            v2: <br>
            &nbsp; - Address below review comments. (Riana) <br>
            &nbsp; - Split comments into multiple sentences. <br>
            &nbsp; - Use local variables for readability. <br>
            &nbsp; - Add a debug log. <br>
            &nbsp; - Use u64 instead of unsigned long. <br>
            <br>
            Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com" moz-do-not-send="true">&lt;karthik.poosa@intel.com&gt;</a>
            <br>
            Fixes: 92d44a422d0d (&quot;drm/xe/hwmon: Expose card reactive
            critical power&quot;) <br>
            Fixes: fb1b70607f73 (&quot;drm/xe/hwmon: Expose power
            attributes&quot;) <br>
            --- <br>
            &nbsp; drivers/gpu/drm/xe/xe_hwmon.c | 29
            +++++++++++++++++++++++++++++ <br>
            &nbsp; 1 file changed, 29 insertions(+) <br>
            <br>
            diff --git a/drivers/gpu/drm/xe/xe_hwmon.c
            b/drivers/gpu/drm/xe/xe_hwmon.c <br>
            index f08fc4377d25..768a942ab0e7 100644 <br>
            --- a/drivers/gpu/drm/xe/xe_hwmon.c <br>
            +++ b/drivers/gpu/drm/xe/xe_hwmon.c <br>
            @@ -332,6 +332,7 @@ static int
            xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr,
            int channe <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret = 0; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 reg_val, max; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_reg rapl_limit; <br>
            +&nbsp;&nbsp;&nbsp; u64 max_mbx_power_limit = 0; <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;hwmon-&gt;hwmon_lock); <br>
            &nbsp; @@ -356,6 +357,20 @@ static int
            xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr,
            int channe <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto unlock; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
            &nbsp; +&nbsp;&nbsp;&nbsp; /* <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * If the sysfs value exceeds the pcode mailbox cmd
            WRITE_PSYSGPU/PACKAGE_POWER_LIMIT <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * max supported value, clamp it to the command's max
            (U12.3 format). <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * This is to avoid truncation during reg_val
            calculation below and ensure the valid <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * power limit is sent for pcode which would clamp it
            to card-supported value. <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
            +&nbsp;&nbsp;&nbsp; max_mbx_power_limit = ((PWR_LIM_VAL) &gt;&gt;
            hwmon-&gt;scl_shift_power) * SF_POWER; <br>
            +&nbsp;&nbsp;&nbsp; if (value &gt; max_mbx_power_limit) { <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value = max_mbx_power_limit; <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sysfs value for ch %d %s exceeds limit;
            clamped to supported maximum\n&quot;, <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel, PWR_ATTR_TO_STR(attr)); <br>
          </blockquote>
          Is this debug message still needed? <br>
        </blockquote>
        <br>
        Having this debug message helps to identify clamping from driver
        due to oversized sysfs input.&nbsp;I think we can keep it.&nbsp;<br>
      </blockquote>
      <p><span data-teams="true"><span style="font-size: inherit;"> If
            the intention is to surface clamping behavior to users or
            developers, then this message seems more appropriate as a </span><code class="skipProofing">drm_info</code><span style="font-size: inherit;"> rather than </span><code class="skipProofing">drm_dbg</code><span style="font-size: inherit;">.</span></span></p>
    </blockquote>
    okay, I shall change to drm_info.
    <blockquote type="cite" cite="mid:bbbc9ff9-3547-4e5c-a491-3768cbbdb820@intel.com">
      <p>Regards,<br>
        Badal</p>
      <blockquote type="cite" cite="mid:12626350-3e4b-4462-8401-6fbd3412f8c9@intel.com"><br>
        <blockquote type="cite">
          <blockquote type="cite">+&nbsp;&nbsp;&nbsp; } <br>
            + <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Computation in 64-bits to avoid overflow. Round to
            nearest. */ <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg_val = DIV_ROUND_CLOSEST_ULL((u64)value &lt;&lt;
            hwmon-&gt;scl_shift_power, SF_POWER); <br>
            &nbsp; @@ -739,9 +754,23 @@ static int
            xe_hwmon_power_curr_crit_write(struct xe_hwmon *hwmon, int
            channel, <br>
            &nbsp; { <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret; <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 uval; <br>
            +&nbsp;&nbsp;&nbsp; u64 max_crit_power_curr = 0; <br>
            &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mutex_lock(&amp;hwmon-&gt;hwmon_lock); <br>
            &nbsp; +&nbsp;&nbsp;&nbsp; /* <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * If the sysfs value exceeds the pcode mailbox cmd
            POWER_SETUP_SUBCOMMAND_WRITE_I1 <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * max supported value, clamp it to the command's max
            (U10.6 format). <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * This is to avoid truncation during uval calculation
            below and ensure the valid power <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; * limit is sent for pcode which would clamp it to
            card-supported value. <br>
            +&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
            +&nbsp;&nbsp;&nbsp; max_crit_power_curr = (POWER_SETUP_I1_DATA_MASK
            &gt;&gt; POWER_SETUP_I1_SHIFT) * scale_factor; <br>
            +&nbsp;&nbsp;&nbsp; if (value &gt; max_crit_power_curr) { <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value = max_crit_power_curr; <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Sysfs value for ch %d exceeds limit; clamped
            to supported maximum\n&quot;, <br>
            +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; channel); <br>
          </blockquote>
          <br>
          Same question here? <br>
        </blockquote>
        same reply as above <br>
        <blockquote type="cite"> <br>
          Regards, <br>
          Badal <br>
          <br>
          <blockquote type="cite">+&nbsp;&nbsp;&nbsp; } <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uval = DIV_ROUND_CLOSEST_ULL(value &lt;&lt;
            POWER_SETUP_I1_SHIFT, scale_factor); <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = xe_hwmon_pcode_write_i1(hwmon, uval); <br>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------kAx6BLlO3QKsJBtwKuIogLtD--
