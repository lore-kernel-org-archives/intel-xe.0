Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244C3CD4F3C
	for <intel-xe@archiver.kernel.org>; Mon, 18 May 2026 10:50:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62C710E79E;
	Mon, 18 May 2026 10:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zcxkq3Xh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B2410E79E
 for <intel-xe@lists.freedesktop.org>; Mon, 18 May 2026 10:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779101439; x=1810637439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=lplyoOBNR1SORLPkoDrF2ybw+9A0JRTsJzUxrcAtywg=;
 b=Zcxkq3XhyPCWOob2vnqqSQYMfcmg0TiHv1zS4rEnpuw4ippZTnNRjL8h
 WUMY1AHQ/kR9j9UqlX52DsghvTf/XCWpLkhrJVSC5OOaNvnei/r8Sod2N
 pf2+UB1Z8mmgFhZOLYYDWDntiv/lHIzSxWSfggZ8TmTtysWGSI+SW3zaM
 E6o6hOB44ae3q3f+P0dU3gdi06FaaTuahWeHOLu0W7FqEHPd6PUs0BHDb
 OZ8tQQfPxi3Oo8/V9Lmy8Y7C9z7EsjCJyxxj2y9bsxdRigqSJwk1OX18F
 ez48t85G3VDQA6v7JYvwMJw0dkzdA8bdRbnXeJZmEs/+nJRhLE3atlKnh A==;
X-CSE-ConnectionGUID: YSDV9gVERWqW7Lg+NBXOdg==
X-CSE-MsgGUID: ippp3466RV6c7eL2EwAIdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97381094"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208,217";a="97381094"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:50:39 -0700
X-CSE-ConnectionGUID: Yvyq9z02RnqU+2tYB/zJNg==
X-CSE-MsgGUID: KqTIobFtQ2G1NhIRqps8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
 d="scan'208,217";a="238395630"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 03:50:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:50:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 03:50:37 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 03:50:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mheJtftiPPZ9cFi5eKqJrJ8NIUHKbRb4h+ZLdkV+x7fPA1rPqFwhNAH2HHamUfcxs4ZNSEZgbKq2JUE3X9BbSy1wIdyjDs4rGsizGG50u2u++H+7s2ojDmqWy6ZlEN8IjbL04BjK2D6n0a7pOtn6CeWBf+zEzfB+rBl/1Tdj5SibN2qhZnV4F2TCbOTpb2ToTB4sjyWEm7I3Ay3AE4hPMknVvuLyGMjkOnqzocmdtYK1Illv4VOVU5ZLNTgzDseaBdOeVDVkRGtFzL7hQ4U9Xp8iZuaaRXATmZQ4S4WfA3yXuJKDW7WvuH8baYAkhINhCvFr7+Qr2/hVV3RMJtIr5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWJScyHgWRENWmezbti4YQbAqbIuliRYXei+E9VOvR0=;
 b=MVd2q1t0s/4euQE3qhGHfGH/OwdE0W+F0AqnQfwvmNh7q0DM15XGzqR3y+hoiOv8FGf/5LEkbQhpRYQ7lDqWOd0e9cdhIfv5S+EfhXdbXIzJN/hcWITLSyAfJcc3LtGoj7dfVbmXVXYhrQMBv75jazMrsrZ5gZu9DjOilk5BagoMhOXbI/3BCY9vX3D2Edw/knW6st6N3WNHCGeWLEG/0sWom0MU90WZjuYuFjz4vaRHaENbYv8Mioy9Z+cI6spLUIqG1iaIpbORQW3x/T2QcuycdzL5SCG9a9Egh+hwUMS2QS+ezJqAFrrxw4QbvwAfak3+iR1AAfj+pI3joWIE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH8PR11MB6755.namprd11.prod.outlook.com (2603:10b6:510:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 10:50:33 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 10:50:33 +0000
Content-Type: multipart/alternative;
 boundary="------------eXJBI0Vg00I0yxX78A3X7mc0"
Message-ID: <4912daa7-8400-4485-ad38-18da26174583@intel.com>
Date: Mon, 18 May 2026 16:20:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/14] drm/xe/xe_ras: Add support for uncorrectable
 core-compute errors
