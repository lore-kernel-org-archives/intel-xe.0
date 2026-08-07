Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D37C5AC7A
	for <intel-xe@archiver.kernel.org>; Fri,  7 Aug 2026 08:49:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A3BA10F41B;
	Fri,  7 Aug 2026 08:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+BkBcQl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A89510F438
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Aug 2026 08:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786092551; x=1817628551;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0sqAOmjzAZlWP5XrMFxAWYzFB3P5pd0O8tdhg/n2YYo=;
 b=h+BkBcQlxbHbcaAhybmbvp7turFoR1LlpvCVFuH6IDkCfpKuPVyZPwa7
 v/gfwcUtOCkLzCBnsdOvvrfy2/QOIGuS2TeS9gho/glgx0tqxB3z6vOS/
 vk9dFqhyWokd4gyRaTgDHJCl6cj9ikHGWjenxMMa19CwD4janJ8yIK/Od
 VRQBxSuL7SzDFp27lcDqMVykt/UozYUsOp8SRO3c8P02kESn6vdz7aP+k
 jVRICJBYegUhcjY8pFKlUhUXyTuLlUzUOXHnxxILc2nZeER8DLcoW9yn6
 bQzApo0YECN6oPTl+mKQRCnmj4JOQSyoxnxU+vOJFdmuzFI+KRRBPx0dY g==;
X-CSE-ConnectionGUID: UD1ppazjQlGTGBK7/+81sg==
X-CSE-MsgGUID: 1MSzJ3P8R4WWt+rD4wKgzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="90514553"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="90514553"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:49:11 -0700
X-CSE-ConnectionGUID: 2hiIhvO+SDGbXLrWyRVpiA==
X-CSE-MsgGUID: TcZdYVSXRaueqVhlmOPOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="262965461"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 01:49:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:49:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 7 Aug 2026 01:49:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.33) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 7 Aug 2026 01:49:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rmtYs5L7EZY3XqngZmuqrJMiUV1p1UZWfOZUSXluU1UpSCuT4ZYz0QGfhlJYjjzugm5L9IAXNs3GsO/pqMVpcdVX2NPbjkN/MSr/E3PZLuNOCVSjM6HLY9a2HGoJlD1/WpTroNNLOD36nMebqOPnhW3rJxB2q7ByW56eNbj3fP2yn4gIjSP+VJk5dHOMvPsQIbPBW9fVeOMZH9JGf+x0ERB4sTNw3mWGj8KYGUDckc9zj33NjPZjD9NQyTDrSgwKpvKz051ptP3fhD/97qQlLmS5YCQBdikcmWbY9WgUjg/Zk4h5kOZG0cwHWdCprxyIwZp/pOeRSUPEDnKt4Evhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvGpOBEm3Y2QR+BCNhOO1a7oeaViRJmrAW4IBHpBoj8=;
 b=SyJv2zXnJ1Jtx60GLP7Sovckh7I8OJhA+QyTqwRvOMKmihX7wIVYaUGOAq5Ut0oy5CNOQsW01rPdoPRjoOzsFCrgzWrd2yU6ESYfPZR0stF85TXmSOLljLY3KFtC2t62emWF4oRF+rhIr5knzRIj+dnaya2h9jtEX7eP1pQGRh/4huy5Q3jJ3vRQWyhZza9psRBOmBxUI1PijmIgkbaA/VU/PgKu6Bu1z8TNC3nDu+cgXjnIcP/JfV39VEr3hTvyeWxKNCdBjKiXY+0HbbfYSP0US7Pg195lBDj1v08K9riB0r6GNQ8MrRcaOCvxtQPX5fkNAMBN3fVFThyOhyhBNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH3PPF0515C3CD3.namprd11.prod.outlook.com (2603:10b6:518:1::d05)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 08:49:07 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 08:49:07 +0000
