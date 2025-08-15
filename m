Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2629FCA0EE4
	for <intel-xe@archiver.kernel.org>; Fri, 15 Aug 2025 21:28:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAF710E9E8;
	Fri, 15 Aug 2025 21:28:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RF1K2ZNs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134E710E9C1
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Aug 2025 21:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755293316; x=1786829316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iAW5tST0PimhUfrdlBlE6hUyz69J7XSHg3CjSjjajao=;
 b=RF1K2ZNs7E7ehRnKMuu03V0VzJQakjTGpzJWLhZ3q4VhtonbdSTdWG9V
 qEamfp1SEUtVw6Zt/eGBJnL4Nmoo2/Iz8yztbMhk/tW5dAHZ0+e5MzDpy
 8gX5PkHL6FaEQnso6WJcdyYr71RRfORcmbwe7fSF7fNIsF1CnaoCGyqQi
 qgP+TRreJ2ElXe9rbJ8WOa3wLeNJTB1OZljqm9Ldvb9YMQh4roxnLv78d
 wG+LPbxlGhawC4pr6DvtDpO+SEdDcr+Oz6TfMHocSsTAyHV7WhGAXwTXP
 F13cLyPWbZGKekZnIVsfGKfjtkRkC+BtB69I9SUL3Ttc0FsJlB7IXlfp5 Q==;
X-CSE-ConnectionGUID: Kb8csCGcRy2mTfVlQL803g==
X-CSE-MsgGUID: x4Df2m6MStakj+QmH+tn1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57571849"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57571849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:28:36 -0700
X-CSE-ConnectionGUID: 2uG/Oz0nRE2s4fkd9x1vKA==
X-CSE-MsgGUID: afsyhaS4SteQ6rR2sxqbJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="198091292"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2025 14:28:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:28:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 15 Aug 2025 14:28:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.85) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 15 Aug 2025 14:28:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLMZ3bHvN5QYFEKCxY8Y8ZUG3DJsWKe1BZdb9aq4U8devbAudVpgBeeFjPY5hCn49uFdRIPw8bJisMdKgAwKUeEACQMNmaQCXB7+dU/bVFi1XjiWlikj00WoA3N/501kFU+inY61GrSoIPUdkPIN7bp0qO+D75qtr8oyLjLsYwxH+AxG5sZFWQ08N0+zs/Mxcr7jWuOqXQHUmM0cU2sanqKsZ3ml6NaJEl54/E/kqA3J1+3oTH33bVaYqni2TYfe3U00/oS1oRU4M0vwyGMjmSlli9qctKnges2foaZltEhpBXWyQgDybFnrxE4QRVxShSFVafhAPkBnUALFwXM1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vczyO1hbnvD0Cntyf4xcYvF94hkPm+MINRGkDlROOik=;
 b=yNRuE+S6ZKTHOBEvu8an9hKVjK+YmAdH9N9QzR9LHUipLPLm6griPhHpxDH1XmzQ/NVTFbP+RPGn2qvzEqg9tF5NRJWCDh9H0gMPXXeEfnq4DzAGa3XFBCP5JQsd/30wGz47xVNTOzuehv9HGn8LEgGzDUx8ovATrJ6FZKqaVSEZnBTsBKxiDLAtBj5KiY2+aAt0jNgWBoLRlGThyqf+oKRHZZj5YmyYX1bCZg0iwtyTt5B6J4wGUo32oLp9nft0VLmSZR3YBXAc3FWEKiKOURi8+0JB7PFtEauM1yO1Zl9Lp6/O3ape3bN++nartpFBuigwzhvHDw7OSk/ORslrHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by CH3PR11MB8364.namprd11.prod.outlook.com (2603:10b6:610:174::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.19; Fri, 15 Aug
 2025 21:28:32 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7%6]) with mapi id 15.20.9031.018; Fri, 15 Aug 2025
 21:28:32 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Thread-Topic: [PATCH 1/1] drm/xe: serialize store_data and user_interrupt for
 ufence wait
