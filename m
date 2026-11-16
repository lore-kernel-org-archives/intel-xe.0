Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9569606A31C
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VXvZHerZ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=N+unt61W
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D73210F124;
	Mon, 16 Nov 2026 22:56:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF1610F124
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794869794; x=1826405794;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=CPa1x/RNT93vHjs6gYxzaU7h1sYDIM3eqcdZovfoaRs=;
 b=VXvZHerZ7ylu121mzTeYxWnZ+vtu7+45jas0gfoWNG7Ys+OjIKSZ1APN
 bOqVpSC0Ehi/q4MXMyWHClfIzBX7YekaCRwkQndwbtoGT8OGvIOKmbAgh
 UReqzUO+SgqjTiBjGRwNvU+fsnD9Pt4g1T0I4dRZYudmyVESsgMIi12o/
 GzijmD/LfopwpE1JSXjjlsEdTW0xHT82Col0blwURkdim8Re5ERmuaOed
 OB6KLTPQAP0VE0Gl8GM1MM5c2fzATsab0bf7BFP5obva/gdsUrS3xB5jf
 13mYloHqi8or5hOD2G7v2N8hToTCWfsKNvhcAJKXr6sf2CBVi1H+XMEeh g==;
X-CSE-ConnectionGUID: 2+dIQx7SRFOIZGoDA0q8Bg==
X-CSE-MsgGUID: 5v4q8VZETJqnsQjBSho2rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3612799"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3612799"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:56:33 -0800
X-CSE-ConnectionGUID: kFK81/SATyOzo/el7x38iw==
X-CSE-MsgGUID: a/KJrMKaS5GIQyij+/PaMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; d="scan'208";a="11589551"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 14:56:32 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:56:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 14:56:31 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.27) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 14:56:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=moKM1JtsW12fJyI3MIgQ3aMg0hSlr4G7BxG70Tbv9NtRenu+O+7ayHQsQEKwlEYs7LO0lUDFAKARitXM5E3ep530TofkwnNuEiH4S009letSd8m1FpPZj7JjyXBpOAa12AEYn9Q3koSr0A0A2r7DYyRYKiy0i/DSG0Wjh9kb4M9X+/ZYzOy3a6TC8WXZBCU7RurILjTJTvCggvy75dvbysAb1PJsJ3eGnxqZ4Asm9yyNsCxD7mk6zTyMwLgzV2TolY80F9FYh/qkxszUYkKqdS4OsG7Vw76k1GRg9UbROn7fVgKPug6/8WY8amL8tFamnVZ1rWM56y2zOtD5qi6EMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cldOXWh7CHy3BRaWq9Ib0523+GwB2Uj+RTpwv8GCp7M=;
 b=gdU11ffEyEA8qcSj8HXaH4VvTCkkpZymaRfnBYcHMSANfdMOcLEN48p+cQ8UXN6xVIpZnAv8vQ3vWF1KH5DJ0FLZz7J6een18in6LeARyEsbfyqjf+KUkmiv5lICUFWNrwes3KAt21s0Yb0rTBi4XghInRp6oDGOPvcFHt+CnYNi7lLzPFnwUDPdW+fSEOf98AllWgJuAaUPM0LOlI9O5pDmPpn5rw0mDiJoSdlIAEkQfqXR2T+d39FEF4kYy6JnyN1zVwVoDWWcEdEMw/1CIzAwvPTJaRLfd/KfOIX19L+9slUsCbP7j0HCPAvxcXVm6q/ftlA4hbfJASHLfa+1gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cldOXWh7CHy3BRaWq9Ib0523+GwB2Uj+RTpwv8GCp7M=;
 b=N+unt61WhSh4c5foFK/GRLOdEF8D/a3Y1ZpR7lM4ROn+H9PR6nrP7DcnED0/BsWvDv26FlHtyGW9uh62syw7Sp1DevLvfL7inFWU6qNCGAC120dMyiTkCQbDUbROWLIJmE2cR1ebhvYeJtkzbzenMQmHXipTbNW+bXls+KnI0xQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8) by PH8PR11MB6973.namprd11.prod.outlook.com
 (2603:10b6:510:226::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 22:54:28 +0000
Received: from IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2]) by IA3PR11MB013943.namprd11.prod.outlook.com
 ([fe80::1766:4eec:eeb0:13c2%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 22:54:28 +0000
Message-ID: <128971ca-ffee-458b-bf9e-2ca0dfe551c7@intel.com>
Date: Mon, 16 Nov 2026 14:54:26 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/xe/forcewake: flush delayed release at power
 and teardown boundaries
To: <sashiko-reviews@lists.linux.dev>, <intel-xe@lists.freedesktop.org>
References: <20261017031856.2723986-1-zongyao.bai@intel.com>
 <20261110220542.432595-1-zongyao.bai@intel.com>
 <20261110220542.432595-3-zongyao.bai@intel.com>
 <sashiko-outbox-207828@kernel.org>
Content-Language: en-US
From: "Bai, Zongyao" <zongyao.bai@intel.com>
In-Reply-To: <sashiko-outbox-207828@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To IA3PR11MB013943.namprd11.prod.outlook.com
 (2603:10b6:208:548::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB013943:EE_|PH8PR11MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b54c7a1-f283-462f-2b01-08df443491dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|22082099003|261009223027099003|11063799006|4143699003|56012099006|261028144727099003|261021123027099003|261026121527099003|261022105027099003|261022075727099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info: B6OCUO6EKPXNlo97WLMswUFS+FeodPO70ZXBexLEquc+o60E5RsHgy1XesrS7BoSUbLDznJBkgTUYx/wxuzgZYfY9FwA3S+JaHxGMlwY5aXOK19TZ1O2OLVyhdcDxEAbCeqMVJhnWW5Q8R8aa1PD1s/e55lBU69WPGC0g6SiCYbHffHZfQKURiSzYXL2a3XjLGXQCpG3ztX82Dxyr6V8DnZ1UGTswyc2LV3Jyu52Ez1JIOBQT/suNkfd6cWA7mm6kVMz/V0ynDEa8S9XOzjGtHe6yZZcX05xoE+Oxcb7USGr0JGMm4TrKKGwgnGTBBAZbz+GSMPdD+MJGKpzUpaRMPRV8BHF1H9lccm4xJqpke1CE1HbbY0vvho/NSvQQm/XouxnzrYpnjqoryMILqLL+MlLbmQi+sz55LfKG4R/DNEmU8SQ9L1WICgOfjS9h023vTwp/L1sX1cGyyBWk/xO1WfomeE3MUpH7aaZ3ngqL/cN8SRehEGS+K+aGIsec8JH883y1Zw6zYvVJby8hnppw9i7U7YzDkjj4BrGU0ESxZyOUvzk6+M8PZhlEo3QTOm7KXTJALinVZ1XCLbphJmZ7IPmlA3WZif0JKhUcLWfY3O7sgIDfAzzMUZSvw356IAWGjyPR0/lZYIy3ZCvSEffH5QriAqeTQyAPJlMjOAVuoU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB013943.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(22082099003)(261009223027099003)(11063799006)(4143699003)(56012099006)(261028144727099003)(261021123027099003)(261026121527099003)(261022105027099003)(261022075727099003)(261026140227099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3U5cVA1WVBKUDAyOS91alJYYmFxS0s5QS96cnRHL08ycmpaaXcvODIzdzlH?=
 =?utf-8?B?cU9uL3I0M2JrR0gwSUp3L3M5Q0hQM0hFN3pBZGEvSmFGZWRET1Q4T0xTMXNB?=
 =?utf-8?B?cU54U0Zib1RPNnczUWhOQTl0aS93UUtiRDJ6Y2YzSnU4NFg0V1RrRWFtSkg1?=
 =?utf-8?B?RExKeFRoUkJ6eWkwTU1UZnEyMHY2QzkybTBmSy9Ueko0Vk5vREVqKzdBNURW?=
 =?utf-8?B?K0VkTjdoUHZiZHd4Q25hZTRDdXQraGpCT0JkQlRqVm1hYkY5cVlSN3dYdjl2?=
 =?utf-8?B?NkgxNUtWQXFub1I0MjhxR0hyVTN5WVg5VkltVnJEbjJBdzNGazFCMDF0Rjl5?=
 =?utf-8?B?TUU2Nk11OUpUSktyMGhNQ0FqRXNuL2lhUmlzSmJmbmtCVFdSMUNTT0lkdWI5?=
 =?utf-8?B?WXJjS0pOc0VFbnlxSkd2dU1mb1lUNTNsaktMNWFtMkY4U0NGUGVBS09hSzlF?=
 =?utf-8?B?VjRSbzVEMVlaSHFuQ2RMbHFwZ0NzdUtqUlQ3ODhaVFQ4aS9WaW0vdWRQRTY0?=
 =?utf-8?B?ZVBOdlpDQmVrdUhVWTFHVEpvRUhocWVKQyt5WDg0STdJcVZHVWEwdkdZTnNO?=
 =?utf-8?B?bEs5ak9vaHZLTTNzVml5VkxTckUrbnhROERIaG9FYmlkRXBiNVRwenVNQmQv?=
 =?utf-8?B?bks3SlRsM05DK1dJeEh0MThnRlNKZ0llTC9pOWswbkFJOHpTTDFtd2hRMXBG?=
 =?utf-8?B?WGdKL29NNGEyVFlmYnlEWmphamNZazNJWmhLSnIyeW43VklXTDE0V2pSK0Jq?=
 =?utf-8?B?RVg5elZ5MTFzbExCR3pMRTVpanJyZTArbGJ5T0dJNjUzcWh2aitpUit0MnpY?=
 =?utf-8?B?R2taRHRvajVlLzAyYW85bGdLaDczVjFaR1dZcHFRa3RMQ1FlN0F1M1lVd0Z4?=
 =?utf-8?B?dWM5czFmTE1IU2lNQmdYRUNXbm8zMHZFa0ZCTmdIVlRzZUNSNkthc043Ym5t?=
 =?utf-8?B?SkRDYkpDZUNaWVNvakMrUEFLTTVEVE9rc1diQms5WDBoQmNRa1lhWVhUcG9U?=
 =?utf-8?B?cUdBNUlITjRoVmswOWRlQS9XdzUybC9RZ0IyVENaOXhlRFcwVU4wTEw4QWg2?=
 =?utf-8?B?M1lHOTJvN0hWR3JWV01WUFNhNmNMN2I4bE1VczFNdDgrbTFIbkFwdHh5Y2ds?=
 =?utf-8?B?d2VneThoRzhJT0ZtUFJPbmRNeHloNU5idTltUWxieFIwQ1ZrVXNLazlDRks2?=
 =?utf-8?B?dTR6bm5QZnFoM0NLYzlBOUN3MWZnRGhaYmdLSkZuUW5xVEFJS05POEx1cW9R?=
 =?utf-8?B?ajcxbGU0QUtEL3NsU1F2YkJ2K00vajBpY2sxV0dDQmpDUHl0WVg0aWdYeTIw?=
 =?utf-8?B?MkxHNCt3VVMvZXdTdnk5eEdqSnE1dTZQQ3p0aVpTQmNsNU1RVzZ5eDhKNkpq?=
 =?utf-8?B?citHWDF4dGtMeFVyRk8zM3JwbWVWNCtuTDJUTGRhMDB2ZzhaY2xNL0pLSjYx?=
 =?utf-8?B?amVTTGkvSWdNa25GOGMrQndsUFlrYXRYOWJiUmlrMUNKWGtSYVR0SUxMdEda?=
 =?utf-8?B?VEN5bys1N2diVUt5ZGdWUDFYczVGTytoL0xKc0ZCejFteDNKTEZsVVRXcU5p?=
 =?utf-8?B?bUhxbzFYZ1VyMDU1dDB0L0ovSUU2THErajYyc2piTGdrUkdiRzdLUkpGTmY0?=
 =?utf-8?B?d3QwOUo4LytnczBBWlYrSGhCSUV5eXFEbGpLRGkwRm9CWklzOStWUlBIbHhm?=
 =?utf-8?B?UkxWU2NtVVFjMjdZK1AwSlM0czlzRFAxLzVjRTc5WkRLcWlpRElPSVRvcGNs?=
 =?utf-8?B?U2lqeTMyR3dCMjRVTXRTNXY3QVNqcDg1THp6RU51RWpQVXFkdFN5L244cWxi?=
 =?utf-8?B?d3RJUjJuMnZJSDdBMTk4bkNBaHkrejcxUEM3UEVuMWM0K2w2WlQ5ZkJLY0Vs?=
 =?utf-8?B?WE4vdmplWVI0REJ5Uzd6YTMydm9BQ1VKSHRzM2tpMmkrSU12NHFSVnRqOUhN?=
 =?utf-8?B?K1pmMVJYNHQ3NmhnWFVvQldjY2pIRm1LSjB5akFpZ25zNlNmK3pmZGcyb01H?=
 =?utf-8?B?dnJtb09pY2tlN0pWSGlucmRLZHpaOXRCMEl4MEM4TEI2NHNnTlVjeWRyNWVM?=
 =?utf-8?B?aWpVaXNlWCtXTlZFdUNIVnZ5dFcyNHhxd2E1V2Fsd2htZzVaVzRXR1NYUWRm?=
 =?utf-8?B?cmlhQ3F6Wlo0L25QUGFHY0hsQ2FnVG9DbTNlOWVJL2I3bTZ4MEM0TUFscmVI?=
 =?utf-8?B?aTdGSXo2UnlMTTRKQ1JDYWFjR2wxbEtsK1RZUmdscVBMOHNHd3IwWmJvdmQz?=
 =?utf-8?B?MnV1OG5kQnRrWGVSWDNNRUJHUlFoZlkrV2poZUkxKzAzaTU5dEZpZmpuaEE4?=
 =?utf-8?B?RlFGbEw4WGpyV20zbTQ4WFNCSWJueUhOUytJd2o0dHdZYnVNUXVxZz09?=
X-Exchange-RoutingPolicyChecked: Y8/c3XMoD4Wz3QMlgED45CbCWniasLqBM93aU5/rRBgvyuJvP2d5nat2AjsCVekbvb6o+np9x7Whnv0hxI0fVwS4elQqK6EOrs3r0Q9JJgtbuy/pP0iX4/UGAndhca9csWHFxs3SVfglV726xw5JoeBJVpTUtjepslM1ChOtXgMgdw+fSmRjWKZbupQT6g95cP/CjSutkasw8SvB5HzDs5lKIIlqV+Sr2/1WzfWa41IVInx2bfwexo3E6lpkDEDippua3jcuf0Mje+f0Af79kFxvPsShsS2XR0YaUs8AgWZUzh/phudMqWYEBvF0sW49TSKJjZeAdv/zkXcXHz/Rhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b54c7a1-f283-462f-2b01-08df443491dd
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB013943.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 22:54:28.6697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SILQ/aHc3D137PaZlsTKvSpVTpVjHpUN7jXCbd+/rZMjscIjLFnHHF5zxjs9XjoYyIUUjTlolGq1h0e+ozvuDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6973
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/10/2026 2:26 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/xe/forcewake: delayed domains stranded if runtime suspend
>    aborts
> --
>
> commit f7553aeb9060950e90243740fda0d4e4ec003892
> Author: Zongyao Bai <zongyao.bai@intel.com>
>
> drm/xe/forcewake: flush delayed release at power and teardown boundaries
>
> This commit adds xe_force_wake_flush() and xe_force_wake_stop() to cancel
> delayed forcewake releases and put delayed domains to sleep across suspend,
> shutdown, and device removal paths.
>
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 5ed96807fe342..a0a238f1a4515 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
> [ ... ]
>
>> @@ -1104,7 +1106,7 @@ int xe_gt_runtime_suspend(struct xe_gt *gt)
>>   {
>>   	xe_gt_dbg(gt, "runtime suspending\n");
>>   
>> -	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>> +	CLASS(xe_force_wake_flush, fw_ref)(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>   	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FORCEWAKE_ALL)) {
>>   		xe_gt_err(gt, "runtime suspend failed (%pe)\n", ERR_PTR(-ETIMEDOUT));
>>   		return -ETIMEDOUT;
> [Severity: Medium]
> Can an aborted runtime suspend leave fw->delayed_domains awake with no
> worker pending?
>
> Once rpm_suspend() sets the device status to RPM_SUSPENDING,
> xe_pm_runtime_get_if_active() returns false, so
> xe_force_wake_delayed_release_work() exits early without sleeping
> fw->delayed_domains or requeuing itself, relying on the suspend flush here
> and in xe_gt_suspend().
>
> However, xe_pm_runtime_suspend() can fail before reaching this flush on all
> GTs:
>
> drivers/gpu/drm/xe/xe_pm.c:xe_pm_runtime_suspend() {
> 	...
> 	if (xe->d3cold.allowed) {
> 		err = xe_bo_evict_all(xe);
> 		if (err)
> 			goto out_resume;
> 	}
>
> 	for_each_gt(gt, xe, id) {
> 		err = xe->d3cold.allowed ? xe_gt_suspend(gt) : xe_gt_runtime_suspend(gt);
> 		if (err)
> 			goto out_resume;
> 	}
> 	...
> }
>
> If xe_bo_evict_all() fails, or an earlier GT fails in the loop, rpm_suspend()
> restores the device status to RPM_ACTIVE without flushing the remaining GTs.
> Any domain in fw->delayed_domains whose worker ran during the RPM_SUSPENDING
> window then stays awake with ref == 0 and delayed_release_work inactive,
> violating the DELAYED HOLD invariant documented in struct xe_force_wake and
> preventing GT C6 power saving until a later forcewake access or suspend.

This issue is caused by [patch 1/3], will fixed in that commit, and 
leave this patch the same.


>