Message-ID: <def9066c-bec4-418e-b4d3-9728e1febade@intel.com>
Date: Fri, 7 Aug 2026 14:18:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/xe/sysctrl: Add better sysctrl error reporting
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-10-mallesh.koujalagi@intel.com>
 <77855354-32e3-40bc-8af0-d20624c69a7e@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <77855354-32e3-40bc-8af0-d20624c69a7e@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH3PPF0515C3CD3:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbdc558-b2be-43cc-2fde-08def460bd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: X0DnIG9GXuv28JiuA3NW6iNifNLgKoniawm0u6N/J+NmtbuDLPryj8zh/731bYOM9dzm3+3DC9x3IIBT9tCpmbervuqWP9hBwMHxgI8oo/cG3MFQPf7yMog6y/CTIEYZWGQRtc0KDNyu4jh1HdTBI02fwvLoXJSsBZ/iE+KjGij/yM0R14+0EptKl9wg3mnVu0DmN3nwvm9/lNODG/JEGYCdeewbBX+l6ledo5pua/F4kvA96laJ/UtvR6Xog/TPm0zifQTD2Ks+Ut0tcIT5ZuwJCDQt1XVG3opOM0Ofzgd9A0rapTmdNY++4GRwyEjctrfTALWdfPSbjpPfFXKXA97mVSHlnsUK17nS9AK6r5iqi1E+bP4cTYJ8HWmP4RbEMZrPUB8Q4iThY6t+UvxszUH4wWen7iIkVIKBJjEbJBwujx3THufLcn0DhIwGmPf8pICp0kGErk3p2m8vY43ShUhIpWZmucTnq0K0AcGG0kUtm1n6EZ7nvOn0KvMvP1jLem3DCLm62eDzWbadQ0O0oTMLkprTzRaGt21Pp15f43zSrhJ7powkCTDeHclzLFmWCC1y0oTDNHFbaOd8rGMYCfNCSJh9HeiJiVUC+F+UMyWGeN0WVmd91WYCuaPoGEAJddSenosMd6DBbjNRBEhMdzusYc2wWy1xbZqVhUvmAmM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmpzenByc2RybWxtbm9zeU9XZVhXYlhKZ0N0UFVrbEVQaS8yaTRoeWs2dkZN?=
 =?utf-8?B?d3h2SlYrL2g0L0JWR0ZTeFhwUk1DVDVnYUs5LzdNdG14N0wyOS8rZldzZHF1?=
 =?utf-8?B?WTk5dzlEQmFTQ1d2UWk0dFRBbm5EVkZwT1ZTcUlNNk8ydENmWWI3VGZzWUxz?=
 =?utf-8?B?RWMzUjJMb0czUXorRDczOEp1UUJJMm9EU0JOc054TTdmNGNGUDhVTFBybGRV?=
 =?utf-8?B?SElzTEd4OW0wM3phdEkyaWxWNUpvNVRMRkpaZ3BVaWt5aE9mNExqc1FKZUhK?=
 =?utf-8?B?ZnUySTZ5ZkduNE80cmZPbE1xVUlWaDRDdWpLUlZnS3gwRXpwdlpJSG1zN3c1?=
 =?utf-8?B?SzlWOEhPUHp2L2oxUjVmWkRGeU5wQ1hrSnJJQ0FZaENTb0gvdWxTZWtKU21n?=
 =?utf-8?B?VmFOWERwcDVuMFdzWi9ORXhIZ0QvNkVRK3MybHJBYjlhMkNxcE81c09LQ0hC?=
 =?utf-8?B?UjZ6L3lGVDV0Y3B2eVYzekJBUkZwWmxwQ2FoTkgvL3pNbXVZRmhNR2FoajhY?=
 =?utf-8?B?UWNvMEF2MWN4YzByWUF1WFdZY2lycFV5SFVTQ1YvRDFSaEZZdHpJVjVDQm9r?=
 =?utf-8?B?ZU5TejFVN3prTm04b3VjL2UxbTk5bmxZMFNpL1ZkNERkRzF5RVhKQmkzRWs2?=
 =?utf-8?B?OUx1V3F0Z0ZpS3BHMys4eGYwSGhYczNtYTBuV3cxMit6TVJaR1MrSGRlTW5G?=
 =?utf-8?B?eldDb1EyWXA1QUhxRi9CSFZ3OVlGZjdFZWZ1T2lXVE5DT3cyZ2FoMEN3Sy9v?=
 =?utf-8?B?RlB1Q1RJS01XblY0djhQUEkweGdIZjFzT3ZTeC82SHhZZksvUUNMd2R2SFFm?=
 =?utf-8?B?ZFlDR0QvVVcrSVFnSHYxT0VuRDBWeWk4Z2NZSDdNSnN2OEs1UFc4cFFqL2hU?=
 =?utf-8?B?VXJhTVlwbmEzMHcrcmpJcUJ6WjVjWXVwV09McE9OSVkzdXhITXJla2V5RjVQ?=
 =?utf-8?B?cTMzaTUwV2RwRXZTWHEwRC9NbHdlUFdZREVDYUV0WmtJbFg4VTdTc3pubnZi?=
 =?utf-8?B?dXptQll0WXp4RmJ5YjJnK3VROFJEMmg2N25RWnUxb1F6eERDSlphQ0VtR2Vu?=
 =?utf-8?B?ZWRaWkRlR2I4SjJKUytmTDczdzZlZ0xlSVV4WlJCcU1WMXdCQ2FpYmZuViti?=
 =?utf-8?B?bStJTnppZENnUnNaRzFDS04zS1U1U1Y5cC9Jb0NhNjBiVW5xSjgvbW1uenNv?=
 =?utf-8?B?YWVMK2xYeWllTktpNWJmL1hBck9qWUZYekNtK2ViOVRzTEozL1M3aURveFVh?=
 =?utf-8?B?S0NESFpEWitoTmhxZTFseklDY3NMODFDQldtcU5SaFpIcHF2d3RFckJVdU1x?=
 =?utf-8?B?dkxJajdYT3J1SWVjNDZKVGpDQ1dQemhlc0NRWm9WOHY3blVQdlozUDQ5OTFG?=
 =?utf-8?B?QSttSGU0OU95K2RMd2Y2RUJVTlFSMHgvYks1N3lSbnIwWkhySHV4YnNRSXhX?=
 =?utf-8?B?OHJpQmRYRVpjUTFRcFdnNFNNTnV5Y0YxdWNPUTE5dGJyRG1takYzV21hRmcz?=
 =?utf-8?B?MHMyR3hucHdsVzVwTUlyV0VTOEJ3eFBNbFVTVS9ETlYydlRRVHI1a1p6WnZo?=
 =?utf-8?B?UG9PWWNHa0lWOWIwdDg4azJiTGgxQVBWenUwVlFkTG5GRmFFOUhBVVIzcDRh?=
 =?utf-8?B?MnEweFRHWEVEYjFXc1dobzdpZW9hU3ZTM0NyNWtDTCtjdktHeDhBY2xWRVk4?=
 =?utf-8?B?R1lwSkxuR0lHNjJMK215K3VGdDJVSmF2QkEzZG44cWhDRHByamt1c09pQjk0?=
 =?utf-8?B?ZnBMSUo3VlppRHlxcHo0Z1h2SVdoS2RzZytRUk9od3prS1ZHSmZvdFRQNUty?=
 =?utf-8?B?RGZTYlRVWitMUStLSjJMMVJqZU9PMmlkL0lLazJCMnQyUUJLQ0FRdk5Pd1My?=
 =?utf-8?B?K1JWZkpUZVEySTFGK2tyeFhOVWdPMXdvVWhWWWVQNFRQTUlrSlJlMVJ1UnZu?=
 =?utf-8?B?bW5SczhXd2lMNi9CaUx6TkJYMnRUcHhyUm9ub04yb2o3NVdxeDdLY0dFWlhw?=
 =?utf-8?B?dE1UOXo0YkRabHNqTTFuaXkwQ2FKZENuekIzY0hSK3dtYm5CYXJEZEI3VWJm?=
 =?utf-8?B?S2VWREdVY055V1d6Mk0yMHBUZUNqSjJ5N1JOZ0E5Rk8yNGlzZGtNSDVUOEc5?=
 =?utf-8?B?UTluUUpnbHBnVHY2dkNkQmxUQzZmajRtZytJdGcrSnkzN3JXQTB1U3VSSlpl?=
 =?utf-8?B?K1FDWDN0Q21lSXAwbVUrM2tIZm1TbXNuWDFNd0VjVE9KTUM0K25WRjlMRnhZ?=
 =?utf-8?B?cnlyUG82SEkxV1c2M3JxYmI3TVhFUzd3Y2ROZllVMUhmMVVmenNiRXo2MCtU?=
 =?utf-8?B?dEFVaGhkK0VNTEJ1eUgwMUhpcEU0ZTNEUnZkL3JJcmdYQnZyN2JweGsycTlt?=
 =?utf-8?Q?U1qiOjsdmPgZkHpE=3D?=