Thread-Index: AQHcC7a5lZyMO6lPGkW3G3CKAsUfDbRfcgYAgATDkDCAAAR7gIAAA3qQ
Date: Fri, 15 Aug 2025 21:28:32 +0000
Message-ID: <BL3PR11MB6362FB165EA94DA388BFDFEB9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20250812182846.1608209-1-fei.yang@intel.com>
 <20250812182846.1608209-2-fei.yang@intel.com>
 <aJufANNMVyeB0HMG@lstrano-desk.jf.intel.com>
 <BL3PR11MB63624BF7AAB3546C1A1920DC9A34A@BL3PR11MB6362.namprd11.prod.outlook.com>
 <aJ+hzc0Jc//MGBf/@lstrano-desk.jf.intel.com>
In-Reply-To: <aJ+hzc0Jc//MGBf/@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|CH3PR11MB8364:EE_
x-ms-office365-filtering-correlation-id: 9ca84c62-d91f-4fcf-7789-08dddc42af9a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?8pKIYn0ubL/foUSCbuywkHxg76M506m/1FZVtJYwmfDyKkmqvv85gn2Kh3J+?=
 =?us-ascii?Q?kLGl3RatO2O62MRwI9qE76b8Fi8QIPNnAxojI1s7f0kPNYi6Be821UcRWtex?=
 =?us-ascii?Q?hMp/s9PI557h4QuTBY4nuEIPYaQauh8G7SSSBvVlSH3qNrAogLVSpP2QW0jY?=
 =?us-ascii?Q?VivOY7QiZLzT5fbeKTIpstSEeeDuDp2F1PizCLsQ3LwPDTqKbP2Zn8aVQN6+?=
 =?us-ascii?Q?yRTnPBeVwCEaOupiuZmMNU+TqK4JcHLco6VoznJvBZEDOXn6MC+0rreSTT0X?=
 =?us-ascii?Q?rC4GhRIXtFDMH9fx8+hj9qnwbLsi1Kksnvug8YoKWi4WcVqm343vVBsfQqUH?=
 =?us-ascii?Q?PaHJFyIhjg2t6WTOWjNf8fHwD44XGxEzpXZ1k/NqO7v2+YZkZIu7YDnaYK16?=
 =?us-ascii?Q?dyQ2iONz+xpjN1DeTuW3sOdAeCjW1BRpuQasnbJQZnzRf5xPYo6TUGznz/+i?=
 =?us-ascii?Q?kytC3l7F+0pVHNI2FtFuFU14pQHkUAyfRudqBocAYrntD4qT77WBsNh+ZxpT?=
 =?us-ascii?Q?TcrDLkliT0ZXA3vozg+ra7Uk2tIrQiIqtQL48e1uWLRjp6KRxIxSjedUUI43?=
 =?us-ascii?Q?+4Lyxngzvg1xDcRlUejkcNxDOOKA74NLCsuy0vK5gEAGelOcua51JbYj3wcV?=
 =?us-ascii?Q?vpUBnuhPCp3lm+gNX7WJUtq11Z05W54B6MRgldR7CkoR4nvBb09E26NP/n+r?=
 =?us-ascii?Q?0W0wXnADmpzYLW3mrnQ2MAaOa/6+lU83SElYF3z/zA6sVLfSD698p3OD08w8?=
 =?us-ascii?Q?PoKnH9X8ojvBfsvCvTm6D8J5+/qhorSzKx2ahh2ADRXwKBxz/rDz77kQUBr2?=
 =?us-ascii?Q?KWMfZF3BmyU8H/zin3bJGpmJ5ZPPU/Fi7HqnBV8jMn1mzshsj+ER2ca18KV2?=
 =?us-ascii?Q?MyhtZOlbQI2p4OPZxdB2vcA6YZr/ZB9KQUJpr9IAQA+/6J55JzM1vFcc5bIa?=
 =?us-ascii?Q?5M6p9nA24M+WQ1QZnmLaOyw3akHuD9zhSQQqf0U1XLVWGt4vRk1p3z074T8U?=
 =?us-ascii?Q?9VL7s9VNKe4qFEmChiHWkgTAQHiz/m16ecx9d+b+GHRLkC2pi4ecs60w61De?=
 =?us-ascii?Q?5awL5QG4zH5Xx8VKUlLy3M0ihjpYSVMUXZz8zm8S6zZrtm1qsDD7G4oWP5tS?=
 =?us-ascii?Q?q3Cufq3t3mpOMFtBsLHSKo1OJulCKAFdS+TO/pO46XHUr5Ec25kySUcd1dHM?=
 =?us-ascii?Q?Hl6I1UTFt5ttq/VJcKYI7OCdD7OWHbjgupAve6cz0GRqzR3nsrBpWxnzy9zi?=
 =?us-ascii?Q?NHynyk0yQgBLbKR1KO4begDwAa28JvT+OULsbX9u97NWpV6pUwyb8Te79dYF?=
 =?us-ascii?Q?6p0fX0wNH5mDDQ/8k787PP/vsxhBL2c28S76RHQ84e8HUIAYEkMvLeLdPKGA?=
 =?us-ascii?Q?UF1ibb/1k6fB1pP8DUGUg/IVzfE8ZxAzAeoMxPC2Ze+O1f72zjLF0VoEgRid?=
 =?us-ascii?Q?DKj+lzgRzfQ4xdYfjjIwZbm/lI+eLdeFhQtffvdK8ywzmVHOG4qUaw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QN6D5C19yvRdhrZ1JVYCPIiiHcEV2uIeLmLpUTGmqZVdcvT64nZJeEnsQjb0?=
 =?us-ascii?Q?cvW2VB26F/rw7PUAugX31rkSzxzZJsR3I6958JoS54bmMZ0ILAHge7rYsPo/?=
 =?us-ascii?Q?Htmh2t6DTgODulspcjGffj1L11v7vIY4+W9+09hdkFqXaoj70y3bTQBOLx3E?=
 =?us-ascii?Q?zPMFHBb7j7Or14Ochtu8F4TkL1oGPimHjj11dVYDsUbmxszN25BqDS9dWDMs?=
 =?us-ascii?Q?EC/xzWoeyDrPa8b7fLemqFiXVCIHpEirr7WxMbSMSoHPk036ANmyjMyHVV3r?=
 =?us-ascii?Q?HyGpjOv3qMAXUgDsq3qTGHNP3RFYELc5jU6zA9n9vqLsOKiTm0wff6Q4hYti?=
 =?us-ascii?Q?9AcuoqgECb5c1R7rOZ69tHqguyiHUGdqWDGzLGQci6avaTeWfltcD9Z6hDCe?=
 =?us-ascii?Q?g+hYI82UaWYLuIAzqKNvi5AlA+IDaJ36pN/mJpaaOKn5FDzWzr7kVN94EWOD?=
 =?us-ascii?Q?r31iz3w1E7IInwrzoaZSJiAM2/Sg0U6Ng+t1A2mcCxXiQp2oyZByPXV91uUO?=
 =?us-ascii?Q?uxk/nSjpUGt/gNV+2qBhCsx4xqEnU9BHgt3IlH4mIYFYgh3GLFj5QVRDzuCj?=
 =?us-ascii?Q?/sNlBI1qYmEV9nrkJjdMbxukahWupnr0lUQeQFxcYqoy/ulayifQML+DYDu2?=
 =?us-ascii?Q?apvIGdfpHOPe/8xq9JGqYNEUITaax/9HAqeEEqnjVQNvog2VPab5MssBnhj4?=
 =?us-ascii?Q?C5tq2b8nw5SekCqXpav57XYjtHa1AJyFq5I7z5q5ixIkWZAUtiXuaYnhAgro?=
 =?us-ascii?Q?UD+JRdyk4afMntbNQhUPgTVNKJZ2DmlrnZmsTc1lqYIEixThT1vStMPgPTyA?=
 =?us-ascii?Q?ZAWoqM0gZF2rp8a46MWNk+9XO0Ct6rtoeZGUj2ZMefHqRB6GgTMj3qWvtslE?=
 =?us-ascii?Q?0uWAEUiXYmu4QgYdN6xnjZGMmwsTxzJR5G5LJwrqL50FCbJTjKTYK7m++fpU?=
 =?us-ascii?Q?0pOej8Gkzn+HG6S70xTGTEeu0bEdszZ/a+Nk8jzKoMPpgl23h6fG/vLBofFp?=
 =?us-ascii?Q?c1NhoBoVyfuaze2XNuEjPmrz5bZBdX0ok3GEcnTPKxAPZSLhMIassRePdg9m?=
 =?us-ascii?Q?bqQ3n0hRsdVxoot8EX7Ac7fudu+vTkXmtQXGEfutrcNJq6Q2W9Vj8FwBTEy5?=
 =?us-ascii?Q?aYoCnfKfKZ07lgodNZVhkniiFBMIvrrv4KMh8lWhNbi9MWUV5yDKio2BloYl?=
 =?us-ascii?Q?nxHK9I6Uwk7K1Fhxn2R7YZvdq96nlUAsROc7xUxJnlv2BLhsBx//a+uihqtv?=
 =?us-ascii?Q?HmJKy6f6USOOYWJx8GUdmveENE+NCmLT99pAY7XdtLvkdDbXqhZmXMkX2iTh?=
 =?us-ascii?Q?g5+Kzmw5kfpx1KUonyLH53VkqgNvZpnpefMkvlo2lmpkGkqL68R9MQem12rr?=
 =?us-ascii?Q?61cKxkQuZJP6W780aCgyeD2XwBpfq5sSgthLJY3NDrQLiKGX5u0axoIqAWbz?=
 =?us-ascii?Q?jkUpMqJL0FUvQAJeKwiOiEWqsSFqKPp3mQdaEPL0DQQiooUrzcuPnMdToN1O?=
 =?us-ascii?Q?BfGKqIQ65WE9THJ6CLTG+2mHA2dtnChMKTd4FbVOXD2fVh+1ZQRZOKN5LIA7?=
 =?us-ascii?Q?glPJAznJREeOpJXgCtdpOwACakNY8ZRozbO39O8g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca84c62-d91f-4fcf-7789-08dddc42af9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 21:28:32.8166 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZbsXr2zBQcveZk+rPT9ODNiGPAWVWLpNejgC30tgYr+QmfDKWVy+QqLl2mUnhE3RzSQAbpupVl6WI6niT7GKlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8364
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

