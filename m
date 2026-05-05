Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B8CFF885A
	for <intel-xe@archiver.kernel.org>; Tue,  5 May 2026 05:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A4F10E0AD;
	Tue,  5 May 2026 05:32:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ViLebkg/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 624E910E0AD
 for <intel-xe@lists.freedesktop.org>; Tue,  5 May 2026 05:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777959132; x=1809495132;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8EPIUEvcsG9uMwJ0hV/narQwJYkr3ookbNO7UevjwL0=;
 b=ViLebkg/GxJoJQsZoToZmuDhrArvUlVkrffa8/q4/E3FJB10BzE73ND9
 oURYRAxEkbBWPLRZ6jIP2Pv//bcgmHKVFP9CKh3gBJ8GkskZO5kAptij3
 vDVo9ekWvPNrlbub87uxOy0HbKhj9RD03kuF4rKeEiYbwJ/8JqgF0CRex
 VKOLmn8eyydBUWcknjBPDURvrIea4k3Td/eFy37jOltg4/0sJEZPtub38
 uMQT0WUKp1P9fDfSXXE97fYOC9W5VczoDRrnVEqyfd25/yvILrjzcjOSL
 tVFgVABs4S36Iu0DhCYDGK8XyYxhfvT+C3XQcBLHLv2fmhM7vWrHBhAv9 Q==;
X-CSE-ConnectionGUID: FclsCInFRPi7zms0C6FPcg==
X-CSE-MsgGUID: JTX8TL+vSSSbC0s8hYzKng==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78844866"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="78844866"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:32:12 -0700
X-CSE-ConnectionGUID: ZGSGcyKUQEqBpePzaU48xA==
X-CSE-MsgGUID: GMNHA/UmRn62O7sZ31oTkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; d="scan'208";a="259066484"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:32:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:32:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 22:32:11 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 22:32:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nfAWK91ATNnmWa/EAcTCcZgTiLtFimO1nhNd5KT5FDDG0DANXwtDmjRLEdfAoVgIdzZKVYscoiK1/drW2USBsWzI87K6db/0K01Bwxh7Tjg0IP36Y4jy/jqKZDEov1ogY5XP8+mg8N/L/ZavZEYZ4vToWopg6POMi/z/VSCICWx/tN0dj7X4BuuJgHQY/sUhqKyskX2i3yQKQEQAKGYchbVga7BPNy2JVsjAWfhyshB0ltgxFFsrAAPQ9nQJJ76xp3H+7mUX7dTqmPXinpb/lXP2pdMZz8n3+MsjQddhkRn+p9uXaczVie7W8Z/E4EoiPr/HWF+Qo+c3ZQI7BmDTsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EPIUEvcsG9uMwJ0hV/narQwJYkr3ookbNO7UevjwL0=;
 b=kjMaN9q4neNpdHQWU0YwkFeLo1O1POyVzzyoKxPjqpA/qDLFkH/NywzEwvJhSkilZK+QB12X7Q915htZq1YGvu1RZkzNGNRIxvJQ+GShUd/Cx8zFAegdPfGpt06XpIYCPzSrCv38BmIN/OW3Q/xlLF7QgQ7PKlrl/ZbdqiFhqzK+n6uFFUFdhWI4AV+n9XUPddXiW8QgZZoLHeWNg4Pp0yaCWkYDe1ZCIOrdmcf0mfVsb0UDOAHmWH91YqHbhXOyBl/urFHJfg2vHGePN/iF7H1HbZbiifY22MTIA9b0+f2OwBgD5o/nYsY6zRSv4faS4CmVLYm91zxIsYmMr9MI1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Tue, 5 May 2026 05:32:09 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 05:32:08 +0000
