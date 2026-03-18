Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6DB10775E0
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 16:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9854610E179;
	Wed, 18 Mar 2026 16:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MOgL6EPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F3610E047
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 16:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773850070; x=1805386070;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=xTe8yf4MEGhp++A1alm5AmlkXQQOO9Lxu3CBXeX/ZZ0=;
 b=MOgL6EPsrZS196I2UobgyAbuBpoyzJo1MvIIReDpo1gzgzba/B7kZp5M
 8RPgyhxvV8nJHbrw9nCULPSdzJjE5Adl0867pTL6BvPrO4cquAs2t+2r6
 ugZfGEeMecj8cwoh2Yb1JorE9D1c46eHlS/5rwFzB3kGSSqr5GEFIUL4j
 nVmQATyqqjSpO6Wp/wIjK7Ig9noSXDUCNAW+vof6bqa/5DxUwo4/BEtDt
 u0AVbaBUPd+UJot/+s1ZmwQ8C977/Eby0tliMHOl5v8zc7Q8eVlnzlnh2
 E2giTcy53g9Vm/Uh17CznUNR6qVSjRXyaOVu3ehMd9uDhQGmyZA6XHzeH g==;
X-CSE-ConnectionGUID: NxH1fK/DRzG/tn5g3+W2DA==
X-CSE-MsgGUID: 1f7VG4zIRBCDYbFK6lhEcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75030588"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="75030588"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:07:50 -0700
X-CSE-ConnectionGUID: YqbF6uSfSmymeB/bbnuGGA==
X-CSE-MsgGUID: fmpbc1UBQii5ygz5CI4u1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="219698751"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:07:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:07:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 09:07:49 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.9) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 09:07:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KHR9/Kx40a5e3ku5BY6GG5SfVRiEnHBR2CCselBrRRkPM2AdEIYLu2PNRIpr+wJUBdReHJWd5ODBwThWPkbs8okmgA9Ko3jAvCOZrzkcYh+X0fLO8pG+BYwNi7p553WvfswwPP0JzBXwkmwZqBpHtiyem1uPFRDL/Ki3L3IXPai9iYiTSWXmDnb+cD6P/bNGY210hxsv5PqvMTOYFTIBeMM9v+sAVvZ4ZfBKjFkYo94zLmVl1KRB+pnV/jWJWUDq21uhbD5qoFxJ8Fe0Y/55saG1XU343f5qbtJRg2pz+W+xQc4u99AsvGDSrV3uuLB4g5RT1dMF0Fxs8NTV2KQfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8TG3WjwHqiM40gp2kgZwBBXZs75ulBXvKOo2Z6O2js=;
 b=HPsXbLJNLmWowbN1qEeB/LBdjtUKiYf5BkZZ+0vw5OFt9d6BYQs/dqBk/R3TvTL8kJXPMfcS2Rh2sIRbHq/cFJYWPueJI7Ie1bomJVDApugvz+gyVuhNqtgYUU6j6ME+zfFKCGZ2NyRT360AVeTHgO40uQ1TGwxOMg6qG69Iqtqm5PgAYNc3lfMtkvQ5UJN8YinVirLVJzislItmkUmiCZLBZUkW5Y4B5V2tG/ypz5BEbeTir+52fJZQ6uRy6EZUqLhQcMUMhzOt6U8Xas7PqTRTAOekT/Syg8cT1C+aZLFrep9+g/qmZtAg99qV1L04DP1KTwrgtvHKu8guQNX0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH7PR11MB8122.namprd11.prod.outlook.com (2603:10b6:510:235::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:07:40 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%3]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 16:07:40 +0000
Date: Wed, 18 Mar 2026 21:37:24 +0530
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [PATCH v9 1/6] drm/xe/sysctrl: Add System Controller types and
 device integration
Message-ID: <abrNvNqmsR8Ld1el@soc-5CG1426VCC.clients.intel.com>
References: <20260310182336.611041-8-anoop.c.vijay@intel.com>
 <20260310182336.611041-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310182336.611041-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH7PR11MB8122:EE_