To: Riana Tauro <riana.tauro@intel.com>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511172908.1122252-16-riana.tauro@intel.com>
 <20260511172908.1122252-23-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260511172908.1122252-23-riana.tauro@intel.com>
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH8PR11MB6755:EE_
X-MS-Office365-Filtering-Correlation-Id: 8491f94f-3604-4ad0-e54f-08deb4cb4954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|3023799003|56012099003|18002099003|22082099003|4143699003|11063799003;
X-Microsoft-Antispam-Message-Info: TlSFnL7i22RMcKji/PoVmnwsNszPSUtd7bsBca7JvKptJvg0YFIgJ011EJVgnxKEgxU+Fc81W5VrqOhjLKmYHfus1L1GD20ll4zCQdS+zRYbE6SbdbJudVf7RsVsCLv24kOuhEk9Hplf8YEsObBQalZec6iXaj9DG1tTpzRE6RZ11xDQf12miQDvjgQs5wxTUttUqc+FkZ2GKFt8wU3NtoqA/49bv3NTin5C4yBeeL+OijzU/TqEh3ZzQG+a7olcem8a7WASCtnrbd/cCJxOwBD205PGnRqJqxL9+Xet371Jp10n9bns4Al8FXO+yZphRTbKbKg84IOkyPIHdBGZ90nRx1mZXYIE9zThfRPsJHxEoSxuqKzOnGACQjfMuAN0H5wSxAse3zgN6K2BZUHReazhIz5pQH9aYXLIXvgN36B+Riw2Zy9FBneWiQJ6mFjiH2tkeT978WO+NX/kYaYemtxm7rVxzk7RbzVID4yr4Xw4bOa0KAWE1Qsqel8Ogb3E6Hf7934v1B4XPr02wgxIZu6akEU0FvdTwWaEu8z62OYlrZ3mHvydGE82x6RIDxcSU6MdPimGr6zycA3u5jJAMeit4euVSjGlJ+YEYh8OqS4CTWmivZm5cGAq6dHTlvN5T3498MIeoo/HuEzfJ5IsIU5tRyGsJPIg/e+KQ0pOozfw5KZQqNsUY1lk5fpsrYAG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(3023799003)(56012099003)(18002099003)(22082099003)(4143699003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzVQNnpHenBFQXB2ckVSYUg3cW1SekI2aEk4MXBCU295anR1Q1c4MUZnRVBU?=
 =?utf-8?B?cHhQK2czV01UbVErYjdwUGVVb2d0TEZMUmhNUWVXWnl1SHZsck5XSHZpTXpT?=
 =?utf-8?B?V1A4MHJPSTY5ajRLdDJLNzBBdXZUOHQ1ejduL1ptWmwrWDRHQVVvZ3kyVyt3?=
 =?utf-8?B?aEJ4Vk9la2JYZEhRUUxPcmZFTmt6dGp4RUluLzNnTFJJSWZ4Rk9FRUVoNTBx?=
 =?utf-8?B?RS8zdFU5UThiN0R0R3NDdllKZmNHYVdGQVNpaDZkTHNLVW0ybjlCSFhEb3VZ?=
 =?utf-8?B?MHVNZmJGY0hoNGgwYnNPc2FiZlN0bGdNY2lESmZFUkpVd1NkYlJ5MDBEQ29R?=
 =?utf-8?B?Z2RlVXZRRUl6RzMwV0xZSGg3UHJPREIxZEIwalNqd0krOUwwbVlKQ3JGTkJF?=
 =?utf-8?B?YllYclp3c1BhTVFmZDcwMjBvY25xbm1MR09OSmFuQTBJTWhGaDdpS1hLNDhr?=
 =?utf-8?B?K296SmZKY2ZrWFJVY1ZIS1VqWTJBSmtTR1BRQUo5QUt6VjU4R1RjT2NMODh3?=
 =?utf-8?B?MWRLQXg1SkhwR0tzaDQxMmhkSWs4dlRDOFM2dXFOb3Z6ZnI2RWpnQTBvNjJX?=
 =?utf-8?B?WUh2L3lNZjl2UTdDb0NSNzlrbU1PR3RweGdGUlQvSFl2UWVDemdNT05KM2RO?=
 =?utf-8?B?OWRLSzIwdC9Jd1hjODI2Z2lmVjRGVE40SmFVdmZzRzh2dmdLb05NZTM0d3Zx?=
 =?utf-8?B?b3RzRFFCeTJuSVd2bkFVdXFiVGhqNkNYNzF4Q3ZBWVNwQmZ3ZmtzNlYrZXBa?=
 =?utf-8?B?WldrYk9VT2RrUzFiYVNsSWk1Nytlb0s2aWI1R1lnelI0WklKUEkvR0hvNTdv?=
 =?utf-8?B?aEs2QVJMZm92WWhpWW01QXY1a25Oa3lCajcza1htdFRLTkdBTHU2bWEwTm9D?=
 =?utf-8?B?UTcwcFp2RSttKzVJKzF3Ulp6Ryt0ZWx0MzlWaFNGQktvT0ZkamwzNWN6MnRx?=
 =?utf-8?B?M1o2N2FRT1FYT01OckRnQWl6WW5RdHJDL2YrT2FpUW41OEx5U2RMTEpmZGpS?=
 =?utf-8?B?M2MyMUVRSzR2YzdOSkVrcC8vNWNlTU5rZXdhTkFpVXU1NVhnOUJHRC9Vc1BR?=
 =?utf-8?B?cElBYW55TGRDckdTeHR5SzF5cEVaUW1vU09RQUZ2eU82RitkTE5XY1lZY2NK?=
 =?utf-8?B?L1dVNUZ6c2pMaUdsMUp6am8vVW9nQkNCTzJrU2ZiNEZ6TXQzcDhwVStFQnJI?=
 =?utf-8?B?Z2QrZHhvVVhrajJFWVV2bVdpOGNlQUozeEJYV24xeXlTalByQ3A2eHdIYXVR?=
 =?utf-8?B?YnpzRWMwNExscXF1d04rRzc4SDdJMW5RUGw2aFo2MnJTNkxxYXM3eXhVK0RQ?=
 =?utf-8?B?a0MyYjdtK3ZOV0RuRGQ3REU4b1RLUFlHOGxNdWdEbm8wMVZTblhyemxYZmt2?=
 =?utf-8?B?TFYvZUdtT1B5S3pWQzdBdGlFKzNvTDhxZ3hDL1FxTmVCZmVuTzQzcTc1VHdF?=
 =?utf-8?B?TlFSbzdxZXJaanZ1b2JyY0VheVozTWhmeitIV2NXZ0d3WUpZeC9lVk56bFIy?=
 =?utf-8?B?ZUtRZGlQWFJvbFllejc5ZzZqaHRuTUp0Undpa2VRaXpQWG9LazJYaDcwNHFL?=
 =?utf-8?B?MEtGWGYrSklveWJ5b3VJa2pKUHNwUDNlQXdVOUR1RFBQVVJPSEcrMmg1UVBN?=
 =?utf-8?B?bE8vSmZUYnVWU0Z4eTZNdnlac3Q4SXN5S01BR2pHMmM4U2JsYnBHVEVZVGZG?=
 =?utf-8?B?aUw4WldFc3E5MUlQczRVSlp0TUVoekxFS2hxdGRnWmYweHROS24vNDhGVzVI?=
 =?utf-8?B?QWkxdWR1S3MvNUpjUll2YmJtcFNyaDAvSnNqaDdzMWxVa1pnSWhSWU53R2hn?=
 =?utf-8?B?aXRPbTdiSE51dFpZTGhBYkF6NkFhZ210bWdLRUlOSVF0NE9MUWpkNFh2dy9C?=
 =?utf-8?B?TjhxTjIzWkNJNFdROWcxQWEvVE80bGUvQ3F2d3ZBLzMyYXVFVmxEaHdUUUIv?=
 =?utf-8?B?UmxnaU1ydDhvWm1PRUJQZTVzRUdxQmdzWjlkcmhyMk0xRkFFUENSb0F3MU41?=
 =?utf-8?B?QTlQZHRLSjlkVzltMWtXN29EK0VWM20xMURCSE0yaWpQRnNqNGRqTUxSRStI?=
 =?utf-8?B?VEdJcUsyaTl5TXlNSWN4VkR0dllvMGUyMitGa2l6WnNYMFhhUXlJQXRIZE4v?=
 =?utf-8?B?MFc5TWJRN2NSY2hjRkRJU0orbk5rR01DTkJrUXpDdm5zc2pGazJFR3hqM2Fw?=
 =?utf-8?B?NW8vZitLQWg3Z29FYWJiOGVJU2lwQnh2dDlEaklEUWpTQUhwb01HT0RKSHhj?=
 =?utf-8?B?MDJNcXJYbmxFYnBKOHdtcXRPckMvVzFoTiswelpGYkEwME5qcXRMOVRwL3lw?=
 =?utf-8?B?dmg1SWFsM2NCZ0kya1daUlBjWjJVdVg1WWd2UmxmL3lUWURyVFc3NUdSZ1M5?=
 =?utf-8?Q?5laN+VRlbsuRuWfA=3D?=
X-Exchange-RoutingPolicyChecked: ZO3eeQHYtwhDT5+bJsPwNSe3mI3hjO1/FUti6YippwZySD30Tbwfw7wsn+TKVKGUwV7jcilxJYRLrLzguYOBbR8P4Ld+7GuOkFP12wNOqRKV49FAN5IWSXfOp2qxenh8Y6WUSX031bVmOO01ZvXhLLOugj7Q7tK5h/mg7q60zRtr4o27xctLfmNw13+ykJNRFCX91ZNYWwc5JpdLqRW3ouFLHsoTPKfpD7CjxkqWPaQW/KoLIEY1C9vI/SbqSCgBw/Tve09D98ad6SYMOgeRyXDXX5/MUbCdX9BjZKuaKWGTzEiuJmqEbenk0MWSnhpKnlMsoLMISSoLDrRXsXfmRQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8491f94f-3604-4ad0-e54f-08deb4cb4954
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 10:50:33.6507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iwEZGe4qCV4sQr8lTyjO61GuQj8FpMFn4uuzEr0Bf56Bfh9DiGbrxScD+NGfvcGvhsmTl4JE8885aSYgU5hsMSnO3r+ebt6XolLv5Qof8+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6755
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

--------------eXJBI0Vg00I0yxX78A3X7mc0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-05-2026 10:59 pm, Riana Tauro wrote:
> Add structures and command for get soc error and process uncorrectable
> core-compute errors.
>
> Uncorrectable core-compute errors are classified into global and local
> errors.
>
> Global error is an error that affects the entire device requiring a
> reset. This type of error is not isolated. When an AER is reported and
> error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.
>
> Local error is confined to a specific component or context like a
> engine. These errors can be contained and recovered by resetting
> only the affected part without disrupting the rest of the device.
>
> Upon detection of an uncorrectable local core-compute error, an AER is
> generated and GuC is notified of the error to trigger engine reset.
> Return recovered from PCI error callbacks for these errors.
>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
> v2: add newline and fix log
>      add bounds check (Mallesh)
>      add ras specific enum (Raag)
>      helper for sysctrl prepare command
>      process all errors before deciding recovery action
>
> v3: remove TODO from commit message
>      remove redundant rlen check
>      fix loop
>      add check for sysctrl flooding (Raag)
>      do not use xe_ras prefix for static functions (Soham)
>
> v4: remove rlen initialization to 0
>      remove local variable
>      add error message for length mismatch (Raag)
>      reset on sysctrl flooding
>      fix sysctrl flood condition
>
> v5: rebase
>      modify log and move it to process_errors
>      modify sysctrl flood check
>      remove whitespace
>      simplify structure (Raag)
>      fix typo in commit message
> ---
>   drivers/gpu/drm/xe/xe_ras.c                   | 126 ++++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras.h                   |   3 +
>   drivers/gpu/drm/xe/xe_ras_types.h             |  55 ++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>   4 files changed, 186 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 24642c309967..ecadad5857b2 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -9,6 +9,11 @@
>   #include "xe_ras_types.h"
>   #include "xe_sysctrl.h"
>   #include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +#define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
> +#define  GLOBAL_UNCORR_ERROR		2
>   
>   /* Severity of detected errors  */
>   enum xe_ras_severity {
> @@ -66,6 +71,38 @@ static inline const char *comp_to_str(u8 component)
>   	return xe_ras_components[component];
>   }
>   
> +static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
> +				u32 cmd_mask, void *request, size_t request_len,
> +				void *response, size_t response_len)
> +{
> +	struct xe_sysctrl_app_msg_hdr hdr = {0};
> +
> +	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
> +
> +	command->header = hdr;
> +	command->data_in = request;
> +	command->data_in_len = request_len;
> +	command->data_out = response;
> +	command->data_out_len = response_len;
> +}
> +
> +static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *xe,
> +							      struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr->error_details;
> +	u8 uncorr_type;
> +
xe parameter is not used, please remove it
> +	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info->error_log_header);
> +
> +	/* Request a reset if error is global */
> +	if (uncorr_type == GLOBAL_UNCORR_ERROR)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
We can use GLOBAL/LOCAL/default (unknown) as switch and log the error 
type for easy to triage.
> +	/* Local errors are recovered using an engine reset by GuC */
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -92,6 +129,95 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   	}
>   }
>   
> +/**
> + * xe_ras_process_errors() - Process and contain hardware errors
> + * @xe: xe device instance
> + *
> + * Get error details from system controller and return recovery
> + * method. Called only from PCI error handling.
> + *
> + * Returns: recovery action to be taken
> + */
> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_command command = {0};
> +	struct xe_ras_get_soc_error response;
> +	enum xe_ras_recovery_action final_action;
> +	u32 count = XE_SYSCTRL_FLOOD;
> +	size_t rlen;
> +	int ret;
> +
> +	if (!xe->info.has_sysctrl)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	/* Default action */
> +	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
> +
> +	prepare_ras_command(&command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
> +			    &response, sizeof(response));
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get soc error %d\n", ret);
> +			goto err;
> +		}
> +
> +		if (rlen != sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected get soc error response length %zu (expected %zu)\n",
> +			       rlen, sizeof(response));
> +			goto err;
> +		}
> +
> +		/* Report if number of errors exceeds the maximum errors supported */
> +		if (response.num_errors > XE_RAS_NUM_ERROR_ARR)
> +			xe_err(xe, "sysctrl: number of errors received %d out of bound (%d)\n",
> +			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
> +
> +		for (int i = 0; i < response.num_errors && i < XE_RAS_NUM_ERROR_ARR; i++) {
> +			struct xe_ras_error_array *arr = &response.error_arr[i];
> +			enum xe_ras_recovery_action action;
> +			struct xe_ras_error_class error_class;
> +			u8 component, severity;
> +
nit:We can directly read arr->error_class.common.component, no need of 
local copy.
> +			error_class = arr->error_class;
> +			component = error_class.common.component;
> +			severity = error_class.common.severity;
> +
> +			xe_err(xe, "[RAS]: %s %s detected\n", comp_to_str(component),
> +			       sev_to_str(severity));
> +
> +			switch (component) {
> +			case XE_RAS_COMP_CORE_COMPUTE:
> +				action = handle_core_compute_errors(xe, arr);
> +				break;
> +			default:
> +				/* For any other component, reset */
> +				action = XE_RAS_RECOVERY_ACTION_RESET;
> +				break;
> +			}
> +
> +			/* Process and log all errors and then trigger highest recovery action */
> +			if (action > final_action)
> +				final_action = action;
> +		}
> +
> +		/* Treat flooding as an system controller error */
> +		if (!--count) {
> +			xe_err(xe, "[RAS]: sysctrl: get soc error response flooding\n");
> +			return XE_RAS_RECOVERY_ACTION_RESET;
> +		}
> +
> +	} while (response.additional_errors);
> +

