Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C71CD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 09:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE97A10E5BC;
	Thu,  4 Jun 2026 09:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NqdNZqJV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDA810E5BC
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 09:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780566501; x=1812102501;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DD2zGkJYfgazE5CRCD1s5tMhwYOHGC/61qG1oOs/MVg=;
 b=NqdNZqJV8zchEW0LeLBk/2OUouWOJa5ZU0un6meK8N3nlMmvkXjoTPV4
 RlFHTXgMFAf7cQ+NLCXuC1B+eD+p4QU8e5bG5eTRbEYClC0JBHI8rPLR6
 UzI6js49tzhbID0HptTmTaCkkxXW9xA0gQVM0/0Uj+IQhRVr9LT0MhAx5
 /VUjutGDoGtpG4ieVRe2BOrSwzNsGWr42iQZzB+qHmdA8QOrjXquDDcei
 KbLcTsVpM9PQZQLgNFIPQ367gdX7iHgmxh3tMDMmMEtnAkq1Di+ST20sW
 pUZi6Rk72OLWSEf9y3a/3+ndvkTFniAmLT/NLjQHZTuhep4IIbopUTmJF g==;
X-CSE-ConnectionGUID: 39VZMj0iSAOuxqMtv25rAQ==
X-CSE-MsgGUID: 4Cl+LRobRUSjQhso4mKoPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="91707829"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="91707829"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:48:21 -0700
X-CSE-ConnectionGUID: PHwQVLe+SuuzAf6DvNGtDw==
X-CSE-MsgGUID: oPNN/F5MQKm8GhcgUncgXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="248851663"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 02:48:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:48:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 02:48:20 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.42) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 02:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnDE5YPih4lqoFDjuOUtjT0/1ZcR6Qc6fXjT1z6ke3PvZ++hO6lXwaWz3Vu3CRaoz5yYqq7YP1RvtNurT/Zpo0QQMJ92hyvNBzaXXJlaFK1k/zRqSdxDV0bATkt4RbXg9NMqsYU+Z+M3gO8+3QoNdAD2y6uDh+aVwtuvA1VoqJYQ54+jwvuy6kCGrsCl1FnsBlOaNofxiJfgpDgEYETk9uYCfTROYYkanvUAQHu79n2W6L32AVzYxf/0mwnvGWDiavev+mo1BkQRYMrXFjZv5UcRr2udkgnYS6reY3EQ2Yg72AC9wnKU8YgoYhWsaw3vpnf00bti7iZd82HgO5xpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z8mjyh2vuSqeInWvY4WXf2Tv9SfPeYSHqalrezXS84A=;
 b=ncFZ6QmUO0RXbNrCyhO4U/lmc/5bCwkNxZhh/Nrx1VUITP/MVT02h8ouv9tGAyu3oQJItwbZGfwAi1n3PwM4zlKLbDK0SGPIkX3Zrg+WTKLpOtT0KjaAqhrVzfQVdGa1K9lGQMIE92F9gk6gto1sPA59tyNCBbqjjyd/caisybiHye5h0pKCHcueBr+HPXDux2d7Cky3HdSbeqMPyA9/rwvY08lFmPrpn1aBkRhFterrOEozArxg4CKsoA2O6q3ExGP9re4QErmZ5yNmIXYvsCid/iHaBcB86Bua7BVqC7s4LiIO+oSdym0KbKr6uMVNbXuMrtQCXQGSNSunI3tI5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 09:48:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 09:48:15 +0000
