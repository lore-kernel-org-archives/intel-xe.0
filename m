Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9DCC3DA49
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 18:05:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B54310E8BC;
	Thu, 25 Jul 2024 18:05:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kTMjaBGE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40BE10E8C1
 for <intel-xe@lists.freedesktop.org>; Thu, 25 Jul 2024 18:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721930723; x=1753466723;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=afFsCWu35O2NXz1RRIbpAHeGh6uQnn6/7FoirEKTPgI=;
 b=kTMjaBGE0xKhoZ7zBZs+YzapF4G6doo3dLU001SqTsiwfung/Jo/CTTj
 hT+oh7EX+Jni6d+2RvapOpxA8l23pBcsyKRfivl/S+oO/mXaaBCShlNa5
 E69xYgm/JThvchTnaJmOZruYb/3ZDtZ7XcZhBTZd2sRCS6iFy8uf0SwTj
 fpzViiK3LTpHSMMVb/7OFmLALw6WzEbY5AO8O1hH3rX3Vd8KCi9F0i8sa
 xGwHBImm8/MQpsttFImubIfRoQTjG5wz2PWbqbNkx3Mh1TPYkZc3IVXZU
 fCdgrZoHqBE37hWrKdv6OdYZH2NFHtUq8m/myP/ruBhw30bgFugmBJTBr w==;