What happen when firmware return num_errors=0 (or additional_errors=0), 
default final_action = XE_RAS_RECOVERY_ACTION_RECOVERED is that fine?

Need to handle empty payload as well.

Thanks

-/Mallesh

> +	return final_action;
> +
> +err:
> +	return XE_RAS_RECOVERY_ACTION_RESET;
> +}
> +
>   #ifdef CONFIG_PCIEAER
>   static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
>   {
> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
> index a88ea0a46766..cdaad3114dae 100644
> --- a/drivers/gpu/drm/xe/xe_ras.h
> +++ b/drivers/gpu/drm/xe/xe_ras.h
> @@ -6,10 +6,13 @@
>   #ifndef _XE_RAS_H_
>   #define _XE_RAS_H_
>   
> +#include "xe_ras_types.h"
> +
>   struct xe_device;
>   struct xe_sysctrl_event_response;
>   
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response);
>   void xe_ras_init(struct xe_device *xe);
> +enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index 4e63c67f806a..e97026fd6ff9 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -8,8 +8,27 @@
>   
>   #include <linux/types.h>
>   
> +#define XE_RAS_NUM_ERROR_ARR			3
>   #define XE_RAS_NUM_COUNTERS			16
>   
> +/**
> + * enum xe_ras_recovery_action - RAS recovery actions
> + *
> + * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
> + * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
> + * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
> + * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
> + *
> + * This enum defines the possible recovery actions that can be taken in response
> + * to RAS errors.
> + */
> +enum xe_ras_recovery_action {
> +	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
> +	XE_RAS_RECOVERY_ACTION_RESET,
> +	XE_RAS_RECOVERY_ACTION_DISCONNECT,
> +	XE_RAS_RECOVERY_ACTION_MAX
> +};
> +
>   /**
>    * struct xe_ras_error_common - Error fields that are common across all products
>    */
> @@ -70,4 +89,40 @@ struct xe_ras_threshold_crossed {
>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>   } __packed;
>   
> +/**
> + * struct xe_ras_error_array - Details of the error types
> + */
> +struct xe_ras_error_array {
> +	/** @counter_value: Counter value of the returned error */
> +	u32 counter_value;
> +	/** @error_class: Error class */
> +	struct xe_ras_error_class error_class;
> +	/** @timestamp: Timestamp */
> +	u64 timestamp;
> +	/** @error_details: Error details specific to the class */
> +	u32 error_details[XE_RAS_NUM_COUNTERS];
> +} __packed;
> +
> +/**
> + * struct xe_ras_get_soc_error - Response from get soc error command
> + */
> +struct xe_ras_get_soc_error {
> +	/** @num_errors: Number of errors reported in this response */
> +	u8 num_errors;
> +	/** @additional_errors: Indicates if the errors are pending */
> +	u8 additional_errors;
> +	/** @error_arr: Array of up to 3 errors */
> +	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
> +} __packed;
> +
> +/**
> + * struct xe_ras_compute_error - Error details of Core Compute error
> + */
> +struct xe_ras_compute_error {
> +	/** @error_log_header: Error Source and type */
> +	u32 error_log_header;
> +	/** @reserved: Reserved */
> +	u32 reserved[15];
> +} __packed;
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> index 0fa786a9e8c8..5ccfc6325a90 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
> @@ -22,9 +22,11 @@ enum xe_sysctrl_group {
>   /**
>    * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
>    *
> + * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
>    * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
>    */
>   enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>   	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
>   };
>   
--------------eXJBI0Vg00I0yxX78A3X7mc0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11-05-2026 10:59 pm, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260511172908.1122252-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">Add structures and command for get soc error and process uncorrectable
core-compute errors.

