Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9602606A327
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WPSsRyR0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CD8410EE86;
	Mon, 26 Oct 2026 11:55:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2BE10EE86
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 11:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015718; x=1824551718;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TcctpEYXqimzVSkNw5zKdArYU+8xZVW9ZSKk9NKy4YM=;
 b=WPSsRyR0QH0zJ1OJysGXdFUKwuamEWCKHzIcfgaoVtPOHAOjwcBCGAwQ
 992mFjgfuuFFMw0O4/u7xU3iJPKOrPZJ+Q4sDyG8vfLaf2tJbexdw+bzt
 85/Kbbl28Aduvj1zokFAPnAwwPtxKsvOYCtRCqiqYPEwJ38MJQmaEqHIL
 793qSFBhOAUN0/srFhWUPC1rHBYwT8RG/2rJQd0W5mqDqTXU1VzCVlZNB
 H4M7mfLFmGjojU4nmRNn0h9ApgKFpChbrmEsY9M5rZOcPiMvnsxRASEyX
 pdZZCKpVRzsC20dJJp+jN6JHz8sU+/FAjnxZZQNbC0TRcGVX5K1IkW7oU w==;
X-CSE-ConnectionGUID: CLReKL/eSaG1yEOjWw94/w==
X-CSE-MsgGUID: AMep4HddRnGAeX1HRCNBuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1581112"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1581112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:55:18 -0700
X-CSE-ConnectionGUID: Get7VvkiRUeAwsVcJx0H1Q==
X-CSE-MsgGUID: yOxP/ipWRu2dexgheo9kaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4598518"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:55:07 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:55:07 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 04:55:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:55:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mismkiucgnQr49NDTBZFe852i8ol3QBJWPwAkOxOoyCKvOo/ffuIPSee61uogN3un4pA4kgw7UuGHWC2+ZxDfqAEovDoMTwE26BRUHHU+N52CBe28AzfGbmFUmUCdSAUuukMDkIzo8W0T/GLYReWu+yRelZO42WEzynBIyfvgvVjh3zpzY9e/I6MviDdkXVpH+MShk5u2woy05tXLx4H2KFYhCPlo/xbunAbmy2IWYuNeyjaOToEy2nvIVMzcCjSM7jXAyYAasl1C2zPvNYY3Hz2m8+SrGILOX7epi3YL49+9ej59yVtlOonh8kTnRS5FNp3W4t0akKzU9GH6mHdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RrBv0ScRZbwCmzpEs+x9hTWORaDsQhK4SR9bQiZ+UAw=;
 b=Jrx5igNd4TuU9Rzvki/dxP1U5MOsRwjXMBmOCyYfykbXjciXaiwyZJJLeGRbOFrqGOGPDfvblac9jz0xDf7n4yLwinQsm/soUXlrQw1cTEmSxz6R+01YHWOvhK++eG1IcZcez9DOJR0Kd5PJAp8mlYv3XPPvPvBmgOzhToM8k6f1YMGMfLDtBcNhgSGqJ8ouiROAjQQmGnNY9HCOaeqCc7QmyoDUWkUW5EraiFugYj+AiSRn21jlKdVXz2bw8xhy9Eg0+kcOENv5GQOq/y7oD1Egx30zcwmpBiwrJN4rMIdUwyK5M2CBI8djgsz9LNc2cd7IXzya+10sWPf4rxxHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPF8B755DBFD.namprd11.prod.outlook.com (2603:10b6:518:1::d36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Mon, 26 Oct
 2026 11:55:05 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:55:04 +0000
Message-ID: <507815d9-811f-47ce-a449-e7cf9aeb05cf@intel.com>
Date: Mon, 26 Oct 2026 17:24:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/hwmon: Store mailbox temperature data as bytes
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20261023103631.432279-2-mallesh.koujalagi@intel.com>
 <5f4ec40b-ae68-4a04-8f57-573e02a29d3c@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <5f4ec40b-ae68-4a04-8f57-573e02a29d3c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPF8B755DBFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f4efa6-eba8-4aaa-8938-08df3357f8af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|261021123027099003|4143699003|261009223027099003|261022105027099003|56012099006|11063799006|10067099003|18002099003|22082099003|261021121427099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: wpdgSnEoLOjpl/upMpzQ5XfbNSDX3XBq3KXKTGNhfH0aWnAOPNoi+lEvYpFuG1RzoMX6TivLCl9l79gE3QIxpNCm5FhlZ7ryNsXXarKAogLmDMufW+kKkciPIa0wZinQzQDwR1S3Q/i8v015e5HNoAnGd2177K9o6fLh4y8gq5QFJAGDIjk/7aoNZln2KWZGJFmAHrfhFtlW2dOcgFrzBQAUTwcJCO+W8rEoaK6LaKawulw93V5G460LE0u2fTSdmWio5eXmcRaTjPLQTG+nqf5qiZT3N4+1ZXc7Hd1V6dQtcVKUdjfSHLHIByxxl0Cx8Qq1WNcnAh2K9fYuCLKcXwnbgKF+yF40JRdCMmsy0vie2RqVFIGLDXltTDQEGZWgtWntK6fdODniotRQ/ublk447rLNuPTIXsLoCwlwnchgCxROZPVP3uBvBiyzsjqintaKk6xwspVmW89wIKpVjYJge+X50YQt5wLJ1fqETu834jf3VpWn63Ou8b7wWf2YgW4MKbbgUONUpjbCSC7P/3Nu5OUe4T9fvmwq82lu9w2PQsLm9tHSadI4fGZVQ7sxn9Zn9Na7IUbszRNu2JQXgEhg3Ty6OWYJ5Pj48FH8Jeie6px2OtlqnEDmdohaAViUEGdLuCviix2Fv0bEJTDQGhcBDL0bY4aSSum9F6YYtK60=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261021123027099003)(4143699003)(261009223027099003)(261022105027099003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(261021121427099003)(261022115727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUdmY3NrbCtyUXE5T1BoWlRYQ09IY1dwejNhdGhiRnFUZHRBWU1ibkdXSXBO?=
 =?utf-8?B?NnNubEVVbjQ5VElLS2dHNTZoZHJ4NlhxcHNsVnBQZUt6K3dWK2FTMmlkQnhC?=
 =?utf-8?B?S1RGVk04NWROL3gwUzkybDJNWVVwL1QzOVdZWEF4RmNKSHRkejNHMUI1dytO?=
 =?utf-8?B?K0FieTg1SjZHU2tBaGxNZFRIbGNQMTFSTUJyVjNCNmdKYXliaFBCSk1CdmVn?=
 =?utf-8?B?dG5NakNUeTdVQjRuSzZVMHZnbTVTQ1FoZTBOK3RhamUvajUvWVJoY2hsRVF1?=
 =?utf-8?B?bkxpRzJsOXVOSmdZdWtjblhWdWNaUXFxYVRONmlYanBmWVFCOXNkMU1VYmt2?=
 =?utf-8?B?SWxELzAreXRRdWc3TGpVMzdudGhVcm44dEl2M1kraVRwSThnMFlZQ2x3T2Mx?=
 =?utf-8?B?UnBNNUdsNU5QRVQ1OUh1VkoxaEorbXJDSExDR04zbklwdkhzYXlrKzFzWlJM?=
 =?utf-8?B?Wk9lbm1yTnNJSS9LbWtmUHp6dDhoUW9ET2plQW1MNUpvcUdIaVNlSXNYeHgz?=
 =?utf-8?B?RWszUkZUbUVxTGsxT2VLRjF6Y0FBSzYySXVnWmpHOWN1ZUxsc3F3WGVQanh1?=
 =?utf-8?B?WHJhMURKaGZlaDZrbXhGNEEyaDU4RStDUzk1RExmWk9pNzk3bnB3cldIQkhv?=
 =?utf-8?B?WDZuQjlYZ2xNdkNnRTlwT0ptWFFxc1BNd2NiSDNQNTR4Qm1wbFVRUUxvREUr?=
 =?utf-8?B?MitkakVsRFNvdXlLWmE2QUdMOWh4NWxtblBUSjNSUWhEYkdnelJlQ3R6ZHpZ?=
 =?utf-8?B?S1VobEllQkVvUll5UFdTRjMwVjRtQ2ZTOUZoV0N0WTRlbjhJempUbEkzWHA4?=
 =?utf-8?B?aUtNWmNsT0h2bTJtS09HNmovS2dSdEt0dmtkeXA0by9kOFh5YzlqcHByVUZv?=
 =?utf-8?B?V0QzNDl6Q3BWQjlISnQwVm5lelI5a1IzUCtSS0JHSjRXMDhtUVpUQm9PNUpS?=
 =?utf-8?B?ZlNoMG03eU9jQ0k0YmlaYTB4NGRaN250NDNRTEpxb3ZOci9TcmU5R2gray9R?=
 =?utf-8?B?K096QzFkb01XdTJKRkVGMS9jR3NTaHI2bExhcUdKMjZaeDU1ZHVRQlBZVUJp?=
 =?utf-8?B?Mld2T1BVa1lyMmNlTzMvVTZ4MmN0QTJ3anV0NVZkVUdwbllVY1RYVDlPK25o?=
 =?utf-8?B?ZXRneFR0SklYQVJ0cnhQRVRHTGlVMUt0REh4UlArZ2xJdzV3dUhZL1JOMkdT?=
 =?utf-8?B?UllhRHFpNytmYng2ZFZWZUpqWmxFMWpXeC9zVlJtQ3RlUlUzQ2MrdG91SFNT?=
 =?utf-8?B?Y3c3N3VOdjlGTitPL2dVdzhlOFAwOFpnTzBadnFhMzBsOHlZSGNocVdYNE94?=
 =?utf-8?B?cDlYNkhycENVWitTYXpUZWJGbGZEckgvVmp5NW5BK1pnSFlPR29PbGp0OWtH?=
 =?utf-8?B?b29PbUtqWndCOFZRT1huRDNjTmZRdGl3bHZDell4clNhLytwWU5MY0JtYXF1?=
 =?utf-8?B?eVJUNjQyS2dZMzFUSWlIK1pHM3Bsbk1Za0dwbmFqdHVQalFaYTVueXI2RVlw?=
 =?utf-8?B?Wi9zMkhqejFoM0xiMk1zRFhmWVkrWVBPa05uUzBZU3dMMnRaQTI0aHlGdHYv?=
 =?utf-8?B?bU0vUDgyWHV0bVhxekZUVUtkKy9IRGRvbHVVR2NTWlNjNGpVcjZiVzB1ZUNS?=
 =?utf-8?B?VWYzeFl5ZGhYajlPdUliMUZRcC9kam1BVE9zSTFnbC96dGloNDNpSmt4ZCtl?=
 =?utf-8?B?RHN4WnlCYkU1TmVkUXUzZ3M0QWRoK1Qwa2ErOTlrbVM5ZlhxT2tMN0ZURFdi?=
 =?utf-8?B?SmpqQjRoWnBRSFQwVTExNU81clU4bUpGYldvYXpTdW1rYVBIcG5lQzBMVzM2?=
 =?utf-8?B?ZG81dCtOTElwVmNtQUdESUd6RU9mOXUzVEpjZmFQRFFraDJ1eFlSbVZFZE5a?=
 =?utf-8?B?aUxWdTVXNEdXWGlndDFpWFpmVGtJN05Uc2ZkaTFMZkhtQnU4TXRYNjRrbnZn?=
 =?utf-8?B?QkxqM25iN2x2SUhJcUdXSDBSWDJkTEY5NmRUbCtRRHREMDNVeU84bTEwOEZu?=
 =?utf-8?B?dG5aSC9XdWtmZ3cxZWlkeXhnYjJnV2dnU2YyaERSU1NQKzZaMjFzRDF2dkEy?=
 =?utf-8?B?ZmJRUUZ2a2J5ZTF0ZFpBMm5TQW5lM3A0OHBqdWQ5UXc0ZTdCcTZBcHdrc2Nw?=
 =?utf-8?B?OXkxUFQwQnpyY3ZUZ2hMSVdrN3VGNC9xNHRQM3lmYlJLOUk0a0dVZkI2L1dn?=
 =?utf-8?B?ZmpQV0FzVmxuUlA2ZE9pTEEvSi8vRzRCVUdycUlaTzNVMG5LL2ZSSUV6dmgr?=
 =?utf-8?B?NDlyK2FCQ09LRkRObGNDNGRnNmk0OUNtb05PVW96amhQaUY2U3NzZDVZTGNv?=
 =?utf-8?B?OGoxZ1JVYjhFN2dSWDkyWjFGems1L2pacmZzN3A4RFZQUUhuekpHREdTRHN1?=
 =?utf-8?Q?7TwJfRnZUm8AMJmU=3D?=
X-Exchange-RoutingPolicyChecked: dMr6LPrRkxMJ/0ZXQdO0O8jpogI+18awDgExS6O0QhDc9QWfceG3u08SMVozF24bTM4JCeir+7DL5GEFk715uuRqaoOrQuel+J0S4qB2KEvaCAXT24xBwjp3/CIe3cUFOaHznwnVpZMlK/NcBYc8GMyN9siCZ16Tierp5e7qcDB3Em+QubwopTSfDe4aQCGKqm+hNyvTygBUFtFe6RJPNn1/kAuZXdUI7ZCUIMclXIvLv4PQPyh194bOvunzTT/dlB/dVuO/ZspEdWA/dtXU0pPMzhxq3nSFsUwhMmXzlY7tWJCmEs5OXIPgP8Hejp7VnSTDzoOP2jpmfEyRbBwpOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f4efa6-eba8-4aaa-8938-08df3357f8af
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:55:04.0891 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5uf91we4FmFfXHJhahZSlYJLHzIn9WBES8AzspNcT4FQ5cqAojgAi8z4u/7/a7IYESzwMf04QZxS+7A99ijhkJzXN8qoAsuxqrHt+rC3dN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8B755DBFD
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
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 26-10-2026 04:47 pm, Poosa, Karthik wrote:
>
> On 23-10-2026 16:06, Mallesh Koujalagi wrote:
>> Store pcode mailbox temperature data directly in the byte array
>> using put_unaligned_le32() instead of accessing it through
>> different views of the same storage.
>>
>> This keeps the layout unchanged and makes the data access
>> consistent and endian-safe.
>
> 1. Is this patch addressing any issue reported by a static analysis tool?
>
Yes, it's reported by static analysis tool.
> 2. Given that |cpu_to_le3()| already handles endianness, do we still 
> need this change?

Yes, cpu_to_le32() already handles endianness correctly. The main reason 
for this change is not

to fix an endianness issue, however to address the static analysis 
warning about inconsistent union access.

The code writes data through temp.dword[] and later reads it through 
temp.value[], which was flagged as

inconsistent access.

To avoid that used put_unaligned_le32 writes directly into the byte 
array that is later

read, making the access pattern consistent.


Thanks,

-/Mallesh

>
>>
>> Fixes: ca6e33701de8 ("drm/xe/hwmon: Fix thermal sensor data handling")
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_hwmon.c | 15 ++++++++-------
>>   1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index 42acfeb8818c..7bb1223dc30b 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/hwmon.h>
>>   #include <linux/jiffies.h>
>>   #include <linux/types.h>
>> +#include <linux/unaligned.h>
>>   #include <linux/units.h>
>>     #include <drm/drm_managed.h>
>> @@ -165,12 +166,12 @@ struct xe_hwmon_thermal_info {
>>       bool available[CHANNEL_MAX];
>>       /** @msu_mask: VRAM subsystem enable mask read from MMIO */
>>       u32 msu_mask;
>> -    union {
>> -        /** @value: per-sensor raw mailbox temperature; bit7=sign, 
>> bits6:0=magnitude */
>> -        u8 value[U8_MAX + 1];
>> -        /** @dword: sensor values as little-endian dwords, 
>> u32-aligned for pcode reads */
>> -        __le32 dword[DIV_ROUND_UP(U8_MAX + 1, sizeof(u32))];
>> -    };
>> +    /**
>> +     * @value: per-sensor raw mailbox temperature; bit7=sign, 
>> bits6:0=magnitude.
>> +     * Written one dword at a time via put_unaligned_le32() to
> Written -> Write
>> +     * avoid inconsistent union access between dword and byte views.
>> +     */
>> +    u8 value[U8_MAX + 1];
>>       /** @vram_label: vram label names, dynamically allocated based 
>> on vram_count */
>>       char (*vram_label)[MAX_LABEL_SIZE];
>>   };
>> @@ -995,7 +996,7 @@ static int get_mc_temp(struct xe_hwmon *hwmon, 
>> long *val)
>>           if (ret)
>>               return ret;
>>           drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 
>> 0x%x\n", i, data);
>> -        hwmon->temp.dword[i] = cpu_to_le32(data);
>> +        put_unaligned_le32(data, &hwmon->temp.value[i * sizeof(u32)]);
>>       }
>>         for (i = start; i < end; i++) {
