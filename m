Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEF0CD98E4
	for <intel-xe@archiver.kernel.org>; Sat, 20 Jun 2026 17:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E88910E234;
	Sat, 20 Jun 2026 17:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zl9Lkpqf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4792710E234
 for <intel-xe@lists.freedesktop.org>; Sat, 20 Jun 2026 17:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781974934; x=1813510934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NUuQ26l+2mizxfRYf1pUSRWJ1Pr5mHBevuls3sLR0NA=;
 b=Zl9LkpqfGgM8yi09LoFRrEnz+0Jlm+YS+Tag2iYZ39i1bpt545Woxxv/
 iAdX5dV82V8/ifymeIhBG7U7Q8PNucI+yYtGfu9V46/NJJo1ME+jCwzqx
 sCRZgVm1a5CNrqVn29yWjxK5m02Er3nYDQO0iNuIpqN3E9i6z0p2DEApy
 8wvUnMG1K51ydSr84z8fBedhk/VhgCTBHOnvrZd5S7QbcLD73SCzSxkjV
 iZTY1lTYoQisg6B5Bncn1w/6lZMGmwbfEdyvnvdjMQNXiwNVuSJWQBX0w
 dpg7i9M1TRAeyDS3rpfm2L6AXZS/7Wrkhi5ZMff7wRhglRGsR69Khxx5l Q==;
X-CSE-ConnectionGUID: io/ueMAhQ92sh3kncVi3jA==
X-CSE-MsgGUID: oOE7r/dKQnG6bo/+/61KYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11823"; a="93368324"
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="93368324"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 10:02:13 -0700
X-CSE-ConnectionGUID: 5UyT5AWJRhSkXZqH8BDIrg==
X-CSE-MsgGUID: eJmW9YJuS3ynEyEKPZ9bYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,215,1774335600"; d="scan'208";a="247975385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2026 10:02:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 10:02:13 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sat, 20 Jun 2026 10:02:13 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sat, 20 Jun 2026 10:02:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJO8nV9Lv0pE908hYKUFHxs6CEnvZUmY35wikMpfBng51KR6MxZW1U4OxngW9M7H/YcPql0AOmLJZ4XSFqcyiox8gG5CCxvjT3XXY9sBlet/w+s/0M2TW+IKbuseJ3jHdB0MlfuknnEVmwxVSbbSY87RNhXRKfPz7jS7ufTXOY6GPhxzG1K4530up+CQwXkFRNrYvZGyLfvBtofkqJteu5CP+2pMW1vgBl8N/zjaTHaoHeRzZDapPQR93+FpPPGurPCH9DnkHdV0VA4SRYpA2mtYOdyAUj3iI3j2JwC42MVIxvFrn6GxSLOWBiraa9CsfTHRh0MejmX/IZ44N3HhiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mppY7dUb1COSjx3DmtEjy3bgH6c7jMGltY7Mw2RUnmw=;
 b=Q3vQgLmTiy1FQ7pdLfZZvGWwbClgAdjRGxXbk5g0AQeahB64xIUHQEOCLfeHpAywJr0lLZK2KtMC//yrgHDdIlWfIgJR3VIev47xbVzh5fP8ZSXvYyxOjQGYj0KDWRFSpH3jS5xgHssffUGNGsYp9Ecner7J+1Ipb+13SEbl930ARuUXPIbAQj3H1HOD7h4htkax3omhzQ9goqMG7GZ6KZ7f/WZO4pFuaymHwdDp+xmHyStcVwVI2KIB+d2skMqTuHlsB4tzUzPhlWQ2xBHzSblDH3h1U8mcgeRd2w8hBsgbnvH+x60iogkpF/NFkWTbCGVEnWk4U60muNaDAL5AWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CYYPR11MB8306.namprd11.prod.outlook.com (2603:10b6:930:c6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 17:02:10 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0113.015; Sat, 20 Jun 2026
 17:02:10 +0000
Message-ID: <db58c7ea-8d55-40c6-9fc7-b69878a02505@intel.com>
Date: Sat, 20 Jun 2026 19:02:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/3] drm/xe: Add error Signature IDs for RAS logging
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <thomas.hellstrom@linux.intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20260617104711.79646-5-mallesh.koujalagi@intel.com>
 <20260617104711.79646-6-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260617104711.79646-6-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0099.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::40) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CYYPR11MB8306:EE_
