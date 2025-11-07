Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A477CCCFA05
	for <intel-xe@archiver.kernel.org>; Fri,  7 Nov 2025 11:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6561D10EA94;
	Fri,  7 Nov 2025 11:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPyMpKeM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995FF10EA94
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Nov 2025 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762515792; x=1794051792;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mTShaG06RSRqE5RXbQMI1pgJ0LdZLlBs+JeKs4LyTUc=;
 b=DPyMpKeMYo6N5wys1tbrOXbZjkbgn6OzBQu6SXNqTDLCKbW62LdgpOWd
 DM5CRm/vI+D1FCliToWZdMWkZ+pMKdKo5mjYnDKDb4sUffjzVJFDDcqtF
 CIb5ZJakHw+wAtYughhqmSVaV37G80mUQZ/wF+V/3Uv5Atw9s3mz+zVt3
 ijAmkIOSVhOwOcx3CyUmFkmLP4GF7uDM5CPTELzv6Hm+5HkNDQzTJnFOw
 B7/d+aI0x6ING4Dz/x4njUZCCCeLU4Z8jOzwyFvS/NRZnl28e8m/0ZbJM
 3yJYex5WBgEJPPsuz/ZUJrP2xm0e/S9uK9z4tbqWWWvEf3mKjj/aWu38p Q==;
X-CSE-ConnectionGUID: cUjzNUC7QBqrie9Fy3SiVA==
X-CSE-MsgGUID: zeOAxkp+RNSupp3h247TTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64572957"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64572957"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:43:12 -0800
X-CSE-ConnectionGUID: Biu8Zai0Tg2KYjfHnuNUZw==
X-CSE-MsgGUID: VWPss6SCT3aMGSamt+uBFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; d="scan'208";a="187745557"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2025 03:43:11 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:43:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 7 Nov 2025 03:43:11 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 7 Nov 2025 03:43:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GukDiQKhGbe2zx+beLGROFQxlxGzXvj+iQQ/DQtWwHVa5SguWSlJq9/wuwiH+ZJmnF/XAmD/bUdT4370EXCja2GK7NewaeCen+Zy5iHOnSAp3ld19lDbnpja3h8fQNdCp/Qjq9Fe5SHBTzoXWUkKxF5ZIMWGa+dANnflKrjB7kBvMDWc2I42tKVEkIJll4vITXpXRyghPOs4zk9Vnwe4u6QKXsV7m91qvkfqHQvgPNBbVfkhvlwVNowaiWziGypDEmVp/Hmcc/neylTdn9mB9mJSg+pZDnbJCXqUDfSujwdqkyUyB86Qneb5BOB7W+YEGoWOqRUx6b9yNu5QgWCBlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqu6ACDCekXMGJFxro4n7G1AbNmj3Go2ZmRTBojC788=;
 b=YxW3KGJ43qVG+GZtYqKv6PFvNA/J/lCq9otpyGHgPVHMOgxcwD2IcckbRWjDXA1s161/D0d06ZVwMEmnrABGdOPalSvQqO24jBVaLD6Wra9kHs3f7jWyyRh6c3a/rVgrMnXgQoheWJ2QuUNWe1D4zc4t9Qye88VTAzluizCJAq8/7YgO16WxDFASuUvzqP3zgXcCLi0ZGp1SK4GhLAQcoofLj7Q4ldNF/0y7+yD/F0xw+mw0ak/otbJdP0GrN9r82KebF6U1V3dPT6IuIjbQqoPeBrAfRik49/S/jsC9M5YHd6gdcdNYx3Abmqb3ZREQNn1Mv601ezC/ZKpsqrqJDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Fri, 7 Nov
 2025 11:43:03 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 11:43:03 +0000
Date: Fri, 7 Nov 2025 05:43:00 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <riana.tauro@intel.com>, <matthew.brost@intel.com>,
 <michal.wajdeczko@intel.com>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v2] drm/xe/pcode: Convert unsupported commands to debug
 level