Message-ID: <68e500c6-06a9-4618-9335-79b02b2b8c3e@intel.com>
Date: Tue, 5 May 2026 11:01:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/13] drm/xe/xe_pci_error: Process errors in
 mmio_enabled
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <mallesh.koujalagi@intel.com>, <soham.purkait@intel.com>
References: <20260417085812.4013309-15-riana.tauro@intel.com>
 <20260417085812.4013309-28-riana.tauro@intel.com>
 <afCchCnDdagHgl9M@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <afCchCnDdagHgl9M@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc6546e-5539-4b1c-d475-08deaa67a6a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: zukHJ1+vGqsx+Sj7zoekgdkiBo4LMdY/XxyBeYnfs8xW7WjLke2t7vWp9XXh7fDqkRZqXMa9qDoHOBS2zE2rYHPXoKT1j5eyKanenxZXM08+fQFzDyKJDtkiJOJcU8E+uk54XrljwjpPWwa8MkOJAB4DHYDsaBlRPFzJ8qV4lIc4hCfLfI7Tkybij3lJ59MpT8Bt9oXekv5b+JfB7J4CpHR3YFQiDYpdW/+tkCKSEw37JUMtIZC3CSbxRXvTmqC6f910oS1rhgHSuN5KSUtjt6wO2+9NsKqjhcwrBmT/Y46IY3F/k4ub6p1d5EZ2l83bdhXMPg8PWfz0rCvfR9YLJNs+Q1F+O1MjfJg1rNmeH0NsORRqDafksFKx2GvOjFATUVPy6a34lOmLM4L0iPp7aIlnKgCW57Isw+clYitDFN+QS4aOcNh8Lu6U03TBinjftSnMgUyx6KDdDPJJ65JoGt4ri1Ejf4f8JQCQIG/ALfdXMWGfQKA1UqOpe7WX0YVGtNiejy3SjdbIbK1eB+qTk9IoJL5P2OEA0/87W9NMs1r8vfvxyrBChKeCSBmXsxzZMrmoJI9d92FlI5i+HokorPA1lBug2N9CCar8MIYiFvQzjyQ65VE5FXj0oFH1AamsrRzF06JdlQuaLaD0xyqdAqLPz5UBJXGzbVF0zQCBB7jxM7BngG6sFT2uLKUCwfrw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dzVjWUpYaFd5cWhhR2JCM3pObjZDT21Janhsbk1JUWQxSnFZSm54NXMyTWZl?=
 =?utf-8?B?UlRsWTN4U0ZSTkhSYWs4RWRkV0UxYmIxczBRdDlCZTVhT1lIcHpxU0xFeUlW?=
 =?utf-8?B?eXBUd0hxbnhrcVIrVDhUR1l4U05GbkIyWW1BZWJ2aEFpRE5aSEo4LzQ4NGU0?=
 =?utf-8?B?dVQzS1JtcFZPSldLbUgxaFljNTBxaTQvS01PZkNXNloyN1ovNk1LVnVrYU1Z?=
 =?utf-8?B?d1pib0o5ZnFnM1BlbVAxRk94QUJ1eU02VjYxNEc5MnRCZkhXYUpGKy9TcEFM?=
 =?utf-8?B?cUtwK2hXeit2bk9DMEJJSGlwL0hzd0ZFbG1MdWVjMjJoakZ0Zk1IdVhEWFlP?=
 =?utf-8?B?MWlGU21QeDFrdytjRjQ2OXJNSU9DdlJpc0pPMWwyNlFYYlFqNkFtT2RqTTBM?=
 =?utf-8?B?NEJXeDM3czBxb2MyYWpGbHBuOEp4NVlVRytJcEZCckpYUXkwN1lGNnJ6U3Fs?=
 =?utf-8?B?UHMxNzZZWmVZNVY3c3kvWEVPVURIVUMzQWdVOHFLQ1c5MG5icnQvNWtsZHRs?=
 =?utf-8?B?RGtzMDJtKzZxWjZreXJxVXJ5N2VwT1FhbWRGQ0hJcVMvT2RRWnIwaVdtL2xV?=
 =?utf-8?B?UjdJNlZ2ZGE3NWE4dVlIRW1XSmdNaGViZEN2VkhJWUJWcEhzS2VCZnpZUEU0?=
 =?utf-8?B?b0J4R3VtY0YvMGZESFZQekxKWVRnSGRpQ01iSjBHYnptRWhqcEgyTGhGOTJZ?=
 =?utf-8?B?UEtoMTRnZXM1YXRiWkpZR20zVXNuelY1YjBpWTJPcVljQk96bno2VVZ1R0VB?=
 =?utf-8?B?U3lpYnR2QWh2Qit1YU1Wc0NEZUtHRTErQUZRNHAzMjlOWDladFFWTjNpYmsx?=
 =?utf-8?B?aFFIUTJBMXJMdE1OUW1aMWYwemlLQjBTc205U2hkZ0dnTU83WUgvOFUrMkFy?=
 =?utf-8?B?WG9xMVNxSWprYThFWjI1eGZ4MlhXSWljNytHU2pheFJidFJnK0pzOVgyVUFO?=
 =?utf-8?B?NUlIZWFBeTVRbnQ1dTk5bWQybmVZV0M0Zy92U2tHTnlEbloxNUJYVU9xSWVp?=
 =?utf-8?B?UFVNWC9EdmNTd2xqVStFbjNTTzJkR3pVL21DWktFK0NpYmJabHZFemM4RE5J?=
 =?utf-8?B?K09ZV2poTXY4WDFtUWZYZGN0Z1pDSldieGI3bElLaDNPaG5YTkZtVFk4aFg0?=
 =?utf-8?B?b0F2bmliUmZFejREU1E0WlpGdGJqWVFQd295cUdNTitzd3NEaDdqcGlNR04w?=
 =?utf-8?B?Ky9DdTBMdjdYUERvcW9WRVlRQi84ai9sZXZLZzNlU2hnOWRhb1VvSDdDN2xa?=
 =?utf-8?B?T2JwcUVEaHlWUFJDS0VNaGFVKythTHU0dDZFcEppWGFsTlFFVmdnMjJhK2Vn?=
 =?utf-8?B?bjhDY21kZ3FlTEY3SmJGMHdMQk54MVg5blV3dzZ6T1dSYWdrM2FPcHpzaHNX?=
 =?utf-8?B?c3BGYjNyTi9yemx5TVdxS0xuT001c1R5MnAycEZJQXZoNjRtUC9OK0xFZzV1?=
 =?utf-8?B?OWdHT0gzNHhMRDhyMDdaUjRyM2VOaFBZR2FEUFFkcDF2anpmaHJKWWRiRDNj?=
 =?utf-8?B?R0dNckZhU2prNHJhMnFoSWU2QjBBMURzT09FUEFheFNXdEZYTVN3VE9zbVhm?=
 =?utf-8?B?MnNXeGdLRDZPVW9uSXYxcWYyTHNnbHRINzFlVkRLcVBHWGpjV3B4UWk4VXVx?=
 =?utf-8?B?R1RpTUxmT1NIb28rdkFlMzJ1NGJwdndtNE55YnduSWJUdW5VZEpqd3MxaXVz?=
 =?utf-8?B?N3VkN2YxOWlpTVZxM3VNczlXVHVyNitib2x4b0NNaXN3RWlzV1ZwZ0JmNFd2?=
 =?utf-8?B?Ymw1TzBPbEFYMzF6aTRjWUI5OW90eFlMNnB6RGl3Z2l5Wldhbmg0V3RyeW4y?=
 =?utf-8?B?MGVNaDNKUEUwblBuVEI2WktBRXFuMmNEcnNqTHBjcmp6Y0lxTDVDV2FTamRw?=
 =?utf-8?B?bzhobVNBekg5TkZkaDA2eTNteG1pR1JSTEc3bnVHVDF0Zmh2SDhGQktTSlVB?=
 =?utf-8?B?RVBnK1ZoUkc4K29jQnlVMUxaUFlXOGk3a1RETXVXVXpMdmk5U3NpL1BSbUQx?=
 =?utf-8?B?NmR2bGJEZ01XVkNwT3RqeGVnK21ZWm81Q2haK0dSWEU3akttNTdrVnU4ZFpq?=
 =?utf-8?B?LytRWXZGdDZaRzNhanpBMXBERVVsZUlxZjVYWUl3RnBKd1RjQTlnMUdyU1Jo?=
 =?utf-8?B?djFIUlBrK0ZTQnlBNFI0QTJzekpyRnd3dm42eEFnaUdYUFczYzZkdmZSb1Vo?=
 =?utf-8?B?R3MrRWJ3WWVwYVZ4YUpoVVJieHp1SGpnNU12cTUyNEtzQnM1SE5Tb3Q4Znd6?=
 =?utf-8?B?UWJwekNRNmgzbXkwSDdJOGFRK2tac3dDSWN1cUQwdVA0amM4QU1wWFo5cVlX?=
 =?utf-8?B?T21VZTE4Qy9jbHhLcjJzM215THVVa1huUEV1L3dkK2h2dUc3NDlnZz09?=