X-CSE-ConnectionGUID: prg+bQLLRh+2Cu4f6ciUYQ==
X-CSE-MsgGUID: TSoJggGHTiulkYf79kT4fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="12714585"
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="12714585"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2024 11:05:23 -0700
X-CSE-ConnectionGUID: IQKvpQajRKGd+CiIXDqnJg==
X-CSE-MsgGUID: HPBsjvZISayL3VjpbDGXDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,236,1716274800"; d="scan'208";a="90475855"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jul 2024 11:05:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 11:05:21 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 25 Jul 2024 11:05:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 25 Jul 2024 11:05:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 25 Jul 2024 11:05:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QknnYPttNqEkk9eaxGsbSipM/VMf80dtS3Zo8MOT1YDMUTlpClDFtaNgcWH00BdIqo6wvoG6S9kghMl/izK69FCbS6EV7jqhenF4M6XBGLj35nrZ+E1Iqzwhlgb0LwJZPdulMtW8oOAcO6f9fSvg+g4DiWNjzqORZYV7Kle0sHgwTw9TttF/0r3oHa8zUYv6EsfoqT38RQuFJxlHzKILHKGcJMwLwFpIB4eIHRgJFyRu1SMYxyDdFx4bnH2AYt7pPLDLc4R1T6AYz6aQ7VbwoRgx/TNqt6xFKuZISetn9QxDP6qnS6MSqBU/b+0tKS7+GdTQ60jx8JNNNSOxg57QAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qafs9UX5Tg/gBwXFj2rxC2eam09hW97yu1ltrM3IHgQ=;
 b=GNVpNsoIyVmcohvYzKHG653UEOPzcXHUqFrIsAKktnSOmLqN9lS3s4mkX8Jx/5nJR+4qbRXQShSP3W1nvfUy+MXJQYYvoJB+wkDduVKVGbc0nr4Bw/lFqOTiSZkMocZlNYuqVefa3woHLcuQrZKrJjO3AmiYF52oVzy4pBGffeWjzjtlq6QxSq7o4TYlVo0ie8ZWqSRrGMhP/1Dq2hjK+ZOyuxXNuTVdcHJI1VZRwgaClE0hFslgpWtMbfodyHPcPGGRFY7G3bttL8UgUAFy1jkjvzBmvoMOVmLYoxYVukKppsXwYK+L4eR5PrK24p8kdyxZgPVvUFdbbz6HLOkdqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4833.namprd11.prod.outlook.com (2603:10b6:303:99::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 25 Jul
 2024 18:05:16 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 25 Jul 2024
 18:05:16 +0000
Date: Thu, 25 Jul 2024 13:05:12 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, John Harrison <John.C.Harrison@intel.com>
Subject: Re: [PATCH 0/6] Move HuC and GSC FW defs for LNL and BMG to
 drm-xe-next
Message-ID: <j3n7kew46ho7ougymxut5ysv3gfwtzv2tqo3hly2gonajf6tox@py5rr52lj233>
References: <20240725003224.516233-1-daniele.ceraolospurio@intel.com>
 <tqx4jfnjgkzq3opvcdtsjcr3ivqvsw3qs3upptne37fr7afzuu@2y2ath6vpri4>
 <de2fafa3-9bf0-41c2-b9b6-b67cf3b11351@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de2fafa3-9bf0-41c2-b9b6-b67cf3b11351@intel.com>
X-ClientProxiedBy: MW4PR03CA0318.namprd03.prod.outlook.com
 (2603:10b6:303:dd::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4833:EE_
X-MS-Office365-Filtering-Correlation-Id: f0bb33e2-5d04-4023-b488-08dcacd45606
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?OscHdj7zT/ZjIwtwE1hw23zh2nlCbS5YOpFN4KIZgufjQRLRr6WAf4Larc?=
 =?iso-8859-1?Q?r01FELBFZxKgJmxKsWuwgdw2G1OHjCQWy2jBmb0C+2qq40NROYx7ud//Nb?=
 =?iso-8859-1?Q?Tv94RIC3HB37x1P3NzVK0wFQPor1HPia4cIbu+g1r1wAe4W20o7X+GHfVO?=
 =?iso-8859-1?Q?OFAMhuIJoR3pdvFDjLrGRtko/+xolIMbkkfs7Q3UCDjPJBLH79McQMYE10?=
 =?iso-8859-1?Q?mKXcvn3TGhihsNKSXpt1Uj4Qlx9W0coRgb7ZlamTve+eor9+BjGytuzVZZ?=
 =?iso-8859-1?Q?9pGfcRUlRrWqf0N3v8YwZ3p4SM6149y4WMxJwHAz4PQqEhwNtNGDYGsG1u?=
 =?iso-8859-1?Q?fe19zxZvFX4n58ZflUalVFVfw8v5MERdLILKY5doC8WPTOPHw/WBlBRNhb?=
 =?iso-8859-1?Q?B4oJfyf/39wdW1kElQ5Z+XEZ48EbW3S+z/xEgHX6IpNmVpUWVCURrIUC16?=
 =?iso-8859-1?Q?kMYZr85f9/CSNLXvloriuWydXYwKj0g+GjSjphvI9smZhJq1EqUTy+SPZV?=
 =?iso-8859-1?Q?0yZVG00NtA8MgR2ke1YmGw6nwxv3FcD0XF0ETY/ebJXX6acAMlXW4R/+Ww?=
 =?iso-8859-1?Q?kMAD9D649RySUhOeaexVeMPccwCc97gK1+H7HkzizS/Y1b3qxGgvu/+b+2?=
 =?iso-8859-1?Q?osxVNWyWHlw2MGauyaEMUar38+voICaqKgUaNS9O38hnFQ+nB6WyUgLgs4?=
 =?iso-8859-1?Q?nYDL5ipPm2hC1Zn4n1Weqezuyq3C9ny7ecstKUsp9LQHbIzBWSANJaVCFi?=
 =?iso-8859-1?Q?V20jzk/7n9hSQNBqqkPnmXsoZDXGik3X5iEf6LelAEsnC03Vl8nww0f8Bu?=
 =?iso-8859-1?Q?yuhxpWGHcioDBUVWr+3KU0R0ClWIhwFOu6Y8yMauMZF7guwMaOLueQ3+ZQ?=
 =?iso-8859-1?Q?2pPLdDbob5llox4ZDxDSPou1AcqBp4PyITKNmOMWgu3TgGyLGTtPPUa8F1?=
 =?iso-8859-1?Q?btYLEVbkNh9Av4FeHBRpipvnLKj1pk5SvZI2o7jfDPmWfUjfjHZ1sYCQhB?=
 =?iso-8859-1?Q?fnm5fPvsKL8QhhY1KskHoP/9F4fpPIrln/tA4NDjl3vl3ig4ANlF2Mxor7?=
 =?iso-8859-1?Q?YMxGDYYA6tZ36viPlRiYZnFGBTgq++fE5gE6KJ2xJsUOhqvTnk+04Kab8/?=
 =?iso-8859-1?Q?ODulfM+kDU3eDSVOE7HqNC2cvdKPLBPSccWyjtv9x0MrseC6k2DwhUxbY7?=
 =?iso-8859-1?Q?ksUdsil5H/vD5nIoOvxnj5FwpaxHcqOVx6RzI552qkWSvazTZwUdw6rpqy?=
 =?iso-8859-1?Q?GuU9E/ymDJPHJCGPM0ULwSimfwjDaLu2mq11E1O3JXpEXds7Gy3PvYJibD?=
 =?iso-8859-1?Q?mcGldHIo11MFg22S2C/FSpBg31UEc3eqLue1dP936R5DCFE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?2taTN6SXjBE5B3ZiEHgvX5t4MUhjUesK3peaKAXGWTnWYgvUe/2DqNjI0s?=
 =?iso-8859-1?Q?DkoGANw9hyWP9X22o48+1d08R02N7BSZfiUFrkfjJklG5pYx/Zcpf+QExd?=
 =?iso-8859-1?Q?cCvRnUjiVQP47d6jTxGwHnZCBzv0gm6GqboJYkUPFwivVd1G6s6DxgWa2l?=
 =?iso-8859-1?Q?iwn0w0SS4ugE2XaIybuCLeCBPK6bSpyerlRJHAWNqrC+ILPk2rC8JoBNIi?=
 =?iso-8859-1?Q?nFvktSEQB6CFrcc7sGJtIkO5Lmu92kEg6On+abGo5sK++evZ5oiwT3Tj6j?=
 =?iso-8859-1?Q?a5mrG95w9Tk1HQEjEGLxX9rs1f619KXU2nehnib30CmiSzATUKg2Bj+5LY?=
 =?iso-8859-1?Q?kwI/oWBFejOOBW74U2UufyuIVkmxr3PtPf6rIcx+D+pFu5tibvPy0U+E+X?=
 =?iso-8859-1?Q?e5v98HBoCuO5ncmU4xrbpwUAoxRj1PaLQEbs8zq3vMbt7bTchEu+cYi7K1?=
 =?iso-8859-1?Q?RT1J8TwY8Xj0mbFx3YDi5m6y4zXB7C1lt0IfVTj4RP4gHwSr0NBMOGICzf?=
 =?iso-8859-1?Q?R9/7tL4Z3jMpPeSJcA/q+E3rU0SP48SQFGGKt6z/hXFkpeVZcD79ZJBV4N?=
 =?iso-8859-1?Q?1sVPva+E3uoS6XglysvMMkAypXUukqjw+3s07EER7XtqG8V+lCoIEcIkcI?=
 =?iso-8859-1?Q?71XlhP8jiDBlGjqFaCp6R2601xAAB4Tkp+1i6h3DS1b3te/zqf657G0Fxl?=
 =?iso-8859-1?Q?3GxAfBmONoGMYB/BsYULHNqx9pvaVoYQ7Tc5bfOQ86MdG6/+XJHOCRVLzu?=
 =?iso-8859-1?Q?7ewr+siiv1fcsoT0GW+w2eTgaZCM0RVdL/lV026x6n/TWUJvC+WsAioVlY?=
 =?iso-8859-1?Q?Cf4fMzx6OnFq9BWU0HPltxswNtgNKP52aI48SNFKsWcJuIitqw464A9upO?=
 =?iso-8859-1?Q?IUOzpicVRCu5IlvBjCurarkC0o4UsG/C0jQ65ILfT670sIsCKLGr8sP4pj?=
 =?iso-8859-1?Q?dv5B3Ai06NX0cyYmptBiHyxU1C8kSMQMYyWcOURZdooigowYDVWbZ3I8WQ?=
 =?iso-8859-1?Q?Pwu13O3DsxGp1ETfFz5m/q0zaF685BUj+9d9nBM0b6UTEeIvGO0Sp+24Is?=
 =?iso-8859-1?Q?ehCxVJIuoXMNwhcjpuvQrQUP8DGKK0npHh8GPHPIQ734fEH9xtTA7aKkDU?=
 =?iso-8859-1?Q?SQ77Nb3stKE9ViDgNbrTl+cRvvQO0h3BaTlhAufpCu2awf8ctnk3JiEbLL?=
 =?iso-8859-1?Q?Wo8SNNSos9Urn7sn6TZ1hIGQst9yZmuSakW9skLUV7hLfTGAHDGC2QPT9Z?=
 =?iso-8859-1?Q?ev8efGd/f4yrlVOA6eUonBiux/fwEY2QVvmIQjhhoQxlwQy6jesUkybPqG?=
 =?iso-8859-1?Q?YV5IBtsqpfX0+NFAwTH9DvRVRXxOwb8nt5Cu39XJEupK1M77HMjBTGCWma?=
 =?iso-8859-1?Q?+mEOUdF+ms0AibDBIgkdcFfAQNuJwFOuatqc6+pFm3IpYqVkCkqZ+GIv7b?=
 =?iso-8859-1?Q?M/c4oAlJ8Yr30z9U2cDhz4i6QLrW3QlLJxr4M6kNSIPJ9jRjLcAwXzDEQq?=
 =?iso-8859-1?Q?B4e6KX5OwdHxll0M8p2178YqQE4s3ClBI8VUJrGE0vII+ubsCJiqtWT5Sg?=
 =?iso-8859-1?Q?GGuyXObXXJj7gMHcUqUVRkrKHQvvZReh//ky8dtDMv9C5xu9VAgmLSHSOq?=
 =?iso-8859-1?Q?FuAEcMhPEnYm/WClsPziv5iIfAz/qr++yyV4WrIvmurCRAf5W302yWrw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0bb33e2-5d04-4023-b488-08dcacd45606
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 18:05:16.3997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4xDlhsi7U5gn4ohIftVe7abSqPTVL+mSRqKyEuLFHoCTNWgQVxQcc8qYngWNZ63OWMeIiMTgpj+wJupwziDDAsYHAVh+EBzdAzv+Mw6APE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4833
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

On Thu, Jul 25, 2024 at 09:00:57AM GMT, Daniele Ceraolo Spurio wrote:
>
>
>On 7/24/2024 9:48 PM, Lucas De Marchi wrote:
>>On Wed, Jul 24, 2024 at 05:32:17PM GMT, Daniele Ceraolo Spurio wrote:
>>>The FW defines are currently in the for-ci branch because the FW blobs
>>>weren't ready to be officially published. Now that we have updated HuC
>>>and GSC blobs that are ready to be sent to linux-firmware, we can remove
>>>the defines from the for-ci branch and add them to drm-xe-next.
>>>
>>>Note that the 3 reverts are not meant to be merged, they're there to
>>>indicate the removal of those patches from the for-ci branch. Only the
>>>latter 3 patches are meant to be merged.
>>>
>>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>Cc: John Harrison <John.C.Harrison@Intel.com>
>>
>>not a huge fan of UFC, but the first thing that came to mind when I saw
>>this was the catchphrase "iiiiiiiit's tiiime" :) Although I still miss
>>GuC in the series, hopefully we can get it soon.
>>
>>If CI is happy, I'm happy with this.
>>
>>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>>It would be good to note, in the cover letter, where the firmware blobs
>>currently are (the commit in drm/firmware containing them) and the
>>status for sending this to upstream linux-firmware.
>>
>>AFAICS https://gitlab.freedesktop.org/drm/firmware/-/commits/intel-staging?ref_type=heads
>>up to commit 0690b69dc20da6d096450faa0c256f6896ff8365 has these 3 blobs.
>>Can you share the plan to send them to linux-firmware? Is this going to
>>happen just after having the CI results?
>
>I was planning to wait for the GuC binaries to be ready first and then 
>send a single PR to linux-firmware with all the blobs, which means 
>sending the PR either late this week or early next week. Note that we 
>usually send the PR after the patches have been merged for 1-2 days, 
>so this would be in line with that.
>
>CI is happy, so let me know if you prefer me to hold until we're ready 
>with all the binaries, otherwise I'll go ahead and merge.

nops, we still have some time before I send the pull request to
drm-next, so we are fine. Please go ahead and merge.

thanks
Lucas De Marchi

>
>Daniele
>
>>
>>
>>thanks
>>Lucas De Marchi
>>
>>>
>>>Daniele Ceraolo Spurio (6):
>>> Revert "drm/xe/huc: Define BMG HuC"
>>> Revert "drm/xe/gsc: define GSC FW for LNL"
>>> Revert "drm/xe/huc: Define LNL HuC"
>>> drm/xe/huc: Define HuC binary for LNL
>>> drm/xe/gsc: Define GSC binary for LNL
>>> drm/xe/huc: Define HuC binary for BMG
>>>
>>>drivers/gpu/drm/xe/xe_uc_fw.c | 6 +++---
>>>1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>>-- 
>>>2.43.0
>>>
>