Message-ID: <qaa6wtbzouftstdptqdidqlmb2gw4n2c24bztuzi5ifp5rpocj@barjesb5hzm5>
References: <20251107055746.110055-1-raag.jadav@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20251107055746.110055-1-raag.jadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: fa67dcc8-9478-482d-eeb0-08de1df2cf29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Fs4xOKrUS8f8HNVsrDqCrlGD0TOMtQk8Thf4hIzKiFVvNCxide/cri1DXkga?=
 =?us-ascii?Q?XhXhTysxKqmP5ls7GF9Zd7b8f93R78cKJEsVrzYSyLaHt6hf2zOiIQIXBJAT?=
 =?us-ascii?Q?vh+PhD2C6n5uv+3uj0rx+Nm2DeOHV9nY4tPlrANSrBoHmilYz1lSzmZpRAq8?=
 =?us-ascii?Q?P15pjbZkqaQPJatetc0XEgsS9z7h1p+TQalzQqDfssW8W+9iXK8ljlWLfLlC?=
 =?us-ascii?Q?FTZGfMUIwZRGtC2ARdB8Q1kZj+EYHQxLfsQPrGm35nG8lDAjTLIYK1PolZKt?=
 =?us-ascii?Q?wja7JXsYR3KFn4aWNbr4xRRqYDuDd7ozz9lOaL68Pud5ZIo3b2LS4JRARj/F?=
 =?us-ascii?Q?0uadnR27IB+5uW33KTIbnZBnjy4zpXlqEgZTsjQh5QgxVa8jrHm7B/7OjV4j?=
 =?us-ascii?Q?MhTks/nNQjCRFf+ng/soRd5k8zwM/eHZEXXJZVEf7gWPA4y9/yfj82L6zuPp?=
 =?us-ascii?Q?JuO7o7++mjDuvHY0+3qiNew9JHJZbe9E7Yr6cekAn/HCi2XBGvbxfWxaoeMV?=
 =?us-ascii?Q?OBaPZouL2gfLJQ3jQA++dn+ft2++LHhuM0fEBPFkbHhpzoGhhAs44p+GkhFB?=
 =?us-ascii?Q?sYAewe3dx+9yTWtVNsABR8Iv/uX8L4sBFNQBXDb0jTIO5821X04d1qhMW8vE?=
 =?us-ascii?Q?atR63X0Ev0HnYUnrtLVXF5XHE1/IsmCmYowttIzsZp6yauoNCTeSoDqLAAsG?=
 =?us-ascii?Q?mgl6yDNA6+aYCPJ4CctfvcOSrJLmWXLfaL6OZACgFV96NJA0WzBXqRBsOpdU?=
 =?us-ascii?Q?FTqkJ7q+RbgdD9Mm4aKMLtdT30Lbgq62/MnL3lCBBcLd8HKg1fJxVSuJCFGU?=
 =?us-ascii?Q?4pbWh7y28kmM1qswh3NrXvfmt3QlB58WWXGRlVcejbmiKYSCdbnuxBMxweq8?=
 =?us-ascii?Q?Thp5SGWDO10MxkHI6HRHsjlR+fO6GsIfQ0oYPf1nIDM0btSE7ZqY7LwEqqWR?=
 =?us-ascii?Q?m1ex/adGRos0rPX7RpDpu42M6gWYUO5wARFimcnaFgNLhOBhxFEd/CSK8wyc?=
 =?us-ascii?Q?AfVcyZ+nH2fx2YvLo0XS6xJVNg4HM5l2Z9szEPlB48kndkqGeVUDRvA6Yem5?=
 =?us-ascii?Q?dk0IunCxdNC6YVRNu+lxzfsIIBSdxc7JGuwj7dpRpAHTxcklZGjS8kavXOrK?=
 =?us-ascii?Q?kC8+3POQxps6i2e3t6xUhbkGXdTjes6Y+hgVHdnrm05ViQ00A3XHqiyM2sv0?=
 =?us-ascii?Q?rcvlz/HzbnTDIPIRHMDLJxQ6hBT4ZSdVUDWCDGLoa5VQjzBf0QkDrz869ols?=
 =?us-ascii?Q?ojBj7Lo0EW8+0+lXJSJs6MuyzfrQa86Vb9LhCMmO4xaZ6jRlJnju3kAh7G+I?=
 =?us-ascii?Q?b9f/LDskEJ1RFpOBieluSt/nhCdwcLWAxejvZ1HHtIBscRXk6GmfIfxxUqFp?=
 =?us-ascii?Q?O9RoEisVIwYkc7RrNc0zL43Xrbfi9UWgy+4uawSeZ8M7hnp/9eSAleVjRgcg?=
 =?us-ascii?Q?pTt0nJgDgTLJ24Hd4VgHdqQxM418k7b6l2Pyfd3AcEG1q4lx+xbu5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cyY8MKRWSxxuyAxfCgPDbYMPZ2BA0jho0cmFOJhoAKKzcy8P3xL6ItI9pTDS?=
 =?us-ascii?Q?7Zzz5DO+bN4Kg08xjY8PvnfMULGasgpJVpiUB935QSGL9VKwMJxie85kY+CD?=
 =?us-ascii?Q?vm9J4OOPtQ0y9SJeHBSyx4f2dEOyLGd5vstEqLq14N/S6p199Crkjvv4zDU4?=
 =?us-ascii?Q?F8OvvcAb260throJHKR+xs9N7wN92Gma0cK3GudVW+sFIwOGKA5sn04l9YwR?=
 =?us-ascii?Q?sPrqtrex6rnwN3HCN05uoziQf9JcwxcqXDbTiCHHNyTyJhRMdi+v4kGRa39I?=
 =?us-ascii?Q?eN2SEAcdEQNIrm4Gdk1gU0ZIcHs7Rm2eevEU/8+KSLK2yNj2lgMTPCwanYmr?=
 =?us-ascii?Q?Yk8wpUToJY0cRoV/7wwSbIf9pWnRm+hB/iEu6Nt+I/WaJegO04ZGYUTLEZTS?=
 =?us-ascii?Q?r9gZCiPp36+ajABZg1UxgKlQo0dMcUb+8EIwZ1A5RslpT0RUov2haX0va94z?=
 =?us-ascii?Q?DEwX8A+ZAx6vo5ySCMyERUhKTdp1eXhkd1dSsRmxE3sr/a6stmqy/qr7NWuT?=
 =?us-ascii?Q?03emo06WZAwN1ozOfddH9/st3IyQYf7m9hKM+XRtQ+3vQLuVzgF2l6dhkqh3?=
 =?us-ascii?Q?rnjfPAduO40GwNqB69+A2DPbWdG3w/qZMhY3UR6zEkwlkbaoK4WdZ0lpUtu+?=
 =?us-ascii?Q?eOiIT5S1nD2D8bO3y6wFRjgW99Mqo6qySbm1wy1WqeuT3h4uuIMl/1tQC+Un?=
 =?us-ascii?Q?qlY594wFl4ZiPqMMl1W8k/Uj33olx7uQFcsuyF6jdMUHWc/FNFadtHj6zmFq?=
 =?us-ascii?Q?IetQB/xfYDGdAgwfIA6UW+BUDch3qPyqaFQAE/r5iPFhNgnIRdqj5Om2Ym1a?=
 =?us-ascii?Q?A0aNirud9gAELaMkKKlmQgLkE9A141Jf2b11is0bOB9YikInpaNuxJTvDOkg?=
 =?us-ascii?Q?csd1SJrA+vuINg3Ti0TbqxLUdfr/HBlgUP7UYI11p2yQctTKhjQmbQVO9LHB?=
 =?us-ascii?Q?YL2/tGXXcM28Q67b3luZn8FOrawjx2+L5ATEFRe8oxozx2tXriC9+iDzSrZT?=
 =?us-ascii?Q?t+NRQrkUa3aovgd71f6gMepYd0gpNZ5Qrb5nrpX6GVbmgrplA2G0/BTMyt2Z?=
 =?us-ascii?Q?nVHppZ+G8pN0pabINQ092ad8l6XFKv4wLPOFPHasg6FT1+i3L1cc4C3IGe0z?=
 =?us-ascii?Q?qF0hxc/HzNh8wczICndqmeMQp/pXplqKs4Ftdnee4OvJJo+SuyGa2EWBXB1r?=
 =?us-ascii?Q?mBEHEWuFTsDvF0aYXmlx6MIlXohdK/6namGkSfbQpA3c4UoiNOjCcD1Rnln+?=
 =?us-ascii?Q?MbZtiEZ7XnEjtDDHD2GsKnoqWztFu3ks13kmYws+zE36FGpoOCTnPhrir6iD?=
 =?us-ascii?Q?zW6/F9Y5fk4ys9GM0opVHyybZavkiKr4n2U9YwnU4YKk/J1SFWZDn4sAcj4K?=
 =?us-ascii?Q?SHUwHfi4AW6mqqtOZHfaCHkYzatCH0wqfuZRt4GRsSli2bMFKWfsdBHN+DZl?=
 =?us-ascii?Q?3KliS5eYP6/h57ZE+FANRqrzzcrY9x4QjaVyY++WAltUR0WjX3J5m2j1rbkT?=
 =?us-ascii?Q?liOC0aSUSUhemlccvD7dxRbe3TVkj4cCyXg4HpTanOYDuTie3l51atbehL5L?=
 =?us-ascii?Q?P+OKhn4u2qGnJyEjz/+riTR1avjcaBwFs9F8373z5gV5C9tj6l7ZRsn63wOe?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa67dcc8-9478-482d-eeb0-08de1df2cf29
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 11:43:03.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuF0X8uku8zf5lECLfd3dMabzsC2TeEn7rji+hADKVSMD+rOweHMztRC/oi0xOhQqzllmjXu7jHWtvFiXVo6Bv0G32JJQiIdQclCPTU34Po=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