Uncorrectable core-compute errors are classified into global and local
errors.

Global error is an error that affects the entire device requiring a
reset. This type of error is not isolated. When an AER is reported and
error_detected is invoked return PCI_ERS_RESULT_NEED_RESET.

Local error is confined to a specific component or context like a
engine. These errors can be contained and recovered by resetting
only the affected part without disrupting the rest of the device.

Upon detection of an uncorrectable local core-compute error, an AER is
generated and GuC is notified of the error to trigger engine reset.
Return recovered from PCI error callbacks for these errors.

Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
v2: add newline and fix log
    add bounds check (Mallesh)
    add ras specific enum (Raag)
    helper for sysctrl prepare command
    process all errors before deciding recovery action

v3: remove TODO from commit message
    remove redundant rlen check
    fix loop
    add check for sysctrl flooding (Raag)
    do not use xe_ras prefix for static functions (Soham)

v4: remove rlen initialization to 0
    remove local variable
    add error message for length mismatch (Raag)
    reset on sysctrl flooding
    fix sysctrl flood condition

v5: rebase
    modify log and move it to process_errors
    modify sysctrl flood check
    remove whitespace
    simplify structure (Raag)
    fix typo in commit message
---
 drivers/gpu/drm/xe/xe_ras.c                   | 126 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   3 +
 drivers/gpu/drm/xe/xe_ras_types.h             |  55 ++++++++
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 186 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 24642c309967..ecadad5857b2 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -9,6 +9,11 @@
 #include &quot;xe_ras_types.h&quot;
 #include &quot;xe_sysctrl.h&quot;
 #include &quot;xe_sysctrl_event_types.h&quot;