X-MS-Office365-Filtering-Correlation-Id: 045b22a9-7442-4a38-7da6-08de85087aee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: R6HP4bw1kJ3d+jfocLV+vofJn7ijGwDeEQuxdIa8buVBpV8sEJsC6MRoCB42oKP+VmjXGxmviEYgGCIHGT5spU/VQnLXGKUYpqmghYhW31bgB6Qoex1QKO9mMzruLaoJDdFcYDM33AIqfDnU8XDf6GsDUKdTQazV/R1PCtadCD2N7hCmuzs0khs5gYLJy7PhVX9CgEn4DM1IDa7ecucvdZ6yMe3qqbKG8Dn3rdkuO1E3ODPAhZ67RxufDH8PSSvXSjUP4s1BsqsWdHuSeMIcr5JWB4qWqmq+TcId3gzXocqumjT915+OZgD8N/RSDYUD3ObfDMyANON15Bb3zXPJ9kCmPlOlDfiWlZ1MCBG7R1fYrd0V2N2yBfeu+R5kHAe8pHjZwe+oaLPPNBTxoRw68k7R+CevLBAC+gM0vXDRnVNzpNL2bJGJ/qbPWB23Utr7xoRWPNRdLaaXRCY5vu4JmrrTZwTWeS0OJ9erfPrCCO1S+wXjs5RfLNPDhLtRE7tsXhhLuxdXzX5VEwtl4T5Fae3vrt3ZEhZ1u0sLMV/cV6NxtN47zBhbxwL8HwA8V17Gh9Ma/f3KkSeGTv1E9V+Mt/+YawHhAxRwQeHqCHpZnReXHoZJnnDEBzXJnarc6YWmGdMeofSCBj/LcSvW+8tC5BTdDeKPO+MIHbJ2fJcFRilxbl13lJfDtjdJh9Q8y/0pNkWtf0ngD6dr+kJ4RHPOMezux66WazFwl7BwDCAX8mg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhaWVNJTXQwQlRTSXEwQnpzQXJFd3VMNEphWFNjajZGbXJ6Mys5SmZmQ0RD?=
 =?utf-8?B?cWZ4aGtONUQvRFZrZVhsV0dVbHB1eUlOUEozSUtWWk56NGM5ZlNpRjVIclMx?=
 =?utf-8?B?NTgrZUFoSEJNM01zUUFodEQ4bWxHczM3bDlYY2xYWjhtL0doNnF1Zm53Ylk5?=
 =?utf-8?B?MGxFSDBuWlB2c3haT2h6WFp2TndhY0U3cTlLNW1pWUlvMzFHNjEyem9uVHlL?=
 =?utf-8?B?VlkvbFNTMHhaZG50cGE4dUxmK1gvcW1ZRi90MXBONzR2RXd3eFdleUx5MTZi?=
 =?utf-8?B?TFNUVy9udXpHRExWVDYyZWVaazdRODRZa3dRQzV5N2FRL1lSSWhVZ1p2WVZl?=
 =?utf-8?B?TUx6SW5kNXhBbzdnVmFpOG9LZHlRdndZUTFBZTBaQk9OV3JhUGxsZWNiTzhw?=
 =?utf-8?B?cFlpWTE1WFhlbjlXTjVuOWV4SDV1ZVBlaDlKYk9NNS9ndVk2cjJFRGNiTVFn?=
 =?utf-8?B?ZmtDR3FCWHVLREJHT1JQSXNHTlJCU0pPMjVGUFV5V21UU3c4UzR3cUU1MkpP?=
 =?utf-8?B?VUdnQzZVUXpublhNY2pucUhBcEhqRHV6ZTZXUmJEbDBxcGc1dWxuZk1jTmRX?=
 =?utf-8?B?K1NMNWx4d3VmUDd3MUVCRW4rb0NLSVhMME5SMUJPRmdEMzFhT3JLanYrUmJ2?=
 =?utf-8?B?RVBVejE1ZW9McDA5OWRoTGRleXV3TldjdlYvWHpsN1pFSWxkY2VTQ2QxYzdu?=
 =?utf-8?B?aTBnbU8rczNrTTV2UHkvbnd2Q1pEbWlDeWJBT3VrL1ZsQk1NZVhndVkxTkRZ?=
 =?utf-8?B?T2toRmp4bUpkb3p3aU9BNFZkUURNd0JHem1XK2dHeERIQU1QTFNkUTRjbUZq?=
 =?utf-8?B?WmpxaE5nbitybTJmcDhQcHNOeTdIRG5iRENLQmVIaVBZYVVkVWd4elduZE9S?=
 =?utf-8?B?dG9xTEpQZTVna1FQTzd2UlVoeUl2bk1wOWdjK1JESksvRldJT1dQN1NENmdM?=
 =?utf-8?B?TmI2Qm0vU0V1NFdQSisrWnp6WVg4L3I0UTBhYVFONGJuY2dsZk5sbnorbGRv?=
 =?utf-8?B?SFhkZHhOaHZLQ2IrQzExS1ZuYUpJSlRjaVNFYUg0TW85SGdBNDFubzUvWmI2?=
 =?utf-8?B?ZWpYN1VJNWtMQlhNTDBaMlloS3dHNUZ4T0NZNEpneURXQWVvMjBtTjVuWEsw?=
 =?utf-8?B?MEZaS09QNXdLNzJuWW1KcmQ1WnhTb1g3aG9XTmt0WGt3WHhkS0tJVHczOG1N?=
 =?utf-8?B?eDlyaFhEc3Bhb1d3dE5vTzZmYzZYVFJjOC9jUXVXUWlNajNRSnpNSVRkS1Rw?=
 =?utf-8?B?NHh6dlZyNzRqRVpHM0E0eElYUk83NWdGMUNTNEV3OTIwM3VHVEhRb1krUzEw?=
 =?utf-8?B?RmNGeTR2ZEtnZVR6RWxJdU9FYjh4NXU0VHBBT2hkdTZCazlGYnZ6NFNTcUp6?=
 =?utf-8?B?UUF3dzgyYnZ4WURPRjhabllOdko0a25OTkxiQ1A0alJYd3NhTVhYcFM3aWxj?=
 =?utf-8?B?OG9mVVpHVGcwaTVaSHZsdmhqbk4wUkpnZC9XTVpOYlM3VkpBS05FZHdGeTFa?=
 =?utf-8?B?NDZRaEk3Nnl2cHBHNHJHdWZyMTA0Tm92QnRUcDhUYStWZ29CWjhMY0dqU2hZ?=
 =?utf-8?B?dGFvcFpoQW9nSGFLMG9pVGxUTzUwbDFCYXhWdW9URDA4VlZpZE52V28xcndB?=
 =?utf-8?B?Z2dFMFR5ZStXQ056OUVhWjY2V0JmNFUvUG9JY3pBdFhEeG1nNjlvdjJRVFRr?=
 =?utf-8?B?dk1HSytmbFIwRkJGMFYzenpVM1lBMCtnMGI0MkI1T0dUS2ZQTndLV3BpM1dP?=
 =?utf-8?B?S0JtbEhjNVpkZ3FpNGhaVEVCeEF3aW5MVjN2MlZmejhZczNMSlVvVEVUa2ox?=
 =?utf-8?B?Tzc2UHVnTVUvaGl4ZVJITW0zOERpWkpkS1NKVkxRM1ZLajZ5b2NNM05WWFBz?=
 =?utf-8?B?SWVSNk9lTk9FOElDUmd2UnRjY2RpaXJmaUR6VTVhUEMwRXFEQndSeXZIRzhx?=
 =?utf-8?B?NnpXblg2amY2REc0L1FTS2VJS041aVdVNkgvN2daMFl1VzQ5a3R5RjRYbTRR?=
 =?utf-8?B?WFlINE5vL2h5MVNsMCtWblJlbGdUVmt4cXNoT2ptZmhyTkhOZ3Y3OFR0d3Qw?=
 =?utf-8?B?VWIvK0RIbFh2dlIyZkFCSnNOcDF2L3h1c0M4bG0wSlE4V3lyandnV0JaaXNk?=
 =?utf-8?B?SWpHMGRISloyc0RvM2ZEUnZCT2FjdkV0clNOa2dia0hSWFdYbmZ4Rld4dERw?=
 =?utf-8?B?VVlNZlM4NXVjRlVXSHUzdFo4WjRWN0NsbEVhSkdEeXNHbTVhZzErODZmYzI4?=
 =?utf-8?B?dWQ2bEhSMG9LZjZyNDh1S1FwaUVYcC9NOVM5OFpoaHhmOFdZVFNhdXN5T2Fj?=
 =?utf-8?B?Nyt6cWd5TGFoNGRZWWxFdUt6KytxTm9PK0IvWE1jeSsvdE83Z05nYm5OSkZa?=
 =?utf-8?Q?UkFUwqisAfNrQY3wZBvX47eAKDMgcEqYad1/F?=