On Fri, Nov 07, 2025 at 11:26:11AM +0530, Raag Jadav wrote:
>If the device is running older pcode firmware, it is possible that newer
>mailbox commands are not supported by it. The respective functionality
>isn't useful in that case but neither is error logging, since it doesn't
>particularly signify anything wrong with pcode firmware or device as a
>whole. This is useful in cases where we want to make a decision on driver
>functionality based on pcode return codes and a bit simpler design choice
>compared to other solutions like checking pcode firmware version, which
>comes with additional complexity of binding every single command to a
>specific version and deems pcode commands useless in case driver fails to
>obtain it for reasons unrelated to pcode.
>
>v2: Split unsupported command cases
>
>Signed-off-by: Raag Jadav <raag.jadav@intel.com>
>---
>
>Following up on earlier attempt[1] now that we really have things blowing
>up. Another alternative would be to further split boottime and runtime cases
>but that again is its own design discussion.
>
>[1] https://lore.kernel.org/intel-xe/Z8n1Uy1hqAkYxeFE@black.fi.intel.com/
>
> drivers/gpu/drm/xe/xe_pcode.c | 9 +++++++--
> 1 file changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index 6a7ddb9005f9..d9a0bd7ea36c 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -47,8 +47,13 @@ static int pcode_mailbox_status(struct xe_tile *tile)
>
> 	err = xe_mmio_read32(&tile->mmio, PCODE_MAILBOX) & PCODE_ERROR_MASK;
> 	if (err) {
>-		drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s", err,
>-			err_decode[err].str ?: "Unknown");
>+		if (err == -ENXIO)

err is u32 and it does & PCODE_ERROR_MASK when reading. It will never be
negative. Did you mean to check the mapped value from err_decode?

	if (err_decode[err].errno == -ENXIO)

or just using the non-mapped values here would be ok too.

Btw, that array with 256 entries seems wasteful for the number of
entries we actually fill. 

Lucas De Marchi

>+			drm_dbg(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>+				err, err_decode[err].str ?: "Unknown");
>+		else
>+			drm_err(&tile_to_xe(tile)->drm, "PCODE Mailbox failed: %d %s",
>+				err, err_decode[err].str ?: "Unknown");
>+
> 		return err_decode[err].errno ?: -EPROTO;
> 	}
>
>-- 
>2.43.0
>