X-Exchange-RoutingPolicyChecked: Sypy9hq15ObI54vO6BXFARUt8bsllyo/GTi5waSRADwQBJ0/eAKs6mzrHYluClSEsfJBmqQWySuDftViJ+pblYWm0BW5R9e++x4m1arbt2QAQ/pT+6PkTqDQH7MYCI58z6MtbyR4iLFru1rEhDYnksibp0HDvE4HgQVh+CTsTz+3nWybYo/fFYUQ5rVVpO35wjm3at6EwRQGQKsEJA3k9RHX70W+mPGwD02tym3hgisiuqhkMBZ8xlZ1AzmyiiOuntOV0TrUcZHv8GpXfCgLF7fhrOlqCTJV3vC4EXQUtcqDcflfnAxcbferz1lRAxzsqSewM5mQTR4GUl9Fnkv+pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc6546e-5539-4b1c-d475-08deaa67a6a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 05:32:08.8925 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOJ18SrbqcpzlWbPj9T/a7ak4HwYTXE5K2wm9VAbP2SvX+Knip0lsZc7/EzV2RiBxQ6ORC1zRXydhAAkav1Neg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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


On 4/28/2026 5:09 PM, Raag Jadav wrote:
> On Fri, Apr 17, 2026 at 02:28:25PM +0530, Riana Tauro wrote:
>> Query system controller when any non fatal error occurs to check
>> the type of the error, contain and recover.
>>
>> The system controller is queried in the mmio_enabled callback.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> Reviewed-by: Raag Jadav <raag.jadav@intel.com>

Thank you for the review

Riana