Message-ID: <ad28f7e3-4b1a-4b9b-8862-3167ad9ce7c4@intel.com>
Date: Thu, 4 Jun 2026 15:18:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 14/15] drm/xe/xe_ras: Add support to
 offline/decline a page address
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>, "Koujalagi, 
 Mallesh" <mallesh.koujalagi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-31-riana.tauro@intel.com>
 <DS0PR11MB8718CB0B2C87E358A088D86881132@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <DS0PR11MB8718CB0B2C87E358A088D86881132@DS0PR11MB8718.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a0366a3-f3ad-4ec9-fcb5-08dec21e65ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099006|4143699003|11063799006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: Rtt9lblFoCorideBJ47+yz6o7OzS0E7PBhUBedAwpa/d0nO8V2MtJAtfWLvtGiL+WlRAojx5O3f31m2tKbol/kQdVIYA1mO9xBDQUROpxzwu2LU7pKc+DUIBmVwLdeMhWEM3EseLQVyiFXhnldho/NAnBXi1b3HSADvwCp7+oAaYsyWBHmmoA9Z5NC0c6xD0FQncz9aWL+ANStZGdtpl9qyxVtZQ88TzSOV3WTvymfk/A0vy6/i2x/Ll2CtmXSmF/yiEzkq5m/Em3bYRCPq0DHhy0DTfW73AFjBCb7wvY76cvj2sdasl0a0DgZqMAhhiQpXelA2wsNHh6cOrgOFMupEvJN/o7cVLYEalzaeKGek1TQBshYpMScoY8f/aKBtC+KrNPYVeXvy4BkyU8mjwkgQfT0Q6xjRADvcu/3NQ2oW04MHLsFrufGLh2zSrWUbXWVPIN03S65p8bbG4mhut0Oicwn73OwWuWUaFWaRu07+g+W2SvDMkUKhiHH+fd1ybYzX2K9svEmPR7KHRq3I3fmv46MsdBui2ceCYVi8RJGWnHrOEEicqODooYUSFJoyO4Dt5czTK1dcNnBapwt8XLDETSFfSYMWPVNE2NGcCl1r+ilFS8WAB0BuYhP8EEJnuGpzSinWZd4koEOx2L35Uuh4mKsQRKp/SMBDfGRiJ5GR90jR4lNDFRGYghlFf1CiJkl/tUp1CaCmNJJFPfKKcag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099006)(4143699003)(11063799006)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGpHejJwOTlmRWdVRzJreThnSVpNZjNhczBMS1NhZkVWL0lIT1kzVWU5dUQ2?=
 =?utf-8?B?QXhDMkcwVVB5MUxBbWFYQkJFelFOZENRZi9Kem5HZ25EbDVFYWJUSVRiSmdY?=
 =?utf-8?B?OXZBdGFuV29iMTVHTGh2RFZiVUg4Sk4wVG9oVmFPcTJuaGFicDdRSWs1TUNF?=
 =?utf-8?B?RDRxRlFkNlgwdHZIaUFuczlLaDJOTXRvVmJWc1JaWllaYko3QnNYK0pyelFL?=
 =?utf-8?B?eFNUbjZHSFFOS1dwaWttbGlkWnlhMVg0a2ZIVUV4WWZIMFFlZGtxQi9IVjJm?=
 =?utf-8?B?dW5QWmZYSWxvTUJodlFUNk9hOVNOdzdteFRyVk9LdTZxdEVzejB0MVJYOTJw?=
 =?utf-8?B?RTA2bXhoTlhMcWVHNjR5VVFhNmlZcC9xamtmZFJoRVlaSU5wakxzZGxIRUMr?=
 =?utf-8?B?Qy9lUVNURXlBbzVoS1R6SWhVVTFwU2c2bG5JZWgzbElrd0NmNEdIaHRmOXhQ?=
 =?utf-8?B?OHpzSGdEdHBoUlVIU0xwbld6TDl6ZkFwOWlpZXRaaTdOVmdHRzlFaU9VSGt2?=
 =?utf-8?B?Y0RtOGNPSTNVTmRqL0VRcHU2SVFNVHlQVW9SNVI3OFR0eXhZZUh4K2hzaWFx?=
 =?utf-8?B?Y0tzdU1nOUFtNFJveFlVajhSZHFkeUdLdXJsWFB4L3NpMGViQ2FGZVB6MFRq?=
 =?utf-8?B?V0k0bEl3VkdDcVpHbG1yTEE2WU9oNlo4UmtISDIzeGd6WkVYdmhHa1dRYzVK?=
 =?utf-8?B?bCtjVHdLWVVjWitMNjBpa2dvelFkak9pU0p1TlNKRGlsSnVUc29NMm5KMURx?=
 =?utf-8?B?bXlxbFR6aDhhN3c2aXRJQzV0bmpIc3NjcUVkdFhVK3ZZenc0cTRMcVFNR21E?=
 =?utf-8?B?bDRqb3FqakM5K09kL0EvNkVmVXpHS3QrZkwvQjhhSEZiZTdiaE9oMDBIcGht?=
 =?utf-8?B?NE54cjBJMDhtQlcxWlNBQ1dYZDhTc1JxNWtLSHNGT21qOGxybVNBZFM3NVVz?=
 =?utf-8?B?aUVFY0dFOWhFT2RSbjJxMlJOZ0RPaXRaL3N2aDNYSklVczlHenFhL2xEZzl3?=
 =?utf-8?B?YkdVSTArdFl6WGJEZm5CWVkwN1FYMnlCQ2ZBZk9xaUE5eEg3cytQRHd2R0d1?=
 =?utf-8?B?M3ltOGJHcVF4aldVakJXclk4cDE4WlpjSFhxelJVOU1TRHNYWWhic3FxMnFY?=
 =?utf-8?B?WkZuWkJ2Q093ejJYcmRQL0dLbEJlL1BXYmxHYm8zODBuS01Id091cEdaRVdp?=
 =?utf-8?B?d29iUGpKbzNBUm5uWjJFMlBpaFdtMFNEdEt2LzJ4dlg2NTc2aUkzdjNMcFk3?=
 =?utf-8?B?bUxKMDdEME5QN0xUaFoveHlENnNYMFFKNmFCVnd5SFhsbDRKVVdsR0ZoQnJG?=
 =?utf-8?B?UFRVWGtGZFZ1cjNrOEVMYTNyaVdnaWZoemlFenIwMU9uNkljNlA1QmR2QmRV?=
 =?utf-8?B?QTdubC9TZDBNS3hpd1lvczZYY0Z1YTdyYjBpWXY3dlVXRVNORHdiU3A4YURm?=
 =?utf-8?B?UEZuQk5SRXZ5Q1Zqa0hPaSt3eW9rc2szNVlJbFZTSjlXWTEwV0xiWVV5VC9u?=
 =?utf-8?B?YkhpTkc5S2FLS1VKb0dyd0E4dzk2RENPVWlieUxMN3l5TW5LdWgwU09UNWo3?=
 =?utf-8?B?NVdkSXh2cW1KMVFLalJ2TjVib1dCcDI0YWl2bE1sRTk5K0VubjhZSGFsOHc3?=
 =?utf-8?B?M0s5eVRyZjZnNmZaczBUWXZ5Nm5rTTBKOEJvRzlSSnFKZkdPdksvU1ZNdTZD?=
 =?utf-8?B?OTJkalZ2QlBXRWk0UFhUMnd3TXdYbDhpdTNkTHBVSVZ0OWNaVDhPSDM2NVNG?=
 =?utf-8?B?MEp1YVJiYnlEMHMvOGVac21hbWduNktTMDlsSWVTM01lSng2R2l3dk1HUHN2?=
 =?utf-8?B?czBtNmhrVm5HSTlwQXkvN0tEb2hiWkloMGtBQkZEc2N5WjU2SkkwbktyaTF0?=
 =?utf-8?B?YWVzbXJXUkE3ZlJlRkZaZEJXdzgwTnQvZkFxZFZkSFlUSFh3dWdNRExGVjdJ?=
 =?utf-8?B?czNsc2FOR3BMQzltbVpxaWh6a2xrOHlSK1E4NWR1K2ZHazFvdXNpVkxIOW5y?=
 =?utf-8?B?dWF4dGV0S2JwdVhRZnN2cklSRW9STTB2VmowNkNTc2NxdHllU1BVS2d2cHY2?=
 =?utf-8?B?Snd2M0FTNHRaZ3NqTmlPbEcwMERUSTc2czFzaG9uanNadDRJNlJwS1VRc3Nq?=
 =?utf-8?B?cGpPd2hubTJmVTd0dnh5MFhvMmpPZTZWbDRrY1A0WW5GOSszRURvQlc3TTl1?=
 =?utf-8?B?aHZuUFJIZHRJUjhXZXU4M3ZZUGZRaXlyZ1RsUnVzU2J4QmxBelJXa0YyZ2Mx?=
 =?utf-8?B?V0dIQ21ON3ZId1NiSklJK2VhanZaK0FKZTZzSXh6QUhLeW9MMkxJVHl1MHJG?=
 =?utf-8?B?cTE5aHVhcElsQmI2NGl5L1VjTnJCN0QvT2pEbnBSRzFOMTgwWHdPQT09?=