+#include &quot;xe_sysctrl_mailbox.h&quot;
+#include &quot;xe_sysctrl_mailbox_types.h&quot;
+
+#define CORE_COMPUTE_UNCORR_TYPE	GENMASK(26, 25)
+#define  GLOBAL_UNCORR_ERROR		2
 
 /* Severity of detected errors  */
 enum xe_ras_severity {
@@ -66,6 +71,38 @@ static inline const char *comp_to_str(u8 component)
 	return xe_ras_components[component];
 }
 
+static void prepare_ras_command(struct xe_sysctrl_mailbox_command *command,
+				u32 cmd_mask, void *request, size_t request_len,
+				void *response, size_t response_len)
+{
+	struct xe_sysctrl_app_msg_hdr hdr = {0};
+
+	hdr.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
+		   FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_mask);
+
+	command-&gt;header = hdr;
+	command-&gt;data_in = request;
+	command-&gt;data_in_len = request_len;
+	command-&gt;data_out = response;
+	command-&gt;data_out_len = response_len;
+}
+
+static enum xe_ras_recovery_action handle_core_compute_errors(struct xe_device *xe,
+							      struct xe_ras_error_array *arr)
+{
+	struct xe_ras_compute_error *error_info = (struct xe_ras_compute_error *)arr-&gt;error_details;
+	u8 uncorr_type;
+</pre>
    </blockquote>
    xe parameter is not used, please remove it
    <blockquote type="cite" cite="mid:20260511172908.1122252-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	uncorr_type = FIELD_GET(CORE_COMPUTE_UNCORR_TYPE, error_info-&gt;error_log_header);
+
+	/* Request a reset if error is global */
+	if (uncorr_type == GLOBAL_UNCORR_ERROR)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+</pre>
    </blockquote>
    We can use GLOBAL/LOCAL/default (unknown) as switch and log the
    error type for easy to triage.
    <blockquote type="cite" cite="mid:20260511172908.1122252-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	/* Local errors are recovered using an engine reset by GuC */
+	return XE_RAS_RECOVERY_ACTION_RECOVERED;
+}
+
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response)
 {
@@ -92,6 +129,95 @@ void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 	}
 }
 