> On Fri, Aug 15, 2025 at 03:03:33PM -0600, Yang, Fei wrote:
>>> On Tue, Aug 12, 2025 at 11:28:46AM -0700, fei.yang@intel.com wrote:
>>>> From: Fei Yang <fei.yang@intel.com>
>>>>
>>>> Quote BSpec, MI_STORE_DATA_IMM "simply initiates the write
>>>> operation with command execution proceeding normally. Although the
>>>> write operation is guaranteed to complete eventually, there is no
>>>> mechanism to synchronize command execution with the completion (or
>>>> even
>>>> initiation) of these operations."
>>>
>>> Can we not just use update emit_store_imm_ppgtt_posted to use
>>> MI_FLUSH_IMM + a PPGTT address? I think we can get rid of prior flush a=
dded in 3ad7d18c5dad7?
>>>
>>> According to bspec 45725 for MI_FLUSH_IMM:
>>>
>>> 'Usage note: After this command is completed with a Store DWord
>>> enabled, CPU access to graphics memory willbe coherent (assuming the
>>> Render Cache flush is not inhibited).'
>>
>> We already have a MI_FLUSH_DW in between the MI_STORE_DATA_IMM and
>> MI_USER_INTERRUPT (See __emit_job_gen12_simple), but the issue was
>> still reporduced.
>>
>
> That is not what I'm suggesting. I'm suggesting convert emit_store_imm_pp=
gtt_posted
> to use a MI_FLUSH_DW intruction rather than MI_STORE_DATA_IMM.

