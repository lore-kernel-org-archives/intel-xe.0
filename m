Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE1FC5AC82
	for <intel-xe@archiver.kernel.org>; Mon, 10 Aug 2026 08:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC1510E0DE;
	Mon, 10 Aug 2026 08:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lAd7iJ+2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620F310E0DE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Aug 2026 08:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786351464; x=1817887464;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6wzY7zquTtavdxvwpC2vb4RB6Mn20n+ipD+3agL0NJA=;
 b=lAd7iJ+2M+pqxQWXyfGUKLd+3WzUVoeEjCOnh1tmbAuwf41fOaSbvOxH
 BfOQCMKtCEeu/6VBmhq1Y4v0wJ8gLSkJbj+WcmbGzh/wMMm0fkOgDl4/l
 DUKcQJEztHqs+67qWAfi3Mdr+hU5Iy0er9NAayg+OUwC9Pxl3LkcU+XkJ
 KRdzAXMD4/yhOoWbJ7le0XRZw/+J3I02hnjtwD0xHykAwP+l/85Pa4T6r
 w6NG74/oc27f7Jg4+0Vf9i8zJE63SbJilRlnWoaTJvVLcwnCBwyFqFNii
 OyM++qPRXVLepofPukW4h/SmJ/BTTrPF0ghVSRP+AIPfyJuNr42tHTf1E A==;