+/**
+ * xe_ras_process_errors() - Process and contain hardware errors
+ * @xe: xe device instance
+ *
+ * Get error details from system controller and return recovery
+ * method. Called only from PCI error handling.
+ *
+ * Returns: recovery action to be taken
+ */
+enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	struct xe_ras_get_soc_error response;
+	enum xe_ras_recovery_action final_action;
+	u32 count = XE_SYSCTRL_FLOOD;
+	size_t rlen;
+	int ret;
+
+	if (!xe-&gt;info.has_sysctrl)
+		return XE_RAS_RECOVERY_ACTION_RESET;
+
+	/* Default action */
+	final_action = XE_RAS_RECOVERY_ACTION_RECOVERED;
+
+	prepare_ras_command(&amp;command, XE_SYSCTRL_CMD_GET_SOC_ERROR, NULL, 0,
+			    &amp;response, sizeof(response));
+
+	do {
+		memset(&amp;response, 0, sizeof(response));
+
+		ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+		if (ret) {
+			xe_err(xe, &quot;sysctrl: failed to get soc error %d\n&quot;, ret);
+			goto err;
+		}
+
+		if (rlen != sizeof(response)) {
+			xe_err(xe, &quot;sysctrl: unexpected get soc error response length %zu (expected %zu)\n&quot;,
+			       rlen, sizeof(response));
+			goto err;
+		}
+
+		/* Report if number of errors exceeds the maximum errors supported */
+		if (response.num_errors &gt; XE_RAS_NUM_ERROR_ARR)
+			xe_err(xe, &quot;sysctrl: number of errors received %d out of bound (%d)\n&quot;,
+			       response.num_errors, XE_RAS_NUM_ERROR_ARR);
+
+		for (int i = 0; i &lt; response.num_errors &amp;&amp; i &lt; XE_RAS_NUM_ERROR_ARR; i++) {
+			struct xe_ras_error_array *arr = &amp;response.error_arr[i];
+			enum xe_ras_recovery_action action;
+			struct xe_ras_error_class error_class;
+			u8 component, severity;
+</pre>
    </blockquote>
    nit:We can directly read&nbsp;<span style="white-space: pre-wrap">arr-&gt;error_class</span><span style="white-space: pre-wrap">.common.component, no need of local copy.</span>
    <blockquote type="cite" cite="mid:20260511172908.1122252-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			error_class = arr-&gt;error_class;
+			component = error_class.common.component;
+			severity = error_class.common.severity;
+
+			xe_err(xe, &quot;[RAS]: %s %s detected\n&quot;, comp_to_str(component),
+			       sev_to_str(severity));
+
+			switch (component) {
+			case XE_RAS_COMP_CORE_COMPUTE:
+				action = handle_core_compute_errors(xe, arr);
+				break;
+			default:
+				/* For any other component, reset */
+				action = XE_RAS_RECOVERY_ACTION_RESET;
+				break;
+			}
+
+			/* Process and log all errors and then trigger highest recovery action */
+			if (action &gt; final_action)
+				final_action = action;
+		}
+
+		/* Treat flooding as an system controller error */
+		if (!--count) {
+			xe_err(xe, &quot;[RAS]: sysctrl: get soc error response flooding\n&quot;);
+			return XE_RAS_RECOVERY_ACTION_RESET;
+		}
+
+	} while (response.additional_errors);
+</pre>
    </blockquote>
    <p>What happen when firmware return&nbsp;<span style="white-space: pre-wrap">num_errors</span>=0 (or&nbsp;<span style="white-space: pre-wrap">additional_errors</span>=0), default
      final_action =&nbsp;<span style="white-space: pre-wrap">XE_RAS_RECOVERY_ACTION_RECOVERED</span>
      is that fine?</p>
    <p>Need to handle empty payload as well.</p>
    <p>Thanks</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260511172908.1122252-23-riana.tauro@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	return final_action;
