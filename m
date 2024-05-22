Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB88FC25B7E
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 16:10:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0C510E411;
	Wed, 22 May 2024 16:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e/8/yKTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1FF10E411
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716394247; x=1747930247;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=X67P3CZFE3BNsHzf7T07+u+yWsQYW+neY5Ilpl4ETKs=;
 b=e/8/yKTWXerAu2eOFZCva2ffeGlNMBAlSlcCBO48kdXrfrP2fmSDZaKF
 sxa2G0O8K61TMWlROr9Zaa73b1vStQNMk902SMQV6eNP8JXv5vokADo/L
 IXX3yW2ANpuZzPS74HCZNrtIeRZ/x1JhGZNLDlKdGg9vrsA0Pb2a0MBVX
 OTWuQp3xOFPwW3Svmk3PFBX27uC8IbYcbRlfsVsQ6stRaHieye+rEDmwk
 fq2wIfyBnqVzlTFBx8XleXBNOjx8tx9ZjXuRM4JYwivNt8m8U3DSnmn/h
 QSbbWQvyBT+ScmEUfRXkVK9LP8+AT64izv+Btu/e5kqdUCNs73ntkhaRm w==;
X-CSE-ConnectionGUID: Pcm+XpUURvunBvFAVP/Bgg==
X-CSE-MsgGUID: 31Z1DfuhRxWJb5abxZNxNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12598593"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="12598593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 09:10:46 -0700
X-CSE-ConnectionGUID: xDNl5aVgQ7u4AY5votzw1g==
X-CSE-MsgGUID: QU2/F+3/QtOsR24RhexfPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="38313138"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 09:10:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:09:30 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 09:09:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 09:09:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 09:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrzT+B+YB6jIN51+32e8R2nlcObb9PHlN/q0+wpYlVv8jMmpv3cGp49ApdmCKe7DCk3BsTXomL7EoVi5Y8Hxe1IuxR4qJZS+S+e6+zIwt9BoYn2WYJV0K/FY+4L2EKI5YslxmKemSEZnwEfBrsIuznP1a3OgFDOIbe2TSnMyNB1G+aEEr76h7IsthF7iA8xIDODniU/i5Eq4dbdHReBu2xkwahlPIL4IYzcE5HEANFqbwQQ8+9fj0lRmVNkSALxedBX6P1J0pbYTM4JH7FdMSEYBi5HhzCcNfn1XdVnr6r8XaZtdjVqEOXTOoGrxX7WSZVAHNGKzFUYP58ZWUmwYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HtBJ1ryVBft5WnLSGiezBG/fBS4OD5nV6xFp6TTViM=;
 b=SoL4+GIqjx/6+GZbxAOwGz0AvweD14sLq9pt4tR/W3aofy5Way508L90oQE94n49qiwVBTdGnLE6OKPvhA7708Ial23o5DFG3Z/VPAr419Ozs6cgKV92ftMaH1EErZsq/ezD8W6N6IuN4PokdaX6ddF8OKhvf3bZfH73aWf+lvNUt8xjMt5xAKuzexRHAkHZLG0yJnQ9rAv9p6oP9M9h7bGdLGdnDaduNdRg3vxqd/eIgOCYUglrH0+CbqaKf9t+cwxpQNzbpqWy8muMTlGUl6kXiUp2QSaxb6L8R7Hp21Fii3tcB2h9kLXBEpDWOIc1agB0mOZZaPogsAE6ABSCHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by IA1PR11MB7754.namprd11.prod.outlook.com (2603:10b6:208:421::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 16:08:56 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7587.030; Wed, 22 May 2024
 16:08:52 +0000
Message-ID: <14aaf9ec-0299-40c4-a627-3749c2cb107c@intel.com>
Date: Wed, 22 May 2024 09:08:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/uc: Don't emit false error if running in execlist
 mode
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240521114857.712-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20240521114857.712-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0067.namprd17.prod.outlook.com
 (2603:10b6:a03:167::44) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|IA1PR11MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 79db09ea-fda0-4c2f-435f-08dc7a797918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWE4R216MGdybGhvWkhMMGFCQ2FSMmNnUWw0NFovWkM2djlLS2ZaUUhDU1Jj?=
 =?utf-8?B?WjB2SnhlT1lBY2pkVDRnbG9lc1FKdm1EaEorZ0NjUjN0SEFxUTY0NktRVzNV?=
 =?utf-8?B?cWFFMnMxOEJ2MlFPTVg1OXYyaXBIL3hJRDgxNStGZkdCZG5GUW52dDN5RHZp?=
 =?utf-8?B?bnpuVllueFBpdXNTZWM3OE44T2F0Z2gyTWx6UTducVcwa0U3RGdhNkwzZEx5?=
 =?utf-8?B?WGNZVXpRRnhJcVQwWWNMcStoelBFWm9wSkNyN1d3Y09NZjRlTk5ha0xEL0xH?=
 =?utf-8?B?MmRGTlBUQStWMUZCUkVpSFFwZHhpbkRBTUE0WjRwNVBLVitwdzJHR01ZQ0s0?=
 =?utf-8?B?VlplMFk3ejl3ZFI1MjBJTm5WcTlvRmVtSDFGMW9xclpUa2VaVkViZjRxVGsr?=
 =?utf-8?B?Z1RmNTJjRjVrdmhIcFVJMGE3djF2bUs4TDNLTzFZSCs0RndBbzdsbGpUZG1K?=
 =?utf-8?B?VHVDdVdqMjlBczV6bnkxeHJtL0dIOEtZeUhJTktuaXpKUmlselFJNGdvTlh1?=
 =?utf-8?B?SjVCUWhoZXdCdStVeG5meDd3b2JRMUFQQUJiV01pN0lyYy9OYWtrTkRkQnFE?=
 =?utf-8?B?aWV2azJkTDlHUVRJeHVqSVFFdUJCSnZvd0JpbGREYjh1MktCcHVEWHdlSkFh?=
 =?utf-8?B?VktHb2t3dlN3RVI2UXdhUmRFMDFQSmJXdU0veE1HWk51c0pybFJ4eW1lK1JH?=
 =?utf-8?B?THhhZ0FhK0tTWjBDNU9PYXg0M21XUUhCa1EwT3hDcjlTYzdMQXF5MHUyY1F5?=
 =?utf-8?B?dWpiV08xQ1lrUVFMQ2ViK0ZFbzBlWmk2T294YTBTWk5TTFFUOVJnemxiWlNR?=
 =?utf-8?B?WG5QVkFDUTRoaTloRjExNTRYQ0xpbXlId09aOEx4Vy91ZHN5Qkh4aEJtZE9l?=
 =?utf-8?B?L09ETk03cGhCZVZLM0RuZVhCZ0JmL1dGRCtZcEdONDdIV2JIQ21QSFF0MENN?=
 =?utf-8?B?SHVZMllQdW54and1SG5Hdm85MHowanRVaTJhL1pSemZ2dktyUjhBLzIwQXpS?=
 =?utf-8?B?WUVLNmpjbWhwL1VITW5manltQzRpUjRKNEFKK2NKNVRGOTlFYkRzZWdKRWFt?=
 =?utf-8?B?SzNrL3N3Ti8zZ1hHVjVlaG50SndGVlY1bitZS2hsTFN4cTV1R2tjVWl6U05l?=
 =?utf-8?B?RVRKUEQydE54QlVDWmkwRnpGV0FlazlQWUxvYzR2RThlNi9QUCtRSU9aNTZ4?=
 =?utf-8?B?bllwMXhaN1ZMNDJoVW1hQUZqRTJFdXdFTEIzQmNyeFQrQ0UwcTFuMVQ4VmUz?=
 =?utf-8?B?WWlXNTF5ZXBOQS9ZLzBzbjA1MHk2a01oSHRhWUNGRDgrek5iWFNEWU1sN2FQ?=
 =?utf-8?B?ck8xTGNRMUt5VjYvdjVQOU1rR1lEeHMrT004WmNXLzJjdE5yYmphV255aTl3?=
 =?utf-8?B?R0pRK091bDgyRGxLRWdoVVZ1SVJpS05DcXpwVTl5czN4OE9MNElCdTJqK0gx?=
 =?utf-8?B?NXpJMEo2TWpRV0lPQXYrc09NWUx6bDk1QU5HamhSS3lWWTJXemhNSHRrSVpK?=
 =?utf-8?B?Y1JnREFLQUhNV0s0eGRWbmpUWGdZSGpFaTJ2eEEwSkVuTWVLbFFsT3dLa2kx?=
 =?utf-8?B?UytRbUNrdk9uUFRDNmVpVmNZY2pFN3pBWkdBUXEybTFrV0pUYWtrRVdqWCtw?=
 =?utf-8?B?YkRwaXlGcDJWSUk4ZEtsM0tNZ2h2T2o5djF3Z2toNkJFMlVrdGF1MUtOclBs?=
 =?utf-8?B?aUlWdUNaUnVtQVVCSDNIZzVxNStUalFLVzlGd01kYnAxSnBQc3U3Y2lnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlRqNVRNNWVxQjlTOEJ2elo5VFFGTllKdGZOZEpTenJBTjV5MmRFMkFoOWM1?=
 =?utf-8?B?ZUsvNkN4MFh5R2FEVU1HeHBRZndJcXEzMEZNQXhvNWgyWE5mTlBnS1ZvQzla?=
 =?utf-8?B?Q0Y4cEM2WktENGZ0aW41bUFiRzMxWTNZWTVkT3lxV0FuZ3doWE5wbTNRT3ow?=
 =?utf-8?B?a0RtTWcrNm5VOHZhSzBhL2kzVDlqdWZscVpwVTcrbEFRUlFuWGJXUC9HbTQ3?=
 =?utf-8?B?bDNJajJCczJuTWFxTVRBNGlNdHJWTFBoMlcxaHN0czR6V0hvU01iUW90eEVx?=
 =?utf-8?B?N1VNRXEzYXFDNmZOV01oMC84Sis0RCs2QzM4SDYxWGF1dWxIcENscHB4Z1Nv?=
 =?utf-8?B?cmRYOFlBS2Rkb3ZsS3NPeVZCSWxvL1lMaHJlSUxxMDhIaGh2cDhkM2NZUEpX?=
 =?utf-8?B?eTNuSFRUaW9TaHk4WFp5U3lVK0FBUEh3OHJ4REZaanlvckpTNXpaVC83Ylkv?=
 =?utf-8?B?a0ZoQ29hbGpRQUFzUWp6d3BuSE9tYVFWR3JVYXdubjBFa1pGSFJrdUNFeHgr?=
 =?utf-8?B?VmgrR3ErNnk4aXNpM2J3cE9QRTViNFpzNGh4allzcFgwYkVNTXVhQ1lRWlFY?=
 =?utf-8?B?QzlzdjlRQzFtZGJxWTFsRGxBSVZURlJCc0F1Rkg1Wk9pL2FpNVZsakEwV2Ew?=
 =?utf-8?B?Y21acmR5RXNvdXdQenRWdjRPblpudS9LSXBxTmJtUFRoR29RMnYxd3RMZitt?=
 =?utf-8?B?VFBnaUs5UU9uSU84MGpiY2ZteVBFUVBJZU0rVmNqNU8yNnJPeUV3L0V5N3Nz?=
 =?utf-8?B?NkxlcTNHb2JnZlFzNGxrdmlzY29TdVpuYzY4NDZYdnh4ak00ME95U3cvZzBN?=
 =?utf-8?B?QmtyN1B0TnJBZk1sVmswU0lDUGZEWEQwSi9XL0xFQ3FtUldTdE9uZTEwQU1O?=
 =?utf-8?B?V3pjaUc5bmgyMW16dTF1V1VtWEFMMTBYT3FQa2xkWG90RWxsVmJSbE5vakg0?=
 =?utf-8?B?b21GeXYwZjFkcE51T0IyVHRndVAxOXhWWWRaeGRIcVNYeHVpTFJTcHVJTnY1?=
 =?utf-8?B?cjhyTkFzWjdQMUhMYTljc3NvdTh5TjNmNFRVcXlsTUdrdG1WUkRRMmJZYVNJ?=
 =?utf-8?B?U1hWS1pFUTUxTUYydWttREQwNU5ITzBkam5WK29mZm5EN3REKzN0akR2OHU0?=
 =?utf-8?B?dFhiRnR6SXRwN1ZvYWNubUUxa1ZnS1dBaFovWUUzRG9sOWlLcXYva0ZDc1h4?=
 =?utf-8?B?RWJWUVo3RWJHbEVmNFZ4WFEzanV1aGFKQjlzRnByYzRYRGxVTmVKbVlBWEUw?=
 =?utf-8?B?TkgrN0pwVktJYzJ5N1BSdjg2YWRvcWZiN0VubWE5TjVqT3MvTVU4YlF6YmVY?=
 =?utf-8?B?RmNhT0FOK080ZGZycDlUSmthQ0VnQzRPYVo4bXpRT1BwVWVXb3B3QlBiWTJa?=
 =?utf-8?B?R2RXZlFPOElsUVZEaTB5R1JITmFWRHdjaytRWCt4bjRPeitFQ011cThybVN5?=
 =?utf-8?B?bm5BODFwRGhLVVJTTjMrUFVIMjZLekw0V0Z2VXdCQ2dUekxFSmdJaVlLSnJW?=
 =?utf-8?B?SHltaDhCUlZUQUI0WDJVQnBXaDFkZm9mMktBekhzSC9qSUN1RVBYNnBSdlFs?=
 =?utf-8?B?SFprai9tOHM0eXBHSnIvdkJJdU1IbG53NUZlQXpWSHdSSi9ZL2R2UGxOOTYy?=
 =?utf-8?B?TEhwa1VrZXh2bjlCSmFuYTFJUFlTMGl3ZTM2YllDdFdTZVROakZFZ3Y5Rktl?=
 =?utf-8?B?OC82Qjk5MWwzSTFiRlRkUVpPMDRYN2hlV2JWdVNyb3RuYUxMc1JZcDh3cFZP?=
 =?utf-8?B?SE4xS2VKOHgrUDRmdG9tMnlEN0VwUW9oRzRIaVhGQW9zUndneUZPeGc3M2p4?=
 =?utf-8?B?QlNPS2NySWxNQXpzNXNocHRUaXYyUklVN2R5VGMraDNoQUxadFVMVjZTNVdD?=
 =?utf-8?B?czhiaVFxWU9WSmUvMUZTMnJCeVIrd2V4cEdseU5sdnZiNDJDRVZnaUpjb1Js?=
 =?utf-8?B?dXJzdjcxMmpUd1lVME0rYlByZ2ZtWkV2NEF0eEZjZnYrWkovaFFrYUNFcmJa?=
 =?utf-8?B?T3NWSENaazFJTno3WGp3YS9JQjB6RXhBS0JlR2NUWHcyekhQNUtFckYzbUxn?=
 =?utf-8?B?NHQzRXpmaGMyR0dEWG5uUHZ6UmhtakZnd05jdjlZMVVkQ3JvQjRJcGliY2tV?=
 =?utf-8?B?WDZBUENYeFNCNmo4dCtkRlVaVVFyS0gzVXoxSk9LZHVlZmFub3BoR1NPWTg2?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 79db09ea-fda0-4c2f-435f-08dc7a797918
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 16:08:52.2465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMQznj4xpawPDJHwx3ZXlaZKz5SR1jILrUc+rRrlIZb8mILfPW8yqqFtNDieK44xSbYS+dA/iP6FlcKvufEX/Bkekau9u+Z8IP4tZz6h8AA=
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



On 5/21/2024 4:48 AM, Michal Wajdeczko wrote:
> When running in execlist mode (using force_execlist=1 modparam)
> we incorrectly select the error path in xe_uc_init(), leading to
> an unwanted error message like this:
>
> [ ] xe 0000:00:00.0: [drm] *ERROR* GT0: Failed to initialize uC (0000000000000000)
>
> Fix that by doing early return like we do in other similar cases.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   drivers/gpu/drm/xe/xe_uc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 0186eafc947d..85808706d1c8 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -51,7 +51,7 @@ int xe_uc_init(struct xe_uc *uc)
>   		goto err;
>   
>   	if (!xe_device_uc_enabled(uc_to_xe(uc)))
> -		goto err;
> +		return 0;
>   
>   	ret = xe_wopcm_init(&uc->wopcm);
>   	if (ret)