X-Exchange-RoutingPolicyChecked: AScNb5kTlTJN071BLqG7z69asaymsDyd7trqBJ3UxF4GnFYW8wN1xzz/kfZ+vXb0ueiqsHdCTBdpYpMZptAsSn/J3zOHJojSvSYwW+bAbx0tkrRUqqRMpSIy6LpPkycyeECwXrPgmRSLTD/7Sx+XUD4i/hizwKicssDV5F0Hb+U/W9MTyloVtPdmkRkSeqicC0YXQgRJPKfS1vqayuul8o5Pz91Hlt/dNGA8tdMXynN1p1BlyOLk+5eLkU0dT4150NDjo4mWYp6AOy3eoH/o/hDcOfaxV5urzEwj5cXS3uMXGoXBDzom2KlkQH+1nmhsCkyLMxWjaqN4fvnlGNvSHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 045b22a9-7442-4a38-7da6-08de85087aee
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:07:40.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CqtWkv1x14IxaADaGrfH+pHD/vyhW1Cl1haxpzNjtnarfVXu+tX4crT0zd8u4vwY/9I3gkuvsuY3iTP9zoo+CO8AjMiT4mOH47RxwC0J3dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8122
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

On Tue, Mar 10, 2026 at 11:23:20AM -0700, Anoop, Vijay wrote:
>From: Anoop Vijay <anoop.c.vijay@intel.com>
>
>Add foundational type definitions for System Controller (sysctrl)
>support and integrate them into xe_device structure. Also add a
> capability flag to device descriptor and runtime
>info.