X-CSE-ConnectionGUID: 7ZF5xYSyR26HWCn22JLHMQ==
X-CSE-MsgGUID: NNFj5kTrSGGsy9FBvVgiqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="90674226"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="90674226"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 01:44:24 -0700
X-CSE-ConnectionGUID: ijd3dAQhScuzlB+dRlJh4g==
X-CSE-MsgGUID: V8us3Pj3QSyKEvvjWAIcVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; d="scan'208";a="262464033"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2026 01:44:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 01:44:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 01:44:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 01:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEke8v/yS35IKbh0c4a35CjhpbRjCag4JrYcWwNa+refQ7x4hyfTHSDx54nvouvQTPKC++K7b5P0Tv7wviwd/IMX9joXOYhdvuCHF0vk6OQlyrnLcZ3tHLBQR4pvFfvpm96dWYaTJwL93fjP4aEUZAe5jbYYylSzCEHO1GNKlJntgJfWnXADqQ+te+dZ8fgzbtra2xu6UkCrOZiKT4mxAHQmJLYPVjas4mn++ZIO7562nI34LycOeOm6gvmWYFxGJEs/2djrZgVzAQjXmyURJ8ZBxjZcT7QwkdHEYZEfkJ3ceWx+hW+EtvU85kT6TJI1SuHehVvKV2dtTueQB0PVjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7Z/SAkqSM2Cb1GnrONU/0SpvDQFpWUt51Zhh8ep8Ag=;
 b=XJkC2MT5L2uIZIZpnBY7VQaWs1tCVeG4HEAc0yeXzliVHmeo6fwAU2L8QNGh9F2tng1ZRA+8FxvUBb2OJYyAmXhur+y4G6DVFRSz++HiNa9vSoehnDNX6rB03hBioZgagJHbDhN6Gu1EoJW8lC+Oj42McEITvNRfYytymKuSN1jNxuxiGRaqoLQzR9usmluKfxj/foydq7zuU/6p4FOk3YmEXYwVLNNlearP+ziTatc6datBjsIqXq6C7dN0ixb6g8c8gyh0+M2nwW8ffshPRP6QtKl88k068CznFAw9UxpXgJ2GEik9Nak1xUxtLmwp7AwfyA4zfj/CsnrI2K3A1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB8478.namprd11.prod.outlook.com (2603:10b6:510:308::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:44:20 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 08:44:20 +0000
Message-ID: <c5bc9ad6-0e5c-40aa-b689-45ea3bfe00c1@intel.com>
Date: Mon, 10 Aug 2026 10:44:16 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GVUxMOiBmYWlsdXJlIGZvciBkcm0veGUvcGY6?=
 =?UTF-8?Q?_Add_=5Flocked_variants_of_some_config_functions_=28rev2=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20260805154733.604-1-michal.wajdeczko@intel.com>
 <178615476768.30363.2354595885344707114@61270ab9df2a>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <178615476768.30363.2354595885344707114@61270ab9df2a>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e5d86b3-70b8-4d51-c9be-08def6bb91de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10067099003|56012099006|5023799004|11063799006|4143699003|6133799003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: et/gqfLxup5e0bPl0TUro93lAnvdFUVRd9qsUm8yc0nclOdeZQ2nFk52fL0S2WTkxWY1/qs7Qo5mTZcXkYQNozOsnG8nwjIhVp48u+apGmLSjT9a3CqMuJR4ICKtXilHrQYTMs95Nw+iurLhb/0CEU5YkxdUQuLGnJawIh/EvzJQcda89JQ1H4NhMDfO/uj13qZOUBfkT7rqIw8yFyD54s0Km7QWJKuux1hMPQEa1vuW0EpI9cI3avFwJIHrfaf1Ekb5u7O3kEe3laBI4KmcBaHlafujj9huorZ7uBtEYmkGzk8n4XCpqkRm5WywVXJA7PycwPhN6mMuXhKKUWmiE0lz1FlIlJyVy1M4E3nwzVIF94xGTG3ZkVNnB3LZGJDC3uqqfTSoG2skNivniEg5wkT+4YC0bBRLyevoadAkfBVvV3XtxecEOqgU1erQk+vHvyLGaJLXWJq0fMLoQLp65sfNVTOTMffpGE8lp0HCkhE76upC7AxJpWHAK50T95fhj9oiKZ+JacO8Me6i6OJAnoSDuu/OHPvwF4BH3snZAfKrX0R8K97c9dzLshqINfPxk77TTPmKSfGL78JKjwNfi19or/m6bI/252kyCdCwVyU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10067099003)(56012099006)(5023799004)(11063799006)(4143699003)(6133799003)(18002099003)(22082099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjVOVU9VMzRvSkpxS3F0VkV6RmdJK1hRaS9NaUR1bWhhYmI0TkllRzFwNnYw?=
 =?utf-8?B?aHFjdmVNS1FHd2dWSXRuYStVUXhmSy9BdGVvZmJQM1hKTklTa0NMQVZLRWRr?=
 =?utf-8?B?b084MkdCRUhDanI3M1JXTldOQ3UxT3VJeGtuTTR4blhNR01hQk1Ub0t3VGNm?=
 =?utf-8?B?akk5SkJqbTlMZ0hJS2tQYXhGQjZ6L2loZXViNzMzRDh6eWd2bTdNT3J5T1ZF?=
 =?utf-8?B?Yy9tQUR1c3d4RlJ4UnpSRC96cUQrdU9xa1hlajFpdEZQK3BQV0Z1ZHFRS0NB?=
 =?utf-8?B?eTNXVVJtdW1kWjFwZER5S09heEVFMXc0bW82cVJ2VDJyR2JFa1FEcmc4L2hi?=
 =?utf-8?B?SEFhYXZpRFhDOFJkWjdOUXNiaGFHTGRJU0RWaFBuWEUrOFBLU0NGUFZRbnkw?=
 =?utf-8?B?TmpGRDlsSitRdlcybzBMUEd4RHlkblJ2SjVSTXhVOWRGYWcwVmJvU2lGT05N?=
 =?utf-8?B?cU5STitWYUVDQ2lWeXNBKy9LeU85cjRiNGZSL0ZRbGNNaC9xbFZLRWFmZndZ?=
 =?utf-8?B?eGx0NEhnV3lVQ3d0UkNYUzFvUjd6Q1dqdjIyL0kwbUJsUDlCMHRweDBTU2tP?=
 =?utf-8?B?NHRCVlkxVlZmRjhHWWhyRmNzSWtCUW1YMXNvV2wrYjh1L0IySkt2STlHNnFo?=
 =?utf-8?B?SCtZQkc1M1U5OU1xVTNHNXNKSVBGOUZjNllYd3poNEdQZEdoUWtGeWd3b1VJ?=
 =?utf-8?B?Tm5uejgxYldPTzJMQWRpa3MwdzE0SmE1YmxwQ3NyNnpmWEF1dWYxYVpsYTNz?=
 =?utf-8?B?Rk8rNzdSSm9YaklLTC84VFdDLzA5clRLdDJBQnh5R0ZJN0RFbGV6MzlmcGlS?=
 =?utf-8?B?T3p5bHB3a25zWTdQQ1FiaERwQldURU01aWZFc0U5a0Q3RS81MTZIbTVjZERh?=
 =?utf-8?B?eDRoazJSajFwVi9SY2E5RTVGZzBXNjBKZlUvWUFQdWl2Y1NvaVljNUtwNG5P?=
 =?utf-8?B?MHV3TDhTYTd4T2kwR3RiRGtHMlN4UngzS3dsYXZwVkg3T0xWQVh5K2paSUlU?=
 =?utf-8?B?NlJ0WW5UeXdjNDJHeEF0RkcwbGFWaDgzLzUzQm14SU9WbUpHMmRMeTJGbTc1?=
 =?utf-8?B?NHRiTHBNMGV3eGxEN3o0TElJWHdybWhhd3BTV1dFQ0lSajQ3OVFRQnlDWFov?=
 =?utf-8?B?Zmh3a3VZenFWR3NRN1BJcGdxZFNUT3hWR1M3d0RPQ1Q2SzYyYXUybGVlR014?=
 =?utf-8?B?alZ1dW1oTXZxVWdTVXZVZyt4eG5VZXloZ1hSM2s4bW5SVExiMHgxaUJtNEg1?=
 =?utf-8?B?VDA3QlkzSDBYSTZQZUlKOGNDamRaUW9ZeUdpU2t5K3EybE9SZWl0NTk3cnlW?=
 =?utf-8?B?eEFYN25WcmpuQ0xNZ3F2dWRyVnU2dUlGVkNoOEdzVmRqdHl4NzV3NmtmcHJQ?=
 =?utf-8?B?WmJMbVovdHRiK1I3SGMyS3BzaXlrVUtFM0RmVytUZUFrcUJad2QvSXVaYnVh?=
 =?utf-8?B?dmVmaVNSd1oxMUk2aXVWTG15elhlbDRqRmljMzlxcXdjeVlBdTlJaUU4dElr?=
 =?utf-8?B?YVQxVmVOSkhha2xvazNYN1NmZkVTOVgrSFppNXJRelVNNG1yL01ZTm5HN1dH?=
 =?utf-8?B?WlZOb2M4ZmlaS0kwbU1jTE11QWdBWXhRblBzRmZpZ1Bia2FqZ2xQTjJPWWdk?=
 =?utf-8?B?ZEZOOVJvaTY2NGFtK0trYWs5dE9RNmNsZGZhT0hiWGo4dEFYUVI3dVloRFAx?=
 =?utf-8?B?d3NwNDdOMlhvWk81aTYxZ1p3NWkzclE1N25XMXBVN3pQdEJ5alVOYkpOdG14?=
 =?utf-8?B?NHFIRFBGQVpoRUQyRVpEc1kybjFqVzB1eGgzM21COFVNLzNTNDhLOWMwcXJK?=
 =?utf-8?B?OGtuclVCMm80MG5XYmVxMFlFeFJtL1pGazBDdUo4TU1rQy9iTUJWeXEzbE04?=
 =?utf-8?B?alB6R2dGdDhiRGdtS2ZFTXpPY0RSMmV1aks0Y3NVN1NTOVU4bFlubW9aU21K?=
 =?utf-8?B?TlRxaHpZQTZHa3FHbkVMcDJSZ253c3hILzJ6K2lTRmxWNzZrTlNnYk9RemJk?=
 =?utf-8?B?dmFLNTBKK0JvSUVVY1JJYjRZOWp2OGI5Zk5MZlQ4b05TSG16N0w4cTNjRlEr?=
 =?utf-8?B?UWVSN0hZS09Jc0MvSlhyUWNxZVZjbHVGTU9WRTkyMnFLdkczcExKMWtLaFRn?=
 =?utf-8?B?REJHMTg4R0MyenEvbmVwakVnaXBVdXhHdmI4RGNrTGFTekUrOSs1ZWpjcEVm?=
 =?utf-8?B?VFpId0d1Z0ZiaVZCbERiZitvMXJLZVhVcXpDQm1jRWc5VE8xQllIV0Y2NXFq?=
 =?utf-8?B?VG1MdG9vK0hPbk5QNk5uRWdCQWl2N0cwQ1pTZFFXemd1d3hQZ0RzYVJxZ3ZE?=
 =?utf-8?B?ZXNPK0ttRW5FS2hFLzRaTitsT2NxT29EaGIzU2FJaC9HUDI1Wk9jTzVhMDh5?=
 =?utf-8?Q?1jfj8RAs9VpFri3A=3D?=
X-Exchange-RoutingPolicyChecked: RjD51bRXUL+F5UGpX79OmEqVXEogvkTpllvbDVbltZtPXYzTr9bH1GzZUuL8PJOo/Wtj9+nthjuJ/Px9/mFue4ThKvrCSJqE6FkjykGKDZkqr0nfpLok52ifzNMuDy0o49LgGKw1cfsBiUZoU20g546ln6tOOuI9oTcCoeUAB7o0eLhgo3FX0cZOAIWUnLFOJqUYPpkHLy2iGXAs8ZdMLsF8/yWVWJv0Z/OdqDsoIknQ8AG6ighqNjAz/JrnedKBH72tMN+UAzxg134QNSihzj7rl2gjDq5HXeOLq/tAGvSS3MAbhUTWSSV2UkjgWoyyUz9YzwsQcEDYuWITsGx4Cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e5d86b3-70b8-4d51-c9be-08def6bb91de
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:44:20.1248 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jf8Wxbb83alCpnDA+PxHVPJsNDxFguPoIbIaJZ36bkfOF7cQlbAahUYdcIDAZATT/aZUDOVV2q8RinETGHARSZzg79MKeEwAptBexO70/FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8478
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



On 8/8/2026 4:06 AM, Patchwork wrote:
> *Patch Details*
> *Series:*	drm/xe/pf: Add _locked variants of some config functions (rev2)
> *URL:*	https://patchwork.freedesktop.org/series/171668/ <https://patchwork.freedesktop.org/series/171668/>
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171668v2/index.html <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171668v2/index.html>
> 
> 
>   CI Bug Log - changes from xe-5560-01d30c194951b8794c33f0d7f559bc4a1c9b7630_FULL -> xe-pw-171668v2_FULL
> 
> 
>     Summary
> 
> *WARNING*
> 
> Minor unknown changes coming with xe-pw-171668v2_FULL need to be verified
> manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-171668v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> 
>     Participating hosts (2 -> 2)
> 
> No changes in participating hosts
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in xe-pw-171668v2_FULL:
> 
> 
>       IGT changes
> 
> 
>         Warnings
> 
>   * igt@sriov_basic@pf-unbind-with-vf-probed:
>       o shard-bmg: ABORT <https://intel-gfx-ci.01.org/tree/intel-xe/xe-5560-01d30c194951b8794c33f0d7f559bc4a1c9b7630/shard-bmg-6/igt@sriov_basic@pf-unbind-with-vf-probed.html> -> FAIL <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171668v2/shard-bmg-8/igt@sriov_basic@pf-unbind-with-vf-probed.html>

this was already seen as #5937 [1] and there is a pending fix [2]

<3> [476.310349] xe 0000:03:00.0: not enough MMIO resources for SR-IOV
<5> [476.365462] xe 0000:03:00.0: [drm] PF: Failed to enable 1 VF (-ENOMEM)
<6> [476.414815] [IGT] sriov_basic: finished subtest pf-unbind-with-vf-probed, FAIL

[1] https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/5937
[2] https://patchwork.freedesktop.org/series/166011/

