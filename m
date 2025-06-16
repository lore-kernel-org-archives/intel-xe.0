Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62331C71155
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 15:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3C810E3E1;
	Mon, 16 Jun 2025 15:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYqRgrur";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4779110E3D0
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 15:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750088375; x=1781624375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=RlbD6a6YjU6MrnbSmOPANLXC0aK1f6iEyJ/gNRuddug=;
 b=RYqRgrurJ1uSNvDmqAiJiooBPZhPfjVk5tTIG0WXY6ak1QAkHR9NZELy
 jUsfkerFwrZT0Z7vrFdi5Hk8r4uO11QPC1sz01shUUe6OsYLwPw1yAv99
 /NTY+laO7JAKk1U8Y6vnX3kI8PBqmPsrWwyRQz3f4XGmsuuHarx+nW0JK
 64KGDuEkLyajLzSi4rc/8DSTf3DsWyN5Q4LratM6xScmv7xn8bF0ht/Ub
 Kw6huKXojzKxbnaikmpiI+O5L72Gqy5Dr2CfxRXo0yfOiuDVH9nJgc4Bj
 KcTafJdBhjwNTxD480ijlgqnOBtoHIBIkU9XTZpowxfsMSNRbuyirM2GT A==;
X-CSE-ConnectionGUID: 1K751gCQQcmbbgJ1s/ERJg==
X-CSE-MsgGUID: gysbDNb1R/+x10kxiNEn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="69814894"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="69814894"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:39:31 -0700
X-CSE-ConnectionGUID: mlpB2iIGSWGjorKPFXcpkQ==
X-CSE-MsgGUID: 932b/syFSGWbH25xZT+T5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148412562"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 08:38:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 08:38:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 08:38:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 08:38:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgYVDCLy8C6hX2TwaZXs5MaISGp78bkeQkWrTJrpFmN9c9yPXoGnm1IENcAj4WOa1cB7qJSZb1KMbpwpfwcxrRinuLdTMEAFZSk5JeHU8lFoJJ1snlvd2kvC2BvjxjC/ThxlCClLFS0WyTiv3HkaaAmWHbirdTVr+ABVUe3gBMM/qwLu5M8pFGACBBjAoJgnNh3cDYPq1x6ZV/6wxQ5+RBMMLi3wJz3sewcVTA0xC68MZyMc+z+1GmDagrLNns1zt/6Xsn5tgWUZ+p6dQ70OQOuKlE7pxFIVzvMmRP/+KdFnXq4kWcBmRA0IwENYUzpi4X1eby4RYO5PnqQDNFnvTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teCNrP81bPNTpn8wi3p3qCI9ouLVGaKP8cGfPhJo8PM=;
 b=lxtB3YemiQ/Ee4CxtO87ulh2g9I7xCdOQE0VqALRIzj6N4wxrBdIq6dpHy7ZxDkjtZkJ2EE+pJIW5wR5+JDaKji7qnHZcIlGvDdsi3Of4UbPPfri4iQ093AP9fKYoTDYPdxGwhLpyCGyzb4E32dlv/mljMVB9Rkw5gz+ksXafxWnD1tfX3a+nx03CisOS4Dg3NpGDEGjycZwKCmVxSTF2pryX2bs7ahPjXMtJ1BnHvc38nVVYmykOfxUqLlb/raUYGH95O4zidaNym1BoR76Lvw+jh228QmGkdknXu0iwt8awoToE2FapcU3t8XiTk9FyMva3Egj7rUqueJmT4bM5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ1PR11MB6156.namprd11.prod.outlook.com (2603:10b6:a03:45d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 15:38:37 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 15:38:37 +0000
Date: Mon, 16 Jun 2025 10:38:34 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 "Stuart Summers" <stuart.summers@intel.com>
Subject: Re: [PATCH v4 3/3] drm/xe/bmg: Update Wa_22019338487
Message-ID: <mgbewtrfxkkqsejrylhjse4mr4eizcaipxiyl2vs4f4rhz3ium@dzsp52dzoy5r>
References: <20250615-wa-22019338487-v4-0-704830697cbc@intel.com>
 <20250615-wa-22019338487-v4-3-704830697cbc@intel.com>
 <aFAsPdQ8EsSdNUu0@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aFAsPdQ8EsSdNUu0@intel.com>
X-ClientProxiedBy: CH5P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ1PR11MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3d87ff-772f-45f8-dfb2-08ddacebdca0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QZjgFDlTHewNvrSIK+QeJ8RoGdm138qGO8DUfroLQGUu7xzszy16zleb0BUD?=
 =?us-ascii?Q?R87OuGdIg8SFf7mengCAUQPc/7oIbXRrlV4e0+fEo5CiXW6NCfF3moFpbhw4?=
 =?us-ascii?Q?cfs62R6rzVgqFaKkrtKn4Pov27PGZBB6ROMvQxx7msIPHNX5I4rHA8nxMKfe?=
 =?us-ascii?Q?+n5Tl54kYNA9PKm1+xHv79bFlWzz9u5tUVhF6Dv2BfBKMSA0NXET7M9xH4W4?=
 =?us-ascii?Q?4v76VV0aOO08fbAmfpyDumyCwCsIIvbrcX2vdTMhIpxtWIZG/SiBp2XOsi3Y?=
 =?us-ascii?Q?CWQEtbmCxw2U5/7hV8//Qj93UAzh5iz0dX4xJH57NtuVYKDiWOK5NjrxjHzO?=
 =?us-ascii?Q?NEoOiTAqnJYEMiytyMCSPYg2DWe4yEU9ugDTDr0hTbC02kXgiyz6nTQ8MaZm?=
 =?us-ascii?Q?3p4Lu/eCt8PeU6u3dy4KhUaPIr+YoLThzafQVz7uGSVOb/nEHFzA8/eGFtxH?=
 =?us-ascii?Q?rFgvMRIfst/1JuzUWHPvtexeddQeDaEbMJLyUeJlHAioGsdhn/W6OwL2Nbn8?=
 =?us-ascii?Q?/3yBzGSQSU0fSad17iL3ed+Ns1vYg06d2Ek2prh+LiyUX6NuDAIIECJJ7OYd?=
 =?us-ascii?Q?g4eo/II16yExRKlWqw3TYwvpthFba12iBYVRlT04/bs6ojRneRszukVoCuZd?=
 =?us-ascii?Q?WULjHso0SaxaEJMXjG1WtbKxv5lzK8gQNKdHtcuwpUenWQ4VMH7xfy0XzBfm?=
 =?us-ascii?Q?XSlGxVRu4r9Lm0DbeIZeXTbLhvUkwrPVzvbDBPzuyN/SL3z8tEasBnqOl9Iw?=
 =?us-ascii?Q?k4lO2IMP9gpdSNfCSrz0+bUuexNLyu11ogcsOpT1tk87QD+JgYSQke1TpfML?=
 =?us-ascii?Q?tgkfD2m/SpmOowsdXC2V3D/3RZ6ovBa0sTX8+kdfHe47N4+nwdyqWhx/fhCk?=
 =?us-ascii?Q?jXC290hjJH+2qDyMlTTQydan8XMkD8xL3iAMiMN4cHtSKuzeuWhzlJU/g/oQ?=
 =?us-ascii?Q?n/HfnjADvdzS99jjZotY/YBIGqLuATq9zEBNP83g7PvnA8a0WhHeQ4WinxFN?=
 =?us-ascii?Q?9GeCq1yVrWsTHWIJfFQU1EIrUbBc200zlAnV/LoPdRbDakequtumzu5HVGXu?=
 =?us-ascii?Q?Ju5TvY9kWfSswrv4/WhhlA8gFxNf6NewUADbgnmM4pH4RmhwYmyS2cnCozV2?=
 =?us-ascii?Q?UE/G8pzD/0We9g0MlhlEQSupn6deFtySUGHdNgB9GYu/m2HVVKQrHA0A4ll6?=
 =?us-ascii?Q?aI31EM2zhuNvL3MbJSmjRYppzoetzWDfW2dbSWgSvA9Fkd9/SHIW/CYJ6tno?=
 =?us-ascii?Q?BtRvCjo2WueHsDDqb1vpgriIars8lGQQ98WAMoLoyuYhShVq0CtZSvWY6cDv?=
 =?us-ascii?Q?9c8dGOvy74WGgxd0xQCoYm00Yhv1f2CWiZ5DuHe1YZA5hruxWlriKwDfFAmk?=
 =?us-ascii?Q?I9l/GqnY3VHm1yDJRJLXQUo3HfCpbR0OHVpJsVZ7YyAynsc4bNeKx7D34aEa?=
 =?us-ascii?Q?SLVp+QSwP4k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wJPxb/dfCKp2Dl0vesmtc7T8PizWODe+VcoSfMjRiPgK77Foy9xK8pOeVpbw?=
 =?us-ascii?Q?MukLSpwk2CSb7wg2dSCDUMMzB/JVq5nWXWODPvKkURwV1Y9LoTIQTMsotIJ4?=
 =?us-ascii?Q?xQbHjcfKYwvspnnOoOPpevgRvaqws2E6LTFNlYuoeyfDB+XGAWpYjCciYLi3?=
 =?us-ascii?Q?2X74Hrc+iu6580zr57rMJUPiSZcCL2Ao80V4mMASEwv7bL0YNsfuiPxql09/?=
 =?us-ascii?Q?MkAK3glcspAI/66nAXtgofoQXxtI5uu0Col54xCDpJ390uKDhk5urwyRaSTF?=
 =?us-ascii?Q?Cu2CA2rCa62crTkkH1/6hZRPdE3HeQcNpsJsEdIdUnAiwnn+DFfEDMd7V/nN?=
 =?us-ascii?Q?F8YDv6hLvYhkoKUMDDTe/PRdKaYqrnMUNCQ0/TTIk1x3rnUYXnEm99ssSyps?=
 =?us-ascii?Q?dLR5SFC1IhUWFODflHeIUmABCvvTSYKK8+Io0WXUl7gPgizGND5e/htpLYrb?=
 =?us-ascii?Q?tU9rRuDH8VxMrteWHpLtZZIyyVN76X4jgqKK/uWW6KGwv3W3F15oRWCHy4tv?=
 =?us-ascii?Q?BDdWi2/iAJm7wYpsHGh25xXVRNegjOKvYKOqS17M0Et4S/ZJH/m9UZyNiPIU?=
 =?us-ascii?Q?rOXTz0AmGDOQPHh1tHycFEobOKLr0IaYDmyo8lRsB/KsFT97Brs/cA4pj7x3?=
 =?us-ascii?Q?HeSxrBOiG2nVMKGzt7OVv9jqN+kWtTI/cMme+FoBVsiOJCC7L25UU49XKJqS?=
 =?us-ascii?Q?/02esz0W8wcvCug16V5eBx/AJ8KraUPf3+3GRWaibV1+6oGnT+wM5EBHqftW?=
 =?us-ascii?Q?rKrWzDStw5iYgqjvd+34YSXI7HyNFnB8kfDMZzTEE+fTGxbRP76GG77naejc?=
 =?us-ascii?Q?PBk0i1QeNnlZf1rOY5HwgVZB89/FUwHgPiVpKpWX+1p53G69xNh0cGVSCbmd?=
 =?us-ascii?Q?QGyU17QWN0QMpJOrl5/XeQnXzRPbhYyvMEIpEIn/HC+Rv6v6lETGBU5a8zR3?=
 =?us-ascii?Q?qzaUMOs2RLa6j8XI62EixgvQLLUs3turHTpZr6B5Al3sRA4zFxYjjjx1fZ68?=
 =?us-ascii?Q?pLfwDrG92Pe3FzHk74DBx9f2T+stFIc0918AejvtalWkeDveJzdZNhx4Xa+M?=
 =?us-ascii?Q?0VvyvDLPJK0bL0YuuxQXtfVhUqzYSnnmBGQ67wMPsh8iJpEGJm+j/Wnwp15g?=
 =?us-ascii?Q?kUjWGB6V5G2sF1zyxfoiAJvYNzUJ7+3BrhYJ9lvACbC2R0syxkegxZidOaUX?=
 =?us-ascii?Q?FMxbg0j1bjLtSo8c0UGd1Ezqajt/6PzkK+yeGTdJSD61dRliUb0KT9DMJI1Y?=
 =?us-ascii?Q?BoG92VDJ5ncdvOw8FP85TpoAtX1oJMitz4ZrfMg0ZR1II+/lZIk7Az0x0eFu?=
 =?us-ascii?Q?tTvvg83SEYoM9SfytB2C25aaI5kDuwDmhNicEGVgUV9vPPMWVbmDl/dh0VGH?=
 =?us-ascii?Q?zBSf+cx7Dq8KAMQNHfHLrhX+Ch2qN2IuEG+/N4kj9XTEnYiS6QPMs6VJZ/NH?=
 =?us-ascii?Q?7JcKF4xhxZuRduKudWeG0B/zR8VkUobeI4n+xtyLHCtMNVFPN3y/UC6M4XEF?=
 =?us-ascii?Q?/WTvGMNCu5VIlgCtvI9b848TMno46dRkZRzn0/UFZfZn0N/2REKG03pXdbyk?=
 =?us-ascii?Q?K/PQN+VNV4GtYXYx/qe4BSpyO4Yca/vQYuj4IWyquM/z+VPQMBVXVRz9BqRe?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3d87ff-772f-45f8-dfb2-08ddacebdca0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 15:38:37.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5RaqfU+tBqYJtroOfvJls4TfI2z3kUCjCqMh1AwUUK/VPuCL1ubGwEBi1iEJxFOnePubviMEnqqJJ5AuOIDQLPHkoB1k/0TOwhjA5vuXqs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6156
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

On Mon, Jun 16, 2025 at 10:37:49AM -0400, Rodrigo Vivi wrote:
>On Sun, Jun 15, 2025 at 11:17:36PM -0700, Lucas De Marchi wrote:
>> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>> Limit GT max frequency to 2600Mhz during the L2 flush. Also, ensure
>> GT actual frequency is limited to that value before performing the
>> cache flush.
>>
>> v2: Use generic names, ensure user set max frequency requests wait
>> for flush to complete (Rodrigo)
>> v3:
>>  - User requests wait via wait_var_event_timeout (Lucas)
>>  - Close races on flush + user requests (Lucas)
>>  - Fix xe_guc_pc_remove_flush_freq_limit() being called on last gt
>>    rather than root gt (Lucas)
>>
>> Fixes: aaa08078e725 ("drm/xe/bmg: Apply Wa_22019338487")
>> Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c       |  13 +++-
>>  drivers/gpu/drm/xe/xe_guc_pc.c       | 125 +++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_guc_pc.h       |   2 +
>>  drivers/gpu/drm/xe/xe_guc_pc_types.h |   2 +
>>  4 files changed, 139 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 7e87344943cdf..6ff373ad0a965 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -40,6 +40,7 @@
>>  #include "xe_gt_printk.h"
>>  #include "xe_gt_sriov_vf.h"
>>  #include "xe_guc.h"
>> +#include "xe_guc_pc.h"
>>  #include "xe_hw_engine_group.h"
>>  #include "xe_hwmon.h"
>>  #include "xe_irq.h"
>> @@ -1001,16 +1002,19 @@ void xe_device_wmb(struct xe_device *xe)
>>   */
>>  void xe_device_td_flush(struct xe_device *xe)
>>  {
>> -	struct xe_gt *gt;
>> +	struct xe_gt *gt, *root_gt;
>>  	unsigned int fw_ref;
>>  	u8 id;
>>
>>  	if (!IS_DGFX(xe) || GRAPHICS_VER(xe) < 20)
>>  		return;
>>
>> -	if (XE_WA(xe_root_mmio_gt(xe), 16023588340)) {
>> +	root_gt = xe_root_mmio_gt(xe);
>> +	xe_guc_pc_apply_flush_freq_limit(&root_gt->uc.guc.pc);
>> +
>> +	if (XE_WA(root_gt, 16023588340)) {
>>  		xe_device_l2_flush(xe);
>> -		return;
>> +		goto done;
>>  	}
>>
>>  	for_each_gt(gt, xe, id) {
>> @@ -1035,6 +1039,9 @@ void xe_device_td_flush(struct xe_device *xe)
>>
>>  		xe_force_wake_put(gt_to_fw(gt), fw_ref);
>>  	}
>> +
>> +done:
>> +	xe_guc_pc_remove_flush_freq_limit(&root_gt->uc.guc.pc);
>>  }
>>
>>  void xe_device_l2_flush(struct xe_device *xe)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
>> index d449eb0e3e8af..eab932655b2fb 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
>> @@ -7,7 +7,9 @@
>>
>>  #include <linux/cleanup.h>
>>  #include <linux/delay.h>
>> +#include <linux/jiffies.h>
>>  #include <linux/ktime.h>
>> +#include <linux/wait_bit.h>
>>
>>  #include <drm/drm_managed.h>
>>  #include <drm/drm_print.h>
>> @@ -53,9 +55,11 @@
>>  #define LNL_MERT_FREQ_CAP	800
>>  #define BMG_MERT_FREQ_CAP	2133
>>  #define BMG_MIN_FREQ		1200
>> +#define BMG_MERT_FLUSH_FREQ_CAP	2600
>>
>>  #define SLPC_RESET_TIMEOUT_MS 5 /* roughly 5ms, but no need for precision */
>>  #define SLPC_RESET_EXTENDED_TIMEOUT_MS 1000 /* To be used only at pc_start */
>> +#define SLPC_ACT_FREQ_TIMEOUT_MS 100
>>
>>  /**
>>   * DOC: GuC Power Conservation (PC)
>> @@ -143,6 +147,36 @@ static int wait_for_pc_state(struct xe_guc_pc *pc,
>>  	return -ETIMEDOUT;
>>  }
>>
>> +static int wait_for_flush_complete(struct xe_guc_pc *pc)
>> +{
>> +	const unsigned long timeout = msecs_to_jiffies(30);
>> +
>> +	if (!wait_var_event_timeout(&pc->flush_freq_limit,
>> +				    !atomic_read(&pc->flush_freq_limit),
>> +				    timeout))
>> +		return -ETIMEDOUT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int wait_for_act_freq_limit(struct xe_guc_pc *pc, u32 freq)
>
>for a moment, the name of this function got me confused. I thought
>it was going to wait for the *exact* act freq, and then it would be
>risky because we can never know what PCODE will decide on extra
>throttles.
>
>But I don't have a suggestion for a better naming and reading the
>rest of the code showed it is doing things correctly.
>
>There's a risk though... if for some reason PCODE decides to keep
>freq high for a longer time... but likely unreal for this platform.
>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

thanks... I will take a look in CI later today and think if we have
another better name or error handling.

While we are here, a couple improvements I noticed while doing the
changes; see below.

>
>> +{
>> +	int timeout_us = SLPC_ACT_FREQ_TIMEOUT_MS * USEC_PER_MSEC;
>> +	int slept, wait = 10;
>> +
>> +	for (slept = 0; slept < timeout_us;) {
>> +		if (xe_guc_pc_get_act_freq(pc) <= freq)
>> +			return 0;
>> +
>> +		usleep_range(wait, wait << 1);
>> +		slept += wait;
>> +		wait <<= 1;
>> +		if (slept + wait > timeout_us)
>> +			wait = timeout_us - slept;
>> +	}

1) wait functions

except from the call xe_guc_pc_get_act_freq(), this is a copy and paste
from the other wait function in this same file.
wait_for_flush_complete() was also a copy and paste and I moved it to
wait_var_event_timeout(), which is a better synchronization than what
this is doing.

All these functions to wait until a timeout are wrong: usleep_range()
will sleep for anything between the 2 values and we are simply using the
wait variable to decide on next sleep value. Worst case scenario, even
if unlikely, we will wait for log2(timeout_us) * timeout_us.

The xe_mmio_wait* get the wait checks right. I think we need another
function for the proper abstraction for that. Previously we decided
against because:

	a) this is the poorest synchronization method and it tends to be
	abused (see the preivous version of wait_for_flush_complete())
	b) adding such a thing in xe_helpers.h/xe_utils.h opens the
	door for things for doing other things there that should rather
	be using proper kernel infra
	c) previous attempts added that in xe_mmio or a new xe_utils.h
	and neither of them are good locations.

Proposal: xe_wait_for_cond() in xe_device.c. We should document when
it could be valid to use it: it's not a synchronization between 2
CPU threads but rather between GPU-FW-CPU; it doesn't fit the
xe_mmio_wait* because it needs to do things other than read and check
mmio value; and there's no other core kernel synchronization that can be
used. Then we migrate wait_for_act_freq_limit() and wait_for_pc_state()
to use it.

2) interaction with user requests

I kept the logic implemented on earlier versions, just changing how we
are waiting on it to complete. However, should userspace really wait?
Why not just update the stashed value that will be later flushed?
This way, if there are multitple requests they don't all keep waiting
and applying a random value depending on what thread was woken up first.
For example, with thread number also meaning the execution order:

freq_limit == xe_guc_pc_apply_flush_freq_limit()
set_max == xe_guc_pc_set_max_freq()

T0				t1	t2	t3	t4

xe_device_td_flush() {

	freq_limit
				set_max
					set_max
						set_max
							set_max
	freq_flush

Here all of t1, t2, t3, t4 are waiting on freq_flush from t0. The end
value will be whatever ordee threads are woken up later. I think that if
we change the implementation to simply set the stashed value, it will be
simpler (no need for wait) and better: the value is ultimately set in
freq_flush() and is always the last value.


thoughts?
Lucas De Marchi

>> +
>> +	return -ETIMEDOUT;
>> +}
>>  static int pc_action_reset(struct xe_guc_pc *pc)
>>  {
>>  	struct xe_guc_ct *ct = pc_to_ct(pc);
>> @@ -689,6 +723,11 @@ static int xe_guc_pc_set_max_freq_locked(struct xe_guc_pc *pc, u32 freq)
>>   */
>>  int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
>>  {
>> +	if (XE_WA(pc_to_gt(pc), 22019338487)) {
>> +		if (wait_for_flush_complete(pc) != 0)
>> +			return -EAGAIN;
>> +	}
>> +
>>  	guard(mutex)(&pc->freq_lock);
>>
>>  	return xe_guc_pc_set_max_freq_locked(pc, freq);
>> @@ -889,6 +928,92 @@ static int pc_adjust_requested_freq(struct xe_guc_pc *pc)
>>  	return ret;
>>  }
>>
>> +static bool needs_flush_freq_limit(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +
>> +	return  XE_WA(gt, 22019338487) &&
>> +		pc->rp0_freq > BMG_MERT_FLUSH_FREQ_CAP;
>> +}
>> +
>> +/**
>> + * xe_guc_pc_apply_flush_freq_limit() - Limit max GT freq during L2 flush
>> + * @pc: the xe_guc_pc object
>> + *
>> + * As per the WA, reduce max GT frequency during L2 cache flush
>> + */
>> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	u32 max_freq;
>> +	int ret;
>> +
>> +	if (!needs_flush_freq_limit(pc))
>> +		return;
>> +
>> +	guard(mutex)(&pc->freq_lock);
>> +
>> +	ret = xe_guc_pc_get_max_freq_locked(pc, &max_freq);
>> +	if (!ret && max_freq > BMG_MERT_FLUSH_FREQ_CAP) {
>> +		ret = pc_set_max_freq(pc, BMG_MERT_FLUSH_FREQ_CAP);
>> +		if (ret) {
>> +			xe_gt_err_once(gt, "Failed to cap max freq on flush to %u, %pe\n",
>> +				       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
>> +			return;
>> +		}
>> +
>> +		atomic_set(&pc->flush_freq_limit, 1);
>> +
>> +		/*
>> +		 * If user has previously changed max freq, stash that value to
>> +		 * restore later, otherwise use the current max. New user
>> +		 * requests wait on flush.
>> +		 */
>> +		if (pc->user_requested_max != 0)
>> +			pc->stashed_max_freq = pc->user_requested_max;
>> +		else
>> +			pc->stashed_max_freq = max_freq;
>> +	}
>> +
>> +	/*
>> +	 * Wait for actual freq to go below the flush cap: even if the previous
>> +	 * max was below cap, the current one might still be above it
>> +	 */
>> +	ret = wait_for_act_freq_limit(pc, BMG_MERT_FLUSH_FREQ_CAP);
>> +	if (ret)
>> +		xe_gt_err_once(gt, "Actual freq did not reduce to %u, %pe\n",
>> +			       BMG_MERT_FLUSH_FREQ_CAP, ERR_PTR(ret));
>> +}
>> +
>> +/**
>> + * xe_guc_pc_remove_flush_freq_limit() - Remove max GT freq limit after L2 flush completes.
>> + * @pc: the xe_guc_pc object
>> + *
>> + * Retrieve the previous GT max frequency value.
>> + */
>> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
>> +{
>> +	struct xe_gt *gt = pc_to_gt(pc);
>> +	int ret = 0;
>> +
>> +	if (!needs_flush_freq_limit(pc))
>> +		return;
>> +
>> +	if (!atomic_read(&pc->flush_freq_limit))
>> +		return;
>> +
>> +	mutex_lock(&pc->freq_lock);
>> +
>> +	ret = pc_set_max_freq(&gt->uc.guc.pc, pc->stashed_max_freq);
>> +	if (ret)
>> +		xe_gt_err_once(gt, "Failed to restore max freq %u:%d",
>> +			       pc->stashed_max_freq, ret);
>> +
>> +	atomic_set(&pc->flush_freq_limit, 0);
>> +	mutex_unlock(&pc->freq_lock);
>> +	wake_up_var(&pc->flush_freq_limit);
>> +}
>> +
>>  static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>>  {
>>  	int ret;
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
>> index 0a2664d5c8114..52ecdd5ddbff2 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
>> @@ -38,5 +38,7 @@ u64 xe_guc_pc_mc6_residency(struct xe_guc_pc *pc);
>>  void xe_guc_pc_init_early(struct xe_guc_pc *pc);
>>  int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc);
>>  void xe_guc_pc_raise_unslice(struct xe_guc_pc *pc);
>> +void xe_guc_pc_apply_flush_freq_limit(struct xe_guc_pc *pc);
>> +void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc);
>>
>>  #endif /* _XE_GUC_PC_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> index 2978ac9a249b5..c02053948a579 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
>> @@ -15,6 +15,8 @@
>>  struct xe_guc_pc {
>>  	/** @bo: GGTT buffer object that is shared with GuC PC */
>>  	struct xe_bo *bo;
>> +	/** @flush_freq_limit: 1 when max freq changes are limited by driver */
>> +	atomic_t flush_freq_limit;
>>  	/** @rp0_freq: HW RP0 frequency - The Maximum one */
>>  	u32 rp0_freq;
>>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
>>
>> --
>> 2.49.0
>>