To me, the below 2 paras look complete for this commit. The above para 
can be dropped.

>
>System Controller is a separate management entity responsible for
>certain platform-level control and coordination tasks in Intel Xe3p
>dGPU platforms. Driver communicates with it via a mailbox interface
>using SCHI (System Controller Host Interface) protocol for operations
>delegated to this controller.
>
>This commit introduces core data structures required for sysctrl
>support, including MMIO region, command mutex, and phase bit used
>by SCHI protocol.  flag explicitly records presence of

has_sysctrl flah explicitly ...

>sysctrl hardware on supported platforms.
>
>No functional changes. This is preparatory infrastructure for System
>Controller support.

This sentence can be dropped.

>
>Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>

The commit message needs cleanup. With that this is

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

>---
>v4: (Matt, Mike)
>- Add domain-specific MMIO accessor
>- Change phase_bit type from u32 to bool
>
>v6: (Matt)
>- Add mailbox protocol constants
>
>v8: (Matt, Michal)
>- Reordered patches for logical flow
>
>v9: (Matt)
>- Extended commit message to explain System Controller and purpose of
>  `has_sysctrl` flag
>---
> drivers/gpu/drm/xe/xe_device_types.h  |  6 +++++
> drivers/gpu/drm/xe/xe_pci_types.h     |  1 +
> drivers/gpu/drm/xe/xe_sysctrl_types.h | 32 +++++++++++++++++++++++++++
> 3 files changed, 39 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_types.h
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index 3e04e80e0815..2990c1e76687 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -27,6 +27,7 @@
> #include "xe_sriov_vf_ccs_types.h"
> #include "xe_step_types.h"
> #include "xe_survivability_mode_types.h"
>+#include "xe_sysctrl_types.h"
> #include "xe_tile_types.h"
> #include "xe_validation.h"
>
>@@ -206,6 +207,8 @@ struct xe_device {
> 		u8 has_soc_remapper_telem:1;
> 		/** @info.has_sriov: Supports SR-IOV */
> 		u8 has_sriov:1;
>+		/** @info.has_sysctrl: Supports System Controller */
>+		u8 has_sysctrl:1;
> 		/** @info.has_usm: Device has unified shared memory support */
> 		u8 has_usm:1;
> 		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>@@ -518,6 +521,9 @@ struct xe_device {
> 	/** @i2c: I2C host controller */
> 	struct xe_i2c *i2c;
>
>+	/** @sc: System Controller */
>+	struct xe_sysctrl sc;
>+
> 	/** @atomic_svm_timeslice_ms: Atomic SVM fault timeslice MS */
> 	u32 atomic_svm_timeslice_ms;
>
>diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>index 8eee4fb1c57c..08386c5eca27 100644
>--- a/drivers/gpu/drm/xe/xe_pci_types.h
>+++ b/drivers/gpu/drm/xe/xe_pci_types.h
>@@ -57,6 +57,7 @@ struct xe_device_desc {
> 	u8 has_soc_remapper_sysctrl:1;
> 	u8 has_soc_remapper_telem:1;
> 	u8 has_sriov:1;
>+	u8 has_sysctrl:1;
> 	u8 needs_scratch:1;
> 	u8 skip_guc_pc:1;
> 	u8 skip_mtcfg:1;
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>new file mode 100644
>index 000000000000..8217f6befe70
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
>@@ -0,0 +1,32 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2026 Intel Corporation
>+ */
>+
>+#ifndef _XE_SYSCTRL_TYPES_H_
>+#define _XE_SYSCTRL_TYPES_H_
>+
>+#include <linux/mutex.h>
>+#include <linux/types.h>
>+
>+struct xe_mmio;
>+
>+/**
>+ * struct xe_sysctrl - System Controller driver context
>+ *
>+ * This structure maintains the runtime state for System Controller
>+ * communication. All fields are initialized during xe_sysctrl_init()
>+ * and protected appropriately for concurrent access.
>+ */
>+struct xe_sysctrl {
>+	/** @mmio: MMIO region for system control registers */
>+	struct xe_mmio *mmio;
>+
>+	/** @cmd_lock: Mutex protecting mailbox command operations */
>+	struct mutex cmd_lock;
>+
>+	/** @phase_bit: Message boundary phase toggle bit (0 or 1) */
>+	bool phase_bit;
>+};
>+
>+#endif
>-- 
>2.43.0
>