X-MS-Office365-Filtering-Correlation-Id: 087a3036-0296-4d11-4640-08deceedaaff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|4143699003|18002099003|11063799006|22082099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: WuhfeepKN+WvNeNxTgVn5D/WyN5trYnC5OlB+mokQujA4j5xZcDMmWgvKXhtqilBrgtQCSLNeH3mRmFogXP9/r+IG+yA14TPlzc8hXr+0O+dQvXdxMd3VWcO3m+LZCz6HnIBFqjmUBLSqJFZl0Qeo1o9SQq/deFAyYWhZH7hqavY+TINFJJ6BdvRTr5qWgyNyAfeQmF0ChEropRPN1pvy/6jMdHcMaMsN0VHyUNS/gVodqtXCJ0e6ltMmR0mlvlN3Ow1vC06GuCcpUzbZ4m/AsNX5gtonetSiY1qwpUoJ5Xai8AXz/gTtrtntuizM1A7qU+egviCY91WRRfbb1woo0Bpu1fX9DktKkuxB86bmCWCslfhC5Km0FTtyEs3MdToGcRFUM5VqyPH4oA5YVNvxr/Dl59d3Tjvh0t9Vutv0E28gKnU13O6LgYs5LMTjF2TQ7PiocjQp97LVQmOoCvS+RbP5xiGkAHd5y8wS2EqrYsFam9faNiFhWl1HbaTLNFkxfXd9OwOddC/TsPRiK72QA0u5HqAVAAPCyOWukGtGE/SSBcdBcunmPYweBjylOKXQ+Bjrqoq/jepODEjUn1rhn+OdJJ35aS708R0oEwJg3wQ0ST3ooPh+xYqNZSkjWY5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(4143699003)(18002099003)(11063799006)(22082099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJYdCt2SURwalMwUzBKWTFNMGthTXJaRmNZakFPcG1Qck8xb0t2S3ZvRkcw?=
 =?utf-8?B?elhGaFNuMW04UXZUNkJLdHRwUk56MEV2L0FsNFgzUXhaU0p1a3Z2WUtUK0d0?=
 =?utf-8?B?NXJ3bHhKenpnYkpzTzlmaTBjb1QrbjhnOXFSaUdBVUo4YU9YUzJBczhSZGR3?=
 =?utf-8?B?YkRvVUx0MUNuTTlzd21iSTcxUVovYnBzeHRmcG5BdUNHSFczek9rVy9iYmc3?=
 =?utf-8?B?ZFY0Mk16eEtTWG9mVHR0cjl2bGZHSExFYkpJK09wZ0NEYzVFUmJJdHZHbDFV?=
 =?utf-8?B?R05FOUcwajVldFRXN0RselZweDFtTm1PYUZMN3ZxVEFrRU83NWt0ZjRmdDhJ?=
 =?utf-8?B?YXdyTnpscWZmeVQyR1FpL3dwUWs4NHBkYUhGakNzbS9TUXg1ejBraWJqczA0?=
 =?utf-8?B?Ny9BeTFkTmlkU2hHWlRWZU9YNnpyR0Y0SUhyc1V2R2dZU0ovZ0RDOWcxaUJN?=
 =?utf-8?B?TDMvYnRBeEp5VWJpSDFJUitsc1UrRE9jc0ZiUEFBNkNlOWtkNURMb3gzRGdN?=
 =?utf-8?B?U3g2dTV6bXpTc2FUZWIxNWdSQVRqdFlPd2FHL2NDeDVDcWJxSGJ0K1RldWtn?=
 =?utf-8?B?L2ZXWEFINHZKTHN5Y3ZpUmZsRVRDN244a3ozRFR0N0tsaHYwYmtHZHY1U3JY?=
 =?utf-8?B?K2VxNnM5Z0ZKNGtMeXJ4NXlFNit1T2VuWGJPYklIRjlGY2h4T2RQdVhJVWJ2?=
 =?utf-8?B?Zk1Scys1bnYwb05ZMWUrc2lrcTREVFNya0RUSUdhVHBpbFFPNUdtOGFBNkls?=
 =?utf-8?B?eVIwTlloLy9EODA1UWd3ZWRyMlZKQ2dtKzhVendhcFVqQnh3T29UbWN6TzZr?=
 =?utf-8?B?ZjFxL0pqSzROWW5hbkdiNDRRQW1qL1J4V2ZVY0NpZlhIY2h1V1h0U3VZM2Nu?=
 =?utf-8?B?UHV6cEFCOGdXMExqSnRtU3V4UG80WGxNYmZnT1J3czFHTVhxZDk3YWNvQ1JH?=
 =?utf-8?B?dlIwdUxwZjNDaFZvZHU2anVRUFQyeGg5V1pCKzFVeGNWTWRQN1NxMk5EUDFj?=
 =?utf-8?B?L1ppeGY4T0c5L2wxNnE2eEVBL1RmVmlRZFRMYWh1aWYxelZ3U1JrQnVMQU5J?=
 =?utf-8?B?R2ZkZk5SeEtrQWplSmZtVW1mNWhCNFBmUDFKNzBuREoxOW9FdUxIVUJWMUds?=
 =?utf-8?B?QldzbHpUT3Y5TUZIRUtNbFdRNE5mcDhoTTJMYjVDeGJKMG0vdGw1VnZVd1Fs?=
 =?utf-8?B?d0wvUGhTSHlVeXE0Y2Z4WnZneHZWbTJnUkM2QXFiTkZmYWQxNkpYVjBGcEN0?=
 =?utf-8?B?UWpXdkZQMnN2eGUvamRuR0gzQzQva0pUbHYwZUhhRTlndmlmUXUrMTIycUVh?=
 =?utf-8?B?QmhrRk5YQ0orMzd6bWhabUtYdmt3NmtmdC83clNNaEpuRXZuWXBiR3l5YzFE?=
 =?utf-8?B?UjZTeDZvcVl5dXRlWEgrSEVoUTBuSHA2MmgyUmJPTzd0ZzFiZjkrZkVtb0JL?=
 =?utf-8?B?N0JWaGVaMUFlS3VnMHVGS2ZwTitPUWc1STN2ZDN5RHNkdWVYdXNCT2JnNFlX?=
 =?utf-8?B?M3poNERDWE9Td0RJajZIVFA3WExlYTJBZFdQcE9NM25WcC9PMDg5ZUVEZlRH?=
 =?utf-8?B?Y1FENkh5ZWcyS1V4b3hCaGRvcTFsZnVFWUhxemJTTUJZSWYzOFVqTDNnNXli?=
 =?utf-8?B?N3lBekkwS1QySDBNSWNsaUxGTTEwRmhMNUluUUtSVmtONkNzZFl3ZVlIL01P?=
 =?utf-8?B?WHJHa2pVdHZSaCtnZElETzlGVW45a3dPZTFTbHAyQWpjNDUyRkhqcXptTDR5?=
 =?utf-8?B?c3pMc0NVbTZadFg4WEVIckZ1WEVzMHdleEI2dU9ZZE5lNFJRL1NGSVFvZU4v?=
 =?utf-8?B?YkRmUkVORk8wUllYVW84VWl3WTFjN0EzTmordTF6QmhxZFJ2bEdrbTA3Y1Bk?=
 =?utf-8?B?QjRXa1dtMmJvL3dOVnpja3FGQnZDUURsZVo1RjJRRjM3aEQxVGdWNTN6UXlG?=
 =?utf-8?B?TUh4OWMxNmdvbVl2NWFUMEVhYVI0c21QQnozekNReFNLL2pzVGtnVVdmK3Vy?=
 =?utf-8?B?cVpQeEJoQUoxUDBxZ1F5U3poTmxEbGZTNldBcjRrdDBXaUtwS0V3NXdWdnRt?=
 =?utf-8?B?WWNIa3poM3g0Zk5keG9FKzNBdnRqV2lCRFlOOWVtVHdnQzY5d08wTklXYXdy?=
 =?utf-8?B?TGZZcDRUT3E2c3gwTWlackYyVnhucXNMZmFUS1A5QmxtZnJ2Z1BjZXlHSGJx?=
 =?utf-8?B?SFFWVVVxd1ZMOXBIdEZRalBWSkF4NXozWmpJME82dExDMmFoSytvUjNBVDNt?=
 =?utf-8?B?bi9MRUJjM1BFTldBTXNxcVk1Q2RPS3hkWDlwVEg0Z3MwdFNiMDltRkhXUXls?=
 =?utf-8?B?YlZaMnBFTXQ5VFNadlBmSWQwSTQ2V2hzOWFoOVJzMHpoN21mQTh3MHN3anZU?=
 =?utf-8?Q?v9UetN5tM1t7Nc0I=3D?=
X-Exchange-RoutingPolicyChecked: inniSOgqh6dpBouAGWzOdbIIwuMYF+/TnG9rQqqhCby4aaVX8lO9yYEALAOGE5SGMNh5aQg2p2TOzno/mgXvBrsSjWSuisV3ENMgdj1XsCye1jv13Y84cB55a3HRe/XrEWf8edZDpIaWywR1HjGMtQfaDXpLGJtM3wL3irRn6JAuMfX63H8c90Rkc+wA6SAri9O7AQOv3xMvZYBsB3/cnRXHRGCh09EKRnODkbjZwUi4Wabvgr+esBkLynZp5UZr0WvQnHdU9A/GAYZgIo5Kgnn+nqqTdqIOagMm2lJRXX39bAhSXZjA9Vx26VGHw5nRlK08utIzt1UgNiyLZ4jtPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 087a3036-0296-4d11-4640-08deceedaaff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 17:02:10.6214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XENDsCG2byPNo36C2iKHMEYM6KJyd9D+fa1lcjEEJLsp+8BrSoiLIROnCjtUlqKVI6yu1MBAHXsiS0EVa233lsCJZMHYZjxuR5CEi4Nze7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8306
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



On 6/17/2026 12:47 PM, Mallesh Koujalagi wrote:
> Every GPU fault needs a stable numeric label so monitoring tools can

so the goal is to assign unique number to each GPU error that we report?

can't we teach the monitoring tools to use the message pattern instead?

or maybe it's not about unique signature but rather class of Xe GPU errors?
like HW_ERR defined in [1] for generic hardware errors?

[1] https://elixir.bootlin.com/linux/v7.1/source/include/linux/printk.h#L118

> identify what went wrong without parsing log text. 

hmm, but they will have to parse this text already to find that ID

> Add xe_sig_ids.h
> which defines those labels, called SIG_IDs.

SIG_ID looks like an acronym already - can we know the full real name?

the 'signature' suggests uniqueness, but below definitions are more like a 'class' of errors/faults
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v3:
> - Add HW SIG IDS details. (Riana)
> ---
>  drivers/gpu/drm/xe/xe_sig_ids.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sig_ids.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_sig_ids.h b/drivers/gpu/drm/xe/xe_sig_ids.h
> new file mode 100644
> index 000000000000..7badd0d7ad72
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sig_ids.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SIG_IDS_H_
> +#define _XE_SIG_IDS_H_
> +
> +/*
> + * Driver SIG_IDs

please add kernel-doc for SIG_IDs itself
maybe then it will be clear what is it

based on the "Every GPU fault needs a stable numeric label"
maybe the more appropriate name would be names like:

	XE_ERROR_
	XE_FAULT_


> + */
> +#define XE_SIG_PROBE			1  /* FATAL: probe failed */
> +#define XE_SIG_WEDGED			2  /* FATAL: device wedged */
> +#define XE_SIG_SURVIVABILITY		3  /* FATAL: survivability mode */
> +#define XE_SIG_FW			4  /* RECOVERABLE: GuC/HuC/UC/GSC/CSC/PCODE */
> +#define XE_SIG_GT_TDR			5  /* RECOVERABLE: engine hang / reset */
> +#define XE_SIG_MEM_FAULT		6  /* RECOVERABLE: VM bind, page fault, GTT */
> +#define XE_SIG_IO_BUS			7  /* RECOVERABLE: runtime PCIe/IOMMU/MMIO */

at this patch, there is no description what FATAL or RECOVERABLE (severity?) really means here
also, if there is a strict relation between SIG and its severity, then maybe those definitions should look like:

#define XE_SIG_PROBE			XE_SIG(1, FATAL)
#define XE_SIG_WEDGED			XE_SIG(2, FATAL)
...

but

> +
> +/*
> + * HW SIG_IDs
> + */

below SIGs do not have associated severity
why the same family of IDs is defined so differently?

> +#define XE_SIG_HW_DEVICE_MEMORY		8  /* Device memory errors (e.g. ECC) */
> +#define XE_SIG_HW_CORE_COMPUTE		9  /* Compute/shader core errors */
> +#define XE_SIG_HW_PCIE			10 /* PCIe interface errors */
> +#define XE_SIG_HW_FABRIC		11 /* On-package fabric errors */
> +#define XE_SIG_HW_SOC_INTERNAL		12 /* SoC-internal errors */

what's the plan for extending SW or HW SIG_IDs in the future?
as now it looks that will not be able to have new SW IDs together with old ones

and I guess the goal is to not change the IDs assignments

> +
> +#endif /* _XE_SIG_IDS_H_ */