Oh, sorry I misunderstood. Yes, that looks promising. At least the BSpec
says CPU access would be coherent, but I'm not sure what would happen
in the case where the write is triggering a page fault. Will give it a
shot and send a different patch if it works.

-Fei

> Matt
>
>> static int emit_flush_imm_ggtt(u32 addr, u32 value, u32 flags, u32
>> *dw, int i) {
>>         dw[i++] =3D MI_FLUSH_DW | MI_FLUSH_DW_OP_STOREDW | MI_FLUSH_IMM_=
DW |
>>                   flags;
>>         dw[i++] =3D addr | MI_FLUSH_DW_USE_GTT;
>>         dw[i++] =3D 0;
>>         dw[i++] =3D value;
>>
>>         return i;
>> }
>>
>>> Matt
>>>
>>>> The KMD currently emit MI_STORE_DATA_IMM and MI_USER_INTERRUPT
>>>> consecutively to implement user fence. However, according to the
>>>> BSpec, the data write operation is not guaranteed to be completed
>>>> when triggering the interrupt, that would cause the
>>>> xe_wait_user_fence_ioctl to wait until the full user specified
>>>> timeout is reached before checking the fence value again. Great
>>>> performance degradation has been observed in IGT xe_exec_fault_mode
>>>> test cases due to this unnecessary wait. The worst case is that if
>>>> user set the timeout to MAX_INT32, the wait could end up being a hang =
until some other random program triggers a user interrupt to wake it up.
>>>> A semaphore wait is added right after the data write to avoid the
>>>> unexpected wait.
>>>>
>>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/instructions/xe_mi_commands.h | 11 +++++++++++
>>>>  drivers/gpu/drm/xe/xe_ring_ops.c                 | 14 ++++++++++++++
>>>>  2 files changed, 25 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>>> b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>>> index c47b290e0e9f..1c9e7b35c665 100644
>>>> --- a/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>>> +++ b/drivers/gpu/drm/xe/instructions/xe_mi_commands.h
>>>> @@ -34,6 +34,17 @@
>>>>  #define MI_FORCE_WAKEUP                     __MI_INSTR(0x1D)
>>>>  #define MI_MATH(n)                  (__MI_INSTR(0x1A) | XE_INSTR_NUM_=
DW((n) + 1))
>>>>
>>>> +#define MI_SEMAPHORE_WAIT           (__MI_INSTR(0x1c) | XE_INSTR_NUM_=
DW(5))
>>>> +#define   MI_SEMAPHORE_REGISTER_POLL        REG_BIT(16)
>>>> +#define   MI_SEMAPHORE_POLL         REG_BIT(15)
>>>> +#define   MI_SEMAPHORE_COMP_OP              GENMASK(14, 12)
>>>> +#define   MI_SEMAPHORE_SAD_GT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_=
OP, 0)
>>>> +#define   MI_SEMAPHORE_SAD_GTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_=
OP, 1)
>>>> +#define   MI_SEMAPHORE_SAD_LT_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_=
OP, 2)
>>>> +#define   MI_SEMAPHORE_SAD_LTE_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_=
OP, 3)
>>>> +#define   MI_SEMAPHORE_SAD_EQ_SDD   REG_FIELD_PREP(MI_SEMAPHORE_COMP_=
OP, 4)
>>>> +#define   MI_SEMAPHORE_SAD_NEQ_SDD  REG_FIELD_PREP(MI_SEMAPHORE_COMP_=
OP, 5)
>>>> +
>>>>  #define MI_STORE_DATA_IMM           __MI_INSTR(0x20)
>>>>  #define   MI_SDI_GGTT                       REG_BIT(22)
>>>>  #define   MI_SDI_LEN_DW                     GENMASK(9, 0)
>>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> index 5f15360d14bf..189e764e3914 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>>> @@ -169,6 +169,20 @@ static int emit_store_imm_ppgtt_posted(u64 addr, =
u64 value,
>>>>      dw[i++] =3D upper_32_bits(addr);
>>>>      dw[i++] =3D lower_32_bits(value);
>>>>      dw[i++] =3D upper_32_bits(value);
>>>> +    dw[i++] =3D MI_SEMAPHORE_WAIT |
>>>> +              MI_SEMAPHORE_POLL |
>>>> +              MI_SEMAPHORE_SAD_EQ_SDD;
>>>> +    dw[i++] =3D lower_32_bits(value);
>>>> +    dw[i++] =3D lower_32_bits(addr);
>>>> +    dw[i++] =3D upper_32_bits(addr);
>>>> +    dw[i++] =3D 0;
>>>> +    dw[i++] =3D MI_SEMAPHORE_WAIT |
>>>> +              MI_SEMAPHORE_POLL |
>>>> +              MI_SEMAPHORE_SAD_EQ_SDD;
>>>> +    dw[i++] =3D upper_32_bits(value);
>>>> +    dw[i++] =3D lower_32_bits(addr + 4);
>>>> +    dw[i++] =3D upper_32_bits(addr);
>>>> +    dw[i++] =3D 0;
>>>>
>>>>      return i;
>>>>  }
>>>> --
>>>> 2.43.0
>>>>