X-Exchange-RoutingPolicyChecked: UkLP8hkZY7t3QQ4VQbGzp/zPg1ykCjFqe6fP9+vnAZYQqXUmjhZfKvSeUQ/BstNN4Fo2JVxPl/cSbJW8oNDd12k0k++s49ECqXfsS5N48ntTMyxWwOCZeAQGBROf52DcwC2gobT/7a4RVtwPI823zpjtWE1pF1afAxwYVwqa/GecW4zZqGBmSvvQUKGoegpFThC2LpNsaywkjvUFXOh2CzXoPPF8gqBXW26K9+DoI5C+gTljhTV9vqU3uGG79sqh/I/uD33h7V+BHp7OO7GCOQcAMwQTeB7CTQ2MeRBHKnCqH1D7049TEHb4tgm0ILcM6ecDPZZ7VnGmrZcZ0+wlFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbdc558-b2be-43cc-2fde-08def460bd96
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:49:07.2311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OQ3E0YqCNcKshWufdmOtO2CaJWYsbbX39zwAk8qwIgxqqPJ4ISb7bI/D3DvrKlZPnogApSKy+bikile5+cP7VED6ErEJ+24xSnJU4d6eTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0515C3CD3
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


On 06-08-2026 08:11 pm, Michal Wajdeczko wrote:
>
> On 8/6/2026 1:00 PM, Mallesh Koujalagi wrote:
>> Switch sysctrl error messages to xe_log_err() with SYSCTRL tags so
>> tools can reliably detect and categorize common sysctrl failures.
>>
>> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_sysctrl_event.c   | 11 ++++++----
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 29 ++++++++++++++++---------
>>   2 files changed, 26 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> index da395148ee9d..1805a0b4d0d0 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include "xe_device.h"
>>   #include "xe_irq.h"
>> +#include "xe_log.h"
>>   #include "xe_printk.h"
>>   #include "xe_ras.h"
>>   #include "xe_sysctrl.h"
>> @@ -25,13 +26,15 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>>   
>>   		ret = xe_sysctrl_send_command(sc, command, &len);
>>   		if (ret) {
>> -			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
>> +			xe_log_err(xe, SYSCTRL, ret,
>> +				   "sysctrl: failed to get pending event\n");
> using "sysctrl: " prefix here is now redundant, as xe_log_err will add "SYSCTRL: " based on the TAG
Sure, will remove in next revision.
>
>>   			return;
>>   		}
>>   
>>   		if (len != sizeof(*response)) {
>> -			xe_err(xe, "sysctrl: unexpected event response length %zu (expected %zu)\n",
>> -			       len, sizeof(*response));
>> +			xe_log_err(xe, SYSCTRL, 0,
>> +				   "sysctrl: unexpected event response length %zu (expected %zu)\n",
>> +				   len, sizeof(*response));
> ditto
>
> also since this is unexpected protocol error we should use -EPROTO or similar errno
Ok.
>
>
>>   			return;
>>   		}
>>   
>> @@ -41,7 +44,7 @@ static void get_pending_event(struct xe_sysctrl *sc, struct xe_sysctrl_mailbox_c
>>   			xe_warn(xe, "sysctrl: unexpected event %#x\n", response->event);
> btw, shouldn't we also report that ^^^ warn case?
btw, do we've any SIGID based warning helper function? we can see that 
warning message in dmesg right..any suggestion.
>>   
>>   		if (!--count) {
>> -			xe_err(xe, "sysctrl: event flooding\n");
>> +			xe_log_err(xe, SYSCTRL, 0, "sysctrl: event flooding\n");
> again, drop the "sysctrl:" prefix
Sure
> and use some errno, maybe -ETOOMANYREFS ?
We can use  -EOVERFLOW  right.
> and maybe also print response->count to show how many events we left behind?
will add next revision.
> hmm, but what will happen to those events that we don't retrieve now?
> are they lost (and that's why we need to report an error)
> or maybe we will be able to retrieve them in another cycle?
> (but then I'm not sure we should report that as an error)

Hitting the flood limit (16) that means something is abnormal @ firmware 
side which

generate event faster than we can drain them. If we would not use flood 
limit, it would not break the loop.

In such scenario, we would not retry, simply report it.

>
>>   			return;
>>   		}
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> index e13eebaac1d0..5c8edf9871c6 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>> @@ -11,6 +11,7 @@
>>   
>>   #include "regs/xe_sysctrl_regs.h"
>>   #include "xe_device.h"
>> +#include "xe_log.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pm.h"
>>   #include "xe_printk.h"
>> @@ -115,7 +116,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>>   	xe_assert(xe, command <= SYSCTRL_HDR_COMMAND_MAX);
>>   
>>   	if (data_in_len > XE_SYSCTRL_MB_MAX_MESSAGE_SIZE - sizeof(*hdr)) {
> hmm, shouldn't this be a simple xe_assert() instead?
> after all, it is us who prepares these cmds, right?
Agreed,  instead of condition, they would have used xe_assert.
>> -		xe_err(xe, "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>> +		xe_log_err(xe, SYSCTRL, -EINVAL,
>> +			   "sysctrl: Input data too large: %zu bytes\n", data_in_len);
>>   		return -EINVAL;
>>   	}
>>   
>> @@ -149,7 +151,7 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   	total_frames = DIV_ROUND_UP(cmd_size, XE_SYSCTRL_MB_FRAME_SIZE);
>>   
>>   	if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>> -		xe_err(xe, "sysctrl: Mailbox busy\n");
>> +		xe_log_err(xe, SYSCTRL, -EBUSY, "sysctrl: Mailbox busy\n");
> drop "sysctrl:" prefix
>
>>   		return -EBUSY;
>>   	}
>>   
>> @@ -160,7 +162,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   		frame_size = min_t(size_t, cmd_size - bytes_sent, XE_SYSCTRL_MB_FRAME_SIZE);
>>   
>>   		if (sysctrl_write_frame(sc, mbox_cmd + bytes_sent, frame_size)) {
>> -			xe_err(xe, "sysctrl: Failed to write frame %u\n", frame);
>> +			xe_log_err(xe, SYSCTRL, -EIO,
>> +				   "sysctrl: Failed to write frame %u\n", frame);
> ditto
>
>>   			sc->phase_bit = 0;
>>   			return -EIO;
>>   		}
>> @@ -174,7 +177,8 @@ static int sysctrl_send_frames(struct xe_sysctrl *sc,
>>   		xe_mmio_write32(sc->mmio, SYSCTRL_MB_CTRL, ctrl_reg);
>>   
>>   		if (!sysctrl_wait_bit_clear(sc, SYSCTRL_MB_CTRL_RUN_BUSY, timeout_ms)) {
>> -			xe_err(xe, "sysctrl: Frame %u acknowledgment timeout\n", frame);
>> +			xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>> +				   "sysctrl: Frame %u acknowledgment timeout\n", frame);
> ditto
>
>>   			sc->phase_bit = 0;
>>   			return -ETIMEDOUT;
>>   		}
>> @@ -194,7 +198,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>>   	int ret;
>>   
>>   	if (!sysctrl_wait_bit_set(sc, SYSCTRL_MB_CTRL_RUN_BUSY_OUT, timeout_ms)) {
>> -		xe_err(xe, "sysctrl: Response frame timeout\n");
>> +		xe_log_err(xe, SYSCTRL, -ETIMEDOUT,
>> +			   "sysctrl: Response frame timeout\n");
> ditto
>
>>   		return -ETIMEDOUT;
>>   	}
>>   
>> @@ -249,13 +254,15 @@ static int sysctrl_receive_frames(struct xe_sysctrl *sc,
>>   	if (!XE_SYSCTRL_HDR_IS_RESPONSE(hdr) ||
>>   	    XE_SYSCTRL_HDR_GROUP_ID(hdr) != XE_SYSCTRL_HDR_GROUP_ID(req) ||
>>   	    XE_SYSCTRL_HDR_COMMAND(hdr) != XE_SYSCTRL_HDR_COMMAND(req)) {
>> -		xe_err(xe, "sysctrl: Response header mismatch\n");
>> +		xe_log_err(xe, SYSCTRL, -EPROTO,
>> +			   "sysctrl: Response header mismatch\n");
> ditto
>
>>   		return -EPROTO;
>>   	}
>>   
>>   	if (XE_SYSCTRL_HDR_RESULT(hdr) != 0) {
>> -		xe_err(xe, "sysctrl: Firmware error: 0x%02lx\n",
>> -		       XE_SYSCTRL_HDR_RESULT(hdr));
>> +		xe_log_err(xe, SYSCTRL, -EIO,
>> +			   "sysctrl: Firmware error: 0x%02lx\n",
>> +			   XE_SYSCTRL_HDR_RESULT(hdr));
> ditto
>
>>   		return -EIO;
>>   	}
>>   
>> @@ -381,7 +388,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>   				      cmd->data_in, cmd->data_in_len,
>>   				      &mbox_cmd, &cmd_size);
>>   	if (ret) {
>> -		xe_err(xe, "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
>> +		xe_log_err(xe, SYSCTRL, ret,
>> +			   "sysctrl: Failed to prepare command: %pe\n", ERR_PTR(ret));
> ditto
>
> and drop redundant %pe as xe_log_err() will also print that error

Sure, will update in next revision

Thanks,

-/Mallesh

>>   		return ret;
>>   	}
>>   
>> @@ -391,7 +399,8 @@ int xe_sysctrl_send_command(struct xe_sysctrl *sc,
>>   				   cmd->data_out, cmd->data_out_len, rdata_len,
>>   				   XE_SYSCTRL_MB_DEFAULT_TIMEOUT_MS);
>>   	if (ret)
>> -		xe_err(xe, "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
>> +		xe_log_err(xe, SYSCTRL, ret,
>> +			   "sysctrl: Mailbox command failed: %pe\n", ERR_PTR(ret));
> ditto
>
>>   
>>   	kfree(mbox_cmd);
>>   