X-Exchange-RoutingPolicyChecked: et/jHMHP0Uwq/Tw4XI6k0asB3QZQv74iYotlbv16UTCL7DdQ7KdXEBhUNj8bImsebT7uc8QO+ENZ1027drW1gAyYlGdDAfsX/LMXzM38oHgO66KY80M6gADufVkuScwDkQVYz2Ekk713QbSVIKixbseuJdJRbB9D72OFYxMTwodQzoEmrkW5A3i+usXk/a2VfJq7b74zmTt42GCyyLt1JxZpjqwYhpnxbFuapBM/hlxPJRWuIAu7PaLAE7nayV175pH0/ZUes1QimW5QxW/bWD+zyY++xMQfQgsHMMdZk2coPx1Joo1r64OYCYmIqBj+b8AjXmx+K0DOlZnEWoBFSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a0366a3-f3ad-4ec9-fcb5-08dec21e65ec
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 09:48:15.0917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEWWapsJI6tAZO61JLhMr6G41AeSC5KuvjQ73l94H63lZd1FTeJXGkE+E+Ax/UUfwGcGtYyx2/1sYtiX+UAfQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
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


On 6/3/2026 8:05 PM, Upadhyay, Tejas wrote:
>
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: 25 May 2026 15:37
>> To: intel-xe@lists.freedesktop.org
>> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
>> <anshuman.gupta@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
>> aravind.iddamsetty@linux.intel.com; Nilawar, Badal
>> <badal.nilawar@intel.com>; Jadav, Raag <raag.jadav@intel.com>;
>> Koppuravuri, Ravi Kishore <ravi.kishore.koppuravuri@intel.com>; Koujalagi,
>> Mallesh <mallesh.koujalagi@intel.com>; Purkait, Soham
>> <soham.purkait@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
>> Subject: [RFC PATCH v6 14/15] drm/xe/xe_ras: Add support to offline/decline
>> a page address
>>
>> This will be integrated with the related address-fault handling flow once this
>> patch is merged.
>> https://lore.kernel.org/intel-xe/20260506141143.4033299-12-
>> tejas.upadhyay@intel.com/
>> Sending for initial comments.
>>
>> Add basic support for sending page offline/decline requests to system
>> controller and use it for device memory ECC error handling.
>>
>> Handle return values from xe_ttm_vram_handle_addr_fault() and take
>> corresponding action. Pages that belong to critical BOs cannot be handled by
>> offlining and require a SBR (Secondary Bus Reset).
>> Pages that are configured for log-only handling are declined.
>> Other eligible page addresses are offlined through firmware.
>>
>> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 124 +++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  58 ++++++++
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   3 files changed, 182 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index
>> 2f9d25bda3f9..32c8ab587e2e 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -3,6 +3,7 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>
>> +#include "xe_bo.h"
>>   #include "xe_device.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>> @@ -37,6 +38,17 @@ enum xe_ras_component {
>>   	XE_RAS_COMP_MAX
>>   };
>>
>> +static const int ras_status_to_errno_map[] = {
>> +	[XE_RAS_STATUS_SUCCESS]			= 0,
>> +	[XE_RAS_STATUS_INVALID_PARAM]		= -EINVAL,
>> +	[XE_RAS_STATUS_OP_NOT_SUPPORTED]	= -EOPNOTSUPP,
>> +	[XE_RAS_STATUS_TIMEOUT]			= -ETIMEDOUT,
>> +	[XE_RAS_STATUS_HARDWARE_FAILURE]	= -EIO,
>> +	[XE_RAS_STATUS_INSUFFICIENT_RESOURCES]	= -ENAVAIL,
>> +	[XE_RAS_STATUS_UNKNOWN_ERROR]		= -ENODATA
>> +};
>> +static_assert(ARRAY_SIZE(ras_status_to_errno_map) ==
>> +XE_RAS_STATUS_UNKNOWN_ERROR + 1);
>> +
>>   static const char *const xe_ras_severities[] = {
>>   	[XE_RAS_SEV_NOT_SUPPORTED]		= "Not Supported",
>>   	[XE_RAS_SEV_CORRECTABLE]		= "Correctable Error",
>> @@ -72,6 +84,111 @@ static inline const char *comp_to_str(u8 component)
>>   	return xe_ras_components[component];
>>   }
>>
>> +static int ras_status_to_errno(enum xe_ras_response_status status) {
>> +	if (status > XE_RAS_STATUS_UNKNOWN_ERROR)
>> +		status = XE_RAS_STATUS_UNKNOWN_ERROR;
>> +
>> +	return ras_status_to_errno_map[status]; }
>> +
>> +static int send_page_offline(struct xe_device *xe, enum
>> +xe_ras_page_action action, u64 page_address) {
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	struct xe_ras_page_offline_request request = {0};
>> +	struct xe_ras_page_offline_response response = {0};
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	if (!xe->info.has_sysctrl)
>> +		return 0;
>> +
>> +	if (action >= XE_RAS_PAGE_ACTION_MAX) {
>> +		xe_err(xe, "[RAS]: Invalid page offline action %d\n", action);
>> +		return -EINVAL;
>> +	}
>> +
>> +	request.page_address = page_address;
>> +	request.action = action;
>> +
>> +	xe_sysctrl_build_command(&command, XE_SYSCTRL_GROUP_GFSP,
>> XE_SYSCTRL_CMD_PAGE_OFFLINE,
>> +				 &request, sizeof(request), &response,
>> sizeof(response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: failed to send page offline command
>> %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(response)) {
>> +		xe_err(xe, "sysctrl: unexpected page offline response length
>> %zu (expected %zu)\n",
>> +		       rlen, sizeof(response));
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response.status);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: page offline command failed with status
>> %d\n",
>> +		       response.status);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static int handle_page_offline(struct xe_device *xe, u64 page_address,
>> +bool send_offline_cmd) {
>> +	enum xe_ras_page_action action;
>> +	int ret;
>> +
>> +	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>> +		xe_err(xe, "sysctrl: Unaligned page address: 0x%llx\n",
>> page_address);
>> +		return -EINVAL;
>> +	}
>> +
>> +	/*
>> +	 * TODO: Call function to handle address fault
>> +	 * ret = xe_ttm_vram_handle_addr_fault(xe, page_address);
>> +	 */
>> +
>> +	/*
>> +	 * Handle return code from address fault handling function:
>> +	 *  0: Address is valid and can be offlined
>> +	 * -EIO: Address belongs to a critical BO that cannot be offlined
>> +	 * -ENXIO: Invalid address
>> +	 * -EOPNOTSUPP: Address is valid and can be offlined but user policy is
>> not to offline
>> +	 *
>> +	 * For any other non-zero error code, skip offlining.
>> +	 */
>> +
> Should we mention EXISTS, what it means here?

We do not have any handling for -EEXISTS.  The return codes are already 
documented
in xe_ttm_vram_handle_addr_fault.

Thanks
Riana

>
> Tejas
>> +	switch (ret) {
>> +	case 0:
>> +		action = XE_RAS_PAGE_ACTION_OFFLINE;
>> +		break;
>> +	/* User policy set to decline page offlining */
>> +	case -EOPNOTSUPP:
>> +		action = XE_RAS_PAGE_ACTION_DECLINE;
>> +		break;
>> +	case -EIO:
>> +		xe_err(xe, "[RAS]: Page address belongs to critical BO:
>> 0x%llx\n",
>> +		       page_address);
>> +		return ret;
>> +	default:
>> +		xe_err(xe, "[RAS]: Failed to handle address fault 0x%llx: %d\n",
>> +		       page_address, ret);
>> +		return 0;
>> +	}
>> +
>> +	if (send_offline_cmd) {
>> +		ret = send_page_offline(xe, action, page_address);
>> +		if (ret)
>> +			xe_err(xe, "sysctrl: Failed to offline page for address
>> 0x%llx: %d\n",
>> +			       page_address, ret);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   static enum xe_ras_recovery_action handle_core_compute_errors(struct
>> xe_ras_error_array *arr)  {
>>   	struct xe_ras_compute_error *error_info = (void *)arr->details; @@ -
>> 135,14 +252,17 @@ static enum xe_ras_recovery_action
>> handle_device_memory_errors(struct xe_device
>>   							       struct
>> xe_ras_error_array *arr)  {
>>   	struct xe_ras_memory_error *info = (void *)arr->details;
>> +	int ret;
>>
>>   	if (info->category & XE_RAS_MEMORY_ECC) {
>>   		xe_err(xe, "[RAS]: double-bit ECC error detected at sw address
>> 0x%llx\n",
>>   		       info->sw_address);
>> -		/* TODO: page offline handling for double-bit ECC errors and
>> return accordingly */
>> +		ret = handle_page_offline(xe, info->sw_address, true);
>> +		if (!ret)
>> +			return XE_RAS_RECOVERY_ACTION_RECOVERED;
>>   	}
>>
>> -	/* Request a reset for other device memory error categories */
>> +	/* Request a reset for other device memory errors and if page
>> +offlining failed */
>>   	return XE_RAS_RECOVERY_ACTION_RESET;
>>   }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h
>> b/drivers/gpu/drm/xe/xe_ras_types.h
>> index fada9802667e..af03921c7cf6 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -32,6 +32,40 @@ enum xe_ras_recovery_action {
>>   	XE_RAS_RECOVERY_ACTION_MAX
>>   };
>>
>> +/**
>> + * enum xe_ras_page_action - Page offline actions for page offline
>> +request
>> + *
>> + * @XE_RAS_PAGE_ACTION_OFFLINE: Instruct firmware to remove page
>> from
>> +queue
>> + * @XE_RAS_PAGE_ACTION_DECLINE: Instruct firmware to mark page as not
>> +offline
>> + * @XE_RAS_PAGE_ACTION_MAX: Max value for validation  */ enum
>> +xe_ras_page_action {
>> +	XE_RAS_PAGE_ACTION_OFFLINE,
>> +	XE_RAS_PAGE_ACTION_DECLINE,
>> +	XE_RAS_PAGE_ACTION_MAX
>> +};
>> +
>> +/**
>> + * enum xe_ras_response_status - RAS response status codes
>> + *
>> + * @XE_RAS_STATUS_SUCCESS: Operation successful
>> + * @XE_RAS_STATUS_INVALID_PARAM: Invalid parameter
>> + * @XE_RAS_STATUS_OP_NOT_SUPPORTED: Operation not supported
>> + * @XE_RAS_STATUS_TIMEOUT: Operation timed out
>> + * @XE_RAS_STATUS_HARDWARE_FAILURE: Hardware failure
>> + * @XE_RAS_STATUS_INSUFFICIENT_RESOURCES: Insufficient resources
>> + * @XE_RAS_STATUS_UNKNOWN_ERROR: Unknown error  */ enum
>> +xe_ras_response_status {
>> +	XE_RAS_STATUS_SUCCESS = 0,
>> +	XE_RAS_STATUS_INVALID_PARAM,
>> +	XE_RAS_STATUS_OP_NOT_SUPPORTED,
>> +	XE_RAS_STATUS_TIMEOUT,
>> +	XE_RAS_STATUS_HARDWARE_FAILURE,
>> +	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
>> +	XE_RAS_STATUS_UNKNOWN_ERROR
>> +};
>> +
>>   /**
>>    * struct xe_ras_error_common - Error fields that are common across all
>> products
>>    */
>> @@ -227,4 +261,28 @@ struct xe_ras_page_offline_queue {
>>   	/** @reserved: Reserved for future use */
>>   	u8 reserved[3];
>>   } __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_request - Request for page offline
>> +command
>> + *
>> + * This structure provides the request format to offline/decline a page
>> +*/ struct xe_ras_page_offline_request {
>> +	/** @page_address: Page address (4KB aligned) */
>> +	u64 page_address;
>> +	/** @action: Action to be performed, see &enum xe_ras_page_action
>> */
>> +	u32 action;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_page_offline_response - Response from page offline
>> +command  */ struct xe_ras_page_offline_response {
>> +	/** @status: Status of the page offline request, see &enum
>> xe_ras_response_status */
>> +	u32 status;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index b7a5e82c6eb0..12ffd011ee8e 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -24,12 +24,14 @@ enum xe_sysctrl_group {
>>    *
>>    * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>> + * @XE_SYSCTRL_CMD_PAGE_OFFLINE: Instruct firmware to offline/decline a
>> + page
>>    * @XE_SYSCTRL_CMD_GET_OFFLINE_LIST: Retrieve list of all offlined pages
>> from flash
>>    * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued
>> pages from firmware
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>> +	XE_SYSCTRL_CMD_PAGE_OFFLINE		= 0x08,
>>   	XE_SYSCTRL_CMD_GET_OFFLINE_LIST		= 0x09,
>>   	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>   };
>> --
>> 2.47.1