+
+err:
+	return XE_RAS_RECOVERY_ACTION_RESET;
+}
+
 #ifdef CONFIG_PCIEAER
 static void aer_unmask_and_downgrade_internal_error(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index a88ea0a46766..cdaad3114dae 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -6,10 +6,13 @@
 #ifndef _XE_RAS_H_
 #define _XE_RAS_H_
 
+#include &quot;xe_ras_types.h&quot;
+
 struct xe_device;
 struct xe_sysctrl_event_response;
 
 void xe_ras_counter_threshold_crossed(struct xe_device *xe,
 				      struct xe_sysctrl_event_response *response);
 void xe_ras_init(struct xe_device *xe);
+enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe);
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 4e63c67f806a..e97026fd6ff9 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -8,8 +8,27 @@
 
 #include &lt;linux/types.h&gt;
 
+#define XE_RAS_NUM_ERROR_ARR			3
 #define XE_RAS_NUM_COUNTERS			16
 
+/**
+ * enum xe_ras_recovery_action - RAS recovery actions
+ *
+ * @XE_RAS_RECOVERY_ACTION_RECOVERED: Error recovered
+ * @XE_RAS_RECOVERY_ACTION_RESET: Requires reset
+ * @XE_RAS_RECOVERY_ACTION_DISCONNECT: Requires disconnect
+ * @XE_RAS_RECOVERY_ACTION_MAX: Max action value
+ *
+ * This enum defines the possible recovery actions that can be taken in response
+ * to RAS errors.
+ */
+enum xe_ras_recovery_action {
+	XE_RAS_RECOVERY_ACTION_RECOVERED = 0,
+	XE_RAS_RECOVERY_ACTION_RESET,
+	XE_RAS_RECOVERY_ACTION_DISCONNECT,
+	XE_RAS_RECOVERY_ACTION_MAX
+};
+
 /**
  * struct xe_ras_error_common - Error fields that are common across all products
  */
@@ -70,4 +89,40 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
+/**
+ * struct xe_ras_error_array - Details of the error types
+ */
+struct xe_ras_error_array {
+	/** @counter_value: Counter value of the returned error */
+	u32 counter_value;
+	/** @error_class: Error class */
+	struct xe_ras_error_class error_class;
+	/** @timestamp: Timestamp */
+	u64 timestamp;
+	/** @error_details: Error details specific to the class */
+	u32 error_details[XE_RAS_NUM_COUNTERS];
+} __packed;
+
+/**
+ * struct xe_ras_get_soc_error - Response from get soc error command
+ */
+struct xe_ras_get_soc_error {
+	/** @num_errors: Number of errors reported in this response */
+	u8 num_errors;
+	/** @additional_errors: Indicates if the errors are pending */
+	u8 additional_errors;
+	/** @error_arr: Array of up to 3 errors */
+	struct xe_ras_error_array error_arr[XE_RAS_NUM_ERROR_ARR];
+} __packed;
+
+/**
+ * struct xe_ras_compute_error - Error details of Core Compute error
+ */
+struct xe_ras_compute_error {
+	/** @error_log_header: Error Source and type */
+	u32 error_log_header;
+	/** @reserved: Reserved */
+	u32 reserved[15];
+} __packed;
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index 0fa786a9e8c8..5ccfc6325a90 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -22,9 +22,11 @@ enum xe_sysctrl_group {
 /**
  * enum xe_sysctrl_gfsp_cmd - Commands supported by GFSP group
  *
+ * @XE_SYSCTRL_CMD_GET_SOC_ERROR: Retrieve basic error information
  * @XE_SYSCTRL_CMD_GET_PENDING_EVENT: Retrieve pending event
  */
 enum xe_sysctrl_gfsp_cmd {
+	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
 	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
 };
 
</pre>
    </blockquote>
  </body>
</html>

--------------eXJBI0Vg00I0yxX78A3X7mc0--
